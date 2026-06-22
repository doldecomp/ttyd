#include "driver/hitdrv.h"
#include "dolphin/os.h"
#include "driver/mapdrv.h"
#include "memory.h"
#include "party.h"
#include <string.h>

/*
    00012b2c 000004 8001810c  4 hitInit 	hitdrv.o
    00012a94 000098 80018074  4 hitReInit 	hitdrv.o
    0001260c 000488 80017bec  4 _hitEnt 	hitdrv.o
    00012394 000278 80017974  4 hitEntrySub 	hitdrv.o
    000122fc 000098 800178dc  4 hitEntry 	hitdrv.o
    0001228c 000070 8001786c  4 hitEntryMOBJ 	hitdrv.o
    000121e8 0000a4 800177c8  4 hitDelete 	hitdrv.o
    00011fc4 000224 800175a4  4 hitMain 	hitdrv.o
    00011ef0 0000d4 800174d0  4 hitObjFlagOn 	hitdrv.o
    00011e1c 0000d4 800173fc  4 hitObjFlagOff 	hitdrv.o
    00011b0c 000310 800170ec  4 hitFlgOn 	hitdrv.o
    000117f4 000318 80016dd4  4 hitFlgOff 	hitdrv.o
    0001171c 0000d8 80016cfc  4 hitGrpFlagOn 	hitdrv.o
    00011644 0000d8 80016c24  4 hitGrpFlagOff 	hitdrv.o
    00011570 0000d4 80016b50  4 hitObjAttrOn 	hitdrv.o
    0001149c 0000d4 80016a7c  4 hitObjAttrOff 	hitdrv.o
    0001118c 000310 8001676c  4 hitAtrOn 	hitdrv.o
    00010e78 000314 80016458  4 hitAtrOff 	hitdrv.o
    00010da0 0000d8 80016380  4 hitGrpAttrOn 	hitdrv.o
    00010cc8 0000d8 800162a8  4 hitGrpAttrOff 	hitdrv.o
    00010c68 000060 80016248  4 hitReCalcMatrix 	hitdrv.o
    000107bc 0004ac 80015d9c  4 hitReCalcMatrix2 	hitdrv.o
    00010308 0004b4 800158e8  4 hitCalcVtxPosition 	hitdrv.o
    0000f878 000a90 80014e58  4 hitCheckVecFilter 	hitdrv.o
    0000f750 000128 80014d30  4 hitCheckFilter 	hitdrv.o
    0000f3a4 0003ac 80014984  4 checkTriVec_xz 	hitdrv.o
    0000f2c0 0000e4 800148a0  4 hitCheckVecHitObjXZ 	hitdrv.o
    0000f2a8 000018 80014888  4 chkFilterAttr 	hitdrv.o
    0000f174 000134 80014754  4 hitCheckAttr 	hitdrv.o
    UNUSED   00002c ........ chkFilterAttr2 hitdrv.o
    UNUSED   000138 ........ hitCheckAttrOnly hitdrv.o
    0000ec18 00055c 800141f8  4 hitCheckSphereFilter 	hitdrv.o
    UNUSED   000088 ........ hitPreCheck hitdrv.o
    0000eb68 0000b0 80014148  4 hitNameToPtr 	hitdrv.o
    0000e5fc 00056c 80013bdc  4 hitObjGetPosSub 	hitdrv.o
    0000e4ac 000150 80013a8c  4 hitObjGetPos 	hitdrv.o
    0000e3d4 0000d8 800139b4  4 hitObjGetNormal 	hitdrv.o
    0000e3b8 00001c 80013998  4 hitGetName 	hitdrv.o
    0000e3a0 000018 80013980  4 hitGetAttr 	hitdrv.o
    0000e054 00034c 80013634  4 hitDamageReturnSet 	hitdrv.o
    0000df8c 0000c8 8001356c  4 hitGrpDamageReturnSet 	hitdrv.o
    0000df80 00000c 80013560  4 hitGetDamageReturnPos 	hitdrv.o
    0000de88 0000f8 80013468  4 hitBindMapObj 	hitdrv.o
    0000dd7c 00010c 8001335c  4 hitBindUpdate 	hitdrv.o
    UNUSED   0006a4 ........ dbg_hitObjDisp hitdrv.o
    UNUSED   00022c ........ bounding_sphere hitdrv.o
    UNUSED   000528 ........ bounding_box hitdrv.o
    UNUSED   000038 ........ hitGetEntNum hitdrv.o
    UNUSED   00004c ........ hitNumberToPtr hitdrv.o
    0000dd7c 005e1c 8001335c  1 .text 	hitdrv.o
*/

HitEntry* lbl_80418408; // TODO: proper name

// local prototypes
void hitReCalcMatrix2(HitEntry* hit, Mtx mtx, BOOL recursion);
s16 hitCalcVtxPosition(HitEntry* hit);

