#include "driver/camdrv.h"
#include "driver/mapdrv.h"
#include "driver/seqdrv.h"
#include "evt/evt_bero.h"
#include "mario/mario.h"
#include "mario/mariost.h"
#include "mario/mario_cam.h"
#include "sdk/DEMOInit.h"
#include "memory.h"
#include "party.h"
#include "pmario_sound.h"
#include "system.h"

extern double tan(double arg);
// NOTE: this is ~roughly 12.5 degrees in radians, ideally it should be MTXDegToRad(12.5) or 5PI/72
#define DEG_TO_RAD_12_5__1 0.21816612780094147
#define DEG_TO_RAD_12_5__2 0.21816615760326385

//.bss
CameraEntry* camPtrTbl[CAMERA_MAX];

//.sdata
Vec camPtDefault = { 0.0f, 0.0f, 1000.0f };
Vec camAtDefault = { 0.0f, 0.0f, 0.0f };
Vec camUpDefault = { 0.0f, 1.0f, 0.0f };

//.sbss
CameraId currentCamNo;

typedef struct CameraParams {
    f32 fovY;   // 0x00
    f32 aspect; // 0x04
    f32 far;    // 0x08
    Vec pos;    // 0x0C
    Vec at;     // 0x18
} CameraParams;

// forward declarations
CameraEntry* camEntryPersp(CameraCallback callback, f32 fovY, f32 aspect, f32 near, f32 far, f32 nearZ, f32 farZ,
                           const char* name);
CameraEntry* camEntryOrtho(CameraCallback callback, f32 fovY, f32 aspect, f32 top, f32 bottom, f32 left, f32 right,
                           f32 near, f32 far, f32 nearZ, f32 farZ, const char* name);
void camEvalNearFar(CameraEntry* camera);
void cam3dMain(CameraEntry* camera);
void cam3dImgMain(CameraEntry* camera);
void camEffMain(CameraEntry* camera);
void camLetterBox(void);
inline Vec makeVecByValue(f32 x, f32 y, f32 z);

void camInit(void) {
    f32 deg2rad;

    camPtrTbl[0] =
        camEntryOrtho(NULL, 25.0f, 1.2666666f, 240.0f, -240.0f, -304.0f, 304.0f, 1.0f, 32768.0f, 0.0f, 1.0f, "off");

    camPtrTbl[1] =
        camEntryOrtho(NULL, 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f, "off2");

    camPtrTbl[2] =
        camEntryOrtho(NULL, 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f, "shadow");

    camPtrTbl[3] = camEntryOrtho(NULL, 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f, "bg");

    camPtrTbl[4] = camEntryPersp(cam3dMain, 25.0f, 1.2666666f, 1.0f, 32768.0f, 0.0f, 1.0f, "3d");

    camPtrTbl[5] = camEntryPersp(camEffMain, 25.0f, 1.2666666f, 100.0f, 10000.0f, 0.2f, 0.3f, "3deff_A");

    camPtrTbl[6] = camEntryPersp(cam3dImgMain, 25.0f, 1.3333334f, 1.0f, 32768.0f, 0.0f, 1.0f, "3dimg");
    deg2rad = (f32)tan(DEG_TO_RAD_12_5__1);
    camPtrTbl[6]->cameraPos = makeVecByValue(0.0f, 0.0f, 24.0f / deg2rad);

    camPtrTbl[7] = camEntryPersp(camEffMain, 25.0f, 1.2666666f, 100.0f, 10000.0f, 0.2f, 0.3f, "3deff_B");

    camPtrTbl[8] = camEntryPersp(NULL, 25.0f, 1.2666666f, 100.0f, 10000.0f, 0.1f, 0.2f, "2d");
    deg2rad = (f32)tan(DEG_TO_RAD_12_5__1);
    camPtrTbl[8]->cameraPos = makeVecByValue(0.0f, 0.0f, 240.0f / deg2rad);

    camPtrTbl[9] = camEntryPersp(NULL, 25.0f, 1.3333334f, 1.0f, 32768.0f, 0.0f, 0.1f, "fade");
    deg2rad = (f32)tan(DEG_TO_RAD_12_5__1);
    camPtrTbl[9]->cameraPos = makeVecByValue(0.0f, 0.0f, 24.0f / deg2rad);

    camPtrTbl[10] = camEntryPersp(NULL, 25.0f, 1.3333334f, 1.0f, 32768.0f, 0.0f, 0.1f, "fade2");
    deg2rad = (f32)tan(DEG_TO_RAD_12_5__1);
    camPtrTbl[10]->cameraPos = makeVecByValue(0.0f, 0.0f, 24.0f / deg2rad);

    camPtrTbl[11] =
        camEntryOrtho(NULL, 25.0f, 1.2666666f, 0.0f, 480.0f, 0.0f, 608.0f, 1.0f, 32768.0f, 0.0f, 1.0f, "dbg");

    camPtrTbl[12] = camEntryPersp(NULL, 25.0f, 1.2666666f, 1.0f, 32768.0f, 0.0f, 1.0f, "dbg3d");
}

