#pragma once

/* SLIB File Structure:
 * chunks of data, first word is size (including these bytes), 0x20 "header"
 * "arrfile" pointer is size+0x20, to end of chunk
 */

#include "dolphin/types.h"
#include "mgr/dvdmgr.h"
#include <dolphin/ai.h>
#include <dolphin/ar.h>
//#include <dolphin/arq.h>
#include <dolphin/dvd.h>
#pragma warn_padding off
#include <musyx/musyx.h>
#pragma warn_padding on

#define TWO_PI 6.28318530717958647692528676655900576839433879875021f

typedef void (*ReverbCallback)(u8 reason, SND_AUX_INFO* info, void* user);

#pragma warn_padding off
typedef struct StreamHeader {
	u8 field_0x0; //0x0
	//pad 1 byte
	u16 freq; //0x2
	u32 count; //0x4
	u32 field_0x8; //0x8
	u32 field_0xC; //0xC
	u32 field_0x10; //0x10
	u32 field_0x14; //0x14
	u32 field_0x18; //0x18
	u32 field_0x1C; //0x1C
	u16 field_0x20; //0x20
	u16 field_0x22; //0x22
	u16 field_0x24; //0x24
	u16 field_0x26; //0x26
} StreamHeader;
#pragma warn_padding on

typedef struct SoundGroup { //TODO: rename
	u16 flags; //0x0
	u16 unk2; //0x2
	SND_GROUPID groupId; //0x4
	SND_SONGID songId; //0x6
	void* arrfile; //0x8
	struct SoundGroup* next; //0xC
} SoundGroup;

typedef struct SoundSong {
	SND_SEQID seqId; //0x0
	u32 vol; //0x4, casts to u8
	SoundGroup* group; //0x8
	u32 mask; //0xC
} SoundSong;

typedef struct SoundEffect {
	u16 flags; //0x0
	u16 unk2; //0x2, count or active or smth
	u16 vol; //0x4
	u16 pan; //0x6
	u16 span; //0x8
	u16 unkA; //0xA
	SND_VOICEID voiceId; //0xC
	u16 fid; //0x10
	u8 unk12[0x14 - 0x12]; //0x12
	SND_EMITTER emitter; //0x14
	SND_FVECTOR pos; //0x64
	SND_FVECTOR prevPos; //0x70
	SND_FVECTOR dir; //0x7C
} SoundEffect;

typedef struct SoundDVD {
	u16 flags; //0x0
	u16 unk2; //0x2
	f32 unk4; //0x4
	f32 unk8; //0x8
	f32 unkC; //0xC
	u8 unk10[0x114 - 0x10]; //0x10
	u32 samples; //0x114
	DVDFileInfo info; //0x118
} SoundDVD;

typedef struct SoundStreamEntry {
	DVDEntry* dvd; //0x0
	ARQRequest request; //0x4
	SND_STREAMID streamId; //0x24
	void* unk28; //0x28, TODO: re-type? buffer
	u32 loadBuffer; //0x2C
	void* unk30; //0x30, TODO: re-type?
	u32 bytesLoaded; //0x34, number of bytes already loaded from the file
	u8 unk38[0x48 - 0x38]; //0x38
	u32 requestLength; //0x48, number of bytes to load next ARQPostRequest
	u8 unk4C[0x68 - 0x4C]; //0x4C
	SND_ADPCMSTREAM_INFO info; //0x68
} SoundStreamEntry;

typedef struct SoundStream {
	u16 flags; //0x0
	u16 unk2; //0x2
	u16 unk4; //0x4
	u16 pan; //0x6
	u16 span; //0x8
	u8 unkA[0xC - 0xA]; //0xA
	f32 vol; //0xC
	f32 unk10; //0x10, some volume setting
	f32 unk14; //0x14, some other volume setting
	u16 freq; //0x18
	u16 count; //0x1A
	u8 unk1C[0x28 - 0x1C]; //0x1C
	SoundStreamEntry entries[2]; //0x28
} SoundStream;

