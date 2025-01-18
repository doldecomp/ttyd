#include "driver/camdrv.h"
#include "sdk/DEMOInit.h"
#include "mario/mariost.h"
#include "memory.h"
#include <math.h>
#include <string.h>

#define PI 3.14159265358979323846264338327950288419716939937510f
#define TWO_PI 6.28318530717958647692528676655900576839433879875021f

extern GlobalWork* gp;

//.bss
CameraEntry* camPtrTbl[13]; //TODO: #define?

//.sdata
Vec camPtDefault = {0.0f, 0.0f, 1000.0f};
Vec camAtDefault = {0.0f, 0.0f, 0.0f};
Vec camUpDefault = {0.0f, 1.0f, 0.0f};

//.sbss
s32 currentCamNo;

//local callbacks
CameraEntry* camEntryPersp(CameraCallback callback, const char* name, f32 fovY, f32 aspect, f32 near, f32 far, f32 nearZ, f32 farZ);
inline CameraEntry* camEntryOrtho(CameraCallback callback, const char* name, f32 fovY, f32 aspect, f32 top, f32 bottom, f32 left, f32 right, f32 near, f32 far, f32 nearZ, f32 farZ);
void camEvalNearFar(CameraEntry* camera);

void camEffMain(CameraEntry* camera);
void cam3dImgMain(CameraEntry* camera);
void cam3dMain(CameraEntry* camera);

//TODO: move below camEntryPersp when -inline deferred is enabled
inline CameraEntry* camEntryOrtho(CameraCallback callback, const char* name, f32 fovY, f32 aspect, f32 top, f32 bottom, f32 left, f32 right, f32 near, f32 far, f32 nearZ, f32 farZ) {
    CameraEntry* camera;

    camera = __memAlloc(HEAP_DEFAULT, sizeof(CameraEntry));
    memset(camera, 0, sizeof(CameraEntry));
    MTXOrtho(camera->projection, top, bottom, left, right, near, far);
    camera->type = GX_ORTHOGRAPHIC;
    camera->cameraPos = camPtDefault;
    camera->target = camAtDefault;
    camera->cameraUp = camUpDefault;
    camera->near = near;
    camera->far = far;
    camera->field_0x114 = 0.0f;
    camera->field_0x118 = VECDistance(&camera->cameraPos, &camera->target);
    camera->callback = callback;
    camera->mode = 0;
    camera->bankRotation = 0.0f;
    camera->postTranslation.z = 0.0f;
    camera->postTranslation.y = 0.0f;
    camera->postTranslation.x = 0.0f;
    camera->aspect = aspect;
    camera->fovY = fovY;
    camera->field_0x1E8 = 8;
    strcpy(camera->name, name);
    camera->mScissor[0] = 0;
    camera->mScissor[1] = 0;
    camera->mScissor[2] = DEMOGetRenderModeObj()->fbWidth;
    camera->mScissor[3] = DEMOGetRenderModeObj()->efbHeight;
    camera->mProjection[0] = 0.0f;
    camera->mProjection[1] = 0.0f;
    camera->mProjection[2] = (f32)DEMOGetRenderModeObj()->fbWidth;
    camera->mProjection[3] = (f32)DEMOGetRenderModeObj()->efbHeight;
    camera->mProjection[4] = nearZ;
    camera->mProjection[5] = farZ;
    return camera;
}

void camInit(void) {
    CameraEntry *camera;
    f32 z;

    camPtrTbl[0] = camEntryOrtho(NULL, "off", 25.0f, 1.2666666f, 240.0f, -240.0f, -304.0f, 304.0f, 1.0f, 32768.0f, 0.0f, 1.0f);
    
    camPtrTbl[1] = camEntryOrtho(NULL, "off2", 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f);
    
    camPtrTbl[2] = camEntryOrtho(NULL, "shadow", 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f);

    camPtrTbl[3] = camEntryOrtho(NULL, "bg", 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f);

    camPtrTbl[4] = camEntryPersp(cam3dMain, "3d", 25.0f, 1.2666666f, 1.0f, 32768.0f, 0.0f, 1.0f);

    camPtrTbl[5] = camEntryPersp(camEffMain, "3deff_A", 25.0f, 1.2666666f, 100.0f, 10000.0f, 0.2f, 0.3f);

    camPtrTbl[6] = camEntryPersp(cam3dImgMain, "3dimg", 25.0f, 1.3333334f, 1.0f, 32768.0f, 0.0f, 1.0f);
    z = 24.0f / (f32)tan(0.2181661278009415);
    camPtrTbl[6]->cameraPos = (Vec){0.0f, 0.0f, z};

    camPtrTbl[7] = camEntryPersp(camEffMain, "3deff_B", 25.0f, 1.2666666f, 100.0f, 10000.0f, 0.2f, 0.3f);

    camPtrTbl[8] = camEntryPersp(NULL, "2d", 25.0f, 1.2666666f, 100.0f, 10000.0f, 0.1f, 0.2f);
    z = 240.0f / (f32)tan(0.2181661278009415);
    camPtrTbl[8]->cameraPos = (Vec){0.0f, 0.0f, z};

    camPtrTbl[9] = camEntryPersp(NULL, "fade", 25.0f, 1.3333334f, 1.0f, 32768.0f, 0.0f, 0.1f);
    z = 24.0f / (f32)tan(0.2181661278009415);
    camPtrTbl[9]->cameraPos = (Vec){0.0f, 0.0f, z};

    camPtrTbl[10] = camEntryPersp(NULL, "fade2", 25.0f, 1.3333334f, 1.0f, 32768.0f, 0.0f, 0.1f);
    z = 24.0f / (f32)tan(0.2181661278009415);
    camPtrTbl[10]->cameraPos = (Vec){0.0f, 0.0f, z};

    camPtrTbl[11] = camEntryOrtho(NULL, "dbg", 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f);
    
    camPtrTbl[12] = camEntryPersp(NULL, "dbg3d", 25.0f, 1.2666666f, 1.0f, 32768.0f, 0.0f, 1.0f);
}

