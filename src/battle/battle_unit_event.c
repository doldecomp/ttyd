//finished, need to check 1:1
#include "battle/battle_unit_event.h"

BOOL BattleCheckEndUnitInitEvent(BattleWork* wp) {
    BattleWorkUnit* unit;
    s32 i, eventId;
    BOOL valid;

    valid = TRUE;
    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(wp, i);
        if (unit) {
            eventId = unit->initEventId;
            if (eventId) {
                if (evtCheckID(eventId)) {
                    valid = FALSE;
                }
                else {
                    unit->initEventId = 0;
                }
            }
        }
    }
    return valid;
}

s32 BattleRunHitEventDirect(BattleWorkUnit* unit, s32 damageCode, void* code) {
    EventEntry* evt;
    s32 id, newId;

    newId = 0;
    id = unit->damageEventId;
    if (id) {
        evtDeleteID(id);
        unit->damageEventId = 0;
    }

    id = unit->waitEventId;
    if (id) {
        evtDeleteID(id);
        unit->waitEventId = 0;
    }

    id = unit->phaseEventId;
    if (id) {
        evtDeleteID(id);
        unit->phaseEventId = 0;
    }

    id = unit->attackEventId;
    if (id) {
        evtDeleteID(id);
        unit->attackEventId = 0;
    }

    if (code) {
        evt = evtEntry(code, 0xA, 0x20);
        evt->unitId = unit->mUnitId;
        unit->damageCode = damageCode;
        newId = evt->eventId;
        unit->damageEventId = newId;
    }
    return newId;
}

s32 BattleRunHitEvent(BattleWorkUnit* unit, s32 damageCode) {
    void* code;
    BOOL valid;
    s32 id;

    id = 0;
    valid = TRUE;
    if (damageCode == 0x28 && !BtlUnit_CheckData(unit, 0x2E)) {
        valid = FALSE;
    }
    if (!valid) {
        return 0;
    }
    code = unit->damageEventCode;
    if (code) {
        id = BattleRunHitEventDirect(unit, damageCode, code);
    }
    return id;
}

s32 BattleRunPhaseEvent(BattleWorkUnit* unit, BOOL isUnison) {
    EventEntry* evt = NULL;
    s32 id = 0;
    void* code;

    if (isUnison) {
        code = unit->unisonPhaseEventCode;
        if (!code) {
            evt = evtEntry(code, 0xA, 0x20);
        }
    }
    else {
        code = unit->phaseEventCode;
        if (!code) {
            evt = evtEntry(code, 0xA, 0x20);
        }
    }
    if (evt) {
        evt->unitId = unit->mUnitId;
        id = evt->eventId;
        unit->phaseEventId = id;
    }
    return id;
}

void BattlePhaseEventStartDeclare(BattleWorkUnit* unit) {
    s32 id;

    id = unit->damageEventId;
    if (id) {
        evtDeleteID(id);
        unit->damageEventId = 0;
    }

    id = unit->waitEventId;
    if (id) {
        evtDeleteID(id);
        unit->waitEventId = 0;
    }

    id = unit->attackEventId;
    if (id) {
        evtDeleteID(id);
        unit->attackEventId = 0;
    }
}

s32 BattleRunWaitEvent(BattleWorkUnit* unit) {
    EventEntry* evt;
    void* code;
    s32 id;

    id = unit->waitEventId;
    if (id) {
        evtDeleteID(id);
        unit->waitEventId = 0;
    }

    code = unit->waitEventCode;
    if (code) {
        evt = evtEntry(code, 0xA, 0);
        evt->unitId = unit->mUnitId;
        unit->waitEventId = evt->eventId;
    }
    return 0; //unused
}
