#pragma once

#include "driver/seqdrv.h"
#include "manager/filemgr.h"
#include <dolphin/types.h>

typedef struct TitleWork {
	FileEntry* texture; //0x0
	u8 field_0x4[0x8 - 0x4]; //0x4
	s32 field_0x8; //0x8
	f32 field_0xC; //0xC
	f32 field_0x10; //0x10
	f32 field_0x14; //0x14
	f32 field_0x18; //0x18
	f32 field_0x1C; //0x1C
	u8 field_0x20[0x30 - 0x20]; //0x20
	s32 debug; //0x30
} TitleWork;

const char* DbgBtlSel_GetMsgDataPtr(void);
s32 getDebugMode(void);
void seq_titleInit(SequenceWork* work);
void seq_titleMain(SequenceWork* work);
void seq_titleExit(SequenceWork* work);
