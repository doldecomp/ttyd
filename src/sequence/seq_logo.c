#include "seq/seq_logo.h"
#include "driver/arcdrv.h"
#include "driver/effdrv.h"
#include "driver/envdrv.h"
#include "driver/fadedrv.h"
#include "driver/icondrv.h"
#include "driver/seqdrv.h"
#include "driver/windowdrv.h"
#include "mario/mario.h"
#include "mario/mariost.h"
#include "mgr/filemgr.h"
#include "mgr/fontmgr.h"
#include "pmario_sound.h"
#include "romfont.h"
#include "system.h"
#include <dolphin/pad.h>
#include <demo/DEMOPad.h>
#include <dolphin/vi.h>
#include <string.h>

extern GlobalWork* gp;
extern GXRenderModeObj GXNtsc480ProgMarioSt;
extern GXRenderModeObj GXNtsc480IntDfMarioSt;

//.data
GXRenderModeObj GXNtsc480ProgLogo = {
	VI_TVMODE_NTSC_PROG, //viTVmode
	608, //fbWidth
	448, //efbHeight
	448, //xfbHeight
	27, //viXOrigin
	16, //viYOrigin
	666, //viWidth
	448, //viHeight
	VI_XFBMODE_SF, //xFBmode
	0, //field_rendering
	0, //aa
	6, 6, 6, 6, 6, 6, //pix 0
	6, 6, 6, 6, 6, 6, //pix 1
	6, 6, 6, 6, 6, 6, //pix 2
	6, 6, 6, 6, 6, 6, //pix 3
	8, 8, 10, 12, 10, 8, 8, //vfilter
};

GXRenderModeObj GXNtsc480IntDfLogo = {
	VI_TVMODE_NTSC_INT, //viTVmode
	608, //fbWidth
	448, //efbHeight
	448, //xfbHeight
	27, //viXOrigin
	16, //viYOrigin
	666, //viWidth
	448, //viHeight
	VI_XFBMODE_DF, //xFBmode
	0, //field_rendering
	0, //aa
	6, 6, 6, 6, 6, 6, //pix 0
	6, 6, 6, 6, 6, 6, //pix 1
	6, 6, 6, 6, 6, 6, //pix 2
	6, 6, 6, 6, 6, 6, //pix 3
	8, 8, 10, 12, 10, 8, 8, //vfilter
};

//.sbss
static LogoWork work;

//.sdata
static LogoWork* wp = &work;

//local prototypes
void logoDisp(CameraId cameraId, void* param);
void dummy_draw(CameraId cameraId, void* param);
void progDisp(CameraId cameraId, void* param);

void seq_logoInit(SequenceWork* work) {
	memset(wp, 0, sizeof(LogoWork));
	wp->texture = fileAllocf(4, "%s/mariost.tpl", getMarioStDvdRoot());
	if (!OSIsRestart() || OSGetResetCode() & OS_RESET_SHUTDOWN) {
		if (VIGetDTVStatus()) {
			if (OSGetProgressiveMode() == 1) {
				wp->progressive = TRUE;
			}
			else {
				wp->progressive = (keyGetButton(0) & PAD_BUTTON_B) != 0;
			}
		}
		else {
			if (OSGetProgressiveMode() == 1) {
				OSSetProgressiveMode(0);
			}
			wp->progressive = FALSE;
		}
	}
	fileAsyncf(0, 0, "%s/b/first", getMarioStDvdRoot()); //unused
	if (!OSIsRestart() || OSGetResetCode() & OS_RESET_SHUTDOWN) {
		VIConfigure(&GXNtsc480IntDfLogo);
		VIFlush();
		VIWaitForRetrace();
	}
	else {
		switch (OSGetResetCode() & 1) {
			case OS_RESET_RESTART:
				VIConfigure(&GXNtsc480IntDfLogo);
				VIFlush();
				VIWaitForRetrace();
				break;

			case OS_RESET_HOTRESET:
				VIConfigure(&GXNtsc480ProgLogo);
				VIFlush();
				VIWaitForRetrace();
				VIWaitForRetrace();
				gp->flags |= 8;
				break;
		}
		gp->flags |= 4;
	}
}

