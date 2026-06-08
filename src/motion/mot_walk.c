#include "dolphin/types.h"
#include "driver/hitdrv.h"
#include "pmario_sound.h"
#include "mario/mario.h"
#include "driver/casedrv.h"
#include "mot/mot_slit.h"
#include "mario/mario_cam.h"
#include "mario/mario_motion.h"
#include "koopa_motion.h"
#include "peach.h"
#include "mario/mario_pouch.h"

extern s32 gp; // m2c

void marioWalkDashSe(HitObj* hitObj, u32 arg1) {
    s32 hitAttr;
    MarioWork* mario;

    mario = marioGetPtr();
    hitAttr = hitGetAttr(hitObj);
    if ((mario->multiTimer % arg1) == 0) {
        if (hitAttr & 0x100) {
            psndSFXOn_3D((char*)0x143, &mario->position);
            return;
        }
        if (hitAttr & 0x200000) {
            psndSFXOn_3D((char*)0x145, &mario->position);
            return;
        }
        if (hitAttr & 0x100000) {
            psndSFXOn_3D((char*)0x147, &mario->position);
            return;
        }
        if (hitAttr & 0x1000) {
            if (strncmp((char*)(gp + 0x12C), "mri", 3) != 0) {
                psndSFXOn_3D((char*)0x149, &mario->position);
                return;
            }
            psndSFXOn_3D((char*)0x143, &mario->position);
            return;
        }
        if (hitAttr & 0x400000) {
            psndSFXOn_3D((char*)0x14B, &mario->position);
            return;
        }
        psndSFXOn_3D((char*)0x141, &mario->position);
        return;
    }
    if ((mario->multiTimer % (arg1 >> 1U)) == 0) {
        if (hitAttr & 0x100) {
            psndSFXOn_3D((char*)0x142, &mario->position);
            return;
        }
        if (hitAttr & 0x200000) {
            psndSFXOn_3D((char*)0x144, &mario->position);
            return;
        }
        if (hitAttr & 0x100000) {
            psndSFXOn_3D((char*)0x146, &mario->position);
            return;
        }
        if (hitAttr & 0x1000) {
            if (strncmp((char*)(gp + 0x12C), "mri", 3) != 0) {
                psndSFXOn_3D((char*)0x148, &mario->position);
                return;
            }
            psndSFXOn_3D((char*)0x142, &mario->position);
            return;
        }
        if (hitAttr & 0x400000) {
            psndSFXOn_3D((char*)0x14A, &mario->position);
            return;
        }
        psndSFXOn_3D((char*)0x140, &mario->position);
    }
}

