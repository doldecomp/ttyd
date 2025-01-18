/* "dvdmgr" - DVD File Manager
 * Status: Module finished, write-up/documentation needed
 *
 * Function: easy file handling for loading data from the disc, instead of
 * having to call DVD functions directly and handle errors
 * 
 * Last Update: 12/18/2021 more clean-up, latest changes, update types
 */
#include "mgr/dvdmgr.h"
#include "memory.h"
#include "system.h"
#include <dolphin/os.h>
#include <string.h>

//.bss
OSThread dvdmgr_thread;
static u8 stack[0x4000];

//.sbss
DVDEntry* dvdq;
static DVDMgrCallback _callback;
BOOL dvdmgr_thread_on;

//local prototypes
void* proc_main(void* param);
static s32 compare(const void** a, const void** b);

void* proc_main(void* param) { //1:1
    while (1) {
        DVDMgrMain();
        OSYieldThread();
    }
}

void DVDMgrInit(void) { //1:1
    dvdq = __memAlloc(HEAP_DEFAULT, sizeof(DVDEntry) * DVDEntryCount);
    memset(dvdq, 0, sizeof(DVDEntry) * DVDEntryCount);
    if (!OSCreateThread(&dvdmgr_thread, proc_main, NULL, stack + sizeof(stack), sizeof(stack), 16, OS_THREAD_ATTR_DETACH)) {
        while (1) ;
    }
    dvdmgr_thread_on = TRUE;
    OSResumeThread(&dvdmgr_thread);
}

void DVDMgrDelete(void) { //1:1
    if (dvdmgr_thread_on) {
        OSCancelThread(&dvdmgr_thread);
        dvdmgr_thread_on = FALSE;
    }
}

static s32 compare(const void** a, const void** b) { //1:1
    u8 value1, value2;
    
    value1 = (u8)dvdq[*(u8*)a].priority;
    value2 = (u8)dvdq[*(u8*)b].priority;
    if (value1 > value2) {
        return 1;
    }
    else {
        return -(value1 < value2);
    }
}

void DVDMgrMain(void) { //1:1
    u8 array[0x100];
    u8* table;
    DVDEntry* entry;
    BOOL valid;
    s32 result;
    s32 count;
    s32 size;
    s32 i;

    count = 0;
    memset(array, 0, sizeof(array));
    
    for (table = array, entry = dvdq, i = 0; i < DVDEntryCount; i++, entry++) {
        if (entry->status & DVDMGR_INUSE) {
            *table = i;
            count++;
            table++;
        }
    }
    
    qqsort(array, count, sizeof(u8), compare);
    
    for (table = array, i = 0; i < count; table++, i++) {
        valid = FALSE;
        entry = &dvdq[*table];
        if (!(entry->status & DVDMGR_UNK_ERROR2) && entry->status & DVDMGR_READING) {
            size = entry->bytesLeft;
            if (entry->priority) {
                if (size > 0x40000) {
                    size = 0x40000;
                }
            }
            
            result = DVDRead(&entry->info, entry->address, size, entry->offset + entry->position);
            if (result == DVD_RESULT_CANCELED) {
                entry->status &= ~DVDMGR_READING;
                entry->status |= DVDMGR_FINISHED;
                if (entry->callback != NULL) {
                    entry->callback(result, &entry->info);
                }
            } else if (result < 0) {
                entry->status |= DVDMGR_UNK_ERROR1;
                entry->status |= DVDMGR_UNK_ERROR2;
            } else {
                entry->bytesLeft -= size;
                entry->position += size;
                entry->address = (void*)((s32)entry->address + size);
                if (entry->bytesLeft == 0) {
                    entry->status &= ~DVDMGR_READING;
                    entry->status |= DVDMGR_FINISHED;
                    if (entry->callback != NULL) {
                        entry->callback(result, &entry->info);
                    }
                }
                valid = TRUE;
            }
        }
        
        if (entry->status & DVDMGR_CLOSED) {
            DVDClose(&entry->info);
            memset(entry, 0, sizeof(DVDEntry));
        }
        
        if (valid) {
            break;
        }
    }
    if (_callback != NULL) {
        _callback();
    }
}

DVDEntry* DVDMgrOpen(const char* path, u8 priority, u16 unknown) { //1:1
    DVDEntry* entry;
    int i;

    if (DVDConvertPathToEntrynum(path) == -1) {
        return NULL;
    }
    
    for (entry = dvdq, i = 0; i < DVDEntryCount; i++, entry++) {
        if (!(entry->status & DVDMGR_INUSE)) {
            break;
        }
    }
    if (i >= DVDEntryCount) {
        return NULL;
    }
    memset(entry, 0, sizeof(DVDEntry));
    strcpy(entry->name, path);
    entry->status = 0;
    entry->priority = priority;
    entry->unknown = unknown;
    entry->address = NULL;
    entry->bytesLeft = 0;
    entry->offset = 0;
    entry->position = 0;
    entry->status |= DVDMGR_INUSE;
    if (!DVDOpen(entry->name, &entry->info)) {
        memset(entry, 0, sizeof(DVDEntry));
        return NULL;
    }
    return entry;
}

//return is s32 even though it cannot be negative
s32 DVDMgrRead(DVDEntry* entry, void* address, u32 size, s32 offset) {
	entry->address = address;
	entry->bytesLeft = size;
	entry->offset = offset;
	entry->status |= DVDMGR_READING;
	entry->status &= ~DVDMGR_FINISHED;
	entry->callback = NULL;
	entry->position = 0;
	while (!(entry->status & DVDMGR_FINISHED)) {
		OSYieldThread();
	}
	return entry->info.length;
}

void DVDMgrReadAsync(DVDEntry* entry, void* address, u32 size, s32 offset, DVDCallback callback) {
	entry->address = address;
	entry->bytesLeft = size;
	entry->offset = offset;
	entry->status |= DVDMGR_READING;
	entry->status &= ~DVDMGR_FINISHED;
	entry->callback = callback;
	entry->position = 0;
}

void DVDMgrClose(DVDEntry* entry) {
	entry->status |= DVDMGR_CLOSED;
}

u32 DVDMgrGetLength(DVDEntry* entry) {
	return entry->info.length;
}

void DVDMgrSetupCallback(DVDMgrCallback callback) {
	_callback = callback;
}