// near/far is perspective, nearZ/farZ is projection
CameraEntry* camEntryPersp(CameraCallback callback, f32 fovY, f32 aspect, f32 near, f32 far, f32 nearZ, f32 farZ,
                           const char* name) {
    CameraEntry* camera = __memAlloc(HEAP_DEFAULT, sizeof(CameraEntry));
    memset(camera, 0, sizeof(CameraEntry));
    MTXPerspective(camera->projection, fovY, aspect, near, far);
    camera->projType = GX_PERSPECTIVE;
    camera->cameraPos = camPtDefault;
    camera->cameraAt = camAtDefault;
    camera->cameraUp = camUpDefault;
    camera->near = near;
    camera->far = far;
    camera->viewYaw = 0.0f;
    camera->viewDistance = VECDistance(&camera->cameraPos, &camera->cameraAt);
    camera->callback = callback;
    camera->mode = 0;
    camera->stateA = 0;
    camera->progressA = 0.0f;
    camera->fovY = fovY;
    camera->aspect = aspect;
    camera->rollAngle = 0.0f;
    camera->viewOffset.z = 0.0f;
    camera->viewOffset.y = 0.0f;
    camera->viewOffset.x = 0.0f;
    camera->letterBoxCamId = CAMERA_2D;
    strcpy(camera->name, name);
    camera->scissor[0] = 0;
    camera->scissor[1] = 0;
    camera->scissor[2] = DEMOGetRenderModeObj()->fbWidth;
    camera->scissor[3] = DEMOGetRenderModeObj()->efbHeight;
    camera->viewport[0] = 0.0f;
    camera->viewport[1] = 0.0f;
    camera->viewport[2] = (f32)DEMOGetRenderModeObj()->fbWidth;
    camera->viewport[3] = (f32)DEMOGetRenderModeObj()->efbHeight;
    camera->viewport[4] = nearZ;
    camera->viewport[5] = farZ;
    camera->field_1F0.x = 0.0f;
    camera->field_1F0.y = 8.0f;
    camera->field_1F0.z = 400.0f;
    camera->field_20C.x = 0.0f;
    camera->field_20C.y = 0.0f;
    camera->field_20C.z = 0.0f;
    camera->field_200.x = 0.0f;
    camera->field_200.y = 0.0f;
    camera->field_200.z = 0.0f;
    camera->field_218 = 0;
    camera->field_21A = 0;
    camera->field_21C = 0;
    camera->field_21E = 0;
    camera->field_224 = (Vec){ 0.0f, 0.0f, 0.0f };
    camera->field_230 = (Vec){ 10.0f, 10.0f, 10.0f };
    camera->field_23C = (Vec){ 0.0f, 0.0f, 0.0f };
    camera->field_248 = (Vec){ 0.0f, 0.0f, 0.0f };
    return camera;
}

