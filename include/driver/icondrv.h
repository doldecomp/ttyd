#pragma once

/*
icon.bin structure:
s16 numEntries
s16 entryOffset[numEntries]
s16 IconBinEntry[6][numEntries] (?, width override? height override? numImages, tplId, iconDelay?)
2 extra bytes for some reason
*/

#include <dolphin/gx.h>
#include <dolphin/mtx.h>

#define numBinEntries 0x218

typedef struct IconBinaryEntry {
	u16 type; //0x0, 1 if animated
	u16 width; //0x2, overrides tpl size
	u16 height; //0x4, overrides tpl size
	u16 numIcons; //0x6, for simple anims like button press
	u16 tplId; //0x8, for tpl lookup
	u16 frameDelay; //0xA, if animated, number of frames until next
} IconBinaryEntry;

typedef struct IconBinary {
	u16 count; //0x0, numBinEntries
	u16 offset[numBinEntries]; //0x2
	IconBinaryEntry data[numBinEntries]; //0x432
} IconBinary;


//flags, 1 = in use, 0x10 = 2D, 0x1000 = animated(?), 0x2000 = ?(something to do with bin)
#pragma warn_padding off
typedef struct IconEntry {
	s16 flags; //0x0
	u8 field_0x2; //0x2
	//pad 1 byte
	Vec position; //0x4
	f32 scale; //0x10
	GXColor color; //0x14
	char name[16]; //0x18
	s16 iconId; //0x28
	u16 width; //0x2A
	u16 height; //0x2C
	u16 numIcons; //0x2E
	u16 currIcon; //0x30, if animated, currently displayed icon (starts at 0)
	u16 tplId; //0x32
	u16 frameDelay; //0x34
	u8 field_0x36[2]; //0x36, padding?
} IconEntry;
#pragma warn_padding on

typedef struct IconWork {
	s32 count; //0x0
	IconEntry* entries; //0x4
} IconWork;

void iconInit(void);
void iconTexSetup(void);
void iconReInit(void);
void iconMain(void);
void iconEntry(const char* name, s16 iconId);
void iconEntry2D(const char* name, s16 iconId);
void iconDelete(const char* name);
void iconChange(const char* name, s16 iconId);
void iconDispGxAlpha(Vec position, s16 flags, s16 iconId, u8 alpha, f32 scale);
void iconDispGx(Vec position, s16 flags, s16 iconId, f32 scale);
void iconDispGx2(Mtx mtx, s16 flags, s16 iconId);
void iconDispGxCol(Mtx pos, s16 flags, s32 iconId, GXColor color);
void iconGetTexObj(GXTexObj* texObj, s16 iconId);
void iconGetWidthHeight(u16* width, u16* height, s16 iconId);
IconEntry* iconNameToPtr(const char* name);
void iconSetPos(const char* name, f32 x, f32 y, f32 z);
void iconFlagOn(const char* name, s16 flags);
void iconFlagOff(const char* name, s16 mask);
void iconSetScale(const char* name, f32 scale);
void iconSetAlpha(const char* name, u8 alpha);
f32 iconNumberDispGx(Mtx mtx, s32 number, BOOL small, GXColor color);
f32 iconNumberDispGx3D(Mtx mtx, s32 number, BOOL small, GXColor color);
