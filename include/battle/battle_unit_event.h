#pragma once

#include <dolphin/types.h>
#include "battle/battle.h"
#include "battle/battle_unit.h"

BOOL BattleCheckEndUnitInitEvent(BattleWork* wp);
s32 BattleRunHitEventDirect(BattleWorkUnit* unit, s32 damageCode, void* code);
s32 BattleRunHitEvent(BattleWorkUnit* unit, s32 damageCode);
s32 BattleRunPhaseEvent(BattleWorkUnit* unit, BOOL isUnison);
void BattlePhaseEventStartDeclare(BattleWorkUnit* unit);
s32 BattleRunWaitEvent(BattleWorkUnit* unit);
