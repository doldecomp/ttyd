#include "battle/battle_seq.h"
#include "battle/battle.h"
#include "battle/battle_unit.h"
#include "battle/battle_unit_event.h"
#include "driver/animdrv.h"
#include "eff/eff_nice.h"
#include "mario/mario_party.h"
#include "party.h"
#include "pmario_sound.h"

extern BattleWork* _battleWorkPointer;

//local prototypes
void BattleCheckAllPinchStatus(BattleWork* wp, BOOL a2);
void btlseqInit(BattleWork* wp);
void btlseqFirstAct(BattleWork* wp);
void btlseqTurn(BattleWork* wp);
void btlseqEnd(BattleWork* wp);

void BattleSequenceManager(void) { //1:1
	BattleWork* wp = _battleWorkPointer;
	switch (BattleGetSeq(wp, SEQ_UNKNOWN)) {
		case 0:
			btlseqInit(wp);
			BattleCheckAllPinchStatus(wp, TRUE);
			break;
		case 1:
			BattleCheckAllPinchStatus(wp, FALSE);
			btlseqFirstAct(wp);
			break;
		case 2:
			BattleCheckAllPinchStatus(wp, FALSE);
			btlseqTurn(wp);
			break;
		case 3:
			btlseqEnd(wp);
			break;
	}
}

void BattleCheckAllPinchStatus(BattleWork* wp, BOOL a2) { //1:1, needs stmw forced
	BattleWorkUnit* unit;
	BOOL v6;
	int i;

	for (i = 0; i < 64; i++) {
		unit = BattleGetUnitPtr(wp, i);
		if (unit) {
			BtlUnit_CheckPinchStatus(unit, a2);
		}
	}

	v6 = FALSE;
	for (i = 0; i < 64; i++) {
		unit = BattleGetUnitPtr(wp, i);
		if (unit) {
			if ((unit->mStatusFlags & 0x20000000) &&
				!BtlUnit_CheckStatus(unit, kStatusInstantKill) &&
				!BtlUnit_GetBelong(unit))
			{
				if (unit->currentKind == UNIT_MARIO ||
					unit->currentKind >= TYPE_PARTNER_MIN &&
					unit->currentKind < TYPE_PARTNER_MAX) {
					if (unit->currentHp > 0) {
						v6 = TRUE;
						break;
					}
				}
			}
		}
	}

	if (v6) {
		wp->alertTick--;
		if (wp->alertTick <= 0) {
			wp->alertTick = 60;
			if (wp->commandMenu.unk4 & 1) {
				psndSFXOn("SFX_BTL_DANGER1");
			}
		}
	}
	else {
		v6 = FALSE;
		for (i = 0; i < 64; i++) {
			unit = BattleGetUnitPtr(wp, i);
			if (unit) {
				if ((unit->mStatusFlags & 0x20000000) &&
					!BtlUnit_CheckStatus(unit, kStatusInstantKill) &&
					!BtlUnit_GetBelong(unit))
				{
					if (unit->currentKind == UNIT_MARIO ||
						unit->currentKind >= TYPE_PARTNER_MIN &&
						unit->currentKind < TYPE_PARTNER_MAX) {
						if (unit->currentHp > 0) {
							v6 = TRUE;
							break;
						}
					}
				}
			}
		}
		if (v6) {
			wp->alertTick--;
			if (wp->alertTick <= 0) {
				wp->alertTick = 60;
				if (wp->commandMenu.unk4 & 1) {
					psndSFXOn("SFX_BTL_PINCH1");
				}
			}
		}
		else {
			unit = BattleGetMarioPtr(wp);
			if (unit) {
				unit->work[8] = 0;
			}
			wp->alertTick = 0;
		}
	}
}

void btlseqInit(BattleWork* wp) { //1:1, needs stmw
	MarioWork* mario;
	PartyEntry* party;

	switch (BattleGetSeq(wp, SEQ_INIT)) {
		case 0x1000000: //continues through to 0x1000001
			BattleSetSeq(wp, SEQ_INIT, 0x1000001);

		case 0x1000001:
			mario = marioGetPtr();
			mario->dispFlags |= 1;
			party = partyGetPtr(marioGetPartyId());
			if (party) {
				party->flags2 |= 1;
			}
			Btl_UnitSetup(wp);
			BattleSetSeq(wp, SEQ_INIT, 0x1000002);
			break;

		case 0x1000002:
			if (BattleCheckEndUnitInitEvent(wp)) {
				BattleSetSeq(wp, SEQ_INIT, 0x1000003u);
			}
			break;

		case 0x1000003:
			if (animEffectAsync("p_b_st", 1) &&
				animEffectAsync("p_jyabara", 1) &&
				animEffectAsync("p_kaiten_h", 1) &&
				effNiceAsync(1))
			{
				BattleSetSeq(wp, SEQ_INIT, 0x1000004);
			}
			break;

		case 0x1000004:
			BattleSetSeq(wp, SEQ_INIT, 0x1000005);
			break;

		case 0x1000005:
			//BattleStatusWindowEventOn();
			//BattleStatusWindowSystemOn();
			BattleSetSeq(wp, SEQ_UNKNOWN, 1);
			BattleSetSeq(wp, SEQ_FIRST_ACT, 0x2000000);
			break;
	}
}

BattleWeapon* _GetFirstAttackWeapon(s32 id) {
	return NULL;
}

void btlseqFirstAct(BattleWork* wp) {
	switch (BattleGetSeq(wp, SEQ_FIRST_ACT)) {

	}
}

void btlseqTurn(BattleWork* wp) {

}

void btlseqEnd(BattleWork* wp) {

}
