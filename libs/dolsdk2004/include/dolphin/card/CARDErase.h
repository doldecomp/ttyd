#ifndef _DOLPHIN_CARDERASE_H_
#define _DOLPHIN_CARDERASE_H_

s32 CARDEraseAsync(CARDFileInfo* fileInfo, s32 length, s32 offset, CARDCallback callback);
s32 CARDErase(CARDFileInfo* fileInfo, s32 length, s32 offset);

#endif // _DOLPHIN_CARDERASE_H_
