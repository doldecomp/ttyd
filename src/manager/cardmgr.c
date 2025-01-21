/* "cardmgr" - Memory Card Manager
* Status: almost 1:1, some functions don't work right with memcard_probe's opt_propagation it seems
*
* Function: handles all communication with save data and writing to memory cards
*
* Last Update: 1/19/2023, first finished, can prolly use a cleanup pass
*/
#include "mgr/cardmgr.h"
#include "mario/mario.h"
#include "mario/mario_party.h"
#include "memory.h"
#include "party.h"
#include <string.h>
#include <stddef.h>

extern GlobalWork* gp;
extern BadgeShopWork* bdsw;
extern PiantaParlorWork* yuwp;
extern InformantWork _jdt;
extern int sprintf(char* str, const char* format, ...);

//.rodata
#include "assets/_mariost_icon_tex.inc"
#include "assets/_mariost_icon_tlut.inc"
#include "assets/_mariost_banner_tex.inc"

//.sbss
static CardWork* wp;

//.sdata
const char* version = "009";

//local prototypes
void check_sum(CardSaveSlot* save);
void make_header(void);
void make_data(void);

void memcard_probe(void);
void memcard_mount(void);
void memcard_unmount(void);
void memcard_check(void);
void memcard_format(void);
void memcard_delete(void);
void memcard_create(void);
void memcard_write(void* addr, s32 length, s32 offset);
void memcard_read(void* addr, s32 length, s32 offset);
void memcard_set_stat(void);
void memcard_get_stat(void);
void memcard_get_serial(void);
void memcard_open(void);
void memcard_close(void);

void mountDetachCallback(s32 chan, s32 result);
void mountAttachCallback(s32 chan, s32 result);
void checkCallback(s32 chan, s32 result);
void formatCallback(s32 chan, s32 result);
void createCallback(s32 chan, s32 result);
void writeCallback(s32 chan, s32 result);
void readCallback(s32 chan, s32 result);
void statusCallback(s32 chan, s32 result);

void write_main(void);
void write_header_main(void);
void read_main(void);
void read_all_main(void);
void create_main(void);
void format_main(void);
void delete_main(void);

BOOL headerCheck(void);
BOOL headerCheck2(void);
BOOL dataCheck(void);

CardData* cardGetFilePtr(void) {
	return wp->data;
}

void cardBufReset(void) {
	s32 flags;
	s32 timeout;

	flags = wp->flags;
	if (wp->flags & 1) {
		CARDCancel(&wp->info);
		for (timeout = 1000000; timeout > 0; timeout--) {
			if (!(wp->flags & 1)) {
				break;
			}
		}
		wp->flags &= ~1;
	}

	make_header();
	make_data();

	wp->chan = -1;
	wp->fileNo = -1;
	wp->serialNo = 0;
	wp->unkE0 = 0;
	wp->result = CARD_RESULT_NOCARD;
	wp->flags = 0;
}

void cardInit(void) {
	wp = __memAlloc(HEAP_DEFAULT, sizeof(CardWork));
	memset(wp, 0, sizeof(CardWork));
	wp->workArea = __memAlloc(HEAP_DEFAULT, CARD_WORKAREA_SIZE);
	memset(wp->workArea, 0, CARD_WORKAREA_SIZE);
	wp->data = __memAlloc(HEAP_DEFAULT, sizeof(CardData));
	memset(wp->data, 0, sizeof(CardData));
	wp->unkAC = __memAlloc(HEAP_DEFAULT, sizeof(CardSaveSlot));
	memset(wp->unkAC, 0, sizeof(CardSaveSlot));
	wp->unkB0 = __memAlloc(HEAP_DEFAULT, sizeof(CardSaveSlot));
	memset(wp->unkB0, 0, sizeof(CardSaveSlot));

	make_header();
	make_data();

	wp->chan = -1;
	wp->fileNo = -1;
	wp->serialNo = 0;
	wp->unkE0 = 0;
	wp->result = CARD_RESULT_NOCARD;
	wp->flags = 0;
	CARDInit();
}

void cardED0(void) {
	wp->unkE4 = wp->chan;
	wp->unkEC = 10;
	wp->flags |= 0x8000;
}

void cardEAC(void) {
	wp->flags &= ~0x8000;
	wp->flags &= ~0xC000;
}

BOOL cardE80(void) {
    if (wp->flags & 0x8000 && wp->flags & 0x4000) {
        return TRUE;
    }
    return FALSE;
}

