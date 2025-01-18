#include <dolphin/gx.h>
#include <dolphin/os.h>
#include <macros.h>

#include "__gx.h"

static struct {
    u32 rid : 8;
    u32 dest : 2;
    u32 shift : 2;
    u32 clamp : 1;
    u32 sub : 1;
    u32 bias : 2;
    u32 sela : 4;
    u32 selb : 4;
    u32 selc : 4;
    u32 seld : 4;
} TEVCOpTableST0[5] = {
    {192, 0, 0, 1, 0, 0, 15, 8, 10, 15},   // modulate
    {192, 0, 0, 1, 0, 0, 10, 8, 9, 15},    // decal
    {192, 0, 0, 1, 0, 0, 10, 12, 8, 15},   // blend
    {192, 0, 0, 1, 0, 0, 15, 15, 15, 8},   // replace
    {192, 0, 0, 1, 0, 0, 15, 15, 15, 10},  // passclr
};

static struct {
    u32 rid : 8;
    u32 dest : 2;
    u32 shift : 2;
    u32 clamp : 1;
    u32 sub : 1;
    u32 bias : 2;
    u32 sela : 4;
    u32 selb : 4;
    u32 selc : 4;
    u32 seld : 4;
} TEVCOpTableST1[5] = {
    {192, 0, 0, 1, 0, 0, 15, 8, 0, 15},   // modulate
    {192, 0, 0, 1, 0, 0, 0, 8, 9, 15},    // decal
    {192, 0, 0, 1, 0, 0, 0, 12, 8, 15},   // blend
    {192, 0, 0, 1, 0, 0, 15, 15, 15, 8},  // replace
    {192, 0, 0, 1, 0, 0, 15, 15, 15, 0},  // passclr
};

static struct {
    u32 rid : 8;
    u32 dest : 2;
    u32 shift : 2;
    u32 clamp : 1;
    u32 sub : 1;
    u32 bias : 2;
    u32 sela : 3;
    u32 selb : 3;
    u32 selc : 3;
    u32 seld : 3;
    u32 swap : 2;
    u32 mode : 2;
} TEVAOpTableST0[5] = {
    {193, 0, 0, 1, 0, 0, 7, 4, 5, 7, 0, 0},  // modulate
    {193, 0, 0, 1, 0, 0, 7, 7, 7, 5, 0, 0},  // decal
    {193, 0, 0, 1, 0, 0, 7, 4, 5, 7, 0, 0},  // blend
    {193, 0, 0, 1, 0, 0, 7, 7, 7, 4, 0, 0},  // replace
    {193, 0, 0, 1, 0, 0, 7, 7, 7, 5, 0, 0},  // passclr
};

static struct {
    u32 rid : 8;
    u32 dest : 2;
    u32 shift : 2;
    u32 clamp : 1;
    u32 sub : 1;
    u32 bias : 2;
    u32 sela : 3;
    u32 selb : 3;
    u32 selc : 3;
    u32 seld : 3;
    u32 swap : 2;
    u32 mode : 2;
} TEVAOpTableST1[5] = {
    {193, 0, 0, 1, 0, 0, 7, 4, 0, 7, 0, 0},  // modulate
    {193, 0, 0, 1, 0, 0, 7, 7, 7, 0, 0, 0},  // decal
    {193, 0, 0, 1, 0, 0, 7, 4, 0, 7, 0, 0},  // blend
    {193, 0, 0, 1, 0, 0, 7, 7, 7, 4, 0, 0},  // replace
    {193, 0, 0, 1, 0, 0, 7, 7, 7, 0, 0, 0},  // passclr
};

#define SOME_SET_REG_MACRO(reg, size, shift, val)                                                   \
	do {                                                                                            \
		(reg) = (u32)__rlwimi((u32)(reg), (val), (shift), (32 - (shift) - (size)), (31 - (shift))); \
	} while (0);

void GXSetTevOp(GXTevStageID id, GXTevMode mode)
{
    u32* ctmp;
    u32* atmp;
    u32 tevReg;

    CHECK_GXBEGIN(0x1A4, "GXSetTevOp");
    ASSERTMSGLINE(0x1A5, id < 16, "GXSetTevColor*: Invalid Tev Stage Index");
    ASSERTMSGLINE(0x1A6, mode <= 4, "GXSetTevOp: Invalid Tev Mode");

    if (id == GX_TEVSTAGE0) {
        ctmp = (u32*)TEVCOpTableST0 + mode;
        atmp = (u32*)TEVAOpTableST0 + mode;
    } else {
        ctmp = (u32*)TEVCOpTableST1 + mode;
        atmp = (u32*)TEVAOpTableST1 + mode;
    }

    tevReg = __GXData->tevc[id];
    tevReg = (*ctmp & ~0xFF000000) | (tevReg & 0xFF000000);
    GX_WRITE_RAS_REG(tevReg);
    __GXData->tevc[id] = tevReg;

    tevReg = __GXData->teva[id];
    tevReg = (*atmp & ~0xFF00000F) | (tevReg & 0xFF00000F);
    GX_WRITE_RAS_REG(tevReg);
    __GXData->teva[id] = tevReg;

    __GXData->bpSentNot = 0;
}

