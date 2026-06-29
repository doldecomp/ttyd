#include "seq/seq_e3.h"
#include "demo/DEMOPad.h"
#include "dolphin/gx/GXEnum.h"
#include "dolphin/gx/GXStruct.h"
#include "dolphin/gx/GXTransform.h"
#include "dolphin/gx/GXVert.h"
#include "driver/animdrv.h"
#include "driver/camdrv.h"
#include "driver/fadedrv.h"
#include "driver/offscreendrv.h"
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
extern double sin(double arg);
extern OSTime none_key;

// TODO: move all this into other TUs
typedef enum winTexMode {
    MODE_5 = 5,
    MODE_6 = 6,
    MODE_7 = 7,
    MODE_8 = 8,
    MODE_11 = 11,
} winTexMode;

void winTexSet(winTexMode mode, Vec pos, Vec scale, GXColor color);
void windowDispGX_Waku_col(s32 r3, GXColor r4, f32 f1, f32 f2, f32 f3, f32 f4, f32 f5);

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
char* anim_tbl[] = { "b_mario", "PKR_W_1", "PKR_S_1", "PKR_A_2A", "PNK_W_1", "PNK_S_1",
                     "PNK_O_1", "c_windy", "PWD_W_1", "PWD_S_1",  "PWD_A_7" };

// Forward Declarations
void e3Disp(CameraId cameraId, void* param);
void e3DispOffscreen(CameraId cameraId, void* param);
void pressStartGX(s32 alpha, f32 x, f32 y);

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
    OSSetAlarm(&wp->alarm, (OSTime)OS_TIMER_CLOCK * 600, alarm_handler);
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
    s32 prevId;
    BOOL matched;
    s32 targetId;
    s32 prev;
    s32 stickX;
    s32 stickY;
    s32 i;
    s32 stageId;
    s32 idx;
    s32 foundIdx;
    EventData* found;

    camera = camGetPtr(CAMERA_3D);
    camera->cameraAt = (Vec){ 0.0f, 0.0f, 0.0f };
    camera->cameraPos = (Vec){ 0.0f, 0.0f, (240.0f / (f32)tan(0.21816612780094147)) / 2 };

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
            prev = wp->scenario;
            stickX = keyGetStickX(0);
            stickY = keyGetStickY(0);
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
        wp->curX += (wp->dstX - wp->curX) / 4;
        wp->curY += (wp->dstY - wp->curY) / 4;
    }
    dispEntry(CAMERA_3D, 0.0f, 0, e3Disp, seq);
}

