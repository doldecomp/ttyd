#include <dolphin/gx.h>
#include <dolphin/os.h>

#include "__gx.h"

#if DEBUG
#define GX_WRITE_SOME_REG5(a, b) \
do { \
    GX_WRITE_U8(a); \
    GX_WRITE_U32(b); \
    __gxVerif->rasRegs[(b >> 24) & 0xFF] = b; \
} while (0)
#else
#define GX_WRITE_SOME_REG5(a, b) \
do { \
    GX_WRITE_U8(a); \
    GX_WRITE_U32(b); \
} while (0)
#endif

void GXSetTevIndirect(GXTevStageID tev_stage, GXIndTexStageID ind_stage, GXIndTexFormat format, GXIndTexBiasSel bias_sel, GXIndTexMtxID matrix_sel, GXIndTexWrap wrap_s, GXIndTexWrap wrap_t, GXBool add_prev, GXBool utc_lod, GXIndTexAlphaSel alpha_sel)
{
    u32 reg;

    CHECK_GXBEGIN(0x92, "GXInitIndTexture");
    reg = 0;
    SET_REG_FIELD(0x94, reg, 2, 0, ind_stage);
    SET_REG_FIELD(0x95, reg, 2, 2, format);
    SET_REG_FIELD(0x96, reg, 3, 4, bias_sel);
    SET_REG_FIELD(0x97, reg, 2, 7, alpha_sel);
    SET_REG_FIELD(0x98, reg, 4, 9, matrix_sel);
    SET_REG_FIELD(0x99, reg, 3, 13, wrap_s);
    SET_REG_FIELD(0x9A, reg, 3, 16, wrap_t);
    SET_REG_FIELD(0x9B, reg, 1, 19, utc_lod);
    SET_REG_FIELD(0x9C, reg, 1, 20, add_prev);
    SET_REG_FIELD(0x9D, reg, 8, 24, tev_stage + 16);
    GX_WRITE_SOME_REG5(0x61, reg);
    __GXData->bpSentNot = 0;
}

void GXSetIndTexMtx(GXIndTexMtxID mtx_id, const f32 offset[2][3], s8 scale_exp)
{
    s32 mtx[6];
    u32 reg;
    u32 id;

    CHECK_GXBEGIN(0xBA, "GXSetIndTexMtx");

    switch (mtx_id) {
    case GX_ITM_0:
    case GX_ITM_1:
    case GX_ITM_2:
        id = mtx_id - 1;
        break;
    case GX_ITM_S0:
    case GX_ITM_S1:
    case GX_ITM_S2:
        id = mtx_id - 5;
        break;
    case GX_ITM_T0:
    case GX_ITM_T1:
    case GX_ITM_T2:
        id = mtx_id - 9;
        break;
    default:
        id = 0;
        break;
    }

    mtx[0] = (int)(1024.0f * offset[0][0]) & 0x7FF;
    mtx[1] = (int)(1024.0f * offset[1][0]) & 0x7FF;
    scale_exp += 0x11;
    reg = 0;
    SET_REG_FIELD(0xD0, reg, 11, 0, mtx[0]);
    SET_REG_FIELD(0xD1, reg, 11, 11, mtx[1]);
    SET_REG_FIELD(0xD2, reg, 2, 22, scale_exp & 3);
    SET_REG_FIELD(0xD3, reg, 8, 24, id * 3 + 6);
    GX_WRITE_SOME_REG5(0x61, reg);

    mtx[2] = (int)(1024.0f * offset[0][1]) & 0x7FF;
    mtx[3] = (int)(1024.0f * offset[1][1]) & 0x7FF;
    reg = 0;
    SET_REG_FIELD(0xD9, reg, 11, 0, mtx[2]);
    SET_REG_FIELD(0xDA, reg, 11, 11, mtx[3]);
    SET_REG_FIELD(0xDB, reg, 2, 22, (scale_exp >> 2) & 3);
    SET_REG_FIELD(0xDC, reg, 8, 24, id * 3 + 7);
    GX_WRITE_SOME_REG5(0x61, reg);

    mtx[4] = (int)(1024.0f * offset[0][2]) & 0x7FF;
    mtx[5] = (int)(1024.0f * offset[1][2]) & 0x7FF;
    reg = 0;
    SET_REG_FIELD(0xE2, reg, 11, 0, mtx[4]);
    SET_REG_FIELD(0xE3, reg, 11, 11, mtx[5]);
    SET_REG_FIELD(0xE4, reg, 2, 22, (scale_exp >> 4) & 3);
    SET_REG_FIELD(0xE5, reg, 8, 24, id * 3 + 8);
    GX_WRITE_SOME_REG5(0x61, reg);

    __GXData->bpSentNot = 0;
}