BOOL cardIsExec(void) {
    if (wp == NULL) {
        return FALSE;
    }
    if (wp->flags & 2) {
        return TRUE;
    }
    if (wp->flags & 1) {
        return TRUE;
    }
    return wp->unkEC != 0;
}

s32 cardGetCode(void) {
	return wp->result;
}

#pragma opt_propagation off //needed for memcard_probe
void cardMain(void) {
	s32 temp_r4;

	if (wp->flags & 0x8000) {
		temp_r4 = (s32)(s64)-(CARDProbe(0) == 0); //is something inserted?
		if (wp->unkE4 != temp_r4) {
			wp->flags |= 0x4000;
		}
		wp->unkE4 = temp_r4;
		if (wp->unkEC) {
			wp->unkEC--;
		}
	}

	switch (wp->unkE0) {
		case 1:
			write_main();
			break;

		case 2:
			write_header_main();
			break;

		case 3:
			read_main();
			break;

		case 4:
			read_all_main();
			break;

		case 5:
			create_main();
			break;

		case 6:
			if (wp->result != CARD_RESULT_READY) {
				wp->unkE0 = 8;
				wp->flags |= 0x200;
				wp->flags &= ~2;
			}
			else if (!(wp->flags & 1)) {
				switch (wp->unkD8) {
					case 0:
						memcard_probe();
						break;

					case 1:
						memcard_mount();
						break;

					case 2:
						memcard_format();
						break;

					case 3:
						memcard_unmount();
						break;

					case 4:
						wp->unkE0 = 0;
						wp->flags |= 0x100;
						wp->flags &= ~2;
						break;
				}
				wp->unkD8++;
			}
			else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
				wp->result = CARDGetResultCode(wp->chan);
				wp->flags &= ~1;
			}
			break;

		case 7:
			if (wp->result != CARD_RESULT_READY) {
				wp->unkE0 = 8;
				wp->flags |= 0x200;
				wp->flags &= ~2;
			}
			else if (!(wp->flags & 1)) {
				switch (wp->unkD8) {
					case 0:
						memcard_probe();
						break;

					case 1:
						memcard_mount();
						break;

					case 2:
						memcard_check();
						break;

					case 3:
						memcard_delete();
						break;

					case 4:
						memcard_unmount();
						break;

					case 5:
						wp->unkE0 = 0;
						wp->flags |= 0x100;
						wp->flags &= ~2;
						break;
				}
				wp->unkD8++;
			}
			else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
				wp->result = CARDGetResultCode(wp->chan);
				wp->flags &= ~1;
			}
			break;

		case 8:
		default:
			break;
	}
}
#pragma opt_propagation on

void cardCopy2Main(s32 slot) {
    void* backup2;
    u32 backup3;
    CardSaveSlot* save;
    void* backup1;
    s32 backup4;
    s32 backup5;
    s32 backup6;

    save = &wp->data->saves[slot];
    backup1 = gp->fbatData;
    backup2 = gp->mapAlloc;
    backup3 = (u32)(gp->flags & 8);
    backup4 = gp->unk1274;
    backup5 = gp->unk1294;
    backup6 = gp->unk11B8;
    memcpy(gp, &save->data.global, sizeof(GlobalWork));
    gp->fbatData = backup1;
    memcpy(pouchGetPtr(), &save->data.pouch, sizeof(PouchData));
    memcpy(fbatGetPointer()->deadInfo, save->data.deadInfo, sizeof(NpcDeadInfo) * 64);
    memcpy(bdsw, &save->data.badgeShop, sizeof(BadgeShopWork));
    memcpy(yuwp, &save->data.parlor, sizeof(PiantaParlorWork));
    memcpy(&_jdt.unk14, &save->data.informant, sizeof(InformantUnknown));
    gp->resetType = 0;
    gp->unk127C = 0;
    gp->dvdError = 0;
    gp->retraceTime = OSGetTime();
    strcpy(gp->currentAreaName, "123");
    gp->relocationBase = NULL;
    gp->unk1274 = backup4;
    gp->unk1294 = backup5;
    gp->unk11B8 = backup6;
    gp->mapAlloc = backup2;
    gp->unk8 = 0;
    gp->unkC = 0;
    if (backup3 != 0) {
        gp->flags |= 8;
    }
    else {
        gp->flags &= ~8;
    }
}