inline BOOL tempfunc(HitCheckQuery* query, HitVector* vector);
inline BOOL tempfunc2(HitCheckQuery* query, HitVector* vector);
inline BOOL tempfunc3(HitCheckQuery* query, HitVector* vector);
BOOL checkTriVec_xz(HitCheckQuery* query, HitVector* vector);
BOOL chkFilterAttr(HitCheckQuery* query, HitEntry* entry);
void hitObjGetPosSub(HitEntry* hit, Vec* position, s32* counter, BOOL recursion);
void hitDamageReturnSet(HitEntry* hit, HitDamageReturn* damage, BOOL recursion);
s32 hitGetEntNum(HitEntry* hitObject);

void hitInit(void) {
    ; // stubbed in retail
}

void hitReInit(void) {
    MapEntry* entry;
    MapWork* wp;
    s32 j;
    s32 i;
    HitEntry* hit;

    wp = mapGetWork();
    entry = wp->entries;
    for (i = 0; i < wp->entries->count; entry++, i++) {
        hit = entry->hitEntries;
        if (hit != NULL) {
            for (j = 0; j < entry->hitNumJoints; j++, hit++) {
                if (hit->vectors != NULL) {
                    _mapFree(hit->vectors);
                }
            }
            _mapFree(entry->hitEntries);
            entry->hitEntries = NULL;
            entry->hitNumJoints = 0;
        }
    }
}

// This function is cursed, managed to hit 99% - https://decomp.me/scratch/FjwSA
HitEntry* _hitEnt(MapFileJoint* joint, HitEntry* parent, Mtx parentMtx, s32 mapIndex) {
    MapWork* wp = mapGetWork();
    HitEntry* hit = wp->entries[mapIndex].hitEntries;
    Mtx trans, scale, rotX, rotY, rotZ;
    Vec vtmp;
    s32 i;

    for (i = 0; i < wp->entries[mapIndex].hitNumJoints; hit++, i++) {
        if (!hit->joint) {
            break;
        }
    }

    hit->flags = 0;
    hit->joint = joint;
    hit->mapIndex = mapIndex;

    MTXTrans(trans, joint->translation.x, joint->translation.y, joint->translation.z);
    MTXScale(scale, joint->scale.x, joint->scale.y, joint->scale.z);
    MTXRotRad(rotX, 'x', MTXDegToRad(joint->rotation.x));
    MTXRotRad(rotY, 'y', MTXDegToRad(joint->rotation.y));
    MTXRotRad(rotZ, 'z', MTXDegToRad(joint->rotation.z));
    MTXConcat(trans, rotZ, trans);
    MTXConcat(trans, rotY, trans);
    MTXConcat(trans, rotX, trans);
    MTXConcat(trans, scale, hit->localMtx);
    MTXConcat(parentMtx, hit->localMtx, hit->worldMtx);

    hit->parent = parent;
    hit->sibling = NULL;
    hit->child = NULL;
    hit->vectors = NULL;

    if (joint->drawMode != NULL) {
        hit->attributes = joint->drawMode->unk8;
    } else {
        hit->attributes = 0;
    }

    if (joint->partCount) {
        VECAdd(&joint->bboxMin, &joint->bboxMax, &hit->centerLocal);
        VECScale(&hit->centerLocal, &hit->centerLocal, 0.5f);
    } else {
        hit->centerLocal = joint->translation;
    }
    MTXMultVec(hit->worldMtx, &hit->centerLocal, &hit->centerWorld);

    joint->bboxMin.x -= 0.1f;
    joint->bboxMin.y -= 0.1f;
    joint->bboxMin.z -= 0.1f;
    joint->bboxMax.x += 0.1f;
    joint->bboxMax.y += 0.1f;
    joint->bboxMax.z += 0.1f;

    MTXMultVec(hit->worldMtx, &hit->joint->bboxMax, &vtmp);
    hit->radius = PSVECDistance(&vtmp, &hit->centerWorld);

    {
        s32 numVectors, j, k;
        s32 partIdx;
        for (numVectors = 0, partIdx = 0; partIdx < hit->joint->partCount; partIdx++) {
            MapFileMesh* mesh = hit->joint->parts[partIdx].mesh;
            if (mesh == NULL) {
                continue;
            }

            if (!mesh->isPackedDisplay) {
                for (j = 0; j < mesh->displayListCount; j++) {
                    numVectors += *mesh->displayLists.normalLists[j] - 2;
                }
            } else {
                for (k = 0; k < mesh->displayListCount; k++) {
                    numVectors += *(u16*)((u8*)mesh->displayLists.packedLists[k].offset + 1) - 2;
                }
            }
        }

        if (numVectors > 0) {
            hit->vectors = _mapAlloc(sizeof(HitVector) * numVectors);
            hit->unkA8 = hitCalcVtxPosition(hit);
        }
    }
    return hit;
}

