#include "seq/seq_e3.h"
#include "demo/DEMOPad.h"
#include "dolphin/gx/GXStruct.h"
#include "driver/animdrv.h"
#include "driver/camdrv.h"
#include "driver/fadedrv.h"
#include "driver/seqdrv.h"
#include "driver/swdrv.h"
#include "event.h"
#include "mario/mario.h"
#include "mario/mario_pouch.h"
#include "mario/mariost.h"
#include "pmario_sound.h"
#include "system.h"
#include <string.h>

extern double tan(double arg);
extern OSTime none_key;

typedef struct seq_e3_entry {
    s32 id; // 0x0
    f32 x;  // 0x4
    f32 y;  // 0x8
} seq_e3_entry;

//.bss
static seq_e3_work work;

//.sdata
static seq_e3_work* wp = &work;
seq_e3_entry e3_tbl[3] = {
    { 23, -140.0f, 100.0f },
    { 35, 140.0f, 100.0f },
    { 96, 0.0f, -100.0f },
};

// Forward Declarations
void e3Disp(CameraId cameraId, void* param);
void e3DispOffscreen(void*, void*);

void alarm_handler(OSAlarm* alarm, OSContext* context) {
    gp->flags |= 0x2000;
}

void seq_e3Init(SequenceWork* seq) {
    wp->handle = fileAllocf(4, "%s/monthry.tpl", getMarioStDvdRoot());
    wp->field_4 = 0;
    wp->field_8 = 0;
    wp->scenario = 0;
    wp->field_64 = 270.0f;
    OSCreateAlarm(&wp->alarm);
    OSSetAlarm(&wp->alarm, OSSecondsToTicks(600), alarm_handler);
    wp->initTime = OSGetTime();
    gp->flags &= ~2;
    gp->flags |= 0x20;
    gp->flags |= 0x1000;
    gp->flags &= ~0x2000;
    fadeEntry(FADE_IN_BLACK, 200, (GXColor){ 0x00, 0x00, 0x00, 0xFF });
    fadeReset(1);
    psndStopAllFadeOut();
    psndBGMOn(0x200, "BGM_FILE_MENU1");
    seq->state = 0;
    animGroupBaseAsync("OFF_d_meku", 0, NULL);
}

void seq_e3Exit(SequenceWork* seq) {
    fileFree(wp->handle);
    psndStopAllFadeOut();
}

