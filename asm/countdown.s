.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global countDownFlagOff
countDownFlagOff:
/* 801FC2C0 001F92C0  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC2C4 001F92C4  A0 04 00 00 */	lhz r0, 0(r4)
/* 801FC2C8 001F92C8  7C 00 18 78 */	andc r0, r0, r3
/* 801FC2CC 001F92CC  B0 04 00 00 */	sth r0, 0(r4)
/* 801FC2D0 001F92D0  4E 80 00 20 */	blr 

.global countDownFlagOn
countDownFlagOn:
/* 801FC2D4 001F92D4  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC2D8 001F92D8  A0 04 00 00 */	lhz r0, 0(r4)
/* 801FC2DC 001F92DC  7C 00 1B 78 */	or r0, r0, r3
/* 801FC2E0 001F92E0  B0 04 00 00 */	sth r0, 0(r4)
/* 801FC2E4 001F92E4  4E 80 00 20 */	blr 

.global countDownStop
countDownStop:
/* 801FC2E8 001F92E8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801FC2EC 001F92EC  7C 08 02 A6 */	mflr r0
/* 801FC2F0 001F92F0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801FC2F4 001F92F4  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC2F8 001F92F8  A0 03 00 00 */	lhz r0, 0(r3)
/* 801FC2FC 001F92FC  60 00 00 08 */	ori r0, r0, 8
/* 801FC300 001F9300  B0 03 00 00 */	sth r0, 0(r3)
/* 801FC304 001F9304  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC308 001F9308  80 63 00 38 */	lwz r3, 0x38(r3)
/* 801FC30C 001F930C  4B ED 8E F1 */	bl psndSFXOff
/* 801FC310 001F9310  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801FC314 001F9314  7C 08 03 A6 */	mtlr r0
/* 801FC318 001F9318  38 21 00 10 */	addi r1, r1, 0x10
/* 801FC31C 001F931C  4E 80 00 20 */	blr 

.global countDownEnd
countDownEnd:
/* 801FC320 001F9320  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC324 001F9324  A0 03 00 00 */	lhz r0, 0(r3)
/* 801FC328 001F9328  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 801FC32C 001F932C  4D 82 00 20 */	beqlr 
/* 801FC330 001F9330  38 00 00 02 */	li r0, 2
/* 801FC334 001F9334  90 03 00 30 */	stw r0, 0x30(r3)
/* 801FC338 001F9338  4E 80 00 20 */	blr 

