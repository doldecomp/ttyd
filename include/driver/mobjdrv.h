#pragma once

#include "dolphin/gx/GXStruct.h"
#include "driver/hitdrv.h"
#include <dolphin/types.h>
#include <dolphin/mtx.h>

typedef struct MapObjectHitEntry {
    HitObj* hitObject;    // 0x0
    char name[16];        // 0x4
    u8 unk4[0x88 - 0x14]; // 0x14
} MapObjectHitEntry;

typedef struct MapObjectEntry {
    s32 flags;                   // 0x0
    u8 camId;                    // 0x4
    char name[16];               // 0x5
    char animName[16];           // 0x15
    u8 unk4[0x38 - 0x25];        // 0x25
    Vec position;                // 0x38
    Vec scale;                   // 0x44
    Vec rotation;                // 0x50
    Vec unk5C;                   // 0x5C
    f32 unk68;                   // 0x68
    f32 unk6C;                   // 0x6C
    s32 poseId;                  // 0x70
    MapObjectHitEntry hitObj[2]; // 0x74
    Vec scale2;                  // 0x184
    u8 unk190[0x19C - 0x190];    // 0x190
    s32 offscreenId;             // 0x19C
    u8 unk1A0[0x1CC - 0x1A0];    // 0x1A0
    s32 eventId;                 // 0x1CC
    u8 unk1A4[0x1DC - 0x1D0];    // 0x1D0
    s32 unk1DC;                  // 0x1DC
    u8 unk1E0[0x1E8 - 0x1E0];    // 0x1E0
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
