#pragma once

#include <dolphin/types.h>

//TODO: EventData? if it doesn't share with any evtmgr stuff
#pragma warn_padding off
typedef struct EventEvt {
	u8 field_0x0; //0x0
	u8 field_0x1[2]; //0x1
	//will pad 1 byte
	u16 field_0x4; //0x4
	//will pad 2 bytes
	const char* field_0x8; //0x8
	const char* field_0xC; //0xC
	const char* field_0x10; //0x10
	const char* field_0x14; //0x14
	void (*init_function)(void); //0x18
} EventEvt;
#pragma warn_padding on

typedef struct EventDtor {
	const char* name; //0x0
	EventEvt* events; //0x4
	u32 num_events; //0x8
} EventDtor;

void stg0_00_init(void);
void stg0_05_init(void);
void stg0_08_init(void);
void stg0_11_init(void);
void stg0_12_02_init(void);
void stg0_13_init(void);
void stg0_16_init(void);

void stg1_01a_init(void);
void stg1_03_init(void);
void stg1_06_01_init(void);
void stg1_08_init(void);
void stg1_09_init(void);
void stg1_09_02_init(void);
void stg1_10_init(void);
void stg1_12_02_init(void);
void stg1_13_init(void);
void stg1_13_01_init(void);
void stg1_13_02_init(void);
void stg1_13_03_init(void);
void stg1_14_init(void);
void stg1_15_02_init(void);
void stg1_15_03_init(void);
void stg1_15_04_init(void);
void stg1_16_init00(void);
void stg1_16_init01(void);
void stg1_17_init(void);
void stg1_19_init(void);
void stg1_20_init(void);
void stg1_30_init00(void);
void stg1_30_init01(void);
void stg1_35_init(void);

void stg2_00_init(void);
void stg2_03_03_init(void);
void stg2_09_init(void);
void stg2_10_init(void);
void stg2_11_init(void);
void stg2_12_01_init(void);
void stg2_14_init(void);
void stg2_15_init(void);
void stg2_16_init00(void);
void stg2_16_init01(void);
void stg2_18_init00(void);
void stg2_18_init01(void);
void stg2_19_init(void);
void stg2_20_init(void);
void stg2_21_init00(void);
void stg2_21_init01(void);
void stg2_21_01_init(void);
void stg2_21_02_init(void);
void stg2_21_03_init(void);
void stg2_21_04_init(void);
void stg2_21_06_init00(void);
void stg2_21_06_init01(void);
void stg2_23_init(void);
void stg2_23_01_init(void);
void stg2_25_init(void);
void stg2_25_02_init(void);
void stg2_26_init(void);
void stg2_40_init(void);
void stg2_44_init(void);
void stg2_47_init(void);
void stg2_end_init(void);

void stg3_06_init(void);
void stg3_07_init00(void);
void stg3_07_init01(void);
void stg3_07_init02(void);
void stg3_07_init03(void);
void stg3_10_init(void);
void stg3_12_init00(void);
void stg3_12_init01(void);
void stg3_12_init02(void);
void stg3_12_init03(void);
void stg3_12_init04(void);
void stg3_20_init00(void);
void stg3_20_init01(void);
void stg3_20_00_init(void);
void stg3_20_01_init(void);
void stg3_20_02_init(void);
void stg3_20_04_init00(void);
void stg3_20_04_init01(void);
void stg3_20_04_init02(void);
void stg3_20_05_init(void);
void stg3_20_06_init(void);
void stg3_20_07_00_init(void);
void stg3_20_08_init(void);
void stg3_20_09_init(void);
void stg3_20_12_init00(void);
void stg3_20_12_init01(void);
void stg3_20_12_init02(void);
void stg3_20_13_init(void);
void stg3_20_14_init(void);
void stg3_20_15_init(void);
void stg3_20_16_init(void);
void stg3_21_init(void);
void stg3_30_init00(void);
void stg3_30_init01(void);
void stg3_31_init(void);
void stg3_32_init(void);
void stg3_33_init(void);
void stg3_33_03_init(void);
void stg3_33_04_init(void);
void stg3_34_init(void);
void stg3_35_init(void);
void stg3_50_init(void);
void stg3_52_init(void);
void stg3_end_init(void);

