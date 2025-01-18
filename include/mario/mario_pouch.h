#pragma once

#include <dolphin/types.h>

#define MAX_KEY_ITEMS 121
//TODO: change name if it collides with backpack something
#define MAX_HELD_ITEMS 20
#define HELD_ITEM_COUNT_BASE 10
#define GetHeldItemCount pouchCheckItem(kItemStrangeSack) ? MAX_HELD_ITEMS : HELD_ITEM_COUNT_BASE
#define MAX_STORED_ITEMS 32
#define MAX_BADGES 200

//4-byte wide, using u16 casting for mario_pouch
typedef enum ItemType {
	ITEM_NULL, //0x0
// Key Items -------------------------------------------
	kItemStrangeSack, //0x1
#define KEY_ITEM_MIN kItemStrangeSack
	kItemPaperCurse, //0x2
	kItemTubeCurse, //0x3
	kItemPlaneCurse, //0x4
	kItemBoatCurse, //0x5
	kItemBoots, //0x6
	kItemSuperBoots, //0x7
	kItemUltraBoots, //0x8
	kItemHammer, //0x9
	kItemSuperHammer, //0xA
	kItemUltraHammer, //0xB
	kItemCastleKey_0x0c, //0xC
	kItemCastleKey_0x0d, //0xD
	kItemCastleKey_0x0e, //0xE
	kItemCastleKey_0x0f, //0xF
	kItemRedKey, //0x10
	kItemBlueKey, //0x11
	kItemStorageKey_0x12, //0x12
	kItemStorageKey_0x13, //0x13
	kItemGrottoKey, //0x14
	kItemShopKey, //0x15
	kItemSteepleKey_0x16, //0x16
	kItemSteepleKey_0x17, //0x17
	kItemSteepleKey_0x18, //0x18
	kItemSteepleKey_0x19, //0x19
	kItemElevatorKey_0x1a, //0x1A
	kItemElevatorKey_0x1b, //0x1B
	kItemElevatorKey_0x1c, //0x1C
	kItemCardKey_0x1d, //0x1D
	kItemCardKey_0x1e, //0x1E
	kItemCardKey_0x1f, //0x1F
	kItemCardKey_0x20, //0x20
	kItemBlackKey_0x21, //0x21
	kItemBlackKey_0x22, //0x22
	kItemBlackKey_0x23, //0x23
	kItemBlackKey_0x24, //0x24
	kItemStarKey, //0x25
	kItemPalaceKey_0x26, //0x26
	kItemPalaceKey_0x27, //0x27
	kItemPalaceKey_0x28, //0x28
	kItemPalaceKey_0x29, //0x29
	kItemPalaceKey_0x2a, //0x2A
	kItemPalaceKey_0x2b, //0x2B
	kItemPalaceKey_0x2c, //0x2C
	kItemPalaceKey_0x2d, //0x2D
	kItemPalaceKey_0x2e, //0x2E
	kItemPalaceKey_0x2f, //0x2F
	kItemPalaceKey_0x30, //0x30
	kItemHouseKey, //0x31
	kItemMagicalMap, //0x32
	kItemContactLens, //0x33
	kItemBlimpTicket, //0x34
	kItemTrainTicket, //0x35
	kItemMailboxSP, //0x36
	kItemSuperLuigi1, //0x37
	kItemSuperLuigi2, //0x38
	kItemSuperLuigi3, //0x39
	kItemSuperLuigi4, //0x3A
	kItemSuperLuigi5, //0x3B
	kItemCookbook, //0x3C
	kItemMoonStone, //0x3D
	kItemSunStone, //0x3E
	kItemNecklace, //0x3F
	kItemPuniOrb, //0x40
	kItemChampsBelt, //0x41
	kItemPoisonedCake, //0x42
	kItemSuperbombomb, //0x43
	kItemTheLetterP, //0x44
	kItemOldLetter, //0x45
	kItemChuckolaCola, //0x46
	kItemSkullGem, //0x47
	kItemGateHandle, //0x48
	kItemWeddingRing, //0x49
	kItemGalleyPot, //0x4A
	kItemGoldRing, //0x4B
	kItemShellEarrings, //0x4C
	kItemAutograph, //0x4D
	kItemRaggedDiary, //0x4E
	kItemBlanket, //0x4F
	kItemVitalPaper, //0x50
	kItemBriefcase, //0x51
	kItemGoldbobGuide, //0x52
	kItemUnk_Paper_0x53, //0x53
	kItemUnk_Paper_0x54, //0x54
	kItemCog, //0x55
	kItemDataDisk, //0x56
	kItemShineSprite, //0x57
	kItemUltraStone, //0x58
	kItemBowserBrosMeat, //0x59
	kItemMarioPoster, //0x5A
	kItemSpecialCard, //0x5B
	kItemPlatinumCard, //0x5C
	kItemGoldCard, //0x5D
	kItemSilverCard, //0x5E
	kItemBox, //0x5F
	kItemMagicalMap_Large, //0x60
	kItemDubiousPaper, //0x61
	kItemRoutingSlip, //0x62
	kItemWrestlingMag, //0x63
	kItemPresent, //0x64
	kItemBluePotion, //0x65
	kItemRedPotion, //0x66
	kItemOrangePotion, //0x67
	kItemGreenPotion, //0x68
	kItemUnk_Star_0x69, //0x69
	kItemLotteryPick, //0x6A
	kItemBattleTrunks, //0x6B
	kItemUpArrow, //0x6C
	kItemPackage, //0x6D
	kItemAttackFxBKeyItem, //0x6E
	kItemUnknown_0x6f, //0x6F
	kItemUnknown_0x70, //0x70
	kItemUnknown_0x71, //0x71
	kItemDiamondStar, //0x72
	kItemEmeraldStar, //0x73
	kItemGoldStar, //0x74
	kItemRubyStar, //0x75
	kItemSapphireStar, //0x76
	kItemGarnetStar, //0x77
	kItemCrystalStar, //0x78
#define KEY_ITEM_MAX kItemCrystalStar + 1
// Normal Items ----------------------------------------
	ITEM_COIN, //0x79
#define ITEM_MIN ITEM_COIN
	ITEM_PIANTA_TOKEN, //0x7A
	ITEM_HEART, //0x7B, spawn pickup
	ITEM_FLOWER, //0x7C, spawn pickup
	kItemStarPiece, //0x7D
	kItemGoldBar, //0x7E
	kItemGoldBarX3, //0x7F
	kItemThunderBolt, //0x80
	ITEM_THUNDER_RAGE, //0x81
	ITEM_SHOOTING_STAR, //0x82
	ITEM_ICE_STORM, //0x83
	ITEM_FIRE_FLOWER, //0x84
	ITEM_EARTH_QUAKE, //0x85
	ITEM_BOOS_SHEET, //0x86
	ITEM_VOLT_SHROOM, //0x87
	ITEM_REPEL_CAPE, //0x88
	ITEM_RUIN_POWDER, //0x89
	ITEM_SLEEPY_SHEEP, //0x8A
	ITEM_POW_BLOCK, //0x8B
	ITEM_STOPWATCH, //0x8C
	ITEM_DIZZY_DIAL, //0x8D
	ITEM_POWER_PUNCH, //0x8E
	ITEM_COURAGE_SHELL, //0x8F
	ITEM_HP_DRAIN_ITEM, //0x90
	kItemTradeOff, //0x91
	ITEM_MINI_MR_MINI, //0x92
	ITEM_MR_SOFTENER, //0x93
	ITEM_MUSHROOM, //0x94
	ITEM_SUPER_SHROOM, //0x95
	ITEM_ULTRA_SHROOM, //0x96
	ITEM_LIFE_SHROOM, //0x97
	ITEM_DRIED_SHROOM, //0x98
	ITEM_TASTY_TONIC, //0x99
	ITEM_HONEY_SYRUP, //0x9A
	ITEM_MAPLE_SYRUP, //0x9B
	ITEM_JAMMIN_JELLY, //0x9C
	ITEM_SLOW_SHROOM, //0x9D
	ITEM_GRADUAL_SYRUP, //0x9E
	kItemHotDog, //0x9F
	kItemCake, //0xA0
	ITEM_POINT_SWAP, //0xA1
	ITEM_FRIGHT_MASK, //0xA2
	ITEM_MYSTERY, //0xA3
	kItemInnCoupon, //0xA4
	kItemWhackaBump, //0xA5
	kItemCoconut, //0xA6
	kItemDriedBouquet, //0xA7
	kItemMysticEgg, //0xA8
	kItemGoldenLeaf, //0xA9
	kItemKeelMango, //0xAA
	kItemFreshPasta, //0xAB
	kItemCakeMix, //0xAC
	kItemHotSauce, //0xAD
	kItemTurtleyLeaf, //0xAE
	kItemHorsetail, //0xAF
	kItemPeachyPeach, //0xB0
	ITEM_SPITE_POUCH, //0xB1
	kItemKoopaCurse, //0xB2
	kItemShroomFry, //0xB3
	kItemShroomRoast, //0xB4
	kItemShroomSteak, //0xB5
	kItemMistake, //0xB6
	kItemHoneyShroom, //0xB7
	kItemMapleShroom, //0xB8
	kItemJellyShroom, //0xB9
	kItemHoneySuper, //0xBA
	kItemMapleSuper, //0xBB
	kItemJellySuper, //0xBC
	kItemHoneyUltra, //0xBD
	kItemMapleUltra, //0xBE
	kItemJellyUltra, //0xBF
	kItemSpicySoup, //0xC0
	kItemZessDinner, //0xC1
	kItemZessSpecial, //0xC2
	kItemZessDeluxe, //0xC3
	kItemZessDynamite, //0xC4
	kItemZessTea, //0xC5
	kItemSpaceFood, //0xC6
	kItemIciclePop, //0xC7
	kItemZessFrappe, //0xC8
	kItemSnowBunny, //0xC9
	kItemCoconutBomb, //0xCA
	kItemCourageMeal, //0xCB
	kItemShroomCake, //0xCC
	kItemShroomCrepe, //0xCD
	kItemMousseCake, //0xCE
	kItemFriedEgg, //0xCF
	kItemFruitParfait, //0xD0
	kItemEggBomb, //0xD1
	kItemInkPasta, //0xD2
	kItemSpaghetti, //0xD3
	kItemShroomBroth, //0xD4
	kItemPoisonShroom, //0xD5
	kItemChocoCake, //0xD6
	kItemMangoDelight, //0xD7
	kItemLovePudding, //0xD8
	kItemMeteorMeal, //0xD9
	kItemTrialStew, //0xDA
	kItemCouplesCake, //0xDB
	kItemInkySauce, //0xDC
	kItemOmeletteMeal, //0xDD
	kItemKoopaTea, //0xDE
	kItemKoopasta, //0xDF
	kItemSpicyPasta, //0xE0
	kItemHeartfulCake, //0xE1
	kItemPeachTart, //0xE2
	kItemElectroPop, //0xE3
	kItemFirePop, //0xE4
	kItemHoneyCandy, //0xE5
	kItemCocoCandy, //0xE6
	kItemJellyCandy, //0xE7
	kItemZessCookie, //0xE8
	kItemHealthySalad, //0xE9
	kItemKoopaBun, //0xEA
	kItemFreshJuice, //0xEB
#define ITEM_MAX kItemFreshJuice + 1
// ??? -------------------------------------------------
	ITEM_AUDIENCE_CAN, //0xEC
	ITEM_AUDIENCE_ROCK, //0xED
	ITEM_AUDIENCE_BONE, //0xEE
	ITEM_AUDIENCE_HAMMER, //0xEF
// Badges ----------------------------------------------
	kItemPowerJump, //0xF0
#define BADGE_MIN kItemPowerJump
	kItemMultibounce, //0xF1
	kItemPowerBounce, //0xF2
	kItemTornadoJump, //0xF3
	kItemShrinkStomp, //0xF4
	kItemSleepyStomp, //0xF5
	kItemSoftStomp, //0xF6
	kItemPowerSmash, //0xF7
	kItemQuakeHammer, //0xF8
	kItemHammerThrow, //0xF9
	kItemPiercingBlow, //0xFA
	kItemHeadRattle, //0xFB
	kItemFireDrive, //0xFC
	kItemIceSmash, //0xFD
	kItemDoubleDip, //0xFE
	kItemDoubleDipP, //0xFF
	kItemCharge, //0x100
	kItemChargeP, //0x101
	kItemSuperAppeal, //0x102
	kItemSuperAppealP, //0x103
	kItemPowerPlus, //0x104
	kItemPowerPlusP, //0x105
	kItemPUpDDown, //0x106
	kItemPUpDDownP, //0x107
	kItemAllOrNothing, //0x108
	kItemAllOrNothingP, //0x109
	kItemMegaRush, //0x10A
	kItemMegaRushP, //0x10B
	kItemPowerRush, //0x10C
	kItemPowerRushP, //0x10D
	kItemPDownDUp, //0x10E
	kItemPDownDUpP, //0x10F
	kItemLastStand, //0x110
	kItemLastStandP, //0x111
	kItemDefendPlus, //0x112
	kItemDefendPlusP, //0x113
	kItemDamageDodge, //0x114
	kItemDamageDodgeP, //0x115
	kItemHpPlus, //0x116
	kItemHpPlusP, //0x117
	kItemFpPlus, //0x118
	kItemFlowerSaver, //0x119
	kItemFlowerSaverP, //0x11A
	kItemIcePower, //0x11B
	kItemSpikeShield, //0x11C
	kItemFeelingFine, //0x11D
	kItemFeelingFineP, //0x11E
	kItemZapTap, //0x11F
	kItemDoublePain, //0x120
	kItemJumpman, //0x121
	kItemHammerman, //0x122
	kItemReturnPostage, //0x123
	kItemHappyHeart, //0x124
	kItemHappyHeartP, //0x125
	kItemHappyFlower, //0x126
	kItemHpDrainBadge, //0x127
	kItemHpDrainP, //0x128
	kItemFpDrain, //0x129
	kItemFpDrainP, //0x12A
	kItemCloseCall, //0x12B
	kItemCloseCallP, //0x12C
	kItemPrettyLucky, //0x12D
	kItemPrettyLuckyP, //0x12E
	kItemLuckyDay, //0x12F
	kItemLuckyDayP, //0x130
	kItemRefund, //0x131
	kItemPityFlower, //0x132
	kItemPityFlowerP, //0x133
	kItemQuickChange, //0x134
	kItemPeekaboo, //0x135
	kItemTimingTutor, //0x136
	kItemHeartFinder, //0x137
	kItemFlowerFinder, //0x138
	kItemMoneyMoney, //0x139
	kItemItemHog, //0x13A
	kItemAttackFxR, //0x13B
	kItemAttackFxB, //0x13C
	kItemAttackFxG, //0x13D
	kItemAttackFxY, //0x13E
	kItemAttackFxP, //0x13F
	kItemChillOut, //0x140
	kItemFirstAttack, //0x141
	kItemBumpAttack, //0x142
	kItemSlowGo, //0x143
	kItemSimplifier, //0x144
	kItemUnsimplifier, //0x145
	kItemLuckyStart, //0x146
	kItemLEmblem, //0x147
	kItemWEmblem, //0x148
	kItemTripleDip, //0x149
	kItemLuckyStartP, //0x14A
	kItemAutoCommandBadge, //0x14B
	kItemMegaJump, //0x14C
	kItemMegaSmash, //0x14D
	kItemMegaQuake, //0x14E
	kItemUnusedDefendBadge, //0x14F
	kItemUnusedDefendBadgeP, //0x150
	kItemSuperCharge, //0x151
	kItemSuperChargeP, //0x152
#define BADGE_MAX kItemSuperChargeP + 1
	kItemMax
} ItemType;

