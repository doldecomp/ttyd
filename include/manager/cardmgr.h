#pragma once

#include "evt/evt_badgeshop.h"
#include "evt/evt_johoya.h"
#include "evt/evt_yuugijou.h"
#include "mario/mario_pouch.h"
#include "mario/mariost.h"
#include <dolphin/card.h>
#include <dolphin/os.h>

typedef struct {
    struct {
        char fileName[0x20]; //0x0
        char dateString[0x20]; //0x20
        u8 bannerTex[0x1800]; //0x40
        u8 iconTex[0x400]; //0x1840
        u8 iconTlut[0x200]; //0x1C40
        u16 unk1E40; //0x1E40
        u16 unk1E42; //0x1E42
        u16 unk1E44; //0x1E44
    } data;
    u8 __align[0x1FF8 - 0x1E46]; //0x1E46
    u32 checksum1; //0x1FF8
    u32 checksum2; //0x1FFC
} CardMetadata;

typedef struct {
    struct {
        u16 flags; //0x0
        u8 unk2[0x8 - 0x2]; //0x2
        GlobalWork global; //0x8
        PouchData pouch; //0x13E0
        NpcDeadInfo deadInfo[64]; //0x19B4
        BadgeShopWork badgeShop; //0x1EB4
        PiantaParlorWork parlor; //0x1FD8
        InformantUnknown informant; //0x2110
        u8 unk213B[0x2140 - 0x213B]; //0x213B
    } data;
    u8 __align[0x3FF0 - 0x2140]; //0x2140
    char version[4]; //0x3FF0
    s32 size; //0x3FF4
    u32 checksum1; //0x3FF8
    u32 checksum2; //0x3FFC
} CardSaveSlot;

typedef struct {
    CardMetadata metadata; //0x0
    CardSaveSlot saves[4]; //0x2000 (+ 0x4000 * save_index)
} CardData;

typedef struct {
    vu16 flags; //0x0
    u8 unk2[0x4 - 0x2]; //0x2
    void* workArea; //0x4
    s32 chan; //0x8
    s32 fileNo; //0xC
    u64 serialNo; //0x10
    u8 unk18[0x1C - 0x18]; //0x18
    CARDFileInfo info; //0x1C
    CARDStat status; //0x30
    s32 result; //0x9C
    s32 currSlot; //0xA0
    s32 unkA4; //0xA4
    CardData* data; //0xA8
    void* unkAC; //0xAC, can be either metadata or save
    CardSaveSlot* unkB0; //0xB0
    BOOL validSave1; //0xB4, is main save valid?
    BOOL validSave2; //0xB8, is backup save valid?
    s32 unkBC; //0xBC
    s32 unkC0; //0xC0
    u8 unkC4[0xC8 - 0xC4]; //0xC4
    OSTime lastSaveTime1; //0xC8
    OSTime lastSaveTime2; //0xD0
    s32 unkD8; //0xD8
    u8 unkDC[0xE0 - 0xDC]; //0xDC
    s32 unkE0; //0xE0
    s32 unkE4; //0xE4
    u8 unkE8[0xEC - 0xE8]; //0xE8
    s32 unkEC; //0xEC
} CardWork;

CardData* cardGetFilePtr(void);
void cardBufReset(void);
void cardInit(void);
void cardED0(void); //called by evt_memcard, TODO: rename
void cardEAC(void); //called by evt_memcard, TODO: rename
BOOL cardE80(void); //called by evt_memcard, TODO: rename
BOOL cardIsExec(void);
s32 cardGetCode(void);
void cardMain(void);
void cardCopy2Main(s32 slot);
void cardErase(s32 slot);
void cardCopy(s32 from, s32 to);
void cardWrite(s32 slot);
void cardWriteHeader(void);
void cardReadAll(void);
void cardCreate(void);
void cardFormat(void);
