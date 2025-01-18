/* "evtmgr" - Event Manager
* Status: 1:1, just needs comments and struct cleanup
*
* Function: helps manage all the scripts the game uses
*
* Last Update: 7/10/2022, completed evtmgr
*/

#include "mgr/evtmgr.h"
#include "evt/evt_msg.h"
#include "memory.h"
#include <string.h>

extern GlobalWork* gp;
extern s32 _mariostSystemLevel;

//.bss
static EventWork work[2];
s32 priTbl[0x100];
s32 priIDTbl[0x100];

//.sbss
s32 evtMax;
s32 priTblNum;
BOOL runMainF;

//.sdata
f32 evtSpd = 1.0f;
s32 evtID = 1;

//local definitions
void make_pri_table(void);
void evtEntryRunCheck(EventEntry* entry);

EventWork* evtGetWork(void) {
	return gp->inBattle ? &work[1] : &work[0];
}

void make_pri_table(void) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	s32 idI, idJ;
	s32 slotI, slotJ;
	s32 priEntryCount;
	s32 n, i, j;

	priEntryCount = 0;
	for (n = 0; n < wp->count; n++, entry++) {
		if (entry->flags & EVENT_ACTIVE) {
			priTbl[priEntryCount] = n;
			priIDTbl[priEntryCount] = entry->eventId;
			priEntryCount++;
		}
	}
	priTblNum = priEntryCount;

	//Bubble sort
	for (i = 0; i < priEntryCount - 1; i++) {
		for (j = i + 1; j < priEntryCount; j++) {
			slotI = priTbl[i];
			slotJ = priTbl[j];
			if (wp->entries[slotI].priority < wp->entries[slotJ].priority) {
				idI = priIDTbl[i];
				idJ = priIDTbl[j];
				priTbl[i] = slotJ;
				priIDTbl[i] = idJ;
				priTbl[j] = slotI;
				priIDTbl[j] = idI;
			}
		}
	}
}

#pragma warn_no_side_effect off
inline void make_jump_table(EventEntry* entry) {
	s32 params, opcode;
	s32 label;
	int i, n;
	s32* cmd;

	for (i = 0; i < 16; i++) { //initialize both tables
		entry->labelIdTable[i] = -1;
		entry->labelAddressTable[i] = 0;
	}

	n = 0;
	cmd = entry->nextCommand;
	while (1) {
		opcode = *cmd & 0xFFFF; //load the base opcode and arg_count
		params = *cmd++ >> 16; //increment to first argument
		label = *cmd; //load label, which will be cast to an s8 (0-0xFF valid)
		cmd += params; //set cmd to the opcode *after* the label

		switch (opcode) {
			case OPCODE_END_SCRIPT:
				return; //exit loop
			case OPCODE_LABEL:
				entry->labelIdTable[n] = (s8)label;
				entry->labelAddressTable[n] = (s32*)cmd;
				n++;
		}
		if (n >= 16) { //needed to match, optimization leftover from some debug assert
			"unused";
		}
	}
}
#pragma warn_no_side_effect on

void evtmgrInit(void) {
	EventWork* wp;

	wp = &work[0];
	wp->count = 0x100;
	wp->entries = __memAlloc(HEAP_DEFAULT, wp->count * sizeof(EventEntry));
	wp->lastUpdate = gp->renderTime;
	memset(wp->entries, 0, wp->count * sizeof(EventEntry));
	memset(wp->gwData, 0, sizeof(wp->gwData));
	memset(wp->gfData, 0, sizeof(wp->gfData));

	wp = &work[1];
	wp->count = 0x100;
	wp->entries = __memAlloc(HEAP_DEFAULT, wp->count * sizeof(EventEntry));
	wp->lastUpdate = gp->renderTime;
	memset(wp->entries, 0, wp->count * sizeof(EventEntry));
	memset(wp->gwData, 0, sizeof(wp->gwData));
	memset(wp->gfData, 0, sizeof(wp->gfData));
	evtMax = 0;
	priTblNum = 0;
	runMainF = FALSE;
	evt_msg_init();
}