HitEntry* hitEntrySub(MapFileJoint* joint, HitEntry* parent, Mtx parentMtx, BOOL ignoreSiblings, s32 mapIndex) {
    HitEntry* entry = _hitEnt(joint, parent, parentMtx, mapIndex);
    if (joint->child != NULL) {
        entry->child = hitEntrySub(joint->child, entry, entry->worldMtx, FALSE, mapIndex);
    }
    if (!ignoreSiblings && joint->next != NULL) {
        entry->sibling = hitEntrySub(joint->next, parent, parentMtx, FALSE, mapIndex);
    }
    return entry;
}

HitEntry* hitEntry(MapFileJoint* root, Mtx rootMtx, s32 mapIndex) {
    MapWork* wp = mapGetWork();
    u32 size;

    wp->entries[mapIndex].hitNumJoints = mapGetJoints(root);
    size = OSRoundUp32B(((wp->entries[mapIndex].hitNumJoints + 128) * sizeof(HitEntry)));
    wp->entries[mapIndex].hitEntries = _mapAlloc(size);
    memset(wp->entries[mapIndex].hitEntries, 0, size);
    return hitEntrySub(root, NULL, rootMtx, TRUE, mapIndex);
}

HitEntry* hitEntryMOBJ(MapFileJoint* joint, Mtx mtx) {
    MapWork* wp = mapGetWork();

    wp->entries[0].hitNumJoints += mapGetJoints(joint);
    return hitEntrySub(joint, NULL, mtx, TRUE, 0);
}

void hitReCalcMatrix(HitEntry* hit, Mtx mtx) {
    Vec world;

    hit->flags |= 0x40;
    hitReCalcMatrix2(hit, mtx, FALSE);
    MTXMultVec(hit->worldMtx, &hit->joint->bboxMax, &world);
    hit->radius = PSVECDistance(&world, &hit->centerWorld);
}

void hitReCalcMatrix2(HitEntry* hit, Mtx mtx, BOOL recursion) {
    int var_r3_3;

    var_r3_3 = 0;
    if (hit->flags & 0x40) {
        var_r3_3 = 1;
    }
    if (recursion != 0) {
        var_r3_3 = 1;
    }
    if (var_r3_3 != 0) {
        if (hit->flags & 0x10) {
            PSMTXConcat(mtx, hit->unk6C, hit->worldMtx);
        } else {
            PSMTXConcat(mtx, hit->localMtx, hit->worldMtx);
        }
        if (hit->flags & 0x20) {
            PSMTXConcat(hit->worldMtx, hit->mapObj->unkAC, hit->worldMtx);
        }
        PSMTXMultVec(hit->worldMtx, &hit->centerLocal, &hit->centerWorld);
        hitCalcVtxPosition(hit);
        hit->flags &= ~0x40;
        if (hit->child != NULL) {
            hitReCalcMatrix2(hit->child, hit->worldMtx, TRUE);
        }
        if (hit->sibling != NULL) {
            hitReCalcMatrix2(hit->sibling, mtx, recursion);
        }
    } else {
        if (hit->child != NULL) {
            hitReCalcMatrix2(hit->child, hit->worldMtx, recursion);
        }
        if (hit->sibling != NULL) {
            hitReCalcMatrix2(hit->sibling, mtx, recursion);
        }
    }
}

#pragma dont_inline on
s16 hitCalcVtxPosition(HitEntry* hit) {
    // TODO
}
#pragma dont_inline reset

