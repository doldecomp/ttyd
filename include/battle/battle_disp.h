#pragma once

#include <dolphin/mtx.h>
#include "battle/battle_unit.h"

typedef struct BattleDispPose { //for BattleWorkUnitPart
	u32 poseId; //0x0
	const char* poseName; //0x4
} BattleDispPose;

void btlDispGXInit2DRasta(void);
void btlDispGXInit2D(void);
void btlDispGXPoint2DRasta(f32 x, f32 y, u8 r, u8 g, u8 b, u8 a);
void btlDispGXQuads2DRasta(f32 x0, f32 y0, f32 x1, f32 y1, u8 r, u8 g, u8 b, u8 a);
void btlDispGXPoint2D(f32 x, f32 y, u8 r, u8 g, u8 b, u8 a, f32 s, f32 t);
void btlDispGXQuads2D(f32 x0, f32 y0, f32 x1, f32 y1, u8 r, u8 g, u8 b, u8 a);
void btlDispTexPlane(u32 id, GXColor color, f32 tX, f32 tY, f32 tZ, f32 sX, f32 sY);
void btlDispTexPlane2(Mtx mtx, u32 id, GXColor color);
void btlDispTexPlane3(Mtx mtx, u32 id, GXColor color0, GXColor color1, GXColor color2, GXColor color3);
void btlDispInit(void);
StatusEffectType _GetStatusPoseType(BattleWorkUnit* unit);


void btlDispMain(void);




void btlDispEntAnime(BattleWorkUnit* unit);

