
/*















*/

#include "musyx/assert.h"
#include "musyx/sal.h"
#include "musyx/seq.h"
#include "musyx/synth.h"

#include <string.h>

#define SYNTH_FX_MIDISET 0xFF

static u8 midi_lastNote[8][16];

static u8 fx_lastNote[64];

static u8 midi_ctrl[8][16][134];

static u8 fx_ctrl[64][134];

static u32 inpGlobalMIDIDirtyFlags[8][16];

static CHANNEL_DEFAULTS inpChannelDefaults[8][16];

static CHANNEL_DEFAULTS inpFXChannelDefaults[64];

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
static u32 lpfHighFrequencyDefault = 0;
static u32 lpfLowFrequencyDefault = 0;
#endif

static inline bool GetGlobalFlagSet(u8 chan, u8 midiSet, s32 flag) {
  return (flag & inpGlobalMIDIDirtyFlags[midiSet][chan]) != 0;
}

/*






*/
static void inpResetGlobalMIDIDirtyFlags() {
  u32 i, j;
  for (i = 0; i < 8; ++i) {
    for (j = 0; j < 16; ++j) {
      inpGlobalMIDIDirtyFlags[i][j] = 0xFF;
    }
  }
}

static u32 inpResetGlobalMIDIDirtyFlag(u8 chan, u8 midiSet, u32 flag) {
  u32 ret;
  // clang-format off
  MUSY_ASSERT(midiSet!=SYNTH_FX_MIDISET);
  // clang-format on
  ;
  if ((ret = (flag & inpGlobalMIDIDirtyFlags[midiSet][chan]) != 0) != 0) {
    inpGlobalMIDIDirtyFlags[midiSet][chan] &= ~flag;
  }
  return ret;
}

void inpSetGlobalMIDIDirtyFlag(u8 chan, u8 midiSet, s32 flag) {
  // clang-format off
  MUSY_ASSERT(midiSet!=SYNTH_FX_MIDISET);
  // clang-format on
  inpGlobalMIDIDirtyFlags[midiSet][chan] |= flag;
}

void inpSetRPNHi(u8 set, u8 channel, u8 value) {
  u16 rpn;  // r28
  u32 i;    // r31
  u8 range; // r29

  rpn = (midi_ctrl[set][channel][100]) | (midi_ctrl[set][channel][101] << 8);
  switch (rpn) {
  case 0:
    range = value > 24 ? 24 : value;
    inpChannelDefaults[set][channel].pbRange = range;

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].pbUpperKeyRange = range;
        synthVoice[i].pbLowerKeyRange = range;
      }
    }
    break;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  case 0x7f7d: {
    u32 frq = (value << 9) | (inpChannelDefaults[set][channel].lpfLowerFrqBoundary & 0x1FF);
    inpChannelDefaults[set][channel].lpfLowerFrqBoundary = frq;

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfLowerFrqBoundary = frq;
      }
    }
  } break;

  case 0x7f7e: {
    u32 frq = (value << 9) | (inpChannelDefaults[set][channel].lpfUpperFrqBoundary & 0x1FF);
    inpChannelDefaults[set][channel].lpfUpperFrqBoundary = frq;

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfUpperFrqBoundary = frq;
      }
    }
  } break;
#endif
  default:
    break;
  }
}

void inpSetRPNLo(u8 set, u8 channel, u8 value) {
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  u16 rpn; // r28
  u32 i;   // r31

  rpn = (midi_ctrl[set][channel][100]) | (midi_ctrl[set][channel][101] << 8);
  switch (rpn) {
  case 0x7f7d: {
    u32 frq = (value << 2) | (inpChannelDefaults[set][channel].lpfLowerFrqBoundary & (u16)(~0x1FF));
    inpChannelDefaults[set][channel].lpfLowerFrqBoundary = frq;

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfLowerFrqBoundary = frq;
      }
    }
  } break;

  case 0x7f7e: {
    u32 frq = (value << 2) | (inpChannelDefaults[set][channel].lpfUpperFrqBoundary & (u16)(~0x1FF));
    inpChannelDefaults[set][channel].lpfUpperFrqBoundary = frq;

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfUpperFrqBoundary = frq;
      }
    }
  } break;
  }
#endif
}

