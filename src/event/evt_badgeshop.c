/* "evt_badgeshop" - Badge Shop Script Functions
 * Status: Complete, not 1:1 (see comments throughout files, mostly
 * regalloc, along with bargainGeneration cleanup
 *
 * Function: part of the backend for various shops
 */
#include "evt/evt_badgeshop.h"
#include "mgr/evtmgr.h"
#include "mario/mario_pouch.h"
#include "system.h"
#include <string.h>

//.data
s32 badge_starmaniac_table[] = { //Dazzle
	kItemAttackFxY, kItemChillOut, kItemPrettyLucky, kItemHappyHeart,
	kItemHappyFlower, kItemHappyHeartP, kItemItemHog, kItemHeartFinder,
	kItemFlowerFinder, kItemPeekaboo, kItemQuickChange, kItemFlowerSaver,
	kItemFlowerSaverP, kItemPowerPlus, kItemPowerPlusP, ITEM_NULL
};

s32 badge_bottakuru_table[] = { //Charlieton Rogueport
	ITEM_SHOOTING_STAR, ITEM_EARTH_QUAKE, ITEM_BOOS_SHEET, ITEM_REPEL_CAPE,
	ITEM_STOPWATCH, ITEM_ULTRA_SHROOM, ITEM_JAMMIN_JELLY, ITEM_DRIED_SHROOM,
	kItemDoublePain, kItemJumpman, kItemHammerman, kItemAttackFxG,
	kItemSlowGo, kItemMegaRush, kItemTimingTutor, kItemWEmblem, ITEM_NULL
};

//.sdata
s32 badge_special_table[] = { //Lovely Howz of Badges
	kItemPiercingBlow, kItemPowerJump, kItemSimplifier, kItemUnsimplifier,
	kItemFpDrain, kItemLastStand, kItemLastStandP, kItemHappyFlower,
	kItemSuperAppeal, ITEM_NULL
};

s32 badge_special_table_stage_1_clear[] = { //Hooktail Castle
	kItemCloseCall, kItemCloseCallP, kItemSleepyStomp, ITEM_NULL
};

s32 badge_special_table_stage_2_clear[] = { //Boggly Tree
	kItemFirstAttack, kItemPrettyLuckyP, kItemPowerRush, ITEM_NULL
};

s32 badge_special_table_stage_3_clear[] = { //Glitz Pit
	kItemShrinkStomp, kItemIceSmash, kItemPowerRushP, ITEM_NULL
};

s32 badge_special_table_stage_4_clear[] = { //Creepy Steeple
	kItemSoftStomp, kItemHeadRattle, kItemDamageDodge, ITEM_NULL
};

s32 badge_special_table_stage_5_clear[] = { //Keelhaul Key
	kItemSuperAppealP, kItemDamageDodgeP, kItemFireDrive, ITEM_NULL
};

s32 badge_special_table_stage_6_clear[] = { //Poshley Heights
	kItemSimplifier, kItemUnsimplifier, kItemAttackFxP, ITEM_NULL
};

s32 badge_bottakuru100_table[] = { //Charlieton Pit of 100 Trials
	ITEM_MUSHROOM, ITEM_SUPER_SHROOM, ITEM_HONEY_SYRUP, ITEM_MAPLE_SYRUP,
	ITEM_FIRE_FLOWER, ITEM_THUNDER_RAGE, ITEM_NULL
};

s32 badge_bteresa_table[] = { //Pianta Parlor
	ITEM_SUPER_SHROOM, kItemCakeMix, kItemSuperAppeal, kItemRefund, ITEM_NULL
};

s32 badge_bteresa_table_card_special[] = { //Pianta Parlor Special Card
	ITEM_MAPLE_SYRUP, kItemPowerJump, kItemHpPlus, kItemFpPlus, ITEM_NULL
};

s32 badge_bteresa_table_card_silver[] = { //Pianta Parlor Silver Card
	kItemGoldBarX3, kItemPowerSmash, kItemHpPlusP, ITEM_NULL
};

s32 badge_bteresa_table_card_gold[] = { //Pianta Parlor Gold Card
	kItemHammerThrow, kItemPowerRush, kItemTornadoJump, kItemMultibounce,
	kItemPowerRushP, ITEM_NULL
};

