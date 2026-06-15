#pragma once

#include <dolphin/types.h>

typedef struct MapData {
    const char* mapName;
    s32* eventAddr;
} MapData;

typedef struct AreaData {
    const char* areaName;
    const char* areaJpName;
    void* field_8;
    void* field_C;
    MapData* maps[];
} AreaData;

typedef struct WorldData {
    const char* worldName;
    const char* worldJpName;
    AreaData* areas[64];
} WorldData;

MapData* mapDataPtr(const char* mapName);
AreaData* areaDataPtr(const char* areaName);
void relSetEvtAddr(const char* mapName, s32* eventAddr);
void relSetBtlAddr(const char* areaName, void* field_8, void* field_C);
