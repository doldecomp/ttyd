#pragma once

#include <dolphin/types.h>

typedef struct ExtWork {
	s32 poseNum; //0x0, TODO: poseId
	u8 field_0x4[4]; //0x4
	s32 field_0x8; //0x8
	u8 field_0xC[0x70 - 0xC]; //0xC
} ExtWork;

void extInit(void);
void extMain(void);