void GXSetTevColorIn(GXTevStageID stage, GXTevColorArg a, GXTevColorArg b, GXTevColorArg c, GXTevColorArg d)
{
    u32 tevReg;

    CHECK_GXBEGIN(0x242, "GXSetTevColorIn");
    ASSERTMSGLINE(0x243, stage < 16, "GXSetTevColor*: Invalid Tev Stage Index");
    ASSERTMSGLINE(0x244, a <= 15, "GXSetTev*In: A/B/C/D argument out of range");
    ASSERTMSGLINE(0x245, b <= 15, "GXSetTev*In: A/B/C/D argument out of range");
    ASSERTMSGLINE(0x246, c <= 15, "GXSetTev*In: A/B/C/D argument out of range");
    ASSERTMSGLINE(0x247, d <= 15, "GXSetTev*In: A/B/C/D argument out of range");

    tevReg = __GXData->tevc[stage];
    SET_REG_FIELD(0x24A, tevReg, 4, 12, a);
    SET_REG_FIELD(0x24B, tevReg, 4,  8, b);
    SET_REG_FIELD(0x24C, tevReg, 4,  4, c);
    SET_REG_FIELD(0x24D, tevReg, 4,  0, d);

    GX_WRITE_RAS_REG(tevReg);
    __GXData->tevc[stage] = tevReg;
    __GXData->bpSentNot = 0;
}

void GXSetTevAlphaIn(GXTevStageID stage, GXTevAlphaArg a, GXTevAlphaArg b, GXTevAlphaArg c, GXTevAlphaArg d)
{
    u32 tevReg;

    CHECK_GXBEGIN(0x266, "GXSetTevAlphaIn");
    ASSERTMSGLINE(0x267, stage < 16, "GXSetTevAlpha*: Invalid Tev Stage Index");
    ASSERTMSGLINE(0x268, a <= 7, "GXSetTev*In: A/B/C/D argument out of range");
    ASSERTMSGLINE(0x269, b <= 7, "GXSetTev*In: A/B/C/D argument out of range");
    ASSERTMSGLINE(0x26A, c <= 7, "GXSetTev*In: A/B/C/D argument out of range");
    ASSERTMSGLINE(0x26B, d <= 7, "GXSetTev*In: A/B/C/D argument out of range");

    tevReg = __GXData->teva[stage];
    SET_REG_FIELD(0x26E, tevReg, 3, 13, a);
    SET_REG_FIELD(0x26F, tevReg, 3, 10, b);
    SET_REG_FIELD(0x270, tevReg, 3,  7, c);
    SET_REG_FIELD(0x271, tevReg, 3,  4, d);

    GX_WRITE_RAS_REG(tevReg);
    __GXData->teva[stage] = tevReg;
    __GXData->bpSentNot = 0;
}

void GXSetTevColorOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    u32 tevReg;

    CHECK_GXBEGIN(0x28D, "GXSetTevColorOp");
    ASSERTMSGLINE(0x28E, stage < 16, "GXSetTevColor*: Invalid Tev Stage Index");

    tevReg = __GXData->tevc[stage];
    SET_REG_FIELD(0x297, tevReg, 1, 18, op & 1);
    if (op <= 1) {
        SET_REG_FIELD(0x299, tevReg, 2, 20, scale);
        SET_REG_FIELD(0x29A, tevReg, 2, 16, bias);
    } else {
        SET_REG_FIELD(0x29C, tevReg, 2, 20, (op >> 1) & 3);
        SET_REG_FIELD(0x2A0, tevReg, 2, 16, 3);
    }
    SET_REG_FIELD(0x2A0, tevReg, 1, 19, clamp & 0xFF);
    SET_REG_FIELD(0x2A1, tevReg, 2, 22, out_reg);

    GX_WRITE_RAS_REG(tevReg);
    __GXData->tevc[stage] = tevReg;
    __GXData->bpSentNot = 0;
}

