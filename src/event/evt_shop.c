#include "evt/evt_shop.h"
#include "mario/mariost.h"
#include "memory.h"
#include <string.h>

extern GlobalWork* gp;

//.sbss
char mapname[16];
static evt_shop_work* _wp;

USERFUNC_DEF(evt_shop_setup) {
	evt_shop_work* work_ptr;
	s32 r25, r27, r28, r30;
	int i;

	r28 = evtGetValue(event, event->args[0]);
	r27 = evtGetValue(event, event->args[1]);
	r30 = evtGetValue(event, event->args[2]);
	r25 = evtGetValue(event, event->args[3]);
	work_ptr = _mapAlloc(sizeof(evt_shop_work));
	memset(work_ptr, 0, sizeof(evt_shop_work));
	_wp = work_ptr;
	strncpy(mapname, gp->currentMapName, sizeof(gp->currentMapName) - 1);
	work_ptr->field_0x4 = r28;
	work_ptr->field_0x8 = r27;
	work_ptr->field_0xC = r30;
	work_ptr->field_0x10 = r25;
	work_ptr->field_0x20 = 6;
	for (i = 0; i < work_ptr->field_0x20; i++) {

	}
	return EVT_RETURN_DONE;
}