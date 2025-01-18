#include "driver/hitdrv.h"
#include <string.h>

HitEntry* lbl_80418408; //TODO: proper name

//local prototypes
void hitReCalcMatrix2(HitEntry* hit, Mtx mtx, BOOL recursion);
u16 hitCalcVtxPosition(HitEntry* hit);

inline BOOL tempfunc(HitCheckQuery* query, HitVector* vector);
inline BOOL tempfunc2(HitCheckQuery* query, HitVector* vector);
inline BOOL tempfunc3(HitCheckQuery* query, HitVector* vector);
BOOL checkTriVec_xz(HitCheckQuery* query, HitVector* vector);
BOOL chkFilterAttr(HitCheckQuery* query, HitEntry* entry);
void hitObjGetPosSub(HitEntry* hit, Vec* position, s32* counter, BOOL recursion);
void hitDamageReturnSet(HitEntry* hit, HitDamageReturn* damage, BOOL recursion);

void hitInit(void) {
	; //stubbed in retail
}

void hitReInit(void) {
	HitEntry* entry;
	MapEntry* map;
	s32 i, j;

	map = mapGetWork()->entries;
	for (i = 0; i < map->count; i++, map++) {
		entry = map->hitObjects;
		if (entry) {
			for (j = 0; j < map->hitNumJoints; j++) {

			}
		}
	}

}

void hitMain(void) {

}








HitEntry* hitEntry(MapJoint* joint, Mtx mtx, BOOL group) {
	MapWork* wp;
	MapEntry* entry;
	u32 size;

	wp = mapGetWork();
	entry = &wp->entries[group];
	entry->hitNumJoints = mapGetJoints(joint);
	size = OSRoundUp32B(sizeof(HitEntry) * (entry->hitNumJoints + 128));
	memset(entry->hitObjects, 0, size);
	//return hitEntrySub(joint, 0, mtx, 1, group);
}













void hitReCalcMatrix(HitEntry* hit, Mtx mtx) {
    Vec world;

    hit->flags |= 0x40;
    hitReCalcMatrix2(hit, mtx, FALSE);
    MTXMultVec(hit->unkC, &hit->joint->bboxMax, &world);
    hit->unkCC = PSVECDistance(&world, &hit->unkC0);
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
            PSMTXConcat(mtx, hit->unk6C, hit->unkC);
        } else {
            PSMTXConcat(mtx, hit->unk3C, hit->unkC);
        }
        if (hit->flags & 0x20) {
            PSMTXConcat(hit->unkC, hit->mapObj->unkAC, hit->unkC);
        }
        PSMTXMultVec(hit->unkC, &hit->unk9C, &hit->unkC0);
        hitCalcVtxPosition(hit);
        hit->flags &= ~0x40;
        if (hit->child != NULL) {
            hitReCalcMatrix2(hit->child, hit->unkC, TRUE);
        }
        if (hit->next != NULL) {
            hitReCalcMatrix2(hit->next, mtx, recursion);
        }
    } else {
        if (hit->child != NULL) {
            hitReCalcMatrix2(hit->child, hit->unkC, recursion);
        }
        if (hit->next != NULL) {
            hitReCalcMatrix2(hit->next, mtx, recursion);
        }
    }
}





u16 hitCalcVtxPosition(HitEntry* hit) {
    //TODO
}





