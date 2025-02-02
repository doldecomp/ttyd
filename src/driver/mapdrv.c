#include "driver/mapdrv.h"
#include "driver/arcdrv.h"
#include "manager/dvdmgr.h"
#include "mario/mariost.h"
#include "memory.h"
#include "system.h"
#include "texPalette.h"
#include <math.h>
#include <string.h>

extern f32 queen_uv[4]; //gxsub.c
extern GlobalWork* gp;
extern int sprintf(char* str, const char* format, ...);

#define TWO_PI 6.28318530717958647692528676655900576839433879875021f

//.bss
MapError error_data[32];

//.sbss
MapWork* mapWork; //allocates two entries
s32 activeGroup;
BOOL mapClipOffFlag;
MapObject* current_mp;
BOOL error_flag;
s32 error_count;
BOOL disableMapDraw;
BOOL __mapdrv_make_dl;
//more stuff

//.sdata
f32 scrl_uv[4] = {0.0f, 0.0f, 0.0f, 0.0f};
s32 fog_type[5] = {2, 4, 5, 6, 7};

//local prototypes
void mapGetJointsSub(MapJoint* joint, s32* numJoints);
void mapGetBoundingBox(Vec min, Vec max);
void mapBuildTexture(MapObject* obj, TEXPalette* texture, void* table);
MapObject* _mapEnt(MapJoint* joint, MapObject* parent, Mtx mtx, s32 index);
MapObject* mapEntrySub(MapJoint* joint, MapObject* parent, Mtx mtx, BOOL isRoot, s32 index);
MapObject* mapEntry(MapJoint* joint, Mtx mtx, s32 index);
void makeDisplayList(BOOL group);
//anim functions?
void _mapLoad(MapWork* wp, BOOL group, const char* map);

void mapErrorEntry(s32 arg0, const char* arg1) { //1:1
	MapError* error = error_data;

	error += error_count;
	error->field_0x20 = arg0;
	strncpy(error->field_0x0, arg1, sizeof(error->field_0x0) - 1);
	error_flag = TRUE;
	error_count++;
	error_count %= 32;
}

const char* getMapDataDvdRoot(void) {
	return ".";
}

void mapDispOff(void) {
	disableMapDraw = TRUE;
}

void mapDispOn(void) {
	disableMapDraw = FALSE;
}

MapWork* mapGetWork(void) {
	return &mapWork[activeGroup];
}

s32 mapGetActiveGroup(void) {
	return activeGroup;
}

//heavily inlined
void mapGetJointsSub(MapJoint* joint, s32* numJoints) { //1:1
	(*numJoints)++;
	if (joint->child) {
		mapGetJointsSub(joint->child, numJoints);
	}
	if (joint->next) {
		mapGetJointsSub(joint->next, numJoints);
	}
}

s32 mapGetJoints(MapJoint* joint) { //1:1
	s32 numJoints;

	numJoints = 0;
	if (joint) {
		numJoints = 1;
		if (joint->child) {
			mapGetJointsSub(joint->child, &numJoints);
		}
	}
	return numJoints;
}

void mapGetBoundingBox(Vec min, Vec max) {
	Vec vec;
	MapJoint* joint;
	MapObject* obj;
	MapWork* wp;
	int i;

	wp = &mapWork[activeGroup];
	min = (Vec){0.0f, 0.0f, 0.0f};
	max = (Vec){0.0f, 0.0f, 0.0f};
	obj = wp->entries[0].objects;
	for (i = 0; i < wp->entries[0].numJoints; i++, obj++) {
		joint = obj->joints;
		if (joint && joint->partCount) {
			MTXMultVec(obj->modelWorldMtx, &joint->bboxMin, &vec);
			if (min.x > vec.x) {
				min.x = vec.x;
			}
			if (min.y > vec.y) {
				min.y = vec.y;
			}
			if (min.z > vec.z) {
				min.z = vec.z;
			}
			if (max.x < vec.x) {
				max.x = vec.x;
			}
			if (max.y < vec.y) {
				max.y = vec.y;
			}
			if (max.z < vec.z) {
				max.z = vec.z;
			}
			MTXMultVec(obj->modelWorldMtx, &obj->joints->bboxMax, &vec);
			if (min.x > vec.x) {
				min.x = vec.x;
			}
			if (min.y > vec.y) {
				min.y = vec.y;
			}
			if (min.z > vec.z) {
				min.z = vec.z;
			}
			if (max.x < vec.x) {
				max.x = vec.x;
			}
			if (max.y < vec.y) {
				max.y = vec.y;
			}
			if (max.z < vec.z) {
				max.z = vec.z;
			}
		}
	}
}

