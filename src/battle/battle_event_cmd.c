/* TODO: whoever's unfucking this file, every function before btlevtcmd_GetHp
 * needs to be refactored to have BattleWork* wp = _battleWorkPointer; right
 * below args (line 2 in each function), along with having to explicitly store
 * btlId (can't condense to one line), should fix most problems
*/
#include "battle/battle_event_cmd.h"
#include "battle/battle_acrobat.h"
#include "battle/battle_disp.h"
#include "battle/battle_sub.h"
#include "battle/battle_unit.h"
#include "battle/battle_unit_event.h"
#include "eff/eff_nice.h"
#include "system.h"
#include <stdlib.h>

extern BattleWork* _battleWorkPointer;

//s32* eventId
USERFUNC_DEF(btlevtcmd_WaitEventEnd) {
    s32 id;

    id = evtGetValue(event, *event->args);
    return evtCheckID(id) ? EVT_RETURN_BLOCK : EVT_RETURN_DONE; //TODO: fix
}

//s32 retIndex, s32 battleFlags
USERFUNC_DEF(btlevtcmd_check_battleflag) { //TODO: regalloc
    s32* args = event->args;
    s32 index = args[0];
    if (_battleWorkPointer->flags & args[1]) {
        evtSetValue(event, index, TRUE);
    }
    else {
        evtSetValue(event, index, FALSE);
    }
    return EVT_RETURN_DONE;
}

//BOOL* onoff, s32 flags
USERFUNC_DEF(btlevtcmd_onoff_battleflag) {
    s32* args = event->args;
    s32 flags = args[1];
    if (evtGetValue(event, args[0])) {
        _battleWorkPointer->flags |= flags;
    }
    else {
        _battleWorkPointer->flags &= ~flags;
    }
    return EVT_RETURN_DONE;
}

//s32 retIndex
USERFUNC_DEF(btlevtcmd_get_turn) {
    evtSetValue(event, *event->args, _battleWorkPointer->mTurnCount);
    return EVT_RETURN_DONE;
}

//no params
USERFUNC_DEF(btlevtcmd_reset_turn) {
    _battleWorkPointer->flags |= 0x2000;
    return EVT_RETURN_DONE;
}

//no params
USERFUNC_DEF(btlevtcmd_reset_move_color_lv_all) {
    btlsubResetMoveColorLvAll(_battleWorkPointer);
    return EVT_RETURN_DONE;
}

