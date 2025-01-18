#include "battle/battle_icon.h"
#include "battle/battle.h"
#include "data/item_data.h"
#include "evt/evt_cmd.h"
#include <string.h>

extern BattleWork* _battleWorkPointer;
extern ItemData* itemDataTable;
extern int sprintf(char* str, const char* format, ...);

BattleWorkIcon* BtlIconGetPtr(s32 index) {
	BattleWorkIcon* icon;
	int i;

	for (i = 0; i < 16; i++) {
		icon = &_battleWorkPointer->iconWork[i];
		if (icon->flags & 1 && icon->index == index) {
			return icon; //TODO: redo bwp->iconWork?
		}
	}
	return NULL;
}

void BattleIconInit(void) {
	memset(_battleWorkPointer->iconWork, 0, sizeof(_battleWorkPointer->iconWork));
}

void BattleIconMain(void) {
	BattleWork* wp;
	BattleWorkIcon* icon;
	IconEntry* base;
	int i;

	wp = _battleWorkPointer;
	for (i = 0; i < 16; i++) {
		icon = &wp->iconWork[i];
		if (icon->flags & 1) { //in use
			base = icon->base;
			if (base) {
				iconSetPos(base->name, icon->position.x, icon->position.y, icon->position.z);
				iconSetScale(base->name, icon->field_0x14 * icon->field_0x18);
				if (icon->flags & 2) {
					iconFlagOn(base->name, 2);
				}
				else {
					iconFlagOff(base->name, 2);
				}
			}
		}
	}
}

void BattleIconEnd(void) {
	BattleWork* wp = _battleWorkPointer;
	int i;

	for (i = 0; i < 16; i++) {
		BtlIcon_Delete(&wp->iconWork[i]);
	}
}

BattleWorkIcon* BtlIcon_Entry(s16 iconId, f32 x, f32 y, f32 z) {
	BattleWorkIcon* icon;
	int i;
	char name[32];

	for (i = 0; i < 16; i++) {
		icon = &_battleWorkPointer->iconWork[i];
		if (!(icon->flags & 1)) {
			break; //found one not in use
		}
	}
	if (i < 16) {
		memset(icon, 0, sizeof(BattleWorkIcon));
		icon->index = i;
		icon->flags = 1;
		icon->field_0x14 = 1.0f;
		icon->field_0x18 = 1.0f;
		icon->position = (Vec){x, y, z};
		icon->iconId = iconId;
		sprintf(name, "_biu_%02x", icon->index);
		iconEntry(name, icon->iconId);
		icon->base = iconNameToPtr(name);
		iconSetPos(icon->base->name, icon->position.x, icon->position.y, icon->position.z);
		return icon;
	}
	else {
		return NULL;
	}
}

void BtlIcon_Delete(BattleWorkIcon* icon) {
	if (icon->flags & 1) {
		iconDelete(icon->base->name);
		icon->flags &= ~1;
	}
}

//s32 iconId, f32 x, f32 y, f32 z, s32 evtIndex
USERFUNC_DEF(btlevtcmd_BtlIconEntry) {
	s32* args = event->args;
	BattleWorkIcon* icon;
	s32 iconId, index;
	f32 x, y, z;

	iconId = evtGetValue(event, args[0]);
	x = (f32)evtGetValue(event, args[1]);
	y = (f32)evtGetValue(event, args[2]);
	z = (f32)evtGetValue(event, args[3]);
	index = args[4];
	icon = BtlIcon_Entry(iconId, x, y, z);
	evtSetValue(event, index, icon->index);
	return EVT_RETURN_DONE;
}

//s32 itemId (index for itemDataTable) , f32 x, f32 y, f32 z, s32 evtIndex
USERFUNC_DEF(btlevtcmd_BtlIconEntryItemId) {
	s32* args = event->args;
	BattleWorkIcon* icon;
	s32 itemId, index;
	f32 x, y, z;

	itemId = evtGetValue(event, args[0]);
	x = (f32)evtGetValue(event, args[1]);
	y = (f32)evtGetValue(event, args[2]);
	z = (f32)evtGetValue(event, args[3]);
	index = args[4];
	icon = BtlIcon_Entry(itemDataTable[itemId].icon_id, x, y, z);
	evtSetValue(event, index, icon->index);
	return EVT_RETURN_DONE;
}

//s32 index for BtlIconGetPtr
USERFUNC_DEF(btlevtcmd_BtlIconDelete) {
	BattleWorkIcon* icon;
	s32 value;

	value = evtGetValue(event, *event->args);
	icon = BtlIconGetPtr(value);
	BtlIcon_Delete(icon);
	return EVT_RETURN_DONE;
}

//s32 index for BtlIconGetPtr, f32 x, f32 y, f32 z
USERFUNC_DEF(btlevtcmd_BtlIconSetPosition) {
	s32* args = event->args;
	BattleWorkIcon* icon;
	f32 x, y, z;
	s32 index;

	index = evtGetValue(event, args[0]);
	icon = BtlIconGetPtr(index);
	x = evtGetFloat(event, args[1]);
	y = evtGetFloat(event, args[2]);
	z = evtGetFloat(event, args[3]);
	icon->position = (Vec){x, y, z};
	return EVT_RETURN_DONE;
}

//s32 index for BtlIconGetPtr, f32 fallAccel
USERFUNC_DEF(btlevtcmd_BtlIconSetFallAccel) {
	s32* args = event->args;
	s32 index = evtGetValue(event, args[0]);
	BattleWorkIcon* icon = BtlIconGetPtr(index);
	icon->fallAccel = evtGetFloat(event, args[1]);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(btlevtcmd_BtlIconJumpPosition) {
	//TODO: revisit when more of BattleWorkIcon is filled out
}
