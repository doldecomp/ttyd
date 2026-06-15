#pragma once

#include <dolphin/gx.h>
#include <dolphin/mtx.h>

typedef struct CameraEntry CameraEntry;
typedef void (*CameraCallback)(CameraEntry* entry);

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
    CAMERA_DEBUG_3D = 12,
    CAMERA_MAX,
} CameraId;

struct CameraEntry {
    u16 flags;                   // 0x0
    u16 mode;                    // 0x2
    u16 stateA;                  // 0x4
    u8 align_6[0x8 - 0x6];       // 0x6
    f32 progressA;               // 0x8
    Vec cameraPos;               // 0xC
    Vec cameraAt;                // 0x18
    Vec cameraUp;                // 0x24
    f32 near;                    // 0x30
    f32 far;                     // 0x34
    f32 fovY;                    // 0x38
    f32 aspect;                  // 0x3C
    Vec storedPos;               // 0x40
    Vec storedAt;                // 0x4C
    Vec presetPos;               // 0x58
    Vec presetAt;                // 0x64
    s64 startTimeA;              // 0x70
    s64 durationA;               // 0x78
    u8 curveA;                   // 0x80
    u8 align_81[0x82 - 0x81];    // 0x81
    u16 stateB;                  // 0x82
    f32 progressB;               // 0x84
    Vec blendPos;                // 0x88
    Vec marioPos;                // 0x94
    Vec blendAt;                 // 0xA0
    Vec marioAt;                 // 0xAC
    Vec anchor;                  // 0xB8
    Vec anchorPrev;              // 0xC4
    s64 startTimeB;              // 0xD0
    s64 durationB;               // 0xD8
    u8 curveB;                   // 0xE0
    u8 align_E1[0xE4 - 0xE1];    // 0xE1
    f32 dollyPercent;            // 0xE4
    f32 dollyStart;              // 0xE8
    f32 dollyEnd;                // 0xEC
    f32 dollyStartAlt;           // 0xF0
    u16 scissor[4];              // 0xF4
    f32 viewport[6];             // 0xFC
    f32 viewYaw;                 // 0x114
    f32 viewDistance;            // 0x118
    Mtx view;                    // 0x11C
    f32 rollAngle;               // 0x14C
    Vec viewOffset;              // 0x150
    Mtx44 projection;            // 0x15C
    GXProjectionType projType;   // 0x19C
    Mtx44 projAdjust;            // 0x1A0
    s16 letterBoxAlpha;          // 0x1E0
    s16 letterBoxTop;            // 0x1E2
    s16 letterBoxBottom;         // 0x1E4
    u8 align_1E6[0x1E8 - 0x1E6]; // 0x1E6
    CameraId letterBoxCamId;     // 0x1E8
    CameraCallback callback;     // 0x1EC
    Vec field_1F0;               // 0x1F0
    u32 field_1FC;               // 0x1FC
    Vec field_200;               // 0x200
    Vec field_20C;               // 0x20C
    u16 field_218;               // 0x218
    u16 field_21A;               // 0x21A
    u16 field_21C;               // 0x21C
    u16 field_21E;               // 0x21E
    u32 field_220;               // 0x220
    Vec field_224;               // 0x224
    Vec field_230;               // 0x230
    Vec field_23C;               // 0x23C
    Vec field_248;               // 0x248
    char name[0xC];              // 0x254
};

void camInit(void);
void camMain(void);
void camDraw(void);

void camLoadRoad(CameraId cameraId, const char* filename);
void camUnLoadRoad(CameraId cameraId);

CameraEntry* camGetPtr(CameraId cameraId);
CameraEntry* camGetCurPtr(void);
CameraId camGetCurNo(void);
void camSetCurNo(CameraId cameraId);

void camSetMode(CameraId cameraId, u16 mode);
void camDispOn(CameraId cameraId);
void camDispOff(CameraId cameraId);
void camCtrlOn(CameraId cameraId);
void camCtrlOff(CameraId cameraId);
void camSetTypePersp(CameraId cameraId);
void camSetTypeOrtho(CameraId cameraId);

void getScreenPoint(Vec* model, Vec* screen);
void camLetterBox(void);
