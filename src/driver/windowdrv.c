/* TODO: macro "7" for numWindows or smth, tpl index macro/enum for easy waku editing */
#include "driver/windowdrv.h"
#include "driver/arcdrv.h"
#include "driver/camdrv.h"
#include "memory.h"
#include "system.h"
#include "sdk/texPalette.h"
#include <string.h>

extern int sprintf(char* str, const char* format, ...);

//.sbss
static TPLHeader* tpldata; //new in retail
static BOOL tpl_loaded; //new in retail
f32 scrl;
GXTexObj* wakuTexObj;
WindowEntry* WinObjects;

//local prototypes
static void _callback(s32 error, DVDFileInfo* info);
void _windowDispGX_Message(s32 type, s32 a2, u8 alpha, BOOL dark, f32 x, f32 y, f32 height, f32 width, f32 a9, f32 a10);

void windowInit(void) {
	WinObjects = __memAlloc(HEAP_DEFAULT, sizeof(WindowEntry) * 7);
	WinObjects[0].flags = 0;
	WinObjects[0].userdata = NULL;
	WinObjects[1].flags = 0;
	WinObjects[1].userdata = NULL;
	WinObjects[2].flags = 0;
	WinObjects[2].userdata = NULL;
	WinObjects[3].flags = 0;
	WinObjects[3].userdata = NULL;
	WinObjects[4].flags = 0;
	WinObjects[4].userdata = NULL;
	WinObjects[5].flags = 0;
	WinObjects[5].userdata = NULL;
	WinObjects[6].flags = 0;
	WinObjects[6].userdata = NULL;
	tpldata = NULL;
	tpl_loaded = FALSE;
}

//new in retail
static void _callback(s32 error, DVDFileInfo* info) {
	u32 i;

	UnpackTexPalette(tpldata);
	DVDMgrClose(info->cb.userData);
	wakuTexObj = __memAlloc(HEAP_DEFAULT, sizeof(GXTexObj) * tpldata->imageCount);

	for (i = 0; i < tpldata->imageCount; i++) {
		TEXGetGXTexObjFromPalette(tpldata, &wakuTexObj[i], i);
	}
	tpl_loaded = TRUE;
}

void windowTexSetup(void) {
	DVDEntry* entry;
	u32 size;
	char path[128];
	u32 i;

	tpldata = NULL;
	tpl_loaded = FALSE;
	tpldata = arcOpen("font/msgWindow.tpl", NULL, NULL);
	if (tpldata) {
		UnpackTexPalette(tpldata);
		wakuTexObj = __memAlloc(HEAP_DEFAULT, sizeof(GXTexObj) * tpldata->imageCount);

		for (i = 0; i < tpldata->imageCount; i++) {
			TEXGetGXTexObjFromPalette(tpldata, &wakuTexObj[i], i);
		}
	}
	else {
		sprintf(path, "%s/f/msgWindow.tpl", getMarioStDvdRoot());
		entry = DVDMgrOpen(path, 2, 0);
		size = OSRoundUp32B(DVDMgrGetLength(entry));
		tpldata = __memAlloc(HEAP_DEFAULT, size);
		entry->info.cb.userData = entry;
		DVDMgrReadAsync(entry, tpldata, size, 0, _callback);
	}
}

void windowReInit(void) {
	WinObjects[0].flags = 0;
	WinObjects[0].userdata = NULL;
	WinObjects[1].flags = 0;
	WinObjects[1].userdata = NULL;
	WinObjects[2].flags = 0;
	WinObjects[2].userdata = NULL;
	WinObjects[3].flags = 0;
	WinObjects[3].userdata = NULL;
	WinObjects[4].flags = 0;
	WinObjects[4].userdata = NULL;
	WinObjects[5].flags = 0;
	WinObjects[5].userdata = NULL;
	WinObjects[6].flags = 0;
	WinObjects[6].userdata = NULL;
}

s32 windowEntry(u16 a1) {
	WindowEntry* entry;
	int i;

	for (i = 0; i < 7; i++) {
		entry = &WinObjects[i];
		if (!(entry->flags & 1)) {
			memset(entry, 0, sizeof(WindowEntry));
			entry->flags = 1;
			entry->field_0x4 = a1;
			return i;
		}
	}
	return -1;
}

BOOL windowDelete(WindowEntry* entry) {
	if (entry->delete) {
		entry->delete(entry);
	}
	entry->flags = 0;
	entry->userdata = NULL;
	return TRUE;
}

