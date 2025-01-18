#include "eff/eff_kemuri.h"
#include "driver/dispdrv.h"
#include "memory.h"

typedef struct effKemuriData {
	s32 field_0x0; //0x0
	f32 field_0x4; //0x4
	f32 field_0x8; //0x8
	f32 field_0xC; //0xC
	u8 field_0x10[0x40 - 0x10]; //0x10
	s32 field_0x40; //0x40
	f32 field_0x44; //0x44
	f32 field_0x48; //0x48
	f32 field_0x4C; //0x4C
	u8 field_0x50[0x58 - 0x50]; //0x50
	f32 field_0x58; //0x58
	f32 field_0x5C; //0x5C
	u8 field_0x60[0x74 - 0x60]; //0x60
	f32 field_0x74; //0x74
	u8 field_0x78[0x80 - 0x78]; //0x78
	s32 field_0x80; //0x80
	s32 field_0x84; //0x84
	s32 field_0x88; //0x88
} effKemuriData;

EffectEntry* effKemuriEntry(s32 int2, f32 float3, f32 float4, f32 float5) {
	effKemuriData* data;
	s32 numEffects, i;
	
	EffectEntry* entry = effEntry();
	numEffects = 1;
	switch (int2) {
		case 0:
			numEffects = 3;
			break;
		case 1:
			numEffects = 2;
			break;
		case 2:
			numEffects = 2;
			break;
	}
	entry->type = "Kemuri";
	entry->count = numEffects;
	data = (effKemuriData*)__memAlloc(HEAP_EFFECT, sizeof(effKemuriData) * numEffects);
	entry->userdata = data;
	entry->callback = effKemuriMain;

	data->field_0x0 = int2;
	data->field_0x4 = float3;
	data->field_0x8 = float4;
	data->field_0xC = float5;

	data->field_0x40 = 0;

	data->field_0x44 = 1.0f;
	data->field_0x48 = 1.0f;
	data->field_0x74 = 1.0f;
	for (i = 1; i < entry->count; i++) {
		data[i].field_0x4 = 0.0f;
		data[i].field_0x8 = 0.0f;
		data[i].field_0xC = 0.0f;

		data[i].field_0x44 = 1.0f;
		data[i].field_0x48 = 1.0f;
		data[i].field_0x74 = 1.0f;

		data[i].field_0x58 = 0.0f;
		data[i].field_0x5C = 0.0f;

		data[i].field_0x40 = 0;
		data[i].field_0x80 = 0;
		data[i].field_0x84 = 0;

		switch (int2) {
			case 0:
				data[i].field_0x4C = i & 1 ? 3.0f : -3.0f;
				data[i].field_0x88 = 32;
				break;
			case 1:
				data[i].field_0x4C = 0.0f;
				data[i].field_0x88 = 32;
				break;
			case 2:
				data[i].field_0x4C = 0.0f;
				data[i].field_0x88 = 64;
				break;
		}
	}
	return entry;
}

void effKemuriMain(EffectEntry* effect) {

}

void effKemuriDisp(CameraId cameraId, void* param) {
	EffectEntry* entry = param;
}