void inpSetRPNDec(u8 set, u8 channel) {
  u16 rpn;  // r28
  u32 i;    // r31
  u8 range; // r30

  rpn = (midi_ctrl[set][channel][100]) | (midi_ctrl[set][channel][101] << 8);
  switch (rpn) {
  case 0:
    range = inpChannelDefaults[set][channel].pbRange;
    if (range != 0) {
      --range;
    }
    inpChannelDefaults[set][channel].pbRange = range;
    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].pbUpperKeyRange = range;
        synthVoice[i].pbLowerKeyRange = range;
      }
    }
    break;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  case 0x7f7d: {
    if (inpChannelDefaults[set][channel].lpfLowerFrqBoundary != 0) {
      --inpChannelDefaults[set][channel].lpfLowerFrqBoundary;
    }

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfLowerFrqBoundary = inpChannelDefaults[set][channel].lpfLowerFrqBoundary;
      }
    }
  } break;

  case 0x7f7e: {
    if (inpChannelDefaults[set][channel].lpfUpperFrqBoundary != 0) {
      --inpChannelDefaults[set][channel].lpfUpperFrqBoundary;
    }

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfUpperFrqBoundary = inpChannelDefaults[set][channel].lpfUpperFrqBoundary;
      }
    }
  } break;
#endif
  default:
    break;
  }
}

void inpSetRPNInc(u8 set, u8 channel) {
  u16 rpn;  // r28
  u32 i;    // r31
  u8 range; // r30

  rpn = (midi_ctrl[set][channel][100]) | (midi_ctrl[set][channel][101] << 8);
  switch (rpn) {
  case 0:
    range = inpChannelDefaults[set][channel].pbRange;
    if (range < 24) {
      ++range;
    }

    inpChannelDefaults[set][channel].pbRange = range;
    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].pbUpperKeyRange = range;
        synthVoice[i].pbLowerKeyRange = range;
      }
    }
    break;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  case 0x7f7d: {
    if (inpChannelDefaults[set][channel].lpfLowerFrqBoundary != 0x3FFF) {
      ++inpChannelDefaults[set][channel].lpfLowerFrqBoundary;
    }

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfLowerFrqBoundary = inpChannelDefaults[set][channel].lpfLowerFrqBoundary;
      }
    }
  } break;

  case 0x7f7e: {
    if (inpChannelDefaults[set][channel].lpfUpperFrqBoundary != 0x3FFF) {
      ++inpChannelDefaults[set][channel].lpfUpperFrqBoundary;
    }

    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].lpfUpperFrqBoundary = inpChannelDefaults[set][channel].lpfUpperFrqBoundary;
      }
    }
  } break;
#endif
  default:
    break;
  }
}

void inpSetMidiCtrl(u8 ctrl, u8 channel, u8 set, u8 value) {
  u32 i;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  bool changed;
#endif
  if (channel == 0xFF) {
    return;
  }

  if (set != 0xFF) {
    switch (ctrl) {
    case 6:
      inpSetRPNHi(set, channel, value);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
    case 38:
      inpSetRPNLo(set, channel, value);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
    case 96:
      inpSetRPNDec(set, channel);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
    case 97:
      inpSetRPNInc(set, channel);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
    default:
      changed = midi_ctrl[set][channel][ctrl] != (u8)(value & 0x7f);
      break;
#endif
    }

    midi_ctrl[set][channel][ctrl] = (value & 0x7f);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
    if (changed) {
      for (i = 0; i < synthInfo.voiceNum; ++i) {
        if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
          synthVoice[i].midiDirtyFlags = 0x7fff;
          synthKeyStateUpdate(&synthVoice[i]);
        }
      }
      inpGlobalMIDIDirtyFlags[set][channel] = 0xff;
    }
#else
    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].midiDirtyFlags = 0x1fff;
        synthKeyStateUpdate(&synthVoice[i]);
      }
    }
    inpGlobalMIDIDirtyFlags[set][channel] = 0xff;
