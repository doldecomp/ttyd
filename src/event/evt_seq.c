//1:1, very short, TODO: better header
#include "evt/evt_seq.h"
#include "driver/seqdrv.h"

USER_FUNC(evt_seq_set_seq) {
	s32* args = event->args;
	SequenceType type;
	const char *map, *bero;

	type = evtGetValue(event, args[0]);
	map = (const char*)evtGetValue(event, args[1]);
	bero = (const char*)evtGetValue(event, args[2]);
	seqSetSeq(type, map, bero);
	return EVT_RETURN_BLOCK;
}

USER_FUNC(evt_seq_wait) {
	SequenceType current, target;

	target = evtGetValue(event, *event->args);
	current = seqGetSeq();
	return (current != target) ? EVT_RETURN_BLOCK : EVT_RETURN_DONE;
}
