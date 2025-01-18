#include <dolphin.h>
#include <dolphin/os.h>

void OSInitSemaphore(OSSemaphore* sem, s32 count) {
    int enabled = OSDisableInterrupts();

    OSInitThreadQueue(&sem->queue);
    sem->count = count;
    OSRestoreInterrupts(enabled);
}

s32 OSWaitSemaphore(OSSemaphore* sem) {
    int enabled;
    s32 count;

    enabled = OSDisableInterrupts();

    while ((count = sem->count) <= 0) {
        OSSleepThread(&sem->queue);
    }

    sem->count--;
    OSRestoreInterrupts(enabled);
    return count;
}

s32 OSTryWaitSemaphore(OSSemaphore* sem) {
    int enabled;
    s32 count;

    enabled = OSDisableInterrupts();
    count = sem->count;
    if (sem->count > 0) {
        sem->count--;
    }

    OSRestoreInterrupts(enabled);
    return count;
}

s32 OSSignalSemaphore(OSSemaphore* sem) {
    int enabled;
    s32 count;

    enabled = OSDisableInterrupts();
    count = sem->count;
    sem->count++;

    OSWakeupThread(&sem->queue);
    OSRestoreInterrupts(enabled);
    return count;
}

s32 OSGetSemaphoreCount(OSSemaphore* sem) {
    return sem->count;
}