inline CameraEntry* camEntryOrtho(CameraCallback callback, f32 fovY, f32 aspect, f32 top, f32 bottom, f32 left,
                                  f32 right, f32 near, f32 far, f32 nearZ, f32 farZ, const char* name) {
    CameraEntry* camera = __memAlloc(HEAP_DEFAULT, sizeof(CameraEntry));
    memset(camera, 0, sizeof(CameraEntry));
    MTXOrtho(camera->projection, top, bottom, left, right, near, far);
    camera->projType = GX_ORTHOGRAPHIC;
    camera->cameraPos = camPtDefault;
    camera->cameraAt = camAtDefault;
    camera->cameraUp = camUpDefault;
    camera->near = near;
    camera->far = far;
    camera->viewYaw = 0.0f;
    camera->viewDistance = VECDistance(&camera->cameraPos, &camera->cameraAt);
    camera->callback = callback;
    camera->mode = 0;
    camera->rollAngle = 0.0f;
    // ???
    camera->viewOffset.z = 0.0f;
    camera->viewOffset.y = 0.0f;
    camera->viewOffset.x = 0.0f;
    camera->aspect = aspect;
    camera->fovY = fovY;
    camera->letterBoxCamId = CAMERA_2D;
    strcpy(camera->name, name);
    camera->scissor[0] = 0;
    camera->scissor[1] = 0;
    camera->scissor[2] = DEMOGetRenderModeObj()->fbWidth;
    camera->scissor[3] = DEMOGetRenderModeObj()->efbHeight;
    camera->viewport[0] = 0.0f;
    camera->viewport[1] = 0.0f;
    camera->viewport[2] = (f32)DEMOGetRenderModeObj()->fbWidth;
    camera->viewport[3] = (f32)DEMOGetRenderModeObj()->efbHeight;
    camera->viewport[4] = nearZ;
    camera->viewport[5] = farZ;
    return camera;
}

inline void clampScaled(f32* val, f32 min, f32 max, f32 range) {
    if (*val < min * range) {
        *val = min * range;
    } else if (*val > max * range) {
        *val = max * range;
    }
}

void camMain(void) {
    Mtx rot, trans;
    Mtx transMtx, scaleMtx, fxMtx;
    f32 savedProj[GX_PROJECTION_SZ], viewport[GX_VIEWPORT_SZ], proj[GX_PROJECTION_SZ];
    Vec projPt;
    Vec screen;
    Vec focus;
    CameraEntry* cam3d;
    f32 weight, zoom, hExtent, vExtent, scale;
    int cameraId;

    for (cameraId = 0; cameraId < CAMERA_MAX; cameraId++) {
        CameraEntry* camera = camPtrTbl[cameraId];
        if (camera->callback != NULL) {
            camera->callback(camera);
        }
        MTXLookAt(camera->view, &camera->cameraPos, &camera->cameraUp, &camera->cameraAt);
        MTXRotRad(rot, 'z', MTXDegToRad(camera->rollAngle));
        MTXTrans(trans, camera->viewOffset.x, camera->viewOffset.y, camera->viewOffset.z);
        MTXConcat(rot, camera->view, camera->view);
        MTXConcat(trans, camera->view, camera->view);

        if (cameraId == CAMERA_3D && !gp->inBattle) {
            weight = marioGetPtr()->field_64;

            // Focus, M.
            focus = (Vec){ 0.0f, 0.0f, 0.0f };
            focus.x = marioGetPtr()->position.x + marioGetPtr()->field_6C.x;
            focus.y = marioGetPtr()->position.y + marioGetPtr()->field_6C.y;
            focus.z = marioGetPtr()->position.z + marioGetPtr()->field_6C.z;
            projPt = focus;

            zoom = marioGetPtr()->field_68;

            hExtent = weight * (1.0f - 1.0f / zoom) * (f32)DEMOGetRenderModeObj()->fbWidth;
            vExtent = weight * (1.0f - 1.0f / zoom) * (f32)DEMOGetRenderModeObj()->efbHeight;

            GXGetProjectionv(savedProj);
            cam3d = camPtrTbl[CAMERA_3D];
            GXSetProjection(cam3d->projection, cam3d->projType);
            GXGetProjectionv(proj);
            GXGetViewportv(viewport);
            GXProject(projPt.x, projPt.y, projPt.z, cam3d->view, proj, viewport, &screen.x, &screen.y, &screen.z);
            GXSetProjectionv(savedProj);

            screen.x = screen.x - 304.0f;
            screen.y = 240.0f - screen.y;
            if (weight > 1.0f) {
                weight = 1.0f;
            } else if (weight < 0.0f) {
                weight = 0.0f;
            }

            screen.x = 0.5f * screen.x * weight;
            screen.y = 0.5f * screen.y * weight;

            clampScaled(&screen.x, -hExtent, hExtent, 0.2f);
            clampScaled(&screen.y, -vExtent, vExtent, 0.2f);

            scale = weight * zoom + (1.0f - weight);
            PSMTXTrans(transMtx, -screen.x, -screen.y, 0.0f);
            PSMTXScale(scaleMtx, scale, scale, 1.0f);
            PSMTXConcat(scaleMtx, transMtx, fxMtx);
            PSMTXConcat(fxMtx, camera->view, camera->view);
        }

        if (camera->flags & 8) {
            PSMTX44Concat(camera->projAdjust, camera->projection, camera->projection);
            camera->flags &= ~8;
        }
    }
}

