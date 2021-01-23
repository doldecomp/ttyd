#include "global.h"

extern s32 now_seq; // lbl_8040F4B0
extern s32 next_seq; // lbl_8040F4B4
extern s32 prev_seq; // lbl_8040F4B8

extern char* next_p0; // lbl_80418558
extern char* next_p1; // lbl_8041855C
extern seqdrv_work seqWork; // lbl_80418560

BOOL seqCheckSeq(void);
s32 seqGetNextSeq(void);
s32 seqGetPrevSeq(void);
s32 seqGetSeq(void);
void seqSetSeq(s32 seq, char* p0, char* p1);
void seqMain(void);
void seqInit_MARIOSTORY(void);

extern void sysWaitDrawSync(void);
extern void(*seq_data[8][3])(seqdrv_work*);

extern void memset(void *mem, int c, int size);

void seqInit_MARIOSTORY(void) {
	memset(&seqWork, 0, sizeof(seqWork));
	now_seq = -1;
	next_seq = -1;
	prev_seq = -1;
}

void seqMain(void) {
	if (next_seq != now_seq) {
        // ?!? This seems to inline seqGetSeq, but I can't reproduce this, not
        // even with -inline deferred on...
		if ((s32)now_seq != -1) {
			sysWaitDrawSync();
			(*seq_data[now_seq][2])(&seqWork); //call Exit function
		}
		prev_seq = now_seq; //move back
		memset(&seqWork, 0, sizeof(seqWork));
		now_seq = next_seq;
		seqWork.field_0x0 = next_seq;
		seqWork.field_0x4 = 0;
		seqWork.field_0x8 = next_p0;
		seqWork.field_0xC = next_p1;
		(*seq_data[next_seq][0])(&seqWork); //call Init function
	}
	(*seq_data[now_seq][1])(&seqWork); //call Main function
}

void seqSetSeq(s32 seq, char* p0, char* p1) {
	next_seq = seq;
	next_p0 = p0;
	next_p1 = p1;
}

s32 seqGetSeq(void) {
    return now_seq;
}

s32 seqGetPrevSeq(void) {
    return prev_seq;
}

s32 seqGetNextSeq(void) {
    return next_seq;
}

BOOL seqCheckSeq(void) {
    return now_seq != next_seq;
}
