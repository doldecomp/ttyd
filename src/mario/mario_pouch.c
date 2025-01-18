#include "mario/mario_pouch.h"
#include "mario/mario_party.h"
#include "evt/evt_badgeshop.h"
#include "evt/evt_yuugijou.h"
#include "data/item_data.h"
#include "memory.h"
#include <string.h>

extern PiantaParlorWork* yuwp;
extern BadgeShopWork* bdsw;
extern ItemData itemDataTable[];

static PouchData* mpp;


//.data
s16 _party_max_hp_table[8][4] = {
	{0, 0, 0, 0},
	{10, 20, 30, 200},
	{10, 15, 25, 200},
	{20, 30, 40, 200},
	{10, 20, 30, 200},
	{15, 25, 35, 200},
	{15, 20, 30, 200},
	{15, 20, 25, 200}
};

PouchData* pouchGetPtr(void) {
	return mpp;
}

void pouchInit(void) {
	int i;

	mpp = __memAlloc(HEAP_DEFAULT, sizeof(PouchData));
	memset(mpp, 0, sizeof(PouchData));
	for (i = 0; i < MAX_KEY_ITEMS; i++) {
		mpp->keyItems[i] = ITEM_NULL;
	}
	for (i = 0; i < MAX_HELD_ITEMS; i++) {
		mpp->heldItems[i] = ITEM_NULL;
	}
	for (i = 0; i < MAX_STORED_ITEMS; i++) {
		mpp->storedItems[i] = ITEM_NULL;
	}
	for (i = 0; i < MAX_BADGES; i++) {
		mpp->badges[i] = ITEM_NULL;
	}
	for (i = 0; i < MAX_BADGES; i++) {
		mpp->equippedBadges[i] = ITEM_NULL;
	}
	mpp->maximumHP = 10;
	mpp->baseMaxHP = 10;
	mpp->maximumFP = 5;
	mpp->baseMaxFP = 5;
	mpp->availableBP = 3;
	mpp->maximumBP = 3;
	mpp->currentHP = mpp->maximumHP;
	mpp->currentFP = mpp->maximumFP;
	mpp->currentSP = 0;
	mpp->field_0x7E = 0;
	mpp->maximumSP = 0;
	mpp->field_0x80 = 0;
	mpp->audienceCount = 0.0f;
	mpp->rank = 0;
	mpp->level = 1;
	mpp->jumpLevel = 0;
	mpp->hammerLevel = 0;
	for (i = 0; i < 8; i++) {
		mpp->partyData[i].flags = 0;
		mpp->partyData[i].baseMaxHP = 10;
		mpp->partyData[i].maximumHP = mpp->partyData[i].baseMaxHP;
		mpp->partyData[i].currentHP = mpp->partyData[i].baseMaxHP;
		mpp->partyData[i].attackLevel = 0;
		mpp->partyData[i].techLevel = 0;
	}
	strcpy(mpp->yoshiName, "チビヨッシー"); //TODO: US
}

ItemType pouchKeyItem(s32 id) {
	return mpp->keyItems[id];
}

ItemType pouchHaveItem(s32 id) {
	return mpp->heldItems[id];
}

ItemType pouchKeepItem(s32 id) {
	return mpp->storedItems[id];
}

ItemType pouchHaveBadge(s32 id) {
	return mpp->badges[id];
}

s32 pouchGetHaveItemCnt(void) {
	s32 i, count;

	for (i = 0, count = 0; i < MAX_HELD_ITEMS; i++) {
		if (mpp->heldItems[i] != ITEM_NULL) {
			count++;
		}
	}
	return count;
}

s32 pouchGetKeepItemCnt(void) {
	s32 i, count;

	for (i = 0, count = 0; i < MAX_STORED_ITEMS; i++) {
		if (mpp->storedItems[i] != ITEM_NULL) {
			count++;
		}
	}
	return count;
}

s32 pouchGetHaveBadgeCnt(void) {
	s32 i, count;

	for (i = 0, count = 0; i < MAX_BADGES; i++) {
		if (mpp->badges[i] != ITEM_NULL) {
			count++;
		}
	}
	return count;
}

