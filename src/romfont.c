#include "romfont.h"
#include "dolphin/mtx.h"
#include "dolphin/types.h"
#include "memory.h"
#include <dolphin/os.h>

//.sbss
static RomFontWork work;

//.sdata
static RomFontWork* wp = &work;

//.rodata string, .sdata table
const char* msg_jp[10] = {
    "プログレッシブモードで表示しますか？",
    "は　い　　　　　　いいえ",
    "【　　　　】",
    "画面表示モードはプログレッシブモードにセットされました。",
    "画面表示モードはインターレースモードにセットされました。",
    "ディスクカバーが開いています。\n\nゲームを続ける場合は、\nディスクカバーを閉めてください。",
    "ペーパーマリオＲＰＧの\nディスクをセットしてください。",
    "ディスクを読めませんでした。\n\nくわしくは、本体の取扱説明書を\nお読みください。",
    "エラーが発生しました。\n\n本体のパワーボタンを押して電源をOFFにし、\n本体の取扱説明書の指示に従ってください。",
    NULL
};

const char* msg_us[9] = {
    "Would you like to display in progressive scan mode?",
    "Yes              N o",
    "[    ]",
    "Progressive scan mode has been turned on.",
    "Progressive scan mode has been turned off.",
    "The Disc Cover is open.\nIf you want to continue the game,\nplease close the Disc Cover.",
    "Please insert\nthe \"Paper Mario 2\" Game Disc.",
    "The Game Disc could not be read.\nPlease read the\nNintendo GameCube Instruction Booklet\nfor more information.",
    NULL
};

static const char** msg_tbl[2] = { msg_jp, msg_us };

// local prototypes
void romFontMake(void);

const char* romFontGetMessage(s32 msg) {
    return msg_tbl[0][msg]; // has eng but always returns JP
}

void romFontInit(void) {
    wp->unk0 = 0;
    wp->uniqueChars = 0;
    if (OSGetFontEncode() == OS_FONT_ENCODE_SJIS) {
        wp->language = 0;
    } else {
        wp->language = 1;
    }
    romFontMake();
}

void romFontMake(void) {
    char c[16];
    s32 width;
    OSFontHeader* fontData;
    void* fontTmp;
    RomFontChar* glyph;
    u16* chars;
    u16* uniqueChars;
    s32 numChars;
    s32 i;
    const char* str;
    u16 prev;
    s32 t;

    chars = __memAlloc(HEAP_DEFAULT, 0x800);
    numChars = 0;

    /* 1. Collect every printable code from the system message strings. */
    for (t = 0; t < 2; t++) {
        for (i = 0; (str = msg_tbl[t][i]) != NULL; i++) {
            /* ASCII mode (language != 0): only scan the English table (t != 0). */
            s32 k = 0;
            if (wp->language == 0 || t != 0) {
                for (k;;) {
                    u32 b = str[k];
                    u16 w = *(u16*)(str + k);
                    if (b >= 0x20 && b < 0x80) {
                        chars[numChars++] = b;
                        k++;
                    } else if ((b >= 0x80 && b < 0xA0) || b >= 0xE0) {
                        chars[numChars++] = w;
                        k += 2;
                    } else if (b != 0) {
                        k++;
                    } else {
                        break;
                    }
                }
            }
        }
    }

    /* 2. Selection sort ascending. */
    {
        s32 j = 0;
        s32 i = 0;
        for (i = 0; i < numChars - 1; i++) {
            for (j = i; j < numChars; j++) {
                if (chars[i] > chars[j]) {
                    u16 tmp = chars[i];
                    chars[i] = chars[j];
                    chars[j] = tmp;
                }
            }
        }
    }

    /* 3. Deduplicate the sorted list; wp->unk4 = unique count. */
    wp->uniqueChars = 0;
    uniqueChars = __memAlloc(HEAP_DEFAULT, 0x800);
    prev = 0xFFFF;
    for (i = 0; i < numChars; i++) {
        if (chars[i] != prev) {
            prev = chars[i];
            uniqueChars[wp->uniqueChars++] = chars[i];
        }
    }

    /* 4. Expand the ROM font into RAM. */
    if (OSGetFontEncode() == OS_FONT_ENCODE_SJIS) {
        fontData = __memAlloc(HEAP_DEFAULT, 0x90EE4);              // OS_FONT_SIZE_SJIS (this SDK)
        fontTmp = __memAlloc(HEAP_DEFAULT, OS_FONT_ROM_SIZE_SJIS); // 0x4D000
    } else {
        fontData = __memAlloc(HEAP_DEFAULT, 0x10120);              // OS_FONT_SIZE_ANSI (this SDK)
        fontTmp = __memAlloc(HEAP_DEFAULT, OS_FONT_ROM_SIZE_ANSI); // 0x3000
    }
    OSLoadFont(fontData, fontTmp);

    /* 5. Bake each unique glyph into the cache. */
    wp->unk0 = __memAlloc(HEAP_DEFAULT, wp->uniqueChars * sizeof(RomFontChar));
    memset(wp->unk0, 0, wp->uniqueChars * sizeof(RomFontChar));
    glyph = wp->unk0;
    for (i = 0; i < (s32)wp->uniqueChars; i++) {
        if (uniqueChars[i] < 0x100) {
            c[0] = (s8)uniqueChars[i];
            c[1] = '\0';
        } else {
            *(u16*)c = uniqueChars[i];
            c[2] = '\0';
        }
        OSGetFontTexel(c, glyph, 0, 6, &width);
        glyph->code = uniqueChars[i];
        glyph->width = (s16)width;
        glyph++;
    }

    DCFlushRange(wp->unk0, wp->uniqueChars * sizeof(RomFontChar));

    __memFree(HEAP_DEFAULT, fontTmp);
    __memFree(HEAP_DEFAULT, fontData);
    __memFree(HEAP_DEFAULT, uniqueChars);
    __memFree(HEAP_DEFAULT, chars);
}