BOOL windowDeleteID(s32 id) {
	WindowEntry* entry = &WinObjects[id];
	if (!(entry->flags & 1)) {
		return FALSE;
	}
	if (entry->delete) {
		entry->delete(entry);
	}
	entry->flags = 0;
	entry->userdata = NULL;
	return TRUE;
}

void windowMain(void) {
	WindowEntry* entry;
	int i;

	for (i = 0; i < 7; i++) {
		entry = &WinObjects[i];
		if (entry->flags & 1) {
			if (entry->main) {
				entry->main(entry);
			}
		}
	}
}

void windowDispGX_Kanban(s32 type, u8 alpha, f32 x, f32 y, f32 height, f32 width) {
	CameraEntry* camera;
	Mtx trans, scale;
	Mtx wood_mtx1, wood_mtx2, wood_mtx3, wood_mtx4; //+0x104, for case 2/4
	Mtx lines_mtx1, lines_mtx2, lines_mtx3, lines_mtx4; //+0x44, for case 10
	Mtx letter_mtx;

	camera = camGetCurPtr();
	GXSetCullMode(GX_CULL_NONE);
	GXSetZCompLoc(GX_TRUE);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
	GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_OR);
	GXSetZMode(GX_TRUE, GX_ALWAYS, GX_FALSE);
	GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
	GXSetNumChans(0);
	GXSetNumTexGens(1);
	GXSetNumTevStages(1);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_C0, GX_CC_TEXC, GX_CC_ZERO);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_A0, GX_CA_TEXA, GX_CA_ZERO);
	GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
	GXSetCurrentMtx(0);
	GXSetTevColor(GX_TEVREG0, (GXColor){0xFF, 0xFF, 0xFF, alpha});
	MTXTrans(trans, x, y, 0.0f);
	MTXScale(scale, height / 560.0f, width / 176.0f, 1.0f);
	MTXConcat(trans, scale, trans);
	MTXConcat(camera->view, trans, trans);
	GXLoadPosMtxImm(trans, 0);
	GXSetCurrentMtx(0);

	switch (type) {
		case WINDOW_TYPE_PLATE: //images 29, 30, 31, 32
		case WINDOW_TYPE_KANBAN:
			//left side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(wood_mtx1, __fabsf(72.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[29]),
				__fabsf(176.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[29]), 1.0f);
			GXLoadTexMtxImm(wood_mtx1, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[29], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//top side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(wood_mtx2, __fabsf(416.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[31]),
				__fabsf(136.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[31]), 1.0f);
			GXLoadTexMtxImm(wood_mtx2, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[31], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
		
			//right side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(wood_mtx3, __fabsf(72.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[30]),
				__fabsf(176.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[30]), 1.0f);
			GXLoadTexMtxImm(wood_mtx3, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[30], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//bottom side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(wood_mtx4, __fabsf(416.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[32]),
				__fabsf(40.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[32]), 1.0f);
			GXLoadTexMtxImm(wood_mtx4, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[32], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		case WINDOW_TYPE_HOUSOU: //images 25, 26, 27, 28
			//left side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(lines_mtx1, __fabsf(72.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[25]),
				__fabsf(176.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[25]), 1.0f);
			GXLoadTexMtxImm(lines_mtx1, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[25], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//top side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(lines_mtx2, __fabsf(416.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[27]),
				__fabsf(136.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[27]), 1.0f);
			GXLoadTexMtxImm(lines_mtx2, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[27], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//right side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(lines_mtx3, __fabsf(72.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[26]),
				__fabsf(176.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[26]), 1.0f);
			GXLoadTexMtxImm(lines_mtx3, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[26], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//bottom side of the frame
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(lines_mtx4, __fabsf(416.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[28]),
				__fabsf(40.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[28]), 1.0f);
			GXLoadTexMtxImm(lines_mtx4, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[28], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		case WINDOW_TYPE_DIARY: //image 6
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(letter_mtx, __fabsf(560.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[6]),
				__fabsf(176.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[6]), 1.0f);
			GXLoadTexMtxImm(letter_mtx, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[6], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		default:
			break;
	}
}

//regalloc issues wrt f29/f28, stack swap in GXColor, some vert code (see comments), 99.8% 1:1
void windowDispGX_System(s32 type, u8 alpha, f32 x, f32 y, f32 height, f32 width) {
	CameraEntry* camera;
	f32 scroll;
	Mtx mtx;
	Mtx trans, scale;
	f32 x2, y2;
	Mtx trans2, scale2;
	f32 y3, y4;
	Mtx trans3, scale3;
	f32 x3, x4;
	Mtx trans4, scale4;
	f32 x5;

	camera = camGetCurPtr();
	scrl += 0.005f;
	if (scrl > 10.0f) {
		scrl -= 10.0f;
	}
	GXSetCullMode(GX_CULL_NONE);
	GXSetZCompLoc(GX_TRUE);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
	GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_OR);
	GXSetZMode(GX_TRUE, GX_ALWAYS, GX_FALSE);
	GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
	GXSetNumChans(0);
	GXSetNumTexGens(1);

	GXSetNumTevStages(1);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_C0, GX_CC_TEXC, GX_CC_ZERO);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_A0, GX_CA_TEXA, GX_CA_ZERO);
	GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
	GXSetCurrentMtx(0);

	GXSetTevColor(GX_TEVREG0, (GXColor){0xFF, 0xFF, 0xFF, alpha});
	GXSetNumTevStages(4);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
	GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);

	GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_CPREV);
	GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_APREV, GX_CA_TEXA, GX_CA_ZERO);
	GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);

	GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD1, GX_TEXMAP2, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_CPREV, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
	GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
	GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);

	GXSetTevOrder(GX_TEVSTAGE3, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE3, GX_CC_ZERO, GX_CC_CPREV, GX_CC_C0, GX_CC_ZERO);
	GXSetTevAlphaIn(GX_TEVSTAGE3, GX_CA_ZERO, GX_CA_APREV, GX_CA_A0, GX_CA_ZERO);
	GXSetTevSwapMode(GX_TEVSTAGE3, GX_TEV_SWAP0, GX_TEV_SWAP0);

	MTXTrans(mtx, x, y, 0.0f);
	MTXConcat(camera->view, mtx, mtx);
	GXLoadPosMtxImm(mtx, 0);
	GXSetCurrentMtx(0);

	//top left of the frame
	scroll = scrl;
	GXLoadTexObj(&wakuTexObj[5], GX_TEXMAP0);
	GXLoadTexObj(&wakuTexObj[42], GX_TEXMAP1);
	GXLoadTexObj(&wakuTexObj[46], GX_TEXMAP2);

	GXSetNumTexGens(2);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
	MTXTrans(trans, scroll + (0.0f / (f32)GXGetTexObjWidth(&wakuTexObj[5])),
		(-0.0f / (f32)GXGetTexObjHeight(&wakuTexObj[5])) - scroll, 0.0f);
	MTXScale(scale, __fabsf(height - 32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[5]),
		__fabsf(width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[5]), 1.0f);
	MTXConcat(trans, scale, trans);
	GXLoadTexMtxImm(trans, 0x1E, GX_MTX2x4);
	GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX1);
	MTXScale(scale, __fabsf(height - 32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[42]),
		__fabsf(width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[42]), 1.0f);
	GXLoadTexMtxImm(scale, 0x21, GX_MTX2x4);
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);

	x2 = 0.0f + (height - 32.0f);
	y2 = 0.0f - (width - 32.0f); //not emitting correctly, some macro used?

	GXPosition3f32(0.0f, 0.0f, 0.0f);
	GXTexCoord2f32(0.0f, 0.0f);

	GXPosition3f32(x2, 0.0f, 0.0f); //f29 = x2, 0.0f + (height - 32.0f)
	GXTexCoord2f32(1.0f, 0.0f);

	GXPosition3f32(x2, y2, 0.0f); //f28 = y2, 0.0f - (width - 32.0f)
	GXTexCoord2f32(1.0f, 1.0f);

	GXPosition3f32(0.0f, y2, 0.0f);
	GXTexCoord2f32(0.0f, 1.0f);

	//bottom left of the frame
	scroll = scrl;
	GXLoadTexObj(&wakuTexObj[5], GX_TEXMAP0);
	GXLoadTexObj(&wakuTexObj[43], GX_TEXMAP1);
	GXLoadTexObj(&wakuTexObj[47], GX_TEXMAP2);

	GXSetNumTexGens(2);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
	MTXTrans(trans2, scroll + (0.0f / (f32)GXGetTexObjWidth(&wakuTexObj[5])),
		((width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[5])) - scroll, 0.0f);
	MTXScale(scale2, __fabsf(height - 32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[5]),
		__fabsf(32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[5]), 1.0f);
	MTXConcat(trans2, scale2, trans2);
	GXLoadTexMtxImm(trans2, 0x1E, GX_MTX2x4);
	GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX1);
	MTXScale(scale2, __fabsf(height - 32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[43]),
		__fabsf(32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[43]), 1.0f);
	GXLoadTexMtxImm(scale2, 0x21, GX_MTX2x4);
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);

	y3 = 0.0f - (width - 32.0f);
	y4 = y3 - 32.0f; //not emitting correctly, some macro used?

	GXPosition3f32(0.0f, y3, 0.0f); //f27 = y3, neg(width - 32.0f)
	GXTexCoord2f32(0.0f, 0.0f);

	GXPosition3f32(x2, y3, 0.0f);
	GXTexCoord2f32(1.0f, 0.0f);

	GXPosition3f32(x2, y4, 0.0f); //f26 = y4, (y2 - 32.0f)
	GXTexCoord2f32(1.0f, 1.0f);

	GXPosition3f32(0.0f, y4, 0.0f);
	GXTexCoord2f32(0.0f, 1.0f);

	//top right of the frame
	scroll = scrl;
	GXLoadTexObj(&wakuTexObj[5], GX_TEXMAP0);
	GXLoadTexObj(&wakuTexObj[44], GX_TEXMAP1);
	GXLoadTexObj(&wakuTexObj[48], GX_TEXMAP2);

	GXSetNumTexGens(2);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
	MTXTrans(trans3, scroll + ((height - 32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[5])),
		(-0.0f / (f32)GXGetTexObjHeight(&wakuTexObj[5])) - scroll, 0.0f);
	MTXScale(scale3, __fabsf(32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[5]),
		__fabsf(width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[5]), 1.0f);
	MTXConcat(trans3, scale3, trans3);
	GXLoadTexMtxImm(trans3, 0x1E, GX_MTX2x4);
	GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX1);
	MTXScale(scale3, __fabsf(32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[44]),
		__fabsf(width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[44]), 1.0f);
	GXLoadTexMtxImm(scale3, 0x21, GX_MTX2x4);
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);

	x3 = height - 32.0f;
	x4 = x3 + 32.0f; //f25 = x4

	GXPosition3f32(x3, 0.0f, 0.0f);
	GXTexCoord2f32(0.0f, 0.0f);

	GXPosition3f32(x4, 0.0f, 0.0f);
	GXTexCoord2f32(1.0f, 0.0f);

	GXPosition3f32(x4, y2, 0.0f);
	GXTexCoord2f32(1.0f, 1.0f);

	GXPosition3f32(x3, y2, 0.0f);
	GXTexCoord2f32(0.0f, 1.0f);

	//bottom right of the frame
	scroll = scrl;
	GXLoadTexObj(&wakuTexObj[5], GX_TEXMAP0);
	GXLoadTexObj(&wakuTexObj[45], GX_TEXMAP1);
	GXLoadTexObj(&wakuTexObj[49], GX_TEXMAP2);

	GXSetNumTexGens(2);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
	MTXTrans(trans4, scroll + ((height - 32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[5])),
		((width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[5])) - scroll, 0.0f);
	MTXScale(scale4, __fabsf(32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[5]),
		__fabsf(width - 32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[5]), 1.0f);
	MTXConcat(trans4, scale4, trans4);
	GXLoadTexMtxImm(trans4, 0x1E, GX_MTX2x4);
	GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX1);
	MTXScale(scale4, __fabsf(32.0f) / (f32)GXGetTexObjWidth(&wakuTexObj[45]),
		__fabsf(32.0f) / (f32)GXGetTexObjHeight(&wakuTexObj[45]), 1.0f);
	GXLoadTexMtxImm(scale4, 0x21, GX_MTX2x4);
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);

	x5 = height - 32.0f;

	GXPosition3f32(x5, y3, 0.0f);
	GXTexCoord2f32(0.0f, 0.0f);

	GXPosition3f32(x4, y3, 0.0f);
	GXTexCoord2f32(1.0f, 0.0f);

	GXPosition3f32(x4, y4, 0.0f);
	GXTexCoord2f32(1.0f, 1.0f);

	GXPosition3f32(x5, y4, 0.0f);
	GXTexCoord2f32(0.0f, 1.0f);
}