void stg4_00_init(void);
void stg4_04_init(void);
void stg4_04_01_init(void);
void stg4_05_init(void);
void stg4_09_05_init(void);
void stg4_10_init(void);
void stg4_11_init(void);
void stg4_13_init(void);
void stg4_13_02_init(void);
void stg4_13_03_init(void);
void stg4_14_init(void);
void stg4_15_init(void);
void stg4_15_03_init(void);
void stg4_16_init(void);
void stg4_30_init(void);
void stg4_35_init(void);
void stg4_36_init(void);
void stg4_37_init(void);
void stg4_end_init(void);

void stg5_12_init(void);
void stg5_15_init00(void);
void stg5_15_init01(void);
void stg5_17_init(void);
void stg5_18_init(void);
void stg5_18_02_init(void);
void stg5_19_init00(void);
void stg5_19_init01(void);
void stg5_19_init02(void);
void stg5_19_01_init(void);
void stg5_21_init00(void);
void stg5_21_init01(void);
void stg5_21_init02(void);
void stg5_21_01_init(void);
void stg5_22_init00(void);
void stg5_22_init01(void);
void stg5_29_init(void);
void stg5_30_init00(void);
void stg5_30_init01(void);
void stg5_43_init(void);
void stg5_47_init(void);
void stg5_58_init(void);
void stg5_59_01_init(void);
void stg5_60_init(void);
void stg5_62_init(void);
void stg5_63_init(void);
void stg5_64_init(void);
void stg5_64_01_init(void);
void stg5_64_02_init(void);
void stg5_64_03_init(void);
void stg5_65_init(void);
void stg5_66_init(void);

void stg6_00_init(void);
void stg6_06_init(void);
void stg6_12_init(void);
void stg6_13_init(void);
void stg6_18_init(void);
void stg6_19_init(void);
void stg6_20_init(void);
void stg6_22_init(void);
void stg6_24_init(void);
void stg6_27_init(void);
void stg6_29_init(void);
void stg6_30_init(void);
void stg6_32_init(void);
void stg6_33_init(void);
void stg6_34_init(void);
void stg6_37_init(void);
void stg6_38_init(void);
void stg6_39_init(void);
void stg6_44_init(void);
void stg6_47_00_init(void);
void stg6_54_init(void);
void stg6_56_init(void);
void stg6_70_init(void);
void stg6_72_init00(void);
void stg6_72_init01(void);
void stg6_end_init00(void);
void stg6_end_init01(void);

void stg7_01_init(void);
void stg7_03_init00(void);
void stg7_03_init01(void);
void stg7_03_init02(void);
void stg7_03_init03(void);
void stg7_03_init04(void);
void stg7_03_init05(void);
void stg7_04_init(void);
void stg7_06_init(void);
void stg7_10_init(void);
void stg7_11_init(void);
void stg7_15_init00(void);
void stg7_15_init01(void);
void stg7_15_init02(void);
void stg7_15_init03(void);
void stg7_16_init(void);
void stg7_17_init(void);
void stg7_19_init(void);
void stg7_20_init(void);
void stg7_25_00_init(void);
void stg7_50_init(void);
void stg7_51_init(void);
void stg7_52_init(void);

void stg8_01_02_init(void);
void stg8_02_init(void);
void stg8_05_init(void);
void stg8_06_init(void);
void stg8_10_init(void);
void stg8_11_init(void);
void stg8_13_init(void);
void stg8_14_init(void);
void stg8_14_01_init(void);

void stg9_02_init(void);

EventDtor* eventStgDtPtr(s32 stage);
s32 eventStgNum(void);
