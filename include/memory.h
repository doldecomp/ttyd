#pragma once

#include <dolphin/gx.h>
#include "mgr/filemgr.h"

typedef enum HEAP_TYPE {
	HEAP_DEFAULT = 0,
	HEAP_MALLOC = 1, //for memInit/Clear to do its allocation
	HEAP_EXT = 2, //TODO: proper name for EXT
	HEAP_EFFECT = 3,
	HEAP_BATTLE = 4,
	HEAP_UNK5 = 5
} HEAP_TYPE;

typedef struct smartEntry {
	void* address; //0x0
	u32 size; //0x4
	FileEntry* field_0x8; //0x8
	u16 field_0xC; //0xC
	u8 type; //0xE, total guess, no way to know
	u8 field_0xF; //0xF
	u32 field_0x10; //0x10
	struct smartEntry* next; //0x14
	struct smartEntry* prev; //0x18
} smartEntry;

typedef struct SmartWork {
	void* ptr; //0x0
	smartEntry work[0x800]; //0x4-0xE004
	u32 bytesLeft; //0xE004
	smartEntry* field_0xE008; //0xE008
	smartEntry* field_0xE00C; //0xE00C
	smartEntry* head; //0xE010
	smartEntry* tail; //0xE014
	u32 waitsync; //0xE018
} SmartWork;

void memInit(void);
void memClear(HEAP_TYPE heap);
void* __memAlloc(HEAP_TYPE heap, u32 size);
void __memFree(HEAP_TYPE heap, void* ptr);
void* _mapAlloc(u32 size);
void* _mapAllocTail(u32 size);
void _mapFree(void* alloc);
void smartInit(void);
void smartReInit(void);
void smartAutoFree(u32 a1);
void smartFree(smartEntry* entry);
smartEntry* smartAlloc(u32 size, u8 type);
GXTexObj* smartTexObj(GXTexObj* obj, void** image_ptr);