.global countDownGetStatus
countDownGetStatus:
/* 801FC33C 001F933C  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC340 001F9340  A0 63 00 00 */	lhz r3, 0(r3)
/* 801FC344 001F9344  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 801FC348 001F9348  40 82 00 0C */	bne lbl_801FC354
/* 801FC34C 001F934C  38 60 FF FF */	li r3, -1
/* 801FC350 001F9350  4E 80 00 20 */	blr 
lbl_801FC354:
/* 801FC354 001F9354  54 63 FF FE */	rlwinm r3, r3, 0x1f, 0x1f, 0x1f
/* 801FC358 001F9358  4E 80 00 20 */	blr 
countDownDisp:
/* 801FC35C 001F935C  94 21 FF 00 */	stwu r1, -0x100(r1)
/* 801FC360 001F9360  7C 08 02 A6 */	mflr r0
/* 801FC364 001F9364  90 01 01 04 */	stw r0, 0x104(r1)
/* 801FC368 001F9368  DB E1 00 F0 */	stfd f31, 0xf0(r1)
/* 801FC36C 001F936C  F3 E1 00 F8 */	psq_st f31, 248(r1), 0, qr0
/* 801FC370 001F9370  BF 01 00 D0 */	stmw r24, 0xd0(r1)
/* 801FC374 001F9374  3C 60 80 00 */	lis r3, 0x800000F8@ha
/* 801FC378 001F9378  80 E2 F1 18 */	lwz r7, lbl_80420498-_SDA2_BASE_(r2)
/* 801FC37C 001F937C  80 03 00 F8 */	lwz r0, 0x800000F8@l(r3)
/* 801FC380 001F9380  3C 60 10 62 */	lis r3, 0x10624DD3@ha
/* 801FC384 001F9384  83 CD 18 C8 */	lwz r30, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC388 001F9388  38 63 4D D3 */	addi r3, r3, 0x10624DD3@l
/* 801FC38C 001F938C  54 00 F0 BE */	srwi r0, r0, 2
/* 801FC390 001F9390  90 E1 00 08 */	stw r7, 8(r1)
/* 801FC394 001F9394  7C 03 00 16 */	mulhwu r0, r3, r0
/* 801FC398 001F9398  80 7E 00 08 */	lwz r3, 8(r30)
/* 801FC39C 001F939C  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 801FC3A0 001F93A0  38 A0 00 00 */	li r5, 0
/* 801FC3A4 001F93A4  90 E1 00 1C */	stw r7, 0x1c(r1)
/* 801FC3A8 001F93A8  90 E1 00 20 */	stw r7, 0x20(r1)
/* 801FC3AC 001F93AC  54 06 D1 BE */	srwi r6, r0, 6
/* 801FC3B0 001F93B0  48 06 27 79 */	bl __div2i
/* 801FC3B4 001F93B4  A0 FE 00 00 */	lhz r7, 0(r30)
/* 801FC3B8 001F93B8  38 A0 00 00 */	li r5, 0
/* 801FC3BC 001F93BC  80 DE 00 18 */	lwz r6, 0x18(r30)
/* 801FC3C0 001F93C0  54 E0 07 7B */	rlwinm. r0, r7, 0, 0x1d, 0x1d
/* 801FC3C4 001F93C4  7C 04 30 10 */	subfc r0, r4, r6
/* 801FC3C8 001F93C8  7C 08 03 78 */	mr r8, r0
/* 801FC3CC 001F93CC  7C 03 29 10 */	subfe r0, r3, r5
/* 801FC3D0 001F93D0  40 82 02 BC */	bne lbl_801FC68C
/* 801FC3D4 001F93D4  54 E0 07 BD */	rlwinm. r0, r7, 0, 0x1e, 0x1e
/* 801FC3D8 001F93D8  41 82 00 08 */	beq lbl_801FC3E0
/* 801FC3DC 001F93DC  39 00 00 00 */	li r8, 0
lbl_801FC3E0:
/* 801FC3E0 001F93E0  3C 60 10 62 */	lis r3, 0x10624DD3@ha
/* 801FC3E4 001F93E4  C0 7E 00 20 */	lfs f3, 0x20(r30)
/* 801FC3E8 001F93E8  38 03 4D D3 */	addi r0, r3, 0x10624DD3@l
/* 801FC3EC 001F93EC  C0 3E 00 28 */	lfs f1, 0x28(r30)
/* 801FC3F0 001F93F0  7C 00 40 96 */	mulhw r0, r0, r8
/* 801FC3F4 001F93F4  C0 5E 00 24 */	lfs f2, 0x24(r30)
/* 801FC3F8 001F93F8  C0 1E 00 2C */	lfs f0, 0x2c(r30)
/* 801FC3FC 001F93FC  EC 23 08 2A */	fadds f1, f3, f1
/* 801FC400 001F9400  C0 62 F1 20 */	lfs f3, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC404 001F9404  38 61 00 30 */	addi r3, r1, 0x30
/* 801FC408 001F9408  7C 05 36 70 */	srawi r5, r0, 6
/* 801FC40C 001F940C  EC 42 00 2A */	fadds f2, f2, f0
/* 801FC410 001F9410  7C 00 36 70 */	srawi r0, r0, 6
/* 801FC414 001F9414  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801FC418 001F9418  54 A6 0F FE */	srwi r6, r5, 0x1f
/* 801FC41C 001F941C  7C 00 22 14 */	add r0, r0, r4
/* 801FC420 001F9420  1C 00 03 E8 */	mulli r0, r0, 0x3e8
/* 801FC424 001F9424  7F 85 32 14 */	add r28, r5, r6
/* 801FC428 001F9428  7F 60 40 50 */	subf r27, r0, r8
/* 801FC42C 001F942C  48 09 C0 01 */	bl PSMTXTrans
/* 801FC430 001F9430  C0 42 F1 28 */	lfs f2, lbl_804204A8-_SDA2_BASE_(r2)
/* 801FC434 001F9434  38 61 00 60 */	addi r3, r1, 0x60
/* 801FC438 001F9438  C0 22 F1 24 */	lfs f1, lbl_804204A4-_SDA2_BASE_(r2)
/* 801FC43C 001F943C  FC 60 10 90 */	fmr f3, f2
/* 801FC440 001F9440  48 09 C0 6D */	bl PSMTXScale
/* 801FC444 001F9444  38 61 00 30 */	addi r3, r1, 0x30
/* 801FC448 001F9448  38 81 00 60 */	addi r4, r1, 0x60
/* 801FC44C 001F944C  38 A1 00 90 */	addi r5, r1, 0x90
/* 801FC450 001F9450  48 09 BB 11 */	bl PSMTXConcat
/* 801FC454 001F9454  80 02 F1 1C */	lwz r0, lbl_8042049C-_SDA2_BASE_(r2)
/* 801FC458 001F9458  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC45C 001F945C  38 C1 00 18 */	addi r6, r1, 0x18
/* 801FC460 001F9460  38 80 00 10 */	li r4, 0x10
/* 801FC464 001F9464  90 01 00 18 */	stw r0, 0x18(r1)
/* 801FC468 001F9468  38 A0 01 F6 */	li r5, 0x1f6
/* 801FC46C 001F946C  4B E1 DC F5 */	bl iconDispGxCol
/* 801FC470 001F9470  3C 60 51 EC */	lis r3, 0x51EB851F@ha
/* 801FC474 001F9474  3B A1 00 24 */	addi r29, r1, 0x24
/* 801FC478 001F9478  38 03 85 1F */	addi r0, r3, 0x51EB851F@l
/* 801FC47C 001F947C  3C 80 66 66 */	lis r4, 0x66666667@ha
/* 801FC480 001F9480  7C C0 E0 96 */	mulhw r6, r0, r28
/* 801FC484 001F9484  3C 60 80 30 */	lis r3, lbl_802FD528@ha
/* 801FC488 001F9488  CB E3 D5 28 */	lfd f31, lbl_802FD528@l(r3)
/* 801FC48C 001F948C  38 04 66 67 */	addi r0, r4, 0x66666667@l
/* 801FC490 001F9490  83 21 00 20 */	lwz r25, 0x20(r1)
/* 801FC494 001F9494  7F BE EB 78 */	mr r30, r29
/* 801FC498 001F9498  7C C5 2E 70 */	srawi r5, r6, 5
/* 801FC49C 001F949C  3B 40 00 00 */	li r26, 0
/* 801FC4A0 001F94A0  7C C3 2E 70 */	srawi r3, r6, 5
/* 801FC4A4 001F94A4  3B E0 FF CE */	li r31, -50
/* 801FC4A8 001F94A8  54 64 0F FE */	srwi r4, r3, 0x1f
/* 801FC4AC 001F94AC  54 A6 0F FE */	srwi r6, r5, 0x1f
/* 801FC4B0 001F94B0  7C 63 22 14 */	add r3, r3, r4
/* 801FC4B4 001F94B4  3F 00 43 30 */	lis r24, 0x4330
/* 801FC4B8 001F94B8  1C 63 00 64 */	mulli r3, r3, 0x64
/* 801FC4BC 001F94BC  7C 85 32 14 */	add r4, r5, r6
/* 801FC4C0 001F94C0  90 81 00 24 */	stw r4, 0x24(r1)
/* 801FC4C4 001F94C4  7F 83 E0 50 */	subf r28, r3, r28
/* 801FC4C8 001F94C8  7C 00 E0 96 */	mulhw r0, r0, r28
/* 801FC4CC 001F94CC  7C 04 16 70 */	srawi r4, r0, 2
/* 801FC4D0 001F94D0  7C 00 16 70 */	srawi r0, r0, 2
/* 801FC4D4 001F94D4  54 03 0F FE */	srwi r3, r0, 0x1f
/* 801FC4D8 001F94D8  54 85 0F FE */	srwi r5, r4, 0x1f
/* 801FC4DC 001F94DC  7C 00 1A 14 */	add r0, r0, r3
/* 801FC4E0 001F94E0  1C 00 00 0A */	mulli r0, r0, 0xa
/* 801FC4E4 001F94E4  7C 64 2A 14 */	add r3, r4, r5
/* 801FC4E8 001F94E8  90 61 00 28 */	stw r3, 0x28(r1)
/* 801FC4EC 001F94EC  7C 00 E0 50 */	subf r0, r0, r28
/* 801FC4F0 001F94F0  90 01 00 2C */	stw r0, 0x2c(r1)
lbl_801FC4F4:
/* 801FC4F4 001F94F4  6F E0 80 00 */	xoris r0, r31, 0x8000
/* 801FC4F8 001F94F8  93 01 00 C0 */	stw r24, 0xc0(r1)
/* 801FC4FC 001F94FC  C0 42 F1 2C */	lfs f2, lbl_804204AC-_SDA2_BASE_(r2)
/* 801FC500 001F9500  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC504 001F9504  90 01 00 C4 */	stw r0, 0xc4(r1)
/* 801FC508 001F9508  C0 62 F1 20 */	lfs f3, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC50C 001F950C  C8 01 00 C0 */	lfd f0, 0xc0(r1)
/* 801FC510 001F9510  EC 20 F8 28 */	fsubs f1, f0, f31
/* 801FC514 001F9514  48 09 BF 19 */	bl PSMTXTrans
/* 801FC518 001F9518  38 81 00 90 */	addi r4, r1, 0x90
/* 801FC51C 001F951C  38 61 00 30 */	addi r3, r1, 0x30
/* 801FC520 001F9520  7C 85 23 78 */	mr r5, r4
/* 801FC524 001F9524  48 09 BA 3D */	bl PSMTXConcat
/* 801FC528 001F9528  80 9E 00 00 */	lwz r4, 0(r30)
/* 801FC52C 001F952C  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC530 001F9530  93 21 00 14 */	stw r25, 0x14(r1)
/* 801FC534 001F9534  38 C1 00 14 */	addi r6, r1, 0x14
/* 801FC538 001F9538  38 04 01 F7 */	addi r0, r4, 0x1f7
/* 801FC53C 001F953C  38 80 00 10 */	li r4, 0x10
/* 801FC540 001F9540  54 05 04 3E */	clrlwi r5, r0, 0x10
/* 801FC544 001F9544  4B E1 DC 1D */	bl iconDispGxCol
/* 801FC548 001F9548  3B 5A 00 01 */	addi r26, r26, 1
/* 801FC54C 001F954C  3B DE 00 04 */	addi r30, r30, 4
/* 801FC550 001F9550  2C 1A 00 03 */	cmpwi r26, 3
/* 801FC554 001F9554  3B FF 00 1E */	addi r31, r31, 0x1e
/* 801FC558 001F9558  41 80 FF 9C */	blt lbl_801FC4F4
/* 801FC55C 001F955C  C0 22 F1 30 */	lfs f1, lbl_804204B0-_SDA2_BASE_(r2)
/* 801FC560 001F9560  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC564 001F9564  C0 42 F1 34 */	lfs f2, lbl_804204B4-_SDA2_BASE_(r2)
/* 801FC568 001F9568  C0 62 F1 20 */	lfs f3, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC56C 001F956C  48 09 BE C1 */	bl PSMTXTrans
/* 801FC570 001F9570  38 81 00 90 */	addi r4, r1, 0x90
/* 801FC574 001F9574  38 61 00 30 */	addi r3, r1, 0x30
/* 801FC578 001F9578  7C 85 23 78 */	mr r5, r4
/* 801FC57C 001F957C  48 09 B9 E5 */	bl PSMTXConcat
/* 801FC580 001F9580  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 801FC584 001F9584  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC588 001F9588  38 C1 00 10 */	addi r6, r1, 0x10
/* 801FC58C 001F958C  38 80 00 10 */	li r4, 0x10
/* 801FC590 001F9590  90 01 00 10 */	stw r0, 0x10(r1)
/* 801FC594 001F9594  38 A0 02 01 */	li r5, 0x201
/* 801FC598 001F9598  4B E1 DB C9 */	bl iconDispGxCol
/* 801FC59C 001F959C  3C 60 51 EC */	lis r3, 0x51EB851F@ha
/* 801FC5A0 001F95A0  3C 80 66 66 */	lis r4, 0x66666667@ha
/* 801FC5A4 001F95A4  38 03 85 1F */	addi r0, r3, 0x51EB851F@l
/* 801FC5A8 001F95A8  83 41 00 20 */	lwz r26, 0x20(r1)
/* 801FC5AC 001F95AC  7C 00 D8 96 */	mulhw r0, r0, r27
/* 801FC5B0 001F95B0  3C 60 80 30 */	lis r3, lbl_802FD528@ha
/* 801FC5B4 001F95B4  CB E3 D5 28 */	lfd f31, lbl_802FD528@l(r3)
/* 801FC5B8 001F95B8  38 84 66 67 */	addi r4, r4, 0x66666667@l
/* 801FC5BC 001F95BC  3B E0 00 00 */	li r31, 0
/* 801FC5C0 001F95C0  3B C0 00 28 */	li r30, 0x28
/* 801FC5C4 001F95C4  7C 05 2E 70 */	srawi r5, r0, 5
/* 801FC5C8 001F95C8  3F 80 43 30 */	lis r28, 0x4330
/* 801FC5CC 001F95CC  7C 00 2E 70 */	srawi r0, r0, 5
/* 801FC5D0 001F95D0  54 03 0F FE */	srwi r3, r0, 0x1f
/* 801FC5D4 001F95D4  54 A6 0F FE */	srwi r6, r5, 0x1f
/* 801FC5D8 001F95D8  7C 00 1A 14 */	add r0, r0, r3
/* 801FC5DC 001F95DC  1C 00 00 64 */	mulli r0, r0, 0x64
/* 801FC5E0 001F95E0  7C 65 32 14 */	add r3, r5, r6
/* 801FC5E4 001F95E4  90 61 00 24 */	stw r3, 0x24(r1)
/* 801FC5E8 001F95E8  7C 00 D8 50 */	subf r0, r0, r27
/* 801FC5EC 001F95EC  7C 04 00 96 */	mulhw r0, r4, r0
/* 801FC5F0 001F95F0  7C 00 16 70 */	srawi r0, r0, 2
/* 801FC5F4 001F95F4  54 03 0F FE */	srwi r3, r0, 0x1f
/* 801FC5F8 001F95F8  7C 00 1A 14 */	add r0, r0, r3
/* 801FC5FC 001F95FC  90 01 00 28 */	stw r0, 0x28(r1)
lbl_801FC600:
/* 801FC600 001F9600  6F C0 80 00 */	xoris r0, r30, 0x8000
/* 801FC604 001F9604  93 81 00 C0 */	stw r28, 0xc0(r1)
/* 801FC608 001F9608  C0 42 F1 2C */	lfs f2, lbl_804204AC-_SDA2_BASE_(r2)
/* 801FC60C 001F960C  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC610 001F9610  90 01 00 C4 */	stw r0, 0xc4(r1)
/* 801FC614 001F9614  C0 62 F1 20 */	lfs f3, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC618 001F9618  C8 01 00 C0 */	lfd f0, 0xc0(r1)
/* 801FC61C 001F961C  EC 20 F8 28 */	fsubs f1, f0, f31
/* 801FC620 001F9620  48 09 BE 0D */	bl PSMTXTrans
/* 801FC624 001F9624  C0 22 F1 38 */	lfs f1, lbl_804204B8-_SDA2_BASE_(r2)
/* 801FC628 001F9628  38 61 00 60 */	addi r3, r1, 0x60
/* 801FC62C 001F962C  FC 40 08 90 */	fmr f2, f1
/* 801FC630 001F9630  FC 60 08 90 */	fmr f3, f1
/* 801FC634 001F9634  48 09 BE 79 */	bl PSMTXScale
/* 801FC638 001F9638  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC63C 001F963C  38 81 00 60 */	addi r4, r1, 0x60
/* 801FC640 001F9640  7C 65 1B 78 */	mr r5, r3
/* 801FC644 001F9644  48 09 B9 1D */	bl PSMTXConcat
/* 801FC648 001F9648  38 81 00 90 */	addi r4, r1, 0x90
/* 801FC64C 001F964C  38 61 00 30 */	addi r3, r1, 0x30
/* 801FC650 001F9650  7C 85 23 78 */	mr r5, r4
/* 801FC654 001F9654  48 09 B9 0D */	bl PSMTXConcat
/* 801FC658 001F9658  80 9D 00 00 */	lwz r4, 0(r29)
/* 801FC65C 001F965C  38 61 00 90 */	addi r3, r1, 0x90
/* 801FC660 001F9660  93 41 00 0C */	stw r26, 0xc(r1)
/* 801FC664 001F9664  38 C1 00 0C */	addi r6, r1, 0xc
/* 801FC668 001F9668  38 04 01 F7 */	addi r0, r4, 0x1f7
/* 801FC66C 001F966C  38 80 00 10 */	li r4, 0x10
/* 801FC670 001F9670  54 05 04 3E */	clrlwi r5, r0, 0x10
/* 801FC674 001F9674  4B E1 DA ED */	bl iconDispGxCol
/* 801FC678 001F9678  3B FF 00 01 */	addi r31, r31, 1
/* 801FC67C 001F967C  3B BD 00 04 */	addi r29, r29, 4
/* 801FC680 001F9680  2C 1F 00 02 */	cmpwi r31, 2
/* 801FC684 001F9684  3B DE 00 0F */	addi r30, r30, 0xf
/* 801FC688 001F9688  41 80 FF 78 */	blt lbl_801FC600
lbl_801FC68C:
/* 801FC68C 001F968C  E3 E1 00 F8 */	psq_l f31, 248(r1), 0, qr0
/* 801FC690 001F9690  CB E1 00 F0 */	lfd f31, 0xf0(r1)
/* 801FC694 001F9694  BB 01 00 D0 */	lmw r24, 0xd0(r1)
/* 801FC698 001F9698  80 01 01 04 */	lwz r0, 0x104(r1)
/* 801FC69C 001F969C  7C 08 03 A6 */	mtlr r0
/* 801FC6A0 001F96A0  38 21 01 00 */	addi r1, r1, 0x100
/* 801FC6A4 001F96A4  4E 80 00 20 */	blr 

