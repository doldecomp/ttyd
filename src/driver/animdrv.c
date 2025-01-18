/*
 * Warning, inlining hell
 */
#include "driver/animdrv.h"
#include "driver/dispdrv.h"
#include "driver/mapdrv.h"
#include "mario/mariost.h"
#include "memory.h"
#include "system.h"
#include <math.h>
#pragma warn_padding off
#include <stdio.h>
#pragma warn_padding on
#include <string.h>

#define TESTHEAP_SIZE (u32)(1.5 * 1024 * 1024)
#define PI 3.14159265358979323846264338327950288419716939937510f

extern GlobalWork* gp;
extern int sprintf(char* str, const char* format, ...);

//.data
u8 _vivihimoData[0xC00]; //TODO: embed the actual data? gets overwritten by a/vivian.bin in animInit()

//.bss
static AnimationWork work;
f32 tanfTbl[0xB2];

//.sdata
s32 vivihimoTailGroupNo[4] = { 0, 2, -1, -1 };
void* vivihimoData[4] = {
	NULL,
	&_vivihimoData,
	&_vivihimoData + 0x400,
	&_vivihimoData + 0x800,
};
static AnimationWork* wp = &work;
s32 _dummy = -1;
static s32 tbl[4] = { 2, 1, 3, 0 };

//.sbss
u32 anim_ext_tex_size;
Mtx mtx; //TODO: make sure it's put in .sbss
s32 g_modeling_mtx_lv;
Mtx* g_modeling_mtx;


//local declarations
void initTestHeap(void);
void* testAlloc(u32 size);
void animPose_AllocBuffer(AnimationPose* pose);
void animPoseRefresh(void);


void animPaperPoseDisp(CameraId cameraId, void* param);
void animPaperPoseDispSub(s32 unused, AnimationPose* pose);

AnimationWork* animGetPtr(void) { //1:1, obv
	return wp;
}

OSTime animTimeGetTime(BOOL globalTime) { //1:1
	if (globalTime == 0) {
		return OSTicksToMilliseconds(gp->renderFieldTime);
	}
	return OSTicksToMilliseconds(gp->renderTime);
}

void initTestHeap(void) { //1:1
	if (!wp->testHeap) { //allocate 1.5MiB test heap
		wp->testHeap = __memAlloc(HEAP_DEFAULT, TESTHEAP_SIZE);
	}
	wp->testAlloc = wp->testHeap;
}

//heavily inlined
void* testAlloc(u32 size) { //1:1
	void* alloc = wp->testAlloc;

	if (size & 31) {
		size += 32 - (size & 31);
	}
	wp->testAlloc = (void*)((u32)wp->testAlloc + size);
	if ((u32)wp->testAlloc >= (u32)wp->testHeap + TESTHEAP_SIZE) { //need to allocate more
		animPoseRefresh();
		alloc = testAlloc(size);
	}
	return alloc;
}

void animInit(void) {
	FileEntry* file;
	int i;

	wp->totalFiles = 64; //TODO: #define these?
	wp->totalTextures = 64;
	wp->totalPoses = 256;
	wp->mFloatScratchRP = 1024;
	wp->mFloatScratchWP = 0;
	wp->files = __memAlloc(HEAP_DEFAULT, sizeof(AnimationPoseFile) * wp->totalFiles);
	wp->textures = __memAlloc(HEAP_DEFAULT, sizeof(AnimationTextureFile) * wp->totalTextures);
	wp->poses = __memAlloc(HEAP_DEFAULT, sizeof(AnimationPose) * wp->totalPoses);
	wp->mbUseFloatScratch = 0;
	wp->mpFloatScratch = __memAlloc(HEAP_DEFAULT, sizeof(Vec) * wp->mFloatScratchRP);

	wp->mpTexObjs[0] = NULL;
	wp->mpTexObjs[1] = NULL;
	wp->mpCurTexObj = NULL;

	wp->mpTexDatas[0] = NULL;
	wp->mpTexDatas[1] = NULL;
	wp->mpCurTexData = NULL;

	wp->paperMtxPtr[0] = NULL;
	wp->paperMtxPtr[1] = NULL;
	wp->paperMtxPtr[2] = NULL;

	wp->field_0xD8 = 1;
	wp->field_0xDC = 1;

	wp->testHeap = NULL;
	wp->inBattle = FALSE;
	initTestHeap(); //inlined

	for (i = 0; i < 0xB2; i++) {
		tanfTbl[i] = (f32)tan(MTXDegToRad(i - 0x59));
	}
	file = fileAllocf(0, "a/vivian.bin");
	if (file) {
		memcpy_as4(vivihimoData[1], *file->data, sizeof(_vivihimoData));
		memcpy_as4(vivihimoTailGroupNo, (void*)((u32)*file->data + sizeof(_vivihimoData)), sizeof(vivihimoTailGroupNo));
		fileFree(file);
	}
	fileSetCurrentArchiveType(0);
	wp->mp_ag2tg = fileAllocf(0, "a/ag2tg.bin");
}

