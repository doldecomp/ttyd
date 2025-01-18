#pragma once

#include <dolphin/os.h>
#include "driver/seqdrv.h"
#include "mgr/filemgr.h"

typedef struct seq_e3_work {
	FileEntry* handle; //0x00
	u32 field_0x4; //0x04
	u32 field_0x8; //0x08
	u32 field_0xC; //0x0C
	u32 field_0x10; //0x10
	u32 field_0x14; //0x14
	u32 field_0x18; //0x18
	u32 field_0x1C; //0x1C
	OSAlarm alarm; //0x20
	OSTime field_0x48; //0x48
	u32 field_0x50; //0x50
	u32 field_0x54; //0x54
	u32 field_0x58; //0x58
	u32 field_0x5C; //0x5C
	u32 field_0x60; //0x60
	f32 field_0x64; //0x64
} seq_e3_work;

void seq_e3Init(SequenceWork* work);
void seq_e3Main(SequenceWork* work);
void seq_e3Exit(SequenceWork* work);
