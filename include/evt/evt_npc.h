#pragma once

#include <dolphin/types.h>
#include "driver/npcdrv.h"
#include "evt/evt_cmd.h"
#include "manager/evtmgr.h"

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

USER_FUNC(evt_npc_entry);
USER_FUNC(evt_npc_slave_entry);
USER_FUNC(evt_npc_delete);
USER_FUNC(evt_npc_check_delete);
USER_FUNC(evt_npc_get_ReactionOfLivingBody);
USER_FUNC(evt_npc_setup);
USER_FUNC(evt_npc_set_position);
USER_FUNC(evt_npc_set_width);
USER_FUNC(evt_npc_set_height);
USER_FUNC(evt_npc_get_height);
USER_FUNC(evt_npc_set_scale);
USER_FUNC(evt_npc_get_scale);
USER_FUNC(evt_npc_get_position);
USER_FUNC(evt_npc_get_home_position);
USER_FUNC(evt_npc_set_home_position);
USER_FUNC(evt_npc_get_rotate);
USER_FUNC(evt_npc_set_rotate);
USER_FUNC(evt_npc_add_rotate);
USER_FUNC(evt_npc_set_rotate_offset);
USER_FUNC(evt_npc_move_position);




NpcEntry* evtNpcNameToPtr(EventEntry* evt, const char* name);
NpcEntry* evtNpcNameToPtr_NoAssert(EventEntry* evt, const char* name);





USER_FUNC(evt_npc_flag_onoff);



USER_FUNC(evt_npc_change_fbat_mode);
