#pragma once

#include <dolphin/ar.h>
//#include <dolphin/arq.h>

typedef struct ARAMWork {
	u8 field_0x0[0x3C - 0x0]; //0x0
	ARQRequest request; //0x3C
	u8 field_0x5C[0x68 - 0x5C]; //0x5C
} ARAMWork;

void aramMgrInit(void);
