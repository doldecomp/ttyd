#include "eff/eff_scanning.h"
#include "driver/animdrv.h"
#include "driver/dispdrv.h"
#include "mario/mariost.h"
#include "memory.h"
#include <dolphin/mtx.h>

extern GlobalWork* gp;

typedef struct effScanningData {
	s32 field_0x0; //0x0
	Vec position; //0x4
	f32 field_0x10; //0x10
	s32 animId; //0x14
	s32 field_0x18; //0x18
	s32 field_0x1C; //0x1C
	s32 field_0x20; //0x20
} effScanningData;

void effScanningMain(EffectEntry* effect);
void effScanningDisp(CameraId camId, void* param);

EffectEntry* effScanningEntry(s32 int2, f32 float3, f32 float4, f32 float5) {
	EffectEntry* entry;
	effScanningData* data;
	
	
	entry = effEntry();
	entry->type = "Scanning";
	entry->count = 1;
	data = __memAlloc(HEAP_EFFECT, sizeof(effScanningData) * entry->count);
	entry->userdata = data;
	entry->callback = effScanningMain;
	entry->flags |= 2;

	data->field_0x0 = int2;
	data->position.x = float3;
	data->position.y = float4;
	data->position.z = float5;
	data->field_0x10 = 1.0f;
	data->animId = -1;
	data->field_0x18 = 0;
	data->field_0x1C = 0;
	data->field_0x20 = 255;

	return entry;
}

void effScanningMain(EffectEntry* effect) {
	BOOL inBattle;
	Vec disp = { 0 }; //loads Vec from .rodata before being overwritten
	effScanningData* data = effect->userdata;
	disp.x = data->position.x;
	disp.y = data->position.y;
	disp.z = data->position.z;

	inBattle = gp->inBattle != 0;

	if (effect->flags & 4) { //soft delete
		effect->flags &= ~4;
		if (data->animId != -1) {
			animPoseRelease(data->animId);
		}
		effDelete(effect);
	}
	else {
		switch (data->field_0x18) {
		case 0:
			/*if (!animGroupBaseAsync("EFF_Scan", inBattle, 0)) {
				return;
			}*/
			data->animId = animPoseEntry("EFF_Scan", (u32)inBattle);
			animPoseSetAnim(data->animId, "Z_1", 1);
			data->field_0x18++;
			break;
		case 1:
			if (animPoseGetLoopTimes(data->animId) > 1.0f) {
				animPoseRelease(data->animId);
				effDelete(effect);
				return;
			}
			break;
		}
		dispEntry(CAMERA_3D, 2, effScanningDisp, effect, dispCalcZ(&disp));
	}
}

void effScanningDisp(CameraId camId, void* param) {

}