void mapInit(void) {
	mapWork = __memAlloc(HEAP_DEFAULT, sizeof(MapWork) * 2);
	memset(mapWork, 0, sizeof(MapWork) * 2);
	activeGroup = 0;
	mapClipOffFlag = FALSE;
}

void mapBuildTexture(MapObject* obj, TEXPalette* texture, void* table) {
	int i;
	MapJointPart* part;

	for (i = 0; i < obj->joints->partCount; i++) {
		part = &obj->joints->parts[i];
	}
	if (obj->child) {
		mapBuildTexture(obj->child, texture, table);
	}
	if (obj->next) {
		mapBuildTexture(obj->next, texture, table);
	}
}

MapObject* _mapEnt(MapJoint* joint, MapObject* parent, Mtx mtx, s32 index) {
	return NULL;




}

//recursively inlined
MapObject* mapEntrySub(MapJoint* joint, MapObject* parent, Mtx mtx, BOOL isRoot, s32 index) {
	MapObject* obj = _mapEnt(joint, parent, mtx, index);
	if (joint->child) {
		obj->child = mapEntrySub(joint->child, obj, obj->modelWorldMtx, FALSE, index);
	}
	if (!isRoot) {
		if (joint->next) {
			obj->next = mapEntrySub(joint->next, parent, mtx, FALSE, index);
		}
	}
	return obj;
}

MapObject* mapEntry(MapJoint* joint, Mtx mtx, s32 index) {
	return NULL;




}

void makeDisplayList(BOOL group) {

}

MapEntryAnimData* mapSearchAnmObj(const char* animName) {
	return NULL;



}

void mapCheckAnimation(const char* animName, BOOL* valid, f32* a3) {

}

//more animation functions

