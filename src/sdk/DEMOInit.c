// custom version of normal DEMOInit, idk why they customized it
#include "sdk/DEMOInit.h"
#include "memory.h" //functions we hook
#include <dolphin/dvd.h>
#include <dolphin/os.h>
#include <dolphin/vi.h>
#include <string.h>

static GXRenderModeObj* rmode;
static GXRenderModeObj rmodeobj;
static void* DefaultFifo;
static GXFifoObj* DefaultFifoObj;
void* DemoFrameBuffer1;
void* DemoFrameBuffer2;
void* DemoCurrentBuffer;
static BOOL GPHangWorkaround = FALSE;
extern BOOL DemoStatEnable;
static GXBool DemoFirstFrame = GX_TRUE;

static u32 FrameMissThreshold;
static vu32 FrameCount;
char __GXErrorMessage[0x400];

extern void DEMOPadInit(void); //easier to declare this way
extern void DEMOUpdateStats(GXBool inc);
extern void DEMOPrintStats(void);

extern u16 sysGetToken(void);
extern int sprintf(char* str, const char* format, ...);

//internal, inline
static void __DEMOInitRenderMode(GXRenderModeObj* mode);
static void __DEMOInitMem(void);
static void __DEMOInitGX(void);
static void __DEMOInitVI(void);
static void __NoHangRetraceCallback(u32 count);
static void __NoHangDoneRender(void);
static void __DEMODiagnoseHang(void);

void DEMOInit(GXRenderModeObj* mode) {
	OSInit();
	DVDInit();
	VIInit();
	DEMOPadInit();
	__DEMOInitRenderMode(mode);
	__DEMOInitMem();
	memInit();
	VIConfigure(rmode);
	DefaultFifo = __memAlloc(HEAP_DEFAULT, 0x64000);
	DefaultFifoObj = GXInit(DefaultFifo, 0x64000);
	__DEMOInitGX();
	__DEMOInitVI();
}

static void __DEMOInitRenderMode(GXRenderModeObj* mode) {
	if (mode != NULL) {
		rmodeobj = *mode; //inline copy
		rmode = &rmodeobj;
	}
	else {
		switch (VIGetTvFormat()) {
			case VI_NTSC:
				rmode = &GXNtsc480IntDf;
				break;
			case VI_PAL:
				rmode = &GXPal528IntDf;
				break;
			case VI_EURGB60:
				rmode = &GXEurgb60Hz480IntDf;
				break;
			case VI_MPAL:
				rmode = &GXMpal480IntDf;
				break;
			default:
				OSHalt("DEMOInit: invalid TV format\n");
				break;
		}
		GXAdjustForOverscan(rmode, &rmodeobj, 0, 16);
		rmode = &rmodeobj;
	}
}

static void __DEMOInitMem(void) {
	void *arenaLo, *arenaHi;
	u32 fbSize;

	arenaLo = OSGetArenaLo();
	arenaHi = OSGetArenaHi();

	fbSize = VIPadFrameBufferWidth(rmode->fbWidth) * rmode->xfbHeight * (u32)VI_DISPLAY_PIX_SZ;
	DemoFrameBuffer1 = (void*)OSRoundUp32B((u32)arenaLo);
	DemoFrameBuffer2 = (void*)OSRoundUp32B((u32)DemoFrameBuffer1 + fbSize);
	DemoCurrentBuffer = DemoFrameBuffer2;

	arenaLo = (void*)OSRoundUp32B((u32)DemoFrameBuffer2 + fbSize);
	OSSetArenaLo(arenaLo);
	//newer SDKs have more stuff here
}

static void __DEMOInitGX(void) {
	u16 xfbHeight;
	f32 yScale;

	GXSetViewport(0.0f, 0.0f, (f32)rmode->fbWidth, (f32)rmode->efbHeight, 0.0f, 1.0f);
	GXSetScissor(0, 0, (u32)rmode->fbWidth, (u32)rmode->efbHeight);
	yScale = GXGetYScaleFactor(rmode->efbHeight, rmode->xfbHeight);
	xfbHeight = (u16)GXSetDispCopyYScale(yScale);
	GXSetDispCopySrc(0, 0, rmode->fbWidth, rmode->efbHeight);
	GXSetDispCopyDst(rmode->fbWidth, xfbHeight);
	GXSetCopyFilter(rmode->aa, rmode->sample_pattern, GX_TRUE, rmode->vfilter);

	if (rmode->aa)
		GXSetPixelFmt(GX_PF_RGB565_Z16, GX_ZC_LINEAR);
	else
		GXSetPixelFmt(GX_PF_RGB8_Z24, GX_ZC_LINEAR);

	GXSetCopyClear((GXColor) { 0, 0, 0, 0 }, 0xFFFFFF); //not in latest
	GXCopyDisp(DemoCurrentBuffer, GX_TRUE);
	GXSetDispCopyGamma(GX_GM_1_0);
}