void cardErase(s32 slotNo) {
    CardSaveSlot* save;

    if (!(wp->flags & 2)) {
        wp->unkE0 = 1;
        wp->currSlot = slotNo;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x300;
        wp->flags |= 0x800;
        save = wp->unkB0;
        memset(save, 0, sizeof(save->data));
        save->data.flags |= 1;
        check_sum(save);
    }
}

void cardCopy(s32 from, s32 to) {
    if (!(wp->flags & 2)) {
        wp->unkE0 = 1;
        wp->currSlot = to;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x300;
        wp->flags |= 0x800;
        memcpy(wp->unkB0, &wp->data->saves[from], sizeof(CardSaveSlot));
    }
}

void cardWrite(s32 slot) {
    CardSaveSlot* save;
    MarioWork* mario;
    PartyEntry* party;
    s8 partyId;

    if (!(wp->flags & 2)) {
        wp->unkE0 = 1;
        wp->currSlot = slot;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x300;
        wp->flags &= ~0x800;
        save = &wp->data->saves[slot];
        mario = marioGetPtr();
        memset(save, 0, sizeof(CardSaveSlot));
        gp->savePlayerPos = mario->position;
        party = partyGetPtr(marioGetPartyId());
        if (party != NULL) {
            partyId = party->currentMemberId;
        } else {
            partyId = mario->prevPartyMemberId[0];
        }
        gp->savePartyId[0] = partyId;
        party = partyGetPtr(marioGetExtraPartyId());
        if (party != NULL) {
            partyId = party->currentMemberId;
        } else {
            partyId = mario->prevPartyMemberId[1];
        }
        gp->savePartyId[1] = partyId;
        gp->saveTime = OSGetTime();
        gp->saveCount++;
        gp->flags &= ~1;
        gp->flags &= ~2;
        gp->resetType = 0;
        gp->dvdError = 0;
        memcpy(&save->data.global, gp, sizeof(GlobalWork));
        memcpy(&save->data.pouch, pouchGetPtr(), sizeof(PouchData));
        memcpy(save->data.deadInfo, fbatGetPointer()->deadInfo, sizeof(save->data.deadInfo));
        memcpy(&save->data.badgeShop, bdsw, sizeof(BadgeShopWork));
        memcpy(&save->data.parlor, yuwp, sizeof(PiantaParlorWork));
        memcpy(&save->data.informant, &_jdt.unk14, sizeof(_jdt.unk14));
        save->data.flags &= ~1;
        save->data.flags &= ~2;
        check_sum(save);
    }
}

#pragma opt_propagation on //needed for memcard_probe? TODO fix
void write_main(void) {
    if (wp->result) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            case 1:
                memcard_mount();
                break;
            case 2:
                memcard_check();
                break;
            case 3:
                memcard_open();
                break;
            case 4:
                memcard_read(wp->unkAC, sizeof(CardMetadata), 0);
                break;
            case 5:
                if (!headerCheck()) {
                    make_header();
                    memcard_write(wp->data, sizeof(CardMetadata), 0);
                }
                break;
            case 6:
                memcard_read(wp->unkAC, sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->currSlot * sizeof(CardSaveSlot))));
                break;
            case 7:
                wp->validSave1 = dataCheck();
                break;
            case 8:
                memcard_read(wp->unkAC, sizeof(CardSaveSlot), (s32)(sizeof(CardData) + (wp->currSlot * sizeof(CardSaveSlot))));
                break;
            case 9:
                wp->validSave2 = dataCheck();
                break;
            case 10:
                if (wp->validSave1 && !wp->validSave2) {
                    wp->unkBC = 1;
                    wp->unkC0 = 0;
                } else {
                    wp->unkBC = 0;
                    wp->unkC0 = 1;
                }
                if (wp->flags & 0x800) {
                    memcard_write(wp->unkB0, sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->currSlot * sizeof(CardSaveSlot)) + (wp->unkBC * (sizeof(CardSaveSlot) * 4))));
                } else {
                    memcard_write(&wp->data->saves[wp->currSlot], sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->currSlot * sizeof(CardSaveSlot)) + (wp->unkBC * (sizeof(CardSaveSlot) * 4))));
                }
                break;
            case 11:
                if (wp->flags & 0x800) {
                    memcard_write(wp->unkB0, sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->currSlot * sizeof(CardSaveSlot)) + (wp->unkC0 * (sizeof(CardSaveSlot) * 4))));
                } else {
                    memcard_write(&wp->data->saves[wp->currSlot], sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->currSlot * sizeof(CardSaveSlot)) + (wp->unkC0 * (sizeof(CardSaveSlot) * 4))));
                }
                break;
            case 12:
                memcard_get_serial();
                break;
            case 13:
                memcard_close();
                break;
            case 14:
                memcard_unmount();
                break;
            case 15:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags |= 0x2000;
                wp->flags &= ~2;
                if (wp->flags & 0x800) {
                    wp->flags &= ~0x800;
                    memcpy(&wp->data->saves[wp->currSlot], wp->unkB0, sizeof(CardSaveSlot));
                }
                break;
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}
#pragma opt_propagation on

