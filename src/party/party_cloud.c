#include "party/party_cloud.h"
#include "dolphin/types.h"
#include "musyx/musyx.h"
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

        if(camera->stateA == 0) {
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
        cloud_at.x = camGetPtr(CAMERA_3D)->cameraAt.x;
        cloud_at.y = camGetPtr(CAMERA_3D)->cameraAt.y;
        cloud_at.z = camGetPtr(CAMERA_3D)->cameraAt.z;

        marioCamZoomOffReq2(600);
    }

    mario->dispFlags &= ~(1 << 8); //kDisableMakeDispDir
    mario->dispFlags &= ~(1 << 2); //kForceFrontPose
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
        mario->multiTimer = 0;
        mario->airTimer = 0;
        mario->currSubMotionId = 0;
    }
}

f32 cloudGetBreathDir() {
    PartyEntry* party = partyGetPtr(PARTY_SLOT_PARTY);
    f32 breathDir;

    if (party == NULL) {
        return 0.0f;
    }

    if ((party->flags & PARTY_FLAG_IS_BEING_USED) != 0 && (party->useMotionId < MARIO_MOTION_FALL)){
        breathDir = -1.0f;
    }
    else if (party->useStruct == NULL) {
        breathDir = 0.0f;
    }
    else {
        PartyCloud* cloud = (PartyCloud*)party->useStruct;
        breathDir = toMovedir(cloud->unk4);
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
        PartyCloud* cloud = (PartyCloud*)party->useStruct;
        breathDist = cloud->unk8;
    }

    return breathDist;
}

f32 cloudGetBreathPower(f32 param_1, Vec* param_2) {
    PartyEntry* party = partyGetPtr(PARTY_SLOT_PARTY);
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
        PartyCloud* cloud = (PartyCloud*)party->useStruct;
        unk8 = cloud->unk8;
        if (-((0.5f * param_1) - distABf(party->position.x, party->position.z, param_2->x, param_2->z)) <= unk8) {
            PartyCloud* cloud = (PartyCloud*)party->useStruct;
            dist = toMovedir(cloud->unk4);
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


s32 cloudGetHitBreathout(s32 param_1) {
    u32 partyId = marioGetPartyId();
    PartyEntry* party = partyGetPtr(partyId);
    s32 hitBreathout;

    if (party == NULL) {
        return 0;
    }

    if (
        party->currentMemberId != PARTY_MEMBER_FLURRIE 
        || (party->flags & PARTY_FLAG_IS_BEING_USED) == 0
        || party->useMotionId < MARIO_MOTION_FALL
    ){
            return 0;
    }

    hitBreathout = 0;
    if (param_1 == 0) {
        hitBreathout = ((PartyCloud*)party->useStruct)->unk20;
    }
    else if (param_1 == 1) { 
        hitBreathout = ((PartyCloud*)party->useStruct)->unk24;
    }
    else if (param_1 == 2) {
        hitBreathout = ((PartyCloud*)party->useStruct)->unk28;
    }
    else if (param_1 == 3) { 
        hitBreathout = ((PartyCloud*)party->useStruct)->unk2C;
    }
    
    return hitBreathout;
}
