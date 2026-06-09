#pragma once

#include <dolphin/types.h>
#include "battle/battle_database_common.h"
#include "battle/battle_pad.h"
#include "driver/dispdrv.h"

typedef struct BattleWork BattleWork;

typedef s32 (*BattleACMainCallback)(BattleWork* work);
typedef s32 (*BattleACResultCallback)(BattleWork* work);
typedef void (*BattleACDeleteCallback)(BattleWork* work);

typedef struct BattleACDispParams {
    u8 field_0x0[0x14 - 0x0];   // 0x0
    f32 iconX;                  // 0x14, see actionCommandDisp
    f32 iconY;                  // 0x18, see actionCommandDisp
    u8 field_0x1C[0x2C - 0x1C]; // 0x1C
} BattleACDispParams;

typedef struct BattleActions {
    struct BattleUnit* mAcUnit;      // 0x0
    s32 field_0x4;                   // 0x4
    s32 field_0x8;                   // 0x8
    s32 mAcState;                    // 0xC
    BattleACMainCallback maincb;     // 0x10
    BattleACResultCallback resultcb; // 0x14
    DispCallback dispcb;             // 0x18
    BattleACDeleteCallback deletecb; // 0x1C
    s32 mDefenseResult;              // 0x20
    s32 mResultCount;                // 0x24
    s32 result;                      // 0x28
    s8 mBaseAcDifficulty;            // 0x2C
    s8 mAcDifficulty;                // 0x2D
    u8 field_0x2E[2];                // 0x2E
    s32 field_0x30;                  // 0x30
    u8 field_0x34[0x8C - 0x34];      // 0x34
    BattleWorkPad pad;               // 0x8C
    s32 field_0x288;                 // 0x288
    u8 field_0x28C[0x30C - 0x28C];   // 0x28C
} BattleActions;
// NB: 0x308 is as far as I can pin to this struct (0x1F98 in battleAcMain_PendulumCraneTiming, TODO?)

void BattleActionCommandManagerInit(BattleWork* wp);
void BattleActionCommandManager(BattleWork* wp);
s32 BattleActionCommandResult(BattleWork* work);
void BattleActionCommandDeclareACResult(BattleWork* work, BattleWeapon* weapon, s32 result);

void BattleActionCommandStart(BattleWork* work);
void BattleActionCommandStop(BattleWork* work);
s32 BattleActionCommandGetDefenceResult(void);
void BattleActionCommandResetDefenceResult(void);
s8 BattleActionCommandGetDifficulty(BattleWork* work);
