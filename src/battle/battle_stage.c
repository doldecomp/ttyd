#include "battle/battle_stage.h"
#include "battle/battle.h"

extern BattleWork* _battleWorkPointer;

//.sbss
static BattleStageSpotWork work;

//.sdata
static BattleStageSpotWork* wp = &work;

BattleStage* BattleStageGetPtr(void) {
	return &_battleWorkPointer->stage;
}

void BattleStageInit(void) {

}

void BattleStageMain(void) {

}

void BattleStageEnd(void) {

}