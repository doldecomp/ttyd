#pragma once

#include <dolphin/types.h>

typedef struct OffscreenEntry {
	s32 flags; //0x0
	char name[4]; //0x4, TODO get full size
	u8 field_0x8[0x14 - 0x8]; //0x8
	u16 currLeft; //0x14
	u16 currTop; //0x16
	u16 currRight; //0x18
	u16 currBottom; //0x1A
	u8 field_0x1C[0x3C - 0x1C]; //0x1C
	s32 field_0x3C; //0x3C
	s32 field_0x40; //0x40
	u8 field_0x44[0x48 - 0x44]; //0x44
	u16 prevLeft; //0x48
	u16 prevTop; //0x4A
	u16 prevRight; //0x4C
	u16 prevBottom; //0x4E
} OffscreenEntry;

typedef struct OffscreenWork {
	s32 count; //0x0
	OffscreenEntry* entries; //0x4
} OffscreenWork;

void offscreenInit(void);
void offscreenReset(BOOL inBattle);
s32 offscreenEntry(const char* name);
void offscreenMain(void);
void offscreenAddBoundingBox(s32 id, u16 left, u16 top, u16 right, u16 bottom);