#endif

  } else {
    switch (ctrl) {
    case 6:
      inpSetRPNHi(set, channel, value);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
    case 38:
      inpSetRPNLo(set, channel, value);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
    case 96:
      inpSetRPNDec(set, channel);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
    case 97:
      inpSetRPNInc(set, channel);
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
      changed = TRUE;
#endif
      break;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
    default:
      changed = fx_ctrl[channel][ctrl] != (u8)(value & 0x7f);
      break;
#endif
    }

    fx_ctrl[channel][ctrl] = value & 0x7f;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
    if (changed) {
      for (i = 0; i < synthInfo.voiceNum; ++i) {
        if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
          synthVoice[i].midiDirtyFlags = 0x7fff;
          synthKeyStateUpdate(&synthVoice[i]);
        }
      }
    }
#else
    for (i = 0; i < synthInfo.voiceNum; ++i) {
      if (set == synthVoice[i].midiSet && channel == synthVoice[i].midi) {
        synthVoice[i].midiDirtyFlags = 0x1fff;
        synthKeyStateUpdate(&synthVoice[i]);
      }
    }
#endif
  }
}

void inpSetMidiCtrl14(u8 ctrl, u8 channel, u8 set, u16 value) {

  if (channel == 0xFF) {
    return;
  }

  if (ctrl < 64) {
    inpSetMidiCtrl(ctrl & 31, channel, set, value >> 7);
    inpSetMidiCtrl((ctrl & 31) + 32, channel, set, value & 0x7f);
  } else if (ctrl == 128 || ctrl == 129) {
    inpSetMidiCtrl(ctrl & 254, channel, set, value >> 7);
    inpSetMidiCtrl((ctrl & 254) + 1, channel, set, value & 0x7f);
  } else if (ctrl == 132 || ctrl == 133) {
    inpSetMidiCtrl(ctrl & 254, channel, set, value >> 7);
    inpSetMidiCtrl((ctrl & 254) + 1, channel, set, value & 0x7f);
  } else {
    inpSetMidiCtrl(ctrl, channel, set, value >> 7);
  }
}

static const u8 inpColdMIDIDefaults[134] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7F, 0x00, 0x00, 0x40, 0x7F, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00,
};
static const u8 inpWarmMIDIDefaults[134] = {
    0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
    0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x40, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,

};

void inpResetMidiCtrl(u8 ch, u8 set, u32 coldReset) {
  const u8* values; // r30
  u8* dest;         // r29
  u32 i;            // r31

  values = (coldReset ? inpColdMIDIDefaults : inpWarmMIDIDefaults);
  dest = set != 0xFF ? midi_ctrl[set][ch] : fx_ctrl[ch];

  if (coldReset) {
    memcpy(dest, values, 134);
  } else {
    for (i = 0; i < 134; ++i) {
      if (values[i] != 0xFF) {
        dest[i] = values[i];
      }
    }
  }

  inpSetMidiLastNote(ch, set, 0xFF);
}

u16 inpGetMidiCtrl(u8 ctrl, u8 channel, u8 set) {

  if (channel != 0xff) {
    if (set != 0xff) {

      if (ctrl < 0x40) {
        return midi_ctrl[set][channel][ctrl & 0x1f] << 7 |
               midi_ctrl[set][channel][(ctrl & 0x1f) + 0x20];
      }
      if (ctrl < 0x46) {
        return midi_ctrl[set][channel][ctrl] < 0x40 ? 0 : 0x3fff;
      }
      if (ctrl >= 0x60 && ctrl < 0x66) {
        return 0;
      }

      if ((ctrl == 0x80) || (ctrl == 0x81)) {
        return midi_ctrl[set][channel][ctrl & 0xfe] << 7 |
               midi_ctrl[set][channel][(ctrl & 0xfe) + 1];
      }
      if ((ctrl == 0x84) || (ctrl == 0x85)) {
        return midi_ctrl[set][channel][ctrl & 0xfe] << 7 |
               midi_ctrl[set][channel][(ctrl & 0xfe) + 1];
      }

      return midi_ctrl[set][channel][ctrl] << 7;
    }
    if (ctrl < 0x40) {
      return fx_ctrl[channel][ctrl & 0x1f] << 7 | fx_ctrl[channel][(ctrl & 0x1f) + 0x20];
    }
    if (ctrl < 0x46) {
      return fx_ctrl[channel][ctrl] < 0x40 ? 0 : 0x3fff;
    }
    if (ctrl >= 0x60 && ctrl < 0x66) {
      return 0;
    }
    if ((ctrl == 0x80) || (ctrl == 0x81)) {
      return fx_ctrl[channel][ctrl & 0xfe] << 7 | fx_ctrl[channel][(ctrl & 0xfe) + 1];
    }
    if ((ctrl == 0x84) || (ctrl == 0x85)) {
      return fx_ctrl[channel][ctrl & 0xfe] << 7 | fx_ctrl[channel][(ctrl & 0xfe) + 1];
    }
    return fx_ctrl[channel][ctrl] << 7;
  }
  return 0;
}

