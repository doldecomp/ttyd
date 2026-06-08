#include "dolphin/types.h"
#include "driver/hitdrv.h"
#include "pmario_sound.h"
#include "mario/mario.h"
#include "driver/casedrv.h"

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
    s32 temp_r3_3;
    s32 conditionActive;
    s32 var_r4;
    u8 characterId;
    u8 stickDir2;
    u8 _stickDir2;
    u8 stickDir1;
    u8 _stickDir1;
    MarioWork* player;
    CaseEntry* caseEntry;
    MarioWork* _player;

    player = marioGetPtr();
    characterId = player->characterId;
    if ((s8) characterId == 2) {
        kpa_dash();
        return;
    }
    if ((s8) characterId == 1) {
        peach_dash();
        return;
    }
    if (player->hitobjPush == NULL) {
        conditionActive = FALSE;
    } else {
        caseEntry = caseCheckHitObj();
        if (caseEntry != NULL && caseEntry->activeConditionId == 0xA) {
            conditionActive = TRUE;
        } else {
            conditionActive = FALSE;
        }
    }
    if (conditionActive == 0 && player->hitobjPush == NULL) {
        player->flags = player->flags & 0xFFFF7FFF;
        if ((marioChkPushAnime() != 0) && (marioBgmodeChk() == 0)) {
            marioChgPose("M_R_1");
        }
    }
    temp_r3_3 = player->trigFlags;
    if (temp_r3_3 & 1) {
        player->trigFlags = (s32) (temp_r3_3 & 0xFFFFFFFE);
        player->flags = (s32) (player->flags & 0xFFF0FFFF);
        marioResetCamFollowRate();
        if (player->flags & 0x100000) {
            motSlitContinue();
        }
        if (player->playerGravity == 1.0f) {
            if (player->flags & 0x8000) {
                if (marioChkPushAnime() == 0) {
                    marioChgPose("M_O_1");
                }
            } else if (marioBgmodeChk() == 0) {
                marioChgPose("M_R_1");
            }
        } else if (player->flags & 0x8000) {
            if (marioChkPushAnime() == 0) {
                marioChgPose("M_O_1");
            }
        } else {
            marioChgPose("M_W_1");
        }
        if ((s16) player->forceMoveTimer == 0) {
            _player = marioGetPtr();
            dashSpeed = _player->mBaseDashSpeed;
            if (_player->flags & 0x100000) {
                stickDir1 = _player->wStickDir1;
                stickDir2 = _player->wStickDir2;
                dashSpeed = _player->mBaseWalkSpeed;
                if ((s32) (((s8) stickDir1 * (s8) stickDir1) + ((s8) stickDir2 * (s8) stickDir2)) <= 0xBD1) {
                    dashSpeed *= 0.5f;
                }
            } else if (marioBgmodeChk() == 1) {
                dashSpeed *= 0.5f;
            }
            player->baseSpeed = (f32) (dashSpeed * _player->playerGravity);
        }
    }
    if (!(player->flags & MARIO_FLAG_IS_CARRYING_BOBBERY) && ((strcmp(player->animName, "M_I_Y") == 0) || ((s8) player->wMotionTimer > 0xA))) {
        marioChgMot(0);
        return;
    }
    if (player->flags & MARIO_FLAG_IS_CARRYING_BOBBERY) {
        marioChgMot(1);
        return;
    }
    if ((marioSlitAbilityChk() != 0) && (marioSlitButton() == 1)) {
        marioChgMot(0x15);
        return;
    }
    if (marioChkItemMotion() == 0) {
        marioChkJump();
        marioChkTransform();
        if ((u32) player->multiTimer != 0U) {
            if (player->playerGravity == 1.0f) {
                var_r4 = 0x14;
            } else {
                var_r4 = 0x28;
            }
            marioWalkDashSe(player->hitobjStandOn, var_r4);
        }
        player->multiTimer = (s32) (player->multiTimer + 1);
        if (!(player->flags & 0x20)) {
            _stickDir1 = player->wStickDir1;
            _stickDir2 = player->wStickDir2;
            if (((s8) _stickDir1 * (s8) _stickDir1) + ((s8) _stickDir2 * (s8) _stickDir2) <= 0xBD1) {
                marioChgMot(1);
                return;
            }
            player->directionView = (f32) player->controlStickAngle;
            if ((player->flags & 0x8000) && (marioChkPushAnime() == 0)) {
                marioChgPose("M_O_1");
            }
            if (player->controlStickSensitivity == 0.0f) {
                marioChgMot(0);
            }
        }
    }
}

// void mot_walk(void) {
//     f32 var_f31;
//     s32 temp_r3_3;
//     s32 temp_r3_6;
//     s32 var_r0;
//     u8 temp_r0;
//     u8 temp_r0_2;
//     u8 temp_r0_3;
//     u8 temp_r3_5;
//     u8 temp_r3_7;
//     void* temp_r3;
//     void* temp_r3_2;
//     void* temp_r3_4;

