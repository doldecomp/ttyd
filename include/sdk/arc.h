#pragma once

#include <dolphin/types.h>

typedef struct ARCHeader {
	u32 magic;
	s32 fstStart;
	u32 fstSize;
	s32 fileStart;
	s32 reserved[4];
} ARCHeader;

typedef struct ARCHandle {
	void* archiveStartAddr;
	void* FSTStart;
	void* fileStart;
	u32 entryNum;
	char* FSTStringStart;
	u32 FSTLength;
	u32 currDir;
} ARCHandle;

typedef struct ARCFileInfo {
	ARCHandle* handle;
	u32 startOffset;
	u32 length;
} ARCFileInfo;

s32 ARCConvertPathToEntrynum(ARCHandle* handle, const char* path);
BOOL ARCOpen(ARCHandle* handle, const char* filename, ARCFileInfo* info);
BOOL ARCInitHandle(void* arcStart, ARCHandle* handle);



void* ARCGetStartAddrInMem(ARCFileInfo* info);
u32 ARCGetLength(ARCFileInfo* info);
void ARCClose(void);

