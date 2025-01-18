#include "battle/battle_status_icon.h"
#include "battle/battle.h"
#include <string.h>

extern BattleWork* _battleWorkPointer;

typedef struct IconDispTableEntry IconDispTableEntry;
struct IconDispTableEntry {
	s32 id;
	BOOL (*callback)(BattleWorkUnit* unit, IconDispTableEntry* disp, BattleWorkStatusIconEntry* entry); //0x4
	s32 something;
	s32 something2;
};

IconDispTableEntry _disp_table[] = {
	{1, NULL, 15, 1}
};

//local prototypes
void BattleStatusIconDisp(CameraId cameraId, void* param);

void BattleStatusIconInit(BattleWorkUnit* unit) {
	memset(&unit->mStatusIconWork, 0, sizeof(BattleWorkStatusIcon));
}

void BattleStatusIconMain(BattleWorkUnit* unit) {
	BattleWorkStatusIcon* icon = &unit->mStatusIconWork;
	BattleWork* work = _battleWorkPointer;
	int i;

	icon->mNumStatusIcons = 0;
	if (work->flags & 0x10000 || work->mIconFlags & 1) {
		BtlUnit_GetPos(unit, &icon->mPosition.x, &icon->mPosition.y, &icon->mPosition.z);
		icon->mPosition.x += ((f32)(unit->mStatusIconOffset[0]) * unit->mSizeMultiplier);
		icon->mPosition.y += ((f32)(unit->mStatusIconOffset[1]) * unit->mSizeMultiplier);
		icon->mScreenSpaceOffset.x = 13.440001f;
		icon->mScreenSpaceOffset.z = 0.0f;
		icon->mFlags = 0;
		if (unit->mAttributeFlags & kCeiling) {
			icon->mDistanceBetweenIcons = 25.6f;
			icon->mScreenSpaceOffset.y = 0.0f;
		}
		else {
			icon->mDistanceBetweenIcons = 25.6f;
			icon->mScreenSpaceOffset.y = 19.200001f;
		}

		for (i = 0; i < 0x17; i++) {
			if (_disp_table[i].id == -1) break;
			if (_disp_table[i].callback(unit, &_disp_table[i], &icon->mIcons[i])) {
				icon->mNumStatusIcons++;
			}
		}
		if (icon->mNumStatusIcons > 0) {
			dispEntry(CAMERA_2D, 1, BattleStatusIconDisp, unit, 901.0f);
		}
	}
}

void BattleStatusIconDelete(BattleWorkUnit* unit) {
	; //stubbed in retail
}

void BattleStatusIconDisp(CameraId cameraId, void* param) {
	BattleWorkUnit* unit = param; //cast to proper type
}