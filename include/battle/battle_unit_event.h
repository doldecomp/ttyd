#pragma once

#include <dolphin/types.h>
#include "battle/battle.h"
#include "battle/battle_unit.h"

BOOL BattleCheckEndUnitInitEvent(BattleWork* wp);
s32 BattleRunHitEventDirect(BattleUnit* unit, s32 damageCode, void* code);
s32 BattleRunHitEvent(BattleUnit* unit, s32 damageCode);
s32 BattleRunPhaseEvent(BattleUnit* unit, BOOL isUnison);
void BattlePhaseEventStartDeclare(BattleUnit* unit);
s32 BattleRunWaitEvent(BattleUnit* unit);
