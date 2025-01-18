#pragma once

#include <dolphin/mtx.h>
#include "driver/effdrv.h"

typedef struct EffUltraHammerData {
    BOOL unk0; //0x0, doesn't actually get read
    Vec position; //0x4
    f32 scale; //0x10
    f32 offsetX; //0x14
    f32 offsetY; //0x18
    s32 alpha; //0x1C
    s32 counter; //0x20, 1000 ticks until effect is destroyed
    s32 scroll; //0x24, controls scroll data
    s32 update; //0x28, how long until scroll updates
} EffUltraHammerData;

EffectEntry* effUltraHammerEntry(BOOL arg0, s32 counter, f32 x, f32 y, f32 z, f32 scale);
