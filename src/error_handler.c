/* This file is only in retail, filename is unknown, "error_handler" for convenience */
#include "error_handler.h"
#include "sdk/DEMOInit.h"
#include "seq/seq_title.h"
#include "memory.h"
#include "pmario_sound.h"
#include <dolphin/mtx.h>
#include <dolphin/os.h>
#include <dolphin/vi.h>
#include <string.h>

extern void* DemoCurrentBuffer, * DemoFrameBuffer1, * DemoFrameBuffer2;
extern int sprintf(char* str, const char* format, ...);

//local prototypes
void systemErrorHandler(OSError error, OSContext* context, u32 dsisr, u32 dar);

void setupErrorHandler(void) {
	OSSetErrorHandler(OS_ERROR_DSI, (void (*)(u16, OSContext*, ...))systemErrorHandler);
	OSSetErrorHandler(OS_ERROR_ISI, (void (*)(u16, OSContext*, ...))systemErrorHandler);
	OSSetErrorHandler(OS_ERROR_PROGRAM, (void (*)(u16, OSContext*, ...))systemErrorHandler);
}

void systemErrorHandler(OSError error, OSContext* context, u32 dsisr, u32 dar) {
	//registers
	OSFontHeader* fontHeader;
	char* loop_newline;
	char* loop_zero;
	u16 width2, height2;
	int i;
	u32 count, stack;
	u16 w1, w2, h1, h2, x1, x2, y1, y2;
	//stack vars
	char print_buffer2[0x400]; // 0x10E0
	char print_buffer[0x1000]; // 0xE0
	Mtx44 projection; // 0xA0
	Mtx matrix; // 0x70
	Mtx matrix2; // 0x40
	GXTexObj texObj; // 0x20
	void* image; // 0x1C
	s32 x; // 0x18
	s32 y; // 0x14
	s32 width; // 0x10

	if (getDebugMode() >= 0) {
		psndExit();
		while (1) {} //softlock
	}

	switch (error) {
		case OS_ERROR_DSI:
			strcpy(print_buffer, "---- OS_ERROR_DSI ----\n");
			break;
		case OS_ERROR_ISI:
			strcpy(print_buffer, "---- OS_ERROR_ISI ----\n");
			break;
		case OS_ERROR_PROGRAM:
			strcpy(print_buffer, "---- OS_ERROR_PROGRAM ----\n");
			break;
	}
	sprintf(print_buffer2, "---- Context 0x%08x ----\n", context);
	strcat(print_buffer, print_buffer2);
	for (i = 0; i < 16; i++) {
		sprintf(print_buffer2, "r%-2d  = 0x%08x r%-2d  = 0x%08x\n",
			i, context->gpr[i],
			i + 16, context->gpr[i + 16]
		);
		strcat(print_buffer, print_buffer2);
	}
	sprintf(print_buffer2, "LR   = 0x%08x CR   = 0x%08x\n", context->lr, context->cr);
	strcat(print_buffer, print_buffer2);
	sprintf(print_buffer2, "SRR0 = 0x%08x SRR1 = 0x%08x\n", context->srr0, context->srr1);
	strcat(print_buffer, print_buffer2);
	sprintf(print_buffer2, "DSISR= 0x%08x DAR  = 0x%08x\n", dsisr, dar);
	strcat(print_buffer, print_buffer2);
	strcat(print_buffer, "\n");
	sprintf(print_buffer2, "Address:      Back Chain    LR Save\n");
	strcat(print_buffer, print_buffer2);
	stack = context->gpr[1]; //get r1 (stack)
	i = 0;
	while ((stack != 0) && (stack != 0xFFFFFFFF) && (i++ < 16)) {
		sprintf(print_buffer2, "0x%08x:   0x%08x    0x%08x\n", stack, *(u32*)stack, *(u32*)(stack + 4));
		strcat(print_buffer, print_buffer2);
		stack = *(u32*)stack;
	}
	strcat(print_buffer, "\n");
	sprintf(print_buffer2, "Instruction at 0x%x\n(read from SRR0) attempted to access\ninvalid address 0x%x (read from DAR)\n", context->srr0, dar);
	strcat(print_buffer, print_buffer2);
	psndExit();
	OSFillFPUContext(context);
#ifdef __MWERKS__
	asm{
		mfmsr	r5
		ori		r5, r5, 0x8000
		ori		r5, r5, 2
		mtmsr	r5
		isync
	};
#endif
	smartReInit();
	if (OSGetFontEncode() == OS_FONT_ENCODE_SJIS) {
		fontHeader = smartAlloc(OS_FONT_SIZE_SJIS, 0)->address;
	}
	else {
		fontHeader = smartAlloc(OS_FONT_SIZE_ANSI, 0)->address;
	}
	OSInitFont(fontHeader);
	GXSetCopyClear((GXColor) { 0, 0, 0, 0xFF }, 0xFFFFFF);
	GXCopyDisp(DEMOGetCurrentBuffer(), 1);
	GXSetViewport(0.0f, 0.0f, 608.0f, 480.0f, 0.0f, 1.0f);
	GXSetScissor(0, 0, 608, 480);
	MTXOrtho(projection, 0.0f, 608.0f, 0.0f, 480.0f, 0.0f, 1.0f);
	GXSetProjection(projection, GX_ORTHOGRAPHIC);
	MTXScale(matrix, 0.5f, 0.5f, 1.0f);
	GXLoadPosMtxImm(matrix, 0);
	GXSetCurrentMtx(0);
	GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
	GXSetNumChans(0);
	GXSetNumTevStages(1);
	GXSetTevOp(GX_TEVSTAGE0, GX_REPLACE);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD0, GX_TEXMAP0, GX_COLOR_NULL);
	GXSetNumTexGens(1);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, GX_TEXMTX0);
	GXSetBlendMode(GX_BM_BLEND, GX_BL_ONE, GX_BL_ONE, GX_LO_CLEAR);
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, 1, 3, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, 1, 3, 0);
	while (1) {
		count = VIGetRetraceCount();
		loop_newline = (char*)&print_buffer;
		width2 = 50;
		height2 = 50;
		i = 0;
		loop_zero = loop_newline;
		while (*loop_zero != '\0') {
			if (*loop_newline == '\n') {
				width2 = 50;
				height2 += 24;
				i++;
				loop_zero++;
				loop_newline++;
			}
			else {
				OSGetFontTexture((const char*)&print_buffer[i], &image, &x, &y, &width);
				GXInitTexObj(&texObj, image, fontHeader->sheetWidth, fontHeader->sheetHeight,
					(GXTexFmt)fontHeader->sheetFormat, GX_CLAMP, GX_CLAMP, GX_FALSE);
				GXLoadTexObj(&texObj, GX_TEXMAP0);
				MTXScale(matrix2, (float)fontHeader->sheetWidth, (float)fontHeader->sheetHeight, 1.0f);
				GXLoadTexMtxImm(matrix2, 0x1E, GX_MTX2x4);
				GXBegin(GX_QUADS, GX_VTXFMT0, 4);
				w1 = width2;
				w2 = (u16)(w1 + fontHeader->cellWidth);
				h1 = height2;
				h2 = (u16)(h1 + fontHeader->cellHeight);
				x1 = (u16)x;
				x2 = (u16)(x1 + fontHeader->cellWidth);
				y1 = (u16)y;
				y2 = (u16)(y1 + fontHeader->cellHeight);

				GXPosition1x16(w1);
				GXPosition1x16(h1);
				GXPosition1x16(0);
				GXPosition1x16(x1);
				GXPosition1x16(y1);

				GXPosition1x16(w2);
				GXPosition1x16(h1);
				GXPosition1x16(0);
				GXPosition1x16(x2);
				GXPosition1x16(y1);

				GXPosition1x16(w2);
				GXPosition1x16(h2);
				GXPosition1x16(0);
				GXPosition1x16(x2);
				GXPosition1x16(y2);

				GXPosition1x16(w1);
				GXPosition1x16(h2);
				GXPosition1x16(0);
				GXPosition1x16(x1);
				GXPosition1x16(y2);

				i++;
				loop_zero++;
				loop_newline++;
				width2 += width;
			}
		}
		GXSetZMode(GX_TRUE, GX_LEQUAL, GX_TRUE);
		GXSetColorUpdate(1);
		GXSetAlphaCompare(GX_ALWAYS, 0, GX_AOP_OR, GX_ALWAYS, 0);
		GXSetAlphaUpdate(1);
		GXCopyDisp(DemoCurrentBuffer, GX_TRUE);
		VISetNextFrameBuffer(DemoCurrentBuffer);
		VISetBlack(0);
		VIFlush();
		do { ; } while (count == VIGetRetraceCount());
		if (DemoCurrentBuffer == DemoFrameBuffer1)
			DemoCurrentBuffer = DemoFrameBuffer2;
		else
			DemoCurrentBuffer = DemoFrameBuffer1;
	}
}
