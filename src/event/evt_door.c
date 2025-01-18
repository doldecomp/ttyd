#include "evt/evt_door.h"
#include "pmario_sound.h"

USERFUNC_DEF(snd_door_in) {
	psndSetFlag(0x100);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(snd_door_out) {
	psndClearFlag(0x100);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(door_entry) {

}