void animMain(void) {
	dispEntry(CAMERA_OFFSCREEN, 1, animPaperPoseDisp, NULL, 0.0f);
}

//heavily inlined, TODO helper function for that AnimPoseData* data, copy of animPoseGetAnimBaseDataPtr with AnimPose* arg
void animPose_AllocBuffer(AnimationPose* pose) {
	AnimationPoseData* data = *wp->files[pose->fileId].handle->data;
	pose->mpBufferVtxPos = testAlloc(sizeof(Vec) * data->mBufferPosNum);
	pose->mpVtxArrayPos = testAlloc(sizeof(Vec) * data->mBufferPosNum);

	pose->mpBufferVtxNrm = testAlloc(sizeof(Vec) * data->mBufferNrmNum);
	pose->mpVtxArrayNrm = testAlloc(sizeof(Vec) * data->mBufferNrmNum);

	pose->mpBufferGroupVisibility = testAlloc(sizeof(u8) * data->mBufferVisibilityNum);
	pose->mpGroupVisibility = pose->mpBufferGroupVisibility;

	pose->mpBufferNode = testAlloc(sizeof(AnimPoseNode*) * data->mBufferNodeNum);
	pose->mpNodes = testAlloc(sizeof(AnimPoseNode*) * data->mBufferNodeNum);

	pose->mpBufferTexAnimEntries = testAlloc(sizeof(AnimTexMtx) * data->mBufferTexAnimNum);
	pose->mpTexAnimEntries = pose->mpBufferTexAnimEntries;

	pose->lastFrameZero = -1;
}

//heavily inlined
void animPoseRefresh(void) {
	AnimationPose* pose;
	int i;

	initTestHeap(); //inline
	for (i = 0; i < wp->totalPoses; i++) {
		pose = animPoseGetAnimPosePtr(i); //inline
		if (pose->flags) {
			//TODO: cleanup in rewrite?
			if ((!wp->inBattle || pose->type != 0) && (wp->inBattle || pose->type != 1)) {
				animPose_AllocBuffer(pose);
				pose->lastFrameZero = -1; //TODO: redundant?
			}
		}
	}
}

void animPoseBattleInit(void) {
	wp->inBattle = TRUE;
	animPoseRefresh();
}

