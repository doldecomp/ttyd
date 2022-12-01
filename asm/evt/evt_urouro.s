.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global urouro_main_func
urouro_main_func:
/* 80231BF8 0022EBF8  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80231BFC 0022EBFC  7C 08 02 A6 */	mflr r0
/* 80231C00 0022EC00  90 01 00 34 */	stw r0, 0x34(r1)
/* 80231C04 0022EC04  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 80231C08 0022EC08  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 80231C0C 0022EC0C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80231C10 0022EC10  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80231C14 0022EC14  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80231C18 0022EC18  7C 7D 1B 78 */	mr r29, r3
/* 80231C1C 0022EC1C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 80231C20 0022EC20  80 84 00 00 */	lwz r4, 0(r4)
/* 80231C24 0022EC24  4B DF EF A9 */	bl evtGetValue
/* 80231C28 0022EC28  7C 60 1B 78 */	mr r0, r3
/* 80231C2C 0022EC2C  7F A3 EB 78 */	mr r3, r29
/* 80231C30 0022EC30  7C 04 03 78 */	mr r4, r0
/* 80231C34 0022EC34  4B E1 CD 3D */	bl func_8004E970
/* 80231C38 0022EC38  7C 7F 1B 78 */	mr r31, r3
/* 80231C3C 0022EC3C  4B E2 B5 D9 */	bl marioGetPtr
/* 80231C40 0022EC40  83 DD 00 C4 */	lwz r30, 0xc4(r29)
/* 80231C44 0022EC44  7C 7D 1B 78 */	mr r29, r3
/* 80231C48 0022EC48  80 1E 00 04 */	lwz r0, 4(r30)
/* 80231C4C 0022EC4C  2C 00 00 02 */	cmpwi r0, 2
/* 80231C50 0022EC50  41 82 04 10 */	beq lbl_80232060
/* 80231C54 0022EC54  40 80 00 14 */	bge lbl_80231C68
/* 80231C58 0022EC58  2C 00 00 00 */	cmpwi r0, 0
/* 80231C5C 0022EC5C  41 82 00 18 */	beq lbl_80231C74
/* 80231C60 0022EC60  40 80 00 CC */	bge lbl_80231D2C
/* 80231C64 0022EC64  48 00 05 3C */	b lbl_802321A0
lbl_80231C68:
/* 80231C68 0022EC68  2C 00 00 04 */	cmpwi r0, 4
/* 80231C6C 0022EC6C  40 80 05 34 */	bge lbl_802321A0
/* 80231C70 0022EC70  48 00 04 B4 */	b lbl_80232124
lbl_80231C74:
/* 80231C74 0022EC74  80 7E 00 10 */	lwz r3, 0x10(r30)
/* 80231C78 0022EC78  54 60 0F FE */	srwi r0, r3, 0x1f
/* 80231C7C 0022EC7C  7C 00 1A 14 */	add r0, r0, r3
/* 80231C80 0022EC80  7C 03 0E 70 */	srawi r3, r0, 1
/* 80231C84 0022EC84  38 63 00 01 */	addi r3, r3, 1
/* 80231C88 0022EC88  4B DD 42 3D */	bl irand
/* 80231C8C 0022EC8C  80 DE 00 10 */	lwz r6, 0x10(r30)
/* 80231C90 0022EC90  3C 80 66 66 */	lis r4, 0x66666667@ha
/* 80231C94 0022EC94  38 84 66 67 */	addi r4, r4, 0x66666667@l
/* 80231C98 0022EC98  38 00 00 00 */	li r0, 0
/* 80231C9C 0022EC9C  54 C5 0F FE */	srwi r5, r6, 0x1f
/* 80231CA0 0022ECA0  7C A5 32 14 */	add r5, r5, r6
/* 80231CA4 0022ECA4  7C A5 0E 70 */	srawi r5, r5, 1
/* 80231CA8 0022ECA8  7C A5 1A 14 */	add r5, r5, r3
/* 80231CAC 0022ECAC  38 60 00 3C */	li r3, 0x3c
/* 80231CB0 0022ECB0  90 BE 00 08 */	stw r5, 8(r30)
/* 80231CB4 0022ECB4  80 DE 00 08 */	lwz r6, 8(r30)
/* 80231CB8 0022ECB8  7C 84 30 96 */	mulhw r4, r4, r6
/* 80231CBC 0022ECBC  7C 84 1E 70 */	srawi r4, r4, 3
/* 80231CC0 0022ECC0  54 85 0F FE */	srwi r5, r4, 0x1f
/* 80231CC4 0022ECC4  7C 84 2A 14 */	add r4, r4, r5
/* 80231CC8 0022ECC8  1C 84 00 14 */	mulli r4, r4, 0x14
/* 80231CCC 0022ECCC  7C 84 30 50 */	subf r4, r4, r6
/* 80231CD0 0022ECD0  7C 84 30 50 */	subf r4, r4, r6
/* 80231CD4 0022ECD4  90 9E 00 08 */	stw r4, 8(r30)
/* 80231CD8 0022ECD8  90 1E 00 0C */	stw r0, 0xc(r30)
/* 80231CDC 0022ECDC  4B DD 41 E9 */	bl irand
/* 80231CE0 0022ECE0  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80231CE4 0022ECE4  3C 00 43 30 */	lis r0, 0x4330
/* 80231CE8 0022ECE8  90 61 00 0C */	stw r3, 0xc(r1)
/* 80231CEC 0022ECEC  3C 80 80 30 */	lis r4, lbl_802FF940@ha
/* 80231CF0 0022ECF0  C8 64 F9 40 */	lfd f3, lbl_802FF940@l(r4)
/* 80231CF4 0022ECF4  90 01 00 08 */	stw r0, 8(r1)
/* 80231CF8 0022ECF8  C0 3F 01 44 */	lfs f1, 0x144(r31)
/* 80231CFC 0022ECFC  C8 41 00 08 */	lfd f2, 8(r1)
/* 80231D00 0022ED00  C0 02 05 58 */	lfs f0, lbl_804218D8@sda21(r2)
/* 80231D04 0022ED04  EC 42 18 28 */	fsubs f2, f2, f3
/* 80231D08 0022ED08  EC 21 10 2A */	fadds f1, f1, f2
/* 80231D0C 0022ED0C  EC 21 00 28 */	fsubs f1, f1, f0
/* 80231D10 0022ED10  4B DD 55 99 */	bl reviseAngle
/* 80231D14 0022ED14  D0 3F 01 44 */	stfs f1, 0x144(r31)
/* 80231D18 0022ED18  38 00 00 01 */	li r0, 1
/* 80231D1C 0022ED1C  C0 1F 01 44 */	lfs f0, 0x144(r31)
/* 80231D20 0022ED20  D0 1F 01 AC */	stfs f0, 0x1ac(r31)
/* 80231D24 0022ED24  90 1E 00 04 */	stw r0, 4(r30)
/* 80231D28 0022ED28  48 00 04 78 */	b lbl_802321A0
lbl_80231D2C:
/* 80231D2C 0022ED2C  C0 3F 00 8C */	lfs f1, 0x8c(r31)
/* 80231D30 0022ED30  C0 5F 00 94 */	lfs f2, 0x94(r31)
/* 80231D34 0022ED34  C0 7E 00 1C */	lfs f3, 0x1c(r30)
/* 80231D38 0022ED38  C0 9E 00 24 */	lfs f4, 0x24(r30)
/* 80231D3C 0022ED3C  4B DD 54 71 */	bl distABf
/* 80231D40 0022ED40  FF E0 08 90 */	fmr f31, f1
/* 80231D44 0022ED44  80 7F 01 04 */	lwz r3, 0x104(r31)
/* 80231D48 0022ED48  4B E0 E3 6D */	bl animPoseGetPeraEnd
/* 80231D4C 0022ED4C  2C 03 00 00 */	cmpwi r3, 0
/* 80231D50 0022ED50  41 82 00 78 */	beq lbl_80231DC8
/* 80231D54 0022ED54  C0 1E 00 28 */	lfs f0, 0x28(r30)
/* 80231D58 0022ED58  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80231D5C 0022ED5C  40 81 00 58 */	ble lbl_80231DB4
/* 80231D60 0022ED60  80 7E 00 00 */	lwz r3, 0(r30)
/* 80231D64 0022ED64  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 80231D68 0022ED68  40 82 00 0C */	bne lbl_80231D74
/* 80231D6C 0022ED6C  60 60 00 03 */	ori r0, r3, 3
/* 80231D70 0022ED70  90 1E 00 00 */	stw r0, 0(r30)
lbl_80231D74:
/* 80231D74 0022ED74  80 1E 00 00 */	lwz r0, 0(r30)
/* 80231D78 0022ED78  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 80231D7C 0022ED7C  41 82 00 4C */	beq lbl_80231DC8
/* 80231D80 0022ED80  C0 3F 00 8C */	lfs f1, 0x8c(r31)
/* 80231D84 0022ED84  C0 5F 00 94 */	lfs f2, 0x94(r31)
/* 80231D88 0022ED88  C0 7E 00 1C */	lfs f3, 0x1c(r30)
/* 80231D8C 0022ED8C  C0 9E 00 24 */	lfs f4, 0x24(r30)
/* 80231D90 0022ED90  4B DD 52 2D */	bl angleABf
/* 80231D94 0022ED94  4B DD 55 15 */	bl reviseAngle
/* 80231D98 0022ED98  D0 3F 01 44 */	stfs f1, 0x144(r31)
/* 80231D9C 0022ED9C  C0 1F 01 44 */	lfs f0, 0x144(r31)
/* 80231DA0 0022EDA0  D0 1F 01 AC */	stfs f0, 0x1ac(r31)
/* 80231DA4 0022EDA4  80 1E 00 00 */	lwz r0, 0(r30)
/* 80231DA8 0022EDA8  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 80231DAC 0022EDAC  90 1E 00 00 */	stw r0, 0(r30)
/* 80231DB0 0022EDB0  48 00 00 18 */	b lbl_80231DC8
lbl_80231DB4:
/* 80231DB4 0022EDB4  80 7E 00 00 */	lwz r3, 0(r30)
/* 80231DB8 0022EDB8  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 80231DBC 0022EDBC  41 82 00 0C */	beq lbl_80231DC8
/* 80231DC0 0022EDC0  54 60 00 3A */	rlwinm r0, r3, 0, 0, 0x1d
/* 80231DC4 0022EDC4  90 1E 00 00 */	stw r0, 0(r30)
lbl_80231DC8:
/* 80231DC8 0022EDC8  80 7F 01 04 */	lwz r3, 0x104(r31)
/* 80231DCC 0022EDCC  4B E0 E2 E9 */	bl animPoseGetPeraEnd
/* 80231DD0 0022EDD0  2C 03 00 00 */	cmpwi r3, 0
/* 80231DD4 0022EDD4  41 82 00 8C */	beq lbl_80231E60
/* 80231DD8 0022EDD8  4B E6 33 99 */	bl marioGetTouchNpcPtr
/* 80231DDC 0022EDDC  7C 1F 18 40 */	cmplw r31, r3
/* 80231DE0 0022EDE0  40 82 00 80 */	bne lbl_80231E60
/* 80231DE4 0022EDE4  C0 3F 01 AC */	lfs f1, 0x1ac(r31)
/* 80231DE8 0022EDE8  C0 5D 01 A0 */	lfs f2, 0x1a0(r29)
/* 80231DEC 0022EDEC  4B DD 53 85 */	bl compAngle
/* 80231DF0 0022EDF0  FC 20 0A 10 */	fabs f1, f1
/* 80231DF4 0022EDF4  C0 02 05 5C */	lfs f0, lbl_804218DC@sda21(r2)
/* 80231DF8 0022EDF8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80231DFC 0022EDFC  40 80 00 64 */	bge lbl_80231E60
/* 80231E00 0022EE00  C0 3F 00 8C */	lfs f1, 0x8c(r31)
/* 80231E04 0022EE04  C0 5F 00 94 */	lfs f2, 0x94(r31)
/* 80231E08 0022EE08  C0 7D 00 8C */	lfs f3, 0x8c(r29)
/* 80231E0C 0022EE0C  C0 9D 00 94 */	lfs f4, 0x94(r29)
/* 80231E10 0022EE10  4B DD 51 AD */	bl angleABf
/* 80231E14 0022EE14  C0 5D 01 A0 */	lfs f2, 0x1a0(r29)
/* 80231E18 0022EE18  4B DD 53 59 */	bl compAngle
/* 80231E1C 0022EE1C  FC 20 0A 10 */	fabs f1, f1
/* 80231E20 0022EE20  C0 02 05 5C */	lfs f0, lbl_804218DC@sda21(r2)
/* 80231E24 0022EE24  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80231E28 0022EE28  40 80 00 38 */	bge lbl_80231E60
/* 80231E2C 0022EE2C  C0 1E 00 28 */	lfs f0, 0x28(r30)
/* 80231E30 0022EE30  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80231E34 0022EE34  40 80 00 2C */	bge lbl_80231E60
/* 80231E38 0022EE38  C0 3F 01 AC */	lfs f1, 0x1ac(r31)
/* 80231E3C 0022EE3C  C0 02 05 60 */	lfs f0, lbl_804218E0@sda21(r2)
/* 80231E40 0022EE40  EC 21 00 28 */	fsubs f1, f1, f0
/* 80231E44 0022EE44  4B DD 54 65 */	bl reviseAngle
/* 80231E48 0022EE48  D0 3F 01 44 */	stfs f1, 0x144(r31)
/* 80231E4C 0022EE4C  C0 1F 01 44 */	lfs f0, 0x144(r31)
/* 80231E50 0022EE50  D0 1F 01 AC */	stfs f0, 0x1ac(r31)
/* 80231E54 0022EE54  80 1E 00 00 */	lwz r0, 0(r30)
/* 80231E58 0022EE58  54 00 00 3A */	rlwinm r0, r0, 0, 0, 0x1d
/* 80231E5C 0022EE5C  90 1E 00 00 */	stw r0, 0(r30)
lbl_80231E60:
/* 80231E60 0022EE60  80 7F 01 04 */	lwz r3, 0x104(r31)
/* 80231E64 0022EE64  4B E0 E2 51 */	bl animPoseGetPeraEnd
/* 80231E68 0022EE68  2C 03 00 00 */	cmpwi r3, 0
/* 80231E6C 0022EE6C  41 82 00 40 */	beq lbl_80231EAC
/* 80231E70 0022EE70  80 1F 02 FC */	lwz r0, 0x2fc(r31)
/* 80231E74 0022EE74  28 00 00 00 */	cmplwi r0, 0
/* 80231E78 0022EE78  41 82 00 34 */	beq lbl_80231EAC
/* 80231E7C 0022EE7C  C0 3F 00 8C */	lfs f1, 0x8c(r31)
/* 80231E80 0022EE80  C0 5F 00 94 */	lfs f2, 0x94(r31)
/* 80231E84 0022EE84  C0 7E 00 1C */	lfs f3, 0x1c(r30)
/* 80231E88 0022EE88  C0 9E 00 24 */	lfs f4, 0x24(r30)
/* 80231E8C 0022EE8C  4B DD 51 31 */	bl angleABf
/* 80231E90 0022EE90  4B DD 54 19 */	bl reviseAngle
/* 80231E94 0022EE94  D0 3F 01 44 */	stfs f1, 0x144(r31)
/* 80231E98 0022EE98  C0 1F 01 44 */	lfs f0, 0x144(r31)
/* 80231E9C 0022EE9C  D0 1F 01 AC */	stfs f0, 0x1ac(r31)
/* 80231EA0 0022EEA0  80 1E 00 00 */	lwz r0, 0(r30)
/* 80231EA4 0022EEA4  54 00 00 3A */	rlwinm r0, r0, 0, 0, 0x1d
/* 80231EA8 0022EEA8  90 1E 00 00 */	stw r0, 0(r30)
lbl_80231EAC:
/* 80231EAC 0022EEAC  80 7E 00 08 */	lwz r3, 8(r30)
/* 80231EB0 0022EEB0  38 03 FF FF */	addi r0, r3, -1
/* 80231EB4 0022EEB4  90 1E 00 08 */	stw r0, 8(r30)
/* 80231EB8 0022EEB8  80 1E 00 08 */	lwz r0, 8(r30)
/* 80231EBC 0022EEBC  2C 00 00 00 */	cmpwi r0, 0
/* 80231EC0 0022EEC0  40 82 00 10 */	bne lbl_80231ED0
/* 80231EC4 0022EEC4  38 00 00 02 */	li r0, 2
/* 80231EC8 0022EEC8  90 1E 00 04 */	stw r0, 4(r30)
/* 80231ECC 0022EECC  48 00 02 D4 */	b lbl_802321A0
lbl_80231ED0:
/* 80231ED0 0022EED0  80 7F 01 04 */	lwz r3, 0x104(r31)
/* 80231ED4 0022EED4  4B E0 E1 E1 */	bl animPoseGetPeraEnd
/* 80231ED8 0022EED8  2C 03 00 00 */	cmpwi r3, 0
/* 80231EDC 0022EEDC  41 82 02 C4 */	beq lbl_802321A0
/* 80231EE0 0022EEE0  C0 22 05 64 */	lfs f1, lbl_804218E4@sda21(r2)
/* 80231EE4 0022EEE4  C0 7F 01 B0 */	lfs f3, 0x1b0(r31)
/* 80231EE8 0022EEE8  C0 1F 01 A4 */	lfs f0, 0x1a4(r31)
/* 80231EEC 0022EEEC  EC 41 00 F2 */	fmuls f2, f1, f3
/* 80231EF0 0022EEF0  C0 22 05 68 */	lfs f1, lbl_804218E8@sda21(r2)
/* 80231EF4 0022EEF4  EF E3 00 32 */	fmuls f31, f3, f0
/* 80231EF8 0022EEF8  EC 02 08 24 */	fdivs f0, f2, f1
/* 80231EFC 0022EEFC  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 80231F00 0022EF00  4C 41 13 82 */	cror 2, 1, 2
/* 80231F04 0022EF04  40 82 00 08 */	bne lbl_80231F0C
/* 80231F08 0022EF08  FF E0 00 90 */	fmr f31, f0
lbl_80231F0C:
/* 80231F0C 0022EF0C  C0 42 05 6C */	lfs f2, lbl_804218EC@sda21(r2)
/* 80231F10 0022EF10  C0 3F 01 AC */	lfs f1, 0x1ac(r31)
/* 80231F14 0022EF14  C0 02 05 70 */	lfs f0, lbl_804218F0@sda21(r2)
/* 80231F18 0022EF18  EC 22 00 72 */	fmuls f1, f2, f1
/* 80231F1C 0022EF1C  EC 21 00 24 */	fdivs f1, f1, f0
/* 80231F20 0022EF20  48 03 A4 D9 */	bl sin
/* 80231F24 0022EF24  FC 20 08 18 */	frsp f1, f1
/* 80231F28 0022EF28  C0 42 05 6C */	lfs f2, lbl_804218EC@sda21(r2)
/* 80231F2C 0022EF2C  C0 02 05 70 */	lfs f0, lbl_804218F0@sda21(r2)
/* 80231F30 0022EF30  EC 3F 00 72 */	fmuls f1, f31, f1
/* 80231F34 0022EF34  D0 3F 01 B4 */	stfs f1, 0x1b4(r31)
/* 80231F38 0022EF38  C0 3F 01 AC */	lfs f1, 0x1ac(r31)
/* 80231F3C 0022EF3C  EC 22 00 72 */	fmuls f1, f2, f1
/* 80231F40 0022EF40  EC 21 00 24 */	fdivs f1, f1, f0
/* 80231F44 0022EF44  48 03 9F 4D */	bl cos
/* 80231F48 0022EF48  FC 00 08 18 */	frsp f0, f1
/* 80231F4C 0022EF4C  3B A0 00 00 */	li r29, 0
/* 80231F50 0022EF50  FC 00 00 50 */	fneg f0, f0
/* 80231F54 0022EF54  EC 1F 00 32 */	fmuls f0, f31, f0
/* 80231F58 0022EF58  D0 1F 01 BC */	stfs f0, 0x1bc(r31)
/* 80231F5C 0022EF5C  4B EA 5B FD */	bl psndGetFlag
/* 80231F60 0022EF60  54 60 05 EF */	rlwinm. r0, r3, 0, 0x17, 0x17
/* 80231F64 0022EF64  41 82 00 18 */	beq lbl_80231F7C
/* 80231F68 0022EF68  80 7F 01 04 */	lwz r3, 0x104(r31)
/* 80231F6C 0022EF6C  4B E0 E0 95 */	bl animPoseGetMaterialFlag
/* 80231F70 0022EF70  54 60 04 E9 */	rlwinm. r0, r3, 0, 0x13, 0x14
/* 80231F74 0022EF74  40 82 00 08 */	bne lbl_80231F7C
/* 80231F78 0022EF78  3F A0 00 01 */	lis r29, 1
lbl_80231F7C:
/* 80231F7C 0022EF7C  A0 9F 01 E8 */	lhz r4, 0x1e8(r31)
/* 80231F80 0022EF80  3C 00 43 30 */	lis r0, 0x4330
/* 80231F84 0022EF84  3C 60 80 30 */	lis r3, lbl_802FF948@ha
/* 80231F88 0022EF88  90 01 00 08 */	stw r0, 8(r1)
/* 80231F8C 0022EF8C  C8 43 F9 48 */	lfd f2, lbl_802FF948@l(r3)
/* 80231F90 0022EF90  90 81 00 0C */	stw r4, 0xc(r1)
/* 80231F94 0022EF94  C0 1F 01 B0 */	lfs f0, 0x1b0(r31)
/* 80231F98 0022EF98  C8 21 00 08 */	lfd f1, 8(r1)
/* 80231F9C 0022EF9C  C0 7F 01 DC */	lfs f3, 0x1dc(r31)
/* 80231FA0 0022EFA0  EC 21 10 28 */	fsubs f1, f1, f2
/* 80231FA4 0022EFA4  EC 01 00 24 */	fdivs f0, f1, f0
/* 80231FA8 0022EFA8  FC 03 00 40 */	fcmpo cr0, f3, f0
/* 80231FAC 0022EFAC  40 81 00 84 */	ble lbl_80232030
/* 80231FB0 0022EFB0  A8 1F 01 D8 */	lha r0, 0x1d8(r31)
/* 80231FB4 0022EFB4  2C 00 00 00 */	cmpwi r0, 0
/* 80231FB8 0022EFB8  41 82 00 34 */	beq lbl_80231FEC
/* 80231FBC 0022EFBC  80 7F 01 E0 */	lwz r3, 0x1e0(r31)
/* 80231FC0 0022EFC0  28 03 00 00 */	cmplwi r3, 0
/* 80231FC4 0022EFC4  41 82 00 54 */	beq lbl_80232018
/* 80231FC8 0022EFC8  4B EA 60 99 */	bl searchPSSFXList
/* 80231FCC 0022EFCC  7F A3 1B 78 */	or r3, r29, r3
/* 80231FD0 0022EFD0  38 9F 00 8C */	addi r4, r31, 0x8c
/* 80231FD4 0022EFD4  38 A0 00 FF */	li r5, 0xff
/* 80231FD8 0022EFD8  38 C0 00 FF */	li r6, 0xff
/* 80231FDC 0022EFDC  38 E0 00 00 */	li r7, 0
/* 80231FE0 0022EFE0  39 00 00 08 */	li r8, 8
/* 80231FE4 0022EFE4  4B EA 34 29 */	bl psndSFXOnEx_3D
/* 80231FE8 0022EFE8  48 00 00 30 */	b lbl_80232018
lbl_80231FEC:
/* 80231FEC 0022EFEC  80 7F 01 E4 */	lwz r3, 0x1e4(r31)
/* 80231FF0 0022EFF0  28 03 00 00 */	cmplwi r3, 0
/* 80231FF4 0022EFF4  41 82 00 24 */	beq lbl_80232018
/* 80231FF8 0022EFF8  4B EA 60 69 */	bl searchPSSFXList
/* 80231FFC 0022EFFC  7F A3 1B 78 */	or r3, r29, r3
/* 80232000 0022F000  38 9F 00 8C */	addi r4, r31, 0x8c
/* 80232004 0022F004  38 A0 00 FF */	li r5, 0xff
/* 80232008 0022F008  38 C0 00 FF */	li r6, 0xff
/* 8023200C 0022F00C  38 E0 00 00 */	li r7, 0
/* 80232010 0022F010  39 00 00 08 */	li r8, 8
/* 80232014 0022F014  4B EA 33 F9 */	bl psndSFXOnEx_3D
lbl_80232018:
/* 80232018 0022F018  C0 02 05 74 */	lfs f0, lbl_804218F4@sda21(r2)
/* 8023201C 0022F01C  D0 1F 01 DC */	stfs f0, 0x1dc(r31)
/* 80232020 0022F020  A8 1F 01 D8 */	lha r0, 0x1d8(r31)
/* 80232024 0022F024  20 00 00 01 */	subfic r0, r0, 1
/* 80232028 0022F028  7C 00 07 74 */	extsb r0, r0
/* 8023202C 0022F02C  B0 1F 01 D8 */	sth r0, 0x1d8(r31)
lbl_80232030:
/* 80232030 0022F030  80 1F 01 E4 */	lwz r0, 0x1e4(r31)
/* 80232034 0022F034  28 00 00 00 */	cmplwi r0, 0
/* 80232038 0022F038  40 82 00 10 */	bne lbl_80232048
/* 8023203C 0022F03C  A8 1F 01 D8 */	lha r0, 0x1d8(r31)
/* 80232040 0022F040  2C 00 00 00 */	cmpwi r0, 0
/* 80232044 0022F044  41 82 01 5C */	beq lbl_802321A0
lbl_80232048:
/* 80232048 0022F048  C0 42 05 68 */	lfs f2, lbl_804218E8@sda21(r2)
/* 8023204C 0022F04C  C0 3F 01 A4 */	lfs f1, 0x1a4(r31)
/* 80232050 0022F050  C0 1F 01 DC */	lfs f0, 0x1dc(r31)
/* 80232054 0022F054  EC 02 00 7A */	fmadds f0, f2, f1, f0
/* 80232058 0022F058  D0 1F 01 DC */	stfs f0, 0x1dc(r31)
/* 8023205C 0022F05C  48 00 01 44 */	b lbl_802321A0
lbl_80232060:
/* 80232060 0022F060  80 7E 00 14 */	lwz r3, 0x14(r30)
/* 80232064 0022F064  54 60 0F FE */	srwi r0, r3, 0x1f
/* 80232068 0022F068  7C 00 1A 14 */	add r0, r0, r3
/* 8023206C 0022F06C  7C 03 0E 70 */	srawi r3, r0, 1
/* 80232070 0022F070  38 63 00 01 */	addi r3, r3, 1
/* 80232074 0022F074  4B DD 3E 51 */	bl irand
/* 80232078 0022F078  80 9E 00 14 */	lwz r4, 0x14(r30)
/* 8023207C 0022F07C  54 80 0F FE */	srwi r0, r4, 0x1f
/* 80232080 0022F080  7C 00 22 14 */	add r0, r0, r4
/* 80232084 0022F084  7C 00 0E 70 */	srawi r0, r0, 1
/* 80232088 0022F088  7C 00 1A 14 */	add r0, r0, r3
/* 8023208C 0022F08C  38 60 00 3C */	li r3, 0x3c
/* 80232090 0022F090  90 1E 00 08 */	stw r0, 8(r30)
/* 80232094 0022F094  4B DD 3E 31 */	bl irand
/* 80232098 0022F098  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8023209C 0022F09C  3C 00 43 30 */	lis r0, 0x4330
/* 802320A0 0022F0A0  90 61 00 0C */	stw r3, 0xc(r1)
/* 802320A4 0022F0A4  3C 80 80 30 */	lis r4, lbl_802FF940@ha
/* 802320A8 0022F0A8  C8 64 F9 40 */	lfd f3, lbl_802FF940@l(r4)
/* 802320AC 0022F0AC  90 01 00 08 */	stw r0, 8(r1)
/* 802320B0 0022F0B0  C0 3F 01 44 */	lfs f1, 0x144(r31)
/* 802320B4 0022F0B4  C8 41 00 08 */	lfd f2, 8(r1)
/* 802320B8 0022F0B8  C0 02 05 58 */	lfs f0, lbl_804218D8@sda21(r2)
/* 802320BC 0022F0BC  EC 42 18 28 */	fsubs f2, f2, f3
/* 802320C0 0022F0C0  EC 21 10 2A */	fadds f1, f1, f2
/* 802320C4 0022F0C4  EC 21 00 28 */	fsubs f1, f1, f0
/* 802320C8 0022F0C8  4B DD 51 E1 */	bl reviseAngle
/* 802320CC 0022F0CC  D0 3F 01 44 */	stfs f1, 0x144(r31)
/* 802320D0 0022F0D0  38 00 00 00 */	li r0, 0
/* 802320D4 0022F0D4  C0 1F 01 44 */	lfs f0, 0x144(r31)
/* 802320D8 0022F0D8  D0 1F 01 AC */	stfs f0, 0x1ac(r31)
/* 802320DC 0022F0DC  90 1E 00 0C */	stw r0, 0xc(r30)
/* 802320E0 0022F0E0  80 1E 00 00 */	lwz r0, 0(r30)
/* 802320E4 0022F0E4  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 802320E8 0022F0E8  41 82 00 30 */	beq lbl_80232118
/* 802320EC 0022F0EC  38 60 03 E8 */	li r3, 0x3e8
/* 802320F0 0022F0F0  4B DD 3D D5 */	bl irand
/* 802320F4 0022F0F4  3C 80 55 55 */	lis r4, 0x55555556@ha
/* 802320F8 0022F0F8  38 04 55 56 */	addi r0, r4, 0x55555556@l
/* 802320FC 0022F0FC  7C 80 18 96 */	mulhw r4, r0, r3
/* 80232100 0022F100  54 80 0F FE */	srwi r0, r4, 0x1f
/* 80232104 0022F104  7C 04 02 14 */	add r0, r4, r0
/* 80232108 0022F108  1C 00 00 03 */	mulli r0, r0, 3
/* 8023210C 0022F10C  7C 60 18 50 */	subf r3, r0, r3
/* 80232110 0022F110  38 03 00 02 */	addi r0, r3, 2
/* 80232114 0022F114  90 1E 00 0C */	stw r0, 0xc(r30)
lbl_80232118:
/* 80232118 0022F118  38 00 00 03 */	li r0, 3
/* 8023211C 0022F11C  90 1E 00 04 */	stw r0, 4(r30)
/* 80232120 0022F120  48 00 00 80 */	b lbl_802321A0
lbl_80232124:
/* 80232124 0022F124  80 7E 00 08 */	lwz r3, 8(r30)
/* 80232128 0022F128  38 03 FF FF */	addi r0, r3, -1
/* 8023212C 0022F12C  90 1E 00 08 */	stw r0, 8(r30)
/* 80232130 0022F130  80 1E 00 08 */	lwz r0, 8(r30)
/* 80232134 0022F134  2C 00 00 00 */	cmpwi r0, 0
/* 80232138 0022F138  40 82 00 68 */	bne lbl_802321A0
/* 8023213C 0022F13C  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 80232140 0022F140  54 60 0F FE */	srwi r0, r3, 0x1f
/* 80232144 0022F144  7C 00 1A 14 */	add r0, r0, r3
/* 80232148 0022F148  7C 03 0E 70 */	srawi r3, r0, 1
/* 8023214C 0022F14C  38 63 00 01 */	addi r3, r3, 1
/* 80232150 0022F150  4B DD 3D 75 */	bl irand
/* 80232154 0022F154  80 9E 00 18 */	lwz r4, 0x18(r30)
/* 80232158 0022F158  54 80 0F FE */	srwi r0, r4, 0x1f
/* 8023215C 0022F15C  7C 00 22 14 */	add r0, r0, r4
/* 80232160 0022F160  7C 00 0E 70 */	srawi r0, r0, 1
/* 80232164 0022F164  7C 00 1A 14 */	add r0, r0, r3
/* 80232168 0022F168  90 1E 00 08 */	stw r0, 8(r30)
/* 8023216C 0022F16C  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 80232170 0022F170  2C 03 00 00 */	cmpwi r3, 0
/* 80232174 0022F174  40 82 00 10 */	bne lbl_80232184
/* 80232178 0022F178  38 00 00 00 */	li r0, 0
/* 8023217C 0022F17C  90 1E 00 04 */	stw r0, 4(r30)
/* 80232180 0022F180  48 00 00 20 */	b lbl_802321A0
lbl_80232184:
/* 80232184 0022F184  38 03 FF FF */	addi r0, r3, -1
/* 80232188 0022F188  C0 22 05 60 */	lfs f1, lbl_804218E0@sda21(r2)
/* 8023218C 0022F18C  90 1E 00 0C */	stw r0, 0xc(r30)
/* 80232190 0022F190  C0 1F 01 44 */	lfs f0, 0x144(r31)
/* 80232194 0022F194  EC 21 00 2A */	fadds f1, f1, f0
/* 80232198 0022F198  4B DD 51 11 */	bl reviseAngle
/* 8023219C 0022F19C  D0 3F 01 44 */	stfs f1, 0x144(r31)
lbl_802321A0:
/* 802321A0 0022F1A0  38 60 00 00 */	li r3, 0
/* 802321A4 0022F1A4  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 802321A8 0022F1A8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802321AC 0022F1AC  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 802321B0 0022F1B0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802321B4 0022F1B4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802321B8 0022F1B8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802321BC 0022F1BC  7C 08 03 A6 */	mtlr r0
/* 802321C0 0022F1C0  38 21 00 30 */	addi r1, r1, 0x30
/* 802321C4 0022F1C4  4E 80 00 20 */	blr 

