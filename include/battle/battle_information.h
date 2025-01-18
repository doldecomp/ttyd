#pragma once

#include <dolphin/types.h>
#include "battle/battle_unit.h"
#include "driver/npcdrv.h"

typedef struct FieldBattleInfo {
	u32 mode; //0x0, unused
	BattleUnitType party; //0x4
	u32 partyId; //0x8
	NpcBattleInfo* setup; //0xC
	u32 result; //0x10
	u8 field_0x14[0x1C - 0x14]; //0x14
} FieldBattleInfo;

void BattleInformationSetMode(FieldBattleInfo* info, u32 mode);
void BattleInformationSetParty(FieldBattleInfo* info, BattleUnitType party);
void BattleInformationSetFirstAttack(FieldBattleInfo* info, u32 partyId);
void BattleInformationInit(FieldBattleInfo* info);
void BattleInfomationSetBattleSetupInfo(FieldBattleInfo* info, NpcBattleInfo* setup);
void BattleInformationSetResult(FieldBattleInfo* info, u32 result);
u32 BattleInformationGetResult(FieldBattleInfo* info);
