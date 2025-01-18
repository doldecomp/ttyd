#pragma once

#include <dolphin/os.h>
#include "driver/fadedrv.h"
#include "driver/npcdrv.h"
#include "evt/evt_lottery.h"
#include "countdown.h"

typedef struct GlobalWork {
	s32 flags; //0x0
	s32 framerate; //0x4
	s32 unk8; //0x8
	s32 unkC; //0xC
	BOOL dvdError; //0x10
	s32 inBattle; //0x14, verified s32
	s32 systemLevelFlags; //0x18
	u32 retraceCount; //0x1C
	OSTime retraceLocalTime; //0x20
	OSTime retraceDeltaTime; //0x28
	OSTime retraceTime; //0x30
	OSTime renderTime; //0x38, time since boot, minus menus
	OSTime renderFieldTime; //0x40, time outside battle, minus menus
	OSTime systemLv0Time; //0x48
	OSTime systemLv1Time; //0x50
	OSTime systemLv2Time; //0x58
	OSTime systemLv3Time; //0x60
	CountdownWork countdown; //0x68
	lottery_info mLotteryInfo; //0xA8
	u8 field_0xE8[0xF8 - 0xE8]; //0xE8
	FadeType mapFadeOutType; //0xF8
	s32 mapFadeOutDuration; //0xFC
	FadeType mapFadeInType; //0x100
	s32 mapFadeInDuration; //0x104
	FadeType areaFadeOutType; //0x108
	s32 areaFadeOutDuration; //0x10C
	FadeType areaFadeInType; //0x110
	s32 areaFadeInDuration; //0x114
	BOOL didAreaChange; //0x118
	char beroEnterName[0x10]; //0x11C
	char currentMapName[0x10]; //0x12C
	char currentAreaName[0x20]; //0x13C
	void* relocationBase; //0x15C
	void* mapAlloc; //0x160
	u32 field_0x164; //0x164
	FieldBattleData* fbatData; //0x168
	s32 language; //0x16C
	u16 fbWidth; //0x170
	u16 efbHeight; //0x172
	s32 mGSW0; //0x174
	u32 mGSFW[0x100]; //0x178
	u8 mGSW[0x800]; //0x578
	u32 mLSWF[0x10]; //0xD78
	u8 mLSW[0x400]; //0xDB8
	s32 unk11B8; //0x11B8
	u8 field_0x11BC[0x11D4 - 0x11BC]; //0x11BC
	Vec savePlayerPos; //0x11D4
    s32 savePartyId[2]; //0x11E0
    OSTime saveTime; //0x11E8
    s32 saveCount; //0x11F0
	u8 field_0x11F4[0x1274 - 0x11F4]; //0x11F4
	s32 unk1274; //0x1274
	s32 resetType; //0x1278, 0 = no reset, 1 = soft reset, 2 = menu
	BOOL unk127C; //0x127C
	BOOL softResetWait; //0x1280
	u8 field_0x1284[0x1288 - 0x1284]; //0x1284
	OSTime softResetTimeout; //0x1288
	BOOL field_0x1290; //0x1290
	BOOL unk1294; //0x1294
	u8 field_0x1298[0x12E8 - 0x1298]; //0x1298
	u8 field_0x12E8[4]; //0x12E8
	u8 field_0x12EC[4]; //0x12EC
	OSTime field_0x12F0[4];
	//u8 field_0x1300[0x1310 - 0x1300]; //0x1300
	u8 unk1310[4]; //0x1310
	OSTick mDeltaGame; //0x1314
	OSTick mDeltaRender; //0x1318
	u8 field_0x131C[0x1324 - 0x131C]; //0x131C
// system.c "key" controller data, TODO sub-struct?
	BOOL unk1324; //0x1324
	u32 button[4]; //0x1328
	u32 buttonNew[4]; //0x1338
	u32 buttonRepeat[4]; //0x1348
	u32 buttonRepeatDelay[4]; //0x1358,
	u32 buttonUp[4]; //0x1368
	u32 dirs[4]; //0x1378
	u32 dirsNew[4]; //0x1388
	u32 dirsRepeat[4]; //0x1398
	u32 dirsRepeatDelay[4]; //0x13A8
	s8 stickX[4]; //0x13B8
	s8 stickY[4]; //0x13BC
	s8 substickX[4]; //0x13C0
	s8 substickY[4]; //0x13C4
	u8 triggerLeft[4]; //0x13C8
	u8 triggerRight[4]; //0x13CC
	u8 rumbleStatus[4]; //0x13D0
	u8 prevRumbleStatus[4]; //0x13D4
} GlobalWork;

void marioStInit(void);
void marioStMain(void);
void marioStDisp(void);
void marioStSystemLevel(s32 level);
s32 marioStGetSystemLevel(void);