//s32 retIndex, s32 phaseSeqId
USERFUNC_DEF(btlevtcmd_CheckPhase) {
    s32* args = event->args;
    s32 index = args[0];
    s32 seq = args[1];
    if (seq == BattleGetSeq(_battleWorkPointer, SEQ_PHASE)) {
        evtSetValue(event, index, TRUE);
    }
    else {
        evtSetValue(event, index, FALSE);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 indexX, s32 indexY, s32 indexZ
USERFUNC_DEF(btlevtcmd_GetPos) {
    s32* args = event->args;
    s32 indexX, indexY, indexZ;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    indexX = args[1];
    indexY = args[2];
    indexZ = args[3];
    BtlUnit_GetPos(unit, &x, &y, &z);
    if (indexX != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexX, (s32)x);
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexY, (s32)y);
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexZ, (s32)z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 indexX, s32 indexY, s32 indexZ
USERFUNC_DEF(btlevtcmd_GetPosFloat) {
    s32* args = event->args;
    s32 indexX, indexY, indexZ;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;


    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    indexX = args[1];
    indexY = args[2];
    indexZ = args[3];
    BtlUnit_GetPos(unit, &x, &y, &z);
    if (indexX != EVTDAT_POINTER_MAX) {
        evtSetFloat(event, indexX, x);
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        evtSetFloat(event, indexY, y);
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        evtSetFloat(event, indexZ, z);
    }
    return EVT_RETURN_DONE;
}

//s32* maxValue, s32 retIndex
USERFUNC_DEF(btlevtcmd_GetRandomValue) {
    s32* args = event->args;
    s32 max, index;

    max = evtGetValue(event, args[0]);
    index = args[1];
    evtSetValue(event, index, irand(max));
    return EVT_RETURN_DONE;
}

//s32 retIndex, s32 countIndex, s32 sizeIndex[]
USERFUNC_DEF(btlevtcmd_DrawLots) {
    s32* args = event->args;
    s32 *alloc, *args2;
    s32 i, index, countId, count, max;
    s32 ceiling, ceilcount, retcount;

    index = args[0];
    countId = args[1];
    args2 = &args[2];
    count = evtGetValue(event, countId);
    max = 0;
    alloc = BattleAlloc(sizeof(s32) * count);
    for (i = 0; i < count; i++) {
        alloc[i] = evtGetValue(event, (*args2)++);
        max += alloc[i];
    }
    ceiling = irand(max);
    ceilcount = 0;
    retcount = 0;
    for (i = 0; i < count; i++) {
        ceilcount += alloc[i];
        if (ceiling < ceilcount) {
            break;
        }
        retcount++;
    }
    evtSetValue(event, index, retcount);
    BattleFree(alloc);
    return EVT_RETURN_DONE;
}

//s32 retIndex for unitId, BattleUnitSetup** setup, s32 spawnFlags
USERFUNC_DEF(btlevtcmd_SpawnUnit) {
    s32* args = event->args;
    BattleUnitSetup* setup;
    BattleWorkUnit* unit;
    s32 index;
    
    index = args[0];
    setup = (BattleUnitSetup*)evtGetValue(event, args[1]);
    unit = BtlUnit_Spawn(setup, args[2]);
    if (unit) {
        evtSetValue(event, index, unit->mUnitId);
    }
    else {
        evtSetValue(event, index, -1);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 flags
USERFUNC_DEF(btlevtcmd_KillUnit) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 id, flags;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    flags = args[1];
    if (!unit) {
        return EVT_RETURN_DONE;
    }
    unit->currentHp = 0;
    BtlUnit_ClearStatus(unit);
    if (flags & 2) {
        unit->mAttributeFlags |= 0x20000;
        return EVT_RETURN_DONE;
    }
    else {
        BtlUnit_SetStatus(unit, kStatusInstantKill, 1, 1);
        if (!(flags & 1)) {
            unit->mFlags |= 0x80000000;
        }
        return EVT_RETURN_DONE;
    }
}

//s32* battleId, s32* copyToPartId, BattleUnitKindPart* kind, s32* copyFromPartId
USERFUNC_DEF(btlevtcmd_ReplaceParts) {
    s32* args = event->args;
    s32 id, transId, lookupPart, partNum;
    BattleUnitKindPart* kind;
    BattleWorkUnit* unit;
    BattleWorkUnitPart* part;

    id = evtGetValue(event, args[0]);
    transId = BattleTransID(event, id);
    lookupPart = evtGetValue(event, args[1]);
    kind = (BattleUnitKindPart*)args[2];
    partNum = evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, transId);
    part = BattleGetUnitPartsPtr(transId, lookupPart);
    if (kind) {
        while (kind->partNum != partNum) {
            ;
        }
        part->mKindPartParams = kind;
        part->partName = part->mKindPartParams->partName;
        part->attributes = part->mKindPartParams->attributes;
        part->counterAttributes = part->mKindPartParams->counterAttributes;
        part->defense = part->mKindPartParams->defense;
        part->defenseAttr = part->mKindPartParams->defenseAttr;
        part->mPositionOffset = part->mKindPartParams->positionOffset;
        BtlUnit_SetPartsRotate(part, 0.0f, 0.0f, 0.0f);
        BtlUnit_SetPartsRotateOffset(part, 0.0f, 0.0f, 0.0f);
        part->mHitBaseOffset.x = part->mKindPartParams->hitBaseOffset.x;
        part->mHitBaseOffset.y = part->mKindPartParams->hitBaseOffset.y;
        part->mHitOffset.x = 0.0f;
        part->mHitOffset.y = 0.0f;
        part->field_0x1A0 = 0;
    }
    btlDispEntAnime(unit);
    return EVT_RETURN_DONE;
}

//s32 retIndex
USERFUNC_DEF(btlevtcmd_ChangeParty) {
    BattleWorkUnit* unit;
    s32 value, index;

    value = -1;
    index = *event->args;
    unit = BattleChangeParty(_battleWorkPointer);
    if (unit) {
        value = unit->mUnitId;
    }
    evtSetValue(event, index, value);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to set current)
USERFUNC_DEF(btlevtcmd_SetPos) {
    f32 x, y, z, currX, currY, currZ;
    s32 indexX, indexY, indexZ, id;
    s32* args = event->args;
    BattleWorkUnit* unit;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    indexX = args[1];
    x = (f32)evtGetValue(event, indexX);
    indexY = args[2];
    y = (f32)evtGetValue(event, indexY);
    indexZ = args[3];
    z = (f32)evtGetValue(event, indexZ);

    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_GetPos(unit, &currX, &currY, &currZ);
    if (indexX == EVTDAT_POINTER_MAX) {
        x = currX;
    }
    if (indexY == EVTDAT_POINTER_MAX) {
        y = currY;
    }
    if (indexZ == EVTDAT_POINTER_MAX) {
        z = currZ;
    }
    BtlUnit_SetPos(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddPos) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_AddPos(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, s32 indexX, s32 indexY, s32 indexZ (can be EVTDAT_POINTER_MAX for noret)
USERFUNC_DEF(btlevtcmd_GetPartsPos) {
    s32* args = event->args;
    s32 id, partId;
    s32 indexX, indexY, indexZ;
    f32 currX, currY, currZ;
    BattleWorkUnitPart* part;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    BattleGetUnitPtr(_battleWorkPointer, id);
    part = BattleGetUnitPartsPtr(id, partId);
    indexX = args[2];
    indexY = args[3];
    indexZ = args[4];
    BtlUnit_GetPartsWorldPos(part, &currX, &currY, &currZ);
    if (indexX != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexX, (s32)currX);
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexY, (s32)currY);
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexZ, (s32)currZ);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsPos) {
    s32* args = event->args;
    f32 x, y, z, currX, currY, currZ;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s32 id, partId;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BattleGetUnitPartsPtr(id, partId);
    if (part->attributes & 0x10000000) {
        BtlUnit_SetPartsPos(part, x, y, z);
    }
    else {
        BtlUnit_GetPos(unit, &currX, &currY, &currZ);
        BtlUnit_SetPartsOffsetPos(part, x - currX, y - currY, z - currZ);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddPartsPos) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    if (part->attributes & 0x10000000) {
        BtlUnit_AddPartsPos(part, x, y, z);
    }
    else {
        BtlUnit_AddPartsOffsetPos(part, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetDispOffset) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_SetDispOffset(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsDispOffset) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id); //unused variable
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_SetPartsDispOffset(part, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddPartsDispOffset) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id); //unused variable
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_AddPartsDispOffset(part, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetTogeOffset) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    if (x != (f32)EVTDAT_POINTER_MAX) {
        unit->togeOffset.x = x;
    }
    if (y != (f32)EVTDAT_POINTER_MAX) {
        unit->togeOffset.y = y;
    }
    if (z != (f32)EVTDAT_POINTER_MAX) {
        unit->togeOffset.z = z;
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 indexX, s32 indexY, s32 indexZ
USERFUNC_DEF(btlevtcmd_GetHomePos) {
    s32* args = event->args;
    s32 indexX, indexY, indexZ;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    indexX = args[1];
    indexY = args[2];
    indexZ = args[3];
    BtlUnit_GetHomePos(unit, &x, &y, &z);
    evtSetValue(event, indexX, (s32)x);
    evtSetValue(event, indexY, (s32)y);
    evtSetValue(event, indexZ, (s32)z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetHomePos) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_SetHomePos(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddHomePos) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_AddHomePos(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsHomePos) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_SetPartsHomePos(part, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, s32 indexX, s32 indexY, s32 indexZ
USERFUNC_DEF(btlevtcmd_GetHitPos) {
    s32* args = event->args;
    s32 indexX, indexY, indexZ;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BattleGetUnitPartsPtr(id, partId);
    indexX = args[2];
    indexY = args[3];
    indexZ = args[4];
    BtlUnit_GetHitPos(unit, part, &x, &y, &z);
    if (indexX != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexX, (s32)x);
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexY, (s32)y);
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexZ, (s32)z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetHitOffset) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_SetHitOffset(unit, part, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetHitCursorOffset) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    partId = evtGetValue(event, args[1]);
    x = (f32)evtGetValue(event, args[2]);
    y = (f32)evtGetValue(event, args[3]);
    z = (f32)evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_SetHitCursorOffset(unit, part, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 retIndex
USERFUNC_DEF(btlevtcmd_GetWidth) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, index, width;

    btlId = evtGetValue(event, args[0]);
    index = args[1];
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    width = BtlUnit_GetWidth(unit);
    evtSetValue(event, index, width);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 retIndex
USERFUNC_DEF(btlevtcmd_GetHeight) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, index, height;

    btlId = evtGetValue(event, args[0]);
    index = args[1];
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    height = BtlUnit_GetHeight(unit);
    evtSetValue(event, index, height);
    return EVT_RETURN_DONE;
}

//s32* battleId, s16* height
USERFUNC_DEF(btlevtcmd_SetHeight) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id;
    s16 height;

    btlId = evtGetValue(event, args[0]);
    height = (s16)evtGetValue(event, args[1]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_SetHeight(unit, height); //TODO: make sure extsh
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 retIndex
USERFUNC_DEF(btlevtcmd_GetStatusMg) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    index = args[1];
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetFloat(event, index, unit->mSizeMultiplier);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* xpos, s32* ypos (can be EVTDAT_POINTER_MAX to not store)
USERFUNC_DEF(btlevtcmd_SetStatusIconOffset) {
    s32* args = event->args;
    s32 id, btlId, xpos, ypos;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    xpos = evtGetValue(event, args[1]);
    ypos = evtGetValue(event, args[2]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    if (xpos != EVTDAT_POINTER_MAX) {
        unit->mStatusIconOffset[0] = (s16)xpos;
    }
    if (ypos != EVTDAT_POINTER_MAX) {
        unit->mStatusIconOffset[1] = (s16)ypos;
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* xpos, s32* ypos (can be EVTDAT_POINTER_MAX to not store)
USERFUNC_DEF(btlevtcmd_SetHpGaugeOffset) {
    s32* args = event->args;
    s32 id, btlId, xpos, ypos;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    xpos = evtGetValue(event, args[1]);
    ypos = evtGetValue(event, args[2]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    if (xpos != EVTDAT_POINTER_MAX) {
        unit->mHpGaugeOffset[0] = (s16)xpos;
    }
    if (ypos != EVTDAT_POINTER_MAX) {
        unit->mHpGaugeOffset[1] = (s16)ypos;
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32 retX, s32 retY
USERFUNC_DEF(btlevtcmd_GetHpGaugeOffset) {
    s32* args = event->args;
    s32 id, btlId, indexX, indexY;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    indexX = args[1];
    indexY = args[2];
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, indexX, unit->mHpGaugeOffset[0]);
    evtSetValue(event, indexY, unit->mHpGaugeOffset[1]);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, u8* alpha
USERFUNC_DEF(btlevtcmd_SetAlpha) {
    s32* args = event->args;
    s32 id, btlId, partId;
    u8 alpha;

    btlId = evtGetValue(event, args[0]);
    partId = evtGetValue(event, args[1]);
    alpha = (u8)evtGetValue(event, args[2]);
    id = BattleTransID(event, btlId);
    BattleGetUnitPartsPtr(id, partId)->color.a = alpha;
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, u8* redIndex, u8* greenIndex, u8* blueIndex
USERFUNC_DEF(btlevtcmd_GetRGB) {
    s32* args = event->args;
    s32 indexR, indexG, indexB;
    BattleWorkUnitPart* part;
    s32 id, btlId, partId;

    btlId = evtGetValue(event, args[0]);
    partId = evtGetValue(event, args[1]);
    id = BattleTransID(event, btlId);
    part = BattleGetUnitPartsPtr(id, partId);
    indexR = args[2];
    indexG = args[3];
    indexB = args[4];
    evtSetValue(event, indexR, part->color.r);
    evtSetValue(event, indexG, part->color.g);
    evtSetValue(event, indexB, part->color.b);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, u8* red, u8* green, u8* blue
USERFUNC_DEF(btlevtcmd_SetRGB) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, btlId, partId;
    u8 r, g, b;

    btlId = evtGetValue(event, args[0]);
    partId = evtGetValue(event, args[1]);
    r = (u8)evtGetValue(event, args[2]);
    g = (u8)evtGetValue(event, args[3]);
    b = (u8)evtGetValue(event, args[4]);
    id = BattleTransID(event, btlId);
    part = BattleGetUnitPartsPtr(id, partId);
    part->color.r = r;
    part->color.g = g;
    part->color.b = b;
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_GetRotate) {
    s32* args = event->args;
    f32 rotateX, rotateY, rotateZ;
    s32 indexX, indexY, indexZ;
    BattleWorkUnit* unit;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    indexX = args[1];
    indexY = args[2];
    indexZ = args[3];
    BtlUnit_GetRotate(unit, &rotateX, &rotateY, &rotateZ);
    if (indexX != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexX, (s32)rotateX);
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexY, (s32)rotateY);
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        evtSetValue(event, indexZ, (s32)rotateZ);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_SetRotate) {
    s32* args = event->args;
    s32 id, indexX, indexY, indexZ;
    f32 x, y, z, currX, currY, currZ;
    BattleWorkUnit* unit;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    indexX = args[1];
    x = (f32)evtGetValue(event, indexX);
    indexY = args[2];
    y = (f32)evtGetValue(event, indexY);
    indexZ = args[3];
    z = (f32)evtGetValue(event, indexZ);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_GetRotate(unit, &currX, &currY, &currZ);
    if (indexX == EVTDAT_POINTER_MAX) {
        x = currX;
    }
    if (indexY == EVTDAT_POINTER_MAX) {
        y = currY;
    }
    if (indexZ == EVTDAT_POINTER_MAX) {
        z = currZ;
    }
    BtlUnit_SetRotate(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddRotate) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_AddRotate(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_GetPartsRotate) {
    s32* args = event->args;
    s32 id, partId, indexX, indexY, indexZ;
    BattleWorkUnitPart* part;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    part = BattleGetUnitPartsPtr(id, partId);
    indexX = args[2];
    indexY = args[3];
    indexZ = args[4];
    BtlUnit_GetPartsRotate(part, &x, &y, &z);
    evtSetValue(event, indexX, (s32)x);
    evtSetValue(event, indexY, (s32)y);
    evtSetValue(event, indexZ, (s32)z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsRotate) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId, x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = evtGetValue(event, args[2]);
    y = evtGetValue(event, args[3]);
    z = evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_SetPartsRotate(part, (f32)x, (f32)y, (f32)z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddPartsRotate) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId, x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = evtGetValue(event, args[2]);
    y = evtGetValue(event, args[3]);
    z = evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_AddPartsRotate(part, (f32)x, (f32)y, (f32)z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_SetBaseRotate) {
    s32* args = event->args;
    s32 id, indexX, indexY, indexZ;
    f32 x, y, z, currX, currY, currZ;
    BattleWorkUnit* unit;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    indexX = args[1];
    x = (f32)evtGetValue(event, indexX);
    indexY = args[2];
    y = (f32)evtGetValue(event, indexY);
    indexZ = args[3];
    z = (f32)evtGetValue(event, indexZ);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_GetBaseRotate(unit, &currX, &currY, &currZ);
    if (indexX == EVTDAT_POINTER_MAX) {
        x = currX;
    }
    if (indexY == EVTDAT_POINTER_MAX) {
        y = currY;
    }
    if (indexZ == EVTDAT_POINTER_MAX) {
        z = currZ;
    }
    BtlUnit_SetBaseRotate(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_SetPartsBaseRotate) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    f32 currX, currY, currZ;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = evtGetFloat(event, args[2]);
    y = evtGetFloat(event, args[3]);
    z = evtGetFloat(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_GetPartsBaseRotate(part, &currX, &currY, &currZ);
    if (x != (f32)EVTDAT_POINTER_MAX) {
        currX = x;
    }
    if (y != (f32)EVTDAT_POINTER_MAX) {
        currY = y;
    }
    if (z != (f32)EVTDAT_POINTER_MAX) {
        currZ = z;
    }
    BtlUnit_SetPartsBaseRotate(part, currX, currY, currZ);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetRotateOffset) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_SetRotateOffset(unit, x, y, z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsRotateOffset) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId, x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = evtGetValue(event, args[2]);
    y = evtGetValue(event, args[3]);
    z = evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_SetPartsRotateOffset(part, (f32)x, (f32)y, (f32)z);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddPartsRotateOffset) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId, x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    partId = evtGetValue(event, args[1]);
    x = evtGetValue(event, args[2]);
    y = evtGetValue(event, args[3]);
    z = evtGetValue(event, args[4]);
    part = BattleGetUnitPartsPtr(id, partId);
    BtlUnit_AddPartsRotateOffset(part, (f32)x, (f32)y, (f32)z);
    return EVT_RETURN_DONE;
}

//s32* battleId
USERFUNC_DEF(btlevtcmd_SetRotateOffsetFromCenterOffset) {
    BattleWorkUnit* unit;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, *event->args));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_SetRotateOffset(unit, unit->offsetCenter.x, unit->offsetCenter.y, unit->offsetCenter.z);
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetCutBaseOffset) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->cutBaseOffset.x = x;
    unit->cutBaseOffset.y = y;
    unit->cutBaseOffset.z = z;
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetBintaHitOffset) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->bintaHitOffset.x = x;
    unit->bintaHitOffset.y = y;
    unit->bintaHitOffset.z = z;
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetKissHitOffset) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->kissHitOffset.x = x;
    unit->kissHitOffset.y = y;
    unit->kissHitOffset.z = z;
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* value
USERFUNC_DEF(btlevtcmd_SetCutWidth) {
    s32* args = event->args;
    f32 value;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    value = (f32)evtGetValue(event, args[1]);
    BattleGetUnitPtr(_battleWorkPointer, id)->cutWidth = value;
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* value
USERFUNC_DEF(btlevtcmd_SetCutHeight) {
    s32* args = event->args;
    f32 value;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    value = (f32)evtGetValue(event, args[1]);
    BattleGetUnitPtr(_battleWorkPointer, id)->cutHeight = value;
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_SetPossessionItemOffset) {
    s32* args = event->args;
    s32 id, x, y, z, indexX, indexY, indexZ;
    BattleWorkUnit* unit;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    indexX = args[1];
    x = evtGetValue(event, indexX);
    indexY = args[2];
    y = evtGetValue(event, indexY);
    indexZ = args[3];
    z = evtGetValue(event, indexZ);
    if (indexX != EVTDAT_POINTER_MAX) {
        unit->heldItemOffset.x = (f32)x;
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        unit->heldItemOffset.y = (f32)y;
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        unit->heldItemOffset.z = (f32)z;
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetBaseScale) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    x = evtGetFloat(event, args[1]);
    y = evtGetFloat(event, args[2]);
    z = evtGetFloat(event, args[3]);
    if (unit) {
        BtlUnit_SetBaseScale(unit, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsBaseScale) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id != -1) { //TODO: un-hardcode?
        part = BattleGetUnitPartsPtr(id, evtGetValue(event, args[1]));
        x = evtGetFloat(event, args[2]);
        y = evtGetFloat(event, args[3]);
        z = evtGetFloat(event, args[4]);
        BtlUnit_SetPartsBaseScale(part, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_GetScale) {
    s32* args = event->args;
    s32 id, indexX, indexY, indexZ;
    BattleWorkUnit* unit;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id == -1) {
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    indexX = args[1];
    indexY = args[2];
    indexZ = args[3];
    BtlUnit_GetScale(unit, &x, &y, &z);
    if (indexX != EVTDAT_POINTER_MAX) {
        evtSetFloat(event, indexX, x);
    }
    if (indexY != EVTDAT_POINTER_MAX) {
        evtSetFloat(event, indexY, y);
    }
    if (indexZ != EVTDAT_POINTER_MAX) {
        evtSetFloat(event, indexZ, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetScale) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id != -1) { //TODO: un-hardcode?
        unit = BattleGetUnitPtr(_battleWorkPointer, id);
        x = evtGetFloat(event, args[1]);
        y = evtGetFloat(event, args[2]);
        z = evtGetFloat(event, args[3]);
        BtlUnit_SetScale(unit, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddScale) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    f32 x, y, z;
    s32 id;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id != -1) { //TODO: un-hardcode?
        unit = BattleGetUnitPtr(_battleWorkPointer, id);
        x = evtGetFloat(event, args[1]);
        y = evtGetFloat(event, args[2]);
        z = evtGetFloat(event, args[3]);
        BtlUnit_AddScale(unit, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_SetPartsScale) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id != -1) { //TODO: un-hardcode?
        partId = evtGetValue(event, args[1]);
        part = BattleGetUnitPartsPtr(id, partId);
        x = evtGetFloat(event, args[2]);
        y = evtGetFloat(event, args[3]);
        z = evtGetFloat(event, args[4]);
        BtlUnit_SetPartsScale(part, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* partId, f32* x, f32* y, f32* z
USERFUNC_DEF(btlevtcmd_AddPartsScale) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    s32 id, partId;
    f32 x, y, z;

    id = BattleTransID(event, evtGetValue(event, args[0]));
    if (id != -1) { //TODO: un-hardcode?
        partId = evtGetValue(event, args[1]);
        part = BattleGetUnitPartsPtr(id, partId);
        x = evtGetFloat(event, args[2]);
        y = evtGetFloat(event, args[3]);
        z = evtGetFloat(event, args[4]);
        BtlUnit_AddPartsScale(part, x, y, z);
    }
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* retIndex
USERFUNC_DEF(btlevtcmd_GetHp) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtSetValue(event, args[1], unit->currentHp);
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* retIndex
USERFUNC_DEF(btlevtcmd_GetFp) { //1:1
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    index = args[1];
    evtSetValue(event, index, BtlUnit_GetFp(unit));
    return EVT_RETURN_DONE;
}

//s32* battleId, s32* retIndex
USERFUNC_DEF(btlevtcmd_GetMaxHp) { //1:1
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtSetValue(event, args[1], unit->maxHp);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetMaxFp) { //1:1
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    index = args[1];
    evtSetValue(event, index, BtlUnit_GetMaxFp(unit));
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetHp) { //1:1
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    f32 value; //TODO: rename
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    unit->currentHp = (s16)evtGetValue(event, args[1]);
    unit->hpGauge.field_0xC = unit->currentHp;
    unit->hpGauge.field_0x10 = unit->currentHp;
    value = (f32)unit->currentHp / (f32)unit->maxHp;
    unit->hpGauge.field_0x18 = value;
    unit->hpGauge.field_0x14 = value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetFp) { //1:1
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id, value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    value = evtGetValue(event, args[1]);
    BtlUnit_SetFp(unit, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetMaxFp) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id, value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    value = evtGetValue(event, args[1]);
    BtlUnit_SetMaxFp(unit, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetSwallowParam) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;
    s8 value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(wp, id);
    value = (s8)evtGetValue(event, args[1]);
    if (unit) {
        unit->swallowRate = value;
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetSwallowAttribute) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;
    s8 value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(wp, id);
    value = (s8)evtGetValue(event, args[1]);
    if (unit) {
        unit->swallowAttribute = value;
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetMaxMoveCount) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;
    s8 max;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    unit->maxMoveCount = (s8)evtGetValue(event, args[1]);
    max = unit->maxMoveCount;
    if (unit->movesRemaining > max) {
        unit->movesRemaining = max;
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetDamagePartsId) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtSetValue(event, args[1], unit->currentTarget->mKindPartParams->partNum);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetHpDamage) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtSetValue(event, args[1], unit->hpDamageTaken);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetFpDamage) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtSetValue(event, args[1], unit->fpDamageTaken);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetHpDamageCount) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) { //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtSetValue(event, args[1], unit->hpDamageCount);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_RecoverHp) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id, hp;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) {  //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtGetValue(event, args[1]); //unused, debug?
    hp = evtGetValue(event, args[2]);
    if (!(unit->mAttributeFlags & kUnk_ImmageToOHKO)) {
        unit->hpGauge.field_0xC = unit->currentHp;
        BtlUnit_RecoverHp(unit, hp);
        unit->hpGauge.field_0x10 = unit->currentHp;
        unit->hpGauge.field_0x4 = unit->hpGauge.field_0x6;
        unit->hpGauge.field_0x8 = unit->hpGauge.field_0xA;
        unit->hpGauge.field_0x2 |= 1;
    }
    else {
        BtlUnit_RecoverHp(unit, hp);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_RecoverFp) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id, value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    if (id == -1) {  //TODO: un-hardcode?
        return EVT_RETURN_DONE;
    }
    unit = BattleGetUnitPtr(wp, id);
    evtGetValue(event, args[1]); //unused, debug?
    value = evtGetValue(event, args[2]);
    BtlUnit_RecoverFp(unit, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetOverTurnCount) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, unit->flippedTurns);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetOverTurnCount) {
    s32* args = event->args;
    s32 btlId, id;
    s8 value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    value = (s8)evtGetValue(event, args[1]);
    BattleGetUnitPtr(_battleWorkPointer, id)->flippedTurns = value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetUnitWork) {
    s32* args = event->args;
    s32 btlId, id, i, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    i = evtGetValue(event, args[1]);
    index = args[2];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, unit->work[i]);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetUnitWork) {
    s32* args = event->args;
    s32 btlId, id, value, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = evtGetValue(event, args[1]);
    value = evtGetValue(event, args[2]);
    BattleGetUnitPtr(_battleWorkPointer, id)->work[index] = value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_AddUnitWork) {
    s32* args = event->args;
    s32 btlId, id, value, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = evtGetValue(event, args[1]);
    value = evtGetValue(event, args[2]);
    BattleGetUnitPtr(_battleWorkPointer, id)->work[index] += value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetUnitWorkFloat) {
    s32* args = event->args;
    s32 btlId, id, i, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    i = evtGetValue(event, args[1]);
    index = args[2];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetFloat(event, index, (f32)unit->work[i]);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetUnitWorkFloat) {
    s32* args = event->args;
    s32 btlId, id, index;
    f32 value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = evtGetValue(event, args[1]);
    value = evtGetFloat(event, args[2]);
    BattleGetUnitPtr(_battleWorkPointer, id)->work[index] = (s32)value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetPartsWork) {
    s32* args = event->args;
    s32 btlId, id, partId, i, index;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    i = evtGetValue(event, args[2]);
    index = args[3];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BtlUnit_GetPartsPtr(unit, partId);
    evtSetValue(event, index, part->work[i]);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetPartsWork) {
    s32* args = event->args;
    s32 btlId, id, partId, index, value;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    index = evtGetValue(event, args[2]);
    value = evtGetValue(event, args[3]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    BtlUnit_GetPartsPtr(unit, partId)->work[index] = value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetDamage) {
    s32* args = event->args;
    s32 btlId, id, index, value;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    index = args[1];
    if (unit) {
        value = BtlUnit_GetHitDamage(unit);
        evtSetValue(event, index, value);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetTotalDamage) {
    s32* args = event->args;
    s32 btlId, id, index, value;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    index = args[1];
    if (unit) {
        value = BtlUnit_GetTotalHitDamage(unit);
        evtSetValue(event, index, value);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetDamageCode) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, (s32)(u8)unit->damageCode); //TODO: double check this cast
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckDamageCode) {
    s32* args = event->args;
    s32 btlId, id, mask, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    mask = args[1];
    index = args[2];
    if ((BattleGetUnitPtr(_battleWorkPointer, id)->damageCode & mask)) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_StartAvoid) {
    s32* args = event->args;
    s32 btlId, id, damageCode;
    NiceEffectWork* effect;
    BattleWorkUnit* unit;
    f32 x, y, z;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    damageCode = args[1] | 0x100;
    if (damageCode == 0x26) {
        BtlUnit_GetPos(unit, &x, &y, &z);
        if (y >= 85.0f) {
            y += -50.0f;
        }
        else {
            y += 50.0f;
        }
        x -= 45.0f;
        effect = effNiceEntry(6, x, y, z)->userdata;
        effect->field_0x1C = 0.75f;
    }
    unit->damagePattern = 0;
    BattleRunHitEvent(unit, damageCode);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_RunHitEventDirect) {
    s32* args = event->args;
    s32 btlId, id, damageCode;
    BattleWorkUnit* unit;
    void* code;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    damageCode = args[1];
    code = (void*)evtGetValue(event, args[2]);
    unit->damagePattern = evtGetValue(event, args[3]);
    BattleRunHitEventDirect(unit, damageCode | 0x100, code);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckDamagePattern) {
    s32* args = event->args;
    s32 btlId, id, pattern, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    pattern = args[1];
    index = args[2];
    if (BattleGetUnitPtr(_battleWorkPointer, id)->damagePattern == pattern) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckSpace) { //TODO: probably wrong
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 boundX, boundY, boundZ;
    s32 baseX, baseY, baseZ;
    BattleWorkUnit* unit;
    s32 index, i;
    f32 x, y, z;
    BOOL found;

    index = args[0];
    baseX = evtGetValue(event, args[1]);
    baseY = evtGetValue(event, args[2]);
    baseZ = evtGetValue(event, args[3]);
    boundX = evtGetValue(event, args[4]);
    boundY = evtGetValue(event, args[5]);
    boundZ = evtGetValue(event, args[6]);
    for (i = 0; i < 64; ++i) {
        found = FALSE;
        unit = BattleGetUnitPtr(wp, i);
        if (unit && UNIT_ALLIANCE_PARTY) {
            BtlUnit_GetHomePos(unit, &x, &y, &z);
            if (boundX) {
                if (abs((s32)x - baseX) < boundX) {
                    found = TRUE;
                }
            }
            if (boundY) {
                if (abs((s32)y - baseY) < boundY) {
                    found = TRUE;
                }
            }
            if (boundZ) {
                if (abs((s32)z - baseZ) < boundZ) {
                    found = TRUE;
                }
            }
            if (found) {
                evtSetValue(event, index, i);
                return EVT_RETURN_DONE;
            }
        }
    }
    evtSetValue(event, index, -1);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetEnemyBelong) {
    s32* args = event->args;
    s32 btlId, id, index, value;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    value = BtlUnit_GetEnemyBelong(unit);
    evtSetValue(event, index, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetFriendBelong) {
    s32* args = event->args;
    s32 btlId, id, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, unit->mAlliance);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetProtectId) {
    s32* args = event->args;
    s32 btlId, id, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, unit->protectId);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetUnitKind) {
    s32* args = event->args;
    s32 btlId, id, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, unit->currentKind);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetPartnerId) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit, * partner;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(wp, id);
    partner = BattleGetPartnerPtr(wp, unit);
    if (partner) {
        evtSetValue(event, index, partner->mUnitId);
    }
    else {
        evtSetValue(event, index, -1);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetMarioId) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 btlId, id, index, alliance;
    BattleWorkUnit* unit;
    int i;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    alliance = BattleGetUnitPtr(wp, id)->mAlliance;
    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(wp, i);
        if (unit && unit->mAlliance == alliance && unit->currentKind == UNIT_MARIO) {
            break;
        }
    }
    if (i < 64) {
        evtSetValue(event, index, unit->mUnitId);
    }
    else {
        evtSetValue(event, index, -1);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetPartyId) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 btlId, id, index, alliance, kind;
    BattleWorkUnit* unit;
    int i;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    alliance = BattleGetUnitPtr(wp, id)->mAlliance;
    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(wp, i);
        if (unit && unit->mAlliance == alliance) {
            kind = unit->currentKind;
            if (kind >= TYPE_PARTNER_MIN && kind < TYPE_PARTNER_MIN) {
                break;
            }
        }
    }
    if (i < 64) {
        evtSetValue(event, index, unit->mUnitId);
    }
    else {
        evtSetValue(event, index, -1);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetBodyId) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 btlId, id, index, value;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(wp, id);
    value = BtlUnit_GetBodyPartsId(unit);
    evtSetValue(event, index, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetUnitId) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 btlId, id, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(wp, id);
    if (unit && unit->mFlags < 0) {
        unit = NULL;
    }
    if (unit) {
        evtSetValue(event, index, id);
    }
    else {
        evtSetValue(event, index, -1);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetPartyTechLv) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 btlId, id, index, value, i;
    BattleUnitType kind;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    kind = BattleGetUnitPtr(wp, id)->currentKind;
    value = 0;
    if (kind >= TYPE_PARTNER_MIN && kind < TYPE_PARTNER_MAX) {
        i = BattleTransPartyId(kind);
        value = pouchGetPtr()->partyData[i].techLevel;
    }
    evtSetValue(event, index, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CalculateFaceDirection) {
    BattleWorkUnitPart* thisPart = NULL;
    BattleWorkUnitPart* targetPart = NULL;
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 btlId, flags, index, value;
    s32 thisId, thisPartId;
    s32 targetId, targetPartId;
    BattleWorkUnit *targetUnit, *thisUnit;
    f32 calculate;
    f32 thisX, thisY, thisZ;
    f32 targetX, targetY, targetZ;
    f32 offsetX, offsetY, offsetZ;
    f32 localX, localY, localZ;
    f32 thisOffsetX, thisOffsetY, thisOffsetZ;

    btlId = evtGetValue(event, args[0]);
    thisId = BattleTransID(event, btlId);
    thisPartId = evtGetValue(event, args[1]);
    targetId = evtGetValue(event, args[2]);
    targetPartId = evtGetValue(event, args[3]);
    flags = args[4];
    index = args[5];

    if (!(flags & 9)) {
        targetId = BattleTransID(event, targetId);
    }

    thisUnit = BattleGetUnitPtr(_battleWorkPointer, thisId);
    if (thisPartId != -1) {
        thisPart = BtlUnit_GetPartsPtr(thisUnit, thisPartId);
    }

    if (flags & 0x10) {
        targetUnit = BattleGetUnitPtr(_battleWorkPointer, targetId);
        if (targetPartId != -1) {
            targetPart = BtlUnit_GetPartsPtr(targetUnit, targetPartId);
        }
    }

    value = thisUnit->faceDirection;
    if (thisPart) {
        value = thisPart->faceDirection;
    }

    if (flags & 4) {
        value = wp->mAllianceInfo[thisUnit->mAlliance].mAttackDirection;
    }

    if (flags & 8) {
        value = thisUnit->moveDirection;
        if (thisPart) {
            value = thisPart->moveDirection;
        }
    }

    if (flags & 0x10) {
        BtlUnit_GetPos(thisUnit, &thisX, &thisY, &thisZ);
        if (thisPart) {
            if (thisPart->attributes & 0x10000000) {
                BtlUnit_GetPartsPos(thisPart, &thisX, &thisY, &thisZ);
            }
            else {
                BtlUnit_GetPartsOffsetPos(thisPart, &offsetX, &offsetY, &offsetZ);
                thisX += offsetX;
            }
        }

        BtlUnit_GetPos(targetUnit, &targetX, &targetY, &targetZ);
        if (targetPart) {
            if (targetPart->attributes & 0x10000000) {
                BtlUnit_GetPartsPos(targetPart, &targetX, &targetY, &targetZ);
            }
            else {
                BtlUnit_GetPartsOffsetPos(targetPart, &offsetX, &offsetY, &offsetZ);
                targetX += offsetX;
            }
        }

        calculate = targetX - thisX;
        if (calculate <= 0.0f) {
            if (calculate < 0.0f) {
                value = -1;
            }
        }
        else {
            value = 1;
        }
    }

    if (flags & 1) {
        BtlUnit_GetPos(thisUnit, &localX, &localY, &localZ);
        if (thisPart) {
            if (thisPart->attributes & 0x10000000) {
                BtlUnit_GetPartsPos(thisPart, &localX, &localY, &localZ);
            }
            else {
                BtlUnit_GetPartsOffsetPos(thisPart, &thisOffsetX, &thisOffsetY, &thisOffsetZ);
                localX += thisOffsetX;
            }
        }
        calculate = (f32)targetId - localX;
        if (calculate <= 0.0f) {
            if (calculate < 0.0f) {
                value = -1;
            }
        }
        else {
            value = 1;
        }
    }
    if (flags & 0x100) {
        value = -value;
    }
    evtSetValue(event, index, value);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_GetFaceDirection) {
    s32* args = event->args;
    s32 btlId, id, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    index = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    evtSetValue(event, index, unit->faceDirection);
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_ChangeFaceDirection) {
    s32* args = event->args;
    s32 btlId, id;
    s8 value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    value = (s8)evtGetValue(event, args[1]);
    BattleGetUnitPtr(_battleWorkPointer, id)->faceDirection = value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_ChangePartsFaceDirection) {
    s32* args = event->args;
    s32 btlId, id, partId;
    s8 value;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    value = (s8)evtGetValue(event, args[2]);
    BattleGetUnitPartsPtr(id, partId)->faceDirection = value;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_ResetFaceDirection) {
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, *event->args);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(wp, id);
    unit->faceDirection = wp->mAllianceInfo[unit->mAlliance].mAttackDirection;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckAttribute) {
    s32* args = event->args;
    s32 btlId, id, mask, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    mask = args[1];
    index = args[2];
    if (BattleGetUnitPtr(_battleWorkPointer, id)->mAttributeFlags & mask) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OnAttribute) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, mask;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    mask = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->mAttributeFlags |= mask;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OffAttribute) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, mask;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    mask = args[1];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->mAttributeFlags &= ~mask;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckPartsAttribute) {
    s32* args = event->args;
    s32 btlId, id, partId, mask, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    mask = args[2];
    index = args[3];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    if (BtlUnit_GetPartsPtr(unit, partId)->attributes & mask) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OnPartsAttribute) {
    s32* args = event->args;
    s32 btlId, id, partId, mask;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    mask = args[2];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BtlUnit_GetPartsPtr(unit, partId);
    part->attributes |= mask;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OffPartsAttribute) {
    s32* args = event->args;
    s32 btlId, id, partId, mask;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    mask = args[2];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BtlUnit_GetPartsPtr(unit, partId);
    part->attributes &= ~mask;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckPartsCounterAttribute) {
    s32* args = event->args;
    s32 btlId, id, partId, mask, index;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    mask = args[2];
    index = args[3];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    if (BtlUnit_GetPartsPtr(unit, partId)->counterAttributes & mask) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OnPartsCounterAttribute) {
    s32* args = event->args;
    s32 btlId, id, partId, mask;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    mask = args[2];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BtlUnit_GetPartsPtr(unit, partId);
    part->counterAttributes |= mask;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OffPartsCounterAttribute) {
    s32* args = event->args;
    s32 btlId, id, partId, mask;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    mask = args[2];
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BtlUnit_GetPartsPtr(unit, partId);
    part->counterAttributes &= ~mask;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetPartsBlur) {
    s32* args = event->args;
    BattleWorkUnitPart* part;
    BattleWorkUnit* unit;
    s8 color0, color1, color2, color3;
    s8 color4, color5, color6, color7;
    s32 btlId, id, partId;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    partId = evtGetValue(event, args[1]);
    color0 = (s8)evtGetValue(event, args[2]);
    color1 = (s8)evtGetValue(event, args[3]);
    color2 = (s8)evtGetValue(event, args[4]);
    color3 = (s8)evtGetValue(event, args[5]);
    color4 = (s8)evtGetValue(event, args[6]);
    color5 = (s8)evtGetValue(event, args[7]);
    color6 = (s8)evtGetValue(event, args[8]);
    color7 = (s8)evtGetValue(event, args[9]);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    part = BtlUnit_GetPartsPtr(unit, partId);
    part->blurWork.color[0] = color0;
    part->blurWork.color[1] = color1;
    part->blurWork.color[2] = color2;
    part->blurWork.color[3] = color3;
    part->blurWork.color[4] = color4;
    part->blurWork.color[5] = color5;
    part->blurWork.color[6] = color6;
    part->blurWork.color[7] = color7;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OnToken) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->mTokenFlags |= args[1];
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_OffToken) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    unit->mTokenFlags &= ~args[1];
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckToken) {
    s32* args = event->args;
    BattleWorkUnit* unit;
    s32 btlId, id, index;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    unit = BattleGetUnitPtr(_battleWorkPointer, id);
    index = args[2];
    if (unit->mTokenFlags & args[1]) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_SetRegistStatus) {
    s32* args = event->args;
    BattleVulnerableStatus* status;
    s32 btlId, id;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    status = (BattleVulnerableStatus*)evtGetValue(event, args[1]);
    BattleGetUnitPtr(_battleWorkPointer, id)->vulnStatus = status;
    return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_CheckCommandUnit) {
    s32* args = event->args;
    s32 btlId, id, index;
    BattleUnitType kind;

    btlId = evtGetValue(event, args[0]);
    id = BattleTransID(event, btlId);
    kind = BattleGetUnitPtr(_battleWorkPointer, id)->currentKind;
    index = args[1];
    if (kind == UNIT_MARIO || kind >= TYPE_PARTNER_MIN && kind < TYPE_PARTNER_MAX) {
        evtSetValue(event, index, 1);
    }
    else {
        evtSetValue(event, index, 0);
    }
    return EVT_RETURN_DONE;
}




















































//s32* battleId, s32* windowStartFrame, s32* windowEndFrame, s32* endFrame, s32* earlyFrames
USERFUNC_DEF(btlevtcmd_ACRStart) {
    s32* args = event->args;
    BattleWork* wp = _battleWorkPointer;
    s32 id, windowStartFrame, windowEndFrame, endFrame, earlyFrames;

    if (isFirstCall) {
        id = BattleTransID(event, evtGetValue(event, args[0]));
        windowStartFrame = evtGetValue(event, args[1]);
        windowEndFrame = evtGetValue(event, args[2]);
        endFrame = evtGetValue(event, args[3]);
        earlyFrames = evtGetValue(event, args[4]);
        BattleAcrobatStart(wp, id, windowStartFrame, windowEndFrame, endFrame, earlyFrames);
    }
    return BattleAcrobatMain(wp);
}

//s32 resultRetIndex, s32 frameRetIndex (can be EVTDAT_POINTER_MAX to skip)
USERFUNC_DEF(btlevtcmd_ACRGetResult) {
    s32* args = event->args;
    s32 index1, index2, frame, result;

    index1 = args[0];
    index2 = args[1];
    BattleAcrobatGetResult(_battleWorkPointer, &result, &frame);
    if (index1 != EVTDAT_POINTER_MAX) {
        evtSetValue(event, index1, result);
    }
    if (index2 != EVTDAT_POINTER_MAX) {
        evtSetValue(event, index2, frame);
    }
    return EVT_RETURN_DONE;
}
