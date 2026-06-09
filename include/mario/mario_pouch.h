#pragma once

#include <dolphin/types.h>

#define MAX_KEY_ITEMS 121
// TODO: change name if it collides with backpack something
#define MAX_HELD_ITEMS 20
#define HELD_ITEM_COUNT_BASE 10
#define GetHeldItemCount pouchCheckItem(ITEM_STRANGE_SACK) ? MAX_HELD_ITEMS : HELD_ITEM_COUNT_BASE
#define MAX_STORED_ITEMS 32
#define MAX_BADGES 200

// 4-byte wide, using u16 casting for mario_pouch
typedef enum ItemType {
    ITEM_NULL, // 0x0
    // Key Items ------------------------------------------
    ITEM_STRANGE_SACK,                 // 0x1
#define KEY_ITEM_MIN ITEM_STRANGE_SACK // 0x1
    ITEM_PAPER_CURSE,                  // 0x2
    ITEM_TUBE_CURSE,                   // 0x3
    ITEM_PLANE_CURSE,                  // 0x4
    ITEM_BOAT_CURSE,                   // 0x5
    ITEM_BOOTS,                        // 0x6
    ITEM_SUPER_BOOTS,                  // 0x7
    ITEM_ULTRA_BOOTS,                  // 0x8
    ITEM_HAMMER,                       // 0x9
    ITEM_SUPER_HAMMER,                 // 0xA
    ITEM_ULTRA_HAMMER,                 // 0xB
    ITEM_CASTLE_KEY_0x0C,              // 0xC
    ITEM_CASTLE_KEY_0x0D,              // 0xD
    ITEM_CASTLE_KEY_0x0E,              // 0xE
    ITEM_CASTLE_KEY_0x0F,              // 0xF
    ITEM_RED_KEY,                      // 0x10
    ITEM_BLUE_KEY,                     // 0x11
    ITEM_STORAGE_KEY_0x12,             // 0x12
    ITEM_STORAGE_KEY_0x13,             // 0x13
    ITEM_GROTTO_KEY,                   // 0x14
    ITEM_SHOP_KEY,                     // 0x15
    ITEM_STEEPLE_KEY_0x16,             // 0x16
    ITEM_STEEPLE_KEY_0x17,             // 0x17
    ITEM_STEEPLE_KEY_0x18,             // 0x18
    ITEM_STEEPLE_KEY_0x19,             // 0x19
    ITEM_ELEVATOR_KEY_0x1A,            // 0x1A
    ITEM_ELEVATOR_KEY_0x1B,            // 0x1B
    ITEM_ELEVATOR_KEY_0x1C,            // 0x1C
    ITEM_CARD_KEY_0x1D,                // 0x1D
    ITEM_CARD_KEY_0x1E,                // 0x1E
    ITEM_CARD_KEY_0x1F,                // 0x1F
    ITEM_CARD_KEY_0x20,                // 0x20
    ITEM_BLACK_KEY_0x21,               // 0x21
    ITEM_BLACK_KEY_0x22,               // 0x22
    ITEM_BLACK_KEY_0x23,               // 0x23
    ITEM_BLACK_KEY_0x24,               // 0x24
    ITEM_STAR_KEY,                     // 0x25
    ITEM_PALACE_KEY_0x26,              // 0x26
    ITEM_PALACE_KEY_0x27,              // 0x27
    ITEM_PALACE_KEY_0x28,              // 0x28
    ITEM_PALACE_KEY_0x29,              // 0x29
    ITEM_PALACE_KEY_0x2A,              // 0x2A
    ITEM_PALACE_KEY_0x2B,              // 0x2B
    ITEM_PALACE_KEY_0x2C,              // 0x2C
    ITEM_PALACE_KEY_0x2D,              // 0x2D
    ITEM_PALACE_KEY_0x2E,              // 0x2E
    ITEM_PALACE_KEY_0x2F,              // 0x2F
    ITEM_PALACE_KEY_0x30,              // 0x30
    ITEM_HOUSE_KEY,                    // 0x31
    ITEM_MAGICAL_MAP,                  // 0x32
    ITEM_CONTACT_LENS,                 // 0x33
    ITEM_BLIMP_TICKET,                 // 0x34
    ITEM_TRAIN_TICKET,                 // 0x35
    ITEM_MAILBOX_SP,                   // 0x36
    ITEM_SUPER_LUIGI1,                 // 0x37
    ITEM_SUPER_LUIGI2,                 // 0x38
    ITEM_SUPER_LUIGI3,                 // 0x39
    ITEM_SUPER_LUIGI4,                 // 0x3A
    ITEM_SUPER_LUIGI5,                 // 0x3B
    ITEM_COOKBOOK,                     // 0x3C
    ITEM_MOON_STONE,                   // 0x3D
    ITEM_SUN_STONE,                    // 0x3E
    ITEM_NECKLACE,                     // 0x3F
    ITEM_PUNI_ORB,                     // 0x40
    ITEM_CHAMPS_BELT,                  // 0x41
    ITEM_POISONED_CAKE,                // 0x42
    ITEM_SUPERBOMBOMB,                 // 0x43
    ITEM_THE_LETTER_P,                 // 0x44
    ITEM_OLD_LETTER,                   // 0x45
    ITEM_CHUCKOLA_COLA,                // 0x46
    ITEM_SKULL_GEM,                    // 0x47
    ITEM_GATE_HANDLE,                  // 0x48
    ITEM_WEDDING_RING,                 // 0x49
    ITEM_GALLEY_POT,                   // 0x4A
    ITEM_GOLD_RING,                    // 0x4B
    ITEM_SHELL_EARRINGS,               // 0x4C
    ITEM_AUTOGRAPH,                    // 0x4D
    ITEM_RAGGED_DIARY,                 // 0x4E
    ITEM_BLANKET,                      // 0x4F
    ITEM_VITAL_PAPER,                  // 0x50
    ITEM_BRIEFCASE,                    // 0x51
    ITEM_GOLDBOB_GUIDE,                // 0x52
    ITEM_UNK_PAPER_0x53,               // 0x53
    ITEM_UNK_PAPER_0x54,               // 0x54
    ITEM_COG,                          // 0x55
    ITEM_DATA_DISK,                    // 0x56
    ITEM_SHINE_SPRITE,                 // 0x57
    ITEM_ULTRA_STONE,                  // 0x58
    ITEM_BOWSER_BROS_MEAT,             // 0x59
    ITEM_MARIO_POSTER,                 // 0x5A
    ITEM_SPECIAL_CARD,                 // 0x5B
    ITEM_PLATINUM_CARD,                // 0x5C
    ITEM_GOLD_CARD,                    // 0x5D
    ITEM_SILVER_CARD,                  // 0x5E
    ITEM_BOX,                          // 0x5F
    ITEM_MAGICAL_MAP_LARGE,            // 0x60
    ITEM_DUBIOUS_PAPER,                // 0x61
    ITEM_ROUTING_SLIP,                 // 0x62
    ITEM_WRESTLING_MAG,                // 0x63
    ITEM_PRESENT,                      // 0x64
    ITEM_BLUE_POTION,                  // 0x65
    ITEM_RED_POTION,                   // 0x66
    ITEM_ORANGE_POTION,                // 0x67
    ITEM_GREEN_POTION,                 // 0x68
    ITEM_UNK_STAR_0x69,                // 0x69
    ITEM_LOTTERY_PICK,                 // 0x6A
    ITEM_BATTLE_TRUNKS,                // 0x6B
    ITEM_UP_ARROW,                     // 0x6C
    ITEM_PACKAGE,                      // 0x6D
    ITEM_ATTACK_FX_B_KEY_ITEM,         // 0x6E
    ITEM_UNKNOWN_0x6F,                 // 0x6F
    ITEM_UNKNOWN_0x70,                 // 0x70
    ITEM_UNKNOWN_0x71,                 // 0x71
    ITEM_DIAMOND_STAR,                 // 0x72
    ITEM_EMERALD_STAR,                 // 0x73
    ITEM_GOLD_STAR,                    // 0x74
    ITEM_RUBY_STAR,                    // 0x75
    ITEM_SAPPHIRE_STAR,                // 0x76
    ITEM_GARNET_STAR,                  // 0x77
    ITEM_CRYSTAL_STAR,                 // 0x78
#define KEY_ITEM_MAX ITEM_CRYSTAL_STAR + 1
#define KEY_ITEM_COUNT (KEY_ITEM_MAX - KEY_ITEM_MIN)
    // Normal Items ---------------------------------------
    ITEM_COIN,             // 0x79
#define ITEM_MIN ITEM_COIN // 0x79
    ITEM_PIANTA_TOKEN,     // 0x7A
    ITEM_HEART,            // 0x7B
    ITEM_FLOWER,           // 0x7C
    ITEM_STAR_PIECE,       // 0x7D
    ITEM_GOLD_BAR,         // 0x7E
    ITEM_GOLD_BAR_X3,      // 0x7F
    ITEM_THUNDER_BOLT,     // 0x80
    ITEM_THUNDER_RAGE,     // 0x81
    ITEM_SHOOTING_STAR,    // 0x82
    ITEM_ICE_STORM,        // 0x83
    ITEM_FIRE_FLOWER,      // 0x84
    ITEM_EARTH_QUAKE,      // 0x85
    ITEM_BOOS_SHEET,       // 0x86
    ITEM_VOLT_SHROOM,      // 0x87
    ITEM_REPEL_CAPE,       // 0x88
    ITEM_RUIN_POWDER,      // 0x89
    ITEM_SLEEPY_SHEEP,     // 0x8A
    ITEM_POW_BLOCK,        // 0x8B
    ITEM_STOPWATCH,        // 0x8C
    ITEM_DIZZY_DIAL,       // 0x8D
    ITEM_POWER_PUNCH,      // 0x8E
    ITEM_COURAGE_SHELL,    // 0x8F
    ITEM_HP_DRAIN_ITEM,    // 0x90
    ITEM_TRADE_OFF,        // 0x91
    ITEM_MINI_MR_MINI,     // 0x92
    ITEM_MR_SOFTENER,      // 0x93
    ITEM_MUSHROOM,         // 0x94
    ITEM_SUPER_SHROOM,     // 0x95
    ITEM_ULTRA_SHROOM,     // 0x96
    ITEM_LIFE_SHROOM,      // 0x97
    ITEM_DRIED_SHROOM,     // 0x98
    ITEM_TASTY_TONIC,      // 0x99
    ITEM_HONEY_SYRUP,      // 0x9A
    ITEM_MAPLE_SYRUP,      // 0x9B
    ITEM_JAMMIN_JELLY,     // 0x9C
    ITEM_SLOW_SHROOM,      // 0x9D
    ITEM_GRADUAL_SYRUP,    // 0x9E
    ITEM_HOT_DOG,          // 0x9F
    ITEM_CAKE,             // 0xA0
    ITEM_POINT_SWAP,       // 0xA1
    ITEM_FRIGHT_MASK,      // 0xA2
    ITEM_MYSTERY,          // 0xA3
    ITEM_INN_COUPON,       // 0xA4
    ITEM_WHACKA_BUMP,      // 0xA5
    ITEM_COCONUT,          // 0xA6
    ITEM_DRIED_BOUQUET,    // 0xA7
    ITEM_MYSTIC_EGG,       // 0xA8
    ITEM_GOLDEN_LEAF,      // 0xA9
    ITEM_KEEL_MANGO,       // 0xAA
    ITEM_FRESH_PASTA,      // 0xAB
    ITEM_CAKE_MIX,         // 0xAC
    ITEM_HOT_SAUCE,        // 0xAD
    ITEM_TURTLEY_LEAF,     // 0xAE
    ITEM_HORSETAIL,        // 0xAF
    ITEM_PEACHY_PEACH,     // 0xB0
    ITEM_SPITE_POUCH,      // 0xB1
    ITEM_KOOPA_CURSE,      // 0xB2
    ITEM_SHROOM_FRY,       // 0xB3
    ITEM_SHROOM_ROAST,     // 0xB4
    ITEM_SHROOM_STEAK,     // 0xB5
    ITEM_MISTAKE,          // 0xB6
    ITEM_HONEY_SHROOM,     // 0xB7
    ITEM_MAPLE_SHROOM,     // 0xB8
    ITEM_JELLY_SHROOM,     // 0xB9
    ITEM_HONEY_SUPER,      // 0xBA
    ITEM_MAPLE_SUPER,      // 0xBB
    ITEM_JELLY_SUPER,      // 0xBC
    ITEM_HONEY_ULTRA,      // 0xBD
    ITEM_MAPLE_ULTRA,      // 0xBE
    ITEM_JELLY_ULTRA,      // 0xBF
    ITEM_SPICY_SOUP,       // 0xC0
    ITEM_ZESS_DINNER,      // 0xC1
    ITEM_ZESS_SPECIAL,     // 0xC2
    ITEM_ZESS_DELUXE,      // 0xC3
    ITEM_ZESS_DYNAMITE,    // 0xC4
    ITEM_ZESS_TEA,         // 0xC5
    ITEM_SPACE_FOOD,       // 0xC6
    ITEM_ICICLE_POP,       // 0xC7
    ITEM_ZESS_FRAPPE,      // 0xC8
    ITEM_SNOW_BUNNY,       // 0xC9
    ITEM_COCONUT_BOMB,     // 0xCA
    ITEM_COURAGE_MEAL,     // 0xCB
    ITEM_SHROOM_CAKE,      // 0xCC
    ITEM_SHROOM_CREPE,     // 0xCD
    ITEM_MOUSSE_CAKE,      // 0xCE
    ITEM_FRIED_EGG,        // 0xCF
    ITEM_FRUIT_PARFAIT,    // 0xD0
    ITEM_EGG_BOMB,         // 0xD1
    ITEM_INK_PASTA,        // 0xD2
    ITEM_SPAGHETTI,        // 0xD3
    ITEM_SHROOM_BROTH,     // 0xD4
    ITEM_POISON_SHROOM,    // 0xD5
    ITEM_CHOCO_CAKE,       // 0xD6
    ITEM_MANGO_DELIGHT,    // 0xD7
    ITEM_LOVE_PUDDING,     // 0xD8
    ITEM_METEOR_MEAL,      // 0xD9
    ITEM_TRIAL_STEW,       // 0xDA
    ITEM_COUPLES_CAKE,     // 0xDB
    ITEM_INKY_SAUCE,       // 0xDC
    ITEM_OMELETTE_MEAL,    // 0xDD
    ITEM_KOOPA_TEA,        // 0xDE
    ITEM_KOOPASTA,         // 0xDF
    ITEM_SPICY_PASTA,      // 0xE0
    ITEM_HEARTFUL_CAKE,    // 0xE1
    ITEM_PEACH_TART,       // 0xE2
    ITEM_ELECTRO_POP,      // 0xE3
    ITEM_FIRE_POP,         // 0xE4
    ITEM_HONEY_CANDY,      // 0xE5
    ITEM_COCO_CANDY,       // 0xE6
    ITEM_JELLY_CANDY,      // 0xE7
    ITEM_ZESS_COOKIE,      // 0xE8
    ITEM_HEALTHY_SALAD,    // 0xE9
    ITEM_KOOPA_BUN,        // 0xEA
    ITEM_FRESH_JUICE,      // 0xEB
#define ITEM_MAX ITEM_FRESH_JUICE + 1
#define ITEM_COUNT (ITEM_MAX - ITEM_MIN)
    // ??? ------------------------------------------------
    // Audience-thrown items
    ITEM_AUDIENCE_CAN,    // 0xEC
    ITEM_AUDIENCE_ROCK,   // 0xED
    ITEM_AUDIENCE_BONE,   // 0xEE
    ITEM_AUDIENCE_HAMMER, // 0xEF
    // Badges ---------------------------------------------
    ITEM_POWER_JUMP,              // 0xF0
#define BADGE_MIN ITEM_POWER_JUMP // 0xF0
    ITEM_MULTIBOUNCE,             // 0xF1
    ITEM_POWER_BOUNCE,            // 0xF2
    ITEM_TORNADO_JUMP,            // 0xF3
    ITEM_SHRINK_STOMP,            // 0xF4
    ITEM_SLEEPY_STOMP,            // 0xF5
    ITEM_SOFT_STOMP,              // 0xF6
    ITEM_POWER_SMASH,             // 0xF7
    ITEM_QUAKE_HAMMER,            // 0xF8
    ITEM_HAMMER_THROW,            // 0xF9
    ITEM_PIERCING_BLOW,           // 0xFA
    ITEM_HEAD_RATTLE,             // 0xFB
    ITEM_FIRE_DRIVE,              // 0xFC
    ITEM_ICE_SMASH,               // 0xFD
    ITEM_DOUBLE_DIP,              // 0xFE
    ITEM_DOUBLE_DIP_P,            // 0xFF
    ITEM_CHARGE,                  // 0x100
    ITEM_CHARGE_P,                // 0x101
    ITEM_SUPER_APPEAL,            // 0x102
    ITEM_SUPER_APPEAL_P,          // 0x103
    ITEM_POWER_PLUS,              // 0x104
    ITEM_POWER_PLUS_P,            // 0x105
    ITEM_P_UP_D_DOWN,             // 0x106
    ITEM_P_UP_D_DOWN_P,           // 0x107
    ITEM_ALL_OR_NOTHING,          // 0x108
    ITEM_ALL_OR_NOTHING_P,        // 0x109
    ITEM_MEGA_RUSH,               // 0x10A
    ITEM_MEGA_RUSH_P,             // 0x10B
    ITEM_POWER_RUSH,              // 0x10C
    ITEM_POWER_RUSH_P,            // 0x10D
    ITEM_P_DOWN_D_UP,             // 0x10E
    ITEM_P_DOWN_D_UP_P,           // 0x10F
    ITEM_LAST_STAND,              // 0x110
    ITEM_LAST_STAND_P,            // 0x111
    ITEM_DEFEND_PLUS,             // 0x112
    ITEM_DEFEND_PLUS_P,           // 0x113
    ITEM_DAMAGE_DODGE,            // 0x114
    ITEM_DAMAGE_DODGE_P,          // 0x115
    ITEM_HP_PLUS,                 // 0x116
    ITEM_HP_PLUS_P,               // 0x117
    ITEM_FP_PLUS,                 // 0x118
    ITEM_FLOWER_SAVER,            // 0x119
    ITEM_FLOWER_SAVER_P,          // 0x11A
    ITEM_ICE_POWER,               // 0x11B
    ITEM_SPIKE_SHIELD,            // 0x11C
    ITEM_FEELING_FINE,            // 0x11D
    ITEM_FEELING_FINE_P,          // 0x11E
    ITEM_ZAP_TAP,                 // 0x11F
    ITEM_DOUBLE_PAIN,             // 0x120
    ITEM_JUMPMAN,                 // 0x121
    ITEM_HAMMERMAN,               // 0x122
    ITEM_RETURN_POSTAGE,          // 0x123
    ITEM_HAPPY_HEART,             // 0x124
    ITEM_HAPPY_HEART_P,           // 0x125
    ITEM_HAPPY_FLOWER,            // 0x126
    ITEM_HP_DRAIN_BADGE,          // 0x127
    ITEM_HP_DRAIN_P,              // 0x128
    ITEM_FP_DRAIN,                // 0x129
    ITEM_FP_DRAIN_P,              // 0x12A
    ITEM_CLOSE_CALL,              // 0x12B
    ITEM_CLOSE_CALL_P,            // 0x12C
    ITEM_PRETTY_LUCKY,            // 0x12D
    ITEM_PRETTY_LUCKY_P,          // 0x12E
    ITEM_LUCKY_DAY,               // 0x12F
    ITEM_LUCKY_DAY_P,             // 0x130
    ITEM_REFUND,                  // 0x131
    ITEM_PITY_FLOWER,             // 0x132
    ITEM_PITY_FLOWER_P,           // 0x133
    ITEM_QUICK_CHANGE,            // 0x134
    ITEM_PEEKABOO,                // 0x135
    ITEM_TIMING_TUTOR,            // 0x136
    ITEM_HEART_FINDER,            // 0x137
    ITEM_FLOWER_FINDER,           // 0x138
    ITEM_MONEY_MONEY,             // 0x139
    ITEM_ITEM_HOG,                // 0x13A
    ITEM_ATTACK_FX_R,             // 0x13B
    ITEM_ATTACK_FX_B,             // 0x13C
    ITEM_ATTACK_FX_G,             // 0x13D
    ITEM_ATTACK_FX_Y,             // 0x13E
    ITEM_ATTACK_FX_P,             // 0x13F
    ITEM_CHILL_OUT,               // 0x140
    ITEM_FIRST_ATTACK,            // 0x141
    ITEM_BUMP_ATTACK,             // 0x142
    ITEM_SLOW_GO,                 // 0x143
    ITEM_SIMPLIFIER,              // 0x144
    ITEM_UNSIMPLIFIER,            // 0x145
    ITEM_LUCKY_START,             // 0x146
    ITEM_L_EMBLEM,                // 0x147
    ITEM_W_EMBLEM,                // 0x148
    ITEM_TRIPLE_DIP,              // 0x149
    ITEM_LUCKY_START_P,           // 0x14A
    ITEM_AUTO_COMMAND_BADGE,      // 0x14B
    ITEM_MEGA_JUMP,               // 0x14C
    ITEM_MEGA_SMASH,              // 0x14D
    ITEM_MEGA_QUAKE,              // 0x14E
    ITEM_UNUSED_DEFEND_BADGE,     // 0x14F
    ITEM_UNUSED_DEFEND_BADGE_P,   // 0x150
    ITEM_SUPER_CHARGE,            // 0x151
    ITEM_SUPER_CHARGE_P,          // 0x152
#define BADGE_MAX ITEM_SUPER_CHARGE_P + 1
#define BADGE_COUNT (BADGE_MAX - BADGE_MIN)
    ITEM_TYPE_MAX
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
    u16 flags;       // 0x0
    s16 maximumHP;   // 0x2, includes HP Plus P boost
    s16 baseMaxHP;   // 0x4
    s16 currentHP;   // 0x6
    s16 HPLevel;     // 0x8
    s16 attackLevel; // 0xA
    s16 techLevel;   // 0xC
} PouchPartyData;

