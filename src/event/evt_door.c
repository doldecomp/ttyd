#include "evt/evt_door.h"
#include "pmario_sound.h"

USER_FUNC(snd_door_in) {
	psndSetFlag(0x100);
	return EVT_RETURN_DONE;
}

USER_FUNC(snd_door_out) {
	psndClearFlag(0x100);
	return EVT_RETURN_DONE;
}

USER_FUNC(door_entry) {

}
