#pragma once

#include "mario/mario_pouch.h"
#include <dolphin/types.h>

typedef struct BattleAudienceItemKind {
	ItemType type; //0x0
	s32 chance; //0x4
} BattleAudienceItemKind;

/* seems unused, just static table size
typedef struct BattleAudienceAnimTable {
    s32* animWaitFront; //0x0
    s32* animWaitBack; //0x4
    s32* animJumpFront; //0x8
    s32* animJumpBack; //0xC
    s32* animRaiseBack; //0x10
    s32* animItemOnBack; //0x14
    s32* animItemThrowBack; //0x18
    s32* animRunFront; //0x1C
    s32* animTumbleFront; //0x20
    s32* animDamageFront; //0x24
    s32* animSleepFront; //0x28
    s32* animSleepBack; //0x2C
    s32* animConfuseFront; //0x30
    s32* animConfuseBack; //0x34
    s32* animSingFront; //0x38, for Crazy Dayzees
    s32* animShellBack; //0x3C, for Koopas
    s32* animIgniteFront; //0x40, for Bulky Bob-Ombs
    s32* animIgniteBack; //0x44, for Bulky Bob-Ombs
    s32* animEatFront; //0x48, for Piranha Plants
} BattleAudienceAnimTable;*/

#pragma warn_padding off
typedef struct BattleAudienceKind {
	u8 field_0x0; //0x0, some flag in BattleAudienceSettingAudience
	//pad 3 bytes
    s32** animTable; //0x4
	BattleAudienceItemKind* itemTable; //0x8
	f32 field_0xC; //0xC, offsetX?
	f32 field_0x10; //0x10, offsetY?
	f32 field_0x14; //0x14, itemChance?
	f32 field_0x18; //0x18, scaleX?
	f32 field_0x1C; //0x1C, scaleY?
} BattleAudienceKind;
#pragma warn_padding on
