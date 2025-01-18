#pragma once

#include <dolphin/types.h>
#include "battle/battle_stage_object.h"

typedef struct BattleStageSpotEntry {
	u8 field_0x0[0x2C - 0x0]; //0x0
} BattleStageSpotEntry;

typedef struct BattleStageSpotWork {
	s32 count; //0x0
	BattleStageSpotEntry* entries; //0x4
	u8 field_0x8[4]; //0x8
} BattleStageSpotWork;

typedef struct BattleStageData {
	char* mGlobalStageDataDir; //0x0
	char* mSpecificStageDataDir; //0x4
	u32 mNumObjects; //0x8
	BattleStageObjectData* mObjects; //0xC, TODO extern?
} BattleStageData;

typedef struct BattleStage {
	u8 field_0x0[0xB3C - 0x0]; //0x0
} BattleStage;

BattleStage* BattleStageGetPtr(void);



void BattleStageInit(void);
void BattleStageMain(void);
void BattleStageEnd(void);