void GXSetTevAlphaOp(GXTevStageID stage, GXTevOp op, GXTevBias bias, GXTevScale scale, GXBool clamp, GXTevRegID out_reg)
{
    u32 tevReg;

    CHECK_GXBEGIN(0x2BB, "GXSetTevAlphaOp");
    ASSERTMSGLINE(0x2BC, stage < 16, "GXSetTevAlpha*: Invalid Tev Stage Index");

    tevReg = __GXData->teva[stage];
    SET_REG_FIELD(0x2C4, tevReg, 1, 18, op & 1);
    if (op <= 1) {
        SET_REG_FIELD(0x2C6, tevReg, 2, 20, scale);
        SET_REG_FIELD(0x2C7, tevReg, 2, 16, bias);
    } else {
        SET_REG_FIELD(0x2C9, tevReg, 2, 20, (op >> 1) & 3);
        SET_REG_FIELD(0x2CD, tevReg, 2, 16, 3);
    }
    SET_REG_FIELD(0x2CD, tevReg, 1, 19, clamp & 0xFF);
    SET_REG_FIELD(0x2CE, tevReg, 2, 22, out_reg);

    GX_WRITE_RAS_REG(tevReg);
    __GXData->teva[stage] = tevReg;
    __GXData->bpSentNot = 0;
}

void GXSetTevColor(GXTevRegID id, GXColor color)
{
    u32 rgba;
    u32 regRA;
    u32 regBG;

    CHECK_GXBEGIN(0x2E4, "GXSetTevColor");
    rgba = *(u32*)&color;

    regRA = (0xE0 + id * 2) << 24;
    SET_REG_FIELD(0x2E9, regRA, 8, 0, rgba >> 24);
    SET_REG_FIELD(0x2EA, regRA, 8, 12, rgba & 0xFF);

    regBG = (0xE1 + id * 2) << 24;
    SET_REG_FIELD(0x2ED, regBG, 8, 0, (rgba >> 8) & 0xFF);
    SET_REG_FIELD(0x2EE, regBG, 8, 12, (rgba >> 16) & 0xFF);

    GX_WRITE_RAS_REG(regRA);
    GX_WRITE_RAS_REG(regBG);
    GX_WRITE_RAS_REG(regBG);
    GX_WRITE_RAS_REG(regBG);

    __GXData->bpSentNot = 0;
}

void GXSetTevColorS10(GXTevRegID id, GXColorS10 color)
{
    u32 sRG;
    u32 sBA;
    u32 regRA;
    u32 regBG;

    ASSERTMSGLINE(0x309, color.r >= -1024 && color.r < 1024, "GXSetTevColorS10: Color not in range -1024 to +1023");
    ASSERTMSGLINE(0x30A, color.g >= -1024 && color.g < 1024, "GXSetTevColorS10: Color not in range -1024 to +1023");
    ASSERTMSGLINE(0x30B, color.b >= -1024 && color.b < 1024, "GXSetTevColorS10: Color not in range -1024 to +1023");
    ASSERTMSGLINE(0x30C, color.a >= -1024 && color.a < 1024, "GXSetTevColorS10: Color not in range -1024 to +1023");

    CHECK_GXBEGIN(0x30E, "GXSetTevColorS10");
    sRG = *(u32*)&color;
    sBA = *((u32*)&color + 1);

    regRA = (0xE0 + id * 2) << 24;
    SET_REG_FIELD(0x315, regRA, 11,  0, (sRG >> 16) & 0x7FF);
    SET_REG_FIELD(0x316, regRA, 11, 12, sBA & 0x7FF);

    regBG = (0xE1 + id * 2) << 24;
    SET_REG_FIELD(0x319, regBG, 11, 0, (sBA >> 16) & 0x7FF);
    SET_REG_FIELD(0x31A, regBG, 11, 12, sRG & 0x7FF);

    GX_WRITE_RAS_REG(regRA);
    GX_WRITE_RAS_REG(regBG);
    GX_WRITE_RAS_REG(regBG);
    GX_WRITE_RAS_REG(regBG);

    __GXData->bpSentNot = 0;
}