void _mapLoad(MapWork* wp, BOOL group, const char* map) {
	MapHeader* header;
	MapEntry* entry;
	DVDEntry* dvd;
	char str1[128];
	char str2[128];
	char str3[128];
	u32 sizeCheck;
	u8 *data;
	u32 r4, r7, r0;
	int i;

	MapFileInfo* info;

	entry = &wp->entries[group];
	error_flag = FALSE;
	error_count = 0;
	strncpy(entry->name, map, sizeof(entry->name));

	sprintf(str1, "./m/%s/d", map);
	arcOpen(str1, &entry->dat, &entry->datSize);
	if (!entry->dat) {
		sprintf(str2, "%s/%s", ".", str1);
		dvd = DVDMgrOpen(str2, 2, 0);
		entry->datSize = DVDMgrGetLength(dvd);
		entry->dat = _mapAllocTail(OSRoundUp32B(entry->datSize));
		DVDMgrRead(dvd, entry->dat, OSRoundUp32B(entry->datSize), 0);
		DVDMgrClose(dvd);
	}

	sprintf(str1, "./m/%s/t", map);
	entry->tpl = NULL;
	arcOpen(str1, &entry->tpl, &entry->tplSize);
	if (entry->tpl) {
		UnpackTexPalette(entry->tpl);
	}
	else {
		sprintf(str3, "%s/%s", ".", str1);
		dvd = DVDMgrOpen(str3, 2, 0);
		if (dvd) {
			entry->tplSize = DVDMgrGetLength(dvd);
			entry->tpl = _mapAllocTail(OSRoundUp32B(entry->tplSize));
			DVDMgrRead(dvd, entry->tpl, OSRoundUp32B(entry->tplSize), 0);
			DVDMgrClose(dvd);
			UnpackTexPalette(entry->tpl);
		}
	}

	GXInvalidateVtxCache();
	header = &entry->header;
	data = (u8*)entry->dat;
	if (header != NULL) {
		memset(header, 0, sizeof(MapHeader));
		header->field_0x3C |= 1;
		memcpy(header, entry->dat, sizeof(MapFileHeader));
		if (header->file.fileSize == entry->datSize) {
			sizeCheck = sizeof(MapFileHeader);
			if (header->file.dataSize) {
				header->data = &data[sizeCheck];
				sizeCheck = header->file.dataSize + sizeof(MapFileHeader);
			}
			if (header->file.relCount) {
				header->rel = &data[sizeCheck];
				sizeCheck += 4 * header->file.relCount; //TODO: sizeof
			}
			if (header->file.chunkCount) {
				header->chunks = (MapFileChunk*)&data[sizeCheck];
				sizeCheck += sizeof(MapFileChunk) * header->file.chunkCount;
			}
			if (header->file.unused) {
				header->unused = &data[sizeCheck];
				sizeCheck += 8 * header->file.unused;
			}
			if (sizeCheck < header->file.fileSize) {
				header->strings = (const char*)&data[sizeCheck];
			}

			//iunno about this section
			for (i = 0; i < header->file.relCount; i++) {
				r4 = (u32)entry->header.rel;
				r7 = (u32)entry->header.data;
				r4 = *(u32*)(r4 + i);
				r0 = *(u32*)(r7 + r4);
				if (r0 <= 0x80000000) {
					*(u32*)(r7 + r4) = (r0 + r7);
				}
			}
		}
	}
	info = NULL;
	for (i = 0; i < header->file.chunkCount; i++) {
		if (!strcmp(&header->strings[header->chunks[i].string], "information")) {
			info = (MapFileInfo*)&data[header->chunks[i].offset];
			break;
		}
	}


}

void mapUnLoad(void) {

}

BOOL mapPreLoad(void) {
	return TRUE; //do nothing
}

void mapLoad(const char* map) {
	MapWork* wp;

	sysWaitDrawSync();
	wp = &mapWork[0];
	activeGroup = 0;
	memset(wp, 0, sizeof(MapWork));
	_mapLoad(&mapWork[0], 0, map);
	wp->entries[0].count = 1;
}






