#pragma once

#include <dolphin/mtx.h>

typedef struct {
    s32 flags; //0x0
    s32 unk4; //0x4
    s32 priLimit; //0x8
    s32 mode; //0xC
    u8 unk10[0x24 - 0x10]; //0x10
    f32 zoom; //0x24
    u16 moveSpeedLv; //0x28
    u16 zoomSpeedLv; //0x2A
    u8 unk2C[0x5C - 0x2C]; //0x2C
    Vec position; //0x5C
    u8 unk68[0x104 - 0x68]; //0x68
} BattleCameraWork;

void battleCameraInit(void);