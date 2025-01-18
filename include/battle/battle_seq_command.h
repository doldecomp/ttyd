#pragma once

#include <dolphin/types.h>

typedef struct BattleCommandCursor {
    s32 unk0; //0x0
    s32 unk4; //0x4
    s32 unk8; //0x8
} BattleCommandCursor;

typedef struct BattleCommand {
    s32 unk0; //0x0
    s32 unk4; //0x4
    u8 unk8[0x498 - 0x8]; //0x8
    BattleCommandCursor cursor[14]; //0x498
    u8 unk534[0x55C - 0x534]; //0x534
    void* unk55C; //0x55C
    u8 unk560[0x574 - 0x560]; //0x560
} BattleCommand;
