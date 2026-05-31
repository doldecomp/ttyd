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

        cloud_at->x = (camera->target).x;
        cloud_at->y = (camera->target).y;
        cloud_at->z = (camera->target).z;

        marioCamZoomOffReq2(600);
    }

    mario->dispFlags = mario->dispFlags & ~(1 << 8); //kDisableMakeDispDir
    mario->dispFlags = mario->dispFlags & ~(1 << 2); //kForceFrontPose
    marioAdjustMoveDir();
    mario->unk150.x = float_0p01_8041dfb0;
    mario->unk138 = float_0_8041df70;
}
