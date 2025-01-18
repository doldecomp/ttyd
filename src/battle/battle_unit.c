#include "battle/battle_unit.h"
#include "battle/battle.h"
#include "system.h"
#include <string.h>

extern BattleWork* _battleWorkPointer;

//local prototypes
void _CheckMoveCount(BattleWorkUnit* unit);

BOOL BtlUnit_Init(void) { //TODO: force stmw/lmw, otherwise 1:1
    int i;
    BattleWork* wp = _battleWorkPointer;

    for (i = 0; i < 64; i++) {
        BattleSetUnitPtr(wp, i, NULL);
    }
    return TRUE;
}

BattleWorkUnit* BtlUnit_Entry(BattleUnitSetup* setup) {
    BattleWork* wp = _battleWorkPointer;
    BattleWorkUnit* unit;
    int i;

    for (i = 0; i < 64; i++) {
        if (!BattleGetUnitPtr(wp, i)) break;
    }
    if (i >= 64) return NULL;

    unit = (BattleWorkUnit*)BattleAlloc(sizeof(BattleWorkUnit));
    if (!unit) return NULL;

    memset(unit, 0, sizeof(BattleWorkUnit));
    BattleSetUnitPtr(wp, i, unit);
    unit->mUnitId = i;
    unit->mKindParams = setup->mUnitKindParams;
    unit->dataTable = unit->mKindParams->dataTable;
    unit->mInitialKind = setup->mUnitKindParams->mUnitType;
    unit->currentKind = setup->mUnitKindParams->mUnitType;
    BattleStatusEffectInit(unit);
    BattleStatusIconInit(unit);





    //TODO: finish
    return NULL;
}

BOOL BtlUnit_Delete(BattleWorkUnit* unit) {
    return FALSE;
}

BattleWorkUnit* BtlUnit_Spawn(BattleUnitSetup* setup, s32 flags) {
    return NULL;
}

s32 BtlUnit_GetUnitId(BattleWorkUnit* unit) {
    return unit->mUnitId;
}

BattleWorkUnitPart* BtlUnit_GetPartsPtr(BattleWorkUnit* unit, s32 partNum) {
    BattleWorkUnitPart* part;

    part = unit->mParts;
    if (partNum >= 0) {
        if (part->mNextPart) {
            while (part && part->mKindPartParams->partNum != partNum) {
                part = part->mNextPart;
            }
        }
    }
    return part;
}

s32 BtlUnit_GetBodyPartsId(BattleWorkUnit* unit) {
    BattleWorkUnitPart* part;
    s32 ret = -1;

    if (unit) {
        for (part = unit->mParts; part; part = part->mNextPart) {
            if (part->attributes & kMainPart) {
                ret = part->mKindPartParams->partNum;
                break;
            }
        }
    }
    return ret;
}

void BtlUnit_GetPos(BattleWorkUnit* unit, f32* x, f32* y, f32* z) {
    *x = unit->mPosition.x;
    *y = unit->mPosition.y;
    *z = unit->mPosition.z;
}

void BtlUnit_SetPos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    unit->mPosition.x = x;
    unit->mPosition.y = y;
    unit->mPosition.z = z;
}

void BtlUnit_AddPos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    unit->mPosition.x += x;
    unit->mPosition.y += y;
    unit->mPosition.z += z;
}

void BtlUnit_GetPartsPos(BattleWorkUnitPart* part, f32* x, f32* y, f32* z) {
    *x = part->mPosition.x;
    *y = part->mPosition.y;
    *z = part->mPosition.z;
}

void BtlUnit_SetPartsPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mPosition.x = x;
    part->mPosition.y = y;
    part->mPosition.z = z;
}

void BtlUnit_AddPartsPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mPosition.x += x;
    part->mPosition.y += y;
    part->mPosition.z += z;
}

void BtlUnit_GetPartsWorldPos(BattleWorkUnitPart* part, f32* x, f32* y, f32* z) {

}

