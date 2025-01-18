#include "musyx/musyx.h"

#include "musyx/assert.h"
#include "musyx/hardware.h"
#include "musyx/snd.h"
#include "musyx/stream.h"
#include "musyx/synth.h"
#include "musyx/synthdata.h"
#include "musyx/voice.h"

#if !defined(_DEBUG) && MUSY_TARGET == MUSY_TARGET_DOLPHIN
#include "dolphin/os.h"
#endif

static STREAM_INFO streamInfo[64];
static u32 nextPublicID = 0;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
static struct streamDefaults streamDefaults;
#endif
static u8 streamCallDelay = 0;
static u8 streamCallCnt = 0;

void streamInit() {
  s32 i;
  streamCallCnt = 0;
  streamCallDelay = 3;
  for (i = 0; i < synthInfo.voiceNum; ++i) {
    streamInfo[i].state = 0;
  }
  nextPublicID = 0;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
  streamDefaults.lpfEnable = 0;
  streamDefaults.lpfFrq = 0;
#endif
}

#if MUSY_VERSION >= MUSY_VERSION_CHECK(1, 5, 3)
static void SetHWMix(const STREAM_INFO* si) {
  hwSetVolume(si->voice, 0, si->vol * (1 / 127.f), (si->pan << 16), (si->span << 16),
              si->auxa * (1 / 127.f), si->auxb * (1 / 127.f));
}
#endif

void streamHandle() {
  u32 i;              // r25
  u32 cpos;           // r30
  u32 len;            // r29
  SAMPLE_INFO newsmp; // r1+0x8
  STREAM_INFO* si;    // r31
  float f;            // f31
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 0)
  u32 v;
#endif

  if (streamCallCnt != 0) {
    --streamCallCnt;
    return;
  }
  streamCallCnt = streamCallDelay;
  si = &streamInfo[0];
  for (i = 0; i < synthInfo.voiceNum; ++i, ++si) {
    switch (si->state) {
    case 1:
      newsmp.info = si->frq | 0x40000000;
      newsmp.addr = hwGetStreamPlayBuffer(si->hwStreamHandle);
      newsmp.offset = 0;
      newsmp.length = si->size;
      newsmp.loop = 0;
      newsmp.loopLength = si->size;

#if MUSY_VERSION <= MUSY_VERSION_CHECK(1, 5, 4)
      si->adpcmInfo.loopPS = si->adpcmInfo.initialPS = *(u8*)si->buffer;
#endif

#if MUSY_VERSION <= MUSY_VERSION_CHECK(1, 5, 4) && MUSY_TARGET == MUSY_TARGET_DOLPHIN
      DCInvalidateRange(si->buffer, 1);
#endif

      switch (si->type) {
      case 0:
        newsmp.compType = 2;
        break;
      case 1:
        newsmp.extraData = &si->adpcmInfo;
        newsmp.compType = 4;

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 0)
        hwSetStreamLoopPS(si->voice, si->lastPSFromBuffer);
        si->adpcmInfo.loopPS = si->adpcmInfo.initialPS = si->lastPSFromBuffer;
#endif
        break;
      }
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 0)
      v = si->voice;
      hwInitSamplePlayback(v, -1, &newsmp, 1, -1, synthVoice[v].id, 1, 1);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
      if (si->lpfEnable == 0) {
        hwSetFilter(si->voice, 0, 0, 0);
      } else {
        hwSetFilter(si->voice, 1, si->lpfA0, si->lpfB0);
      }
#endif
#else
      hwInitSamplePlayback(si->voice, -1, &newsmp, 1, -1, synthVoice[si->voice].id, 1, 1);
#endif
      f = (si->frq / (float)synthInfo.mixFrq);
      hwSetPitch(si->voice, f * 4096.f);
#if MUSY_VERSION <= MUSY_VERSION_CHECK(1, 5, 3)
      hwSetVolume(si->voice, 0, si->vol * (1 / 127.f), (si->pan << 16), (si->span << 16),
                  si->auxa * (1 / 127.f), si->auxb * (1 / 127.f));
#else
      SetHWMix(si);
