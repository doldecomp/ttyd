#pragma once

#include "dolphin/gx/GXStruct.h"
#include "driver/hitdrv.h"
#include <dolphin/types.h>
#include <dolphin/mtx.h>

typedef struct MapObjectHitEntry {
    HitObj* hitObject;   // 0x0
    u8 unk4[0x88 - 0x4]; // 0x4
} MapObjectHitEntry;

typedef struct MapObjectEntry {
    s32 flags;                   // 0x0
    u8 unk4[0x38 - 0x4];         // 0x4
    Vec position;                // 0x38
    Vec scale;                   // 0x44
    Vec rotation;                // 0x50
    u8 unk5C[0x70 - 0x5C];       // 0x5C
    s32 poseId;                  // 0x70
    MapObjectHitEntry hitObj[2]; // 0x74
    Vec scale2;                  // 0x184
    u8 unk190[0x19C - 0x190];    // 0x190
    s32 offscreenId;             // 0x19C
    u8 unk1A0[0x1E8 - 0x1A0];    // 0x1A0
    GXTexObj paperTexObj;        // 0x1E8
    void* unk208;                // 0x208
    Mtx paperTexMtx;             // 0x20C
} MapObjectEntry;

typedef struct MapObjectWork {
    s32 count;                // 0x0
    MapObjectEntry* entries;  // 0x4
    u8 field_0x8[0x1C - 0x8]; // 0x8
} MapObjectWork;

void mobjInit(void);
void mobjMain(void);
