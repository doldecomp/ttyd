#include "evt/evt_npc.h"
#include "driver/animdrv.h"
#include "driver/effdrv.h"
#include "driver/npcdrv.h"
#include "evt/evt_cmd.h"
#include "mario/mariost.h"
#include "manager/evtmgr_cmd.h"
#include "pmario_sound.h"
#include "system.h"
#include <string.h>

extern char* strcat(char* dest, const char* src);
extern EffectEntry* effKemuri10N64Entry(s32 a1, f32 a2, f32 a3, f32 a4, f32 a5, f32 a6, f32 a7, f32 a8);

// TODO: need to figure out better flags, since I've had to use dont_inline in a couple places, this
// might just be -inline deferred? No auto
#pragma optimize_for_size on
#pragma pool_data on

#ifdef __MWERKS__
#define fabs(x) __fabs(x)
#define fabsf(x) __fabsf(x)
#else
double fabs(double x);
float fabsf(float x);
#endif
extern double sin(double x);
extern double cos(double x);
extern double fmod(double x, double y);

int __float_nan[];
#define NAN (*(f32*)__float_nan)

#define FP_NAN 1
#define FP_INFINITE 2
#define FP_ZERO 3
#define FP_NORMAL 4
#define FP_SUBNORMAL 5

static inline s32 __fpclassifyf(f32 x) {
    switch (*(s32*)&x & 0x7F800000) {
        case 0x7F800000:
            if (*(s32*)&x & 0x007FFFFF) {
                return FP_NAN;
            } else {
                return FP_INFINITE;
            }
            break;
        case 0:
            if (*(s32*)&x & 0x007FFFFF) {
                return FP_SUBNORMAL;
            } else {
                return FP_ZERO;
            }
            break;
        default:
            return FP_NORMAL;
    }
}

#define fpclassify(x) __fpclassifyf(x)
#define isnan(x) (fpclassify(x) == FP_NAN)

static inline f32 sqrtf(f32 x) {
    const f64 _half = .5;
    const f64 _three = 3.0;

    if (x > 0.0f) {
        f64 guess = __frsqrte(x);
        guess = _half * guess * (_three - guess * guess * x);
        guess = _half * guess * (_three - guess * guess * x);
        guess = _half * guess * (_three - guess * guess * x);
        return x * guess;
    } else if (x < 0.0) {
        return NAN;
    } else if (isnan(x)) {
        return NAN;
    }
    return x;
}

// clang-format off
// .sdata
EVT_BEGIN(npc_init_evt)
	CALL(evt_npc_flag_onoff, 1, STRING("me"), 0x600)
	RETURN
	END
EVT_END();
// clang-format on

// const char* npcDesc, const char* npcName
USER_FUNC(evt_npc_entry) {
    s32* args = event->args;
    const char *desc, *name;

    desc = (const char*)evtGetValue(event, *args++);
    name = (const char*)evtGetValue(event, *args++);
    if (!animGroupBaseAsync(name, gp->inBattle != 0, NULL)) {
        return EVT_RETURN_BLOCK;
    }
    npcEntry(desc, name);
    return EVT_RETURN_DONE;
}

// const char* lookupName, s32 slaveId, const char* animName, s32 retIndex, void* deadEvent
USER_FUNC(evt_npc_slave_entry) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 id;
    const char* animName;
    s32 index;
    u8 sp2C[0xB8];
    char slaveName[0x20];
    char ident[0x4];
    NpcEntry* slave;
    void* deadEvent;

    name = (const char*)evtGetValue(event, *args++);
    npc = evtNpcNameToPtr(event, name);
    id = evtGetValue(event, *args++);
    animName = (const char*)evtGetValue(event, *args++);
    index = *args++;
    deadEvent = (void*)evtGetValue(event, *args++);
    memset(&sp2C, 0, sizeof(sp2C));
    sprintf(ident, "_s%d", id);
    strcpy(slaveName, npc->description);
    strcat(slaveName, ident);
    npcEntry(slaveName, animName);
    slave = npcNameToPtr(slaveName);
    slave->flags |= 0x120000 | 0x18;
    slave->deadEvent = deadEvent;
    slave->battleInfo = npc->battleInfo;
    npcSetSlave(npc, slave, id);
    evtSetValue(event, index, (s32)&slave->description);
    return EVT_RETURN_DONE;
}

// const char* lookupName
USER_FUNC(evt_npc_delete) {
    const char* name;
    NpcEntry* npc;

    name = (const char*)evtGetValue(event, *event->args);
    npc = evtNpcNameToPtr(event, name);
    npcDeleteGroup(npc);
    return EVT_RETURN_DONE;
}

// const char* lookupName
USER_FUNC(evt_npc_check_delete) {
    const char* name;
    NpcEntry* npc;

    name = (const char*)evtGetValue(event, *event->args);
    npc = evtNpcNameToPtr_NoAssert(event, name);
    if (npc) {
        npcDeleteGroup(npc);
    }
    return EVT_RETURN_DONE;
}

// BOOL inBattle, s32 evtIndex
USER_FUNC(evt_npc_get_ReactionOfLivingBody) {
    s32* args = event->args;
    s32 index, value;
    BOOL inBattle;

    inBattle = evtGetValue(event, args[0]);
    index = args[1];
    value = npcGetReactionOfLivingBody(inBattle);
    evtSetValue(event, index, value);
    return EVT_RETURN_DONE;
}

