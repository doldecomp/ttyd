.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effSparkDisp
effSparkDisp:
/* 8018D284 0018A284  94 21 FE B0 */	stwu r1, -0x150(r1)
/* 8018D288 0018A288  7C 08 02 A6 */	mflr r0
/* 8018D28C 0018A28C  90 01 01 54 */	stw r0, 0x154(r1)
/* 8018D290 0018A290  DB E1 01 40 */	stfd f31, 0x140(r1)
/* 8018D294 0018A294  F3 E1 01 48 */	psq_st f31, 328(r1), 0, qr0
/* 8018D298 0018A298  BF 61 01 2C */	stmw r27, 0x12c(r1)
/* 8018D29C 0018A29C  7C 9B 23 78 */	mr r27, r4
/* 8018D2A0 0018A2A0  7C 7D 1B 78 */	mr r29, r3
/* 8018D2A4 0018A2A4  83 C4 00 0C */	lwz r30, 0xc(r4)
/* 8018D2A8 0018A2A8  4B E8 1E A9 */	bl camGetPtr
/* 8018D2AC 0018A2AC  83 9E 00 30 */	lwz r28, 0x30(r30)
/* 8018D2B0 0018A2B0  7C 7F 1B 78 */	mr r31, r3
/* 8018D2B4 0018A2B4  38 81 00 10 */	addi r4, r1, 0x10
/* 8018D2B8 0018A2B8  38 60 00 1C */	li r3, 0x1c
/* 8018D2BC 0018A2BC  4B ED 0B F1 */	bl effGetTexObj
/* 8018D2C0 0018A2C0  38 61 00 10 */	addi r3, r1, 0x10
/* 8018D2C4 0018A2C4  38 80 00 00 */	li r4, 0
/* 8018D2C8 0018A2C8  48 12 47 B5 */	bl GXLoadTexObj
/* 8018D2CC 0018A2CC  38 60 00 01 */	li r3, 1
/* 8018D2D0 0018A2D0  48 12 3E 69 */	bl GXSetNumChans
/* 8018D2D4 0018A2D4  38 60 00 04 */	li r3, 4
/* 8018D2D8 0018A2D8  38 80 00 00 */	li r4, 0
/* 8018D2DC 0018A2DC  38 A0 00 00 */	li r5, 0
/* 8018D2E0 0018A2E0  38 C0 00 00 */	li r6, 0
/* 8018D2E4 0018A2E4  38 E0 00 00 */	li r7, 0
/* 8018D2E8 0018A2E8  39 00 00 00 */	li r8, 0
/* 8018D2EC 0018A2EC  39 20 00 02 */	li r9, 2
/* 8018D2F0 0018A2F0  48 12 3E 85 */	bl GXSetChanCtrl
/* 8018D2F4 0018A2F4  38 60 00 01 */	li r3, 1
/* 8018D2F8 0018A2F8  48 12 1F 89 */	bl GXSetNumTexGens
/* 8018D2FC 0018A2FC  38 60 00 00 */	li r3, 0
/* 8018D300 0018A300  38 80 00 01 */	li r4, 1
/* 8018D304 0018A304  38 A0 00 04 */	li r5, 4
/* 8018D308 0018A308  38 C0 00 3C */	li r6, 0x3c
/* 8018D30C 0018A30C  38 E0 00 00 */	li r7, 0
/* 8018D310 0018A310  39 00 00 7D */	li r8, 0x7d
/* 8018D314 0018A314  48 12 1C ED */	bl GXSetTexCoordGen2
/* 8018D318 0018A318  38 60 00 01 */	li r3, 1
/* 8018D31C 0018A31C  48 12 5E AD */	bl GXSetNumTevStages
/* 8018D320 0018A320  38 60 00 00 */	li r3, 0
/* 8018D324 0018A324  38 80 00 00 */	li r4, 0
/* 8018D328 0018A328  38 A0 00 00 */	li r5, 0
/* 8018D32C 0018A32C  38 C0 00 04 */	li r6, 4
/* 8018D330 0018A330  48 12 5C FD */	bl GXSetTevOrder
/* 8018D334 0018A334  38 60 00 00 */	li r3, 0
/* 8018D338 0018A338  38 80 00 00 */	li r4, 0
/* 8018D33C 0018A33C  48 12 57 95 */	bl GXSetTevOp
/* 8018D340 0018A340  38 60 00 00 */	li r3, 0
/* 8018D344 0018A344  48 12 2B 45 */	bl GXSetCullMode
/* 8018D348 0018A348  48 12 13 D5 */	bl GXClearVtxDesc
/* 8018D34C 0018A34C  38 60 00 09 */	li r3, 9
/* 8018D350 0018A350  38 80 00 01 */	li r4, 1
/* 8018D354 0018A354  48 12 0A B1 */	bl GXSetVtxDesc
/* 8018D358 0018A358  38 60 00 0D */	li r3, 0xd
/* 8018D35C 0018A35C  38 80 00 01 */	li r4, 1
/* 8018D360 0018A360  48 12 0A A5 */	bl GXSetVtxDesc
/* 8018D364 0018A364  38 60 00 00 */	li r3, 0
/* 8018D368 0018A368  38 80 00 09 */	li r4, 9
/* 8018D36C 0018A36C  38 A0 00 01 */	li r5, 1
/* 8018D370 0018A370  38 C0 00 04 */	li r6, 4
/* 8018D374 0018A374  38 E0 00 00 */	li r7, 0
/* 8018D378 0018A378  48 12 13 DD */	bl GXSetVtxAttrFmt
/* 8018D37C 0018A37C  38 60 00 00 */	li r3, 0
/* 8018D380 0018A380  38 80 00 0D */	li r4, 0xd
/* 8018D384 0018A384  38 A0 00 01 */	li r5, 1
/* 8018D388 0018A388  38 C0 00 04 */	li r6, 4
/* 8018D38C 0018A38C  38 E0 00 00 */	li r7, 0
/* 8018D390 0018A390  48 12 13 C5 */	bl GXSetVtxAttrFmt
/* 8018D394 0018A394  C0 3E 00 04 */	lfs f1, 4(r30)
/* 8018D398 0018A398  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8018D39C 0018A39C  C0 5E 00 08 */	lfs f2, 8(r30)
/* 8018D3A0 0018A3A0  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 8018D3A4 0018A3A4  48 10 B0 89 */	bl PSMTXTrans
/* 8018D3A8 0018A3A8  C0 3E 00 34 */	lfs f1, 0x34(r30)
/* 8018D3AC 0018A3AC  38 61 00 60 */	addi r3, r1, 0x60
/* 8018D3B0 0018A3B0  FC 40 08 90 */	fmr f2, f1
/* 8018D3B4 0018A3B4  FC 60 08 90 */	fmr f3, f1
/* 8018D3B8 0018A3B8  48 10 B0 F5 */	bl PSMTXScale
/* 8018D3BC 0018A3BC  7F A3 EB 78 */	mr r3, r29
/* 8018D3C0 0018A3C0  4B E8 1D 91 */	bl camGetPtr
/* 8018D3C4 0018A3C4  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8018D3C8 0018A3C8  38 61 00 90 */	addi r3, r1, 0x90
/* 8018D3CC 0018A3CC  C0 02 CE F4 */	lfs f0, lbl_8041E274@sda21(r2)
/* 8018D3D0 0018A3D0  38 80 00 79 */	li r4, 0x79
/* 8018D3D4 0018A3D4  FC 20 08 50 */	fneg f1, f1
/* 8018D3D8 0018A3D8  EC 20 00 72 */	fmuls f1, f0, f1
/* 8018D3DC 0018A3DC  48 10 AE 11 */	bl PSMTXRotRad
/* 8018D3E0 0018A3E0  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8018D3E4 0018A3E4  38 81 00 90 */	addi r4, r1, 0x90
/* 8018D3E8 0018A3E8  38 A1 00 30 */	addi r5, r1, 0x30
/* 8018D3EC 0018A3EC  48 10 AB 75 */	bl PSMTXConcat
/* 8018D3F0 0018A3F0  38 61 00 30 */	addi r3, r1, 0x30
/* 8018D3F4 0018A3F4  38 81 00 60 */	addi r4, r1, 0x60
/* 8018D3F8 0018A3F8  7C 65 1B 78 */	mr r5, r3
/* 8018D3FC 0018A3FC  48 10 AB 65 */	bl PSMTXConcat
/* 8018D400 0018A400  C0 02 CE F8 */	lfs f0, lbl_8041E278@sda21(r2)
/* 8018D404 0018A404  3B A0 00 01 */	li r29, 1
/* 8018D408 0018A408  3B DE 00 38 */	addi r30, r30, 0x38
/* 8018D40C 0018A40C  FF E0 00 50 */	fneg f31, f0
/* 8018D410 0018A410  48 00 01 78 */	b .L_8018D588
.L_8018D414:
/* 8018D414 0018A414  80 1E 00 20 */	lwz r0, 0x20(r30)
/* 8018D418 0018A418  2C 00 00 00 */	cmpwi r0, 0
/* 8018D41C 0018A41C  41 80 01 64 */	blt .L_8018D580
/* 8018D420 0018A420  C0 22 CE F4 */	lfs f1, lbl_8041E274@sda21(r2)
/* 8018D424 0018A424  38 61 00 90 */	addi r3, r1, 0x90
/* 8018D428 0018A428  C0 1E 00 24 */	lfs f0, 0x24(r30)
/* 8018D42C 0018A42C  38 80 00 7A */	li r4, 0x7a
/* 8018D430 0018A430  EC 21 00 32 */	fmuls f1, f1, f0
/* 8018D434 0018A434  48 10 AD B9 */	bl PSMTXRotRad
/* 8018D438 0018A438  C0 3E 00 34 */	lfs f1, 0x34(r30)
/* 8018D43C 0018A43C  38 61 00 60 */	addi r3, r1, 0x60
/* 8018D440 0018A440  FC 40 08 90 */	fmr f2, f1
/* 8018D444 0018A444  FC 60 08 90 */	fmr f3, f1
/* 8018D448 0018A448  48 10 B0 65 */	bl PSMTXScale
/* 8018D44C 0018A44C  C0 3E 00 04 */	lfs f1, 4(r30)
/* 8018D450 0018A450  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8018D454 0018A454  C0 5E 00 08 */	lfs f2, 8(r30)
/* 8018D458 0018A458  C0 62 CE FC */	lfs f3, lbl_8041E27C@sda21(r2)
/* 8018D45C 0018A45C  48 10 AF D1 */	bl PSMTXTrans
/* 8018D460 0018A460  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8018D464 0018A464  38 81 00 90 */	addi r4, r1, 0x90
/* 8018D468 0018A468  38 A1 00 F0 */	addi r5, r1, 0xf0
/* 8018D46C 0018A46C  48 10 AA F5 */	bl PSMTXConcat
/* 8018D470 0018A470  38 61 00 F0 */	addi r3, r1, 0xf0
/* 8018D474 0018A474  38 81 00 60 */	addi r4, r1, 0x60
/* 8018D478 0018A478  7C 65 1B 78 */	mr r5, r3
/* 8018D47C 0018A47C  48 10 AA E5 */	bl PSMTXConcat
/* 8018D480 0018A480  38 81 00 F0 */	addi r4, r1, 0xf0
/* 8018D484 0018A484  38 61 00 30 */	addi r3, r1, 0x30
/* 8018D488 0018A488  7C 85 23 78 */	mr r5, r4
/* 8018D48C 0018A48C  48 10 AA D5 */	bl PSMTXConcat
/* 8018D490 0018A490  38 81 00 F0 */	addi r4, r1, 0xf0
/* 8018D494 0018A494  38 7F 01 1C */	addi r3, r31, 0x11c
/* 8018D498 0018A498  7C 85 23 78 */	mr r5, r4
/* 8018D49C 0018A49C  48 10 AA C5 */	bl PSMTXConcat
/* 8018D4A0 0018A4A0  38 61 00 F0 */	addi r3, r1, 0xf0
/* 8018D4A4 0018A4A4  38 80 00 00 */	li r4, 0
/* 8018D4A8 0018A4A8  48 12 70 51 */	bl GXLoadPosMtxImm
/* 8018D4AC 0018A4AC  38 60 00 00 */	li r3, 0
/* 8018D4B0 0018A4B0  48 12 70 E9 */	bl GXSetCurrentMtx
/* 8018D4B4 0018A4B4  80 1E 00 30 */	lwz r0, 0x30(r30)
/* 8018D4B8 0018A4B8  38 81 00 0C */	addi r4, r1, 0xc
/* 8018D4BC 0018A4BC  80 A2 CE F0 */	lwz r5, lbl_8041E270@sda21(r2)
/* 8018D4C0 0018A4C0  38 60 00 04 */	li r3, 4
/* 8018D4C4 0018A4C4  7C 1C 01 D6 */	mullw r0, r28, r0
/* 8018D4C8 0018A4C8  90 A1 00 08 */	stw r5, 8(r1)
/* 8018D4CC 0018A4CC  7C 00 46 70 */	srawi r0, r0, 8
/* 8018D4D0 0018A4D0  98 01 00 0B */	stb r0, 0xb(r1)
/* 8018D4D4 0018A4D4  80 01 00 08 */	lwz r0, 8(r1)
/* 8018D4D8 0018A4D8  90 01 00 0C */	stw r0, 0xc(r1)
/* 8018D4DC 0018A4DC  48 12 3B 75 */	bl GXSetChanMatColor
/* 8018D4E0 0018A4E0  38 60 00 80 */	li r3, 0x80
/* 8018D4E4 0018A4E4  38 80 00 00 */	li r4, 0
/* 8018D4E8 0018A4E8  38 A0 00 04 */	li r5, 4
/* 8018D4EC 0018A4EC  48 12 27 7D */	bl GXBegin
/* 8018D4F0 0018A4F0  C0 02 CF 00 */	lfs f0, lbl_8041E280@sda21(r2)
/* 8018D4F4 0018A4F4  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8018D4F8 0018A4F8  C0 22 CF 04 */	lfs f1, lbl_8041E284@sda21(r2)
/* 8018D4FC 0018A4FC  EC 5F 00 32 */	fmuls f2, f31, f0
/* 8018D500 0018A500  D0 43 80 00 */	stfs f2, 0xCC008000@l(r3)
/* 8018D504 0018A504  D0 23 80 00 */	stfs f1, -0x8000(r3)
/* 8018D508 0018A508  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D50C 0018A50C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D510 0018A510  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D514 0018A514  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D518 0018A518  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D51C 0018A51C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D520 0018A520  D0 23 80 00 */	stfs f1, -0x8000(r3)
/* 8018D524 0018A524  D0 23 80 00 */	stfs f1, -0x8000(r3)
/* 8018D528 0018A528  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D52C 0018A52C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D530 0018A530  C0 02 CF 08 */	lfs f0, lbl_8041E288@sda21(r2)
/* 8018D534 0018A534  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D538 0018A538  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D53C 0018A53C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D540 0018A540  D0 23 80 00 */	stfs f1, -0x8000(r3)
/* 8018D544 0018A544  D0 43 80 00 */	stfs f2, -0x8000(r3)
/* 8018D548 0018A548  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D54C 0018A54C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D550 0018A550  C0 02 CF 08 */	lfs f0, lbl_8041E288@sda21(r2)
/* 8018D554 0018A554  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D558 0018A558  C0 02 CF 08 */	lfs f0, lbl_8041E288@sda21(r2)
/* 8018D55C 0018A55C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D560 0018A560  D0 43 80 00 */	stfs f2, -0x8000(r3)
/* 8018D564 0018A564  D0 43 80 00 */	stfs f2, -0x8000(r3)
/* 8018D568 0018A568  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D56C 0018A56C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D570 0018A570  C0 02 CE FC */	lfs f0, lbl_8041E27C@sda21(r2)
/* 8018D574 0018A574  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018D578 0018A578  C0 02 CF 08 */	lfs f0, lbl_8041E288@sda21(r2)
/* 8018D57C 0018A57C  D0 03 80 00 */	stfs f0, -0x8000(r3)
.L_8018D580:
/* 8018D580 0018A580  3B BD 00 01 */	addi r29, r29, 1
/* 8018D584 0018A584  3B DE 00 38 */	addi r30, r30, 0x38
.L_8018D588:
/* 8018D588 0018A588  80 1B 00 08 */	lwz r0, 8(r27)
/* 8018D58C 0018A58C  7C 1D 00 00 */	cmpw r29, r0
/* 8018D590 0018A590  41 80 FE 84 */	blt .L_8018D414
/* 8018D594 0018A594  E3 E1 01 48 */	psq_l f31, 328(r1), 0, qr0
/* 8018D598 0018A598  CB E1 01 40 */	lfd f31, 0x140(r1)
/* 8018D59C 0018A59C  BB 61 01 2C */	lmw r27, 0x12c(r1)
/* 8018D5A0 0018A5A0  80 01 01 54 */	lwz r0, 0x154(r1)
/* 8018D5A4 0018A5A4  7C 08 03 A6 */	mtlr r0
/* 8018D5A8 0018A5A8  38 21 01 50 */	addi r1, r1, 0x150
/* 8018D5AC 0018A5AC  4E 80 00 20 */	blr 
effSparkMain:
/* 8018D5B0 0018A5B0  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 8018D5B4 0018A5B4  7C 08 02 A6 */	mflr r0
/* 8018D5B8 0018A5B8  90 01 00 94 */	stw r0, 0x94(r1)
/* 8018D5BC 0018A5BC  DB E1 00 80 */	stfd f31, 0x80(r1)
/* 8018D5C0 0018A5C0  F3 E1 00 88 */	psq_st f31, 136(r1), 0, qr0
/* 8018D5C4 0018A5C4  DB C1 00 70 */	stfd f30, 0x70(r1)
/* 8018D5C8 0018A5C8  F3 C1 00 78 */	psq_st f30, 120(r1), 0, qr0
/* 8018D5CC 0018A5CC  DB A1 00 60 */	stfd f29, 0x60(r1)
/* 8018D5D0 0018A5D0  F3 A1 00 68 */	psq_st f29, 104(r1), 0, qr0
/* 8018D5D4 0018A5D4  DB 81 00 50 */	stfd f28, 0x50(r1)
/* 8018D5D8 0018A5D8  F3 81 00 58 */	psq_st f28, 88(r1), 0, qr0
/* 8018D5DC 0018A5DC  BF 01 00 30 */	stmw r24, 0x30(r1)
/* 8018D5E0 0018A5E0  3C 80 80 30 */	lis r4, lbl_802F8E20@ha
/* 8018D5E4 0018A5E4  83 83 00 0C */	lwz r28, 0xc(r3)
/* 8018D5E8 0018A5E8  38 A4 8E 20 */	addi r5, r4, lbl_802F8E20@l
/* 8018D5EC 0018A5EC  7C 78 1B 78 */	mr r24, r3
/* 8018D5F0 0018A5F0  80 85 00 00 */	lwz r4, 0(r5)
/* 8018D5F4 0018A5F4  80 65 00 04 */	lwz r3, 4(r5)
/* 8018D5F8 0018A5F8  80 05 00 08 */	lwz r0, 8(r5)
/* 8018D5FC 0018A5FC  90 81 00 08 */	stw r4, 8(r1)
/* 8018D600 0018A600  C0 1C 00 04 */	lfs f0, 4(r28)
/* 8018D604 0018A604  90 61 00 0C */	stw r3, 0xc(r1)
/* 8018D608 0018A608  C0 3C 00 08 */	lfs f1, 8(r28)
/* 8018D60C 0018A60C  D0 01 00 08 */	stfs f0, 8(r1)
/* 8018D610 0018A610  C0 1C 00 0C */	lfs f0, 0xc(r28)
/* 8018D614 0018A614  90 01 00 10 */	stw r0, 0x10(r1)
/* 8018D618 0018A618  80 81 00 08 */	lwz r4, 8(r1)
/* 8018D61C 0018A61C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 8018D620 0018A620  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8018D624 0018A624  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8018D628 0018A628  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8018D62C 0018A62C  90 81 00 14 */	stw r4, 0x14(r1)
/* 8018D630 0018A630  90 61 00 18 */	stw r3, 0x18(r1)
/* 8018D634 0018A634  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8018D638 0018A638  80 78 00 00 */	lwz r3, 0(r24)
/* 8018D63C 0018A63C  80 9C 00 30 */	lwz r4, 0x30(r28)
/* 8018D640 0018A640  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 8018D644 0018A644  83 5C 00 00 */	lwz r26, 0(r28)
/* 8018D648 0018A648  54 99 06 3E */	clrlwi r25, r4, 0x18
/* 8018D64C 0018A64C  41 82 00 14 */	beq .L_8018D660
/* 8018D650 0018A650  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 8018D654 0018A654  38 00 00 10 */	li r0, 0x10
/* 8018D658 0018A658  90 78 00 00 */	stw r3, 0(r24)
/* 8018D65C 0018A65C  90 1C 00 28 */	stw r0, 0x28(r28)
.L_8018D660:
/* 8018D660 0018A660  80 7C 00 28 */	lwz r3, 0x28(r28)
/* 8018D664 0018A664  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 8018D668 0018A668  40 80 00 0C */	bge .L_8018D674
/* 8018D66C 0018A66C  38 03 FF FF */	addi r0, r3, -1
/* 8018D670 0018A670  90 1C 00 28 */	stw r0, 0x28(r28)
.L_8018D674:
/* 8018D674 0018A674  80 1C 00 28 */	lwz r0, 0x28(r28)
/* 8018D678 0018A678  2C 00 00 00 */	cmpwi r0, 0
/* 8018D67C 0018A67C  40 80 00 10 */	bge .L_8018D68C
/* 8018D680 0018A680  7F 03 C3 78 */	mr r3, r24
/* 8018D684 0018A684  4B ED 05 01 */	bl effDelete
/* 8018D688 0018A688  48 00 02 64 */	b .L_8018D8EC
.L_8018D68C:
/* 8018D68C 0018A68C  2C 00 00 10 */	cmpwi r0, 0x10
/* 8018D690 0018A690  40 80 00 0C */	bge .L_8018D69C
/* 8018D694 0018A694  54 00 20 36 */	slwi r0, r0, 4
/* 8018D698 0018A698  90 1C 00 30 */	stw r0, 0x30(r28)
.L_8018D69C:
/* 8018D69C 0018A69C  80 7C 00 2C */	lwz r3, 0x2c(r28)
/* 8018D6A0 0018A6A0  2C 1A 00 00 */	cmpwi r26, 0
/* 8018D6A4 0018A6A4  38 03 00 01 */	addi r0, r3, 1
/* 8018D6A8 0018A6A8  90 1C 00 2C */	stw r0, 0x2c(r28)
/* 8018D6AC 0018A6AC  80 1C 00 2C */	lwz r0, 0x2c(r28)
/* 8018D6B0 0018A6B0  3B 9C 00 38 */	addi r28, r28, 0x38
/* 8018D6B4 0018A6B4  41 82 00 08 */	beq .L_8018D6BC
/* 8018D6B8 0018A6B8  48 00 00 10 */	b .L_8018D6C8
.L_8018D6BC:
/* 8018D6BC 0018A6BC  C3 E2 CF 0C */	lfs f31, lbl_8041E28C@sda21(r2)
/* 8018D6C0 0018A6C0  C3 C2 CF 10 */	lfs f30, lbl_8041E290@sda21(r2)
/* 8018D6C4 0018A6C4  48 00 00 0C */	b .L_8018D6D0
.L_8018D6C8:
/* 8018D6C8 0018A6C8  C3 E2 CF 10 */	lfs f31, lbl_8041E290@sda21(r2)
/* 8018D6CC 0018A6CC  FF C0 F8 90 */	fmr f30, f31
.L_8018D6D0:
/* 8018D6D0 0018A6D0  57 5F 10 3A */	slwi r31, r26, 2
/* 8018D6D4 0018A6D4  54 1D 07 FE */	clrlwi r29, r0, 0x1f
/* 8018D6D8 0018A6D8  3B 60 00 01 */	li r27, 1
/* 8018D6DC 0018A6DC  3B CD B3 E0 */	addi r30, r13, lbl_80412640@sda21
/* 8018D6E0 0018A6E0  48 00 01 D0 */	b .L_8018D8B0
.L_8018D6E4:
/* 8018D6E4 0018A6E4  80 7C 00 20 */	lwz r3, 0x20(r28)
/* 8018D6E8 0018A6E8  38 03 00 01 */	addi r0, r3, 1
/* 8018D6EC 0018A6EC  90 1C 00 20 */	stw r0, 0x20(r28)
/* 8018D6F0 0018A6F0  80 7C 00 20 */	lwz r3, 0x20(r28)
/* 8018D6F4 0018A6F4  7C 1E F8 2E */	lwzx r0, r30, r31
/* 8018D6F8 0018A6F8  7C 03 00 00 */	cmpw r3, r0
/* 8018D6FC 0018A6FC  41 80 00 0C */	blt .L_8018D708
/* 8018D700 0018A700  38 00 00 00 */	li r0, 0
/* 8018D704 0018A704  90 1C 00 20 */	stw r0, 0x20(r28)
.L_8018D708:
/* 8018D708 0018A708  80 1C 00 20 */	lwz r0, 0x20(r28)
/* 8018D70C 0018A70C  2C 00 00 00 */	cmpwi r0, 0
/* 8018D710 0018A710  41 80 01 98 */	blt .L_8018D8A8
/* 8018D714 0018A714  40 82 00 BC */	bne .L_8018D7D0
/* 8018D718 0018A718  3C 80 43 30 */	lis r4, 0x4330
/* 8018D71C 0018A71C  6F 60 80 00 */	xoris r0, r27, 0x8000
/* 8018D720 0018A720  80 78 00 08 */	lwz r3, 8(r24)
/* 8018D724 0018A724  3C A0 80 30 */	lis r5, lbl_802F8E30@ha
/* 8018D728 0018A728  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018D72C 0018A72C  38 03 FF FF */	addi r0, r3, -1
/* 8018D730 0018A730  C8 65 8E 30 */	lfd f3, lbl_802F8E30@l(r5)
/* 8018D734 0018A734  90 81 00 20 */	stw r4, 0x20(r1)
/* 8018D738 0018A738  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8018D73C 0018A73C  C0 82 CF 14 */	lfs f4, lbl_8041E294@sda21(r2)
/* 8018D740 0018A740  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 8018D744 0018A744  90 01 00 2C */	stw r0, 0x2c(r1)
/* 8018D748 0018A748  EC 40 18 28 */	fsubs f2, f0, f3
/* 8018D74C 0018A74C  C0 02 CF 18 */	lfs f0, lbl_8041E298@sda21(r2)
/* 8018D750 0018A750  90 81 00 28 */	stw r4, 0x28(r1)
/* 8018D754 0018A754  C8 21 00 28 */	lfd f1, 0x28(r1)
/* 8018D758 0018A758  EC 44 00 B2 */	fmuls f2, f4, f2
/* 8018D75C 0018A75C  EC 21 18 28 */	fsubs f1, f1, f3
/* 8018D760 0018A760  EF 82 08 24 */	fdivs f28, f2, f1
/* 8018D764 0018A764  EC 00 07 32 */	fmuls f0, f0, f28
/* 8018D768 0018A768  EF A0 20 24 */	fdivs f29, f0, f4
/* 8018D76C 0018A76C  FC 20 E8 90 */	fmr f1, f29
/* 8018D770 0018A770  48 0D EC 89 */	bl sin
/* 8018D774 0018A774  FC 40 08 18 */	frsp f2, f1
/* 8018D778 0018A778  C0 02 CE F8 */	lfs f0, lbl_8041E278@sda21(r2)
/* 8018D77C 0018A77C  FC 20 E8 90 */	fmr f1, f29
/* 8018D780 0018A780  EC 00 00 B2 */	fmuls f0, f0, f2
/* 8018D784 0018A784  D0 1C 00 04 */	stfs f0, 4(r28)
/* 8018D788 0018A788  48 0D E7 09 */	bl cos
/* 8018D78C 0018A78C  FC 80 08 18 */	frsp f4, f1
/* 8018D790 0018A790  C0 62 CE F8 */	lfs f3, lbl_8041E278@sda21(r2)
/* 8018D794 0018A794  C0 42 CE FC */	lfs f2, lbl_8041E27C@sda21(r2)
/* 8018D798 0018A798  FC 20 E0 50 */	fneg f1, f28
/* 8018D79C 0018A79C  C0 02 CF 08 */	lfs f0, lbl_8041E288@sda21(r2)
/* 8018D7A0 0018A7A0  EC 63 01 32 */	fmuls f3, f3, f4
/* 8018D7A4 0018A7A4  D0 7C 00 08 */	stfs f3, 8(r28)
/* 8018D7A8 0018A7A8  C0 7C 00 04 */	lfs f3, 4(r28)
/* 8018D7AC 0018A7AC  EC 63 07 F2 */	fmuls f3, f3, f31
/* 8018D7B0 0018A7B0  D0 7C 00 10 */	stfs f3, 0x10(r28)
/* 8018D7B4 0018A7B4  C0 7C 00 08 */	lfs f3, 8(r28)
/* 8018D7B8 0018A7B8  EC 63 07 F2 */	fmuls f3, f3, f31
/* 8018D7BC 0018A7BC  D0 7C 00 14 */	stfs f3, 0x14(r28)
/* 8018D7C0 0018A7C0  D0 5C 00 18 */	stfs f2, 0x18(r28)
/* 8018D7C4 0018A7C4  D0 5C 00 1C */	stfs f2, 0x1c(r28)
/* 8018D7C8 0018A7C8  D0 3C 00 24 */	stfs f1, 0x24(r28)
/* 8018D7CC 0018A7CC  D0 1C 00 34 */	stfs f0, 0x34(r28)
.L_8018D7D0:
/* 8018D7D0 0018A7D0  2C 1A 00 00 */	cmpwi r26, 0
/* 8018D7D4 0018A7D4  41 82 00 08 */	beq .L_8018D7DC
/* 8018D7D8 0018A7D8  48 00 00 30 */	b .L_8018D808
.L_8018D7DC:
/* 8018D7DC 0018A7DC  80 1C 00 20 */	lwz r0, 0x20(r28)
/* 8018D7E0 0018A7E0  38 8D B3 E8 */	addi r4, r13, lbl_80412648@sda21
/* 8018D7E4 0018A7E4  3C 60 80 39 */	lis r3, lbl_80394C70@ha
/* 8018D7E8 0018A7E8  7C 04 00 AE */	lbzx r0, r4, r0
/* 8018D7EC 0018A7EC  38 63 4C 70 */	addi r3, r3, lbl_80394C70@l
/* 8018D7F0 0018A7F0  90 1C 00 30 */	stw r0, 0x30(r28)
/* 8018D7F4 0018A7F4  80 1C 00 20 */	lwz r0, 0x20(r28)
/* 8018D7F8 0018A7F8  54 00 10 3A */	slwi r0, r0, 2
/* 8018D7FC 0018A7FC  7C 03 04 2E */	lfsx f0, r3, r0
/* 8018D800 0018A800  D0 1C 00 34 */	stfs f0, 0x34(r28)
/* 8018D804 0018A804  48 00 00 28 */	b .L_8018D82C
.L_8018D808:
/* 8018D808 0018A808  80 1C 00 20 */	lwz r0, 0x20(r28)
/* 8018D80C 0018A80C  38 8D B4 30 */	addi r4, r13, lbl_80412690@sda21
/* 8018D810 0018A810  38 6D B4 00 */	addi r3, r13, lbl_80412660@sda21
/* 8018D814 0018A814  7C 04 00 AE */	lbzx r0, r4, r0
/* 8018D818 0018A818  90 1C 00 30 */	stw r0, 0x30(r28)
/* 8018D81C 0018A81C  80 1C 00 20 */	lwz r0, 0x20(r28)
/* 8018D820 0018A820  54 00 10 3A */	slwi r0, r0, 2
/* 8018D824 0018A824  7C 03 04 2E */	lfsx f0, r3, r0
/* 8018D828 0018A828  D0 1C 00 34 */	stfs f0, 0x34(r28)
.L_8018D82C:
/* 8018D82C 0018A82C  57 60 07 FE */	clrlwi r0, r27, 0x1f
/* 8018D830 0018A830  7C 1D 00 00 */	cmpw r29, r0
/* 8018D834 0018A834  40 82 00 28 */	bne .L_8018D85C
/* 8018D838 0018A838  C0 3C 00 04 */	lfs f1, 4(r28)
/* 8018D83C 0018A83C  C0 1C 00 10 */	lfs f0, 0x10(r28)
/* 8018D840 0018A840  EC 01 00 2A */	fadds f0, f1, f0
/* 8018D844 0018A844  D0 1C 00 04 */	stfs f0, 4(r28)
/* 8018D848 0018A848  C0 3C 00 08 */	lfs f1, 8(r28)
/* 8018D84C 0018A84C  C0 1C 00 14 */	lfs f0, 0x14(r28)
/* 8018D850 0018A850  EC 01 00 2A */	fadds f0, f1, f0
/* 8018D854 0018A854  D0 1C 00 08 */	stfs f0, 8(r28)
/* 8018D858 0018A858  48 00 00 28 */	b .L_8018D880
.L_8018D85C:
/* 8018D85C 0018A85C  C0 42 CF 10 */	lfs f2, lbl_8041E290@sda21(r2)
/* 8018D860 0018A860  C0 3C 00 10 */	lfs f1, 0x10(r28)
/* 8018D864 0018A864  C0 1C 00 04 */	lfs f0, 4(r28)
/* 8018D868 0018A868  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 8018D86C 0018A86C  D0 1C 00 04 */	stfs f0, 4(r28)
/* 8018D870 0018A870  C0 3C 00 14 */	lfs f1, 0x14(r28)
/* 8018D874 0018A874  C0 1C 00 08 */	lfs f0, 8(r28)
/* 8018D878 0018A878  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 8018D87C 0018A87C  D0 1C 00 08 */	stfs f0, 8(r28)
.L_8018D880:
/* 8018D880 0018A880  C0 1C 00 18 */	lfs f0, 0x18(r28)
/* 8018D884 0018A884  C0 3C 00 10 */	lfs f1, 0x10(r28)
/* 8018D888 0018A888  EC 00 08 28 */	fsubs f0, f0, f1
/* 8018D88C 0018A88C  EC 1E 08 3A */	fmadds f0, f30, f0, f1
/* 8018D890 0018A890  D0 1C 00 10 */	stfs f0, 0x10(r28)
/* 8018D894 0018A894  C0 1C 00 1C */	lfs f0, 0x1c(r28)
/* 8018D898 0018A898  C0 3C 00 14 */	lfs f1, 0x14(r28)
/* 8018D89C 0018A89C  EC 00 08 28 */	fsubs f0, f0, f1
/* 8018D8A0 0018A8A0  EC 1E 08 3A */	fmadds f0, f30, f0, f1
/* 8018D8A4 0018A8A4  D0 1C 00 14 */	stfs f0, 0x14(r28)
.L_8018D8A8:
/* 8018D8A8 0018A8A8  3B 7B 00 01 */	addi r27, r27, 1
/* 8018D8AC 0018A8AC  3B 9C 00 38 */	addi r28, r28, 0x38
.L_8018D8B0:
/* 8018D8B0 0018A8B0  80 18 00 08 */	lwz r0, 8(r24)
/* 8018D8B4 0018A8B4  7C 1B 00 00 */	cmpw r27, r0
/* 8018D8B8 0018A8B8  41 80 FE 2C */	blt .L_8018D6E4
/* 8018D8BC 0018A8BC  28 19 00 FF */	cmplwi r25, 0xff
/* 8018D8C0 0018A8C0  3B 20 00 01 */	li r25, 1
/* 8018D8C4 0018A8C4  41 82 00 08 */	beq .L_8018D8CC
/* 8018D8C8 0018A8C8  3B 20 00 02 */	li r25, 2
.L_8018D8CC:
/* 8018D8CC 0018A8CC  38 61 00 14 */	addi r3, r1, 0x14
/* 8018D8D0 0018A8D0  4B E8 2D F1 */	bl dispCalcZ
/* 8018D8D4 0018A8D4  3C 60 80 19 */	lis r3, effSparkDisp@ha
/* 8018D8D8 0018A8D8  7F 24 CB 78 */	mr r4, r25
/* 8018D8DC 0018A8DC  38 A3 D2 84 */	addi r5, r3, effSparkDisp@l
/* 8018D8E0 0018A8E0  7F 06 C3 78 */	mr r6, r24
/* 8018D8E4 0018A8E4  38 60 00 04 */	li r3, 4
/* 8018D8E8 0018A8E8  4B E8 31 31 */	bl dispEntry
.L_8018D8EC:
/* 8018D8EC 0018A8EC  E3 E1 00 88 */	psq_l f31, 136(r1), 0, qr0
/* 8018D8F0 0018A8F0  CB E1 00 80 */	lfd f31, 0x80(r1)
/* 8018D8F4 0018A8F4  E3 C1 00 78 */	psq_l f30, 120(r1), 0, qr0
/* 8018D8F8 0018A8F8  CB C1 00 70 */	lfd f30, 0x70(r1)
/* 8018D8FC 0018A8FC  E3 A1 00 68 */	psq_l f29, 104(r1), 0, qr0
/* 8018D900 0018A900  CB A1 00 60 */	lfd f29, 0x60(r1)
/* 8018D904 0018A904  E3 81 00 58 */	psq_l f28, 88(r1), 0, qr0
/* 8018D908 0018A908  CB 81 00 50 */	lfd f28, 0x50(r1)
/* 8018D90C 0018A90C  BB 01 00 30 */	lmw r24, 0x30(r1)
/* 8018D910 0018A910  80 01 00 94 */	lwz r0, 0x94(r1)
/* 8018D914 0018A914  7C 08 03 A6 */	mtlr r0
/* 8018D918 0018A918  38 21 00 90 */	addi r1, r1, 0x90
/* 8018D91C 0018A91C  4E 80 00 20 */	blr 

