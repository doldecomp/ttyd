#pragma once

#include <dolphin/types.h>
#include "battle/battle_stage_object.h"

typedef struct BattleSpotEntry {
	u16 flags; // 0x0
	u8 field_0x2[0x4 - 0x2]; // 0x2
	Vec field_4; // 0x4
	Vec field_10; // 0x10
	Vec field_1C; // 0x1C
	s32 field_28; // 0x28, unknown, unused and set by an sbss2 var, TODO?
} BattleSpotEntry;

typedef struct BattleSpotWork {
	s32 count; //0x0
	BattleSpotEntry* entries; //0x4
	BOOL skipRender; //0x8
} BattleSpotWork;

typedef struct BattleStageData {
	char* mGlobalStageDataDir; //0x0
	char* mSpecificStageDataDir; //0x4
	u32 mNumObjects; //0x8
	BattleStageObjectData* mObjects; //0xC, TODO extern?
} BattleStageData;

typedef struct BattleWorkStage {
	u8 field_0x0[0xB3C - 0x0]; //0x0
} BattleStage;

BattleStage* BattleStageGetPtr(void);



void BattleStageInit(void);
void BattleStageMain(void);
void BattleStageEnd(void);