void mapSetMaterialTev(s32 texCount, s32 drawMode, s32 flags, Mtx mtx) {
	GXTevStageID tevStage;
	Mtx queen_mtx;
	
	if (texCount > 0) {
		switch (drawMode) {
			case 0:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
				GXSetTevOp(GX_TEVSTAGE0, GX_MODULATE);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE1;
				break;

			case 1:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_CPREV, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 2:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_CPREV, GX_CC_TEXA, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_APREV, GX_CA_TEXA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 12:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_CPREV);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 3:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_CPREV, GX_CC_ZERO, GX_CC_TEXA, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_APREV, GX_CA_ZERO, GX_CA_TEXA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 4:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_CPREV, GX_CC_TEXC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_APREV, GX_CA_TEXA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_TEXC, GX_CC_CPREV, GX_CC_APREV, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 5:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG0);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG0);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG1);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG1);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD2, GX_TEXMAP2, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_C0, GX_CC_C1, GX_CC_TEXA, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_A0, GX_CA_A1, GX_CA_TEXA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE3, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE3, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE3, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE3, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE4;
				break;

			case 6:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_CPREV, GX_CC_TEXC, GX_CC_APREV, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_TEXA, GX_CA_APREV, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 7:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_CPREV, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_APREV, GX_CA_ZERO, GX_CA_TEXA, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			case 8:
				GXSetTevColor(GX_TEVREG0, (GXColor) {
					0, (u8)((127.0f * sinf((TWO_PI * (f32)(2 * gp->retraceCount)) / 360.0f)) + 127.0f),
					0, 0}); //TODO: check
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_C0);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_A0);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE1;
				break;

			case 9:
				scrl_uv[0] += queen_uv[0];
				if (scrl_uv[0] > 100.0f) {
					scrl_uv[0] -= 100.0f;
				}
				if (scrl_uv[0] < -100.0f) {
					scrl_uv[0] += 100.0f;
				}

				scrl_uv[1] += queen_uv[1];
				if (scrl_uv[1] > 100.0f) {
					scrl_uv[1] -= 100.0f;
				}
				if (scrl_uv[1] < -100.0f) {
					scrl_uv[1] += 100.0f;
				}

				scrl_uv[2] += queen_uv[2];
				if (scrl_uv[2] > 100.0f) {
					scrl_uv[2] -= 100.0f;
				}
				if (scrl_uv[2] < -100.0f) {
					scrl_uv[2] += 100.0f;
				}

				scrl_uv[3] += queen_uv[3];
				if (scrl_uv[3] > 100.0f) {
					scrl_uv[3] -= 100.0f;
				}
				if (scrl_uv[3] < -100.0f) {
					scrl_uv[3] += 100.0f;
				}

				MTXTrans(queen_mtx, scrl_uv[0], scrl_uv[1], 0.0f);
				GXLoadTexMtxImm(queen_mtx, 0x1E, GX_MTX2x4);
				GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0, GX_FALSE, GX_PTIDENTITY);
				MTXTrans(queen_mtx, scrl_uv[2], scrl_uv[3], 0.0f);
				GXLoadTexMtxImm(queen_mtx, 0x21, GX_MTX2x4);
				GXSetTexCoordGen2(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX1, GX_TEXMTX1, GX_FALSE, GX_PTIDENTITY);
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
				GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_CPREV, GX_CC_TEXC, GX_CC_TEXA, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_APREV, GX_CA_ZERO, GX_CA_TEXA, GX_CA_TEXA);
				GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
				GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_CPREV, GX_CC_RASC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_ZERO, GX_CA_APREV, GX_CA_RASA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE3;
				break;

			default:
				GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
				GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
				GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_RASC, GX_CC_TEXC, GX_CC_ZERO);
				GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_RASA, GX_CA_TEXA, GX_CA_ZERO);
				GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
				tevStage = GX_TEVSTAGE1;
				break;
		}
	}
	else {
		GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
		GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_RASC);
		GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
		GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
		tevStage = GX_TEVSTAGE1;
	}

	if (!(flags & 0x10000000)) {
		GXSetTevKColorSel(tevStage, GX_TEV_KCSEL_K0);
		GXSetTevKAlphaSel(tevStage, GX_TEV_KASEL_K0_A);
		GXSetTevOrder(tevStage, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR_NULL);
		GXSetTevColorOp(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevAlphaOp(tevStage, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
		GXSetTevColorIn(tevStage, GX_CC_ZERO, GX_CC_CPREV, GX_CC_KONST, GX_CC_ZERO);
		GXSetTevAlphaIn(tevStage, GX_CA_ZERO, GX_CA_APREV, GX_CA_KONST, GX_CA_ZERO);
		GXSetTevSwapMode(tevStage++, GX_TEV_SWAP0, GX_TEV_SWAP0);
	}

}






void mapMain(void) {

}

void mapDisp(void) {

}

MapObject* mapGetMapObj(const char *name) { // 1:1
    MapWork *wp;
    MapEntry* entry;
    int j;
    int i;
    MapObject *object;
    
    wp = &mapWork[activeGroup];
    if (!name) {
        return 0;
    }
    entry = &wp->entries[0];
    for (i = 0; i < wp->entries[0].count; entry++, i++) {
        object = entry->objects;
        for (j = 0; j < entry->numJoints; j++, object++) {
            if (!strcmp(object->joints->name, name)) {
                return object;
            }
        }
    }
    return 0;
}





void mapSetMaterialLight(s32 flags, Vec position) {

}

void mapSetMaterialLastStageBlend(s32 flags, GXColor color1, GXColor color2) {

}

void mapSetMaterialFog(void) {

}
