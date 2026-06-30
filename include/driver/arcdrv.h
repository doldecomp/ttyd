#pragma once

#include <dolphin/types.h>
#include "sdk/arc.h"

typedef struct ArchiveEntry {
    u16 flags;        // 0x0
    ARCHandle handle; // 0x4
    void* data;       // 0x20
    u32 size;         // 0x24
} ArchiveEntry;

void arcInit(void);
void* arcOpen(const char* filename, void** addr, u32* length);

void arcEntry(s32 id, void* data, u32 size);
