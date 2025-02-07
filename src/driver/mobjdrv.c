#include "driver/mobjdrv.h"
#include "driver/animdrv.h"
#include "driver/dispdrv.h"
#include "driver/offscreendrv.h"
#include "mario/mariost.h"
#include "memory.h"
#include "system.h"
#include <string.h>

extern GlobalWork* gp;

//.sbss
BOOL koopaRunFlag;

//.bss
static MapObjectWork work[3];

#define mobjGetWorkFlag(flag) (flag ? &work[1] : &work[0])

void mobjKoopaOn(void) {
    if (!koopaRunFlag) {
        MapObjectWork* wp = &work[2];

        koopaRunFlag = TRUE;
        wp->count = 128;
        wp->entries = _mapAlloc(sizeof(MapObjectEntry) * wp->count);
        memset(wp->entries, 0, sizeof(MapObjectEntry) * wp->count);
    }
}

inline MapObjectWork* mobjGetWork(void) {
    if (koopaRunFlag) {
        return &work[2];
    } else {
        return mobjGetWorkFlag(gp->inBattle);
    }
}

inline void calcMtx(MapObjectEntry* entry, Mtx dest, Vec position) { // guessing, always inlined
    Mtx trans, scale, xrot, yrot, zrot;

    MTXTrans(trans, position.x, position.y, position.z);
    MTXScale(scale, entry->scale2.x, entry->scale2.y, entry->scale2.z);
    MTXRotRad(xrot, 'x', MTXDegToRad(entry->rotation.x));
    MTXRotRad(yrot, 'y', MTXDegToRad(entry->rotation.y));
    MTXRotRad(zrot, 'z', MTXDegToRad(entry->rotation.z));
    MTXConcat(trans, zrot, trans);
    MTXConcat(trans, yrot, trans);
    MTXConcat(trans, xrot, trans);
    MTXConcat(trans, scale, dest);
}

void mobjDispXLU(CameraId camId, void* param) {
    MapObjectEntry* entry = param; // cast to correct type

    if (entry->flags & 0x400) {
        animSetPaperTexMtx(entry->paperTexMtx, NULL, NULL);
        animSetPaperTexObj(&entry->paperTexObj, NULL, NULL, entry->unk208, NULL, NULL, 1, 1);
    }
    animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                 10.0f * entry->scale.x, 1);
    animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                 10.0f * entry->scale.x, 2);
    animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                 10.0f * entry->scale.x, 3);
    if (entry->flags & 0x400) {
        animSetPaperTexMtx(NULL, NULL, NULL);
        animSetPaperTexObj(NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
    }
}

void mobjDisp(CameraId camId, void* param) {
    MapObjectEntry* entry = param; // cast to correct type
    DispEntry* disp;

    if (entry->flags & 0x400) {
        animSetPaperTexMtx(entry->paperTexMtx, NULL, NULL);
        animSetPaperTexObj(&entry->paperTexObj, NULL, NULL, entry->unk208, NULL, NULL, 1, 1);
    }
    disp = dispGetCurWork();
    switch (disp->renderMode) {
        case 0:
            animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                         10.0f * entry->scale.x, 1);
            break;
        case 1:
            animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                         10.0f * entry->scale.x, 2);
            break;
        case 2:
        default:
            animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                         10.0f * entry->scale.x, 3);
            break;
    }
    if (entry->flags & 0x400) {
        animSetPaperTexMtx(NULL, NULL, NULL);
        animSetPaperTexObj(NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
    }
}

void mobjDisp_OffscreenXLU(CameraId camId, void* param) {
    MapObjectEntry* entry = param; // cast to correct type
	u16 left, top, right, bottom;

  sysWaitDrawSync();
  GXClearBoundingBox();
	    if (entry->flags & 0x400) {
        animSetPaperTexMtx(entry->paperTexMtx, NULL, NULL);
        animSetPaperTexObj(&entry->paperTexObj, NULL, NULL, entry->unk208, NULL, NULL, 1, 1);
    }
    animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                 10.0f * entry->scale.x, 1);
    animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                 10.0f * entry->scale.x, 2);
    animPoseDraw(entry->poseId, entry->position.x, entry->position.y, entry->position.z, entry->rotation.y,
                 10.0f * entry->scale.x, 3);
    if (entry->flags & 0x400) {
        animSetPaperTexMtx(NULL, NULL, NULL);
        animSetPaperTexObj(NULL, NULL, NULL, NULL, NULL, NULL, 1, 1);
    }
	  sysWaitDrawSync();
  GXReadBoundingBox(&left, &top, &right, &bottom);
  offscreenAddBoundingBox(entry->offscreenId, left, top, right, bottom);
}

void mobjInit(void) {
	MapObjectWork* wp;

	wp = &work[0];
    wp->count = 16;
    wp->entries = __memAlloc(HEAP_DEFAULT, sizeof(MapObjectEntry) * wp->count);
    memset(wp->entries, 0, sizeof(MapObjectEntry) * wp->count);

	wp = &work[1];
    wp->count = 8;
    wp->entries = __memAlloc(HEAP_DEFAULT, sizeof(MapObjectEntry) * wp->count);
    memset(wp->entries, 0, sizeof(MapObjectEntry) * wp->count);

    koopaRunFlag = FALSE;
}

void mobjReset(BOOL inBattle) {
    MapObjectWork* wp = mobjGetWorkFlag(inBattle);
    memset(wp->entries, 0, sizeof(MapObjectEntry) * wp->count);
    koopaRunFlag = FALSE;
}

void mobjHitEntry(MapObjectEntry* entry, s32 type) {
    AnimationPoseData* pose;
    Vec bboxMin, bboxMax;

    pose = animPoseGetAnimBaseDataPtr(entry->poseId);
    bboxMin = pose->bboxMin;
    bboxMax = pose->bboxMax;
}

void mobjMain(void) {
}
