#pragma once

#include <dolphin/types.h>
#include "battle/battle_pad.h"
#include "driver/dispdrv.h"
#include "driver/effdrv.h"

typedef s32 (*BattleACMainCallback)(struct BattleWork* work);
typedef s32 (*BattleACResultCallback)(struct BattleWork* work);
typedef void (*BattleACDeleteCallback)(struct BattleWork* work);

typedef struct BattleACDispParams {
	u8 field_0x0[0x14 - 0x0]; //0x0
	f32 iconX; //0x14, see actionCommandDisp
	f32 iconY; //0x18, see actionCommandDisp
	u8 field_0x1C[0x2C - 0x1C]; //0x1C
} BattleACDispParams;

typedef struct BattleACExtraParams {
	u8 field_0x0[0x254 - 0x0]; //0x0
	EffectEntry* effect; //0x254
	u8 field_0x258[0x7D0 - 0x258]; //0x258
} BattleACExtraParams;

typedef struct BattleACManager {
	struct BattleWorkUnit* mAcUnit; //0x0
	s32 field_0x4; //0x4
	s32 field_0x8; //0x8
	s32 mAcState; //0xC
	BattleACMainCallback maincb; //0x10
	BattleACResultCallback resultcb; //0x14
	DispCallback dispcb; //0x18
	BattleACDeleteCallback deletecb; //0x1C
	s32 mDefenseResult; //0x20
	s32 mResultCount; //0x24
	s32 result; //0x28
	s8 mBaseAcDifficulty; //0x2C
	s8 mAcDifficulty; //0x2D
	u8 field_0x2E[2]; //0x2E
	s32 field_0x30; //0x30
	u8 field_0x34[0x8C - 0x34]; //0x34
	BattleWorkPad pad; //0x8C
	s32 field_0x288; //0x288
	u8 field_0x28C[0x290 - 0x28C]; //0x28C
	BattleACDispParams dispParams; //0x290
	BattleACExtraParams extraParams; //0x2BC
	s32 mStylishCurFrame; //0xA8C
	s32 mStylishWindowStart; //0xA90
	s32 mStylishWindowEnd; //0xA94
	s32 mStylishEndFrame; //0xA98
	s32 mStylishUnitId; //0xA9C
	s32 mStylishResult; //0xAA0
	s32 mStylishEarlyFrames; //0xAA4
} BattleACManager;

void BattleActionCommandManagerInit(struct BattleWork* wp);
void BattleActionCommandManager(struct BattleWork* wp);
s32 BattleActionCommandResult(struct BattleWork* work);
void BattleActionCommandDeclareACResult(struct BattleWork* work, struct BattleWeapon* weapon, s32 result);

void BattleActionCommandStart(struct BattleWork* work);
void BattleActionCommandStop(struct BattleWork* work);
s32 BattleActionCommandGetDefenceResult(void);
void BattleActionCommandResetDefenceResult(void);
s8 BattleActionCommandGetDifficulty(struct BattleWork* work);