typedef struct SoundTemp {
	void* callback; //0x0
	void* data; //0x4
	u8 unk8; //0x8
	u8 pad9[3]; //0x9
	s32 unkC; //0xC
} SoundTemp;

typedef struct SoundWork {
	void* poolData[8]; //0x0
	void* projData[8]; //0x20
	void* sdirData[8]; //0x40
	void* slibData[8]; //0x60
	void* stblData[8]; //0x80
	void* etblData[8]; //0xA0
	u32 groupCount[8]; //0xC0
	u32 dataId; //0xE0, not incremented, memory leak if SoundLoadDVD2 called multiple times
	u32 slibId; //0xE4
	s32 unkE8; //0xE8
	SoundGroup* groups; //0xEC
	SoundSong* songs; //0xF0
	SoundEffect* effects; //0xF4
	SoundDVD* dvds; //0xF8
	s32 unkFC; //0xFC
	SoundStream* streams; //0x100
	s32 unk104; //0x104
	SoundTemp unk108[2]; //0x108
	SND_LISTENER listener; //0x128
	SND_FVECTOR pos; //0x1B8
	SND_FVECTOR prevPos; //0x1C4
	SND_FVECTOR dir; //0x1D0
	SND_FVECTOR heading; //0x1DC
	SND_FVECTOR up; //0x1E8
	f32 unk1F4; //0x1F4
	u8 unk1F8[0x204 - 0x1F8]; //0x1F8
	u32 listenerVol; //0x204
	u16 fadeIn; //0x208
	u16 fadeOut; //0x20A
	u16 unk20C; //0x20C
	u8 unk20E[0x210 - 0x20E]; //0x20E
	BOOL interrupts; //0x210
	u16 unk214; //0x214, some "mute" thing
	u8 pad216[2]; //0x216
	SND_OUTPUTMODE outputMode; //0x218
	u8 unk21C[0x224 - 0x21C]; //0x21C
	u16 unk224; //0x224
	u16 unk226[2]; //0x226
	char filepath[0x100]; //0x22A
	u8 pad32A[2]; //0x32A
	void* filedata; //0x32C
	s16 unk330; //0x330
	u8 pad332[2]; //0x332
	u8* dmaAddress; //0x334
	u32 dmaLength; //0x338
	u8 unk33C[0x5BC - 0x33C]; //0x33C
	AIDCallback callback; //0x5BC
	u8 unk5C0[0x15C0 - 0x5C0]; //0x5C0
	s32 unk15C0; //0x15C0
} SoundWork;

void SoundInit(void);
void SoundMain(void);
void SoundMainInt(void);
void SoundSetFadeTime(u16 in, u16 out);
BOOL SoundLoadDVD2(const char* path);
BOOL SoundLoadDVD2PushGroup(u8* group_ids);
void SoundLoadDVD2Free(void);
BOOL SoundSLibLoadDVD(const char* path);
BOOL SoundDropData(void);
void SoundSetOutputMode(SND_OUTPUTMODE mode);
void SoundOpenCover(void);
void SoundCloseCover(void);

void SoundSongPlayCh(s32 id, u32 mask);
void SoundSongContinueCh(s32 chan);
void SoundSongStopCh(s32 chan);
void SoundSongFadeoutCh(s32 chan);
void SoundSongFadeinCh(s32 chan);
void SoundSongSetVolCh(s32 chan, u8 vol);
u8 SoundSongGetVolCh(s32 chan);
BOOL SoundSongCheck(s32 chan);

s32 SoundEfxPlayEx(SND_FXID fid, u8 a2, u8 vol, u8 pan);
void SoundEfxStop(s32 chan);
void SoundEfxSetPitch(s32 chan, u16 pitch);
void SoundEfxSetVolume(s32 chan, u8 vol);
u8 SoundEfxGetVolume(s32 chan);
void SoundEfxSetAux1(s32 chan, u8 reverb);
void SoundEfxSetPan(s32 chan, u8 pan);
void SoundEfxSetSrndPan(s32 chan, u8 span);
void SoundEfxSetLPF(s32 chan, s16 freq);
BOOL SoundEfxCheck(s32 chan);
