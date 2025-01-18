#include <dolphin/exi.h>
#include <dolphin/os.h>
#include <macros.h>

#include "__os.h"

// End of each month in standard year
static int YearDays[MONTH_MAX] = {0,   31,  59,  90,  120, 151,
                                  181, 212, 243, 273, 304, 334};
// End of each month in leap year
static int LeapYearDays[MONTH_MAX] = {0,   31,  60,  91,  121, 152,
                                      182, 213, 244, 274, 305, 335};

asm OSTime OSGetTime(void) {
    // clang-format off
jump:
    nofralloc

    mftbu r3
    mftb r4

    // Check for possible carry from TBL to TBU
    mftbu r5
    cmpw r3, r5
    bne jump

    blr
    // clang-format on
}

asm unsigned long OSGetTick(void){
    // clang-format off
    nofralloc

    mftb r3
    blr
    // clang-format on
}

asm static void __SetTime(OSTime time) {
    // clang-format off
    nofralloc
    li r5, 0
    mttbl r5
    mttbu r3
    mttbl r4
    blr
    // clang-format on
}

void __OSSetTime(OSTime time) {
    int enabled;
    OSTime * timeAdjustAddr;

    timeAdjustAddr = __OSSystemTime;
    enabled = OSDisableInterrupts();

    *timeAdjustAddr += OSGetTime() - time;
    __SetTime(time);
    EXIProbeReset();
    OSRestoreInterrupts(enabled);
}

OSTime __OSGetSystemTime() {
    int enabled;
    OSTime* timeAdjustAddr;
    OSTime result;

    timeAdjustAddr = __OSSystemTime;
    enabled = OSDisableInterrupts();

    result = OSGetTime() + *timeAdjustAddr;
    OSRestoreInterrupts(enabled);
    return result;
}

OSTime __OSTimeToSystemTime(OSTime time ) {
    int enabled;
    OSTime* timeAdjustAddr = __OSSystemTime;
    OSTime result;

    enabled = OSDisableInterrupts();
    result = *timeAdjustAddr + time;
    OSRestoreInterrupts(enabled);
    return result;
}

asm void __OSSetTick(register unsigned long newTicks) {
    // clang-format off
    nofralloc
    mttbl newTicks
    blr
    // clang-format on
}

static int IsLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

static int GetYearDays(int year, int mon) {
    int * md = (IsLeapYear(year)) ? LeapYearDays : YearDays;

    return md[mon];
}

static int GetLeapDays(int year) {
    ASSERTLINE(0x11E, 0 <= year);
    
    if (year < 1) {
        return 0;
    }
    return (year + 3) / 4 - (year - 1) / 100 + (year - 1) / 400;
}

static void GetDates(int days, OSCalendarTime* td) {
    int year;
    int n;
    int month;
    int * md;

    ASSERTLINE(0x137, 0 <= days);

    td->wday = (days + 6) % WEEK_DAY_MAX;

    for (year = days / YEAR_DAY_MAX;
         days < (n = year * YEAR_DAY_MAX + GetLeapDays(year)); year--) {
        ;
    }

    days -= n;
    td->year = year;
    td->yday = days;

    md = IsLeapYear(year) ? LeapYearDays : YearDays;
    for (month = MONTH_MAX; days < md[--month];) {
        ;
    }
    td->mon = month;
    td->mday = days - md[month] + 1;
}

void OSTicksToCalendarTime(OSTime ticks, OSCalendarTime* td) {
    int days;
    int secs;
    OSTime d;

    d = ticks % OS_SEC_TO_TICKS(1);    
    if (d < 0) {
        d += OS_SEC_TO_TICKS(1);
        ASSERTLINE(0x164, 0 <= d);
    }

    td->usec = OS_TICKS_TO_USEC(d) % USEC_MAX;
    td->msec = OS_TICKS_TO_MSEC(d) % MSEC_MAX;

    ASSERTLINE(0x168, 0 <= td->usec);
    ASSERTLINE(0x169, 0 <= td->msec);

    ticks -= d;

    ASSERTLINE(0x16C, ticks % OSSecondsToTicks(1) == 0);
    ASSERTLINE(0x170, 0 <= OSTicksToSeconds(ticks) / 86400 + BIAS && OSTicksToSeconds(ticks) / 86400 + BIAS <= INT_MAX);

    days = (OS_TICKS_TO_SEC(ticks) / SECS_IN_DAY) + BIAS;    
    secs = OS_TICKS_TO_SEC(ticks) % SECS_IN_DAY;
    if (secs < 0) {
        days -= 1;
        secs += SECS_IN_DAY;
        ASSERTLINE(0x177, 0 <= secs);
    }

    GetDates(days, td);
    td->hour = secs / 60 / 60;
    td->min = secs / 60 % 60;
    td->sec = secs % 60;
}

OSTime OSCalendarTimeToTicks(OSCalendarTime* td) {
    OSTime secs;
    int ov_mon;
    int mon;
    int year;

    ov_mon = td->mon / MONTH_MAX;
    mon = td->mon - (ov_mon * MONTH_MAX);

    if (mon < 0) {
        mon += MONTH_MAX;
        ov_mon--;
    }

    ASSERTLINE(0x19C, (ov_mon <= 0 && 0 <= td->year + ov_mon) || (0 < ov_mon && td->year <= INT_MAX - ov_mon));
    
    year = td->year + ov_mon;

    // clang-format off
    secs = (s64)SECS_IN_YEAR * year +
              (s64)SECS_IN_DAY * (GetLeapDays(year) + GetYearDays(year, mon) + td->mday - 1) +
              (s64)SECS_IN_HOUR * td->hour +
              (s64)SECS_IN_MIN * td->min +
              td->sec -
              (s64)0xEB1E1BF80ULL;
    // clang-format on

    return OS_SEC_TO_TICKS(secs) + OS_MSEC_TO_TICKS((s64)td->msec) +
           OS_USEC_TO_TICKS((s64)td->usec);
}