void seq_logoExit(SequenceWork* work) {
	fontmgrTexSetup();
	windowTexSetup();
	fadeTexSetup();
	iconTexSetup();
	envTexSetup();
	effTexSetup();
	marioPoseInit();
	fileFree(wp->texture);
}

void seq_logoMain(SequenceWork* work) {
	static OSTime time; //time instance 1
	FileEntry* first;
	u8* decode;
	u32 size;

	switch (work->state) {
		case 0:
			fadeEntry(FADE_IN_BLACK, 500, (GXColor){0, 0, 0, 0xFF});
			DVDMgrSetupCallback(psndPushGroup);
			work->state++;
			break;

		case 1:
			if (fadeIsFinish() && !wp->progressive) {
				work->state++;
				time = gp->renderTime;
				gp->flags |= 4;
			}
			break;
		
		case 2:
			if (OSTicksToMilliseconds(gp->renderTime - time) > 1000) {
				fadeEntry(FADE_OUT_BLACK, 500, (GXColor){0, 0, 0, 0xFF});
				work->state++;
			}
			break;

		case 3:
			if (fadeIsFinish()) {
				fadeEntry(FADE_IN_BLACK, 500, (GXColor){0, 0, 0, 0xFF});
				work->state++;
				wp->field_0x10 = 1;
			}
			break;

		case 4:
			if (fadeIsFinish()) {
				work->state++;
				time = gp->renderTime;
			}
			break;

		case 5:
			if (OSTicksToMilliseconds(gp->renderTime - time) > 1000) {
				fadeEntry(FADE_OUT_BLACK, 500, (GXColor){0, 0, 0, 0xFF});
				work->state++;
			}
			break;

		case 6:
			if (fadeIsFinish()) {
				fadeEntry(FADE_IN_BLACK, 500, (GXColor){0, 0, 0, 0xFF});
				work->state++;
				wp->field_0x10 = 2;
			}
			break;

		case 7:
			if (fadeIsFinish()) {
				work->state++;
				time = gp->renderTime;
			}
			break;

		case 8:
			if (OSTicksToMilliseconds(gp->renderTime - time) > 1000) {
				fadeEntry(FADE_OUT_BLACK, 500, (GXColor){0, 0, 0, 0xFF});
				wp->skipStory = FALSE;
				work->state++;
			}
			break;

		case 9:
			if (keyGetButtonTrg(0) & (PAD_BUTTON_START | PAD_BUTTON_A)) {
				wp->skipStory = TRUE;
			}
			if (!psndPushGroup()) {
				DVDMgrSetupCallback(NULL);
				if (fadeIsFinish()) {
					if (gp->flags & 8) {
						VIConfigure(&GXNtsc480ProgMarioSt);
					}
					else {
						VIConfigure(&GXNtsc480IntDfMarioSt);
					}
					VIFlush();
					VISetBlack(TRUE);
					dispEntry(CAMERA_BACKGROUND, 0, dummy_draw, NULL, 0.0f);
					work->state++;
				}
			}
			break;

		case 10:
			VISetBlack(FALSE);
			VIWaitForRetrace();
			if (!fileAsyncf(0, 0, "%s/b/first", getMarioStDvdRoot())) {
				break;
			}
			first = fileAllocf(0, "%s/b/first", getMarioStDvdRoot());
			if (first) {
				size = *(u32*)first->data;
				size = ((size >> 16) & 0xFF) | ((size >> 8) & 0xFF) | (size & 0xFF); //might need to reverse
				decode = __memAlloc(HEAP_DEFAULT, size);
				LZ77Decode(*first->data, decode);
				arcEntry(0, decode, size);
				fileFree(first);
			}
			if (gp->flags & 0x1000) {
				seqSetSeq(SEQ_E3, NULL, NULL);
			}
			else if (wp->skipStory) { //continue to title screen
				fadeEntry(FADE_OUT_WHITE, 500, (GXColor){0, 0, 0, 0xFF});
				work->state++;
			}
			else { //play story demo
				seqSetSeq(SEQ_MAP_CHANGE, "dmo_00", NULL);
			}
			break;

		case 11:
			if (fadeIsFinish()) {
				seqSetSeq(SEQ_TITLE, NULL, NULL);
			}
			break;
	}

	if (work->state < 10) {
		dispEntry(CAMERA_2D, 0, logoDisp, NULL, 1.0f);
		dispEntry(CAMERA_2D, 0, progDisp, NULL, 0.0f);
	}
}

