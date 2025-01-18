#pragma once

#include <dolphin/types.h>
#include "battle/battle.h"

//most of these strings are tag names for text lookup
typedef struct TattleEntry {
	const char* enemyTag; //0x0, enemy name
	const char* tattleBtlTag; //0x4, Goombella Tattle description
	const char* tattleLogTag; //0x8, Tattle Log description
	const char* modelName; //0xC, for filename lookup
	const char* poseName; //0x10
	const char* locationTag; //0x14
} TattleEntry;

TattleEntry* battleGetUnitMonosiriPtr(s32 id);
BOOL battleCheckUnitMonosiriFlag(BattleWorkUnit* unit);
void battleSetUnitMonosiriFlag(BattleUnitType kind);
