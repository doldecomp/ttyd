#pragma once

#include "dolphin/gx/GXStruct.h"

BOOL THPSimpleInit(s32 audioSystem);
void THPSimpleQuit(void);
BOOL THPSimpleOpen(char* fileName);
BOOL THPSimpleClose(void);
u32 THPSimpleCalcNeedMemory(void);
BOOL THPSimpleSetBuffer(u8* buffer);
BOOL THPSimplePreLoad(s32 loop);
void THPSimpleAudioStart(void);
void THPSimpleAudioStop(void);
BOOL THPSimpleLoadStop(void);
s32 THPSimpleDecode(s32 audioTrack);
s32 THPSimpleDrawCurrentFrame(GXRenderModeObj* rmode, u32 x, u32 y, u32 polygonW, u32 polygonH);
u32 THPSimpleGetTotalFrame(void);
BOOL THPSimpleSetVolume(s32 vol, s32 time);
