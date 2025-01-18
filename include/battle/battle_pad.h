#pragma once

#include <dolphin/pad.h>

typedef struct BattleWorkPad {
	PADStatus mPadData[2]; //0x0, current, last

	u32 mButtonsPressedHistory[30]; //0x18
	u32 mButtonsHeldHistory[30]; //0x90
	u32 mButtonsHistory[30]; //0x108
	u32 mButtonsReleasedHistory[30]; //0x180

	u8 mHoldRepeatState; //0x1F8
	u8 mHoldRepeatFrameCounter; //0x1F9
	u8 pad_0x1FA[2]; //0x1FA
} BattleWorkPad;

void BattlePadInit(void);
void BattlePadManager(void);

void BtlPad_WorkInit(BattleWorkPad* pad);
void BtlPad_WorkUpdate(BattleWorkPad* pad, s32 chan);

u32 BattlePadGetTrigger(void);
u32 BattlePadGetNow(void);

u32 BattlePadCheckTrigger(s32 mask);
u32 BattlePadMultiCheckTrigger(s32 chan, s32 mask);

u32 BattlePadCheckRecordTrigger(s32 frame, s32 mask);
u32 BattlePadMultiCheckRecordTrigger(s32 chan, s32 frame, s32 mask);

u32 BattlePadCheckNow(s32 mask);
u32 BattlePadMultiCheckNow(s32 chan, s32 mask);

u32 BattlePadCheckUp(s32 mask);
u32 BattlePadMultiCheckUp(s32 chan, s32 mask);

u32 BattlePadCheckRepeat(s32 mask);
u32 BattlePadMultiCheckRepeat(s32 chan, s32 mask);
