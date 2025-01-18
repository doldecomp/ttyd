#pragma once

#include "battle/battle.h"
#include <dolphin/types.h>

typedef struct ActionCommandEntry {
	s32 id;
	s32 (*main)(BattleWork* work);
	s32 (*result)(BattleWork* work);
	void (*disp)(CameraId cameraId, void* param);
	void (*delete)(BattleWork* work);
} ActionCommandEntry;

