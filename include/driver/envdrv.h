#pragma once

#include <dolphin/gx.h>
#include "memory.h"

typedef struct EnvironmentGlareTexCoord {
    f32 unk0; //0x0
    f32 unk4; //0x4
} EnvironmentGlareTexCoord;

typedef struct EnvironmentGlare {
    GXBlendMode mode; //0x0
    GXBlendFactor srcFactor; //0x4
    GXBlendFactor dstFactor; //0x8
    GXTevKColorSel unkC; //0xC
    GXTevKColorSel unk10; //0x10
    f32 unk14; //0x14
    s32 count; //0x18, number of coords that follors
    EnvironmentGlareTexCoord coords[]; //0x1C
} EnvironmentGlare;

typedef struct EnvironmentGlareFilter {
    u16 flags; //0x0
    u16 type; //0x2
    u16 y0; //0x4
    u16 y1; //0x6
    u16 x0; //0x8
    u16 x1; //0xA
    f32 zscale; //0xC
} EnvironmentGlareFilter;

typedef struct EnvironmentUnk88 {
    u16 unk0; //0x0
    u8 unk2; //0x2
    u8 unk3; //0x3
    f32 unk4; //0x4
    f32 unk8; //0x8
} EnvironmentUnk88;

typedef struct EnvironmentWork {
    s32 flags; //0x0
    smartEntry* capture; //0x4
    smartEntry* capture2; //0x8
    GXTexObj captureObj; //0xC
    GXTexObj captureObj2; //0x2C
    void* envBlur; //0x4C, see envBlurOn
    GXTexObj envBlurObj; //0x50
    u8 unk70[0x88 - 0x70]; //0x70
    EnvironmentUnk88 unk88; //0x88
    u8 unk94[0x98 - 0x94]; //0x94
    u16 unk98; //0x98, some substruct
    u8 unk9A[0xB0 - 0x9A]; //0x9A
    EnvironmentGlareFilter filter; //0xB0
    u8 unkC0[0xF0 - 0xC0]; //0xC0
} EnvironmentWork;

void envInit(void);
void envReInit(void);
void envTexSetup(void);
void envMain(void);
//envBlurOn
//envBlurOff
void envGlare(EnvironmentGlare* glare);


