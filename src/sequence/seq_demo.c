#include "seq/seq_demo.h"
#include "dolphin/ai.h"
#include "dolphin/dvd.h"
#include "dolphin/gx/GXCull.h"
#include "dolphin/gx/GXGeometry.h"
#include "dolphin/gx/GXGet.h"
#include "dolphin/gx/GXLighting.h"
#include "dolphin/gx/GXPixel.h"
#include "dolphin/gx/GXStruct.h"
#include "dolphin/gx/GXTev.h"
#include "dolphin/gx/GXTexture.h"
#include "dolphin/gx/GXTransform.h"
#include "dolphin/gx/GXVert.h"
#include "dolphin/mtx.h"
#include "dolphin/os.h"
#include "manager/dvdmgr.h"

typedef struct THPHeader {
    char magic[4];             // 0x0
    u32 version;               // 0x4
    u32 bufSize;               // 0x8
    u32 audioMaxSamples;       // 0xC
    f32 frameRate;             // 0x10
    u32 numFrames;             // 0x14
    u32 firstFrameSize;        // 0x18
    u32 movieDataSize;         // 0x1C
    u32 compInfoDataOffsets;   // 0x20
    u32 offsetDataOffsets;     // 0x24
    u32 movieDataOffsets;      // 0x28
    u32 finalFrameDataOffsets; // 0x2C
} THPHeader;

#define THP_COMP_MAX 16

typedef struct THPFrameCompInfo {
    u32 numComponents;          // 0x0
    u8 frameComp[THP_COMP_MAX]; // 0x4
} THPFrameCompInfo;

typedef struct THPVideoInfo {
    u32 xSize;     // 0x0
    u32 ySize;     // 0x4
    u32 videoType; // 0x8
} THPVideoInfo;

typedef struct THPAudioInfo {
    u32 sndChannels;   // 0x0
    u32 sndFrequency;  // 0x4
    u32 sndNumSamples; // 0x8
    u32 sndNumTracks;  // 0xC
} THPAudioInfo;

typedef struct THPReadBuffer {
    u8* ptr;               // 0x0
    s32 frameNumber;       // 0x4
    volatile BOOL isValid; // 0x8
} THPReadBuffer;

typedef struct THPTextureSet {
    u8* ytexture;    // 0x0
    u8* utexture;    // 0x4
    u8* vtexture;    // 0x8
    s32 frameNumber; // 0xC
} THPTextureSet;

typedef struct THPAudioBuffer {
    s16* buffer;     // 0x0
    s16* curPtr;     // 0x4
    u32 validSample; // 0x8
} THPAudioBuffer;

#define READ_BUFFER_NUM 10
#define AUDIO_BUFFER_NUM 3

typedef struct THPSimple {
    DVDEntry* fileInfo;                           // 0x0
    THPHeader header;                             // 0x4
    THPFrameCompInfo compInfo;                    // 0x34
    THPVideoInfo videoInfo;                       // 0x48
    THPAudioInfo audioInfo;                       // 0x54
    void* thpWork;                                // 0x64
    BOOL open;                                    // 0x68
    u8 preFetchState;                             // 0x6C
    u8 audioState;                                // 0x6D
    u8 loop;                                      // 0x6E
    u8 audioExist;                                // 0x6F
    s32 curOffset;                                // 0x70
    BOOL dvdError;                                // 0x74
    volatile u32 readProgress;                    // 0x78
    s32 nextDecodeIndex;                          // 0x7C
    s32 readIndex;                                // 0x80
    s32 readSize;                                 // 0x84
    s32 totalReadFrame;                           // 0x88
    f32 curVolume;                                // 0x8C
    f32 targetVolume;                             // 0x90
    f32 deltaVolume;                              // 0x94
    s32 rampCount;                                // 0x98
    THPReadBuffer readBuffer[READ_BUFFER_NUM];    // 0x9C
    THPTextureSet textureSet;                     // 0x114
    THPAudioBuffer audioBuffer[AUDIO_BUFFER_NUM]; // 0x124
    s32 audioDecodeIndex;                         // 0x148
    s32 audioOutputIndex;                         // 0x14C
} THPSimple;

#define SAMPLES_PER_AUDIO_FRAME 160 // 5ms @ 32khz
#define BYTES_PER_AUDIO_FRAME (SAMPLES_PER_AUDIO_FRAME * sizeof(s16) * 2)

// clang-format off
//.data
// 32768 * ((vol * vol) / (127 * 127)) 
static u16 VolumeTable[] = {
        0,     2,     8,    18,    32,    50,    73,    99,
      130,   164,   203,   245,   292,   343,   398,   457,
      520,   587,   658,   733,   812,   895,   983,  1074,
     1170,  1269,  1373,  1481,  1592,  1708,  1828,  1952,
     2080,  2212,  2348,  2488,  2632,  2781,  2933,  3090,
     3250,  3415,  3583,  3756,  3933,  4114,  4298,  4487,
     4680,  4877,  5079,  5284,  5493,  5706,  5924,  6145,
     6371,  6600,  6834,  7072,  7313,  7559,  7809,  8063,
     8321,  8583,  8849,  9119,  9394,  9672,  9954, 10241,
    10531, 10826, 11125, 11427, 11734, 12045, 12360, 12679,
    13002, 13329, 13660, 13995, 14335, 14678, 15025, 15377,
    15732, 16092, 16456, 16823, 17195, 17571, 17951, 18335,
    18723, 19115, 19511, 19911, 20316, 20724, 21136, 21553,
    21974, 22398, 22827, 23260, 23696, 24137, 24582, 25031,
    25484, 25941, 26402, 26868, 27337, 27810, 28288, 28769,
    29255, 29744, 30238, 30736, 31238, 31744, 32254, 32768
};
// clang-format on

