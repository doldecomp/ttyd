#pragma once

#include <dolphin/types.h>

typedef enum BinaryFontEncoding {
	SINGLE_BYTE_ENCODING = 0,
	DOUBLE_BYTE_ENCODING = 1,
	MULTI_BYTE_ENCODING = 2
} BinaryFontEncoding;

typedef enum BinaryFontMapping {
	LINEAR_CHARACTER_MAP = 0,
	SJIS_CHARACTER_MAP = 1,
	TABLE_CHARACTER_MAP = 2,
	MAP_CHARACTER_MAP = 3
} BinaryFontMapping;

typedef struct BinaryFontBlock {
	u32 magic; //0x0, FourCC
	u32 size; //0x4, full size of this block
} BinaryFontBlock;

//BFN = Binary FoNt
typedef struct BinaryFontHeader {
	u32 magic; //0x0, "FONT"
	u32 version; //0x4, "bfn1"
	u32 size; //0x8, full size of the file
	u32 blockcount; //0xC, doesn't include header
	u8 align[16]; //0x10-0x1F
} BinaryFontHeader;

//INF1 section
typedef struct BinaryFontInfo {
	u32 magic; //0x0, "INF1"
	u32 size; //0x4, full size of this block
	u16 encoding; //0x8, see BinaryFontEncoding
	u16 ascent; //0xA, how far above baseline
	u16 descent; //0xC, how far below baseline
	u16 width; //0xE, character width
	u16 leading; //0x10, "line height"
	u16 replace; //0x12, replacement code for unmapped characters
	u8 align[12]; //0x14-0x1F
} BinaryFontInfo;

//GLY1 section
typedef struct BinaryFontGlyph {
	u32 magic; //0x0, "GLY1"
	u32 size; //0x4, full size of this block
	u16 firstcode; //0x8, first code in this glyph block (inclusive)
	u16 lastcode; //0xA, last code in this glyph block (inclusive)
	u16 cellwidth; //0xC
	u16 cellheight; //0xE
	u32 sheetsize; //0x10, includes padding
	u16 format; //0x14, GXTexFmt
	u16 sheetrows; //0x16
	u16 sheetcolumns; //0x18
	u16 sheetwidth; //0x1A
	u16 sheetheight; //0x1C
	u8 align[2]; //0x1E-0x1F
} BinaryFontGlyph;

typedef struct BinaryFontMap {
	u32 magic; //0x0, "MAP1"
	u32 size; //0x4, full size of this block
	u16 mapping; //0x8, see BinaryFontMapping
	u16 firstchar; //0xA, first character in this block (inclusive)
	u16 lastchar; //0xC, last character in this block (inclusive)
	u16 count; //0xE, number of mapping entries
	u16 table[]; //0x10, unknown size
} BinaryFontMap;

typedef struct BinaryFontWidth {
	u32 magic; //0x0, "WID1"
	u32 size; //0x4, full size of this block
	u16 firstcode; //0x8, first code for this block (inclusive)
	u16 lastcode; //0xA, last code for this block (inclusive)
} BinaryFontWidth;

void fontmgrInit(void);
void fontmgrTexSetup(void);
void FontDrawStart(void);
void FontDrawStart_alpha(u8 alpha);




u16 kanjiSearch(u16 code);
u16 kanjiGetWidth(u16 code);