//param is unused
void logoDisp(CameraId cameraId, void* param) {
	GXRenderModeObj* rmode;
	f32 width, x, height, y;

	//stack variables
	Mtx44 ortho; //stack + 0xAC
	Mtx position; //stack + 0x7C
	f32 projection[GX_PROJECTION_SZ]; //stack + 0x60
	f32 viewport[GX_VIEWPORT_SZ]; //stack + 0x48
	GXTexObj texObj; //stack + 0x28
	u32 sciLeft, sciTop, sciWidth, sciHeight; //tack + 0x24

	if (wp->texture) {
		GXGetProjectionv(projection);
		GXGetViewportv(viewport);
		GXGetScissor(&sciLeft, &sciTop, &sciWidth, &sciHeight);
		rmode = &GXNtsc480ProgLogo;
		if (OSGetProgressiveMode() != 1) {
			rmode = &GXNtsc480IntDfLogo;
		}
		GXSetPixelFmt(GX_PF_RGB8_Z24, GX_ZC_LINEAR);
		GXSetDispCopySrc(0, 0, rmode->fbWidth, rmode->efbHeight);
		GXSetDispCopyDst(rmode->fbWidth, rmode->efbHeight);
		GXSetDispCopyYScale((f32)rmode->xfbHeight / (f32)rmode->efbHeight);
		GXSetDispCopyGamma(GX_GM_1_0);
		GXSetScissorBoxOffset(0, 0);
		GXSetScissor(0, 0, 608, 448);
		GXSetViewport(0.0f, 0.0f, 608.0f, 448.0f, -1.0f, 1.0f);

		switch (wp->field_0x10) {
			case 0:
				TEXGetGXTexObjFromPalette(*wp->texture->data, &texObj, 0);
				GXLoadTexObj(&texObj, GX_TEXMAP0);
				GXSetNumChans(0);
				GXSetTevColor(GX_TEVREG0, (GXColor){0, 0, 0, 0xFF});
				if (gp->language) { //red for US
					GXSetTevColor(GX_TEVREG1, (GXColor){0xDC, 0, 0, 0xFF});
				}
				else { //blue for JP
					GXSetTevColor(GX_TEVREG1, (GXColor){0, 0x46, 0xFF, 0xFF});
				}
				GXSetNumTexGens(1);
				GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3C);
				GXSetNumTevStages(1);
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_C0, GX_CC_C1, GX_CC_TEXC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_TEXA, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO);
				GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
				GXSetZCompLoc(GX_TRUE);
				GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
				GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
				MTXOrtho(ortho, -23.0f, 448.0f, 0.0f, 608.0f, -100.0f, 100.0f);
				GXSetProjection(ortho, GX_ORTHOGRAPHIC);
				MTXIdentity(position);
				GXLoadPosMtxImm(position, 0);
				GXSetCurrentMtx(0);
				GXSetCullMode(GX_CULL_NONE);
				GXClearVtxDesc();
				GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
				GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
				GXBegin(GX_QUADS, GX_VTXFMT0, 4);

				GXPosition3f32(117.0f, 154.0f, 0.0f);
				GXTexCoord2f32(0.0f, 0.0f);

				GXPosition3f32(493.0f, 154.0f, 0.0f);
				GXTexCoord2f32(1.0f, 0.0f);

				GXPosition3f32(493.0f, 258.0f, 0.0f);
				GXTexCoord2f32(1.0f, 1.0f);

				GXPosition3f32(117.0f, 258.0f, 0.0f);
				GXTexCoord2f32(0.0f, 1.0f);
				break;

			case 1:
				TEXGetGXTexObjFromPalette(*wp->texture->data, &texObj, 1);
				GXLoadTexObj(&texObj, GX_TEXMAP0);
				GXSetNumChans(0);
				GXSetNumTexGens(1);
				GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3C);
				GXSetNumTevStages(1);
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevOp(GX_TEVSTAGE0, GX_REPLACE);
				GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
				GXSetZCompLoc(GX_TRUE);
				GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
				GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
				MTXOrtho(ortho, 0.0f, 448.0f, 0.0f, 608.0f, -100.0f, 100.0f);
				GXSetProjection(ortho, GX_ORTHOGRAPHIC);
				MTXIdentity(position);
				GXLoadPosMtxImm(position, 0);
				GXSetCurrentMtx(0);
				GXSetCullMode(GX_CULL_NONE);
				GXClearVtxDesc();
				GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
				GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
				GXBegin(GX_QUADS, GX_VTXFMT0, 4);
				width = (f32)GXGetTexObjWidth(&texObj);
				height = (f32)GXGetTexObjHeight(&texObj);
				x = (608.0f - width) * 0.5f;
				y = (448.0f - height) * 0.5f - 20.0f;
				height += y;

				GXPosition3f32(x, y, 0.0f);
				GXTexCoord2f32(0.0f, 0.0f);

				GXPosition3f32(x + width, y, 0.0f);
				GXTexCoord2f32(1.0f, 0.0f);

				GXPosition3f32(x + width, height, 0.0f);
				GXTexCoord2f32(1.0f, 1.0f);

				GXPosition3f32(x, height, 0.0f);
				GXTexCoord2f32(0.0f, 1.0f);
				break;
		
			case 3:
				TEXGetGXTexObjFromPalette(*wp->texture->data, &texObj, 2);
				GXLoadTexObj(&texObj, GX_TEXMAP0);
				GXSetNumChans(1u);
				GXSetChanCtrl(GX_COLOR0A0, GX_FALSE, GX_SRC_REG, GX_SRC_REG, 0, GX_DF_NONE, GX_AF_NONE);
				GXSetChanMatColor(GX_COLOR0A0, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
				GXSetNumTexGens(1);
				GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3C);
				GXSetNumTevStages(1);
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_RASC, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_TEXA, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO);
				GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
				GXSetZCompLoc(GX_TRUE);
				GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
				GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
				MTXOrtho(ortho, 0.0f, 448.0f, 0.0f, 608.0f, -100.0f, 100.0f);
				GXSetProjection(ortho, GX_ORTHOGRAPHIC);
				MTXIdentity(position);
				GXLoadPosMtxImm(position, 0);
				GXSetCurrentMtx(0);
				GXSetCullMode(GX_CULL_NONE);
				GXClearVtxDesc();
				GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
				GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
				GXBegin(GX_QUADS, GX_VTXFMT0, 4);

				GXPosition3f32(189.0f, 150.0f, 0.0f);
				GXTexCoord2f32(0.0f, 0.0f);

				GXPosition3f32(421.0f, 150.0f, 0.0f);
				GXTexCoord2f32(1.0f, 0.0f);

				GXPosition3f32(421.0f, 262.0f, 0.0f);
				GXTexCoord2f32(1.0f, 1.0f);

				GXPosition3f32(189.0f, 262.0f, 0.0f);
				GXTexCoord2f32(0.0f, 1.0f);
				break;
		}
		GXSetProjectionv(projection);
		GXSetViewport(viewport[0], viewport[1], viewport[2], viewport[3], viewport[4], viewport[5]);
		GXSetScissor(sciLeft, sciTop, sciWidth, sciHeight);
	}
}