s32 animPoseEntry(const char* animName, s32 type) {
	AnimationPose* pose, * temp;
	AnimationPoseFile* file, * tempfile;
	AnimationTextureFile* texture, * temptex;
	AnimationPoseData* data;
	s32 poseId, fileId, texId;
	s32 check, i;
	char textureName[256];

	switch (type) {
	case 0:
		fileSetCurrentArchiveType(1);
		break;
	case 1:
		fileSetCurrentArchiveType(2);
		break;
	case 2:
		fileSetCurrentArchiveType(0);
		break;
	}

	for (i = 0, poseId = 0; i < wp->totalPoses; i++, poseId++) {
		temp = &wp->poses[i];
		if (!temp->flags) {
			pose = temp;
			goto label_1;
		}
	}
	pose = NULL;
	poseId = -1;
label_1:
	pose->flags |= 1;
	pose->typeFlags = 0;
	pose->references = 0;

	check = wp->totalFiles;
	for (i = 0; i < check; i++) {
		file = &wp->files[i];
		if (!file->active) {
			data = *file->handle->data;
			if (!strcmp(data->fileName, animName)) {
				file->references++;
				goto label_5;
			}
		}
	}

	for (i = 0, fileId = 0; i < wp->totalFiles; i++, fileId++) {
		tempfile = &wp->files[i];
		if (!tempfile->active) {
			file = tempfile;
			goto label_2;
		}
	}
	file = NULL;
	fileId = -1;
label_2:
	file->active = TRUE;
	file->references++;
	file->handle = fileAllocf(5, "%s/%s", "a", animName);

	if (file->handle) {
		fileId = -2;
		file->active = FALSE;
		file->references--;
	}
	else {
		data = *file->handle->data;
		if (!data) {
			fileFree(file->handle);
			fileId = -2;
			file->active = FALSE;
			file->references--;
		}
		else {
			sprintf(textureName, "%s/%s-", "a", data->textureName);
			check = wp->totalTextures;
			for (i = 0; i < check; i++) {
				texture = &wp->textures[i];
				if (texture->active) {
					if (texture->handle) {
						if (!strcmp(texture->handle->filename, textureName)) {
							texture->references++;
							goto label_4;
						}
					}
				}
			}

			for (i = 0, texId = 0; i < wp->totalTextures; i++, texId++) {
				temptex = &wp->textures[i];
				if (!temptex->active) {
					texture = temptex;
					goto label_3;
				}
			}
			texture = NULL;
			texId = -1;
		label_3:
			texture->active = TRUE;
			texture->references++;
			texture->handle = fileAlloc(textureName, 4);
		label_4:
			file->textureId = texId;
		}
	}
label_5:
	pose->fileId = fileId;
	if (pose->fileId == -2) {
		pose->flags = 0;
		return -2;
	}
	pose->animId = 0;
	pose->localTime = animTimeGetTime(type); //inline
	pose->lastFrameZero = -1;
	pose->lastFrameTime = 0.0f;
	pose->field_0x80 = 0;
	pose->loopTime = 0.0f;
	pose->field_0x70 = 0.0f;
	pose->rotationY = 0.0f;
	pose->field_0x7C = 0.0f;
	pose->type = type;
	pose->paperId = -1;
	animPose_AllocBuffer(pose);
	pose->gxCallback = NULL;
	pose->disableDraw = 0;
	pose->materialFlag = 0;
	pose->materialLightFlag = 0;
	pose->materialColor = (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF };
	pose->materialColor2 = (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF };
	pose->field_0xFC = 1.0f;
	pose->field_0xF8 = 1.0f;
	pose->field_0x100 = 0.0f;
	pose->localTimeRate = 1.0f;
	MTXIdentity(pose->matrix);
	if (!strcmp(animName, "tst_vivi")) {
		pose->vivianType = 1;
		pose->vivianGroupNo = &vivihimoTailGroupNo[0];
	}
	else if (!strcmp(animName, "c_vivian")) {
		pose->vivianType = 1;
		pose->vivianGroupNo = &vivihimoTailGroupNo[1];
	}
	else if (!strcmp(animName, "c_maririn")) {
		pose->vivianType = 2;
		pose->vivianGroupNo = &vivihimoTailGroupNo[2];
	}
	else if (!strcmp(animName, "c_majyorin")) {
		pose->vivianType = 3;
		pose->vivianGroupNo = &vivihimoTailGroupNo[3];
	}
	else { //if none match
		pose->vivianType = 0;
		pose->vivianGroupNo = &_dummy;
	}
	pose->dispCallback = NULL;
	pose->dispUserDataCallback = NULL;
	return poseId;
}

s32 animPaperPoseEntry(const char* animName, s32 group) {
	AnimationPoseData* data;
	AnimationPose* pose;
	s32 i, poseId;

	for (i = 0, poseId = 0; i < wp->totalPoses; i++, poseId++) {
		pose = &wp->poses[i];
		if (pose->flags & 1) {
			if (pose->typeFlags & 1 && pose->typeFlags & 2 && pose->type == group) {
				data = *wp->files[pose->fileId].handle->data;
				if (!strcmp(data->fileName, animName)) {
					break;
				}
			}
		}
	}
	if (poseId == wp->totalPoses) {
		poseId = -1;
	}
	if (poseId < 0) {
		poseId = animPoseEntry(animName, group);
		if (poseId != -2) {
			pose = &wp->poses[poseId];
			pose->typeFlags = 3;
			pose->references = 0;
			pose->flags |= 1;
		}
	}
	else {
		wp->poses[poseId].references++;
	}
	return poseId;
}

BOOL animEffectAsync(const char* animName, u32 group) {
	s32 model, anim;
	void** ag2tg;

	switch (group) {
	case 0:
		fileSetCurrentArchiveType(1);
		break;
	case 1:
		fileSetCurrentArchiveType(2);
		break;
	case 2:
		fileSetCurrentArchiveType(0);
		break;
	}
	model = fileAsyncf(5, NULL, "%s/%s", "a", animName);
	
	return FALSE;
}

void animPosePeraOn(s32 poseId) {
	wp->poses[poseId].flags |= 8;
}

