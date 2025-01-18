#include "battle/battle_status_effect.h"
#include "battle/battle_unit.h"

//.sdata
//Status Type Priority Data
s8 _st_pri_data[] = {
	kStatusCharge, //charge is elevated
	kStatusPoison, //poison is elevated
	kStatusSleep,
	kStatusStop,
	kStatusDizzy,
	kStatusConfuse,
	kStatusElectric,
	kStatusDodgy,
	kStatusBurn,
	kStatusFreeze,
	kStatusHuge,
	kStatusTiny,
	kStatusAttackUp,
	kStatusAttackDown,
	kStatusDefenseUp,
	kStatusDefenseDown,
	kStatusAllergic,
	kStatusInvisible,
	kStatusFast,
	kStatusSlow,
	kStatusPayback,
	kStatusHoldFast,
	kStatusHpRegen,
	kStatusFpRegen,
	-1
};

//local prototypes
void BSE_Sleep(BattleWorkUnit* unit);
void BSE_SleepDelete(BattleWorkUnit* unit);
void BSE_Biribiri(BattleWorkUnit* unit);
void BSE_BiribiriDelete(BattleWorkUnit* unit);
void BSE_Fire(BattleWorkUnit* unit);
void BSE_FireDelete(BattleWorkUnit* unit);
void BSE_Freeze(BattleWorkUnit* unit);
void BSE_FreezeDelete(BattleWorkUnit* unit);
void BSE_Kagegakure(BattleWorkUnit* unit);
void BSE_KagegakureDelete(BattleWorkUnit* unit);
s32 _get_pri(s8 type);

void BattleStatusEffectInit(BattleWorkUnit* unit) {
	; //stubbed in retail
}

void BattleStatusEffectMain(BattleWorkUnit* unit) {
	BSE_Sleep(unit);
	BSE_Biribiri(unit);
	BSE_Fire(unit);
	BSE_Freeze(unit);
	BSE_Kagegakure(unit);
}

void BattleStatusEffectDelete(BattleWorkUnit* unit) {
	BSE_SleepDelete(unit);
	BSE_BiribiriDelete(unit);
	BSE_FireDelete(unit);
	BSE_FreezeDelete(unit);
	BSE_KagegakureDelete(unit);
}

void BSE_Sleep(BattleWorkUnit* unit) {

}

void BSE_SleepDelete(BattleWorkUnit* unit) {

}

void BSE_Biribiri(BattleWorkUnit* unit) {

}

void BSE_BiribiriDelete(BattleWorkUnit* unit) {

}

void BSE_Fire(BattleWorkUnit* unit) {

}

void BSE_FireDelete(BattleWorkUnit* unit) {

}

void BSE_Freeze(BattleWorkUnit* unit) {

}

void BSE_FreezeDelete(BattleWorkUnit* unit) {

}

void BSE_Kagegakure(BattleWorkUnit* unit) {

}

void BSE_KagegakureDelete(BattleWorkUnit* unit) {

}

void BSE_TurnFirstProcessEffectEntry(BattleWorkUnit* unit, s16 active) {
	unit->mBurnDamageFlameState = 1;
	unit->mbBurnDamageFlameActive = active;
}

BOOL BSE_TurnFirstProcessEffectMain(BattleWorkUnit* unit) {
	BattleWorkUnitPart* part;

	part = BtlUnit_GetPartsPtr(unit, BtlUnit_GetBodyPartsId(unit));
	if (!unit->mBurnDamageFlameState) {
		return FALSE;
	}
	if (!unit->mbBurnDamageFlameActive) {
		return FALSE;
	}
	if (unit->mbBurnDamageFlameActive != 1) {
		return FALSE;
	}
	//TODO: finish
	return FALSE;
}

void BattleStatusChangeInfoWorkInit(BattleWorkUnit* unit) {

}

//should be StatusEffectType, TODO fix for s8
s32 _get_pri(s8 type) {
	s8* val;
	s32 priority = 24; //TODO: #define?

	for (val = _st_pri_data;; val++, priority--) {
		if (*val == -1) {
			return -1; //reached end of list
		}
		if (*val == type) {
			return priority;
		}
	}
	return -1;
}


void BattleStatusChangeMsgWorkInit(void) {

}