void camEvalNearFar(CameraEntry* camera) {
    MapWork* map;
    f32 m22;
    f32 m23;
    f32 zNear;
    f32 zFar;
    f32 nearVZ;
    f32 farVZ;
    f32 zRange;
    f32 minDepth;
    f32 maxDepth;
    int i;

    nearVZ = 1.0f;
    farVZ = 32768.0f;
    minDepth = 1.0e9;
    maxDepth = -1.0e9;
    map = mapGetWork();
    m22 = camera->projection[2][2];
    m23 = camera->projection[2][3];
    zFar = camera->viewport[5];
    zNear = camera->viewport[4];
    zRange = zFar - zNear;

    for (i = 0; i < 8; i++) {
        Vec diff;

        VECSubtract(&map->entries[0].bbox[i], &camera->cameraPos, &diff);
        if (VECDotProduct(&diff, (Vec*)camera->view[2]) >= 0.0f) {
            /* corner is at/behind the camera plane */
            if (minDepth != 0.0f) {
                minDepth = 0.0f;
                nearVZ = -1.0f;
            }
        } else {
            Vec vp;
            f32 vz, depth;

            MTXMultVec(camera->view, &map->entries[0].bbox[i], &vp);
            vz = vp.z;
            depth = (zRange * ((1.0f / -vz) * ((m22 * vz) + m23))) + zFar;

            if (depth < minDepth) {
                minDepth = depth;
                nearVZ = vz;
            }
            if (depth > maxDepth) {
                maxDepth = depth;
                farVZ = vz;
            }
        }
    }

    {
        f32 near = -nearVZ;
        f32 far = -farVZ;
        if (far < 1.0f) {
            far = 1.0f;
        }
        // needed for match for some dumb reason
        camera->near = 1.0f;
        camera->near = near;
        camera->far = far;
    }
}

void camDraw(void) {
    int cameraId;

    camLetterBox();
    dispSort();
    for (cameraId = 0; cameraId < CAMERA_MAX; cameraId++) {
        CameraEntry* camera = camPtrTbl[cameraId];
        if (!(camera->flags & 1)) {
            currentCamNo = cameraId;
            GXSetViewport(camera->viewport[0], camera->viewport[1], camera->viewport[2], camera->viewport[3],
                          camera->viewport[4], camera->viewport[5]);
            GXSetScissor(camera->scissor[0], camera->scissor[1], camera->scissor[2], camera->scissor[3]);
            if (camera->flags & 0x40 && camera->projType == GX_PERSPECTIVE) {
                camEvalNearFar(camera);
                MTXPerspective(camera->projection, camera->fovY, camera->aspect, camera->near, camera->far);
            }
            GXSetProjection(camera->projection, camera->projType);
            dispDraw(cameraId);
            sysDummyDraw(camera->view);
        }
    }
    dispReInit();
}

void camLoadRoad(CameraId cameraId, const char* filename) {
    CameraEntry* camera = camGetPtr(cameraId);
    camera->flags &= ~0x10;
    camera->blendPos.z = 0.0f;
    camera->blendPos.y = 0.0f;
    camera->blendPos.x = 0.0f;
    if (camRoadSetup(filename)) {
        camera->flags |= 4;
        camGetPtr(cameraId)->mode = 1;
    } else {
        camera->flags &= ~4;
        camGetPtr(cameraId)->mode = 3;
    }
    camera->fovY = 25.0f;
    camera->rollAngle = 0.0f;
    camera->viewOffset.z = 0.0f;
    camera->viewOffset.y = 0.0f;
    camera->viewOffset.x = 0.0f;
    camera->stateA = 0;
    camera->curveA = 11;
    camera->progressA = 0.0f;
    camera->curveB = 11;
    camera->progressB = 0.0f;
    camera->marioPos.z = 0.0f;
    camera->marioPos.y = 0.0f;
    camera->marioPos.x = 0.0f;
}