s32 pouchGetEquipBadgeCnt(void) {
	s32 i, count;

	for (i = 0, count = 0; i < MAX_BADGES; i++) {
		if (mpp->equippedBadges[i] != ITEM_NULL) {
			count++;
		}
	}
	return count;
}

s32 pouchGetEmptyHaveItemCnt(void) {
	s32 i, count;

	for (i = 0, count = 0; i < GetHeldItemCount; i++) {
		if (mpp->heldItems[i] == ITEM_NULL) {
			count++;
		}
	}
	return count;
}

s32 pouchGetEmptyKeepItemCnt(void) {
	s32 i, count;

	for (i = 0, count = 0; i < MAX_STORED_ITEMS; i++) {
		if (mpp->storedItems[i] == ITEM_NULL) {
			count++;
		}
	}
	return count;
}

//we have obtained an item, update the appropriate data
BOOL pouchGetItem(ItemType type) {
	s32 id;

	if (type == ITEM_COIN) {
		if (mpp->coins < 999) {
			mpp->coins++;
		}
		return TRUE;
	}
	if (type == ITEM_PIANTA_TOKEN) {
		if (yuwp->tokens < 99999) {
			yuwp->tokens++;
		}
		return TRUE;
	}
	if (type == ITEM_HEART) {
		//id = marioGetParty();

	}
	/*
	switch (type) {
	case ITEM_COIN:
		if (mpp->coins < 999) {
			mpp->coins++;
		}
		return TRUE;
	case kItemPianta:
		if (yuwp->mPianta < 99999) {
			yuwp->mPianta++;
		}
		return TRUE;
		case kItemHeartPickup:
			if (mpp->mCurrentHP < mpp->mMaxHP) {
				mpp->mCurrentHP++;
			}
			return TRUE;
	}*/
	return FALSE;
}








char* pouchGetYoshiName(void) {
	if (strlen(mpp->yoshiName)) {
		return mpp->yoshiName;
	}
	else {
		return NULL; // return msgSearch("name_party3");
	}
}

void pouchSetYoshiName(char* name) {
	strcpy(mpp->yoshiName, name);
}

void pouchSetPartyColor(MarioPartner partnerId, u16 color) {
	mpp->partyData[partnerId].flags = (u16)((mpp->partyData[partnerId].flags & 0x1FFF) | (color << 13));
}

s32 pouchGetPartyColor(MarioPartner partnerId) {
	return mpp->partyData[partnerId].flags >> 13;
}

u32 pouchCheckMail(s32 mailId) {
	s32 mask = (1 << (mailId % 32));
	if (mpp->mEmailReadFlags[mailId / 32] & mask) {
		return 2;
	}
	else {
		return (mpp->mEmailReceivedFlags[mailId / 32] & mask) != 0;
	}
}

void pouchOpenMail(s32 mailId) {
	mpp->mEmailReadFlags[mailId / 32] |= (1 << (mailId % 32));
}

void pouchReceiveMail(s32 mailId) {
	s32 index, shift, count;
	int i;

	shift = mailId % 32;
	index = mailId / 32;

	//increment through known IDs to add to mEmailIds
	for (i = 0, count = 0; i < 99; i++) {
		if (mpp->mEmailReceivedFlags[i / 32] & (1 << (i % 32))) {
			count++;
		}
	}
	mpp->mEmailReceivedFlags[index] |= (1 << shift);
	mpp->mEmailIds[count] = (u8)mailId;
}

s32 pouchReceiveMailCount(void) {
	s32 i, count;

	for (i = 0, count = 0; i < 99; i++) {
		if (mpp->mEmailReceivedFlags[i / 32] & (1 << (i % 32))) {
			count++;
		}
	}
	return count;
}

void pouchGetStarStone(u32 id) {
	if (!mpp->mStarPowersObtained) {
		mpp->audienceCount = 2.0f;
	}
	mpp->mStarPowersObtained |= 1 << id;
	mpp->maximumSP = (s16)(100 * (id + 1));
	if (mpp->maximumSP < 0) {
		mpp->maximumSP = 0;
	}
	if (mpp->maximumSP > 800) {
		mpp->maximumSP = 800;
	}
}

