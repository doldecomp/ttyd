/* "imgdrv" - Image Driver
 * Status: All functions added, needs Disps done, struct names, and a couple register tweaks
 *
 * Function: still not quite sure, TODO something about shadows that shadowdrv doesn't handle
 *
 * Last Update: 5/17/2021 decompile most of the file
 */
#include "driver/imgdrv.h"
#include "driver/animdrv.h"
#include "driver/camdrv.h"
#include "driver/dispdrv.h"
#include "mario/mariost.h"
#include <math.h>
#include <string.h>

extern GlobalWork* gp;

//.data
static s32 depth_image[32] = {
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1};

//.sbss
static ImageWork work;

//.sdata
static ImageWork* wp = &work;

//local prototypes
static void zFill(void);
void imgDisp(CameraId cameraId, void* param);
void imgDisp_ProjPlane(CameraId cameraId, void* param);
void imgCapture_Prim(ImageEntry* entry, s32 id);
void imgCapture(CameraId cameraId, void* param);


void imgShadowDisp(CameraId cameraId, void* param);

static void zFill(void) { //almost 1:1
	CameraEntry* camera;
	f32 x0, x1, y0, y1;
	f32 zpos;
	GXTexObj obj;
	Mtx mtx;

	camera = camGetCurPtr();
	y0 = (camera->near + camera->far) * 0.5f;
	y0 = y0 * tanf((0.5f * ((6.2831855f * camera->fovY) / 360.0f)));
	x1 = (y0 * camera->aspect);
	y1 = -y0;
	x0 = -x1;
	/*x0 = (camera->mNearZ + camera->mFarZ) * 0.5f;
	x1 = tan(((6.2831855f * camera->mFovY) / 360.0f) * 0.5f);
	y0 = (x0 * x1);
	x1 = (y0 * camera->mAspect);
	y1 = -y0;
	x0 = -x1;*/
	GXInitTexObj(&obj, depth_image, 4, 4, GX_TF_Z8, GX_REPEAT, GX_REPEAT, GX_FALSE);
	GXLoadTexObj(&obj, GX_TEXMAP0);
	GXSetNumTexGens(1);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY);
	GXSetNumTevStages(1);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetTevOp(GX_TEVSTAGE0, GX_PASSCLR);
	GXSetZTexture(GX_ZT_REPLACE, GX_TF_Z8, 0);
	GXSetNumChans(0);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_OR, GX_ALWAYS, 0);
	GXSetZCompLoc(GX_TRUE);
	GXSetBlendMode(GX_BM_LOGIC, GX_BL_ONE, GX_BL_ZERO, GX_LO_COPY);
	GXSetZMode(GX_TRUE, GX_ALWAYS, GX_TRUE);
	GXSetColorUpdate(GX_FALSE);
	GXSetAlphaUpdate(GX_FALSE);
	GXSetCullMode(GX_CULL_NONE);
	GXClearVtxDesc();
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_U8, 0);
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	MTXIdentity(mtx);
	GXLoadPosMtxImm(camera->view, 0);
	GXSetCurrentMtx(0);
	GXBegin(GX_QUADS, GX_VTXFMT0, 4);
	zpos = -1000.0f;
	GXPosition3f32(x0, y0, zpos);
	GXTexCoord2u8(0, 0);
	GXPosition3f32(x1, y0, zpos);
	GXTexCoord2u8(1, 0);
	GXPosition3f32(x1, y1, zpos);
	GXTexCoord2u8(1, 1);
	GXPosition3f32(x0, y1, zpos);
	GXTexCoord2u8(0, 1);
	GXSetZTexture(GX_ZT_DISABLE, GX_TF_Z8, 0);
	GXSetColorUpdate(GX_TRUE);
}

void imgDisp(CameraId cameraId, void* param) {
	ImageEntry* entry = param;
	int i;

	for (i = 0; i < 3; i++) {

	}

}

void imgDisp_ProjPlane(CameraId cameraId, void* param) {
	ImageEntry* entry = param;

}

void imgCapture_Prim(ImageEntry* entry, s32 id) {

}

void imgCapture(CameraId cameraId, void* param) {
	//param is NULL
	
}

void imgInit(void) { //1:1
	wp->count = 10;
	wp->entries = __memAlloc(HEAP_DEFAULT, wp->count * sizeof(ImageEntry));
	memset(wp->entries, 0, wp->count * sizeof(ImageEntry));
}

void imgAutoRelease(s32 type) {

}

