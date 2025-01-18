#pragma once

#include <dolphin/os.h>
#include "driver/windowdrv.h"
#include "memory.h"

typedef struct MsgDataEntry {
	u32 field_0x0; //0x0, probably a GXColor?
	u16 glyph; //0x4
	u8 field_0x6[0xC - 0x6]; //0x6
	s32 field_0xC; //0xC
	u8 field_0x10[0x18 - 0x10]; //0x10
	/*s32 poseId; //0x0
	s16 field_0x4; //0x4
	s16 field_0x6; //0x6
	s16 field_0x8; //0x8
	u8 pad_0xA[2]; //0xA
	s32 paperPoseId; //0xC
	f32 scale; //0x10
	f32 rotY; //0x14*/
} MsgDataEntry;

typedef struct MessageData { //TODO: rename?
	u8 field_0x0[0x18 - 0x0]; //0x0
	OSTime field_0x18; //0x18
	u8 field_0x20[0x30 - 0x20]; //0x20
	OSTime field_0x30; //0x30
	s32 entryId; //0x38
	MsgDataEntry entries[1298]; //0x3C, TODO: why -2?
	u8 field_0x79EC[0x7A30 - 0x79EC]; //0x79EC
	s32 field_0x7A30; //0x7A30
	u8 field_0x7A34[0x7A4C - 0x7A34]; //0x7A34
	WindowEntry* window; //0x7A4C
	u8 field_0x7A50[0x7A58 - 0x7A50]; //0x7A50
} MessageData;

typedef struct MessageEntry {
	u32 length; //0x0
	void* address; //0x4
	u32 count; //0x8
	smartEntry* lookup; //0xC
} MessageEntry;

typedef struct MessageWork {
	MessageEntry entries[2]; //0x0
	s32 poseId; //0x20
} MessageWork;

void msgInit(void);
void msgLoad(const char* filename, s32 index);


MessageWork* msgGetWork(void);

const char* msgSearch(const char* tag);
BOOL _ismbblead(u32 a1);