inline BOOL tempfunc(HitCheckQuery* query, HitVector* vector) {
    Vec sp80;
    Vec sp8C;
    Vec sp98;
    f32 dotProduct;
    f32 temp_f2;
    
    PSVECSubtract(&query->targetPos, &vector->e13, &sp80);
    dotProduct = PSVECDotProduct(&vector->normal, &sp80);
    if (query->singleSided) {
        if (dotProduct < 0.0f) {
            return 0;
        }
        if (((sp80.z * vector->v1.x) - (sp80.x * vector->v1.z)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &sp8C);
        if (((sp8C.z * vector->v2.x) - (sp8C.x * vector->v2.z)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &sp98);
        if (((sp98.z * vector->v3.x) - (sp98.x * vector->v3.z)) < 0.0f) {
            return 0;
        }
    } else {
        if ((vector->normal.y * dotProduct) <= 0.0f) {
            return 0;
        }
        if ((dotProduct * ((sp80.z * vector->v1.x) - (sp80.x * vector->v1.z))) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &sp8C);
        if ((dotProduct * ((sp8C.z * vector->v2.x) - (sp8C.x * vector->v2.z))) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &sp98);
        if ((dotProduct * ((sp98.z * vector->v3.x) - (sp98.x * vector->v3.z))) < 0.0f) {
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
    
    PSVECSubtract(&query->targetPos, &vector->e13, &sp5C);
    dotProduct = PSVECDotProduct(&vector->normal, &sp5C);
    if (query->singleSided) {
        if (dotProduct < 0.0f) {
            return 0;
        }
        if (((sp5C.z * vector->v1.x) - (sp5C.x * vector->v1.z)) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &sp68);
        if (((sp68.z * vector->v2.x) - (sp68.x * vector->v2.z)) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &sp74);
        if (((sp74.z * vector->v3.x) - (sp74.x * vector->v3.z)) > 0.0f) {
            return 0;
        }
    } else {
        if ((vector->normal.y * dotProduct) >= 0.0f) {
            return 0;
        }
        if ((dotProduct * ((sp5C.z * vector->v1.x) - (sp5C.x * vector->v1.z))) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &sp68);
        if ((dotProduct * ((sp68.z * vector->v2.x) - (sp68.x * vector->v2.z))) > 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &sp74);
        if ((dotProduct * ((sp74.z * vector->v3.x) - (sp74.x * vector->v3.z))) > 0.0f) {
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
    
    PSVECSubtract(&query->targetPos, &vector->e13, &sp8);
    dotProduct = PSVECDotProduct(&vector->normal, &sp8);
    if (query->singleSided) {
        if (dotProduct < 0.0f) {
            return 0;
        }
        PSVECCrossProduct(&query->targetDir, &vector->v1, &sp2C);
        if (PSVECDotProduct(&sp8, &sp2C) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &sp14);
        PSVECCrossProduct(&query->targetDir, &vector->v2, &sp38);
        if (PSVECDotProduct(&sp14, &sp38) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &sp20);
        PSVECCrossProduct(&query->targetDir, &vector->v3, &sp44);
        if (PSVECDotProduct(&sp20, &sp44) < 0.0f) {
            return 0;
        }
        var_f27 = PSVECDotProduct(&vector->normal, &query->targetDir);
    } else {
        var_f27 = PSVECDotProduct(&vector->normal, &query->targetDir);
        if ((var_f27 * dotProduct) >= 0.0f) {
            return 0;
        }
        PSVECCrossProduct(&query->targetDir, &vector->v1, &sp2C);
        if ((dotProduct * PSVECDotProduct(&sp8, &sp2C)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &sp14);
        PSVECCrossProduct(&query->targetDir, &vector->v2, &sp38);
        if ((dotProduct * PSVECDotProduct(&sp14, &sp38)) < 0.0f) {
            return 0;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &sp20);
        PSVECCrossProduct(&query->targetDir, &vector->v3, &sp44);
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

HitEntry* hitCheckVecFilter(HitCheckQuery* query, HitFilterCallback callback) { //1:1
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
                if (!(PSVECDistance(&spA4, &var_r29->unkC0) > temp_f28 + var_r29->unkCC)) {
                    if (var_r29->joint->drawMode->cullMode == 1) {
                        query->singleSided = 1;
                    } else {
                        query->singleSided = 0;
                    }
                    var_r31 = var_r29->unkAC;
                    for (i = 0; i < var_r29->unkA8; i++, var_r31++) {
                        if ((query->singleSided == 0) || !(PSVECDotProduct(&var_r31->normal, &query->targetDir) >= 0.0f)) {
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
            var_r29 = var_r29->nextActive;
        }
    } else if (query->targetDir.x == 0.0f && query->targetDir.z == 0.0f) {
        if (query->targetDir.y == -1.0f) {
            while (var_r29 != NULL) {
                if (callback == NULL || callback(query, var_r29)) {
                    if (!(PSVECDistance(&spA4, &var_r29->unkC0) > temp_f28 + var_r29->unkCC)) {
                        if (var_r29->joint->drawMode->cullMode == 1) {
                            query->singleSided = 1;
                        } else {
                            query->singleSided = 0;
                        }
                        vector = var_r29->unkAC;
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
                var_r29 = var_r29->nextActive;
            }
        } else if (query->targetDir.y == 1.0f) {
            while (var_r29 != NULL) {
                if (callback == NULL || callback(query, var_r29)) {
                    if (!(PSVECDistance(&spA4, &var_r29->unkC0) > temp_f28 + var_r29->unkCC)) {
                        if (var_r29->joint->drawMode->cullMode == 1) {
                            query->singleSided = 1;
                        } else {
                            query->singleSided = 0;
                        }
                        vector = var_r29->unkAC;
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
                var_r29 = var_r29->nextActive;
            }
        } else {
            goto label_235;
        }
    } else {
label_235:
        while (var_r29 != NULL) {
            if (callback == NULL || callback(query, var_r29)) {
                if (!(PSVECDistance(&spA4, &var_r29->unkC0) > (temp_f28 + var_r29->unkCC))) {
                    if (var_r29->joint->drawMode->cullMode == 1) {
                        query->singleSided = 1;
                    } else {
                        query->singleSided = 0;
                    }
                    vector = var_r29->unkAC;
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
            var_r29 = var_r29->nextActive;
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

HitEntry* hitCheckFilter(HitFilterCallback callback, f32* hitX, f32* hitY, f32* hitZ, f32* distance,
						f32* hitNX, f32* hitNY, f32* hitNZ, f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz) { //1:1
    HitCheckQuery temp;
    HitCheckQuery* query = &temp;
    HitEntry *entry;
    
    query->targetPos = (Vec){x, y, z};
    query->targetDir = (Vec){nx, ny, nz};
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

    PSVECSubtract(&query->targetPos, &vector->e13, &v1);
    distToTrianglePlane = PSVECDotProduct(&vector->normal, &v1);
    if (query->singleSided != 0) {
        if (distToTrianglePlane < 0.0f) {
            return FALSE;
        }
        if ((v1.x * (-vector->v1.y * query->targetDir.z)) + 
            (v1.y * ((vector->v1.x * query->targetDir.z) - (vector->v1.z * query->targetDir.x))) + 
            (v1.z * (vector->v1.y * query->targetDir.x)) < 0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &v2);
        if ((v2.x * (-vector->v2.y * query->targetDir.z)) + 
            (v2.y * ((vector->v2.x * query->targetDir.z) - (vector->v2.z * query->targetDir.x))) + 
            (v2.z * (vector->v2.y * query->targetDir.x)) < 0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &v3);
        if ((v3.x * (-vector->v3.y * query->targetDir.z)) + 
            (v3.y * ((vector->v3.x * query->targetDir.z) - (vector->v3.z * query->targetDir.x))) + 
            (v3.z * (vector->v3.y * query->targetDir.x)) < 0.0f) {
            return FALSE;
        }
    } else {
        if (((vector->normal.x * query->targetDir.x) + (vector->normal.z * query->targetDir.z)) * distToTrianglePlane >= 0.0f) {
            return FALSE;
        }
        if (((v1.x * (-vector->v1.y * query->targetDir.z)) + 
             (v1.y * ((vector->v1.x * query->targetDir.z) - (vector->v1.z * query->targetDir.x))) + 
             (v1.z * (vector->v1.y * query->targetDir.x))) * distToTrianglePlane < 0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->e21, &v2);
        if (((v2.x * (-vector->v2.y * query->targetDir.z)) + 
             (v2.y * ((vector->v2.x * query->targetDir.z) - (vector->v2.z * query->targetDir.x))) + 
             (v2.z * (vector->v2.y * query->targetDir.x))) * distToTrianglePlane < 0.0f) {
            return FALSE;
        }
        PSVECSubtract(&query->targetPos, &vector->e32, &v3);
        if (((v3.x * (-vector->v3.y * query->targetDir.z)) + 
            (v3.y * ((vector->v3.x * query->targetDir.z) - (vector->v3.z * query->targetDir.x))) + 
            (v3.z * (vector->v3.y * query->targetDir.x))) * distToTrianglePlane < 0.0f) {
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

BOOL hitCheckVecHitObjXZ(HitCheckQuery* query, HitEntry* entry) { //1:1
    int i;
    HitVector* vector;

    if (entry->joint->drawMode->cullMode == 1) {
        query->singleSided = 1;
    } else {
        query->singleSided = 0;
    }
    vector = entry->unkAC;
    for (i = 0; i < entry->unkA8; i++, vector++) {
        if ((query->singleSided == 0 || !(PSVECDotProduct(&vector->normal, &query->targetDir) >= 0.0f)) && checkTriVec_xz(query, vector)) {
            return 1;
        }
    }
    return 0;
}

BOOL chkFilterAttr(HitCheckQuery* query, HitEntry* entry) { //1:1
    return (entry->attributes & query->user0) == 0;
}

HitEntry* hitCheckAttr(s32 user0, f32* hitX, f32* hitY, f32* hitZ, f32* distance, f32* hitNX,
					  f32* hitNY, f32* hitNZ, f32 x, f32 y, f32 z, f32 nx, f32 ny, f32 nz) { //1:1
    HitCheckQuery temp;
    HitCheckQuery* query = &temp;
    HitEntry* entry;


    query->targetPos = (Vec){x, y, z};
    query->targetDir = (Vec){nx, ny, nz};
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

HitEntry* hitCheckSphereFilter(HitFilterCallback callback, f32 x, f32 y, f32 z, f32 distance) { //almost 1:1, stubborn regalloc
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
    sp68 = (Vec){x, y, z};
    for (i = 0; i < var_r31->count; var_r31++, i++) {
        var_r23 = var_r31->hitObjects;
        for (j = 0; j < var_r31->hitNumJoints; j++, var_r23++) {
            if ((var_r23->attributes & 0x80000000) && (var_r23->joint->partCount != 0)) {
                var_r29 = var_r23->flags;
                if (!(var_r29 & 1) && !(var_r29 & 0x80)) {
                    temp_f1 = PSVECDistance(&sp68, &var_r23->unkC0);
                    if (!(temp_f1 > (distance + var_r23->unkCC))) {
                        if (callback == NULL || callback(query, var_r23)) {
                            if (var_f28 < 0.0f || var_f28 > temp_f1) {
                                var_f28 = temp_f1;
                                var_f31 = var_r23->unkCC;
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
        return &wp->entries[entryId].hitObjects[objectId];
    }
    map = &wp->entries[entryId];
    temp_r27 = &map->hitObjects[objectId];
    PSVECSubtract(&temp_r27->unkC0, &sp68, &query->targetDir);
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
    vector = temp_r27->unkAC;
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
    return &map->hitObjects[objectId];
}

HitEntry *hitNameToPtr(const char *name) { //1:1
    MapEntry *map;
    MapWork *wp = mapGetWork();
    int j;
    MapEntry *new_var;
    MapEntry *new_var2;
    int i;
    HitEntry *hit;
    
    if (name == NULL) {
        return NULL;
    }
    map = wp->entries;
    new_var = map;
    new_var2 = new_var;
    for (i = 0; i < new_var2->count; map++, i++) {
        hit = map->hitObjects;
        for (j = 0; j < map->hitNumJoints; j++, hit++) {
            if (!(hit->flags & 0x80) && !strcmp(hit->joint->name, name)) {
                return hit;
            }
        }
    }
    
    return NULL;
}

void hitObjGetPosSub(HitEntry* hit, Vec* position, s32* counter, BOOL recursion) { //1:1, awful inlining
    Vec sp8;

    if (hit->child != NULL) {
        hitObjGetPosSub(hit->child, position, counter, 1);
    } else {
        PSMTXMultVec(hit->unkC, &hit->unk9C, &sp8);
        PSVECAdd(position, &sp8, position);
        (*counter)++;
    }
    if (recursion != 0) {
        if (hit->next != NULL) {
            hitObjGetPosSub(hit->next, position, counter, 1);
        }
    }
}

void hitObjGetPos(const char* name, Vec* position) { //1:1
    Vec spC;
    s32 counter;
    HitEntry* hit;

    counter = 0;
    spC = (Vec){0.0f, 0.0f, 0.0f};
    hit = hitNameToPtr(name);
    if (hit == NULL) {
        *position = (Vec){0.0f, 0.0f, 0.0f};
        return;
    }
    hitObjGetPosSub(hit, &spC, &counter, 0);
    PSVECScale(&spC, position, 1.0f / (f32) counter);
}

void hitObjGetNormal(const char *name, Vec *normal) { //1:1
    HitEntry* hit;

    hit = hitNameToPtr(name);
    if (hit != NULL && hit->joint->partCount > 0) {
        PSVECNormalize(&hit->unkAC->normal, normal);
    }
}

const char* hitGetName(HitEntry* hit) { //1:1
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
        start = (u32)map->hitObjects;
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

s32 hitGetAttr(HitEntry* hit) { //1:1
    return hit != NULL ? hit->attributes : 0;
}

void hitDamageReturnSet(HitEntry* hit, HitDamageReturn* damage, BOOL recursion) { //1:1
    hit->attributes |= 0x40000000;
    hit->damage = damage;
    if (hit->child != NULL) {
        hitDamageReturnSet(hit->child, damage, TRUE);
    }
    if (recursion != 0) {
        if (hit->next != NULL) {
            hitDamageReturnSet(hit->next, damage, TRUE);
        }
    }
}

void hitGrpDamageReturnSet(const char* name, HitDamageReturn* damage) { //1:1
    HitEntry* hit;
    
    hit = hitNameToPtr(name);
    if (hit != NULL) {
        hitDamageReturnSet(hit, damage, FALSE);
    }
}

Vec* hitGetDamageReturnPos(HitEntry* hit) {
    return &hit->damage->position;
}

void hitBindMapObj(const char *hitName, const char *mapobjName) {
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
            hitReCalcMatrix(hit, parent->unkC);
            return;
        }
        PSMTXScale(mtx, 10.0f, 10.0f, 10.0f);
        hitReCalcMatrix(hit, mtx);
    }
}
