#include "dolphin/types.h"
#include "mario/mario.h"

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