//haven't checked asm, probably very close to 1:1 given patterns on previous functions
void _windowDispGX_Message(s32 type, s32 a2, u8 alpha, BOOL dark, f32 x, f32 y, f32 height, f32 width, f32 a9, f32 a10) {
	CameraEntry* camera;
	Mtx trans, scale;
	Mtx norm_mtx1, norm_mtx2, norm_mtx3, norm_mtx4;
	Mtx boss_mtx1, boss_mtx2, boss_mtx3, boss_mtx4;
	Mtx tec_mtx1, tec_mtx2;
	Mtx majo_mtx1, majo_mtx2, majo_mtx3, majo_mtx4;
	f32 y2;

	camera = camGetCurPtr();
	GXSetTevColor(GX_TEVREG0, (GXColor){0xFF, 0xFF, 0xFF, alpha});
	MTXTrans(trans, x, y, 0.0f);
	MTXScale(scale, height / 560.0f, width / 176.0f, 1.0f);
	MTXConcat(trans, scale, trans);
	MTXConcat(camera->view, trans, trans);
	GXLoadPosMtxImm(trans, 0);
	GXSetCurrentMtx(0);

	switch (type) {
		case WINDOW_TYPE_NORMAL: //images 9-12, 13-16 for light/dark
			//left side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(norm_mtx1, __fabsf(72.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 13 : 9]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 13 : 9]), 1.0f);
			GXLoadTexMtxImm(norm_mtx1, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 13 : 9], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//top side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(norm_mtx2, __fabsf(416.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 15 : 11]),
				__fabsf(136.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 15 : 11]), 1.0f);
			GXLoadTexMtxImm(norm_mtx2, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 15 : 11], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//right side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(norm_mtx3, __fabsf(72.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 14 : 10]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 14 : 10]), 1.0f);
			GXLoadTexMtxImm(norm_mtx3, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 14 : 10], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//bottom side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(norm_mtx4, __fabsf(416.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 16 : 12]),
				__fabsf(40.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 16 : 12]), 1.0f);
			GXLoadTexMtxImm(norm_mtx4, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 16 : 12], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		case WINDOW_TYPE_SMALL: //images 3, 4
			GXLoadTexObj(&wakuTexObj[dark ? 4 : 3], GX_TEXMAP0);
			MTXScale(trans, height, width, 1.0f);
			MTXTransApply(trans, trans, x, y, 0.0f);
			MTXConcat(camera->view, trans, trans);
			GXLoadPosMtxImm(trans, 0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4u);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(1.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(1.0f, -1.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -1.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		case WINDOW_TYPE_BOSS: //images 17-20, 21-24
			//left side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(boss_mtx1, __fabsf(72.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 21 : 17]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 21 : 17]), 1.0f);
			GXLoadTexMtxImm(boss_mtx1, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 21 : 17], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//top side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(boss_mtx2, __fabsf(416.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 23 : 19]),
				__fabsf(136.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 23 : 19]), 1.0f);
			GXLoadTexMtxImm(boss_mtx2, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 23 : 19], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//right side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(boss_mtx3, __fabsf(72.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 22 : 18]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 22 : 18]), 1.0f);
			GXLoadTexMtxImm(boss_mtx3, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 22 : 18], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//bottom side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(boss_mtx4, __fabsf(416.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 24 : 20]),
				__fabsf(40.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 24 : 20]), 1.0f);
			GXLoadTexMtxImm(boss_mtx4, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 24 : 20], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		case WINDOW_TYPE_TEC: //image 41
			//left(?) part
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(tec_mtx1, __fabsf(536.0f) / GXGetTexObjWidth(&wakuTexObj[41]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[41]), 1.0f);
			GXLoadTexMtxImm(tec_mtx1, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[41], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(536.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(536.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//right(?) part
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(tec_mtx2, __fabsf(-24.0f) / GXGetTexObjWidth(&wakuTexObj[41]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[41]), 1.0f);
			GXLoadTexMtxImm(tec_mtx2, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[41], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(536.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(536.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		case WINDOW_TYPE_MAJO: //images 33-36, 37-40
			//left side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(majo_mtx1, __fabsf(72.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 37 : 33]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 37 : 33]), 1.0f);
			GXLoadTexMtxImm(majo_mtx1, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 37 : 33], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(0.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(0.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//top side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(majo_mtx2, __fabsf(416.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 39 : 35]),
				__fabsf(136.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 39 : 35]), 1.0f);
			GXLoadTexMtxImm(majo_mtx2, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 39 : 35], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//right side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(majo_mtx3, __fabsf(72.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 38 : 34]),
				__fabsf(176.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 38 : 34]), 1.0f);
			GXLoadTexMtxImm(majo_mtx3, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 38 : 34], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(488.0f, 0.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(560.0f, 0.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(560.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);

			//bottom side
			GXSetNumTexGens(1);
			GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
			MTXScale(majo_mtx4, __fabsf(416.0f) / GXGetTexObjWidth(&wakuTexObj[dark ? 40 : 36]),
				__fabsf(40.0f) / GXGetTexObjHeight(&wakuTexObj[dark ? 40 : 36]), 1.0f);
			GXLoadTexMtxImm(majo_mtx4, 0x1E, GX_MTX2x4);
			GXLoadTexObj(&wakuTexObj[dark ? 40 : 36], GX_TEXMAP0);
			GXBegin(GX_QUADS, GX_VTXFMT0, 4);

			GXPosition3f32(72.0f, -136.0f, 0.0f);
			GXTexCoord2f32(0.0f, 0.0f);

			GXPosition3f32(488.0f, -136.0f, 0.0f);
			GXTexCoord2f32(1.0f, 0.0f);

			GXPosition3f32(488.0f, -176.0f, 0.0f);
			GXTexCoord2f32(1.0f, 1.0f);

			GXPosition3f32(72.0f, -176.0f, 0.0f);
			GXTexCoord2f32(0.0f, 1.0f);
			break;

		default:
			break;
	}
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
	//TODO: cleanup, rename vars
	if (a2 & 1) {
		if (a2 & 4) {
			x = (0.7f * height) + x;
		}
		else {
			x = (0.38f * height) + x;
		}
		
		if (a2 & 8) {
			y2 = -((0.175f * width) - y);
			y = ((0.225f * width) + y);
			if (a10 <= y2) return;
		}
		else {
			y2 = -((0.8f * width) - y);
			y = -((1.2f * width) - y);
			if (y2 <= a10) return;
		}
		width = (x - (((x - a9) * (y2 - y)) / (y2 - a10)));
		if (a9 < x) {
			if (width < a9) {
				width = a9;
			}
		}
		else {
			if (a9 < width) {
				width = a9;
			}
		}
		
		switch (type) {
			case WINDOW_TYPE_NORMAL:
			case WINDOW_TYPE_SMALL:
			case WINDOW_TYPE_BOSS:
				GXLoadTexObj(&wakuTexObj[dark ? 2 : 1], GX_TEXMAP0);
				break;

			case WINDOW_TYPE_MAJO:
				GXLoadTexObj(&wakuTexObj[dark ? 8 : 7], GX_TEXMAP0);
				break;

			default:
				break;
		}
		
		GXLoadPosMtxImm(camera->view, 0);
		GXBegin(GX_QUADS, GX_VTXFMT0, 4u);
		
		height = (0.05f * height);
		
		GXPosition3f32(x - height, y2, 0.0f);
		GXTexCoord2f32(0.0f, 0.0f);
		
		GXPosition3f32(x + height, y2, 0.0f);
		GXTexCoord2f32(1.0f, 0.0f);
		
		GXPosition3f32(width + height, y, 0.0f);
		GXTexCoord2f32(1.0f, 1.0f);
		
		GXPosition3f32(width - height, y, 0.0f);
		GXTexCoord2f32(0.0f, 1.0f);
	}
}

void windowDispGX_Message(s32 type, s32 a2, u8 alpha, f32 x, f32 y, f32 height, f32 width, f32 a9, f32 a10) {
	GXSetCullMode(GX_CULL_NONE);
	GXSetZCompLoc(GX_TRUE);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
	GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_OR);
	GXSetZMode(GX_TRUE, GX_ALWAYS, GX_FALSE);
	GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
	GXSetNumChans(0);
	GXSetNumTexGens(1);
	GXSetNumTevStages(1);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_C0, GX_CC_TEXC, GX_CC_ZERO);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_A0, GX_CA_TEXA, GX_CA_ZERO);
	GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
	GXSetCurrentMtx(0);
	if (type == WINDOW_TYPE_TEC) {
		_windowDispGX_Message(WINDOW_TYPE_TEC, 0, alpha, 1, x, y, height, width, a9, a10);
	}
	else {
		_windowDispGX_Message(type, a2, alpha, 1, x, y, height, width, a9, a10);
		_windowDispGX_Message(type, a2, alpha, 0, x, y, height, width, a9, a10);
	}
}

void windowDispGX_Waku_col(s16 gxTexMapID, GXColor color, f32 x, f32 y, f32 height, f32 width, f32 curve) {
	CameraEntry* camera = camGetCurPtr();
	Mtx mtx;
	f32 fVar1, fVar2, fVar3, fVar4, fVar5, fVar6; //TODO: rename

	if (tpl_loaded) {
		if (gxTexMapID) {
			gxTexMapID = 0;
		}
		GXSetCullMode(GX_CULL_NONE);
		GXSetZCompLoc(GX_TRUE);
		GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
		GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_OR);
		GXSetZMode(GX_TRUE, GX_ALWAYS, GX_FALSE);
		GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
		GXClearVtxDesc();
		GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
		GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
		GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
		GXSetNumChans(0);
		GXSetNumTexGens(1);
		GXSetNumTevStages(1);
		GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
		GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_C0, GX_CC_TEXC, GX_CC_ZERO);
		GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_A0, GX_CA_TEXA, GX_CA_ZERO);
		GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
		GXSetCurrentMtx(0);
		GXSetTevColor(GX_TEVREG0, color);
		MTXIdentity(mtx);
		MTXConcat(camera->view, mtx, mtx);
		GXLoadPosMtxImm(mtx, 0);
		GXSetCurrentMtx(0);
		GXLoadTexObj(&wakuTexObj[gxTexMapID], GX_TEXMAP0);
		GXBegin(GX_QUADS, GX_VTXFMT0, 0x24);

		fVar1 = x + width;
		fVar2 = x + curve;
		fVar6 = fVar1 - curve;
		fVar4 = y - height;
		fVar5 = y - curve;
		fVar3 = curve + fVar4;

		GXPosition3f32(x, y, 0.0f);
		GXTexCoord2f32(0.0f, 0.0f);

		GXPosition3f32(fVar2, y, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.0f);

		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);

		GXPosition3f32(x, fVar5, 0.0f);
		GXTexCoord2f32(0.0f, 0.33333333f);



		GXPosition3f32(fVar2, y, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.0f);

		GXPosition3f32(fVar6, y, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.0f);

		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);

		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);



		GXPosition3f32(fVar6, y, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.0f);

		GXPosition3f32(fVar1, y, 0.0f);
		GXTexCoord2f32(1.0f, 0.0f);

		GXPosition3f32(fVar1, fVar5, 0.0f);
		GXTexCoord2f32(1.0f, 0.33333333f);

		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);



		GXPosition3f32(x, fVar5, 0.0f);
		GXTexCoord2f32(0.0f, 0.33333333f);

		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);

		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);

		GXPosition3f32(x, fVar3, 0.0f);
		GXTexCoord2f32(0.0f, 0.66666666f);



		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);

		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);

		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);

		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);



		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);

		GXPosition3f32(fVar1, fVar5, 0.0f);
		GXTexCoord2f32(1.0f, 0.33333333f);

		GXPosition3f32(fVar1, fVar3, 0.0f);
		GXTexCoord2f32(1.0f, 0.66666666f);

		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);



		GXPosition3f32(x, fVar3, 0.0f);
		GXTexCoord2f32(0.0f, 0.66666666f);

		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);

		GXPosition3f32(fVar2, fVar4, 0.0f);
		GXTexCoord2f32(0.33333333f, 1.0f);

		GXPosition3f32(x, fVar4, 0.0f);
		GXTexCoord2f32(0.0f, 1.0f);



		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);

		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);

		GXPosition3f32(fVar6, fVar4, 0.0f);
		GXTexCoord2f32(0.66666666f, 1.0f);

		GXPosition3f32(fVar2, fVar4, 0.0f);
		GXTexCoord2f32(0.33333333f, 1.0f);



		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);

		GXPosition3f32(fVar1, fVar3, 0.0f);
		GXTexCoord2f32(1.0f, 0.66666666f);

		GXPosition3f32(fVar1, fVar4, 0.0f);
		GXTexCoord2f32(1.0f, 1.0f);

		GXPosition3f32(fVar6, fVar4, 0.0f);
		GXTexCoord2f32(0.66666666f, 1.0f);
	}
}

