#include "memory.h"
#include "system.h"
#include <dolphin/os.h>
#include <string.h>

//HEAP_MALLOC block is a series of these nodes
typedef struct MapAllocEntry MapAllocEntry;
struct MapAllocEntry {
	MapAllocEntry* next; //0x0
	u32 size; //0x4
	u16 inuse; //0x8
	u16 currId; //0xA
	u8 field_0xC[0x20 - 0xC]; //0xC
};

//.bss
SmartWork smartWork;

//.sdata
//flag, size / 0x400 (>> 10)
s32 size_table[6][2] = {
	{1, 0x1C84}, //0x721000, 7300 KiB/7.13 MiB
	{1, 0xD90}, //0x364000, 3472 KiB/3.39 MiB
	{1, 0xE0}, //0x38000, 224 KiB
	{1, 0x80}, //0x20000, 128 KiB
	{1, 0x100}, //0x40000, 256 KiB
	{0, 0x64}
};
static SmartWork* wp = &smartWork;

//.sbss
s16 count;
BOOL g_bFirstSmartAlloc;
u32 mapalloc_size;
void* mapalloc_base_ptr;
void* heapEnd[6];
void* heapStart[6];
OSHeapHandle heapHandle[6];

//local prototypes
void smartGarbage(void);

void memInit(void) { //almost 1:1, stubborn regalloc at the end
    MapAllocEntry* entry;
    void* arenaLo;
    void* arenaHi;
    u32 temp_r31;
    int i;
    int size;
    u32 temp;

    arenaLo = OSGetArenaLo();
    arenaHi = OSGetArenaHi();
    arenaLo = OSInitAlloc(arenaLo, arenaHi, 6);
    OSSetArenaLo(arenaLo);
    arenaLo = (void*)OSRoundUp32B(arenaLo);
    arenaHi = (void*)OSRoundDown32B(arenaHi);
    temp = (u32)arenaLo;

    for (i = 0; i < 6; i++) {
        if (size_table[i][0] == 1) {
            heapStart[i] = (void*)temp;
            size = size_table[i][1] << 10;
            heapEnd[i] = (void*)(temp + size);
            temp += size;
        }
    }

    temp_r31 = (u32)arenaHi - temp;
    for (i = 0; i < 6; i++) {
        if (size_table[i][0] == 0) {
            size = (size_table[i][1] * (u64)temp_r31) / 100Ull;
            heapStart[i] = (void*)temp;
            size -= (size & 0x1F);
            heapEnd[i] = (void*)(temp + size);
            temp += size;
        }
    }
    for (i = 0; i < 6; i++) {
        heapHandle[i] = OSCreateHeap(heapStart[i], heapEnd[i]);
    }
    OSSetArenaLo((void* ) arenaHi);
    for (i = 0; i < 6; i++) {
        OSDestroyHeap(heapHandle[i]);
        OSCreateHeap(heapStart[i], heapEnd[i]);
        if (i == 1) {
            size = ((u32)heapEnd[1] - (u32)heapStart[1]) - 0x20;
            entry = OSAllocFromHeap(heapHandle[1], size);
            if (entry) {
                memset(entry, 0, size);
                DCFlushRange(entry, size);
            }
            entry->next = 0;
            entry->size = size - 0x20;
            entry->inuse = 0;
            mapalloc_base_ptr = entry;
            mapalloc_size = size;
            count = 0;
        }
    }
}

void memClear(HEAP_TYPE heap) {
	MapAllocEntry* entry;
	void* ptr;
	u32 size;

	OSDestroyHeap(heapHandle[heap]);
	OSCreateHeap(heapStart[heap], heapEnd[heap]);
	if (heap == HEAP_MALLOC) {
		size = (u32)heapEnd[1] - (u32)heapStart[1] - 32;
		//inline __memAlloc?
		ptr = OSAllocFromHeap(heapHandle[1], size);
		entry = ptr;
		if (ptr) {
			memset(ptr, 0, size);
			DCFlushRange(ptr, size);
		}
		entry->next = NULL;
		entry->size = size - 32;
		entry->inuse = 0;
		mapalloc_base_ptr = entry;
		mapalloc_size = size;
		count = 0;
	}
}

void* __memAlloc(HEAP_TYPE heap, u32 size) {
	void* ptr;

	ptr = OSAllocFromHeap(heapHandle[heap], size);
	if (ptr) {
		memset(ptr, 0, size);
		DCFlushRange(ptr, size);
	}
	return ptr;
}

void __memFree(HEAP_TYPE heap, void* ptr) {
	OSFreeToHeap(heapHandle[heap], ptr);
}

