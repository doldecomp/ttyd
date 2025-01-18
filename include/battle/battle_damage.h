#pragma once

#include <dolphin/types.h>

typedef struct BattleVulnerableStatus {
	u8 sleepRate; //0x0
	u8 stopRate; //0x1
	u8 dizzyRate; //0x2
	u8 poisonRate; //0x3
	u8 confuseRate; //0x4
	u8 electricRate; //0x5
	u8 burnRate; //0x6
	u8 freezeRate; //0x7
	u8 hugeRate; //0x8
	u8 tinyRate; //0x9
	u8 attackUpRate; //0xA
	u8 attackDownRate; //0xB
	u8 defenseUpRate; //0xC
	u8 defenseDownRate; //0xD
	u8 allergicRate; //0xE
	u8 frightRate; //0xF
	u8 galeForceRate; //0x10
	u8 fastRate; //0x11
	u8 slowRate; //0x12
	u8 dodgyRate; //0x13
	u8 invisibleRate; //0x14
	u8 instaKillRate; //0x15
} BattleVulnerableStatus;

s32 BattleCheckDamage(struct BattleWorkUnit* unit1, struct BattleWorkUnit* unit2, struct BattleWorkUnitPart* part, struct BattleWeapon* weapon, s32 flags);