#ifndef _DOLPHIN_CARDFORMAT_H_
#define _DOLPHIN_CARDFORMAT_H_

#include <dolphin/types.h>

typedef void (*CARDCallback)(s32 chan, s32 result);

long CARDFormat(long chan);
s32 CARDFormatAsync(s32 chan, CARDCallback callback);

#endif // _DOLPHIN_CARDFORMAT_H_
