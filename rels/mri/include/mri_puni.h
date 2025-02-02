#pragma once

#include <dolphin/types.h>
#include "evt/evt_cmd.h"

#define PUNI_DATA_MAX 211
#define PUNI_TEX_INFO_MAX 200

typedef struct PuniWork {
    u8 unk0[0x328 - 0x0];     // 0x0
    s32 unk328;               // 0x328
    u8 unk32C[0x448 - 0x32C]; // 0x32C
    BOOL showPuniCounter; //0x444
    BOOL unk448; //0x448
    s32 puniCounterAlpha; //0x44C
    u8 unk450[0x4D0 - 0x450]; // 0x450
} PuniWork;

typedef struct PuniData {
    u8 unk0[0x4 - 0x0];   // 0x0
    s32 unk4;             // 0x4
    u8 unk8[0xC - 0x8];   // 0x8
    u16 unkC;             // 0xC
    u8 unkE[0x5A8 - 0xE]; // 0xE
} PuniData;

typedef struct PuniTexInfo {
    char* unk0; // 0x0
    char* unk4; // 0x4
    f32 unk8;   // 0x8
} PuniTexInfo;

USER_FUNC(evt_puni_mem_init);