void mot_dash(void) {
    f32 dashSpeed;
    u32 trigFlags;
    BOOL unkConditionActive;
    s32 unkArgMarioWalkDashSe;
    s8 characterId;
    s8 stickDir2;
    s8 _stickDir2;
    s8 stickDir1;
    s8 _stickDir1;
    MarioWork* player;
    CaseEntry* caseEntry;
    MarioWork* _player;
    void* hitobjPush;

    player = marioGetPtr();
    characterId = player->characterId;
    if (characterId == 2) {
        kpa_dash();
        return;
    }
    if (characterId == 1) {
        peach_dash();
        return;
    }
    if (player->hitobjPush == NULL) {
        unkConditionActive = FALSE;
    } else {
        caseEntry = caseCheckHitObj(player->hitobjPush);
        if (caseEntry != NULL && caseEntry->activeConditionId == 0xA) {
            unkConditionActive = TRUE;
        } else {
            unkConditionActive = FALSE;
        }
    }
    if (!unkConditionActive && player->hitobjPush == NULL) {
        player->flags = player->flags & ~MARIO_FLAG_IS_PUSHING;
        if (marioChkPushAnime() && !marioBgmodeChk()) {
            marioChgPose("M_R_1");
        }
    }
    trigFlags = player->trigFlags;
    if (trigFlags & MARIO_TRIG_FLAG_IS_STARTING_NEW_MOTION) {
        player->trigFlags = trigFlags & ~MARIO_TRIG_FLAG_IS_STARTING_NEW_MOTION;
        player->flags = player->flags & ~(MARIO_FLAG_HAS_INPUT_JUMP | MARIO_FLAG_IS_JUMPING | MARIO_FLAG_IS_FALLING |
                                          MARIO_FLAG_IS_STEPPING);
        marioResetCamFollowRate();
        if (player->flags & MARIO_FLAG_PAPER_MODE) {
            motSlitContinue();
        }
        if (player->playerGravity == 1.0f) {
            if (player->flags & MARIO_FLAG_IS_PUSHING) {
                if (!marioChkPushAnime()) {
                    marioChgPose("M_O_1");
                }
            } else if (!marioBgmodeChk()) {
                marioChgPose("M_R_1");
            }
        } else if (player->flags & MARIO_FLAG_IS_PUSHING) {
            if (!marioChkPushAnime()) {
                marioChgPose("M_O_1");
            }
        } else {
            marioChgPose("M_W_1");
        }
        if (player->forceMoveTimer == 0) {
            _player = marioGetPtr();
            dashSpeed = _player->mBaseDashSpeed;
            if (_player->flags & MARIO_FLAG_PAPER_MODE) {
                stickDir1 = _player->wStickDir1;
                stickDir2 = _player->wStickDir2;
                dashSpeed = _player->mBaseWalkSpeed;
                if ((stickDir1 * stickDir1) + (stickDir2 * stickDir2) <= 0xBD1) {
                    dashSpeed *= 0.5f;
                }
            } else if (marioBgmodeChk() == 1) {
                dashSpeed *= 0.5f;
            }
            dashSpeed *= _player->playerGravity;
            player->baseSpeed = dashSpeed;
        }
    }
    if (!(player->flags & MARIO_FLAG_IS_CARRYING_BOBBERY) &&
        (strcmp(player->animName, "M_I_Y") == 0 || player->wMotionTimer > 0xA)) {
        marioChgMot(MARIO_MOTION_STAY);
        return;
    }
    if (player->flags & MARIO_FLAG_IS_CARRYING_BOBBERY) {
        marioChgMot(MARIO_MOTION_WALK);
        return;
    }
    if (marioSlitAbilityChk() && marioSlitButton() == 1) {
        marioChgMot(MARIO_MOTION_SLIT);
        return;
    }
    if (!marioChkItemMotion()) {
        marioChkJump();
        marioChkTransform();
        if (player->hitobjStandOn != NULL) {
            if (player->playerGravity == 1.0f) {
                unkArgMarioWalkDashSe = 0x14;
            } else {
                unkArgMarioWalkDashSe = 0x28;
            }
            marioWalkDashSe(player->hitobjStandOn, unkArgMarioWalkDashSe);
        }
        player->multiTimer = player->multiTimer + 1;
        if (!(player->flags & MARIO_FLAG_FORCED_MOVEMENT)) {
            _stickDir1 = player->wStickDir1;
            _stickDir2 = player->wStickDir2;
            if ((_stickDir1 * _stickDir1) + (_stickDir2 * _stickDir2) <= 0xBD1) {
                marioChgMot(MARIO_MOTION_WALK);
                return;
            }
            player->directionView = player->controlStickAngle;
            if ((player->flags & MARIO_FLAG_IS_PUSHING) && !marioChkPushAnime()) {
                marioChgPose("M_O_1");
            }
            if (!player->controlStickSensitivity) {
                marioChgMot(MARIO_MOTION_STAY);
            }
        }
    }
}

