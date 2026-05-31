#include "party/party_cloud.h"
#include "party.h"
#include "mario/mario.h"

Vec cloud_at;

void cloudGetAt(Vec* position) {
    MarioWork* mario = marioGetPtr();
    u32 partyId = marioGetPartyId();
    PartyEntry* party = partyGetPtr(partyId);

    if (party == NULL || (party->currentMemberId == PARTY_FLURRIE && (party->flags & (1 << 8)) == 0)) {
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

    if(party != NULL && party->currentMemberId == PARTY_FLURRIE) {
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

    if (party == NULL || (party->currentMemberId == PARTY_FLURRIE && (party->flags & (1 << 8)) == 0)) {
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
        mario->flags &= ~0xF0000;
        mario->wMultiTimer = 0;
        mario->airTimer = 0;
        mario->currSubMotionId = 0;
    }
}
