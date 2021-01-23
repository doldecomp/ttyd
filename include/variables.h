#ifndef __VARIABLES_H_
#define __VARIABLES_H_

typedef struct seqdrv_work {
	s32 field_0x0; //0x0, seq_num
	s32 field_0x4; //0x4, 0-7, see seq_mapChangeMain
	char* field_0x8; //0x8, "next_p0"
	char* field_0xC; //0xC, "next_p1"
	u32 field_0x10; //0x10
	u32 field_0x14; //0x14
	u32 field_0x18; //0x18
	u32 field_0x1C; //0x1C
} seqdrv_work;

struct UnkStruct80410310 {
    char filler0[0x1314];
    u32 tickStore1;
    u32 tickStore2;
};

extern struct UnkStruct80410310 *lbl_80410310;

#endif