void evtmgrReInit(void) {
	EventWork* wp = evtGetWork();

	wp->lastUpdate = gp->renderTime;
	memset(wp->entries, 0, wp->count * sizeof(EventEntry));
	evtMax = 0;
	runMainF = FALSE;
	evt_msg_init();
}

void evtEntryRunCheck(EventEntry* entry) {
	switch (_mariostSystemLevel) {
		case 1:
			evtStopAll(1);
			break;
		case 2:
			evtStopAll(2);
			break;
		case 3:
			evtStopAll(0x10);
			break;
		case 4:
			evtStopAll(0xEF);
		case 0:
			break;
	}
}

EventEntry* evtEntry(void* evtCode, u8 priority, u8 flags) {
	EventWork* wp = evtGetWork();
	EventEntry* entry;
	int i, id;

	//search until we find one not-in-use
	entry = wp->entries;
	for (i = 0, id = 0; i < wp->count; i++, id++, entry++) {
		if (!(entry->flags & EVENT_ACTIVE)) {
			break;
		}
	}

	evtMax++;
	memset(entry, 0, sizeof(EventEntry));
	entry->flags = (u8)(flags | EVENT_ACTIVE);
	entry->nextCommand = evtCode;
	entry->restartFrom = evtCode;
	entry->currCommand = evtCode;
	entry->opcode = OPCODE_NEXT;
	entry->waitingEvent = NULL;
	entry->waitingOnEvent = NULL;
	entry->brotherEvent = NULL;
	entry->priority = priority;
	entry->eventId = evtID++;
	entry->unitId = -1;
	entry->loopDepth = -1;
	entry->switchDepth = -1;
	entry->type = 0xEF;
	entry->name = NULL;
	entry->timescale = evtSpd;
	entry->commandsLeft = 0.0f;
	entry->caseId = -1;
	entry->ownerNPC = NULL;
	entry->lifetime = 0;
	for (i = 0; i < 16; i++) {
		entry->lwData[i] = 0;
	}
	for (i = 0; i < 3; i++) {
		entry->lfData[i] = 0;
	}

	make_jump_table(entry);

	if (runMainF && entry->flags & 0x20) {
		priTbl[priTblNum] = id;
		priIDTbl[priTblNum] = entry->eventId;
		priTblNum++;
	}

	evtEntryRunCheck(entry);

	if (!evtID) {
		evtID = 1;
	}

	return entry;
}

EventEntry* evtEntryType(void* evtCode, u8 priority, u8 flags, u8 type) {
	EventWork* wp = evtGetWork();
	EventEntry* entry;
	int i, id;

	//search until we find one not-in-use
	entry = wp->entries;
	for (i = 0, id = 0; i < wp->count; i++, id++, entry++) {
		if (!(entry->flags & EVENT_ACTIVE)) {
			break;
		}
	}

	evtMax++;
	memset(entry, 0, sizeof(EventEntry));
	entry->flags = (u8)(flags | EVENT_ACTIVE);
	entry->nextCommand = evtCode;
	entry->restartFrom = evtCode;
	entry->currCommand = evtCode;
	entry->opcode = OPCODE_NEXT;
	entry->waitingEvent = NULL;
	entry->waitingOnEvent = NULL;
	entry->brotherEvent = NULL;
	entry->priority = priority;
	entry->eventId = evtID++;
	entry->unitId = -1;
	entry->loopDepth = -1;
	entry->switchDepth = -1;
	entry->type = type;
	entry->name = NULL;
	entry->timescale = evtSpd;
	entry->commandsLeft = 0.0f;
	entry->caseId = -1;
	entry->ownerNPC = NULL;
	entry->lifetime = 0;
	for (i = 0; i < 16; i++) {
		entry->lwData[i] = 0;
	}
	for (i = 0; i < 3; i++) {
		entry->lfData[i] = 0;
	}

	make_jump_table(entry);

	if (runMainF && entry->flags & 0x20) {
		priTbl[priTblNum] = id;
		priIDTbl[priTblNum] = entry->eventId;
		priTblNum++;
	}
	evtEntryRunCheck(entry);
	if (!evtID) {
		evtID = 1;
	}
	return entry;
}