// NpcSetupInfo* setuplist
USER_FUNC(evt_npc_setup) {
    NpcSetupInfo *setuplist, *setup;
    EventEntry* newEvt;
    NpcTribeInfo* tribe;
    NpcEntry* npc;
    s32 evtId;

    setuplist = (NpcSetupInfo*)evtGetValue(event, *event->args);
    fbatGetPointer(); // unused
    if (isFirstCall) {
        for (setup = setuplist; setup->name; setup++) {
            npc = npcNameToPtr_NoAssert(setup->name);
            if (npc) {
                tribe = npc->tribe;
                npc->flags |= setup->flags;
                npc->reactionFlags |= setup->reactionFlags;
                if (setup->initEvent) {
                    evtId = npc->initEvtId;
                    if (evtId) {
                        evtDeleteID(evtId);
                    }
                    newEvt = evtEntry(setup->initEvent, 0, 0);
                    newEvt->wNpcEventType = 0;
                    newEvt->ownerNPC = npc;
                    npc->initEvtId = newEvt->eventId;
                } else {
                    npc->initEvtId = 0;
                }

                npc->talkEvt = setup->talkEvent;
                npc->deadEvent = setup->deadEvent;
                npc->moveEvent = setup->regularEvent;
                npc->findEvent = setup->findEvent;
                npc->lostEvent = setup->lostEvent;
                npc->returnEvent = setup->returnEvent;
                npc->blowEvent = setup->blowEvent;
                npc->territoryType = setup->territoryType;
                npc->territoryBase = setup->territoryBase;
                npc->territoryLoiter = setup->territoryLoiter;
                npc->territoryHoming = setup->territoryLoiter;
                npc->searchRange = setup->searchRange;
                npc->searchAngle = setup->searchAngle;
                npc->homingRange = setup->homingRange;
                npc->homingAngle = setup->homingAngle;
                npcSetBattleInfo(npc, setup->battleInfoId);
                if (tribe->stayAnim) {
                    strcpy(npc->stayAnim, tribe->stayAnim);
                }
                if (tribe->talkAnim) {
                    strcpy(npc->talkAnim, tribe->talkAnim);
                }
                if (tribe->initialAnim) {
                    strcpy(npc->currentAnim, tribe->initialAnim);
                    animPoseSetAnim(npc->poseId, npc->currentAnim, 1);
                }
            }
        }
        fbatChangeMode(1);
        return EVT_RETURN_BLOCK; // call this function again
    } else {
        for (setup = setuplist; setup->name; setup++) {
            evtId = npcNameToPtr(setup->name)->initEvtId;
            if (evtId && evtCheckID(evtId)) {
                return EVT_RETURN_BLOCK; // call this function again
            }
        }
        for (setup = setuplist; setup->name; setup++) {
            npc = npcNameToPtr(setup->name);
            if (npc->moveEvent) {
                evtId = npc->regularEvtId;
                if (evtId) {
                    evtDeleteID(evtId);
                }
                newEvt = evtEntry(npc->moveEvent, 0, 0x20);
                newEvt->wNpcEventType = 1;
                newEvt->ownerNPC = npc;
                npc->regularEvtId = newEvt->eventId;
            }
        }
        return EVT_RETURN_DONE;
    }
}

// TODO: double check _savefpr_29/_restfpr_29 were generated
// const char* lookupName, f32 x, f32 y, f32 z
USER_FUNC(evt_npc_set_position) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    f32 x, y, z;
    Vec temp;

    name = (const char*)evtGetValue(event, args[0]);
    x = evtGetFloat(event, args[1]);
    y = evtGetFloat(event, args[2]);
    z = evtGetFloat(event, args[3]);
    npc = evtNpcNameToPtr(event, name);
    temp = (Vec){ x, y, z };
    npc->prevPosition = temp;
    npc->position = npc->prevPosition;
    return EVT_RETURN_DONE;
}

// const char* lookupName, f32 width
USER_FUNC(evt_npc_set_width) {
    s32* args = event->args;
    const char* name;
    f32 width;

    name = (const char*)evtGetValue(event, args[0]);
    width = evtGetFloat(event, args[1]);
    evtNpcNameToPtr(event, name)->width = width;
    return EVT_RETURN_DONE;
}

// const char* lookupName, f32 width
USER_FUNC(evt_npc_set_height) {
    s32* args = event->args;
    const char* name;
    f32 height;

    name = (const char*)evtGetValue(event, args[0]);
    height = evtGetFloat(event, args[1]);
    evtNpcNameToPtr(event, name)->height = height;
    return EVT_RETURN_DONE;
}

// const char* lookupName, s32 evtStoreIndex
USER_FUNC(evt_npc_get_height) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 index;

    name = (const char*)evtGetValue(event, args[0]);
    index = args[1];
    npc = evtNpcNameToPtr(event, name);
    evtSetFloat(event, index, npc->height);
    return EVT_RETURN_DONE;
}

// const char* lookupName, f32 x, f32 y, f32 z
USER_FUNC(evt_npc_set_scale) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    f32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = evtGetFloat(event, args[1]);
    y = evtGetFloat(event, args[2]);
    z = evtGetFloat(event, args[3]);
    npc = evtNpcNameToPtr(event, name);
    npc->scale.x = x;
    npc->scale.y = y;
    npc->scale.z = z;
    return EVT_RETURN_DONE;
}

// const char* lookupName, s32 xStoreIndex, s32 yStoreIndex, s32 zStoreIndex
USER_FUNC(evt_npc_get_scale) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = args[1];
    y = args[2];
    z = args[3];
    npc = evtNpcNameToPtr(event, name);
    evtSetFloat(event, x, npc->scale.x);
    evtSetFloat(event, y, npc->scale.y);
    evtSetFloat(event, z, npc->scale.z);
    return EVT_RETURN_DONE;
}

// const char* lookupName, s32 xStoreIndex, s32 yStoreIndex, s32 zStoreIndex
USER_FUNC(evt_npc_get_position) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = args[1];
    y = args[2];
    z = args[3];
    npc = evtNpcNameToPtr(event, name);
    evtSetFloat(event, x, npc->position.x);
    evtSetFloat(event, y, npc->position.y);
    evtSetFloat(event, z, npc->position.z);
    return EVT_RETURN_DONE;
}

// const char* lookupName, s32 xStoreIndex, s32 yStoreIndex, s32 zStoreIndex
USER_FUNC(evt_npc_get_home_position) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = args[1];
    y = args[2];
    z = args[3];
    npc = evtNpcNameToPtr(event, name);
    evtSetFloat(event, x, npc->territoryBase.x);
    evtSetFloat(event, y, npc->territoryBase.y);
    evtSetFloat(event, z, npc->territoryBase.z);
    return EVT_RETURN_DONE;
}

// devs forgot to change s32 to f32 when copypasting, fix in rewrite
// const char* lookupName, f32 x, f32 y, f32 z
USER_FUNC(evt_npc_set_home_position) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = (s32)evtGetFloat(event, args[1]);
    y = (s32)evtGetFloat(event, args[2]);
    z = (s32)evtGetFloat(event, args[3]);
    npc = evtNpcNameToPtr(event, name);
    npc->territoryBase.x = (f32)x;
    npc->territoryBase.y = (f32)y;
    npc->territoryBase.z = (f32)z;
    return EVT_RETURN_DONE;
}