void BtlUnit_GetHitPos(BattleWorkUnit* unit, BattleWorkUnitPart* part, f32* x, f32* y, f32* z) {
    f32 y_multiply = 1.0f;
    s32 direction = _battleWorkPointer->mAllianceInfo[unit->mAlliance].mAttackDirection;
    BtlUnit_GetPartsWorldPos(part, x, y, z);
    //add hit base offset
    *x = ((f32)direction * (part->mHitBaseOffset.x * unit->mSizeMultiplier)) + *x;
    *y = (y_multiply * (part->mHitBaseOffset.y * unit->mSizeMultiplier)) + *y;
    *z = (part->mHitBaseOffset.z * unit->mSizeMultiplier) + *z;
    //add hit offset
    *x = ((f32)direction * (part->mHitOffset.x * unit->mSizeMultiplier)) + *x;
    *y = (y_multiply * (part->mHitOffset.y * unit->mSizeMultiplier)) + *y;
    *z = (part->mHitOffset.z * unit->mSizeMultiplier) + *z;
}

void BtlUnit_SetHitOffset(BattleWorkUnit* unit, BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mHitOffset.x = x;
    part->mHitOffset.y = y;
    part->mHitOffset.z = z;
}

void BtlUnit_SetHitCursorOffset(BattleWorkUnit* unit, BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mHitCursorOffset.x = x;
    part->mHitCursorOffset.y = y;
    part->mHitCursorOffset.z = z;
}

void BtlUnit_GetHomePos(BattleWorkUnit* unit, f32* x, f32* y, f32* z) {
    *x = unit->mHomePosition.x;
    *y = unit->mHomePosition.y;
    *z = unit->mHomePosition.z;
}

void BtlUnit_SetHomePos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    unit->mHomePosition.x = x;
    unit->mHomePosition.y = y;
    unit->mHomePosition.z = z;
}

void BtlUnit_AddHomePos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    unit->mHomePosition.x += x;
    unit->mHomePosition.y += y;
    unit->mHomePosition.z += z;
}

void BtlUnit_SetPartsHomePos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mHomePosition.x = x;
    part->mHomePosition.y = y;
    part->mHomePosition.z = z;
}

void BtlUnit_SetRotate(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 new_x, new_y, new_z;

    new_x = reviseAngle(x);
    if (new_x >= 360.0f) {
        new_x = 0.0f;
    }
    unit->mRotation.x = new_x;

    new_y = reviseAngle(y);
    if (new_y >= 360.0f) {
        new_y = 0.0f;
    }
    unit->mRotation.y = new_y;

    new_z = reviseAngle(z);
    if (new_z >= 360.0f) {
        new_z = 0.0f;
    }
    unit->mRotation.z = new_z;
}

void BtlUnit_GetRotate(BattleWorkUnit* unit, f32* x, f32* y, f32* z) {
    *x = unit->mRotation.x;
    *y = unit->mRotation.y;
    *z = unit->mRotation.z;
}

void BtlUnit_AddRotate(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    unit->mRotation.x = reviseAngle(unit->mRotation.x + x);
    if (unit->mRotation.x >= 360.0f) {
        unit->mRotation.x = 0.0f;
    }
    unit->mRotation.y = reviseAngle(unit->mRotation.y + y);
    if (unit->mRotation.y >= 360.0f) {
        unit->mRotation.y = 0.0f;
    }
    unit->mRotation.z = reviseAngle(unit->mRotation.z + z);
    if (unit->mRotation.z >= 360.0f) {
        unit->mRotation.z = 0.0f;
    }
}

void BtlUnit_SetPartsRotate(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mRotation.x = x;
    part->mRotation.y = y;
    part->mRotation.z = z;
}

void BtlUnit_GetPartsRotate(BattleWorkUnitPart* part, f32* x, f32* y, f32* z) {
    *x = part->mRotation.x;
    *y = part->mRotation.y;
    *z = part->mRotation.z;
}

void BtlUnit_AddPartsRotate(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mRotation.x += x;
    if (part->mRotation.x <= 360.0f) {
        if (part->mRotation.x < 0.0f) {
            part->mRotation.x += 360.0f;
        }
    }
    else {
        part->mRotation.x -= 360.0f;
    }

    part->mRotation.y += y;
    if (part->mRotation.y <= 360.0f) {
        if (part->mRotation.y < 0.0f) {
            part->mRotation.y += 360.0f;
        }
    }
    else {
        part->mRotation.y -= 360.0f;
    }

    part->mRotation.z += z;
    if (part->mRotation.z <= 360.0f) {
        if (part->mRotation.z < 0.0f) {
            part->mRotation.z += 360.0f;
        }
    }
    else {
        part->mRotation.z -= 360.0f;
    }
}

void BtlUnit_SetBaseRotate(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    unit->mBaseRotation.x = reviseAngle(x);
    unit->mBaseRotation.y = reviseAngle(y);
    unit->mBaseRotation.z = reviseAngle(z);
}

