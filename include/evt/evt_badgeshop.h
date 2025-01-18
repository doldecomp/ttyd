#pragma once

#include <dolphin/types.h>
#include "evt/evt_cmd.h"

typedef struct BadgeShopWork {
	u8 special_table[0x19]; //0x0, Lovely Howz of Badges
	u8 bargain_table[0x19]; //0x19, Lovely Howz of Badges Discount
	u8 starmaniac_table[0x19]; //0x32, Dazzle's Badges
	u8 bottakuru_table[0x55]; //0x4B, Charlieton's Items
	u8 bteresa_table[0x55]; //0xA0, Pianta Parlor
	u8 align[3];
	s32 field_0xF8[5]; //0xF8
	s32 field_0x10C; //0x10C
	u32 field_0x110; //0x110
	u16 field_0x114; //0x114
	u16 field_0x116; //0x116
	u32 field_0x118; //0x118
	u32 field_0x11C; //0x11C
	u32 field_0x120; //0x120
} BadgeShopWork;

s32 getBadgeBottakuru100TableMaxCount(void); //Charlieton Pit of 100 Trials
s32 getBadgeStarmaniacTableMaxCount(void); //Dazzle
s32 getBadgeBteresaTableMaxCount(void); //Pianta Parlor
void badgeShop_init(void);
void badgeShop_bottakuruGeneration(void);
void badgeShop_bteresaGeneration(void);
void badgeShop_bargainGeneration(void);
s32 badgeShop_set(u8* table, s16 id, s16 val);
s32 badgeShop_get(u8* table, s16 id);
s32 badgeShop_add(u8* table, s32 id, s32 val);
USERFUNC_DEF(badgeShop_getBargainTable);
USERFUNC_DEF(evt_badgeShop_throw_inc);
USERFUNC_DEF(evt_badgeShop_throw_dec);
USERFUNC_DEF(evt_badgeShop_special_dec);
USERFUNC_DEF(evt_badgeShop_starmaniac_dec);
USERFUNC_DEF(evt_badgeShop_bottakuru_dec);
USERFUNC_DEF(evt_badgeShop_throw_get_kind_cnt);
USERFUNC_DEF(evt_badgeShop_starmaniac_get_kind_cnt);
USERFUNC_DEF(evt_badgeShop_bottakuru_get_kind_cnt);
USERFUNC_DEF(evt_badgeShop_get_special_zaiko); //TODO: unknown name
USERFUNC_DEF(evt_badgeShop_bteresa_get_kind_cnt);
s32 badgeShop_ThrowCheck(s32 itemId);
s32 badgeShop_SpecialCheck(void);