s32 badge_bteresa_table_card_platinum[] = { //Pianta Parlor Platinum Card
	kItemQuakeHammer, kItemMoneyMoney, ITEM_ULTRA_SHROOM, ITEM_JAMMIN_JELLY, ITEM_NULL
};

//.bss
BadgeShopWork badgeshopwork;

//.sbss
BadgeShopWork* bdsw;

//local prototypes
s32 bottakuruComp(const void** sortA, const void** sortB);

s32 getBadgeBottakuru100TableMaxCount(void) {
	return (sizeof(badge_bottakuru100_table) / sizeof(s32)) - 1;
}

s32 getBadgeStarmaniacTableMaxCount(void) {
	return (sizeof(badge_starmaniac_table) / sizeof(s32)) - 1;
}

s32 getBadgeBteresaTableMaxCount(void) {
	return ((sizeof(badge_bteresa_table) / sizeof(s32)) - 1) +
		((sizeof(badge_bteresa_table_card_special) / sizeof(s32)) - 1) +
		((sizeof(badge_bteresa_table_card_silver) / sizeof(s32)) - 1) +
		((sizeof(badge_bteresa_table_card_gold) / sizeof(s32)) - 1) +
		((sizeof(badge_bteresa_table_card_platinum) / sizeof(s32)) - 1);
}

void badgeShop_init(void) {
	s32* ptr;

	bdsw = &badgeshopwork;
	memset(bdsw->special_table, 0, sizeof(bdsw->special_table));
	memset(bdsw->bargain_table, 0, sizeof(bdsw->bargain_table));
	memset(bdsw->starmaniac_table, 0, sizeof(bdsw->starmaniac_table));
	memset(bdsw->bottakuru_table, 0, sizeof(bdsw->bottakuru_table));
	memset(bdsw->bteresa_table, 0, sizeof(bdsw->bteresa_table));
	bdsw->field_0x114 = 1;

	for (ptr = badge_special_table; *ptr; ++ptr) {
		badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
	}
	for (ptr = badge_starmaniac_table; *ptr; ++ptr) {
		badgeShop_add(bdsw->starmaniac_table, (s16)*ptr, 1);
	}
	for (ptr = badge_bottakuru_table; *ptr; ++ptr) {
		badgeShop_add(bdsw->bottakuru_table, (s16)*ptr, 1);
	}

	badgeShop_bottakuruGeneration();

	for (ptr = badge_bteresa_table; *ptr; ++ptr) {
		badgeShop_add(bdsw->bteresa_table, (s16)*ptr, 1);
	}
}

s32 bottakuruComp(const void** sortA, const void** sortB) {
	s32 a, b;

	a = (s32)sortA[1];
	b = (s32)sortB[1];
	if (a < b) {
		return -1;
	}
	return a > b;
}

void badgeShop_bottakuruGeneration(void) {
	s32 table[0x11][2];
	int i, j, dobreak;

	for (i = 0; i < 0x11; i++) {
		table[i][1] = 200;
		table[i][0] = 0;
	}

	dobreak = 0;
	for (i = 0; i < BADGE_MAX; i++) {
		for (j = 0; j < badgeShop_get(bdsw->bottakuru_table, (s16)(i + 1)); j++) { //inline
			table[i][1] = irand(100);
			table[i][0] = i + 1;
			dobreak += 1;
			if (dobreak >= 0x10) break;
		}
		if (dobreak >= 0x10) break;
	}

	qqsort(table, 0x11, 8, bottakuruComp);

	for (i = 0; i < 4; i++) { //only 4 slots
		for (j = 0; j < 0x11; j++) {
			if (table[i][0] == badge_bottakuru_table[j]) {
				evtSetValue(NULL, i + GSW(118), j);
			}
		}
	}
}