CHANNEL_DEFAULTS* inpGetChannelDefaults(u8 midi, u8 midiSet) {
  if (midiSet == 0xFF) {
    return &inpFXChannelDefaults[midi];
  }

  return &inpChannelDefaults[midiSet][midi];
}

void inpResetChannelDefaults(u8 midi, u8 midiSet) {
  CHANNEL_DEFAULTS* channelDefaults; // r31
  channelDefaults =
      midiSet != 0xFF ? &inpChannelDefaults[midiSet][midi] : &inpFXChannelDefaults[midi];
  channelDefaults->pbRange = 2;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  channelDefaults->lpfLowerFrqBoundary = lpfLowFrequencyDefault;
  channelDefaults->lpfUpperFrqBoundary = lpfHighFrequencyDefault;
#endif
}

void inpAddCtrl(CTRL_DEST* dest, u8 ctrl, s32 scale, u8 comb, u32 isVar) {
  u8 n; // r30
  if (comb == 0) {
    dest->numSource = 0;
  }

  if (dest->numSource < 4) {
    n = dest->numSource++;
    if (isVar == 0) {
      ctrl = inpTranslateExCtrl(ctrl);
    } else {
      comb |= 0x10;
    }

    dest->source[n].midiCtrl = ctrl;
    dest->source[n].combine = comb;
    dest->source[n].scale = scale;
  }
}

void inpFXCopyCtrl(u8 ctrl, SYNTH_VOICE* dvoice, SYNTH_VOICE* svoice) {
  u8 di; // r30
  u8 si; // r29
  di = dvoice->id;
  si = svoice->id;

  if (ctrl < 64) {
    fx_ctrl[di][ctrl & 31] = fx_ctrl[si][ctrl & 31];
    fx_ctrl[di][(ctrl & 31) + 32] = fx_ctrl[si][(ctrl & 31) + 32];
  } else if (ctrl == 128 || ctrl == 129) {
    fx_ctrl[di][ctrl & 254] = fx_ctrl[si][ctrl & 254];
    fx_ctrl[di][(ctrl & 254) + 1] = fx_ctrl[si][(ctrl & 254) + 1];
  } else if (ctrl == 132 || ctrl == 133) {
    fx_ctrl[di][ctrl & 254] = fx_ctrl[si][ctrl & 254];
    fx_ctrl[di][(ctrl & 254) + 1] = fx_ctrl[si][(ctrl & 254) + 1];
  } else {
    fx_ctrl[di][ctrl] = fx_ctrl[si][ctrl];
  }
}

void inpSetMidiLastNote(u8 midi, u8 midiSet, u8 key) {
  if (midiSet != 0xFF) {
    midi_lastNote[midiSet][midi] = key;
  } else {
    fx_lastNote[midi] = key;
  }
}

u8 inpGetMidiLastNote(u8 midi, u8 midiSet) {
  if (midiSet != 0xFF) {
    return midi_lastNote[midiSet][midi];
  }
  return fx_lastNote[midi];
}