void pouchAddKpaScore(u32 score) {
	mpp->mSuperBowserScore += score;
	if (mpp->mSuperBowserScore > 999999)
	{
		mpp->mSuperBowserScore = 999999;
	}
}

u32 pouchGetKpaScore(void) {
	return mpp->mSuperBowserScore;
}

void pouchAddKpaCoin(u8 coins) {
	mpp->mSuperBowserCoins += coins;
	if (mpp->mSuperBowserCoins >= 100) {
		mpp->mSuperBowserCoins -= 100;
	}
}

u8 pouchGetKpaCoin(void) {
	return mpp->mSuperBowserCoins;
}

void pouchMajinaiInit(u32 curseCount) {
	if (mpp->mMerleeCurseUsesRemaining < curseCount) {
		mpp->mMerleeCurseUsesRemaining = (u8)curseCount;
		mpp->mTurnsUntilMerleeActivation = -1;
		mpp->mMerleeNextCurseType = 0;
	}
}

s32 pouchArriveBadge(s32 id) {
	return badgeShop_add(bdsw->special_table, (s16)id, 1);
}

BOOL pouchUnEquipBadgeID(s32 badgeId) {
	int i;

	for (i = 0; i < 200; i++) {
		if (mpp->equippedBadges[i] == badgeId) {
			if (mpp->equippedBadges[i]) {
				mpp->equippedBadges[i] = 0;
			}
			return TRUE;
		}
	}
	return FALSE;
}

BOOL pouchEquipBadgeID(s32 badgeId) {
	int i;

	for (i = 0; i < 200; i++) {
		if (mpp->badges[i] == badgeId) {
			if (mpp->badges[i]) {
				mpp->equippedBadges[i] = mpp->badges[i];
			}
			return TRUE;
		}
	}
	return FALSE;
}

BOOL pouchEquipCheckBadgeIndex(s32 index) {
	return mpp->equippedBadges[index] != 0;
}

s32 pouchEquipCheckBadge(s32 badgeId) {
	int i, count;

	count = 0;
	for (i = 0; i < 200; i++) {
		if (badgeId == mpp->equippedBadges[i]) {
			count++;
		}
	}
	return count;
}

BOOL pouchUnEquipBadgeIndex(s32 index) {
	if (mpp->equippedBadges[index] == 0) {
		return FALSE;
	}
	mpp->equippedBadges[index] = 0;
	return TRUE;
}

BOOL pouchEquipBadgeIndex(s32 index) {
	if (mpp->badges[index] == 0) {
		return FALSE;
	}
	mpp->equippedBadges[index] = mpp->badges[index];
	return TRUE;
}

u16 pouchGetStarPoint(void) {
	return mpp->mStarPoints;
}

void pouchRevisePartyParam(void) {
	PouchPartyData* party;
	int i, count;

	for (i = 0, count = 0; i < 200; i++) {
		if (mpp->equippedBadges[i] == kItemHpPlusP) {
			count++;
		}
	}

	for (i = 0; i < 8; i++) { //TODO: NUM_PARTNERS macro
		if (i != PARTNER_NONE) {
			party = &mpp->partyData[i];
			party->baseMaxHP = _party_max_hp_table[i][party->HPLevel];
			party->maximumHP = (s16)(party->baseMaxHP + (count * 5));
			if (party->currentHP > party->maximumHP) {
				party->currentHP = party->maximumHP;
			}
		}
	}
}

void pouchReviseMarioParam(void) {
	int i;

	mpp->maximumHP = mpp->baseMaxHP;
	mpp->maximumFP = mpp->baseMaxFP;

	for (i = 0; i < 200; i++) {
		switch (mpp->equippedBadges[i]) {
			case kItemHpPlus:
				mpp->maximumHP += 5;
				break;
			case kItemFpPlus:
				mpp->maximumFP += 5;
				break;
		}
	}
	if (mpp->currentHP > mpp->maximumHP) {
		mpp->currentHP = mpp->maximumHP;
	}
	if (mpp->currentFP > mpp->maximumFP) {
		mpp->currentFP = mpp->maximumFP;
	}
	mpp->availableBP = mpp->maximumBP;

	for (i = 0; i < 200; i++) {
		mpp->availableBP -= itemDataTable[mpp->equippedBadges[i]].bp_cost;
	}
}

