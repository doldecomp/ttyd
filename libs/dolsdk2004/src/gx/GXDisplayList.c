#include <libc/string.h>

#include <dolphin/gx.h>
#include <dolphin/os.h>

#include "__gx.h"

static struct __GXFifoObj DisplayListFifo;
static volatile struct __GXFifoObj *OldCPUFifo;
static struct __GXData_struct __savedGXdata;

void GXBeginDisplayList(void *list, u32 size)
{
    struct __GXFifoObj *CPUFifo = (struct __GXFifoObj *)GXGetCPUFifo();

    CHECK_GXBEGIN(0x89, "GXBeginDisplayList");
    ASSERTMSGLINE(0x8A, !__GXData->inDispList, "GXBeginDisplayList: display list already in progress");
    ASSERTMSGLINE(0x8B, (size & 0x1F) == 0, "GXBeginDisplayList: size is not 32 byte aligned");
    ASSERTMSGLINE(0x8C, ((u32)list & 0x1F) == 0, "GXBeginDisplayList: list is not 32 byte aligned");
    if (__GXData->dirtyState != 0) {
        __GXSetDirtyState();
    }
    if (__GXData->dlSaveContext != 0) {
        memcpy(&__savedGXdata, __GXData, sizeof(__savedGXdata));
    }
    DisplayListFifo.base = (u8 *) list;
    DisplayListFifo.top = (u8 *)list + size - 4;
    DisplayListFifo.size = size;
    DisplayListFifo.count = 0;
    DisplayListFifo.rdPtr = list;
    DisplayListFifo.wrPtr = list;
    __GXData->inDispList = 1;
    GXSaveCPUFifo((GXFifoObj *)CPUFifo);
    OldCPUFifo = CPUFifo;
    GXSetCPUFifo((GXFifoObj *)&DisplayListFifo);
    GXResetWriteGatherPipe();
}

unsigned long GXEndDisplayList(void)
{
    u32 ov;
#ifdef DEBUG
    u32 reg;
#endif
    BOOL enabled;
    u32 cpenable;

    CHECK_GXBEGIN(0xC3, "GXEndDisplayList");
    ASSERTMSGLINE(0xC4, __GXData->inDispList == TRUE, "GXEndDisplayList: no display list in progress");
    GXFlush();
#ifdef DEBUG
    reg = GX_GET_PI_REG(5);
    ov = (reg >> 26) & 1;
#else
    ov = (GX_GET_PI_REG(5) >> 26) & 1;
#endif
    __GXSaveCPUFifoAux(&DisplayListFifo);
    ASSERTMSGLINE(0xD5, !ov, "GXEndDisplayList: display list commands overflowed buffer");
    GXSetCPUFifo((GXFifoObj *)OldCPUFifo);
    if (__GXData->dlSaveContext != 0) {
        enabled = OSDisableInterrupts();
        cpenable = __GXData->cpEnable;
        memcpy(__GXData, &__savedGXdata, sizeof(*__GXData));
        __GXData->cpEnable = cpenable;
        OSRestoreInterrupts(enabled);
    }
    __GXData->inDispList = 0;
    if (!ov) {
        return DisplayListFifo.count;
    }
    return 0;
}

void GXCallDisplayList(void *list, u32 nbytes)
{
    CHECK_GXBEGIN(0xFE, "GXCallDisplayList");
    ASSERTMSGLINE(0xFF, !__GXData->inDispList, "GXCallDisplayList: display list already in progress");
    ASSERTMSGLINE(0x100, (nbytes & 0x1F) == 0, "GXCallDisplayList: nbytes is not 32 byte aligned");
    ASSERTMSGLINE(0x101, ((u32)list & 0x1F) == 0, "GXCallDisplayList: list is not 32 byte aligned");

    if (__GXData->dirtyState != 0) {
        __GXSetDirtyState();
    }
#if DEBUG
    __GXShadowDispList(list, nbytes);
#endif
    if (*(u32 *)&__GXData->vNumNot == 0) {  // checks both vNum and bpSent
        __GXSendFlushPrim();
    }
    GX_WRITE_U8(0x40);
    GX_WRITE_U32(list);
    GX_WRITE_U32(nbytes);
}