#endif

      hwStart(si->voice, si->studio);
      si->state = 2;
      if (!(si->flags & 0x20000)) {
        hwFlushStream(si->buffer, 0, si->bytes, si->hwStreamHandle, NULL, 0);
      }
      break;
    case 2: {
      cpos = hwGetPos(si->voice);

      if (si->type == 1) {
        cpos = (cpos / 14) * 14;
      }

      if (si->last != cpos) {
        if (si->last < cpos) {
          switch (si->type) {
          case 0: {
            if ((len = si->updateFunction(si->buffer + si->last, cpos - si->last, NULL, 0,
                                          si->user)) != 0 &&
                si->state == 2) {
              cpos = (si->last + len) % si->size;
              if (!(si->flags & 0x20000)) {
                if (cpos != 0) {
                  hwFlushStream(si->buffer, si->last * 2, (cpos - si->last) * 2, si->hwStreamHandle,
                                NULL, 0);
                } else {
                  hwFlushStream(si->buffer, si->last * 2, (si->size - si->last) * 2,
                                si->hwStreamHandle, NULL, 0);
                }
              }

              si->last = cpos;
            }
          } break;
          case 1: {
            u32 off = (si->last / 14) * 8;
            if ((len = si->updateFunction((void*)((size_t)si->buffer + off), cpos - si->last, NULL,
                                          0, si->user)) != 0 &&
                si->state == 2) {
              cpos = (si->last + len) % si->size;

              if (!(si->flags & 0x20000)) {
                if (cpos != 0) {
                  hwFlushStream(si->buffer, off, ((cpos + 13) / 14) * 8 - off, si->hwStreamHandle,
                                NULL, 0);
                } else {
                  hwFlushStream(si->buffer, off, (si->bytes) - off, si->hwStreamHandle, NULL, 0);
                }
              }
              si->last = cpos;
            }
          } break;
          }
        } else if (cpos == 0) {
          switch (si->type) {
          case 0:
            if ((len = si->updateFunction(si->buffer + si->last, si->size - si->last, NULL, 0,
                                          si->user)) &&
                si->state == 2) {
              cpos = (si->last + len) % si->size;
              if (!(si->flags & 0x20000)) {
                if (cpos == 0) {
                  hwFlushStream(si->buffer, si->last * 2, si->bytes - (si->last * 2),
                                si->hwStreamHandle, NULL, 0);
                } else {
                  hwFlushStream(si->buffer, si->last * 2, (cpos - si->last) * 2, si->hwStreamHandle,
                                NULL, 0);
                }
              }
              si->last = cpos;
            }
            break;
          case 1: {
            u32 off = ((si->last / 14) * 8);
            if ((len = si->updateFunction((void*)((size_t)si->buffer + off), si->size - si->last,
                                          NULL, 0, si->user)) &&
                si->state == 2) {
              cpos = (si->last + len) % si->size;
              if (!(si->flags & 0x20000)) {
                if (cpos == 0) {
                  hwFlushStream(si->buffer, off, si->bytes - off, si->hwStreamHandle, NULL, 0);
                } else {
                  hwFlushStream(si->buffer, off, ((cpos + 13) / 14) * 8 - off, si->hwStreamHandle,
                                NULL, 0);
                }
              }

              si->last = cpos;
            }
          } break;
          }
        } else {
          switch (si->type) {
          case 0:
            if ((len = si->updateFunction(si->buffer + si->last, si->size - si->last, si->buffer,
                                          cpos, si->user)) &&
                si->state == 2) {
              cpos = (si->last + len) % si->size;

              if (!(si->flags & 0x20000)) {
                if (len > si->size - si->last) {
                  hwFlushStream(si->buffer, si->last * 2, (si->bytes - si->last * 2),
                                si->hwStreamHandle, NULL, 0);
                  hwFlushStream(si->buffer, 0, cpos * 2, si->hwStreamHandle, NULL, 0);

                } else if (cpos == 0) {
                  hwFlushStream(si->buffer, si->last * 2, (si->bytes - si->last * 2),
                                si->hwStreamHandle, NULL, 0);
                } else {
                  hwFlushStream(si->buffer, si->last * 2, (cpos - si->last) * 2, si->hwStreamHandle,
                                NULL, 0);
                }
              }
              si->last = cpos;
            }
            break;
          case 1: {
            u32 off = (si->last / 14) * 8;
            if ((len = si->updateFunction((void*)((size_t)si->buffer + off), si->size - si->last,
                                          si->buffer, cpos, si->user)) &&
                si->state == 2) {
              cpos = (si->last + len) % si->size;

              if (!(si->flags & 0x20000)) {
                if (len > si->size - si->last) {
                  hwFlushStream(si->buffer, off, si->bytes - off, si->hwStreamHandle, NULL, 0);
                  hwFlushStream(si->buffer, 0, (cpos / 14) << 3, si->hwStreamHandle, NULL, 0);
                } else if (cpos == 0) {
                  hwFlushStream(si->buffer, off, si->bytes - off, si->hwStreamHandle, NULL, 0);
                } else {
                  hwFlushStream(si->buffer, off, ((cpos + 13) / 14) * 8 - off, si->hwStreamHandle,
                                NULL, 0);
                }
              }
              si->last = cpos;
            }

          } break;
          }
        }

        if (si->state == 2 && !(si->flags & 0x20000) && si->type == 1) {
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 0)
#if MUSY_TARGET == MUSY_TARGET_DOLPHIN
          hwSetStreamLoopPS(si->voice,
                            (si->lastPSFromBuffer = *(u32*)OSCachedToUncached(si->buffer) >> 24));
#elif MUSY_TARGET == MUSY_TARGET_PC
          hwSetStreamLoopPS(si->voice, (si->lastPSFromBuffer = *(u32*)si->buffer >> 24));
#endif
#else
#if MUSY_TARGET == MUSY_TARGET_DOLPHIN

          hwSetStreamLoopPS(si->voice, *(u32*)OSCachedToUncached(si->buffer) >> 24);
#elif MUSY_TARGET == MUSY_TARGET_PC
          hwSetStreamLoopPS(si->voice, *(u32*)si->buffer >> 24);
#endif
#endif
        }
      }
    } break;
    }
  }
}

