#include "evt/evt_lottery.h"
#include "evt/evt_cmd.h"
#include <dolphin/os.h>

extern GlobalWork* gp;

//.sbss
BOOL dbg_lotteryinfo;

//local prototypes
USERFUNC_DEF(evt_lottery);

lottery_info* lotteryGetPtr(void) {
	return &gp->mLotteryInfo;
}

USERFUNC_DEF(evt_lottery) {
	lottery_info* LotteryInfo;

	s32* args = event->args;
	s32 arg1 = evtGetValue(event, args[0]); //r25
	OSTime start = OSGetTime();
	dbg_lotteryinfo = TRUE;

	LotteryInfo = &gp->mLotteryInfo;

	LotteryInfo->mFlags &= ~0x1000;
	LotteryInfo->mFlags &= ~0x2000;
	LotteryInfo->mFlags &= ~0x4000;
	LotteryInfo->mFlags &= ~0x8000;

	if (LotteryInfo->mFlags & 8) {

	}
















	return EVT_RETURN_DONE;
}
