#pragma once

#include <dolphin/types.h>
#include "evt/evt_cmd.h"

typedef struct WindowWork {
	s16 flags; //0x0
	u8 align_2[2]; //0x2
	u32 buttonTrg; //0x4
	u32 buttonRep; //0x8
	u32 dirTrg; //0xC
	u32 dirRep; //0x10
	u8 field_0x14[0x20 - 0x14]; //0x14
	s32 menuState; //0x20, TODO: rename?
	u8 field_0x24[0x1210 - 0x24]; //0x24
} WindowWork;

typedef struct WindowPartyDt {
	s32 field_0x0; //0x0
	s32 field_0x4; //0x4
	const char* field_0x8; //0x8
	const char* field_0xC; //0xC
	const char* field_0x10; //0x10
	const char* field_0x14; //0x14
	const char* field_0x18; //0x18
	const char* field_0x1C; //0x1C
	const char* field_0x20; //0x20
} WindowPartyDt; //TODO: rename

WindowWork* winGetPtr(void);
void winInit(void);
void winReInit(void);
BOOL winCheck(void);
void winOpenEnable(void);
void winOpenDisable(void);
USERFUNC_DEF(itemUseFunc);



void winMain(void);


void winTexInit(TPLHeader* texture);
void winTexSet(u32 textureId, Vec translate, Vec scale, GXColor color);
