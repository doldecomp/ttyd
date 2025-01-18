#pragma once

#include <dolphin/types.h>
#include "texPalette.h"

typedef struct eff_n64_work {
	TPLHeader* effTexture; //0x0
	BOOL effTextureLoaded; //0x4
} eff_n64_work;

#pragma warn_padding off
typedef struct eff_set {
	s16 id; //0x0
	//will pad to 2 bytes
	char* name; //0x4
} eff_set;
#pragma warn_padding on

typedef struct effVtxArray {
	s16 pos[3]; //0x0, XYZ
	s16 tex0[2]; //0x6, ST
	u8 clr0[3][0xE]; //0xA, RGBA8
	u32 unk; //0x34
} effVtxArray;

void effInit64(void);
void effTexSetupN64(void);
void effGetTexObjN64(u32 id, GXTexObj* obj);
eff_set* effGetSetN64(const char* name);
u32 effTblRandN64(u32 rand, s32 index);
void effSetVtxDescN64(effVtxArray* array);
void tri1(u16 x, u16 y, u16 z);