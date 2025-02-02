#pragma once

#include <dolphin/types.h>
#include "manager/evtmgr.h"

s32 evtmgrCmd(EventEntry* entry);
s32 evtGetValue(EventEntry* entry, s32 index);
s32 evtGetNumber(EventEntry* entry, s32 index);
s32 evtSetValue(EventEntry* entry, s32 index, s32 value);
f32 evtGetFloat(EventEntry* entry, s32 index);
f32 evtSetFloat(EventEntry* entry, s32 index, f32 value);