void badgeShop_bteresaGeneration(void) {
	s32* ptr;

	if (pouchCheckItem(kItemSpecialCard)) {
		if (!evtGetValue(NULL, GSWF(246))) {
			evtSetValue(NULL, GSWF(246), 1);
			for (ptr = badge_bteresa_table_card_special; *ptr; ptr++) {
				badgeShop_add(bdsw->bteresa_table, (s16)*ptr, 1);
			}
		}
	}

	if (pouchCheckItem(kItemSilverCard)) {
		if (!evtGetValue(NULL, GSWF(247))) {
			evtSetValue(NULL, GSWF(247), 1);
			for (ptr = badge_bteresa_table_card_silver; *ptr; ptr++) {
				badgeShop_add(bdsw->bteresa_table, (s16)*ptr, 1);
			}
		}
	}

	if (pouchCheckItem(kItemGoldCard)) {
		if (!evtGetValue(NULL, GSWF(248))) {
			evtSetValue(NULL, GSWF(248), 1);
			for (ptr = badge_bteresa_table_card_gold; *ptr; ptr++) {
				badgeShop_add(bdsw->bteresa_table, (s16)*ptr, 1);
			}
		}
	}

	if (pouchCheckItem(kItemPlatinumCard)) {
		if (!evtGetValue(NULL, GSWF(249))) {
			evtSetValue(NULL, GSWF(249), 1);
			for (ptr = badge_bteresa_table_card_platinum; *ptr; ptr++) {
				badgeShop_add(bdsw->bteresa_table, (s16)*ptr, 1);
			}
		}
	}
}

void badgeShop_bargainGeneration(void) { //finished, needs cleanup and probably fixes
	s32* ptr;
	u8 table[0x19];
	int i;
	s32 badge, value;
	s32 count, count2, count3, count4, stopcount; //TODO: rename
	s32 v28, v7; //TODO: rename

	if (evtGetValue(NULL, GSW(0)) >= 55 && !evtGetValue(0, GSWF(238))) {
		evtSetValue(NULL, GSWF(238), 1);
		for (ptr = badge_special_table_stage_1_clear; *ptr; ptr++) {
			badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
		}
	}

	if (evtGetValue(NULL, GSW(0)) >= 112 && !evtGetValue(0, GSWF(239))) {
		evtSetValue(NULL, GSWF(239), 1);
		for (ptr = badge_special_table_stage_2_clear; *ptr; ptr++) {
			badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
		}
	}

	if (evtGetValue(NULL, GSW(0)) >= 164 && !evtGetValue(0, GSWF(240))) {
		evtSetValue(NULL, GSWF(240), 1);
		for (ptr = badge_special_table_stage_3_clear; *ptr; ptr++) {
			badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
		}
	}

	if (evtGetValue(NULL, GSW(0)) >= 212 && !evtGetValue(0, GSWF(241))) {
		evtSetValue(NULL, GSWF(241), 1);
		for (ptr = badge_special_table_stage_4_clear; *ptr; ptr++) {
			badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
		}
	}

	if (evtGetValue(NULL, GSW(0)) >= 253 && !evtGetValue(0, GSWF(242))) {
		evtSetValue(NULL, GSWF(242), 1);
		for (ptr = badge_special_table_stage_5_clear; *ptr; ptr++) {
			badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
		}
	}

	if (evtGetValue(NULL, GSW(0)) >= 338 && !evtGetValue(0, GSWF(243))) {
		evtSetValue(NULL, GSWF(243), 1);
		for (ptr = badge_special_table_stage_6_clear; *ptr; ptr++) {
			badgeShop_add(bdsw->special_table, (s16)*ptr, 1);
		}
	}

	if (evtGetValue(NULL, GSW(0)) >= 373 && !evtGetValue(0, GSWF(244))) {
		evtSetValue(NULL, GSWF(244), 1);
	}

	if (evtGetValue(NULL, GSW(0)) >= 401 && !evtGetValue(0, GSWF(245))) {
		evtSetValue(NULL, GSWF(245), 1);
	}

	memset(table, 0, sizeof(table));
	bdsw->field_0xF8[0] = ITEM_NULL;
	bdsw->field_0xF8[1] = ITEM_NULL;
	bdsw->field_0xF8[2] = ITEM_NULL;
	bdsw->field_0xF8[3] = ITEM_NULL;
	bdsw->field_0xF8[4] = ITEM_NULL;
	bdsw->field_0x10C = 0;
	bdsw->field_0x110 = 0;

	v7 = 0;
	count = 0;
	count2 = 0;
	for (i = 0; i < 99; i++) {
		value = 0;
		badge = badgeShop_get(bdsw->special_table, (s16)(i + BADGE_MIN)); //inline
		if (badge) {
			count++;
			value = 1;
		}
		if (value) {
			badgeShop_set(table, (s16)(i + BADGE_MIN), (s16)value);
			count2++;
		}
	}
	count3 = 5;
	if (count2 <= 5) {
		count3 = count2; //less than 5 needed
	}
	irand(0x100); //unused
	while (1) {
		v28 = bdsw->field_0x10C;
		if (v28 + bdsw->field_0x110 >= count3) {
			break;
		}
		if (v28 < 3 || !v7) {
			stopcount = irand(count);
			count4 = 0;
			for (i = 0; i < 99; i++) {
				badge = badgeShop_get(table, (s16)(i + BADGE_MIN)); //inline
				if (badge & 1) {
					if (count4 == stopcount) {
						break;
					}
					count4++;
				}
			}
			if (i < 99) {
				bdsw->field_0xF8[bdsw->field_0x10C++] = i + BADGE_MIN;
				badgeShop_set(table, (s16)(i + BADGE_MIN), 0);
				if (badge & 1) {
					count--;
				}
				if (badge & 2) {
					v7--;
				}
			}
		}
	}
	for (i = 0; i < sizeof(bdsw->special_table); i++) {
		bdsw->bargain_table[i] = bdsw->special_table[i];
	}
	for (i = 0; i < 5; i++) {
		badge = bdsw->field_0xF8[i];
		if (badge) {
			badgeShop_add(bdsw->bargain_table, (s16)badge, -1);
		}
	}
}

