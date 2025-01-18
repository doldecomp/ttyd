#pragma once

#include <dolphin/gx.h>
#include <dolphin/os.h>

typedef enum BackgroundFlags {
	BG_RENDERING = (1 << 0),
	BG_DO_MULTIPLY = (1 << 1),
	BG_NO_AUTOSCROLL = (1 << 2),
	BG_NO_TRANSLATION = (1 << 3)
} BackgroundFlags;

typedef struct BackgroundWork {
	u16 flags; //0x0
	u8 align2[2]; //0x2
	f32 trans_x; //0x4
	f32 trans_y; //0x8
	f32 scrl_x; //0xC
	f32 scrl_y; //0x10
	GXColor color; //0x14
	GXColor multiply; //0x18, see BG_DO_MULTIPLY
	void* data; //0x1C
} BackgroundWork;

void bgInit(void);
void bgReInit(void);
void bgEntry(const char* filename);
void bgReEntry(const char* filename);
void bgSetColor(GXColor color);
void bgDispOn(void);
void bgDispOff(void);
void bgSetScrlOffset(f32 x, f32 y);
void bgAutoScrollOff(void);
void bgAutoScrollOn(void);
void bgTransOffsetOff(void);
void bgTransOffsetOn(void);
void bgMain(void);