void BtlUnit_GetBaseRotate(BattleWorkUnit* unit, f32* x, f32* y, f32* z) {
    *x = unit->mBaseRotation.x;
    *y = unit->mBaseRotation.y;
    *z = unit->mBaseRotation.z;
}

void BtlUnit_SetPartsBaseRotate(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mBaseRotation.x = x;
    part->mBaseRotation.y = y;
    part->mBaseRotation.z = z;
}

void BtlUnit_GetPartsBaseRotate(BattleWorkUnitPart* part, f32* x, f32* y, f32* z) {
    *x = part->mBaseRotation.x;
    *y = part->mBaseRotation.y;
    *z = part->mBaseRotation.z;
}

void BtlUnit_SetRotateOffset(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mRotationOffset.x = x;
    }
    if (thefuckyone != y) {
        unit->mRotationOffset.y = y;
    }
    if (thefuckyone != z) {
        unit->mRotationOffset.z = z;
    }
}

void BtlUnit_SetPartsRotateOffset(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mRotationOffset.x = x;
    }
    if (thefuckyone != y) {
        part->mRotationOffset.y = y;
    }
    if (thefuckyone != z) {
        part->mRotationOffset.z = z;
    }
}

void BtlUnit_AddPartsRotateOffset(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mRotationOffset.x += x;
    part->mRotationOffset.y += y;
    part->mRotationOffset.z += z;
}

void BtlUnit_SetBaseScale(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mBaseScale.x = x;
    }
    if (thefuckyone != y) {
        unit->mBaseScale.y = y;
    }
    if (thefuckyone != z) {
        unit->mBaseScale.z = z;
    }
}

void BtlUnit_GetScale(BattleWorkUnit* unit, f32* x, f32* y, f32* z) {
    *x = unit->mScale.x;
    *y = unit->mScale.y;
    *z = unit->mScale.z;
}

void BtlUnit_SetScale(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mScale.x = x;
    }
    if (thefuckyone != y) {
        unit->mScale.y = y;
    }
    if (thefuckyone != z) {
        unit->mScale.z = z;
    }
}

void BtlUnit_AddScale(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mScale.x += x;
    }
    if (thefuckyone != y) {
        unit->mScale.y += y;
    }
    if (thefuckyone != z) {
        unit->mScale.z += z;
    }
}

void BtlUnit_SetPartsBaseScale(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mBaseScale.x = x;
    }
    if (thefuckyone != y) {
        part->mBaseScale.y = y;
    }
    if (thefuckyone != z) {
        part->mBaseScale.z = z;
    }
}

void BtlUnit_SetPartsScale(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mScale.x = x;
    }
    if (thefuckyone != y) {
        part->mScale.y = y;
    }
    if (thefuckyone != z) {
        part->mScale.z = z;
    }
}

void BtlUnit_AddPartsScale(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mScale.x += x;
    }
    if (thefuckyone != y) {
        part->mScale.y += y;
    }
    if (thefuckyone != z) {
        part->mScale.z += z;
    }
}

s16 BtlUnit_GetWidth(BattleWorkUnit* unit) {
    return unit->mWidth;
}

s16 BtlUnit_GetHeight(BattleWorkUnit* unit) {
    return unit->mHeight;
}

void BtlUnit_SetHeight(BattleWorkUnit* unit, s16 height) {
    unit->mHeight = height;
}

void BtlUnit_SetOffsetPos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mPositionOffset.x = x;
    }
    if (thefuckyone != y) {
        unit->mPositionOffset.y = y;
    }
    if (thefuckyone != z) {
        unit->mPositionOffset.z = z;
    }
}

void BtlUnit_GetPartsOffsetPos(BattleWorkUnitPart* part, f32* x, f32* y, f32* z) {
    *x = part->mPositionOffset.x;
    *y = part->mPositionOffset.y;
    *z = part->mPositionOffset.z;
}

void BtlUnit_SetPartsOffsetPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mPositionOffset.x = x;
    }
    if (thefuckyone != y) {
        part->mPositionOffset.y = y;
    }
    if (thefuckyone != z) {
        part->mPositionOffset.z = z;
    }
}

void BtlUnit_AddPartsOffsetPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    part->mPositionOffset.x += x;
    part->mPositionOffset.y += y;
    part->mPositionOffset.z += z;
}

