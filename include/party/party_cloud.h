#pragma once

#include <dolphin/mtx.h>

typedef struct PartyCloud {
    f32 unk0;
    f32 unk4;
    f32 unk8;
    u8 field_0xC[0x48 - 0xC];
} PartyCloud;

void cloudGetAt(Vec* position);
void cloudResetAt();
u8 cloudGetStatus();
f32 cloudGetBreathDir(void);
