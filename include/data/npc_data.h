#pragma once

#include "driver/npcdrv.h"
#include <dolphin/types.h>

typedef struct NpcAiInfo {
	const char* description; //0x0, used for s/etup.xml tag lookup
	s32 flags; //0x4
	s32* initEvent; //0x8
	s32* moveEvent; //0xC
	s32* deadEvent; //0x10
	s32* findEvent; //0x14
	s32* lostEvent; //0x18
	s32* returnEvent; //0x1C
	s32* blowEvent; //0x20
} NpcAiInfo;
