#include "eff/eff_sleep.h"
#include "driver/camdrv.h"
#include "driver/dispdrv.h"
#include "memory.h"
#include <math.h>

//local prototypes
void effSleepDisp(CameraId camId, EffectEntry* effect);

EffectEntry* effSleepEntry(s32 a1, s32 a2, f32 x, f32 y, f32 z, f32 scale, f32 rotation) {
	EffectEntry* effect;
	effSleepData* data;
	f32 radians;
	s32 smth;
	int i;
	
	effect = effEntry();
	effect->type = "Sleep";
	effect->count = 4;
	data = __memAlloc(HEAP_EFFECT, effect->count * sizeof(effSleepData));
	effect->userdata = data;
	effect->callback = effSleepMain;
	effect->flags |= 2;
	data->field_0x0 = a1;
	data->position.x = x;
	data->position.y = y;
	data->position.z = z;
	data->scale = scale;
	data->field_0x14 = 0;
	if (a2 <= 0) {
		data->field_0x18 = 1000;
	}
	else {
		data->field_0x18 = a2;
	}
	data->field_0x1C = 0;

	radians = (6.2831855f * rotation) / 360.0f; //TODO: get radians to f26
	for (smth = 16, i = 1; i < effect->count; smth += 16, i++) {
		data[i].position.x = (16.0f * (f32)i) * (f32)cos(radians);
		data[i].position.y = (16.0f * (f32)i) * (f32)sin(radians);
		data[i].position.z = 0.0f;
		data[i].scale = (0.2f * (f32)i) + 1.0f;
		data[i].field_0x14 = 0;
		data[i].field_0x20 = smth;
	}
	return effect;
}

void effSleepMain(EffectEntry* effect) {

}

void effSleepDisp(CameraId camId, EffectEntry* effect) {

}
