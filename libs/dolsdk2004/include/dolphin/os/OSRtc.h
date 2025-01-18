#ifndef _DOLPHIN_OSRTC_H_
#define _DOLPHIN_OSRTC_H_

#ifdef __cplusplus
extern "C" {
#endif

// make the assert happy
#define OS_SOUND_MODE_MONO 0
#define OS_SOUND_MODE_STEREO 1

// make the asserts happy
#define OS_VIDEO_MODE_NTSC 0
#define OS_VIDEO_MODE_MPAL 2

#define OS_PROGRESSIVE_MODE_OFF 0
#define OS_PROGRESSIVE_MODE_ON  1

#define OS_EURGB60_OFF 0
#define OS_EURGB60_ON  1

struct SramControl {
    u8 sram[64];
    u32 offset;
    int enabled;
    int locked;
    int sync;
    void (* callback)();
};

typedef struct OSSram {
    u16 checkSum;
    u16 checkSumInv;
    u32 ead0;
    u32 ead1;
    u32 counterBias;
    s8 displayOffsetH;
    u8 ntd;
    u8 language;
    u8 flags;
} OSSram;

typedef struct OSSramEx {
    u8 flashID[2][12];
    u32 wirelessKeyboardID;
    u16 wirelessPadID[4];
    u8 dvdErrorCode;
    u8 _padding0;
    u8 flashIDCheckSum[2];
    u16 gbs;
    u8 _padding1[2];
} OSSramEx;

u32 OSGetSoundMode();
void OSSetSoundMode(u32 mode);
u32 OSGetVideoMode();
void OSSetVideoMode(u32 mode);
u8 OSGetLanguage();
void OSSetLanguage(u8 language);
u16 OSGetGbsMode();
void OSSetGbsMode(u16 mode);
u32 OSGetProgressiveMode();
void OSSetProgressiveMode(u32 on);
u32 OSGetEuRgb60Mode();
void OSSetEuRgb60Mode(u32 on);
u16 OSGetWirelessID(s32 chan);
void OSSetWirelessID(s32 chan, u16 id);

#ifdef __cplusplus
}
#endif

#endif // _DOLPHIN_OSRTC_H_
