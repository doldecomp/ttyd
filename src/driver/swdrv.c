/* "swdrv" - Saved Work Driver (for evt)
 * Status: Complete, 1:1, aside from unused (_)swToggle which is...unused
 * 
 * Function: Helper driver for accessing the "saved work" data for evt
 * scripts
 */
#include "driver/swdrv.h"
#include "mario/mariost.h"
#include <string.h>

extern GlobalWork* gp;

//Local Saved Work ---------------------------------------------
s32 _swByteGet(s32 index) {
	return gp->mLSW[index];
}

void _swByteSet(s32 index, u8 value) {
	gp->mLSW[index] = value;
}

//Local Saved Work Flags ---------------------------------------
void _swClear(s32 index) { //clear specific bit
	gp->mLSWF[index / 32] &= ~(1 << (index % 32));
}

BOOL _swGet(s32 index) { //get specific bit
	return (gp->mLSWF[index / 32] & (1 << (index % 32))) != 0;
}

void _swSet(s32 index) { //set specific bit
	gp->mLSWF[index / 32] |= (1 << (index % 32));
}

//Global Saved Work --------------------------------------------
s32 swByteGet(s32 index) {
	if (index == 0) {
		return gp->mGSW0;
	}
	else {
		return gp->mGSW[index];
	}
}

void swByteSet(s32 index, s32 value) {
	if (index == 0) {
		gp->mGSW0 = value;
	}
	else {
		gp->mGSW[index] = (u8)value;
	}
}

//Global Saved Work Flags --------------------------------------
void swClear(s32 index) { //clear specific bit
	gp->mGSFW[index / 32] &= ~(1 << (index % 32));
}

BOOL swGet(s32 index) { //get specific bit
	return (gp->mGSFW[index / 32] & (1 << (index % 32))) != 0;
}

void swSet(s32 index) { //set specific bit
	gp->mGSFW[index / 32] |= (1 << (index % 32));
}

void swReInit(void) {
	memset(gp->mLSWF, 0, sizeof(gp->mLSWF));
	memset(gp->mLSW, 0, sizeof(gp->mLSW));
}

void swInit(void) {
	memset(gp->mGSFW, 0, sizeof(gp->mGSFW));
	memset(gp->mGSW, 0, sizeof(gp->mGSW));
	memset(gp->mLSWF, 0, sizeof(gp->mLSWF));
	memset(gp->mLSW, 0, sizeof(gp->mLSW));
	gp->mGSW0 = 0;
}
