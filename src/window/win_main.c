#include "win/win_main.h"
#include "data/item_data.h"
#include "driver/seqdrv.h"
#include "evt/evt_cmd.h"
#include "manager/evtmgr.h"
#include "mario/mario.h"
#include "memory.h"
#include "party.h"
#include "system.h"
#include <dolphin/pad.h>
#include <demo/DEMOPad.h>
#include <string.h>

extern ItemData* itemDataTable;
extern int sprintf(char* str, const char* format, ...);

//.sbss
static WindowWork* wp;
TEXPalette* winTexTpl;
static s32 cnt;

//local prototypes
void winDisp(CameraId cameraId, void* param);
void winDispKoopa(CameraId cameraId, void* param);

WindowWork* winGetPtr(void) {
	return wp;
}

void winInit(void) {
	wp = __memAlloc(HEAP_DEFAULT, sizeof(WindowWork));
	memset(wp, 0, sizeof(WindowWork));
}

void winReInit(void) {
	memset(wp, 0, sizeof(WindowWork));
}

BOOL winCheck(void) {
	s32 state;

	if (wp == NULL) {
		return FALSE;
	}
	if (wp->flags & 0x1000) {
		return FALSE;
	}
	state = wp->menuState;
	if (state != 0 && state < 200) {
		return TRUE;
	}
	return FALSE;
}

void winOpenEnable(void) {
	if (wp) {
		wp->flags &= ~1;
	}
}

void winOpenDisable(void) {
	if (wp) {
		wp->flags |= 1;
	}
}

void winMain(void) {
	MarioWork* mario;

	mario = marioGetPtr();
	if (!(wp->flags & 1) && seqGetSeq() == SEQ_GAME && !seqCheckSeq()) {
		wp->buttonTrg = keyGetButtonTrg(0);
		wp->buttonRep = keyGetButtonRep(0);
		wp->dirTrg = keyGetDirTrg(0);
		wp->dirRep = keyGetDirRep(0);

		if (keyGetButtonTrg(0) & PAD_BUTTON_LEFT) {
			wp->dirTrg |= DEMO_STICK_LEFT;
		}
		if (keyGetButtonTrg(0) & PAD_BUTTON_RIGHT) {
			wp->dirTrg |= DEMO_STICK_RIGHT;
		}
		if (keyGetButtonTrg(0) & PAD_BUTTON_UP) {
			wp->dirTrg |= DEMO_STICK_UP;
		}
		if (keyGetButtonTrg(0) & PAD_BUTTON_DOWN) {
			wp->dirTrg |= DEMO_STICK_DOWN;
		}

		if (keyGetButtonRep(0) & PAD_BUTTON_LEFT) {
			wp->dirRep |= DEMO_STICK_LEFT;
		}
		if (keyGetButtonRep(0) & PAD_BUTTON_RIGHT) {
			wp->dirRep |= DEMO_STICK_RIGHT;
		}
		if (keyGetButtonRep(0) & PAD_BUTTON_UP) {
			wp->dirRep |= DEMO_STICK_UP;
		}
		if (keyGetButtonRep(0) & PAD_BUTTON_DOWN) {
			wp->dirRep |= DEMO_STICK_DOWN;
		}

	}
}

void winDisp(CameraId cameraId, void* param) {

}

void winDispKoopa(CameraId cameraId, void* param) {

}

USER_FUNC(itemUseFunc) {
	PartyEntry* party;
	MarioWork* mario;
	ItemData* item;

	item = &itemDataTable[event->lwData[10]];
	if (isFirstCall) {
		cnt = 0;
	}
	/*switch (cnt) {
		
	}*/
}



void winTexInit(TEXPalette* texture) {
	winTexTpl = texture;
	GXSetCullMode(GX_CULL_NONE);
	GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
	GXSetNumChans(0);
	GXSetChanCtrl(GX_COLOR0A0, GX_FALSE, GX_SRC_REG, GX_SRC_REG, 0, GX_DF_NONE, GX_AF_NONE);
	GXSetNumTevStages(1);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_C0, GX_CC_TEXC, GX_CC_ZERO);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_A0, GX_CA_TEXA, GX_CA_ZERO);
	GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
	GXSetNumTexGens(1u);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3C);
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
}

void winTexSet(u32 textureId, Vec translate, Vec scale, GXColor color) {

}