.global countDownMain
countDownMain:
/* 801FC6A8 001F96A8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801FC6AC 001F96AC  7C 08 02 A6 */	mflr r0
/* 801FC6B0 001F96B0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801FC6B4 001F96B4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801FC6B8 001F96B8  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC6BC 001F96BC  A0 64 00 00 */	lhz r3, 0(r4)
/* 801FC6C0 001F96C0  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 801FC6C4 001F96C4  41 82 01 FC */	beq lbl_801FC8C0
/* 801FC6C8 001F96C8  80 04 00 30 */	lwz r0, 0x30(r4)
/* 801FC6CC 001F96CC  2C 00 00 01 */	cmpwi r0, 1
/* 801FC6D0 001F96D0  41 82 00 7C */	beq lbl_801FC74C
/* 801FC6D4 001F96D4  40 80 00 10 */	bge lbl_801FC6E4
/* 801FC6D8 001F96D8  2C 00 00 00 */	cmpwi r0, 0
/* 801FC6DC 001F96DC  40 80 00 14 */	bge lbl_801FC6F0
/* 801FC6E0 001F96E0  48 00 01 00 */	b lbl_801FC7E0
lbl_801FC6E4:
/* 801FC6E4 001F96E4  2C 00 00 03 */	cmpwi r0, 3
/* 801FC6E8 001F96E8  40 80 00 F8 */	bge lbl_801FC7E0
/* 801FC6EC 001F96EC  48 00 00 80 */	b lbl_801FC76C
lbl_801FC6F0:
/* 801FC6F0 001F96F0  80 64 00 34 */	lwz r3, 0x34(r4)
/* 801FC6F4 001F96F4  38 03 00 01 */	addi r0, r3, 1
/* 801FC6F8 001F96F8  2C 00 00 1E */	cmpwi r0, 0x1e
/* 801FC6FC 001F96FC  90 04 00 34 */	stw r0, 0x34(r4)
/* 801FC700 001F9700  40 80 00 2C */	bge lbl_801FC72C
/* 801FC704 001F9704  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC708 001F9708  38 60 00 0B */	li r3, 0xb
/* 801FC70C 001F970C  C0 22 F1 3C */	lfs f1, lbl_804204BC-_SDA2_BASE_(r2)
/* 801FC710 001F9710  38 A0 00 1E */	li r5, 0x1e
/* 801FC714 001F9714  C0 42 F1 20 */	lfs f2, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC718 001F9718  80 84 00 34 */	lwz r4, 0x34(r4)
/* 801FC71C 001F971C  4B E0 A4 F1 */	bl intplGetValue
/* 801FC720 001F9720  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC724 001F9724  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 801FC728 001F9728  48 00 00 B8 */	b lbl_801FC7E0
lbl_801FC72C:
/* 801FC72C 001F972C  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC730 001F9730  38 00 00 00 */	li r0, 0
/* 801FC734 001F9734  90 03 00 34 */	stw r0, 0x34(r3)
/* 801FC738 001F9738  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC73C 001F973C  80 64 00 30 */	lwz r3, 0x30(r4)
/* 801FC740 001F9740  38 03 00 01 */	addi r0, r3, 1
/* 801FC744 001F9744  90 04 00 30 */	stw r0, 0x30(r4)
/* 801FC748 001F9748  48 00 00 98 */	b lbl_801FC7E0
lbl_801FC74C:
/* 801FC74C 001F974C  54 60 07 BD */	rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 801FC750 001F9750  41 82 00 90 */	beq lbl_801FC7E0
/* 801FC754 001F9754  80 64 00 38 */	lwz r3, 0x38(r4)
/* 801FC758 001F9758  4B ED 8A A5 */	bl psndSFXOff
/* 801FC75C 001F975C  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC760 001F9760  38 00 FF FF */	li r0, -1
/* 801FC764 001F9764  90 03 00 38 */	stw r0, 0x38(r3)
/* 801FC768 001F9768  48 00 00 78 */	b lbl_801FC7E0
lbl_801FC76C:
/* 801FC76C 001F976C  80 64 00 34 */	lwz r3, 0x34(r4)
/* 801FC770 001F9770  38 03 00 01 */	addi r0, r3, 1
/* 801FC774 001F9774  2C 00 00 1E */	cmpwi r0, 0x1e
/* 801FC778 001F9778  90 04 00 34 */	stw r0, 0x34(r4)
/* 801FC77C 001F977C  40 80 00 2C */	bge lbl_801FC7A8
/* 801FC780 001F9780  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC784 001F9784  38 60 00 0B */	li r3, 0xb
/* 801FC788 001F9788  C0 22 F1 20 */	lfs f1, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC78C 001F978C  38 A0 00 1E */	li r5, 0x1e
/* 801FC790 001F9790  C0 42 F1 3C */	lfs f2, lbl_804204BC-_SDA2_BASE_(r2)
/* 801FC794 001F9794  80 84 00 34 */	lwz r4, 0x34(r4)
/* 801FC798 001F9798  4B E0 A4 75 */	bl intplGetValue
/* 801FC79C 001F979C  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC7A0 001F97A0  D0 23 00 28 */	stfs f1, 0x28(r3)
/* 801FC7A4 001F97A4  48 00 00 3C */	b lbl_801FC7E0
lbl_801FC7A8:
/* 801FC7A8 001F97A8  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC7AC 001F97AC  38 00 00 00 */	li r0, 0
/* 801FC7B0 001F97B0  90 03 00 34 */	stw r0, 0x34(r3)
/* 801FC7B4 001F97B4  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC7B8 001F97B8  80 64 00 30 */	lwz r3, 0x30(r4)
/* 801FC7BC 001F97BC  38 03 00 01 */	addi r0, r3, 1
/* 801FC7C0 001F97C0  90 04 00 30 */	stw r0, 0x30(r4)
/* 801FC7C4 001F97C4  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC7C8 001F97C8  A0 03 00 00 */	lhz r0, 0(r3)
/* 801FC7CC 001F97CC  54 00 04 3C */	rlwinm r0, r0, 0, 0x10, 0x1e
/* 801FC7D0 001F97D0  B0 03 00 00 */	sth r0, 0(r3)
/* 801FC7D4 001F97D4  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC7D8 001F97D8  80 63 00 38 */	lwz r3, 0x38(r3)
/* 801FC7DC 001F97DC  4B ED 8A 21 */	bl psndSFXOff
lbl_801FC7E0:
/* 801FC7E0 001F97E0  80 6D 18 C8 */	lwz r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC7E4 001F97E4  A0 03 00 00 */	lhz r0, 0(r3)
/* 801FC7E8 001F97E8  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 801FC7EC 001F97EC  40 82 00 40 */	bne lbl_801FC82C
/* 801FC7F0 001F97F0  4B E7 1D 5D */	bl marioStGetSystemLevel
/* 801FC7F4 001F97F4  28 03 00 00 */	cmplwi r3, 0
/* 801FC7F8 001F97F8  40 82 00 34 */	bne lbl_801FC82C
/* 801FC7FC 001F97FC  80 CD 18 C8 */	lwz r6, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC800 001F9800  80 6D 90 B0 */	lwz r3, gp-_SDA_BASE_(r13)
/* 801FC804 001F9804  80 86 00 14 */	lwz r4, 0x14(r6)
/* 801FC808 001F9808  80 03 00 3C */	lwz r0, 0x3c(r3)
/* 801FC80C 001F980C  80 A6 00 0C */	lwz r5, 0xc(r6)
/* 801FC810 001F9810  7C 64 00 50 */	subf r3, r4, r0
/* 801FC814 001F9814  80 86 00 08 */	lwz r4, 8(r6)
/* 801FC818 001F9818  7C 60 FE 70 */	srawi r0, r3, 0x1f
/* 801FC81C 001F981C  7C 65 18 14 */	addc r3, r5, r3
/* 801FC820 001F9820  90 66 00 0C */	stw r3, 0xc(r6)
/* 801FC824 001F9824  7C 04 01 14 */	adde r0, r4, r0
/* 801FC828 001F9828  90 06 00 08 */	stw r0, 8(r6)
lbl_801FC82C:
/* 801FC82C 001F982C  80 AD 90 B0 */	lwz r5, gp-_SDA_BASE_(r13)
/* 801FC830 001F9830  3C 60 10 62 */	lis r3, 0x10624DD3@ha
/* 801FC834 001F9834  80 CD 18 C8 */	lwz r6, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC838 001F9838  3C 80 80 00 */	lis r4, 0x800000F8@ha
/* 801FC83C 001F983C  80 05 00 38 */	lwz r0, 0x38(r5)
/* 801FC840 001F9840  38 63 4D D3 */	addi r3, r3, 0x10624DD3@l
/* 801FC844 001F9844  80 E5 00 3C */	lwz r7, 0x3c(r5)
/* 801FC848 001F9848  38 A0 00 00 */	li r5, 0
/* 801FC84C 001F984C  90 E6 00 14 */	stw r7, 0x14(r6)
/* 801FC850 001F9850  90 06 00 10 */	stw r0, 0x10(r6)
/* 801FC854 001F9854  80 04 00 F8 */	lwz r0, 0x800000F8@l(r4)
/* 801FC858 001F9858  83 ED 18 C8 */	lwz r31, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC85C 001F985C  54 00 F0 BE */	srwi r0, r0, 2
/* 801FC860 001F9860  7C 03 00 16 */	mulhwu r0, r3, r0
/* 801FC864 001F9864  80 7F 00 08 */	lwz r3, 8(r31)
/* 801FC868 001F9868  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 801FC86C 001F986C  54 06 D1 BE */	srwi r6, r0, 6
/* 801FC870 001F9870  48 06 22 B9 */	bl __div2i
/* 801FC874 001F9874  80 DF 00 18 */	lwz r6, 0x18(r31)
/* 801FC878 001F9878  38 00 00 00 */	li r0, 0
/* 801FC87C 001F987C  6C 65 80 00 */	xoris r5, r3, 0x8000
/* 801FC880 001F9880  6C 03 80 00 */	xoris r3, r0, 0x8000
/* 801FC884 001F9884  7C 06 20 10 */	subfc r0, r6, r4
/* 801FC888 001F9888  7C 63 29 10 */	subfe r3, r3, r5
/* 801FC88C 001F988C  7C 65 29 10 */	subfe r3, r5, r5
/* 801FC890 001F9890  7C 63 00 D1 */	neg. r3, r3
/* 801FC894 001F9894  40 82 00 10 */	bne lbl_801FC8A4
/* 801FC898 001F9898  A0 1F 00 00 */	lhz r0, 0(r31)
/* 801FC89C 001F989C  60 00 00 02 */	ori r0, r0, 2
/* 801FC8A0 001F98A0  B0 1F 00 00 */	sth r0, 0(r31)
lbl_801FC8A4:
/* 801FC8A4 001F98A4  3C 60 80 20 */	lis r3, countDownDisp@ha
/* 801FC8A8 001F98A8  C0 22 F1 40 */	lfs f1, lbl_804204C0-_SDA2_BASE_(r2)
/* 801FC8AC 001F98AC  38 A3 C3 5C */	addi r5, r3, countDownDisp@l
/* 801FC8B0 001F98B0  38 80 00 00 */	li r4, 0
/* 801FC8B4 001F98B4  38 60 00 08 */	li r3, 8
/* 801FC8B8 001F98B8  38 C0 00 00 */	li r6, 0
/* 801FC8BC 001F98BC  4B E1 41 5D */	bl dispEntry
lbl_801FC8C0:
/* 801FC8C0 001F98C0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801FC8C4 001F98C4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801FC8C8 001F98C8  7C 08 03 A6 */	mtlr r0
/* 801FC8CC 001F98CC  38 21 00 10 */	addi r1, r1, 0x10
/* 801FC8D0 001F98D0  4E 80 00 20 */	blr 

