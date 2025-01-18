#ifndef _DEMOAVX_H_
#define _DEMOAVX_H_

#include <dolphin/types.h>

#define AVX_FRAME_SIZE_SAMPLES 160
#define AVX_FRAME_SIZE_WORDS (160 * 2)
#define AVX_FRAME_SIZE_BYTES (160 * 2 * 2)

void DEMOAVXInit(s16* left, s16* right, u32 size);
u32 DEMOAVXRefreshBuffer(u32* start_index, u32* end_index);

void DEMOAVXAttach(void* buffer, u32 num_frames);
u32 DEMOAVXGetFrameCounter(void);
u32 DEMOAVXGetNumFilled(void);

#endif
