#include "battle/sac/sac_bakugame.h"
#include "battle/battle.h"

extern BattleWork* _battleWorkPointer;

BattleACExtraParams* GetBakuGamePtr(void) {
	return &_battleWorkPointer->actionCommands.extraParams;
}