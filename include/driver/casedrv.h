#pragma once

#include <dolphin/types.h>

typedef struct CaseSetup {
	u16 activeConditionId; //0x0, TODO rename
	u8 pad_2[2]; //0x2
	const char* hitObjName; //0x4
	u32 swFlag; //0x8
	void* activeFunc; //0xC
	s32 lwData[16]; //0x10
	u8 field_0x50[0x54 - 0x50]; //0x50
	void* evtCode; //0x54, TODO re-type
	s32 priority; //0x58
} CaseSetup;

void caseInit(void);
void caseReInit(void);
s32 caseEntry(CaseSetup* setup);
void caseDelete(s32 caseId);
void caseMain(void);