//.bss
THPSimple SimpleControl;
s32 WorkBuffer[16];
s16 SoundBuffer[2][SAMPLES_PER_AUDIO_FRAME * 2] ATTRIBUTE_ALIGN(32);

//.sbss
s32 SoundBufferIndex;
s16* LastAudioBuffer;
s16* CurAudioBuffer;
f32 _vp[GX_VIEWPORT_SZ];
f32 _pm[GX_PROJECTION_SZ];
s32 AudioSystem;
AIDCallback OldAIDCallback;
BOOL Initialized;

// Forward Declarations
void __THPSimpleDVDCallback(s32 result, DVDFileInfo* fileInfo);
BOOL VideoDecode(u8* videoFrame);
void THPAudioMixCallback(void);
void THPGXRestore(void);
void THPGXYuv2RgbSetup(GXRenderModeObj* rmode);
void THPGXYuv2RgbDraw(u8* y_data, u8* u_data, u8* v_data, s16 x, s16 y, s16 textureWidth, s16 textureHeight,
                      s16 polygonWidth, s16 polygonHeight);

BOOL THPSimpleInit(s32 audioSystem) {
    memset(&SimpleControl, 0, sizeof(THPSimple));
    LCEnable();
    if (THPInit() == FALSE) {
        return FALSE;
    }

    {
        BOOL old = OSDisableInterrupts();

        AudioSystem = audioSystem;
        SoundBufferIndex = 0;
        LastAudioBuffer = NULL;
        CurAudioBuffer = NULL;

        OldAIDCallback = AIRegisterDMACallback(THPAudioMixCallback);
        if (OldAIDCallback == NULL && AudioSystem != 0) {
            AIRegisterDMACallback(NULL);
            OSRestoreInterrupts(old);
            return FALSE;
        }

        OSRestoreInterrupts(old);
    }

    if (AudioSystem == 0) {
        memset(SoundBuffer, 0, BYTES_PER_AUDIO_FRAME << 1);
        DCFlushRange(SoundBuffer, BYTES_PER_AUDIO_FRAME << 1);
        AIInitDMA((u32)SoundBuffer[SoundBufferIndex], BYTES_PER_AUDIO_FRAME);
        AIStartDMA();
    }
    Initialized = TRUE;
    return TRUE;
}

void THPSimpleQuit(void) {
    LCDisable();
    {
        BOOL old = OSDisableInterrupts();
        if (OldAIDCallback) {
            AIRegisterDMACallback(OldAIDCallback);
        }
        OSRestoreInterrupts(old);
    }
    Initialized = FALSE;
}

BOOL THPSimpleOpen(char* fileName) {
    s32 offset, i;

    if (!Initialized) {
        return FALSE;
    }

    if (SimpleControl.open) {
        return FALSE;
    }

    memset(&SimpleControl.videoInfo, 0, sizeof(THPVideoInfo));
    memset(&SimpleControl.audioInfo, 0, sizeof(THPAudioInfo));

    SimpleControl.fileInfo = DVDMgrOpen(fileName, 2, 0);

    if (DVDMgrRead(SimpleControl.fileInfo, WorkBuffer, 64, 0) < 0) {
        DVDMgrClose(SimpleControl.fileInfo);
        return FALSE;
    }

    memcpy(&SimpleControl.header, WorkBuffer, sizeof(THPHeader));
    if (strcmp(SimpleControl.header.magic, "THP") != 0) {
        DVDMgrClose(SimpleControl.fileInfo);
        return FALSE;
    }

    if (SimpleControl.header.version != 0x11000) {
        DVDMgrClose(SimpleControl.fileInfo);
        return FALSE;
    }

    offset = (s32)SimpleControl.header.compInfoDataOffsets;

    if (DVDMgrRead(SimpleControl.fileInfo, WorkBuffer, 32, offset) < 0) {
        DVDMgrClose(SimpleControl.fileInfo);
        return FALSE;
    }

    memcpy(&SimpleControl.compInfo, WorkBuffer, sizeof(THPFrameCompInfo));
    offset += sizeof(THPFrameCompInfo);
    SimpleControl.audioExist = 0;
    for (i = 0; i < SimpleControl.compInfo.numComponents; i++) {
        switch (SimpleControl.compInfo.frameComp[i]) {
            case 0:
                if (DVDMgrRead(SimpleControl.fileInfo, WorkBuffer, 32, offset) < 0) {
                    DVDMgrClose(SimpleControl.fileInfo);
                    return FALSE;
                }
                memcpy(&SimpleControl.videoInfo, WorkBuffer, sizeof(THPVideoInfo));
                offset += sizeof(THPVideoInfo);
                break;
            case 1:
                if (DVDMgrRead(SimpleControl.fileInfo, WorkBuffer, 32, offset) < 0) {
                    DVDMgrClose(SimpleControl.fileInfo);
                    return FALSE;
                }
                memcpy(&SimpleControl.audioInfo, WorkBuffer, sizeof(THPAudioInfo));
                SimpleControl.audioExist = 1;
                offset += sizeof(THPAudioInfo);
                break;
            default:
                return FALSE;
        }
    }

    SimpleControl.curOffset = (s32)SimpleControl.header.movieDataOffsets;
    SimpleControl.readSize = (s32)SimpleControl.header.firstFrameSize;
    SimpleControl.readIndex = 0;
    SimpleControl.totalReadFrame = 0;
    SimpleControl.dvdError = FALSE;
    SimpleControl.textureSet.frameNumber = -1;
    SimpleControl.nextDecodeIndex = 0;
    SimpleControl.audioDecodeIndex = 0;
    SimpleControl.audioOutputIndex = 0;
    SimpleControl.preFetchState = FALSE;
    SimpleControl.audioState = FALSE;
    SimpleControl.loop = 0;
    SimpleControl.open = TRUE;
    SimpleControl.curVolume = 127.0f;
    SimpleControl.targetVolume = SimpleControl.curVolume;
    SimpleControl.rampCount = 0;
    return TRUE;
}

