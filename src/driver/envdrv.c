#include "driver/envdrv.h"
#include "driver/arcdrv.h"
#include "driver/dispdrv.h"
#include "mario/mariost.h"
#include "manager/dvdmgr.h"
#include "system.h"
#include "texPalette.h"
#include <dolphin/dvd.h>
#include <string.h>

extern int sprintf(char* str, const char* format, ...);
extern GlobalWork* gp;

//.data
EnvironmentGlare envGlare0 = {
    GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_TEV_KCSEL_K1_A, GX_TEV_KCSEL_K0_A, 5.25f, 16,
    {
        {-1.0f, 0.0f}, {-3.0f, 0.0f}, {-5.0f, 0.0f}, {-7.0f, 0.0f},
    {1.0f, 0.0f}, {3.0f, 0.0f}, {5.0f, 0.0f}, {7.0f, 0.0f},
    {0.0f, -1.0f}, {0.0f, -3.0f}, {0.0f, -5.0f}, {0.0f, -7.0f},
    {0.0f, 1.0f}, {0.0f, 3.0f}, {0.0f, 5.0f}, {0.0f, 7.0f},
}
};

EnvironmentGlare envGlare1 = {
    GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_TEV_KCSEL_K1_A, GX_TEV_KCSEL_1, 3.5f, 8,
    {
        {-1.41419994831f, -1.41419994831f}, {0.0f, -1.0f}, {1.41419994831f, -1.41419994831f}, {-1.0f, 0.0f},
    {1.0f, 0.0f}, {-1.41419994831f, 1.41419994831f}, {0.0f, 1.0f}, {1.41419994831f, 1.41419994831f},
}
};

EnvironmentGlare envGlare2 = {
    GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_TEV_KCSEL_K1_A, GX_TEV_KCSEL_3_4, 3.5f, 52,
    {
        {0.0f, -5.0f}, {-1.0f, -4.0f}, {0.0f, -4.0f}, {1.0f, -4.0f},
    {-2.0f, -3.0f}, {-1.0f, -3.0f}, {0.0f, -3.0f}, {1.0f, -3.0f},
    {2.0f, -3.0f}, {-3.0f, -2.0f}, {-2.0f, -2.0f}, {-1.0f, -2.0f},
    {0.0f, -2.0f}, {1.0f, -2.0f}, {2.0f, -2.0f}, {3.0f, -2.0f},
    {-3.0f, -1.0f}, {-2.0f, -1.0f}, {-1.0f, -1.0f}, {0.0f, -1.0f},
    {1.0f, -1.0f}, {2.0f, -1.0f}, {3.0f, -1.0f}, {-3.0f, 0.0f},
    {-2.0f, 0.0f}, {-1.0f, 0.0f}, {3.0f, 0.0f}, {2.0f, 0.0f},
    {1.0f, 0.0f}, {-3.0f, 1.0f}, {-2.0f, 1.0f}, {-1.0f, 1.0f},
    {0.0f, 1.0f}, {1.0f, 1.0f}, {2.0f, 1.0f}, {3.0f, 1.0f},
    {-3.0f, 2.0f}, {-2.0f, 2.0f}, {-1.0f, 2.0f}, {0.0f, 2.0f},
    {1.0f, 2.0f}, {2.0f, 2.0f}, {3.0f, 2.0f}, {-2.0f, 3.0f},
    {-1.0f, 3.0f}, {0.0f, 3.0f}, {1.0f, 3.0f}, {2.0f, 3.0f},
    {-1.0f, 4.0f}, {0.0f, 4.0f}, {1.0f, 4.0f}, {0.0f, 5.0f},
}
};

EnvironmentGlare envGlare3 = {
    GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_TEV_KCSEL_K1_A, GX_TEV_KCSEL_1, 3.5f, 16,
    {
        {0.0f, -4.0f}, {-1.0f, -3.0f}, {1.0f, -3.0f}, {-2.0f, -2.0f},
    {2.0f, -2.0f}, {-3.0f, -1.0f}, {3.0f, -1.0f}, {-3.0f, 0.0f},
    {3.0f, 0.0f}, {-3.0f, 1.0f}, {3.0f, 1.0f}, {-2.0f, 2.0f},
    {2.0f, 2.0f}, {-1.0f, 3.0f}, {1.0f, 3.0f}, {0.0f, 4.0f},
}
};

//.bss
static EnvironmentWork work[2];

//.sbss
s32 v_count; //TODO: re-type all these
s32 u2;
s32 u1;
s32 a;
s32 frame_cnt;
s32 tpl_ok;
TEXPalette* env_tpl;

//local prototypes
void _callback(s32 result, DVDFileInfo* fileInfo);
void envCapture(CameraId cameraId, void* param);
void envCapture2(CameraId cameraId, void* param);
void envDisp(CameraId cameraId, void* param);
void envDisp2(CameraId cameraId, void* param);
void envDisp_DepthOfField(void);
void envDisp_Blur(void);

//there is no function so we'll make a macro
#define envGetWork() (gp->inBattle ? &work[1] : &work[0])

static void _callback(s32 result, DVDFileInfo* fileInfo) {
    DVDEntry* handle = fileInfo->cb.userData;

    UnpackTexPalette(env_tpl);
    DVDMgrClose(handle);
    tpl_ok = TRUE;
}

void envInit(void) {
    memset(&work[0], 0, sizeof(EnvironmentWork));
    memset(&work[1], 0, sizeof(EnvironmentWork));
    env_tpl = NULL;
    tpl_ok = FALSE;
}

void envReInit(void) {
    EnvironmentWork* wp = envGetWork();
    memset(wp, 0, sizeof(EnvironmentWork));
}

