#pragma once

#include "driver/effdrv.h"
#include <dolphin/mtx.h>
#include <dolphin/os.h>

typedef struct ItemEntry {
	u16 flags; //0x0
	u16 field_0x2; //0x2
	s32 itemId; //0x4
	s32 evtId; //0x8, TODO: better name?
	char name[0x10]; //0xC
	EffectEntry* effect; //0x1C
	u8 field_0x20[0x24 - 0x20]; //0x20
	u16 mode; //0x24
	u16 field_0x26; //0x26
	u8 field_0x28[0x3C - 0x28]; //0x28
	Vec position; //0x3C
	f32 scale; //0x48
	u8 alpha; //0x4C, TODO: "icon_alpha"?
	u8 field_0x4D[0x68 - 0x4D]; //0x4D
	OSTime field_0x68; //0x68
	u8 field_0x70[0x98 - 0x70]; //0x70
} ItemEntry;

typedef struct ItemWork {
	s32 count; //0x0
	ItemEntry* entries; //0x4
	u32 currId; //0x8, next available itemId
	u8 field_0xC[0x1C - 0xC]; //0xC
} ItemWork;

void itemInit(void);
void itemReInit(void);

void itemMain(void);