s32 imgEntry(const char* name, s32 type) { //1:1, needs variable names
	int i, count;
	ImageEntry* entry;

	//check if already created
	for (i = 0, count = wp->count, entry = wp->entries; i < count; i++, entry++) {
		if (entry->flags & 1 && entry->type == type) {
			if (!strcmp(entry->name, name)) break;
		}
	}

	//find new slot
	for (i = 0, entry = wp->entries; i < count; i++, entry++) {
		if (!(entry->flags & 1)) break;
	}

	entry->flags = 9;
	entry->type = type;
	strcpy(entry->name, name);
	entry->poseId = -1;
	entry->field_0x108 = 0;
	entry->field_0xE4 = 0;
	entry->field_0xE6 = 0;
	entry->field_0xE8 = 0.0f;
	entry->field_0xEC = 0.0f;
	entry->order = 0.0f;
	entry->field_0x118 = 0.0f;
	entry->shadowId = 0;
	entry->field_0x11C = 0.0f;
	MTXIdentity(entry->field_0x120);
	entry->cameraId = CAMERA_3D_IMAGE;
	entry->field_0x154 = 4;

	entry->shadows[0].flags = 0;
	entry->shadows[0].field_0x4 = 0;
	entry->shadows[0].field_0x6 = 0;
	entry->shadows[0].field_0x10 = -1;
	entry->shadows[0].field_0x14 = 6;
	entry->shadows[0].field_0x18 = 6;
	entry->shadows[0].field_0x40 = 0;

	entry->shadows[1].flags = 0;
	entry->shadows[1].field_0x4 = 0;
	entry->shadows[1].field_0x6 = 0;
	entry->shadows[1].field_0x10 = -1;
	entry->shadows[1].field_0x14 = 6;
	entry->shadows[1].field_0x18 = 6;
	entry->shadows[1].field_0x40 = 0;

	entry->shadows[2].flags = 0;
	entry->shadows[2].field_0x4 = 0;
	entry->shadows[2].field_0x6 = 0;
	entry->shadows[2].field_0x10 = -1;
	entry->shadows[2].field_0x14 = 6;
	entry->shadows[2].field_0x18 = 6;
	entry->shadows[2].field_0x40 = 0;
	entry->shadows[2].field_0x14 = 39;
	entry->shadows[2].field_0x18 = 1;

	return i;
}

void imgMain(void) { //1:1
	s32 type = gp->inBattle != 0;
	int shadow, i, count;
	ImageEntry* entry;

	i = 0;
	count = wp->count;
	for (entry = wp->entries; i < count; i++, entry++) {
		if (entry->flags & 1 && entry->poseId != -1 && !(entry->flags & 2)) {
			if (entry->type == 2 || entry->type == type) {
				for (shadow = 0; shadow < 3; shadow++) {
					if (!(entry->shadows[shadow].flags & 4)) break;
				}
				if (shadow != 3) {
					dispEntry(entry->cameraId, 1, imgDisp, entry, entry->order);
					switch (entry->shadowId) {
						case 0:
							animPoseSetMaterialFlagOff(entry->poseId, 0x10000);
							break;
						case 1:
							dispEntry(CAMERA_SHADOW, 1, imgShadowDisp, entry, 0.0f);
							dispEntry(CAMERA_3D_IMAGE, 5, imgDisp_ProjPlane, entry, 0.0f);
							break;
						case 2:
							animPoseSetMaterialFlagOn(entry->poseId, 0x10000);
							dispEntry(CAMERA_SHADOW, 6, imgShadowDisp, entry, 0.0f);
							dispEntry(CAMERA_3D_IMAGE, 5, imgDisp_ProjPlane, entry, 0.0f);
							break;
					}
				}
			}
		}
	}

	for (i = 0; i < 13; i++) {
		dispEntry(i, 7, imgCapture, NULL, 0.0f);
	}
}

ImageEntry* imgNameToPtr(const char* name, s32 type) { //1:1
	int i, count;
	ImageEntry* entry;

	i = 0;
	count = wp->count;
	for (entry = wp->entries; i < count; i++, entry++) {
		if (entry->flags & 1 && (entry->type == 2 || entry->type == type)) {
			if (!strcmp(entry->name, name)) break;
		}
	}
	return entry;
}

void imgFreeCapture(ImageEntry* entry, s32 shadowId) { //1:1, needs enums
	ImageShadow* shadow = &entry->shadows[shadowId];
	if (shadow->flags & 4) {
		shadow->flags &= ~0x10;
		if (shadow->flags & 0x100) {
			shadow->flags = 0;
		}
		else if (!shadow->field_0x40) {
			shadow->flags = 0;
		}
		else {
			shadow->flags = 0;
			smartFree(shadow->field_0x3C);
		}
	}
}

void imgSetVirtualPoint(ImageEntry* entry, const Vec* point) { //1:1
	entry->flags &= ~8;
	entry->point = *point;
}

void imgClearVirtualPoint(ImageEntry* entry) { //1:1
	entry->flags |= 8;
}

void imgRelease(ImageEntry* entry, s32 type) { //1:1 after inlining
	int i;

	for (i = 0; i < 3; i++) {
		imgFreeCapture(entry, i); //TODO: double check this inlines correctly
	}
	entry->flags = 0;
	memset(entry, 0, sizeof(ImageEntry));
}

void imgSetShadow(ImageEntry* entry, s32 shadowId) { //1:1
	entry->shadowId = shadowId;
}

void imgShadowDisp(CameraId cameraId, void* param) {
	ImageEntry* entry = param;

}