void animPosePeraOff(s32 poseId) {
	wp->poses[poseId].flags &= ~8;
}

void animPosePaperPeraOn(s32 poseId) {
	AnimationPose *src, *dst;

	src = &wp->poses[poseId];
	dst = &wp->poses[src->paperId];
	dst->flags |= 8;
	dst->field_0x70 = src->field_0x70;
	dst->rotationY = src->rotationY;
	dst->field_0x7C = src->field_0x7C;
}

void animPosePaperPeraOff(s32 poseId) {
	AnimationPose* src;

	src = &wp->poses[poseId];
	wp->poses[src->paperId].flags &= ~8;
}

void animPoseSetLocalTimeRate(s32 poseId, f32 localTimeRate) {
	wp->poses[poseId].localTimeRate = localTimeRate;
}

//TODO: get animTimeGetTime to inline here
void animPoseSetLocalTime(s32 poseId, f32 localTimeFrames) {
	AnimationPose *pose, *pera;

	pose = &wp->poses[poseId];
	pose->localTime = animTimeGetTime(pose->type) - (localTimeFrames * 16.666666f);
	pose->mLocalTimeInit = pose->localTime;
	if (pose->paperId != -1) {
		pera = &wp->poses[pose->paperId];
		pera->localTime = pose->localTime;
	}
}

void animPoseSetStartTime(s32 poseId, OSTime startTime) {
	wp->poses[poseId].localTime = startTime;
}

void animPoseSetAnim(s32 poseId, const char* animName, BOOL reset) {
	AnimationPoseData* data;
	AnimationPose* pose;

	pose = &wp->poses[poseId];
	data = *wp->files[pose->fileId].handle->data;
}

s32 animPaperPoseGetId(const char* animName, s32 group) {
	return 0;
}

void animPoseSetPaperAnimGroup(s32 poseId, const char* animName, BOOL someflag) {

}

void animPoseSetPaperAnim(s32 poseId, const char* animName) {

}

void animPoseSetEffect(s32 poseId, const char* animName, BOOL someflag) {

}

void animPoseSetEffectAnim(s32 poseId, const char* animName, BOOL reset) {

}

/*
void animPoseSetGXFunc(s32 poseId, void (*gxCb)(s32 wXluStage), s32 wbDisableDraw) {

}
*/










AnimTableEntry* animPoseGetCurrentAnim(s32 poseId) {
	AnimationPoseData* data = animPoseGetAnimBaseDataPtr(poseId);
	return &data->mpAnims[animPoseGetAnimPosePtr(poseId)->animId];
}

AnimationPoseData* animPoseGetAnimBaseDataPtr(s32 poseId) {
	AnimationPose* pose = animPoseGetAnimPosePtr(poseId);
	return *wp->files[pose->fileId].handle->data;
}

AnimData* animPoseGetAnimDataPtr(s32 poseId) {
	AnimationPose* pose = animPoseGetAnimPosePtr(poseId);
	return animPoseGetAnimBaseDataPtr(poseId)->mpAnims[pose->animId].mpAnimData;
}

AnimationPose* animPoseGetAnimPosePtr(s32 poseId) {
	return &wp->poses[poseId];
}




void animPaperPoseRelease(s32 poseId) {
	
}

void animPoseRelease(s32 poseId) {

}






GXColor* animPoseGetMaterialEvtColor(s32 poseId) {
	return &wp->poses[poseId].materialColor;
}

u32 animPoseGetMaterialLightFlag(s32 poseId) {
	return wp->poses[poseId].materialLightFlag;
}

u32 animPoseGetMaterialFlag(s32 poseId) {
	return wp->poses[poseId].materialFlag;
}

void animPoseSetMaterialEvtColor(s32 poseId, GXColor* color) {
	wp->poses[poseId].materialColor = *color;
}

void animPoseSetMaterialLightFlagOff(s32 poseId, u32 mask) {
	wp->poses[poseId].materialLightFlag &= ~mask;
}

void animPoseSetMaterialLightFlagOn(s32 poseId, u32 mask) {
	wp->poses[poseId].materialLightFlag |= mask;
}

void animPoseSetMaterialFlagOff(s32 poseId, u32 mask) {
	wp->poses[poseId].materialFlag &= ~mask;
}

void animPoseSetMaterialFlagOn(s32 poseId, u32 mask) {
	wp->poses[poseId].materialFlag |= mask;
}