//     temp_r3 = marioGetPtr();
//     temp_r0 = temp_r3->unk3C;
//     if ((s8) temp_r0 == 2) {
//         kpa_walk();
//         return;
//     }
//     if ((s8) temp_r0 == 1) {
//         peach_walk();
//         return;
//     }
//     if (temp_r3->unk0 & 0x8000) {
//         if ((u32) temp_r3->unk1EC == 0U) {
//             var_r0 = 0;
//         } else {
//             temp_r3_2 = caseCheckHitObj();
//             if ((temp_r3_2 != NULL) && ((s32) temp_r3_2->unk4 == 0xA)) {
//                 var_r0 = 1;
//             } else {
//                 var_r0 = 0;
//             }
//         }
//         if (var_r0 == 0) {
//             temp_r3->unk0 = (s32) (temp_r3->unk0 & 0xFFFF7FFF);
//             if ((marioChkPushAnime() != 0) && (marioBgmodeChk() == 0)) {
//                 marioChgPose("M_W_1");
//             }
//         }
//     }
//     temp_r3_3 = temp_r3->unkC;
//     if (temp_r3_3 & 1) {
//         temp_r3->unkC = (s32) (temp_r3_3 & 0xFFFFFFFE);
//         temp_r3->unk0 = (s32) (temp_r3->unk0 & 0xFFF0FFFF);
//         marioResetCamFollowRate();
//         if (temp_r3->unk0 & 0x100000) {
//             motSlitContinue();
//         }
//         if ((s16) temp_r3->unk4E == 0) {
//             temp_r3_4 = marioGetPtr();
//             var_f31 = temp_r3_4->unk184;
//             if (temp_r3_4->unk0 & 0x100000) {
//                 temp_r3_5 = temp_r3_4->unk24E;
//                 temp_r0_2 = temp_r3_4->unk24F;
//                 if ((s32) (((s8) temp_r3_5 * (s8) temp_r3_5) + ((s8) temp_r0_2 * (s8) temp_r0_2)) <= 0xBD1) {
//                     var_f31 *= 0.5f;
//                 }
//             } else if (marioBgmodeChk() == 1) {
//                 var_f31 *= 0.5f;
//             }
//             temp_r3->unk180 = (f32) (var_f31 * temp_r3_4->unk224);
//         }
//         temp_r3_6 = temp_r3->unk0;
//         if (temp_r3_6 & 0x2000) {
//             marioChgPose("M_W_7");
//         } else if (temp_r3_6 & 0x8000) {
//             if (marioChkPushAnime() == 0) {
//                 marioChgPose("M_O_1");
//             }
//         } else if (marioBgmodeChk() == 0) {
//             marioChgPose("M_W_1");
//         }
//         if (!(temp_r3->unk4 & 0x01000000)) {
//             temp_r3->unk44 = 0;
//         }
//         temp_r3->unk48 = 0;
//     }
//     if (!(temp_r3->unk0 & 0x2000) && ((strcmp(temp_r3->unk18, "M_I_Y") == 0) || ((s8) temp_r3->unk40 > 0xA))) {
//         marioChgMot(0);
//         return;
//     }
//     if (temp_r3->unk0 & 0x2000) {
//         temp_r3->unk1A0 = (f32) temp_r3->unk194;
//         if (temp_r3->unk190 == 0.0f) {
//             marioChgMot(0);
//         }
//     } else {
//         if ((marioSlitAbilityChk() != 0) && (marioSlitButton() == 1)) {
//             marioChgMot(0x15);
//             return;
//         }
//         if (marioChkItemMotion() == 0) {
//             marioChkJump();
//             marioChkTransform();
//             if (pouchEquipCheckBadge(0x143) == 0) {
//                 temp_r3_7 = temp_r3->unk24E;
//                 temp_r0_3 = temp_r3->unk24F;
//                 if ((s32) (((s8) temp_r3_7 * (s8) temp_r3_7) + ((s8) temp_r0_3 * (s8) temp_r0_3)) > 0xBD1) {
//                     marioChgMot(2);
//                     return;
//                 }
//             }
//             temp_r3->unk1A0 = (f32) temp_r3->unk194;
//             if ((u32) temp_r3->unk1E4 != 0U) {
//                 if (temp_r3->unk224 == 1.0f) {

//                 }
//                 marioWalkDashSe(0x28);
//             }
//             temp_r3->unk48 = (s32) (temp_r3->unk48 + 1);
//             if ((temp_r3->unk0 & 0x8000) && (marioChkPushAnime() == 0)) {
//                 marioChgPose("M_O_1");
//             }
//             if (temp_r3->unk190 == 0.0f) {
//                 marioChgMot(0);
//             }
//         }
//     }
// }

f32 marioGetDashSpd(void) {
    MarioWork* mario;
    f32 dashSpeed;
    u8 stickDir2;
    u8 stickDir1;

    mario = marioGetPtr();
    dashSpeed = mario->mBaseDashSpeed;
    if (mario->flags & MARIO_FLAG_PAPER_MODE) {
        stickDir1 = mario->wStickDir1;
        stickDir2 = mario->wStickDir2;
        dashSpeed = mario->mBaseWalkSpeed;

        if (((s8)stickDir1 * (s8)stickDir1) + ((s8)stickDir2 * (s8)stickDir2) <= 0xBD1) {
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
    u8 stickDir2;
    u8 stickDir1;
    MarioWork* mario;

    mario = marioGetPtr();
    walkSpeed = mario->mBaseWalkSpeed;
    if (mario->flags & MARIO_FLAG_PAPER_MODE) {
        stickDir1 = mario->wStickDir1;
        stickDir2 = mario->wStickDir2;
        if (((s8) stickDir1 * (s8) stickDir1) + ((s8) stickDir2 * (s8) stickDir2) <= 0xBD1) {
            walkSpeed *= 0.5f;
        }
    } else if (marioBgmodeChk() == 1) {
        walkSpeed *= 0.5f;
    }
    
    walkSpeed *= mario->playerGravity;
    return walkSpeed;
}
