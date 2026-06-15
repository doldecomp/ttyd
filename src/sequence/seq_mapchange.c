#include "seq/seq_mapchange.h"
#include "data/mapdata.h"
#include "driver/bgdrv.h"
#include "driver/mapdrv.h"
#include "driver/msgdrv.h"
#include "evt/evt_badgeshop.h"
#include "mario/mario_party.h"
#include "mario/mariost.h"
#include "party.h"
#include "pmario_sound.h"
#include <stdio.h>
#include <string.h>

extern BadgeShopWork* bdsw;
extern BOOL dbg_lotteryinfo; // evt_lottery

//.sbss
char _next_bero[0x20];
char _next_map[0x20];
char _next_area[0x20];

void seq_mapChangeMain(SequenceWork* work) {
    /*
    BOOL newarea;
    char* area_name;

    newarea = strcmp(_next_area, gp->mCurrentAreaName) != 0;
    switch (work->field_0x4) {
    case 0:
            if (strcmp(_next_map, "sys_01")) {
                    if (newarea) {
                            fadeEntry(gp->mNextAreaChangeFadeInType, gp->mNextAreaChangeFadeInDuration, (GXColor) { 0,
    0, 0, 0xFF });
                    }
                    else {
                            fadeEntry(gp->mNextMapChangeFadeInType, gp->mNextMapChangeFadeInDuration, (GXColor) { 0, 0,
    0, 0xFF });
                    }
            }
            else {
                    if (gp->mNextAreaChangeFadeInType != 10) {
                            fadeEntry(gp->mNextAreaChangeFadeInType, gp->mNextAreaChangeFadeInDuration, (GXColor) { 0,
    0, 0, 0xFF });
                    }
                    fadeEntry(17, 2000, (GXColor) { 0, 0, 0, 0xFF });
            }
            gp->mNextMapChangeFadeInType = 10;
            gp->mNextMapChangeFadeInDuration = 300;
            gp->mNextAreaChangeFadeInType = 10;
            gp->mNextAreaChangeFadeInDuration = 300;
            psndSFXAllOff();
            gp->mbAreaChanged = newarea;
            if (strcmp(_next_map, "tou_03")) {
                    area_name = _next_area;
                    if (!strcmp(_next_area, "tou")) {
                            if (seqGetSeq() == 1) {
                                    area_name = "tou2";
                            }
                            else if (!strcmp(_next_map, "tou_03")) {
                                    area_name = "tou2";
                            }
                    }
                    fileAsyncf(0, 0, "%s/rel/%s.rel", getMarioStDvdRoot(), area_name);
            }
            work->field_0x4++;
            break;

    case 1:
            psndSFXAllOff();
            if (fadeIsFinish()) {
                    if (gp->mpRelFileBase) {
                            ((void(*)(void))gp->mpRelFileBase->epilog)();
                            OSUnlink(&gp->mpRelFileBase->info);
                    }
            }
            break;
    }*/
}

void seq_mapChangeExit(SequenceWork* work) {
    GXResetOverflowCount();
    dbg_lotteryinfo = FALSE;
}

void seq_mapChangeInit(SequenceWork* work) {
    strcpy(_next_area, "");
    strcpy(_next_map, "");
    strcpy(_next_bero, "");
    if (work->mapName) {
        strncpy(_next_area, work->mapName, 3);
        strncpy(_next_map, work->mapName, 0x20);
    }
    if (work->beroName) {
        strncpy(_next_bero, work->beroName, 0x20);
    }
    psndENVOff(0x200);
    psndENVOff(0x201);
    if (strcmp(gp->currentMapName, "") && strcmp(gp->currentMapName, "gor_01") && strcmp(_next_map, "gor_01")) {
        bdsw->field_0x114 |= 1;
    } else if (!strcmp(_next_map, "gor_01") && bdsw->field_0x114 & 1) {
        badgeShop_bargainGeneration();
        badgeShop_bottakuruGeneration();
        bdsw->field_0x114 &= 0xFFFE;
    }
}

void _load(const char* prevMapName, const char* newMapName, const char* beroName) {
    MapData* map;
    char mapFile[64];

    map = mapDataPtr(newMapName);
    strcpy(gp->beroEnterName, beroName ? beroName : "");
    strcpy(gp->currentMapName, map->mapName);
    strncpy(gp->currentAreaName, map->mapName, 3);
    if (!strcmp(newMapName, "dmo_00")) {
        mapLoad("gor_01");
    } else {
        mapLoad(map->mapName);
    }
    camCtrlOff(4);
    if (gp->field_C) {
        msgLoad("gon_11", 0);
    } else {
        memset(mapFile, 0, sizeof(mapFile));
        strncpy(mapFile, map->mapName, 6);
        msgLoad(mapFile, 0);
    }
    setupDataLoad(map->mapName);
    sprintf(mapFile, "./b/%s.tpl", newMapName);
    bgEntry(mapFile);
    if (gp->flags & 1) {
        MarioWork* mario;
        s32 partyId;
        PartyEntry* party;
        // TODO: verify this is e.g. Flavio and the Egg from Glitzville and rename accordingly
        s32 extraPartyId;
        PartyEntry* extraParty;

        mario = marioGetPtr();
        partyId = marioGetPartyId();
        party = partyGetPtr(partyId);
        extraPartyId = marioGetExtraPartyId();
        extraParty = partyGetPtr(extraPartyId);
        mario->field_EC = mario->position = gp->savePlayerPos;
    }
}
