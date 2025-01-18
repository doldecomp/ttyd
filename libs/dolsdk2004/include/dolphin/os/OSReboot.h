#ifndef _DOLPHIN_OSREBOOT_H_
#define _DOLPHIN_OSREBOOT_H_

#ifdef __cplusplus
extern "C" {
#endif

void OSGetSaveRegion(void** start, void** end);
void __OSReboot(u32 resetCode, u32 bootDol);

#ifdef __cplusplus
}
#endif

#endif