static void __DEMOInitVI(void) {
	VISetNextFrameBuffer(DemoFrameBuffer1);
	DemoCurrentBuffer = DemoFrameBuffer2;
	VIFlush();
	VIWaitForRetrace();
	if (rmode->viTVmode & 1)
		VIWaitForRetrace();
}

void DEMOBeforeRender(void) {
	if (GPHangWorkaround) {
		GXSetDrawSync(sysGetToken());
		GXClearGPMetric();
	}

	if (rmode->field_rendering)
		GXSetViewportJitter(0.0f, 0.0f, (f32)rmode->fbWidth, (f32)rmode->efbHeight, 0.0f, 1.0f, VIGetNextField());
	else
		GXSetViewport(0.0f, 0.0f, (f32)rmode->fbWidth, (f32)rmode->efbHeight, 0.0f, 1.0f);

	GXInvalidateVtxCache();
	GXInvalidateTexAll();
}

void DEMODoneRender(void) {
	if (GPHangWorkaround) {
		__NoHangDoneRender();
		return;
	}

	if (DemoStatEnable) {
		GXDrawDone();
		DEMOUpdateStats(GX_TRUE);
		DEMOPrintStats();
		GXDrawDone();
		DEMOUpdateStats(GX_FALSE);
	}

	GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
	GXSetColorUpdate(GX_TRUE);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_OR, GX_ALWAYS, 0);
	GXSetAlphaUpdate(1);
	GXCopyDisp(DemoCurrentBuffer, GX_TRUE);
	GXDrawDone();
	DEMOSwapBuffers();
}

void DEMOSwapBuffers(void) {
	VISetNextFrameBuffer(DemoCurrentBuffer);
	if (DemoFirstFrame) {
		VISetBlack(FALSE);
		DemoFirstFrame = GX_FALSE;
	}
	VIFlush();
	VIWaitForRetrace();
	if (DemoCurrentBuffer == DemoFrameBuffer1)
		DemoCurrentBuffer = DemoFrameBuffer2;
	else
		DemoCurrentBuffer = DemoFrameBuffer1;
}

GXRenderModeObj* DEMOGetRenderModeObj(void) {
	return rmode;
}

void* DEMOGetCurrentBuffer(void) {
	return DemoCurrentBuffer;
}

void DEMOEnableGPHangWorkaround(u32 timeoutFrames) {
	if (timeoutFrames) {
		GPHangWorkaround = TRUE;
		FrameMissThreshold = timeoutFrames;
		VISetPreRetraceCallback(__NoHangRetraceCallback);
		DEMOSetGPHangMetric(GX_TRUE);
	}
	else {
		GPHangWorkaround = FALSE;
		FrameMissThreshold = 0;
		DEMOSetGPHangMetric(GX_FALSE);
		VISetPreRetraceCallback(NULL);
	}
}

static void __NoHangRetraceCallback(u32 count) {
#pragma unused (count)
	static u32 ovFrameCount = 0;
	static u32 lastOvc = 0;
	u32 ovc;
	GXBool overhi, junk;

	FrameCount++;
	GXGetGPStatus(&overhi, &junk, &junk, &junk, &junk);
	ovc = GXGetOverflowCount();
	if (overhi && (ovc == lastOvc)) {
		ovFrameCount++;
		if (ovFrameCount >= FrameMissThreshold) {
			__DEMODiagnoseHang();
			strcpy(__GXErrorMessage, "---------WARNING : HANG AT HIGH WATERMARK----------\n");
		}
	}
	else {
		lastOvc = ovc;
		ovFrameCount = 0;
	}
}

