.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effLasMonDisp
effLasMonDisp:
/* 80252B38 0024FB38  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 80252B3C 0024FB3C  7C 08 02 A6 */	mflr r0
/* 80252B40 0024FB40  90 01 00 84 */	stw r0, 0x84(r1)
/* 80252B44 0024FB44  93 E1 00 7C */	stw r31, 0x7c(r1)
/* 80252B48 0024FB48  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 80252B4C 0024FB4C  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 80252B50 0024FB50  2C 00 FF FF */	cmpwi r0, -1
/* 80252B54 0024FB54  41 82 00 BC */	beq .L_80252C10
/* 80252B58 0024FB58  C0 3F 00 04 */	lfs f1, 4(r31)
/* 80252B5C 0024FB5C  38 61 00 40 */	addi r3, r1, 0x40
/* 80252B60 0024FB60  C0 5F 00 08 */	lfs f2, 8(r31)
/* 80252B64 0024FB64  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 80252B68 0024FB68  48 04 58 C5 */	bl PSMTXTrans
/* 80252B6C 0024FB6C  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80252B70 0024FB70  38 61 00 10 */	addi r3, r1, 0x10
/* 80252B74 0024FB74  FC 40 08 90 */	fmr f2, f1
/* 80252B78 0024FB78  FC 60 08 90 */	fmr f3, f1
/* 80252B7C 0024FB7C  48 04 59 31 */	bl PSMTXScale
/* 80252B80 0024FB80  38 61 00 40 */	addi r3, r1, 0x40
/* 80252B84 0024FB84  38 81 00 10 */	addi r4, r1, 0x10
/* 80252B88 0024FB88  7C 65 1B 78 */	mr r5, r3
/* 80252B8C 0024FB8C  48 04 53 D5 */	bl PSMTXConcat
/* 80252B90 0024FB90  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252B94 0024FB94  38 80 00 40 */	li r4, 0x40
/* 80252B98 0024FB98  4B DE D4 FD */	bl animPoseSetMaterialFlagOn
/* 80252B9C 0024FB9C  80 62 10 88 */	lwz r3, lbl_80422408@sda21(r2)
/* 80252BA0 0024FBA0  38 81 00 0C */	addi r4, r1, 0xc
/* 80252BA4 0024FBA4  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 80252BA8 0024FBA8  90 61 00 08 */	stw r3, 8(r1)
/* 80252BAC 0024FBAC  98 01 00 0B */	stb r0, 0xb(r1)
/* 80252BB0 0024FBB0  80 01 00 08 */	lwz r0, 8(r1)
/* 80252BB4 0024FBB4  90 01 00 0C */	stw r0, 0xc(r1)
/* 80252BB8 0024FBB8  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252BBC 0024FBBC  4B DE D4 5D */	bl animPoseSetMaterialEvtColor
/* 80252BC0 0024FBC0  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252BC4 0024FBC4  4B DE BA CD */	bl animPoseMain
/* 80252BC8 0024FBC8  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252BCC 0024FBCC  38 81 00 40 */	addi r4, r1, 0x40
/* 80252BD0 0024FBD0  C0 22 10 8C */	lfs f1, lbl_8042240C@sda21(r2)
/* 80252BD4 0024FBD4  38 A0 00 01 */	li r5, 1
/* 80252BD8 0024FBD8  C0 42 10 90 */	lfs f2, lbl_80422410@sda21(r2)
/* 80252BDC 0024FBDC  4B DE 82 61 */	bl animPoseDrawMtx
/* 80252BE0 0024FBE0  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252BE4 0024FBE4  38 81 00 40 */	addi r4, r1, 0x40
/* 80252BE8 0024FBE8  C0 22 10 8C */	lfs f1, lbl_8042240C@sda21(r2)
/* 80252BEC 0024FBEC  38 A0 00 02 */	li r5, 2
/* 80252BF0 0024FBF0  C0 42 10 90 */	lfs f2, lbl_80422410@sda21(r2)
/* 80252BF4 0024FBF4  4B DE 82 49 */	bl animPoseDrawMtx
/* 80252BF8 0024FBF8  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252BFC 0024FBFC  38 81 00 40 */	addi r4, r1, 0x40
/* 80252C00 0024FC00  C0 22 10 8C */	lfs f1, lbl_8042240C@sda21(r2)
/* 80252C04 0024FC04  38 A0 00 03 */	li r5, 3
/* 80252C08 0024FC08  C0 42 10 90 */	lfs f2, lbl_80422410@sda21(r2)
/* 80252C0C 0024FC0C  4B DE 82 31 */	bl animPoseDrawMtx
.L_80252C10:
/* 80252C10 0024FC10  80 01 00 84 */	lwz r0, 0x84(r1)
/* 80252C14 0024FC14  83 E1 00 7C */	lwz r31, 0x7c(r1)
/* 80252C18 0024FC18  7C 08 03 A6 */	mtlr r0
/* 80252C1C 0024FC1C  38 21 00 80 */	addi r1, r1, 0x80
/* 80252C20 0024FC20  4E 80 00 20 */	blr 
effLasMonMain:
/* 80252C24 0024FC24  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80252C28 0024FC28  7C 08 02 A6 */	mflr r0
/* 80252C2C 0024FC2C  3C 80 80 30 */	lis r4, lbl_80301438@ha
/* 80252C30 0024FC30  90 01 00 34 */	stw r0, 0x34(r1)
/* 80252C34 0024FC34  38 A4 14 38 */	addi r5, r4, lbl_80301438@l
/* 80252C38 0024FC38  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80252C3C 0024FC3C  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80252C40 0024FC40  7C 7E 1B 78 */	mr r30, r3
/* 80252C44 0024FC44  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80252C48 0024FC48  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 80252C4C 0024FC4C  80 85 00 00 */	lwz r4, 0(r5)
/* 80252C50 0024FC50  80 65 00 04 */	lwz r3, 4(r5)
/* 80252C54 0024FC54  80 05 00 08 */	lwz r0, 8(r5)
/* 80252C58 0024FC58  90 81 00 08 */	stw r4, 8(r1)
/* 80252C5C 0024FC5C  C0 1F 00 04 */	lfs f0, 4(r31)
/* 80252C60 0024FC60  90 61 00 0C */	stw r3, 0xc(r1)
/* 80252C64 0024FC64  C0 3F 00 08 */	lfs f1, 8(r31)
/* 80252C68 0024FC68  D0 01 00 08 */	stfs f0, 8(r1)
/* 80252C6C 0024FC6C  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 80252C70 0024FC70  90 01 00 10 */	stw r0, 0x10(r1)
/* 80252C74 0024FC74  80 A1 00 08 */	lwz r5, 8(r1)
/* 80252C78 0024FC78  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 80252C7C 0024FC7C  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80252C80 0024FC80  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80252C84 0024FC84  80 61 00 0C */	lwz r3, 0xc(r1)
/* 80252C88 0024FC88  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80252C8C 0024FC8C  90 A1 00 14 */	stw r5, 0x14(r1)
/* 80252C90 0024FC90  90 61 00 18 */	stw r3, 0x18(r1)
/* 80252C94 0024FC94  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80252C98 0024FC98  80 7E 00 00 */	lwz r3, 0(r30)
/* 80252C9C 0024FC9C  80 A4 00 14 */	lwz r5, 0x14(r4)
/* 80252CA0 0024FCA0  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 80252CA4 0024FCA4  7C 85 00 D0 */	neg r4, r5
/* 80252CA8 0024FCA8  7C 84 2B 78 */	or r4, r4, r5
/* 80252CAC 0024FCAC  54 9D 0F FE */	srwi r29, r4, 0x1f
/* 80252CB0 0024FCB0  41 82 00 14 */	beq .L_80252CC4
/* 80252CB4 0024FCB4  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 80252CB8 0024FCB8  38 00 00 10 */	li r0, 0x10
/* 80252CBC 0024FCBC  90 7E 00 00 */	stw r3, 0(r30)
/* 80252CC0 0024FCC0  90 1F 00 20 */	stw r0, 0x20(r31)
.L_80252CC4:
/* 80252CC4 0024FCC4  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80252CC8 0024FCC8  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 80252CCC 0024FCCC  40 80 00 0C */	bge .L_80252CD8
/* 80252CD0 0024FCD0  38 03 FF FF */	addi r0, r3, -1
/* 80252CD4 0024FCD4  90 1F 00 20 */	stw r0, 0x20(r31)
.L_80252CD8:
/* 80252CD8 0024FCD8  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 80252CDC 0024FCDC  2C 00 00 10 */	cmpwi r0, 0x10
/* 80252CE0 0024FCE0  40 80 00 0C */	bge .L_80252CEC
/* 80252CE4 0024FCE4  54 00 20 36 */	slwi r0, r0, 4
/* 80252CE8 0024FCE8  90 1F 00 1C */	stw r0, 0x1c(r31)
.L_80252CEC:
/* 80252CEC 0024FCEC  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 80252CF0 0024FCF0  2C 00 00 00 */	cmpwi r0, 0
/* 80252CF4 0024FCF4  40 80 00 20 */	bge .L_80252D14
/* 80252CF8 0024FCF8  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252CFC 0024FCFC  2C 03 FF FF */	cmpwi r3, -1
/* 80252D00 0024FD00  41 82 00 08 */	beq .L_80252D08
/* 80252D04 0024FD04  4B DE 7F 31 */	bl animPoseRelease
.L_80252D08:
/* 80252D08 0024FD08  7F C3 F3 78 */	mr r3, r30
/* 80252D0C 0024FD0C  4B E0 AE 79 */	bl effDelete
/* 80252D10 0024FD10  48 00 00 C8 */	b .L_80252DD8
.L_80252D14:
/* 80252D14 0024FD14  3C 60 80 30 */	lis r3, lbl_80301444@ha
/* 80252D18 0024FD18  7F A4 EB 78 */	mr r4, r29
/* 80252D1C 0024FD1C  38 63 14 44 */	addi r3, r3, lbl_80301444@l
/* 80252D20 0024FD20  38 A0 00 00 */	li r5, 0
/* 80252D24 0024FD24  4B DE 69 4D */	bl animGroupBaseAsync
/* 80252D28 0024FD28  2C 03 00 00 */	cmpwi r3, 0
/* 80252D2C 0024FD2C  41 82 00 AC */	beq .L_80252DD8
/* 80252D30 0024FD30  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 80252D34 0024FD34  2C 00 FF FF */	cmpwi r0, -1
/* 80252D38 0024FD38  40 82 00 30 */	bne .L_80252D68
/* 80252D3C 0024FD3C  3C 60 80 30 */	lis r3, lbl_80301444@ha
/* 80252D40 0024FD40  7F A4 EB 78 */	mr r4, r29
/* 80252D44 0024FD44  38 63 14 44 */	addi r3, r3, lbl_80301444@l
/* 80252D48 0024FD48  4B DE E3 89 */	bl animPoseEntry
/* 80252D4C 0024FD4C  90 7F 00 14 */	stw r3, 0x14(r31)
/* 80252D50 0024FD50  38 82 10 94 */	addi r4, r2, lbl_80422414@sda21
/* 80252D54 0024FD54  38 A0 00 01 */	li r5, 1
/* 80252D58 0024FD58  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252D5C 0024FD5C  4B DE DD 79 */	bl animPoseSetAnim
/* 80252D60 0024FD60  38 00 00 00 */	li r0, 0
/* 80252D64 0024FD64  90 1F 00 18 */	stw r0, 0x18(r31)
.L_80252D68:
/* 80252D68 0024FD68  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 80252D6C 0024FD6C  2C 00 00 01 */	cmpwi r0, 1
/* 80252D70 0024FD70  41 82 00 48 */	beq .L_80252DB8
/* 80252D74 0024FD74  40 80 00 44 */	bge .L_80252DB8
/* 80252D78 0024FD78  2C 00 00 00 */	cmpwi r0, 0
/* 80252D7C 0024FD7C  40 80 00 08 */	bge .L_80252D84
/* 80252D80 0024FD80  48 00 00 38 */	b .L_80252DB8
.L_80252D84:
/* 80252D84 0024FD84  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252D88 0024FD88  4B DE D3 79 */	bl animPoseGetLoopTimes
/* 80252D8C 0024FD8C  C0 02 10 98 */	lfs f0, lbl_80422418@sda21(r2)
/* 80252D90 0024FD90  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80252D94 0024FD94  4C 41 13 82 */	cror 2, 1, 2
/* 80252D98 0024FD98  40 82 00 20 */	bne .L_80252DB8
/* 80252D9C 0024FD9C  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80252DA0 0024FDA0  38 82 10 9C */	addi r4, r2, lbl_8042241C@sda21
/* 80252DA4 0024FDA4  38 A0 00 01 */	li r5, 1
/* 80252DA8 0024FDA8  4B DE DD 2D */	bl animPoseSetAnim
/* 80252DAC 0024FDAC  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80252DB0 0024FDB0  38 03 00 01 */	addi r0, r3, 1
/* 80252DB4 0024FDB4  90 1F 00 18 */	stw r0, 0x18(r31)
.L_80252DB8:
/* 80252DB8 0024FDB8  38 61 00 14 */	addi r3, r1, 0x14
/* 80252DBC 0024FDBC  4B DB D9 05 */	bl dispCalcZ
/* 80252DC0 0024FDC0  3C 60 80 25 */	lis r3, effLasMonDisp@ha
/* 80252DC4 0024FDC4  7F C6 F3 78 */	mr r6, r30
/* 80252DC8 0024FDC8  38 A3 2B 38 */	addi r5, r3, effLasMonDisp@l
/* 80252DCC 0024FDCC  38 80 00 02 */	li r4, 2
/* 80252DD0 0024FDD0  38 60 00 04 */	li r3, 4
/* 80252DD4 0024FDD4  4B DB DC 45 */	bl dispEntry
.L_80252DD8:
/* 80252DD8 0024FDD8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80252DDC 0024FDDC  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80252DE0 0024FDE0  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80252DE4 0024FDE4  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80252DE8 0024FDE8  7C 08 03 A6 */	mtlr r0
/* 80252DEC 0024FDEC  38 21 00 30 */	addi r1, r1, 0x30
/* 80252DF0 0024FDF0  4E 80 00 20 */	blr 

