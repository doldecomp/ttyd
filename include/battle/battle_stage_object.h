#pragma once

#include <dolphin/mtx.h>
#include "evt/evt_cmd.h"

typedef struct BattleStageObjectData {
	char* name; //0x0
	u16 mSpawnSpecialUnitType; //0x4
	u16 mLayer; //0x8
	Vec mPosition; //0xC
	u8 mNumFramesToStartFalling; //0x14
	u8 mNumFramesToFall; //0x15
	u8 pad_16[2]; //0x16, TODO remove cuz compiler auto-pads
} BattleStageObjectData;

typedef struct BattleStageObject {
	s32 id; //0x0
	Vec mPosition; //0x4
	Vec field_0x10; //0x10, mPositionOffset1?
	Vec mRotation; //0x1C
	Vec field_0x28; //0x28, mPositionOffset2?
	Vec field_0x34; //0x34, mPositionTemp?
	Vec field_0x40; //0x40, mPositionOffset1Temp?
	Vec field_0x4C; //0x4C, mRotationTemp?
	Vec field_0x58; //0x58, mPositionOffset2Temp?
	BattleStageObjectData* data; //0x64
	u32 mFlags; //0x68
	u32 mBattleUnitIdx; //0x6C
	u8 mNumFramesToStartFalling; //0x70
	u8 mNumFramesFalling; //0x71
	u8 field_0x72; //0x72
	u8 mShakePeriodLength; //0x73
	u8 mShakePeriodPosition; //0x74
	u8 field_0x75[3]; //0x75
	f32 mShakeAngle; //0x78
} BattleStageObject;

BattleStageObject* BattleGetObjectPtr(s32 id);
BattleStageObject* BattleSearchObjectPtr(const char* name);

void BattleStageObjectMain(void);





USERFUNC_DEF(_set_mobj_shake_init);


void BattleStageObjectInit(void);