EventEntry* evtChildEntry(EventEntry* parent, void* evtCode, u8 flags) {
	EventWork* wp = evtGetWork();
	EventEntry* entry;
	int i, id;

	//search until we find one not-in-use
	entry = wp->entries;
	for (i = 0, id = 0; i < wp->count; i++, id++, entry++) {
		if (!(entry->flags & EVENT_ACTIVE)) {
			break;
		}
	}

	evtMax++;
	parent->waitingOnEvent = entry;
	parent->flags |= EVENT_WAITING_ON_CHILD;
	memset(entry, 0, sizeof(EventEntry));
	entry->flags = (u8)(flags | EVENT_ACTIVE);
	entry->nextCommand = evtCode;
	entry->restartFrom = evtCode;
	entry->currCommand = evtCode;
	entry->opcode = OPCODE_NEXT;
	entry->waitingEvent = parent;
	entry->waitingOnEvent = NULL;
	entry->brotherEvent = NULL;
	entry->priority = (u8)(parent->priority + 1);
	entry->eventId = evtID++;
	entry->unitId = parent->unitId;
	entry->loopDepth = -1;
	entry->switchDepth = -1;
	entry->type = parent->type;
	entry->name = NULL;
	entry->uwBase = parent->uwBase;
	entry->ufBase = parent->ufBase;
	entry->timescale = evtSpd;
	entry->commandsLeft = 0.0f;
	entry->caseId = -1;
	entry->ownerNPC = parent->ownerNPC;
	entry->lifetime = 0;

	entry->selectWindowId = parent->selectWindowId;
	entry->printWindowId = parent->printWindowId;
	entry->printWindowFlags = parent->printWindowFlags;
	entry->unk184 = parent->unk184;
	entry->unk18C = parent->unk18C;
	entry->msgPriority = parent->msgPriority;

	for (i = 0; i < 16; i++) {
		entry->lwData[i] = parent->lwData[i];
	}
	for (i = 0; i < 3; i++) {
		entry->lfData[i] = parent->lfData[i];
	}

	make_jump_table(entry);

	if (runMainF) {
		priTbl[priTblNum] = id;
		priIDTbl[priTblNum] = entry->eventId;
		priTblNum++;
	}

	evtEntryRunCheck(entry);

	if (!evtID) {
		evtID = 1;
	}
	return entry;
}

EventEntry* evtBrotherEntry(EventEntry* brother, void* evtCode, u8 flags) {
	EventWork* wp = evtGetWork();
	EventEntry* entry;
	int i, id;

	//search until we find one not-in-use
	entry = wp->entries;
	for (i = 0, id = 0; i < wp->count; i++, id++, entry++) {
		if (!(entry->flags & EVENT_ACTIVE)) {
			break;
		}
	}

	evtMax++;
	memset(entry, 0, sizeof(EventEntry));
	entry->flags = (u8)(flags | EVENT_ACTIVE);
	entry->nextCommand = evtCode;
	entry->restartFrom = evtCode;
	entry->currCommand = evtCode;
	entry->opcode = OPCODE_NEXT;
	entry->waitingEvent = NULL;
	entry->brotherEvent = brother;
	entry->waitingOnEvent = NULL;
	entry->priority = brother->priority;
	entry->eventId = evtID++;
	entry->unitId = brother->unitId;
	entry->loopDepth = -1;
	entry->switchDepth = -1;
	entry->type = brother->type;
	entry->name = NULL;
	entry->uwBase = brother->uwBase;
	entry->ufBase = brother->ufBase;
	entry->timescale = evtSpd;
	entry->commandsLeft = 0.0f;
	entry->caseId = -1;
	entry->ownerNPC = brother->ownerNPC;
	entry->lifetime = 0;

	for (i = 0; i < 16; i++) {
		entry->lwData[i] = brother->lwData[i];
	}
	for (i = 0; i < 3; i++) {
		entry->lfData[i] = brother->lfData[i];
	}

	make_jump_table(entry);

	if (runMainF) {
		priTbl[priTblNum] = id;
		priIDTbl[priTblNum] = entry->eventId;
		priTblNum++;
	}

	if (!evtID) {
		evtID = 1;
	}

	evtEntryRunCheck(entry);

	return entry;
}

