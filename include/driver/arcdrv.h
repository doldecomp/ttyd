#pragma once

#include <dolphin/types.h>
#include "sdk/arc.h"

#pragma warn_padding off
typedef struct ArchiveEntry {
	u16 flags; //0x0
	//will pad 2 bytes
	ARCHandle handle; //0x4
	void* data; //0x20
	u32 size; //0x24
} ArchiveEntry;
#pragma warn_padding on


void arcInit(void);
void* arcOpen(const char* filename, void** addr, u32* length);

void arcEntry(s32 id, void* data, u32 size);