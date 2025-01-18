#pragma once

#include <dolphin/types.h>
#include "battle/battle_database_common.h"

typedef struct ItemData {
	const char* id; //0x0, japanese name of the item
	const char* name; //0x4
	const char* description; //0x8
	const char* menu_description; //0xC
	s16 usable_locations; //0x10
	s16 type_sort_order; //0x12
	s16 buy_price; //0x14
	s16 discount_price; //0x16
	s16 star_piece_price; //0x18
	s16 sell_price; //0x1A
	s8 bp_cost; //0x1C
	s8 hp_restored; //0x1D
	s8 fp_restored; //0x1E
	s8 sp_restored; //0x1F
	s16 icon_id; //0x20
	s16 field_0x22; //0x22
	BattleWeapon* battle_params; //0x24
} ItemData;