.global countDownSetRestartTime
countDownSetRestartTime:
/* 801FC8D4 001F98D4  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC8D8 001F98D8  90 64 00 1C */	stw r3, 0x1c(r4)
/* 801FC8DC 001F98DC  4E 80 00 20 */	blr 

.global countDownStart
countDownStart:
/* 801FC8E0 001F98E0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801FC8E4 001F98E4  7C 08 02 A6 */	mflr r0
/* 801FC8E8 001F98E8  3C A0 F5 DE */	lis r5, 0xF5DE0180@ha
/* 801FC8EC 001F98EC  C0 42 F1 20 */	lfs f2, lbl_804204A0-_SDA2_BASE_(r2)
/* 801FC8F0 001F98F0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801FC8F4 001F98F4  38 00 00 00 */	li r0, 0
/* 801FC8F8 001F98F8  C0 22 F1 44 */	lfs f1, lbl_804204C4-_SDA2_BASE_(r2)
/* 801FC8FC 001F98FC  80 CD 18 C8 */	lwz r6, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC900 001F9900  C0 02 F1 48 */	lfs f0, lbl_804204C8-_SDA2_BASE_(r2)
/* 801FC904 001F9904  90 66 00 18 */	stw r3, 0x18(r6)
/* 801FC908 001F9908  38 60 00 00 */	li r3, 0
/* 801FC90C 001F990C  80 CD 18 C8 */	lwz r6, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC910 001F9910  90 86 00 1C */	stw r4, 0x1c(r6)
/* 801FC914 001F9914  38 85 01 80 */	addi r4, r5, 0xF5DE0180@l
/* 801FC918 001F9918  80 ED 90 B0 */	lwz r7, gp-_SDA_BASE_(r13)
/* 801FC91C 001F991C  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC920 001F9920  80 C7 00 38 */	lwz r6, 0x38(r7)
/* 801FC924 001F9924  80 E7 00 3C */	lwz r7, 0x3c(r7)
/* 801FC928 001F9928  90 E5 00 14 */	stw r7, 0x14(r5)
/* 801FC92C 001F992C  90 C5 00 10 */	stw r6, 0x10(r5)
/* 801FC930 001F9930  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC934 001F9934  90 05 00 0C */	stw r0, 0xc(r5)
/* 801FC938 001F9938  90 05 00 08 */	stw r0, 8(r5)
/* 801FC93C 001F993C  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC940 001F9940  90 05 00 30 */	stw r0, 0x30(r5)
/* 801FC944 001F9944  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC948 001F9948  90 05 00 34 */	stw r0, 0x34(r5)
/* 801FC94C 001F994C  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC950 001F9950  D0 45 00 28 */	stfs f2, 0x28(r5)
/* 801FC954 001F9954  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC958 001F9958  D0 45 00 2C */	stfs f2, 0x2c(r5)
/* 801FC95C 001F995C  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC960 001F9960  D0 25 00 20 */	stfs f1, 0x20(r5)
/* 801FC964 001F9964  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC968 001F9968  D0 05 00 24 */	stfs f0, 0x24(r5)
/* 801FC96C 001F996C  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC970 001F9970  B0 05 00 00 */	sth r0, 0(r5)
/* 801FC974 001F9974  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC978 001F9978  A0 05 00 00 */	lhz r0, 0(r5)
/* 801FC97C 001F997C  60 00 00 01 */	ori r0, r0, 1
/* 801FC980 001F9980  B0 05 00 00 */	sth r0, 0(r5)
/* 801FC984 001F9984  4B E3 42 49 */	bl evtGetValue
/* 801FC988 001F9988  2C 03 01 60 */	cmpwi r3, 0x160
/* 801FC98C 001F998C  40 80 00 1C */	bge lbl_801FC9A8
/* 801FC990 001F9990  3C 60 80 30 */	lis r3, lbl_802FD530@ha
/* 801FC994 001F9994  38 63 D5 30 */	addi r3, r3, lbl_802FD530@l
/* 801FC998 001F9998  4B ED 8B 29 */	bl psndSFXOn
/* 801FC99C 001F999C  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC9A0 001F99A0  90 64 00 38 */	stw r3, 0x38(r4)
/* 801FC9A4 001F99A4  48 00 00 18 */	b lbl_801FC9BC
lbl_801FC9A8:
/* 801FC9A8 001F99A8  3C 60 80 30 */	lis r3, lbl_802FD548@ha
/* 801FC9AC 001F99AC  38 63 D5 48 */	addi r3, r3, lbl_802FD548@l
/* 801FC9B0 001F99B0  4B ED 8B 11 */	bl psndSFXOn
/* 801FC9B4 001F99B4  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC9B8 001F99B8  90 64 00 38 */	stw r3, 0x38(r4)
lbl_801FC9BC:
/* 801FC9BC 001F99BC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801FC9C0 001F99C0  7C 08 03 A6 */	mtlr r0
/* 801FC9C4 001F99C4  38 21 00 10 */	addi r1, r1, 0x10
/* 801FC9C8 001F99C8  4E 80 00 20 */	blr 

