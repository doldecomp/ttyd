#include "global.h"

void swInit(void) {
    memset(gp->mGSFW, 0, sizeof(gp->mGSFW));
    memset(gp->mGSW, 0, sizeof(gp->mGSW));
    memset(gp->mLSWF, 0, sizeof(gp->mLSWF));
    memset(gp->mLSW, 0, sizeof(gp->mLSW));
    gp->mGSW0 = 0;
}

void swReInit(void) {
    memset(gp->mLSWF, 0, sizeof(gp->mLSWF));
    memset(gp->mLSW, 0, sizeof(gp->mLSW));
}

void swSet(s32 index) { //set specific bit
    gp->mGSFW[index / 32] |= (1 << (index % 32));
}

BOOL swGet(s32 index) { //get specific bit
    return (gp->mGSFW[index / 32] & (1 << (index % 32))) != 0;
}

//Global Saved Work Flags --------------------------------------
void swClear(s32 index) { //clear specific bit
    gp->mGSFW[index / 32] &= ~(1 << (index % 32));
}

void swByteSet(s32 index, u32 value) {
    if (index == 0) {
        gp->mGSW0 = value;
    }
    else {
        gp->mGSW[index] = (u8)value;
    }
}

//Global Saved Work --------------------------------------------
u32 swByteGet(s32 index) {
    if (index == 0) {
        return gp->mGSW0;
    }
    else {
        return gp->mGSW[index];
    }
}

void _swSet(s32 index) { //set specific bit
    gp->mLSWF[index / 32] |= (1 << (index % 32));
}

BOOL _swGet(s32 index) { //get specific bit
    return (gp->mLSWF[index / 32] & (1 << (index % 32))) != 0;
}

//Local Saved Work Flags ---------------------------------------
void _swClear(s32 index) { //clear specific bit
    gp->mLSWF[index / 32] &= ~(1 << (index % 32));
}

void _swByteSet(u32 idx, u8 value) {
    gp->mLSW[idx] = value;
}

u8 _swByteGet(u32 idx) {
    return gp->mLSW[idx];
}