void streamCorrectLoops() {}

void streamKill(u32 voice) {
  STREAM_INFO* si;
#if MUSY_VERSION <= MUSY_VERSION_CHECK(2, 0, 1)
  si = &streamInfo[voice];
  switch (si->state) {
  case 1:
  case 2:
    if (si->state == 2) {
      voiceUnblock(si->voice);
    }
    si->state = 3;
    si->updateFunction(NULL, 0, NULL, 0, si->user);
    break;
  default:
    break;
  }
#else
  u32 i;

  for (i = 0; i < 64; ++i) {
    si = &streamInfo[i];
    if ((si->state == 1 || si->state == 2) && si->voice == voice) {
      if (si->state == 2) {
        voiceUnblock(si->voice); // TODO fix in release
      }
      si->state = 3;
      si->updateFunction(0, 0, 0, 0, si->user);
      break;
    }
  }
#endif
}

static u32 GetPrivateIndex(u32 publicID) {
  u32 i; // r31
  for (i = 0; i < 64; ++i) {
    if (streamInfo[i].state != 0 && publicID == streamInfo[i].stid) {
      return i;
    }
  }

  return -1;
}

static u32 GeneratePublicID() {
  u32 id; // r30
  u32 i;  // r31

  do {
    if ((id = nextPublicID++) == -1) {
      id = nextPublicID;
      nextPublicID = id + 1;
    }
    for (i = 0; i < 64; ++i) {
      if (streamInfo[i].state != 0 && id == streamInfo[i].stid) {
        break;
      }
    }
  } while (i != 64);

  return id;
}

u32 sndStreamCallbackFrq(u32 msTime) {
  s32 time; // r31
  time = ((msTime * 2 + 5) / 10) - 1;
  streamCallDelay = time < 0 ? 0 : time;
  return (streamCallDelay + 1) * 5;
}

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
u32 sndStreamGetARAMAddress(u32 stid, u32* aramAddr) {
  u32 i;
  u32 ret = 0;

  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    *aramAddr = hwGetStreamARAMAddr(streamInfo[i].hwStreamHandle);
    ret = 1;
  }
  hwEnableIrq();
  return ret;
}
#endif