// const char* lookupName, s32 xStoreIndex, s32 yStoreIndex, s32 zStoreIndex
USER_FUNC(evt_npc_get_rotate) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    s32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = args[1];
    y = args[2];
    z = args[3];
    npc = evtNpcNameToPtr(event, name);
    evtSetFloat(event, x, npc->rotation.x);
    evtSetFloat(event, y, npc->rotation.y);
    evtSetFloat(event, z, npc->rotation.z);
    return EVT_RETURN_DONE;
}

// devs forgot to use evtGetFloat when copypasting, fix in rewrite
// const char* lookupName, f32 x, f32 y, f32 z
USER_FUNC(evt_npc_set_rotate) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    f32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    npc = evtNpcNameToPtr(event, name);
    npc->rotation = (Vec){ x, y, z };
    return EVT_RETURN_DONE;
}

// devs forgot to use evtGetFloat when copypasting, fix in rewrite
// const char* lookupName, f32 x, f32 y, f32 z
USER_FUNC(evt_npc_add_rotate) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    f32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    npc = evtNpcNameToPtr(event, name);
    npc->rotation.x += x;
    npc->rotation.y += y;
    npc->rotation.z += z;
    return EVT_RETURN_DONE;
}

// devs forgot to use evtGetFloat when copypasting, fix in rewrite
// const char* lookupName, f32 x, f32 y, f32 z
USER_FUNC(evt_npc_set_rotate_offset) {
    s32* args = event->args;
    const char* name;
    NpcEntry* npc;
    f32 x, y, z;

    name = (const char*)evtGetValue(event, args[0]);
    x = (f32)evtGetValue(event, args[1]);
    y = (f32)evtGetValue(event, args[2]);
    z = (f32)evtGetValue(event, args[3]);
    npc = evtNpcNameToPtr(event, name);
    npc->rotationOffset = (Vec){ x, y, z };
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_move_position) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    f32 targetX = evtGetFloat(event, *args++);
    f32 targetZ = evtGetFloat(event, *args++);
    f32 moveTime = (f32)evtGetValue(event, *args++) / 1000.0f;
    f32 speed = evtGetFloat(event, *args++);
    s32 moveFlags = args[5];

    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    Vec diff;
    f32 dist;
    f32 step;
    s32 sfxFlag;

    npc->jumpFlags |= 0x10;
    if (moveFlags & 0x2) {
        npc->jumpFlags |= 0x1000;
    }

    if (isFirstCall) {
        npc->field_188 = 0;
        npc->field_108 = 0;

        npc->jumpTargetPos.x = targetX;
        npc->jumpTargetPos.y = npc->position.y;
        npc->jumpTargetPos.z = targetZ;
        npc->jumpStartPos = npc->position;

        VECSubtract(&npc->jumpTargetPos, &npc->jumpStartPos, &diff);
        dist = sqrtf((diff.x * diff.x) + (diff.z * diff.z));

        npc->moveDir = angleABf(0.0f, 0.0f, diff.x, diff.z);
        npc->moveSpeed = speed;
        npc->moveTime = moveTime;
        npc->moveOffset.y = 0.0f;

        // No speed AND no time -> default to 1.0
        if (npc->moveSpeed <= 0.1f && npc->moveTime == 0.0f) {
            npc->moveSpeed = 1.0f;
        }
        // Time given but no speed -> derive speed, then run as speed-mode
        if (npc->moveSpeed <= 0.1f) {
            npc->moveSpeed = dist / npc->moveTime;
            npc->moveTime = 0.0f;
        }

        npc->footstepAccum = 0.0f;
        npc->footstepToggle = TRUE;
        event->userdata[0] = 0;
    }

    event->userdata[0]++;

    // flag 0x4: bail if blocked and stuck > 5 frames
    if ((moveFlags & 0x4) && npc->field_2FC && event->userdata[0] > 5) {
        return EVT_RETURN_DONE;
    }

    VECSubtract(&npc->jumpTargetPos, &npc->position, &diff);
    dist = sqrtf((diff.x * diff.x) + (diff.z * diff.z));
    step = (20.0f * npc->moveSpeed) / 1000.0f;

    if (npc->moveTime) {
        // timed move: field_0x1a0 is elapsed/progress, advanced externally
        if (npc->moveTime <= npc->field_1A0) {
            npc->moveSpeed = 0.0f;
            return EVT_RETURN_DONE;
        }
    } else {
        // speed move: snap when within a step (or essentially on top of target)
        if (!npc->moveTime && dist <= step) {
            npc->moveSpeed = 0.0f;
            return EVT_RETURN_DONE;
        }
        if (dist < 0.0005f) {
            npc->moveSpeed = 0.0f;
            return EVT_RETURN_DONE;
        }
    }

    // Re-aim at the target each frame unless direction is locked
    if ((npc->flags & 0x1) && !(npc->jumpFlags & 0x1)) {
        npc->moveDir = angleABf(0.0f, 0.0f, diff.x, diff.z);
    }

    // Turn the body toward travel (unless mid battle-transition states 5/6)
    if ((npc->jumpFlags & 0x2) && npc->moveSpeed > 0.1f) {
        if (npc != fbatGetPointer()->target || (fbatGetPointer()->mode != 5 && fbatGetPointer()->mode != 6)) {
            npcTuningRy(npc, npc->moveDir);
        }
    }

    // Integrate move offset along heading (flag 0x10000 freezes it)
    if (!(npc->jumpFlags & 0x10000)) {
        f32 temp = (f32)sin(npc->moveDir * 6.2831855f / 360.0f);
        npc->moveOffset.x += npc->moveDt * (npc->moveSpeed * temp);
        temp = (f32)cos(npc->moveDir * 6.2831855f / 360.0f);
        npc->moveOffset.z += npc->moveDt * (npc->moveSpeed * -temp);
    }

    // Footstep SFX
    sfxFlag = 0;
    if (psndGetFlag() & 0x100) {
        if (!(animPoseGetMaterialFlag(npc->poseId) & 0x1800)) {
            sfxFlag = 0x10000;
        }
    }

    if (npc->footstepAccum > (f32)npc->footstepStride / npc->moveSpeed) {
        if (npc->footstepToggle != 0) {
            if (npc->footstepSfxA != 0) {
                psndSFXOnEx_3D(sfxFlag | searchPSSFXList(npc->footstepSfxA), &npc->position, 0xff, 0xff, 0, 8);
            }
        } else {
            if (npc->footstepSfxB != 0) {
                psndSFXOnEx_3D(sfxFlag | searchPSSFXList(npc->footstepSfxB), &npc->position, 0xff, 0xff, 0, 8);
            }
        }
        npc->footstepAccum = 0.0f;
        npc->footstepToggle = (s8)(1 - npc->footstepToggle); // alternate L/R
    }

    if (npc->footstepSfxB != 0 || npc->footstepToggle != 0) {
        npc->footstepAccum += 1000.0f * npc->moveDt;
    }

    return EVT_RETURN_BLOCK;
}