BOOL animPoseGetPeraEnd(s32 poseId) {
	return FALSE;
}




f32 animPoseGetRadius(s32 poseId) {
	return 0.0f;
}

f32 animPoseGetHeight(s32 poseId) {
	return 0.0f;
}




s32 animPoseGetVivianType(s32 poseId) {
	return wp->poses[poseId].vivianType;
}









f32 animPoseGetLoopTimes(s32 id) {
	return wp->poses[id].loopTime;
}



void animPoseWorldPositionEvalOn(s32 poseId) {

}

void animPoseWorldMatrixEvalOn(s32 poseId) {

}

void animPoseMain(s32 poseId) {

}






BOOL animGroupBaseAsync(const char* name, s32 group, void* callback) {
	//int i;

	switch (group) {
		case 0:
			fileSetCurrentArchiveType(1);
			break;
		case 1:
			fileSetCurrentArchiveType(2);
			break;
		case 2:
			fileSetCurrentArchiveType(0);
			break;
	}
	//fileAsyncf(5, callback, "%s/%s", "a", name);

	return FALSE;
}



void animPaperPoseDisp(CameraId cameraId, void* param) {
	AnimationPose* pose;
	int i;

	for (i = 0; i < wp->totalPoses; i++) {
		pose = &wp->poses[i];
		if (pose->flags & 1 && pose->paperId != -1) {
			animPaperPoseDispSub(0, pose);
		}
	}
}

void animPaperPoseDispSub(s32 unused, AnimationPose* pose) {

}




void animPoseSetGXFunc(s32 poseId, void (*callback)(s32 wXluStage), BOOL disableDraw) {
	AnimationPose* pose = &wp->poses[poseId];
	pose->gxCallback = callback;
	pose->disableDraw = disableDraw;
}

void animSetMaterial_Texture(s32 texCount, s32* texIdRemap, AnimPoseTexEntry* pTexEntries, AnimTexMtx* animEntries, s32 texBindsCapacity, AnimTexBind* texBinds, AnimationTextureFile* texFile) {

}






inline BOOL animSetMaterial_ChangeTexture(AnimationPoseData* data, AnimPoseShapeDraw* draw, AnimationPose* pose, Mtx mtx, void** texData, GXTexObj* texObj, s32 texType) {
	AnimPoseTexEntry* texEntry;
	AnimTexMtx* texAnim;
	AnimTexBind* bind;
	s32 bindCount, texCount;
	s32 dataId, bindId, frameExt;
	GXTexObj* smartObj;
	int i;

	bind = data->texBinds;
	bindCount = data->texBindCount;
	texAnim = pose->mpTexAnimEntries;
	texEntry = data->texData;
	texCount = draw->texCount;

	for (i = 0; i < texCount; i++) {
		dataId = draw->texDataIds[texCount - i - 1];
		frameExt = texAnim[dataId].mTexBindIdx;
		bindId = texEntry[dataId].bindId + frameExt;
		if (bindId < 0 || bindId >= bindCount) {
			bindId = 0;
			//"Error: animSetMaterial_ChangeTexture: テクスチャがありません frameExt=%d\n"
			printf("Error: animSetMaterial_ChangeTexture: \x83\x65\x83\x4E\x83\x58\x83\x60\x83\x83\x82\xAA\x82\xA0\x82\xE8\x82\xDC\x82\xB9\x82\xF1 frameExt=%d\n", frameExt);
		}
		if (bind[bindId].texType == texType) {
			if (texObj) {
				smartObj = smartTexObj(texObj, texData);
				GXLoadTexObj(smartObj, i);
				if (mtx) {
					GXLoadTexMtxImm(mtx, GX_TEXMTX0 + (u32)(i * 3), GX_MTX2x4);
					GXSetTexCoordGen(i, GX_TG_MTX2x4, GX_TG_TEX0 + i, GX_TEXMTX0 + (u32)(i * 3));
				}
				else {
					GXSetTexCoordGen(i, GX_TG_MTX2x4, GX_TG_TEX0 + i, GX_IDENTITY);
				}
			}
			return TRUE;
		}
	}
	return FALSE;
}

