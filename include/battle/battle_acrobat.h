#pragma once

#include "battle/battle.h"

s32 BattleAcrobatStart(BattleWork* work, s32 unitId, s32 windowStartFrame,
						s32 windowEndFrame, s32 endFrame, s32 earlyFrames);
s32 BattleAcrobatMain(BattleWork* work);
s32 BattleAcrobatGetResult(BattleWork* work, s32* result, s32* curFrame);