#include "mario/mariost.h"

#include "battle/battle.h"

#include "driver/animdrv.h"
#include "driver/arcdrv.h"
#include "driver/bgdrv.h"
#include "driver/camdrv.h"
#include "driver/casedrv.h"
#include "driver/dispdrv.h"
#include "driver/effdrv.h"
#include "driver/envdrv.h"
#include "driver/extdrv.h"
#include "driver/fadedrv.h"
#include "driver/hitdrv.h"
#include "driver/icondrv.h"
#include "driver/imgdrv.h"
#include "driver/itemdrv.h"
#include "driver/lightdrv.h"
#include "driver/mapdrv.h"
#include "driver/mobjdrv.h"
#include "driver/msgdrv.h"
#include "driver/npcdrv.h"
#include "driver/offscreendrv.h"
#include "driver/seqdrv.h"
#include "driver/shadowdrv.h"
#include "driver/swdrv.h"
#include "driver/windowdrv.h"

#include "evt/evt_badgeshop.h"
#include "evt/evt_johoya.h"
#include "evt/evt_yuugijou.h"

#include "mario/mario.h"

#include "mgr/arammgr.h"
#include "mgr/cardmgr.h"
#include "mgr/dvdmgr.h"
#include "mgr/evtmgr.h"
#include "mgr/filemgr.h"
#include "mgr/fontmgr.h"
#include "mgr/winmgr.h"

#include "sdk/DEMOInit.h"

#include "win/win_main.h"

#include "countdown.h"
#include "error_handler.h"
#include "memory.h"
#include "nameent.h"
#include "pmario_sound.h"
#include "romfont.h"
#include "sound.h"
#include "statuswindow.h"
#include "system.h"

#include <dolphin/vi.h>
#include <string.h>

extern void DEMOPadInit(void);
extern BOOL g_bFirstSmartAlloc;

//.bss
GlobalWork marioSt;
OSThread DvdCheckThread;
static u8 stack[0x1000];

//.sdata
static OSTime off_time[4] = {0, 0, 0, 0};
static BOOL off_trg[4] = {FALSE, FALSE, FALSE, FALSE};
GlobalWork* gp = &marioSt;

//.sbss
static OSTime none_key;
s32 _mariostSystemLevel;
BOOL DvdCheckThreadOn; //DvdCheckTreadOn

//.data
GXRenderModeObj GXNtsc480ProgMarioSt = {
	VI_TVMODE_NTSC_PROG, //viTVmode
	0x260, //fbWidth
	0x1E0, //efbHeight
	0x1E0, //xfbHeight
	0x1E, //viXOrigin
	0x0, //viYOrigin
	0x294, //viWidth
	0x1E0, //viHeight
	VI_XFBMODE_SF, //xFBmode
	0, //field_rendering
	0, //aa
	6, 6, 6, 6, 6, 6, //pix 0
	6, 6, 6, 6, 6, 6, //pix 1
	6, 6, 6, 6, 6, 6, //pix 2
	6, 6, 6, 6, 6, 6, //pix 3
	8, 8, 10, 12, 10, 8, 8, //vfilter
};

GXRenderModeObj GXNtsc480IntDfMarioSt = {
	VI_TVMODE_NTSC_INT, //viTVmode
	0x260, //fbWidth
	0x1E0, //efbHeight
	0x1E0, //xfbHeight
	0x1E, //viXOrigin
	0x0, //viYOrigin
	0x294, //viWidth
	0x1E0, //viHeight
	VI_XFBMODE_DF, //xFBmode
	0, //field_rendering
	0, //aa
	6, 6, 6, 6, 6, 6, //pix 0
	6, 6, 6, 6, 6, 6, //pix 1
	6, 6, 6, 6, 6, 6, //pix 2
	6, 6, 6, 6, 6, 6, //pix 3
	8, 8, 10, 12, 10, 8, 8, //vfilter
};

GXRenderModeObj sRMObjHReso_prog = {
	VI_TVMODE_NTSC_PROG, //viTVmode
	0x260, //fbWidth
	0x1C0, //efbHeight
	0x1C0, //xfbHeight
	0x1B, //viXOrigin
	0x10, //viYOrigin
	0x29A, //viWidth
	0x1C0, //viHeight
	VI_XFBMODE_SF, //xFBmode
	0, //field_rendering
	0, //aa
	6, 6, 6, 6, 6, 6, //pix 0
	6, 6, 6, 6, 6, 6, //pix 1
	6, 6, 6, 6, 6, 6, //pix 2
	6, 6, 6, 6, 6, 6, //pix 3
	8, 8, 10, 12, 10, 8, 8, //vfilter
};