void envTexSetup(void) { //1:1
    DVDEntry* entry;
    TEXPalette* tpl;
    char path[128];
    u32 size;

    env_tpl = NULL;
    tpl = arcOpen("env.tpl", 0, 0);
    env_tpl = tpl;
    if (!tpl) {
        sprintf(path, "%s/env.tpl", getMarioStDvdRoot());
        entry = DVDMgrOpen(path, 2, 0);
        size = DVDMgrGetLength(entry);
        env_tpl = __memAlloc(HEAP_DEFAULT, OSRoundUp32B(size));
        entry->info.cb.userData = entry;
        DVDMgrReadAsync(entry, env_tpl, size, 0, _callback);
    }
    else {
        UnpackTexPalette(tpl);
        tpl_ok = 1;
    }
}

void envCapture(CameraId cameraId, void* param) { //1:1
    EnvironmentWork* wp = envGetWork();
    u16 var0, var1, var2, var3;
    u32 size;
    
    var0 = gp->fbWidth;
    var1 = gp->efbHeight;
    var2 = (u16)(((u32)var0 & 0xFFFF) / 2);
    var3 = (u16)(((u32)var1 & 0xFFFF) / 2);
    if (wp->flags & 1) {
        GXSetTexCopySrc(0, 0, gp->fbWidth, gp->efbHeight);
        GXSetTexCopyDst(var2, var3, GX_TF_RGBA8, GX_TRUE);
        size = GXGetTexBufferSize(var2, var3, GX_TF_RGBA8, GX_FALSE, 0);
        wp->capture = smartAlloc(size, 3);
        GXCopyTex(wp->capture->address, GX_FALSE);
        GXPixModeSync();
        GXInitTexObj(&wp->captureObj, wp->capture->address, var2, var3, GX_TF_RGBA8, GX_CLAMP, GX_CLAMP, GX_FALSE);
        GXInitTexObjLOD(&wp->captureObj, GX_LINEAR, GX_LINEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    }
    if (wp->flags & 2) {
        GXSetTexCopySrc(0, 0, var0, var1);
        GXSetTexCopyDst(var2, var3, GX_CTF_Z8M, GX_TRUE);
        size = GXGetTexBufferSize(var2, var3, GX_CTF_Z8M, GX_FALSE, 0);
        wp->capture2 = smartAlloc(size, 3);
        GXCopyTex(wp->capture2->address, 0);
        GXPixModeSync();
        GXInitTexObj(&wp->captureObj2, wp->capture2->address, var2, var3, GX_TF_I8, GX_CLAMP, GX_CLAMP, GX_FALSE);
        GXInitTexObjLOD(&wp->captureObj2, GX_LINEAR, GX_LINEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    }
}

void envCapture2(CameraId cameraId, void* param) { //1:1
    EnvironmentWork* wp = envGetWork();
    u16 var0, var1;

    var0 = (u16)(((u32)gp->fbWidth & 0xFFFF) / 2);
    var1 = (u16)(((u32)gp->efbHeight & 0xFFFF) / 2);
    if (wp->flags & 4) {
        GXSetTexCopySrc(0, 0, gp->fbWidth, gp->efbHeight);
        GXSetTexCopyDst(var0, var1, GX_TF_RGB565, GX_TRUE);
        GXCopyTex(wp->envBlur, GX_FALSE);
        GXPixModeSync();
        GXInitTexObj(&wp->envBlurObj, wp->envBlur, var0, var1, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, GX_FALSE);
        GXInitTexObjLOD(&wp->envBlurObj, GX_LINEAR, GX_LINEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    }
    if (wp->flags & 0x40000000) {
        if ((wp->unk98 & 1) && (wp->flags & 8)) {
            wp->flags &= ~4;
        }
        wp->flags |= 8;
    }
}

void envDisp(CameraId cameraId, void *param) {
    f32 vp[GX_VIEWPORT_SZ];
    f32 pm[GX_PROJECTION_SZ];

    GXGetViewportv(vp);
    GXGetProjectionv(pm);
    //envDisp_DepthOfField();
    //envDisp_Blur();
    //envDisp_FF();
    GXSetViewport(vp[0], vp[1], vp[2], vp[3], vp[4], vp[5]);
    GXSetProjectionv(pm);
}

void envDisp2(CameraId cameraId, void *param) { //almost 1:1, needs extra addi
    f32 vp[GX_VIEWPORT_SZ];
    f32 pm[GX_PROJECTION_SZ];
    EnvironmentWork* wp;
    EnvironmentGlareFilter* filter;

    GXGetViewportv(vp);
    GXGetProjectionv(pm);
    wp = envGetWork();
    filter = &wp->filter; //CodeWarrior is very good compiler, yesyes
    if (wp->flags & 0x20000000) {
        switch (filter->type) {
            case 0:
                break;
            case 1:
                envGlare(&envGlare0);
                break;
            case 2:
                envGlare(&envGlare1);
                break;
            case 3:
                envGlare(&envGlare2);
                break;
            case 4:
                envGlare(&envGlare3);
                break;
        }
    }
    GXSetViewport(vp[0], vp[1], vp[2], vp[3], vp[4], vp[5]);
    GXSetProjectionv(pm);
}

void envMain(void) {
    dispEntry(CAMERA_3D, 7, envCapture, 0, 20.0f);
    dispEntry(CAMERA_3D, 7, envDisp, 0, 10.0f);
    dispEntry(CAMERA_3D, 7, envCapture2, 0, 0.0f);
    dispEntry(CAMERA_3D, 8, envDisp2, 0, 5000.0f);
}







#define PI 3.141592653589793f
#define TWO_PI 6.283185307179586f
s32 texmtx_tbl[] = {30, 33, 36, 39, 42, 45, 48, 51, 54, 57, 4, 5, 6, 14, 0, 1, 2, 3, 8, 9, 10}; //TODO: put in right spot

void envDisp_DepthOfField(void) {
    EnvironmentWork* wp = envGetWork();
    Mtx sp48;
    Mtx sp18;
    s8 sp17;
    u8 sp14;
    s32 sp10;
    s32 spC;
    s32 sp8;
    f32 temp_f0;
    f32 temp_f0_10;
    f32 temp_f0_11;
    f32 temp_f0_12;
    f32 temp_f0_13;
    f32 temp_f0_14;
    f32 temp_f0_15;
    f32 temp_f0_16;
    f32 temp_f0_17;
    f32 temp_f0_18;
    f32 temp_f0_19;
    f32 temp_f0_20;
    f32 temp_f0_21;
    f32 temp_f0_22;
    f32 temp_f0_23;
    f32 temp_f0_24;
    f32 temp_f0_25;
    f32 temp_f0_26;
    f32 temp_f0_27;
    f32 temp_f0_28;
    f32 temp_f0_2;
    f32 temp_f0_3;
    f32 temp_f0_4;
    f32 temp_f0_5;
    f32 temp_f0_6;
    f32 temp_f0_7;
    f32 temp_f0_8;
    f32 temp_f0_9;
    f32 temp_f1;
    f32 temp_f1_10;
    f32 temp_f1_2;
    f32 temp_f1_3;
    f32 temp_f1_4;
    f32 temp_f1_5;
    f32 temp_f1_6;
    f32 temp_f1_7;
    f32 temp_f1_8;
    f32 temp_f1_9;
    f32 temp_f24;
    f32 temp_f24_2;
    f32 temp_f25;
    f32 temp_f25_2;
    f32 temp_f26;
    f32 temp_f26_2;
    f32 temp_f27;
    f32 temp_f27_2;
    f32 temp_f28;
    f32 temp_f28_2;
    f32 temp_f29;
    f32 temp_f2;
    f32 temp_f2_2;
    f32 temp_f30;
    f32 temp_f31;
    f32 temp_f31_2;
    f32 temp_f3;
    f32 temp_f3_2;
    f32 temp_f3_3;
    f32 temp_f3_4;
    f32 temp_f4;
    f32 temp_f4_2;
    f32 var_f2;
    f32 var_f2_2;
    f32 var_f4;
    f32 var_f4_2;
    s32 temp_r26;
    s32 temp_r27_2;
    s32 temp_r28;
    s32 var_r25;
    s32 var_r25_2;
    s32 var_r26;
    s32 var_r30_2;
    //s32 var_r31;
    s32 var_r31_2;
    s32* var_r26_2;
    s32* var_r30;
    u8 temp_r5;
    u8 temp_r5_2;
    CameraEntry* temp_r27;
    EnvironmentUnk88* temp_r29;
    GlobalWork* temp_r8;
    GlobalWork* temp_r8_2;

    GXTexObj* texobj;
    GXTevColorArg v33; // r7
    GXTevAlphaArg v34; // r7
    GXTevColorArg v59; // r7
    GXTevAlphaArg v60; // r7
    int i;

    f32 v15; // fp31
    u32 *v16; // r30
    GXTexCoordID v17; // r25
    f32 v18;
    GXTexCoordID v19;
    f32 v20;
    f32 v22;
    f32 v23;
    f32 v24;
    f32 v25;
    f32 v26;
    f32 v27;
    f32 v28;
    f32 v29;
    f32 v30;
    f32 v31;
    f32 v32;
    f32 v81;

    s32 r25, r26, r31;
    s32* r30;
    f32 f0, f1, f2, f3, f4, f24, f25, f26, f27, f28, f29, f31;

    temp_r29 = &wp->unk88;
    if (wp->flags & 0x80000000) {
        temp_r27 = camGetPtr(CAMERA_2D);
        GXSetProjection(camGetPtr(CAMERA_2D)->projection, temp_r27->type);
        GXLoadPosMtxImm(camGetPtr(CAMERA_2D)->view, 0);
        GXSetCurrentMtx(0);
        texobj = smartTexObj(&wp->captureObj, (void**)wp->capture);
        GXLoadTexObj(texobj, 0);
        texobj = smartTexObj(&wp->captureObj2, (void**)wp->capture2);
        GXLoadTexObj(texobj, 1);
        GXSetNumChans(0);
        GXSetChanCtrl(4, 0, 0, 0, 0, 2, 2);
        GXSetBlendMode(0, 1, 0, 7);
        GXSetZCompLoc(0);
        GXSetAlphaCompare(6, 0x80, 1, 0, 0);
        GXSetZMode(0, 3, 0);
        GXClearVtxDesc();
        GXSetVtxDesc(9, 1);
        GXSetVtxDesc(0xD, 1);
        GXSetVtxAttrFmt(0, 9, 1, 4, 0);
        GXSetVtxAttrFmt(0, 0xD, 1, 4, 0);
        GXSetCullMode(0);
        if ((temp_r29->unk0 & 1) && (temp_r29->unk4)) {
            f31 = TWO_PI;
            r30 = texmtx_tbl;
            r25 = 0;
            f29 = 0.25f;
            r26 = 0;
            f26 = 0.16605f;
            r31 = 0;
            f27 = 1.0f;
            f28 = PI;
            f25 = 0.4967f;
            f24 = 100.0f;
            for (;r31 < 4;) {
                f2 = 0.00761f;
                f0 = (f32)r31;
                f0 = (f31 * f0);
                f3 = f0 * f29;
                if (f3 <= f28) {
                    f1 = MTXDegToRad(90.0f);
                    if (f3 <= f1) {
                        f0 = f3 * f3;
                        f2 = (f2 * f0) - f26;
                        f2 = (f2 * f0) + f27;
                        f2 - f2 * f3;
                    }
                    else {
                        f0 = f3 - f1;
                        f1 = f1 - f0;
                        f0 = f1 * f1;
                        f2 = (f2 * f0) - f26;
                        f2 = (f2 * f0) + f27;
                        f2 - f2 * f1;
                    }
                }
                else {
                    f0 = MTXDegToRad(270.0f);
                    if (f3 <= f0) {
                        f0 = f3 - f0;
                        f1 = MTXDegToRad(90.0f);
                        f1 = f1 - f0;
                        f0 = f1 * f1;
                        f2 = (f2 * f0) - f26;
                        f2 = (f2 * f0) + f27;
                        f2 = f2 * f1;
                        f2 = -f2;
                    }
                    else {
                        f1 = f3 - f28;
                        f0 = f1 * f1;
                        f2 = (f2 * f0) - f26;
                        f2 = (f2 * f0) + f27;
                        f2 = f2 * f1;
                        f2 = -f2;
                    }
                }
                f4 = 0.03705f;
                if (f3 > f28) {
                    f0 = MTXDegToRad(270.0f);
                    if (f3 >= f1) {
                        f0 = f3 - f0;
                        f1 = MTXDegToRad(90.0f);
                        f0 = f1 - f0;
                        f0 = f0 * f0;
                        f4 = (f4 * f0) - f25;
                        f4 = (f4 * f0) + f27;
                    }
                    else {
                        f0 = f3 - f28;
                        f0 = f0 * f0;
                        f4 = (f4 * f0) - f25;
                        f4 = (f4 * f0) + f27;
                        f4 = -f4;
                    }

                }
                else {
                    f1 = MTXDegToRad(90.0f);
                    if (f3 > f1) {
                        f0 = f3 - f1;
                        f0 = f1 - f0;
                        f0 = f0 * f0;
                        f4 = (f4 * f0) - f25;
                        f4 = (f4 * f0) + f27;
                        f4 = -f4;
                    }
                    else {
                        f0 = f3 * f3;
                        f4 = (f4 * f0) - f25;
                        f4 = (f4 * f0) + f27;
                    }
                }

                MTXTrans(sp48, (temp_r29->unk4 * f2) / f24, (temp_r29->unk4 * f4) / f24, 0.0f);
                r31++;
            }
            /*v15 = TWO_PI;
            v16 = texmtx_tbl;
            v17 = GX_TEXCOORD0;
            v18 = 0.25f;
            v19 = GX_TEVSTAGE0;
            v20 = 0.16605f;
            i = 0;
            v22 = 1.0f;
            v23 = PI;
            v24 = 0.4967f;
            v25 = 100.0f;
            for (i = 0; i < 4; i++) {
            v81 = (f32)i;
            v26 = (v15 * v81) * v18;
            if (v26 <= v23) {
            if (v26 <= MTXDegToRad(90.0f)) {
            v27 = (((((0.00761f * (v26 * v26)) - v20) * (v26 * v26)) + v22) * v26);
            }
            else {
            v28 = (MTXDegToRad(90.0f) - (((v15 * v81) * v18) - MTXDegToRad(90.0f)));
            v27 = (((((0.00761f * (v28 * v28)) - v20) * (v28 * v28)) + v22) * v28);
            }
            }
            else {
            if (v26 < MTXDegToRad(270.0f)) {
            v27 = -(((((0.00761f * ((v26 - v23) * (v26 - v23))) - v20) * ((v26 - v23) * (v26 - v23))) + v22) * (v26 - v23));
            }
            else {
            v29 = (MTXDegToRad(90.0f) - (((v15 * v81) * v18) - MTXDegToRad(270.0f)));
            v27 = -(((((0.00761f * (v29 * v29)) - v20) * (v29 * v29)) + v22) * v29);
            }
            }
            if (v26 <= v23) {
            if (v26 <= MTXDegToRad(90.0f)) {
            v30 = ((((0.03705f * (v26 * v26)) - v24) * (v26 * v26)) + v22);
            }
            else {
            v31 = (MTXDegToRad(90.0f) - (((v15 * v81) * v18) - MTXDegToRad(90.0f)));
            v30 = -((((0.03705f * (v31 * v31)) - v24) * (v31 * v31)) + v22);
            }
            }
            else {
            if (v26 < MTXDegToRad(270.0f)) {
            v30 = -((((0.03705f * ((v26 - v23) * (v26 - v23))) - v24) * ((v26 - v23) * (v26 - v23))) + v22);
            }
            else {
            v32 = (MTXDegToRad(90.0f) - (((v15 * v81) * v18) - MTXDegToRad(270.0f)));
            v30 = ((((0.03705f * (v32 * v32)) - v24) * (v32 * v32)) + v22);
            }
            }
            PSMTXTrans(
            sp48,
            ((temp_r29->unk4 * v27) / v25),
            ((temp_r29->unk4 * v30) / v25),
            0.0f);
            GXLoadTexMtxImm(sp48, *v16, GX_MTX2x4);
            GXSetTexCoordGen2(v17, GX_TG_MTX2x4, GX_TG_TEX0, *v16, GX_FALSE, GX_PTIDENTITY);
            GXSetTevKColorSel(v19, GX_TEV_KCSEL_1_4);
            GXSetTevKAlphaSel(v19, 6);
            GXSetTevOrder(v19, v17, GX_TEXMAP0, GX_COLOR_NULL);
            GXSetTevColorOp(v19, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, (GXTevRegID)(i == 3));
            GXSetTevAlphaOp(v19, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, (GXTevRegID)(i == 3));
            v33 = GX_CC_CPREV;
            if ( !i )
            v33 = GX_CC_ZERO;
            GXSetTevColorIn(v19, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, v33);
            v34 = GX_CA_APREV;
            if ( !i )
            v34 = GX_CA_ZERO;
            GXSetTevAlphaIn(v19, GX_CA_ZERO, GX_CA_TEXA, GX_CA_KONST, v34);
            GXSetTevSwapMode(v19, GX_TEV_SWAP0, GX_TEV_SWAP0);
            ++i;
            ++v16;
            ++v19;
            ++v17;
            }*/
            /*temp_f31 = TWO_PI;
            var_r30 = texmtx_tbl;
            var_r25 = 0;
            temp_f29 = 0.25f;
            var_r26 = 0;
            temp_f26 = 0.16605f;
            //var_r31 = 0;
            temp_f27 = 1.0f;
            temp_f28 = PI;
            temp_f25 = 0.4967f;
            temp_f24 = 100.0f;
            for (i = 0; i < 4; i++) {
            //do {
            temp_f2 = 0.00761f;
            temp_f3 = temp_f31 * (f32) i * temp_f29;
            if (temp_f3 <= temp_f28) {
            temp_f1 = MTXDegToRad(-90.0f);
            if (temp_f3 <= temp_f1) {
            temp_f0 = temp_f3 * temp_f3;
            var_f2 = ((((temp_f2 * temp_f0) - temp_f26) * temp_f0) + temp_f27) * temp_f3;
            } else {
            temp_f1_2 = temp_f1 - (temp_f3 - temp_f1);
            temp_f0_2 = temp_f1_2 * temp_f1_2;
            var_f2 = ((((temp_f2 * temp_f0_2) - temp_f26) * temp_f0_2) + temp_f27) * temp_f1_2;
            }
            } else {
            temp_f0_3 = MTXDegToRad(270.0f);
            if (temp_f3 < temp_f0_3) {
            temp_f1_3 = temp_f3 - temp_f28;
            temp_f0_4 = temp_f1_3 * temp_f1_3;
            var_f2 = -(((((temp_f2 * temp_f0_4) - temp_f26) * temp_f0_4) + temp_f27) * temp_f1_3);
            } else {
            temp_f1_4 = MTXDegToRad(-90.0f) - (temp_f3 - temp_f0_3);
            temp_f0_5 = temp_f1_4 * temp_f1_4;
            var_f2 = -(((((temp_f2 * temp_f0_5) - temp_f26) * temp_f0_5) + temp_f27) * temp_f1_4);
            }
            }
            temp_f4 = 0.03705f;
            if (temp_f3 <= temp_f28) {
            temp_f1_5 = MTXDegToRad(-90.0f);
            if (temp_f3 <= temp_f1_5) {
            temp_f0_6 = temp_f3 * temp_f3;
            var_f4 = (((temp_f4 * temp_f0_6) - temp_f25) * temp_f0_6) + temp_f27;
            } else {
            temp_f0_7 = temp_f1_5 - (temp_f3 - temp_f1_5);
            temp_f0_8 = temp_f0_7 * temp_f0_7;
            var_f4 = -((((temp_f4 * temp_f0_8) - temp_f25) * temp_f0_8) + temp_f27);
            }
            } else {
            temp_f0_9 = MTXDegToRad(270.0f);
            if (temp_f3 < temp_f0_9) {
            temp_f0_10 = temp_f3 - temp_f28;
            temp_f0_11 = temp_f0_10 * temp_f0_10;
            var_f4 = -((((temp_f4 * temp_f0_11) - temp_f25) * temp_f0_11) + temp_f27);
            } else {
            temp_f0_12 = MTXDegToRad(-90.0f) - (temp_f3 - temp_f0_9);
            temp_f0_13 = temp_f0_12 * temp_f0_12;
            var_f4 = (((temp_f4 * temp_f0_13) - temp_f25) * temp_f0_13) + temp_f27;
            }
            }
            temp_f0_14 = temp_r29->unk4;
            PSMTXTrans(sp48, (temp_f0_14 * var_f2) / temp_f24, (temp_f0_14 * var_f4) / temp_f24, 0.0f);
            GXLoadTexMtxImm(sp48, *var_r30, 1);
            GXSetTexCoordGen2(var_r25, 1, 4, *var_r30, 0, 0x7D);
            GXSetTevKColorSel(var_r26, 6);
            GXSetTevKAlphaSel(var_r26, 6);
            GXSetTevOrder(var_r26, var_r25, 0, 0xFF);
            GXSetTevColorOp(var_r26, 0, 0, 0, 1, i == 3);
            GXSetTevAlphaOp(var_r26, 0, 0, 0, 1, i == 3);
            v33 = GX_CC_CPREV;
            if ( !i )
            v33 = GX_CC_ZERO;
            GXSetTevColorIn(var_r26, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, v33);
            v34 = GX_CA_APREV;
            if ( !i )
            v34 = GX_CA_ZERO;
            GXSetTevAlphaIn(var_r26, GX_CA_ZERO, GX_CA_TEXA, GX_CA_KONST, v34);
            GXSetTevSwapMode(var_r26, GX_TEV_SWAP0, GX_TEV_SWAP0);
            temp_r27_2 = var_r31 == 0;
            if (temp_r27_2 != 0) {

            }
            GXSetTevColorIn(var_r26, 0xF, 8, 0xE);
            if (temp_r27_2 != 0) {

            }
            GXSetTevAlphaIn();
            GXSetTevSwapMode(var_r26, 0, 0);
            //var_r31 += 1;
            var_r30 += 4;
            var_r26 += 1;
            var_r25 += 1;
            }// while (var_r31 < 4);*/
            /*GXSetTevKColor(GX_KCOLOR0, (GXColor){temp_r29->unk2, 0, 0, 0xFF});
            GXSetTexCoordGen2(v17, 1, 4, 0x3C, 0, 0x7D);
            GXSetTevKColorSel(v19, 0xC);
            GXSetTevKAlphaSel(v19, 0x1C);
            GXSetTevOrder(v19, v17, 1, 0xFF);
            GXSetTevColorOp(v19, 8, 0, 0, 1, 0);
            GXSetTevAlphaOp(v19, 8, 0, 0, 1, 0);
            GXSetTevColorIn(v19, 8, 0xE, 2, 0xF);
            GXSetTevAlphaIn(v19, 4, 6, 1, 7);
            GXSetTevSwapMode(v19, 0, 0);
            GXSetNumTexGens((s8) (v17 + 1));
            GXSetNumTevStages((s8) (v19 + 1));*/
            GXBegin(0x80, 0, 4);
            temp_r8 = gp;
            temp_f3_2 = 0.5f;
            *(f32* )0xCC010000 = (f32) -(s32) temp_r8->fbWidth * temp_f3_2;
            *(f32* )0xCC008000 = (f32) temp_r8->efbHeight * temp_f3_2;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = (f32) temp_r8->fbWidth * temp_f3_2;
            *(f32* )0xCC008000 = (f32) temp_r8->efbHeight * temp_f3_2;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = 1.0f;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = (f32) temp_r8->fbWidth * temp_f3_2;
            *(f32* )0xCC008000 = (f32) -(s32) temp_r8->efbHeight * temp_f3_2;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = 1.0f;
            *(f32* )0xCC008000 = 1.0f;
            *(f32* )0xCC008000 = (f32) -(s32) temp_r8->fbWidth * temp_f3_2;
            *(f32* )0xCC008000 = (f32) -(s32) temp_r8->efbHeight * temp_f3_2;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = 0.0f;
            *(f32* )0xCC008000 = 1.0f;
        }
        if ((temp_r29->unk0 & 2) && (temp_r29->unk8 != 0.0f)) {
            var_r31_2 = 0;
            temp_f28_2 = TWO_PI;
            var_r26_2 = texmtx_tbl;
            temp_f30 = 0.25f;
            var_r30_2 = 0;
            temp_f26_2 = 0.16605f;
            var_r25_2 = 0;
            temp_f25_2 = 1.0f;
            temp_f31_2 = PI;
            temp_f27_2 = 0.4967f;
            temp_f24_2 = 100.0f;
            do {
                temp_f2_2 = 0.00761f;
                temp_f3_3 = temp_f28_2 * (f32) var_r25_2 * temp_f30;
                if (temp_f3_3 <= temp_f31_2) {
                    temp_f1_6 = MTXDegToRad(-90.0f);
                    if (temp_f3_3 <= temp_f1_6) {
                        temp_f0_15 = temp_f3_3 * temp_f3_3;
                        var_f2_2 = ((((temp_f2_2 * temp_f0_15) - temp_f26_2) * temp_f0_15) + temp_f25_2) * temp_f3_3;
                    } else {
                        temp_f1_7 = temp_f1_6 - (temp_f3_3 - temp_f1_6);
                        temp_f0_16 = temp_f1_7 * temp_f1_7;
                        var_f2_2 = ((((temp_f2_2 * temp_f0_16) - temp_f26_2) * temp_f0_16) + temp_f25_2) * temp_f1_7;
                    }
                } else {
                    temp_f0_17 = MTXDegToRad(270.0f);
                    if (temp_f3_3 < temp_f0_17) {
                        temp_f1_8 = temp_f3_3 - temp_f31_2;
                        temp_f0_18 = temp_f1_8 * temp_f1_8;
                        var_f2_2 = -(((((temp_f2_2 * temp_f0_18) - temp_f26_2) * temp_f0_18) + temp_f25_2) * temp_f1_8);
                    } else {
                        temp_f1_9 = MTXDegToRad(-90.0f) - (temp_f3_3 - temp_f0_17);
                        temp_f0_19 = temp_f1_9 * temp_f1_9;
                        var_f2_2 = -(((((temp_f2_2 * temp_f0_19) - temp_f26_2) * temp_f0_19) + temp_f25_2) * temp_f1_9);
                    }
                }
                temp_f4_2 = 0.03705f;
                if (temp_f3_3 <= temp_f31_2) {
                    temp_f1_10 = MTXDegToRad(-90.0f);
                    if (temp_f3_3 <= temp_f1_10) {
                        temp_f0_20 = temp_f3_3 * temp_f3_3;
                        var_f4_2 = (((temp_f4_2 * temp_f0_20) - temp_f27_2) * temp_f0_20) + temp_f25_2;
                    } else {
                        temp_f0_21 = temp_f1_10 - (temp_f3_3 - temp_f1_10);
                        temp_f0_22 = temp_f0_21 * temp_f0_21;
                        var_f4_2 = -((((temp_f4_2 * temp_f0_22) - temp_f27_2) * temp_f0_22) + temp_f25_2);
                    }
                } else {
                    temp_f0_23 = MTXDegToRad(270.0f);
                    if (temp_f3_3 < temp_f0_23) {
                        temp_f0_24 = temp_f3_3 - temp_f31_2;
                        temp_f0_25 = temp_f0_24 * temp_f0_24;
                        var_f4_2 = -((((temp_f4_2 * temp_f0_25) - temp_f27_2) * temp_f0_25) + temp_f25_2);
                    } else {
                        temp_f0_26 = MTXDegToRad(-90.0f) - (temp_f3_3 - temp_f0_23);
                        temp_f0_27 = temp_f0_26 * temp_f0_26;
                        var_f4_2 = (((temp_f4_2 * temp_f0_27) - temp_f27_2) * temp_f0_27) + temp_f25_2;
                    }
                }
                temp_f0_28 = temp_r29->unk8;
                PSMTXTrans(sp18, (temp_f0_28 * var_f2_2) / temp_f24_2, (temp_f0_28 * var_f4_2) / temp_f24_2, 0.0f);
                GXLoadTexMtxImm(sp18, *var_r26_2, 1);
                GXSetTexCoordGen2(var_r31_2, 1, 4, *var_r26_2, 0, 0x7D);
                GXSetTevKColorSel(var_r30_2, 6);
                GXSetTevKAlphaSel(var_r30_2, 6);
                GXSetTevOrder(var_r30_2, var_r31_2, 0, 0xFF);
                GXSetTevColorOp(var_r30_2, 0, 0, 0, 1, var_r25_2 == 3);
                GXSetTevAlphaOp(var_r30_2, 0, 0, 0, 1, var_r25_2 == 3);
                v59 = GX_CC_CPREV;
                if ( !var_r25_2 )
                    v59 = GX_CC_ZERO;
                GXSetTevColorIn(var_r30_2, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, v59);
                v60 = GX_CA_APREV;
                if ( !var_r25_2 )
                    v60 = GX_CA_ZERO;
                GXSetTevAlphaIn(var_r30_2, GX_CA_ZERO, GX_CA_TEXA, GX_CA_KONST, v60);
                GXSetTevSwapMode(var_r30_2, GX_TEV_SWAP0, GX_TEV_SWAP0);
                /*temp_r28 = var_r25_2 == 0;
                if (temp_r28 != 0) {

                }
                GXSetTevColorIn(var_r30_2, 0xF, 8, 0xE);
                if (temp_r28 != 0) {

                }
                GXSetTevAlphaIn();
                GXSetTevSwapMode(var_r30_2, 0, 0);*/
                var_r25_2 += 1;
                var_r26_2 += 4;
                var_r30_2 += 1;
                var_r31_2 += 1;
            } while (var_r25_2 < 4);
            GXSetTevKColor(GX_KCOLOR0, (GXColor){temp_r29->unk3, 0, 0, 0xFF});
            /*temp_r5_2 = temp_r29->unk3;
            sp17 = 0xFF;
            sp14 = temp_r5_2;
            spC = (s32) sp14;
            GXSetTevKColor(0, &spC, temp_r5_2);*/
            GXSetTexCoordGen2(var_r31_2, 1, 4, 0x3C, 0, 0x7D);
            GXSetTevColor(GX_TEVREG1, (GXColor){0xFF, 0xFF, 0xFF, 0xFF});
            //sp8 = lbl_8041E510;
            //GXSetTevColor(2, &sp8);
            GXSetTevKColorSel(var_r30_2, 0xC);
            GXSetTevKAlphaSel(var_r30_2, 0x1C);
            GXSetTevOrder(var_r30_2, var_r31_2, 1, 0xFF);
            GXSetTevColorOp(var_r30_2, 8, 0, 0, 1, 0);
            GXSetTevAlphaOp(var_r30_2, 8, 0, 0, 1, 0);
            GXSetTevColorIn(var_r30_2, 8, 0xE, 0xC, 0xF);
            GXSetTevAlphaIn(var_r30_2, 4, 6, 2, 7);
            GXSetTevSwapMode(var_r30_2, 0, 0);
            temp_r26 = var_r30_2 + 1;
            GXSetTevOrder(temp_r26, 0xFF, 0xFF, 0xFF);
            GXSetTevColorOp(temp_r26, 0, 0, 0, 1, 0);
            GXSetTevAlphaOp(temp_r26, 0, 0, 0, 1, 0);
            GXSetTevColorIn(temp_r26, 2, 0xF, 1, 0xF);
            GXSetTevAlphaIn(temp_r26, 1, 7, 0, 7);
            GXSetTevSwapMode(temp_r26, 0, 0);
            GXSetNumTexGens((s8) (var_r31_2 + 1));
            GXSetNumTevStages((s8) (var_r30_2 + 2));
            GXBegin(0x80, 0, 4);
            temp_r8_2 = gp;
            temp_f3_4 = 0.5f;
            *(f32*)0xCC010000 = (f32) ((f32) -(s32) temp_r8_2->fbWidth * temp_f3_4);
            *(f32*)0xCC008000 = (f32) ((f32) temp_r8_2->efbHeight * temp_f3_4);
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) ((f32) temp_r8_2->fbWidth * temp_f3_4);
            *(f32*)0xCC008000 = (f32) ((f32) temp_r8_2->efbHeight * temp_f3_4);
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) 1.0f;
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) ((f32) temp_r8_2->fbWidth * temp_f3_4);
            *(f32*)0xCC008000 = (f32) ((f32) -(s32) temp_r8_2->efbHeight * temp_f3_4);
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) 1.0f;
            *(f32*)0xCC008000 = (f32) 1.0f;
            *(f32*)0xCC008000 = (f32) ((f32) -(s32) temp_r8_2->fbWidth * temp_f3_4);
            *(f32*)0xCC008000 = (f32) ((f32) -(s32) temp_r8_2->efbHeight * temp_f3_4);
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) 0.0f;
            *(f32*)0xCC008000 = (f32) 1.0f;
        }
    }
}