void sndStreamARAMUpdate(u32 stid, u32 off1, u32 len1, u32 off2, u32 len2) {
  u32 i; // r30
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
  u32 _len1;
  u32 _off1;
  u32 _len2;
  u32 _off2;
#endif

  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
    _len1 = _len2 = _off1 = _off2 = 0;
#endif
    switch (streamInfo[i].type) {
    case 0:
#if MUSY_VERSION <= MUSY_VERSION_CHECK(2, 0, 1)
      off1 *= 2;
      len1 *= 2;
      off2 *= 2;
      len2 *= 2;
#else
      _off1 = off1 * 2;
      _len1 = len1 * 2;
      _off2 = off2 * 2;
      _len2 = len2 * 2;
#endif
      break;
    case 1:
#if MUSY_VERSION <= MUSY_VERSION_CHECK(2, 0, 1)
      off1 = (off1 / 14) * 8;
      len1 = ((len1 + 13) / 14) * 8;
      off2 = (off2 / 14) * 8;
      len2 = ((len2 + 13) / 14) * 8;
#else
      _off1 = (off1 / 14) * 8;
      _len1 = ((len1 + 13) / 14) * 8;
      _off2 = (off2 / 14) * 8;
      _len2 = ((len2 + 13) / 14) * 8;
#endif
      break;
    }

#if MUSY_VERSION <= MUSY_VERSION_CHECK(2, 0, 1)
    if (len1 != 0) {
      hwFlushStream(streamInfo[i].buffer, off1, len1, streamInfo[i].hwStreamHandle, 0, 0);
    }

    if (len2 != 0) {
      hwFlushStream(streamInfo[i].buffer, off2, len2, streamInfo[i].hwStreamHandle, 0, 0);
    }
#else
    if (_len1 != 0) {
      hwFlushStream(streamInfo[i].buffer, _off1, _len1, streamInfo[i].hwStreamHandle, 0, 0);
    }

    if (_len2 != 0) {
      hwFlushStream(streamInfo[i].buffer, _off2, _len2, streamInfo[i].hwStreamHandle, 0, 0);
    }
#endif

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 0)
    if (streamInfo[i].type == 1) {
      streamInfo[i].lastPSFromBuffer =
          (*(u32*)MUSY_CACHED_TO_UNCACHED_ADDR(streamInfo[i].buffer)) >> 24;
      if (streamInfo[i].voice != -1) {
        hwSetStreamLoopPS(streamInfo[i].voice, streamInfo[i].lastPSFromBuffer);
      }
    }
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamARAMUpdate(streamInfo[i].nextStreamHandle, off1, len1, off2, len2);
    }
#endif
#else
    if (streamInfo[i].type == 1) {
      hwSetStreamLoopPS(streamInfo[i].voice,
                        *(u32*)MUSY_CACHED_TO_UNCACHED_ADDR(streamInfo[i].buffer) >> 24);
    }
#endif
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }
  hwEnableIrq();
}

static void CheckOutputMode(u8* pan, u8* span) {
  if (synthFlags & 1) {
    *pan = 64;
    *span = 0;
  } else if (!(synthFlags & 2)) {
    *span = 0;
  }
}

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
static void SetupVolume(STREAM_INFO* si, u8 vol, u8 auxa, u8 auxb) {
  si->vol = vol;
  si->auxa = auxa;
  si->auxb = auxb;
}
#endif

#if MUSY_VERSION >= MUSY_VERSION_CHECK(1, 5, 4)
static void SetupVolumeAndPan(STREAM_INFO* si, u8 vol, u8 pan, u8 span, u8 auxa, u8 auxb) {
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
  SetupVolume(si, vol, auxa, auxb);
#endif
  si->orgPan = pan;
  si->orgSPan = span;
  CheckOutputMode(&pan, &span);
#if MUSY_VERSION <= MUSY_VERSION_CHECK(2, 0, 1)
  si->vol = vol;
  si->pan = pan;
  si->span = span;
  si->auxa = auxa;
  si->auxb = auxb;
#else
  si->pan = pan;
  si->span = span;
#endif
}
#endif

