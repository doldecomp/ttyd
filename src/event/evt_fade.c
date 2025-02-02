#include "evt/evt_fade.h"
#include "driver/fadedrv.h"

USER_FUNC(evt_fade_entry) {
	s32* args = event->args;
	FadeType type;
	s32 duration;
	u8 r, g, b;

	type = evtGetValue(event, *args++);
	duration = evtGetValue(event, *args++);
	r = evtGetValue(event, *args++);
	g = evtGetValue(event, *args++);
	b = evtGetValue(event, *args++);
	fadeEntry(type, duration, (GXColor){r, g, b, 0xFF});
	return EVT_RETURN_DONE;
}
