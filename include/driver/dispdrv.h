#pragma once

#include <dolphin/types.h>
#include "driver/camdrv.h"

typedef void (*DispCallback)(CameraId camId, void* param);

#pragma warn_padding off
typedef struct DispEntry {
	u8 camId; //0x0, CameraId
	u8 renderMode; //0x1
	//will pad 2 bytes
	f32 order; //0x4
	DispCallback callback; //0x8
	void* param; //0xC
} DispEntry;
#pragma warn_padding on

void dispInit(void);
void dispReInit(void);
void dispEntry(CameraId camId, s32 renderMode, DispCallback callback, void* param, f32 order);
void dispSort(void);
void dispDraw(CameraId camId);
f32 dispCalcZ(Vec* input);
DispEntry* dispGetCurWork(void);
