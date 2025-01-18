#include "statuswindow.h"
#include "driver/seqdrv.h"
#include "mario/mario.h"
#include "mario/mario_pouch.h"
#include "mario/mariost.h"
#include "memory.h"
#include <string.h>

#pragma warn_padding off

extern GlobalWork* gp;

//.data
typedef struct alwaysDtEntry {
	s16 xpos; //0x0
	s16 ypos; //0x2
	s16 iconId; //0x4
	//pad 2 bytes, 0x6
	f32 scale; //0x8
} alwaysDtEntry;

alwaysDtEntry alwaysDt[] = {
	{108, 40, 464, 1.0f}, //red hp banner
	{38,  40, 419, 1.0f}, //mario hp icon
	{124, 34, 472, 1.0f}, //division sign
	{288, 40, 465, 1.0f}, //orange fp banner
	{220, 40, 433, 1.0f}, //fp icon
	{305, 34, 472, 1.0f}, //division sign
	{492, 40, 467, 1.0f}, //green item banner
	{400, 40, 435, 1.0f}, //star points
	{490, 40, 436, 1.0f}, //coin icon
	{422, 34, 470, 1.0f}, //"x"
	{512, 34, 470, 1.0f}, //"x"
	{360, 76, 466, 1.0f}, //blue sp banner
	{220, 80, 434, 0.9f} //star
};

//.sbss
static StatusWindowWork* wp;

//local prototypes
void gaugeDisp(s32 a1, f32 x, f32 y);

void statusWinInit(void) {
	wp = __memAlloc(HEAP_DEFAULT, sizeof(StatusWindowWork));
	memset(wp, 0, sizeof(StatusWindowWork));
	wp->field_0x1C = 1.0f;
	wp->field_0x30 = -304.0f;
	wp->field_0x34 = 208.0f;
	wp->field_0x40 = -304.0f;
	wp->field_0x44 = 334.0f;
	wp->field_0x74 = 0;
	wp->field_0x78 = 0;
	wp->field_0x4 &= ~0xA;
	wp->field_0x4 |= 5;
}

//TODO: #defines?
void statusWinReInit(void) {
	wp->field_0x74 = 0;
	wp->field_0x78 = 0;
	if (wp->field_0x4 & 0x10) {
		wp->field_0x4 &= ~0x10;
		wp->field_0x4 &= ~0xA;
		wp->field_0x4 |= 5;
	}
	else if (wp->field_0x4 & 1) {
		wp->field_0x4 &= ~0xA;
		wp->field_0x4 |= 5;
	}
	else if (wp->field_0x4 & 0x20) {
		wp->field_0x4 &= ~0x20;
		wp->field_0x4 |= 0xA;
		wp->field_0x4 &= ~5;
	}
	else if (wp->field_0x4 & 2) {
		wp->field_0x4 |= 0xA;
		wp->field_0x4 &= ~5;
	}
}

void statusWinMain(void) {
	MarioWork* mario;
	s32 frames;

	mario = marioGetPtr();
	if (mario->characterId != 0) {
		wp->field_0x4 = 2;
		wp->field_0xC = 1.0f;
		wp->field_0x8 = 1.0f;
		wp->field_0x18 = 0.0f;
		wp->field_0x10 = 0.0f;
	}
	else if (strcmp(gp->currentAreaName, "yuu")) {
		switch (seqGetSeq()) {
			case 2:
				if (marioChkCtrl() && marioChkKey() && mario->flags & 1) {
					if (VECDistance(&wp->field_0x68, &mario->position) >= 1.0f) {
						wp->field_0x74 = 0;
						wp->field_0x7C = 0;
						if (!wp->field_0x78) {
							if ((wp->field_0x4 & 0x11) != 0) {
								wp->field_0x4 |= 0xA;
								wp->field_0x4 &= ~5;
							}
						}
					}
					else {
						wp->field_0x74++;
						frames = 10 * gp->framerate;
						if (wp->field_0x74 > frames) {
							wp->field_0x74 = frames;
							if (!wp->field_0x7C && !wp->field_0x78) {
								if ((wp->field_0x4 & 0x11) != 0) {
									wp->field_0x4 &= !0xA;
									wp->field_0x4 |= 5;
									wp->field_0x4 |= 0x100;
								}
							}
						}
					}
				}
		}
	}
	//TODO: finish when more is implemented
}

void gaugeDisp(s32 a1, f32 x, f32 y) {

}

void statusWinDisp(CameraId cameraId, void* param) {
	alwaysDtEntry* dtEntry;
	s32 v6;
	int i;
	Mtx iconPos, iconScale;

	v6 = 1;
	if (wp->field_0x88 > 0) {
		wp->field_0x88--;
		v6 = (wp->field_0x88 % 16) > 0;
	}

	dtEntry = alwaysDt;
	for (i = 0; i < 13; i++, dtEntry++) {
		if (dtEntry->iconId == 466 && !pouchGetPtr()->mStarPowersObtained) {
			break; //don't draw star power bar
		}
		if (!v6) {
			if (wp->field_0x80 & 1 && i == 1) {
				continue;
			}
			if (wp->field_0x80 & 2 && i == 4 ||
				wp->field_0x80 & 0x10 && i == 8 ||
				wp->field_0x80 & 4 && i == 12) {
				continue;
			}
		}
		MTXTrans(iconPos, wp->field_0x20 + (f32)dtEntry->xpos, wp->field_0x24 - (f32)dtEntry->ypos, 0.0f);
		MTXScale(iconScale, dtEntry->scale, dtEntry->scale, dtEntry->scale);
		MTXConcat(iconPos, iconScale, iconPos);
	}
}