typedef enum MarioPartner {
	PARTNER_NONE,
	PARTNER_GOOMBELLA,
	PARTNER_KOOPS,
	PARTNER_BOBBERY,
	PARTNER_YOSHI,
	PARTNER_FLURRIE,
	PARTNER_VIVIAN,
	PARTNER_MSMOWZ
} MarioPartner;

typedef struct PouchPartyData {
	s16 flags; //0x0
	s16 maximumHP; //0x2, includes HP Plus P boost
	s16 baseMaxHP; //0x4
	s16 currentHP; //0x6
	s16 HPLevel; //0x8
	s16 attackLevel; //0xA
	s16 techLevel; //0xC
} PouchPartyData;

typedef struct PouchData {
	PouchPartyData partyData[8]; //0x0
	s16 currentHP; //0x70
	s16 maximumHP; //0x72, includes HP Plus boost
	s16 currentFP; //0x74
	s16 maximumFP; //0x76, includes FP Plus boost
	s16 coins; //0x78
	s16 currentSP; //0x7A
	s16 maximumSP; //0x7C
	s16 field_0x7E; //0x7E
	s16 field_0x80; //0x80
	s16 field_0x82; //0x82
	f32 audienceCount; //0x84
	s16 rank; //0x88
	s16 level; //0x8A
	s16 mStarPowersObtained; //0x8C
	s16 baseMaxHP; //0x8E
	s16 baseMaxFP; //0x90
	s16 availableBP; //0x92
	s16 maximumBP; //0x94
	s16 mStarPoints; //0x96
	s8 jumpLevel; //0x98
	s8 hammerLevel; //0x99
	s16 mStarPieceCount; //0x9A
	s16 mShineSpriteCount; //0x9C
	s16 mPowerBounceRecord; //0x9E, Pit of 100 Trials
	s16 keyItems[MAX_KEY_ITEMS]; //0xA0
	s16 heldItems[MAX_HELD_ITEMS]; //0x192
	s16 storedItems[MAX_STORED_ITEMS]; //0x1BA
	s16 badges[MAX_BADGES]; //0x1FA
	s16 equippedBadges[MAX_BADGES]; //0x38A
	u8 mEmailIds[100]; //0x51A
	u8 field_0x57E[2]; //0x57E, alignment?
	u32 mEmailReceivedFlags[4]; //0x580
	u32 mEmailReadFlags[4]; //0x590
	u8 field_0x5A0[0x10]; //0x5A0
	u16 mShopPoints; //0x5B0
	u8 field_0x5B2[2]; //0x5B2
	u32 field_0x5B4; //0x5B4
	u8 mMerleeCurseUsesRemaining; //0x5B8
	s8 mTurnsUntilMerleeActivation; //0x5B9
	u8 mMerleeNextCurseType; //0x5BA
	u8 mSuperBowserCoins; //0x5BB
	u32 mSuperBowserScore; //0x5BC
	char yoshiName[16]; //0x5C0
	u8 field_0x5D0[4]; //0x5D0
} PouchData;

