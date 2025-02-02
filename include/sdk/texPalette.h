#pragma once

#include <dolphin/gx.h>

typedef struct CLUTHeader {
    // total size: 0xC
    u16 numEntries;   // offset 0x0, size 0x2
    u8 unpacked;      // offset 0x2, size 0x1
    u8 pad8;          // offset 0x3, size 0x1
    GXTlutFmt format; // offset 0x4, size 0x4
    char* data;       // offset 0x8, size 0x4
} CLUTHeader;

typedef struct TEXHeader {
    // total size: 0x24
    u16 height;            // offset 0x0, size 0x2
    u16 width;             // offset 0x2, size 0x2
    u32 format;            // offset 0x4, size 0x4
    char* data;            // offset 0x8, size 0x4
    GXTexWrapMode wrapS;   // offset 0xC, size 0x4
    GXTexWrapMode wrapT;   // offset 0x10, size 0x4
    GXTexFilter minFilter; // offset 0x14, size 0x4
    GXTexFilter magFilter; // offset 0x18, size 0x4
    float LODBias;         // offset 0x1C, size 0x4
    u8 edgeLODEnable;      // offset 0x20, size 0x1
    u8 minLOD;             // offset 0x21, size 0x1
    u8 maxLOD;             // offset 0x22, size 0x1
    u8 unpacked;           // offset 0x23, size 0x1
} TEXHeader;

typedef struct TEXDescriptor {
    // total size: 0x8
    TEXHeader* textureHeader; // offset 0x0, size 0x4
    CLUTHeader* CLUTHeader;   // offset 0x4, size 0x4
} TEXDescriptor;

typedef struct TEXPalette {
    // total size: 0xC
    u32 versionNumber; // offset 0x0, size 0x4
    u32 numDescriptors; // offset 0x4, size 0x4
    TEXDescriptor* descriptorArray; // offset 0x8, size 0x4
} TEXPalette;

void UnpackTexPalette(TEXPalette* pal);
TEXDescriptor* TEXGet(TEXPalette* pal, u32 id);
void TEXGetGXTexObjFromPalette(TEXPalette* pal, GXTexObj* to, u32 id);
