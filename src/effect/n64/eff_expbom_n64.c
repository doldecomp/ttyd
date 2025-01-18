#include "eff/n64/eff_expbom_n64.h"
#include "driver/dispdrv.h"
#include "memory.h"
#include <dolphin/mtx.h>
#include <math.h>
#include <stdlib.h>

typedef struct effExpBomData {
	s16 field_0x0; //0x0
	s16 field_0x2; //0x2
	s16 field_0x4; //0x4
	s16 field_0x6; //0x6
	s32 field_0x8; //0x8
	Vec position; //0xC
	f32 field_0x18; //0x18
	f32 field_0x1C; //0x1C
	f32 field_0x20; //0x20
	f32 field_0x24; //0x24
	u8 field_0x28[0x2C - 0x28]; //0x28
} effExpBomData;

//.sdata
f32 bom_dir[10] = {
	10.0f, 40.0f, 80.0f, 170.0f, 140.0f,
	100.0f, 25.0f, 155.0f, 60.0f, 120.0f
};

f32 bom_spd[] = {
	2.2f, 2.7f, 3.0f, 2.2f, 2.7f,
	3.0f, 1.9f, 1.9f, 1.5f, 1.5f
};

f32 bom_scale[10] = {
	1.4f, 1.3f, 1.2f, 1.3f, 1.4f,
	1.3f, 1.6f, 1.6f, 1.6f, 1.6f
};

f32 bom_ry[10] = {
	0.0f, 234.0f, 468.0f, 702.0f, 936.0f,
	1260.0f, 1404.0f, 1638.0f, 1902.0f, 1976.0f
};

//local prototypes
void effExpBomMain(EffectEntry* effect);
void effExpBomDisp(CameraId cameraId, void* param);

EffectEntry* effExpBomN64Entry(f32 x, f32 y, f32 z) {
	EffectEntry* effect;
	effExpBomData* data;
	s16 random;
	f32 *speed, *direction;
	f32 v28, v29; //TODO: rename
	int i;

	effect = effEntry();
	effect->type = "ExpBomN64";
	effect->count = 10;
	data = __memAlloc(HEAP_EFFECT, sizeof(effExpBomData) * effect->count);
	effect->userdata = data;
	effect->callback = effExpBomMain;
	direction = bom_dir;
	speed = bom_spd;
	for (i = 0; i < effect->count; i++, data++, speed++, direction++) {
		data->field_0x0 = 0;
		random = (s16)(rand() % 6) + 16;
		data->field_0x4 = random;
		data->field_0x2 = random;
		data->field_0x6 = 4;
		data->field_0x8 = 0;
		data->position.x = x;
		data->position.y = y;
		data->position.z = z;
		data->field_0x18 = 0.0f;
		data->field_0x1C = 0.0f;

		v28 = 2.0f * *speed;
		v29 = ((6.2831855f * (90.0f + *direction)) / 360.0f);
		data->field_0x20 = v28 * sinf(v29);
		data->field_0x24 = -v28 * cosf(v29);
	}
	return effect;
}

void effExpBomMain(EffectEntry* effect) {
	BOOL disp;
	effExpBomData* data;
	int i;
	Vec position;

	disp = FALSE;
	data = effect->userdata;
	position = data->position; //TODO: double check copies right

	for (i = 0; i < effect->count; i++, data++) {
		if (data->field_0x2 >= 0 && --data->field_0x8 < 0) {
			disp = TRUE;
			data->field_0x18 += data->field_0x20;
			data->field_0x1C += data->field_0x24;
			data->field_0x0++;
			if (--data->field_0x2 >= 0 && --data->field_0x6 < 0) {
				data->field_0x20 /= 1.25f;
				data->field_0x24 /= 1.25f;
			}
		}
	}
	if (disp) {
		dispEntry(CAMERA_3D, 2, effExpBomDisp, effect, dispCalcZ(&position));
	}
	else {
		effDelete(effect);
	}
}

void effExpBomDisp(CameraId cameraId, void* param) {
	EffectEntry* effect = param; //cast to correct type

}
