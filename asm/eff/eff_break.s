.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effBreakDisp
effBreakDisp:
/* 8021B378 00218378  94 21 FE D0 */	stwu r1, -0x130(r1)
/* 8021B37C 0021837C  7C 08 02 A6 */	mflr r0
/* 8021B380 00218380  90 01 01 34 */	stw r0, 0x134(r1)
/* 8021B384 00218384  DB E1 01 20 */	stfd f31, 0x120(r1)
/* 8021B388 00218388  F3 E1 01 28 */	psq_st f31, 296(r1), 0, qr0
/* 8021B38C 0021838C  DB C1 01 10 */	stfd f30, 0x110(r1)
/* 8021B390 00218390  F3 C1 01 18 */	psq_st f30, 280(r1), 0, qr0
/* 8021B394 00218394  DB A1 01 00 */	stfd f29, 0x100(r1)
/* 8021B398 00218398  F3 A1 01 08 */	psq_st f29, 264(r1), 0, qr0
/* 8021B39C 0021839C  BF 61 00 EC */	stmw r27, 0xec(r1)
/* 8021B3A0 002183A0  7C 9B 23 78 */	mr r27, r4
/* 8021B3A4 002183A4  7C 7C 1B 78 */	mr r28, r3
/* 8021B3A8 002183A8  83 A4 00 0C */	lwz r29, 0xc(r4)
/* 8021B3AC 002183AC  4B DF 3D A5 */	bl camGetPtr
/* 8021B3B0 002183B0  C3 FD 00 20 */	lfs f31, 0x20(r29)
/* 8021B3B4 002183B4  7C 7F 1B 78 */	mr r31, r3
/* 8021B3B8 002183B8  C0 3D 00 04 */	lfs f1, 4(r29)
/* 8021B3BC 002183BC  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B3C0 002183C0  C0 5D 00 08 */	lfs f2, 8(r29)
/* 8021B3C4 002183C4  C0 7D 00 0C */	lfs f3, 0xc(r29)
/* 8021B3C8 002183C8  48 07 D0 65 */	bl PSMTXTrans
/* 8021B3CC 002183CC  7F 83 E3 78 */	mr r3, r28
/* 8021B3D0 002183D0  4B DF 3D 81 */	bl camGetPtr
/* 8021B3D4 002183D4  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8021B3D8 002183D8  38 61 00 88 */	addi r3, r1, 0x88
/* 8021B3DC 002183DC  C0 02 FD 28 */	lfs f0, lbl_804210A8-_SDA2_BASE_(r2)
/* 8021B3E0 002183E0  38 80 00 79 */	li r4, 0x79
/* 8021B3E4 002183E4  FC 20 08 50 */	fneg f1, f1
/* 8021B3E8 002183E8  EC 20 00 72 */	fmuls f1, f0, f1
/* 8021B3EC 002183EC  48 07 CE 01 */	bl PSMTXRotRad
/* 8021B3F0 002183F0  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B3F4 002183F4  38 81 00 88 */	addi r4, r1, 0x88
/* 8021B3F8 002183F8  7C 65 1B 78 */	mr r5, r3
/* 8021B3FC 002183FC  48 07 CB 65 */	bl PSMTXConcat
/* 8021B400 00218400  38 7F 01 1C */	addi r3, r31, 0x11c
/* 8021B404 00218404  38 81 00 B8 */	addi r4, r1, 0xb8
/* 8021B408 00218408  38 A1 00 28 */	addi r5, r1, 0x28
/* 8021B40C 0021840C  48 07 CB 55 */	bl PSMTXConcat
/* 8021B410 00218410  38 60 00 00 */	li r3, 0
/* 8021B414 00218414  48 09 5D 25 */	bl GXSetNumChans
/* 8021B418 00218418  38 60 00 01 */	li r3, 1
/* 8021B41C 0021841C  48 09 3E 65 */	bl GXSetNumTexGens
/* 8021B420 00218420  38 60 00 00 */	li r3, 0
/* 8021B424 00218424  38 80 00 01 */	li r4, 1
/* 8021B428 00218428  38 A0 00 04 */	li r5, 4
/* 8021B42C 0021842C  38 C0 00 1E */	li r6, 0x1e
/* 8021B430 00218430  38 E0 00 00 */	li r7, 0
/* 8021B434 00218434  39 00 00 7D */	li r8, 0x7d
/* 8021B438 00218438  48 09 3B C9 */	bl GXSetTexCoordGen2
/* 8021B43C 0021843C  38 60 00 01 */	li r3, 1
/* 8021B440 00218440  48 09 7D 89 */	bl GXSetNumTevStages
/* 8021B444 00218444  38 60 00 00 */	li r3, 0
/* 8021B448 00218448  38 80 00 00 */	li r4, 0
/* 8021B44C 0021844C  38 A0 00 00 */	li r5, 0
/* 8021B450 00218450  38 C0 00 FF */	li r6, 0xff
/* 8021B454 00218454  48 09 7B D9 */	bl GXSetTevOrder
/* 8021B458 00218458  38 60 00 00 */	li r3, 0
/* 8021B45C 0021845C  38 80 00 00 */	li r4, 0
/* 8021B460 00218460  38 A0 00 00 */	li r5, 0
/* 8021B464 00218464  38 C0 00 00 */	li r6, 0
/* 8021B468 00218468  38 E0 00 01 */	li r7, 1
/* 8021B46C 0021846C  39 00 00 00 */	li r8, 0
/* 8021B470 00218470  48 09 77 75 */	bl GXSetTevColorOp
/* 8021B474 00218474  38 60 00 00 */	li r3, 0
/* 8021B478 00218478  38 80 00 00 */	li r4, 0
/* 8021B47C 0021847C  38 A0 00 00 */	li r5, 0
/* 8021B480 00218480  38 C0 00 00 */	li r6, 0
/* 8021B484 00218484  38 E0 00 01 */	li r7, 1
/* 8021B488 00218488  39 00 00 00 */	li r8, 0
/* 8021B48C 0021848C  48 09 77 C1 */	bl GXSetTevAlphaOp
/* 8021B490 00218490  38 60 00 00 */	li r3, 0
/* 8021B494 00218494  38 80 00 03 */	li r4, 3
/* 8021B498 00218498  48 09 76 39 */	bl GXSetTevOp
/* 8021B49C 0021849C  38 60 00 00 */	li r3, 0
/* 8021B4A0 002184A0  48 09 49 E9 */	bl GXSetCullMode
/* 8021B4A4 002184A4  48 09 32 79 */	bl GXClearVtxDesc
/* 8021B4A8 002184A8  38 60 00 09 */	li r3, 9
/* 8021B4AC 002184AC  38 80 00 01 */	li r4, 1
/* 8021B4B0 002184B0  48 09 29 55 */	bl GXSetVtxDesc
/* 8021B4B4 002184B4  38 60 00 0D */	li r3, 0xd
/* 8021B4B8 002184B8  38 80 00 01 */	li r4, 1
/* 8021B4BC 002184BC  48 09 29 49 */	bl GXSetVtxDesc
/* 8021B4C0 002184C0  38 60 00 00 */	li r3, 0
/* 8021B4C4 002184C4  38 80 00 09 */	li r4, 9
/* 8021B4C8 002184C8  38 A0 00 01 */	li r5, 1
/* 8021B4CC 002184CC  38 C0 00 04 */	li r6, 4
/* 8021B4D0 002184D0  38 E0 00 00 */	li r7, 0
/* 8021B4D4 002184D4  48 09 32 81 */	bl GXSetVtxAttrFmt
/* 8021B4D8 002184D8  38 60 00 00 */	li r3, 0
/* 8021B4DC 002184DC  38 80 00 0D */	li r4, 0xd
/* 8021B4E0 002184E0  38 A0 00 01 */	li r5, 1
/* 8021B4E4 002184E4  38 C0 00 04 */	li r6, 4
/* 8021B4E8 002184E8  38 E0 00 00 */	li r7, 0
/* 8021B4EC 002184EC  48 09 32 69 */	bl GXSetVtxAttrFmt
/* 8021B4F0 002184F0  C0 22 FD 2C */	lfs f1, lbl_804210AC-_SDA2_BASE_(r2)
/* 8021B4F4 002184F4  3B 80 00 01 */	li r28, 1
/* 8021B4F8 002184F8  C0 02 FD 34 */	lfs f0, lbl_804210B4-_SDA2_BASE_(r2)
/* 8021B4FC 002184FC  3B C0 00 04 */	li r30, 4
/* 8021B500 00218500  FC 20 08 50 */	fneg f1, f1
/* 8021B504 00218504  C3 C2 FD 38 */	lfs f30, lbl_804210B8-_SDA2_BASE_(r2)
/* 8021B508 00218508  3F E0 CC 01 */	lis r31, 0xcc01
/* 8021B50C 0021850C  3B BD 00 24 */	addi r29, r29, 0x24
/* 8021B510 00218510  EF A1 00 32 */	fmuls f29, f1, f0
/* 8021B514 00218514  48 00 01 58 */	b lbl_8021B66C
lbl_8021B518:
/* 8021B518 00218518  80 AD 90 B0 */	lwz r5, gp-_SDA_BASE_(r13)
/* 8021B51C 0021851C  38 6D EB 58 */	addi r3, r13, lbl_80415DB8-_SDA_BASE_
/* 8021B520 00218520  38 1E FF FC */	addi r0, r30, -4
/* 8021B524 00218524  38 81 00 08 */	addi r4, r1, 8
/* 8021B528 00218528  80 C5 01 6C */	lwz r6, 0x16c(r5)
/* 8021B52C 0021852C  7C A6 00 D0 */	neg r5, r6
/* 8021B530 00218530  7C A5 33 78 */	or r5, r5, r6
/* 8021B534 00218534  54 A5 1F 7A */	rlwinm r5, r5, 3, 0x1d, 0x1d
/* 8021B538 00218538  7C 63 28 2E */	lwzx r3, r3, r5
/* 8021B53C 0021853C  7C 63 00 2E */	lwzx r3, r3, r0
/* 8021B540 00218540  4B E4 29 6D */	bl effGetTexObj
/* 8021B544 00218544  38 61 00 08 */	addi r3, r1, 8
/* 8021B548 00218548  38 80 00 00 */	li r4, 0
/* 8021B54C 0021854C  48 09 65 31 */	bl GXLoadTexObj
/* 8021B550 00218550  C0 22 FD 30 */	lfs f1, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B554 00218554  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B558 00218558  C0 5D 00 14 */	lfs f2, 0x14(r29)
/* 8021B55C 0021855C  FC 60 08 90 */	fmr f3, f1
/* 8021B560 00218560  48 07 CE CD */	bl PSMTXTrans
/* 8021B564 00218564  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B568 00218568  38 80 00 1E */	li r4, 0x1e
/* 8021B56C 0021856C  38 A0 00 01 */	li r5, 1
/* 8021B570 00218570  48 09 90 5D */	bl GXLoadTexMtxImm
/* 8021B574 00218574  C0 3D 00 04 */	lfs f1, 4(r29)
/* 8021B578 00218578  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B57C 0021857C  C0 5D 00 08 */	lfs f2, 8(r29)
/* 8021B580 00218580  C0 7D 00 0C */	lfs f3, 0xc(r29)
/* 8021B584 00218584  48 07 CE A9 */	bl PSMTXTrans
/* 8021B588 00218588  FC 20 F8 90 */	fmr f1, f31
/* 8021B58C 0021858C  38 61 00 58 */	addi r3, r1, 0x58
/* 8021B590 00218590  FC 40 F8 90 */	fmr f2, f31
/* 8021B594 00218594  FC 60 F8 90 */	fmr f3, f31
/* 8021B598 00218598  48 07 CF 15 */	bl PSMTXScale
/* 8021B59C 0021859C  38 81 00 B8 */	addi r4, r1, 0xb8
/* 8021B5A0 002185A0  38 61 00 28 */	addi r3, r1, 0x28
/* 8021B5A4 002185A4  7C 85 23 78 */	mr r5, r4
/* 8021B5A8 002185A8  48 07 C9 B9 */	bl PSMTXConcat
/* 8021B5AC 002185AC  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B5B0 002185B0  38 81 00 58 */	addi r4, r1, 0x58
/* 8021B5B4 002185B4  7C 65 1B 78 */	mr r5, r3
/* 8021B5B8 002185B8  48 07 C9 A9 */	bl PSMTXConcat
/* 8021B5BC 002185BC  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8021B5C0 002185C0  38 80 00 00 */	li r4, 0
/* 8021B5C4 002185C4  48 09 8F 35 */	bl GXLoadPosMtxImm
/* 8021B5C8 002185C8  38 60 00 00 */	li r3, 0
/* 8021B5CC 002185CC  48 09 8F CD */	bl GXSetCurrentMtx
/* 8021B5D0 002185D0  38 60 00 80 */	li r3, 0x80
/* 8021B5D4 002185D4  38 80 00 00 */	li r4, 0
/* 8021B5D8 002185D8  38 A0 00 04 */	li r5, 4
/* 8021B5DC 002185DC  48 09 46 8D */	bl GXBegin
/* 8021B5E0 002185E0  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8021B5E4 002185E4  3B DE 00 04 */	addi r30, r30, 4
/* 8021B5E8 002185E8  3B 9C 00 01 */	addi r28, r28, 1
/* 8021B5EC 002185EC  3B BD 00 24 */	addi r29, r29, 0x24
/* 8021B5F0 002185F0  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8021B5F4 002185F4  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B5F8 002185F8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B5FC 002185FC  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B600 00218600  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B604 00218604  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B608 00218608  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B60C 0021860C  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8021B610 00218610  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8021B614 00218614  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B618 00218618  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B61C 0021861C  C0 02 FD 3C */	lfs f0, lbl_804210BC-_SDA2_BASE_(r2)
/* 8021B620 00218620  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B624 00218624  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B628 00218628  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B62C 0021862C  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8021B630 00218630  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8021B634 00218634  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B638 00218638  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B63C 0021863C  C0 02 FD 3C */	lfs f0, lbl_804210BC-_SDA2_BASE_(r2)
/* 8021B640 00218640  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B644 00218644  C0 02 FD 3C */	lfs f0, lbl_804210BC-_SDA2_BASE_(r2)
/* 8021B648 00218648  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B64C 0021864C  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8021B650 00218650  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8021B654 00218654  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B658 00218658  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B65C 0021865C  C0 02 FD 30 */	lfs f0, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B660 00218660  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8021B664 00218664  C0 02 FD 3C */	lfs f0, lbl_804210BC-_SDA2_BASE_(r2)
/* 8021B668 00218668  D0 1F 80 00 */	stfs f0, -0x8000(r31)
lbl_8021B66C:
/* 8021B66C 0021866C  80 1B 00 08 */	lwz r0, 8(r27)
/* 8021B670 00218670  7C 1C 00 00 */	cmpw r28, r0
/* 8021B674 00218674  41 80 FE A4 */	blt lbl_8021B518
/* 8021B678 00218678  E3 E1 01 28 */	psq_l f31, 296(r1), 0, qr0
/* 8021B67C 0021867C  CB E1 01 20 */	lfd f31, 0x120(r1)
/* 8021B680 00218680  E3 C1 01 18 */	psq_l f30, 280(r1), 0, qr0
/* 8021B684 00218684  CB C1 01 10 */	lfd f30, 0x110(r1)
/* 8021B688 00218688  E3 A1 01 08 */	psq_l f29, 264(r1), 0, qr0
/* 8021B68C 0021868C  CB A1 01 00 */	lfd f29, 0x100(r1)
/* 8021B690 00218690  BB 61 00 EC */	lmw r27, 0xec(r1)
/* 8021B694 00218694  80 01 01 34 */	lwz r0, 0x134(r1)
/* 8021B698 00218698  7C 08 03 A6 */	mtlr r0
/* 8021B69C 0021869C  38 21 01 30 */	addi r1, r1, 0x130
/* 8021B6A0 002186A0  4E 80 00 20 */	blr 
effBreakMain:
/* 8021B6A4 002186A4  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8021B6A8 002186A8  7C 08 02 A6 */	mflr r0
/* 8021B6AC 002186AC  90 01 00 54 */	stw r0, 0x54(r1)
/* 8021B6B0 002186B0  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8021B6B4 002186B4  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8021B6B8 002186B8  BF 61 00 2C */	stmw r27, 0x2c(r1)
/* 8021B6BC 002186BC  3C 80 80 30 */	lis r4, lbl_802FE610@ha
/* 8021B6C0 002186C0  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 8021B6C4 002186C4  38 A4 E6 10 */	addi r5, r4, lbl_802FE610@l
/* 8021B6C8 002186C8  7C 7B 1B 78 */	mr r27, r3
/* 8021B6CC 002186CC  80 85 00 00 */	lwz r4, 0(r5)
/* 8021B6D0 002186D0  3B 80 00 00 */	li r28, 0
/* 8021B6D4 002186D4  80 65 00 04 */	lwz r3, 4(r5)
/* 8021B6D8 002186D8  3B A0 00 01 */	li r29, 1
/* 8021B6DC 002186DC  80 05 00 08 */	lwz r0, 8(r5)
/* 8021B6E0 002186E0  90 81 00 08 */	stw r4, 8(r1)
/* 8021B6E4 002186E4  C0 3F 00 04 */	lfs f1, 4(r31)
/* 8021B6E8 002186E8  90 61 00 0C */	stw r3, 0xc(r1)
/* 8021B6EC 002186EC  C0 1F 00 08 */	lfs f0, 8(r31)
/* 8021B6F0 002186F0  D0 21 00 08 */	stfs f1, 8(r1)
/* 8021B6F4 002186F4  C0 3F 00 0C */	lfs f1, 0xc(r31)
/* 8021B6F8 002186F8  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8021B6FC 002186FC  80 81 00 08 */	lwz r4, 8(r1)
/* 8021B700 00218700  90 01 00 10 */	stw r0, 0x10(r1)
/* 8021B704 00218704  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8021B708 00218708  D0 21 00 10 */	stfs f1, 0x10(r1)
/* 8021B70C 0021870C  C0 02 FD 40 */	lfs f0, lbl_804210C0-_SDA2_BASE_(r2)
/* 8021B710 00218710  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8021B714 00218714  90 81 00 14 */	stw r4, 0x14(r1)
/* 8021B718 00218718  90 61 00 18 */	stw r3, 0x18(r1)
/* 8021B71C 0021871C  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8021B720 00218720  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 8021B724 00218724  83 DF 00 10 */	lwz r30, 0x10(r31)
/* 8021B728 00218728  3B FF 00 24 */	addi r31, r31, 0x24
/* 8021B72C 0021872C  EF E0 00 72 */	fmuls f31, f0, f1
/* 8021B730 00218730  48 00 01 C0 */	b lbl_8021B8F0
lbl_8021B734:
/* 8021B734 00218734  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8021B738 00218738  2C 03 00 03 */	cmpwi r3, 3
/* 8021B73C 0021873C  41 82 01 28 */	beq lbl_8021B864
/* 8021B740 00218740  40 80 00 1C */	bge lbl_8021B75C
/* 8021B744 00218744  2C 03 00 01 */	cmpwi r3, 1
/* 8021B748 00218748  41 82 00 54 */	beq lbl_8021B79C
/* 8021B74C 0021874C  40 80 00 E8 */	bge lbl_8021B834
/* 8021B750 00218750  2C 03 00 00 */	cmpwi r3, 0
/* 8021B754 00218754  40 80 00 18 */	bge lbl_8021B76C
/* 8021B758 00218758  48 00 01 90 */	b lbl_8021B8E8
lbl_8021B75C:
/* 8021B75C 0021875C  2C 03 00 05 */	cmpwi r3, 5
/* 8021B760 00218760  41 82 01 84 */	beq lbl_8021B8E4
/* 8021B764 00218764  40 80 01 84 */	bge lbl_8021B8E8
/* 8021B768 00218768  48 00 01 2C */	b lbl_8021B894
lbl_8021B76C:
/* 8021B76C 0021876C  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8021B770 00218770  38 03 FF FF */	addi r0, r3, -1
/* 8021B774 00218774  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B778 00218778  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 8021B77C 0021877C  2C 00 00 00 */	cmpwi r0, 0
/* 8021B780 00218780  41 81 01 68 */	bgt lbl_8021B8E8
/* 8021B784 00218784  38 00 00 00 */	li r0, 0
/* 8021B788 00218788  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B78C 0021878C  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8021B790 00218790  38 03 00 01 */	addi r0, r3, 1
/* 8021B794 00218794  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8021B798 00218798  48 00 01 50 */	b lbl_8021B8E8
lbl_8021B79C:
/* 8021B79C 0021879C  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 8021B7A0 002187A0  28 00 00 15 */	cmplwi r0, 0x15
/* 8021B7A4 002187A4  40 80 00 70 */	bge lbl_8021B814
/* 8021B7A8 002187A8  3C 60 80 3B */	lis r3, lbl_803AE0F8@ha
/* 8021B7AC 002187AC  54 00 10 3A */	slwi r0, r0, 2
/* 8021B7B0 002187B0  38 63 E0 F8 */	addi r3, r3, lbl_803AE0F8@l
/* 8021B7B4 002187B4  C0 22 FD 30 */	lfs f1, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B7B8 002187B8  7C 03 04 2E */	lfsx f0, r3, r0
/* 8021B7BC 002187BC  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 8021B7C0 002187C0  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8021B7C4 002187C4  38 03 00 01 */	addi r0, r3, 1
/* 8021B7C8 002187C8  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B7CC 002187CC  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 8021B7D0 002187D0  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8021B7D4 002187D4  40 82 01 14 */	bne lbl_8021B8E8
/* 8021B7D8 002187D8  C0 21 00 14 */	lfs f1, 0x14(r1)
/* 8021B7DC 002187DC  FC 80 F8 90 */	fmr f4, f31
/* 8021B7E0 002187E0  C0 1F 00 04 */	lfs f0, 4(r31)
/* 8021B7E4 002187E4  38 60 00 01 */	li r3, 1
/* 8021B7E8 002187E8  C0 A1 00 18 */	lfs f5, 0x18(r1)
/* 8021B7EC 002187EC  C0 5F 00 08 */	lfs f2, 8(r31)
/* 8021B7F0 002187F0  EC 21 00 2A */	fadds f1, f1, f0
/* 8021B7F4 002187F4  C0 61 00 1C */	lfs f3, 0x1c(r1)
/* 8021B7F8 002187F8  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 8021B7FC 002187FC  EC 45 10 2A */	fadds f2, f5, f2
/* 8021B800 00218800  EC 63 00 2A */	fadds f3, f3, f0
/* 8021B804 00218804  4B FC C1 6D */	bl effStardustN64Entry
/* 8021B808 00218808  38 80 00 08 */	li r4, 8
/* 8021B80C 0021880C  4B FC B9 21 */	bl effStardustN64SetDrawCam
/* 8021B810 00218810  48 00 00 D8 */	b lbl_8021B8E8
lbl_8021B814:
/* 8021B814 00218814  38 04 FF FF */	addi r0, r4, -1
/* 8021B818 00218818  7C 1D 00 50 */	subf r0, r29, r0
/* 8021B81C 0021881C  1C 00 00 15 */	mulli r0, r0, 0x15
/* 8021B820 00218820  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B824 00218824  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8021B828 00218828  38 03 00 01 */	addi r0, r3, 1
/* 8021B82C 0021882C  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8021B830 00218830  48 00 00 B8 */	b lbl_8021B8E8
lbl_8021B834:
/* 8021B834 00218834  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8021B838 00218838  38 03 FF FF */	addi r0, r3, -1
/* 8021B83C 0021883C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B840 00218840  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 8021B844 00218844  2C 00 00 00 */	cmpwi r0, 0
/* 8021B848 00218848  41 81 00 A0 */	bgt lbl_8021B8E8
/* 8021B84C 0021884C  38 00 00 00 */	li r0, 0
/* 8021B850 00218850  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B854 00218854  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8021B858 00218858  38 03 00 01 */	addi r0, r3, 1
/* 8021B85C 0021885C  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8021B860 00218860  48 00 00 88 */	b lbl_8021B8E8
lbl_8021B864:
/* 8021B864 00218864  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8021B868 00218868  38 03 00 01 */	addi r0, r3, 1
/* 8021B86C 0021886C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B870 00218870  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 8021B874 00218874  7C 00 F0 00 */	cmpw r0, r30
/* 8021B878 00218878  40 81 00 70 */	ble lbl_8021B8E8
/* 8021B87C 0021887C  38 00 00 00 */	li r0, 0
/* 8021B880 00218880  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B884 00218884  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8021B888 00218888  38 03 00 01 */	addi r0, r3, 1
/* 8021B88C 0021888C  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8021B890 00218890  48 00 00 58 */	b lbl_8021B8E8
lbl_8021B894:
/* 8021B894 00218894  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 8021B898 00218898  28 04 00 15 */	cmplwi r4, 0x15
/* 8021B89C 0021889C  40 80 00 3C */	bge lbl_8021B8D8
/* 8021B8A0 002188A0  3C 60 80 3B */	lis r3, lbl_803AE14C@ha
/* 8021B8A4 002188A4  54 84 10 3A */	slwi r4, r4, 2
/* 8021B8A8 002188A8  38 63 E1 4C */	addi r3, r3, lbl_803AE14C@l
/* 8021B8AC 002188AC  57 A0 07 FF */	clrlwi. r0, r29, 0x1f
/* 8021B8B0 002188B0  7C 03 24 2E */	lfsx f0, r3, r4
/* 8021B8B4 002188B4  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 8021B8B8 002188B8  40 82 00 10 */	bne lbl_8021B8C8
/* 8021B8BC 002188BC  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 8021B8C0 002188C0  FC 00 00 50 */	fneg f0, f0
/* 8021B8C4 002188C4  D0 1F 00 14 */	stfs f0, 0x14(r31)
lbl_8021B8C8:
/* 8021B8C8 002188C8  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8021B8CC 002188CC  38 03 00 01 */	addi r0, r3, 1
/* 8021B8D0 002188D0  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B8D4 002188D4  48 00 00 14 */	b lbl_8021B8E8
lbl_8021B8D8:
/* 8021B8D8 002188D8  38 03 00 01 */	addi r0, r3, 1
/* 8021B8DC 002188DC  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8021B8E0 002188E0  48 00 00 08 */	b lbl_8021B8E8
lbl_8021B8E4:
/* 8021B8E4 002188E4  3B 9C 00 01 */	addi r28, r28, 1
lbl_8021B8E8:
/* 8021B8E8 002188E8  3B BD 00 01 */	addi r29, r29, 1
/* 8021B8EC 002188EC  3B FF 00 24 */	addi r31, r31, 0x24
lbl_8021B8F0:
/* 8021B8F0 002188F0  80 9B 00 08 */	lwz r4, 8(r27)
/* 8021B8F4 002188F4  7C 1D 20 00 */	cmpw r29, r4
/* 8021B8F8 002188F8  41 80 FE 3C */	blt lbl_8021B734
/* 8021B8FC 002188FC  38 04 FF FF */	addi r0, r4, -1
/* 8021B900 00218900  7C 1C 00 00 */	cmpw r28, r0
/* 8021B904 00218904  41 80 00 10 */	blt lbl_8021B914
/* 8021B908 00218908  7F 63 DB 78 */	mr r3, r27
/* 8021B90C 0021890C  4B E4 22 79 */	bl effDelete
/* 8021B910 00218910  48 00 00 24 */	b lbl_8021B934
lbl_8021B914:
/* 8021B914 00218914  38 61 00 14 */	addi r3, r1, 0x14
/* 8021B918 00218918  4B DF 4D A9 */	bl dispCalcZ
/* 8021B91C 0021891C  3C 60 80 22 */	lis r3, effBreakDisp@ha
/* 8021B920 00218920  7F 66 DB 78 */	mr r6, r27
/* 8021B924 00218924  38 A3 B3 78 */	addi r5, r3, effBreakDisp@l
/* 8021B928 00218928  38 80 00 02 */	li r4, 2
/* 8021B92C 0021892C  38 60 00 08 */	li r3, 8
/* 8021B930 00218930  4B DF 50 E9 */	bl dispEntry
lbl_8021B934:
/* 8021B934 00218934  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8021B938 00218938  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8021B93C 0021893C  BB 61 00 2C */	lmw r27, 0x2c(r1)
/* 8021B940 00218940  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8021B944 00218944  7C 08 03 A6 */	mtlr r0
/* 8021B948 00218948  38 21 00 50 */	addi r1, r1, 0x50
/* 8021B94C 0021894C  4E 80 00 20 */	blr 