static void __NoHangDoneRender(void) {
	BOOL abort = FALSE;
	u16 token = sysGetToken();
	GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
	GXSetColorUpdate(GX_TRUE);
	GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_OR, GX_ALWAYS, 0);
	GXSetAlphaUpdate(GX_TRUE);
	GXCopyDisp(DemoCurrentBuffer, GX_TRUE);
	GXSetDrawSync(token);
	FrameCount = 0;

	while ((GXReadDrawSync() != token) && !abort) {
		if (FrameCount >= FrameMissThreshold) {
			abort = TRUE;
			__DEMODiagnoseHang();
			DEMOReInit(rmode);
			DEMOSetGPHangMetric(GX_TRUE);
		}
	}

	DEMOSwapBuffers();
}

void DEMOSetGPHangMetric(GXBool enable) {
	if (enable) {
		GXSetGPMetric(GX_PERF0_NONE, GX_PERF1_NONE);

		GXCmd1u8(GX_LOAD_BP_REG);
		GXParam1u32(0x2402C004);

		GXCmd1u8(GX_LOAD_BP_REG);
		GXParam1u32(0x23000020);

		GXCmd1u8(GX_LOAD_XF_REG);
		GXParam1u16(0x0000);
		GXParam1u16(0x1006);
		GXParam1u32(0x00084400);
	}
	else {
		GXCmd1u8(GX_LOAD_BP_REG);
		GXParam1u32(0x24000000);

		GXCmd1u8(GX_LOAD_BP_REG);
		GXParam1u32(0x23000000);

		GXCmd1u8(GX_LOAD_XF_REG);
		GXParam1u16(0x0000);
		GXParam1u16(0x1006);
		GXParam1u32(0x00000000);
	}
}

static void __DEMODiagnoseHang(void) {
	u32 xfTop0, xfBot0, suRdy0, r0Rdy0;
	u32 xfTop1, xfBot1, suRdy1, r0Rdy1;
	u32 xfTopD, xfBotD, suRdyD, r0RdyD;
	GXBool readIdle, cmdIdle, junk;
	char fullmsg[4096];
	char newmsg[4112];

	GXReadXfRasMetric(&xfBot0, &xfTop0, &r0Rdy0, &suRdy0);
	GXReadXfRasMetric(&xfBot1, &xfTop1, &r0Rdy1, &suRdy1);

	xfTopD = (xfTop1 - xfTop0) == 0;
	xfBotD = (xfBot1 - xfBot0) == 0;
	suRdyD = (suRdy1 - suRdy0) > 0;
	r0RdyD = (r0Rdy1 - r0Rdy0) > 0;

	GXGetGPStatus(&junk, &junk, &readIdle, &cmdIdle, &junk);
	sprintf(fullmsg, "GP status %d%d%d%d%d%d -->\n", readIdle, cmdIdle, xfTopD, xfBotD, suRdyD, r0RdyD);
	if (!xfBotD && suRdyD) {
		sprintf(newmsg, "GP hang due to XF stall bug.\n");
		strcat(fullmsg, newmsg);
	}
	else if (!xfTopD && xfBotD && suRdyD) {
		sprintf(newmsg, "GP hang due to unterminated primitive.\n");
		strcat(fullmsg, newmsg);
	}
	else if (!cmdIdle && xfTopD && xfBotD && suRdyD) {
		sprintf(newmsg, "GP hang due to illegal instruction.\n");
		strcat(fullmsg, newmsg);
	}
	else if (readIdle && cmdIdle && xfTopD && xfBotD && suRdyD && r0RdyD) {
		sprintf(newmsg, "GP appears to be not hung (waiting for input).\n");
		strcat(fullmsg, newmsg);
	}
	else {
		sprintf(newmsg, "GP is in unknown state.\n");
		strcat(fullmsg, newmsg);
	}
	strcpy(__GXErrorMessage, newmsg);
}

void DEMOReInit(GXRenderModeObj* mode) {
	GXFifoObj tmpobj;
	void* tmpFifo = __memAlloc(HEAP_DEFAULT, 64 * 1024);

	GXFifoObj* realFifoObj = GXGetCPUFifo();
	void* realFifoBase = GXGetFifoBase(realFifoObj);
	u32 realFifoSize = GXGetFifoSize(realFifoObj);

	GXAbortFrame();

	GXInitFifoBase(&tmpobj, tmpFifo, 64 * 1024);

	GXSetCPUFifo(&tmpobj);
	GXSetGPFifo(&tmpobj);

	__DEMOInitRenderMode(mode);

	DefaultFifoObj = GXInit(realFifoBase, realFifoSize);

	__DEMOInitGX();

	VIConfigure(rmode);
	__DEMOInitVI();

	__memFree(HEAP_DEFAULT, tmpFifo);
}