void* _mapAlloc(u32 size) {
	MapAllocEntry* nextptr; //shorthand to make sure regalloc is correct
	MapAllocEntry* entry; //for our loop
	MapAllocEntry* tailEntry; //make sure we don't lose when inserting, might need better name
	MapAllocEntry* currEntry; //one we're allocating
	void* usableData; //memory caller can actually use
	u32 usableSize; //size minus 0x20 header
	u32 maxSize; //used to update latest tail
	u32 fullSize; //size including header

	usableSize = OSRoundUp32B(size);
	if (!usableSize) {
		return NULL;
	}
	entry = mapalloc_base_ptr;
	fullSize = usableSize + 0x20;
	maxSize = 0;
	tailEntry = 0;
	while (1) {
		if (!entry->inuse && entry->size >= fullSize) {
			if (maxSize > entry->size || !maxSize) {
				tailEntry = entry->next;
				currEntry = entry;
				maxSize = entry->size;
			}
		}
		if (!entry->next) break;
		entry = entry->next;
	}
	if (maxSize) {
		usableData = (void*)((u32)currEntry + 0x20);

		currEntry->next = (void*)((u32)currEntry + fullSize);
		currEntry->size = usableSize;
		currEntry->inuse = 1;
		currEntry->currId = count++;

		nextptr = currEntry->next;
		nextptr->next = tailEntry;
		nextptr->size = maxSize - fullSize;
		nextptr->inuse = 0;
		nextptr->currId = 0;

		memset(usableData, 0, usableSize);
		DCFlushRange(usableData, usableSize);
		return usableData;
	}
	else {
		return NULL;
	}
}

void* _mapAllocTail(u32 size) {
	MapAllocEntry* nextptr; //shorthand to make sure regalloc is correct
	MapAllocEntry* entry; //for our loop
	MapAllocEntry* tailEntry; //make sure we don't lose when inserting, might need better name
	MapAllocEntry* currEntry; //one we're allocating
	//void* usableData; //memory caller can actually use
	u32 maxSize; //used to update latest tail
	u32 fullSize; //size including header
	u32 usableSize; //size minus 0x20 header

	usableSize = OSRoundUp32B(size);
	if (!usableSize) {
		return NULL;
	}
	entry = mapalloc_base_ptr;
	fullSize = usableSize + 0x20;
	maxSize = 0;
	tailEntry = 0;
	while (1) {
		if (!entry->inuse && entry->size >= fullSize) {
			tailEntry = entry->next;
			currEntry = entry;
			maxSize = entry->size;
		}
		if (!entry->next) break;
		entry = entry->next;
	}
	if (maxSize) {
		memset(currEntry, 0, fullSize);
		DCFlushRange(currEntry, fullSize);

		currEntry->next = (MapAllocEntry*)(((u32)currEntry + maxSize) - fullSize);
		currEntry->size = maxSize - fullSize;
		currEntry->inuse = 0;
		currEntry->currId = 0;

		nextptr = currEntry->next;
		nextptr->next = tailEntry;
		tailEntry = (void*)((u32)nextptr + 0x20);
		nextptr->size = usableSize;
		nextptr->inuse = 1;
		nextptr->currId = count++;

		memset(tailEntry, 0, usableSize);
		DCFlushRange(tailEntry, usableSize);
		return tailEntry;
	}
	else {
		return NULL;
	}
}

void _mapFree(void* alloc) {
	MapAllocEntry* loopEntry;
	MapAllocEntry* nextEntry;
	u32 newSize;
	MapAllocEntry* entry;

	if (!alloc) return;
	entry = (MapAllocEntry*)((u32)alloc - 0x20);
	if (!entry->inuse) return;
	nextEntry = entry->next;
	newSize = entry->size;
	if (nextEntry && !nextEntry->inuse) {
		newSize += nextEntry->size + 0x20;
		nextEntry = nextEntry->next;
	}
	loopEntry = mapalloc_base_ptr;
	while (1) {
		if (loopEntry->next == entry) {
			if (!loopEntry->inuse) {
				newSize += loopEntry->size + 0x20;
				entry = loopEntry;
			}
			break;
		}
		if ((u32)loopEntry > (u32)entry || !loopEntry->next) break;
		loopEntry = loopEntry->next;
	}
	entry->next = nextEntry;
	entry->size = newSize;
	entry->inuse = 0;
}

