/* "dispdrv" - Display Driver
 * Status: 1:1
 *
 * Function: helper functions for rendering and displaying to the screen, others do heavy lifting
 *
 * Last Update: 7/21/2022, finish dispdrv so we can rely on it for other systems
 */

#include "driver/dispdrv.h"
#include "memory.h"
#include "system.h"
#include <dolphin/mtx.h>
#include <string.h>

#define DISP_MAX_ENTRIES 1024

//.sdata
f32 offset_tbl[] = {
	400000.0f, 400000.0f, 600000.0f, 100000.0f, 100000.0f, 
	300000.0f, 900000.0f, 1100000.0f, 1000000.0f, 500000.0f, 
	700000.0f //700K new in retail
};

//.sbss
DispEntry* currentWorkPtr;
s32 entry_n;
DispEntry** pSortWork;
DispEntry* pDispWork;

//local prototypes
s32 _sort(const void** sortA, const void** sortB);

void dispInit(void) {
	pDispWork = __memAlloc(HEAP_DEFAULT, sizeof(DispEntry) * DISP_MAX_ENTRIES);
	pSortWork = __memAlloc(HEAP_DEFAULT, sizeof(DispEntry*) * DISP_MAX_ENTRIES);
	memset(pDispWork, 0, sizeof(DispEntry) * DISP_MAX_ENTRIES);
	memset(pSortWork, 0, sizeof(DispEntry*) * DISP_MAX_ENTRIES);
	entry_n = 0;
}

void dispReInit(void) {
	entry_n = 0;
}

void dispEntry(CameraId cameraId, s32 renderMode, DispCallback callback, void* param, f32 order) {
	DispEntry* entry = &pDispWork[entry_n];

	if (order != order) return;
	entry->cameraId = cameraId;
	entry->renderMode = (u8)renderMode;
	entry->callback = callback;
	entry->param = param;

	switch (renderMode) {
		case 2:
		case 5:
		case 9:
		case 10:
			entry->order = offset_tbl[renderMode] + order;
			break;
		default:
			entry->order = offset_tbl[renderMode] - order;
			break;
	}

	pSortWork[entry_n] = entry;
	entry_n++;
}

s32 _sort(const void** sortA, const void** sortB) {
	f32 temp_f0;
	f32 temp_f1;

	temp_f1 = (*(DispEntry**)sortA)->order;
	temp_f0 = (*(DispEntry**)sortB)->order;
	if (temp_f1 > temp_f0) {
		return 1;
	}
	if (temp_f1 < temp_f0) {
		return -1;
	}
	return 0;
}

void dispSort(void) {
	qqsort(pSortWork, entry_n, 4, _sort);
}

void dispDraw(CameraId cameraId) {
	s32 i;

	for (i = 0; i < entry_n; i++) {
		DispEntry* entry = pSortWork[i];
		if (entry->cameraId == cameraId) {
			GXSetColorUpdate(GX_TRUE);
			switch (cameraId) {
				case 4:
				case 5:
				case 7:
					GXSetAlphaUpdate(GX_FALSE);
					break;
				default:
				case 6:
					GXSetAlphaUpdate(GX_TRUE);
					break;
			}
			GXSetZScaleOffset(1.0f, 0.0f);
			switch (entry->renderMode) {
				case 0:
					GXSetBlendMode(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_OR);
					GXSetZCompLoc(GX_TRUE);
					GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
					GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
					break;
				case 3:
					GXSetBlendMode(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
					GXSetZCompLoc(GX_TRUE);
					GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
					GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
					break;
				case 1:
					GXSetBlendMode(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
					GXSetZCompLoc(GX_FALSE);
					GXSetAlphaCompare(GX_GEQUAL, 0x80, GX_AOP_OR, GX_NEVER, 0);
					GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
					break;
				case 4:
					GXSetBlendMode(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
					GXSetZCompLoc(GX_FALSE);
					GXSetAlphaCompare(GX_GEQUAL, 0x80, GX_AOP_OR, GX_NEVER, 0);
					GXSetZMode(GX_FALSE, GX_LEQUAL, GX_FALSE);
					break;
				case 2:
				case 5:
				case 9:
				case 10:
					GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
					GXSetZCompLoc(GX_TRUE);
					GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
					GXSetZMode(GX_TRUE, GX_LEQUAL, GX_FALSE);
					break;
			}
			currentWorkPtr = entry;
			entry->callback(cameraId, entry->param);
		}
	}
}

f32 dispCalcZ(Vec* input) {
	CameraEntry* camera;
	Vec output;
	f32 calc;

	camera = camGetPtr(CAMERA_3D);
	MTXMultVec(camera->view, input, &output);
	MTX44MultVec(camera->projection, &output, &output);
	calc = (5000.0f * output.z) + 5000.0f;
	if (calc < 0.0f) {
		calc = 0.0f;
	} else if (calc > 10000.0f) {
		calc = 10000.0f;
	}
	calc *= -1.0f;
	return calc;
}

DispEntry* dispGetCurWork(void) {
	return currentWorkPtr;
}
