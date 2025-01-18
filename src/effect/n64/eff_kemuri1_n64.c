#include "eff/n64/eff_kemuri1_n64.h"
#include "memory.h"
#include <dolphin/mtx.h>

typedef struct effKemuri1Data {
	u16 type; //0x0
	u8 align_2[2]; //0x2, TODO: verify align
	Vec position; //0x4
	u8 field_0x10[0x38 - 0x10]; //0x10
	s32 field_0x38; //0x38
	s32 field_0x3C; //0x3C
	u8 field_0x40[0x4C - 0x40]; //0x40
	s32 field_0x4C; //0x4C
} effKemuri1Data;

//local prototypes
void effKemuri1Main(EffectEntry* effect);

EffectEntry* effKemuri1N64Entry(s32 type, f32 x, f32 y, f32 z, f32 a5) {
	EffectEntry* effect;
	s32 effCount;
	effKemuri1Data* data;

	effect = effEntry();
	switch (type) {
		case 2:
			effCount = 1;
			break;
		case 3:
			effCount = 4;
			break;
		case 4: //TODO: -strict off, case 4 ... 7:?
		case 5:
		case 6:
		case 7:
			effCount = 9;
			break;
		default:
			effCount = 3;
			break;
	}

	effect->type = "Kemuri1N64";
	effect->count = effCount;
	data = __memAlloc(HEAP_EFFECT, sizeof(effKemuri1Data) * effCount);
	effect->userdata = data;
	effect->callback = effKemuri1Main;
	switch (type) {
		case 0:
		case 1:
			data->field_0x38 = 0;
			data->field_0x4C = 15;
			break;
		case 2:
			data->field_0x38 = 3;
			data->field_0x4C = 65;
			break;
		case 3:
			data->field_0x38 = 2;
			data->field_0x4C = 129;
		case 4: //TODO: -strict off, case 4 ... 7:?
		case 5:
		case 6:
		case 7:
			data->field_0x38 = 3;
			data->field_0x4C = 65;
			break;
		default:
			break;
	}
}

void effKemuri1Main(EffectEntry* effect) {

}