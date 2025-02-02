#pragma once

#include <dolphin/types.h>

typedef struct RankUpData {
    s16 startLevel; //0x0, the level you need to reach to be a certain rank
    s16 rankId; //0x2, the index of this rank for lookups
    const char* rankUpName; //0x4, name of the rank for pause menu
    const char* rankUpMessage; //0x8, text box when you rank up
} RankUpData;

typedef struct BattleSeqEndWork {
    u8 unk0[0x2AC - 0x0]; //0x0
} BattleSeqEndWork;
