#pragma once

#include "driver/effdrv.h"
#include <dolphin/types.h>

EffectEntry* effKemuriEntry(s32 int2, f32 float3, f32 float4, f32 float5);
void effKemuriMain(EffectEntry* effect);