GXRenderModeObj sRMObjHReso = {
	VI_TVMODE_NTSC_INT, //viTVmode
	0x260, //fbWidth
	0x1C0, //efbHeight
	0x1C0, //xfbHeight
	0x1B, //viXOrigin
	0x10, //viYOrigin
	0x29A, //viWidth
	0x1C0, //viHeight
	VI_XFBMODE_DF, //xFBmode
	0, //field_rendering
	0, //aa
	6, 6, 6, 6, 6, 6, //pix 0
	6, 6, 6, 6, 6, 6, //pix 1
	6, 6, 6, 6, 6, 6, //pix 2
	6, 6, 6, 6, 6, 6, //pix 3
	8, 8, 10, 12, 10, 8, 8, //vfilter
};

//local prototypes
void viPostCallback(u32 retraceCount);
void* gcDvdCheckThread(void* param);
void gcRumbleCheck(void);
void gcResetCheck(void);

void marioStInit(void) {
	if (!OSIsRestart() || (OSGetResetCode() & OS_RESET_SHUTDOWN)) {
		DEMOInit(&GXNtsc480IntDfMarioSt);
	}
	else {
		switch (OSGetResetCode() & OS_RESET_HOTRESET) {
			case 0:
				DEMOInit(&GXNtsc480IntDfMarioSt);
				break;
			case 1:
				DEMOInit(&GXNtsc480ProgMarioSt);
				break;
		}
	}
	DEMOEnableGPHangWorkaround(5);
	setupErrorHandler();
	DEMOPadInit();
	GXSetCopyClear((GXColor){0, 0, 0, 0}, 0xFFFFFF);
	__GXSetIndirectMask(0);
	memset(gp, 0, sizeof(GlobalWork));
	gp->fbWidth = DEMOGetRenderModeObj()->fbWidth;
	gp->efbHeight = DEMOGetRenderModeObj()->efbHeight;
	gp->unk1294 = 1;
	gp->unk1274 = 0;

	gp->retraceLocalTime = 0;
	gp->retraceDeltaTime = 0;
	gp->retraceTime = OSGetTime();

	gp->renderFieldTime = 0;
	gp->renderTime = 0;

	gp->systemLv3Time = 0;
	gp->systemLv2Time = 0;
	gp->systemLv1Time = 0;
	gp->systemLv0Time = 0;

	gp->mapFadeOutType = FADE_IN_BLACK;
	gp->mapFadeOutDuration = 300;
	gp->mapFadeInType = FADE_OUT_BLACK;
	gp->mapFadeInDuration = 300;
	gp->areaFadeOutType = FADE_IN_BLACK;
	gp->areaFadeOutDuration = 300;
	gp->areaFadeInType = FADE_OUT_BLACK;
	gp->areaFadeInDuration = 300;
	if ((OSGetFontEncode() == OS_FONT_ENCODE_SJIS) && !(gp->flags & 0x1000))
		gp->language = 0;
	else
		gp->language = 1;
	gp->framerate = 60;
	gp->systemLevelFlags = 0;
	badgeShop_init(); //Badge Shop
	yuugijou_init(); //Pianta Parlor
	johoya_init(); //?????
	gp->mapAlloc = __memAlloc(HEAP_DEFAULT, 660 * 1024);
	VISetPostRetraceCallback(viPostCallback);
	romFontInit();
	OSCreateThread(&DvdCheckThread, gcDvdCheckThread, NULL, (void*)((u32)&stack + sizeof(stack)), sizeof(stack), 16, OS_THREAD_ATTR_DETACH);
	DvdCheckThreadOn = TRUE;
	OSResumeThread(&DvdCheckThread);
	DVDMgrInit();
	psndInit();
	aramMgrInit();
	fileInit();
	smartInit();
	dispInit();
	camInit();
	fontmgrInit();
	windowInit();
	mapInit();
	hitInit();
	itemInit();
	iconInit();
	fadeInit();
	bgInit();
	shadowInit();
	evtmgrInit();
	animInit();
	msgInit();
	npcInit();
	mobjInit();
	effInit();
	marioInit();
	caseInit();
	imgInit();
	lightInit();
	offscreenInit();
	arcInit();
	extInit();
	swInit();
	cardInit();
	winInit();
	statusWinInit();
	envInit();
	countDownInit();
	nameEntInit();
	winMgrInit();
	seqInit_MARIOSTORY();
	seqSetSeq(0, NULL, NULL);
	gp->unk1274 = 0;
	if (OSGetSoundMode() == OS_SOUND_MODE_MONO) {
		SoundSetOutputMode(SND_OUTPUTMODE_MONO);
	}
	else {
		SoundSetOutputMode(SND_OUTPUTMODE_STEREO);
	}
}

