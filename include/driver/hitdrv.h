#pragma once

#include <dolphin/mtx.h>
#include "driver/mapdrv.h"

typedef struct HitCheckQuery HitCheckQuery;
typedef struct HitEntry HitEntry;
typedef BOOL (*HitFilterCallback)(HitCheckQuery* query, struct HitEntry* entry);

typedef struct HitVector {
    Vec v0;     // 0x0
    Vec v1;     // 0xC
    Vec v2;     // 0x18
    Vec edge0;  // 0x24, v2 - v0
    Vec edge1;  // 0x30, v0 - v1
    Vec edge2;  // 0x3C, v1 - v2
    Vec normal; // 0x48
} HitVector;

struct HitCheckQuery {
    BOOL singleSided;   // 0x0
    s32 user0;          // 0x4
    s32 user1;          // 0x8
    Vec targetPos;      // 0xC
    Vec targetDir;      // 0x18
    Vec hitPos;         // 0x24
    Vec hitNormal;      // 0x30
    f32 targetDistance; // 0x3C
};

typedef struct HitDamageReturn {
    const char* mapobjName; // 0x0
    Vec position;           // 0x4
} HitDamageReturn;

struct HitEntry {
    u16 flags;                      // 0x0
    u8 unk2[0x4 - 0x2];             // 0x2
    s32 attributes;                 // 0x4
    MapFileJoint* joint;            // 0x8
    Mtx worldMtx;                   // 0xC
    Mtx localMtx;                   // 0x3C
    Mtx unk6C;                      // 0x6C
    Vec centerLocal;                // 0x9C
    s16 unkA8;                      // 0xA8
    s16 mapIndex;                   // 0xAA
    HitVector* vectors;             // 0xAC
    HitDamageReturn* damage;        // 0xB0
    u8 unkB4[0xC0 - 0xB4];          // 0xB4
    Vec centerWorld;                // 0xC0
    f32 radius;                     // 0xCC
    MapObject* mapObj;              // 0xD0
    struct HitEntry* parent;        // 0xD4
    struct HitEntry* child;         // 0xD8
    struct HitEntry* sibling;       // 0xDC
    struct HitEntry* siblingActive; // 0xE0, TODO: next or sibling
};

void hitInit(void);
void hitMain(void);

void hitReCalcMatrix(HitEntry* hit, Mtx mtx);
HitEntry* hitCheckVecFilter(HitCheckQuery* query, HitFilterCallback callback);
HitEntry* hitCheckFilter(HitFilterCallback callback, f32* hitX, f32* hitY, f32* hitZ, f32* distance, f32* hitNX,
                         f32* hitNY, f32* hitNZ, f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz);
BOOL hitCheckVecHitObjXZ(HitCheckQuery* query, HitEntry* entry);
HitEntry* hitCheckAttr(s32 user0, f32* hitX, f32* hitY, f32* hitZ, f32* distance, f32* hitNX, f32* hitNY, f32* hitNZ,
                       f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz);
HitEntry* hitCheckSphereFilter(HitFilterCallback callback, f32 x, f32 y, f32 z, f32 distance);
HitEntry* hitNameToPtr(const char* name);
void hitObjGetPos(const char* name, Vec* position);
void hitObjGetNormal(const char* name, Vec* normal);
const char* hitGetName(HitEntry* hit);
s32 hitGetAttr(HitEntry* hit);
void hitGrpDamageReturnSet(const char* name, HitDamageReturn* damage);
Vec* hitGetDamageReturnPos(HitEntry* hit);
void hitBindMapObj(const char* hitName, const char* mapobjName);