void camUnLoadRoad(CameraId cameraId) {
    CameraEntry* camera = camGetPtr(cameraId);
    camera->flags &= ~4;
    camGetPtr(cameraId)->mode = 0;
    camera->stateA = 0;
    camera->progressA = 0.0f;
    camera->fovY = 25.0f;
    camera->rollAngle = 0.0f;
    camera->viewOffset.z = 0.0f;
    camera->viewOffset.y = 0.0f;
    camera->viewOffset.x = 0.0f;
    camera->flags &= ~8;
}

CameraEntry* camGetPtr(CameraId cameraId) {
    return camPtrTbl[cameraId];
}

CameraEntry* camGetCurPtr(void) {
    return camPtrTbl[currentCamNo];
}

CameraId camGetCurNo(void) {
    return currentCamNo;
}

void camSetCurNo(CameraId cameraId) {
    currentCamNo = cameraId;
}

void cam3dMain(CameraEntry* camera) {
    if (camera->flags & 2) {
        return;
    }

    switch (camera->mode) {
        case 1:
            switch (camera->stateA) {
                case 1:
                    if (camera->durationA > 0) {
                        camera->progressA = 1.0f - (f32)(gp->renderTime - camera->startTimeA) / (f32)camera->durationA;
                        if (camera->progressA < 0.0f) {
                            camera->progressA = 0.0f;
                            camera->stateA = 0;
                        }
                    } else {
                        camera->progressA = 0.0f;
                        camera->stateA = 0;
                    }
                    break;
                case 2:
                case 3:
                    if (camera->durationA > 0) {
                        camera->progressA = (f32)(gp->renderTime - camera->startTimeA) / (f32)camera->durationA;
                        if (camera->progressA > 1.0f) {
                            camera->progressA = 1.0f;
                            camera->stateA = 0;
                        }
                    } else {
                        camera->progressA = 1.0f;
                        camera->stateA = 0;
                    }
                    break;

                case 0:
                    break;
            }

            switch (camera->stateB) {
                case 1:
                    if (camera->durationB > 0) {
                        camera->progressB = 1.0f - (f32)(gp->renderTime - camera->startTimeB) / (f32)camera->durationB;
                        if (camera->progressB < 0.0f) {
                            camera->progressB = 0.0f;
                            camera->stateB = 0;
                        }
                    } else {
                        camera->progressB = 0.0f;
                        camera->stateB = 0;
                    }
                    break;

                case 2:
                case 3:
                    if (camera->durationB > 0) {
                        camera->progressB = (f32)(gp->renderTime - camera->startTimeB) / (f32)camera->durationB;
                        if (camera->progressB > 1.0f) {
                            camera->progressB = 1.0f;
                            camera->stateB = 0;
                        }
                    } else {
                        camera->progressB = 1.0f;
                        camera->stateB = 0;
                    }
                    break;

                case 0:
                    break;
            }

            if (!(camera->flags & 0x10)) {
                camera->marioPos.y +=
                    (((1.0f + marioGetPtr()->field_EC.y) - camera->marioPos.y) * marioGetCamFollowRate());
            }
            camera->marioPos.x = 0.01f + marioGetPtr()->field_EC.x;
            camera->marioPos.z = marioGetPtr()->field_EC.z;
            camera->dollyStart = 0.0f;
            camera->marioAt.x = marioGetPtr()->field_F8.x;
            camera->marioAt.y = 1.0f + marioGetPtr()->field_F8.y;
            camera->marioAt.z = marioGetPtr()->field_F8.z;

            {
                f32 t, it;
                t = intplGetValue(camera->curveB, (s32)(100000.0f * camera->progressB), 100000, 0.0f, 1.0f);
                it = 1.0f - t;
                switch (camera->stateB) {
                    case 0:
                    case 1:
                    case 2:
                        camera->blendPos.x = (camera->anchor.x * t) + (camera->marioPos.x * it);
                        camera->blendPos.y = (camera->anchor.y * t) + (camera->marioPos.y * it);
                        camera->blendPos.z = (camera->anchor.z * t) + (camera->marioPos.z * it);
                        camera->blendAt.x = (camera->anchor.x * t) + (camera->marioAt.x * it);
                        camera->blendAt.y = (camera->anchor.y * t) + (camera->marioAt.y * it);
                        camera->blendAt.z = (camera->anchor.z * t) + (camera->marioAt.z * it);
                        camera->dollyPercent = (camera->dollyEnd * t) + (camera->dollyStart * it);
                        break;
                    case 3:
                        camera->blendPos.x = (camera->anchor.x * t) + (camera->anchorPrev.x * it);
                        camera->blendPos.y = (camera->anchor.y * t) + (camera->anchorPrev.y * it);
                        camera->blendPos.z = (camera->anchor.z * t) + (camera->anchorPrev.z * it);
                        camera->blendAt.x = camera->blendPos.x;
                        camera->blendAt.y = camera->blendPos.y;
                        camera->blendAt.z = camera->blendPos.z;
                        camera->dollyPercent = (camera->dollyEnd * t) + (camera->dollyStartAlt * it);
                        break;
                }
            }

            {
                CameraParams work;
                CameraParams work2;

                work.fovY = 25.0f;
                work.aspect = 1.0f;
                work.far = 32768.0f;
                work.pos.x = camera->storedPos.x;
                work.pos.y = camera->storedPos.y;
                work.pos.z = camera->storedPos.z;
                work.at.x = camera->storedAt.x;
                work.at.y = camera->storedAt.y;
                work.at.z = camera->storedAt.z;

                switch (camera->stateA) {
                    case 0:
                    case 1:
                    case 2:
                        if (camera->flags & 0x4) {
                            MarioWork* mario = marioGetPtr();
                            f32 bank = 0.0f;
                            f32 dolly;
                            f32 oldx, oldy, oldz;

                            camShiftMain(camera, mario, &bank);
                            camRoadMain(&work2.fovY, camera->blendPos.x, camera->blendPos.y, camera->blendPos.z,
                                        camera->blendAt.x, camera->blendAt.y, camera->blendAt.z, bank);
                            /// ???
                            dolly = camera->dollyPercent;
                            oldx = work2.pos.x;
                            oldy = work2.pos.y;
                            oldz = work2.pos.z;

                            work2.pos.x = oldx + (work2.at.x - oldx) * dolly / 100.0f;
                            work2.pos.y = oldy + (work2.at.y - oldy) * dolly / 100.0f;
                            work2.pos.z = oldz + (work2.at.z - oldz) * dolly / 100.0f;
                        } else {
                            work2 = work;
                        }
                        break;

                    case 3:
                        work2.fovY = work.fovY;
                        work2.aspect = work.aspect;
                        work2.far = work.far;
                        work2.pos.x = camera->presetPos.x;
                        work2.pos.y = camera->presetPos.y;
                        work2.pos.z = camera->presetPos.z;
                        work2.at.x = camera->presetAt.x;
                        work2.at.y = camera->presetAt.y;
                        work2.at.z = camera->presetAt.z;
                        break;
                }

                camShiftPostMain();

                {
                    f32 t, it;
                    t = intplGetValue(camera->curveA, (s32)(100000.0f * (1.0f - camera->progressA)), 100000, 0.0f,
                                      1.0f);
                    it = 1.0f - t;
                    camera->cameraAt.x = (work.at.x * it) + (work2.at.x * t);
                    camera->cameraAt.y = (work.at.y * it) + (work2.at.y * t);
                    camera->cameraAt.z = (work.at.z * it) + (work2.at.z * t);
                    camera->cameraPos.x = (work.pos.x * it) + (work2.pos.x * t);
                    camera->cameraPos.y = (work.pos.y * it) + (work2.pos.y * t);
                    camera->cameraPos.z = (work.pos.z * it) + (work2.pos.z * t);
                }
            }

            camera->viewDistance = VECDistance(&camera->cameraPos, &camera->cameraAt);
            camera->viewYaw =
                angleABf(camera->cameraPos.x, camera->cameraPos.z, camera->cameraAt.x, camera->cameraAt.z);
            if (camera->projType == GX_PERSPECTIVE) {
                MTXPerspective(camera->projection, camera->fovY, 1.2666666f, camera->near, camera->far);
            } else {
                f32 h, w;

                h = camera->viewDistance * (f32)tan(DEG_TO_RAD_12_5__2);
                w = 608.0f * h / 480.0f;
                MTXOrtho(camera->projection, h, -h, -w, w, camera->near, camera->far);
            }
            break;

        case 2:
            if (gp->inBattle) {
                battleCameraMain();
                camera->viewDistance = VECDistance(&camera->cameraPos, &camera->cameraAt);
                camera->viewYaw =
                    angleABf(camera->cameraPos.x, camera->cameraPos.z, camera->cameraAt.x, camera->cameraAt.z);
                if (camera->projType == GX_PERSPECTIVE) {
                    MTXPerspective(camera->projection, camera->fovY, 1.2666666f, camera->near, camera->far);
                } else {
                    f32 h, w;

                    h = camera->viewDistance * (f32)tan(DEG_TO_RAD_12_5__2);
                    w = 608.0f * h / 480.0f;
                    MTXOrtho(camera->projection, h, -h, -w, w, camera->near, camera->far);
                }
            }
            break;
        case 0:
        case 3:
            break;
    }

    MTXCopy(camGetPtr(CAMERA_3D)->view, camGetPtr(CAMERA_OFFSCREEN2)->view);
    MTX44Copy(camGetPtr(CAMERA_3D)->projection, camGetPtr(CAMERA_OFFSCREEN2)->projection);
    camGetPtr(CAMERA_OFFSCREEN2)->projType = camGetPtr(CAMERA_3D)->projType;
}