void marioStMain(void) {
	int i;

	while (gp->dvdError) {
		OSYieldThread();
	}
	makeKey();
	seqMain();
	cardMain();
	bgMain();
	shadowMain();
	animMain();
	battleMain();
	camMain();
	windowMain();
	mapMain();
	hitMain();
	evtmgrMain();
	mapDisp();
	marioMain();
	mobjMain();
	npcMain();
	fadeMain();
	imgMain();
	lightMain();
	offscreenMain();
	itemMain();
	caseMain();
	iconMain();
	extMain();
	psndMain();
	winMain();
	statusWinMain();
	envMain();
	countDownMain();
	nameEntMain();
	winMgrMain();
	effMain();
	gcResetCheck();
	if (gp->flags & 0x1000) {
		for (i = 0; i < 4; i++) {
			if (gp->dirs[i]) break;
			if (gp->button[i]) break;
			if (gp->stickX[i]) break;
			if (gp->stickY[i]) break;
			if (gp->substickX[i]) break;
			if (gp->substickY[i]) break;
			if (gp->triggerLeft[i]) break;
			if (gp->triggerRight[i]) break;
		}
		if (i >= 4) {
			if (OSTicksToSeconds(OSGetTime() - none_key) > 120 && (seqGetSeq() == 2 || seqGetSeq() == 4)) {
				gp->flags |= 0x2000;
			}
		}
		else {
			none_key = OSGetTime();
		}
	}
}

void marioStDisp(void) {
	camDraw();
	g_bFirstSmartAlloc = FALSE;
}

void marioStSystemLevel(s32 level) {
	switch (level) {
		case 0:
			_mariostSystemLevel = level;
			gp->systemLevelFlags &= ~0xF;
			evtStartAll(0xEF);
			break;
		case 1:
			_mariostSystemLevel = level;
			gp->systemLevelFlags &= ~0xE;
			gp->systemLevelFlags |= 1;
			evtStopAll(1);
			break;
		case 2:
			_mariostSystemLevel = level;
			gp->systemLevelFlags &= ~0xC;
			gp->systemLevelFlags |= 3;
			evtStopAll(2);
			break;
		case 3:
			_mariostSystemLevel = level;
			gp->systemLevelFlags &= ~8;
			gp->systemLevelFlags |= 7;
			evtStopAll(0x10);
			break;
		case 4:
			_mariostSystemLevel = level;
			gp->systemLevelFlags |= 0xF;
			evtStopAll(0xEF);
			break;
	}
}

s32 marioStGetSystemLevel(void) {
	return gp->systemLevelFlags;
}

void viPostCallback(u32 retraceCount) {
	OSTime time, check;
	u32 reset = PAD_BUTTON_B | PAD_BUTTON_X | PAD_BUTTON_START; //TODO: make sure it inlines right

	time = OSGetTime();
	gp->retraceDeltaTime = time - gp->retraceTime;
	gp->retraceLocalTime += gp->retraceDeltaTime;
	check = OSSecondsToTicks(359999999);
	if (check < gp->retraceLocalTime) {
		gp->retraceLocalTime = check;
	}
	if (!(gp->systemLevelFlags & 8)) {
		gp->systemLv3Time += gp->retraceDeltaTime;
	}
	if (!(gp->systemLevelFlags & 4)) {
		gp->systemLv2Time += gp->retraceDeltaTime;
	}
	if (!(gp->systemLevelFlags & 2)) {
		gp->systemLv1Time += gp->retraceDeltaTime;
	}
	if (!(gp->systemLevelFlags & 1)) {
		gp->systemLv0Time += gp->retraceDeltaTime;
	}
	if (!gp->dvdError && !winCheck()) {
		gp->renderTime += gp->retraceDeltaTime;
		if (!gp->inBattle) {
			gp->renderFieldTime += gp->retraceDeltaTime;
		}
	}
	gp->retraceTime = time;
	gp->retraceCount = retraceCount;
	if (battleDisableHResetCheck()) {
		gp->unk127C = FALSE;
	}
	else {
		if (gp->unk127C) {
			if (!OSGetResetButtonState()) {
				gp->resetType = 1;
			}
		}
		else {
			if (OSGetResetButtonState()) {
				gp->unk127C = TRUE;
			}
		}
		if (gp->unk1324) {
			if (OSIsRestart() && !gp->field_0x1290) {
				if ((keyGetButton(0) & reset) == reset) {
					gp->resetType = 0;
					goto exitcheck;
				}
				else {
					gp->field_0x1290 = TRUE;
				}
			}
			if ((keyGetButton(0) & reset) == reset) {
				if (!gp->softResetWait) {
					gp->softResetWait = TRUE;
					gp->softResetTimeout = OSGetTime();
				}
				if (OSTicksToMilliseconds(OSGetTime() - gp->softResetTimeout) > 500) {
					gp->resetType = 1;
				}
			}
			else {
				gp->softResetWait = FALSE;
			}
			if (DVDGetDriveStatus() == -1) {
				gp->resetType = 0;
			}
		}
	}
exitcheck:
	gcRumbleCheck();
	psndMainInt();
}