BOOL THPSimpleClose(void) {
    if (SimpleControl.open && SimpleControl.preFetchState == FALSE) {
        if (SimpleControl.audioExist) {
            if (SimpleControl.audioState == TRUE) {
                return FALSE;
            }
        } else {
            SimpleControl.audioState = FALSE;
        }

        if (!SimpleControl.readProgress) {
            SimpleControl.open = FALSE;
            DVDMgrClose(SimpleControl.fileInfo);
            return TRUE;
        }
    }
    return FALSE;
}

u32 THPSimpleCalcNeedMemory(void) {
    u32 size;

    if (SimpleControl.open) {
        size = OSRoundUp32B(SimpleControl.header.bufSize) * READ_BUFFER_NUM;
        size += OSRoundUp32B(SimpleControl.videoInfo.xSize * SimpleControl.videoInfo.ySize);
        size += OSRoundUp32B(SimpleControl.videoInfo.xSize * SimpleControl.videoInfo.ySize / 4);
        size += OSRoundUp32B(SimpleControl.videoInfo.xSize * SimpleControl.videoInfo.ySize / 4);
        if (SimpleControl.audioExist) {
            size += OSRoundUp32B(SimpleControl.header.audioMaxSamples * 4) * AUDIO_BUFFER_NUM;
        }
        size += 0x1000;
        return size;
    }
    return 0;
}

BOOL THPSimpleSetBuffer(u8* buffer) {
    u32 i;
    u8* ptr;
    u32 ysize, uvsize;

    if (SimpleControl.open && SimpleControl.preFetchState == FALSE) {
        if (SimpleControl.audioState == TRUE) {
            return FALSE;
        }

        ysize = OSRoundUp32B(SimpleControl.videoInfo.xSize * SimpleControl.videoInfo.ySize);
        uvsize = OSRoundUp32B(SimpleControl.videoInfo.xSize * SimpleControl.videoInfo.ySize / 4);
        ptr = buffer;

        SimpleControl.textureSet.ytexture = ptr;
        DCInvalidateRange(ptr, ysize);
        ptr += ysize;
        SimpleControl.textureSet.utexture = ptr;
        DCInvalidateRange(ptr, uvsize);
        ptr += uvsize;
        SimpleControl.textureSet.vtexture = ptr;
        DCInvalidateRange(ptr, uvsize);
        ptr += uvsize;

        for (i = 0; i < READ_BUFFER_NUM; i++) {
            SimpleControl.readBuffer[i].ptr = ptr;
            ptr += OSRoundUp32B(SimpleControl.header.bufSize);
            SimpleControl.readBuffer[i].isValid = FALSE;
        }

        if (SimpleControl.audioExist) {
            for (i = 0; i < AUDIO_BUFFER_NUM; i++) {
                SimpleControl.audioBuffer[i].buffer = (s16*)ptr;
                SimpleControl.audioBuffer[i].curPtr = (s16*)ptr;
                SimpleControl.audioBuffer[i].validSample = 0;
                ptr += OSRoundUp32B(SimpleControl.header.audioMaxSamples * 4);
            }
        }

        SimpleControl.thpWork = (void*)ptr;
    }

    return TRUE;
}

void ReadFrameAsync(void) {
    if (!SimpleControl.dvdError && SimpleControl.preFetchState == TRUE) {
        if (SimpleControl.totalReadFrame > SimpleControl.header.numFrames - 1) {
            if (SimpleControl.loop != 1) {
                return;
            }
            SimpleControl.totalReadFrame = 0;
            SimpleControl.curOffset = (s32)SimpleControl.header.movieDataOffsets;
            SimpleControl.readSize = (s32)SimpleControl.header.firstFrameSize;
        }

        SimpleControl.readProgress = TRUE;
        DVDMgrReadAsync(SimpleControl.fileInfo, SimpleControl.readBuffer[SimpleControl.readIndex].ptr,
                        SimpleControl.readSize, SimpleControl.curOffset, __THPSimpleDVDCallback);
    }
}