s32 badgeShop_set(u8* table, s16 id, s16 val) { //TODO: regalloc, otherwise 1:1
	s32 bound;
	s16 index;
	u8 mask;
	s32 shift;

	if (table == bdsw->bottakuru_table || table == bdsw->bteresa_table) {
		bound = KEY_ITEM_MIN;
	}
	else {
		bound = BADGE_MIN;
	}
	if (id < bound || id >= BADGE_MAX + 1) return 0;
	index = (s16)(id - bound);
	switch (index & 3) {
		case 0:
			mask = (u8)~(3 << 0);
			shift = 0;
			break;
		case 1:
			mask = (u8)~(3 << 2);
			shift = 2;
			break;
		case 2:
			mask = (u8)~(3 << 4);
			shift = 4;
			break;
		case 3:
			mask = (u8)~(3 << 6);
			shift = 6;
			break;
	}
	bound = index / 4;
	if (val < 0) {
		val = 0;
	}
	if (val > 3) {
		val = 3;
	}
	table[bound] = (u8)((u8)(mask & table[bound]) + (u8)(val << shift));
	return val;
}

s32 badgeShop_get(u8* table, s16 id) { //1:1
	s32 bound;
	s16 index;
	u8 mask;
	s32 shift;

	if (table == bdsw->bottakuru_table || table == bdsw->bteresa_table) {
		bound = KEY_ITEM_MIN;
	}
	else {
		bound = BADGE_MIN;
	}
	if (id < bound || id >= BADGE_MAX + 1) return 0;
	index = (s16)(id - bound);
	switch (index & 3) {
		case 0:
			mask = 3 << 0;
			shift = 0;
			break;
		case 1:
			mask = 3 << 2;
			shift = 2;
			break;
		case 2:
			mask = 3 << 4;
			shift = 4;
			break;
		case 3:
			mask = 3 << 6;
			shift = 6;
			break;
	}
	return (s16)((mask & table[index / 4]) >> shift);
}

s32 badgeShop_add(u8* table, s32 id, s32 value) { // 1:1, can blow up in your face
    s32 temp;
	s32 mask;
	s32 shift;
    s32 bound;
    int curr;
    int data;

    if (table == bdsw->bottakuru_table || table == bdsw->bteresa_table) {
        bound = KEY_ITEM_MIN;
    } else {
        bound = BADGE_MIN;
    }
    temp = (s16)id;
    if (temp < bound || temp >= BADGE_MAX + 1) return 0;

    id = (s16)(temp - bound);
    switch (id & 3) {
        case 0:
            mask = 3 << 0;
            shift = 0;
            break;
        case 1:
            mask = 3 << 2;
            shift = 2;
            break;
        case 2:
            mask = 3 << 4;
            shift = 4;
            break;
        case 3:
            mask = 3 << 6;
            shift = 6;
            break;
    }
    data = value;
    mask &= 0xFF;
    curr = (mask & table[id / 4]) >> shift;
    data = (s16)((s16)curr + data);
    if (data < 0) {
        data = 0;
    }
    else if (data > 3) {
        data = 3;
    }
    table[id / 4] = (u8)(table[id / 4] & ~mask) + (u8)((s16)data << shift);
    return data;
}