BOOL pouchRemoveKeepItem(s32 id, s32 index) {
	int i, j;

	if (mpp->storedItems[index] != id) {
		return FALSE;
	}
	if (index < 32) {
		for (i = (MAX_STORED_ITEMS - index); i < 32; i++) {
			if (mpp->storedItems[i] == id) {
				mpp->storedItems[i] = 0;
				if (index < 31) {
					for (j = 31; j < 31 - index; j--) {
						mpp->storedItems[j] = mpp->storedItems[j + 1];
						mpp->storedItems[j + 1] = 0;
					}
				}
				return TRUE;
			}
			index++;
		}
	}
	return FALSE;
}

//TODO: this function
BOOL pouchAddKeepItem(s16 id) {
	return FALSE;
}

s16 pouchGetPartyAttackLv(MarioPartner partnerId) {
	return mpp->partyData[partnerId].attackLevel;
}

s32 pouchGetHammerLv(void) {
	s8 level = 0;

	if (pouchCheckItem(kItemUltraHammer)) {
		level = 3;
	}
	else if (pouchCheckItem(kItemSuperHammer)) {
		level = 2;
	}
	else if (pouchCheckItem(kItemHammer)) {
		level = 1;
	}
	mpp->hammerLevel = level;
	return mpp->hammerLevel;
}

s32 pouchGetJumpLv(void) {
	s8 level = 0;

	if (pouchCheckItem(kItemUltraBoots)) {
		level = 3;
	}
	else if (pouchCheckItem(kItemSuperBoots)) {
		level = 2;
	}
	else if (pouchCheckItem(kItemBoots)) {
		level = 1;
	}
	mpp->jumpLevel = level;
	return mpp->jumpLevel;
}

void pouchSetAudienceNum(f32 num) {
	mpp->audienceCount = num;
}

f32 pouchGetAudienceNum(void) {
	return mpp->audienceCount;
}

s16 pouchGetMaxAP(void) {
	return mpp->maximumSP;
}

void pouchSetAP(s16 points) {
	mpp->currentSP = points;
	if (mpp->currentSP < 0) {
		mpp->currentSP = 0;
	}
	if (mpp->currentSP > mpp->maximumSP) {
		mpp->currentSP = mpp->maximumSP;
	}
}

void pouchAddAP(s16 points) {
	mpp->currentSP += points;
	if (mpp->currentSP < 0) {
		mpp->currentSP = 0;
	}
	if (mpp->currentSP > mpp->maximumSP) {
		mpp->currentSP = mpp->maximumSP;
	}
}

s16 pouchGetAP(void) {
	return mpp->currentSP;
}

void pouchSetMaxFP(s16 points) {
	mpp->maximumFP = points;
	mpp->baseMaxFP = mpp->maximumFP;
}

void pouchSetFP(s16 points) {
	mpp->currentFP = points;
	if (mpp->currentFP > mpp->maximumFP) {
		mpp->currentFP = mpp->maximumFP;
	}
}

s16 pouchGetMaxFP(void) {
	return mpp->maximumFP;
}

s16 pouchGetFP(void) {
	return mpp->currentFP;
}

void pouchSetPartyHP(MarioPartner partnerId, s16 points) {
	PouchPartyData* party;

	mpp->partyData[partnerId].currentHP = points;
	party = &mpp->partyData[partnerId];
	if (party->currentHP > party->maximumHP) {
		party->currentHP = party->maximumHP;
	}
}

s16 pouchGetPartyHP(MarioPartner partnerId) {
	return mpp->partyData[partnerId].currentHP;
}

void pouchSetMaxHP(s16 points) {
	mpp->maximumHP = points;
	mpp->baseMaxHP = mpp->maximumHP;
}

void pouchSetHP(s16 points) {
	mpp->currentHP = points;
	if (mpp->currentHP > mpp->maximumHP) {
		mpp->currentHP = mpp->maximumHP;
	}
}

s16 pouchGetMaxHP(void) {
	return mpp->maximumHP;
}

