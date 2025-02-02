#include "battle/battle.h"
#include "battle/battle_ac.h"
#include "battle/battle_ac_help.h"
#include "battle/battle_audience.h"
#include "battle/battle_break_slot.h"
#include "battle/battle_disp.h"
#include "battle/battle_icon.h"
#include "battle/battle_menu_disp.h"
#include "battle/battle_pad.h"
#include "battle/battle_seq.h"
#include "battle/battle_stage.h"
#include "battle/battle_stage_object.h"
#include "battle/battle_status_effect.h"
#include "battle/battle_unit.h"
#include "driver/camdrv.h"
#include "mario/mario.h"
#include "manager/evtmgr.h"
#include "mario/mariost.h"
#include "memory.h"
#include <string.h>

extern GlobalWork* gp;
extern BOOL debug_battle_flag; //seq_battle.c



//.sbss
BattleWork* _battleWorkPointer;


//local prototypes
void BattlePartyInfoWorkInit(BattleWork* work);
void BattleCheckUnitBroken(BattleWork* work);
BOOL BattleMain(void);

//careful, battleMain not BattleMain
void battleMain(void) {
    if (_battleWorkPointer) {
        if (!BattleMain()) {
            _battleWorkPointer->flags |= BATTLE_SEQ_END;
        }
    }
}


void battle_exit(void) {
    /*
    LightEntry* entry;
    Mtx mtx;

    BattleEnd();
    itemReInit();
    iconReInit();
    extReset();
    if (camGetPtr(4)->mFlags & 4) {
        camSetMode(4, 1);
    }
    else {
        camSetMode(4, 3);
    }
    npcReset(1);
    mobjReset(1);
    offscreenReset(1);
    imgAutoRelease(1);
    effAutoRelease(1);
    animPoseAutoRelease(1);
    evtmgrReInit();
    npcRecoveryFiledNpc();
    gp->isBattleInit = 0;
    memClear(HEAP_BATTLE);
    evtStartAll(4);
    if (!debug_battle_flag) {
        marioCtrlOn();
        partyCtrlOn();
        marioGetPtr()->flags |= 1;
    }
    psndBGM_stop();
    psndClearFlag(0x80);
    entry = lightGetPaperCraft();
    (entry->mPos).x = -200.0f;
    (entry->mPos).y = 100.0f;
    (entry->mPos).z = 100.0f;
    MTXScale(mtx, 3.0f, 3.0f, 3.0f);
    MTXMultVec(mtx, &entry->mPos, &entry->mPos);
    if (evtGetValue(NULL, GSW(0)) < 0x6D || evtGetValue(NULL, GSW(0)) >= 0x6F) {
        if (evtGetValue(NULL, GSW(0)) != 0x192 && seqGetNextSeq() != 5) {
            psndBGMOn(0x120, 0);
            psndENVOn(0x120, 0);
        }
    }
    else {
        sub_800D7270(0x120, 0, 0x2EE, 1); //psnd something
    }
    */
}

BOOL battle_init(void) {
    return 0;
}




void BattlePartyInfoWorkInit(BattleWork* work) {

}

void BattleAfterReactionQueueInit(void) {

}

void BattleCheckUnitBroken(BattleWork* work) {

}










BattleWorkUnit* BattleGetPartnerPtr(BattleWork* work, BattleWorkUnit* unit) {
    if (unit->currentKind == UNIT_MARIO) {
        return BattleGetPartyPtr(work);
    }
    else {
        return BattleGetMarioPtr(work);
    }
}

BattleWorkUnit* BattleGetPartyPtr(BattleWork* work) {
    BattleWorkUnit* unit;
    BattleUnitType kind;
    int i;

    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(work, i);
        if (unit && !(unit->mFlags & 8)) {
            kind = unit->currentKind;
            if (kind >= TYPE_PARTNER_MIN && kind < TYPE_PARTNER_MAX && UNIT_ALLIANCE_ENEMY) {
                return unit;
            }
        }
    }
    return NULL;
}

BattleWorkUnit* BattleGetMarioPtr(BattleWork* work) {
    BattleWorkUnit* unit;
    int i;
    
    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(work, i);
        if (unit && unit->currentKind == UNIT_MARIO && UNIT_ALLIANCE_PARTY) {
            return unit;
        }
    }
    return NULL;
}

