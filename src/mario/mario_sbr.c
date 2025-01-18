#include "mario/mario_sbr.h"
#include "mario/mario.h"

//new in retail
void marioSetBottomlessResetPosition(f32 x, f32 y, f32 z) {
	MarioWork* wp = marioGetPtr();
	Vec position;

	position = (Vec){x, y + 37.0f, z};
	wp->bottomlessResetPosition = position;
}