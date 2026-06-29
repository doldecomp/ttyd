#include "battle/battle.h"
#include "battle/battle_status_effect.h"
#include "battle/battle_sub.h"
#include "battle/battle_unit.h"
#include "evt/evt_cmd.h"
#include "manager/evtmgr_cmd.h"
#include "forcedata.h"

// clang-format off
extend_data(0,
     u64, negone_one, 0xBF8000003F800000,
     u32, neg_one, 0xBF800000,
     f32, __local_PI, 3.1415926535897932384626433832795f,
     f32, __local_3PIO2, 3.0f * 1.57079632679489661923132169163975f,
     u64, one_negone, 0x3F800000BF800000,
     f32, __local_PIO2, 1.57079632679489661923132169163975f,
     f32, one, 1.0f)
extend_data(1,
     u64, negone_one, 0xBF8000003F800000,
     u32, neg_one, 0xBF800000,
     f32, __local_PI, 3.1415926535897932384626433832795f,
     f32, __local_3PIO2, 3.0f * 1.57079632679489661923132169163975f,
     u64, one_negone, 0x3F800000BF800000,
     f32, __local_PIO2, 1.57079632679489661923132169163975f,
     f32, one, 1.0f)
// clang-format on

USER_FUNC(teresa_check_teresa) {
    s32* args = event->args;
    s32 unitId = evtGetValue(event, *args++);
    BOOL isTeresa = FALSE;
    BattleUnit* unit = BattleGetUnitPtr(_battleWorkPointer, unitId);
    BattleUnitType currentKind;

    if (!unit) {
        evtSetValue(event, *args, FALSE);
        return EVT_RETURN_DONE;
    }

    currentKind = unit->currentKind;
    if (currentKind == UNIT_BOO) {
        isTeresa = TRUE;
    }
    if (currentKind == UNIT_DARK_BOO) {
        isTeresa = TRUE;
    }
    evtSetValue(event, *args, isTeresa);
    return EVT_RETURN_DONE;
}

USER_FUNC(teresa_check_move) {
    s32* args = event->args;
    BattleUnit* unit;
    BattleUnitType currentKind;
    s32 teresaCount = 0;
    int i;

    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(_battleWorkPointer, i);
        if (unit) {
            currentKind = unit->currentKind;
            if (currentKind == UNIT_BOO && !unit->work[0]) {
                teresaCount++;
            }
            if (currentKind == UNIT_DARK_BOO && !unit->work[0]) {
                teresaCount++;
            }
        }
    }

    if (teresaCount >= 1) {
        evtSetValue(event, *args, TRUE);
    } else {
        evtSetValue(event, *args, FALSE);
    }
    return EVT_RETURN_DONE;
}

USER_FUNC(teresa_check_trans) {
    s32* args = event->args;
    s32 teresaCount = 0;
    s32 battleId;
    s32 unitId;
    int i;
    BattleUnit* unit;

    battleId = evtGetValue(event, *args++);
    unitId = BattleTransID(event, battleId);

    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(_battleWorkPointer, i);
        if (unit) {
            if (unit->currentKind == UNIT_BOO && !BtlUnit_CheckStatus(unit, STATUS_INVISIBLE) && i != unitId) {
                teresaCount++;
            }
            if (unit->currentKind == UNIT_DARK_BOO && !BtlUnit_CheckStatus(unit, STATUS_INVISIBLE) && i != unitId) {
                teresaCount++;
            }
        }
    }

    if (teresaCount >= 1) {
        evtSetValue(event, *args, TRUE);
    } else {
        evtSetValue(event, *args, FALSE);
    }
    return EVT_RETURN_DONE;
}