void cardWriteHeader(void) {
    if (!(wp->flags & 2)) {
        wp->unkE0 = 2;
        wp->currSlot = 0;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x300;
        wp->flags &= ~0x800;
        make_header();
    }
}

#pragma opt_propagation off
void write_header_main(void) {
    if (wp->result) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            case 1:
                memcard_mount();
                break;
            case 2:
                memcard_check();
                break;
            case 3:
                memcard_open();
                break;
            case 4:
                memcard_write(wp->data, sizeof(CardMetadata), 0);
                break;
            case 5:
                memcard_get_serial();
                break;
            case 6:
                memcard_close();
                break;
            case 7:
                memcard_unmount();
                break;
            case 8:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags |= 0x2000;
                wp->flags &= ~2;
                break;
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}
#pragma opt_propagation on

#pragma opt_propagation on //needed for memcard_probe? TODO fix
void read_main(void) {
    s32 saveType; //invalid = -1, main = 0, backup = 1

    if (wp->result) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            case 1:
                memcard_mount();
                break;
            case 2:
                memcard_check();
                break;
            case 3:
                memcard_open();
                break;
            case 4:
                memcard_read(wp->unkAC, sizeof(CardMetadata), 0);
                break;
            case 5:
                if (!headerCheck()) {
                    wp->flags |= 0x400;
                }
                break;
            case 6:
                memcard_read(wp->unkAC, 0x4000, (s32)((wp->unkA4 * sizeof(CardSaveSlot)) + sizeof(CardMetadata)));
                break;
            case 7:
                wp->validSave1 = dataCheck();
                wp->lastSaveTime1 = ((CardSaveSlot*)wp->unkAC)->data.global.saveTime;
                break;
            case 8:
                memcard_read(wp->unkAC, 0x4000, (s32)((wp->unkA4 * sizeof(CardSaveSlot)) + sizeof(CardData)));
                break;
            case 9:
                wp->validSave2 = dataCheck();
                wp->lastSaveTime2 = ((CardSaveSlot*)wp->unkAC)->data.global.saveTime;
                break;
            case 10:
                if (wp->validSave1 != 0 && wp->validSave2 != 0) {
                    if (!(wp->lastSaveTime1 <= wp->lastSaveTime2)) {
                        saveType = 0;
                    }
                    else {
                        saveType = 1;
                    }
                } else if (wp->validSave1 == 0 && wp->validSave2 != 0) {
                    saveType = 1;
                } else if (wp->validSave1 != 0 && wp->validSave2 == 0) {
                    saveType = 0;
                } else {
                    saveType = -1;
                }
                if (saveType != -1) {
                    memcard_read(&wp->data->saves[wp->unkA4], sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->unkA4 * sizeof(CardSaveSlot)) + (saveType * (sizeof(CardSaveSlot) * 4))));
                } else {
                    wp->data->saves[wp->unkA4].data.flags |= 2;
                }
                break;
            case 11:
                memcard_get_serial();
                break;
            case 12:
                memcard_close();
                break;
            case 13:
                memcard_unmount();
                break;
            case 14:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags |= 0x2000;
                wp->flags &= ~2;
                break;
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}
#pragma opt_propagation on

void cardReadAll(void) {
    if (!(wp->flags & 2)) {
        wp->unkE0 = 4;
        wp->unkA4 = 0;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x700;
        wp->flags &= ~0x2000;
    }
}

