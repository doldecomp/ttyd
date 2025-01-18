#ifndef _DOLPHIN_OSSTOPWATCH_H_
#define _DOLPHIN_OSSTOPWATCH_H_

struct OSStopwatch {
    char* name;
    u32 hits;
    s64 total;
    s64 min;
    s64 max;
    s64 last;
    int running;
    u32 _padding;
};

void OSInitStopwatch(struct OSStopwatch * sw, char * name);
void OSStartStopwatch(struct OSStopwatch * sw);
void OSStopStopwatch(struct OSStopwatch * sw);
s64 OSCheckStopwatch(struct OSStopwatch * sw);
void OSResetStopwatch(struct OSStopwatch * sw);
void OSDumpStopwatch(struct OSStopwatch * sw);

#endif // _DOLPHIN_OSSTOPWATCH_H_
