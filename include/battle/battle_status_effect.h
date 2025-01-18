#pragma once

#include <dolphin/types.h>

//battle_status_effect
//should be an s8, typecasting for now
typedef enum StatusEffectType {
	kStatusAllergic, //0x0
	kStatusSleep, //0x1
	kStatusStop, //0x2
	kStatusDizzy, //0x3
	kStatusPoison, //0x4
	kStatusConfuse, //0x5
	kStatusElectric, //0x6
	kStatusDodgy, //0x7
	kStatusBurn, //0x8
	kStatusFreeze, //0x9
	kStatusHuge, //0xA
	kStatusTiny, //0xB
	kStatusAttackUp, //0xC
	kStatusAttackDown, //0xD
	kStatusDefenseUp, //0xE
	kStatusDefenseDown, //0xF
	kStatusCharge, //0x10
	kStatusFlipped, //0x11
	kStatusInvisible, //0x12
	kStatusFast, //0x13
	kStatusSlow, //0x14
	kStatusPayback, //0x15
	kStatusHoldFast, //0x16
	kStatusHpRegen, //0x17
	kStatusFpRegen, //0x18
	kStatusFright, //0x19
	kStatusGaleForce, //0x1A
	kStatusInstantKill, //0x1B
	kStatusInvalid //0x1C
} StatusEffectType;

void BattleStatusEffectInit(struct BattleWorkUnit* unit);
void BattleStatusEffectMain(struct BattleWorkUnit* unit);
void BSE_TurnFirstProcessEffectEntry(struct BattleWorkUnit* unit, s16 active);
BOOL BSE_TurnFirstProcessEffectMain(struct BattleWorkUnit* unit);
void BattleStatusChangeInfoWorkInit(struct BattleWorkUnit* unit);








void BattleStatusChangeMsgWorkInit(void);