USER_FUNC(evt_npc_jump_position) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    f32 targetX = evtGetFloat(event, *args++);
    f32 targetY = evtGetFloat(event, *args++);
    f32 targetZ = evtGetFloat(event, *args++);
    f32 moveTime = (f32)evtGetValue(event, *args++) / 1000.0f;
    f32 speed = evtGetFloat(event, *args++);
    f32 arcHeight = evtGetFloat(event, *args++);
    s32 mode = evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    f32 arcWork = arcHeight;
    Vec diff;
    f32 dist;
    f32 dy;
    f32 t;
    f32 halfT;
    f32 peak;
    s32 sfxFlag;
    f32 temp;

    npc->jumpFlags |= 0x10;
    npc->jumpFlags |= 0x1000;

    if (isFirstCall) {
        npc->field_188 = 0;
        npc->field_178 = 0;
        npc->field_108 = 0;

        npc->jumpTargetPos.x = targetX;
        npc->jumpTargetPos.y = targetY;
        npc->jumpTargetPos.z = targetZ;
        npc->jumpStartPos = npc->position;

        VECSubtract(&npc->jumpTargetPos, &npc->jumpStartPos, &diff);
        dist = sqrtf(diff.x * diff.x + diff.z * diff.z);
        npc->moveDir = angleABf(0.0f, 0.0f, diff.x, diff.z);

        npc->moveSpeed = speed;
        npc->moveTime = 0.0f;
        npc->moveOffset.y = 0.0f;

        sfxFlag = 0;
        if (psndGetFlag() & 0x100 && !(animPoseGetMaterialFlag(npc->poseId) & 0x1800)) {
            sfxFlag = 0x10000;
        }
        if (npc->jumpSfx != 0) {
            psndSFXOnEx_3D(sfxFlag | searchPSSFXList(npc->jumpSfx), &npc->position, 0xff, 0xff, 0, 8);
        }

        npc->jumpVelY = 0.0f;
        npc->jumpYScale = 1.0f;
        dy = npc->jumpTargetPos.y - npc->jumpStartPos.y;

        if (arcHeight) {
            if (dy > 0.0f) {
                arcWork += dy;
            }
            npc->jumpVelY = 0.0f;

            switch (mode) {
                case 0:
                    if (moveTime == 0.0f) {
                        npc->jumpVelY = arcHeight;
                        goto end1;
                    }
                    if (npc->moveSpeed > 0.1) {
                        t = dist / npc->moveSpeed;
                        if (t == 0.0f) {
                            t = moveTime;
                        }
                    } else {
                        npc->moveSpeed = dist / moveTime;
                        t = moveTime;
                    }
                    if (t == 0.0f) {
                        t = 1.0f;
                    }
                    halfT = 0.5f * t;
                    npc->jumpVelY = -((-980.0f * npc->jumpGravity) * t * t) / t;
                    peak = (npc->jumpVelY * halfT) + ((-980.0f * npc->jumpGravity) * halfT * halfT);
                    if (peak != 0.0f) {
                        npc->jumpYScale = arcWork / peak;
                    }
                    goto end1;

                case 1:
                    if (moveTime == 0.0f) {
                        npc->jumpVelY = arcHeight;
                        goto end1;
                    }
                    halfT = 0.5f * moveTime;
                    npc->jumpVelY = -((-980.0f * npc->jumpGravity) * moveTime * moveTime) / moveTime;
                    peak = (npc->jumpVelY * halfT) + ((-980.0f * npc->jumpGravity) * halfT * halfT);
                    if (peak != 0.0f) {
                        npc->jumpYScale = arcWork / peak;
                    }
                    goto end1;
                default:
                    return EVT_RETURN_YIELD;
            }
        } else {
            if (dy >= 0.0f) {
                return EVT_RETURN_YIELD;
            }
            switch (mode) {
                case 0:
                    if (npc->moveSpeed > 0.1) {
                        if (moveTime > 0.0f) {
                            t = moveTime;
                        } else {
                            t = dist / npc->moveSpeed;
                        }
                        if (t > 0.0f) {
                            npc->jumpYScale = dy / (-980.0f * npc->jumpGravity * t * t);
                        } else {
                            npc->jumpYScale = 1.0f;
                        }
                    } else if (moveTime > 0.0f) {
                        npc->jumpGravity = (dy / (moveTime * moveTime)) / -980.0f;
                    }
                    goto end1;
                default:
                    return EVT_RETURN_YIELD;
                case 1:
                end1:
                    return EVT_RETURN_BLOCK;
            }
        }
    }

    // ---- per-frame ----
    if ((npc->jumpFlags & 0x2) && npc->moveSpeed > 0.1f) {
        if (npc != fbatGetPointer()->target || (fbatGetPointer()->mode != 5 && fbatGetPointer()->mode != 6)) {
            npcTuningRy(npc, npc->moveDir);
        }
    }

    temp = (f32)sin(npc->moveDir * 6.2831855f / 360.0f);
    npc->moveOffset.x += npc->moveDt * (npc->moveSpeed * temp);
    temp = (f32)cos(npc->moveDir * 6.2831855f / 360.0f);
    npc->moveOffset.z += npc->moveDt * (npc->moveSpeed * -temp);

    if (npc->jumpFlags & 0x1) {
        return EVT_RETURN_BLOCK; // still airborne
    }

    // landing
    npc->moveSpeed = 0.0f;
    npc->jumpVelY = 0.0f;
    npc->jumpYScale = 1.0f;
    npc->jumpGravity = 1.0f;

    sfxFlag = 0;
    if (psndGetFlag() & 0x100) {
        if (!(animPoseGetMaterialFlag(npc->poseId) & 0x1800)) {
            sfxFlag = 0x10000;
        }
    }
    if (npc->landSfx != 0) { // 0x1f0
        psndSFXOnEx_3D(sfxFlag | searchPSSFXList(npc->landSfx), &npc->position, 0xff, 0xff, 0, 8);
    }
    return EVT_RETURN_YIELD;
}