//near/far is perspective, nearZ/farZ is projection
CameraEntry* camEntryPersp(CameraCallback callback, const char* name, f32 fovY, f32 aspect, f32 near, f32 far, f32 nearZ, f32 farZ) {
	CameraEntry* camera;

	camera = __memAlloc(HEAP_DEFAULT, sizeof(CameraEntry));
	memset(camera, 0, sizeof(CameraEntry));
	MTXPerspective(camera->projection, fovY, aspect, near, far);
	camera->type = GX_PERSPECTIVE;
	camera->cameraPos = camPtDefault;
	camera->target = camAtDefault;
	camera->cameraUp = camUpDefault;
	camera->near = near;
	camera->far = far;
	camera->field_0x114 = 0.0f;
	camera->field_0x118 = VECDistance(&camera->cameraPos, &camera->target);
	camera->callback = callback;
	camera->mode = 0;
	camera->field_0x4 = 0;
	camera->field_0x8 = 0.0f;
	camera->fovY = fovY;
	camera->aspect = aspect;
	camera->bankRotation = 0.0f;
	camera->postTranslation.z = 0.0f;
	camera->postTranslation.y = 0.0f;
	camera->postTranslation.x = 0.0f;
	camera->field_0x1E8 = 8;
	strcpy(camera->name, name);
	camera->mScissor[0] = 0;
	camera->mScissor[1] = 0;
	camera->mScissor[2] = DEMOGetRenderModeObj()->fbWidth;
	camera->mScissor[3] = DEMOGetRenderModeObj()->efbHeight;
	camera->mProjection[0] = 0.0f;
	camera->mProjection[1] = 0.0f;
	camera->mProjection[2] = (f32)DEMOGetRenderModeObj()->fbWidth;
	camera->mProjection[3] = (f32)DEMOGetRenderModeObj()->efbHeight;
	camera->mProjection[4] = nearZ;
	camera->mProjection[5] = farZ;
	camera->field_0x1F0 = (Vec){0.0f, 8.0f, 400.0f};
	camera->field_0x20C = (Vec){0.0f, 0.0f, 0.0f};
	camera->field_0x200 = (Vec){0.0f, 0.0f, 0.0f};
	camera->field_0x218 = 0;
	camera->field_0x21A = 0;
	camera->field_0x21C = 0;
	camera->field_0x21E = 0;
	camera->field_0x224 = (Vec){0.0f, 0.0f, 0.0f};
	camera->field_0x230 = (Vec){10.0f, 10.0f, 10.0f};
	camera->field_0x23C = (Vec){0.0f, 0.0f, 0.0f};
	camera->field_0x248 = (Vec){0.0f, 0.0f, 0.0f};
	return camera;
}

void camMain(void) {
	CameraEntry* camera;
	int i;
	Mtx rotate, translate;

	for (i = 0; i < 13; i++) {
		camera = camPtrTbl[i];
		if (camera->callback) {
			camera->callback(camera);
		}
		MTXLookAt(camera->view, &camera->cameraPos, &camera->cameraUp, &camera->target);
		MTXRotRad(rotate, 'z', MTXDegToRad(camera->bankRotation));
		MTXTrans(translate, camera->postTranslation.x, camera->postTranslation.y, camera->postTranslation.z);
		MTXConcat(rotate, camera->view, camera->view);
		MTXConcat(translate, camera->view, camera->view);

		if (i == CAMERA_3D && !gp->inBattle) {
			//do stuff, TODO: finish more of MarioWork
		}
	}
}

void camEvalNearFar(CameraEntry* camera) {

}

void camDraw(void) {

}










void camEffMain(CameraEntry* camera) {

}

void cam3dImgMain(CameraEntry* camera) {

}

void cam3dMain(CameraEntry* camera) {

}





CameraEntry* camGetPtr(s32 id) {
	return camPtrTbl[id];
}

CameraEntry* camGetCurPtr(void) {
	return camPtrTbl[currentCamNo];
}
