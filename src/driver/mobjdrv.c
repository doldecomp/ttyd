#include "driver/mobjdrv.h"
#include "dolphin/types.h"
#include "driver/animdrv.h"
#include "driver/dispdrv.h"
#include "driver/hitdrv.h"
#include "driver/offscreendrv.h"
#include "driver/itemdrv.h"
#include "manager/evtmgr.h"
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

inline int mobjCheckKururingFloorItem(MapObjectEntry* entry) { // was always inlined in retail but not in demo
    if (!strcmp(entry->animName, "MOBJ_KururinFloor")) {
        ItemEntry* item = itemNameToPtr(entry->name);
        if ((item != NULL && (item->flags & 1) && evtGetValue(0, entry->unk1E4) == 0))
            return 1;
        else if((evtGetValue(0, entry->unk1E4) != 0))
            return 1;
        else
            return 2;
    }
    else {
        return 0;
    }
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

    wp = mobjGetWork();

    entryCount = wp->count;
    entry = wp->entries;
    for (i = 0; i < entryCount; i++, entry++) {
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
}

void mobjSetPosition(const char* name, f32 x, f32 y, f32 z) {
    MapObjectWork* wp;
    MapObjectEntry* entry;
    s32 entryCount;
    int i;

    wp = mobjGetWork();

    entryCount = wp->count;
    entry = wp->entries;
    for (i = 0; i < entryCount; i++, entry++) {
        if((entry->flags & 1) && strcmp(entry->name, name) == 0) {
            break;
        }
    }

    entry->position.x = x;
    entry->position.y = y + 0.1f;
    entry->position.z = z;
}

void mobjMain(void) {
}

MapObjectEntry* mobjNameToPtr(const char* name) {
    int i;
    s32 entryCount;
    MapObjectEntry* entry;
    MapObjectWork* wp;

    wp = mobjGetWork();

    entryCount = wp->count;
    entry = wp->entries;
    for (i = 0; i < entryCount; i++, entry++) {
        if((entry->flags & 1) && strcmp(entry->name, name) == 0) {
            break;
        }
    }

    return entry;
}

MapObjectEntry* mobjNameToPtrNoAssert(const char* name) {
    int i;
    s32 entryCount;
    MapObjectEntry* entry;
    MapObjectWork* wp;

    wp = mobjGetWork();

    entryCount = wp->count;
    entry = wp->entries;
    for (i = 0; i < entryCount; i++, entry++) {
        if((entry->flags & 1) && strcmp(entry->name, name) == 0) {
            break;
        }
    }

    if (i >= entryCount) {
        return NULL;
    }

    return entry;
}

MapObject* mobjHitObjPtrToPtr(HitObj* hitObj) {
    if (hitObj->attributes & (1 << 31)) {
        return hitObj->mapObj;
    }

    return 0;
}

EventEntry* mobjRunEvent(MapObjectEntry* entry, s32* eventCode) {
    EventEntry* event;

    if (eventCode == 0) {
        return NULL;
    }
    if (evtCheckID(entry->eventId)) {
        return NULL;
    }
    
    entry->eventId = 0;
    event = evtEntryType(eventCode, 0x1E, 0, 0x1A);
    event->thisMapObj = entry;
    entry->eventId = event->eventId;

    return event;
}

BOOL mobjGetHint(MapObjectEntry* entry) {
    if (entry == NULL) {
        return 0;
    }
    return (entry->flags >> 5) & 1;
}

BOOL mobjCheckExec() {
    MapObjectWork * wp;
    int i;
    MapObjectEntry* entry;

    wp = mobjGetWork();
    for (i = 0, entry = wp->entries; i < wp->count; entry++, i++) {
        if (entry->flags & (1 << 9))
            return TRUE;
    }
    return FALSE;
}

BOOL mobjCheckItemboxOpen(MapObjectEntry * entry) {
    if (strcmp(entry->animName, "MOBJ_TreasureBox") == 0
     || strcmp(entry->animName, "MOBJ_BigTreasureBox") == 0
     || strcmp(entry->animName, "MOBJ_GrayTreasureBox") == 0
     || strcmp(entry->animName, "MOBJ_BlackTreasureBox") == 0) {
        if (entry->unk1DC == 99)
            return 2;
        else
            return 1;
    }
    else {
        return 0;
    }
}

MapObjectEntry* mobjNearDistCheck2(f32 x, f32 y, f32 z, f32 minMagnitude, char ** names) {
    int entryCount;
    Vec pos;
    Vec dist;
    Vec _pos;
    MapObjectEntry* entry;
    MapObjectWork* wp;
    MapObjectEntry* ret;
    int i;
    float mag;
    char** j;

    wp = mobjGetWork();
    entryCount = wp->count;
    entry = wp->entries;
    ret = NULL;
    
    _pos = (Vec) {0.0f, 0.0f, 0.0f};
    _pos.x = x;
    _pos.y = y;
    _pos.z = z;
    pos = _pos;

    for (i = 0; i < entryCount; i++, entry++) {
        if ((entry->flags & 1) == 0) continue;

        j = names;
        while(*j != NULL) {
            if (strcmp(entry->animName, *j) == 0) {
                if (strcmp(entry->animName, "MOBJ_TreasureBox") == 0
                || strcmp(entry->animName, "MOBJ_BigTreasureBox") == 0
                || strcmp(entry->animName, "MOBJ_GrayTreasureBox") == 0
                || strcmp(entry->animName, "MOBJ_BlackTreasureBox") == 0) {
                    if (mobjCheckItemboxOpen(entry) != 1) {
                        j++;
                        continue;
                    }
                }
                else if (strcmp(entry->animName, "MOBJ_KururinFloor") == 0) {
                    if (mobjCheckKururingFloorItem(entry) != 2) {
                        j++;
                        continue;
                    }
                }
                
                PSVECSubtract(&entry->position, &pos, &dist);
                mag = PSVECMag(&dist);
                if (mag < minMagnitude) {
                    minMagnitude = mag;
                    ret = entry;
                    break;
                }
                break;
            }
            j++;
        }
    }

    return ret;
}