static u16 _GetInputValue(struct SYNTH_VOICE* svoice /* r27 */, struct CTRL_DEST* inp /* r24 */,
                          u8 midi /* r22 */, u8 midiSet /* r23 */) {
  u32 i;     // r26
  u32 value; // r29
  u8 ctrl;   // r28
  s32 tmp;   // r31
  s32 vtmp;  // r30
  bool sign; // r25

  for (value = 0, i = 0; i < inp->numSource; ++i) {
    if (inp->source[i].combine & 0x10) {
      tmp = (svoice != NULL ? varGet(svoice, 0, inp->source[i].midiCtrl) : 0);
      goto block_18;
    }
    ctrl = inp->source[i].midiCtrl;
    if (ctrl == 128 || ctrl == 1 || ctrl == 10 || ctrl == 160 || ctrl == 161 || ctrl == 131) {
      switch (ctrl) {
      case 160:
      case 161:
        if (svoice != NULL) {
          tmp = svoice->lfo[ctrl - 160].value << 1;
          svoice->lfoUsedByInput[ctrl - 160] = 1;
        } else {
          tmp = 0;
        }
        break;
      default:
        tmp = inpGetMidiCtrl(ctrl, midi, midiSet) - 0x2000;
        break;
      }
    block_18:
      tmp = (tmp * (inp->source[i].scale >> 1)) >> 15;
      tmp = CLAMP_INV(tmp, -0x2000, 0x1FFF);
      switch (inp->source[i].combine & 15) {
      case 0:
        value = tmp + 0x2000;
        sign = TRUE;
        break;
      case 1:
        if (sign != FALSE) {
          vtmp = (value + tmp);
          vtmp -= 0x2000;
          value = CLAMP_INV(vtmp, -0x2000, 0x1FFF) + 0x2000;
        } else {
          vtmp = value + tmp;
          value = CLAMP(vtmp, 0, 0x3FFF);
        }
        break;
      case 2:
        if (sign != FALSE) {
          vtmp = (s32)((value - 0x2000) * tmp) >> 13;
        } else {
          vtmp = (tmp * value) >> 13;
          sign = TRUE;
        }
        value = CLAMP_INV(vtmp, -0x2000, 0x1FFF) + 0x2000;
        break;
      case 3:
        if (sign != FALSE) {
          vtmp = (value - 0x2000) - tmp;
          value = CLAMP_INV(vtmp, -0x2000, 0x1FFF) + 0x2000;
        } else {
          vtmp = value - tmp;
          value = CLAMP(vtmp, 0, 0x3FFF);
        }
        break;
      }
    } else {
      switch (ctrl) {
      case 162:
        if (svoice != NULL) {
          tmp = svoice->orgNote << 7;
        } else {
          tmp = 0;
        }
        break;
      case 163:
        tmp = svoice != NULL ? svoice->orgVolume >> 9 : 0;
        break;
      case 164:
        if (svoice != NULL) {
          tmp = (synthRealTime - svoice->macStartTime) >> 8;
          if (tmp > 0x3fff) {
            tmp = 0x3fff;
          }
          svoice->timeUsedByInput = 1;
        } else {
          tmp = 0;
        }
        break;
      default:
        tmp = inpGetMidiCtrl(ctrl, midi, midiSet);
        break;
      }
      tmp = (tmp * (inp->source[i].scale >> 1)) >> 15;
      if (tmp > 0x3FFF) {
        tmp = 0x3FFF;
      }
      switch (inp->source[i].combine & 0xF) {
      case 0:
        value = tmp;
        sign = FALSE;
        break;
      case 1:
        if (sign != FALSE) {
          vtmp = (value + tmp);
          vtmp -= 0x2000;
          value = CLAMP_INV(vtmp, -0x2000, 0x1FFF) + 0x2000;
        } else {
          value += tmp;
          value = MIN(value, 0x3FFF);
        }
        break;
      case 2:
        if (sign != FALSE) {
          vtmp = (s32)(tmp * (value - 0x2000)) >> 14;
          value = CLAMP_INV(vtmp, -0x2000, 0x1FFF) + 0x2000;
        } else {
          value = ((value * tmp) >> 0xE);
          value = MIN(value, 0x3FFF);
        }
        break;
      case 3:
        if (sign != FALSE) {
          vtmp = (value - 0x2000) - tmp;
          value = CLAMP_INV(vtmp, -0x2000, 0x1FFF) + 0x2000;
        } else {
          vtmp = value - tmp;
          value = CLAMP(vtmp, 0, 0x3FFF);
        }
        break;
      }
    }
  }
  inp->oldValue = value;
  return value;
}

static u16 GetInputValue(SYNTH_VOICE* svoice, CTRL_DEST* inp, u32 dirtyMask) {

  if (!(svoice->midiDirtyFlags & dirtyMask)) {
    return inp->oldValue;
  }

  svoice->midiDirtyFlags &= ~dirtyMask;

  return _GetInputValue(svoice, inp, svoice->midi, svoice->midiSet);
}

