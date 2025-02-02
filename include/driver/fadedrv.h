#pragma once

#include "driver/imgdrv.h"
#include "sdk/texPalette.h"
#include <dolphin/gx.h>
#include <dolphin/mtx.h>

typedef void (*OffscreenCallback)(void* param, void* unused);

typedef enum FadeType {
	FADE_IN_BLACK = 9,
	FADE_OUT_BLACK = 10,






	FADE_OUT_WHITE = 17,
	FADE_IN_WHITE2 = 18,





	TITLE_SCREEN_CURTAIN_LEAVE_GRADUAL2 = 39
} FadeType;

typedef struct FadeEntry {
	u16 flags; //0x0, 4 = use virtual pos
	u8 pad_2[2]; //0x2
	FadeType type; //0x4
	s32 field_0x8; //0x8
	u8 field_0xC[0x10 - 0xC]; //0xC
	s32 field_0x10; //0x10
	s32 field_0x14; //0x14
	GXColor color; //0x18
	f32 fadeSpotX; //0x1C
	f32 fadeSpotY; //0x20
	f32 field_0x24; //0x24
	f32 field_0x28; //0x28
	u8 field_0x2C[0x5C - 0x2C]; //0x2C
	f32 field_0x5C; //0x5C
	const char* field_0x60; //0x60
	const char* field_0x64; //0x64
	s32 imageType; //0x68
	s32 field_0x6C; //0x6C
	s32 field_0x70; //0x70
	u8 field_0x74[0x78 - 0x74]; //0x74
	f32 animOffsetX; //0x78
	f32 animOffsetY; //0x7C
	Vec VirtualPos; //0x80
	ImageEntry* image; //0x8C
	f32 field_0x90; //0x90
	u8 field_0x94[0x98 - 0x94]; //0x94
	OffscreenCallback callback; //0x9C
	void* offparam; //0xA0
	u32 field_0xA4; //0xA4
} FadeEntry;

typedef struct FadeWork {
	u16 flags; //0x0
	u8 pad_2[2]; //0x2
	u32 field_0x4; //0x4
	FadeEntry entries[5]; //0x8
	s32 field_0x350; //0x350
	f32 field_0x354; //0x354, softness? fadeTecSoftOn
	TEXPalette* texture; //0x358
	BOOL loaded; //0x35C
} FadeWork;

void fadeInit(void);
void fadeTexSetup(void);
void fadeEntry(s32 type, s32 duration, GXColor color);
void fadeTecOn(void);
void fadeTecOff(void);
void fadeTecSoftOn(void);
void fadeTecSoftOff(void);
void fadeSoftFocusOn(void);
void fadeSoftFocusOff(void);
void fadeWhiteOutOn(void);
void fadeWhiteOutOff(void);
void fadeSetSpotPos(f32 x, f32 y);
void fadeSetAnimOfsPos(f32 x, f32 y);
void fadeSetOffscreenCallback(OffscreenCallback callback, void* param);
void fadeMain(void);
BOOL fadeIsFinish(void);
void fadeReset(s32 id);
TEXPalette* fadeGetTpl(void);
void fadeSetNarrowFast(void);