void __THPSimpleDVDCallback(s32 result, DVDFileInfo* fileInfo) {
    if (result == DVD_RESULT_FATAL_ERROR) {
        SimpleControl.dvdError = TRUE;
    } else if (result != DVD_RESULT_CANCELED) {
        SimpleControl.readProgress = FALSE;
        SimpleControl.readBuffer[SimpleControl.readIndex].frameNumber = SimpleControl.totalReadFrame;
        SimpleControl.totalReadFrame++;
        SimpleControl.readBuffer[SimpleControl.readIndex].isValid = TRUE;
        SimpleControl.curOffset += SimpleControl.readSize;
        SimpleControl.readSize = (s32) * (u32*)(SimpleControl.readBuffer[SimpleControl.readIndex].ptr);
        SimpleControl.readIndex = SimpleControl.readIndex + 1 >= 10 ? 0 : SimpleControl.readIndex + 1;
        if (!SimpleControl.readBuffer[SimpleControl.readIndex].isValid) {
            ReadFrameAsync();
        }
    }
}

inline void CheckPrefetch(void) {
    BOOL enabled = OSDisableInterrupts();
    if (!SimpleControl.readBuffer[SimpleControl.readIndex].isValid && !SimpleControl.readProgress) {
        ReadFrameAsync();
    }
    OSRestoreInterrupts(enabled);
}

BOOL THPSimplePreLoad(s32 loop) {
    u32 i, readNum;

    if (SimpleControl.open && SimpleControl.preFetchState == FALSE) {
        readNum = READ_BUFFER_NUM;

        if (!loop) {
            if (SimpleControl.header.numFrames < READ_BUFFER_NUM) {
                readNum = SimpleControl.header.numFrames;
            }
        }

        for (i = 0; i < readNum; i++) {
            if (DVDMgrRead(SimpleControl.fileInfo, SimpleControl.readBuffer[SimpleControl.readIndex].ptr,
                           SimpleControl.readSize, SimpleControl.curOffset) < 0) {
                SimpleControl.dvdError = TRUE;
                return FALSE;
            }

            SimpleControl.curOffset += SimpleControl.readSize;
            SimpleControl.readSize = (s32) * (u32*)SimpleControl.readBuffer[SimpleControl.readIndex].ptr;
            SimpleControl.readBuffer[SimpleControl.readIndex].isValid = TRUE;
            SimpleControl.readBuffer[SimpleControl.readIndex].frameNumber = SimpleControl.totalReadFrame;
            SimpleControl.readIndex = SimpleControl.readIndex + 1 >= 10 ? 0 : SimpleControl.readIndex + 1;
            SimpleControl.totalReadFrame++;

            if (SimpleControl.totalReadFrame > SimpleControl.header.numFrames - 1) {
                if (SimpleControl.loop == 1) {
                    SimpleControl.totalReadFrame = 0;
                    SimpleControl.curOffset = (s32)SimpleControl.header.movieDataOffsets;
                    SimpleControl.readSize = (s32)SimpleControl.header.firstFrameSize;
                }
            }
        }

        SimpleControl.loop = (u8)loop;
        SimpleControl.preFetchState = TRUE;
        return TRUE;
    }

    return FALSE;
}

void THPSimpleAudioStart(void) {
    SimpleControl.audioState = TRUE;
}

void THPSimpleAudioStop(void) {
    SimpleControl.audioState = FALSE;
}

BOOL THPSimpleLoadStop(void) {
    s32 i;

    if (SimpleControl.open && SimpleControl.audioState == FALSE) {
        SimpleControl.preFetchState = FALSE;

        if (SimpleControl.readProgress) {
            DVDCancel(&SimpleControl.fileInfo->info.cb);
            SimpleControl.readProgress = FALSE;
        }

        for (i = 0; i < READ_BUFFER_NUM; i++) {
            SimpleControl.readBuffer[i].isValid = 0;
        }

        for (i = 0; i < AUDIO_BUFFER_NUM; i++) {
            SimpleControl.audioBuffer[i].validSample = 0;
        }

        SimpleControl.textureSet.frameNumber = -1;
        SimpleControl.curOffset = (s32)SimpleControl.header.movieDataOffsets;
        SimpleControl.readSize = (s32)SimpleControl.header.firstFrameSize;
        SimpleControl.readIndex = 0;
        SimpleControl.totalReadFrame = 0;
        SimpleControl.dvdError = FALSE;
        SimpleControl.nextDecodeIndex = 0;
        SimpleControl.audioDecodeIndex = 0;
        SimpleControl.audioOutputIndex = 0;
        SimpleControl.curVolume = SimpleControl.targetVolume;
        SimpleControl.rampCount = 0;

        return TRUE;
    }

    return FALSE;
}

