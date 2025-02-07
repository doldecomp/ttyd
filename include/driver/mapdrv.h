#pragma once

#include <dolphin/gx.h>
#include <dolphin/mtx.h>

/*typedef struct DisplayList {
    u32 offset;      // 0x00 - Offset to vertex data
    u32 vertexCount; // 0x04 - Number of vertices
} DisplayList;

typedef struct PackedDisplayList {
    u32 offset;      // 0x00 - Offset to packed data
    u16 vertexCount; // 0x04 - Number of vertices
    u8 padding[2];   // 0x06
} PackedDisplayList;*/

typedef struct MapFileMesh {
	u8 unk0; //0x0
	u8 padding[2]; //0x1
	u8 isPackedDisplay; //0x3, BOOL
	s32 displayListCount; //0x4
	u32 elementMask; //0x8
	u32 vcdTableOffset; //0xC
    union {
        u32* displayLists;  // 0x10
        u8* packedDisplayLists;  // 0x10
    } displayLists[];
} MapFileMesh;

typedef struct MapFileJointPart {
	void* material; //0x0
	MapFileMesh* mesh; //0x4
} MapFileJointPart;

typedef struct MapJointDrawMode {
	u8 unk0[0x1 - 0x0]; //0x0
	u8 cullMode; //0x1
	u8 unk2[0x8 - 0x2]; //0x2
	s32 unk8; //0x8
	u8 unkC[0x10 - 0xC]; //0xC
} MapJointDrawMode;


typedef struct MapFileJoint {
	const char* name; //0x0
	const char* type; //0x4
	struct MapFileJoint* parent; //0x8
	struct MapFileJoint* child; //0xC
	struct MapFileJoint* next; //0x10
	struct MapFileJoint* prev; //0x14
	Vec scale; //0x18
	Vec rotation; //0x24
	Vec translation; //0x30
	Vec bboxMin; //0x3C
	Vec bboxMax; //0x48
	u8 field_0x54[0x58 - 0x54]; //0x54
	MapJointDrawMode* drawMode; //0x58
	s32 partCount; //0x5C
	MapFileJointPart parts[]; //0x60+
} MapFileJoint;

typedef struct MapFileHeader {
	s32 fileSize; //0x0
	s32 dataSize; //0x4
	s32 relCount; //0x8, TODO: rename?
	s32 chunkCount; //0xC, TODO: rename?
	s32 unused; //0x10
	u8 reserved[0xC]; //0x14
} MapFileHeader;

//entry in the chunk table
typedef struct MapFileChunk {
	u32 offset; //0x0, relative offset into data
	u32 string; //0x4, relative offset into strings
} MapFileChunk;

typedef struct MapFileInfo {
	const char* version; //0x0
	MapFileJoint* joint; //0x4
	const char* mapName; //0x8
	const char* hitName; //0xC
} MapFileInfo;

typedef struct MapHeader {
	MapFileHeader file; //0x0
	void* data; //0x20, TODO re-type?
	void* rel; //0x24, TODO: re-type?
	MapFileChunk* chunks; //0x28
	void* unused; //0x2C
	const char* strings; //0x30
	u8 field_0x34[0x3C - 0x34]; //0x34
	s32 field_0x3C; //0x3C, dispFlags something?
	u8 field_0x40[0x44 - 0x40]; //0x40
} MapHeader;

typedef struct MapObject {
	u8 field_0x0[0x8 - 0x0]; //0x0
	MapFileJoint* joints; //0x8
	u8 field_0xC[0x1C - 0xC]; //0xC
	Mtx modelWorldMtx; //0x1C
	u8 field_0x4C[0xAC - 0x4C]; //0x4C
	Mtx unkAC; //0xAC
	u8 field_0xDC[0xE0 - 0xDC]; //0xDC
	struct MapObject* parent; //0xE0
	struct MapObject* child; //0xE4
	struct MapObject* next; //0xE8
	u8 field_0xEC[0x134 - 0xEC]; //0xEC
} MapObject;

typedef struct MapError {
	char field_0x0[32]; //0x0
	s32 field_0x20; //0x20
} MapError;

typedef struct MapEntryAnimData {
	u8 field_0x0[0x20 - 0x0]; //0x0
} MapEntryAnimData;

typedef struct MapEntry {
	s32 count; //0x0
	u16 flags; //0x4
	char name[16]; //0x6
	u8 field_0x16[0x38 - 0x16]; //0x16
	MapHeader header; //0x38
	void* dat; //0x7C, ./map/%s/map.dat
	u32 datSize; //0x80
	void* tpl; //0x84, ./map/%s/texture.tpl
	u32 tplSize; //0x88
	u8 field_0x8C[0xA8 - 0x8C]; //0x8C
	MapObject* rootMapObj; //0xA8
	struct HitObj* rootHitObj; //0xAC
	u8 field_0xB0[0x150 - 0xB0]; //0xB0
	s32 numJoints; //0x150, TODO: rename? see: hitNumJoints
	MapObject* objects; //0x154, TODO: rename? see: hitNumJoints
	s32 hitNumJoints; //0x158
	struct HitObj* hitObjects; //0x15C
	u8 field_0x160[0x164 - 0x160]; //0x160
	MapEntryAnimData* animData; //0x164
	u8 field_0x168[0x178 - 0x168]; //0x168
} MapEntry;

typedef struct MapWork {
	MapEntry entries[2]; //0x0
	s32 unk2F0; //0x2F0
} MapWork;

void mapErrorEntry(s32 arg0, const char* arg1);
const char* getMapDataDvdRoot(void);
void mapDispOff(void);
void mapDispOn(void);
MapWork* mapGetWork(void);
s32 mapGetActiveGroup(void);
s32 mapGetJoints(MapFileJoint* joint);
void mapInit(void);
MapEntryAnimData* mapSearchAnmObj(const char* animName);
void mapCheckAnimation(const char* animName, BOOL* valid, f32* a3);
//more animation functions?
void mapUnLoad(void);
BOOL mapPreLoad(void);
void mapLoad(const char* map);



void mapMain(void);
void mapDisp(void);



void mapSetMaterialLight(s32 flags, Vec position);
void mapSetMaterialLastStageBlend(s32 flags, GXColor color1, GXColor color2);
void mapSetMaterialFog(void);
void mapSetMaterialTev(s32 texCount, s32 drawMode, s32 flags, Mtx mtx);


MapObject* mapGetMapObj(const char *name);