void windowDispGX2_Waku_col(Mtx mtx, s16 gxTexMapID, GXColor color, f32 x, f32 y, f32 width, f32 height, f32 curve) {
	CameraEntry* camera = camGetCurPtr();
	Mtx mtx2;
	f32 fVar1, fVar2, fVar3, fVar4, fVar5, fVar6, dVar9, dVar10; //TODO: rename

	if (tpl_loaded) {
		if (gxTexMapID) {
			gxTexMapID = 0;
		}
		GXSetCullMode(GX_CULL_NONE);
		GXSetZCompLoc(GX_TRUE);
		GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
		GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_OR);
		GXSetZMode(GX_TRUE, GX_ALWAYS, GX_FALSE);
		GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor) { 0xFF, 0xFF, 0xFF, 0xFF });
		GXClearVtxDesc();
		GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
		GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
		GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
		GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
		GXSetNumChans(0);
		GXSetNumTexGens(1);
		GXSetNumTevStages(1);
		GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
		GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_C0, GX_CC_TEXC, GX_CC_ZERO);
		GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_A0, GX_CA_TEXA, GX_CA_ZERO);
		GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
		GXSetCurrentMtx(0);
		GXSetTevColor(GX_TEVREG0, color);
		dVar9 = height * 0.5f;
		dVar10 = -width * 0.5f;
		MTXTrans(mtx2, x - dVar10, y - dVar9, 0.0f);
		MTXConcat(mtx2, mtx, mtx2);
		MTXConcat(camera->view, mtx2, mtx2);
		GXLoadPosMtxImm(mtx2, 0);
		GXSetCurrentMtx(0);
		GXLoadTexObj(&wakuTexObj[gxTexMapID], GX_TEXMAP0);
		GXBegin(GX_QUADS, GX_VTXFMT0, 0x24);


		fVar1 = dVar10 + width;
		fVar4 = dVar9 - height;
		fVar2 = dVar10 + curve;
		fVar5 = dVar9 - curve;
		fVar6 = fVar1 - curve;
		fVar3 = curve + fVar4;

		GXPosition3f32(dVar10, dVar9, 0.0f);
		GXTexCoord2f32(0.0f, 0.0f);

		GXPosition3f32(fVar2, dVar9, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.0f);

		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);

		GXPosition3f32(dVar10, fVar5, 0.0f);
		GXTexCoord2f32(0.0f, 0.33333333f);



		GXPosition3f32(fVar2, dVar9, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.0f);

		GXPosition3f32(fVar6, dVar9, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.0f);

		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);

		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);



		GXPosition3f32(fVar6, dVar9, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.0f);

		GXPosition3f32(fVar1, dVar9, 0.0f);
		GXTexCoord2f32(1.0f, 0.0f);

		GXPosition3f32(fVar1, fVar5, 0.0f);
		GXTexCoord2f32(1.0f, 0.33333333f);

		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);



		GXPosition3f32(dVar10, fVar5, 0.0f);
		GXTexCoord2f32(0.0f, 0.33333333f);

		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);

		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);

		GXPosition3f32(dVar10, fVar3, 0.0f);
		GXTexCoord2f32(0.0f, 0.66666666f);



		GXPosition3f32(fVar2, fVar5, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.33333333f);

		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);

		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);

		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);



		GXPosition3f32(fVar6, fVar5, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.33333333f);

		GXPosition3f32(fVar1, fVar5, 0.0f);
		GXTexCoord2f32(1.0f, 0.33333333f);

		GXPosition3f32(fVar1, fVar3, 0.0f);
		GXTexCoord2f32(1.0f, 0.66666666f);

		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);



		GXPosition3f32(dVar10, fVar3, 0.0f);
		GXTexCoord2f32(0.0f, 0.66666666f);

		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);

		GXPosition3f32(fVar2, fVar4, 0.0f);
		GXTexCoord2f32(0.33333333f, 1.0f);

		GXPosition3f32(dVar10, fVar4, 0.0f);
		GXTexCoord2f32(0.0f, 1.0f);



		GXPosition3f32(fVar2, fVar3, 0.0f);
		GXTexCoord2f32(0.33333333f, 0.66666666f);

		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);

		GXPosition3f32(fVar6, fVar4, 0.0f);
		GXTexCoord2f32(0.66666666f, 1.0f);

		GXPosition3f32(fVar2, fVar4, 0.0f);
		GXTexCoord2f32(0.33333333f, 1.0f);



		GXPosition3f32(fVar6, fVar3, 0.0f);
		GXTexCoord2f32(0.66666666f, 0.66666666f);

		GXPosition3f32(fVar1, fVar3, 0.0f);
		GXTexCoord2f32(1.0f, 0.66666666f);

		GXPosition3f32(fVar1, fVar4, 0.0f);
		GXTexCoord2f32(1.0f, 1.0f);

		GXPosition3f32(fVar6, fVar4, 0.0f);
		GXTexCoord2f32(0.66666666f, 1.0f);
	}
}

s32 windowCheckID(s32 id) {
	return WinObjects[id].flags & 2;
}

WindowEntry* windowGetPointer(s32 id) {
	return &WinObjects[id];
}

GXTexObj* getWakuTexObj(s32 id) {
	return &wakuTexObj[id];
}