//TODO: fuck up float conversions for 1:1 cuz this is cleaner
void* gcDvdCheckThread(void* param) {
	const char* message;
	s32 msgId;
	f32 width;
	Mtx44 mtx;

	while (1) {
		msgId = 0;
		switch (DVDGetDriveStatus()) {
			case DVD_STATE_COVER_OPEN:
				msgId = 5;
				gp->dvdError = TRUE;
				break;
			case DVD_STATE_NO_DISK:
				msgId = 6;
				gp->dvdError = TRUE;
				break;
			case DVD_STATE_WRONG_DISK:
				msgId = 6;
				gp->dvdError = TRUE;
				break;
			case DVD_STATE_RETRY:
				msgId = 7;
				gp->dvdError = TRUE;
				break;
			case DVD_RESULT_FATAL_ERROR:
				msgId = 8;
				gp->dvdError = TRUE;
				break;
			default:
				gp->dvdError = FALSE;
				break;
			case DVD_STATE_WAITING:
				break;
		}
		if (gp->dvdError) {
			SoundOpenCover();
		}
		else {
			SoundCloseCover();
		}
		if (gp->dvdError) {
			if (cardIsExec()) {
				gp->dvdError = FALSE;
			}
		}
		if (gp->dvdError) {
			DEMOBeforeRender();
			if (msgId) {
				message = romFontGetMessage(msgId);
				width = (f32)romFontGetWidth(message);
				MTXPerspective(mtx, 25.0f, 1.2666667f, 1.0f, 10000.0f);
				GXSetProjection(mtx, GX_PERSPECTIVE);
				romFontPrintGX(-width * 0.5f, 60.0f, 1.0f, (GXColor){0xFF, 0xFF, 0xFF, 0xFF}, message);
			}
			DEMODoneRender();
			makeKey();
			gcResetCheck();
		}
		OSYieldThread();
	}
}

void gcRumbleCheck(void) {
	/*OSTime start;
	volatile BOOL array[4] = { 0 };
	int i;

	start = OSGetTime();
	for (i = 0; i < 4; i++) {
		if (gp->field_0x12E8[i]) {
			if (OSTicksToMilliseconds(start - gp->field_0x12F0[i]) > 30000) {
				gp->field_0x12EC[i] = 0;
				gp->field_0x12E8[i] = 0;
			}
			array[i] = TRUE;
		}
	}*/
}

void gcResetCheck(void) {
	u32 code;

	if (gp->resetType) {
		VISetBlack(TRUE);
		VIFlush();
		VIWaitForRetrace();
		VIWaitForRetrace();
		VIWaitForRetrace();
		psndExit();
		DVDMgrDelete();
		if ((OSGetCurrentThread() != &DvdCheckThread) && DvdCheckThreadOn) {
			OSCancelThread(&DvdCheckThread);
			DvdCheckThreadOn = FALSE;
		}
		while (cardIsExec()) {
			cardMain();
			VIWaitForRetrace();
		}
		if (gp->resetType != 2) {
			if (!(gp->flags & 4)) {
				code = OS_RESET_SHUTDOWN;
			}
			else {
				if (!(gp->flags & 8)) {
					code = OS_RESET_RESTART;
				}
				else {
					code = OS_RESET_HOTRESET;
				}
			}
			OSResetSystem(OS_RESET_RESTART, code, FALSE);
		}
		else {
			OSResetSystem(OS_RESET_HOTRESET, 0, TRUE);
		}
		while (1) {}
	}
}