USERFUNC_DEF(badgeShop_getBargainTable) {
	evtSetValue(event, *event->args, (s32)&bdsw->field_0xF8);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_throw_inc) {
	s32 value;

	value = (s16)evtGetValue(event, *event->args);
	badgeShop_add(bdsw->bargain_table, (s16)value, 1);
	badgeShop_add(bdsw->special_table, (s16)value, 1);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_throw_dec) {
	s32 value;

	value = (s16)evtGetValue(event, *event->args);
	badgeShop_add(bdsw->bargain_table, (s16)value, -1);
	badgeShop_add(bdsw->special_table, (s16)value, -1);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_special_dec) {
	s32 value;

	value = evtGetValue(event, *event->args);
	badgeShop_add(bdsw->special_table, (s16)value, -1);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_starmaniac_dec) {
	s32 value;

	value = (s16)evtGetValue(event, *event->args);
	badgeShop_add(bdsw->starmaniac_table, (s16)value, -1);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_bottakuru_dec) {
	s32 value;
	int i;

	value = evtGetValue(event, *event->args);
	badgeShop_add(bdsw->bottakuru_table, (s16)value, -1);
	for (i = 0; i < 4; i++) {
		if (value == badge_bottakuru_table[evtGetValue(event, i + GSW(118))]) {
			evtSetValue(event, i + GSW(118), (sizeof(badge_bottakuru_table) / sizeof(s32)) - 1); //last entry aka kNullItem
		}
	}
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_throw_get_kind_cnt) {
	s32 badge, count;
	int i;

	for (count = 0, i = 0; i < 99; i++) {
		badge = badgeShop_get(bdsw->bargain_table, (s16)(i + BADGE_MIN)); //inline
		if (badge > 0) {
			count++;
		}
	}
	evtSetValue(event, *event->args, count);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_starmaniac_get_kind_cnt) {
	s32 badge, count;
	int i;

	for (count = 0, i = 0; i < 99; i++) {
		badge = badgeShop_get(bdsw->starmaniac_table, (s16)(i + BADGE_MIN)); //inline
		if (badge > 0) {
			count++;
		}
	}
	evtSetValue(event, *event->args, count);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_bottakuru_get_kind_cnt) {
	s32 count;
	int i;

	for (count = 0, i = 0; i < 4; i++) {
		if (badge_bottakuru_table[evtGetValue(event, i + GSW(118))]) {
			count++;
		}
	}
	evtSetValue(event, *event->args, count);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_get_special_zaiko) {
	s32 badge, count;
	int i;

	for (count = 0, i = 0; i < BADGE_MAX; i++) {
		badge = badgeShop_get(bdsw->bottakuru_table, (s16)(i + KEY_ITEM_MIN));
		if (badge > 0) { //TODO: wonky cntlzw
			count++;
		}
	}
	evtSetValue(event, *event->args, count);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_badgeShop_bteresa_get_kind_cnt) {
	s32 badge, count;
	int i;

	for (count = 0, i = 0; i < BADGE_MAX; i++) {
		badge = badgeShop_get(bdsw->bteresa_table, (s16)(i + KEY_ITEM_MIN));
		if (badge > 0) { //TODO: wonky cntlzw
			count++;
		}
	}
	evtSetValue(event, *event->args, count);
	return EVT_RETURN_DONE;
}

s32 badgeShop_ThrowCheck(s32 itemId) {
	s32 count;
	int i;

	for (count = 0, i = 0; i < bdsw->field_0x10C; i++) {
		if (itemId == bdsw->field_0xF8[i + bdsw->field_0x10C]) {
			count++;
		}
	}
	return count;
}

s32 badgeShop_SpecialCheck(void) {
	s32 count;
	int i;

	for (count = 0, i = 0; i < 5; i++) {
		if (bdsw->field_0xF8[i]) {
			count++;
		}
	}
	return count;
}
