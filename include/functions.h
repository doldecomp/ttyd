#ifndef __FUNCTIONS_H_
#define __FUNCTIONS_H_

extern void marioStInit(void);
extern void marioStMain(void);
extern u32 OSGetTick(void);
extern void DEMOBeforeRender(void);
extern void DEMODoneRender(void);
extern void func_8006E66C(void);
extern void sysWaitDrawSync(void);
extern void memset(void *mem, int c, int size);
extern void seq_logoInit(seqdrv_work* work);
extern void seq_logoMain(seqdrv_work* work);
extern void seq_logoExit(seqdrv_work* work);
extern void seq_titleInit(seqdrv_work* work);
extern void seq_titleMain(seqdrv_work* work);
extern void seq_titleExit(seqdrv_work* work);
extern void seq_gameInit(seqdrv_work* work);
extern void seq_gameMain(seqdrv_work* work);
extern void seq_gameExit(seqdrv_work* work);
extern void seq_mapChangeInit(seqdrv_work* work);
extern void seq_mapChangeMain(seqdrv_work* work);
extern void seq_mapChangeExit(seqdrv_work* work);
extern void seq_battleInit(seqdrv_work* work);
extern void seq_battleMain(seqdrv_work* work);
extern void seq_battleExit(seqdrv_work* work);
extern void seq_gameOverInit(seqdrv_work* work);
extern void seq_gameOverMain(seqdrv_work* work);
extern void seq_gameOverExit(seqdrv_work* work);
extern void seq_loadInit(seqdrv_work* work);
extern void seq_loadMain(seqdrv_work* work);
extern void seq_loadExit(seqdrv_work* work);
extern void seq_e3Init(seqdrv_work* work);
extern void seq_e3Main(seqdrv_work* work);
extern void seq_e3Exit(seqdrv_work* work);
extern void* ARCGetStartAddrInMem(const rxArchiveFile* self);
extern u32 ARCGetLength(const rxArchiveFile* self);
extern BOOL ARCOpen(const rxArchive* self, const char* path,
                       rxArchiveFile* pOut);
extern BOOL ARCClose(rxArchiveFile* self);
extern BOOL ARCInitHandle(void* pData, rxArchive* pOut);

#endif