USER_FUNC(evt_npc_jump_position_nohit) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    f32 targetX = (f32)evtGetValue(event, *args++);
    f32 targetY = (f32)evtGetValue(event, *args++);
    f32 targetZ = (f32)evtGetValue(event, *args++);
    s32 duration = evtGetValue(event, *args++);
    f32 arcHeight = (f32)evtGetValue(event, *args++);
    s32 sfxFlag;
    u32 ticksPerMs;
    s32 elapsed;
    f32 t;
    Vec endPos;

    if (isFirstCall) {
        sfxFlag = 0;
        event->savedTime = event->lifetime;
        npc->jumpStartPos = npc->position;

        event->userdataf[1] = -4.0f * arcHeight;
        event->userdataf[2] = (targetY - npc->jumpStartPos.y) - event->userdataf[1];
        event->field_84 = npc->flags & 0x80000;
        npc->flags &= ~0x80000;

        if (psndGetFlag() & 0x100) {
            if (!(animPoseGetMaterialFlag(npc->poseId) & 0x1800)) {
                sfxFlag = 0x10000;
            }
        }
        if (npc->jumpSfx != 0) {
            psndSFXOnEx_3D(sfxFlag | searchPSSFXList(npc->jumpSfx), &npc->position, 0xff, 0xff, 0, 8);
        }
    }

    elapsed = (s32)OSTicksToMilliseconds((OSTick)event->lifetime - (OSTick)event->savedTime);

    if (elapsed < duration) {
        t = (f32)elapsed / (f32)duration;
        npc->position.x = intplGetValue(0, elapsed, duration, npc->jumpStartPos.x, targetX);
        npc->position.z = intplGetValue(0, elapsed, duration, npc->jumpStartPos.z, targetZ);
        npc->position.y = npc->jumpStartPos.y + t * ((event->userdataf[1] * t) + event->userdataf[2]);
        return EVT_RETURN_BLOCK;
    }

    npc->position = (Vec){ targetX, targetY, targetZ };
    npc->flags |= event->field_84;

    sfxFlag = 0;
    if (psndGetFlag() & 0x100) {
        if (!(animPoseGetMaterialFlag(npc->poseId) & 0x1800)) {
            sfxFlag = 0x10000;
        }
    }
    if (npc->landSfx != 0) { // 0x1f0
        psndSFXOnEx_3D(sfxFlag | searchPSSFXList(npc->landSfx), &npc->position, 0xff, 0xff, 0, 8);
    }

    return EVT_RETURN_DONE;
}

#pragma dont_inline on
NpcEntry* evtNpcNameToPtr(EventEntry* event, const char* name) {
    if (!strcmp(name, "me")) {
        return event->ownerNPC;
    }
    if (!strcmp(name, "party")) {
        return (NpcEntry*)-1;
    }
    if (!strcmp(name, "(^x^)party")) {
        return (NpcEntry*)-1;
    }
    if (!strcmp(name, "extparty")) {
        return (NpcEntry*)-2;
    }
    if (!strcmp(name, "mario")) {
        return (NpcEntry*)-3;
    }
    if (!strcmp(name, "master")) {
        return event->ownerNPC->master;
    }
    if (!strcmp(name, "slave_0")) {
        return event->ownerNPC->slaves[0];
    }
    if (!strcmp(name, "slave_1")) {
        return event->ownerNPC->slaves[1];
    }
    if (!strcmp(name, "slave_2")) {
        return event->ownerNPC->slaves[2];
    }
    if (!strcmp(name, "slave_3")) {
        return event->ownerNPC->slaves[3];
    }
    return npcNameToPtr(name);
}

NpcEntry* evtNpcNameToPtr_NoAssert(EventEntry* event, const char* name) {
    if (!strcmp(name, "me")) {
        return event->ownerNPC;
    }
    if (!strcmp(name, "party")) {
        return (NpcEntry*)-1;
    }
    if (!strcmp(name, "(^x^)party")) {
        return (NpcEntry*)-1;
    }
    if (!strcmp(name, "extparty")) {
        return (NpcEntry*)-2;
    }
    if (!strcmp(name, "mario")) {
        return (NpcEntry*)-3;
    }
    if (!strcmp(name, "master")) {
        return event->ownerNPC->master;
    }
    if (!strcmp(name, "slave_0")) {
        return event->ownerNPC->slaves[0];
    }
    if (!strcmp(name, "slave_1")) {
        return event->ownerNPC->slaves[1];
    }
    if (!strcmp(name, "slave_2")) {
        return event->ownerNPC->slaves[2];
    }
    if (!strcmp(name, "slave_3")) {
        return event->ownerNPC->slaves[3];
    }
    return npcNameToPtr_NoAssert(name);
}
#pragma dont_inline reset

// s32 type (off/on), const char* npcName, s32 mask
USER_FUNC(evt_npc_flag_onoff) {
    s32* args = event->args;
    s32 type, mask;
    const char* name;
    NpcEntry* npc;

    type = evtGetValue(event, args[0]);
    name = (const char*)evtGetValue(event, args[1]);
    mask = evtGetValue(event, args[2]);
    npc = evtNpcNameToPtr(event, name);
    switch (type) {
        case 0:
            npc->flags &= ~mask;
            break;
        case 1:
            npc->flags |= mask;
    }
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_get_drop_flower) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    s32 index = args[1];
	
    if (npc->battleInfo.field_4 & 4) {
        evtSetValue(event, index, 0);
    } else {
        s32 count = pouchEquipCheckBadge(ITEM_FLOWER_FINDER);
        s32 flowersDropped = npc->battleInfo.flowersDroppedBaseCount;

        if (count > 0) {
            if (count == 1) {
                flowersDropped += irand(3) + 1;
            } else {
                flowersDropped += irand(count + 3) + 1;
            }
        }

        evtSetValue(event, index, flowersDropped);
    }
    return EVT_RETURN_DONE;
}

#pragma dont_inline on
void _npc_check_coin(NpcEntry* npc, s32* value) {
    *value += npc->btlCoinDropCount;
}

