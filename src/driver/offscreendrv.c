#include "driver/offscreendrv.h"
#include "driver/camdrv.h"
#include "driver/dispdrv.h"
#include "sdk/DEMOInit.h"
#include "mario/mariost.h"
#include "memory.h"
#include <string.h>

extern GlobalWork* gp;

//.sbss
static OffscreenWork work[2]; //field, battle

#define offscreenGetWork(inBattle) ((inBattle) ? &work[1] : &work[0])
#define offscreenGetWorkGp() (gp->inBattle ? &work[1] : &work[0])

//local prototypes
void offscreenDisp(CameraId camId, void* param);

void offscreenInit(void) { //TODO: fix r31
	work[0].count = 10;
	work[0].entries = __memAlloc(HEAP_DEFAULT, work[0].count * sizeof(OffscreenEntry));
	memset(work[0].entries, 0, work[0].count * sizeof(OffscreenEntry));
	work[1].count = 10;
	work[1].entries = __memAlloc(HEAP_DEFAULT, work[1].count * sizeof(OffscreenEntry));
	memset(work[1].entries, 0, work[0].count * sizeof(OffscreenEntry));
}

void offscreenReset(BOOL inBattle) { //1:1
	OffscreenWork* wp = offscreenGetWork(inBattle);
	memset(wp->entries, 0, wp->count * sizeof(OffscreenEntry));
}

s32 offscreenEntry(const char* name) { //1:1, needs variable names
	OffscreenWork* wp = offscreenGetWorkGp();
	int i, count;
	OffscreenEntry* entry;

	//check if already created
	for (i = 0, count = wp->count, entry = wp->entries; i < count; i++, entry++) {
		if (entry->flags & 1 && !strcmp(entry->name, name)) {
			break;
		}
	}

	//find new slot
	for (i = 0, entry = wp->entries; i < count; i++, entry++) {
		if (!(entry->flags & 1)) break;
	}

	entry->flags = 1;
	strcpy(entry->name, name);
	entry->currLeft = 1020;
	entry->currTop = 1020;
	entry->currRight = 2;
	entry->currBottom = 2;
	entry->prevLeft = 1020;
	entry->prevTop = 2;
	entry->prevRight = 2;
	entry->prevBottom = 2;
	entry->unk3C = 5;
	entry->unk40 = 5;
	return i;
}

void offscreenDisp(CameraId camId, void* param) {
	//param is null

}

void offscreenMain(void) { //1:1, need variable names
	OffscreenWork* wp = offscreenGetWorkGp();
	int i, count;
	OffscreenEntry* entry;

	for (i = 0, count = wp->count, entry = wp->entries; i < count; i++, entry++) {
		if (entry->flags & 1) {
			entry->flags &= ~2;
			entry->flags &= ~4;
			entry->prevLeft = entry->currLeft;
			entry->prevTop = entry->currTop;
			entry->prevRight = entry->currRight;
			entry->prevBottom = entry->currBottom;
			entry->currLeft = 1020;
			entry->currTop = 1020;
			entry->currRight = 2;
			entry->currBottom = 2;
		}
	}
	dispEntry(CAMERA_OFFSCREEN2, 7, offscreenDisp, NULL, 0.0f);
}

void offscreenAddBoundingBox(s32 id, u16 left, u16 top, u16 right, u16 bottom) { //1:1
	OffscreenEntry* entry;

	if (right > left) {
		entry = &offscreenGetWorkGp()->entries[id];
		if (entry->flags & 1) {
			if (left >= 2) {
				left -= 2;
			}
			if (top >= 2) {
				top -= 2;
			}
			if (right <= DEMOGetRenderModeObj()->fbWidth - 2) {
				right += 2;
			}
			if (bottom <= DEMOGetRenderModeObj()->efbHeight - 2) {
				bottom += 2;
			}
			left -= (left & 1);
			top -= (top & 1);
			right += (right & 1);
			bottom += (bottom & 1);
			if (left < entry->currLeft) {
				entry->currLeft = left;
				entry->flags |= 2;
			}
			if (top < entry->currTop) {
				entry->currTop = top;
				entry->flags |= 2;
			}
			if (right < entry->currRight) {
				entry->currRight = right;
				entry->flags |= 2;
			}
			if (bottom < entry->currBottom) {
				entry->currBottom = bottom;
				entry->flags |= 2;
			}
		}
	}
}