//I'm so sorry, whoever gets tasked with matching this function
//note: I detect at least 8 inlined functions here, good luck finding the separation
void renderProc(s32 shapeId) {
	CameraEntry* camera;
	AnimationPoseData* data;
	AnimPoseShape *shapes, *shape;
	AnimPoseShapeDraw *draws, *draw;
	s32 dispMode, drawId;
	s32 posFirstVtx, nrmFirstVtx, clr0FirstVtx;

	f32* buffer;
	s32 nrmVtxSize;
	s32 texCount;
	AnimationPose* pose;
	Mtx* mtx;
	GXTexObj* texObj;
	BOOL texChange1, check1, texChange2, check2;
	GXTexObj* currTexObj;
	u8* texIds;
	s32* firstId;
	AnimDrawCallEntry* drawCall;
	s32 drawCallCount;
	GXColor* clr0VtxPtr;
	s32 posFirstId, nrmFirstId, clr0FirstId;
	Vec *nrmVtxPtr, *posVtxPtr;

	s32 count;
	u16 *posIndexPtr, *nrmIndexPtr, *clr0IndexPtr, *texIndexPtr;
	s32 firstDrawId;
	s32 index;
	s32 texIndex;

	int i, j, k, l;

	//stack variables
	s32 clr0VtxSize, posVtxSize; //TODO: make sure stack, +0xB0, +0xAC
	s32 drawCount; //TODO: make sure stack, +0xA8
	Mtx camMtx, invCamMtx;
	f32* texVtxIndices[8];
	Vec lightPos, lightPos2; //TODO: rename? 2 is probably implicit stack copy

	if (shapeId != -1) {
		camera = camGetCurPtr();
		MTXConcat(camera->view, *g_modeling_mtx, camMtx);
		GXLoadPosMtxImm(camMtx, 0);
		MTXInvXpose(camMtx, invCamMtx);
		GXLoadNrmMtxImm(invCamMtx, 0);
		GXSetCurrentMtx(0);

		data = wp->mpCurPoseData;
		shapes = data->shapes;
		draws = data->draws;
		shape = &shapes[shapeId];
		dispMode = shape->dispMode;
		drawId = shape->shapeDrawStart;
		posFirstVtx = shape->vtxPos.first;
		nrmFirstVtx = shape->vtxNrm.first;
		clr0FirstVtx = shape->vtxClr0.first;
		drawCount = shape->shapeDrawCount;
		draw = &draws[drawId];

		if ((dispMode == 0 && wp->currDispMode == 2) ||
			dispMode == wp->currDispMode ||
			wp->mpCurPose->materialColor.a != 0xFF ||
			wp->mpCurPose->materialColor2.a != 0xFF)
		{
			GXSetCullMode(tbl[shape->cullMode]);
			data = wp->mpCurPoseData;
			posVtxSize = (s32)sizeof(Vec) * posFirstVtx;
			clr0VtxSize = (s32)sizeof(GXColor) * clr0FirstVtx;
			nrmVtxSize = nrmFirstVtx;
			buffer = data->texVtxBuffer;
			texVtxIndices[0] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[0].first];
			texVtxIndices[1] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[1].first];
			texVtxIndices[2] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[2].first];
			texVtxIndices[3] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[3].first];
			texVtxIndices[4] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[4].first];
			texVtxIndices[5] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[5].first];
			texVtxIndices[6] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[6].first];
			texVtxIndices[7] = &buffer[(sizeof(f32) * 2) * shape->vtxTex[7].first];

			for (i = 0; i < drawCount; i++, draw++) {
				texCount = draw->texCount;
				if (!wp->mpCurPose->disableDraw) {
					lightPos = (Vec){ 0.0f, 0.0f, 0.0f };
					MTXMultVec(*g_modeling_mtx, &lightPos, &lightPos);
					lightPos2 = lightPos;
					mapSetMaterialLight(wp->mpCurPose->materialLightFlag, lightPos2);
					animSetMaterial_Texture(
						draw->texCount,
						draw->texDataIds,
						wp->mpCurPoseData->texData,
						wp->mpCurPose->mpTexAnimEntries,
						wp->mpCurPoseData->texBindCount,
						wp->mpCurPoseData->texBinds,
						&wp->textures[wp->files[wp->mpCurPose->fileId].textureId]);
					mapSetMaterialLastStageBlend(
						wp->mpCurPose->materialFlag,
						wp->mpCurPose->materialColor,
						wp->mpCurPose->materialColor2);
					camera = camGetPtr(CAMERA_3D);
					if (camGetCurPtr() == camera) {
						mapSetMaterialFog();
					}
					mapSetMaterialTev(texCount, draw->drawMode, wp->mpCurPose->materialFlag, *g_modeling_mtx);
				}
				pose = wp->mpCurPose;
				if (pose->typeFlags) {
					texChange1 = animSetMaterial_ChangeTexture(wp->mpCurPoseData, draw, pose, *wp->paperMtxPtr[0], wp->mpTexDatas[0], wp->mpTexObjs[0], 1);
					check1 = texChange1;
					if (!texChange1) {
						texChange2 = animSetMaterial_ChangeTexture(wp->mpCurPoseData, draw, pose, *wp->paperMtxPtr[1], wp->mpTexDatas[1], wp->mpTexObjs[1], 2);
						check1 = texChange2;
						check2 = texChange2;
					}
					else {
						check2 = FALSE;
					}

					if (check1 && (texChange1 && !wp->field_0xD8 || check2 && !wp->field_0xDC) && !draw->drawMode) {
						GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_RASA);
					}
					if (check1 && !draw->drawMode) {
						currTexObj = wp->mpCurTexObj;
						if (currTexObj) {
							smartTexObj(currTexObj, wp->mpCurTexData);
							if (wp->currDispMode != 3) {
								GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
								GXSetBlendMode(GX_BM_NONE, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
								GXSetZCompLoc(GX_FALSE);
								GXSetAlphaCompare(GX_GEQUAL, 0x80u, GX_AOP_OR, GX_NEVER, 0);
							}
							texObj = wp->mpTexObjs[texChange1 == 0];
							if (texObj) {
								GXLoadTexObj(texObj, GX_TEXMAP0);
								GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0, GX_FALSE, GX_PTIDENTITY);
								GXLoadTexMtxImm(*wp->paperMtxPtr[texChange1 == 0], GX_TEXMTX0, GX_MTX2x4);
							}
							GXLoadTexObj(currTexObj, GX_TEXMAP1);
							GXSetTexCoordGen2(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX1, GX_FALSE, GX_PTIDENTITY);
							GXLoadTexMtxImm(*wp->paperMtxPtr[2], GX_TEXMTX1, GX_MTX2x4);
							mapSetMaterialTev(2, 12, wp->mpCurPose->materialFlag, *g_modeling_mtx);
						}
					}
				}

				pose = wp->mpCurPose;
				if (pose->flags & 0x10) {
					texObj = wp->mpTexObjs[0];
					if (texObj) {
						mtx = wp->paperMtxPtr[0];
						if (mtx) {
							animSetMaterial_ChangeTexture(wp->mpCurPoseData, draw, pose, *mtx, wp->mpTexDatas[0], texObj, 1);
						}
					}
				}

				texIds = draw->texArrayIds;
				firstId = draw->firstIdTex;
				data = wp->mpCurPoseData; //inlined function here
				drawCall = &data->drawCalls[draw->firstDrawCall];
				texCount = draw->texCount;
				drawCallCount = draw->drawCallCount;
				clr0VtxPtr = &data->clr0VtxBuffer[clr0VtxSize / 4];
				posFirstId = draw->firstIdPos;
				nrmFirstId = draw->firstIdNrm;
				clr0FirstId = draw->firstIdClr0;

				if (wp->mbUseFloatScratch) {
					nrmVtxPtr = &wp->vtxArrayNrm[nrmVtxSize];
					posVtxPtr = &wp->vtxArrayPos[posVtxSize / sizeof(Vec)];
				}
				else {
					pose = wp->mpCurPose;
					posVtxPtr = &pose->mpVtxArrayPos[posVtxSize / sizeof(Vec)];
					nrmVtxPtr = &pose->mpVtxArrayNrm[nrmVtxSize];
				}
				GXClearVtxDesc();
				GXSetVtxDesc(GX_VA_POS, GX_INDEX16);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
				GXSetArray(GX_VA_POS, posVtxPtr, sizeof(Vec));
				GXSetVtxDesc(GX_VA_NRM, GX_INDEX16);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_NRM, GX_NRM_XYZ, GX_F32, 0);
				GXSetArray(GX_VA_NRM, nrmVtxPtr, sizeof(Vec));
				GXSetVtxDesc(GX_VA_CLR0, GX_INDEX16);
				GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8, 0);
				GXSetArray(GX_VA_CLR0, clr0VtxPtr, sizeof(GXColor));

				if (texCount == 1) { //just use texIndex[0]
					GXSetVtxDesc(GX_VA_TEX0, GX_INDEX16);
					GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
					GXSetArray(GX_VA_TEX0, texVtxIndices[texIds[0]], sizeof(f32) * 2);
					for (j = 0; j < drawCallCount; j++, drawCall++) {
						data = wp->mpCurPoseData; //doubly inlined function here
						count = drawCall->count;
						//indices are stored as u32, has to do math to load the lower 2 bytes
						posIndexPtr = &data->posIndex[((drawCall->first + posFirstId) * 2) + 1];
						nrmIndexPtr = &data->nrmIndex[((drawCall->first + nrmFirstId) * 2) + 1];
						clr0IndexPtr = &data->clr0Index[((drawCall->first + clr0FirstId) * 2) + 1];
						texIndexPtr = &data->texIndex[texIds[0]][((drawCall->first + firstId[texIds[0]]) * 2) + 1];
						GXBegin(GX_TRIANGLEFAN, GX_VTXFMT0, (u16)drawCall->count);
						for (k = 0; k < count; k++) { //unrolled, warning
							GXPosition1x16(*posIndexPtr);
							posIndexPtr += 2;
							GXNormal1x16(*nrmIndexPtr);
							nrmIndexPtr += 2;
							GXColor1x16(*clr0IndexPtr);
							clr0IndexPtr += 2;
							GXTexCoord1x16(*texIndexPtr);
							texIndexPtr += 2;
						}
					}
				}
				else { //enumerate texIndex
					for (j = 0; j < texCount; j++) {
						GXSetVtxDesc(GX_VA_TEX0 + j, GX_INDEX16);
						GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0 + j, GX_TEX_ST, GX_F32, 0);
						GXSetArray(GX_VA_TEX0 + j, texVtxIndices[texIds[texCount - j - 1]], sizeof(f32) * 2);
					}
					for (j = 0; j < drawCallCount; j++, drawCall++) {
						firstDrawId = drawCall->first;
						data = wp->mpCurPoseData; //doubly inlined function here
						count = drawCall->count;
						//indices are stored as u32, has to do math to load the lower 2 bytes
						posIndexPtr = &data->posIndex[((drawCall->first + posFirstId) * 2) + 1];
						nrmIndexPtr = &data->nrmIndex[((drawCall->first + nrmFirstId) * 2) + 1];
						clr0IndexPtr = &data->clr0Index[((drawCall->first + clr0FirstId) * 2) + 1];
						
						for (k = 0, texIndex = 0; k < count; k++) {
							GXPosition1x16(*posIndexPtr);
							GXNormal1x16(*nrmIndexPtr);
							GXColor1x16(*clr0IndexPtr);
							for (l = 0; l < texCount; l++) {
								index = texIds[texCount - l - 1];
								GXTexCoord1x16(wp->mpCurPoseData->texIndex[index][((firstDrawId + firstId[index]) * 2) + texIndex]);
							}
							texIndex += 2;
							posIndexPtr += 2;
							nrmIndexPtr += 2;
							clr0IndexPtr += 2;
						}
					}
				}
			}
		}
	}
}