void _npc_check_coin_group(NpcEntry* npc, s32* value) {
    NpcEntry* next = npc->next;
    int i;

    if (next) {
        _npc_check_coin_group(next, value);
    }

    for (i = 0; i < 4; i++) {
        if (npc->slaves[i]) {
            _npc_check_coin(npc->slaves[i], value);
        }
    }
    _npc_check_coin(npc, value);
}
#pragma dont_inline reset

USER_FUNC(evt_npc_get_drop_coin) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    s32 index = *args++;
    s32 value = 0;
    if (npc->battleInfo.field_4 & 1) {
        evtSetValue(event, index, 0);
        return EVT_RETURN_DONE;
    } else {
        _npc_check_coin_group(npc, &value);
        evtSetValue(event, index, value);
        return EVT_RETURN_DONE;
    }
}

USER_FUNC(evt_npc_getback_item_entry) {
    const char* npcName = (const char*)evtGetValue(event, *event->args);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    npcGetBackItemEntry(npc);
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_get_unitwork) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    s32 index = evtGetValue(event, *args++);
    evtSetValue(event, *args++, (s32)npc->unitWork[index]);
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_set_unitwork) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    s32 index = evtGetValue(event, *args++);
    npc->unitWork[index] = (void*)evtGetValue(event, *args++);
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_wait_msec) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, args[0]);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);

    s32 temp;
    OSTime lifetime = event->lifetime;
    npc->jumpFlags |= 0x10;

    if (isFirstCall) {
        event->userdata[0] = evtGetValue(event, args[1]);
        event->userdata[1] = ((u64)lifetime >> 32) & 0xFFFFFFFF;
        event->userdata[2] = lifetime & 0xFFFFFFFF;
    }

    temp = event->userdata[0];
    if (!temp) {
        return EVT_RETURN_DONE;
    }

    {
        s32 now = lifetime;
        u64 elapsed = now - event->userdata[2];
        s32 ms = OSTicksToMilliseconds(elapsed);
        return temp <= ms;
    }
}

USER_FUNC(evt_npc_change_fbat_mode) {
    s16 mode = evtGetValue(event, *event->args);
    fbatChangeMode(mode);
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_set_balloontype) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    npc->balloonType = evtGetValue(event, *args++);
    return EVT_RETURN_YIELD;
}

USER_FUNC(evt_npc_set_tribe) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    const char* tribeName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    NpcTribeInfo* tribe = npcGetTribe(tribeName);

    npc->tribe = tribe;
    npc->width = tribe->width;
    npc->height = tribe->height;
    if (tribe->stayAnim) {
        strcpy(npc->stayAnim, tribe->stayAnim);
    }
    if (tribe->talkAnim) {
        strcpy(npc->talkAnim, tribe->talkAnim);
    }
    if (tribe->initialAnim) {
        strcpy(npc->currentAnim, tribe->initialAnim);
        animPoseSetAnim(npc->poseId, npc->currentAnim, TRUE);
    }
    npc->footstepSfxA = tribe->footstepSfxA;
    npc->footstepSfxB = tribe->footstepSfxB;
    npc->jumpSfx = tribe->jumpSfx;
    npc->landSfx = tribe->landSfx;
    npc->footstepStride = tribe->footstepStride;
    npc->footstepToggle = TRUE;
    npc->footstepAccum = 0.0f;
    return EVT_RETURN_YIELD;
}

USER_FUNC(evt_npc_set_autotalkpose) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    const char* stayAnim = (const char*)evtGetValue(event, *args++);
    const char* talkAnim = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    if (npc == (NpcEntry*)-3) {
        npcSetMarioAutoTalkPose(stayAnim, talkAnim);
        return EVT_RETURN_YIELD;
    } else {
        if (stayAnim) {
            strcpy(npc->stayAnim, stayAnim);
        }
        if (talkAnim) {
            strcpy(npc->talkAnim, talkAnim);
        }
        return EVT_RETURN_YIELD;
    }
}

USER_FUNC(evt_npc_majo_disp_on) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    f32 prevX = evtGetFloat(event, *args++);
    f32 prevY = evtGetFloat(event, *args++);
    f32 prevZ = evtGetFloat(event, *args++);
    BOOL toggle = evtGetValue(event, *args++); // TODO: better name
    s32 group = gp->inBattle != 0;
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);

    if (isFirstCall) {
        event->userdata[0] = -1;
        event->userdata[1] = 0;
    }

    if (!animGroupBaseAsync("p_bibi", group, NULL)) {
        return EVT_RETURN_BLOCK;
    }

    if (toggle) {
        return EVT_RETURN_BLOCK;
    }

    switch (event->userdata[0]) {
        case -1:
            npc->position = npc->prevPosition = (Vec){ prevX, prevY, prevZ };
            animPoseSetEffect(npc->poseId, "p_bibi", 1);
            animPoseSetEffectAnim(npc->poseId, "PM_B_2", TRUE);
            animPosePaperPeraOn(npc->poseId);
            animPoseSetLocalTime(npc->poseId, 0.0f);
            event->userdata[0]++;
            psndSFXOn_3D(0x275, &npc->position);
            break;

        default:
            break;

        case 0:
            npc->field_154 += (3.0f - npc->field_154) / 100.0f;
            animPoseSetLocalTime(npc->poseId, 0.0f);
            event->userdata[1]++;
            if (event->userdata[1] > 30) {
                event->userdata[0]++;
                event->userdata[1] = 0;
                switch (animPoseGetVivianType(npc->poseId)) {
                    case 0:
                        break;
                    case 1:
                        psndSFXOn_3D(0x937, &npc->position);
                        break;
                    case 2:
                        psndSFXOn_3D(0x27B, &npc->position);
                        break;
                    case 3:
                        psndSFXOn_3D(0x278, &npc->position);
                        break;
                }
            }
            break;

        case 1:
            animPoseSetEffect(npc->poseId, "p_bibi", 1);
            animPoseSetEffectAnim(npc->poseId, "PM_B_2", TRUE);
            animPosePaperPeraOn(npc->poseId);
            event->userdata[0]++;
            break;

        case 2:
            if (animPoseGetLoopTimes(animPoseGetAnimPosePtr(npc->poseId)->paperId) >= 0.66666666f) {
                animPoseSetPaperAnimGroup(npc->poseId, NULL, TRUE);
                event->userdata[0]++;
            }
            break;

        case 3:
            npc->field_154 += (1.0f - npc->field_154) / 10.0f;
            event->userdata[1]++;
            if (event->userdata[1] > 30) {
                return EVT_RETURN_DONE;
            }
            break;
    }
    return EVT_RETURN_BLOCK;
}

