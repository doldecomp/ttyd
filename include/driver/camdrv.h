#pragma once

#include <dolphin/gx.h>
#include <dolphin/mtx.h>

//#pragma enumsalwaysint on

typedef void (*CameraCallback)(struct CameraEntry* entry);

//see camInit
typedef enum CameraId {
	CAMERA_OFFSCREEN = 0,
	CAMERA_OFFSCREEN2 = 1,
	CAMERA_SHADOW = 2,
	CAMERA_BACKGROUND = 3,
	CAMERA_3D = 4,
	CAMERA_3D_EFFECTA = 5,
	CAMERA_3D_IMAGE = 6,
	CAMERA_3D_EFFECTB = 7,
	CAMERA_2D = 8,
	CAMERA_FADE = 9,
	CAMERA_FADE2 = 10,
	CAMERA_DEBUG = 11,
	CAMERA_DEBUG_3D = 12
} CameraId;

typedef struct CameraEntry {
	u16 flags; //0x0
	u16 mode; //0x2
	u16 field_0x4; //0x4
	u16 field_0x6; //0x6, padding?
	f32 field_0x8; //0x8
	Vec cameraPos; //0xC
	Vec target; //0x18
	Vec cameraUp; //0x24
	f32 near; //0x30
	f32 far; //0x34
	f32 fovY; //0x38
	f32 aspect; //0x3C
	u8 field_0x40[0xF4 - 0x40]; //0x40
	u16 mScissor[4]; //0xF4, TODO retype?
	f32 mProjection[6]; //0xFC, TODO retype?
	f32 field_0x114; //0x114
	f32 field_0x118; //0x118
	Mtx view; //0x11C
	f32 bankRotation; //0x14C
	Vec postTranslation; //0x150
	Mtx44 projection; //0x15C
	GXProjectionType type; //0x19C
	u8 field_0x1A0[0x1E8 - 0x1A0]; //0x1A0
	u32 field_0x1E8; //0x1E8
	CameraCallback callback; //0x1EC
	Vec field_0x1F0; //0x1F0
	u32 field_0x1FC; //0x1FC, unknown
	Vec field_0x200; //0x200
	Vec field_0x20C; //0x20C
	u16 field_0x218; //0x218
	u16 field_0x21A; //0x21A
	u16 field_0x21C; //0x21C
	u16 field_0x21E; //0x21E
	u32 field_0x220; //0x220, unknown
	Vec field_0x224; //0x224
	Vec field_0x230; //0x230
	Vec field_0x23C; //0x23C
	Vec field_0x248; //0x248
	char name[0xC]; //0x254
} CameraEntry;

//u32 test = sizeof(cameraObj); //0x260/608

void camInit(void);
void camMain(void);
void camDraw(void);

CameraEntry* camGetPtr(s32 id);
CameraEntry* camGetCurPtr(void);
