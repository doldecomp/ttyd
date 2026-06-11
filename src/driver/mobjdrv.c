#include "driver/mobjdrv.h"
#include "driver/animdrv.h"
#include "driver/dispdrv.h"
#include "driver/offscreendrv.h"
#include "mario/mario.h"
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

int mobjEntry(const char* name, const char* animPoseName) {
    MapObjectWork* wp;
    s32 entryCount;
    int i;
    MapObjectEntry* entry;
 
    wp = mobjGetWork();
    
    entryCount = wp->count;
    for (i = 0, entry = wp->entries; i < entryCount; i++, entry++) {
        if ((entry->flags & 1) && (strcmp(entry->name, name) == 0))
            break;
    }
    // SPM uses this to assert the name isn't duplicate, here it's just pointless

    for (i = 0, entry = wp->entries; i < entryCount; i++, entry++) {
        if ((entry->flags & 1) == 0)
            break;
    }

    memset(entry, 0, sizeof(*entry));
    entry->flags |= 1;
    strcpy(entry->name, name);

    entry->position = (Vec) {0.0f, 0.0f, 0.0f};
    entry->scale = (Vec) {1.0f, 1.0f, 1.0f};
    entry->rotation = (Vec) {0.0f, 0.0f, 0.0f};
    entry->unk5C = (Vec) {0.0f, 0.0f, 0.0f};
    entry->unk68 = 1.0f;
    entry->unk6C = 1.0f;
    entry->camId = 4;
    entry->poseId = animPoseEntry(animPoseName, gp->inBattle != 0);
    animPosePeraOff(entry->poseId);
    strcpy(entry->name, animPoseName);
    animPoseSetAnim(entry->poseId, "S_1", 1);
    animPoseSetMaterialLightFlagOn(entry->poseId, 2);
    mobjHitEntry(entry, 0);
    entry->offscreenId = -1;
    return i;
}

void mobjDelete(const char* name) {
    MapObjectWork* wp;
    s32 entryCount;
    int i;
    MapObjectEntry* entry;

    wp = koopaRunFlag ? &work[2] : gp->inBattle ? &work[1] : &work[0];

    entryCount = wp->count;
    for (i = 0, entry = wp->entries; i < entryCount; i++, entry++) {
        if((entry->flags & 1) && strcmp(entry->name, name) == 0) {
            for (i = 0; i < 2; i++) {
                if((entry->hitObj[i].name) != NULL) {
                    if(!gp->inBattle) {
                        marioResetHitObj(entry->hitObj[i].name);
                    }
                    hitDelete(entry->hitObj[i].name);
                }
            }
            entry->flags &= ~1;
            break;
        }
    }


// loop_15:
//     if (i >= count) {
//         return;
//     }
//     if ((entries->flags & 1) && (strcmp(entries->name, name) == 0)) {
//         var_r30 = 0;
//         var_r31_2 = entries;
//         do {
//             if ((var_r31_2 + 0x78) != NULL) {
//                 if ((s32) gp->inBattle == 0) {
//                     marioResetHitObj(var_r31_2 + 0x78);
//                 }
//                 hitDelete(var_r31_2 + 0x78);
//             }
//             var_r30 += 1;
//             var_r31_2 += 0x88;
//         } while (var_r30 < 2);
//         entries->flags &= 0xFFFFFFFE;
//         return;
//     }
//     i += 1;
//     entries += 0x23C;
//     goto loop_15;
}

void mobjMain(void) {
}