s32 THPSimpleDecode(s32 audioTrack) {
    BOOL old;
    u32 i;
    u8* ptr;
    u32 *compSizePtr, sample;

    if (SimpleControl.readBuffer[SimpleControl.nextDecodeIndex].isValid) {
        compSizePtr = (u32*)(SimpleControl.readBuffer[SimpleControl.nextDecodeIndex].ptr + 8);
        ptr =
            SimpleControl.readBuffer[SimpleControl.nextDecodeIndex].ptr + SimpleControl.compInfo.numComponents * 4 + 8;

        if (SimpleControl.audioExist) {
            if (audioTrack < 0 || audioTrack >= SimpleControl.audioInfo.sndNumTracks) {
                return 4;
            }

            if (SimpleControl.audioBuffer[SimpleControl.audioDecodeIndex].validSample == 0) {
                for (i = 0; i < SimpleControl.compInfo.numComponents; i++) {
                    switch (SimpleControl.compInfo.frameComp[i]) {
                        case 0:
                            if (VideoDecode(ptr) == FALSE) {
                                return 1;
                            }
                            break;

                        case 1:
                            sample = THPAudioDecode(SimpleControl.audioBuffer[SimpleControl.audioDecodeIndex].buffer,
                                                    ptr + (*compSizePtr) * audioTrack, 0);
                            {
                                BOOL old = OSDisableInterrupts();

                                SimpleControl.audioBuffer[SimpleControl.audioDecodeIndex].validSample = sample;
                                SimpleControl.audioBuffer[SimpleControl.audioDecodeIndex].curPtr =
                                    SimpleControl.audioBuffer[SimpleControl.audioDecodeIndex].buffer;

                                OSRestoreInterrupts(old);
                            }
                            SimpleControl.audioDecodeIndex++;
                            if (SimpleControl.audioDecodeIndex >= AUDIO_BUFFER_NUM) {
                                SimpleControl.audioDecodeIndex = 0;
                            }
                            break;
                    }
                    ptr += *compSizePtr;
                    compSizePtr++;
                }
            } else {
                return 3;
            }
        } else {
            for (i = 0; i < SimpleControl.compInfo.numComponents; i++) {
                switch (SimpleControl.compInfo.frameComp[i]) {
                    case 0:
                        if (VideoDecode(ptr) == FALSE) {
                            return 1;
                        }
                        break;
                }
                ptr += *compSizePtr;
                compSizePtr++;
            }
        }

        SimpleControl.readBuffer[SimpleControl.nextDecodeIndex].isValid = FALSE;
        SimpleControl.nextDecodeIndex = SimpleControl.nextDecodeIndex + 1 >= 10 ? 0 : SimpleControl.nextDecodeIndex + 1;

        CheckPrefetch();
        return 0;
    }

    return 2;
}

BOOL VideoDecode(u8* videoFrame) {
    s32 ret = THPVideoDecode(videoFrame, SimpleControl.textureSet.ytexture, SimpleControl.textureSet.utexture,
                             SimpleControl.textureSet.vtexture, SimpleControl.thpWork);

    if (ret == 0) {
        SimpleControl.textureSet.frameNumber = SimpleControl.readBuffer[SimpleControl.nextDecodeIndex].frameNumber;
        return TRUE;
    }
    return FALSE;
}

s32 THPSimpleDrawCurrentFrame(GXRenderModeObj* rmode, u32 x, u32 y, u32 polygonW, u32 polygonH) {
    if (SimpleControl.textureSet.frameNumber >= 0) {
        THPGXYuv2RgbSetup(rmode);
        THPGXYuv2RgbDraw(SimpleControl.textureSet.ytexture, SimpleControl.textureSet.utexture,
                         SimpleControl.textureSet.vtexture, (s16)x, (s16)y, (s16)SimpleControl.videoInfo.xSize,
                         (s16)SimpleControl.videoInfo.ySize, (s16)polygonW, (s16)polygonH);
        THPGXRestore();
        return (s32)SimpleControl.textureSet.frameNumber;
    }
    return -1;
}

