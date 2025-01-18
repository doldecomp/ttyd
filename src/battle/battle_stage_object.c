#include "battle/battle_stage_object.h"
#include "battle/battle.h"
#include "system.h"
#include <string.h>

extern BattleWork* _battleWorkPointer;

//local prototypes
void BattleObjectConfig(void);

BattleStageObject* BattleGetObjectPtr(s32 id) {
	BattleWork* wp = _battleWorkPointer;
	int i;

	for (i = 0; i < 32; i++) {
		if (wp->stageObjects[i].id == id) {
			return &wp->stageObjects[i];
		}
	}
	return NULL; //if none of the IDs match
}

BattleStageObject* BattleSearchObjectPtr(const char* name) {
	BattleWork* wp = _battleWorkPointer;
	BattleStageObject* object;
	int i;

	for (i = 0; i < 32; i++) {
		object = &wp->stageObjects[i];
		if (object->id && !strcmp(object->data->name, name)) {
			return object;
		}
	}
	return NULL; //if name not found
}

void BattleStageObjectInit(void) {

}





USERFUNC_DEF(_set_mobj_shake_init) {
	BattleStageObject* obj;
	int i, layer;
	u8 position;

	//get the layer this object is on
	layer = evtGetValue(event, *event->args);

	for (i = 0; i < 32; i++) {
		obj = &_battleWorkPointer->stageObjects[i];
		if (obj->id > 0 && obj->data->mLayer == layer) {
			obj->field_0x72 = 0;
			obj->mShakePeriodLength = (u8)(irand(10) + 60);
			if (irand(100) & 1) {
				position = 0;
			}
			else {
				position = (u8)(obj->mShakePeriodLength / 2);
			}
			obj->mShakePeriodPosition = position;
			obj->mShakeAngle = 0.0f;
		}
	}
	return EVT_RETURN_DONE;
}







void BattleObjectConfig(void) {
	//stubbed in retail
}

void BattleStageObjectMain(void) {

}