void e3Disp(CameraId cameraId, void* param) {
    CameraEntry* camera = camGetPtr(CAMERA_2D);
    Mtx mtx;
    Mtx mtxScale;
    f32 projBackup[GX_PROJECTION_SZ];
    f32 viewportBackup[GX_VIEWPORT_SZ];
    CameraEntry camBackup;
    char* keys[3];
    s32 active;
    s32 alpha;
    s32 i;
    s32 px, py;
    s32 row, col;
    s32 inset, pass, step;
    f32 t, dx, dy;
    s32 mode;

    active = wp->field_4;
    if (cameraId == CAMERA_OFFSCREEN2) {
        active = 1 - wp->field_4;
    }

    // Backup camera and GX params so we can use them in calculating all this
    camBackup = *camGetPtr(cameraId);
    *camGetPtr(cameraId) = *camera;

    GXGetProjectionv(projBackup);
    GXGetViewportv(viewportBackup);
    GXSetProjection(camera->projection, camera->projType);
    GXSetViewport(camera->viewport[0], camera->viewport[1], camera->viewport[2], camera->viewport[3],
                  camera->viewport[4], camera->viewport[5]);

    if (active == 0) {
        // 'Press Start' overlay with alpha pulsing
        alpha = (s32)((f32)sin((f64)((f32)gp->retraceCount / 30.0f)) * 459.0f);
        if (alpha < 0) {
            alpha = 0;
        }
        if (alpha > 255) {
            alpha = 255;
        }

        winTexInit(*wp->handle->data);
        winTexSet(MODE_11, (Vec){ 0.0f, 0.0f, 0.0f }, (Vec){ 1.0f, 1.0f, 1.0f }, (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
        pressStartGX(alpha, 0.0f, -110.0f);
    } else {
        // Tiled background fill (40 x 32 quads)
        winTexInit(*wp->handle->data);
        for (row = 0, py = -304; row < 40; row++, py += 16) {
            for (col = 0, px = 0; col < 32; col++, px += 16) {
                winTexSet(5, (Vec){ (f32)py, (f32)(240 - px), 0.0f }, (Vec){ 1.0f, 1.0f, 1.0f },
                          (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
            }
        }

        for (i = 0; i < 3; i++) {
            winTexInit(*wp->handle->data);

            if (i == wp->scenario) {
                // Shadow Box
                winTexSet(i + (u32)8, (Vec){ 10.0f + e3_tbl[i].x, e3_tbl[i].y - 10.0f, 0.0f },
                          (Vec){ 0.35f, 0.35f, 0.35f }, (GXColor){ 0x00, 0x00, 0x00, 0x40 });
                // Content Box
                winTexSet(i + 8, (Vec){ e3_tbl[i].x, e3_tbl[i].y, 0.0f }, (Vec){ 0.35f, 0.35f, 0.35f },
                          (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
            } else {
                winTexSet(i + 8, (Vec){ 10.0f + e3_tbl[i].x, e3_tbl[i].y - 10.0f, 0.0f }, (Vec){ 0.35f, 0.35f, 0.35f },
                          (GXColor){ 0x80, 0x80, 0x80, 0xFF });
            }

            {
                char* keys[3] = { "menu_monosiri_hei", "menu_monosiri_gon", "menu_monosiri_win" };
                step = (i == wp->scenario) ? 0 : 10;

                windowDispGX_Waku_col(0, (GXColor){ 0x4A, 0x56, 0xB5, 0xFF }, (((f32)step + e3_tbl[i].x) - 100.0f),
                                      ((e3_tbl[i].y - (f32)step) - 60.0f), 200.0f, 40.0f, 20.0f);

                // Centered Label
                FontDrawStart();
                FontDrawColor(&(GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
                msgSearch(keys[i]);
                MTXTrans(mtx, ((f32)step + e3_tbl[i].x) - 0.7f * (f32)(s32)((FontGetMessageWidth() >> 1) & 0x7FFF),
                         (((e3_tbl[i].y - (f32)step) - 60.0f) - 8.0f), 0.0f);
                MTXScale(mtxScale, 0.7f, 1.0f, 1.0f);
                MTXConcat(mtx, mtxScale, mtx);
                FontDrawStringMtx(mtx, msgSearch(keys[i]));
            }
        }

        // Two passes of four mirrored window corners (shadow and content)
        winTexInit(*wp->handle->data);
        for (pass = 1, inset = 5; pass >= 0; pass--, inset -= 5) {
            // Top-Left
            winTexSet(((gp->retraceCount >> 4) & 1) ? MODE_6 : MODE_7,
                      (Vec){ (110.0f + wp->curX) + (f32)inset, (90.0f + wp->curY) - (f32)inset, 0.0f },
                      (Vec){ 1.0f, 1.0f, 1.0f },
                      (pass != 0) ? (GXColor){ 0x00, 0x00, 0x00, 0x40 } : (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
            // Top-Right
            winTexSet(((gp->retraceCount >> 4) & 1) ? MODE_6 : MODE_7,
                      (Vec){ (wp->curX - 110.0f) + (f32)inset, (90.0f + wp->curY) - (f32)inset, 0.0f },
                      (Vec){ -1.0f, 1.0f, 1.0f },
                      (pass != 0) ? (GXColor){ 0x00, 0x00, 0x00, 0x40 } : (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
            // Bottom-Left
            winTexSet(((gp->retraceCount >> 4) & 1) ? MODE_6 : MODE_7,
                      (Vec){ (110.0f + wp->curX) + (f32)inset, (wp->curY - 90.0f) - (f32)inset, 0.0f },
                      (Vec){ 1.0f, -1.0f, 1.0f },
                      (pass != 0) ? (GXColor){ 0x00, 0x00, 0x00, 0x40 } : (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
            // Bottom-Right
            winTexSet(((gp->retraceCount >> 4) & 1) ? MODE_6 : MODE_7,
                      (Vec){ (wp->curX - 110.0f) + (f32)inset, (wp->curY - 90.0f) - (f32)inset, 0.0f },
                      (Vec){ -1.0f, -1.0f, 1.0f },
                      (pass != 0) ? (GXColor){ 0x00, 0x00, 0x00, 0x40 } : (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
        }
    }

    // Restore all the GX and camera data we backed up
    *camGetPtr(cameraId) = camBackup;
    GXSetProjectionv(projBackup);
    GXSetViewport(viewportBackup[0], viewportBackup[1], viewportBackup[2], viewportBackup[3], viewportBackup[4],
                  viewportBackup[5]);
}

f32 forceSdata(void) {
    return 30.0f;
}

void e3DispOffscreen(CameraId cameraId, void* param) {
    u16 left, top, right, bottom;

    wp->field_4 = wp->field_8;
    sysWaitDrawSync();
    GXClearBoundingBox();
    e3Disp(cameraId, param);
    sysWaitDrawSync();
    GXReadBoundingBox(&left, &top, &right, &bottom);
    offscreenAddBoundingBox(offscreenNameToId("fOff_peron"), left, top, right, bottom);
}

void pressStartGX(s32 alpha, f32 x, f32 y) {
    CameraEntry* camera = camGetCurPtr();
    GXTexObj startText, gradient;
    Mtx v17, v16;

    TEXGetGXTexObjFromPalette(*wp->handle->data, &startText, 3);
    GXLoadTexObj(&startText, GX_TEXMAP0);
    TEXGetGXTexObjFromPalette(*wp->handle->data, &gradient, 4);
    GXLoadTexObj(&gradient, GX_TEXMAP1);
    GXSetNumTevStages(2);
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
    GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
    GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_CPREV, GX_CC_TEXC, GX_CC_ZERO);
    GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_APREV, GX_CA_A0, GX_CA_ZERO);
    GXSetTevColor(GX_TEVREG0, (GXColor){ 0x00, 0x00, 0x00, alpha });
    GXSetNumChans(0);
    GXSetNumTexGens(2);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 60);
    GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, 30);
    MTXScale(v16, 1.0f, 1.0f, 1.0f);
    MTXTrans(v17, (f32)gp->retraceCount / -200.0f, 0.0f, 0.0f);
    MTXConcat(v16, v17, v17);
    GXLoadTexMtxImm(v17, 30, GX_MTX2x4);
    GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZCompLoc(GX_TRUE);
    GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
    GXSetZMode(GX_DISABLE, GX_LEQUAL, GX_DISABLE);
    GXSetCullMode(GX_CULL_NONE);
    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
    GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
    MTXTrans(v17, x, y, 0.0f);
    MTXScale(v16, (f32)GXGetTexObjWidth(&startText), (f32)GXGetTexObjHeight(&startText), 1.0f);
    MTXConcat(v17, v16, v17);
    MTXConcat(camera->view, v17, v17);
    GXLoadPosMtxImm(v17, 0);
    GXSetCurrentMtx(0);
    GXBegin(GX_QUADS, GX_VTXFMT0, 4);
    GXPosition3f32(-0.5f, -0.5f, 0.0f);
    GXTexCoord2f32(0.0f, 1.0f);
    GXPosition3f32(0.5f, -0.5f, 0.0f);
    GXTexCoord2f32(1.0f, 1.0f);
    GXPosition3f32(0.5f, 0.5f, 0.0f);
    GXTexCoord2f32(1.0f, 0.0f);
    GXPosition3f32(-0.5f, 0.5f, 0.0f);
    GXTexCoord2f32(0.0f, 0.0f);
    GXSetTevSwapModeTable(GX_TEV_SWAP1, GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_ALPHA);
}