EventEntry* evtRestart(EventEntry* entry) {
	entry->currCommand = entry->nextCommand = entry->restartFrom;
	entry->opcode = 0;
	entry->timescale = 1.0f;
	entry->commandsLeft = 0.0f;
	entry->loopDepth = -1;
	entry->switchDepth = -1;
	entry->timescale = evtSpd;
	entry->commandsLeft = 0.0f;
	entry->lifetime = 0;
	make_jump_table(entry);
	evtEntryRunCheck(entry);
	return entry;
}

void evtmgrMain(void) {
	EventWork* wp = evtGetWork();
	EventEntry* entry;
	BOOL finished;
	OSTime delta;
	int i, ret;
	s32* entryNum;
	s32* eventId;

	runMainF = TRUE; //we're in evtmgrMain

	delta = gp->renderTime - wp->lastUpdate;
	if (delta < 0) {
		delta = 0;
	}

	if (OSTicksToMilliseconds(delta) > 500) {
		delta = OSMillisecondsToTicks(1000 / gp->framerate);
	}
	wp->lastUpdate = gp->renderTime;
	make_pri_table();

	entryNum = priTbl;
	eventId = priIDTbl;
	for (i = 0; i < priTblNum; i++) {
		entry = &wp->entries[*entryNum];
		if ((entry->flags & EVENT_ACTIVE) && (entry->eventId == *eventId)) {
			if (!(entry->flags & (0x80 | EVENT_WAITING_ON_CHILD | EVENT_STOPPED))) {
				finished = FALSE;
				entry->lifetime += delta;
				entry->commandsLeft += entry->timescale;

				while (TRUE) {
					if (entry->commandsLeft < 1.0f) {
						break;
					}
					entry->commandsLeft -= 1.0f;
					ret = evtmgrCmd(entry);
					if (ret == 1) {
						finished = TRUE;
						break;
					}
					if (ret == -1) {
						break;
					}
				}

				if (finished != FALSE) {
					break;
				}
			}
		}
		entryNum++;
		eventId++;
	}
	runMainF = FALSE;
}

void evtDelete(EventEntry* entry) {
	EventWork* wp = evtGetWork();
	EventEntry* waiting;
	int i;

	if (entry->flags & EVENT_ACTIVE) {
		if (entry->waitingOnEvent) {
			evtDelete(entry->waitingOnEvent);
		}

		waiting = wp->entries;
		for (i = 0; i < wp->count; i++, waiting++) {
			if ((waiting->flags & EVENT_ACTIVE) && (waiting->brotherEvent == entry)) {
				evtDelete(waiting);
			}
		}

		waiting = entry->waitingEvent;
		if (waiting != NULL) {
			waiting->flags &= ~EVENT_WAITING_ON_CHILD;
			waiting->waitingOnEvent = NULL;
			for (i = 0; i < 16; i++) {
				waiting->lwData[i] = entry->lwData[i];
			}
			for (i = 0; i < 3; i++) {
				waiting->lfData[i] = entry->lfData[i];
			}
			waiting->selectWindowId = entry->selectWindowId;
			waiting->printWindowId = entry->printWindowId;
			waiting->printWindowFlags = entry->printWindowFlags;
			waiting->unk184 = entry->unk184;
			waiting->unk18C = entry->unk18C;
			waiting->msgPriority = entry->msgPriority;
		}
		entry->flags &= ~EVENT_ACTIVE;
		memset(entry, 0, sizeof(EventEntry));
		evtMax--;
	}
}

