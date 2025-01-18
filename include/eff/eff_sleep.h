#pragma once

#include "driver/effdrv.h"
#include <dolphin/mtx.h>

typedef struct effSleepData {
	s32 field_0x0; //0x0
	Vec position; //0x4
	f32 scale; //0x10
	s32 field_0x14; //0x14
	s32 field_0x18; //0x18, time?
	s32 field_0x1C; //0x1C
	s32 field_0x20; //0x20
} effSleepData;

EffectEntry* effSleepEntry(s32 a1, s32 a2, f32 a3, f32 a4, f32 a5, f32 a6, f32 a7);
void effSleepMain(EffectEntry* effect);
