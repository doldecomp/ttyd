#ifndef SND_H
#define SND_H

#include "musyx/musyx.h"
#include "musyx/voice.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef s32 (*SND_COMPARE)(void*, void*);

u16 sndRand(void);
s16 sndSin(u16 angle);
void* sndBSearch(void* key, void* base, s32 num, s32 len, SND_COMPARE cmp);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
float sndSqrt(float x);
float sndCos(float x);
#endif
void sndConvertMs(u32* time);
void sndConvertTicks(u32* out, SYNTH_VOICE* svoice);
u32 sndConvert2Ms(u32 time);
u32 sndGetPitch(u8 key, u32 sInfo);
s32 sndPitchUpOne(u16 note);

#ifdef __cplusplus
}
#endif

#endif
