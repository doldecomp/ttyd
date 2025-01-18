#pragma once

#include <dolphin/mtx.h>

const char* getMarioStDvdRoot(void);
f32 reviseAngle(f32 angle);
f32 distABf(f32 x1, f32 y1, f32 x2, f32 y2);
f32 compAngle(f32 angle1, f32 angle2);
f32 angleABf(f32 x1, f32 y1, f32 x2, f32 y2);
f32 intplGetValue(s32 mode, s32 currStep, s32 steps, f32 start, f32 end);
void qqsort(void* array, s32 num_elements, s32 element_size, s32(*compare)(const void**, const void**));
void makeKey(void);
u32 keyGetButton(u32 chan);
u32 keyGetButtonTrg(u32 chan);
u32 keyGetButtonRep(u32 chan);
u32 keyGetDir(u32 chan);
u32 keyGetDirTrg(u32 chan);
u32 keyGetDirRep(u32 chan);
s8 keyGetStickX(u32 chan);
s8 keyGetStickY(u32 chan);
s8 keyGetSubStickX(u32 chan);
s8 keyGetSubStickY(u32 chan);
void padRumbleOff(u32 chan);
void padRumbleOn(u32 chan);
void padRumbleHardOff(u32 chan);
u8 padGetRumbleStatus(u32 chan);
void sincosf(f32* ret_sin, f32* ret_cos, f32 degree);
void movePos(float* ret_sin, float* ret_cos, f32 a3, f32 degree);
s32 irand(s32 scalar);
u16 sysGetToken(void);
void sysWaitDrawSync(void);
void sysDummyDraw(Mtx mtx);
f32 getV60FPS(f32 a1, s64 a2, s64 a3);
f32 sysFrame2SecFloat(f32 frame);
s32 sysMsec2Frame(s32 msec);
f32 sysMsec2FrameFloat(f32 msec);
void mtxGetRotationElement(Mtx arg0, Mtx arg1, char arg2, char arg3);
s32 LZ77Decode(u8* input, u8* output);
void* memcpy_as4(void* dest, const void* src, u32 count);

inline Vec initializeVec(Vec* input);
