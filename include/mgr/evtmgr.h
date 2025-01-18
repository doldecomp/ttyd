#pragma once

#include "driver/mobjdrv.h"
#include "mario/mariost.h"
#include "mgr/evtmgr_cmd.h"
#include <dolphin/os.h>

typedef s32 (*UserFunction)(struct EventEntry* evt, BOOL blocked);

//TODO: s32, see evtRestart
typedef struct EventCommand {
	union {
		s32 header;
		struct {
			s16 params;
			s16 opcode;
		};
	};
	s32 label;
} EventCommand;

//unknown, TODO: look at evt_msg_toge/_evt_msg_print
typedef struct EventEntryMsg {
	f32 field_0x0; //0x0
	f32 field_0x4; //0x4
} EventEntryMsg;

typedef enum EventEntry_Flags {
	EVENT_ACTIVE = (1 << 0),
	EVENT_STOPPED = (1 << 1),

	EVENT_WAITING_ON_CHILD = (1 << 4)
} EventEntry_Flags;

typedef struct EventEntry {
	OSTime lifetime; //0x0
	u8 flags; //0x8, validated
	u8 params; //0x9, number of params
	EventOpcode opcode; //0xA
	u8 priority; //0xB, validated
	u8 type; //0xC
	u8 blocked; //0xD
	s8 loopDepth; //0xE, validated
	s8 switchDepth; //0xF, validated
	u8 wNpcEventType; //0x10
	u8 pad_11[3]; //0x11
	void* nextCommand; //0x14, validated
	s32* args; //0x18, validated
	s8 labelIdTable[16]; //0x1C
	s32* labelAddressTable[16]; //0x2C
	struct EventEntry* waitingEvent; //0x6C, this parent event is waiting on us
	struct EventEntry* waitingOnEvent; //0x70, we are waiting on some child event
	struct EventEntry* brotherEvent; //0x74
	s32 userdata[3]; //0x78, TODO check
	u32 wInterpolationStartedNpcFlag; //0x84
	OSTime wInterpRelatedTime; //0x88
	u32 field_0x90[2]; //0x90, unknown
	UserFunction userfunc; //0x98
	s32 lwData[16]; //0x9C, validated
	s32 lfData[3]; //0xDC, validated
	void* loopStartPtrs[8]; //0xE8
	s32 loopCounters[8]; //0x108
	s8 switchStates[8]; //0x128, validated
	s32 switchValues[8]; //0x130, validated
    union { // Current addr for read/readf instructions
        s32* readAddr;
        f32* readfAddr;
    }; //0x150
	s32* uwBase; //0x154, validated
	s32* ufBase; //0x158, validated
	s32 eventId; //0x15C, validated
	s32 unitId; //0x160
	f32 timescale; //0x164, number of instructions per frame
	f32 commandsLeft; //0x168, TODO rename/retype
	s32 caseId; //0x16C
	NpcEntry* ownerNPC; //0x170, verified
	MapObjectEntry* thisMapObj; //0x174, verified
	s32 printWindowId; //0x178, verified
	s32 selectWindowId; //0x17C, verified
	u32 printWindowFlags; //0x180, verified, is u32, does use 0x80000000
	EventEntryMsg unk184; //0x184, verified
	u32 unk18C; //0x18C
	u32 msgPriority; //0x190
	u32 field_0x194; //0x194
	OSTime wInterpolationStartTime2; //0x198, TODO rename
	void* restartFrom; //0x1A0, validated
	const char* name; //0x1A4
	void* currCommand; //0x1A8
	u32 field_0x1AC; //0x1AC
} EventEntry;

typedef struct EventWork {
	s32 count; //0x0
	s32 gwData[32]; //0x4
	s32 gfData[3]; //0x84
	EventEntry* entries; //0x90
	u32 field_0x94; //0x94
	OSTime lastUpdate; //0x98
} EventWork;

EventWork* evtGetWork(void);
void evtmgrInit(void);
void evtmgrReInit(void);
EventEntry* evtEntry(void* evtCode, u8 priority, u8 flags);
EventEntry* evtEntryType(void* evtCode, u8 priority, u8 flags, u8 type);
EventEntry* evtChildEntry(EventEntry* parent, void* evtCode, u8 flags);
EventEntry* evtBrotherEntry(EventEntry* brother, void* evtCode, u8 flags);
EventEntry* evtRestart(EventEntry* entry);
void evtmgrMain(void);
void evtDelete(EventEntry* entry);
void evtDeleteID(s32 eventId);
BOOL evtCheckID(s32 eventId);
void evtSetPri(EventEntry* entry, u32 priority);
void evtSetSpeed(EventEntry* entry, f32 speed);
void evtSetType(EventEntry* entry, u32 type);
void evtStop(EventEntry* entry, u32 type);
void evtStart(EventEntry* entry, u32 type);
void evtStopID(s32 eventId);
void evtStartID(s32 eventId);
void evtStopAll(u32 type);
void evtStartAll(u32 type);
void evtStopOther(EventEntry* entry, u32 type);
void evtStartOther(EventEntry* entry, u32 type);
EventEntry* evtGetPtr(s32 index);
EventEntry* evtGetPtrID(s32 eventId);
