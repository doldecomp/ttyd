#pragma once

#include <dolphin/gx.h>

typedef struct RomFontChar {
    /* 0x000 */ u8 texel[0x120]; // I4 glyph cell (24x24 @ 4bpp = 288 bytes)
    /* 0x120 */ u16 code;        // character code
    /* 0x122 */ s16 width;       // glyph advance width
    /* 0x124 */ u8 pad[0x1C];    // pad to 0x140 so each texel stays 32-byte (GX) aligned
} RomFontChar;                   // sizeof == 0x140

typedef struct RomFontWork {
    RomFontChar* unk0; // 0x0
    s32 uniqueChars;   // 0x4
    s32 language;      // 0x8, 0 = SJIS, 1 = ASCII
} RomFontWork;

const char* romFontGetMessage(s32 msg);
void romFontInit(void);

void romFontPrintGX(f32 x, f32 y, f32 scale, GXColor* color, const char* msg, ...);
s32 romFontGetWidth(const char* message);
