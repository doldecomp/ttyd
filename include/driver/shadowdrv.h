#pragma once

#include <dolphin/gx.h>
#include "memory.h"

typedef struct DepthShadowWork {
    s32 unk0; //0x0
    s32 unk4; //0x4
    s32 unk8; //0x8
    u8 unkC[0x100 - 0xC]; //0xC
    GXColor unk100; //0x100
} DepthShadowWork;

typedef struct ProjShadowWork {
    s32 unk0; //0x0
    s32 unk4; //0x4
    s32 unk8; //0x8
    u8 unkC[0x100 - 0xC]; //0xC
    GXColor unk100; //0x100
} ProjShadowWork;

typedef struct ShadowEntry {
    u8 unk0[0x5C - 0x0]; //0x0
} ShadowEntry;

typedef struct CharShadowWork {
    s32 unk0; //0x0
    s32 unk4; //0x4
    s32 unk8; //0x8
    u8 field_0xC[0xFC - 0xC]; //0xC
    smartEntry* unkFC; //0xFC
    GXColor unk100; //0x100
    s32 unk104; //0x104
    ShadowEntry* entries; //0x108
    s32 unk10C; //0x10C
    s32 unk110; //0x110
    f32 unk114; //0x114
    s32 unk118; //0x118
} CharShadowWork;

void shadowInit(void);
void shadowMain(void);