void smartInit(void) {
	void* ptr;
	u32 size;
	int i;

	size = (u32)heapEnd[5] - (u32)heapStart[5] - 32;
	ptr = OSAllocFromHeap(heapHandle[5], size);
	if (ptr) {
		memset(ptr, 0, size);
		DCFlushRange(ptr, size);
	}
	wp->ptr = ptr;
	wp->field_0xE008 = 0;
	wp->field_0xE00C = 0;
	wp->bytesLeft = size;
	memset(wp->ptr, 0, size);
	memset(wp->work, 0, sizeof(wp->work));
	for (i = 0; i < 0x800; i++) {
		wp->work[i].next = &wp->work[i + 1];
		wp->work[i].prev = &wp->work[i - 1];
	}
	wp->head = &wp->work[0];
	wp->head->prev = NULL;
	wp->tail = &wp->work[0x7FF];
	wp->tail->next = NULL;
	wp->waitsync = 0;
	g_bFirstSmartAlloc = FALSE;
}

void smartReInit(void) {
	u32 size;
	int i;

	wp->field_0xE008 = 0;
	wp->field_0xE00C = 0;
	size = (u32)heapEnd[5] - (u32)heapStart[5] - 32;
	wp->bytesLeft = size;
	memset(wp->ptr, 0, size);
	memset(wp->work, 0, sizeof(wp->work));
	for (i = 0; i < 0x800; i++) {
		wp->work[i].next = &wp->work[i + 1];
		wp->work[i].prev = &wp->work[i - 1];
	}
	wp->head = &wp->work[0];
	wp->head->prev = NULL;
	wp->tail = &wp->work[0x7FF];
	wp->tail->next = NULL;
	wp->waitsync = 0;
	g_bFirstSmartAlloc = 0;
}



void smartAutoFree(u32 a1) {

}

void smartFree(smartEntry* entry) {

}

smartEntry* smartAlloc(u32 size, u8 type) {
	smartEntry* entry1, * entry2;
	int i;

	if (!g_bFirstSmartAlloc) {
		g_bFirstSmartAlloc = TRUE;
		smartAutoFree(3);
	}

	if (wp->waitsync) {
		sysWaitDrawSync();
		wp->waitsync = 0;
	}

	entry2 = wp->head;

	if (!entry2->prev) {
		wp->head = entry2->next;
		if (wp->head) {
			wp->head->prev = NULL;
		}
	}
	else {
		entry2->prev->next = entry2->next;
	}

	if (!entry2->next) {
		wp->tail = entry2->prev;
		if (wp->tail) {
			wp->tail->next = NULL;
		}
	}
	else {
		entry2->next->prev = entry2->prev;
	}

	if (size & 31) {
		size += 32 - (size & 31);
	}

	entry2->field_0xC = 1;
	entry2->type = type;
	entry2->size = size;
	entry2->field_0x8 = 0;
	if (wp->bytesLeft >= size) {
		entry2->address = wp->ptr;
		entry2->field_0x10 = wp->bytesLeft - size;
		entry2->next = wp->field_0xE008;
		entry2->prev = NULL;
		wp->bytesLeft = 0;
		if (wp->field_0xE008) {
			wp->field_0xE008->prev = entry2;
		}
		wp->field_0xE008 = entry2;
		if (!entry2->next) {
			entry2->field_0x10 = (u32)wp->ptr + (u32)heapEnd[5] - (u32)heapStart[5] - 32 - (u32)entry2->address - entry2->size;
			wp->field_0xE00C = entry2;
		}
		return entry2;
	}
	else {
		for (entry1 = wp->field_0xE008; entry1; entry1 = entry1->next) {
			if (entry1->field_0x10 >= size) {
				entry2->address = (void*)((u32)entry1->address + entry1->size);
				entry2->field_0x10 = entry1->field_0x10 - size;
				entry2->next = entry1->next;
				entry2->prev = entry1;
				entry1->field_0x10 = 0;
				if (entry1->next) {
					entry1->next->prev = entry2;
				}
				else {
					wp->field_0xE00C = entry2;
				}
				entry1->next = entry2;
				return entry2;
			}
		}
		for (i = 0; i < 3; i++) {
			switch (i) {
				case 1:
					_fileGarbage(1);
					break;
				case 2:
					_fileGarbage(0);
					break;
				default: break;
			}
			smartGarbage();
			entry1 = wp->field_0xE00C;
			if (entry1->field_0x10 >= size) {
				entry2->address = (void*)((u32)entry1->address + entry1->size);
				entry2->field_0x10 = entry1->field_0x10 - size;
				entry2->next = entry1->next;
				entry2->prev = entry1;
				entry1->field_0x10 = 0;
				if (entry1->next) {
					entry1->next->prev = entry2;
				}
				else {
					wp->field_0xE00C = entry2;
				}
				entry1->next = entry2;
				return entry2;
			}
		}
		return NULL;
	}
}

void smartGarbage(void) {

}

GXTexObj* smartTexObj(GXTexObj* obj, void** image_ptr) {
	if (image_ptr) {
		GXInitTexObjData(obj, *image_ptr);
	}
	return obj;
}