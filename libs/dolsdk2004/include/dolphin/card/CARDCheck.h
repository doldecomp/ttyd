#ifndef _DOLPHIN_CARDCHECK_H_
#define _DOLPHIN_CARDCHECK_H_

s32 CARDCheckExAsync(s32 chan, s32* xferBytes, CARDCallback callback);
s32 CARDCheckAsync(s32 chan, CARDCallback callback);
s32 CARDCheckEx(s32 chan, s32* xferBytes);
long CARDCheck(long chan);

#endif // _DOLPHIN_CARDCHECK_H_
