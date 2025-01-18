#pragma once

#include <dolphin/types.h>

typedef struct lottery_info {
	u16 mFlags; //0x0
	u8 field_0x2[0x40 - 0x2]; //0x2
} lottery_info;

lottery_info* lotteryGetPtr(void);