USER_FUNC(evt_npc_majo_disp_off) {
    const char* npcName = (const char*)evtGetValue(event, *event->args);
    s32 group = gp->inBattle != 0;
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);

    if (isFirstCall) {
        event->userdata[0] = 0;
        event->userdata[1] = 0;
        psndSFXOn_3D(0x275, &npc->position);
    }

    if (!animGroupBaseAsync("p_bibi", group, NULL)) {
        return EVT_RETURN_BLOCK;
    }

    switch (event->userdata[0]) {
        case 0:
            npc->field_154 += (3.0f - npc->field_154) / 10.0f;
            event->userdata[1]++;
            if (event->userdata[1] > 30) {
                event->userdata[0]++;
                event->userdata[1] = 0;
                switch (animPoseGetVivianType(npc->poseId)) {
                    case 0:
                        break;
                    case 1:
                        psndSFXOn_3D(0x936, &npc->position);
                        break;
                    case 2:
                        psndSFXOn_3D(0x27A, &npc->position);
                        break;
                    case 3:
                        psndSFXOn_3D(0x277, &npc->position);
                        break;
                }
            }
            break;

        default:
            break;

        case 1:
            animPoseSetEffect(npc->poseId, "p_bibi", 1);
            animPoseSetEffectAnim(npc->poseId, "PM_B_1", TRUE);
            animPosePaperPeraOn(npc->poseId);
            animPoseSetLocalTime(animPoseGetAnimPosePtr(npc->poseId)->paperId, 8.0f);
            event->userdata[0]++;
            break;

        case 2:
            if (animPoseGetLoopTimes(animPoseGetAnimPosePtr(npc->poseId)->paperId) >= 1.0f) {
                event->userdata[0]++;
            }
            break;

        case 3:
            npc->field_154 += (-npc->field_154 / 10.0f);
            event->userdata[1]++;
            if (event->userdata[1] > 30) {
                npc->field_154 = 0.0f;
                return EVT_RETURN_DONE;
            }
            break;
    }
    return EVT_RETURN_BLOCK;
}

USER_FUNC(evt_npc_get_kpencount_type) {
    s32* args = event->args;
    const char* npcName = (const char*)evtGetValue(event, *args++);
    s32 index = *args++;
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    evtSetValue(event, index, npc->koopaEncounterType);
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_calc_score) {
    const char* npcName = (const char*)evtGetValue(event, *event->args);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    npcCalcScore(npc);
    return EVT_RETURN_DONE;
}

#pragma dont_inline on
void _kamek_houki_kemuri(NpcEntry* npc, s32 arg1) {
    static u8 cnt;
    f32 a2, a5;
    u8 mask;
    EffectEntry* effect;

    cnt += 1;
    switch (arg1) {
        case 3:
            mask = 0x7;
            break;
        case 2:
            mask = 0xF;
            break;
        default:
            return;
    }

    if (!(cnt & mask)) {
        if ((0.0f < npc->direction) && (npc->direction < 180.0f)) {
            a5 = 1.0f;
            a2 = -((36.0f * npc->scale.x) - npc->position.x);
        } else {
            a5 = -1.0f;
            a2 = (36.0f * npc->scale.x) + npc->position.x;
        }
        effect = effKemuri10N64Entry(0, a2, (18.0f * npc->scale.x) + npc->position.y, npc->position.z, a5, 0.0f, 0.0f,
                                     npc->scale.x);
        if (!strcmp(gp->currentMapName, "kpa_01")) {
            *(u32*)((u32)effect->userdata + 0x6C) = 7;
        }
    }
}
#pragma dont_inline reset

USER_FUNC(evt_npc_kamek_move_position) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    f32 temp1;
    f32 temp2;
    f32 delta;
    f32 targetX = evtGetFloat(event, *args++);
    f32 targetZ = evtGetFloat(event, *args++);
    f32 moveOffset = evtGetFloat(event, *args++);
    f32 moveTime = (f32)evtGetValue(event, *args++) / 1000.0f;
    f32 moveSpeed = evtGetFloat(event, *args++);
    s32 moveFlags = *args++;

    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    Vec diff;
    f32 dist;
    f32 dist1, dist2;
    f32 step;
    s32 sfxFlag;

    npc->jumpFlags |= 0x10;
    if (moveFlags & 0x2) {
        npc->jumpFlags |= 0x1000;
    }

    if (isFirstCall) {
        npc->field_188 = 0;
        npc->field_108 = 0;

        npc->jumpTargetPos.x = targetX;
        npc->jumpTargetPos.y = npc->position.y;
        npc->jumpTargetPos.z = targetZ;
        npc->jumpStartPos = npc->position;

        VECSubtract(&npc->jumpTargetPos, &npc->jumpStartPos, &diff);
        dist = sqrtf((diff.x * diff.x) + (diff.z * diff.z));

        npc->moveDir = angleABf(0.0f, 0.0f, diff.x, diff.z);
        npc->moveSpeed = moveSpeed;
        npc->moveTime = moveTime;
        npc->moveOffset.y = 0.0f;

        // No speed AND no time -> default to 1.0
        if (npc->moveSpeed <= 0.1f && npc->moveTime == 0.0f) {
            npc->moveSpeed = 1.0f;
        }
        // Time given but no speed -> derive speed, then run as speed-mode
        if (npc->moveSpeed <= 0.1f) {
            npc->moveSpeed = dist / npc->moveTime;
            npc->moveTime = 0.0f;
        }
    }

    // flag 0x4: bail if blocked
    if ((moveFlags & 0x4) && npc->field_2FC) {
        return EVT_RETURN_DONE;
    }

    VECSubtract(&npc->jumpTargetPos, &npc->jumpStartPos, &diff);
    dist1 = sqrtf((diff.x * diff.x) + (diff.z * diff.z));
    VECSubtract(&npc->jumpTargetPos, &npc->position, &diff);
    dist2 = sqrtf((diff.x * diff.x) + (diff.z * diff.z));
    step = (20.0f * npc->moveSpeed) / 1000.0f;

    if (npc->moveTime) {
        // timed move: field_0x1a0 is elapsed/progress, advanced externally
        if (npc->moveTime <= npc->field_1A0) {
            npc->prevPosition = npc->jumpTargetPos;
            npc->position = npc->prevPosition;
            npc->moveSpeed = 0.0f;
            return EVT_RETURN_DONE;
        }
    } else {
        // speed move: snap when within a step (or essentially on top of target)
        if (!npc->moveTime && dist2 <= step) {
            npc->prevPosition = npc->jumpTargetPos;
            npc->position = npc->prevPosition;
            npc->moveSpeed = 0.0f;
            return EVT_RETURN_DONE;
        }
    }

    // Re-aim at the target each frame unless direction is locked
    if ((moveFlags & 0x1) && !(npc->jumpFlags & 0x1)) {
        npc->moveDir = angleABf(0.0f, 0.0f, diff.x, diff.z);
    }

    // Turn the body toward travel (unless mid battle-transition states 5/6)
    if ((npc->jumpFlags & 0x2) && npc->moveSpeed > 0.1f) {
        if (npc != fbatGetPointer()->target || (fbatGetPointer()->mode != 5 && fbatGetPointer()->mode != 6)) {
            npcTuningRy(npc, npc->moveDir);
        }
    }

    {
        f32 temp;
        temp = (f32)sin(((6.2831855f * npc->moveDir) / 360.0f));
        npc->moveOffset.x += npc->moveDt * (npc->moveSpeed * temp);
        temp = (f32)cos(((6.2831855f * npc->moveDir) / 360.0f));
        npc->moveOffset.z += npc->moveDt * (npc->moveSpeed * -temp);
    }
    {
        delta = dist1 - dist2;

        temp2 = (f32)sin(3.1415927f * (2.0f * ((delta) / dist1)));
        temp1 = (f32)sin(3.1415927f * (2.0f * (((npc->moveSpeed * npc->moveDt) + delta) / dist1)));
        npc->moveOffset.y += (moveOffset * temp1) - (moveOffset * temp2);
    }

    if ((moveFlags & 8) == 0) {
        _kamek_houki_kemuri(npc, npc->field_108);
    }

    return EVT_RETURN_BLOCK;
}

