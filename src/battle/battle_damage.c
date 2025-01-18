#include "battle/battle_damage.h"
#include "battle/battle.h"
#include "battle/battle_unit.h"

s32 BattleCheckDamage(BattleWorkUnit* unit1, BattleWorkUnit* unit2, BattleWorkUnitPart* part, BattleWeapon* weapon, s32 flags) {

	if (!unit2) {
		return 18;
	}
	if (part) {
		unit2->currentTarget = part;
	}


}