static u16 GetGlobalInputValue(CTRL_DEST* inp, u32 dirtyMask, u8 midi, u8 midiSet) {
  if (!inpResetGlobalMIDIDirtyFlag(midi, midiSet, dirtyMask)) {
    return inp->oldValue;
  }
  return _GetInputValue(NULL, inp, midi, midiSet);
}

u16 inpGetVolume(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpVolume, 0x1); }

u16 inpGetPanning(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpPanning, 0x2); }

u16 inpGetSurPanning(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpSurroundPanning, 0x4);
}

u16 inpGetPitchBend(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpPitchBend, 0x8);
}

u16 inpGetDoppler(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpDoppler, 0x10); }

u16 inpGetModulation(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpModulation, 0x20);
}

u16 inpGetPedal(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpPedal, 0x40); }

u16 inpGetPreAuxA(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpPreAuxA, 0x100); }

u16 inpGetReverb(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpReverb, 0x200); }

u16 inpGetPreAuxB(SYNTH_VOICE* svoice) { return GetInputValue(svoice, &svoice->inpPreAuxB, 0x400); }

u16 inpGetPostAuxB(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpPostAuxB, 0x800);
}

u16 inpGetTremolo(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpTremolo, 0x1000);
}

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
u16 inpGetFilterSwitch(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpFilterSwitch, 0x2000);
}

u16 inpGetFilterParameter(SYNTH_VOICE* svoice) {
  return GetInputValue(svoice, &svoice->inpFilterParameter, 0x4000);
}
#endif

u16 inpGetAuxA(u8 studio, u8 index, u8 midi, u8 midiSet) {
  static u32 dirtyMask[4] = {0x80000001, 0x80000002, 0x80000004, 0x80000008};
  return GetGlobalInputValue(&inpAuxA[studio][index], dirtyMask[index], midi, midiSet);
}

u16 inpGetAuxB(u8 studio, u8 index, u8 midi, u8 midiSet) {
  static u32 dirtyMask[4] = {0x80000010, 0x80000020, 0x80000040, 0x80000080};

  return GetGlobalInputValue(&inpAuxB[studio][index], dirtyMask[index], midi, midiSet);
}