void cam3dImgMain(CameraEntry* camera) {
    MTXPerspective(camera->projection, camera->fovY, camera->aspect, camera->near, camera->far);
}

void camEffMain(CameraEntry* camera) {
    CameraEntry* camera3D = camGetPtr(CAMERA_3D);

    camera->cameraPos = camera3D->cameraPos;
    camera->cameraUp = camera3D->cameraUp;
    camera->cameraAt = camera3D->cameraAt;
    camera->viewDistance = VECDistance(&camera->cameraPos, &camera->cameraAt);
    camera->viewYaw = angleABf(camera->cameraPos.x, camera->cameraPos.z, camera->cameraAt.x, camera->cameraAt.z);
    MTXPerspective(camera->projection, camera->fovY, camera->aspect, camera->near, camera->far);
}

void camSetMode(CameraId cameraId, u16 mode) {
    camPtrTbl[cameraId]->mode = mode;
}

void camDispOn(CameraId cameraId) {
    camPtrTbl[cameraId]->flags &= ~1;
}

void camDispOff(CameraId cameraId) {
    camPtrTbl[cameraId]->flags |= 1;
}

void camCtrlOn(CameraId cameraId) {
    camPtrTbl[cameraId]->flags &= ~2;
}

void camCtrlOff(CameraId cameraId) {
    camPtrTbl[cameraId]->flags |= 2;
}

