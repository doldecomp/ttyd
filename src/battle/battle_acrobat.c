#include "battle/battle_acrobat.h"
#include "battle/battle_unit.h"
#include "driver/dispdrv.h"

//local prototypes
void accrobat_timing_icon_disp(CameraId cameraId, void* param);

s32 BattleAcrobatStart(BattleWork* work, s32 unitId, s32 windowStartFrame,
						s32 windowEndFrame, s32 endFrame, s32 earlyFrames) {
	(work->actionCommands).mStylishCurFrame = 0;
	(work->actionCommands).mStylishWindowStart = windowStartFrame;
	(work->actionCommands).mStylishWindowEnd = windowEndFrame;
	(work->actionCommands).mStylishEndFrame = endFrame;
	(work->actionCommands).mStylishUnitId = unitId;
	(work->actionCommands).mStylishResult = 0;
	(work->actionCommands).mStylishEarlyFrames = earlyFrames;
	return 0; //???
}

s32 BattleAcrobatMain(BattleWork* work) {
	BattleACManager* manager;
	BattleWorkUnit* unit;
	BOOL doSimplified;
	s32 i;

	manager = &work->actionCommands;
	unit = BattleGetUnitPtr(work, manager->mStylishUnitId);
	doSimplified = FALSE;
	manager->mStylishCurFrame++;
	if (!unit) {
		manager->mStylishResult = 1;
		return EVT_RETURN_YIELD;
	}
	if (unit->mTokenFlags & kConfusedAction) {
		manager->mStylishResult = 1;
		return EVT_RETURN_YIELD;
	}
	if ((work->mBadgeEquippedFlags & 4) && (manager->mStylishWindowStart < manager->mStylishCurFrame <= manager->mStylishWindowEnd)) {
		Vec v11 = { 0 };
		v11.x = unit->mPosition.x;
		v11.y = unit->mPosition.y;
		v11.z = 15.0f + unit->mPosition.z;
		dispEntry(CAMERA_3D, 1, accrobat_timing_icon_disp, unit, dispCalcZ(&v11));
	}
	if (unit->mBadgesEquipped.mAutoCommandBadge && (manager->mStylishWindowStart < manager->mStylishCurFrame <= manager->mStylishWindowEnd)) {
		doSimplified = TRUE;
	}
	if (manager->mStylishCurFrame <= 1 && manager->mStylishEarlyFrames > 0) {
		for (i = 0; i < manager->mStylishEarlyFrames; ++i) {
			if (BattlePadCheckRecordTrigger(i, 0x100)) {
				manager->mStylishResult = -1;
				return EVT_RETURN_YIELD;
			}
		}
	}
	if (BattlePadCheckTrigger(0x100) || doSimplified) {
		if (manager->mStylishCurFrame <= manager->mStylishWindowStart) {
			manager->mStylishResult = -1;
			return EVT_RETURN_YIELD;
		}
		else if (manager->mStylishCurFrame > manager->mStylishWindowEnd) {
			manager->mStylishResult = -2;
			return EVT_RETURN_YIELD;
		}
		else {
			manager->mStylishResult = 2;
			return EVT_RETURN_YIELD;
		}
	}
	else if (manager->mStylishCurFrame < manager->mStylishEndFrame) {
		return EVT_RETURN_BLOCK;
	}
	else {
		work->actionCommands.mStylishResult = 1;
		return EVT_RETURN_YIELD;
	}
}

//param = BattleWorkUnit* unit;
void accrobat_timing_icon_disp(CameraId cameraId, void* param) {
	BattleWorkUnit* unit = param; //cast to proper type
	f32 x, y, z; //sp 8, c, 10

	BtlUnit_GetPos(unit, &x, &y, &z);
	x += 15.0f;
	y += (f32)(BtlUnit_GetHeight(unit) + 5);
	//iconDispGx();
}

s32 BattleAcrobatGetResult(BattleWork* work, s32* result, s32* curFrame) {
	*result = work->actionCommands.mStylishResult;
	*curFrame = work->actionCommands.mStylishCurFrame;
	return EVT_RETURN_DONE;
}
