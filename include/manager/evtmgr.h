#pragma once

#include "driver/mobjdrv.h"
#include "driver/npcdrv.h"
#include <dolphin/os.h>

#pragma enumsalwaysint off
typedef enum EventOpcode {
    OPCODE_NEXT = 0,
    OPCODE_END_SCRIPT = 1,
    OPCODE_END_EVENT = 2,
    OPCODE_LABEL = 3,
    OPCODE_GOTO = 4,
    OPCODE_DO = 5,
    OPCODE_WHILE = 6,
    OPCODE_DO_BREAK = 7,
    OPCODE_DO_CONTINUE = 8,
    OPCODE_WAIT_FRAME = 9,
    OPCODE_WAIT_MSEC = 10,
    OPCODE_HALT = 11,
    OPCODE_IF_STR_EQUAL = 12,
    OPCODE_IF_STR_NOT_EQUAL = 13,
    OPCODE_IF_STR_LESS = 14,
    OPCODE_IF_STR_GREATER = 15,
    OPCODE_IF_STR_LESS_EQUAL = 16,
    OPCODE_IF_STR_GREATER_EQUAL = 17,
    OPCODE_IFF_EQUAL = 18,
    OPCODE_IFF_NOT_EQUAL = 19,
    OPCODE_IFF_LESS = 20,
    OPCODE_IFF_GREATER = 21,
    OPCODE_IFF_LESS_EQUAL = 22,
    OPCODE_IFF_GREATER_EQUAL = 23,
    OPCODE_IF_EQUAL = 24,
    OPCODE_IF_NOT_EQUAL = 25,
    OPCODE_IF_LESS = 26,
    OPCODE_IF_GREATER = 27,
    OPCODE_IF_LESS_EQUAL = 28,
    OPCODE_IF_GREATER_EQUAL = 29,
    OPCODE_IF_FLAG = 30,
    OPCODE_IF_NOT_FLAG = 31,
    OPCODE_ELSE = 32,
    OPCODE_END_IF = 33,
    OPCODE_SWITCH = 34,
    OPCODE_SWITCHI = 35,
    OPCODE_CASE_EQUAL = 36,
    OPCODE_CASE_NOT_EQUAL = 37,
    OPCODE_CASE_LESS = 38,
    OPCODE_CASE_GREATER = 39,
    OPCODE_CASE_LESS_EQUAL = 40,
    OPCODE_CASE_GREATER_EQUAL = 41,
    OPCODE_CASE_ETC = 42,
    OPCODE_CASE_OR = 43,
    OPCODE_CASE_AND = 44,
    OPCODE_CASE_FLAG = 45,
    OPCODE_CASE_END = 46,
    OPCODE_CASE_BETWEEN = 47,
    OPCODE_SWITCH_BREAK = 48,
    OPCODE_END_SWITCH = 49,
    OPCODE_SET = 50,
    OPCODE_SETI = 51,
    OPCODE_SETF = 52,
    OPCODE_ADD = 53,
    OPCODE_SUB = 54,
    OPCODE_MUL = 55,
    OPCODE_DIV = 56,
    OPCODE_MOD = 57,
    OPCODE_ADDF = 58,
    OPCODE_SUBF = 59,
    OPCODE_MULF = 60,
    OPCODE_DIVF = 61,
    OPCODE_SET_READ = 62,
    OPCODE_READ = 63,
    OPCODE_READ2 = 64,
    OPCODE_READ3 = 65,
    OPCODE_READ4 = 66,
    OPCODE_READ_N = 67,
    OPCODE_SET_READF = 68,
    OPCODE_READF = 69,
    OPCODE_READF2 = 70,
    OPCODE_READF3 = 71,
    OPCODE_READF4 = 72,
    OPCODE_READF_N = 73,
    OPCODE_SET_USER_WORK = 74,
    OPCODE_SET_USER_FLAG = 75,
    OPCODE_ALLOC_USER_WORK = 76,
    OPCODE_AND = 77,
    OPCODE_ANDI = 78,
    OPCODE_OR = 79,
    OPCODE_ORI = 80,
    OPCODE_SET_FRAME_FROM_MSEC = 81,
    OPCODE_SET_MSEC_FROM_FRAME = 82,
    OPCODE_SET_RAM = 83,
    OPCODE_SET_RAMF = 84,
    OPCODE_GET_RAM = 85,
    OPCODE_GET_RAMF = 86,
    OPCODE_SETR = 87,
    OPCODE_SETRF = 88,
    OPCODE_GETR = 89,
    OPCODE_GETRF = 90,
    OPCODE_USER_FUNC = 91,
    OPCODE_RUN_EVENT = 92,
    OPCODE_RUN_EVENT_ID = 93,
    OPCODE_RUN_CHILD_EVENT = 94,
    OPCODE_DELETE_EVENT = 95,
    OPCODE_RESTART_EVENT = 96,
    OPCODE_SET_PRI = 97,
    OPCODE_SET_SPD = 98,
    OPCODE_SET_TYPE = 99,
    OPCODE_STOP_ALL = 100,
    OPCODE_START_ALL = 101,
    OPCODE_STOP_OTHER = 102,
    OPCODE_START_OTHER = 103,
    OPCODE_STOP_ID = 104,
    OPCODE_START_ID = 105,
    OPCODE_CHECK_EVENT = 106,
    OPCODE_INLINE_EVENT = 107,
    OPCODE_INLINE_EVENT_ID = 108,
    OPCODE_END_INLINE = 109,
    OPCODE_BROTHER_EVENT = 110,
    OPCODE_BROTHER_EVENT_ID = 111,
    OPCODE_END_BROTHER = 112,
    OPCODE_DEBUG_PUT_MSG = 113,
    OPCODE_DEBUG_MSG_CLEAR = 114,
    OPCODE_DEBUG_PUT_REG = 115,
    OPCODE_DEBUG_NAME = 116,
    OPCODE_DEBUG_REM = 117,
    OPCODE_DEBUG_BP = 118
} EventOpcode;
#pragma enumsalwaysint on

typedef struct EventEntry EventEntry;

typedef s32 (*UserFunction)(EventEntry* evt, BOOL blocked);

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

struct EventEntry {
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
};

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