#pragma opt_propagation on //needed for memcard_probe? TODO fix
void read_all_main(void) {
    s32 saveType; //invalid = -1, main = 0, backup = 1

    if (wp->result) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
        return;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            case 1:
                memcard_mount();
                break;
            case 2:
                memcard_check();
                break;
            case 3:
                memcard_open();
                break;
            case 4:
                memcard_read(wp->data, 0x2000, 0);
                break;
            case 5:
                if (!headerCheck2()) {
                    make_header();
                    wp->flags |= 0x400;
                }
                gp->unk1274 = wp->data->metadata.data.unk1E42;
                gp->unk1294 = wp->data->metadata.data.unk1E40;
                gp->unk11B8 = wp->data->metadata.data.unk1E44;
                break;
            case 6:
                memcard_read(wp->unkAC, 0x4000, (wp->unkA4 << 0xE) + 0x2000);
                break;
            case 7:
                wp->validSave1 = dataCheck();
                wp->lastSaveTime1 = ((CardSaveSlot*)wp->unkAC)->data.global.saveTime;
                break;
            case 8:
                memcard_read(wp->unkAC, 0x4000, (wp->unkA4 << 0xE) + 0x12000);
                break;
            case 9:
                wp->validSave2 = dataCheck();
                wp->lastSaveTime2 = ((CardSaveSlot*)wp->unkAC)->data.global.saveTime;
                break;
            case 10:
                if (wp->validSave1 != 0 && wp->validSave2 != 0) {
                    if (!(wp->lastSaveTime1 <= wp->lastSaveTime2)) {
                        saveType = 0;
                    }
                    else {
                        saveType = 1;
                    }
                } else if (wp->validSave1 == 0 && wp->validSave2 != 0) {
                    saveType = 1;
                } else if (wp->validSave1 != 0 && wp->validSave2 == 0) {
                    saveType = 0;
                } else {
                    saveType = -1;
                }
                if (saveType != -1) {
                    memcard_read(&wp->data->saves[wp->unkA4], sizeof(CardSaveSlot), (s32)(sizeof(CardMetadata) + (wp->unkA4 * sizeof(CardSaveSlot)) + (saveType * (sizeof(CardSaveSlot) * 4))));
                } else {
                    wp->data->saves[wp->unkA4].data.flags |= 2;
                }
                wp->unkA4++;
                if (wp->unkA4 < 4) {
                    wp->unkD8 = 3;
                }
                break;
            case 11:
                memcard_get_serial();
                break;
            case 12:
                memcard_close();
                break;
            case 13:
                memcard_unmount();
                break;
            case 14:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags |= 0x2000;
                wp->flags &= ~2;
                break;
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}
#pragma opt_propagation on

void cardCreate(void) {
    if (!(wp->flags & 2)) {
        wp->unkE0 = 5;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x700;
        wp->flags &= ~0x2000;
        wp->flags &= ~0x800;
    }
}

#pragma opt_propagation on //needed for memcard_probe? TODO fix
void create_main(void) {
    if (wp->result) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            case 1:
                memcard_mount();
                break;
            case 2:
                memcard_check();
                break;
            case 3:
                memcard_delete();
                break;
            case 4:
                memcard_create();
                break;
            case 5:
                make_header();
                make_data();
                memcard_write(wp->data, 0x12000, 0);
                break;
            case 6:
                memcard_write(wp->data->saves, 0x10000, 0x12000);
                break;
            case 7:
                memcard_get_stat();
                break;
            case 8:
                CARDSetCommentAddress(&wp->status,  0);
                CARDSetIconAddress(&wp->status, 0x40);
                CARDSetBannerFormat(&wp->status, CARD_STAT_BANNER_RGB5A3);
                CARDSetIconAnim(&wp->status, CARD_STAT_ANIM_LOOP);
                CARDSetIconFormat(&wp->status, 0, CARD_STAT_ICON_C8);
                CARDSetIconSpeed(&wp->status, 0, CARD_STAT_SPEED_MIDDLE);
                CARDSetIconFormat(&wp->status, 1, CARD_STAT_ICON_NONE);
                CARDSetIconSpeed(&wp->status, 1, CARD_STAT_SPEED_END);
                break;
            case 9:
                memcard_set_stat();
                break;
            case 10:
                memcard_get_serial();
                break;
            case 11:
                memcard_close();
                break;
            case 12:
                memcard_unmount();
                break;
            case 13:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags |= 0x2000;
                wp->flags &= ~2;
                break;
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}
#pragma opt_propagation on

void cardFormat(void) {
    if (!(wp->flags & 2)) {
        wp->unkE0 = 6;
        wp->unkD8 = 0;
        wp->result = 0;
        wp->flags |= 2;
        wp->flags &= ~0x700;
        wp->flags &= ~0x2000;
    }
}

