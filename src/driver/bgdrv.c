#include "driver/bgdrv.h"
#include "driver/arcdrv.h"
#include "driver/camdrv.h"
#include "driver/dispdrv.h"
#include "manager/dvdmgr.h"
#include "mario/mariost.h"
#include "memory.h"
#include "system.h"
#include "texPalette.h"
#include <math.h>
#include <string.h>

#define PI 3.14159265358979323846264338327950288419716939937510
#define TWO_PI 6.28318530717958647692528676655900576839433879875021

extern GlobalWork* gp;
extern int sprintf(char* str, const char* format, ...);

//.bss
static BackgroundWork work[2];

//local prototypes
void bgDisp(CameraId cameraId, void* param);

//TODO: inline function? I see nothing in the symbol map
#define bgGetWork() (gp->inBattle ? &work[1] : &work[0])

void bgInit(void) {
	memset(&work[0], 0, sizeof(BackgroundWork));
	memset(&work[1], 0, sizeof(BackgroundWork));
}

void bgReInit(void) {
	memset(bgGetWork(), 0, sizeof(BackgroundWork));
}

void bgEntry(const char* filename) {
	BackgroundWork* bgwork;
	TEXPalette* tpl;
	DVDEntry* dvd;
	GXColor color;
	u32 size;
	char path[256]; //TODO: check
	
	bgwork = bgGetWork();
	size = 0;
	if (filename) {
		bgwork->data = NULL;
		arcOpen(filename, &bgwork->data, &size);
		if (!bgwork->data) {
			sprintf(path, "%s/%s", getMarioStDvdRoot(), filename);
			dvd = DVDMgrOpen(path, 2, 0);
			if (dvd) {
				size = DVDMgrGetLength(dvd);
				bgwork->data = _mapAlloc(OSRoundUp32B(size));
				DVDMgrRead(dvd, bgwork->data, OSRoundUp32B(size), 0);
				DVDMgrClose(dvd);
			}
		}
		tpl = (TEXPalette*)bgwork->data;
		if (tpl) {
			UnpackTexPalette(tpl);
			color = (GXColor){0xFF, 0xFF, 0xFF, 0xFF};
			bgwork->flags |= 1;
			bgwork->flags &= ~2;
			bgwork->flags &= ~4;
		}
		else {
			color = (GXColor){0xFF, 0xFF, 0xFF, 0xFF};
			bgwork->flags |= 2u;
			bgwork->multiply = (GXColor){0x00, 0xFF, 0x00, 0xFF};
			bgwork->flags |= 1u;
		}
		bgwork->color = color;
	}
	else {
		bgwork->flags &= ~1;
	}
}

void bgReEntry(const char* filename) {
	BackgroundWork* bgwork;
	TEXPalette* tpl;
	DVDEntry* dvd;
	GXColor color;
	u32 size;
	char path[256]; //TODO: check

	_mapFree(bgGetWork()->data);
	bgwork = bgGetWork();
	size = 0;
	if (filename) {
		bgwork->data = NULL;
		arcOpen(filename, &bgwork->data, &size);
		if (!bgwork->data) {
			sprintf(path, "%s/%s", getMarioStDvdRoot(), filename);
			dvd = DVDMgrOpen(path, 2, 0);
			if (dvd) {
				size = DVDMgrGetLength(dvd);
				bgwork->data = _mapAlloc(OSRoundUp32B(size));
				DVDMgrRead(dvd, bgwork->data, OSRoundUp32B(size), 0);
				DVDMgrClose(dvd);
			}
		}
		tpl = (TEXPalette*)bgwork->data;
		if (tpl) {
			UnpackTexPalette(tpl);
			color = (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF };
			bgwork->flags |= 1;
			bgwork->flags &= ~2;
			bgwork->flags &= ~4;
		}
		else {
			color = (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF };
			bgwork->flags |= 2u;
			bgwork->multiply = (GXColor){ 0x00, 0xFF, 0x00, 0xFF };
			bgwork->flags |= 1u;
		}
		bgwork->color = color;
	}
	else {
		bgwork->flags &= ~1;
	}
}

void bgSetColor(GXColor color) {
	bgGetWork()->color = color;
}

void bgDispOn(void) {
	bgGetWork()->flags |= 1;
}

void bgDispOff(void) {
	bgGetWork()->flags &= ~1;
}

void bgSetScrlOffset(f32 x, f32 y) {
	BackgroundWork* bgwork = bgGetWork();
	bgwork->scrl_x = x;
	bgwork->scrl_y = y;
}

void bgAutoScrollOff(void) {
	bgGetWork()->flags |= 4;
}

void bgAutoScrollOn(void) {
	bgGetWork()->flags &= ~4;
}

void bgTransOffsetOff(void) {
	bgGetWork()->flags |= 8;
}

void bgTransOffsetOn(void) {
	bgGetWork()->flags &= ~8;
}

void bgMain(void) {
	f32 angle, sinangle, cosangle, v8, v11;
	BackgroundWork* bgwork;
	CameraEntry* camera;
	GXTexObj texobj;
	u32 width;
		
	bgwork = bgGetWork();
	if (bgwork->flags & 1) {
		camera = camGetPtr(CAMERA_3D);
		angle = (TWO_PI * reviseAngle(-camera->field_0x114)) / 360.0f;
		sinangle = sin(angle);
		cosangle = cos(angle);
		v8 = 0.0f;
		if (bgwork->flags & 2) {
			width = 0;
		}
		else {
			TEXGetGXTexObjFromPalette(bgwork->data, &texobj, 0);
			width = gp->fbWidth / GXGetTexObjWidth(&texobj);
		}
		if (!(bgwork->flags & 8)) {
			v8 = (0.001f * ((cosangle * camera->target.x) - (sinangle * camera->target.z))) + v8;
		}
		v11 = 4.0f * (camGetPtr(CAMERA_3D)->field_0x114 / 360.0f);
		bgwork->trans_x = ((f32)width * v11) + v8;
		dispEntry(CAMERA_BACKGROUND, 3, bgDisp, NULL, 0.0f);
	}
}

void bgDisp(CameraId cameraId, void* param) {
	BackgroundWork* bgwork = bgGetWork();
	CameraEntry* camera = camGetPtr(cameraId);
	if (bgwork->flags & 1) {
		GXSetAlphaUpdate(GX_FALSE);
		GXSetCullMode(GX_CULL_BACK);
		GXSetZCompLoc(GX_TRUE);
		GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
		GXSetBlendMode(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_OR);
		GXSetZMode(GX_FALSE, GX_ALWAYS, GX_FALSE);
	}
}
