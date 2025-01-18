#pragma once

#include <dolphin/types.h>

typedef enum BattleWeaponSpecialFlags {
	SPECIAL_UNGUARDABLE = 0x20000
} BattleWeaponSpecialFlags;

typedef struct BattleWeapon {
	u8 field_0x0[0x18 - 0x0]; //0x0
	s8 mStylishCommandMultiplier; //0x18
	s8 field_0x19; //0x19
	s8 mBingoSlotChance; //0x1A
	s8 field_0x1B; //0x1B
	u8 field_0x1C[0x74 - 0x1C]; //0x1C
	BattleWeaponSpecialFlags special; //0x74
	u8 field_0x78[0xB0 - 0x78]; //0x78
	void* mAttackEvtScript; //0xB0
	u8 field_0xB4[0xC0 - 0xB4]; //0xB4
} BattleWeapon;