void format_main(void) {
    if (wp->result != CARD_RESULT_READY) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            
            case 1:
                memcard_mount();
                break;
            
            case 2:
                memcard_format();
                break;
            
            case 3:
                memcard_unmount();
                break;
            
            case 4:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags &= ~2;
                break;
            
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}

void delete_main(void) {
    if (wp->result != CARD_RESULT_READY) {
        wp->unkE0 = 8;
        wp->flags |= 0x200;
        wp->flags &= ~2;
    }
    else if (!(wp->flags & 1)) {
        switch (wp->unkD8) {
            case 0:
                memcard_probe();
                break;
            
            case 1:
                memcard_mount();
                break;
            
            case 2:
                memcard_check();
                break;
            
            case 3:
                memcard_delete();
                break;
            
            case 4:
                memcard_unmount();
                break;
            
            case 5:
                wp->unkE0 = 0;
                wp->flags |= 0x100;
                wp->flags &= ~2;
                break;
            
        }
        wp->unkD8++;
    }
    else if (CARDGetResultCode(wp->chan) != CARD_RESULT_BUSY && wp->result != CARDGetResultCode(wp->chan)) {
        wp->result = CARDGetResultCode(wp->chan);
        wp->flags &= ~1;
    }
}

void check_sum(CardSaveSlot* save) {
    s32 i;
    u8* temp;
    u32 checksum;
    
    strcpy(save->version, version);
    save->size = sizeof(save->data);
    save->checksum1 = (checksum = 0u);
    save->checksum2 = ~0u;
    
    temp = (u8*)&save->data;
    for (i = 0; i < (s32)sizeof(save->data); i++) {
        checksum += temp[i];
    }
    save->checksum1 = checksum;
    save->checksum2 = ~save->checksum1;
}

