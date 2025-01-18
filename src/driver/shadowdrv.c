#include "driver/shadowdrv.h"
#include <string.h>

//.bss
CharShadowWork char_shadow_work;
ProjShadowWork proj_shadow_work;
DepthShadowWork depth_shadow_work;

//.sbss
GXTexObj rampTex8;
GXTexObj rampTex16;

//.sdata
u16 ShadowSizeTbl[4] = {0x190, 0x100, 0x80, 0x40};
DepthShadowWork* dswp = &depth_shadow_work;
ProjShadowWork* pswp = &proj_shadow_work;
CharShadowWork* cswp = &char_shadow_work;

void shadowInit(void) { //almost 1:1, minor regalloc
    u8* ramp8;
    u16* ramp16;
    u32 i;
    u32 bufferSize;
    CharShadowWork* wp;

    cswp->unk0 = 0;
    cswp->unk4 = 0;
    cswp->unk8 = 1;
    cswp->unk100 = (GXColor){0, 0, 0, 0x6E};
    cswp->unk10C = 1;
    cswp->unk110 = 2;
    cswp->unk114 = 20.0f;
    cswp->unk118 = 1;
    cswp->unk104 = 0;
    cswp->entries = __memAlloc(HEAP_DEFAULT, sizeof(ShadowEntry) * 64);
    memset(cswp->entries, 0, sizeof(ShadowEntry) * 64);
    wp = cswp;
    wp->unkFC = smartAlloc(GXGetTexBufferSize(ShadowSizeTbl[0], ShadowSizeTbl[0], 2, 0, 0), 0);
    dswp->unk0 = 2;
    dswp->unk4 = 0;
    dswp->unk8 = 0;
    dswp->unk100 = (GXColor){0, 0, 0, 0x40};

    bufferSize = GXGetTexBufferSize(0x10, 0x10, GX_TF_I8, GX_FALSE, 0);
    ramp8 = __memAlloc(HEAP_DEFAULT, GXGetTexBufferSize(0x10, 0x10, GX_TF_I8, GX_FALSE, 0));
    for (i = 0; i < 256; i++) {
        ramp8[(((i & 0x3) * 8) + (((i & 0xC) * 16) + (((i & 0x80) / 4) + ((i & 0x70) / 16))))] = i;
    }
    GXInitTexObj(&rampTex8, ramp8, 0x10, 0x10, GX_TF_I8, GX_CLAMP, GX_REPEAT, GX_FALSE);
    GXInitTexObjLOD(&rampTex8, GX_NEAR, GX_NEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    DCFlushRange(ramp8, bufferSize);

    bufferSize = GXGetTexBufferSize(0x100, 0x100, GX_TF_IA8, GX_FALSE, 0);
    ramp16 = __memAlloc(HEAP_DEFAULT, GXGetTexBufferSize(0x100, 0x100, GX_TF_IA8, GX_FALSE, 0));
    for (i = 0; i < 0x10000; i++) {
        ramp16[(((i & 0x3) * 4) + (((i & 0xFC) * 256) + (((i & 0xFC00) / 64) + ((i & 0x300) / 256))))] = i;
    }
    GXInitTexObj(&rampTex16, ramp16, 0x100, 0x100, GX_TF_IA8, GX_CLAMP, GX_REPEAT, GX_FALSE);
    GXInitTexObjLOD(&rampTex16, GX_NEAR, GX_NEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
    DCFlushRange(ramp16, bufferSize);

    pswp->unk0 = 2;
    pswp->unk4 = 0;
    pswp->unk8 = 0;
    pswp->unk100 = (GXColor){0, 0, 0, 0x40};
}

void shadowMain(void) {

}
