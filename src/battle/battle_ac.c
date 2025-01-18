#include "battle/battle_ac.h"
#include "battle/battle.h"
#include "battle/ac/ac_table.h"
#include "driver/dispdrv.h"

extern ActionCommandEntry ActionCommandList[];
extern BattleWork* _battleWorkPointer;

//local prototypes
u32 BattleACPadCheckRecordTrigger(s32 chan, s32 mask);


void BattleActionCommandManagerInit(BattleWork* wp) {
	BtlPad_WorkInit(&wp->actionCommands.pad);
	wp->actionCommands.maincb = NULL;
	wp->actionCommands.resultcb = NULL;
	wp->actionCommands.dispcb = NULL;
	wp->actionCommands.deletecb = NULL;
	wp->actionCommands.field_0x288 = -1;
}

void BattleActionCommandManager(BattleWork* wp) {
	BattleACMainCallback main;
	DispCallback disp;

	BtlPad_WorkUpdate(&wp->actionCommands.pad, 0);
	main = wp->actionCommands.maincb;
	if (main) {
		if (!main(wp)) {
			wp->actionCommands.maincb = NULL;
		}

		disp = wp->actionCommands.dispcb;
		if (disp) {
			dispEntry(CAMERA_2D, 1, disp, wp, 900.0f);
		}
	}
}

s32 BattleActionCommandResult(BattleWork* wp) {
	BattleACResultCallback result;

	result = wp->actionCommands.resultcb;
	if (result) {
		return result(wp);
	}
	else {
		return wp->actionCommands.result & 2;
	}
}

void BattleActionCommandDeclareACResult(BattleWork* work, BattleWeapon* weapon, s32 result) {
	if (result == -1) {
		//BattleAudience_Case_ActionCommandBad(weapon);
	}
	else {
		work->mImpendingWeaponBonuses.mWeapon = weapon;
		work->mImpendingWeaponBonuses.mSpAcSuccessMultiplier = ((f32)result * 0.25f) + 0.5f;
		work->mImpendingWeaponBonuses.field_0x9 = weapon->field_0x19;
		work->mImpendingWeaponBonuses.mBingoSlotChance = weapon->mBingoSlotChance;
		//BattleAudience_Case_ActionCommandGood();
	}
}

void BattleActionCommandSetup(BattleWork* work, s32 id, BattleWorkUnit* unit, s32 a4, s32 a5) {
	ActionCommandEntry* entry; // r6

	work->actionCommands.mAcUnit = unit;
	work->actionCommands.field_0x4 = a4;
	work->actionCommands.mAcState = 0;
	work->actionCommands.mResultCount = 0;
	work->actionCommands.result = 1;
	work->actionCommands.maincb = NULL;
	work->actionCommands.dispcb = NULL;
	work->actionCommands.resultcb = NULL;
	work->actionCommands.deletecb = NULL;
	work->actionCommands.field_0x8 = a5;
	work->actionCommands.field_0x30 = 0;
	entry = ActionCommandList;
	while (entry++->id) {
		if (entry->id == id) {
			work->actionCommands.maincb = entry->main;
			if (!(work->actionCommands.mAcUnit->mTokenFlags & 0x10)){
				work->actionCommands.dispcb = entry->disp;
			}
			work->actionCommands.resultcb = entry->result;
			work->actionCommands.deletecb = entry->delete;
			return;
		}
	}
}

void BattleActionCommandStart(BattleWork* work) {
	work->actionCommands.mAcState = 100;
}

void BattleActionCommandStop(BattleWork* work) {
	if (work->actionCommands.deletecb) {
		work->actionCommands.deletecb(work);
	}
}

//TODO: a2 is some pointer
s32 BattleActionCommandCheckDefence(BattleWorkUnit* unit, int a2) {
	return -2;
}

u32 BattleACPadCheckRecordTrigger(s32 chan, s32 mask) {
	return _battleWorkPointer->actionCommands.pad.mButtonsPressedHistory[chan] & mask;
}

s32 BattleActionCommandGetDefenceResult(void) {
	return _battleWorkPointer->actionCommands.mDefenseResult;
}

void BattleActionCommandResetDefenceResult(void) {
	_battleWorkPointer->actionCommands.mDefenseResult = 0;
	BtlPad_WorkInit(&_battleWorkPointer->actionCommands.pad);
}

s8 BattleActionCommandGetDifficulty(BattleWork* work) {
	return work->actionCommands.mAcDifficulty;
}

void BattleActionCommandSetDifficulty(BattleWork* work, BattleWorkUnit* unit, s32 difficulty) {
	s32 adjusted;

	work->actionCommands.mBaseAcDifficulty = difficulty;
	adjusted = difficulty - unit->mBadgesEquipped.mSimplifier + unit->mBadgesEquipped.mUnsimplifier;
	if (adjusted < 0) {
		adjusted = 0;
	}
	if (adjusted > 6) {
		adjusted = 6;
	}
	work->actionCommands.mAcDifficulty = adjusted;
}
