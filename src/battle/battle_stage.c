#include "battle/battle_stage.h"
#include "battle/battle.h"
#include "memory.h"

//.sbss
static BattleSpotWork work;

//.sbss2
s32 batSpotEntry_28;

//.sdata
static BattleSpotWork* wp = &work;

//.sdata2
s32 batSpotInit_28 = -1;

// forward declarations
void batSpotDisp(CameraId camId, void* param);
BattleSpotEntry* batSpotEntry(void);

BattleStage* BattleStageGetPtr(void) {
    return &_battleWorkPointer->stage;
}

void BattleStageInit(void) {
}

void BattleStageMain(void) {
}

void BattleStageEnd(void) {
}

BattleSpotWork* BatSpotGetPtr(void) {
    return wp;
}

void batSpotInit(void) {
	int i;
	BattleSpotEntry* entry;

	wp->count = 5;
	wp->entries = __memAlloc(HEAP_BATTLE, sizeof(BattleSpotEntry) * wp->count);
	memset(wp->entries, 0, sizeof(BattleSpotEntry) * wp->count);

	for (i = 0; i < 5; i++) {
		entry = batSpotEntry();
		entry->field_4 = (Vec){50.0f * i + -100.0f, 0.0f, -50.0f};
		entry->field_10 = (Vec){0.0f, 0.0f, 0.0f};
		entry->field_1C = (Vec){20.0f, 20.0f, 150.0f};
		entry->field_28 = batSpotInit_28;
	}
}

void batSpotMain() {
    s32 count = wp->count;

    while (count-- > 0) {}
    if (wp->skipRender > 0) {
        dispEntry(CAMERA_3D_IMAGE, -1000.0f, 0, batSpotDisp, NULL);
    }
}

void batSpotDisp(CameraId camId, void* param) {
}

//drawCone

// TODO: get this to not inline into batSpotInit
BattleSpotEntry* batSpotEntry(void) {
	int i;
	BattleSpotEntry* entry = wp->entries;

	for (i = 0; i < wp->count; i++, entry++) {
		if (!(entry->flags & 1)) {
			break;
		}
	}

	entry->field_4 = (Vec){0.0, 0.0, 0.0};
	entry->field_1C = (Vec){1.0, 1.0, 1.0};
	entry->field_10 = (Vec){0.0, 0.0, 0.0};
	entry->field_28 = batSpotEntry_28;
	entry->flags |= 1;

	return entry;
}
