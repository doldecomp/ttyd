#include "seq/seq_title.h"
#include "driver/animdrv.h"
#include "driver/camdrv.h"
#include "mario/mariost.h"
#include "pmario_sound.h"
#include "sound.h"
#include "system.h"
#include <musyx/musyx.h>
#include <string.h>

extern SoundWork sound;
extern PaperSoundBGM psbgm[2];
extern GlobalWork* gp;

TitleWork work2;
TitleWork* wp2 = &work2;

//local prototypes
void titleInit(SequenceWork* work);
void titleMain(SequenceWork* work);

const char* DbgBtlSel_GetMsgDataPtr(void) {
	return NULL;
}

void seq_titleInit(SequenceWork* work) {
	titleInit(work);
	gp->flags &= ~2;
	gp->flags &= ~0x40;
	gp->flags &= ~0x20;
	gp->flags &= ~0x1000;
}

void seq_titleExit(SequenceWork* work) {
	fileFree(wp2->texture);
	if (seqGetNextSeq() != SEQ_LOAD) {
		psndStopAllFadeOut();
	}
}

void seq_titleMain(SequenceWork* work) {
	titleMain(work);
}

s32 getDebugMode(void) {
	return wp2->debug;
}

void titleInit(SequenceWork* work) {
	memset(wp2, 0, sizeof(TitleWork));
	wp2->texture = fileAllocf(4, "%s/mariost.tpl", getMarioStDvdRoot());
	wp2->field_0xC = 0.0f;
	wp2->field_0x10 = 1000.0f;
	wp2->field_0x14 = 0.0f;
	wp2->field_0x18 = -1000.0f;
	wp2->field_0x1C = 0.0f;
	wp2->debug = 0;
	if (seqGetPrevSeq() == SEQ_LOAD) {
		psndSFXAllOff();
	}
	else if (seqGetPrevSeq() != SEQ_LOGO) {
		if (seqGetPrevSeq() == SEQ_MAP_CHANGE) {
			psndBGMOff_f_d(512, 3000, 0);
			psndBGMOff_f_d(513, 3000, 0);
			psndSFXAllOff();
		}
		else if (seqGetPrevSeq() == SEQ_GAME_OVER) {
			psndStopAllFadeOut();
		}
	}
	if (seqGetPrevSeq() != SEQ_LOAD) {
		if (seqGetPrevSeq() == SEQ_GAME_OVER) {
			if (OSGetSoundMode()) {
				SoundSetOutputMode(SND_OUTPUTMODE_STEREO);
			}
			else {
				SoundSetOutputMode(SND_OUTPUTMODE_MONO);
			}
			psndBGMOn(0x200, "BGM_DIGEST1");
			if (psbgm[0].streamId != -1) {
				sound.streams[psbgm[0].streamId].flags |= 0x8000;
			}
		}
		else {
			psndBGMOn(0x200, "BGM_TITLE1");
			if (psbgm[0].streamId != -1) {
				sound.streams[psbgm[0].streamId].flags |= 0x8000;
			}
		}
	}
	camGetPtr(CAMERA_2D)->flags &= ~0x100;
	camGetPtr(CAMERA_2D)->flags |= 0x400;
}

void titleMain(SequenceWork* work) {
	switch (wp2->field_0x8) {
		case 0:
			if (psndBGMStartCheck(0)
				&& animGroupBaseAsync("OFF_d_maku_left_right", 2, 0)
				&& animGroupBaseAsync("OFF_d_maku_center", 2, 0))
			{

			}
			break;
	}
}