double tan(double);

static RomFontChar* romFontFindChar(u16 code) {
    RomFontChar* table = wp->unk0;
    RomFontChar* cur = table;
    s32 n;
    for (n = 0; n < wp->uniqueChars; n++, cur++) {
        if (cur->code == code)
            return cur;
    }
    return table; // not found
}

// Not quite matched, see: https://decomp.me/scratch/cdEUS
void romFontPrintGX(f32 x, f32 y, f32 scale, GXColor* color, const char* msg, ...) {
    char buf[1024];  // 0x158
    Mtx mtx;         // 0x128
    Mtx scaleMtx;    // 0x0F8
    Mtx camMtx;      // 0x0C8
    GXTexObj texObj; // 0x0A8
    Point3d target;  // 0x09C
    Point3d up;      // 0x090
    Point3d camPos;  // 0x084
    va_list ap;
    s32 i = 0;
    s16 curX = 0;
    s16 curY = 0;
    RomFontChar* glyph;

    // --- camera: place the eye so 1 unit == 1 px at the target plane ---
    target = (Vec){ 0.0f, 0.0f, 0.0f };
    up = (Vec){ 0.0f, 1.0f, 0.0f };
    camPos = (Vec){ 0.0f, 0.0f, 240.0f / (f32)tan(0.2181661278009415) };

    // --- format the message (this is where the va_list lives) ---
    va_start(ap, msg);
    vsprintf(buf, msg, ap); // no va_end in the original

    C_MTXLookAt(camMtx, &camPos, &up, &target);

    // --- render state: alpha-blended, no Z, colored I4 glyphs ---
    GXSetCullMode(GX_CULL_NONE);
    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
    GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_S16, 0);
    GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_S16, 0);
    GXSetBlendMode(GX_BM_BLEND, GX_BL_SRCALPHA, GX_BL_INVSRCALPHA, GX_LO_CLEAR);
    GXSetZCompLoc(GX_TRUE);
    GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_AND, GX_ALWAYS, 0);
    GXSetZMode(GX_DISABLE, GX_LEQUAL, GX_DISABLE);
    GXSetNumChans(1);
    GXSetChanCtrl(GX_COLOR0A0, GX_DISABLE, GX_SRC_REG, GX_SRC_REG, 0, GX_DF_NONE, GX_AF_NONE);
    GXSetChanMatColor(GX_COLOR0A0, *color);
    GXSetNumTevStages(1);
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR0A0);
    GXSetTevOp(GX_TEVSTAGE0, GX_MODULATE);
    GXSetNumTexGens(1);
    GXSetTexCoordGen2(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_IDENTITY, GX_FALSE, GX_PTIDENTITY);

    // --- model matrix = cam * translate(x,y,0) * scale(s,s,s) ---
    PSMTXTrans(mtx, x, y, 0.0f);
    PSMTXScale(scaleMtx, scale, scale, scale);
    PSMTXConcat(mtx, scaleMtx, mtx); // mtx = T * S
    PSMTXConcat(camMtx, mtx, mtx);   // mtx = cam * (T * S)
    GXLoadPosMtxImm(mtx, GX_PNMTX0);
    GXSetCurrentMtx(GX_PNMTX0);

    // --- walk the formatted string, one 24x24 quad per glyph ---
    for (i;;) {
        u32 c = buf[i];
        u16 c16 = *(u16*)&buf[i]; // big-endian lead<<8 | trail, for double-byte

        if (c >= 0x20 && c < 0x80) { // ASCII
            glyph = romFontFindChar(c & 0xFFFF);
            i += 1;
        } else if ((c >= 0x80 && c < 0xA0) || c >= 0xE0) { // SJIS lead byte
            glyph = romFontFindChar(c16);
            i += 2;
        } else if (c == 0x00) { // NUL -> done
            break;
        } else if (c == 0x0A) { // '\n'
            curX = 0;
            curY -= 24; // line height = cell height
            i += 1;
            continue; // no glyph drawn
        } else {      // ctrl / 0xA0-0xDF -> .notdef
            glyph = wp->unk0;
            i += 1;
        }

        GXInitTexObj(&texObj, glyph->texel, 24, 24, GX_TF_I4, GX_CLAMP, GX_CLAMP, GX_FALSE);
        GXInitTexObjLOD(&texObj, GX_LINEAR, GX_LINEAR, 0.0f, 0.0f, 0.0f, GX_FALSE, GX_FALSE, GX_ANISO_1);
        GXLoadTexObj(&texObj, GX_TEXMAP0);

        GXBegin(GX_QUADS, GX_VTXFMT0, 4);
        GXPosition3s16(curX, curY + 24, 0);
        GXTexCoord2s16(0, 0);
        GXPosition3s16(curX + 24, curY + 24, 0);
        GXTexCoord2s16(1, 0);
        GXPosition3s16(curX + 24, curY, 0);
        GXTexCoord2s16(1, 1);
        GXPosition3s16(curX, curY, 0);
        GXTexCoord2s16(0, 1);
        GXEnd();

        curX += glyph->width;
    }
}

s32 romFontGetWidth(const char* message) {
    return 0;
}
