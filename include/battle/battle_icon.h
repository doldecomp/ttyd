#pragma once

#include <dolphin/types.h>
#include "driver/icondrv.h"

typedef struct BattleWorkIcon {
	s16 flags; //0x0
	s16 iconId; //0x2
	s32 index; //0x4, TODO: rename?
	Vec position; //0x8
	f32 field_0x14; //0x14, prob X, TODO
	f32 field_0x18; //0x18
	IconEntry* base; //0x1C
	u8 field_0x20[0x4C - 0x20]; //0x20
	f32 fallAccel; //0x4C
	u8 field_0x50[0x9C - 0x50]; //0x50
} BattleWorkIcon;

void BattleIconInit(void);
void BattleIconMain(void);
void BattleIconEnd(void);
BattleWorkIcon* BtlIcon_Entry(s16 iconId, f32 x, f32 y, f32 z);
void BtlIcon_Delete(BattleWorkIcon* icon);
