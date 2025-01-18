#include <demo/DEMOAVX.h>

#include <dolphin/ai.h>
#include <dolphin/os.h>
#include <string.h>

//.bss
static s16 __AVX_internal_buffer[3200];

//.sbss
static AIDCallback __AVX_save_isr;
static u32 __AVX_num_frames;
static u32 __AVX_num_filled;
static u32 __AVX_curr_frame;
static u16* __AVX_buffer;
static s16* __AVX_left_buffer;
static s16* __AVX_right_buffer;
static u32 __AVX_write_ptr;
static u32 __AVX_buffer_size;
static BOOL flag;

static void __DEMOAVX_isr(void) {
    u32 frame_address; // r31

    if (__AVX_save_isr) {
        __AVX_save_isr();

        frame_address = AIGetDMAStartAddr() | 0x80000000;
        if (frame_address == 0) {
            OSPanic("DEMOAVX.c", 0x53, "AVX: frame address is NULL!\n");
        }

        DCInvalidateRange((void*)frame_address, AVX_FRAME_SIZE_BYTES);
        memcpy(&__AVX_buffer[AVX_FRAME_SIZE_WORDS * __AVX_curr_frame], (const void*)frame_address,
               AVX_FRAME_SIZE_BYTES);
        DCFlushRange(&__AVX_buffer[AVX_FRAME_SIZE_WORDS * __AVX_curr_frame], AVX_FRAME_SIZE_BYTES);

        __AVX_curr_frame = (__AVX_curr_frame + 1) % __AVX_num_frames;
        __AVX_num_filled = (__AVX_num_filled + 1) % 10;

        if (__AVX_curr_frame > 4) {
            flag = TRUE;
        }
    }
}

u32 DEMOAVXGetNumFilled(void) {
    u32 tmp; // r31
    int old; // r30

    old = OSDisableInterrupts();

    tmp = __AVX_num_filled;
    __AVX_num_filled = 0;

    OSRestoreInterrupts(old);

    return tmp;
}

u32 DEMOAVXGetFrameCounter(void) {
    return __AVX_curr_frame;
}

u32 DEMOAVXRefreshBuffer(u32* start_index, u32* end_index) {
    u32 num_filled; // r29
    u32 curr_frame; // r31
    u32 i;          // r28
    u32 j;          // r30

    if (!flag) {
        return 0;
    }

    num_filled = DEMOAVXGetNumFilled();
    curr_frame = (__AVX_num_frames + DEMOAVXGetFrameCounter() - num_filled) % __AVX_num_frames;

    *start_index = __AVX_write_ptr;

    for (i = 0; i < num_filled; i++) {
        DCInvalidateRange(&__AVX_buffer[AVX_FRAME_SIZE_WORDS * curr_frame], AVX_FRAME_SIZE_BYTES);

        for (j = 0; j < AVX_FRAME_SIZE_WORDS; j += 2) {
            __AVX_left_buffer[__AVX_write_ptr] = __AVX_buffer[AVX_FRAME_SIZE_WORDS * curr_frame + j];
            __AVX_right_buffer[__AVX_write_ptr] = __AVX_buffer[AVX_FRAME_SIZE_WORDS * curr_frame + 1 + j];
            __AVX_write_ptr = (__AVX_write_ptr + 1) % __AVX_buffer_size;
        }

        curr_frame = (curr_frame + 1) % __AVX_num_frames;
    }

    *end_index = __AVX_write_ptr;

    return AVX_FRAME_SIZE_SAMPLES * num_filled;
}

void DEMOAVXInit(s16* left, s16* right, u32 size) {
    __AVX_left_buffer = left;
    __AVX_right_buffer = right;
    __AVX_write_ptr = 0;
    __AVX_buffer_size = size;
    DEMOAVXAttach(__AVX_internal_buffer, 10);
}

void DEMOAVXAttach(void* buffer, u32 num_frames) {
    int old; // r29
    u32 i;   // r31

    __AVX_buffer = (u16*)buffer;
    __AVX_num_frames = num_frames;
    __AVX_num_filled = 0;
    __AVX_curr_frame = 0;
    for (i = 0; i < AVX_FRAME_SIZE_WORDS * num_frames; i++) {
        __AVX_buffer[i] = 0;
    }
    DCFlushRange(__AVX_buffer, AVX_FRAME_SIZE_WORDS * num_frames);
    old = OSDisableInterrupts();
    __AVX_save_isr = (void (*)())AIRegisterDMACallback(__DEMOAVX_isr);
    OSRestoreInterrupts(old);
}