void MixAudio(s16* destination, s16* source, u32 sample) {
    u32 sampleNum, requestSample, i;
    s32 mix;
    s16 *dst, *libsrc, *thpsrc;
    u16 attenuation;

    if (source) {
        if (SimpleControl.open && SimpleControl.audioState == TRUE && SimpleControl.audioExist) {
            requestSample = sample;
            dst = destination;
            libsrc = source;

            while (1) {
                if (SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample) {
                    if (SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample >= requestSample) {
                        sampleNum = requestSample;
                    } else {
                        sampleNum = SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample;
                    }

                    thpsrc = SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].curPtr;
                    for (i = 0; i < sampleNum; i++) {
                        if (SimpleControl.rampCount) {
                            SimpleControl.rampCount--;
                            SimpleControl.curVolume += SimpleControl.deltaVolume;
                        } else {
                            SimpleControl.curVolume = SimpleControl.targetVolume;
                        }

                        attenuation = VolumeTable[(s32)SimpleControl.curVolume];

                        mix = (*libsrc) + ((attenuation * (*thpsrc)) >> 15);
                        if (mix < -32768) {
                            mix = -32768;
                        }
                        if (mix > 32767) {
                            mix = 32767;
                        }
                        *dst = (s16)mix;
                        dst++;
                        libsrc++;
                        thpsrc++;

                        mix = (*libsrc) + ((attenuation * (*thpsrc)) >> 15);
                        if (mix < -32768) {
                            mix = -32768;
                        }
                        if (mix > 32767) {
                            mix = 32767;
                        }
                        *dst = (s16)mix;
                        dst++;
                        libsrc++;
                        thpsrc++;
                    }
                    requestSample -= sampleNum;

                    SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample -= sampleNum;
                    SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].curPtr = thpsrc;

                    if (SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample == 0) {
                        SimpleControl.audioOutputIndex++;
                        if (SimpleControl.audioOutputIndex >= AUDIO_BUFFER_NUM) {
                            SimpleControl.audioOutputIndex = 0;
                        }
                    }

                    if (!requestSample) {
                        break;
                    }
                } else {
                    memcpy(dst, libsrc, requestSample << 2);
                    break;
                }
            }
        } else {
            memcpy(destination, source, sample << 2);
        }
    } else {
        if (SimpleControl.open && SimpleControl.audioState == TRUE && SimpleControl.audioExist) {
            requestSample = sample;
            dst = destination;

            while (1) {
                if (SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample) {
                    if (SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample >= requestSample) {
                        sampleNum = requestSample;
                    } else {
                        sampleNum = SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample;
                    }

                    thpsrc = SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].curPtr;
                    for (i = 0; i < sampleNum; i++) {
                        if (SimpleControl.rampCount) {
                            SimpleControl.rampCount--;
                            SimpleControl.curVolume += SimpleControl.deltaVolume;
                        } else {
                            SimpleControl.curVolume = SimpleControl.targetVolume;
                        }

                        attenuation = VolumeTable[(s32)SimpleControl.curVolume];

                        mix = (attenuation * (*thpsrc)) >> 15;
                        if (mix < -32768) {
                            mix = -32768;
                        }
                        if (mix > 32767) {
                            mix = 32767;
                        }
                        *dst = (s16)mix;
                        dst++;
                        thpsrc++;

                        mix = (attenuation * (*thpsrc)) >> 15;
                        if (mix < -32768) {
                            mix = -32768;
                        }
                        if (mix > 32767) {
                            mix = 32767;
                        }
                        *dst = (s16)mix;
                        dst++;
                        thpsrc++;
                    }

                    requestSample -= sampleNum;

                    SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample -= sampleNum;
                    SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].curPtr = thpsrc;

                    if (SimpleControl.audioBuffer[SimpleControl.audioOutputIndex].validSample == 0) {
                        SimpleControl.audioOutputIndex++;
                        if (SimpleControl.audioOutputIndex >= AUDIO_BUFFER_NUM) {
                            SimpleControl.audioOutputIndex = 0;
                        }
                    }

                    if (!requestSample) {
                        break;
                    }
                } else {
                    memset(dst, 0, requestSample << 2);
                    break;
                }
            }
        } else {
            memset(destination, 0, sample << 2);
        }
    }
}

BOOL THPSimpleGetVideoInfo(THPVideoInfo* videoInfo) {
    if (SimpleControl.open) {
        memcpy(videoInfo, &SimpleControl.videoInfo, sizeof(THPVideoInfo));
        return TRUE;
    }
    return FALSE;
}

BOOL THPSimpleGetAudioInfo(THPAudioInfo* audioInfo) {
    if (SimpleControl.open) {
        memcpy(audioInfo, &SimpleControl.audioInfo, sizeof(THPAudioInfo));
        return TRUE;
    }
    return FALSE;
}

f32 THPSimpleGetFrameRate(void) {
    if (SimpleControl.open) {
        return SimpleControl.header.frameRate;
    }
    return 0.0f;
}

u32 THPSimpleGetTotalFrame(void) {
    if (SimpleControl.open) {
        return SimpleControl.header.numFrames;
    }
    return 0;
}

void THPAudioMixCallback(void) {
    if (AudioSystem == 0) {
        SoundBufferIndex ^= 1;
        AIInitDMA((u32)SoundBuffer[SoundBufferIndex], BYTES_PER_AUDIO_FRAME);
        {
            BOOL old = OSEnableInterrupts();

            MixAudio(SoundBuffer[SoundBufferIndex], NULL, SAMPLES_PER_AUDIO_FRAME);
            DCFlushRange(SoundBuffer[SoundBufferIndex], BYTES_PER_AUDIO_FRAME);

            OSRestoreInterrupts(old);
        }
    } else {
        if (AudioSystem == 1) {
            if (LastAudioBuffer) {
                CurAudioBuffer = LastAudioBuffer;
            }

            OldAIDCallback();
            LastAudioBuffer = (s16*)OSPhysicalToCached(AIGetDMAStartAddr());
        } else {
            OldAIDCallback();
            CurAudioBuffer = (s16*)OSPhysicalToCached(AIGetDMAStartAddr());
        }

        SoundBufferIndex ^= 1;
        AIInitDMA((u32)SoundBuffer[SoundBufferIndex], BYTES_PER_AUDIO_FRAME);
        {
            BOOL old = OSEnableInterrupts();

            if (CurAudioBuffer) {
                DCInvalidateRange(CurAudioBuffer, BYTES_PER_AUDIO_FRAME);
            }
            MixAudio(SoundBuffer[SoundBufferIndex], CurAudioBuffer, SAMPLES_PER_AUDIO_FRAME);
            DCFlushRange(SoundBuffer[SoundBufferIndex], BYTES_PER_AUDIO_FRAME);

            OSRestoreInterrupts(old);
        }
    }
}

