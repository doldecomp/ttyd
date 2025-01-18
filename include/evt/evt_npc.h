#pragma once

#include <dolphin/types.h>
#include "driver/npcdrv.h"
#include "evt/evt_cmd.h"
#include "mgr/evtmgr.h"

typedef struct NpcSetupInfo {
	const char* name; //0x0
	s32 flags; //0x4
	s32 reactionFlags; //0x8
	void* initEvent; //0xC
	void* regularEvent; //0x10, TODO: rename?
	void* talkEvent; //0x14
	void* deadEvent; //0x18
	void* findEvent; //0x1C
	void* lostEvent; //0x20
	void* returnEvent; //0x24
	void* blowEvent; //0x28
	NpcTerritoryType territoryType; //0x2C
	Vec territoryBase; //0x30
	Vec territoryLoiter; //0x3C
	f32 searchRange; //0x48
	f32 searchAngle; //0x4C
	f32 homingRange; //0x50
	f32 homingAngle; //0x54
	s32 battleInfoId; //0x58, TODO: rename?
} NpcSetupInfo;

USERFUNC_DEF(evt_npc_entry);
USERFUNC_DEF(evt_npc_slave_entry);
USERFUNC_DEF(evt_npc_delete);
USERFUNC_DEF(evt_npc_check_delete);
USERFUNC_DEF(evt_npc_get_ReactionOfLivingBody);
USERFUNC_DEF(evt_npc_setup);
USERFUNC_DEF(evt_npc_set_position);
USERFUNC_DEF(evt_npc_set_width);
USERFUNC_DEF(evt_npc_set_height);
USERFUNC_DEF(evt_npc_get_height);
USERFUNC_DEF(evt_npc_set_scale);
USERFUNC_DEF(evt_npc_get_scale);
USERFUNC_DEF(evt_npc_get_position);
USERFUNC_DEF(evt_npc_get_home_position);
USERFUNC_DEF(evt_npc_set_home_position);
USERFUNC_DEF(evt_npc_get_rotate);
USERFUNC_DEF(evt_npc_set_rotate);
USERFUNC_DEF(evt_npc_add_rotate);
USERFUNC_DEF(evt_npc_set_rotate_offset);
USERFUNC_DEF(evt_npc_move_position);




NpcEntry* evtNpcNameToPtr(EventEntry* evt, const char* name);
NpcEntry* evtNpcNameToPtr_NoAssert(EventEntry* evt, const char* name);





USERFUNC_DEF(evt_npc_flag_onoff);



USERFUNC_DEF(evt_npc_change_fbat_mode);
