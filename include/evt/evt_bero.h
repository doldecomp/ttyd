#pragma once

#include <dolphin/types.h>
#include "evt/evt_cmd.h"

typedef union BeroINFO {
	const char* name;
	s32 value;
} BeroINFO;

typedef struct BeroEntry {
	const char* hitName; //0x0
	s16 kinddirArg1; //0x4
	s16 kinddirArg2; //0x6
	s32 kinddirArg3; //0x8
	s32 field_0xC; //0xC
	s32 unknown1; //0x10
	s32 unknown2; //0x14
	s32 field_0x18; //0x18
	s32* enterEvent; //0x1C;
	s32 field_0x20; //0x20
	s32* exitEvent; //0x24
	s32 nextareaArg1; //0x28
	const char* nextareaArg2; //0x2C
	s16 animeArg1; //0x30
	s16 animeArg2; //0x32
	s32 animeArg3; //0x34
	s32 animeArg4; //0x28
} BeroEntry;

EVT_DEF(evt_bero_info_run);

USERFUNC_DEF(evt_bero_set_reset_position);
USERFUNC_DEF(evt_bero_set_reset_position_current);
s32 bero_get_BeroEXEC(void);
s32 bero_get_BeroNUM(void);
f32 bero_get_BeroSX(void);
f32 bero_get_BeroSY(void);
f32 bero_get_BeroSZ(void);
f32 bero_get_BeroEX(void);
f32 bero_get_BeroEY(void);
f32 bero_get_BeroEZ(void);
BeroEntry** bero_get_ptr(void);
void bero_clear_Offset(void);
s32 bero_id_filter(s32 id);
USERFUNC_DEF(evt_bero_mapchange);
USERFUNC_DEF(evt_bero_get_entername);
USERFUNC_DEF(evt_bero_exec_onoff);
USERFUNC_DEF(evt_bero_exec_get);
USERFUNC_DEF(evt_bero_exec_wait);
USERFUNC_DEF(evt_bero_get_start_position);
USERFUNC_DEF(evt_bero_get_end_position);
USERFUNC_DEF(evt_bero_get_info_anime);
USERFUNC_DEF(evt_bero_get_info_length);
USERFUNC_DEF(evt_bero_get_info_kinddir);
USERFUNC_DEF(evt_bero_get_info_nextarea);
USERFUNC_DEF(evt_bero_set_now_number);
USERFUNC_DEF(evt_bero_get_now_number);
USERFUNC_DEF(evt_bero_get_info);
USERFUNC_DEF(evt_bero_get_into_info);








