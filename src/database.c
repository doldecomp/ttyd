#include "database.h"
#include "driver/arcdrv.h"
#include "mgr/evtmgr.h"
#include "memory.h"
#include "system.h"
#include <string.h>

extern int sprintf(char* str, const char* format, ...);

//.sbss
void* ptr; //but why
u32 size;

void setupDataLoad(const char* mapName) {
	char path[64];
	DVDEntry* dvd;
	u32 filesize;

	ptr = NULL;
	sprintf(path, "%s/m/%s/s", getMarioStDvdRoot(), mapName);
	if (strcmp(mapName, "muj_20") || evtGetValue(NULL, GSW(0)) != 2) {
		arcOpen(path, &ptr, &size);
		if (!ptr) {
			dvd = DVDMgrOpen(path, 2, 0);
			if (dvd) {
				filesize = DVDMgrGetLength(dvd);
				size = filesize;
				if (filesize) {
					ptr = _mapAlloc(OSRoundUp32B(filesize));
					DVDMgrRead(dvd, ptr, OSRoundUp32B(size), 0);
				}
				DVDMgrClose(dvd);
			}
		}
	}
}