inline BOOL tempfunc(HitCheckQuery* query, HitVector* vector) {
    Vec sp80;
    Vec sp8C;
    Vec sp98;
    f32 dotProduct;
    f32 temp_f2;

    PSVECSubtract(&query->targetPos, &vector->v0, &sp80);
    dotProduct = PSVECDotProduct(&vector->normal, &sp80);
    if (query->singleSided) {
        if (dotProduct < 0.0f) {
            return 0;
        }
        if (((sp80.z * vector->edge0.x) - (sp80.x * vector->edge0.z)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &sp8C);
        if (((sp8C.z * vector->edge1.x) - (sp8C.x * vector->edge1.z)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &sp98);
        if (((sp98.z * vector->edge2.x) - (sp98.x * vector->edge2.z)) < 0.0f) {
            return 0;
        }
    } else {
        if ((vector->normal.y * dotProduct) <= 0.0f) {
            return 0;
        }
        if ((dotProduct * ((sp80.z * vector->edge0.x) - (sp80.x * vector->edge0.z))) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &sp8C);
        if ((dotProduct * ((sp8C.z * vector->edge1.x) - (sp8C.x * vector->edge1.z))) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &sp98);
        if ((dotProduct * ((sp98.z * vector->edge2.x) - (sp98.x * vector->edge2.z))) < 0.0f) {
            return 0;
        }
    }
    temp_f2 = -vector->normal.y;
    if ((query->targetDistance >= 0.0f) && ((-dotProduct / temp_f2) >= query->targetDistance)) {
        return 0;
    }
    query->targetDistance = -dotProduct / temp_f2;
    query->hitPos.x = query->targetPos.x;
    query->hitPos.y = query->targetPos.y - query->targetDistance;
    query->hitPos.z = query->targetPos.z;
    if (dotProduct >= 0.0f) {
        query->hitNormal = vector->normal;
    } else {
        PSVECScale(&vector->normal, &query->hitNormal, -1.0f);
    }
    return 1;
}

inline BOOL tempfunc2(HitCheckQuery* query, HitVector* vector) {
    Vec sp5C;
    Vec sp68;
    Vec sp74;
    f32 dotProduct;
    f32 temp_f2;

    PSVECSubtract(&query->targetPos, &vector->v0, &sp5C);
    dotProduct = PSVECDotProduct(&vector->normal, &sp5C);
    if (query->singleSided) {
        if (dotProduct < 0.0f) {
            return 0;
        }
        if (((sp5C.z * vector->edge0.x) - (sp5C.x * vector->edge0.z)) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &sp68);
        if (((sp68.z * vector->edge1.x) - (sp68.x * vector->edge1.z)) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &sp74);
        if (((sp74.z * vector->edge2.x) - (sp74.x * vector->edge2.z)) > 0.0f) {
            return 0;
        }
    } else {
        if ((vector->normal.y * dotProduct) >= 0.0f) {
            return 0;
        }
        if ((dotProduct * ((sp5C.z * vector->edge0.x) - (sp5C.x * vector->edge0.z))) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &sp68);
        if ((dotProduct * ((sp68.z * vector->edge1.x) - (sp68.x * vector->edge1.z))) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &sp74);
        if ((dotProduct * ((sp74.z * vector->edge2.x) - (sp74.x * vector->edge2.z))) > 0.0f) {
            return 0;
        }
    }
    temp_f2 = vector->normal.y;
    if ((query->targetDistance >= 0.0f) && ((-dotProduct / temp_f2) >= query->targetDistance)) {
        return 0;
    }
    query->targetDistance = -dotProduct / temp_f2;
    query->hitPos.x = query->targetPos.x;
    query->hitPos.y = query->targetPos.y + query->targetDistance;
    query->hitPos.z = query->targetPos.z;
    if (dotProduct >= 0.0f) {
        query->hitNormal = vector->normal;
    } else {
        PSVECScale(&vector->normal, &query->hitNormal, -1.0f);
    }
    return 1;
}

inline BOOL tempfunc3(HitCheckQuery* query, HitVector* vector) {
    Vec sp8;
    Vec sp14;
    Vec sp20;
    Vec sp2C;
    Vec sp38;
    Vec sp44;
    Vec sp50;
    f32 dotProduct;
    f32 var_f27;

    PSVECSubtract(&query->targetPos, &vector->v0, &sp8);
    dotProduct = PSVECDotProduct(&vector->normal, &sp8);
    if (query->singleSided) {
        if (dotProduct < 0.0f) {
            return 0;
        }
        PSVECCrossProduct(&query->targetDir, &vector->edge0, &sp2C);
        if (PSVECDotProduct(&sp8, &sp2C) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &sp14);
        PSVECCrossProduct(&query->targetDir, &vector->edge1, &sp38);
        if (PSVECDotProduct(&sp14, &sp38) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &sp20);
        PSVECCrossProduct(&query->targetDir, &vector->edge2, &sp44);
        if (PSVECDotProduct(&sp20, &sp44) < 0.0f) {
            return 0;
        }
        var_f27 = PSVECDotProduct(&vector->normal, &query->targetDir);
    } else {
        var_f27 = PSVECDotProduct(&vector->normal, &query->targetDir);
        if ((var_f27 * dotProduct) >= 0.0f) {
            return 0;
        }
        PSVECCrossProduct(&query->targetDir, &vector->edge0, &sp2C);
        if ((dotProduct * PSVECDotProduct(&sp8, &sp2C)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &sp14);
        PSVECCrossProduct(&query->targetDir, &vector->edge1, &sp38);
        if ((dotProduct * PSVECDotProduct(&sp14, &sp38)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &sp20);
        PSVECCrossProduct(&query->targetDir, &vector->edge2, &sp44);
        if ((dotProduct * PSVECDotProduct(&sp20, &sp44)) < 0.0f) {
            return 0;
        }
    }

    if ((query->targetDistance >= 0.0f) && ((-dotProduct / var_f27) >= query->targetDistance)) {
        return 0;
    }
    query->targetDistance = -dotProduct / var_f27;
    PSVECScale(&query->targetDir, &sp50, query->targetDistance);
    PSVECAdd(&query->targetPos, &sp50, &query->hitPos);
    if (dotProduct >= 0.0f) {
        query->hitNormal = vector->normal;
    } else {
        PSVECScale(&vector->normal, &query->hitNormal, -1.0f);
    }
    return 1;
}

HitEntry* hitCheckVecFilter(HitCheckQuery* query, HitFilterCallback callback) { // 1:1
    f32 temp;
    HitVector* vector;
    Vec position;
    Vec spBC;
    Vec normal;
    Vec spA4;
    HitEntry* var_r29;
    HitEntry* var_r28;
    int i;
    f32 distance;
    f32 var_f29;
    HitVector* var_r31;
    f32 temp_f28;

    mapGetWork();
    var_r28 = NULL;
    if (!PSVECSquareMag(&query->targetDir)) {
        return NULL;
    }
    var_f29 = -1.0f;
    temp = 0.5f;
    temp_f28 = query->targetDistance * temp;
    PSVECScale(&query->targetDir, &spA4, temp_f28);
    PSVECAdd(&query->targetPos, &spA4, &spA4);
    var_r29 = lbl_80418408;
    if (query->targetDir.y == 0.0f) {
        while (var_r29 != NULL) {
            if (callback == NULL || callback(query, var_r29)) {
                if (!(PSVECDistance(&spA4, &var_r29->centerWorld) > temp_f28 + var_r29->radius)) {
                    if (var_r29->joint->drawMode->cullMode == 1) {
                        query->singleSided = 1;
                    } else {
                        query->singleSided = 0;
                    }
                    var_r31 = var_r29->vectors;
                    for (i = 0; i < var_r29->unkA8; i++, var_r31++) {
                        if ((query->singleSided == 0) ||
                            !(PSVECDotProduct(&var_r31->normal, &query->targetDir) >= 0.0f)) {
                            if (checkTriVec_xz(query, var_r31) && (var_f29 < 0.0f || var_f29 > query->targetDistance)) {
                                var_f29 = query->targetDistance;
                                var_r28 = var_r29;
                                distance = var_f29;
                                position = query->hitPos;
                                spBC = query->hitNormal;
                            }
                        }
                    }
                }
            }
            var_r29 = var_r29->siblingActive;
        }
    } else if (query->targetDir.x == 0.0f && query->targetDir.z == 0.0f) {
        if (query->targetDir.y == -1.0f) {
            while (var_r29 != NULL) {
                if (callback == NULL || callback(query, var_r29)) {
                    if (!(PSVECDistance(&spA4, &var_r29->centerWorld) > temp_f28 + var_r29->radius)) {
                        if (var_r29->joint->drawMode->cullMode == 1) {
                            query->singleSided = 1;
                        } else {
                            query->singleSided = 0;
                        }
                        vector = var_r29->vectors;
                        for (i = 0; i < var_r29->unkA8; i++, vector++) {
                            if (query->singleSided == 0 || !(vector->normal.y <= 0.0f)) {
                                if (tempfunc(query, vector) && (var_f29 < 0.0f || var_f29 > query->targetDistance)) {
                                    var_f29 = query->targetDistance;
                                    var_r28 = var_r29;
                                    distance = var_f29;
                                    position = query->hitPos;
                                    spBC = query->hitNormal;
                                }
                            }
                        }
                    }
                }
                var_r29 = var_r29->siblingActive;
            }
        } else if (query->targetDir.y == 1.0f) {
            while (var_r29 != NULL) {
                if (callback == NULL || callback(query, var_r29)) {
                    if (!(PSVECDistance(&spA4, &var_r29->centerWorld) > temp_f28 + var_r29->radius)) {
                        if (var_r29->joint->drawMode->cullMode == 1) {
                            query->singleSided = 1;
                        } else {
                            query->singleSided = 0;
                        }
                        vector = var_r29->vectors;
                        for (i = 0; i < var_r29->unkA8; i++, vector++) {
                            if (query->singleSided == 0 || !(vector->normal.y >= 0.0f)) {
                                if (tempfunc2(query, vector) && (var_f29 < 0.0f || var_f29 > query->targetDistance)) {
                                    var_f29 = query->targetDistance;
                                    var_r28 = var_r29;
                                    distance = var_f29;
                                    position = query->hitPos;
                                    spBC = query->hitNormal;
                                }
                            }
                        }
                    }
                }
                var_r29 = var_r29->siblingActive;
            }
        } else {
            goto label_235;
        }
    } else {
    label_235:
        while (var_r29 != NULL) {
            if (callback == NULL || callback(query, var_r29)) {
                if (!(PSVECDistance(&spA4, &var_r29->centerWorld) > (temp_f28 + var_r29->radius))) {
                    if (var_r29->joint->drawMode->cullMode == 1) {
                        query->singleSided = 1;
                    } else {
                        query->singleSided = 0;
                    }
                    vector = var_r29->vectors;
                    for (i = 0; i < var_r29->unkA8; i++, vector++) {
                        if (query->singleSided == 0 || !(PSVECDotProduct(&vector->normal, &query->targetDir) >= 0.0f)) {
                            if (tempfunc3(query, vector) && (var_f29 < 0.0f || var_f29 > query->targetDistance)) {
                                var_f29 = query->targetDistance;
                                var_r28 = var_r29;
                                distance = var_f29;
                                position = query->hitPos;
                                spBC = query->hitNormal;
                            }
                        }
                    }
                }
            }
            var_r29 = var_r29->siblingActive;
        }
    }
    if (var_r28 == NULL) {
        return NULL;
    }
    PSVECNormalize(&spBC, &normal);
    query->targetDistance = distance;
    query->hitPos = position;
    query->hitNormal = normal;
    return var_r28;
}

HitEntry* hitCheckFilter(HitFilterCallback callback, f32* hitX, f32* hitY, f32* hitZ, f32* distance, f32* hitNX,
                         f32* hitNY, f32* hitNZ, f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz) { // 1:1
    HitCheckQuery temp;
    HitCheckQuery* query = &temp;
    HitEntry* entry;

    query->targetPos = (Vec){ x, y, z };
    query->targetDir = (Vec){ nx, ny, nz };
    query->targetDistance = *distance;
    entry = hitCheckVecFilter(query, callback);
    if (entry == NULL) {
        return NULL;
    }
    *distance = query->targetDistance;
    *hitX = query->hitPos.x;
    *hitY = query->hitPos.y;
    *hitZ = query->hitPos.z;
    *hitNX = query->hitNormal.x;
    *hitNY = query->hitNormal.y;
    *hitNZ = query->hitNormal.z;
    return entry;
}

BOOL checkTriVec_xz(HitCheckQuery* query, HitVector* vector) {
    Vec v1, v2, v3;
    f32 cosAngle;
    f32 distToTrianglePlane;

    PSVECSubtract(&query->targetPos, &vector->v0, &v1);
    distToTrianglePlane = PSVECDotProduct(&vector->normal, &v1);
    if (query->singleSided != 0) {
        if (distToTrianglePlane < 0.0f) {
            return FALSE;
        }
        if ((v1.x * (-vector->edge0.y * query->targetDir.z)) +
                (v1.y * ((vector->edge0.x * query->targetDir.z) - (vector->edge0.z * query->targetDir.x))) +
                (v1.z * (vector->edge0.y * query->targetDir.x)) <
            0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &v2);
        if ((v2.x * (-vector->edge1.y * query->targetDir.z)) +
                (v2.y * ((vector->edge1.x * query->targetDir.z) - (vector->edge1.z * query->targetDir.x))) +
                (v2.z * (vector->edge1.y * query->targetDir.x)) <
            0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &v3);
        if ((v3.x * (-vector->edge2.y * query->targetDir.z)) +
                (v3.y * ((vector->edge2.x * query->targetDir.z) - (vector->edge2.z * query->targetDir.x))) +
                (v3.z * (vector->edge2.y * query->targetDir.x)) <
            0.0f) {
            return FALSE;
        }
    } else {
        if (((vector->normal.x * query->targetDir.x) + (vector->normal.z * query->targetDir.z)) * distToTrianglePlane >=
            0.0f) {
            return FALSE;
        }
        if (((v1.x * (-vector->edge0.y * query->targetDir.z)) +
             (v1.y * ((vector->edge0.x * query->targetDir.z) - (vector->edge0.z * query->targetDir.x))) +
             (v1.z * (vector->edge0.y * query->targetDir.x))) *
                distToTrianglePlane <
            0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->v1, &v2);
        if (((v2.x * (-vector->edge1.y * query->targetDir.z)) +
             (v2.y * ((vector->edge1.x * query->targetDir.z) - (vector->edge1.z * query->targetDir.x))) +
             (v2.z * (vector->edge1.y * query->targetDir.x))) *
                distToTrianglePlane <
            0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->v2, &v3);
        if (((v3.x * (-vector->edge2.y * query->targetDir.z)) +
             (v3.y * ((vector->edge2.x * query->targetDir.z) - (vector->edge2.z * query->targetDir.x))) +
             (v3.z * (vector->edge2.y * query->targetDir.x))) *
                distToTrianglePlane <
            0.0f) {
            return FALSE;
        }
    }
    cosAngle = (vector->normal.x * query->targetDir.x) + (vector->normal.z * query->targetDir.z);
    if (query->targetDistance >= 0.0f && -distToTrianglePlane / cosAngle >= query->targetDistance) {
        return FALSE;
    }
    query->targetDistance = -distToTrianglePlane / cosAngle;
    query->hitPos.x = query->targetPos.x + (query->targetDir.x * query->targetDistance);
    query->hitPos.y = query->targetPos.y;
    query->hitPos.z = query->targetPos.z + (query->targetDir.z * query->targetDistance);
    if (distToTrianglePlane >= 0.0f) {
        query->hitNormal = vector->normal;
    } else {
        PSVECScale(&vector->normal, &query->hitNormal, -1.0f);
    }
    return TRUE;
}

BOOL hitCheckVecHitObjXZ(HitCheckQuery* query, HitEntry* entry) { // 1:1
    int i;
    HitVector* vector;

    if (entry->joint->drawMode->cullMode == 1) {
        query->singleSided = 1;
    } else {
        query->singleSided = 0;
    }
    vector = entry->vectors;
    for (i = 0; i < entry->unkA8; i++, vector++) {
        if ((query->singleSided == 0 || !(PSVECDotProduct(&vector->normal, &query->targetDir) >= 0.0f)) &&
            checkTriVec_xz(query, vector)) {
            return 1;
        }
    }
    return 0;
}

BOOL chkFilterAttr(HitCheckQuery* query, HitEntry* entry) { // 1:1
    return (entry->attributes & query->user0) == 0;
}

HitEntry* hitCheckAttr(s32 user0, f32* hitX, f32* hitY, f32* hitZ, f32* distance, f32* hitNX, f32* hitNY, f32* hitNZ,
                       f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz) { // 1:1
    HitCheckQuery temp;
    HitCheckQuery* query = &temp;
    HitEntry* entry;

    query->targetPos = (Vec){ x, y, z };
    query->targetDir = (Vec){ nx, ny, nz };
    query->targetDistance = *distance;
    query->user0 = user0;
    entry = hitCheckVecFilter(query, chkFilterAttr);
    if (entry == NULL) {
        return NULL;
    }
    *distance = query->targetDistance;
    *hitX = query->hitPos.x;
    *hitY = query->hitPos.y;
    *hitZ = query->hitPos.z;
    *hitNX = query->hitNormal.x;
    *hitNY = query->hitNormal.y;
    *hitNZ = query->hitNormal.z;
    return entry;
}

HitEntry* hitCheckSphereFilter(HitFilterCallback callback, f32 x, f32 y, f32 z,
                               f32 distance) { // almost 1:1, stubborn regalloc
    MapWork* wp = mapGetWork();
    MapEntry* var_r31 = wp->entries;
    MapEntry* map;
    Vec sp68;
    int j;
    HitEntry* temp_r27;
    HitEntry* var_r23;
    HitVector* vector;
    f32 var_f28;
    f32 temp_f1;
    f32 var_f30;
    f32 var_f31;
    s32 entryId;
    s32 objectId;
    s32 var_r29;
    HitCheckQuery temp;
    HitCheckQuery* query;
    int i;

    var_f28 = -1.0f;
    objectId = -1;
    query = &temp;
    sp68 = (Vec){ x, y, z };
    for (i = 0; i < var_r31->count; var_r31++, i++) {
        var_r23 = var_r31->hitEntries;
        for (j = 0; j < var_r31->hitNumJoints; j++, var_r23++) {
            if ((var_r23->attributes & 0x80000000) && (var_r23->joint->partCount != 0)) {
                var_r29 = var_r23->flags;
                if (!(var_r29 & 1) && !(var_r29 & 0x80)) {
                    temp_f1 = PSVECDistance(&sp68, &var_r23->centerWorld);
                    if (!(temp_f1 > (distance + var_r23->radius))) {
                        if (callback == NULL || callback(query, var_r23)) {
                            if (var_f28 < 0.0f || var_f28 > temp_f1) {
                                var_f28 = temp_f1;
                                var_f31 = var_r23->radius;
                                objectId = j;
                                entryId = i;
                            }
                        }
                    }
                }
            }
        }
    }
    if (objectId < 0) {
        return 0;
    }
    if (var_f28 < (0.5f * var_f31)) {
        return &wp->entries[entryId].hitEntries[objectId];
    }
    map = &wp->entries[entryId];
    temp_r27 = &map->hitEntries[objectId];
    PSVECSubtract(&temp_r27->centerWorld, &sp68, &query->targetDir);
    PSVECNormalize(&query->targetDir, &query->targetDir);
    var_f30 = -1.0f;
    var_r29 = -1;
    query->targetPos = sp68;
    query->targetDistance = distance;
    if (temp_r27->joint->drawMode->cullMode == 1) {
        query->singleSided = 1;
    } else {
        query->singleSided = 0;
    }
    vector = temp_r27->vectors;
    for (i = 0; i < temp_r27->unkA8; i++, vector++) {
        if ((query->singleSided == 0) || !(PSVECDotProduct(&vector->normal, &query->targetDir) >= 0.0f)) {
            if (tempfunc3(query, vector) && ((var_f30 < 0.0f) || (var_f30 > query->targetDistance))) {
                var_f30 = query->targetDistance;
                var_r29 = 1;
            }
        }
    }
    if (var_f30 > distance) {
        return 0;
    }
    if (var_r29 < 0) {
        return 0;
    }
    return &map->hitEntries[objectId];
}

HitEntry* hitNameToPtr(const char* name) { // 1:1
    MapEntry* map;
    MapWork* wp = mapGetWork();
    int j;
    MapEntry* new_var;
    MapEntry* new_var2;
    int i;
    HitEntry* hit;

    if (name == NULL) {
        return NULL;
    }
    map = wp->entries;
    new_var = map;
    new_var2 = new_var;
    for (i = 0; i < new_var2->count; map++, i++) {
        hit = map->hitEntries;
        for (j = 0; j < map->hitNumJoints; j++, hit++) {
            if (!(hit->flags & 0x80) && !strcmp(hit->joint->name, name)) {
                return hit;
            }
        }
    }

    return NULL;
}

void hitObjGetPosSub(HitEntry* hit, Vec* position, s32* counter, BOOL recursion) { // 1:1, awful inlining
    Vec sp8;

    if (hit->child != NULL) {
        hitObjGetPosSub(hit->child, position, counter, 1);
    } else {
        PSMTXMultVec(hit->worldMtx, &hit->centerLocal, &sp8);
        PSVECAdd(position, &sp8, position);
        (*counter)++;
    }
    if (recursion != 0) {
        if (hit->sibling != NULL) {
            hitObjGetPosSub(hit->sibling, position, counter, 1);
        }
    }
}

void hitObjGetPos(const char* name, Vec* position) { // 1:1
    Vec spC;
    s32 counter;
    HitEntry* hit;

    counter = 0;
    spC = (Vec){ 0.0f, 0.0f, 0.0f };
    hit = hitNameToPtr(name);
    if (hit == NULL) {
        *position = (Vec){ 0.0f, 0.0f, 0.0f };
        return;
    }
    hitObjGetPosSub(hit, &spC, &counter, 0);
    PSVECScale(&spC, position, 1.0f / (f32)counter);
}

void hitObjGetNormal(const char* name, Vec* normal) { // 1:1
    HitEntry* hit;

    hit = hitNameToPtr(name);
    if (hit != NULL && hit->joint->partCount > 0) {
        PSVECNormalize(&hit->vectors->normal, normal);
    }
}

const char* hitGetName(HitEntry* hit) { // 1:1
    MapEntry* map;
    s32 count;
    int i;
    u32 start, size;

    if (hit == NULL) {
        return NULL;
    }
    map = mapGetWork()->entries;
    count = map->count;
    for (i = 0; i < count; map++, i++) {
        start = (u32)map->hitEntries;
        size = OSRoundUp32B((map->hitNumJoints + 0x80) * sizeof(HitEntry));
        if ((u32)hit >= start && (u32)hit < start + size) {
            break;
        }
    }
    if (i >= count) {
        return NULL;
    }
    return hit->joint->name;
}

s32 hitGetAttr(HitEntry* hit) { // 1:1
    return hit != NULL ? hit->attributes : 0;
}

void hitDamageReturnSet(HitEntry* hit, HitDamageReturn* damage, BOOL recursion) { // 1:1
    hit->attributes |= 0x40000000;
    hit->damage = damage;
    if (hit->child != NULL) {
        hitDamageReturnSet(hit->child, damage, TRUE);
    }
    if (recursion != 0) {
        if (hit->sibling != NULL) {
            hitDamageReturnSet(hit->sibling, damage, TRUE);
        }
    }
}

void hitGrpDamageReturnSet(const char* name, HitDamageReturn* damage) { // 1:1
    HitEntry* hit;

    hit = hitNameToPtr(name);
    if (hit != NULL) {
        hitDamageReturnSet(hit, damage, FALSE);
    }
}

Vec* hitGetDamageReturnPos(HitEntry* hit) {
    return &hit->damage->position;
}

void hitBindMapObj(const char* hitName, const char* mapobjName) {
    HitEntry* hit;
    MapObject* mapObj;

    hit = hitNameToPtr(hitName);
    mapObj = mapGetMapObj(mapobjName);
    if (mapObj == NULL) {
        mapErrorEntry(0, mapobjName);
        return;
    }
    if (hit == NULL) {
        mapErrorEntry(1, hitName);
        return;
    }
    hit->mapObj = mapObj;
    hit->flags |= 0x20;
}

void hitBindUpdate(const char* name) {
    HitEntry* parent;
    HitEntry* hit;
    Mtx mtx;

    hit = hitNameToPtr(name);
    if (hit == NULL) {
        mapErrorEntry(1, name);
        return;
    }
    if (hit->flags & 0x20) {
        parent = hit->parent;
        if (parent != NULL) {
            hitReCalcMatrix(hit, parent->worldMtx);
            return;
        }
        PSMTXScale(mtx, 10.0f, 10.0f, 10.0f);
        hitReCalcMatrix(hit, mtx);
    }
}
/*
s32 hitGetEntNum(HitEntry* hit) {
    s32 numVectors;
    s32 i, j;

    numVectors = 0;
    for (i = 0; i < hit->joint->partCount; i++) {
        MapFileMesh* mesh = hit->joint->parts[i].mesh;
        if (mesh == NULL) {
            continue;
        }

        if (!mesh->isPackedDisplay) {
            DisplayList* dls = (DisplayList*)mesh->displayLists;
            for (j = 0; j < mesh->displayListCount; j++) {
                numVectors += *(u16*)((u8*)dls[j].offset + 1) - 2;
            }
        } else {
            PackedDisplayList* dls = (PackedDisplayList*)mesh->displayLists;
            for (j = 0; j < mesh->displayListCount; j++) {
                numVectors += *(u16*)((u8*)dls[j].offset + 1) - 2;
            }
        }
    }

    return numVectors;
}
*/