.global effLasMonEntry
effLasMonEntry:
/* 80252DF4 0024FDF4  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80252DF8 0024FDF8  7C 08 02 A6 */	mflr r0
/* 80252DFC 0024FDFC  90 01 00 44 */	stw r0, 0x44(r1)
/* 80252E00 0024FE00  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 80252E04 0024FE04  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 80252E08 0024FE08  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 80252E0C 0024FE0C  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 80252E10 0024FE10  DB A1 00 10 */	stfd f29, 0x10(r1)
/* 80252E14 0024FE14  F3 A1 00 18 */	psq_st f29, 24(r1), 0, qr0
/* 80252E18 0024FE18  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80252E1C 0024FE1C  93 C1 00 08 */	stw r30, 8(r1)
/* 80252E20 0024FE20  FF A0 08 90 */	fmr f29, f1
/* 80252E24 0024FE24  7C 7E 1B 78 */	mr r30, r3
/* 80252E28 0024FE28  FF C0 10 90 */	fmr f30, f2
/* 80252E2C 0024FE2C  FF E0 18 90 */	fmr f31, f3
/* 80252E30 0024FE30  4B E0 AF 8D */	bl effEntry
/* 80252E34 0024FE34  3C 80 80 30 */	lis r4, lbl_80301458@ha
/* 80252E38 0024FE38  7C 7F 1B 78 */	mr r31, r3
/* 80252E3C 0024FE3C  38 84 14 58 */	addi r4, r4, lbl_80301458@l
/* 80252E40 0024FE40  38 00 00 01 */	li r0, 1
/* 80252E44 0024FE44  90 9F 00 14 */	stw r4, 0x14(r31)
/* 80252E48 0024FE48  38 60 00 03 */	li r3, 3
/* 80252E4C 0024FE4C  90 1F 00 08 */	stw r0, 8(r31)
/* 80252E50 0024FE50  80 1F 00 08 */	lwz r0, 8(r31)
/* 80252E54 0024FE54  1C 80 00 24 */	mulli r4, r0, 0x24
/* 80252E58 0024FE58  4B DD CC 35 */	bl __memAlloc
/* 80252E5C 0024FE5C  3C 80 80 25 */	lis r4, effLasMonMain@ha
/* 80252E60 0024FE60  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80252E64 0024FE64  38 04 2C 24 */	addi r0, r4, effLasMonMain@l
/* 80252E68 0024FE68  C0 02 10 98 */	lfs f0, lbl_80422418@sda21(r2)
/* 80252E6C 0024FE6C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80252E70 0024FE70  38 C0 00 00 */	li r6, 0
/* 80252E74 0024FE74  38 A0 FF FF */	li r5, -1
/* 80252E78 0024FE78  38 80 00 FF */	li r4, 0xff
/* 80252E7C 0024FE7C  80 FF 00 00 */	lwz r7, 0(r31)
/* 80252E80 0024FE80  38 00 03 E8 */	li r0, 0x3e8
/* 80252E84 0024FE84  60 E7 00 02 */	ori r7, r7, 2
/* 80252E88 0024FE88  90 FF 00 00 */	stw r7, 0(r31)
/* 80252E8C 0024FE8C  93 C3 00 00 */	stw r30, 0(r3)
/* 80252E90 0024FE90  D3 A3 00 04 */	stfs f29, 4(r3)
/* 80252E94 0024FE94  D3 C3 00 08 */	stfs f30, 8(r3)
/* 80252E98 0024FE98  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 80252E9C 0024FE9C  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 80252EA0 0024FEA0  90 C3 00 18 */	stw r6, 0x18(r3)
/* 80252EA4 0024FEA4  90 A3 00 14 */	stw r5, 0x14(r3)
/* 80252EA8 0024FEA8  90 83 00 1C */	stw r4, 0x1c(r3)
/* 80252EAC 0024FEAC  90 03 00 20 */	stw r0, 0x20(r3)
/* 80252EB0 0024FEB0  7F E3 FB 78 */	mr r3, r31
/* 80252EB4 0024FEB4  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 80252EB8 0024FEB8  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 80252EBC 0024FEBC  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 80252EC0 0024FEC0  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 80252EC4 0024FEC4  E3 A1 00 18 */	psq_l f29, 24(r1), 0, qr0
/* 80252EC8 0024FEC8  CB A1 00 10 */	lfd f29, 0x10(r1)
/* 80252ECC 0024FECC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80252ED0 0024FED0  80 01 00 44 */	lwz r0, 0x44(r1)
/* 80252ED4 0024FED4  83 C1 00 08 */	lwz r30, 8(r1)
/* 80252ED8 0024FED8  7C 08 03 A6 */	mtlr r0
/* 80252EDC 0024FEDC  38 21 00 40 */	addi r1, r1, 0x40
/* 80252EE0 0024FEE0  4E 80 00 20 */	blr 
