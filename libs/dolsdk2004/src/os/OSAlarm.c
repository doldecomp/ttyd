#include <dolphin.h>
#include <dolphin/os.h>

// internal header
#include "__os.h"
#include "__dvd.h"

struct OSAlarmQueue {
    struct OSAlarm * head;
    struct OSAlarm * tail;
};

// functions
static void SetTimer(struct OSAlarm * alarm);
static void InsertAlarm(OSAlarm* alarm, OSTime fire, OSAlarmHandler handler);
static void DecrementerExceptionCallback(register __OSException exception, register OSContext* context);
static void DecrementerExceptionHandler(__OSException exception, OSContext* context);
static BOOL OnReset(BOOL final);

static OSResetFunctionInfo ResetFunctionInfo = {OnReset, 0xFFFFFFFF, NULL, NULL};
static struct OSAlarmQueue AlarmQueue;

#define ASSERTREPORT(line, cond) \
    if (!(cond)) { OSReport("OSCheckAlarmQueue: Failed " #cond " in %d", line); return 0; }

BOOL OSCheckAlarmQueue(void) {
    struct OSAlarm * alarm;

    ASSERTREPORT(0x92, AlarmQueue.head == NULL && AlarmQueue.tail == NULL || AlarmQueue.head != NULL && AlarmQueue.tail != NULL);
    ASSERTREPORT(0x93, AlarmQueue.head == NULL || AlarmQueue.head->prev == NULL);
    ASSERTREPORT(0x94, AlarmQueue.tail == NULL || AlarmQueue.tail->next == NULL);

    for(alarm = AlarmQueue.head; alarm; alarm = alarm->next) {
        ASSERTREPORT(0x97, alarm->next == NULL || alarm->next->prev == alarm);
        ASSERTREPORT(0x98, alarm->next != NULL || AlarmQueue.tail == alarm);
    }
    return TRUE;
}

static void SetTimer(struct OSAlarm * alarm) {
    OSTime delta = alarm->fire - OSGetTime();

    if (delta < 0) {
        PPCMtdec(0);
    } else if (delta < 0x80000000) {
        PPCMtdec((u32)delta);
    } else {
        PPCMtdec(0x7fffffff);
    }
}

void OSInitAlarm(void) {
    if (__OSGetExceptionHandler(8) != DecrementerExceptionHandler) {
        AlarmQueue.head = AlarmQueue.tail = NULL;
        __OSSetExceptionHandler(8, DecrementerExceptionHandler);
        OSRegisterResetFunction(&ResetFunctionInfo);
    }
}

void OSCreateAlarm(OSAlarm* alarm) {
    alarm->handler = 0;
    alarm->tag = 0;
}

static void InsertAlarm(OSAlarm* alarm, OSTime fire, OSAlarmHandler handler) {
    OSAlarm* next;
    OSAlarm* prev;
    
    if (0 < alarm->period) {
        OSTime time = OSGetTime();
        
        fire = alarm->start;
        if (alarm->start < time) {
            fire += alarm->period * ((time - alarm->start) / alarm->period + 1);
        }
    }
    
    ASSERTLINE(0xFB, alarm->handler == 0);
    
    alarm->handler = handler;
    alarm->fire = fire;
    
    for (next = AlarmQueue.head; next; next = next->next) {
        if (next->fire <= fire) {
            continue;
        }
        
        alarm->prev = next->prev;
        next->prev = alarm;
        alarm->next = next;
        prev = alarm->prev;

        if (prev) {
            prev->next = alarm;
        } else {
            AlarmQueue.head = alarm;
            SetTimer(alarm);
        }

        return;
    }

    ASSERTLINE(0x118, next == 0);

    alarm->next = 0;
    prev = AlarmQueue.tail;
    AlarmQueue.tail = alarm;
    alarm->prev = prev;

    if (prev) {
        prev->next = alarm;
    } else {
        AlarmQueue.head = AlarmQueue.tail = alarm;
        SetTimer(alarm);
    }
}

void OSSetAlarm(OSAlarm* alarm, OSTime tick, OSAlarmHandler handler) {
    BOOL enabled;
    ASSERTMSGLINE(0x139, tick > 0, "OSSetAlarm(): tick was less than zero.");
    ASSERTMSGLINE(0x13A, handler, "OSSetAlarm(): null handler was specified.");
    enabled = OSDisableInterrupts();
    alarm->period = 0;
    InsertAlarm(alarm, OSGetTime() + tick, handler);
    ASSERTLINE(0x141, OSCheckAlarmQueue());
    OSRestoreInterrupts(enabled);
}

void OSSetAbsAlarm(struct OSAlarm * alarm, long long time, void (* handler)(struct OSAlarm *, struct OSContext *)) {
    int enabled;

    ASSERTMSGLINE(0x157, handler, "OSSetAbsAlarm(): null handler was specified.");
    enabled = OSDisableInterrupts();
    alarm->period = 0;
    InsertAlarm(alarm, __OSTimeToSystemTime(time), handler);
    ASSERTLINE(0x15E, OSCheckAlarmQueue());
    OSRestoreInterrupts(enabled);
}

void OSSetPeriodicAlarm(OSAlarm* alarm, OSTime start, OSTime period, OSAlarmHandler handler) {
    BOOL enabled;
    ASSERTMSGLINE(0x176, period > 0, "OSSetPeriodicAlarm(): period was less than zero.");
    ASSERTMSGLINE(0x177, handler, "OSSetPeriodicAlarm(): null handler was specified.");
    enabled = OSDisableInterrupts();
    alarm->period = period;
    alarm->start = __OSTimeToSystemTime(start);
    InsertAlarm(alarm, 0, handler);
    ASSERTLINE(0x17F, OSCheckAlarmQueue());
    OSRestoreInterrupts(enabled);
}

void OSCancelAlarm(OSAlarm* alarm) {
    OSAlarm* next;
    BOOL enabled;

    enabled = OSDisableInterrupts();

    if (alarm->handler == 0) {
        OSRestoreInterrupts(enabled);
        return;
    }

    next = alarm->next;
    if (next == 0) {
        AlarmQueue.tail = alarm->prev;
    } else {
        next->prev = alarm->prev;
    }
    if (alarm->prev) {
        alarm->prev->next = next;
    } else {
        AlarmQueue.head = next;
        if (next) {
            SetTimer(next);
        }
    }
    alarm->handler = 0;
    ASSERTLINE(0x1B2, OSCheckAlarmQueue());
    OSRestoreInterrupts(enabled);
}

static void DecrementerExceptionCallback(register __OSException exception,
                                         register OSContext* context) {
    OSAlarm* alarm;
    OSAlarm* next;
    OSAlarmHandler handler;
    OSTime time;
    OSContext exceptionContext;

    time = __OSGetSystemTime();
    alarm = AlarmQueue.head;
    if (alarm == 0) {
        OSLoadContext(context);
    }

    if (time < alarm->fire) {
        SetTimer(alarm);
        OSLoadContext(context);
    }

    next = alarm->next;
    AlarmQueue.head = next;
    if (next == 0) {
        AlarmQueue.tail = 0;
    } else {
        next->prev = 0;
    }

    ASSERTLINE(0x1EC, OSCheckAlarmQueue());

    handler = alarm->handler;
    alarm->handler = 0;
    if (0 < alarm->period) {
        InsertAlarm(alarm, 0, handler);
        ASSERTLINE(0x1F6, OSCheckAlarmQueue());
    }

    if (AlarmQueue.head) {
        SetTimer(AlarmQueue.head);
    }

    OSDisableScheduler();
    OSClearContext(&exceptionContext);
    OSSetCurrentContext(&exceptionContext);
    handler(alarm, context);
    OSClearContext(&exceptionContext);
    OSSetCurrentContext(context);
    OSEnableScheduler();
    __OSReschedule();
    OSLoadContext(context);
}

static asm void DecrementerExceptionHandler(register __OSException exception,
                                            register OSContext* context) {
    nofralloc 
    OS_EXCEPTION_SAVE_GPRS(context)
    stwu r1, -8(r1)
    b DecrementerExceptionCallback
}

void OSSetAlarmTag(OSAlarm* alarm, unsigned long tag) {
    alarm->tag = tag;
}

void OSCancelAlarms(unsigned long tag) {
    int enabled;
    OSAlarm* alarm;
    OSAlarm* next;

    ASSERTMSGLINE(0x239, tag != 0, "OSCancelAlarms(): invalid tag. (tag zero is used by the operating system.)");

    if (tag != 0) {
        enabled = OSDisableInterrupts();
        ASSERTLINE(0x23F, OSCheckAlarmQueue());

        alarm = AlarmQueue.head;
        next = (alarm) ? alarm->next : NULL;

        while (alarm != 0) {
            if (alarm->tag == tag) {
                OSCancelAlarm(alarm);
            }

            alarm = next;
            next = (alarm) ? alarm->next : NULL;
        }

        ASSERTLINE(0x249, OSCheckAlarmQueue());
        OSRestoreInterrupts(enabled);
    }
}

static BOOL OnReset(BOOL final) {
    OSAlarm* alarm;
    OSAlarm* next;

    if (final != FALSE) {
        ASSERTLINE(0x25E, OSCheckAlarmQueue());

        alarm = AlarmQueue.head;
        next = (alarm) ? alarm->next : NULL;

        while (alarm != 0) {
            if (__DVDTestAlarm(alarm) == FALSE) {
                OSCancelAlarm(alarm);
            }

            alarm = next;
            next = (alarm) ? alarm->next : NULL;
        }

        ASSERTLINE(0x268, OSCheckAlarmQueue());
    }

    return TRUE;
}