#if MUSY_VERSION >= MUSY_VERSION_CHECK(1, 5, 4)
void streamOutputModeChanged() {
  u32 i;

  hwDisableIrq();
  for (i = 0; i < synthInfo.voiceNum; ++i) {
    if (streamInfo[i].state != 0) {
      streamInfo[i].pan = streamInfo[i].orgPan;
      streamInfo[i].span = streamInfo[i].orgSPan;
      CheckOutputMode(&streamInfo[i].pan, &streamInfo[i].span);
      if (streamInfo[i].state != 3) {
        SetHWMix(&streamInfo[i]);
      }
    }
  }

  hwEnableIrq();
}
#endif

SND_STREAMID sndStreamAllocEx(u8 prio, void* buffer, u32 samples, u32 frq, u8 vol, u8 pan, u8 span,
                              u8 auxa, u8 auxb, u8 studio, u32 flags,
                              u32 (*updateFunction)(void* buffer1, u32 len1, void* buffer2,
                                                    u32 len2, u32 user),
                              u32 user, SND_ADPCMSTREAM_INFO* adpcmInfo) {
  u32 stid;  // r29
  u32 i;     // r31
  u32 bytes; // r25
  u32 j;     // r28
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();

  for (i = 0; i < 64; ++i) {
    if (streamInfo[i].state == 0) {
      break;
    }
  }

  if (i != 64) {
    stid = GeneratePublicID();
    streamInfo[i].stid = stid;
    streamInfo[i].flags = flags;
    bytes = sndStreamAllocLength(samples, flags);
    streamInfo[i].buffer = (s16*)buffer;
    streamInfo[i].size = samples;
    streamInfo[i].bytes = bytes;
    streamInfo[i].updateFunction = updateFunction;
    streamInfo[i].voice = -1;
    if (flags & 1) {
      if (adpcmInfo != NULL) {
        for (j = 0; j < 8; j++) {
          streamInfo[i].adpcmInfo.coefTab[j][0] = adpcmInfo->coefTab[j][0];
          streamInfo[i].adpcmInfo.coefTab[j][1] = adpcmInfo->coefTab[j][1];
        }
        streamInfo[i].adpcmInfo.numCoef = 8;
      }
      streamInfo[i].type = 1;
    } else {
      streamInfo[i].type = 0;
    }

    streamInfo[i].frq = frq;
    streamInfo[i].studio = studio;
    streamInfo[i].prio = prio;
#if MUSY_VERSION <= MUSY_VERSION_CHECK(1, 5, 3)
    CheckOutputMode(&pan, &span);
    streamInfo[i].vol = vol;
    streamInfo[i].pan = pan;
    streamInfo[i].span = span;
    streamInfo[i].auxa = auxa;
    streamInfo[i].auxb = auxb;
#else
    SetupVolumeAndPan(&streamInfo[i], vol, pan, span, auxa, auxb);
#endif
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
    if ((streamInfo[i].lpfEnable = streamDefaults.lpfEnable)) {
      hwLowPassFrqToCoef(streamDefaults.lpfFrq, &streamInfo[i].lpfA0, &streamInfo[i].lpfB0);
    } else {
      streamInfo[i].lpfA0 = streamInfo[i].lpfB0 = 0;
    }
#endif
    streamInfo[i].user = user;
    streamInfo[i].nextStreamHandle = -1;
    streamInfo[i].state = 3;
    if ((streamInfo[i].hwStreamHandle = hwInitStream(bytes)) != 0xFF) {
      if (!(flags & 0x10000) && !sndStreamActivate(stid)) {
        MUSY_DEBUG("No voice could be allocated for streaming.\n");
        stid = -1;
      }
    } else {
      MUSY_DEBUG("No ARAM memory could be allocated for streaming.\n");
      stid = -1;
    }
    if (stid == -1) {
      streamInfo[i].state = 0;
    }
  } else {
    stid = -1;
  }

  hwEnableIrq();

  return stid;
}