typedef struct PouchData {
    PouchPartyData partyData[8];       // 0x0
    s16 currentHP;                     // 0x70
    s16 maximumHP;                     // 0x72, includes HP Plus boost
    s16 currentFP;                     // 0x74
    s16 maximumFP;                     // 0x76, includes FP Plus boost
    s16 coins;                         // 0x78
    s16 currentSP;                     // 0x7A
    s16 maximumSP;                     // 0x7C
    s16 field_0x7E;                    // 0x7E
    s16 field_0x80;                    // 0x80
    s16 field_0x82;                    // 0x82
    f32 audienceCount;                 // 0x84
    s16 rank;                          // 0x88
    s16 level;                         // 0x8A
    s16 mStarPowersObtained;           // 0x8C
    s16 baseMaxHP;                     // 0x8E
    s16 baseMaxFP;                     // 0x90
    s16 availableBP;                   // 0x92
    s16 maximumBP;                     // 0x94
    s16 mStarPoints;                   // 0x96
    s8 jumpLevel;                      // 0x98
    s8 hammerLevel;                    // 0x99
    s16 mStarPieceCount;               // 0x9A
    s16 mShineSpriteCount;             // 0x9C
    s16 mPowerBounceRecord;            // 0x9E, Pit of 100 Trials
    s16 keyItems[MAX_KEY_ITEMS];       // 0xA0
    s16 heldItems[MAX_HELD_ITEMS];     // 0x192
    s16 storedItems[MAX_STORED_ITEMS]; // 0x1BA
    s16 badges[MAX_BADGES];            // 0x1FA
    s16 equippedBadges[MAX_BADGES];    // 0x38A
    u8 mEmailIds[100];                 // 0x51A
    u8 field_0x57E[2];                 // 0x57E, alignment?
    u32 mEmailReceivedFlags[4];        // 0x580
    u32 mEmailReadFlags[4];            // 0x590
    u8 field_0x5A0[0x10];              // 0x5A0
    u16 mShopPoints;                   // 0x5B0
    u8 field_0x5B2[2];                 // 0x5B2
    u32 field_0x5B4;                   // 0x5B4
    u8 mMerleeCurseUsesRemaining;      // 0x5B8
    s8 mTurnsUntilMerleeActivation;    // 0x5B9
    u8 mMerleeNextCurseType;           // 0x5BA
    u8 mSuperBowserCoins;              // 0x5BB
    u32 mSuperBowserScore;             // 0x5BC
    char yoshiName[16];                // 0x5C0
    u8 field_0x5D0[4];                 // 0x5D0
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
