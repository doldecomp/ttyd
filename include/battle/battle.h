#pragma once

#include <dolphin/types.h>
#include "battle/battle_ac.h"
#include "battle/battle_audience.h"
#include "battle/battle_camera.h"
#include "battle/battle_database_common.h"
#include "battle/battle_icon.h"
#include "battle/battle_information.h"
#include "battle/battle_pad.h"
#include "battle/battle_seq_command.h"
#include "battle/battle_stage.h"
#include "battle/battle_stage_object.h"
#include "battle/battle_unit.h"
#include "battle/battle_seq_end.h"
#include "mario/mario_pouch.h"

typedef struct BattleWork BattleWork;
typedef struct BattleWorkCommand BattleWorkCommand;
typedef struct BattleWorkAlliance BattleWorkAlliance;
typedef struct BattleWorkCommandAction BattleWorkCommandAction;
typedef struct BattleWorkCommandWeapon BattleWorkCommandWeapon;
typedef struct BattleWorkCommandOperation BattleWorkCommandOperation;
typedef struct BattleWorkCommandParty BattleWorkCommandParty;
typedef struct BattleWorkCommandMultiItem BattleWorkCommandMultiItem;
typedef struct BattleWorkCommandCursor BattleWorkCommandCursor;
typedef struct BattleWorkCommandWindow BattleWorkCommandWindow;

typedef enum BattleFlags { BATTLE_SEQ_END = 0x80000000 } BattleFlags;

typedef enum BattleSequence {
    SEQ_UNKNOWN = 0,
    SEQ_INIT = 1,
    SEQ_FIRST_ACT = 2,
    SEQ_TURN = 3,
    SEQ_PHASE = 4,
    SEQ_MOVE = 5,
    SEQ_ACT = 6,
    SEQ_END = 7
} BattleSequence;

// deprecated ------------------------------------------------------------
struct BattleWorkCommandAction {
    u32 mType;      // 0x0
    BOOL mEnabled;  // 0x4
    char* mName;    // 0x8
    u16 mIcon;      // 0xC
    u8 pad_0xE[2];  // 0xE
    u32 field_0x10; // 0x10, mDisabled?
};

struct BattleWorkCommandWeapon {
    BattleWeapon* mWeaponParams; // 0x0
    u32 field_0x4;               // 0x4
    char* mName;                 // 0x8
    u16 mIcon;                   // 0xC
    u8 pad_0xE[2];               // 0xE
    u32 mIndex;                  // 0x10
    ItemType mItem;              // 0x14
    u32 field_0x18;              // 0x18
};

struct BattleWorkCommandOperation {
    u32 mType;          // 0x0
    BOOL mEnabled;      // 0x4
    u32 field_0x8;      // 0x8, mDisabled?
    char* mName;        // 0xC
    u16 mIcon;          // 0x10
    u8 pad_0x12[2];     // 0x12
    char* mDescription; // 0x14
    u32 mWeaponCost;    // 0x18
};

struct BattleWorkCommandParty {
    BattleUnitType mPartyId; // 0x0
    BOOL mEnabled;           // 0x4
    char* mName;             // 0x8
    u16 mIcon;               // 0xC
    u8 pad_0xE[2];           // 0xE
    char* mDescription;      // 0x10
    u16 mCurrentHP;          // 0x14
    u16 mMaxHP;              // 0x16
};

struct BattleWorkCommandMultiItem {
    BOOL mEnabled;      // 0x0
    char* mName;        // 0x4
    char* mDescription; // 0x8
    u16 mIcon;          // 0xC
    u8 pad_0xE[2];      // 0xE
    u32 mWeaponCost;    // 0x10
    u32 field_0x14;     // 0x14, mDisabled?
};

struct BattleWorkCommandCursor {
    u32 mAbsolutePos; // 0x0
    u32 mRelativePos; // 0x4
    u32 mNumOptions;  // 0x8
};

struct BattleWorkCommandWindow {
    u8 field_0x0[0x124 - 0]; // 0x0
};

// TODO: modularize for more actions/party members?
struct BattleWorkCommand {
    u32 mCurrentState;                             // 0x0
    u32 mCurrentMenu;                              // 0x4
    BattleWorkCommandAction mActionTable[6];       // 0x8
    BattleWorkCommandWeapon mWeaponTable[21];      // 0x80
    BattleWorkCommandOperation mOperationTable[7]; // 0x2CC
    BattleWorkCommandParty mPartyTable[8];         // 0x390
    BattleWorkCommandMultiItem mMultiItemTable[3]; // 0x450
    BattleWorkCommandCursor mCursors[14];          // 0x498
    u8 field_0x540[0x55C - 0x540];                 // 0x540
    BattleWorkCommandWindow* mWindowWork;          // 0x55C
    u8 field_0x560[0x574 - 0x560];                 // 0x560
};
// end deprecated ----------------------------------------------------

typedef struct BattleWorkActRecord {
    u8 field_0x0[0x24 - 0x0]; // 0x0
} BattleWorkActRecord;

