#include "global.h"

// .sdata symbols
s32 now_seq = -1;
s32 next_seq = -1;
s32 prev_seq = -1;

// .sbss symbols
seqdrv_work seqWork;
char* next_p1;
char* next_p0;

BOOL seqCheckSeq(void);
s32 seqGetNextSeq(void);
s32 seqGetPrevSeq(void);
s32 seqGetSeq(void);
void seqSetSeq(s32 seq, char* p0, char* p1);
void seqMain(void);
void seqInit_MARIOSTORY(void);

void(*seq_data[8][3])(seqdrv_work*) = {
	{seq_logoInit, seq_logoMain, seq_logoExit},
	{seq_titleInit, seq_titleMain, seq_titleExit},
	{seq_gameInit, seq_gameMain, seq_gameExit},
	{seq_mapChangeInit, seq_mapChangeMain, seq_mapChangeExit},
	{seq_battleInit, seq_battleMain, seq_battleExit},
	{seq_gameOverInit, seq_gameOverMain, seq_gameOverExit},
	{seq_loadInit, seq_loadMain, seq_loadExit},
	{seq_e3Init, seq_e3Main, seq_e3Exit}
};

void seqInit_MARIOSTORY(void) {
	memset(&seqWork, 0, sizeof(seqWork));
	now_seq = -1;
	next_seq = -1;
	prev_seq = -1;
}

void seqMain(void) {
	if (seqGetNextSeq() != seqGetSeq()) { // why cant you use seqCheckSeq()...
        // why make a temp? this temp cant be used for the below now_seq
        // inlined usage.
        s32 seq = seqGetSeq();
		if (seq != -1) {
			sysWaitDrawSync();
			(*seq_data[seqGetSeq()][2])(&seqWork); //call Exit function
		}
		prev_seq = seqGetSeq(); //move back
		memset(&seqWork, 0, sizeof(seqWork));
		now_seq = seqGetNextSeq();
		seqWork.field_0x0 = seqGetNextSeq();
		seqWork.field_0x4 = 0;
		seqWork.field_0x8 = next_p0;
		seqWork.field_0xC = next_p1;
		(*seq_data[seqGetNextSeq()][0])(&seqWork); //call Init function
	}
	(*seq_data[seqGetSeq()][1])(&seqWork); //call Main function
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