void BtlUnit_SetDispOffset(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mDisplayOffset.x = x;
    }
    if (thefuckyone != y) {
        unit->mDisplayOffset.y = y;
    }
    if (thefuckyone != z) {
        unit->mDisplayOffset.z = z;
    }
}

void BtlUnit_SetPartsDispOffset(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mDisplayOffset.x = x;
    }
    if (thefuckyone != y) {
        part->mDisplayOffset.y = y;
    }
    if (thefuckyone != z) {
        part->mDisplayOffset.z = z;
    }
}

void BtlUnit_AddPartsDispOffset(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mDisplayOffset.x += x;
    }
    if (thefuckyone != y) {
        part->mDisplayOffset.y += y;
    }
    if (thefuckyone != z) {
        part->mDisplayOffset.z += z;
    }
}

void BtlUnit_SetMoveStartPos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mMoveStartPos.x = x;
    }
    if (thefuckyone != y) {
        unit->mMoveStartPos.y = y;
    }
    if (thefuckyone != z) {
        unit->mMoveStartPos.z = z;
    }
}

void BtlUnit_SetPartsMoveStartPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mMoveStartPos.x = x;
    }
    if (thefuckyone != y) {
        part->mMoveStartPos.y = y;
    }
    if (thefuckyone != z) {
        part->mMoveStartPos.z = z;
    }
}

void BtlUnit_SetMoveCurrentPos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mMoveCurrentPos.x = x;
    }
    if (thefuckyone != y) {
        unit->mMoveCurrentPos.y = y;
    }
    if (thefuckyone != z) {
        unit->mMoveCurrentPos.z = z;
    }
}

void BtlUnit_SetPartsMoveCurrentPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mMoveCurrentPos.x = x;
    }
    if (thefuckyone != y) {
        part->mMoveCurrentPos.y = y;
    }
    if (thefuckyone != z) {
        part->mMoveCurrentPos.z = z;
    }
}

void BtlUnit_SetMoveTargetPos(BattleWorkUnit* unit, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        unit->mMoveTargetPos.x = x;
    }
    if (thefuckyone != y) {
        unit->mMoveTargetPos.y = y;
    }
    if (thefuckyone != z) {
        unit->mMoveTargetPos.z = z;
    }
}

void BtlUnit_SetPartsMoveTargetPos(BattleWorkUnitPart* part, f32 x, f32 y, f32 z) {
    f32 thefuckyone = -2.0468902587890625f;
    if (thefuckyone != x) {
        part->mMoveTargetPos.x = x;
    }
    if (thefuckyone != y) {
        part->mMoveTargetPos.y = y;
    }
    if (thefuckyone != z) {
        part->mMoveTargetPos.z = z;
    }
}

void BtlUnit_SetFallAccel(BattleWorkUnit* unit, f32 fallAccel) {
    unit->mFallAccel = fallAccel;
}

void BtlUnit_SetPartsFallAccel(BattleWorkUnitPart* part, f32 fallAccel) {
    part->mFallAccel = fallAccel;
}

void BtlUnit_SetMoveSpeed(BattleWorkUnit* unit, f32 moveSpeedXZ) {
    unit->mMoveSpeedXZ = moveSpeedXZ;
}

void BtlUnit_SetPartsMoveSpeed(BattleWorkUnitPart* part, f32 moveSpeedXZ) {
    part->mMoveSpeedXZ = moveSpeedXZ;
}

void BtlUnit_SetJumpSpeed(BattleWorkUnit* unit, f32 moveSpeedY) {
    unit->mMoveSpeedY = moveSpeedY;
}

s8 BtlUnit_GetBelong(BattleWorkUnit* unit) {
    return unit->mAlliance;
}

void _CheckMoveCount(BattleWorkUnit* unit) {
    s8 maxmoves;

    if (!(unit->mTokenFlags & kCurrentlyActing)) {
        maxmoves = unit->maxMovesThisTurn;
        if (maxmoves > 0 && maxmoves == unit->movesRemaining) {
            BtlUnit_ResetMoveStatus(unit);
        }
    }
}

