#pragma once

#include <dolphin/types.h>

typedef struct MotionPlaneData {
	s32 flags; //0x0
	u8 field_0x4[0x28 - 0x4]; //0x4
	s32 field_0x28; //0x28, some sfxId
	u8 field_0x2C[0x48 - 0x2C]; //0x2C
} MotionPlaneData;

void flyMain(void);