s16 pouchGetHP(void) {
	return mpp->currentHP;
}

s16 pouchAddHP(s16 points) {
	mpp->currentHP += points;
	if (mpp->currentHP < 0) {
		mpp->currentHP = 0;
	}
	if (mpp->currentHP > mpp->maximumHP) {
		mpp->currentHP = mpp->maximumHP;
	}
	return mpp->currentHP;
}

s16 pouchAddStarPiece(s16 count) {
	mpp->mStarPieceCount += count;
	return mpp->mStarPieceCount;
}

s16 pouchGetStarPiece(void) {
	return mpp->mStarPieceCount;
}

s16 pouchSetSuperCoin(s16 count) {
	mpp->mShineSpriteCount = count;
	return mpp->mShineSpriteCount;
}

s16 pouchGetSuperCoin(void) {
	return mpp->mShineSpriteCount;
}

s16 pouchSetCoin(s16 coins) {
	mpp->coins = coins;
	if (mpp->coins < 0) {
		mpp->coins = 0;
	}
	if (mpp->coins > 999) {
		mpp->coins = 999;
	}
	return mpp->coins;
}

s16 pouchAddCoin(s16 coins) {
	mpp->coins += coins;
	if (mpp->coins < 0) {
		mpp->coins = 0;
	}
	if (mpp->coins > 999) {
		mpp->coins = 999;
	}
	return mpp->coins;
}

s16 pouchGetCoin(void) {
	return mpp->coins;
}





BOOL pouchRemoveItem(ItemType type) {
	s16* table1, * table2;
	BOOL valid;
	s32 maximum;
	int i, j, temp;

	maximum = 0;
	table1 = NULL;
	table2 = NULL;
	if (type >= ITEM_MIN && type < ITEM_MAX) {
		table1 = mpp->heldItems;
		table2 = NULL;
		maximum = GetHeldItemCount;
		valid = TRUE;
	}
	else if (type >= KEY_ITEM_MIN && type < KEY_ITEM_MAX) {
		table1 = mpp->keyItems;
		table2 = NULL;
		maximum = 121;
		valid = TRUE;
	}
	else if (type >= BADGE_MIN && type < BADGE_MAX) {
		table1 = mpp->badges;
		table2 = mpp->equippedBadges;
		maximum = 200;
		valid = TRUE;
	}
	else {
		valid = FALSE;
	}
	if (!valid) {
		return FALSE;
	}
	for (i = 0; i < maximum; i++) {
		if (type == table1[i]) {
			table1[i] = ITEM_NULL;
			if (table2 != 0) {
				table2[i] = ITEM_NULL;
			}
			if (table2) {
				for (j = maximum - i, temp = 0; j != 0; j--, temp++) {
					table1[temp] = table1[temp + 1];
					table1[temp + 1] = ITEM_NULL;
					table2[temp] = table2[temp + 1];
					table2[temp + 1] = ITEM_NULL;
				}
			}
			else {
				for (j = maximum - i, temp = 0; j != 0; j--, temp++) {
					table1[temp] = table1[temp + 1];
					table1[temp + 1] = ITEM_NULL;
				}
			}
			break;
		}
	}
	return TRUE;
}








u32 pouchCheckItem(u32 itemId) {
	u32 itemCnt;
	int i;

	if (KEY_ITEM_MIN <= itemId <= KEY_ITEM_MAX) {
		for (i = 0, itemCnt = 0; i < MAX_KEY_ITEMS; i++) {
			if (mpp->keyItems[i] == itemId) {
				itemCnt++;
			}
		}
		return itemCnt;
	}
	else if (ITEM_MIN <= itemId <= ITEM_MAX) {
		for (i = 0, itemCnt = 0; i < MAX_HELD_ITEMS; i++) {
			if (mpp->heldItems[i] == itemId) {
				itemCnt++;
			}
		}
		return itemCnt;
	}
	else if (BADGE_MIN <= itemId <= BADGE_MAX) {
		for (i = 0, itemCnt = 0; i < MAX_BADGES; i++) {
			if (mpp->badges[i] == itemId) {
				itemCnt++;
			}
		}
		return itemCnt;
	}
	else {
		return 0;
	}
}
