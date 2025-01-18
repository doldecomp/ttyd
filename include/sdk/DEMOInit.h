#pragma once

#include <dolphin/gx.h>

void DEMOInit(GXRenderModeObj* mode);
void DEMOReInit(GXRenderModeObj* mode);
void DEMOBeforeRender(void);
void DEMODoneRender(void);
void DEMOSwapBuffers(void);
GXRenderModeObj* DEMOGetRenderModeObj(void);
void* DEMOGetCurrentBuffer(void);
void DEMOEnableGPHangWorkaround(u32 timeoutFrames);
void DEMOSetGPHangMetric(GXBool enable);