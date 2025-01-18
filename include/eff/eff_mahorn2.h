#pragma once

#include <dolphin/mtx.h>
#include "driver/effdrv.h"

typedef struct effMahorn2Data {
    BOOL unused; //0x0
    Vec position; //0x4
    Vec target; //0x10
    f32 scale; //0x1C
    f32 hitDistance; //0x20, how big the hitbox is around the target
    s32 alpha; //0x24
    s32 intplStep; //0x28, interpolation step for scaling
    s32 type; //0x2C, what type of entity is it (inside this effect)
    BOOL unused2; //0x30
    s32 counter; //0x34
    BOOL hasHit; //0x38, have we hit the target yet?
} effMahorn2Data;

EffectEntry* effMahorn2Entry(BOOL unused, f32 posX, f32 posY, f32 posZ, f32 dstX, f32 dstY, f32 dstZ, f32 scale, f32 radius);