BOOL headerCheck(void) {
    s32 i;
    s32 checksum;
    u8* temp;
    CardMetadata* metadata;

    metadata = wp->unkAC;
    if (metadata->checksum2 != ~metadata->checksum1) {
        return FALSE;
    } else {
        checksum = 0;
        temp = (u8*)&metadata->data;
        for (i = 0; i < (s32)sizeof(metadata->data); i++) {
            checksum += temp[i];
        }
        if (metadata->checksum1 != checksum) {
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

BOOL headerCheck2(void) {
    s32 i;
    s32 checksum;
    u8* temp;
    CardMetadata* metadata;

    metadata = &wp->data->metadata;
    if (metadata->checksum2 != ~metadata->checksum1) {
        return FALSE;
    } else {
        checksum = 0;
        temp = (u8*)&metadata->data;
        for (i = 0; i < (s32)sizeof(metadata->data); i++) {
            checksum += temp[i];
        }
        if (metadata->checksum1 != checksum) {
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

BOOL dataCheck(void) {
    s32 i;
    u32 checksum;
    u8* temp;
    CardSaveSlot* save;

    save = wp->unkAC;
    if (save->size != sizeof(save->data)) {
        return FALSE;
    } else if (strcmp(save->version, version)) {
        return FALSE;
    } else if (save->checksum2 != ~save->checksum1) {
        return FALSE;
    } else {
        checksum = 0;
        temp = (u8*)&save->data;
        for (i = 0; i < (s32)sizeof(save->data); i++) {
            checksum += temp[i];
        }
        if (save->checksum1 != checksum) {
            return FALSE;
        } else {
            return TRUE;
        }
    }
}

void make_header(void) {
	CardMetadata* metadata;
	s32 i;
	u8* temp;
	u32 checksum;
	OSCalendarTime td;

	metadata = &cardGetFilePtr()->metadata;
	memset(metadata, 0, sizeof(metadata->data));
	strcpy(metadata->data.fileName, "ペーパーマリオＲＰＧ");
	OSTicksToCalendarTime(OSGetTime(), &td);
	sprintf(metadata->data.dateString, "%2d月%2d日のセーブデータです", td.mon + 1, td.mday);
	memcpy(metadata->data.bannerTex, _mariost_banner_tex, sizeof(metadata->data.bannerTex));
	memcpy(metadata->data.iconTex, _mariost_icon_tex, sizeof(metadata->data.iconTex));
	memcpy(metadata->data.iconTlut, _mariost_icon_tlut, sizeof(metadata->data.iconTlut));
	metadata->data.unk1E40 = (gp->unk1294 != 0);
	metadata->data.unk1E42 = (u16)gp->unk1274;
	metadata->data.unk1E44 = (u16)gp->unk11B8;
	metadata->checksum1 = (checksum = 0u);
	metadata->checksum2 = ~0u;

	temp = (u8*)&metadata->data;
	for (i = 0; i < (s32)sizeof(metadata->data); i++) {
		checksum += temp[i];
	}
	metadata->checksum1 = checksum;
	metadata->checksum2 = ~metadata->checksum1;
}

void make_data(void) {
    CardSaveSlot* save;
    s32 i;
    
    for (i = 0; i < 4; i++) {
        if (i != -1) {
            save = &cardGetFilePtr()->saves[i];
        }
        else {
            save = wp->unkB0;
        }
        memset(save, 0, sizeof(save->data));
        save->data.flags |= 1;
        check_sum(save);
    }
}

#pragma opt_propagation off
void memcard_probe(void) {
    s32 memSize, sectorSize;
    s32 result;
    s32 i;
    s32 timeout;
    
    wp->flags |= 1;

    i = 0;
    timeout = 1000000;
    while (result = CARDProbeEx(0, &memSize, &sectorSize), result == CARD_RESULT_BUSY) {
        if (++i > timeout) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }

    if (result == CARD_RESULT_READY && sectorSize != 0x2000) {
        result = CARD_RESULT_WRONGDEVICE;
    }
    if (result == CARD_RESULT_READY) {
        wp->result = CARD_RESULT_READY;
        wp->chan = 0;
    }
    else if (result == CARD_RESULT_WRONGDEVICE) {
        wp->result = CARD_RESULT_WRONGDEVICE;
        wp->chan = 0;
    }
    else {
        wp->result = result;
        wp->chan = -1;
    }
    wp->flags &= ~1;
}
#pragma opt_propagation on

void mountDetachCallback(s32 chan, s32 result) {
	; //stubbed in retail
}

void mountAttachCallback(s32 chan, s32 result) {
    wp->result = result;
    if (result == CARD_RESULT_BROKEN || result == CARD_RESULT_ENCODING) {
        wp->result = CARD_RESULT_READY;
    }
    wp->flags &= ~1;
}

void memcard_mount(void) {
    CARDSetFastMode(TRUE);
    wp->flags |= 1;
    CARDMountAsync(wp->chan, wp->workArea, mountDetachCallback, mountAttachCallback);
}

void memcard_unmount(void) {
    s32 result;
    s32 i;
    
    wp->flags |= 1;
    i = 0;
    while (result = CARDUnmount(wp->chan), result == CARD_RESULT_BUSY) {
        if (++i > 1000000) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }
    wp->result = result;
    wp->flags &= ~1;
}

void checkCallback(s32 chan, s32 result) {
	wp->result = result;
	wp->flags &= ~1;
}

void memcard_check(void) {
    wp->flags |= 1;
    CARDCheckAsync(wp->chan, checkCallback);
}

void formatCallback(s32 chan, s32 result) {
	wp->result = result;
	wp->flags &= ~1;
}

void memcard_format(void) {
    wp->flags |= 1;
    CARDFormatAsync(wp->chan, formatCallback);
}

void memcard_delete(void) {
    s32 result;
    s32 i;
    
    wp->flags |= 1;
    
    i = 0;
    while (result = CARDDelete(wp->chan, "mariost_save_file"), result == CARD_RESULT_BUSY) {
        if (++i > 1000000) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }
    
    if (result == CARD_RESULT_NOFILE) {
        result = CARD_RESULT_READY;
    }
    wp->result = result;
    wp->flags &= ~1;
}

void createCallback(s32 chan, s32 result) {
	wp->result = result;
	wp->flags &= ~1;
}

void memcard_create(void) {
    wp->flags |= 1;
    CARDCreateAsync(wp->chan, "mariost_save_file", sizeof(CardData) + (sizeof(CardSaveSlot) * 4), &wp->info, createCallback);
}

void writeCallback(s32 chan, s32 result) {
	wp->result = result;
	wp->flags &= ~1;
}

void memcard_write(void* addr, s32 length, s32 offset) {
    wp->flags |= 1;
    CARDWriteAsync(&wp->info, addr, length, offset, writeCallback);
}

void readCallback(s32 chan, s32 result) {
	wp->result = result;
	wp->flags &= ~1;
}

void memcard_read(void* addr, s32 length, s32 offset) {
    wp->flags |= 1;
    CARDReadAsync(&wp->info, addr, length, offset, readCallback);
}

void statusCallback(s32 chan, s32 result) {
	wp->result = result;
	wp->flags &= ~1;
}

void memcard_set_stat(void) {
    wp->flags |= 1;
    CARDSetStatusAsync(wp->chan, wp->info.fileNo, &wp->status, statusCallback);
}

void memcard_get_stat(void) {
    s32 result;
    s32 i;
    
    wp->flags |= 1;
    
    i = 0;
    while (result = CARDGetStatus(wp->chan, wp->info.fileNo, &wp->status), result == CARD_RESULT_BUSY) {
        if (++i > 1000000) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }
    wp->result = result;
    wp->flags &= ~1;
}

void memcard_get_serial(void) {
    s32 result;
    s32 i;

    wp->flags |= 1;

    i = 0;
    while (result = CARDGetSerialNo(wp->chan, &wp->serialNo), result == CARD_RESULT_BUSY) {
        if (++i > 1000000) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }

    wp->result = result;
    wp->flags &= ~1;
}

void memcard_open(void) {
    CARDStat stat;
    u64 serialNo;
    s32 byteNotUsed;
    s32 filesNotUsed;
    s32 i;
    s32 fileNo;
    s32 result;

    serialNo = 0;
    wp->flags |= 1;
    if (wp->flags & 0x2000) {
        i = 0;
        while (result = CARDGetSerialNo(wp->chan, &serialNo), result == -1) {
            if (++i > 1000000) {
                result = CARD_RESULT_FATAL_ERROR;
                break;
            }
        }
        if (result != 0) {
            wp->result = result;
            wp->flags &= ~1;
            return;
        }
        if (serialNo != wp->serialNo) {
            wp->result = CARD_RESULT_NOPERM;
            wp->flags &= ~1;
            return;
        }
    }
    for (fileNo = 0; fileNo < 127; fileNo++) {
        i = 0;
        while (result = CARDGetStatus(wp->chan, fileNo, &stat), result == CARD_RESULT_BUSY) {
            if (++i > 1000000) {
                result = CARD_RESULT_FATAL_ERROR;
                break;
            }
        }
        if ((result != CARD_RESULT_NOFILE) && (result != CARD_RESULT_NOPERM)) {
            if (result == CARD_RESULT_READY) {
                if (!strcmp(stat.fileName, "mariost_save_file")) {
                    if ((stat.commentAddr == 0) && (stat.iconAddr == 0x40) && (stat.length == 0x22000)) {
                        wp->fileNo = fileNo;
                        break;
                    }
                    else {
                        wp->fileNo = fileNo;
                        wp->result = CARD_RESULT_NOFILE;
                        wp->flags &= ~1;
                        return;
                    }
                }
            }
            else {
                if ((result == CARD_RESULT_FATAL_ERROR) || (result == CARD_RESULT_NOCARD)) {
                    wp->result = result;
                    wp->flags &= ~1;
                    return;
                }
            }
        }
    }
    if (fileNo >= 127) {
        i = 0;
        while (result = CARDFreeBlocks(wp->chan, &byteNotUsed, &filesNotUsed), result == CARD_RESULT_BUSY) {
            if (++i > 1000000) {
                result = CARD_RESULT_FATAL_ERROR;
                break;
            }
        }
        if (result != 0) {
            wp->result = result;
            wp->flags &= ~1;
            return;
        }
        if (byteNotUsed < 0x22000) {
            wp->result = CARD_RESULT_INSSPACE;
            wp->flags &= ~1;
            return;
        }
        if (filesNotUsed < 1) {
            wp->result = CARD_RESULT_NOENT;
            wp->flags &= ~1;
            return;
        }
        wp->result = -4;
        wp->flags &= ~1;
        return;
    }
    i = 0;
    while (result = CARDOpen(wp->chan, "mariost_save_file", &wp->info), result == CARD_RESULT_BUSY) {
        if (++i > 1000000) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }
    wp->result = result;
    wp->flags &= ~1;
}

void memcard_close(void) {
    s32 result;
    s32 i;

    wp->flags |= 1;

    i = 0;
    while (result = CARDClose(&wp->info), result == CARD_RESULT_BUSY) {
        if (++i > 1000000) {
            result = CARD_RESULT_FATAL_ERROR;
            break;
        }
    }

    wp->result = result;
    wp->flags &= ~1;
}
