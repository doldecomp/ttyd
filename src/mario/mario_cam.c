#include "mario/mario_cam.h"
#include "mario/mario.h"

s32 marioGetCamId(void) {
	return marioGetPtr()->camId;
}