.global effBreakEntry
effBreakEntry:
/* 8021B950 00218950  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8021B954 00218954  7C 08 02 A6 */	mflr r0
/* 8021B958 00218958  90 01 00 54 */	stw r0, 0x54(r1)
/* 8021B95C 0021895C  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8021B960 00218960  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8021B964 00218964  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 8021B968 00218968  F3 C1 00 38 */	psq_st f30, 56(r1), 0, qr0
/* 8021B96C 0021896C  DB A1 00 20 */	stfd f29, 0x20(r1)
/* 8021B970 00218970  F3 A1 00 28 */	psq_st f29, 40(r1), 0, qr0
/* 8021B974 00218974  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8021B978 00218978  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8021B97C 0021897C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8021B980 00218980  FF A0 08 90 */	fmr f29, f1
/* 8021B984 00218984  7C 7D 1B 78 */	mr r29, r3
/* 8021B988 00218988  FF C0 10 90 */	fmr f30, f2
/* 8021B98C 0021898C  7C 9E 23 78 */	mr r30, r4
/* 8021B990 00218990  FF E0 18 90 */	fmr f31, f3
/* 8021B994 00218994  4B E4 24 29 */	bl effEntry
/* 8021B998 00218998  80 8D 90 B0 */	lwz r4, gp-_SDA_BASE_(r13)
/* 8021B99C 0021899C  7C 7F 1B 78 */	mr r31, r3
/* 8021B9A0 002189A0  38 A0 00 07 */	li r5, 7
/* 8021B9A4 002189A4  80 04 01 6C */	lwz r0, 0x16c(r4)
/* 8021B9A8 002189A8  28 00 00 00 */	cmplwi r0, 0
/* 8021B9AC 002189AC  41 82 00 08 */	beq lbl_8021B9B4
/* 8021B9B0 002189B0  38 A0 00 07 */	li r5, 7
lbl_8021B9B4:
/* 8021B9B4 002189B4  38 02 FD 44 */	addi r0, r2, lbl_804210C4-_SDA2_BASE_
/* 8021B9B8 002189B8  38 60 00 03 */	li r3, 3
/* 8021B9BC 002189BC  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B9C0 002189C0  1C 85 00 24 */	mulli r4, r5, 0x24
/* 8021B9C4 002189C4  90 BF 00 08 */	stw r5, 8(r31)
/* 8021B9C8 002189C8  4B E1 40 C5 */	bl __memAlloc
/* 8021B9CC 002189CC  3C 80 80 22 */	lis r4, effBreakMain@ha
/* 8021B9D0 002189D0  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8021B9D4 002189D4  38 04 B6 A4 */	addi r0, r4, effBreakMain@l
/* 8021B9D8 002189D8  C0 82 FD 4C */	lfs f4, lbl_804210CC-_SDA2_BASE_(r2)
/* 8021B9DC 002189DC  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B9E0 002189E0  3C 80 80 30 */	lis r4, lbl_802FE620@ha
/* 8021B9E4 002189E4  C8 64 E6 20 */	lfd f3, lbl_802FE620@l(r4)
/* 8021B9E8 002189E8  39 03 00 24 */	addi r8, r3, 0x24
/* 8021B9EC 002189EC  93 A3 00 00 */	stw r29, 0(r3)
/* 8021B9F0 002189F0  39 20 00 01 */	li r9, 1
/* 8021B9F4 002189F4  C0 22 FD 30 */	lfs f1, lbl_804210B0-_SDA2_BASE_(r2)
/* 8021B9F8 002189F8  3C 80 43 30 */	lis r4, 0x4330
/* 8021B9FC 002189FC  D3 A3 00 04 */	stfs f29, 4(r3)
/* 8021BA00 00218A00  C0 02 FD 50 */	lfs f0, lbl_804210D0-_SDA2_BASE_(r2)
/* 8021BA04 00218A04  D3 C3 00 08 */	stfs f30, 8(r3)
/* 8021BA08 00218A08  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 8021BA0C 00218A0C  93 C3 00 10 */	stw r30, 0x10(r3)
/* 8021BA10 00218A10  D0 83 00 20 */	stfs f4, 0x20(r3)
/* 8021BA14 00218A14  48 00 00 70 */	b lbl_8021BA84
lbl_8021BA18:
/* 8021BA18 00218A18  38 03 FF FE */	addi r0, r3, -2
/* 8021BA1C 00218A1C  38 C9 FF FF */	addi r6, r9, -1
/* 8021BA20 00218A20  1C A0 00 24 */	mulli r5, r0, 0x24
/* 8021BA24 00218A24  90 81 00 08 */	stw r4, 8(r1)
/* 8021BA28 00218A28  38 60 00 00 */	li r3, 0
/* 8021BA2C 00218A2C  39 29 00 01 */	addi r9, r9, 1
/* 8021BA30 00218A30  38 E5 00 18 */	addi r7, r5, 0x18
/* 8021BA34 00218A34  54 E0 0F FE */	srwi r0, r7, 0x1f
/* 8021BA38 00218A38  7C 00 3A 14 */	add r0, r0, r7
/* 8021BA3C 00218A3C  1C A6 00 24 */	mulli r5, r6, 0x24
/* 8021BA40 00218A40  7C 07 0E 70 */	srawi r7, r0, 1
/* 8021BA44 00218A44  38 05 00 12 */	addi r0, r5, 0x12
/* 8021BA48 00218A48  7C 07 00 50 */	subf r0, r7, r0
/* 8021BA4C 00218A4C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8021BA50 00218A50  90 01 00 0C */	stw r0, 0xc(r1)
/* 8021BA54 00218A54  1C 06 00 15 */	mulli r0, r6, 0x15
/* 8021BA58 00218A58  C8 41 00 08 */	lfd f2, 8(r1)
/* 8021BA5C 00218A5C  EC 42 18 28 */	fsubs f2, f2, f3
/* 8021BA60 00218A60  EC 44 00 B2 */	fmuls f2, f4, f2
/* 8021BA64 00218A64  D0 48 00 04 */	stfs f2, 4(r8)
/* 8021BA68 00218A68  D0 28 00 08 */	stfs f1, 8(r8)
/* 8021BA6C 00218A6C  D0 28 00 0C */	stfs f1, 0xc(r8)
/* 8021BA70 00218A70  D0 08 00 14 */	stfs f0, 0x14(r8)
/* 8021BA74 00218A74  90 68 00 18 */	stw r3, 0x18(r8)
/* 8021BA78 00218A78  90 08 00 10 */	stw r0, 0x10(r8)
/* 8021BA7C 00218A7C  90 68 00 1C */	stw r3, 0x1c(r8)
/* 8021BA80 00218A80  39 08 00 24 */	addi r8, r8, 0x24
lbl_8021BA84:
/* 8021BA84 00218A84  80 7F 00 08 */	lwz r3, 8(r31)
/* 8021BA88 00218A88  7C 09 18 00 */	cmpw r9, r3
/* 8021BA8C 00218A8C  41 80 FF 8C */	blt lbl_8021BA18
/* 8021BA90 00218A90  7F E3 FB 78 */	mr r3, r31
/* 8021BA94 00218A94  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8021BA98 00218A98  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8021BA9C 00218A9C  E3 C1 00 38 */	psq_l f30, 56(r1), 0, qr0
/* 8021BAA0 00218AA0  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 8021BAA4 00218AA4  E3 A1 00 28 */	psq_l f29, 40(r1), 0, qr0
/* 8021BAA8 00218AA8  CB A1 00 20 */	lfd f29, 0x20(r1)
/* 8021BAAC 00218AAC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8021BAB0 00218AB0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8021BAB4 00218AB4  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8021BAB8 00218AB8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8021BABC 00218ABC  7C 08 03 A6 */	mtlr r0
/* 8021BAC0 00218AC0  38 21 00 50 */	addi r1, r1, 0x50
/* 8021BAC4 00218AC4  4E 80 00 20 */	blr 
