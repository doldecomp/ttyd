#ifndef _DEMOPAD_H_
#define _DEMOPAD_H_

#include <dolphin/pad.h>

#define DEMO_SUBSTICK_UP 0x0100
#define DEMO_SUBSTICK_DOWN 0x0200
#define DEMO_SUBSTICK_LEFT 0x0400
#define DEMO_SUBSTICK_RIGHT 0x0800
#define DEMO_STICK_UP 0x1000
#define DEMO_STICK_DOWN 0x2000
#define DEMO_STICK_LEFT 0x4000
#define DEMO_STICK_RIGHT 0x8000

typedef struct {
    /* 0x00 */ PADStatus pst;
    /* 0x0C */ u16 buttonDown;
    /* 0x0E */ u16 buttonUp;
    /* 0x10 */ u16 dirs;
    /* 0x12 */ u16 dirsNew;
    /* 0x14 */ u16 dirsReleased;
    /* 0x16 */ s16 stickDeltaX;
    /* 0x18 */ s16 stickDeltaY;
    /* 0x1A */ s16 substickDeltaX;
    /* 0x1C */ s16 substickDeltaY;
} DEMOPadStatus;

extern DEMOPadStatus DemoPad[PAD_MAX_CONTROLLERS];

extern u32 DemoNumValidPads;

void DEMOPadRead();
void DEMOPadInit();

#endif // _DEMOPAD_H_
