/* "seq_game" - Main Game Sequence
 * Status: 1:1, theoretically finished
 *
 * Function: the sequence running when on the overworld
 *
 * Last Update: 7/8/2022, finish seq_game
 */

#include "seq/seq_game.h"
#include "driver/fadedrv.h"
#include "evt/evt_fade.h"
#include "mario/mario.h"
#include "mario/mariost.h"
#include "pmario_sound.h"

extern GlobalWork* gp;

static OSTime none_key;

//.sdata
EVT_BEGIN(maku_spread)
WAIT_MS(2000)
CALL(evt_fade_entry, TITLE_SCREEN_CURTAIN_LEAVE_GRADUAL2, 0, 0, 0, 0)
RETURN()
EVT_END()

void seq_gameInit(SequenceWork* wp) {
	none_key = OSGetTime();
	gp->systemLevelFlags &= ~0x10;
}

void seq_gameMain(SequenceWork* wp) {
    CameraEntry *camera, *camera2;
    Vec position;

    switch (wp->state) {
        case 0:
            if ((gp->flags & 0x10) != 0) {
                fadeEntry(FADE_IN_WHITE2, 900, (GXColor){0, 0, 0, 0xFF});
                evtEntryType(maku_spread, 0, 0, 0);
                gp->flags &= ~0x10;
            } else if (!gp->didAreaChange) {
                fadeEntry(gp->mapFadeOutType, gp->mapFadeOutDuration, (GXColor){0, 0, 0, 0xFF});
            } else {
                fadeEntry(gp->areaFadeOutType, gp->areaFadeOutDuration, (GXColor){0, 0, 0, 0xFF});
            }
            gp->mapFadeOutType = FADE_IN_BLACK;
            gp->mapFadeOutDuration = 300;
            gp->areaFadeOutType = FADE_IN_BLACK;
            gp->areaFadeOutDuration = 300;
            wp->state++;
            break;
    
        case 1:
            if (gp->flags & 0x1000 && gp->flags & 0x2000 && fadeIsFinish() && seqCheckSeq() == SEQ_LOGO) {
                gp->flags &= ~0x2000;
                seqSetSeq(SEQ_GAME_OVER, 0, 0);
            }
            marioGetPtr(); //unused
            camera = camGetPtr(CAMERA_3D);
            position = camera->cameraPos;
            camera2 = camGetPtr(CAMERA_3D);
            psndSetPosDirListener(&position, camera2->viewYaw);
            break;
    }
}

void seq_gameExit(SequenceWork* wp) {
    gp->flags &= ~2;
}