void evtDeleteID(s32 eventId) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, entry++) {
		if ((entry->flags & EVENT_ACTIVE) && (entry->eventId == eventId)) {
			evtDelete(entry);
		}
	}
}

BOOL evtCheckID(s32 eventId) {
	int i;

	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	for (i = 0; i < wp->count; i++, entry++) {
		if ((entry->flags & EVENT_ACTIVE) && (entry->eventId == eventId)) {
			return TRUE;
		}
	}
	return FALSE;
}

void evtSetPri(EventEntry* entry, u32 priority) {
	entry->priority = (u8)priority;
}

void evtSetSpeed(EventEntry* entry, f32 speed) {
	entry->timescale = speed * evtSpd;
}

void evtSetType(EventEntry* entry, u32 type) {
	entry->type = (u8)type;
}

void evtStop(EventEntry* entry, u32 type) { //TODO: make sure evtGetWork() inlines correctly
	EventWork* wp = evtGetWork();
	EventEntry* brother;
	int i;

	if (entry->waitingOnEvent) {
		evtStop(entry->waitingOnEvent, type);
	}

	brother = wp->entries;
	for (i = 0; i < wp->count; i++, brother++) {
		if ((brother->flags & EVENT_ACTIVE) && (brother->brotherEvent == entry)) {
			evtStop(brother, type);
		}
	}

	if (entry->type & type) {
		entry->flags |= EVENT_STOPPED;
	}
}

void evtStart(EventEntry* entry, u32 type) { //TODO: make sure evtGetWork() inlines correctly
	EventWork* wp = evtGetWork();
	EventEntry* brother;
	int i;

	if (entry->waitingOnEvent) {
		evtStart(entry->waitingOnEvent, type);
	}

	brother = wp->entries;
	for (i = 0; i < wp->count; i++, brother++) {
		if ((brother->flags & EVENT_ACTIVE) && (brother->brotherEvent == entry)) {
			evtStart(brother, type);
		}
	}

	if (entry->type & type) {
		entry->flags &= ~EVENT_STOPPED;
	}
}

void evtStopID(s32 eventId) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, entry++) {
		if ((entry->flags & EVENT_ACTIVE) && (entry->eventId == eventId)) {
			evtStop(entry, 0xEF);
		}
	}
}

void evtStartID(s32 eventId) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, entry++) {
		if ((entry->flags & EVENT_ACTIVE) && (entry->eventId == eventId)) {
			evtStart(entry, 0xEF);
		}
	}
}

void evtStopAll(u32 type) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, entry++) {
		if (entry->flags & EVENT_ACTIVE) {
			evtStop(entry, type);
		}
	}
}

void evtStartAll(u32 type) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, entry++) {
		if (entry->flags & EVENT_ACTIVE) {
			evtStart(entry, type);
		}
	}
}

void evtStopOther(EventEntry* entry, u32 type) {
	EventWork* wp = evtGetWork();
	EventEntry* search = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, search++) {
		if ((search->flags & EVENT_ACTIVE) && (search != entry)) {
			evtStop(search, type);
		}
	}
}

void evtStartOther(EventEntry* entry, u32 type) {
	EventWork* wp = evtGetWork();
	EventEntry* search = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, search++) {
		if ((search->flags & EVENT_ACTIVE) && (search != entry)) {
			evtStart(search, type);
		}
	}
}

EventEntry* evtGetPtr(s32 index) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = &wp->entries[index];
	if (entry->flags & EVENT_ACTIVE) {
		return entry;
	}
	return NULL;
}

EventEntry* evtGetPtrID(s32 eventId) {
	EventWork* wp = evtGetWork();
	EventEntry* entry = wp->entries;
	int i;

	for (i = 0; i < wp->count; i++, entry++) {
		if ((entry->flags & EVENT_ACTIVE) && (entry->eventId == eventId)) {
			return entry;
		}
	}
	return NULL;
}