void seq_e3Main(SequenceWork* seq) {
    CameraEntry* camera;

    camera = camGetPtr(CAMERA_3D);
    camera->cameraAt = (Vec){ 0.0f, 0.0f, 0.0f };
    camera->cameraPos = (Vec){ 0.0f, 0.0f, 0.5f * (240.0f / (f32)tan(0.21816612780094147)) };

    switch (seq->state) {
        case 0:
            seq->state++;
            break;

        case 1:
            if (fadeIsFinish() && keyGetButtonTrg(0) & (PAD_BUTTON_START | PAD_BUTTON_A)) {
                psndSFXOn("SFX_PRESS_START1");
                fadeEntry(MARIO_HEAD_FADE_IN, 0, (GXColor){ 0x00, 0x00, 0x00, 0xFF });
                fadeSetOffscreenCallback(e3DispOffscreen, wp);
                wp->field_8 = 1;
                seq->state++;
            }
            break;

        case 2:
            if (fadeIsFinish()) {
                fadeEntry(MARIO_HEAD_FADE_OUT, 0, (GXColor){ 0x00, 0x00, 0x00, 0xFF });
                wp->curX = wp->dstX = e3_tbl[wp->scenario].x;
                wp->curY = wp->dstY = e3_tbl[wp->scenario].y;
                seq->state++;
            }
            break;

        case 3:
            if (fadeIsFinish()) {
                seq->state++;
            }
            break;

        case 4: {
            s32 prev = wp->scenario;
            s32 stickX = keyGetStickX(0);
            s32 stickY = keyGetStickY(0);
            switch (wp->scenario) {
                case 0:
                    if (keyGetDirTrg(0) & DEMO_STICK_RIGHT) {
                        wp->scenario = 1;
                    } else if (keyGetDirTrg(0) & DEMO_STICK_DOWN) {
                        wp->scenario = 2;
                    }
                    break;

                case 1:
                    if (keyGetDirTrg(0) & DEMO_STICK_LEFT) {
                        wp->scenario = 0;
                    } else if (keyGetDirTrg(0) & DEMO_STICK_DOWN) {
                        wp->scenario = 2;
                    }
                    break;

                case 2:
                    if (stickY > 20) {
                        wp->scenario = 0;
                        if (stickX > 0) {
                            wp->scenario = 1;
                        }
                    }
                    break;
            }

            if (prev != wp->scenario) {
                psndSFXOn((void*)5);
            } else if (keyGetButtonTrg(0) & PAD_BUTTON_B || OSTicksToSeconds(OSGetTime() - none_key) > 120) {
                psndSFXOn((char*)19);
                fadeEntry(MARIO_HEAD_FADE_IN, 0, (GXColor){ 0x00, 0x00, 0x00, 0xFF });
                fadeSetOffscreenCallback(e3DispOffscreen, seq);
                wp->field_8 = 0;
                seq->state++;
            } else if (keyGetButtonTrg(0) & PAD_BUTTON_A) {
                psndSFXOn((char*)18);
                seq->state = 100;
            }
        } break;

        case 5:
            if (fadeIsFinish()) {
                fadeEntry(MARIO_HEAD_FADE_OUT, 0, (GXColor){ 0x00, 0x00, 0x00, 0xFF });
                seq->state = 0;
            }
            break;

        case 100:
            fadeEntry(FADE_OUT_BLACK, 200, (GXColor){ 0x00, 0x00, 0x00, 0xFF });
            seq->state++;
            break;

        case 101:
            if (fadeIsFinish()) {
                seq->state++;
            }
            break;

        case 102: {
            s32 prevId;
            BOOL matched;
            s32 targetId;
            s32 i;
            s32 stageId;
            s32 idx;
            s32 foundIdx;
            EventData* found;

            prevId = 0;
            matched = FALSE;
            targetId = e3_tbl[wp->scenario].id;
            swInit();

            for (stageId = 0; stageId < eventStgNum(); stageId++) {
                EventStage* stage = eventStgDtPtr(stageId);
                EventData* data = stage->data;
                for (idx = 0; idx < stage->count; idx++, data++) {
                    if (targetId == data->id) {
                        matched = TRUE;
                        break;
                    }
                    prevId = data->id;
                }
                if (matched) {
                    break;
                }
            }
            swByteSet(0, prevId);
            foundIdx = idx;

            for (i = 0; i < stageId; i++) {
                EventStage* stage = eventStgDtPtr(i);
                for (idx = 0; idx < stage->count; idx++) {
                    if (stage->data[idx].initEvent) {
                        stage->data[idx].initEvent();
                    }
                }
            }

            found = eventStgDtPtr(stageId)->data;
            {
				s32 i;
                for (i = 0; i <= foundIdx; i++) {
                    if (found[i].initEvent) {
                        found[i].initEvent();
                    }
                }
            }

            switch (found[foundIdx].motionType) {
                case 0:
                    marioChgStayMotion();
                    break;

                case 1:
                    marioChgShipMotion();
                    break;
            }

            marioPartyKill();

            {
                MarioWork* mario = marioGetPtr();
                mario->prevPartyMemberId[0] = 0;
                mario->prevPartyMemberId[1] = 0;
            }

            if (found[foundIdx].partners[0]) {
                marioPartyEntry(found[foundIdx].partners[0]);
            }
            if (found[foundIdx].partners[1]) {
                marioPartyEntry(found[foundIdx].partners[1]);
            }

            if (wp->scenario == 0) {
                seqSetSeq(SEQ_MAP_CHANGE, "hei_00", "dokan_2");
            } else {
                seqSetSeq(SEQ_MAP_CHANGE, found[foundIdx].mapName, found[foundIdx].beroName);
            }

            memset(pouchGetPtr()->heldItems, 0, sizeof(s16) * MAX_HELD_ITEMS);
            memset(pouchGetPtr()->storedItems, 0, sizeof(s16) * MAX_STORED_ITEMS);
            memset(pouchGetPtr()->badges, 0, sizeof(s16) * MAX_BADGES);
            memset(pouchGetPtr()->equippedBadges, 0, sizeof(s16) * MAX_BADGES);
            pouchSetMaxHP(20);
            pouchSetHP(20);
            pouchSetMaxFP(20);
            pouchSetFP(20);

            for (i = 0; i < 8; i++) {
                pouchGetPtr()->partyData[i].currentHP = 20;
                pouchGetPtr()->partyData[i].HPLevel = 1;
            }

            for (i = 0; i < 2; i++) {
                pouchGetItem(ITEM_THUNDER_RAGE);
                pouchGetItem(ITEM_SHOOTING_STAR);
                pouchGetItem(ITEM_FIRE_FLOWER);
                pouchGetItem(ITEM_POW_BLOCK);
            }

            pouchGetPtr()->availableBP = 20;
            pouchGetPtr()->maximumBP = 20;
            pouchGetItem(ITEM_POWER_BOUNCE);
            pouchGetItem(ITEM_POWER_SMASH);
            pouchEquipBadgeID(ITEM_POWER_BOUNCE);
            pouchEquipBadgeID(ITEM_POWER_SMASH);
            pouchReviseMarioParam();
            pouchRevisePartyParam();
            statusWinForceUpdate();
        } break;
    }

    {
        wp->dstX = e3_tbl[wp->scenario].x;
        wp->dstY = e3_tbl[wp->scenario].y;
        wp->curX += 0.25f * (wp->dstX - wp->curX);
        wp->curY += 0.25f * (wp->dstY - wp->curY);
    }
    dispEntry(CAMERA_3D, 0, e3Disp, seq, 0.0f);
}

void e3Disp(CameraId cameraId, void* param) {
}

void e3DispOffscreen(void* param, void* unused) {
}
