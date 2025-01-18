#ifndef _DOLPHIN_CARDCREATE_H_
#define _DOLPHIN_CARDCREATE_H_

s32 CARDCreateAsync(s32 chan, const char* fileName, u32 size, CARDFileInfo* fileInfo, CARDCallback callback);
s32 CARDCreate(long chan, const char* fileName, unsigned long size, struct CARDFileInfo * fileInfo);

#endif // _DOLPHIN_CARDCREATE_H_
