#include "driver/msgdrv.h"
#include "driver/animdrv.h"
#include "driver/camdrv.h"
#include "driver/windowdrv.h"
#include "manager/dvdmgr.h"
#include "manager/fontmgr.h"
#include "mario/mariost.h"
#include "memory.h"
#include "system.h"
#include <string.h>
#include <stdlib.h>

extern GlobalWork* gp;
extern int sprintf(char* str, const char* format, ...);

typedef struct MsgLookupEntry {
	u32 startaddr; //0x0
	u32 endaddr; //0x4
} MsgLookupEntry;

typedef struct MsgIcon {
	const char* name; //0x0
	s32 value; //0x4
} MsgIcon;

//.data
MsgIcon msgIcon[] = {
	{"PAD_A", 0x64},
	{"PAD_B", 0x66},
	{"STICK_LEFT", 0x78},
	{"STICK", 0x79},
	{"AC_ON", 0x95},
	{"BUTTON_L", 0x7E},
	{"BUTTON_R", 0x80},
	{"HM", 0x19F},
	{"PAD_X", 0x68},
	{"PAD_X_ON", 0x69},
	{"PAD_Y", 0x6A},
	{"PAD_Y_ON", 0x6B},
	{"PAD_Z_OFF", 0x82},
	{"PAD_ST_OFF", 0x84},
	{"black_key", 0x130},
	{"ANM_PAD_A", 0x20B},
	{"ANM_STICK_RIGHT", 0x20C},
	{"ANM_PAD_START", 0x20D}
};

//.sbss
u16 active; //TODO: re-type
void* msgSortDvdData; //TODO: re-type
BOOL msgSEflag; //msgSEInit and related functions are unused
MessageWork msgWork;

//.sdata
MessageWork* msgw = &msgWork;
const char* ErrMessage[2] = {
	"<col ff0000ff>\x83\x81\x83\x62\x83\x5A\x81\x5B\x83\x57\x82\xAA\x82\xA0\x82\xE8\x82\xDC\x82\xB9\x82\xF1</col>\n<key>", /*"メッセージがありません"*/
	"<col ff0000ff>No messages.<col>\n<key>"
};
const char* paperPoseTbl[6] = {
	"PM_Y_1B", "PM_Y_2B", "PM_F_1B",
	"PM_F_3B", "PM_C_1B", "PM_C_2B"
};
const char* language_dir[2] = {"msg", "emsg"};





//local prototypes
int msg_compare(const void* a, const void* b);
void msgDispKeyWait_render(s32 wXluStage);

void msgInit(void) {
	msgw->poseId = animPoseEntry("hoshi_2", 2);
	animPoseSetAnim(msgw->poseId, "HOS_C_1", TRUE);
	animPoseSetMaterialFlagOn(msgw->poseId, 0x1800);
	animPoseSetMaterialFlagOff(msgw->poseId, 0x40);
	animPoseSetGXFunc(msgw->poseId, msgDispKeyWait_render, 0);
	msgw->entries[0].address = NULL;
	msgw->entries[0].lookup = NULL;
	msgw->entries[1].address = NULL;
	msgw->entries[1].lookup = NULL;
	msgLoad("global", 1);
}

void msgLoad(const char* filename, s32 index) {
	MessageEntry* entry;
	DVDEntry* dvd;
	char* msgptr;
	s32 msgcount;
	char filepath[64];
	char dvdpath[128]; //TODO: double check size
	int i;
	u32 r27, r30;
	MsgLookupEntry* lookup;

	entry = &msgw->entries[index];
	sprintf(filepath, "./%s/%s.txt", language_dir[gp->language], filename);
	
	if (entry->address) {
		if (index == 1) {
			__memFree(HEAP_DEFAULT, entry->address);
		}
		entry->address = NULL;
	}
	entry->length = 0;

	if (!entry->address) {
		sprintf(dvdpath, "%s/%s", getMarioStDvdRoot(), filepath);
		dvd = DVDMgrOpen(dvdpath, 2, 0);
		if (dvd) {
			entry->length = DVDMgrGetLength(dvd);
			switch (index) {
				case 0:
					entry->address = _mapAlloc(OSRoundUp32B(entry->length));
					break;
				case 1:
					entry->address = __memAlloc(HEAP_DEFAULT, OSRoundUp32B(entry->length));
					break;
			}
			DVDMgrRead(dvd, entry->address, OSRoundUp32B(entry->length), 0);
			DVDMgrClose(dvd);
		}
	}

	if (entry->address) {
		msgptr = entry->address;
		msgcount = 0;
		while (*msgptr) {
			msgcount++;
			msgptr += strlen(msgptr) + 1;
		}
		entry->count = (u32)(msgcount / 2); //tag, message
	}
	else {
		entry->length = 0;
		entry->count = 0;
	}

	if (entry->count) {
		r27 = 0;
		entry->lookup = smartAlloc(entry->count * sizeof(MsgLookupEntry), 0);
		r30 = (u32)entry->address;
		lookup = entry->lookup->address;
		for (i = 0; i < entry->count; i++) {
			lookup->startaddr = r27;
			r27 += strlen((const char*)r30) + 1;
			r30 += strlen((const char*)r30) + 1;
			lookup->endaddr = r27;
			r27 += strlen((const char*)r30) + 1;
			r30 += strlen((const char*)r30) + 1;
			lookup++;
		}
		msgSortDvdData = entry->address;
		qsort(entry->lookup->address, entry->count, sizeof(MsgLookupEntry), msg_compare);
	}
	else {
		entry->lookup = NULL;
	}
}

