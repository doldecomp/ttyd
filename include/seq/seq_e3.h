#pragma once

#include <dolphin/os.h>
#include "driver/seqdrv.h"
#include "manager/filemgr.h"

typedef struct seq_e3_work {
    FileEntry* handle; // 0x00
    u32 field_4;       // 0x04
    u32 field_8;       // 0x08
    s32 scenario;      // 0x0C
    f32 curX;          // 0x10
    f32 curY;          // 0x14
    f32 dstX;          // 0x18
    f32 dstY;          // 0x1C
    OSAlarm alarm;     // 0x20
    OSTime initTime;   // 0x48
    u32 field_0x50;    // 0x50
    u32 field_0x54;    // 0x54
    u32 field_0x58;    // 0x58
    u32 field_0x5C;    // 0x5C
    u32 field_0x60;    // 0x60
    f32 field_64;      // 0x64
} seq_e3_work;

void seq_e3Init(SequenceWork* work);
void seq_e3Main(SequenceWork* work);
void seq_e3Exit(SequenceWork* work);
