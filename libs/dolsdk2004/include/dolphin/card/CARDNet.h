#ifndef _DOLPHIN_CARDNET_H_
#define _DOLPHIN_CARDNET_H_

u16 CARDSetVendorID(u16 vendorID);
u16 CARDGetVendorID();
s32 CARDGetSerialNo(s32 chan, u64* serialNo);
s32 CARDGetUniqueCode(s32 chan, u64* uniqueCode);
s32 CARDGetAttributes(s32 chan, s32 fileNo, u8* attr);
s32 CARDSetAttributesAsync(s32 chan, s32 fileNo, u8 attr, CARDCallback callback);
s32 CARDSetAttributes(s32 chan, s32 fileNo, u8 attr);

#endif // _DOLPHIN_CARDNET_H_
