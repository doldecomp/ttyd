#pragma once

#include <dolphin/dvd.h>
#include "mgr/filemgr.h"
#include "sdk/texPalette.h"

typedef void (*EffectCallback)(struct EffectEntry* effect);

typedef struct EffectEntry {
	u32 flags; //0x0
	u32 inBattle; //0x4
	s32 count; //0x8
	void* userdata; //0xC, for effects to store their own data
	EffectCallback callback; //0x10
	const char* type; //0x14
	char name[16]; //0x18
} EffectEntry;

#pragma warn_padding off
typedef struct EffectSet {
	s16 id; //0x0
	//will pad 2 bytes
	const char* name; //0x4
} EffectSet;
#pragma warn_padding on

typedef struct EffectWork {
	s32 count; //0x0
	EffectEntry* entries; //0x4
	TPLHeader* texture; //0x8
	BOOL texLoaded; //0xC
	FileEntry* handle; //0x10
	s32 language; //0x14
} EffectWork;

void effInit(void);
void effTexSetup(void);
void effGetTexObj(u32 id, GXTexObj* obj);
void effAutoRelease(BOOL inBattle);
EffectEntry* effEntry(void);
void effSetName(EffectEntry* effect, const char* name);
void effMain(void);
void effDelete(EffectEntry* effect);
void effSoftDelete(EffectEntry* effect);
EffectEntry* effNameToPtr(const char* name);
EffectSet* effGetSet(const char* name);
