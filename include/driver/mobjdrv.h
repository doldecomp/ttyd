#pragma once

#include <dolphin/types.h>
#include <dolphin/mtx.h>

typedef struct MapObjectHitEntry {
	u8 field_0x0[0x88 - 0x0]; //0x0
} MapObjectHitEntry;

typedef struct MapObjectEntry {
	u8 field_0x0[0x38 - 0x0]; //0x0
	Vec position; //0x38
	Vec scale; //0x44
	Vec rotation; //0x50
	u8 field_0x5C[0x70 - 0x5C]; //0x5C
	s32 poseId; //0x70
	MapObjectHitEntry hitObj[2]; //0x74
	Vec scale2; //0x184
	u8 field_0x190[0x23C - 0x190]; //0x190
} MapObjectEntry;

typedef struct MapObjectWork {
	s32 count; //0x0
	MapObjectEntry* entries; //0x4
	u8 field_0x8[0x1C - 0x8]; //0x8
} MapObjectWork;

void mobjInit(void);
void mobjMain(void);