.global urouro_init_func
urouro_init_func:
/* 802321C8 0022F1C8  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 802321CC 0022F1CC  7C 08 02 A6 */	mflr r0
/* 802321D0 0022F1D0  90 01 00 64 */	stw r0, 0x64(r1)
/* 802321D4 0022F1D4  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 802321D8 0022F1D8  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 802321DC 0022F1DC  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 802321E0 0022F1E0  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 802321E4 0022F1E4  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 802321E8 0022F1E8  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 802321EC 0022F1EC  DB 81 00 20 */	stfd f28, 0x20(r1)
/* 802321F0 0022F1F0  F3 81 00 28 */	psq_st f28, 40(r1), 0, qr0
/* 802321F4 0022F1F4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802321F8 0022F1F8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802321FC 0022F1FC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80232200 0022F200  7C 7D 1B 78 */	mr r29, r3
/* 80232204 0022F204  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 80232208 0022F208  80 9F 00 00 */	lwz r4, 0(r31)
/* 8023220C 0022F20C  4B DF E9 C1 */	bl evtGetValue
/* 80232210 0022F210  7C 60 1B 78 */	mr r0, r3
/* 80232214 0022F214  7F A3 EB 78 */	mr r3, r29
/* 80232218 0022F218  7C 04 03 78 */	mr r4, r0
/* 8023221C 0022F21C  4B E1 C7 55 */	bl func_8004E970
/* 80232220 0022F220  80 9F 00 04 */	lwz r4, 4(r31)
/* 80232224 0022F224  7C 7E 1B 78 */	mr r30, r3
/* 80232228 0022F228  7F A3 EB 78 */	mr r3, r29
/* 8023222C 0022F22C  4B DF DF 81 */	bl evtGetFloat
/* 80232230 0022F230  FF 80 08 90 */	fmr f28, f1
/* 80232234 0022F234  80 9F 00 08 */	lwz r4, 8(r31)
/* 80232238 0022F238  7F A3 EB 78 */	mr r3, r29
/* 8023223C 0022F23C  4B DF DF 71 */	bl evtGetFloat
/* 80232240 0022F240  FF A0 08 90 */	fmr f29, f1
/* 80232244 0022F244  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 80232248 0022F248  7F A3 EB 78 */	mr r3, r29
/* 8023224C 0022F24C  4B DF DF 61 */	bl evtGetFloat
/* 80232250 0022F250  FF C0 08 90 */	fmr f30, f1
/* 80232254 0022F254  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 80232258 0022F258  7F A3 EB 78 */	mr r3, r29
/* 8023225C 0022F25C  4B DF DF 51 */	bl evtGetFloat
/* 80232260 0022F260  FF E0 08 90 */	fmr f31, f1
/* 80232264 0022F264  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 80232268 0022F268  7F A3 EB 78 */	mr r3, r29
/* 8023226C 0022F26C  4B DF E9 61 */	bl evtGetValue
/* 80232270 0022F270  7C 7F 1B 78 */	mr r31, r3
/* 80232274 0022F274  38 60 00 2C */	li r3, 0x2c
/* 80232278 0022F278  4B DF D6 DD */	bl _mapAlloc
/* 8023227C 0022F27C  90 7D 00 C4 */	stw r3, 0xc4(r29)
/* 80232280 0022F280  38 00 00 00 */	li r0, 0
/* 80232284 0022F284  38 60 17 70 */	li r3, 0x1770
/* 80232288 0022F288  83 BD 00 C4 */	lwz r29, 0xc4(r29)
/* 8023228C 0022F28C  93 FD 00 00 */	stw r31, 0(r29)
/* 80232290 0022F290  90 1D 00 04 */	stw r0, 4(r29)
/* 80232294 0022F294  90 1D 00 08 */	stw r0, 8(r29)
/* 80232298 0022F298  90 1D 00 0C */	stw r0, 0xc(r29)
/* 8023229C 0022F29C  4B DD 38 5D */	bl sysMsec2Frame
/* 802322A0 0022F2A0  90 7D 00 10 */	stw r3, 0x10(r29)
/* 802322A4 0022F2A4  38 60 23 28 */	li r3, 0x2328
/* 802322A8 0022F2A8  4B DD 38 51 */	bl sysMsec2Frame
/* 802322AC 0022F2AC  90 7D 00 14 */	stw r3, 0x14(r29)
/* 802322B0 0022F2B0  38 60 05 DC */	li r3, 0x5dc
/* 802322B4 0022F2B4  4B DD 38 45 */	bl sysMsec2Frame
/* 802322B8 0022F2B8  90 7D 00 18 */	stw r3, 0x18(r29)
/* 802322BC 0022F2BC  38 60 00 02 */	li r3, 2
/* 802322C0 0022F2C0  D3 9D 00 1C */	stfs f28, 0x1c(r29)
/* 802322C4 0022F2C4  C0 1E 00 90 */	lfs f0, 0x90(r30)
/* 802322C8 0022F2C8  D0 1D 00 20 */	stfs f0, 0x20(r29)
/* 802322CC 0022F2CC  D3 BD 00 24 */	stfs f29, 0x24(r29)
/* 802322D0 0022F2D0  D3 DD 00 28 */	stfs f30, 0x28(r29)
/* 802322D4 0022F2D4  D3 FE 01 B0 */	stfs f31, 0x1b0(r30)
/* 802322D8 0022F2D8  80 1E 00 00 */	lwz r0, 0(r30)
/* 802322DC 0022F2DC  64 00 00 40 */	oris r0, r0, 0x40
/* 802322E0 0022F2E0  90 1E 00 00 */	stw r0, 0(r30)
/* 802322E4 0022F2E4  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 802322E8 0022F2E8  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 802322EC 0022F2EC  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 802322F0 0022F2F0  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 802322F4 0022F2F4  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 802322F8 0022F2F8  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 802322FC 0022F2FC  E3 81 00 28 */	psq_l f28, 40(r1), 0, qr0
/* 80232300 0022F300  CB 81 00 20 */	lfd f28, 0x20(r1)
/* 80232304 0022F304  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80232308 0022F308  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8023230C 0022F30C  80 01 00 64 */	lwz r0, 0x64(r1)
/* 80232310 0022F310  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80232314 0022F314  7C 08 03 A6 */	mtlr r0
/* 80232318 0022F318  38 21 00 60 */	addi r1, r1, 0x60
/* 8023231C 0022F31C  4E 80 00 20 */	blr 
