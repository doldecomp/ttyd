#include "battle/battle_disp.h"
#include "battle/battle.h"
#include "battle/battle_menu_disp.h"
#include "texPalette.h"

extern BattleWork* _battleWorkPointer;

//.sdata
s32 _status_pose_table[] = {
	kStatusInstantKill,
	kStatusStop,
	kStatusFreeze,
	kStatusSleep,
	kStatusPoison,
	kStatusConfuse,
	kStatusDizzy,
	-1
};

//local prototypes
const char* searchPoseTbl(BattleDispPose* table, s32 poseId);
void btlDispGXInit2DSub(void);
void btlDispTexPlaneInit(void);
void btlDispTexPlainGX(u32 id, GXColor color0, GXColor color1, GXColor color2, GXColor color3);
void btlDispGetTexSize(u32 id, u16* width, u16* height);

const char* searchPoseTbl(BattleDispPose* table, s32 poseId) { //TODO: fix mtctr
	int i;

	if (!table) return NULL;
	i = 0x1C;
	do {
		if (table->poseId == poseId || table->poseId == 0x1C) {
			return table->poseName;
		}
		table++;
	} while (--i);
	return NULL;
}

void btlDispGXInit2DSub(void) {
	GXSetCullMode(GX_CULL_NONE);
	GXSetZCompLoc(GX_TRUE);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
	GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_NOOP);
	GXSetZMode(GX_TRUE, GX_ALWAYS, GX_FALSE);
	GXClearVtxDesc();
	GXSetNumChans(1);
	GXSetChanCtrl(GX_COLOR0A0, GX_FALSE, GX_SRC_VTX, GX_SRC_VTX, 0, GX_DF_CLAMP, GX_AF_NONE);
}

void btlDispGXInit2DRasta(void) {
	btlDispGXInit2DSub();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_CLR0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8, 0);
	GXSetNumTexGens(0);
	GXSetNumTevStages(1);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_RASC);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
}

void btlDispGXInit2D(void) {
	btlDispGXInit2DSub();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_CLR0, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
	GXSetNumTexGens(1);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
	GXSetNumTevStages(1);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
}

void btlDispGXPoint2DRasta(f32 x, f32 y, u8 r, u8 g, u8 b, u8 a) {
	GXPosition3f32(x, y, 0.0f);
	GXColor4u8(r, g, b, a);
}

void btlDispGXQuads2DRasta(f32 x0, f32 y0, f32 x1, f32 y1, u8 r, u8 g, u8 b, u8 a) {
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);
	btlDispGXPoint2DRasta(x0, y0, r, g, b, a);
	btlDispGXPoint2DRasta(x1, y0, r, g, b, a);
	btlDispGXPoint2DRasta(x1, y1, r, g, b, a);
	btlDispGXPoint2DRasta(x0, y1, r, g, b, a);
}

void btlDispGXPoint2D(f32 x, f32 y, u8 r, u8 g, u8 b, u8 a, f32 s, f32 t) {
	GXPosition3f32(x, y, 0.0f);
	GXColor4u8(r, g, b, a);
	GXTexCoord2f32(s, t);
}

void btlDispGXQuads2D(f32 x0, f32 y0, f32 x1, f32 y1, u8 r, u8 g, u8 b, u8 a) {
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);
	btlDispGXPoint2D(x0, y0, r, g, b, a, 0.0f, 0.0f);
	btlDispGXPoint2D(x1, y0, r, g, b, a, 1.0f, 0.0f);
	btlDispGXPoint2D(x1, y1, r, g, b, a, 1.0f, 1.0f);
	btlDispGXPoint2D(x0, y1, r, g, b, a, 0.0f, 1.0f);
}
void btlDispTexPlaneInit(void) {
	GXSetCullMode(GX_CULL_NONE);
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_CLR0, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
	GXSetNumChans(1);
	GXSetChanCtrl(GX_COLOR0A0, GX_FALSE, GX_SRC_REG, GX_SRC_VTX, 0, GX_DF_CLAMP, GX_AF_NONE);
	GXSetNumTexGens(1);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
}

void btlDispTexPlainGX(u32 id, GXColor color0, GXColor color1, GXColor color2, GXColor color3) {
	GXTexObj texobj;
	f32 x, y;
	
	TEXGetGXTexObjFromPalette(*_battleWorkPointer->menuTex->data, &texobj, id);
	GXLoadTexObj(&texobj, GX_TEXMAP0);
	if (!GXGetTexObjFmt(&texobj)) {
		GXSetNumTevStages(1);
		GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
		GXSetTevOp(GX_TEVSTAGE0, GX_MODULATE);
	}
	else {
		GXSetNumTevStages(1);
		GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_RASC);
		GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
		GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
	}

	x = 0.5f * (f32)GXGetTexObjWidth(&texobj);
	y = 0.5f * (f32)GXGetTexObjHeight(&texobj);
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);

	GXPosition3f32(-x, y, 0.0f);
	GXColor4u8(color0.r, color0.g, color0.b, color0.a);
	GXTexCoord2f32(0.0f, 0.0f);

	GXPosition3f32(x, y, 0.0f);
	GXColor4u8(color1.r, color1.g, color1.b, color1.a);
	GXTexCoord2f32(1.0f, 0.0f);

	GXPosition3f32(x, -y, 0.0f);
	GXColor4u8(color2.r, color2.g, color2.b, color2.a);
	GXTexCoord2f32(1.0f, 1.0f);

	GXPosition3f32(-x, -y, 0.0f);
	GXColor4u8(color3.r, color3.g, color3.b, color3.a);
	GXTexCoord2f32(0.0f, 1.0f);
}