void GXSetIndTexCoordScale(GXIndTexStageID ind_state, GXIndTexScale scale_s, GXIndTexScale scale_t)
{
    CHECK_GXBEGIN(0xF9, "GXSetIndTexScale");

    switch (ind_state) {
    case GX_INDTEXSTAGE0:
        SET_REG_FIELD(0xFD, __GXData->IndTexScale0, 4, 0, scale_s);
        SET_REG_FIELD(0xFE, __GXData->IndTexScale0, 4, 4, scale_t);
        SET_REG_FIELD(0xFE, __GXData->IndTexScale0, 8, 24, 0x25);
        GX_WRITE_SOME_REG5(0x61, __GXData->IndTexScale0);
        break;
    case GX_INDTEXSTAGE1:
        SET_REG_FIELD(0x103, __GXData->IndTexScale0, 4, 8, scale_s);
        SET_REG_FIELD(0x104, __GXData->IndTexScale0, 4, 12, scale_t);
        SET_REG_FIELD(0x104, __GXData->IndTexScale0, 8, 24, 0x25);
        GX_WRITE_SOME_REG5(0x61, __GXData->IndTexScale0);
        break;
    case GX_INDTEXSTAGE2:
        SET_REG_FIELD(0x109, __GXData->IndTexScale1, 4, 0, scale_s);
        SET_REG_FIELD(0x10A, __GXData->IndTexScale1, 4, 4, scale_t);
        SET_REG_FIELD(0x10A, __GXData->IndTexScale1, 8, 24, 0x26);
        GX_WRITE_SOME_REG5(0x61, __GXData->IndTexScale1);
        break;
    case GX_INDTEXSTAGE3:
        SET_REG_FIELD(0x10F, __GXData->IndTexScale1, 4, 8, scale_s);
        SET_REG_FIELD(0x110, __GXData->IndTexScale1, 4, 12, scale_t);
        SET_REG_FIELD(0x110, __GXData->IndTexScale1, 8, 24, 0x26);
        GX_WRITE_SOME_REG5(0x61, __GXData->IndTexScale1);
        break;
    default:
        ASSERTMSGLINE(0x115, 0, "GXSetIndTexCoordScale: Invalid Indirect Stage Id");
        break;
    }
    __GXData->bpSentNot = 0;
}