u32 sndStreamAllocStereo(u8 prio, void* lBuffer, void* rBuffer, u32 samples, u32 frq, u8 vol,
                         u8 pan, u8 span, u8 auxa, u8 auxb, u8 studio, u32 flags,
                         SND_STREAM_UPDATE_CALLBACK updateFunction, u32 lUser, u32 rUser,
                         SND_ADPCMSTREAM_INFO* adpcmInfoL, SND_ADPCMSTREAM_INFO* adpcmInfoR) {
  u32 stid[2]; // r1+0x38
  s16 rPan;    // r31
  s16 lPan;    // r30

  lPan = pan - 64;
  lPan = lPan < 0 ? 0 : lPan > 127 ? 127 : lPan;
  rPan = pan + 64;
  rPan = rPan < 0 ? 0 : rPan > 127 ? 127 : rPan;

  hwDisableIrq();

  if ((stid[0] = sndStreamAllocEx(prio, lBuffer, samples, frq, vol, lPan, span, auxa, auxb, studio,
                                  flags, updateFunction, lUser, adpcmInfoL)) != 0xFFFFFFFF) {
    if ((stid[1] = sndStreamAllocEx(prio, rBuffer, samples, frq, vol, rPan, span, auxa, auxb,
                                    studio, flags, updateFunction, rUser, adpcmInfoR)) ==
        0xFFFFFFFF) {
      sndStreamFree(stid[0]);
      hwEnableIrq();
      return 0xFFFFFFFF;
    }

    streamInfo[GetPrivateIndex(stid[0])].nextStreamHandle = stid[1];
  }

  hwEnableIrq();
  return stid[0];
}

u32 sndStreamAllocLength(u32 num, u32 flags) {
  if (flags & 1) {
    return (((num + 13) / 14) * 8 + 31) & ~31;
  }

  return (num * 2 + 31) & ~31;
}

void sndStreamADPCMParameter(u32 stid, SND_ADPCMSTREAM_INFO* adpcmInfo) {
  u32 j; // r31
  u32 i; // r30
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    for (j = 0; j < 8; ++j) {
      streamInfo[i].adpcmInfo.coefTab[j][0] = adpcmInfo->coefTab[j][0];
      streamInfo[i].adpcmInfo.coefTab[j][1] = adpcmInfo->coefTab[j][1];
    }
    streamInfo[i].adpcmInfo.numCoef = 8;
    if (streamInfo[i].nextStreamHandle != 0xffffffff) {
      sndStreamADPCMParameter(streamInfo[i].nextStreamHandle, adpcmInfo);
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }
  hwEnableIrq();
}

void sndStreamMixParameter(u32 stid, u8 vol, u8 pan, u8 span, u8 fxvol) {
  u32 i; // r31
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);

  if (i != -1) {
#if MUSY_VERSION < MUSY_VERSION_CHECK(1, 5, 4)
    CheckOutputMode(&pan, &span);
    streamInfo[i].vol = vol;
    streamInfo[i].pan = pan;
    streamInfo[i].span = span;
    streamInfo[i].auxa = fxvol;
    streamInfo[i].auxb = 0;
    hwSetVolume(streamInfo[i].voice, 0, vol * (1 / 127.f), (pan << 16), (span << 16),
                fxvol * (1 / 127.f), 0.f);
#else
    SetupVolumeAndPan(&streamInfo[i], vol, pan, span, fxvol, 0);
    if (MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2) ? (streamInfo[i].state == 2) : TRUE) {
      SetHWMix(&streamInfo[i]);
    }
#endif

    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamMixParameter(streamInfo[i].nextStreamHandle, vol, pan, span, fxvol);
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }
  hwEnableIrq();
}

void sndStreamMixParameterEx(u32 stid, u8 vol, u8 pan, u8 span, u8 auxa, u8 auxb) {
  u32 i; // r31
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
#if MUSY_VERSION <= MUSY_VERSION_CHECK(1, 5, 3)
    streamInfo[i].vol = vol;
    streamInfo[i].pan = pan;
    streamInfo[i].span = span;
    streamInfo[i].auxa = auxa;
    streamInfo[i].auxb = auxb;
    if (streamInfo[i].state == 2) {
      hwSetVolume(streamInfo[i].voice, 0, vol * (1 / 127.f), (pan << 16), (span << 16),
                  auxa * (1 / 127.f), auxb * (1 / 127.f));
    }
#else
    SetupVolumeAndPan(&streamInfo[i], vol, pan, span, auxa, auxb);
    if (streamInfo[i].state == 2) {
      SetHWMix(&streamInfo[i]);
    }
#endif

    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamMixParameterEx(streamInfo[i].nextStreamHandle, vol, pan, span, auxa, auxb);
    }

  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }

  hwEnableIrq();
}

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
void sndStreamMixParameterVolume(u32 stid, u8 vol, u8 auxa, u8 auxb) {
  unsigned long i; // r31
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    SetupVolume(&streamInfo[i], vol, auxa, auxb);
    if (streamInfo[i].state == 2) {
      SetHWMix(&streamInfo[i]);
    }
    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamMixParameterVolume(streamInfo[i].nextStreamHandle, vol, auxa, auxb);
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }
  hwEnableIrq();
}
#endif

