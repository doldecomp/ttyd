#include "mario/mario_sbr.h"
#include "mario/mario.h"

// new in retail
void marioSetBottomlessResetPosition(f32 x, f32 y, f32 z) {
    MarioWork* wp = marioGetPtr();
    Vec position;

    position = (Vec){ x, y + 37.0f, z };
    wp->bottomlessResetPosition = position;
}

f32 revise360(f32 angle) {
    while (angle < 0.0f) {
        angle += 360.0f;
    }
    while (angle >= 360.0f) {
        angle -= 360.0f;
    }
    return angle;
}