/*void animPoseDrawShape(s32 poseId, s32 shapeId) {

}*/

s32 animPoseGetShapeIdx(s32 poseId, const char* name) {
	AnimPoseShape* shape;
	AnimationPoseData* data;
	s32 fileId, i;

	fileId = wp->poses[poseId].fileId;
	data = *wp->files[fileId].handle->data;
	shape = data->shapes;
	for (i = 0; i < data->shapeCount; i++, shape++) {
		if (!strcmp(shape->name, name)) {
			return i;
		}
	}
	return -1;
}

s32 animPoseGetGroupIdx(s32 poseId, const char* name) {
	AnimPoseGroup* group;
	AnimationPoseData* data;
	s32 fileId, i;

	fileId = wp->poses[poseId].fileId;
	data = *wp->files[fileId].handle->data;
	group = data->groups;
	for (i = 0; i < data->groupCount; i++, group++) {
		if (!strcmp(group->name, name)) {
			return i;
		}
	}
	return -1;
}

const char* animPoseGetGroupName(s32 poseId, s32 group) {
	s32 fileId = wp->poses[poseId].fileId;
	AnimationPoseData* data = *wp->files[fileId].handle->data;
	return data->groups[group].name;
}






void animPoseDrawMtx(s32 poseId, Mtx matrix, s32 xluMode, f32 rotY, f32 scale) {

}

void animPoseDraw(s32 poseId, s32 xluMode, f32 x, f32 y, f32 z, f32 rotY, f32 scale) {
	Mtx matrix;

	MTXTrans(matrix, x, y, z);
	animPoseDrawMtx(poseId, matrix, xluMode, rotY, scale);
}
