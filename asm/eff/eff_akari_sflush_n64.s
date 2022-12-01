.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effAkariSflushDisp
effAkariSflushDisp:
/* 801A8048 001A5048  94 21 FE 30 */	stwu r1, -0x1d0(r1)
/* 801A804C 001A504C  7C 08 02 A6 */	mflr r0
/* 801A8050 001A5050  90 01 01 D4 */	stw r0, 0x1d4(r1)
/* 801A8054 001A5054  DB E1 01 C0 */	stfd f31, 0x1c0(r1)
/* 801A8058 001A5058  F3 E1 01 C8 */	psq_st f31, 456(r1), 0, qr0
/* 801A805C 001A505C  DB C1 01 B0 */	stfd f30, 0x1b0(r1)
/* 801A8060 001A5060  F3 C1 01 B8 */	psq_st f30, 440(r1), 0, qr0
/* 801A8064 001A5064  DB A1 01 A0 */	stfd f29, 0x1a0(r1)
/* 801A8068 001A5068  F3 A1 01 A8 */	psq_st f29, 424(r1), 0, qr0
/* 801A806C 001A506C  DB 81 01 90 */	stfd f28, 0x190(r1)
/* 801A8070 001A5070  F3 81 01 98 */	psq_st f28, 408(r1), 0, qr0
/* 801A8074 001A5074  DB 61 01 80 */	stfd f27, 0x180(r1)
/* 801A8078 001A5078  F3 61 01 88 */	psq_st f27, 392(r1), 0, qr0
/* 801A807C 001A507C  DB 41 01 70 */	stfd f26, 0x170(r1)
/* 801A8080 001A5080  F3 41 01 78 */	psq_st f26, 376(r1), 0, qr0
/* 801A8084 001A5084  BF 01 01 50 */	stmw r24, 0x150(r1)
/* 801A8088 001A5088  7C 98 23 78 */	mr r24, r4
/* 801A808C 001A508C  4B E6 70 C5 */	bl camGetPtr
/* 801A8090 001A5090  83 F8 00 0C */	lwz r31, 0xc(r24)
/* 801A8094 001A5094  7C 7E 1B 78 */	mr r30, r3
/* 801A8098 001A5098  38 61 01 04 */	addi r3, r1, 0x104
/* 801A809C 001A509C  83 5F 00 14 */	lwz r26, 0x14(r31)
/* 801A80A0 001A50A0  83 3F 00 24 */	lwz r25, 0x24(r31)
/* 801A80A4 001A50A4  C0 3F 00 04 */	lfs f1, 4(r31)
/* 801A80A8 001A50A8  C0 5F 00 08 */	lfs f2, 8(r31)
/* 801A80AC 001A50AC  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 801A80B0 001A50B0  48 0F 03 7D */	bl PSMTXTrans
/* 801A80B4 001A50B4  38 60 00 04 */	li r3, 4
/* 801A80B8 001A50B8  4B E6 70 99 */	bl camGetPtr
/* 801A80BC 001A50BC  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 801A80C0 001A50C0  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A80C4 001A50C4  C0 02 D5 84 */	lfs f0, lbl_8041E904@sda21(r2)
/* 801A80C8 001A50C8  38 80 00 79 */	li r4, 0x79
/* 801A80CC 001A50CC  FC 20 08 50 */	fneg f1, f1
/* 801A80D0 001A50D0  EC 20 00 72 */	fmuls f1, f0, f1
/* 801A80D4 001A50D4  48 0F 01 19 */	bl PSMTXRotRad
/* 801A80D8 001A50D8  C0 3F 00 28 */	lfs f1, 0x28(r31)
/* 801A80DC 001A50DC  38 61 00 D4 */	addi r3, r1, 0xd4
/* 801A80E0 001A50E0  FC 40 08 90 */	fmr f2, f1
/* 801A80E4 001A50E4  FC 60 08 90 */	fmr f3, f1
/* 801A80E8 001A50E8  48 0F 03 C5 */	bl PSMTXScale
/* 801A80EC 001A50EC  38 61 01 04 */	addi r3, r1, 0x104
/* 801A80F0 001A50F0  38 81 00 A4 */	addi r4, r1, 0xa4
/* 801A80F4 001A50F4  7C 65 1B 78 */	mr r5, r3
/* 801A80F8 001A50F8  48 0E FE 69 */	bl PSMTXConcat
/* 801A80FC 001A50FC  38 61 01 04 */	addi r3, r1, 0x104
/* 801A8100 001A5100  38 81 00 D4 */	addi r4, r1, 0xd4
/* 801A8104 001A5104  7C 65 1B 78 */	mr r5, r3
/* 801A8108 001A5108  48 0E FE 59 */	bl PSMTXConcat
/* 801A810C 001A510C  38 7E 01 1C */	addi r3, r30, 0x11c
/* 801A8110 001A5110  38 81 01 04 */	addi r4, r1, 0x104
/* 801A8114 001A5114  38 A1 00 74 */	addi r5, r1, 0x74
/* 801A8118 001A5118  48 0E FE 49 */	bl PSMTXConcat
/* 801A811C 001A511C  38 60 00 01 */	li r3, 1
/* 801A8120 001A5120  48 10 90 19 */	bl GXSetNumChans
/* 801A8124 001A5124  38 60 00 04 */	li r3, 4
/* 801A8128 001A5128  38 80 00 00 */	li r4, 0
/* 801A812C 001A512C  38 A0 00 00 */	li r5, 0
/* 801A8130 001A5130  38 C0 00 01 */	li r6, 1
/* 801A8134 001A5134  38 E0 00 00 */	li r7, 0
/* 801A8138 001A5138  39 00 00 00 */	li r8, 0
/* 801A813C 001A513C  39 20 00 02 */	li r9, 2
/* 801A8140 001A5140  48 10 90 35 */	bl GXSetChanCtrl
/* 801A8144 001A5144  38 60 00 02 */	li r3, 2
/* 801A8148 001A5148  48 10 B0 81 */	bl GXSetNumTevStages
/* 801A814C 001A514C  38 60 00 00 */	li r3, 0
/* 801A8150 001A5150  38 80 00 FF */	li r4, 0xff
/* 801A8154 001A5154  38 A0 00 FF */	li r5, 0xff
/* 801A8158 001A5158  38 C0 00 04 */	li r6, 4
/* 801A815C 001A515C  48 10 AE D1 */	bl GXSetTevOrder
/* 801A8160 001A5160  38 60 00 00 */	li r3, 0
/* 801A8164 001A5164  38 80 00 00 */	li r4, 0
/* 801A8168 001A5168  38 A0 00 00 */	li r5, 0
/* 801A816C 001A516C  38 C0 00 00 */	li r6, 0
/* 801A8170 001A5170  38 E0 00 01 */	li r7, 1
/* 801A8174 001A5174  39 00 00 00 */	li r8, 0
/* 801A8178 001A5178  48 10 AA 6D */	bl GXSetTevColorOp
/* 801A817C 001A517C  38 60 00 00 */	li r3, 0
/* 801A8180 001A5180  38 80 00 00 */	li r4, 0
/* 801A8184 001A5184  38 A0 00 00 */	li r5, 0
/* 801A8188 001A5188  38 C0 00 00 */	li r6, 0
/* 801A818C 001A518C  38 E0 00 01 */	li r7, 1
/* 801A8190 001A5190  39 00 00 00 */	li r8, 0
/* 801A8194 001A5194  48 10 AA B9 */	bl GXSetTevAlphaOp
/* 801A8198 001A5198  38 60 00 00 */	li r3, 0
/* 801A819C 001A519C  38 80 00 0F */	li r4, 0xf
/* 801A81A0 001A51A0  38 A0 00 0F */	li r5, 0xf
/* 801A81A4 001A51A4  38 C0 00 0F */	li r6, 0xf
/* 801A81A8 001A51A8  38 E0 00 0A */	li r7, 0xa
/* 801A81AC 001A51AC  48 10 A9 B1 */	bl GXSetTevColorIn
/* 801A81B0 001A51B0  38 60 00 00 */	li r3, 0
/* 801A81B4 001A51B4  38 80 00 07 */	li r4, 7
/* 801A81B8 001A51B8  38 A0 00 01 */	li r5, 1
/* 801A81BC 001A51BC  38 C0 00 05 */	li r6, 5
/* 801A81C0 001A51C0  38 E0 00 07 */	li r7, 7
/* 801A81C4 001A51C4  48 10 A9 DD */	bl GXSetTevAlphaIn
/* 801A81C8 001A51C8  38 60 00 01 */	li r3, 1
/* 801A81CC 001A51CC  38 80 00 FF */	li r4, 0xff
/* 801A81D0 001A51D0  38 A0 00 FF */	li r5, 0xff
/* 801A81D4 001A51D4  38 C0 00 FF */	li r6, 0xff
/* 801A81D8 001A51D8  48 10 AE 55 */	bl GXSetTevOrder
/* 801A81DC 001A51DC  38 60 00 01 */	li r3, 1
/* 801A81E0 001A51E0  38 80 00 00 */	li r4, 0
/* 801A81E4 001A51E4  38 A0 00 00 */	li r5, 0
/* 801A81E8 001A51E8  38 C0 00 00 */	li r6, 0
/* 801A81EC 001A51EC  38 E0 00 01 */	li r7, 1
/* 801A81F0 001A51F0  39 00 00 00 */	li r8, 0
/* 801A81F4 001A51F4  48 10 A9 F1 */	bl GXSetTevColorOp
/* 801A81F8 001A51F8  38 60 00 01 */	li r3, 1
/* 801A81FC 001A51FC  38 80 00 00 */	li r4, 0
/* 801A8200 001A5200  38 A0 00 00 */	li r5, 0
/* 801A8204 001A5204  38 C0 00 00 */	li r6, 0
/* 801A8208 001A5208  38 E0 00 01 */	li r7, 1
/* 801A820C 001A520C  39 00 00 00 */	li r8, 0
/* 801A8210 001A5210  48 10 AA 3D */	bl GXSetTevAlphaOp
/* 801A8214 001A5214  38 60 00 01 */	li r3, 1
/* 801A8218 001A5218  38 80 00 02 */	li r4, 2
/* 801A821C 001A521C  38 A0 00 04 */	li r5, 4
/* 801A8220 001A5220  38 C0 00 00 */	li r6, 0
/* 801A8224 001A5224  38 E0 00 0F */	li r7, 0xf
/* 801A8228 001A5228  48 10 A9 35 */	bl GXSetTevColorIn
/* 801A822C 001A522C  38 60 00 01 */	li r3, 1
/* 801A8230 001A5230  38 80 00 07 */	li r4, 7
/* 801A8234 001A5234  38 A0 00 07 */	li r5, 7
/* 801A8238 001A5238  38 C0 00 07 */	li r6, 7
/* 801A823C 001A523C  38 E0 00 00 */	li r7, 0
/* 801A8240 001A5240  48 10 A9 61 */	bl GXSetTevAlphaIn
/* 801A8244 001A5244  38 60 00 00 */	li r3, 0
/* 801A8248 001A5248  48 10 70 39 */	bl GXSetNumTexGens
/* 801A824C 001A524C  80 02 1D 20 */	lwz r0, lbl_804230A0@sda21(r2)
/* 801A8250 001A5250  38 81 00 10 */	addi r4, r1, 0x10
/* 801A8254 001A5254  80 DF 00 18 */	lwz r6, 0x18(r31)
/* 801A8258 001A5258  38 60 00 01 */	li r3, 1
/* 801A825C 001A525C  90 01 00 0C */	stw r0, 0xc(r1)
/* 801A8260 001A5260  80 BF 00 1C */	lwz r5, 0x1c(r31)
/* 801A8264 001A5264  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 801A8268 001A5268  98 C1 00 0C */	stb r6, 0xc(r1)
/* 801A826C 001A526C  98 A1 00 0D */	stb r5, 0xd(r1)
/* 801A8270 001A5270  98 01 00 0E */	stb r0, 0xe(r1)
/* 801A8274 001A5274  9B 21 00 0F */	stb r25, 0xf(r1)
/* 801A8278 001A5278  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801A827C 001A527C  90 01 00 10 */	stw r0, 0x10(r1)
/* 801A8280 001A5280  48 10 AA 35 */	bl GXSetTevColor
/* 801A8284 001A5284  80 02 D5 80 */	lwz r0, lbl_8041E900@sda21(r2)
/* 801A8288 001A5288  38 81 00 08 */	addi r4, r1, 8
/* 801A828C 001A528C  38 60 00 02 */	li r3, 2
/* 801A8290 001A5290  90 01 00 08 */	stw r0, 8(r1)
/* 801A8294 001A5294  48 10 AA 21 */	bl GXSetTevColor
/* 801A8298 001A5298  38 60 00 00 */	li r3, 0
/* 801A829C 001A529C  48 10 7B ED */	bl GXSetCullMode
/* 801A82A0 001A52A0  3C 60 80 3A */	lis r3, lbl_8039A738@ha
/* 801A82A4 001A52A4  38 63 A7 38 */	addi r3, r3, lbl_8039A738@l
/* 801A82A8 001A52A8  48 02 94 09 */	bl effSetVtxDescN64
/* 801A82AC 001A52AC  3C 60 80 30 */	lis r3, lbl_802FA1F0@ha
/* 801A82B0 001A52B0  3B 80 00 00 */	li r28, 0
/* 801A82B4 001A52B4  C3 C2 D5 84 */	lfs f30, lbl_8041E904@sda21(r2)
/* 801A82B8 001A52B8  7F 9B E3 78 */	mr r27, r28
/* 801A82BC 001A52BC  CB E3 A1 F0 */	lfd f31, lbl_802FA1F0@l(r3)
/* 801A82C0 001A52C0  57 5A 18 38 */	slwi r26, r26, 3
/* 801A82C4 001A52C4  C3 62 D5 88 */	lfs f27, lbl_8041E908@sda21(r2)
/* 801A82C8 001A52C8  3B 20 00 00 */	li r25, 0
/* 801A82CC 001A52CC  C3 82 D5 8C */	lfs f28, lbl_8041E90C@sda21(r2)
/* 801A82D0 001A52D0  3F C0 43 30 */	lis r30, 0x4330
/* 801A82D4 001A52D4  C3 A2 D5 90 */	lfs f29, lbl_8041E910@sda21(r2)
/* 801A82D8 001A52D8  48 00 01 D8 */	b .L_801A84B0
.L_801A82DC:
/* 801A82DC 001A52DC  7C 1C 03 D6 */	divw r0, r28, r0
/* 801A82E0 001A52E0  93 C1 01 38 */	stw r30, 0x138(r1)
/* 801A82E4 001A52E4  7C 1A 02 14 */	add r0, r26, r0
/* 801A82E8 001A52E8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801A82EC 001A52EC  90 01 01 3C */	stw r0, 0x13c(r1)
/* 801A82F0 001A52F0  C8 01 01 38 */	lfd f0, 0x138(r1)
/* 801A82F4 001A52F4  EC 00 F8 28 */	fsubs f0, f0, f31
/* 801A82F8 001A52F8  EC 1B 00 32 */	fmuls f0, f27, f0
/* 801A82FC 001A52FC  EC 20 E0 24 */	fdivs f1, f0, f28
/* 801A8300 001A5300  48 0C 3B 91 */	bl cos
/* 801A8304 001A5304  38 79 00 01 */	addi r3, r25, 1
/* 801A8308 001A5308  6F 60 80 00 */	xoris r0, r27, 0x8000
/* 801A830C 001A530C  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801A8310 001A5310  93 C1 01 40 */	stw r30, 0x140(r1)
/* 801A8314 001A5314  FC 60 08 18 */	frsp f3, f1
/* 801A8318 001A5318  C0 3F 00 2C */	lfs f1, 0x2c(r31)
/* 801A831C 001A531C  90 61 01 44 */	stw r3, 0x144(r1)
/* 801A8320 001A5320  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A8324 001A5324  38 80 00 7A */	li r4, 0x7a
/* 801A8328 001A5328  C8 01 01 40 */	lfd f0, 0x140(r1)
/* 801A832C 001A532C  90 01 01 4C */	stw r0, 0x14c(r1)
/* 801A8330 001A5330  EC 40 F8 28 */	fsubs f2, f0, f31
/* 801A8334 001A5334  93 C1 01 48 */	stw r30, 0x148(r1)
/* 801A8338 001A5338  C8 01 01 48 */	lfd f0, 0x148(r1)
/* 801A833C 001A533C  EF 5D 10 FA */	fmadds f26, f29, f3, f2
/* 801A8340 001A5340  EC 00 F8 28 */	fsubs f0, f0, f31
/* 801A8344 001A5344  EF 5A 00 72 */	fmuls f26, f26, f1
/* 801A8348 001A5348  EC 3E 00 32 */	fmuls f1, f30, f0
/* 801A834C 001A534C  48 0E FE A1 */	bl PSMTXRotRad
/* 801A8350 001A5350  FC 20 D0 90 */	fmr f1, f26
/* 801A8354 001A5354  38 61 00 D4 */	addi r3, r1, 0xd4
/* 801A8358 001A5358  FC 40 D0 90 */	fmr f2, f26
/* 801A835C 001A535C  FC 60 D0 90 */	fmr f3, f26
/* 801A8360 001A5360  48 0F 01 4D */	bl PSMTXScale
/* 801A8364 001A5364  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A8368 001A5368  38 81 00 D4 */	addi r4, r1, 0xd4
/* 801A836C 001A536C  38 A1 00 44 */	addi r5, r1, 0x44
/* 801A8370 001A5370  48 0E FB F1 */	bl PSMTXConcat
/* 801A8374 001A5374  3B 00 00 00 */	li r24, 0
/* 801A8378 001A5378  3B A0 00 5A */	li r29, 0x5a
.L_801A837C:
/* 801A837C 001A537C  6F A0 80 00 */	xoris r0, r29, 0x8000
/* 801A8380 001A5380  93 C1 01 48 */	stw r30, 0x148(r1)
/* 801A8384 001A5384  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A8388 001A5388  38 80 00 7A */	li r4, 0x7a
/* 801A838C 001A538C  90 01 01 4C */	stw r0, 0x14c(r1)
/* 801A8390 001A5390  C8 01 01 48 */	lfd f0, 0x148(r1)
/* 801A8394 001A5394  EC 00 F8 28 */	fsubs f0, f0, f31
/* 801A8398 001A5398  EC 3E 00 32 */	fmuls f1, f30, f0
/* 801A839C 001A539C  48 0E FE 51 */	bl PSMTXRotRad
/* 801A83A0 001A53A0  C0 22 D5 94 */	lfs f1, lbl_8041E914@sda21(r2)
/* 801A83A4 001A53A4  38 61 00 D4 */	addi r3, r1, 0xd4
/* 801A83A8 001A53A8  FC 40 08 90 */	fmr f2, f1
/* 801A83AC 001A53AC  FC 60 08 90 */	fmr f3, f1
/* 801A83B0 001A53B0  48 0F 00 FD */	bl PSMTXScale
/* 801A83B4 001A53B4  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A83B8 001A53B8  38 81 00 D4 */	addi r4, r1, 0xd4
/* 801A83BC 001A53BC  7C 65 1B 78 */	mr r5, r3
/* 801A83C0 001A53C0  48 0E FB A1 */	bl PSMTXConcat
/* 801A83C4 001A53C4  C0 42 D5 9C */	lfs f2, lbl_8041E91C@sda21(r2)
/* 801A83C8 001A53C8  38 61 01 04 */	addi r3, r1, 0x104
/* 801A83CC 001A53CC  C0 22 D5 98 */	lfs f1, lbl_8041E918@sda21(r2)
/* 801A83D0 001A53D0  FC 60 10 90 */	fmr f3, f2
/* 801A83D4 001A53D4  48 0F 00 59 */	bl PSMTXTrans
/* 801A83D8 001A53D8  38 81 01 04 */	addi r4, r1, 0x104
/* 801A83DC 001A53DC  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A83E0 001A53E0  7C 85 23 78 */	mr r5, r4
/* 801A83E4 001A53E4  48 0E FB 7D */	bl PSMTXConcat
/* 801A83E8 001A53E8  C0 22 D5 9C */	lfs f1, lbl_8041E91C@sda21(r2)
/* 801A83EC 001A53EC  38 61 00 A4 */	addi r3, r1, 0xa4
/* 801A83F0 001A53F0  38 80 00 78 */	li r4, 0x78
/* 801A83F4 001A53F4  48 0E FD F9 */	bl PSMTXRotRad
/* 801A83F8 001A53F8  38 61 01 04 */	addi r3, r1, 0x104
/* 801A83FC 001A53FC  38 81 00 A4 */	addi r4, r1, 0xa4
/* 801A8400 001A5400  38 A1 00 14 */	addi r5, r1, 0x14
/* 801A8404 001A5404  48 0E FB 5D */	bl PSMTXConcat
/* 801A8408 001A5408  38 61 00 74 */	addi r3, r1, 0x74
/* 801A840C 001A540C  38 81 00 44 */	addi r4, r1, 0x44
/* 801A8410 001A5410  38 A1 01 04 */	addi r5, r1, 0x104
/* 801A8414 001A5414  48 0E FB 4D */	bl PSMTXConcat
/* 801A8418 001A5418  38 61 01 04 */	addi r3, r1, 0x104
/* 801A841C 001A541C  38 81 00 14 */	addi r4, r1, 0x14
/* 801A8420 001A5420  7C 65 1B 78 */	mr r5, r3
/* 801A8424 001A5424  48 0E FB 3D */	bl PSMTXConcat
/* 801A8428 001A5428  38 61 01 04 */	addi r3, r1, 0x104
/* 801A842C 001A542C  38 80 00 00 */	li r4, 0
/* 801A8430 001A5430  48 10 C0 C9 */	bl GXLoadPosMtxImm
/* 801A8434 001A5434  38 60 00 00 */	li r3, 0
/* 801A8438 001A5438  48 10 C1 61 */	bl GXSetCurrentMtx
/* 801A843C 001A543C  38 60 00 90 */	li r3, 0x90
/* 801A8440 001A5440  38 80 00 00 */	li r4, 0
/* 801A8444 001A5444  38 A0 00 0C */	li r5, 0xc
/* 801A8448 001A5448  48 10 78 21 */	bl GXBegin
/* 801A844C 001A544C  38 60 00 00 */	li r3, 0
/* 801A8450 001A5450  38 80 00 01 */	li r4, 1
/* 801A8454 001A5454  38 A0 00 02 */	li r5, 2
/* 801A8458 001A5458  38 C0 00 00 */	li r6, 0
/* 801A845C 001A545C  38 E0 00 01 */	li r7, 1
/* 801A8460 001A5460  39 00 00 02 */	li r8, 2
/* 801A8464 001A5464  39 20 00 03 */	li r9, 3
/* 801A8468 001A5468  39 40 00 00 */	li r10, 0
/* 801A846C 001A546C  48 02 91 C9 */	bl tri2
/* 801A8470 001A5470  38 60 00 02 */	li r3, 2
/* 801A8474 001A5474  38 80 00 03 */	li r4, 3
/* 801A8478 001A5478  38 A0 00 04 */	li r5, 4
/* 801A847C 001A547C  38 C0 00 00 */	li r6, 0
/* 801A8480 001A5480  38 E0 00 03 */	li r7, 3
/* 801A8484 001A5484  39 00 00 04 */	li r8, 4
/* 801A8488 001A5488  39 20 00 05 */	li r9, 5
/* 801A848C 001A548C  39 40 00 00 */	li r10, 0
/* 801A8490 001A5490  48 02 91 A5 */	bl tri2
/* 801A8494 001A5494  3B 18 00 01 */	addi r24, r24, 1
/* 801A8498 001A5498  3B BD 00 48 */	addi r29, r29, 0x48
/* 801A849C 001A549C  2C 18 00 05 */	cmpwi r24, 5
/* 801A84A0 001A54A0  41 80 FE DC */	blt .L_801A837C
/* 801A84A4 001A54A4  3B 9C 00 B4 */	addi r28, r28, 0xb4
/* 801A84A8 001A54A8  3B 7B 00 24 */	addi r27, r27, 0x24
/* 801A84AC 001A54AC  3B 39 00 01 */	addi r25, r25, 1
.L_801A84B0:
/* 801A84B0 001A54B0  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 801A84B4 001A54B4  38 03 00 01 */	addi r0, r3, 1
/* 801A84B8 001A54B8  7C 19 00 00 */	cmpw r25, r0
/* 801A84BC 001A54BC  41 80 FE 20 */	blt .L_801A82DC
/* 801A84C0 001A54C0  E3 E1 01 C8 */	psq_l f31, 456(r1), 0, qr0
/* 801A84C4 001A54C4  CB E1 01 C0 */	lfd f31, 0x1c0(r1)
/* 801A84C8 001A54C8  E3 C1 01 B8 */	psq_l f30, 440(r1), 0, qr0
/* 801A84CC 001A54CC  CB C1 01 B0 */	lfd f30, 0x1b0(r1)
/* 801A84D0 001A54D0  E3 A1 01 A8 */	psq_l f29, 424(r1), 0, qr0
/* 801A84D4 001A54D4  CB A1 01 A0 */	lfd f29, 0x1a0(r1)
/* 801A84D8 001A54D8  E3 81 01 98 */	psq_l f28, 408(r1), 0, qr0
/* 801A84DC 001A54DC  CB 81 01 90 */	lfd f28, 0x190(r1)
/* 801A84E0 001A54E0  E3 61 01 88 */	psq_l f27, 392(r1), 0, qr0
/* 801A84E4 001A54E4  CB 61 01 80 */	lfd f27, 0x180(r1)
/* 801A84E8 001A54E8  E3 41 01 78 */	psq_l f26, 376(r1), 0, qr0
/* 801A84EC 001A54EC  CB 41 01 70 */	lfd f26, 0x170(r1)
/* 801A84F0 001A54F0  BB 01 01 50 */	lmw r24, 0x150(r1)
/* 801A84F4 001A54F4  80 01 01 D4 */	lwz r0, 0x1d4(r1)
/* 801A84F8 001A54F8  7C 08 03 A6 */	mtlr r0
/* 801A84FC 001A54FC  38 21 01 D0 */	addi r1, r1, 0x1d0
/* 801A8500 001A5500  4E 80 00 20 */	blr 
effAkariSflushMain:
/* 801A8504 001A5504  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801A8508 001A5508  7C 08 02 A6 */	mflr r0
/* 801A850C 001A550C  3C 80 80 30 */	lis r4, lbl_802FA1E0@ha
/* 801A8510 001A5510  90 01 00 34 */	stw r0, 0x34(r1)
/* 801A8514 001A5514  38 A4 A1 E0 */	addi r5, r4, lbl_802FA1E0@l
/* 801A8518 001A5518  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801A851C 001A551C  7C 7F 1B 78 */	mr r31, r3
/* 801A8520 001A5520  80 C3 00 0C */	lwz r6, 0xc(r3)
/* 801A8524 001A5524  80 85 00 00 */	lwz r4, 0(r5)
/* 801A8528 001A5528  80 65 00 04 */	lwz r3, 4(r5)
/* 801A852C 001A552C  80 05 00 08 */	lwz r0, 8(r5)
/* 801A8530 001A5530  90 81 00 08 */	stw r4, 8(r1)
/* 801A8534 001A5534  C0 06 00 04 */	lfs f0, 4(r6)
/* 801A8538 001A5538  90 61 00 0C */	stw r3, 0xc(r1)
/* 801A853C 001A553C  C0 26 00 08 */	lfs f1, 8(r6)
/* 801A8540 001A5540  D0 01 00 08 */	stfs f0, 8(r1)
/* 801A8544 001A5544  C0 06 00 0C */	lfs f0, 0xc(r6)
/* 801A8548 001A5548  90 01 00 10 */	stw r0, 0x10(r1)
/* 801A854C 001A554C  80 81 00 08 */	lwz r4, 8(r1)
/* 801A8550 001A5550  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801A8554 001A5554  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801A8558 001A5558  80 61 00 0C */	lwz r3, 0xc(r1)
/* 801A855C 001A555C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801A8560 001A5560  90 81 00 14 */	stw r4, 0x14(r1)
/* 801A8564 001A5564  90 61 00 18 */	stw r3, 0x18(r1)
/* 801A8568 001A5568  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801A856C 001A556C  80 7F 00 00 */	lwz r3, 0(r31)
/* 801A8570 001A5570  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 801A8574 001A5574  41 82 00 14 */	beq .L_801A8588
/* 801A8578 001A5578  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 801A857C 001A557C  38 00 00 10 */	li r0, 0x10
/* 801A8580 001A5580  90 7F 00 00 */	stw r3, 0(r31)
/* 801A8584 001A5584  90 06 00 10 */	stw r0, 0x10(r6)
.L_801A8588:
/* 801A8588 001A5588  80 66 00 10 */	lwz r3, 0x10(r6)
/* 801A858C 001A558C  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 801A8590 001A5590  40 80 00 0C */	bge .L_801A859C
/* 801A8594 001A5594  38 03 FF FF */	addi r0, r3, -1
/* 801A8598 001A5598  90 06 00 10 */	stw r0, 0x10(r6)
.L_801A859C:
/* 801A859C 001A559C  80 66 00 14 */	lwz r3, 0x14(r6)
/* 801A85A0 001A55A0  38 03 00 01 */	addi r0, r3, 1
/* 801A85A4 001A55A4  90 06 00 14 */	stw r0, 0x14(r6)
/* 801A85A8 001A55A8  80 A6 00 10 */	lwz r5, 0x10(r6)
/* 801A85AC 001A55AC  2C 05 00 00 */	cmpwi r5, 0
/* 801A85B0 001A55B0  40 80 00 10 */	bge .L_801A85C0
/* 801A85B4 001A55B4  7F E3 FB 78 */	mr r3, r31
/* 801A85B8 001A55B8  4B EB 55 CD */	bl effDelete
/* 801A85BC 001A55BC  48 00 00 8C */	b .L_801A8648
.L_801A85C0:
/* 801A85C0 001A55C0  2C 05 00 08 */	cmpwi r5, 8
/* 801A85C4 001A55C4  80 E6 00 14 */	lwz r7, 0x14(r6)
/* 801A85C8 001A55C8  40 80 00 38 */	bge .L_801A8600
/* 801A85CC 001A55CC  20 65 00 08 */	subfic r3, r5, 8
/* 801A85D0 001A55D0  3C 00 43 30 */	lis r0, 0x4330
/* 801A85D4 001A55D4  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801A85D8 001A55D8  3C 80 80 30 */	lis r4, lbl_802FA1F0@ha
/* 801A85DC 001A55DC  90 61 00 24 */	stw r3, 0x24(r1)
/* 801A85E0 001A55E0  C8 44 A1 F0 */	lfd f2, lbl_802FA1F0@l(r4)
/* 801A85E4 001A55E4  90 01 00 20 */	stw r0, 0x20(r1)
/* 801A85E8 001A55E8  C0 62 D5 A0 */	lfs f3, lbl_8041E920@sda21(r2)
/* 801A85EC 001A55EC  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 801A85F0 001A55F0  C0 06 00 2C */	lfs f0, 0x2c(r6)
/* 801A85F4 001A55F4  EC 21 10 28 */	fsubs f1, f1, f2
/* 801A85F8 001A55F8  EC 03 00 7A */	fmadds f0, f3, f1, f0
/* 801A85FC 001A55FC  D0 06 00 2C */	stfs f0, 0x2c(r6)
.L_801A8600:
/* 801A8600 001A5600  2C 07 00 10 */	cmpwi r7, 0x10
/* 801A8604 001A5604  40 80 00 10 */	bge .L_801A8614
/* 801A8608 001A5608  54 E3 20 36 */	slwi r3, r7, 4
/* 801A860C 001A560C  38 03 00 0F */	addi r0, r3, 0xf
/* 801A8610 001A5610  90 06 00 24 */	stw r0, 0x24(r6)
.L_801A8614:
/* 801A8614 001A5614  2C 05 00 08 */	cmpwi r5, 8
/* 801A8618 001A5618  40 80 00 10 */	bge .L_801A8628
/* 801A861C 001A561C  54 A3 28 34 */	slwi r3, r5, 5
/* 801A8620 001A5620  38 03 00 1F */	addi r0, r3, 0x1f
/* 801A8624 001A5624  90 06 00 24 */	stw r0, 0x24(r6)
.L_801A8628:
/* 801A8628 001A5628  38 61 00 14 */	addi r3, r1, 0x14
/* 801A862C 001A562C  4B E6 80 95 */	bl dispCalcZ
/* 801A8630 001A5630  3C 60 80 1B */	lis r3, effAkariSflushDisp@ha
/* 801A8634 001A5634  7F E6 FB 78 */	mr r6, r31
/* 801A8638 001A5638  38 A3 80 48 */	addi r5, r3, effAkariSflushDisp@l
/* 801A863C 001A563C  38 80 00 02 */	li r4, 2
/* 801A8640 001A5640  38 60 00 04 */	li r3, 4
/* 801A8644 001A5644  4B E6 83 D5 */	bl dispEntry
.L_801A8648:
/* 801A8648 001A5648  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801A864C 001A564C  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801A8650 001A5650  7C 08 03 A6 */	mtlr r0
/* 801A8654 001A5654  38 21 00 30 */	addi r1, r1, 0x30
/* 801A8658 001A5658  4E 80 00 20 */	blr 

