#pragma once

#include <dolphin/mtx.h>

typedef struct BattleWorkStatusIconEntry {
	u8 field_0x0[0x44 - 0x0]; //0x0
} BattleWorkStatusIconEntry;

typedef struct BattleWorkStatusIcon {
	Vec mPosition; //0x0
	Vec mScreenSpaceOffset; //0xC
	f32 mDistanceBetweenIcons; //0x18
	s32 mFlags; //0x1C
	BattleWorkStatusIconEntry mIcons[28]; //0x20
	u8 field_0x790[0x794 - 0x790]; //0x790
	s16 mNumStatusIcons; //0x794
	u8 field_0x796[0x7A0 - 0x796]; //0x796
} BattleWorkStatusIcon;

void BattleStatusIconInit(struct BattleWorkUnit* unit);
void BattleStatusIconMain(struct BattleWorkUnit* unit);
void BattleStatusIconDelete(struct BattleWorkUnit* unit);