void GXSetTevKColor(GXTevKColorID id, GXColor color)
{
    u32 rgba;
    u32 regRA;
    u32 regBG;

    CHECK_GXBEGIN(0x341, "GXSetTevKColor");
    rgba = *(u32*)&color;

    regRA = (0xE0 + id * 2) << 24;
    SET_REG_FIELD(0x346, regRA, 8, 0, rgba >> 24);
    SET_REG_FIELD(0x347, regRA, 8, 12, rgba & 0xFF);
    SET_REG_FIELD(0x347, regRA, 4, 20, 8);

    regBG = (0xE1 + id * 2) << 24;
    SET_REG_FIELD(0x34B, regBG, 8, 0, (rgba >> 8) & 0xFF);
    SET_REG_FIELD(0x34C, regBG, 8, 12, (rgba >> 16) & 0xFF);
    SET_REG_FIELD(0x34D, regBG, 4, 20, 8);

    GX_WRITE_RAS_REG(regRA);
    GX_WRITE_RAS_REG(regBG);

    __GXData->bpSentNot = 0;
}

void GXSetTevKColorSel(GXTevStageID stage, GXTevKColorSel sel)
{
    u32 *Kreg;

    CHECK_GXBEGIN(0x368, "GXSetTevKColorSel");
    ASSERTMSGLINE(0x369, stage < 16, "GXSetTevKColor*: Invalid Tev Stage Index");

    Kreg = &__GXData->tevKsel[stage >> 1];
    if (stage & 1) {
        SET_REG_FIELD(0x36E, *Kreg, 5, 14, sel);
    } else {
        SET_REG_FIELD(0x370, *Kreg, 5, 4, sel);
    }

    GX_WRITE_RAS_REG(*Kreg);
    __GXData->bpSentNot = 0;
}

void GXSetTevKAlphaSel(GXTevStageID stage, GXTevKAlphaSel sel)
{
    u32 *Kreg;

    CHECK_GXBEGIN(0x389, "GXSetTevKAlphaSel");
    ASSERTMSGLINE(0x38A, stage < 16, "GXSetTevKColor*: Invalid Tev Stage Index");

    Kreg = &__GXData->tevKsel[stage >> 1];
    if (stage & 1) {
        SET_REG_FIELD(0x38F, *Kreg, 5, 19, sel);
    } else {
        SET_REG_FIELD(0x391, *Kreg, 5, 9, sel);
    }

    GX_WRITE_RAS_REG(*Kreg);
    __GXData->bpSentNot = 0;
}

void GXSetTevSwapMode(GXTevStageID stage, GXTevSwapSel ras_sel, GXTevSwapSel tex_sel)
{
    u32 *pTevReg;

    CHECK_GXBEGIN(0x3AE, "GXSetTevSwapMode");
    ASSERTMSGLINE(0x3AF, stage < 16, "GXSetTevSwapMode: Invalid Tev Stage Index");

    pTevReg = &__GXData->teva[stage];
    SET_REG_FIELD(0x3B2, *pTevReg, 2, 0, ras_sel);
    SET_REG_FIELD(0x3B3, *pTevReg, 2, 2, tex_sel);

    GX_WRITE_RAS_REG(*pTevReg);
    __GXData->bpSentNot = 0;
}

void GXSetTevSwapModeTable(GXTevSwapSel table, GXTevColorChan red, GXTevColorChan green, GXTevColorChan blue, GXTevColorChan alpha)
{
    u32 *Kreg;
#if !DEBUG
    // not a real variable, but needed to match release
    int index = table * 2;
#endif

    CHECK_GXBEGIN(0x3D2, "GXSetTevSwapModeTable");
    ASSERTMSGLINE(0x3D3, table < 4, "GXSetTevSwapModeTable: Invalid Swap Selection Index");

#if DEBUG
    Kreg = &__GXData->tevKsel[table * 2];
#else
    Kreg = &__GXData->tevKsel[index];
#endif
    SET_REG_FIELD(0x3D6, *Kreg, 2, 0, red);
    SET_REG_FIELD(0x3D7, *Kreg, 2, 2, green);

    GX_WRITE_RAS_REG(*Kreg);

    Kreg = &__GXData->tevKsel[table * 2 + 1];
    SET_REG_FIELD(0x3DB, *Kreg, 2, 0, blue);
    SET_REG_FIELD(0x3DC, *Kreg, 2, 2, alpha);

    GX_WRITE_RAS_REG(*Kreg);
    __GXData->bpSentNot = 0;
}

void GXSetTevClampMode(void)
{
    ASSERTMSGLINE(0x3F4, 0, "GXSetTevClampMode: not available on this hardware");
}

void GXSetAlphaCompare(GXCompare comp0, u8 ref0, GXAlphaOp op, GXCompare comp1, u8 ref1)
{
    u32 reg;

    CHECK_GXBEGIN(0x416, "GXSetAlphaCompare");
    reg = 0xF3000000;

    SET_REG_FIELD(0x419, reg, 8, 0, ref0);
    SET_REG_FIELD(0x41A, reg, 8, 8, ref1);
    SET_REG_FIELD(0x41B, reg, 3, 16, comp0);
    SET_REG_FIELD(0x41C, reg, 3, 19, comp1);
    SET_REG_FIELD(0x41D, reg, 2, 22, op);

    GX_WRITE_RAS_REG(reg);
    __GXData->bpSentNot = 0;
}

