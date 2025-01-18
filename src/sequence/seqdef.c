#include "driver/seqdrv.h"
#include "seq/seq_logo.h"

extern void seq_gameInit(SequenceWork* work); //2
extern void seq_gameMain(SequenceWork* work);

extern void seq_e3Init(SequenceWork* work); //7
extern void seq_e3Main(SequenceWork* work);
extern void seq_e3Exit(SequenceWork* work);

SequenceCallback seq_data[8][3] = {
	{seq_logoInit, seq_logoMain, seq_logoExit},
	{NULL, NULL, NULL},
	{seq_gameInit, seq_gameMain, NULL},
	{NULL, NULL, NULL},
	{NULL, NULL, NULL},
	{NULL, NULL, NULL},
	{NULL, NULL, NULL},
	{seq_e3Init, seq_e3Main, seq_e3Exit},
};
