#ifndef _MUSYX_HARDWARE
#define _MUSYX_HARDWARE

#include "musyx/musyx.h"
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct DSPADPCMblock {
  // total size: 0x6
  signed short Y0;        // offset 0x0, size 0x2
  signed short Y1;        // offset 0x2, size 0x2
  unsigned char PS;       // offset 0x4, size 0x1
  unsigned char reserved; // offset 0x5, size 0x1
} DSPADPCMblock;
typedef struct DSPADPCMplusInfo {
  // total size: 0x2E
  unsigned short numCoef;     // offset 0x0, size 0x2
  unsigned char initialPS;    // offset 0x2, size 0x1
  unsigned char loopPS;       // offset 0x3, size 0x1
  signed short loopY0;        // offset 0x4, size 0x2
  signed short loopY1;        // offset 0x6, size 0x2
  signed short coefTab[8][2]; // offset 0x8, size 0x20
  DSPADPCMblock blk[1];       // offset 0x28, size 0x6
} DSPADPCMplusInfo;

typedef struct ARAMInfo {
  // total size: 0xC
  unsigned long aramBase;  // offset 0x0, size 0x4
  unsigned long aramTop;   // offset 0x4, size 0x4
  unsigned long aramWrite; // offset 0x8, size 0x4
} ARAMInfo;

typedef void* (*ARAMUploadCallback)(u32, u32);
typedef u32 (*SND_MESSAGE_CALLBACK)(u32, u32);

extern SND_MESSAGE_CALLBACK salMessageCallback;
extern SND_HOOKS salHooks;

extern u32 dspHRTFOn;

extern u16* dspCmdList;
extern u16 dspCmdFirstSize;
extern u8 dspScale2IndexTab[1024];

u32 hwFrq2Pitch(u32 frq);
void hwOff(s32 vid);
bool hwIsStudioActive(u8 studio);
void* hwGetStreamPlayBuffer(u8 hwStreamHandle);
s32 hwInit(u32* frq, u16 numVoices, u16 numStudios, u32 flags); /* extern */
void hwExit();
void hwInitSamplePlayback(u32 v, u16 smpID, void* newsmp, u32 set_defadsr, u32 prio,
                          u32 callbackUserValue, u32 setSRC, u8 itdMode);
void hwSetVolume(u32 v, u8 table, float vol, u32 pan, u32 span, float auxa, float auxb);
void hwSetPitch(u32 v, u16 speed);
void hwInitIrq();
void hwExitIrq();
void hwEnableIrq();
void hwDisableIrq();
void* hwTransAddr(void* samples);
void hwExitStream(u8 id);
void hwSaveSample(void* header, void* data
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
                  ,
                  ARAMInfo* aramInfo
#endif
);
void hwRemoveSample(void* header, void* data
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
                    ,
                    ARAMInfo* aramInfo
#endif
);
u32 hwGetVirtualSampleState(u32 voice);
bool hwVoiceInStartup(u32 v);
void hwBreak(s32 vid);
u32 hwGetPos(u32 v);
void hwInitSampleMem(u32 baseAddr, u32 length);
void hwExitSampleMem();
void hwSetVirtualSampleLoopBuffer(u32 voice, void* addr, u32 len);
u16 hwGetSampleID(u32 voice);
u8 hwGetSampleType(u32 voice);
void hwChangeStudioMix(u8 studio, u32 isMaster);
void hwSetStreamLoopPS(u32 voice, u8 ps);
void hwFlushStream(void* base, u32 offset, u32 bytes, u8 hwStreamHandle, void (*callback)(size_t),
                   u32 user);
void hwSetSaveSampleCallback(ARAMUploadCallback callback, unsigned long chunckSize);
void hwSyncSampleMem();
void hwSetAUXProcessingCallbacks(u8 studio, SND_AUX_CALLBACK auxA, void* userA,
                                 SND_AUX_CALLBACK auxB, void* userB);
void hwSetMesgCallback(SND_MESSAGE_CALLBACK callback);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
void hwSetFilter(u32 v, unsigned char mode, unsigned short coefA, unsigned short coefB);
void hwLowPassFrqToCoef(u32 frq, unsigned short* _a0, unsigned short* _b1);
void hwEnableCompressor();
void hwDisableCompressor();
#endif
void hwSetSRCType(u32 v, u8 salSRCType);
void hwSetITDMode(u32 v, u8 mode);
void hwSetPolyPhaseFilter(u32 v, u8 salCoefSel);
bool hwAddInput(u8 studio, SND_STUDIO_INPUT* in_desc);
bool hwRemoveInput(u8 studio, SND_STUDIO_INPUT* in_desc);
void hwChangeStudio(u32 v, u8 studio);
void hwDisableHRTF();
void hwStart(u32 v, u8 studio);
void hwKeyOff(u32 v);
void hwFrameDone();
void hwActivateStudio(u8 studio, bool isMaster, SND_STUDIO_TYPE type);
void hwDeactivateStudio(u8);
void hwSetPriority(u32 v, u32 prio);
u32 hwIsActive(u32);
u32 hwGlobalActivity();
void hwSetAUXProcessingCallbacks(u8 studio, SND_AUX_CALLBACK auxA, void* userA,
                                 SND_AUX_CALLBACK auxB, void* userB);
u8 hwInitStream(u32 len);
u8 hwGetTimeOffset();
u32 hwGetVirtualSampleID(u32 v);
void hwIRQEnterCritical();
void hwIRQLeaveCritical();
void hwSetADSR(u32 v, void* _adsr, u8 mode);

extern u32 aramSize;
extern u8* aramBase;
void aramInit(u32 length);
void aramExit();
size_t aramGetStreamBufferAddress(u8 id, size_t* len);
void aramUploadData(void* mram, u32 aram, u32 len, u32 highPrio, void (*callback)(size_t),
                    u32 user);
void aramFreeStreamBuffer(u8 id);
void* aramStoreData(void* src, u32 len);
void aramRemoveData(void* aram, u32 len);
u8 aramAllocateStreamBuffer(u32 len);
unsigned long aramGetZeroBuffer();
void aramSetUploadCallback(ARAMUploadCallback callback, u32 chunckSize);
void aramSyncTransferQueue();

#ifdef __cplusplus
}
#endif

#endif // _MUSYX_HARDWARE