.global effSparkEntry
effSparkEntry:
/* 8018D920 0018A920  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8018D924 0018A924  7C 08 02 A6 */	mflr r0
/* 8018D928 0018A928  90 01 00 54 */	stw r0, 0x54(r1)
/* 8018D92C 0018A92C  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8018D930 0018A930  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8018D934 0018A934  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 8018D938 0018A938  F3 C1 00 38 */	psq_st f30, 56(r1), 0, qr0
/* 8018D93C 0018A93C  DB A1 00 20 */	stfd f29, 0x20(r1)
/* 8018D940 0018A940  F3 A1 00 28 */	psq_st f29, 40(r1), 0, qr0
/* 8018D944 0018A944  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8018D948 0018A948  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8018D94C 0018A94C  FF A0 08 90 */	fmr f29, f1
/* 8018D950 0018A950  7C 7E 1B 78 */	mr r30, r3
/* 8018D954 0018A954  FF C0 10 90 */	fmr f30, f2
/* 8018D958 0018A958  FF E0 18 90 */	fmr f31, f3
/* 8018D95C 0018A95C  4B ED 04 61 */	bl effEntry
/* 8018D960 0018A960  38 82 CF 1C */	addi r4, r2, lbl_8041E29C@sda21
/* 8018D964 0018A964  7C 7F 1B 78 */	mr r31, r3
/* 8018D968 0018A968  90 83 00 14 */	stw r4, 0x14(r3)
/* 8018D96C 0018A96C  38 00 00 06 */	li r0, 6
/* 8018D970 0018A970  38 60 00 03 */	li r3, 3
/* 8018D974 0018A974  38 80 01 50 */	li r4, 0x150
/* 8018D978 0018A978  90 1F 00 08 */	stw r0, 8(r31)
/* 8018D97C 0018A97C  4B EA 21 11 */	bl __memAlloc
/* 8018D980 0018A980  3C 80 80 19 */	lis r4, effSparkMain@ha
/* 8018D984 0018A984  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8018D988 0018A988  38 04 D5 B0 */	addi r0, r4, effSparkMain@l
/* 8018D98C 0018A98C  3C C0 43 30 */	lis r6, 0x4330
/* 8018D990 0018A990  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8018D994 0018A994  3C 80 80 30 */	lis r4, lbl_802F8E30@ha
/* 8018D998 0018A998  39 80 00 01 */	li r12, 1
/* 8018D99C 0018A99C  39 60 00 00 */	li r11, 0
/* 8018D9A0 0018A9A0  80 1F 00 00 */	lwz r0, 0(r31)
/* 8018D9A4 0018A9A4  55 85 07 FE */	clrlwi r5, r12, 0x1f
/* 8018D9A8 0018A9A8  38 E4 8E 30 */	addi r7, r4, lbl_802F8E30@l
/* 8018D9AC 0018A9AC  39 40 03 E8 */	li r10, 0x3e8
/* 8018D9B0 0018A9B0  60 00 00 02 */	ori r0, r0, 2
/* 8018D9B4 0018A9B4  39 20 00 FF */	li r9, 0xff
/* 8018D9B8 0018A9B8  90 1F 00 00 */	stw r0, 0(r31)
/* 8018D9BC 0018A9BC  57 C0 10 3A */	slwi r0, r30, 2
/* 8018D9C0 0018A9C0  C0 22 CF 24 */	lfs f1, lbl_8041E2A4@sda21(r2)
/* 8018D9C4 0018A9C4  39 0D B3 E0 */	addi r8, r13, lbl_80412640@sda21
/* 8018D9C8 0018A9C8  93 C3 00 00 */	stw r30, 0(r3)
/* 8018D9CC 0018A9CC  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8018D9D0 0018A9D0  39 80 00 02 */	li r12, 2
/* 8018D9D4 0018A9D4  C8 A7 00 00 */	lfd f5, 0(r7)
/* 8018D9D8 0018A9D8  91 63 00 2C */	stw r11, 0x2c(r3)
/* 8018D9DC 0018A9DC  55 85 07 FE */	clrlwi r5, r12, 0x1f
/* 8018D9E0 0018A9E0  C0 02 CF 00 */	lfs f0, lbl_8041E280@sda21(r2)
/* 8018D9E4 0018A9E4  39 80 00 03 */	li r12, 3
/* 8018D9E8 0018A9E8  91 43 00 28 */	stw r10, 0x28(r3)
/* 8018D9EC 0018A9EC  C0 42 CF 28 */	lfs f2, lbl_8041E2A8@sda21(r2)
/* 8018D9F0 0018A9F0  91 23 00 30 */	stw r9, 0x30(r3)
/* 8018D9F4 0018A9F4  D3 A3 00 04 */	stfs f29, 4(r3)
/* 8018D9F8 0018A9F8  D3 C3 00 08 */	stfs f30, 8(r3)
/* 8018D9FC 0018A9FC  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 8018DA00 0018AA00  D0 23 00 34 */	stfs f1, 0x34(r3)
/* 8018DA04 0018AA04  7C 08 00 2E */	lwzx r0, r8, r0
/* 8018DA08 0018AA08  90 C1 00 08 */	stw r6, 8(r1)
/* 8018DA0C 0018AA0C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8018DA10 0018AA10  90 01 00 0C */	stw r0, 0xc(r1)
/* 8018DA14 0018AA14  C8 21 00 08 */	lfd f1, 8(r1)
/* 8018DA18 0018AA18  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018DA1C 0018AA1C  EC 21 28 28 */	fsubs f1, f1, f5
/* 8018DA20 0018AA20  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8018DA24 0018AA24  55 85 07 FE */	clrlwi r5, r12, 0x1f
/* 8018DA28 0018AA28  90 C1 00 08 */	stw r6, 8(r1)
/* 8018DA2C 0018AA2C  39 80 00 04 */	li r12, 4
/* 8018DA30 0018AA30  EC C1 00 32 */	fmuls f6, f1, f0
/* 8018DA34 0018AA34  C8 81 00 08 */	lfd f4, 8(r1)
/* 8018DA38 0018AA38  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018DA3C 0018AA3C  EC 64 28 28 */	fsubs f3, f4, f5
/* 8018DA40 0018AA40  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8018DA44 0018AA44  55 85 07 FE */	clrlwi r5, r12, 0x1f
/* 8018DA48 0018AA48  90 C1 00 08 */	stw r6, 8(r1)
/* 8018DA4C 0018AA4C  39 80 00 05 */	li r12, 5
/* 8018DA50 0018AA50  EC 26 10 FC */	fnmsubs f1, f6, f3, f2
/* 8018DA54 0018AA54  C8 81 00 08 */	lfd f4, 8(r1)
/* 8018DA58 0018AA58  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018DA5C 0018AA5C  FC 00 08 1E */	fctiwz f0, f1
/* 8018DA60 0018AA60  EC 64 28 28 */	fsubs f3, f4, f5
/* 8018DA64 0018AA64  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8018DA68 0018AA68  90 C1 00 08 */	stw r6, 8(r1)
/* 8018DA6C 0018AA6C  55 85 07 FE */	clrlwi r5, r12, 0x1f
/* 8018DA70 0018AA70  C8 81 00 08 */	lfd f4, 8(r1)
/* 8018DA74 0018AA74  EC 26 10 FC */	fnmsubs f1, f6, f3, f2
/* 8018DA78 0018AA78  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8018DA7C 0018AA7C  EC 64 28 28 */	fsubs f3, f4, f5
/* 8018DA80 0018AA80  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018DA84 0018AA84  FC 00 08 1E */	fctiwz f0, f1
/* 8018DA88 0018AA88  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8018DA8C 0018AA8C  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 8018DA90 0018AA90  90 C1 00 08 */	stw r6, 8(r1)
/* 8018DA94 0018AA94  EC 26 10 FC */	fnmsubs f1, f6, f3, f2
/* 8018DA98 0018AA98  C8 81 00 08 */	lfd f4, 8(r1)
/* 8018DA9C 0018AA9C  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8018DAA0 0018AAA0  EC 64 28 28 */	fsubs f3, f4, f5
/* 8018DAA4 0018AAA4  FC 00 08 1E */	fctiwz f0, f1
/* 8018DAA8 0018AAA8  90 03 00 58 */	stw r0, 0x58(r3)
/* 8018DAAC 0018AAAC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8018DAB0 0018AAB0  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018DAB4 0018AAB4  EC 26 10 FC */	fnmsubs f1, f6, f3, f2
/* 8018DAB8 0018AAB8  90 C1 00 08 */	stw r6, 8(r1)
/* 8018DABC 0018AABC  C8 81 00 08 */	lfd f4, 8(r1)
/* 8018DAC0 0018AAC0  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8018DAC4 0018AAC4  FC 00 08 1E */	fctiwz f0, f1
/* 8018DAC8 0018AAC8  EC 64 28 28 */	fsubs f3, f4, f5
/* 8018DACC 0018AACC  90 03 00 90 */	stw r0, 0x90(r3)
/* 8018DAD0 0018AAD0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8018DAD4 0018AAD4  EC 26 10 FC */	fnmsubs f1, f6, f3, f2
/* 8018DAD8 0018AAD8  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8018DADC 0018AADC  90 03 00 C8 */	stw r0, 0xc8(r3)
/* 8018DAE0 0018AAE0  FC 00 08 1E */	fctiwz f0, f1
/* 8018DAE4 0018AAE4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8018DAE8 0018AAE8  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 8018DAEC 0018AAEC  90 03 01 00 */	stw r0, 0x100(r3)
/* 8018DAF0 0018AAF0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8018DAF4 0018AAF4  90 03 01 38 */	stw r0, 0x138(r3)
/* 8018DAF8 0018AAF8  7F E3 FB 78 */	mr r3, r31
/* 8018DAFC 0018AAFC  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8018DB00 0018AB00  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8018DB04 0018AB04  E3 C1 00 38 */	psq_l f30, 56(r1), 0, qr0
/* 8018DB08 0018AB08  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 8018DB0C 0018AB0C  E3 A1 00 28 */	psq_l f29, 40(r1), 0, qr0
/* 8018DB10 0018AB10  CB A1 00 20 */	lfd f29, 0x20(r1)
/* 8018DB14 0018AB14  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8018DB18 0018AB18  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8018DB1C 0018AB1C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8018DB20 0018AB20  7C 08 03 A6 */	mtlr r0
/* 8018DB24 0018AB24  38 21 00 50 */	addi r1, r1, 0x50
/* 8018DB28 0018AB28  4E 80 00 20 */	blr 
