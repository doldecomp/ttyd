#include "driver/casedrv.h"
#include "memory.h"
#include <string.h>

typedef struct CaseEntry {
	u16 flags; //0x0
	u8 pad_2[2]; //0x2
	s32 activeConditionId; //0x4, TODO rename
	char hitObjName[0x40]; //0x8
	s32 caseId; //0x48
	u32 swFlag; //0x4C
	void* activeFunc; //0x50
	s32 lwData[16]; //0x54
	u8 field_0x94[4]; //0x94
	void* evtCode; //0x98, TODO re-type
	s32 priority; //0x9C
} CaseEntry;

typedef struct CaseWork {
	s32 count; //0x0
	CaseEntry* entries; //0x4
} CaseWork;

//.sbss
static CaseWork work;
static CaseWork* wp = &work;


void caseInit(void) {
	wp->count = 64;
	wp->entries = __memAlloc(HEAP_DEFAULT, wp->count * sizeof(CaseEntry));
	memset(wp->entries, 0, wp->count * sizeof(CaseEntry));
}

void caseReInit(void) {
	int i;

	for (i = 0; i < wp->count; i++) {
		wp->entries[i].flags &= ~1;
	}
}

s32 caseEntry(CaseSetup* setup) {
	CaseEntry* entry;
	int i;
	if (wp->count > 0) {
		for (i = 0; i < wp->count; i++) {
			entry = &wp->entries[i];
			if (!(entry->flags & 1)) {
				break; //unused entry
			}
		}
	}
	memset(entry, 0, sizeof(CaseEntry));
	entry->caseId = i;
	entry->flags = 0;
	entry->activeConditionId = setup->activeConditionId & 0x7FFF;
	if (setup->activeConditionId & 0x8000) {
		entry->flags |= 4u;
	}
	entry->flags |= 1u;
	strcpy(entry->hitObjName, setup->hitObjName);
	entry->swFlag = setup->swFlag;
	entry->activeFunc = setup->activeFunc;
	entry->evtCode = setup->evtCode;
	entry->priority = setup->priority;
	entry->lwData[16] = 0;
	memcpy(entry->lwData, setup->lwData, sizeof(entry->lwData));
	return i;
}

void caseDelete(s32 caseId) {
	wp->entries[caseId].flags &= ~1u;
}

void caseMain(void) {

}
