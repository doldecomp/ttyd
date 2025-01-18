#pragma once

#include <dolphin/types.h>

void swInit(void);
void swReInit(void);

//Local Saved Work
s32 _swByteGet(s32 index);
void _swByteSet(s32 index, u8 value);
//Local Saved Work Flags
void _swClear(s32 index);
BOOL _swGet(s32 index);
void _swSet(s32 index);
//Global Saved Work
s32 swByteGet(s32 index);
void swByteSet(s32 index, s32 value);
//Global Saved Work Flags
void swClear(s32 index);
BOOL swGet(s32 index);
void swSet(s32 index);