BattleWorkUnit* BattleGetSystemPtr(BattleWork* work) {
    BattleWorkUnit* unit;
    int i;

    for (i = 0; i < 64; i++) {
        unit = BattleGetUnitPtr(work, i);
        if (unit && unit->currentKind == kUnitSystem) {
            return unit;
        }
    }
    return NULL;
}

BattleWorkUnitPart* BattleGetUnitPartsPtr(s32 index, s32 partNum) {
    BattleWorkUnit* unit;

    unit = BattleGetUnitPtr(_battleWorkPointer, index);
    return BtlUnit_GetPartsPtr(unit, partNum);
}

void BattleSetUnitPtr(BattleWork* work, s32 index, BattleWorkUnit* unit) {
    if (index < 64) {
        work->mUnits[index] = unit;
    }
}

//TODO: double check identical asm
BattleWorkUnit* BattleGetUnitPtr(BattleWork* work, s32 index) {
    if (-1 < index < 64) {
        return work->mUnits[index];
    }
    return NULL;
}

void BattleFree(void* ptr) {
    if (ptr) {
        __memFree(HEAP_BATTLE, ptr);
    }
}

void* BattleAlloc(u32 size) {
    return __memAlloc(HEAP_BATTLE, size);
}

void BattleIncSeq(BattleWork* work, s32 seq) {
    BattleSetSeq(work, seq, BattleGetSeq(work, seq) + 1);
}

u32 BattleGetSeq(BattleWork* work, BattleSequence seq) {
    switch (seq) {
    case SEQ_UNKNOWN:
        return work->mSeq_Unknown;
        break;
    case SEQ_INIT:
        return work->mSeqInit;
        break;
    case SEQ_FIRST_ACT:
        return work->mSeqFirstAct;
        break;
    case SEQ_TURN:
        return work->mSeqTurn;
        break;
    case SEQ_PHASE:
        return work->mSeqPhase;
        break;
    case SEQ_MOVE:
        return work->mSeqMove;
        break;
    case SEQ_ACT:
        return work->mSeqAct;
        break;
    case SEQ_END:
        return work->mSeqEnd;
        break;
    default:
        return 0;
        break;
    }
}

void BattleSetSeq(BattleWork* work, BattleSequence seq, u32 num) {
    switch (seq) {
    case SEQ_UNKNOWN:
        work->mSeq_Unknown = num;
        break;
    case SEQ_INIT:
        work->mSeqInit = num;
        break;
    case SEQ_FIRST_ACT:
        work->mSeqFirstAct = num;
        break;
    case SEQ_TURN:
        work->mSeqTurn = num;
        break;
    case SEQ_PHASE:
        work->mSeqPhase = num;
        break;
    case SEQ_MOVE:
        work->mSeqMove = num;
        break;
    case SEQ_ACT:
        work->mSeqAct = num;
        break;
    case SEQ_END:
        work->mSeqEnd = num;
        break;
    }
}

void BattleSetMarioParamToFieldBattle(BattleWork* work) {
    BattleWorkUnit *mario, *party;
    mario = BattleGetMarioPtr(work);
    BtlUnit_SetParamToPouch(mario);
    party = BattleGetPartyPtr(work);
    if (party) {
        BtlUnit_SetParamToPouch(party);
    }
}

void Btl_UnitSetup(BattleWork* work) {

}

void BattleEnd(void) {
    BattleWorkUnit* unit;
    int i;

    for (i = 0; i < 0x40; i++) {
        unit = BattleGetUnitPtr(_battleWorkPointer, i);
        if (unit != NULL) {
            BtlUnit_Delete(unit);
        }
    }
    BattleIconEnd();
    battleMenuDispEnd();
    BattleStageEnd();
    BattleAudience_End();
    BattleBreakSlot_End();
    if ((_battleWorkPointer->commandMenu).unk55C) {
        BattleFree((_battleWorkPointer->commandMenu).unk55C);
    }
    //_mapFree(_battleWorkPointer);, void*?
    _battleWorkPointer = NULL;
}