void BtlUnit_GetStatus(BattleWorkUnit* unit, StatusEffectType type, s8* turns, s8* strength) {
    s8 status_turns, status_strength;

    switch (type) {
        case kStatusSleep:
            status_strength = unit->mSleepTurns;
            status_turns = status_strength;
            break;
        case kStatusStop:
            status_strength = unit->mStopTurns;
            status_turns = status_strength;
            break;
        case kStatusDizzy:
            status_strength = unit->mDizzyTurns;
            status_turns = status_strength;
            break;
        case kStatusPoison:
            status_turns = unit->mPoisonTurns;
            status_strength = unit->mPoisonStrength;
            break;
        case kStatusConfuse:
            status_strength = unit->mConfusionTurns;
            status_turns = status_strength;
            break;
        case kStatusElectric:
            status_strength = unit->mElectricTurns;
            status_turns = status_strength;
            break;
        case kStatusDodgy:
            status_strength = unit->mDodgyTurns;
            status_turns = status_strength;
            break;
        case kStatusBurn:
            status_strength = unit->mBurnTurns;
            status_turns = status_strength;
            break;
        case kStatusFreeze:
            status_strength = unit->mFreezeTurns;
            status_turns = status_strength;
            break;
        case kStatusHuge:
            if (unit->mSizeChangeStrength > 0) {
                status_turns = unit->mSizeChangeTurns;
                status_strength = unit->mSizeChangeStrength;
            }
            break;
        case kStatusTiny:
            if (unit->mSizeChangeStrength < 0) {
                status_turns = unit->mSizeChangeTurns;
                status_strength = unit->mSizeChangeStrength;
            }
            break;
        case kStatusAttackUp:
            if (unit->mAtkChangeStrength > 0) {
                status_turns = unit->mAtkChangeTurns;
                status_strength = unit->mAtkChangeStrength;
            }
            break;
        case kStatusAttackDown:
            if (unit->mAtkChangeStrength < 0) {
                status_turns = unit->mAtkChangeTurns;
                status_strength = unit->mAtkChangeStrength;
            }
            break;
        case kStatusDefenseUp:
            if (unit->mDefChangeStrength > 0) {
                status_turns = unit->mDefChangeTurns;
                status_strength = unit->mDefChangeStrength;
            }
            break;
        case kStatusDefenseDown:
            if (unit->mDefChangeStrength < 0) {
                status_turns = unit->mDefChangeTurns;
                status_strength = unit->mDefChangeStrength;
            }
            break;
        case kStatusFast:
            status_strength = unit->mFastTurns;
            status_turns = status_strength;
            break;
        case kStatusSlow:
            status_strength = unit->mSlowTurns;
            status_turns = status_strength;
            break;
        case kStatusCharge:
            status_strength = unit->mChargeStrength;
            status_turns = status_strength;
            break;
        case kStatusAllergic:
            status_strength = unit->mAllergicTurns;
            status_turns = status_strength;
            break;
        case kStatusFlipped:
            status_strength = unit->flippedTurns;
            status_turns = status_strength;
            break;
        case kStatusInvisible:
            status_strength = unit->mInvisibleTurns;
            status_turns = status_strength;
            break;
        case kStatusPayback:
            status_strength = unit->mPaybackTurns;
            status_turns = status_strength;
            break;
        case kStatusHoldFast:
            status_strength = unit->mHoldFastTurns;
            status_turns = status_strength;
            break;
        case kStatusHpRegen:
            status_turns = unit->mHpRegenTurns;
            status_strength = unit->mHpRegenStrength;
            break;
        case kStatusFpRegen:
            status_turns = unit->mFpRegenTurns;
            status_strength = unit->mFpRegenStrength;
            break;
        case kStatusInstantKill:
            status_strength = unit->mInstantKillStrength;
            status_turns = status_strength;
            break;
        default:
            break;
    }
    if (turns) {
        *turns = status_turns;
    }
    if (strength) {
        *strength = status_strength;
    }
}

