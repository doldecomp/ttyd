#ifndef _DOLPHIN_GD_BASE_H
#define _DOLPHIN_GD_BASE_H

#include <dolphin/types.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef void (*GDOverflowCb)(void);

typedef struct _GDLObj {
	u8* start;
	u32 length;
	u8* ptr;
	u8* top;
} GDLObj;

extern GDLObj* __GDCurrentDL;

void GDInitGDLObj(GDLObj* dl, void* start, u32 length);
void GDFlushCurrToMem(void);
void GDPadCurr32(void);
void GDOverflowed(void);
void GDSetOverflowCallback(GDOverflowCb callback);
GDOverflowCb GDGetOverflowCallback(void);

#ifdef __cplusplus
}
#endif

#endif