.global countDownSaveReStart
countDownSaveReStart:
/* 801FC9CC 001F99CC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801FC9D0 001F99D0  7C 08 02 A6 */	mflr r0
/* 801FC9D4 001F99D4  90 01 00 24 */	stw r0, 0x24(r1)
/* 801FC9D8 001F99D8  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801FC9DC 001F99DC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801FC9E0 001F99E0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801FC9E4 001F99E4  83 ED 18 C8 */	lwz r31, lbl_80418B28-_SDA_BASE_(r13)
/* 801FC9E8 001F99E8  A0 1F 00 00 */	lhz r0, 0(r31)
/* 801FC9EC 001F99EC  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 801FC9F0 001F99F0  41 82 00 D0 */	beq lbl_801FCAC0
/* 801FC9F4 001F99F4  3C 80 80 00 */	lis r4, 0x800000F8@ha
/* 801FC9F8 001F99F8  3C 60 10 62 */	lis r3, 0x10624DD3@ha
/* 801FC9FC 001F99FC  80 04 00 F8 */	lwz r0, 0x800000F8@l(r4)
/* 801FCA00 001F9A00  38 A3 4D D3 */	addi r5, r3, 0x10624DD3@l
/* 801FCA04 001F9A04  80 7F 00 08 */	lwz r3, 8(r31)
/* 801FCA08 001F9A08  3B A0 00 00 */	li r29, 0
/* 801FCA0C 001F9A0C  54 00 F0 BE */	srwi r0, r0, 2
/* 801FCA10 001F9A10  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 801FCA14 001F9A14  7C 05 00 16 */	mulhwu r0, r5, r0
/* 801FCA18 001F9A18  38 A0 00 00 */	li r5, 0
/* 801FCA1C 001F9A1C  54 1E D1 BE */	srwi r30, r0, 6
/* 801FCA20 001F9A20  7F C6 F3 78 */	mr r6, r30
/* 801FCA24 001F9A24  48 06 21 05 */	bl __div2i
/* 801FCA28 001F9A28  80 FF 00 18 */	lwz r7, 0x18(r31)
/* 801FCA2C 001F9A2C  38 A0 00 00 */	li r5, 0
/* 801FCA30 001F9A30  80 DF 00 1C */	lwz r6, 0x1c(r31)
/* 801FCA34 001F9A34  7C 04 38 10 */	subfc r0, r4, r7
/* 801FCA38 001F9A38  7C 00 30 40 */	cmplw r0, r6
/* 801FCA3C 001F9A3C  41 81 00 28 */	bgt lbl_801FCA64
/* 801FCA40 001F9A40  7C 86 38 50 */	subf r4, r6, r7
/* 801FCA44 001F9A44  7C 1E 20 16 */	mulhwu r0, r30, r4
/* 801FCA48 001F9A48  7C 7D 21 D6 */	mullw r3, r29, r4
/* 801FCA4C 001F9A4C  7C 9E 21 D6 */	mullw r4, r30, r4
/* 801FCA50 001F9A50  7C 60 1A 14 */	add r3, r0, r3
/* 801FCA54 001F9A54  7C 1E 29 D6 */	mullw r0, r30, r5
/* 801FCA58 001F9A58  90 9F 00 0C */	stw r4, 0xc(r31)
/* 801FCA5C 001F9A5C  7C 03 02 14 */	add r0, r3, r0
/* 801FCA60 001F9A60  90 1F 00 08 */	stw r0, 8(r31)
lbl_801FCA64:
/* 801FCA64 001F9A64  80 CD 90 B0 */	lwz r6, gp-_SDA_BASE_(r13)
/* 801FCA68 001F9A68  3C 60 F5 DE */	lis r3, 0xF5DE0180@ha
/* 801FCA6C 001F9A6C  80 AD 18 C8 */	lwz r5, lbl_80418B28-_SDA_BASE_(r13)
/* 801FCA70 001F9A70  38 83 01 80 */	addi r4, r3, 0xF5DE0180@l
/* 801FCA74 001F9A74  80 06 00 38 */	lwz r0, 0x38(r6)
/* 801FCA78 001F9A78  38 60 00 00 */	li r3, 0
/* 801FCA7C 001F9A7C  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 801FCA80 001F9A80  90 C5 00 14 */	stw r6, 0x14(r5)
/* 801FCA84 001F9A84  90 05 00 10 */	stw r0, 0x10(r5)
/* 801FCA88 001F9A88  4B E3 41 45 */	bl evtGetValue
/* 801FCA8C 001F9A8C  2C 03 01 60 */	cmpwi r3, 0x160
/* 801FCA90 001F9A90  40 80 00 1C */	bge lbl_801FCAAC
/* 801FCA94 001F9A94  3C 60 80 30 */	lis r3, lbl_802FD530@ha
/* 801FCA98 001F9A98  38 63 D5 30 */	addi r3, r3, lbl_802FD530@l
/* 801FCA9C 001F9A9C  4B ED 8A 25 */	bl psndSFXOn
/* 801FCAA0 001F9AA0  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FCAA4 001F9AA4  90 64 00 38 */	stw r3, 0x38(r4)
/* 801FCAA8 001F9AA8  48 00 00 18 */	b lbl_801FCAC0
lbl_801FCAAC:
/* 801FCAAC 001F9AAC  3C 60 80 30 */	lis r3, lbl_802FD548@ha
/* 801FCAB0 001F9AB0  38 63 D5 48 */	addi r3, r3, lbl_802FD548@l
/* 801FCAB4 001F9AB4  4B ED 8A 0D */	bl psndSFXOn
/* 801FCAB8 001F9AB8  80 8D 18 C8 */	lwz r4, lbl_80418B28-_SDA_BASE_(r13)
/* 801FCABC 001F9ABC  90 64 00 38 */	stw r3, 0x38(r4)
lbl_801FCAC0:
/* 801FCAC0 001F9AC0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801FCAC4 001F9AC4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801FCAC8 001F9AC8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801FCACC 001F9ACC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801FCAD0 001F9AD0  7C 08 03 A6 */	mtlr r0
/* 801FCAD4 001F9AD4  38 21 00 20 */	addi r1, r1, 0x20
/* 801FCAD8 001F9AD8  4E 80 00 20 */	blr 

.global countDownInit
countDownInit:
/* 801FCADC 001F9ADC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801FCAE0 001F9AE0  7C 08 02 A6 */	mflr r0
/* 801FCAE4 001F9AE4  38 80 00 00 */	li r4, 0
/* 801FCAE8 001F9AE8  38 A0 00 40 */	li r5, 0x40
/* 801FCAEC 001F9AEC  90 01 00 14 */	stw r0, 0x14(r1)
/* 801FCAF0 001F9AF0  80 6D 90 B0 */	lwz r3, gp-_SDA_BASE_(r13)
/* 801FCAF4 001F9AF4  38 63 00 68 */	addi r3, r3, 0x68
/* 801FCAF8 001F9AF8  90 6D 18 C8 */	stw r3, lbl_80418B28-_SDA_BASE_(r13)
/* 801FCAFC 001F9AFC  4B E0 85 B9 */	bl memset
/* 801FCB00 001F9B00  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801FCB04 001F9B04  7C 08 03 A6 */	mtlr r0
/* 801FCB08 001F9B08  38 21 00 10 */	addi r1, r1, 0x10
/* 801FCB0C 001F9B0C  4E 80 00 20 */	blr 