BOOL BtlUnit_SetStatus(BattleWorkUnit* unit, StatusEffectType type, s8 turns, s8 strength) {
    switch (type) {
        case kStatusSleep:
            unit->mSleepTurns = turns;
            unit->mSleepStrength = 0;
            break;
        case kStatusStop:
            unit->mStopTurns = turns;
            break;
        case kStatusDizzy:
            unit->mDizzyTurns = turns;
            break;
        case kStatusPoison:
            unit->mPoisonTurns = turns;
            unit->mPoisonStrength = strength;
            break;
        case kStatusConfuse:
            unit->mConfusionTurns = turns;
            break;
        case kStatusElectric:
            unit->mElectricTurns = turns;
            break;
        case kStatusDodgy:
            unit->mDodgyTurns = turns;
            break;
        case kStatusBurn:
            if (unit->mFreezeTurns) {
                unit->mFreezeTurns = 0;
                return FALSE;
            }
            unit->mBurnTurns = turns;
            break;
        case kStatusFreeze:
            if (unit->mBurnTurns) {
                unit->mBurnTurns = 0;
                return FALSE;
            }
            unit->mFreezeTurns = turns;
            break;
        case kStatusHuge:
        case kStatusTiny:
            if (!strength) {
                if (type == kStatusHuge) {
                    if (unit->mSizeChangeStrength >= 0) {
                        unit->mSizeChangeTurns = 0;
                        unit->mSizeChangeStrength = 0;
                        return FALSE;
                    }
                }
                else if (unit->mSizeChangeStrength <= 0) {
                    unit->mSizeChangeTurns = 0;
                    unit->mSizeChangeStrength = 0;
                    return FALSE;
                }
                return FALSE;
            }
            unit->mSizeChangeTurns = turns;
            unit->mSizeChangeStrength = strength;
            break;
        case kStatusAttackUp:
            if (!strength) {
                if (unit->mAtkChangeStrength >= 0) {
                    unit->mAtkChangeTurns = 0;
                    unit->mAtkChangeStrength = 0;
                }
                return FALSE;
            }
            unit->mAtkChangeTurns = turns;
            unit->mAtkChangeStrength = strength;
            break;
        case kStatusAttackDown:
            if (!strength) {
                if (unit->mAtkChangeStrength <= 0) {
                    unit->mAtkChangeTurns = 0;
                    unit->mAtkChangeStrength = 0;
                }
                return FALSE;
            }
            unit->mAtkChangeTurns = turns;
            unit->mAtkChangeStrength = strength;
            break;
        case kStatusDefenseUp:
        case kStatusDefenseDown:
            if (strength <= 0) {
                if (!strength) {
                    if (type == kStatusDefenseDown) {
                        if (unit->mDefChangeStrength <= 0) {
                            unit->mDefChangeTurns = 0;
                            unit->mDefChangeStrength = 0;
                        }
                    }
                    else if (unit->mDefChangeStrength >= 0) {
                        unit->mDefChangeTurns = 0;
                        unit->mDefChangeStrength = 0;
                    }
                    return FALSE;
                }
                if (unit->mDefChangeStrength > 0) {
                    unit->mDefChangeTurns = 0;
                    unit->mDefChangeStrength = 0;
                    return FALSE;
                }
                unit->mDefChangeTurns = turns;
                unit->mDefChangeStrength = strength;
            }
            else {
                if (unit->mDefChangeStrength < 0) {
                    unit->mDefChangeTurns = 0;
                    unit->mDefChangeStrength = 0;
                    return FALSE;
                }
                unit->mDefChangeTurns = turns;
                unit->mDefChangeStrength = strength;
            }
            break;
        case kStatusCharge:
            unit->mChargeStrength += strength;
            if (unit->mChargeStrength < 0) {
                unit->mChargeStrength = 0;
                return FALSE;
            }
            if (unit->mChargeStrength > 99) {
                unit->mChargeStrength = 99;
            }
            break;
        case kStatusAllergic:
            if (turns <= 0) {
                unit->mAllergicTurns = 0;
                return FALSE;
            }
            unit->mAllergicTurns = turns;
            break;
        case kStatusFlipped:
            unit->flippedTurns = turns;
            break;
        case kStatusInvisible:
            unit->mInvisibleTurns = turns;
            break;
        case kStatusPayback:
            if (turns <= 0) {
                unit->mPaybackTurns = 0;
                return FALSE;
            }
            unit->mPaybackTurns = turns;
            break;
        case kStatusHoldFast:
            unit->mHoldFastTurns = turns;
            break;
        case kStatusFast:
            if (unit->mSlowTurns <= 0) {
                unit->mFastTurns = turns;
            }
            else {
                if (turns > 0) {
                    unit->mSlowTurns = 0;
                    _CheckMoveCount(unit);
                    return FALSE;
                }
                unit->mFastTurns = turns;
            }
            _CheckMoveCount(unit);
            break;
        case kStatusSlow:
            if (unit->mFastTurns <= 0) {
                unit->mSlowTurns = turns;
            }
            else {
                if (turns > 0) {
                    unit->mFastTurns = 0;
                    _CheckMoveCount(unit);
                    return FALSE;
                }
                unit->mSlowTurns = turns;
            }
            _CheckMoveCount(unit);
            break;
        case kStatusHpRegen:
            unit->mHpRegenTurns = turns;
            unit->mHpRegenStrength = strength;
            break;
        case kStatusFpRegen:
            unit->mFpRegenTurns = turns;
            unit->mFpRegenStrength = strength;
            break;
        case kStatusInstantKill:
            unit->mInstantKillStrength = turns;
            break;
        default:
            break;
    }
    return TRUE;
}