void mot_walk(void) {
    f32 walkSpeed;
    s32 trigFlags;
    s32 flags;
    BOOL unkConditionActive;
    s32 unkArgMarioWalkDashSe;
    s8 characterId;
    s8 _stickDir2;
    s8 stickDir2;
    s8 _stickDir1;
    s8 stickDir1;
    MarioWork* player;
    CaseEntry* caseEntry;
    MarioWork* _player;

    player = marioGetPtr();
    characterId = player->characterId;
    if (characterId == 2) {
        kpa_walk();
        return;
    }
    if (characterId == 1) {
        peach_walk();
        return;
    }
    if (player->flags & MARIO_FLAG_IS_PUSHING) {
        if (player->hitobjPush == NULL) {
            unkConditionActive = FALSE;
        } else {
            caseEntry = caseCheckHitObj(player->hitobjPush);
            if (caseEntry != NULL && caseEntry->activeConditionId == 0xA) {
                unkConditionActive = TRUE;
            } else {
                unkConditionActive = FALSE;
            }
        }
        if (!unkConditionActive) {
            player->flags = player->flags & ~MARIO_FLAG_IS_PUSHING;
            if (marioChkPushAnime() && !marioBgmodeChk()) {
                marioChgPose("M_W_1");
            }
        }
    }
    trigFlags = player->trigFlags;
    if (trigFlags & MARIO_TRIG_FLAG_IS_STARTING_NEW_MOTION) {
        player->trigFlags = trigFlags & ~MARIO_TRIG_FLAG_IS_STARTING_NEW_MOTION;
        player->flags = player->flags & ~(MARIO_FLAG_HAS_INPUT_JUMP | MARIO_FLAG_IS_JUMPING | MARIO_FLAG_IS_FALLING |
                                          MARIO_FLAG_IS_STEPPING);
        marioResetCamFollowRate();
        if (player->flags & MARIO_FLAG_PAPER_MODE) {
            motSlitContinue();
        }
        if (player->forceMoveTimer == 0) {
            _player = marioGetPtr();
            walkSpeed = _player->mBaseWalkSpeed;
            if (_player->flags & MARIO_FLAG_PAPER_MODE) {
                _stickDir1 = _player->wStickDir1;
                _stickDir2 = _player->wStickDir2;
                if ((_stickDir1 * _stickDir1) + (_stickDir2 * _stickDir2) <= 0xBD1) {
                    walkSpeed *= 0.5f;
                }
            } else if (marioBgmodeChk() == 1) {
                walkSpeed *= 0.5f;
            }
            walkSpeed *= _player->playerGravity;
            player->baseSpeed = walkSpeed;
        }
        flags = player->flags;
        if (flags & MARIO_FLAG_IS_CARRYING_BOBBERY) {
            marioChgPose("M_W_7");
        } else if (flags & MARIO_FLAG_IS_PUSHING) {
            if (!marioChkPushAnime()) {
                marioChgPose("M_O_1");
            }
        } else if (!marioBgmodeChk()) {
            marioChgPose("M_W_1");
        }
        if (!(player->dispFlags & (1 << 24))) {
            player->currSubMotionId = 0;
        }
        player->multiTimer = 0;
    }
    if (!(player->flags & MARIO_FLAG_IS_CARRYING_BOBBERY) &&
        (strcmp(player->animName, "M_I_Y") == 0 || player->wMotionTimer > 0xA)) {
        marioChgMot(MARIO_MOTION_STAY);
        return;
    }
    if (player->flags & MARIO_FLAG_IS_CARRYING_BOBBERY) {
        player->directionView = player->controlStickAngle;
        if (!player->controlStickSensitivity) {
            marioChgMot(MARIO_MOTION_STAY);
        }
    } else {
        if (marioSlitAbilityChk() && marioSlitButton() == 1) {
            marioChgMot(MARIO_MOTION_SLIT);
            return;
        }
        if (!marioChkItemMotion()) {
            marioChkJump();
            marioChkTransform();
            if (pouchEquipCheckBadge(0x143) == 0) {
                stickDir1 = player->wStickDir1;
                stickDir2 = player->wStickDir2;
                if ((stickDir1 * stickDir1) + (stickDir2 * stickDir2) > 0xBD1) {
                    marioChgMot(MARIO_MOTION_DASH);
                    return;
                }
            }
            player->directionView = player->controlStickAngle;
            if (player->hitobjStandOn != 0) {
                // Redundant, but doesn't match otherwise
                if (player->playerGravity == 1.0f) {
                    unkArgMarioWalkDashSe = 0x28;
                } else {
                    unkArgMarioWalkDashSe = 0x28;
                }
                marioWalkDashSe(player->hitobjStandOn, unkArgMarioWalkDashSe);
            }
            player->multiTimer = player->multiTimer + 1;
            if (player->flags & MARIO_FLAG_IS_PUSHING && !marioChkPushAnime()) {
                marioChgPose("M_O_1");
            }
            if (!player->controlStickSensitivity) {
                marioChgMot(MARIO_MOTION_STAY);
            }
        }
    }
}

f32 marioGetDashSpd(void) {
    MarioWork* mario;
    f32 dashSpeed;
    s8 stickDir2;
    s8 stickDir1;

    mario = marioGetPtr();
    dashSpeed = mario->mBaseDashSpeed;
    if (mario->flags & MARIO_FLAG_PAPER_MODE) {
        stickDir1 = mario->wStickDir1;
        stickDir2 = mario->wStickDir2;
        dashSpeed = mario->mBaseWalkSpeed;

        if ((stickDir1 * stickDir1) + (stickDir2 * stickDir2) <= 0xBD1) {
            dashSpeed *= 0.5f;
        }
    } else if (marioBgmodeChk() == 1) {
        dashSpeed *= 0.5f;
    }

    dashSpeed *= mario->playerGravity;
    return dashSpeed;
}

f32 marioGetWalkSpd(void) {
    f32 walkSpeed;
    s8 stickDir2;
    s8 stickDir1;
    MarioWork* mario;

    mario = marioGetPtr();
    walkSpeed = mario->mBaseWalkSpeed;
    if (mario->flags & MARIO_FLAG_PAPER_MODE) {
        stickDir1 = mario->wStickDir1;
        stickDir2 = mario->wStickDir2;
        if ((stickDir1 * stickDir1) + (stickDir2 * stickDir2) <= 0xBD1) {
            walkSpeed *= 0.5f;
        }
    } else if (marioBgmodeChk() == 1) {
        walkSpeed *= 0.5f;
    }

    walkSpeed *= mario->playerGravity;
    return walkSpeed;
}
