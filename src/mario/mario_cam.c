#include "mario/mario_cam.h"
#include "driver/camdrv.h"
#include "evt/evt_cam.h"
#include "manager/evtmgr.h"
#include "mario/mario.h"
#include "mario/mario_party.h"
#include "mario/mario_sbr.h"
#include "party.h"
#include "party/party_cloud.h"

void marioResetCamShift(void) {
    MarioWork* mario = marioGetPtr();

    mario->unk138 = 0.0f;
    mario->unk140 = 0.0f;
    mario->unk148 = 0.0f;
    mario->unk64 = 0.0f;
    mario->unk68 = 2.0f;
    mario->unk6C = (Vec){ 0.0f, 0.0f, 0.0f };
}

void marioResetCamShiftRate(void) {
    MarioWork* mario = marioGetPtr();

    mario->unk150 = 0.03;
    mario->unk154 = 0.06;
    mario->unk158 = 0.06;
    mario->unk64 = 0.0f;
    mario->unk68 = 2.0f;
    mario->unk6C = (Vec){ 0.0f, 0.0f, 0.0f };
}

void marioInitCamId(void) {
    marioGetPtr()->camId = CAMERA_3D;
}

s32 marioGetCamId(void) {
    return marioGetPtr()->camId;
}

void marioSetCamId(CameraId camId) {
    marioGetPtr()->camId = camId;
}

void marioResetCamFollowRate(void) {
    marioGetPtr()->camFollowRate = 0.2;
}

void marioSetCamFollowRate(f32 followRate) {
    marioGetPtr()->camFollowRate = followRate;
}

f32 marioGetCamFollowRate(void) {
    return marioGetPtr()->camFollowRate;
}

void marioPreCamera(void) {
    f32 roundingFactor;
    if (camGetPtr(CAMERA_3D)->viewYaw >= 0.0f) {
        roundingFactor = 0.5f;
    } else {
        roundingFactor = -0.5f;
    }
    marioGetPtr()->targetYaw = revise360((s32)((1000.0f * camGetPtr(CAMERA_3D)->viewYaw) + roundingFactor) / 1000.0f);
}

void marioCamMain(void) {
}

void marioUpdateCamCollision(Vec collision) {
    MarioWork* mario = marioGetPtr();
    mario->camCollision = collision;
    mario->dispFlags |= 0x40000;
}

void marioUpdateCam(void) {
}

void marioUpdateCamPos(void) {
    marioGetPtr()->dispFlags &= ~0x10000;
}

void marioNoUpdateCamPos(void) {
    marioGetPtr()->dispFlags |= 0x10000;
}

void camFollowYOn(void) {
    camGetPtr(CAMERA_3D)->flags &= ~0x10;
    marioGetPtr()->dispFlags &= ~0x20000;
}

void camFollowYOff(void) {
    camGetPtr(CAMERA_3D)->flags |= 0x10;
    marioGetPtr()->dispFlags |= 0x20000;
}

void marioCamZoomOffReq(void) {
    MarioWork* mario = marioGetPtr();

    if (mario->dispFlags & 0x100000 && !(mario->dispFlags & 0x200000)) {
        mario->dispFlags |= 0x200000;
        mario->unk62 = 220;
        mario->unk5C = 32;
    }
}

void marioCamZoomOffReq2(s32 value) {
    MarioWork* mario = marioGetPtr();

    if (mario->dispFlags & 0x100000) {
        mario->dispFlags |= 0x200000;
        mario->unk62 = value / 10;
        mario->unk5C = 32;
    }
}

BOOL marioCamZoomOff(void) {
    MarioWork* mario = marioGetPtr();
    EventEntry event;
    s32 args[10];
    s32 temp_r8;

    if (!(mario->dispFlags & 0x100000)) {
        mario->dispFlags &= ~0x200000;
        return FALSE;
    }

    if (!(mario->dispFlags & 0x200000)) {
        return FALSE;
    }

    if (--mario->unk5C > 0) {
        return FALSE;
    }

    mario->unk5C = 0;
    mario->unk60 = 0;
    mario->dispFlags &= ~0x300000;
    temp_r8 = mario->unk62 * 10;
    mario->unk5E = ((temp_r8 * 60) / 1000);
    args[0] = temp_r8;
    args[1] = 11;
    event.args = args;
    evt_cam3d_evt_off(&event, TRUE);
    return TRUE;
}

BOOL marioCamZoomUp(void) {
    MarioWork* mario;
    PartyEntry* party;
    EventEntry event;
    s32 args[10];
    Vec cloudPos;
    Vec targetPos;
    Vec cameraDir;
    Vec sp8;
    f32 xOffset;
    f32 yOffset;
    f32 angleAdjust;
    f32 zoomDistance;
    s32 tempX;
    CameraEntry* camera;

    mario = marioGetPtr();
    party = partyGetPtr(marioGetPartyId());

    if (marioBgmodeChk() == 1) {
        return FALSE;
    }

    if (!party || party->currentMemberId != 5 || !(party->flags & 0x100)) {
        if (camGetPtr(CAMERA_3D)->unk4) {
            return FALSE;
        }

        if (mario->dispFlags & 0x100000) {
            return TRUE;
        }
    } else {
        camGetPtr(CAMERA_3D);
        if (camGetPtr(CAMERA_3D)->unk4 && mario->dispFlags & 0x100000) {
            return TRUE;
        }
    }

    mario->dispFlags |= 0x100000;
    mario->unk5E = 0;

    zoomDistance = (mario->characterId == 2) ? 750.0f : 450.0f;

    xOffset = (f32)(mario->unk168 - 303) / 5.0f;
    yOffset = 0.0f;

    if ((f32)mario->unk16C > 320.0f) {
        yOffset = (320.0f - (f32)mario->unk16C) / 3.5f;
    }

    if (party && party->currentMemberId == PARTY_FLURRIE && party->flags & 0x100) {
        angleAdjust = toMovedir(mario->unk1A8) >= 180.0f ? -70.0f : 70.0f;
        tempX = mario->unk168;
        zoomDistance = 550.0f;
        xOffset = ((f32)(tempX - 303) / 5.0f) + angleAdjust;
    }

    camera = camGetPtr(CAMERA_3D);

    sp8 = (Vec){ 0.0f, 0.0f, 0.0f };
    sp8.x = camera->target.x + xOffset;
    sp8.y = camera->target.y + yOffset;
    sp8.z = camera->target.z;
    cloudPos = sp8;

    cloudGetAt(&cloudPos);
    targetPos = cloudPos;

    PSVECSubtract(&camera->cameraPos, &camera->target, &cameraDir);
    PSVECNormalize(&cameraDir, &cameraDir);
    PSVECScale(&cameraDir, &cameraDir, zoomDistance);
    PSVECAdd(&targetPos, &cameraDir, &targetPos);

    args[0] = (s16)(s32)targetPos.x;
    args[1] = (s16)(s32)targetPos.y;
    args[2] = (s16)(s32)targetPos.z;
    args[3] = (s16)(s32)cloudPos.x;
    args[4] = (s16)(s32)cloudPos.y;
    args[5] = (s16)(s32)cloudPos.z;
    args[6] = 1500;
    args[7] = 3;

    event.args = args;
    evt_cam3d_evt_set(&event, TRUE);
    return TRUE;
}

BOOL marioCamZoomUpLevelMain(void) {

}
