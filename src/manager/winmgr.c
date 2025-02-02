#include "manager/winmgr.h"
#include "driver/dispdrv.h"
#include "mario/mario_pouch.h"
#include "memory.h"
#include <string.h>

#define PI 3.14159265358979323846264338327950288419716939937510

#pragma warn_padding off
typedef struct WinMgrSelectTbl {
	s16 numDescriptors; //0x0
	//will pad 2 bytes
	WinMgrDesc* descriptors; //0x4
} WinMgrSelectTbl;
#pragma warn_padding on

//.data
WinMgrSelectTbl select_desc_tbl[] = {
	{3, NULL}
};

//.sbss
static WinMgrWork work;
//.sdata
static WinMgrWork* wp = &work;

//local prototypes
void winMgrDisp(CameraId camId, void* param);
void winMgrSeq(WinMgrEntry* entry);

void winMgrInit(void) {
	wp->mNumEntries = 32;
	wp->mEntries = (WinMgrEntry*)__memAlloc(HEAP_DEFAULT, wp->mNumEntries * sizeof(WinMgrEntry));
	memset(wp->mEntries, 0, wp->mNumEntries * sizeof(WinMgrEntry));
}

void winMgrReInit(void) {
	memset(wp->mEntries, 0, wp->mNumEntries * sizeof(WinMgrEntry));
}

//TODO: finish
void winMgrDisp(CameraId camId, void* param) {
	Mtx rotmtx, scalemtx;
	WinMgrEntry* entry = (WinMgrEntry*)param; //convert
	MTXRotRad(rotmtx, 'z', entry->rotation * (f32)(PI / 180));
	MTXScale(scalemtx, entry->scale, entry->scale, entry->scale);
	MTXConcat(rotmtx, scalemtx, scalemtx);


}

void winMgrMain(void) {
	WinMgrEntry* entry;
	WinMgrDesc* desc;
	int i;

	for (i = 0; i < wp->mNumEntries; i++) {
		entry = &wp->mEntries[i];
		if (entry->flags & 1) {
			winMgrSeq(entry);
			desc = entry->description;
			if (desc->main) {
				desc->main(entry);
			}
			if (entry->flags & 2) {
				dispEntry((CameraId)desc->camId, 0, winMgrDisp, entry, (f32)(entry->priority + 300));
			}
		}
	}
}

void winMgrSeq(WinMgrEntry* entry) {

}

s32 winMgrEntry(WinMgrDesc* desc) {
	WinMgrEntry* entry;
	int i;

	if (wp->mNumEntries > 0) {
		for (i = 0; i < wp->mNumEntries; i++) {
			entry = &wp->mEntries[i];
			if (!(entry->flags & 1)) {
				break; //this entry is available
			}
		}
	}
	entry->flags = 0;
	entry->flags |= 1;

	entry->description = desc;
	entry->field_0x18 = entry->description->field_0xC;
	entry->field_0x1C = entry->description->field_0x10;
	entry->field_0x20 = entry->description->field_0x14;
	entry->field_0x24 = entry->description->field_0x18;

	entry->priority = 0;

	entry->param = NULL;

	entry->field_0x38 = 0;
	entry->field_0x3C = 0;

	return i; //only return the entry id
}

void winMgrSetParam(s32 id, void* param) {
	WinMgrEntry* entry;
	
	entry = &wp->mEntries[id];
	if (entry->flags & 1) {
		entry->param = param;
	}
}

void winMgrOpen(s32 id) {
	WinMgrEntry* entry;

	entry = &wp->mEntries[id];
	if (entry->flags & 1) {
		entry->field_0x4 = 1;
		entry->field_0x8 = 0;
		entry->field_0x38 = 0;
		entry->field_0x3C = 0;
		entry->field_0x34 = 0;
	}
}

void winMgrClose(s32 id) {
	WinMgrEntry* entry;

	entry = &wp->mEntries[id];
	if (entry->flags & 1) {
		entry->field_0x4 = 2;
		entry->field_0x8 = 0;
	}
}

void winMgrCloseAutoDelete(s32 id) {
	WinMgrEntry* entry; // r4

	entry = &wp->mEntries[id];
	if (entry->flags & 1) {
		entry->field_0x4 = 2;
		entry->field_0x8 = 0;
		entry->flags |= 8;
	}
}

void winMgrDelete(s32 id) {
	wp->mEntries[id].flags &= ~1;
}

BOOL winMgrAction(s32 id) {
	return (wp->mEntries[id].flags >> 2) & 1;
}

void winMgrSetSize(s32 id, s32 a2, s32 a3, s32 a4, s32 a5) {
	WinMgrEntry* entry;

	entry = &wp->mEntries[id];
	if (entry->flags & 1) {
		entry->field_0x18 = a2;
		entry->field_0x1C = a3;
		entry->field_0x20 = a4;
		entry->field_0x24 = a5;
	}
}

void winMgrSetPriority(s32 id, s32 priority) {
	WinMgrEntry* entry;

	entry = &wp->mEntries[id];
	if (entry->flags & 1) {
		entry->priority = priority;
	}
}

WinMgrEntry* winMgrGetPtr(s32 id) {
	return &wp->mEntries[id];
}

void winMgrHelpInit(WinMgrEntry* entry) {
	entry->field_0x38 = 0;
	entry->field_0x3C = 0;
	entry->field_0x34 = 0;
}

void winMgrHelpMain(WinMgrEntry* entry) {

}

void winMgrHelpDraw(WinMgrEntry* entry) {

}

WinMgrSelect* winMgrSelectEntry(s32 a1, s32 a2, BOOL a3) {
	WinMgrSelectTbl* table;
	WinMgrSelect* select;
	//WinMgrDesc* desc;
	PouchData* pouch;
	s32 descId, i, id;

	pouch = pouchGetPtr();
	select = (WinMgrSelect*)__memAlloc(HEAP_DEFAULT, sizeof(WinMgrSelect));
	memset(select, 0, sizeof(WinMgrSelect));

	select->field_0x4 = a1;

	select->field_0xC = 0;
	descId = a1;
	select->field_0x10 = 0;

	select->field_0x18 = 0.0f;
	select->field_0x14 = 0.0f;
	select->field_0x1C = 0.0f;

	select->field_0x38 = a2;

	if (a3) {
		select->flags |= 0x100;
	}
	if (a1 < 0) {
		descId = 0;
	}
	table = &select_desc_tbl[descId];
	select->numDescriptors = (s32)table->numDescriptors;

	for (i = 0; i < select->numDescriptors; i++) {
		id = winMgrEntry(&table->descriptors[i]);
		select->descriptorId[i] = id;
		winMgrSetParam(id, select);
	}
	select->field_0x14 = (f32)table->descriptors->field_0xC;
	select->field_0x18 = (f32)(table->descriptors->field_0x10 - 54);
	//TODO: finish
	/*switch (select->field_0x4) {

	}





	*/
	return select;
}

//qqsort callback, sub_80237A2C
//qqsort callback, sub_802379E4
