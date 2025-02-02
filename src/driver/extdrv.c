#include "driver/extdrv.h"
#include "driver/dispdrv.h"
#include "mario/mariost.h"

extern GlobalWork* gp;

static ExtWork work[2];

#define extGetWork() (gp->inBattle ? &work[1] : &work[0])

void extInit(void) {
	ExtWork* wp = extGetWork();
	wp->poseNum = 0;
	wp->field_0x8 = 0;
}

void extMain(void) {

}





void extMakeTexture(CameraId camId, void* param) {

}