void GXSetIndTexOrder(GXIndTexStageID ind_stage, GXTexCoordID tex_coord, GXTexMapID tex_map)
{
    CHECK_GXBEGIN(0x12E, "GXSetIndTexOrder");

    if (tex_map == GX_TEXMAP_NULL) {
        tex_map = GX_TEXMAP0;
    }

    if (tex_coord == GX_TEXCOORD_NULL) {
        tex_coord = GX_TEXCOORD0;
    }

    ASSERTMSGLINE(0x13A, tex_map < 8, "GXSetIndTexOrder: Invalid direct texture Id");
    ASSERTMSGLINE(0x13B, tex_coord < 8, "GXSetIndTexOrder: Invalid texture coord");

    switch (ind_stage) {
    case GX_INDTEXSTAGE0:
        SET_REG_FIELD(0x13F, __GXData->iref, 3, 0, tex_map);
        SET_REG_FIELD(0x140, __GXData->iref, 3, 3, tex_coord);
        break;
    case GX_INDTEXSTAGE1:
        SET_REG_FIELD(0x143, __GXData->iref, 3, 6, tex_map);
        SET_REG_FIELD(0x144, __GXData->iref, 3, 9, tex_coord);
        break;
    case GX_INDTEXSTAGE2:
        SET_REG_FIELD(0x147, __GXData->iref, 3, 12, tex_map);
        SET_REG_FIELD(0x148, __GXData->iref, 3, 15, tex_coord);
        break;
    case GX_INDTEXSTAGE3:
        SET_REG_FIELD(0x14B, __GXData->iref, 3, 18, tex_map);
        SET_REG_FIELD(0x14C, __GXData->iref, 3, 21, tex_coord);
        break;
    default:
        ASSERTMSGLINE(0x14F, 0, "GXSetIndTexOrder: Invalid Indirect Stage Id");
        break;
    }
    GX_WRITE_SOME_REG5(0x61, __GXData->iref);
    __GXData->dirtyState |= 3;
    __GXData->bpSentNot = 0;
}

void GXSetNumIndStages(u8 nIndStages)
{
    CHECK_GXBEGIN(0x161, "GXSetNumIndStages");
    ASSERTMSGLINE(0x163, nIndStages <= 4, "GXSetNumIndStages: Exceeds max. number of indirect texture stages");
    SET_REG_FIELD(0x164, __GXData->genMode, 3, 16, nIndStages);
    __GXData->dirtyState |= 6;
}

