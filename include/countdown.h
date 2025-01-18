#pragma once

#include <dolphin/types.h>

typedef struct CountdownWork {
	u16 flags; //0x0
	u8 field_0x2[0x30 - 0x2]; //0x2
	s32 unk30; //0x30
	u8 field_0x34[0x40 - 0x34]; //0x34
} CountdownWork;

void countDownInit(void);
void countDownSaveReStart(void);



void countDownMain(void);