.global effAkariSflushN64Entry
effAkariSflushN64Entry:
/* 801A865C 001A565C  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 801A8660 001A5660  7C 08 02 A6 */	mflr r0
/* 801A8664 001A5664  90 01 00 64 */	stw r0, 0x64(r1)
/* 801A8668 001A5668  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 801A866C 001A566C  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 801A8670 001A5670  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 801A8674 001A5674  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 801A8678 001A5678  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 801A867C 001A567C  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 801A8680 001A5680  DB 81 00 20 */	stfd f28, 0x20(r1)
/* 801A8684 001A5684  F3 81 00 28 */	psq_st f28, 40(r1), 0, qr0
/* 801A8688 001A5688  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801A868C 001A568C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801A8690 001A5690  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801A8694 001A5694  FF 80 08 90 */	fmr f28, f1
/* 801A8698 001A5698  7C 7D 1B 78 */	mr r29, r3
/* 801A869C 001A569C  FF A0 10 90 */	fmr f29, f2
/* 801A86A0 001A56A0  7C 9E 23 78 */	mr r30, r4
/* 801A86A4 001A56A4  FF C0 18 90 */	fmr f30, f3
/* 801A86A8 001A56A8  FF E0 20 90 */	fmr f31, f4
/* 801A86AC 001A56AC  4B EB 57 11 */	bl effEntry
/* 801A86B0 001A56B0  3C 80 80 30 */	lis r4, lbl_802FA1F8@ha
/* 801A86B4 001A56B4  7C 7F 1B 78 */	mr r31, r3
/* 801A86B8 001A56B8  38 84 A1 F8 */	addi r4, r4, lbl_802FA1F8@l
/* 801A86BC 001A56BC  38 00 00 01 */	li r0, 1
/* 801A86C0 001A56C0  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801A86C4 001A56C4  38 60 00 03 */	li r3, 3
/* 801A86C8 001A56C8  38 80 00 34 */	li r4, 0x34
/* 801A86CC 001A56CC  90 1F 00 08 */	stw r0, 8(r31)
/* 801A86D0 001A56D0  4B E8 73 BD */	bl __memAlloc
/* 801A86D4 001A56D4  3C 80 80 1B */	lis r4, effAkariSflushMain@ha
/* 801A86D8 001A56D8  90 7F 00 0C */	stw r3, 0xc(r31)
/* 801A86DC 001A56DC  38 04 85 04 */	addi r0, r4, effAkariSflushMain@l
/* 801A86E0 001A56E0  2C 1E 00 00 */	cmpwi r30, 0
/* 801A86E4 001A56E4  90 1F 00 10 */	stw r0, 0x10(r31)
/* 801A86E8 001A56E8  38 00 00 00 */	li r0, 0
/* 801A86EC 001A56EC  80 9F 00 00 */	lwz r4, 0(r31)
/* 801A86F0 001A56F0  60 84 00 02 */	ori r4, r4, 2
/* 801A86F4 001A56F4  90 9F 00 00 */	stw r4, 0(r31)
/* 801A86F8 001A56F8  93 A3 00 00 */	stw r29, 0(r3)
/* 801A86FC 001A56FC  90 03 00 14 */	stw r0, 0x14(r3)
/* 801A8700 001A5700  41 81 00 10 */	bgt .L_801A8710
/* 801A8704 001A5704  38 00 03 E8 */	li r0, 0x3e8
/* 801A8708 001A5708  90 03 00 10 */	stw r0, 0x10(r3)
/* 801A870C 001A570C  48 00 00 08 */	b .L_801A8714
.L_801A8710:
/* 801A8710 001A5710  93 C3 00 10 */	stw r30, 0x10(r3)
.L_801A8714:
/* 801A8714 001A5714  38 C0 00 FF */	li r6, 0xff
/* 801A8718 001A5718  38 A0 00 E6 */	li r5, 0xe6
/* 801A871C 001A571C  90 C3 00 24 */	stw r6, 0x24(r3)
/* 801A8720 001A5720  38 80 00 32 */	li r4, 0x32
/* 801A8724 001A5724  38 00 00 00 */	li r0, 0
/* 801A8728 001A5728  C0 02 D5 94 */	lfs f0, lbl_8041E914@sda21(r2)
/* 801A872C 001A572C  D3 83 00 04 */	stfs f28, 4(r3)
/* 801A8730 001A5730  D3 A3 00 08 */	stfs f29, 8(r3)
/* 801A8734 001A5734  D3 C3 00 0C */	stfs f30, 0xc(r3)
/* 801A8738 001A5738  D3 E3 00 28 */	stfs f31, 0x28(r3)
/* 801A873C 001A573C  90 C3 00 18 */	stw r6, 0x18(r3)
/* 801A8740 001A5740  90 A3 00 1C */	stw r5, 0x1c(r3)
/* 801A8744 001A5744  90 83 00 20 */	stw r4, 0x20(r3)
/* 801A8748 001A5748  90 03 00 30 */	stw r0, 0x30(r3)
/* 801A874C 001A574C  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 801A8750 001A5750  7F E3 FB 78 */	mr r3, r31
/* 801A8754 001A5754  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 801A8758 001A5758  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 801A875C 001A575C  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 801A8760 001A5760  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 801A8764 001A5764  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 801A8768 001A5768  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 801A876C 001A576C  E3 81 00 28 */	psq_l f28, 40(r1), 0, qr0
/* 801A8770 001A5770  CB 81 00 20 */	lfd f28, 0x20(r1)
/* 801A8774 001A5774  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801A8778 001A5778  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801A877C 001A577C  80 01 00 64 */	lwz r0, 0x64(r1)
/* 801A8780 001A5780  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801A8784 001A5784  7C 08 03 A6 */	mtlr r0
/* 801A8788 001A5788  38 21 00 60 */	addi r1, r1, 0x60
/* 801A878C 001A578C  4E 80 00 20 */	blr 