USER_FUNC(evt_npc_kamek_kemuri1) {
    const char* npcName = (const char*)evtGetValue(event, *event->args);
    NpcEntry* npc = npcNameToPtr(npcName);

    if (isFirstCall) {
        return EVT_RETURN_BLOCK;
    }

    if (npc->moveTime) {
        if (npc->moveTime > npc->field_1A0) {
            _kamek_houki_kemuri(npc, npc->field_108);
            return EVT_RETURN_BLOCK;
        }
        goto block_7; // TODO: ???
    }

    if (npc->moveSpeed > 0.0f) {
        _kamek_houki_kemuri(npc, npc->field_108);
        return EVT_RETURN_BLOCK;
    }
block_7:
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_kamek_kemuri2) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    f32 moveTime = (f32)evtGetValue(event, *args++) / 1000.0f;
    s32 unk = evtGetValue(event, *args++);
    NpcEntry* npc = npcNameToPtr(npcName);

    if (isFirstCall) {
        if (moveTime <= 0.0f) {
            return EVT_RETURN_DONE;
        }

        npc->field_188 = 0;
        npc->moveTime = moveTime;
        return EVT_RETURN_BLOCK;
    }

    if (npc->moveTime <= npc->field_1A0) {
        return EVT_RETURN_DONE;
    }

    _kamek_houki_kemuri(npc, (unk != 0) + 2);
    return EVT_RETURN_BLOCK;
}

USER_FUNC(evt_fbat_trans_floor_position) {
    s32* args = event->args;

    f32 hitX, hitY, hitZ;
    f32 distance;
    f32 hitNX, hitNY, hitNZ;

    s32 arg0 = *args++;
    f32 x = evtGetFloat(event, arg0);
    s32 arg1 = *args++;
    f32 y = evtGetFloat(event, arg1);
    s32 arg2 = *args++;
    f32 z = evtGetFloat(event, arg2);
    f32 floor = evtGetFloat(event, *args++);

    distance = evtGetFloat(event, *args++);

    if (hitCheckFilter(0, &hitX, &hitY, &hitZ, &distance, &hitNX, &hitNY, &hitNZ, x, 1.0f + y, z, 0.0f, -1.0f, 0.0f)) {
        y = (hitY + floor);
    }

    evtSetFloat(event, arg0, x);
    evtSetFloat(event, arg1, y);
    evtSetFloat(event, arg2, z);
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_sound_data_reset) {
    const char* npcName = (const char*)evtGetValue(event, *event->args);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);
    NpcTribeInfo* tribe = npc->tribe;
    if (tribe) {
        npc->footstepSfxA = tribe->footstepSfxA;
        npc->footstepSfxB = tribe->footstepSfxB;
        npc->jumpSfx = tribe->jumpSfx;
        npc->landSfx = tribe->landSfx;
        npc->footstepStride = tribe->footstepStride;
        npc->footstepToggle = 1;
        npc->footstepAccum = 0.0f;
    }
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_sound_data_set) {
    s32* args = event->args;

    const char* npcName = (const char*)evtGetValue(event, *args++);
    NpcEntry* npc = evtNpcNameToPtr(event, npcName);

    s32 arg1 = *args++;
    const char* footstepSfxA = (const char*)evtGetValue(event, arg1);
    s32 arg2 = *args++;
    const char* footstepSfxB = (const char*)evtGetValue(event, arg2);
    s32 arg3 = *args++;
    u16 footstepStride = evtGetValue(event, arg3);
    s32 arg4 = *args++;
    const char* jumpSfx = (const char*)evtGetValue(event, arg4);
    s32 arg5 = *args++;
    const char* landSfx = (const char*)evtGetValue(event, arg5);

    if (arg1 != -250000000) {
        npc->footstepSfxA = footstepSfxA;
    }
    if (arg2 != -250000000) {
        npc->footstepSfxB = footstepSfxB;
    }
    if (arg4 != -250000000) {
        npc->jumpSfx = jumpSfx;
    }
    if (arg5 != -250000000) {
        npc->landSfx = landSfx;
    }
    if (arg3 != -250000000) {
        npc->footstepStride = footstepStride;
    }
    npc->footstepToggle = TRUE;
    npc->footstepAccum = 0.0f;
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_npc_release_fieldnpc) {
    BOOL set = evtGetValue(event, *event->args);
    NpcWork* wp = npcGetWorkPtr();
    if (set) {
        wp->flags |= 2;
    } else {
        wp->flags &= ~2;
    }
    return EVT_RETURN_DONE;
}