BOOL BattleMain(void) {
    BattleCheckUnitBroken(_battleWorkPointer);
    BattlePadManager();
    BattleSequenceManager();
    BattleActionCommandManager(_battleWorkPointer);
    BattleStageObjectMain();
    BattleIconMain();
    BattleStageMain();
    BattleAcHelpMain();
    BattleAudience_Main();
    BattleBreakSlot_Main();
    btlDispMain();
    if (BattleGetSeq(_battleWorkPointer, SEQ_UNKNOWN) == 4) {
        return FALSE;
    }
    if (!(gp->flags & 1000) || !(gp->flags & 2000) || BattleGetSeq(_battleWorkPointer, SEQ_UNKNOWN) != 2) {
        return TRUE;
    }
    _battleWorkPointer->flags |= 0x60;
    BattleSetSeq(_battleWorkPointer, SEQ_UNKNOWN, 3);
    BattleSetSeq(_battleWorkPointer, SEQ_END, 0x7000000);
    return TRUE;
}

void BattleInit(FieldBattleInfo* info) {
    int i;

    //_battleWorkPointer = (BattleWork*)_mapAlloc(sizeof(BattleWork));
    memset(_battleWorkPointer, 0, sizeof(BattleWork));
    _battleWorkPointer->field_0x19060 = -1;
    _battleWorkPointer->field_0x424 = -1;
    _battleWorkPointer->fbatInfo = info;
    BattlePadInit();
    BattleAcHelpInit();
    BattleIconInit();
    BattleActionCommandManagerInit(_battleWorkPointer);
    BattleAfterReactionQueueInit();
    BattleStatusChangeMsgWorkInit();
    btlDispInit();
    BattleSetSeq(_battleWorkPointer, SEQ_UNKNOWN, 0);
    BattleSetSeq(_battleWorkPointer, SEQ_INIT, 0x1000000);
    _battleWorkPointer->mBattleEndSeqWork = NULL;
    (_battleWorkPointer->commandMenu).unk4 = 0;
    //for some reason only 10 entries get initialized, might also not be an unrolled loop
    for (i = 0; i < 10; i++) {
        (_battleWorkPointer->commandMenu).cursor[i].unk0 = 0;
        (_battleWorkPointer->commandMenu).cursor[i].unk4 = 0;
    }
    (_battleWorkPointer->commandMenu).unk55C = NULL;
    _battleWorkPointer->mTurnCount = 0;
    memset(_battleWorkPointer->mReserveItems, 0, sizeof(_battleWorkPointer->mReserveItems));
    _battleWorkPointer->flags = 0;
    BtlUnit_Init();
    BattlePartyInfoWorkInit(_battleWorkPointer);
    BattleStageInit();
    BattleAudience_Init();
    BattleBreakSlot_Init();
}

BOOL battleSeqEndCheck(void) {
    return _battleWorkPointer->flags >> 31; //BATTLE_SEQ_END
}


















struct BattleWorkUnit* BattleChangeParty(BattleWork* wp) {
    return NULL;
}

s32 BattleTransPartyId(BattleUnitType kind) {
    switch (kind) {
        case kUnitGoombella:
        case kUnitGoombellaChapter4:
        case kUnitDooplissChapter8Goombella:
            return 1;
        case kUnitKoops:
        case kUnitKoopsChapter4:
        case kUnitDooplissChapter8Koops:
            return 2;
        case kUnitYoshi:
        case kUnitYoshiChapter4:
        case kUnitDooplissChapter8Yoshi:
            return 4;
        case kUnitFlurrie:
        case kUnitFlurrieChapter4:
        case kUnitDooplissChapter8Flurrie:
            return 5;
        case kUnitVivian:
        case kUnitDooplissChapter8Vivian:
            return 6;
        case kUnitBobbery:
        case kUnitDooplissChapter8Bobbery:
            return 3;
        case kUnitMsMowz:
        case kUnitDooplissChapter8MsMowz:
            return 7;
        case kNullUnitKind:
            return 0;
        default:
            return 0;
    }
}

BOOL battleDisableHResetCheck(void) {
    if (!gp->inBattle) {
        return FALSE;
    }
    if (_battleWorkPointer) {
        return (_battleWorkPointer->flags >> 29) & 1;
    }
    return FALSE;
}









void BattleConsumeReserveItem(void) {

}
