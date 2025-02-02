#pragma once

#include "driver/dispdrv.h"
#include <dolphin/types.h>

typedef struct WinMgrDesc WinMgrDesc;
typedef struct WinMgrEntry WinMgrEntry;

struct WinMgrDesc {
	u8 field_0x0[0x8 - 0x0]; //0x0
	s32 camId; //0x8, CameraId
	s32 field_0xC; //0xC, entry->field_0x18
	s32 field_0x10; //0x10, entry->field_0x1C
	s32 field_0x14; //0x14, entry->field_0x20
	s32 field_0x18; //0x18, entry->field_0x24
	u8 field_0x1C[0x20 - 0x1C]; //0x1C
	void (*main)(WinMgrEntry* entry); //0x20
	void* disp; //0x24
};

struct WinMgrEntry {
	s32 flags; //0x0
	s32 field_0x4; //0x4
	s32 field_0x8; //0x8
	u8 field_0xC[0x10 - 0xC]; //0xC
	f32 scale; //0x10
	f32 rotation; //0x14
	s32 field_0x18; //0x18, desc->field_0xC
	s32 field_0x1C; //0x1C, desc->field_0x10
	s32 field_0x20; //0x20, desc->field_0x14
	s32 field_0x24; //0x24, desc->field_0x18
	WinMgrDesc* description; //0x28
	void* param; //0x2C
	s32 priority; //0x30, gets cast to float for dispEntry
	s32 field_0x34; //0x34
	s32 field_0x38; //0x38
	s32 field_0x3C; //0x3C
	u8 field_0x40[0x44 - 0x40]; //0x40
};

typedef struct WinMgrWork {
	u32 mNumEntries; //0x0
	WinMgrEntry* mEntries;
} WinMgrWork;

typedef struct WinMgrSelect {
	s16 flags; //0x0
	s16 pad_2; //0x2, TODO: not pad?
	s32 field_0x4; //0x4
	u8 field_0x8[0xC - 0x8]; //0x8
	s32 field_0xC; //0xC
	s32 field_0x10; //0x10
	f32 field_0x14; //0x14, TODO: Vec?
	f32 field_0x18; //0x18
	f32 field_0x1C; //0x1C
	s32 numDescriptors; //0x20
	s32 descriptorId[3]; //0x24
	s32 field_0x30; //0x30
	s32 field_0x34; //0x34
	s32 field_0x38; //0x38
} WinMgrSelect;

void winMgrInit(void);
void winMgrReInit(void);
void winMgrMain(void);
s32 winMgrEntry(WinMgrDesc* desc);
void winMgrSetParam(s32 id, void* param);
void winMgrOpen(s32 id);
void winMgrClose(s32 id);
void winMgrCloseAutoDelete(s32 id);
void winMgrDelete(s32 id);
BOOL winMgrAction(s32 id);
void winMgrSetSize(s32 id, s32 a2, s32 a3, s32 a4, s32 a5); //TODO: x0, y0, x1, y1?
void winMgrSetPriority(s32 id, s32 priority);
WinMgrEntry* winMgrGetPtr(s32 id);
void winMgrHelpInit(WinMgrEntry* entry);
void winMgrHelpMain(WinMgrEntry* entry);
void winMgrHelpDraw(WinMgrEntry* entry);