void camSetTypePersp(CameraId cameraId) {
    camPtrTbl[cameraId]->projType = GX_PERSPECTIVE;
}

void camSetTypeOrtho(CameraId cameraId) {
    camPtrTbl[cameraId]->projType = GX_ORTHOGRAPHIC;
}

void getScreenPoint(Vec* model, Vec* screen) {
    CameraEntry* camera;
    f32 projection[GX_PROJECTION_SZ];
    f32 viewport[GX_VIEWPORT_SZ];
    f32 orig[GX_PROJECTION_SZ];

    GXGetProjectionv(orig);
    camera = camGetPtr(CAMERA_3D);
    GXSetProjection(camera->projection, camera->projType);
    GXGetProjectionv(projection);
    GXGetViewportv(viewport);
    GXProject(model->x, model->y, model->z, camera->view, projection, viewport, &screen->x, &screen->y, &screen->z);
    GXSetProjectionv(orig);
    screen->x -= 304.0f;
    screen->y = 240.0f - screen->y;
}

void camLetterBoxDraw(CameraId cameraId, void* param) {
    CameraEntry* camera = camGetPtr(CAMERA_2D);
    f32 viewport[GX_VIEWPORT_SZ];
    f32 projection[GX_PROJECTION_SZ];
    u32 left, top, width, height;

    if (!(gp->flags & 0x8000) && camera->letterBoxAlpha != 0) {
        GXGetViewportv(viewport);
        GXGetProjectionv(projection);
        GXGetScissor(&left, &top, &width, &height);
        GXSetProjection(camera->projection, camera->projType);
        GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
        GXSetZCompLoc(GX_TRUE);
        GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
        GXSetZMode(GX_DISABLE, GX_LEQUAL, GX_DISABLE);
        GXSetNumChans(1);
        GXSetChanMatColor(GX_COLOR0A0, (GXColor){ 0, 0, 0, camera->letterBoxAlpha });
        GXSetChanCtrl(GX_COLOR0A0, GX_FALSE, GX_SRC_REG, GX_SRC_REG, 0, GX_DF_NONE, GX_AF_NONE);
        GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){ 255, 255, 255, 255 });
        GXSetNumTexGens(0);
        GXSetNumTevStages(1);
        GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR0A0);
        GXSetTevOp(GX_TEVSTAGE0, GX_PASSCLR);
        GXSetCullMode(GX_CULL_NONE);
        GXClearVtxDesc();
        GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
        GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_S16, 0);
        GXLoadPosMtxImm(camera->view, 0);
        GXSetCurrentMtx(0);
        GXBegin(GX_QUADS, GX_VTXFMT0, 8);
        GXPosition3s16(-304, 240, 0);
        GXPosition3s16(304, 240, 0);
        GXPosition3s16(304, 240 - camera->letterBoxTop, 0);
        GXPosition3s16(-304, 240 - camera->letterBoxTop, 0);
        GXPosition3s16(-304, camera->letterBoxBottom - 240, 0);
        GXPosition3s16(304, camera->letterBoxBottom - 240, 0);
        GXPosition3s16(304, -240, 0);
        GXPosition3s16(-304, -240, 0);
        GXSetViewport(viewport[0], viewport[1], viewport[2], viewport[3], viewport[4], viewport[5]);
        GXSetProjectionv(projection);
        GXSetScissor(left, top, width, height);
    }
}

