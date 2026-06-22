#include "battle/battle_weapon_power.h"
#include "battle/battle.h"
#include "battle/battle_database_common.h"
#include "battle/battle_unit.h"

u32 weaponGetPowerDefault(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    return weapon->hpDamageWork[0];
}

u32 weaponGetFPPowerDefault(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    return weapon->fpDamageWork[0];
}

u32 weaponGetPowerFromMarioJumpLv(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    s32 v6;
    s32 slot;
    u32 power;

    v6 = (_battleWorkPointer->actionCommands.result >> 1) & 1;
    slot = v6 + 2 * (pouchGetPtr()->jumpLevel - 1);
    if (slot >= 6) {
        slot = 5;
    }
    power = weapon->hpDamageWork[slot];
    if (unit1->badgesEquipped.Jumpman) {
        power += unit1->badgesEquipped.Jumpman;
    }
    return power;
}

u32 weaponGetPowerFromMarioHammerLv(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    s32 v6;
    s32 slot;
    u32 power;

    v6 = (_battleWorkPointer->actionCommands.result >> 1) & 1;
    slot = v6 + 2 * (pouchGetPtr()->hammerLevel - 1);
    if (slot >= 6) {
        slot = 5;
    }
    power = weapon->hpDamageWork[slot];
    if (unit1->badgesEquipped.Hammerman) {
        power += unit1->badgesEquipped.Hammerman;
    }
    return power;
}

u32 weaponGetPowerOverlapJump1(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    u32 jumpPower;
    u32 v6;

    jumpPower = weaponGetPowerFromMarioJumpLv(unit1, weapon, unit2, part);
    v6 = weapon->hpDamageWork[7];
    return jumpPower + v6 * pouchEquipCheckBadge(weapon->hpDamageWork[6]);
}

u32 weaponGetPowerOverlapHammer1(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    u32 hammerPower;
    u32 v6;

    hammerPower = weaponGetPowerFromMarioHammerLv(unit1, weapon, unit2, part);
    v6 = weapon->hpDamageWork[7];
    return hammerPower + v6 * pouchEquipCheckBadge(weapon->hpDamageWork[6]);
}

u32 weaponGetPowerFromPartyAttackLv(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    BattleWork* wp = _battleWorkPointer;
    PartyId partyId;
    s32 v7;
    s32 slot;

    partyId = BattleTransPartyId(unit1->currentKind);
    v7 = (wp->actionCommands.result >> 1) & 1;
    slot = v7 + 2 * pouchGetPartyAttackLv(partyId);
    if (slot >= 6) {
        slot = 5;
    }
    return weapon->hpDamageWork[slot];
}

u32 weaponGetPowerFromGulliblePartyAttackLv(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2,
                                            BattleUnitPart* part) {
    PartyId partyId;
    s32 partyAttackLv;

    partyId = BattleTransPartyId(unit1->currentKind);
    partyAttackLv = pouchGetPartyAttackLv(partyId);
    if (partyAttackLv >= 6) {
        partyAttackLv = 5;
    }
    return weapon->hpDamageWork[partyAttackLv];
}

u32 weaponGetACOutputParam(BattleUnit* unit1, BattleWeapon* weapon, BattleUnit* unit2, BattleUnitPart* part) {
    s32 result;

    result = _battleWorkPointer->actionCommands.outputParams[weapon->hpDamageWork[0]] + weapon->hpDamageWork[1];
    if (result < 0) {
        result = 0;
    }
    return result;
}