#pragma push
#pragma inline_depth(3)
void sndStreamFrq(u32 stid, u32 frq) {
  u32 i;     // r31
  u16 pitch; // r27

  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  if ((i = GetPrivateIndex(stid)) != -1) {
    streamInfo[i].frq = frq;
    if (streamInfo[i].state == 2) {
      pitch = (4096.f * frq) / synthInfo.mixFrq;
      hwSetPitch(streamInfo[i].voice, pitch);
    }

    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamFrq(streamInfo[i].nextStreamHandle, frq);
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }

  hwEnableIrq();
}
#pragma pop

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 2)
void sndStreamLPFParameter(u32 stid, u32 enable, u32 frq) {
  u32 i; // r31

  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    streamInfo[i].lpfEnable = enable;
    if (streamInfo[i].lpfEnable != 0) {
      hwLowPassFrqToCoef(frq, &streamInfo[i].lpfA0, &streamInfo[i].lpfB0);
    } else {
      streamInfo[i].lpfA0 = streamInfo[i].lpfB0 = 0;
    }
    if (streamInfo[i].state == 2) {
      if (streamInfo[i].lpfEnable == 0) {
        hwSetFilter(streamInfo[i].voice, 0, 0, 0);
      } else {
        hwSetFilter(streamInfo[i].voice, 1, streamInfo[i].lpfA0, streamInfo[i].lpfB0);
      }
    }
    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamLPFParameter(streamInfo[i].nextStreamHandle, enable, frq);
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }
  hwEnableIrq();
}

void sndStreamLPFDefaultParameter(u32 enable, u32 frq) {
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  streamDefaults.lpfEnable = enable;
  streamDefaults.lpfFrq = frq;
  hwEnableIrq();
}
#endif

void sndStreamFree(SND_STREAMID stid) {
  u32 i; // r31
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    sndStreamDeactivate(stid);
    hwExitStream(streamInfo[i].hwStreamHandle);
    if (streamInfo[i].nextStreamHandle != 0xffffffff) {
      sndStreamFree(streamInfo[i].nextStreamHandle);
    }

    streamInfo[i].state = 0;
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }

  hwEnableIrq();
}

bool sndStreamActivate(SND_STREAMID stid) {
  u32 i;            // r31
  bool ret = FALSE; // r28

  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    if (streamInfo[i].state == 3) {
      if ((streamInfo[i].voice = voiceBlock(streamInfo[i].prio)) == -1) {
        MUSY_DEBUG("No voice could be allocated for streaming.\n");
        hwEnableIrq();
        return 0;
      }

      streamInfo[i].last = 0;
      streamInfo[i].state = 1;
    } else {
      MUSY_DEBUG("Stream is already active.\n");
    }

    if (streamInfo[i].nextStreamHandle != 0xffffffff) {
      ret = sndStreamActivate(streamInfo[i].nextStreamHandle);
    } else {
      ret = TRUE;
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }
  hwEnableIrq();
  return ret;
}

void sndStreamDeactivate(u32 stid) {
  u32 i; // r31
  MUSY_ASSERT_MSG(sndActive, "Sound system is not initialized.");
  hwDisableIrq();
  i = GetPrivateIndex(stid);
  if (i != -1) {
    if (streamInfo[i].state == 1 || streamInfo[i].state == 2) {
      voiceUnblock(streamInfo[i].voice);
      streamInfo[i].state = 3;
    }

    if (streamInfo[i].nextStreamHandle != -1) {
      sndStreamDeactivate(streamInfo[i].nextStreamHandle);
    }
  } else {
    MUSY_DEBUG("ID is invalid.\n");
  }

  hwEnableIrq();
}