void btlDispTexPlane(u32 id, GXColor color, f32 tX, f32 tY, f32 tZ, f32 sX, f32 sY) {
	CameraEntry* camera;
	Mtx scale, trans, mtx;

	btlDispTexPlaneInit();
	camera = camGetCurPtr();
	PSMTXScale(scale, sX, sY, 1.0f);
	PSMTXTrans(trans, tX, tY, tZ);
	PSMTXConcat(trans, scale, mtx);
	PSMTXConcat(camera->view, mtx, mtx);
	GXLoadPosMtxImm(mtx, 0);
	btlDispTexPlainGX(id, color, color, color, color);
}

void btlDispTexPlane2(Mtx mtx, u32 id, GXColor color) {
	CameraEntry* camera;
	Mtx mtx2;

	btlDispTexPlaneInit();
	MTXCopy(mtx, mtx2);
	camera = camGetCurPtr();
	MTXConcat(camera->view, mtx2, mtx2);
	GXLoadPosMtxImm(mtx2, 0);
	btlDispTexPlainGX(id, color, color, color, color);
}

void btlDispTexPlane3(Mtx mtx, u32 id, GXColor color0, GXColor color1, GXColor color2, GXColor color3) {
	CameraEntry* camera;
	Mtx mtx2;

	btlDispTexPlaneInit();
	PSMTXCopy(mtx, mtx2);
	camera = camGetCurPtr();
	PSMTXConcat(camera->view, mtx2, mtx2);
	GXLoadPosMtxImm(mtx2, 0);
	btlDispTexPlainGX(id, color0, color1, color2, color3);
}

void btlDispGetTexSize(u32 id, u16* width, u16* height) {
	GXTexObj texobj;

	TEXGetGXTexObjFromPalette(*_battleWorkPointer->menuTex->data, &texobj, id);
	*width = GXGetTexObjWidth(&texobj);
	*height = GXGetTexObjHeight(&texobj);
}

void btlDispInit(void) {
	BattleWork* wp = _battleWorkPointer;
	battleCameraInit();
	battleMenuDispInit();
	wp->mIconFlags |= 2;
}

StatusEffectType _GetStatusPoseType(BattleWorkUnit* unit) { //TODO: extsb
	s32* table = _status_pose_table;
	StatusEffectType type;

	if (unit->mAttributeFlags & 0x20000) {
		return kStatusInstantKill;
	}
	while (1) {
		type = *table;
		if (*table == -1) break;
		if (BtlUnit_CheckStatus(unit, type)) {
			return type;
		}
		table++;
	}
	return kStatusInvalid;
}

void btlDispMain(void) {
	BattleWorkUnit* unit;
	int i;

	for (i = 0; i < 0x40; i++) {
		unit = BattleGetUnitPtr(_battleWorkPointer, i);
		if (unit) {
			if (unit->currentKind == kUnitShellShield) {

			}
		}
	}
}

void btlUnitPartsDisp(CameraId cameraId, BattleWorkUnitPart* parts) {

}








void btlDispEntAnime(BattleWorkUnit* unit) {

}
void _partsBlurControl(BattleWorkUnitPart* part, s32 flags, Mtx orientation, GXColor color, f32 rotation);

void btlUnitPartsBlurControl(BattleWorkUnitPart* part, s32 unused, Mtx orientation, GXColor color, f32 rotation) {

	if (part->attributes & 0x4000000) {
		_partsBlurControl(part, 1, orientation, color, rotation);
	}
	else {
		_partsBlurControl(part, 0, orientation, color, rotation);
	}
}

//TODO: probably needs Entry* pointer to make offsets relative and then it should match
void _partsBlurControl(BattleWorkUnitPart* part, s32 flags, Mtx orientation, GXColor color, f32 rotation) {
	BattleWorkUnitPartBlur* blur;
	int i;

	i = 9;
	blur = &part->blurWork;
	do { //shift all slots forward one
		blur->work[i] = blur->work[i - 1];
	} while (--i > 0);
	blur->work[0].flags = flags;
	MTXCopy(orientation, blur->work[0].orientation);
	blur->work[0].rotation = rotation;
	blur->work[0].base = color;
	*blur->work[0].blurColor = *blur->color;
	*&blur->work[0].blurColor[4] = *&blur->color[4];
	if (blur->flags & 1 && blur->work[1].flags & 1) {
		blur->work[0].flags &= ~1;
	}
}