struct BattleWorkAlliance {
    s16 mAllianceId;        // 0x0
    s8 mAttackDirection;    // 0x2
    u8 pad_3;               // 0x3, TODO remove?
    u32 mClearConditionMet; // 0x4
};

struct BattleWork {
    u16 mTurnCount;                        // 0x0
    u16 pad_0x2;                           // 0x2
    u32 mSeq_Unknown;                      // 0x4
    BattleWorkAlliance mAllianceInfo[3];   // 0x8
    BattleWorkUnit* mUnits[64];            // 0x20
    u8 field_0x120[0x424 - 0x120];         // 0x120
    s32 field_0x424;                       // 0x424
    u8 field_0x428[0xEF4 - 0x428];         // 0x428
    BattleFlags flags;                     // 0xEF4
    s32 mIconFlags;                        // 0xEF8, TODO better name?
    u8 field_0xEFC[0xF0C - 0xEFC];         // 0xEFC
    u32 mSeqInit;                          // 0xF0C
    u32 mSeqFirstAct;                      // 0xF10
    u32 mSeqTurn;                          // 0xF14
    u32 mSeqPhase;                         // 0xF18
    u32 mSeqMove;                          // 0xF1C
    u32 mSeqAct;                           // 0xF20
    u32 mSeqEnd;                           // 0xF24
    BattleSeqEndWork* seqEndWork;          // 0xF28
    BattleWorkPad mPadWork[4];             // 0xF2C
    BattleCommand commandMenu;             // 0x171C
    BattleACManager actionCommands;        // 0x1C90
    FieldBattleInfo* fbatInfo;             // 0x2738
    u8 field_0x273C[0x2754 - 0x273C];      // 0x273C
    BattleCameraWork cameraWork;           // 0x2754
    BattleAudience audience;               // 0x2858
    u8 field_0x1616C[0x163B8 - 0x1616C];   // 0x1616C
    u32 mTattledUnitTypeFlags[8];          // 0x163B8 JP, 0x163D4 US
    s32 mBadgeEquippedFlags;               // 0x163D8
    FileEntry* menuTex;                    // 0x163DC JP, 0x163F8 US, battle_menu_disp
    u8 field_0x163DC[0x163E0 - 0x163DC];   // 0x163DC
    BattleStage stage;                     // 0x163E0 JP, 0x163FC US
    u8 field_16F1C[0x17140 - 0x16F1C];     // 0x16F1C
    BattleStageObject stageObjects[32];    // 0x17140 JP, 0x1715C US
    u8 field_0x180C0[0x182B0 - 0x180C0];   // 0x180C0, 0x180DC in US
    BattleWorkIcon iconWork[16];           // 0x182B0, TODO: rename to just "icon"?
    s16 field_0x18C70;                     // 0x18C70 JP, 0x18C8C US, _disp Xpos something
    s16 field_0x18C82;                     // 0x18C72 JP, 0x18C7E US, _disp Ypos something
    u8 field_0x18C84[0x18FE0 - 0x18C84];   // 0x18C84
    s8 alertTick;                          // 0x18FE0 JP, 0x18FF8 US
    u8 field_0x18FE1[3];                   // 0x18FE1, padding?
    StarPowerInfo mImpendingWeaponBonuses; // 0x18FE4, 0x18FFC in US
    u8 field_0x18FF0[0x19050 - 0x18FF0];   // 0x18FF0
    u32 mReserveItems[4];                  // 0x19050
    s32 field_0x19060;                     // 0x19060
    u8 field_0x19064[0x19088 - 0x19064];   // 0x19064
};
// u32 test = sizeof(BattleWorkCommand);

void battleMain(void);

void battle_exit(void);
BOOL battle_init(void);
void BattleAfterReactionQueueInit(void);

BattleWorkUnit* BattleGetPartnerPtr(BattleWork* work, BattleWorkUnit* unit);
BattleWorkUnit* BattleGetPartyPtr(BattleWork* work);
BattleWorkUnit* BattleGetMarioPtr(BattleWork* work);
BattleWorkUnit* BattleGetSystemPtr(BattleWork* work);
BattleWorkUnitPart* BattleGetUnitPartsPtr(s32 index, s32 partNum);
void BattleSetUnitPtr(BattleWork* work, s32 index, BattleWorkUnit* unit);
BattleWorkUnit* BattleGetUnitPtr(BattleWork* work, s32 index);
void BattleFree(void* ptr);
void* BattleAlloc(u32 size);
void BattleIncSeq(BattleWork* work, s32 seq);
u32 BattleGetSeq(BattleWork* work, BattleSequence seq);
void BattleSetSeq(BattleWork* work, BattleSequence seq, u32 num);
void BattleSetMarioParamToFieldBattle(BattleWork* work);
void Btl_UnitSetup(BattleWork* work);
void BattleEnd(void);
void BattleInit(FieldBattleInfo* info);
BOOL battleSeqEndCheck(void);

struct BattleWorkUnit* BattleChangeParty(BattleWork* wp);
s32 BattleTransPartyId(BattleUnitType kind);

BOOL battleDisableHResetCheck(void);