BOOL THPSimpleSetVolume(s32 vol, s32 time) {
    BOOL old;
    s32 samplePerMs;

    if (SimpleControl.open && SimpleControl.audioExist) {
        if (AIGetDSPSampleRate() == AI_SAMPLERATE_32KHZ) {
            samplePerMs = 32;
        } else {
            samplePerMs = 48;
        }

        if (vol > 127) {
            vol = 127;
        }
        if (vol < 0) {
            vol = 0;
        }

        if (time > 60000) {
            time = 60000;
        }
        if (time < 0) {
            time = 0;
        }

        {
            BOOL old = OSDisableInterrupts();

            SimpleControl.targetVolume = (f32)vol;
            if (time) {
                SimpleControl.rampCount = samplePerMs * time;
                SimpleControl.deltaVolume =
                    (SimpleControl.targetVolume - SimpleControl.curVolume) / (f32)SimpleControl.rampCount;
            } else {
                SimpleControl.rampCount = 0;
                SimpleControl.curVolume = SimpleControl.targetVolume;
            }

            OSRestoreInterrupts(old);
        }

        return TRUE;
    }
    return FALSE;
}

s32 THPSimpleGetVolume(void) {
    if (SimpleControl.open) {
        return (s32)SimpleControl.curVolume;
    }

    return -1;
}

/* THPDraw.c */

void THPGXRestore(void) {
    GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevSwapMode(GX_TEVSTAGE3, GX_TEV_SWAP0, GX_TEV_SWAP0);

    GXSetTevSwapModeTable(GX_TEV_SWAP0, GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_ALPHA);
    GXSetTevSwapModeTable(GX_TEV_SWAP1, GX_CH_RED, GX_CH_RED, GX_CH_RED, GX_CH_ALPHA);
    GXSetTevSwapModeTable(GX_TEV_SWAP2, GX_CH_GREEN, GX_CH_GREEN, GX_CH_GREEN, GX_CH_ALPHA);
    GXSetTevSwapModeTable(GX_TEV_SWAP3, GX_CH_BLUE, GX_CH_BLUE, GX_CH_BLUE, GX_CH_ALPHA);

    GXSetViewport(_vp[0], _vp[1], _vp[2], _vp[3], _vp[4], _vp[5]);
    GXSetProjectionv(_pm);
}