PouchData* pouchGetPtr(void);
void pouchInit(void);
ItemType pouchKeyItem(s32 id);
ItemType pouchHaveItem(s32 id);
ItemType pouchKeepItem(s32 id);
ItemType pouchHaveBadge(s32 id);
s32 pouchGetHaveItemCnt(void);
s32 pouchGetKeepItemCnt(void);
s32 pouchGetHaveBadgeCnt(void);
s32 pouchGetEquipBadgeCnt(void);
s32 pouchGetEmptyHaveItemCnt(void);
s32 pouchGetEmptyKeepItemCnt(void);
BOOL pouchGetItem(ItemType type);







u32 pouchCheckItem(u32 itemId);




BOOL pouchRemoveItem(ItemType type);




s16 pouchGetCoin(void);
s16 pouchAddCoin(s16 coins);
s16 pouchSetCoin(s16 coins);
s16 pouchGetSuperCoin(void);
s16 pouchSetSuperCoin(s16 count);
s16 pouchGetStarPiece(void);
s16 pouchAddStarPiece(s16 count);
s16 pouchAddHP(s16 points);
s16 pouchGetHP(void);
s16 pouchGetMaxHP(void);
void pouchSetHP(s16 points);
void pouchSetMaxHP(s16 points);
s16 pouchGetPartyHP(MarioPartner partnerId);
void pouchSetPartyHP(MarioPartner partnerId, s16 points);
s16 pouchGetFP(void);
s16 pouchGetMaxFP(void);
void pouchSetFP(s16 points);
void pouchSetMaxFP(s16 points);
s16 pouchGetAP(void);
void pouchAddAP(s16 points);
void pouchSetAP(s16 points);
s16 pouchGetMaxAP(void);
f32 pouchGetAudienceNum(void);
void pouchSetAudienceNum(f32 num);
s32 pouchGetJumpLv(void);
s32 pouchGetHammerLv(void);
s16 pouchGetPartyAttackLv(MarioPartner partnerId);
BOOL pouchAddKeepItem(s16 id);
BOOL pouchRemoveKeepItem(s32 id, s32 index);
void pouchReviseMarioParam(void);
void pouchRevisePartyParam(void);
u16 pouchGetStarPoint(void);
BOOL pouchEquipBadgeIndex(s32 index);
BOOL pouchUnEquipBadgeIndex(s32 index);
s32 pouchEquipCheckBadge(s32 badgeId);
BOOL pouchEquipCheckBadgeIndex(s32 index);
BOOL pouchEquipBadgeID(s32 badgeId);
BOOL pouchUnEquipBadgeID(s32 badgeId);
s32 pouchArriveBadge(s32 id);
void pouchMajinaiInit(u32 curseCount);
u8 pouchGetKpaCoin(void);
void pouchAddKpaCoin(u8 coins);
u32 pouchGetKpaScore(void);
void pouchAddKpaScore(u32 score);
void pouchGetStarStone(u32 id);
s32 pouchReceiveMailCount(void);
void pouchReceiveMail(s32 mailId);
void pouchOpenMail(s32 mailId);
u32 pouchCheckMail(s32 mailId);
s32 pouchGetPartyColor(MarioPartner partnerId);
void pouchSetPartyColor(MarioPartner partnerId, u16 color);
void pouchSetYoshiName(char* name);
char* pouchGetYoshiName(void);