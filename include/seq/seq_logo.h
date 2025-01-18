#pragma once

#include "driver/seqdrv.h"
#include "mgr/filemgr.h"
#include <dolphin/os.h>

typedef struct LogoWork {
	BOOL progressive; //0x0
	s32 field_0x4; //0x4
	s32 toggle; //0x8, 0 = yes, 1 = no
	FileEntry* texture; //0xC
	s32 field_0x10; //0x10
	u8 field_0x14[0x18 - 0x14]; //0x14
	OSTime field_0x18; //0x18
	BOOL skipStory; //0x20
	u8 field_0x24[0x28 - 0x24]; //0x24
} LogoWork;

void seq_logoInit(SequenceWork* work);
void seq_logoMain(SequenceWork* work);
void seq_logoExit(SequenceWork* work);