//TODO: define that chunk of statuses to do sizeof?
void BtlUnit_ClearStatus(BattleWorkUnit* unit) {
    memset(&unit->mSleepTurns, 0, 0x1Eu);
    BtlUnit_SetStatus(unit, kStatusCharge, 1, -99);
    BattleStatusChangeInfoWorkInit(unit);
}

BOOL BtlUnit_CheckRecoveryStatus(BattleWorkUnit* unit, StatusEffectType type) {
    s8 turns, strength;

    if (!unit) {
        return FALSE;
    }
    if (BtlUnit_CheckStatus(unit, kStatusInstantKill)) {
        return FALSE;
    }
    if (unit->currentHp <= 0) {
        return FALSE;
    }
    BtlUnit_GetStatus(unit, type, &turns, &strength);
    if (!turns) {
        return FALSE;
    }
    switch (type) {
        case kStatusSleep:
            if (turns <= 1) {
                turns = 0;
            }
            else {
                turns--;
            }
            unit->mSleepTurns = turns;
            return turns == 0;
        case kStatusAllergic:
        case kStatusStop:
        case kStatusDizzy:
        case kStatusConfuse:
        case kStatusElectric:
        case kStatusDodgy:
        case kStatusBurn:
        case kStatusFreeze:
        case kStatusInvisible:
        case kStatusFast:
        case kStatusSlow:
        case kStatusPayback:
        case kStatusHoldFast:
            if (turns < 0) {
                turns++;
            }
            else {
                turns--;
            }
            if (strength < 0) {
                strength++;
            }
            else {
                strength--;
            }
            if (!turns) {
                strength = 0;
            }
            BtlUnit_SetStatus(unit, type, turns, strength);
            return turns == 0;
        case kStatusHuge:
        case kStatusTiny:
            if (turns <= 0) {
                if (turns >= 0) {
                    return FALSE;
                }
                turns++;
            }
            else {
                turns--;
            }
            if (!turns) {
                strength = 0;
            }
            unit->mSizeChangeTurns = turns;
            unit->mSizeChangeStrength = strength;
            return turns == 0;
        case kStatusAttackUp:
        case kStatusAttackDown:
            if (turns <= 0) {
                if (turns >= 0) {
                    return FALSE;
                }
                turns++;
            }
            else {
                turns--;
            }
            if (!turns) {
                strength = 0;
            }
            unit->mAtkChangeTurns = turns;
            unit->mAtkChangeStrength = strength;
            return turns == 0;
        case kStatusPoison:
        case kStatusDefenseUp:
        case kStatusDefenseDown:
        case kStatusHpRegen:
        case kStatusFpRegen:
            if (turns < 0) {
                turns++;
            }
            else {
                turns--;
            }
            if (!turns) {
                strength = 0;
            }
            BtlUnit_SetStatus(unit, type, turns, strength);
            return turns == 0;
        default:
            return FALSE;
    }
}

BOOL BtlUnit_CheckStatus(BattleWorkUnit* unit, StatusEffectType type) {
    s8 turns, strength;

    if (!unit) {
        return FALSE;
    }
    BtlUnit_GetStatus(unit, type, &turns, &strength);
    if (turns) {
        return TRUE;
    }
    return type == kStatusElectric && unit->mBadgesEquipped.mZapTap;
}

s32 BtlUnit_CheckStatusFlag(BattleWorkUnit* unit, s32 flags) {
    if (unit) {
        return unit->mStatusFlags & flags;
    }
    return 0;
}

void BtlUnit_OnStatusFlag(BattleWorkUnit* unit, s32 flags) {
    unit->mStatusFlags |= flags;
}

void BtlUnit_OffStatusFlag(BattleWorkUnit* unit, s32 flags) {
    unit->mStatusFlags &= ~flags;
}

s32 BtlUnit_CheckUnitFlag(BattleWorkUnit* unit, s32 flags) {
    return unit->mFlags & flags;
}

