#pragma once

#include <dolphin/gx.h>

typedef struct TPLPaletteHeader {
    u16 entryCount;
    u8 unpacked;
    u8 align;
    GXTlutFmt format;
    union {
        u32 dataOffset;
        void* data;
    };
} TPLPaletteHeader;

typedef struct TPLImageHeader {
    u16 height;
    u16 width;
    GXTexFmt format;
    union {
        u32 dataOffset;
        void* data;
    };
    GXTexWrapMode wrapS;
    GXTexWrapMode wrapT;
    GXTexFilter minFilter;
    GXTexFilter magFilter;
    float LODBias;
    u8 edgeLODEnable;
    u8 minLOD;
    u8 maxLOD;
    u8 unpacked;
} TPLImageHeader;

typedef struct TPLImageEntry {
    union {
        u32 imageOffset;
        TPLImageHeader* image;
    };
    union {
        u32 paletteOffset;
        TPLPaletteHeader* palette;
    };
} TPLImageEntry;

typedef struct TPLHeader {
    u32 version; // 0x0020AF30
    u32 imageCount;
    union {
        u32 imageTableOffset;
        TPLImageEntry* imageTable;
    };
} TPLHeader;

void TEXGetGXTexObjFromPalette(TPLHeader* header, GXTexObj* obj, u32 id);
TPLImageEntry* TEXGet(TPLHeader* header, u32 id);
void UnpackTexPalette(TPLHeader* header);