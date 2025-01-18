#include "battle/battle_sub.h"
#include "battle/battle_unit.h"

extern BattleWork* _battleWorkPointer;

void btlsubResetMoveColorLvAll(BattleWork* work) {
	BattleWorkUnit* unit;
	int i;

	for (i = 0; i < 64; i++) {
		unit = BattleGetUnitPtr(work, i);
		if (unit) {
			unit->mMoveColorLv = 0xFF;
		}
	}
}

s32 BattleTransID(EventEntry* evt, s32 type) {
	BattleWorkUnit* unit;

	switch (type) {
		case -1:
			return -1;
		case -3:
			unit = BattleGetMarioPtr(_battleWorkPointer);
			return unit->mUnitId;
		case -4:
			unit = BattleGetPartyPtr(_battleWorkPointer);
			if (unit) {
				return unit->mUnitId;
			}
			else {
				return -1;
			}
		case -5:
			unit = BattleGetSystemPtr(_battleWorkPointer);
			return unit->mUnitId;
		case -6:
			return _battleWorkPointer->field_0x424;
		default:
			return type;
	}
}