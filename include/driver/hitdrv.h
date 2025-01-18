#pragma once

#include <dolphin/mtx.h>
#include "driver/mapdrv.h"

typedef BOOL (*HitFilterCallback)(struct HitCheckQuery* query, struct HitEntry* entry);

typedef struct HitVector {
    Vec e13; //0x0, v3 - v1
    Vec e21; //0xC, v1 - v2
    Vec e32; //0x18, v2 - v3
    Vec v1; //0x24
    Vec v2; //0x30
    Vec v3; //0x3C
    Vec normal; //0x48
} HitVector;

typedef struct HitCheckQuery {
    BOOL singleSided; //0x0
    s32 user0; //0x4
    s32 user1; //0x8
    Vec targetPos; //0xC
    Vec targetDir; //0x18
    Vec hitPos; //0x24
    Vec hitNormal; //0x30
    f32 targetDistance; //0x3C
} HitCheckQuery;

typedef struct HitDamageReturn {
    const char* mapobjName; //0x0
    Vec position; //0x4
} HitDamageReturn;

typedef struct HitEntry {
	u16 flags; //0x0
    u8 unk2[0x4 - 0x2]; //0x2
    s32 attributes; //0x4
    MapJoint* joint; //0x8
    Mtx unkC; //0xC
    Mtx unk3C; //0x3C
    Mtx unk6C; //0x6C
    Vec unk9C; //0x9C
    s16 unkA8; //0xA8
    u8 unkAA[0xAC - 0xAA]; //0xAA
    HitVector* unkAC; //0xAC
    HitDamageReturn* damage; //0xB0
    u8 unkB4[0xC0 - 0xB4]; //0xB4
    Vec unkC0; //0xC0
    f32 unkCC; //0xCC
    MapObject* mapObj; //0xD0
    struct HitEntry* parent; //0xD4
    struct HitEntry* child; //0xD8
    struct HitEntry* next; //0xDC
    struct HitEntry* nextActive; //0xE0
} HitEntry;

void hitInit(void);
void hitMain(void);








void hitReCalcMatrix(HitEntry* hit, Mtx mtx);
HitEntry* hitCheckVecFilter(HitCheckQuery* query, HitFilterCallback callback);
HitEntry* hitCheckFilter(HitFilterCallback callback, f32* hitX, f32* hitY, f32* hitZ, f32* distance,
						f32* hitNX, f32* hitNY, f32* hitNZ, f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz);
BOOL hitCheckVecHitObjXZ(HitCheckQuery* query, HitEntry* entry);
HitEntry* hitCheckAttr(s32 user0, f32* hitX, f32* hitY, f32* hitZ, f32* distance, f32* hitNX,
					  f32* hitNY, f32* hitNZ, f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz);
HitEntry* hitCheckSphereFilter(HitFilterCallback callback, f32 x, f32 y, f32 z, f32 distance);
HitEntry *hitNameToPtr(const char *name);
void hitObjGetPos(const char* name, Vec* position);
void hitObjGetNormal(const char *name, Vec *normal);
const char* hitGetName(HitEntry* hit);
s32 hitGetAttr(HitEntry* hit);
void hitGrpDamageReturnSet(const char* name, HitDamageReturn* damage);
Vec* hitGetDamageReturnPos(HitEntry* hit);
void hitBindMapObj(const char *hitName, const char *mapobjName);
