#include "driver/fadedrv.h"
#include "driver/animdrv.h"
#include "driver/arcdrv.h"
#include "driver/camdrv.h"
#include "driver/imgdrv.h"
#include "mgr/dvdmgr.h"
#include "memory.h"
#include "system.h"
#include <dolphin/dvd.h>
#include <string.h>

extern int sprintf(char* str, const char* format, ...);

u8 i4tex = 0xFF; //TODO: align 32-byte

static FadeWork* wp;

//local prototypes
void _callback(s32 error, DVDFileInfo* info);
void disp_texture(CameraId cameraId, void* param);
void z(void);
static void zFill(void);
void disp_maku(CameraId cameraId, void* param);
void disp_tec(CameraId cameraId, void* param);
void disp_dummy_black(CameraId cameraId, void* param);

void _callback(s32 error, DVDFileInfo* info) {
	UnpackTexPalette(wp->texture);
	DVDMgrClose(info->cb.userData);
	wp->loaded = TRUE;
}

void fadeInit(void) {
	int i;

	wp = __memAlloc(HEAP_DEFAULT, sizeof(FadeWork));
	memset(wp, 0, sizeof(FadeWork));

	for (i = 0; i < 5; i++) {
		wp->entries[i].field_0x6C = -1;
		wp->entries[i].field_0x70 = -1;

		wp->entries[i].fadeSpotX = 0.0f;
		wp->entries[i].fadeSpotY = 0.0f;

		wp->entries[i].animOffsetX = 0.0f;
		wp->entries[i].animOffsetY = 0.0f;

		wp->entries[i].field_0x90 = 1.0f;

		wp->entries[i].field_0xA4 = 0;
	}

	wp->field_0x350 = -1;
	wp->texture = NULL;
	wp->loaded = FALSE;
}

void fadeTexSetup(void) {
	DVDEntry* dvd;
	u32 size;
	char path[128];

	wp->texture = NULL;
	wp->texture = arcOpen("fade.tpl", NULL, NULL);
	if (wp->texture) {
		UnpackTexPalette(wp->texture);
		wp->loaded = TRUE;
	}
	else {
		sprintf(path, "%s/fade.tpl", getMarioStDvdRoot());
		dvd = DVDMgrOpen(path, 2, 0);
		size = OSRoundUp32B(DVDMgrGetLength(dvd));
		wp->texture = __memAlloc(HEAP_DEFAULT, size);
		dvd->info.cb.userData = dvd;
		DVDMgrReadAsync(dvd, wp->texture, size, 0, _callback);
	}
}

//TODO: probably lots of switch statements
void fadeEntry(s32 type, s32 duration, GXColor color) {
	if (!type) {
		return;
	}
	if (type == 16) { //type 16 is type 9 but white
		type = 9;
		color = (GXColor){0xF0, 0xF0, 0xF0, 0xFF};
	}
	if (type == 17) {
		type = 10;
		color = (GXColor){0xF0, 0xF0, 0xF0, 0xFF};
	}
	if (type == 18) {
		type = 11;
		color = (GXColor){0xF0, 0xF0, 0xF0, 0xFF};
	}
	if (type == 19) {
		type = 12;
		color = (GXColor){0xF0, 0xF0, 0xF0, 0xFF};
	}
	if (type == 20) {
		type = 14;
		color = (GXColor){0xF0, 0xF0, 0xF0, 0xFF};
	}
	if (type == 21) {
		type = 15;
		color = (GXColor){0xF0, 0xF0, 0xF0, 0xFF};
	}
	if ((type == 1 || type == 2) && duration < 1000) {
		duration = 1000;
	}
	if (type == 7) {
		type = 3;
	}
	else if (type == 8) {
		type = 4;
	}
	else if (((type - 3) <= 2 || type == 6) && duration < 1000) {
		duration = 1000;
	}

}

void fadeTecOn(void) {
	wp->flags |= 0x1000;
}

void fadeTecOff(void) {
	wp->flags &= ~0x1000;
}

void fadeTecSoftOn(void) {
	wp->flags |= 0x1010;
	wp->field_0x354 = 0.0f;
}

void fadeTecSoftOff(void) {
	wp->flags |= 0x1020;
	wp->field_0x354 = 1.0f;
}

void fadeSoftFocusOn(void) {
	wp->flags |= 0x2000;
}

void fadeSoftFocusOff(void) {
	wp->flags &= ~0x2000;
}

void fadeWhiteOutOn(void) {
	wp->flags |= 0x4000;
}

void fadeWhiteOutOff(void) {
	wp->flags &= ~0x4000;
}

void fadeSetSpotPos(f32 x, f32 y) {
	wp->entries[0].fadeSpotX = x;
	wp->entries[0].fadeSpotY = y;
}

void fadeSetAnimOfsPos(f32 x, f32 y) {
	wp->entries[1].animOffsetX = x;
	wp->entries[1].animOffsetY = y;
}

void fadeSetAnimVirtualPos(f32 x, f32 y, f32 z) {
	FadeEntry* entry = &wp->entries[1];
	entry->VirtualPos = (Vec){x, y, z};
	entry->flags |= 4;
}

void fadeSetOffscreenCallback(OffscreenCallback callback, void* param) {
	wp->entries[3].callback = callback;
	wp->entries[3].offparam = param;
}

void fadeMain(void) {

}

void disp_texture(CameraId cameraId, void* param) {
	//passed wp, unused
}

void z(void) {

}

static void zFill(void) {

}

void disp_maku(CameraId cameraId, void* param) {
	FadeEntry* entry = param;

}

void disp_tec(CameraId cameraId, void* param) {
	//passed wp, unused

}

void disp_dummy_black(CameraId cameraId, void* param) {
	//passed wp, unused

}

BOOL fadeIsFinish(void) {
	return TRUE;
}

void fadeReset(s32 id) { //TODO: better param name?
	FadeEntry* entry;

	entry = &wp->entries[id];
	if (entry->field_0x6C >= 0) {
		animPoseRelease(entry->field_0x6C);
	}
	if (entry->field_0x70 >= 0) {
		animPaperPoseRelease(entry->field_0x70);
	}
	if (entry->image) {
		imgRelease(entry->image, entry->imageType);
	}
	memset(entry, 0, sizeof(FadeEntry));
	entry->field_0x6C = -1;
	entry->field_0x70 = -1;
	entry->fadeSpotX = 0.0f;
	entry->fadeSpotY = 0.0f;
	entry->animOffsetX = 0.0f;
	entry->animOffsetY = 0.0f;
	entry->field_0x90 = 1.0f;
}

TPLHeader* fadeGetTpl(void) {
	return wp->texture;
}

void fadeSetNarrowFast(void) {
	wp->entries[1].flags |= 8;
}
