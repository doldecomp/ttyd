#include "driver/lightdrv.h"
#include "driver/camdrv.h"
#include "driver/mapdrv.h"
#include "memory.h"
#include <string.h>

extern int sprintf(char* str, const char* format, ...);

//.rodata
const Vec decay_tbl[] = {
	{1.0f, 0.0f, 0.0f},
	{0.0f, 0.1f, 0.0f},
	{0.0f, 0.0f, 0.01f}, 
	{0.0f, 0.0f, 0.01f}
};

//.sbss
static LightWork work[2];

//.bss
LightEntry booLight;
LightEntry paperCraft;
LightEntry paperLight3DImg;
LightEntry paperLight3D;

//local prototypes
static s32 _sort(const void* a, const void* b);

#define lightGetWork() (mapGetActiveGroup() == 1 ? &work[1] : &work[0])

void lightInit(void) {
	Mtx scale;

	work[0].count = LIGHT_ENTRY_COUNT;
	work[0].entries = __memAlloc(HEAP_DEFAULT, work[0].count * sizeof(LightEntry));

	work[1].count = LIGHT_ENTRY_COUNT;
	work[1].entries = __memAlloc(HEAP_DEFAULT, work[1].count * sizeof(LightEntry));

	paperLight3D.flags = LIGHT_NO_DIST_ATTEN | LIGHT_POINT;
	strcpy(paperLight3D.name, "PAPER");
	paperLight3D.position = (Vec){0.0f, 0.0f, 0.0f};
	paperLight3D.rotation = (Vec){0.0f, 0.0f, 0.0f};
	paperLight3D.color = (GXColor){0xFF, 0xFF, 0xFF, 0xFF};
	paperLight3D.spotAngle = 0.0f;
	paperLight3D.attenAngle = 1.0f;

	paperLight3DImg.flags = LIGHT_NO_DIST_ATTEN | LIGHT_POINT;
	strcpy(paperLight3DImg.name, "PAPERI");
	paperLight3DImg.position = (Vec){0.0f, 0.0f, 1048576.0f};
	paperLight3DImg.rotation = (Vec){0.0f, 0.0f, 0.0f};
	paperLight3DImg.color = (GXColor){0xFF, 0xFF, 0xFF, 0xFF};
	paperLight3DImg.spotAngle = 0.0f;
	paperLight3DImg.attenAngle = 1.0f;

	paperCraft.flags = LIGHT_NO_DIST_ATTEN | LIGHT_POINT;
	strcpy(paperCraft.name, "PAPERCRAFT");
	paperCraft.position = (Vec){-200.0f, 100.0f, 100.0f};
	paperCraft.rotation = (Vec){0.0f, 0.0f, 0.0f};
	paperCraft.color = (GXColor){0xFF, 0xFF, 0xFF, 0xFF};
	paperCraft.spotAngle = 0.0f;
	paperCraft.attenAngle = 1.0f;
	MTXScale(scale, 3.0f, 3.0f, 3.0f);
	MTXMultVec(scale, &paperCraft.position, &paperCraft.position);

	booLight.flags = LIGHT_NO_DIST_ATTEN | LIGHT_POINT;
	strcpy(booLight.name, "BooBoo");
	booLight.position = (Vec){0.0f, 0.0f, 0.0f};
	booLight.rotation = (Vec){0.0f, 0.0f, 0.0f};
	booLight.color = (GXColor){0xFF, 0xFF, 0xFF, 0xFF};
	booLight.spotAngle = 0.0f;
	booLight.attenAngle = 10.0f;
}

void lightReInit(void) {
	LightWork* wp = lightGetWork();
	memset(wp->entries, 0, sizeof(LightEntry) * wp->count);
}

void lightMain(void) {
	CameraEntry* camera;
	Vec position;

	camera = camGetPtr(CAMERA_3D);
	position.x = (camera->view[0][0] * 0.0f) + (camera->view[1][0] * 0.0f) + (camera->view[2][0] * 1.0f);
	position.y = (camera->view[0][1] * 0.0f) + (camera->view[1][1] * 0.0f) + (camera->view[2][1] * 1.0f);
	position.z = (camera->view[0][2] * 0.0f) + (camera->view[1][2] * 0.0f) + (camera->view[2][2] * 1.0f);
	VECNormalize(&position, &position);
	paperLight3D.position.x = 1048576.0f * position.x;
	paperLight3D.position.y = 1048576.0f * position.y;
	paperLight3D.position.z = 1048576.0f * position.z;
	booLight.position = (Vec){0.0f, 1000.0f, 0.0f};
}

s32 lightEntry(const char* name, s32 type, Vec position, Vec rotation, GXColor color, s32 attenType, s32 flags, f32 spotAngle, f32 attenAngle) {
	LightWork* wp = lightGetWork();
	LightEntry* entry;
	s32 i, j, k;
	char v41[320]; //TODO: rename, verify size

	entry = wp->entries;
	for (i = 0; i < wp->count; i++, entry++) {
		if (entry->flags & 1 && !strcmp(entry->name, name)) {
			break;
		}
	}
	//seems like it will break
	if (i < LIGHT_ENTRY_COUNT) {
		for (j = 0;; j++) {
			sprintf(v41, "%s_%04d", name, j);
			entry = wp->entries;
			name = v41; //will keep getting longer
			for (k = 0; k < wp->count; k++, entry++) {
				if (entry->flags & 1 && !strcmp(entry->name, name)) {
					break;
				}
			}
			if (k >= LIGHT_ENTRY_COUNT) {
				break;
			}
		}
	}

	entry = wp->entries;
	for (i = 0; i < wp->count; i++, entry++) {
		if (!(entry->flags & 1)) {
			break;
		}
	}
	memset(entry, 0, sizeof(LightEntry));
	strcpy(entry->name, name);
	entry->position = position;
	entry->rotation = rotation;
	entry->field_0x3C = position;
	entry->color = color;
	entry->spotAngle = spotAngle;
	entry->attenAngle = attenAngle;
	entry->attenDistCoef = decay_tbl[attenType];
	entry->flags |= 1;
	switch (type) {
		case 0:
			entry->flags |= LIGHT_AMBIENT;
			break;
		case 1:
			entry->flags |= LIGHT_POINT;
			break;
		case 2:
			entry->flags |= LIGHT_DIRECTIONAL;
			break;
		case 3:
			entry->flags |= LIGHT_SPOT;
			break;
	}
	return i;
}

LightEntry* lightNameToPtr(const char* name) {
	LightWork* wp = lightGetWork();
	LightEntry* entry = wp->entries;
	s32 i;

	for (i = 0; i < wp->count; i++, entry++) {
		if (entry->flags & 1 && !strcmp(entry->name, name)) {
			return entry;
		}
	}
	return NULL;
}

//TODO: cleanup?
s32 _sort(const void* a, const void* b) {
	f32 value1, value2;

	value1 = *(f32*)(*(u32*)a + 4);
	value2 = *(f32*)(*(u32*)b + 4);
	if (value1 > value2) {
		return 1;
	}
	if (value1 >= value2) {
		return 0;
	}
	return -1;
}

void lightGetNearObj(Vec position, LightEntry* entry, s32 count, LightEntryFlags flags) {

}