//almost 1:1, needs some regalloc work and type changes
void envGlare(EnvironmentGlare* glare) {
    EnvironmentWork* var_r4 = envGetWork();
    EnvironmentGlareFilter* temp_r30;
    void* temp_r19;
    u32 temp_r20;
    u32 temp_r21;
    u16 temp_r26;
    u16 temp_r27;
    EnvironmentGlare* var_r21;
    EnvironmentGlare* var_r22_3;
    s32 temp_r31;
    s32 temp_r30_2;

    s32 temp_r20_2;
    s32 temp_r21_2;
    s32 temp_r29;
    s32 var_r22;
    u32 var_r22_2;
    s32 var_r23;
    u32 var_r23_2;
    s32 var_r28;
    s32 var_r19_3;
    u16 temp_r0;
    u16 temp_r8;

    u32 size;
    Mtx44 sp88;
    Mtx sp58;
    Mtx sp28;
    GXTexObj sp8;

    int i;

    frame_cnt += 1.0f;
    temp_r30 = &var_r4->filter;
    temp_r27 = var_r4->filter.y0;
    temp_r26 = var_r4->filter.x0;
    temp_r0 = (u16)(var_r4->filter.y1 - temp_r27);
    temp_r8 = (u16)(var_r4->filter.x1 - temp_r26);
    temp_r20 = ((u32)temp_r0 & 0xFFFF) / 2;
    temp_r21 = ((u32)temp_r8 & 0xFFFF) / 2;
    size = GXGetTexBufferSize((u16)temp_r21, (u16)temp_r20, GX_TF_RGB565, GX_FALSE, 0);
    temp_r19 = smartAlloc(size, 3)->address;
    GXSetTexCopySrc(temp_r26, temp_r27, temp_r8, temp_r0);
    GXSetTexCopyDst((u16)temp_r21, (u16)temp_r20, GX_TF_RGB565, GX_TRUE);
    GXCopyTex(temp_r19, GX_FALSE);
    GXPixModeSync();
    GXInitTexObj(&sp8, temp_r19, (u16)temp_r21, (u16)temp_r20, GX_TF_RGB565, GX_CLAMP, GX_CLAMP, GX_FALSE);
    GXInitTexObjLOD(&sp8, GX_LINEAR, GX_LINEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    GXLoadTexObj(&sp8, GX_TEXMAP0);
    temp_r29 = glare->count;
    var_r28 = 0;
    temp_r20_2 = glare->unkC;
    temp_r21_2 = glare->unk10;
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_SUB, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVREG1);
    GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_KONST, GX_CC_ZERO, GX_CC_ZERO, GX_CC_TEXC);
    GXSetTevKColorSel(GX_TEVSTAGE0, temp_r20_2);
    GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR_NULL);
    GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_C1, GX_CC_KONST, GX_CC_ZERO);
    GXSetTevKColorSel(GX_TEVSTAGE1, temp_r21_2);
    GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);

    i = 0;
    var_r23 = 2;
    var_r22 = 3;
    for (; i < 7; i++) {
        GXSetTevOrder(var_r23, i + 1, 0, 0xFF);
        GXSetTevColorOp(var_r23, 1, 0, 0, 1, 2);
        GXSetTevColorIn(var_r23, 0xE, 0xF, 0xF, 8);
        GXSetTevKColorSel(var_r23, temp_r20_2);
        GXSetTevSwapMode(var_r23, 0, 0);
        GXSetTevOrder(var_r22, 0xFF, 0xFF, 0xFF);
        GXSetTevColorOp(var_r22, 0, 0, 0, 1, 0);
        GXSetTevColorIn(var_r22, 0xF, 4, 0xE, 0);
        GXSetTevKColorSel(var_r22, temp_r21_2);
        GXSetTevSwapMode(var_r22, 0, 0);
        var_r22 += 2;
        var_r23 += 2;
    }

    for (i = 0, var_r22_2 = GX_TEXMTX0; i < 8; i++, var_r22_2 += 3) {
        GXSetTexCoordGen(i, GX_TG_MTX2x4, GX_TG_TEX0, var_r22_2);
    }

    if (temp_r30->flags & 1) {
        GXSetZMode(GX_TRUE, GX_LEQUAL, GX_FALSE);
    } else {
        GXSetZMode(GX_FALSE, GX_ALWAYS, GX_FALSE);
    }
    GXSetBlendMode(glare->mode, glare->srcFactor, glare->dstFactor, GX_LO_CLEAR);
    GXSetNumChans(0);
    GXSetChanCtrl(GX_COLOR0A0, GX_FALSE, GX_SRC_REG, GX_SRC_REG, 0, GX_DF_CLAMP, GX_AF_NONE);
    GXSetViewport(0.0f, 0.0f, (f32)gp->fbWidth, (f32)gp->efbHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, gp->fbWidth, gp->efbHeight);
    MTXOrtho(sp88, 0.0f, (f32)gp->efbHeight, 0.0f, (f32)gp->fbWidth, 0.0f, -32767.0f);
    GXSetProjection(sp88, GX_ORTHOGRAPHIC);
    PSMTXIdentity(sp58);
    GXLoadPosMtxImm(sp58, 0);
    GXSetCurrentMtx(0);
    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
    GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT7, GX_VA_POS, GX_POS_XYZ, GX_S16, 0);
    GXSetVtxAttrFmt(GX_VTXFMT7, GX_VA_TEX0, GX_TEX_ST, GX_U16, 0);
    GXSetCullMode(GX_CULL_BACK);
    GXSetZScaleOffset(1.0f, temp_r30->zscale);
    temp_r30_2 = temp_r27 + temp_r0;
    temp_r31 = temp_r26 + temp_r8;
    var_r21 = glare;
    while (var_r28 < temp_r29) {
        var_r22_3 = var_r21;
        var_r19_3 = 0;
        var_r23_2 = 0x1E;
        while ((var_r19_3 < 8) && (var_r28 < temp_r29)) {
            MTXTrans(sp28, (glare->unk14 * var_r22_3->coords[0].unk0) / (f32) gp->fbWidth, (glare->unk14 * var_r22_3->coords[0].unk4) / (f32) gp->efbHeight, 0.0f); //temp_r4, temp_r5_3, as 2 3 and temp_f4 as last
            GXLoadTexMtxImm(sp28, var_r23_2, 1);
            var_r23_2 += 3;
            var_r19_3 += 1;
            var_r22_3 = (void*)((u32)var_r22_3 + 8);
            var_r21 = (void*)((u32)var_r21 + 8);
            var_r28 += 1;
        }
        GXSetNumTevStages((u8)(var_r19_3 * 2));
        GXSetNumTexGens((u8)var_r19_3);
        GXBegin(GX_QUADS, GX_VTXFMT7, 4);
        GXPosition3s16((s16)temp_r26, (s16)temp_r27, 0);
        GXTexCoord2u16(0, 0);
        GXPosition3s16((s16)temp_r31, (s16)temp_r27, 0);
        GXTexCoord2u16(1, 0);
        GXPosition3s16((s16)temp_r31, (s16)temp_r30_2, 0);
        GXTexCoord2u16(1, 1);
        GXPosition3s16((s16)temp_r26, (s16)temp_r30_2, 0);
        GXTexCoord2u16(0, 1);
    }
}