//s32 msgMain(void* somearray)
//BOOL msgDisp(unused r3, r4, f32 f1, f32 f2)

void msgDispKeyWait_render(s32 wXluStage) {

}

//void msgAnalize(void* sameasmsgmain)

MessageWork* msgGetWork(void) {
	return &msgWork;
}

int msg_compare(const void* a, const void* b) {
	return 0;
}

const char* msgSearch(const char* tag) { //1:1
	MessageEntry* entry;
	MsgLookupEntry* lookup;
	smartEntry* smart;
	u32 i, max, j, index;
	s32 result;

	for (i = 0; i < 2; i++) { //check both entries
		entry = &msgw->entries[i];
		smart = entry->lookup;
		if (smart) {
			lookup = smart->address;
			j = 0;
			max = entry->count;
			while (max >= j) {
				index = (u32)((s32)(j + max) / 2); //tag, message
				if (index >= entry->count) {
					break;
				}
				result = strcmp(tag, (const char*)((u32)entry->address + lookup[index].startaddr));
				if (!result) {
					return (const char*)((u32)entry->address + lookup[index].endaddr);
				}
				if (result < 0) {
					max = index - 1;
				}
				else {
					j = index + 1;
				}
			}
		}
	}
	return ErrMessage[gp->language];
}

BOOL _ismbblead(u32 a1) {
	u8 check = (u8)a1;
	if ((check >= 0x81 && check <= 0x9F) || (check >= 0xE0 && check <= 0xFC)) {
		return TRUE;
	}
	return FALSE;
}










BOOL msgDisp(smartEntry* smart, u8 alpha, f32 x, f32 y) {

}


void msgWindow_Disp(CameraId camId, void* param) {
	WindowEntry* window = param; //cast to correct type
	CameraEntry* camera = camGetCurPtr();
	s32 type;

	GXSetFog(GX_FOG_NONE, 0.0f, 0.0f, 0.0f, 0.0f, (GXColor){0, 0, 0, 0});
	type = window->type;

	switch (type) {
	case 0:
	case 1:
	case 6:
	case 8:
	case 9:
		break;
	}

}

void msgAnalize(smartEntry* smart, char* msg) {
	MessageData* data;
	MsgDataEntry* entry;
	WindowEntry* window;
	s32 smth_7A30;
	char check;
	BOOL checkkanji;
	u16 glyph, width;
	u32 r23;

	data = smart->address;
	window = data->window;
	r23 = 0;
	//r1+0x50 = 1.0f;
	entry = &data->entries[data->entryId];
	if (window->type < 0) {
		window->type = 0;
	}
	smth_7A30 = data->field_0x7A30;
	//s16 r1+0x234 = 0;
	//s16 r1+0x232 = 0;
	//s16 r1+0x230 = 0;
	//s32 r1+0x54 = 0;
	switch (window->type) {
	case 3:
	case 8:
		switch (window->type) {
		case 3:
			entry->field_0x0 = 0xDCC8DCFF; //(GXColor){0xDC, 0xC8, 0xDC, 0xFF};
			break;
		case 8:
			entry->field_0x0 = 0x00D914FF;//(GXColor){0x00, 0xD9, 0x14, 0xFF};
			break;
		}
		entry->glyph = 0xFFF7;
		entry->field_0xC = smth_7A30;
		entry++; //next entry
		data->entryId++; //next entry
		break;

	default:
		break;
	}

	check = *msg;
	if ((check < 0x81 && check <= 0x9F) || (check < 0xE0 && check > 0xFC)) {
		checkkanji = TRUE;
	}
	else {
		checkkanji = FALSE;
	}
	if (checkkanji) {
		glyph = kanjiSearch(*(u16*)msg);
		width = kanjiGetWidth(glyph);
		entry->glyph = glyph;


		entry->field_0x0 = r23;
	}
}


s32 msgIconStr2ID(const char* str) {
	MsgIcon* icon;
	int i;

	icon = msgIcon;
	for (i = 0; i < 18; i++, icon++) {
		if (!strcmp(icon->name, str)) {
			return msgIcon[i].value;
		}
	}
	return -1;
}







void selectWindow_Disp(CameraId camId, void* param) {
	WindowEntry* window = param; //cast to correct type
}