void GXSetTevDirect(GXTevStageID tev_stage)
{
    CHECK_GXBEGIN(0x175, "GXSetTevDirect");
    GXSetTevIndirect(tev_stage, GX_INDTEXSTAGE0, GX_ITF_8, GX_ITB_NONE, GX_ITM_OFF, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
}

void GXSetTevIndWarp(GXTevStageID tev_stage, GXIndTexStageID ind_stage, u8 signed_offset, u8 replace_mode, GXIndTexMtxID matrix_sel)
{
    GXIndTexWrap wrap = (replace_mode != 0) ? GX_ITW_0 : GX_ITW_OFF;

    CHECK_GXBEGIN(0x18B, "GXSetTevIndWarp");
    GXSetTevIndirect(tev_stage, ind_stage, GX_ITF_8, (signed_offset != 0) ? GX_ITB_STU : GX_ITB_NONE, matrix_sel, wrap, wrap, 0U, 0, 0);
}

void GXSetTevIndTile(GXTevStageID tev_stage, GXIndTexStageID ind_stage, u16 tilesize_s,
    u16 tilesize_t, u16 tilespacing_s, u16 tilespacing_t, GXIndTexFormat format,
    GXIndTexMtxID matrix_sel, GXIndTexBiasSel bias_sel, GXIndTexAlphaSel alpha_sel)
{
    GXIndTexWrap wrap_s;
    GXIndTexWrap wrap_t;
    f32 mtx[2][3];

    CHECK_GXBEGIN(0x1AD, "GXSetTevIndTile");
    ASSERTMSGLINE(0x1AE, tev_stage < 16, "GXSetTevIndTile: Invalid tev stage id");
    ASSERTMSGLINE(0x1AF, ind_stage < 4, "GXSetTevIndTile: Invalid indirect stage id");
    switch (tilesize_s) {
    case 256:
        wrap_s = GX_ITW_256;
        break;
    case 128:
        wrap_s = GX_ITW_128;
        break;
    case 64:
        wrap_s = GX_ITW_64;
        break;
    case 32:
        wrap_s = GX_ITW_32;
        break;
    case 16:
        wrap_s = GX_ITW_16;
        break;
    default:
        ASSERTMSGLINE(0x1B8, 0, "GXSetTevIndTile: Invalid tilesize for S coordinate");
        wrap_s = GX_ITW_OFF;
        break;
    }
    switch (tilesize_t) {
    case 256:
        wrap_t = GX_ITW_256;
        break;
    case 128:
        wrap_t = GX_ITW_128;
        break;
    case 64:
        wrap_t = GX_ITW_64;
        break;
    case 32:
        wrap_t = GX_ITW_32;
        break;
    case 16:
        wrap_t = GX_ITW_16;
        break;
    default:
        ASSERTMSGLINE(0x1C4, 0, "GXSetTevIndTile: Invalid tilesize for T coordinate");
        wrap_t = GX_ITW_OFF;
        break;
    }
    mtx[0][0] = tilespacing_s / 1024.0f;
    mtx[0][1] = mtx[0][2] = 0.0f;
    mtx[1][1] = tilespacing_t / 1024.0f;
    mtx[1][0] = mtx[1][2] = 0.0f;
    GXSetIndTexMtx(matrix_sel, mtx, 0xA);
    GXSetTevIndirect(tev_stage, ind_stage, format, bias_sel, matrix_sel, wrap_s, wrap_t, 0U, 1, alpha_sel);
}

void GXSetTevIndBumpST(GXTevStageID tev_stage, GXIndTexStageID ind_stage, GXIndTexMtxID matrix_sel)
{
    GXIndTexMtxID sm;
    GXIndTexMtxID tm;

    CHECK_GXBEGIN(0x1EC, "GXSetTevIndBumpST");
    switch (matrix_sel) {
    case GX_ITM_0:
        sm = GX_ITM_S0;
        tm = GX_ITM_T0;
        break;
    case GX_ITM_1:
        sm = GX_ITM_S1;
        tm = GX_ITM_T1;
        break;
    case GX_ITM_2:
        sm = GX_ITM_S2;
        tm = GX_ITM_T2;
        break;
    default:
        ASSERTMSGLINE(0x1FD, 0, "GXSetTevIndBumpST: Invalid matrix selection");
        break;
    }
    GXSetTevIndirect(tev_stage, ind_stage, GX_ITF_8, GX_ITB_ST, sm, GX_ITW_0, GX_ITW_0, 0U, 0, 0);
    GXSetTevIndirect(tev_stage + 1, ind_stage, GX_ITF_8, GX_ITB_ST, tm, GX_ITW_0, GX_ITW_0, 1U, 0, 0);
    GXSetTevIndirect(tev_stage + 2, ind_stage, GX_ITF_8, GX_ITB_NONE, GX_ITM_OFF, GX_ITW_OFF, GX_ITW_OFF, 1U, 0, 0);
}

void GXSetTevIndBumpXYZ(GXTevStageID tev_stage, GXIndTexStageID ind_stage, GXIndTexMtxID matrix_sel)
{
    CHECK_GXBEGIN(0x231, "GXSetTevIndBumpXYZ");
    GXSetTevIndirect(tev_stage, ind_stage, GX_ITF_8, GX_ITB_STU, matrix_sel, GX_ITW_OFF, GX_ITW_OFF, 0U, 0, 0);
}

void GXSetTevIndRepeat(GXTevStageID tev_stage)
{
    CHECK_GXBEGIN(0x24E, "GXSetTevIndRepeat");
    GXSetTevIndirect(tev_stage, GX_INDTEXSTAGE0, GX_ITF_8, GX_ITB_NONE, GX_ITM_OFF, GX_ITW_0, GX_ITW_0, 1U, 0, 0);
}

void __GXUpdateBPMask(void) {}

void __GXSetIndirectMask(u32 mask) {
    SET_REG_FIELD(0x298, __GXData->bpMask, 8, ~0xFF, mask);

    GX_WRITE_SOME_REG5(0x61, __GXData->bpMask);
    __GXData->bpSentNot = 0;
}

void __GXFlushTextureState(void)
{
    GX_WRITE_SOME_REG5(0x61, __GXData->bpMask);
    __GXData->bpSentNot = 0;
}