//param is unused
void dummy_draw(CameraId cameraId, void* param) {
	GXRenderModeObj* rmode;
	f32 scale;
	u16 height;

	rmode = &GXNtsc480ProgMarioSt;
	if (OSGetProgressiveMode() != 1) {
		rmode = &GXNtsc480IntDfMarioSt;
	}
	scale = GXGetYScaleFactor(rmode->efbHeight, rmode->xfbHeight);
	height = (u16)GXSetDispCopyYScale(scale);
	GXSetDispCopySrc(0, 0, rmode->fbWidth, rmode->efbHeight);
	GXSetDispCopyDst(rmode->fbWidth, height);
	GXSetPixelFmt(GX_PF_RGBA6_Z24, GX_ZC_LINEAR);
	GXSetScissor(0, 0, 608, 480);
	GXSetViewport(0.0f, 0.0f, 608.0f, 480.0f, 0.0f, 1.0f);
}

//param is unused
void progDisp(CameraId cameraId, void* param) {
	static OSTime time; //time instance 2
	const char* msg;
	f32 width;
	u32 button;
	s32 type;

	camGetPtr(cameraId); //unused
	if (wp->progressive) {
		switch (wp->field_0x4) {
			case 0:
				wp->field_0x18 = OSGetTime();
				wp->field_0x4++;
				break;

			case 1:
				button = keyGetButtonTrg(0);
				if (gp->dirs[0] ||
					gp->button[0] ||
					gp->stickX[0] ||
					gp->stickY[0] ||
					gp->substickX[0] ||
					gp->substickY[0] ||
					gp->triggerLeft[0] ||
					gp->triggerRight[0])
				{
					wp->field_0x18 = OSGetTime();
				}
				else {
					if (OSTicksToSeconds(OSGetTime() - wp->field_0x18) > 10) {
						button = 0x100;
					}
				}
				if (button & (PAD_BUTTON_LEFT | PAD_BUTTON_RIGHT) || keyGetDirTrg(0) & (DEMO_STICK_LEFT | DEMO_STICK_RIGHT)) {
					wp->toggle = 1 - wp->toggle;
				}
				else if (button & PAD_BUTTON_A) {
					time = gp->renderTime;
					wp->field_0x4++;
				}

				msg = romFontGetMessage(0); //Display Progressive Scan?
				width = (f32)romFontGetWidth(msg);
				romFontPrintGX(
					-(0.7f * width) * 0.5f,
					-130.0f,
					0.7f,
					(GXColor){0xFF, 0xFF, 0xFF, 0xFF},
					msg);

				msg = romFontGetMessage(1); //yes/no
				width = (f32)romFontGetWidth(msg);
				romFontPrintGX(
					-(0.7f * width) * 0.5f,
					-160.0f,
					0.7f,
					(GXColor){0xFF, 0xFF, 0xFF, 0xFF},
					msg);

				msg = romFontGetMessage(2); //selection box
				width = (f32)romFontGetWidth(msg);
				romFontPrintGX(
					-(((0.7f * width) * 0.5f) - (f32)(75 * ((2 * wp->toggle) - 1))),
					-160.0f,
					0.7f,
					(GXColor){0xFF, 0xFF, 0xFF, 0xFF},
					msg);
				break;

			case 2:
				if (OSTicksToMilliseconds(gp->renderTime - time) > 2000) {
					wp->field_0x4++;
				}
				type = 3; //progressive turned on
				if (wp->toggle) {
					type = 4; //progressive turned off
				}
				msg = romFontGetMessage(type);
				width = (f32)romFontGetWidth(msg);
				romFontPrintGX(
					-(0.7f * (f32)width) * 0.5f,
					-145.0f,
					0.7f,
					(GXColor){0xFF, 0xFF, 0xFF, 0xFF},
					msg);
				break;

			case 3:
				if (wp->toggle) {
					OSSetProgressiveMode(0);
					wp->progressive = 0;
					gp->flags &= ~8;
				}
				else {
					VISetBlack(1);
					OSSetProgressiveMode(1);
					VIConfigure(&GXNtsc480ProgLogo);
					VIFlush();
					VIWaitForRetrace();
					VIWaitForRetrace();
					time = gp->renderTime;
					wp->field_0x4++;
					gp->flags |= 8;
				}
				gp->flags |= 4;
				break;

			case 4:
				if (OSTicksToMilliseconds(gp->renderTime - time) > 2000) {
					VISetBlack(TRUE);
					wp->progressive = 0;
				}
				break;
		}
	}
}