void THPGXYuv2RgbSetup(GXRenderModeObj* rmode) {
    s32 scrWidth, scrHeight;
    Mtx44 pMtx;
    Mtx mMtx;

    GXGetViewportv(_vp);
    GXGetProjectionv(_pm);
    scrWidth = rmode->fbWidth;
    scrHeight = rmode->efbHeight;
    MTXOrtho(pMtx, 0.0f, (f32)scrHeight, 0.0f, (f32)scrWidth, 0.0f, -1.0f);
    GXSetProjection(pMtx, GX_ORTHOGRAPHIC);
    GXSetViewport(0.0f, 0.0f, (f32)scrWidth, (f32)scrHeight, 0.0f, 1.0f);
    GXSetScissor(0, 0, scrWidth, scrHeight);
    MTXIdentity(mMtx);
    GXLoadPosMtxImm(mMtx, 0);
    GXSetCurrentMtx(0);
    GXSetZMode(GX_DISABLE, GX_ALWAYS, GX_DISABLE);
    GXSetBlendMode(GX_BM_NONE, GX_BL_ONE, GX_BL_ZERO, GX_LO_CLEAR);
    GXSetNumChans(0);
    GXSetNumTexGens(2u);
    GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 60);
    GXSetTexCoordGen(GX_TEXCOORD1, GX_TG_MTX2x4, GX_TG_TEX0, 60);
    GXInvalidateTexAll();
    GXClearVtxDesc();
    GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
    GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
    GXSetVtxAttrFmt(GX_VTXFMT7, GX_VA_POS, GX_POS_XYZ, GX_S16, 0);
    GXSetVtxAttrFmt(GX_VTXFMT7, GX_VA_TEX0, GX_TEX_ST, GX_U16, 0);
    GXSetNumTevStages(4);
    GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD1, GX_TEXMAP1, GX_COLOR_NULL);
    GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_C0);
    GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_TEXA, GX_CA_KONST, GX_CA_A0);
    GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_SUB, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevKColorSel(GX_TEVSTAGE0, GX_TEV_KCSEL_K0);
    GXSetTevKAlphaSel(GX_TEVSTAGE0, GX_TEV_KASEL_K0_A);
    GXSetTevSwapMode(GX_TEVSTAGE0, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder(GX_TEVSTAGE1, GX_TEXCOORD1, GX_TEXMAP2, GX_COLOR_NULL);
    GXSetTevColorIn(GX_TEVSTAGE1, GX_CC_ZERO, GX_CC_TEXC, GX_CC_KONST, GX_CC_CPREV);
    GXSetTevColorOp(GX_TEVSTAGE1, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_2, GX_FALSE, GX_TEVPREV);
    GXSetTevAlphaIn(GX_TEVSTAGE1, GX_CA_ZERO, GX_CA_TEXA, GX_CA_KONST, GX_CA_APREV);
    GXSetTevAlphaOp(GX_TEVSTAGE1, GX_TEV_SUB, GX_TB_ZERO, GX_CS_SCALE_1, GX_FALSE, GX_TEVPREV);
    GXSetTevKColorSel(GX_TEVSTAGE1, GX_TEV_KCSEL_K1);
    GXSetTevKAlphaSel(GX_TEVSTAGE1, GX_TEV_KASEL_K1_A);
    GXSetTevSwapMode(GX_TEVSTAGE1, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder(GX_TEVSTAGE2, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
    GXSetTevColorIn(GX_TEVSTAGE2, GX_CC_ZERO, GX_CC_TEXC, GX_CC_ONE, GX_CC_CPREV);
    GXSetTevColorOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn(GX_TEVSTAGE2, GX_CA_TEXA, GX_CA_ZERO, GX_CA_ZERO, GX_CA_APREV);
    GXSetTevAlphaOp(GX_TEVSTAGE2, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevSwapMode(GX_TEVSTAGE2, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevOrder(GX_TEVSTAGE3, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR_NULL);
    GXSetTevColorIn(GX_TEVSTAGE3, GX_CC_APREV, GX_CC_CPREV, GX_CC_KONST, GX_CC_ZERO);
    GXSetTevColorOp(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevAlphaIn(GX_TEVSTAGE3, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO);
    GXSetTevAlphaOp(GX_TEVSTAGE3, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
    GXSetTevSwapMode(GX_TEVSTAGE3, GX_TEV_SWAP0, GX_TEV_SWAP0);
    GXSetTevKColorSel(GX_TEVSTAGE3, GX_TEV_KCSEL_K2);
    GXSetTevColorS10(GX_TEVREG0, (GXColorS10){ -90, 0, -114, 135 });
    GXSetTevKColor(GX_KCOLOR0, (GXColor){ 0, 0, 226, 88 });
    GXSetTevKColor(GX_KCOLOR1, (GXColor){ 179, 0, 0, 182 });
    GXSetTevKColor(GX_KCOLOR2, (GXColor){ 255, 0, 255, 128 });
    GXSetTevSwapModeTable(GX_TEV_SWAP0, GX_CH_RED, GX_CH_GREEN, GX_CH_BLUE, GX_CH_ALPHA);
}

void THPGXYuv2RgbDraw(u8* y_data, u8* u_data, u8* v_data, s16 x, s16 y, s16 textureWidth, s16 textureHeight,
                      s16 polygonWidth, s16 polygonHeight) {
    GXTexObj tobj0, tobj1, tobj2;

    GXInitTexObj(&tobj0, y_data, (u16)textureWidth, (u16)textureHeight, GX_TF_I8, GX_CLAMP, GX_CLAMP, GX_FALSE);
    GXInitTexObjLOD(&tobj0, GX_NEAR, GX_NEAR, 0, 0, 0, 0, 0, GX_ANISO_1);
    GXLoadTexObj(&tobj0, GX_TEXMAP0);

    GXInitTexObj(&tobj1, u_data, (u16)(textureWidth >> 1), (u16)(textureHeight >> 1), GX_TF_I8, GX_CLAMP, GX_CLAMP,
                 GX_FALSE);
    GXInitTexObjLOD(&tobj1, GX_NEAR, GX_NEAR, 0, 0, 0, 0, 0, GX_ANISO_1);
    GXLoadTexObj(&tobj1, GX_TEXMAP1);

    GXInitTexObj(&tobj2, v_data, (u16)(textureWidth >> 1), (u16)(textureHeight >> 1), GX_TF_I8, GX_CLAMP, GX_CLAMP,
                 GX_FALSE);
    GXInitTexObjLOD(&tobj2, GX_NEAR, GX_NEAR, 0, 0, 0, 0, 0, GX_ANISO_1);
    GXLoadTexObj(&tobj2, GX_TEXMAP2);

    GXBegin(GX_QUADS, GX_VTXFMT7, 4);
    GXPosition3s16(x, y, 0);
    GXTexCoord2u16(0, 0);
    GXPosition3s16((s16)(x + polygonWidth), y, 0);
    GXTexCoord2u16(1, 0);
    GXPosition3s16((s16)(x + polygonWidth), (s16)(y + polygonHeight), 0);
    GXTexCoord2u16(1, 1);
    GXPosition3s16(x, (s16)(y + polygonHeight), 0);
    GXTexCoord2u16(0, 1);
    GXEnd();
}
