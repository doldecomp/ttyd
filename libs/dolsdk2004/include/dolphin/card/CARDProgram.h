#ifndef _DOLPHIN_CARDPROGRAM_H_
#define _DOLPHIN_CARDPROGRAM_H_

s32 CARDProgramAsync(CARDFileInfo* fileInfo, void* buf, s32 length, s32 offset, CARDCallback callback);
s32 CARDProgram(CARDFileInfo* fileInfo, void* buf, s32 length, s32 offset);

#endif // _DOLPHIN_CARDPROGRAM_H_