void inpInit(SYNTH_VOICE* svoice) {
  u32 i; // r30
  u32 s; // r29

  if (svoice != NULL) {
    svoice->inpVolume.source[0].midiCtrl = 7;
    svoice->inpVolume.source[0].combine = 0;
    svoice->inpVolume.source[0].scale = 0x10000;
    svoice->inpVolume.source[1].midiCtrl = 11;
    svoice->inpVolume.source[1].combine = 2;
    svoice->inpVolume.source[1].scale = 0x10000;
    svoice->inpVolume.numSource = 2;
    svoice->inpPanning.source[0].midiCtrl = 10;
    svoice->inpPanning.source[0].combine = 0;
    svoice->inpPanning.source[0].scale = 0x10000;
    svoice->inpPanning.numSource = 1;
    svoice->inpSurroundPanning.source[0].midiCtrl = 131;
    svoice->inpSurroundPanning.source[0].combine = 0;
    svoice->inpSurroundPanning.source[0].scale = 0x10000;
    svoice->inpSurroundPanning.numSource = 1;
    svoice->inpPitchBend.source[0].midiCtrl = 128;
    svoice->inpPitchBend.source[0].combine = 0;
    svoice->inpPitchBend.source[0].scale = 0x10000;
    svoice->inpPitchBend.numSource = 1;
    svoice->inpModulation.source[0].midiCtrl = 1;
    svoice->inpModulation.source[0].combine = 0;
    svoice->inpModulation.source[0].scale = 0x10000;
    svoice->inpModulation.numSource = 1;
    svoice->inpPedal.source[0].midiCtrl = 64;
    svoice->inpPedal.source[0].combine = 0;
    svoice->inpPedal.source[0].scale = 0x10000;
    svoice->inpPedal.numSource = 1;
    svoice->inpPortamento.source[0].midiCtrl = 65;
    svoice->inpPortamento.source[0].combine = 0;
    svoice->inpPortamento.source[0].scale = 0x10000;
    svoice->inpPortamento.numSource = 1;
    svoice->inpPreAuxA.numSource = 0;
    svoice->inpReverb.source[0].midiCtrl = 91;
    svoice->inpReverb.source[0].combine = 0;
    svoice->inpReverb.source[0].scale = 0x10000;
    svoice->inpReverb.numSource = 1;
    svoice->inpPreAuxB.numSource = 0;
    svoice->inpPostAuxB.source[0].midiCtrl = 93;
    svoice->inpPostAuxB.source[0].combine = 0;
    svoice->inpPostAuxB.source[0].scale = 0x10000;
    svoice->inpPostAuxB.numSource = 1;
    svoice->inpDoppler.source[0].midiCtrl = 132;
    svoice->inpDoppler.source[0].combine = 0;
    svoice->inpDoppler.source[0].scale = 0x10000;
    svoice->inpDoppler.numSource = 1;
    svoice->inpTremolo.numSource = 0;
#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
    svoice->inpFilterSwitch.source[0].midiCtrl = 0x4f;
    svoice->inpFilterSwitch.source[0].combine = 0;
    svoice->inpFilterSwitch.source[0].scale = 0x10000;
    svoice->inpFilterSwitch.numSource = 1;
    svoice->inpFilterParameter.source[0].midiCtrl = 0x1f;
    svoice->inpFilterParameter.source[0].combine = 0;
    svoice->inpFilterParameter.source[0].scale = 0x10000;
    svoice->inpFilterParameter.numSource = 1;
#endif

#if MUSY_VERSION <= MUSY_VERSION_CHECK(2, 0, 0)
    svoice->midiDirtyFlags = 0x1fff;
#else
    svoice->midiDirtyFlags = 0x7fff;
#endif
    svoice->lfoUsedByInput[0] = 0;
    svoice->lfoUsedByInput[1] = 0;
    svoice->timeUsedByInput = 0;
  } else {
    for (s = 0; s < 8; ++s) {
      for (i = 0; i < 4; ++i) {
        inpAuxA[s][i].numSource = 0;
        inpAuxB[s][i].numSource = 0;
      }
    }

    inpResetGlobalMIDIDirtyFlags();
  }

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
  lpfLowFrequencyDefault = 80;
  lpfHighFrequencyDefault = 16000;
#endif
}

#if MUSY_VERSION >= MUSY_VERSION_CHECK(2, 0, 1)
void inpSetLPFDefaultRange(u32 lowFrq, u32 highFrq) {
  lpfLowFrequencyDefault = lowFrq;
  lpfHighFrequencyDefault = highFrq;
}
#endif

u8 inpTranslateExCtrl(u8 ctrl) {
  switch (ctrl) {
  case 0x80:
    ctrl = 0x80;
    break;
  case 0x81:
    ctrl = 0x82;
    break;
  case 0x82:
    ctrl = 0xa0;
    break;
  case 0x83:
    ctrl = 0xa1;
    break;
  case 0x84:
    ctrl = 0x83;
    break;
  case 0x85:
    ctrl = 0x84;
    break;
  case 0x86:
    ctrl = 0xa2;
    break;
  case 0x87:
    ctrl = 0xa3;
    break;
  case 0x88:
    ctrl = 0xa4;
    break;
  }
  return ctrl;
}
u16 inpGetExCtrl(SYNTH_VOICE* svoice, u8 ctrl) {
  u16 v; // r30
  switch (inpTranslateExCtrl(ctrl)) {
  case 160:
    v = (svoice->lfo[0].value << 1) + 0x2000;
    break;
  case 161:
    v = (svoice->lfo[1].value << 1) + 0x2000;
    break;
  default:
    v = svoice->midi != 0xFF ? inpGetMidiCtrl(ctrl, svoice->midi, svoice->midiSet) : 0;
    break;
  }

  return v;
}
void inpSetExCtrl(SYNTH_VOICE* svoice, u8 ctrl, s16 v) {
  v = v < 0 ? 0 : v > 0x3fff ? 0x3fff : v;

  switch (inpTranslateExCtrl(ctrl)) {
  case 161:
  case 160:
    break;
  default:
    if (svoice->midi != 0xFF) {
      inpSetMidiCtrl14(ctrl, svoice->midi, svoice->midiSet, v);
    }
    break;
  }
}
