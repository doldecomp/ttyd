#ifndef _DOLPHIN_OSSEMAPHORE_H_
#define _DOLPHIN_OSSEMAPHORE_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef struct OSSemaphore {
    s32 count; // offset 0x0, size 0x4
    OSThreadQueue queue; // offset 0x4, size 0x8
} OSSemaphore;

void OSInitSemaphore(OSSemaphore* sem, s32 count);
s32 OSWaitSemaphore(OSSemaphore* sem);
s32 OSTryWaitSemaphore(OSSemaphore* sem);
s32 OSSignalSemaphore(OSSemaphore* sem);
s32 OSGetSemaphoreCount(OSSemaphore* sem);

#ifdef __cplusplus
}
#endif

#endif // _DOLPHIN_OSSEMAPHORE_H_
