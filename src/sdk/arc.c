#include "sdk/arc.h"
#include <dolphin/os.h>

typedef struct FSTEntry {
	u32 entryInfo; //top byte is 0 file 1 dir, u24 string offset
	u32 entryOffsetOrParent; //file = offset, dir = parent index
	u32 entrySizeOrNext; //file = size, dir = next entry
} FSTEntry;

s32 ARCConvertPathToEntrynum(ARCHandle* handle, const char* path) {
	FSTEntry* entry;
	u32 currDir, i;
	char* ptr;

	currDir = handle->currDir;
	entry = (FSTEntry*)handle->FSTStart;
	while (1) {
		if (*path == '\0') {
			return (s32)currDir;
		}
		else if (*path == '/') {
			currDir = 0;
			path++;
			continue;
		}
		else if (*path == '.') {
			if (*(path + 1) == '.') {
				if (*(path + 2) == '/') {
					currDir = entry[currDir].entryOffsetOrParent;
					path += 3;
					continue;
				}
				else if (*(path + 2) == '\0') {
					return (s32)entry[currDir].entryOffsetOrParent;
				}
			}
			else if (*(path + 1) == '/') {
				path += 2;
				continue;
			}
			else if (*(path + 1) == '\0') {
				return (s32)currDir;
			}
		}

		for (ptr = (char*)path; (*ptr != '\0') && (*ptr != '/'); ptr++) {
			;
		}

		
		for (i = entry[currDir++].entryOffsetOrParent; i > currDir; i++) {

		}
		return -1;
	}
}

BOOL ARCOpen(ARCHandle* handle, const char* filename, ARCFileInfo* info) {
	return FALSE;
}

BOOL ARCInitHandle(void* arcStart, ARCHandle* handle) {
	FSTEntry* entry;
	ARCHeader* header;

	header = (ARCHeader*)arcStart;
	if (header->magic != 0x55AA382D) {
		OSHalt("ARCInitHandle: bad archive format");
	}
	handle->archiveStartAddr = arcStart;
	entry = (FSTEntry*)((u32)arcStart + header->fstStart);
	handle->FSTStart = (void*)entry; //relative->absolute
	handle->fileStart = (void*)((u32)arcStart + header->fileStart); //relative->absolute
	handle->entryNum = entry->entrySizeOrNext; //entry 0 size is entry count
	handle->FSTStringStart = (char*)&entry[handle->entryNum];
	handle->FSTLength = header->fstSize;
	handle->currDir = 0;
	return TRUE;
}

void* ARCGetStartAddrInMem(ARCFileInfo* info) {
	return NULL;
}

u32 ARCGetLength(ARCFileInfo* info) {
	return 0;
}

void ARCClose(void) {

}