void GXSetZTexture(GXZTexOp op, GXTexFmt fmt, u32 bias)
{
    u32 zenv0;
    u32 zenv1;
    u32 type;

    CHECK_GXBEGIN(0x435, "GXSetZTexture");

    zenv0 = 0;
    SET_REG_FIELD(0x438, zenv0, 24, 0, bias);
    SET_REG_FIELD(0x439, zenv0, 8, 24, 0xF4);

    zenv1 = 0;
    switch (fmt)
    {
    case GX_TF_Z8:
        type = 0;
        break;
    case GX_TF_Z16:
        type = 1;
        break;
    case GX_TF_Z24X8:
        type = 2;
        break;
    default:
        ASSERTMSGLINE(0x441, 0, "GXSetZTexture: Invalid z-texture format");
        type = 2;
        break;
    }
    SET_REG_FIELD(0x444, zenv1, 2, 0, type);
    SET_REG_FIELD(0x445, zenv1, 2, 2, op);
    SET_REG_FIELD(0x446, zenv1, 8, 24, 0xF5);

    GX_WRITE_RAS_REG(zenv0);
    GX_WRITE_RAS_REG(zenv1);
    __GXData->bpSentNot = 0;
}

void GXSetTevOrder(GXTevStageID stage, GXTexCoordID coord, GXTexMapID map, GXChannelID color)
{
    u32 *ptref;
    u32 tmap;
    u32 tcoord;
    static int c2r[] = { 0, 1, 0, 1, 0, 1, 7, 5, 6 };

    CHECK_GXBEGIN(0x46B, "GXSetTevOrder");
    ASSERTMSGLINE(0x46C, stage < 16, "GXSetTevOrder: Invalid Tev Stage Index");
    ASSERTMSGLINE(0x46E, coord < 8 || coord == 0xFF, "GXSetTevOrder: Invalid Texcoord");
    ASSERTMSGLINE(0x470, (map & ~0x100) < 8 || map == 0xFF, "GXSetTevOrder: Invalid Tex Map");
    ASSERTMSGLINE(0x472, color >= 4 && color <= 0xFF, "GXSetTevOrder: Invalid Color Channel ID");

    ptref = &__GXData->tref[stage / 2];
    __GXData->texmapId[stage] = map;

    tmap = map & ~0x100;
    tmap = (tmap >= GX_MAX_TEXMAP) ? GX_TEXMAP0 : tmap;

    if (coord >= GX_MAX_TEXCOORD) {
        tcoord = GX_TEXCOORD0;
        __GXData->tevTcEnab = __GXData->tevTcEnab & ~(1 << stage);
    } else {
        tcoord = coord;
        __GXData->tevTcEnab = __GXData->tevTcEnab | (1 << stage);
    }

    if (stage & 1) {
        SET_REG_FIELD(0x486, *ptref, 3, 12, tmap);
        SET_REG_FIELD(0x487, *ptref, 3, 15, tcoord);
        SET_REG_FIELD(0x489, *ptref, 3, 19, (color == GX_COLOR_NULL) ? 7 : c2r[color]);
        SET_REG_FIELD(0x48B, *ptref, 1, 18, (map != GX_TEXMAP_NULL && !(map & 0x100)));
    } else {
        SET_REG_FIELD(0x48E, *ptref, 3, 0, tmap);
        SET_REG_FIELD(0x48F, *ptref, 3, 3, tcoord);
        SET_REG_FIELD(0x491, *ptref, 3, 7, (color == GX_COLOR_NULL) ? 7 : c2r[color]);
        SET_REG_FIELD(0x493, *ptref, 1, 6, (map != GX_TEXMAP_NULL && !(map & 0x100)));
    }

    GX_WRITE_RAS_REG(*ptref);
    __GXData->bpSentNot = 0;
    __GXData->dirtyState |= 1;
}

void GXSetNumTevStages(u8 nStages)
{
    CHECK_GXBEGIN(0x4A3, "GXSetNumTevStages");

    ASSERTMSGLINE(0x4A5, nStages != 0 && nStages <= 16, "GXSetNumTevStages: Exceed max number of tex stages");
    SET_REG_FIELD(0x4A6, __GXData->genMode, 4, 10, nStages - 1);
    __GXData->dirtyState |= 4;
}