void camLetterBox(void) {
    CameraEntry* camera = camPtrTbl[CAMERA_2D];
    PartyEntry* party = partyGetPtr(0);
    if (!(camera->flags & 0x200) && !(bero_get_BeroEXEC() & 1)) {
        if ((seqGetSeq() == SEQ_GAME) && (!marioChkKey() || !marioChkCtrl()) &&
            (!party || (party && !(party->flags & 0x100)))) {
            if (!(camera->flags & 0x100)) {
                camera->flags |= 0x100;
                psndSetFlag(0x20);
                camera->letterBoxAlpha = 0xFF;
                camera->letterBoxTop = 0;
                camera->letterBoxBottom = 0;
                camera->letterBoxCamId = CAMERA_2D;
            }
        } else if (seqGetSeq() != SEQ_MAP_CHANGE) {
            camera->flags &= ~0x100;
            psndClearFlag(0x20);
        }
    }
    if (camera->flags & 0x100) {
        camera->letterBoxAlpha = 0xFF;
        camera->letterBoxTop += +3;
        if (camera->letterBoxTop > 0x31) {
            camera->letterBoxTop = 0x31;
        }
        camera->letterBoxBottom += 3;
        if (camera->letterBoxBottom > 0x2C) {
            camera->letterBoxBottom = 0x2C;
        }
        if (camera->flags & 0x400) {
            camera->flags &= ~0x400;
            camera->letterBoxTop = 0x31;
            camera->letterBoxBottom = 0x2C;
        }
    } else {
        camera->letterBoxAlpha -= ((0xFF / gp->framerate) * 2);
        if (camera->letterBoxAlpha < 0) {
            camera->letterBoxAlpha = 0;
        }
        if (camera->flags & 0x400) {
            camera->flags &= ~0x400;
            camera->letterBoxAlpha = 0;
        }
    }
    dispEntry(camera->letterBoxCamId, 3, &camLetterBoxDraw, NULL, 0.0f);
}

inline Vec unknownVec0(void) {
    return (Vec){ 0.0f, 0.0f, 0.0f };
}

inline Vec makeVecByValue(f32 x, f32 y, f32 z) {
    Vec v = (Vec){ 0.0f, 0.0f, 0.0f };
    v.x = x;
    v.y = y;
    v.z = z;
    return v;
}

inline Vec unknownVec2(void) {
    return (Vec){ 0.0f, 0.0f, 0.0f };
}
