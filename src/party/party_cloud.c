#include "party/party_cloud.h"
#include "party.h"
#include "mario/mario.h"
#include "mario/mario_sbr.h"
#include "mario/mario_party.h"
#include "mario/mario_cam.h"
#include "system.h"
#include <math.h>

Vec cloud_at;

void cloudGetAt(Vec* position) {
    MarioWork* mario = marioGetPtr();
    u32 partyId = marioGetPartyId();
    PartyEntry* party = partyGetPtr(partyId);

    if (party == NULL || (party->currentMemberId == PARTY_MEMBER_FLURRIE && (party->flags & PARTY_FLAG_IS_BEING_USED) == 0)) {
        return;
    }

    if ((mario->dispFlags & (1 << 20)) == 0) {
        CameraEntry* camera = camGetPtr(CAMERA_3D);

        if(camera->unk4 == 0) {
            cloud_at = *position;
        }
        else {
            *position = cloud_at;
        }
    }
}

void cloudResetAt() {
    MarioWork* mario = marioGetPtr();
    u32 partyId = marioGetPartyId();
    PartyEntry* party = partyGetPtr(partyId);

    if(party != NULL && party->currentMemberId == PARTY_MEMBER_FLURRIE) {
        CameraEntry* camera = camGetPtr(CAMERA_3D);
        cloud_at.x = camera->target.x;
        camera = camGetPtr(CAMERA_3D);
        cloud_at.y = camera->target.y;
        camera = camGetPtr(CAMERA_3D);
        cloud_at.z = camera->target.z;

        marioCamZoomOffReq2(600);
    }

    mario->dispFlags = mario->dispFlags & ~(1 << 8); //kDisableMakeDispDir
    mario->dispFlags = mario->dispFlags & ~(1 << 2); //kForceFrontPose
    marioAdjustMoveDir();
    mario->unk150.x = 0.01f;
    mario->unk138 = 0.0f;
}

u8 cloudGetStatus() {
    u32 partyId = marioGetPartyId();
    PartyEntry* party = partyGetPtr(partyId);
    u8 status = 2;

    if (party == NULL || (party->currentMemberId == PARTY_MEMBER_FLURRIE && (party->flags & PARTY_FLAG_IS_BEING_USED) == 0)) {
        status = 0;
        return status;
    }
    else if (party->useMotionId == 10 && party->useMotionId < 20) {
        status = 1;
    }

    return status;
}

void mot_cloud() {
    MarioWork* mario = marioGetPtr();
    
    if((mario->trigFlags & 0x1) != 0) {
        mario->trigFlags &= ~0x1;
        mario->flags &= ~(MARIO_FLAG_HAS_INPUT_JUMP|MARIO_FLAG_IS_STEPPING|MARIO_FLAG_IS_FALLING|MARIO_FLAG_IS_JUMPING);
        mario->wMultiTimer = 0;
        mario->airTimer = 0;
        mario->currSubMotionId = 0;
    }
}

f32 cloudGetBreathDir() {
    PartyEntry* party = partyGetPtr(kParty);
    f32 breathDir;

    if (party == NULL) {
        breathDir = 0.0f;
        return breathDir;
    }

    if ((party->flags & PARTY_FLAG_IS_BEING_USED) != 0 && (party->useMotionId < MARIO_MOTION_FALL)){
        breathDir = -1.0f;
    }
    else if (party->useStruct == NULL) {
        breathDir = 0.0f;
    }
    else {
        breathDir = toMovedir(party->useStruct->unk4);
    }
    
    return breathDir;
}

f32 cloudGetBreathDist() {
    u32 partyId = marioGetPartyId();
    PartyEntry* party = partyGetPtr(partyId);
    f32 breathDist;

    if (party == NULL) {
        breathDist = 0.0f;
        return breathDist;
    }

    if ((party->currentMemberId != PARTY_MEMBER_FLURRIE || (party->flags & PARTY_FLAG_IS_BEING_USED) == 0) || party->useMotionId < MARIO_MOTION_FALL) {
        breathDist = 0.0f;
    }
    else {
        breathDist = party->useStruct->unk8;
    }

    return breathDist;
}

f32 cloudGetBreathPower(f32 param_1, Vec* param_2) {
    PartyEntry* party = partyGetPtr(kParty);
    f32 breathPower;
    f32 dist;
    f32 angle;
    f32 unk8;
    f32 val;

    breathPower = 0.0f;
    if (party == NULL)  {
        return breathPower;
    }

    val = 10.0f;
    if(
        party->currentMemberId == PARTY_MEMBER_FLURRIE 
        && (party->flags & PARTY_FLAG_IS_BEING_USED) != 0 
        && party->useMotionId >= MARIO_MOTION_FALL
        && ((fabs(party->position.y - param_2->y - 18.0f)) <= val)
    ) {
        unk8 = party->useStruct->unk8;
        if (-((0.5f * param_1) - distABf(party->position.x, party->position.z, param_2->x, param_2->z)) <= unk8) {
            dist = toMovedir(party->useStruct->unk4);
            angle = angleABf(party->position.x, party->position.z, param_2->x, param_2->z);
            dist = revise360(angle - dist);
            
            if (dist <= 30.0f || dist >= 330.0f) {
                breathPower = cos((3.1415927f * dist) / 180.0f);
                val = 100.0f;
                breathPower = val * fabsf(breathPower);
            }
        }
    }

    return breathPower;
}


// Might be beyond me at the moment
//
// u8 cloudGetHitBreathout(u8 param_1) {
//     u32 partyId = marioGetPartyId();
//     PartyEntry* party = partyGetPtr(partyId);
//     u8 hitBreathout;

//     if (party == NULL) {
//         hitBreathout = 0.0f;
//         return hitBreathout;
//     }

//     if (
//         party->currentMemberId == PARTY_MEMBER_FLURRIE 
//         && (party->flags & PARTY_FLAG_IS_BEING_USED) != 0 
//         && party->useMotionId >= MARIO_MOTION_FALL
//     ){
//         hitBreathout = 0;
//         switch (param_1) {
//             case 0: 
//                 hitBreathout = (int)party->useStruct + 0x20;
//                 break;
//             case 1: 
//                 hitBreathout = (int)party->useStruct + 0x24;
//                 break;
//             case 2: 
//                 hitBreathout = (int)party->useStruct + 0x28;
//                 break;
//             case 3: 
//                 hitBreathout = (int)party->useStruct + 0x2C;
//                 break;
//             default: 
//                 hitBreathout = 0;
//                 break;
//         }
//         return hitBreathout;
//     }
//     else {
//         hitBreathout = 0;
//     }
//     return hitBreathout;
// }
