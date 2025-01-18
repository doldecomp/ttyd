#pragma once

#include <dolphin/gx.h>

typedef struct romFontWork {
	void* unk0; //0x0
	u32 unk4; //0x4
	u32 language; //0x8, TODO different name? 0 = SJIS, 1 = ASCII
} romFontWork;

const char* romFontGetMessage(s32 msg);
void romFontInit(void);


void romFontPrintGX(f32 x, f32 y, f32 scale, GXColor color, const char* msg, ...);
s32 romFontGetWidth(const char* message);
