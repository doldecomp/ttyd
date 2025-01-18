#ifndef _DOLPHIN_OSEXEC_H_
#define _DOLPHIN_OSEXEC_H_

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    // total size: 0x1C
    int valid; // offset 0x0, size 0x4
    u32 restartCode; // offset 0x4, size 0x4
    u32 bootDol; // offset 0x8, size 0x4
    void* regionStart; // offset 0xC, size 0x4
    void* regionEnd; // offset 0x10, size 0x4
    int argsUseDefault; // offset 0x14, size 0x4
    void* argsAddr; // offset 0x18, size 0x4
} OSExecParams;

typedef int (*appGetNextCallback)(void*, u32*, u32*);
typedef void (*appInitCallback)(void (*)(char*));
typedef void* (*appGetEntryCallback)();
typedef void (*AppLoaderCallback)(appInitCallback*, appGetNextCallback*, appGetEntryCallback*);

OSExecParams* __OSExecParams AT_ADDRESS(0x800030F0);
s32 __OSAppLoaderOffset AT_ADDRESS(0x800030F4);

void OSExecv(const char* dolfile, const char** argv);
void OSExecl(const char* dolfile, const char* arg0, ...);

#ifdef __cplusplus
}
#endif

#endif
