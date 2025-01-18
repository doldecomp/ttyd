#include "battle/battle_information.h"

void BattleInformationSetMode(FieldBattleInfo* info, u32 mode) {
	info->mode = mode;
}

void BattleInformationSetParty(FieldBattleInfo* info, BattleUnitType party) {
	info->party = party;
}

void BattleInformationSetFirstAttack(FieldBattleInfo* info, u32 partyId) {
	info->partyId = partyId;
}

void BattleInformationInit(FieldBattleInfo* info) {

}

void BattleInfomationSetBattleSetupInfo(FieldBattleInfo* info, NpcBattleInfo* setup) {
	info->setup = setup;
}

void BattleInformationSetResult(FieldBattleInfo* info, u32 result) {
	info->result = result;
}

u32 BattleInformationGetResult(FieldBattleInfo* info) {
	return info->result;
}