void BtlUnit_OnUnitFlag(BattleWorkUnit* unit, s32 flags) {
    unit->mFlags |= flags;
}

void BtlUnit_OffUnitFlag(BattleWorkUnit* unit, s32 flags) {
    unit->mFlags &= ~flags;
}

char* BtlUnit_GetPoseNameFromType(BattleWorkUnitPart* part, s32 type) {
    return NULL;
}





void BtlUnit_CheckPinchStatus(BattleWorkUnit* unit, BOOL a2) {

}






void BtlUnit_SetParamToPouch(BattleWorkUnit* unit) {

}









void BtlUnit_ResetMoveStatus(BattleWorkUnit* unit) {

}




s32 BtlUnit_GetFp(BattleWorkUnit* unit) {
    BattleUnitType kind = unit->currentKind;
    s32 result = unit->currentFp;

    if (kind >= TYPE_PARTNER_MIN && kind < TYPE_PARTNER_MAX) {
        result = BattleGetMarioPtr(_battleWorkPointer)->currentFp;
    }
    return result;
}

void BtlUnit_SetFp(BattleWorkUnit* unit, s32 value) {
    BattleUnitType kind = unit->currentKind;
    if (kind < TYPE_PARTNER_MIN || kind >= TYPE_PARTNER_MAX) {
        unit->currentFp = value;
    }
    else {
        BattleGetMarioPtr(_battleWorkPointer)->currentFp = value;
    }
}

s32 BtlUnit_GetMaxFp(BattleWorkUnit* unit) {
    BattleUnitType kind = unit->currentKind;
    s32 result = unit->mMaxFp;

    if (kind >= TYPE_PARTNER_MIN && kind < TYPE_PARTNER_MAX) {
        result = BattleGetMarioPtr(_battleWorkPointer)->mMaxFp;
    }
    return result;
}

void BtlUnit_SetMaxFp(BattleWorkUnit* unit, s32 value) {
    BattleUnitType kind = unit->currentKind;
    if (kind < TYPE_PARTNER_MIN || kind >= TYPE_PARTNER_MAX) {
        unit->mMaxFp = value;
    }
    else {
        BattleGetMarioPtr(_battleWorkPointer)->mMaxFp = value;
    }
}

void BtlUnit_RecoverHp(BattleWorkUnit* unit, s32 value) {
    s32 hp;

    unit->currentHp += value;
    hp = unit->maxHp;
    if (unit->currentHp > hp) {
        unit->currentHp = hp;
    }
}

void BtlUnit_RecoverFp(BattleWorkUnit* unit, s32 value) {
    BattleUnitType kind = unit->currentKind;
    BattleWork* wp = _battleWorkPointer;
    s16 max;
    s16* fp; //but why

    if (kind < TYPE_PARTNER_MIN || kind >= TYPE_PARTNER_MAX) {
        max = BtlUnit_GetMaxFp(unit);
        fp = &unit->currentFp;
    }
    else {
        max = BtlUnit_GetMaxFp(BattleGetMarioPtr(_battleWorkPointer));
        fp = &BattleGetMarioPtr(wp)->currentFp;
    }
    *fp += value;
    if (*fp > max) {
        *fp = max;
    }
}

s32 BtlUnit_GetHitDamage(BattleWorkUnit* unit) {
    return unit->hpDamageTaken;
}

s32 BtlUnit_GetTotalHitDamage(BattleWorkUnit* unit) {
    return unit->totalHpDamageTaken;
}

void* BtlUnit_GetData(BattleWorkUnit* unit, s32 tag) {
    BattleDataEntry* entry = unit->dataTable;

    if (!entry) {
        return NULL;
    }
    while (entry->tag) {
        if (entry->tag == tag) {
            return entry->data;
        }
        entry++;
    }
    return NULL;
}

BOOL BtlUnit_CheckData(BattleWorkUnit* unit, s32 tag) {
    BattleDataEntry* entry = unit->dataTable;

    if (!entry) {
        return FALSE;
    }
    while (entry->tag) {
        if (entry->tag == tag) {
            return TRUE;
        }
        entry++;
    }
    return FALSE;
}

BOOL BtlUnit_GetEnemyBelong(BattleWorkUnit* unit) {
    return UNIT_ALLIANCE_PARTY ? FALSE : TRUE; //wrong, can't be arsed to match
}