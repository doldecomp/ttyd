.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effBomheiDisp
effBomheiDisp:
/* 801AAC6C 001A7C6C  94 21 FF 00 */	stwu r1, -0x100(r1)
/* 801AAC70 001A7C70  7C 08 02 A6 */	mflr r0
/* 801AAC74 001A7C74  90 01 01 04 */	stw r0, 0x104(r1)
/* 801AAC78 001A7C78  93 E1 00 FC */	stw r31, 0xfc(r1)
/* 801AAC7C 001A7C7C  93 C1 00 F8 */	stw r30, 0xf8(r1)
/* 801AAC80 001A7C80  93 A1 00 F4 */	stw r29, 0xf4(r1)
/* 801AAC84 001A7C84  93 81 00 F0 */	stw r28, 0xf0(r1)
/* 801AAC88 001A7C88  7C 9C 23 78 */	mr r28, r4
/* 801AAC8C 001A7C8C  4B E6 44 C5 */	bl camGetPtr
/* 801AAC90 001A7C90  83 DC 00 0C */	lwz r30, 0xc(r28)
/* 801AAC94 001A7C94  3C 00 43 30 */	lis r0, 0x4330
/* 801AAC98 001A7C98  3C 80 80 30 */	lis r4, lbl_802FA2C0@ha
/* 801AAC9C 001A7C9C  7C 7F 1B 78 */	mr r31, r3
/* 801AACA0 001A7CA0  C0 7E 00 20 */	lfs f3, 0x20(r30)
/* 801AACA4 001A7CA4  38 60 00 00 */	li r3, 0
/* 801AACA8 001A7CA8  90 01 00 D0 */	stw r0, 0xd0(r1)
/* 801AACAC 001A7CAC  FC 00 18 1E */	fctiwz f0, f3
/* 801AACB0 001A7CB0  C8 24 A2 C0 */	lfd f1, lbl_802FA2C0@l(r4)
/* 801AACB4 001A7CB4  C0 42 D6 AC */	lfs f2, lbl_8041EA2C@sda21(r2)
/* 801AACB8 001A7CB8  D8 01 00 C8 */	stfd f0, 0xc8(r1)
/* 801AACBC 001A7CBC  83 81 00 CC */	lwz r28, 0xcc(r1)
/* 801AACC0 001A7CC0  6F 80 80 00 */	xoris r0, r28, 0x8000
/* 801AACC4 001A7CC4  90 01 00 D4 */	stw r0, 0xd4(r1)
/* 801AACC8 001A7CC8  C8 01 00 D0 */	lfd f0, 0xd0(r1)
/* 801AACCC 001A7CCC  EC 00 08 28 */	fsubs f0, f0, f1
/* 801AACD0 001A7CD0  EC 03 00 28 */	fsubs f0, f3, f0
/* 801AACD4 001A7CD4  EC 02 00 32 */	fmuls f0, f2, f0
/* 801AACD8 001A7CD8  FC 00 00 1E */	fctiwz f0, f0
/* 801AACDC 001A7CDC  D8 01 00 D8 */	stfd f0, 0xd8(r1)
/* 801AACE0 001A7CE0  83 A1 00 DC */	lwz r29, 0xdc(r1)
/* 801AACE4 001A7CE4  48 10 64 55 */	bl GXSetNumChans
/* 801AACE8 001A7CE8  38 60 00 03 */	li r3, 3
/* 801AACEC 001A7CEC  48 10 84 DD */	bl GXSetNumTevStages
/* 801AACF0 001A7CF0  38 60 00 00 */	li r3, 0
/* 801AACF4 001A7CF4  38 80 00 00 */	li r4, 0
/* 801AACF8 001A7CF8  38 A0 00 00 */	li r5, 0
/* 801AACFC 001A7CFC  38 C0 00 FF */	li r6, 0xff
/* 801AAD00 001A7D00  48 10 83 2D */	bl GXSetTevOrder
/* 801AAD04 001A7D04  38 60 00 00 */	li r3, 0
/* 801AAD08 001A7D08  38 80 00 00 */	li r4, 0
/* 801AAD0C 001A7D0C  38 A0 00 00 */	li r5, 0
/* 801AAD10 001A7D10  38 C0 00 00 */	li r6, 0
/* 801AAD14 001A7D14  38 E0 00 01 */	li r7, 1
/* 801AAD18 001A7D18  39 00 00 03 */	li r8, 3
/* 801AAD1C 001A7D1C  48 10 7E C9 */	bl GXSetTevColorOp
/* 801AAD20 001A7D20  38 60 00 00 */	li r3, 0
/* 801AAD24 001A7D24  38 80 00 00 */	li r4, 0
/* 801AAD28 001A7D28  38 A0 00 00 */	li r5, 0
/* 801AAD2C 001A7D2C  38 C0 00 00 */	li r6, 0
/* 801AAD30 001A7D30  38 E0 00 01 */	li r7, 1
/* 801AAD34 001A7D34  39 00 00 03 */	li r8, 3
/* 801AAD38 001A7D38  48 10 7F 15 */	bl GXSetTevAlphaOp
/* 801AAD3C 001A7D3C  38 60 00 00 */	li r3, 0
/* 801AAD40 001A7D40  38 80 00 0F */	li r4, 0xf
/* 801AAD44 001A7D44  38 A0 00 0F */	li r5, 0xf
/* 801AAD48 001A7D48  38 C0 00 0F */	li r6, 0xf
/* 801AAD4C 001A7D4C  38 E0 00 08 */	li r7, 8
/* 801AAD50 001A7D50  48 10 7E 0D */	bl GXSetTevColorIn
/* 801AAD54 001A7D54  38 60 00 00 */	li r3, 0
/* 801AAD58 001A7D58  38 80 00 07 */	li r4, 7
/* 801AAD5C 001A7D5C  38 A0 00 07 */	li r5, 7
/* 801AAD60 001A7D60  38 C0 00 07 */	li r6, 7
/* 801AAD64 001A7D64  38 E0 00 04 */	li r7, 4
/* 801AAD68 001A7D68  48 10 7E 39 */	bl GXSetTevAlphaIn
/* 801AAD6C 001A7D6C  38 60 00 01 */	li r3, 1
/* 801AAD70 001A7D70  38 80 00 01 */	li r4, 1
/* 801AAD74 001A7D74  38 A0 00 01 */	li r5, 1
/* 801AAD78 001A7D78  38 C0 00 FF */	li r6, 0xff
/* 801AAD7C 001A7D7C  48 10 82 B1 */	bl GXSetTevOrder
/* 801AAD80 001A7D80  38 60 00 01 */	li r3, 1
/* 801AAD84 001A7D84  38 80 00 00 */	li r4, 0
/* 801AAD88 001A7D88  38 A0 00 00 */	li r5, 0
/* 801AAD8C 001A7D8C  38 C0 00 00 */	li r6, 0
/* 801AAD90 001A7D90  38 E0 00 01 */	li r7, 1
/* 801AAD94 001A7D94  39 00 00 00 */	li r8, 0
/* 801AAD98 001A7D98  48 10 7E 4D */	bl GXSetTevColorOp
/* 801AAD9C 001A7D9C  38 60 00 01 */	li r3, 1
/* 801AADA0 001A7DA0  38 80 00 00 */	li r4, 0
/* 801AADA4 001A7DA4  38 A0 00 00 */	li r5, 0
/* 801AADA8 001A7DA8  38 C0 00 00 */	li r6, 0
/* 801AADAC 001A7DAC  38 E0 00 01 */	li r7, 1
/* 801AADB0 001A7DB0  39 00 00 00 */	li r8, 0
/* 801AADB4 001A7DB4  48 10 7E 99 */	bl GXSetTevAlphaOp
/* 801AADB8 001A7DB8  38 60 00 01 */	li r3, 1
/* 801AADBC 001A7DBC  38 80 00 06 */	li r4, 6
/* 801AADC0 001A7DC0  38 A0 00 08 */	li r5, 8
/* 801AADC4 001A7DC4  38 C0 00 05 */	li r6, 5
/* 801AADC8 001A7DC8  38 E0 00 0F */	li r7, 0xf
/* 801AADCC 001A7DCC  48 10 7D 91 */	bl GXSetTevColorIn
/* 801AADD0 001A7DD0  38 60 00 01 */	li r3, 1
/* 801AADD4 001A7DD4  38 80 00 03 */	li r4, 3
/* 801AADD8 001A7DD8  38 A0 00 04 */	li r5, 4
/* 801AADDC 001A7DDC  38 C0 00 02 */	li r6, 2
/* 801AADE0 001A7DE0  38 E0 00 07 */	li r7, 7
/* 801AADE4 001A7DE4  48 10 7D BD */	bl GXSetTevAlphaIn
/* 801AADE8 001A7DE8  38 60 00 02 */	li r3, 2
/* 801AADEC 001A7DEC  38 80 00 01 */	li r4, 1
/* 801AADF0 001A7DF0  38 A0 00 01 */	li r5, 1
/* 801AADF4 001A7DF4  38 C0 00 FF */	li r6, 0xff
/* 801AADF8 001A7DF8  48 10 82 35 */	bl GXSetTevOrder
/* 801AADFC 001A7DFC  38 60 00 02 */	li r3, 2
/* 801AAE00 001A7E00  38 80 00 00 */	li r4, 0
/* 801AAE04 001A7E04  38 A0 00 00 */	li r5, 0
/* 801AAE08 001A7E08  38 C0 00 00 */	li r6, 0
/* 801AAE0C 001A7E0C  38 E0 00 01 */	li r7, 1
/* 801AAE10 001A7E10  39 00 00 00 */	li r8, 0
/* 801AAE14 001A7E14  48 10 7D D1 */	bl GXSetTevColorOp
/* 801AAE18 001A7E18  38 60 00 02 */	li r3, 2
/* 801AAE1C 001A7E1C  38 80 00 00 */	li r4, 0
/* 801AAE20 001A7E20  38 A0 00 00 */	li r5, 0
/* 801AAE24 001A7E24  38 C0 00 00 */	li r6, 0
/* 801AAE28 001A7E28  38 E0 00 01 */	li r7, 1
/* 801AAE2C 001A7E2C  39 00 00 00 */	li r8, 0
/* 801AAE30 001A7E30  48 10 7E 1D */	bl GXSetTevAlphaOp
/* 801AAE34 001A7E34  38 60 00 02 */	li r3, 2
/* 801AAE38 001A7E38  38 80 00 02 */	li r4, 2
/* 801AAE3C 001A7E3C  38 A0 00 0C */	li r5, 0xc
/* 801AAE40 001A7E40  38 C0 00 00 */	li r6, 0
/* 801AAE44 001A7E44  38 E0 00 0F */	li r7, 0xf
/* 801AAE48 001A7E48  48 10 7D 15 */	bl GXSetTevColorIn
/* 801AAE4C 001A7E4C  38 60 00 02 */	li r3, 2
/* 801AAE50 001A7E50  38 80 00 07 */	li r4, 7
/* 801AAE54 001A7E54  38 A0 00 07 */	li r5, 7
/* 801AAE58 001A7E58  38 C0 00 07 */	li r6, 7
/* 801AAE5C 001A7E5C  38 E0 00 00 */	li r7, 0
/* 801AAE60 001A7E60  48 10 7D 41 */	bl GXSetTevAlphaIn
/* 801AAE64 001A7E64  38 81 00 18 */	addi r4, r1, 0x18
/* 801AAE68 001A7E68  38 60 00 35 */	li r3, 0x35
/* 801AAE6C 001A7E6C  48 02 69 D9 */	bl effGetTexObjN64
/* 801AAE70 001A7E70  38 61 00 18 */	addi r3, r1, 0x18
/* 801AAE74 001A7E74  38 80 00 00 */	li r4, 0
/* 801AAE78 001A7E78  48 10 6C 05 */	bl GXLoadTexObj
/* 801AAE7C 001A7E7C  38 61 00 18 */	addi r3, r1, 0x18
/* 801AAE80 001A7E80  38 80 00 01 */	li r4, 1
/* 801AAE84 001A7E84  48 10 6B F9 */	bl GXLoadTexObj
/* 801AAE88 001A7E88  38 60 00 02 */	li r3, 2
/* 801AAE8C 001A7E8C  48 10 43 F5 */	bl GXSetNumTexGens
/* 801AAE90 001A7E90  38 60 00 00 */	li r3, 0
/* 801AAE94 001A7E94  38 80 00 01 */	li r4, 1
/* 801AAE98 001A7E98  38 A0 00 04 */	li r5, 4
/* 801AAE9C 001A7E9C  38 C0 00 1E */	li r6, 0x1e
/* 801AAEA0 001A7EA0  38 E0 00 00 */	li r7, 0
/* 801AAEA4 001A7EA4  39 00 00 7D */	li r8, 0x7d
/* 801AAEA8 001A7EA8  48 10 41 59 */	bl GXSetTexCoordGen2
/* 801AAEAC 001A7EAC  38 60 00 01 */	li r3, 1
/* 801AAEB0 001A7EB0  38 80 00 01 */	li r4, 1
/* 801AAEB4 001A7EB4  38 A0 00 04 */	li r5, 4
/* 801AAEB8 001A7EB8  38 C0 00 21 */	li r6, 0x21
/* 801AAEBC 001A7EBC  38 E0 00 00 */	li r7, 0
/* 801AAEC0 001A7EC0  39 00 00 7D */	li r8, 0x7d
/* 801AAEC4 001A7EC4  48 10 41 3D */	bl GXSetTexCoordGen2
/* 801AAEC8 001A7EC8  C0 22 D6 B0 */	lfs f1, lbl_8041EA30@sda21(r2)
/* 801AAECC 001A7ECC  38 61 00 68 */	addi r3, r1, 0x68
/* 801AAED0 001A7ED0  C0 42 D6 B4 */	lfs f2, lbl_8041EA34@sda21(r2)
/* 801AAED4 001A7ED4  C0 62 D6 B8 */	lfs f3, lbl_8041EA38@sda21(r2)
/* 801AAED8 001A7ED8  48 0E D5 D5 */	bl PSMTXScale
/* 801AAEDC 001A7EDC  6F 83 80 00 */	xoris r3, r28, 0x8000
/* 801AAEE0 001A7EE0  3C 00 43 30 */	lis r0, 0x4330
/* 801AAEE4 001A7EE4  90 61 00 E4 */	stw r3, 0xe4(r1)
/* 801AAEE8 001A7EE8  3C 80 80 30 */	lis r4, lbl_802FA2C0@ha
/* 801AAEEC 001A7EEC  C0 22 D6 B8 */	lfs f1, lbl_8041EA38@sda21(r2)
/* 801AAEF0 001A7EF0  38 61 00 98 */	addi r3, r1, 0x98
/* 801AAEF4 001A7EF4  90 01 00 E0 */	stw r0, 0xe0(r1)
/* 801AAEF8 001A7EF8  C8 44 A2 C0 */	lfd f2, lbl_802FA2C0@l(r4)
/* 801AAEFC 001A7EFC  FC 60 08 90 */	fmr f3, f1
/* 801AAF00 001A7F00  C8 01 00 E0 */	lfd f0, 0xe0(r1)
/* 801AAF04 001A7F04  C0 82 D6 BC */	lfs f4, lbl_8041EA3C@sda21(r2)
/* 801AAF08 001A7F08  EC 00 10 28 */	fsubs f0, f0, f2
/* 801AAF0C 001A7F0C  EC 44 00 32 */	fmuls f2, f4, f0
/* 801AAF10 001A7F10  48 0E D5 1D */	bl PSMTXTrans
/* 801AAF14 001A7F14  38 81 00 98 */	addi r4, r1, 0x98
/* 801AAF18 001A7F18  38 61 00 68 */	addi r3, r1, 0x68
/* 801AAF1C 001A7F1C  7C 85 23 78 */	mr r5, r4
/* 801AAF20 001A7F20  48 0E D0 41 */	bl PSMTXConcat
/* 801AAF24 001A7F24  38 61 00 98 */	addi r3, r1, 0x98
/* 801AAF28 001A7F28  38 80 00 1E */	li r4, 0x1e
/* 801AAF2C 001A7F2C  38 A0 00 01 */	li r5, 1
/* 801AAF30 001A7F30  48 10 96 9D */	bl GXLoadTexMtxImm
/* 801AAF34 001A7F34  38 1C 00 01 */	addi r0, r28, 1
/* 801AAF38 001A7F38  C0 22 D6 B8 */	lfs f1, lbl_8041EA38@sda21(r2)
/* 801AAF3C 001A7F3C  2C 00 00 08 */	cmpwi r0, 8
/* 801AAF40 001A7F40  C0 82 D6 BC */	lfs f4, lbl_8041EA3C@sda21(r2)
/* 801AAF44 001A7F44  38 61 00 98 */	addi r3, r1, 0x98
/* 801AAF48 001A7F48  38 80 00 08 */	li r4, 8
/* 801AAF4C 001A7F4C  40 80 00 08 */	bge .L_801AAF54
/* 801AAF50 001A7F50  7C 04 03 78 */	mr r4, r0
.L_801AAF54:
/* 801AAF54 001A7F54  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 801AAF58 001A7F58  3C 00 43 30 */	lis r0, 0x4330
/* 801AAF5C 001A7F5C  90 81 00 EC */	stw r4, 0xec(r1)
/* 801AAF60 001A7F60  3C A0 80 30 */	lis r5, lbl_802FA2C0@ha
/* 801AAF64 001A7F64  C8 45 A2 C0 */	lfd f2, lbl_802FA2C0@l(r5)
/* 801AAF68 001A7F68  90 01 00 E8 */	stw r0, 0xe8(r1)
/* 801AAF6C 001A7F6C  C0 62 D6 B8 */	lfs f3, lbl_8041EA38@sda21(r2)
/* 801AAF70 001A7F70  C8 01 00 E8 */	lfd f0, 0xe8(r1)
/* 801AAF74 001A7F74  EC 00 10 28 */	fsubs f0, f0, f2
/* 801AAF78 001A7F78  EC 44 00 32 */	fmuls f2, f4, f0
/* 801AAF7C 001A7F7C  48 0E D4 B1 */	bl PSMTXTrans
/* 801AAF80 001A7F80  38 81 00 98 */	addi r4, r1, 0x98
/* 801AAF84 001A7F84  38 61 00 68 */	addi r3, r1, 0x68
/* 801AAF88 001A7F88  7C 85 23 78 */	mr r5, r4
/* 801AAF8C 001A7F8C  48 0E CF D5 */	bl PSMTXConcat
/* 801AAF90 001A7F90  38 61 00 98 */	addi r3, r1, 0x98
/* 801AAF94 001A7F94  38 80 00 21 */	li r4, 0x21
/* 801AAF98 001A7F98  38 A0 00 01 */	li r5, 1
/* 801AAF9C 001A7F9C  48 10 96 31 */	bl GXLoadTexMtxImm
/* 801AAFA0 001A7FA0  38 60 00 00 */	li r3, 0
/* 801AAFA4 001A7FA4  48 10 4E E5 */	bl GXSetCullMode
/* 801AAFA8 001A7FA8  3C 60 80 3A */	lis r3, lbl_8039A9A8@ha
/* 801AAFAC 001A7FAC  38 63 A9 A8 */	addi r3, r3, lbl_8039A9A8@l
/* 801AAFB0 001A7FB0  48 02 67 01 */	bl effSetVtxDescN64
/* 801AAFB4 001A7FB4  C0 3E 00 04 */	lfs f1, 4(r30)
/* 801AAFB8 001A7FB8  38 61 00 98 */	addi r3, r1, 0x98
/* 801AAFBC 001A7FBC  C0 5E 00 08 */	lfs f2, 8(r30)
/* 801AAFC0 001A7FC0  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 801AAFC4 001A7FC4  48 0E D4 69 */	bl PSMTXTrans
/* 801AAFC8 001A7FC8  38 60 00 04 */	li r3, 4
/* 801AAFCC 001A7FCC  4B E6 41 85 */	bl camGetPtr
/* 801AAFD0 001A7FD0  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 801AAFD4 001A7FD4  38 61 00 38 */	addi r3, r1, 0x38
/* 801AAFD8 001A7FD8  C0 02 D6 C0 */	lfs f0, lbl_8041EA40@sda21(r2)
/* 801AAFDC 001A7FDC  38 80 00 79 */	li r4, 0x79
/* 801AAFE0 001A7FE0  FC 20 08 50 */	fneg f1, f1
/* 801AAFE4 001A7FE4  EC 20 00 72 */	fmuls f1, f0, f1
/* 801AAFE8 001A7FE8  48 0E D2 05 */	bl PSMTXRotRad
/* 801AAFEC 001A7FEC  C0 3E 00 10 */	lfs f1, 0x10(r30)
/* 801AAFF0 001A7FF0  38 61 00 68 */	addi r3, r1, 0x68
/* 801AAFF4 001A7FF4  C0 62 D6 C4 */	lfs f3, lbl_8041EA44@sda21(r2)
/* 801AAFF8 001A7FF8  FC 40 08 90 */	fmr f2, f1
/* 801AAFFC 001A7FFC  48 0E D4 B1 */	bl PSMTXScale
/* 801AB000 001A8000  38 61 00 98 */	addi r3, r1, 0x98
/* 801AB004 001A8004  38 81 00 38 */	addi r4, r1, 0x38
/* 801AB008 001A8008  7C 65 1B 78 */	mr r5, r3
/* 801AB00C 001A800C  48 0E CF 55 */	bl PSMTXConcat
/* 801AB010 001A8010  38 61 00 98 */	addi r3, r1, 0x98
/* 801AB014 001A8014  38 81 00 68 */	addi r4, r1, 0x68
/* 801AB018 001A8018  7C 65 1B 78 */	mr r5, r3
/* 801AB01C 001A801C  48 0E CF 45 */	bl PSMTXConcat
/* 801AB020 001A8020  C0 22 D6 C0 */	lfs f1, lbl_8041EA40@sda21(r2)
/* 801AB024 001A8024  38 61 00 38 */	addi r3, r1, 0x38
/* 801AB028 001A8028  C0 1E 00 24 */	lfs f0, 0x24(r30)
/* 801AB02C 001A802C  38 80 00 7A */	li r4, 0x7a
/* 801AB030 001A8030  EC 21 00 32 */	fmuls f1, f1, f0
/* 801AB034 001A8034  48 0E D1 B9 */	bl PSMTXRotRad
/* 801AB038 001A8038  38 61 00 98 */	addi r3, r1, 0x98
/* 801AB03C 001A803C  38 81 00 38 */	addi r4, r1, 0x38
/* 801AB040 001A8040  7C 65 1B 78 */	mr r5, r3
/* 801AB044 001A8044  48 0E CF 1D */	bl PSMTXConcat
/* 801AB048 001A8048  38 81 00 98 */	addi r4, r1, 0x98
/* 801AB04C 001A804C  38 7F 01 1C */	addi r3, r31, 0x11c
/* 801AB050 001A8050  7C 85 23 78 */	mr r5, r4
/* 801AB054 001A8054  48 0E CF 0D */	bl PSMTXConcat
/* 801AB058 001A8058  38 61 00 98 */	addi r3, r1, 0x98
/* 801AB05C 001A805C  38 80 00 00 */	li r4, 0
/* 801AB060 001A8060  48 10 94 99 */	bl GXLoadPosMtxImm
/* 801AB064 001A8064  38 60 00 00 */	li r3, 0
/* 801AB068 001A8068  48 10 95 31 */	bl GXSetCurrentMtx
/* 801AB06C 001A806C  C0 3E 00 20 */	lfs f1, 0x20(r30)
/* 801AB070 001A8070  C0 02 D6 C8 */	lfs f0, lbl_8041EA48@sda21(r2)
/* 801AB074 001A8074  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 801AB078 001A8078  40 81 00 1C */	ble .L_801AB094
/* 801AB07C 001A807C  80 02 D6 A0 */	lwz r0, lbl_8041EA20@sda21(r2)
/* 801AB080 001A8080  38 81 00 14 */	addi r4, r1, 0x14
/* 801AB084 001A8084  38 60 00 01 */	li r3, 1
/* 801AB088 001A8088  90 01 00 14 */	stw r0, 0x14(r1)
/* 801AB08C 001A808C  48 10 7C 29 */	bl GXSetTevColor
/* 801AB090 001A8090  48 00 00 18 */	b .L_801AB0A8
.L_801AB094:
/* 801AB094 001A8094  80 02 D6 A4 */	lwz r0, lbl_8041EA24@sda21(r2)
/* 801AB098 001A8098  38 81 00 10 */	addi r4, r1, 0x10
/* 801AB09C 001A809C  38 60 00 01 */	li r3, 1
/* 801AB0A0 001A80A0  90 01 00 10 */	stw r0, 0x10(r1)
/* 801AB0A4 001A80A4  48 10 7C 11 */	bl GXSetTevColor
.L_801AB0A8:
/* 801AB0A8 001A80A8  80 02 D6 A8 */	lwz r0, lbl_8041EA28@sda21(r2)
/* 801AB0AC 001A80AC  38 81 00 0C */	addi r4, r1, 0xc
/* 801AB0B0 001A80B0  38 60 00 02 */	li r3, 2
/* 801AB0B4 001A80B4  90 01 00 08 */	stw r0, 8(r1)
/* 801AB0B8 001A80B8  9B A1 00 0B */	stb r29, 0xb(r1)
/* 801AB0BC 001A80BC  80 01 00 08 */	lwz r0, 8(r1)
/* 801AB0C0 001A80C0  90 01 00 0C */	stw r0, 0xc(r1)
/* 801AB0C4 001A80C4  48 10 7B F1 */	bl GXSetTevColor
/* 801AB0C8 001A80C8  38 60 00 90 */	li r3, 0x90
/* 801AB0CC 001A80CC  38 80 00 00 */	li r4, 0
/* 801AB0D0 001A80D0  38 A0 00 06 */	li r5, 6
/* 801AB0D4 001A80D4  48 10 4B 95 */	bl GXBegin
/* 801AB0D8 001A80D8  38 60 00 00 */	li r3, 0
/* 801AB0DC 001A80DC  38 80 00 01 */	li r4, 1
/* 801AB0E0 001A80E0  38 A0 00 02 */	li r5, 2
/* 801AB0E4 001A80E4  38 C0 00 00 */	li r6, 0
/* 801AB0E8 001A80E8  38 E0 00 00 */	li r7, 0
/* 801AB0EC 001A80EC  39 00 00 02 */	li r8, 2
/* 801AB0F0 001A80F0  39 20 00 03 */	li r9, 3
/* 801AB0F4 001A80F4  39 40 00 00 */	li r10, 0
/* 801AB0F8 001A80F8  48 02 65 3D */	bl tri2
/* 801AB0FC 001A80FC  80 01 01 04 */	lwz r0, 0x104(r1)
/* 801AB100 001A8100  83 E1 00 FC */	lwz r31, 0xfc(r1)
/* 801AB104 001A8104  83 C1 00 F8 */	lwz r30, 0xf8(r1)
/* 801AB108 001A8108  83 A1 00 F4 */	lwz r29, 0xf4(r1)
/* 801AB10C 001A810C  83 81 00 F0 */	lwz r28, 0xf0(r1)
/* 801AB110 001A8110  7C 08 03 A6 */	mtlr r0
/* 801AB114 001A8114  38 21 01 00 */	addi r1, r1, 0x100
/* 801AB118 001A8118  4E 80 00 20 */	blr 
effBomheiMain:
/* 801AB11C 001A811C  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 801AB120 001A8120  7C 08 02 A6 */	mflr r0
/* 801AB124 001A8124  3C 80 43 30 */	lis r4, 0x4330
/* 801AB128 001A8128  3C A0 80 30 */	lis r5, lbl_802FA2B0@ha
/* 801AB12C 001A812C  90 01 00 44 */	stw r0, 0x44(r1)
/* 801AB130 001A8130  39 05 A2 B0 */	addi r8, r5, lbl_802FA2B0@l
/* 801AB134 001A8134  3C A0 80 30 */	lis r5, lbl_802FA2C0@ha
/* 801AB138 001A8138  C0 62 D6 CC */	lfs f3, lbl_8041EA4C@sda21(r2)
/* 801AB13C 001A813C  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 801AB140 001A8140  7C 7F 1B 78 */	mr r31, r3
/* 801AB144 001A8144  C8 45 A2 C0 */	lfd f2, lbl_802FA2C0@l(r5)
/* 801AB148 001A8148  81 23 00 0C */	lwz r9, 0xc(r3)
/* 801AB14C 001A814C  80 E8 00 00 */	lwz r7, 0(r8)
/* 801AB150 001A8150  80 C8 00 04 */	lwz r6, 4(r8)
/* 801AB154 001A8154  80 08 00 08 */	lwz r0, 8(r8)
/* 801AB158 001A8158  90 E1 00 08 */	stw r7, 8(r1)
/* 801AB15C 001A815C  C0 09 00 04 */	lfs f0, 4(r9)
/* 801AB160 001A8160  90 C1 00 0C */	stw r6, 0xc(r1)
/* 801AB164 001A8164  C0 29 00 08 */	lfs f1, 8(r9)
/* 801AB168 001A8168  D0 01 00 08 */	stfs f0, 8(r1)
/* 801AB16C 001A816C  C0 09 00 0C */	lfs f0, 0xc(r9)
/* 801AB170 001A8170  90 01 00 10 */	stw r0, 0x10(r1)
/* 801AB174 001A8174  80 C1 00 08 */	lwz r6, 8(r1)
/* 801AB178 001A8178  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801AB17C 001A817C  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801AB180 001A8180  80 A1 00 0C */	lwz r5, 0xc(r1)
/* 801AB184 001A8184  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801AB188 001A8188  90 C1 00 14 */	stw r6, 0x14(r1)
/* 801AB18C 001A818C  90 A1 00 18 */	stw r5, 0x18(r1)
/* 801AB190 001A8190  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801AB194 001A8194  80 A9 00 18 */	lwz r5, 0x18(r9)
/* 801AB198 001A8198  80 09 00 1C */	lwz r0, 0x1c(r9)
/* 801AB19C 001A819C  6C A5 80 00 */	xoris r5, r5, 0x8000
/* 801AB1A0 001A81A0  90 81 00 20 */	stw r4, 0x20(r1)
/* 801AB1A4 001A81A4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801AB1A8 001A81A8  90 A1 00 24 */	stw r5, 0x24(r1)
/* 801AB1AC 001A81AC  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801AB1B0 001A81B0  90 01 00 2C */	stw r0, 0x2c(r1)
/* 801AB1B4 001A81B4  EC 20 10 28 */	fsubs f1, f0, f2
/* 801AB1B8 001A81B8  90 81 00 28 */	stw r4, 0x28(r1)
/* 801AB1BC 001A81BC  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 801AB1C0 001A81C0  EC 23 00 72 */	fmuls f1, f3, f1
/* 801AB1C4 001A81C4  EC 00 10 28 */	fsubs f0, f0, f2
/* 801AB1C8 001A81C8  EC 01 00 24 */	fdivs f0, f1, f0
/* 801AB1CC 001A81CC  D0 09 00 20 */	stfs f0, 0x20(r9)
/* 801AB1D0 001A81D0  80 89 00 18 */	lwz r4, 0x18(r9)
/* 801AB1D4 001A81D4  38 04 00 01 */	addi r0, r4, 1
/* 801AB1D8 001A81D8  90 09 00 18 */	stw r0, 0x18(r9)
/* 801AB1DC 001A81DC  80 89 00 14 */	lwz r4, 0x14(r9)
/* 801AB1E0 001A81E0  38 04 FF FF */	addi r0, r4, -1
/* 801AB1E4 001A81E4  90 09 00 14 */	stw r0, 0x14(r9)
/* 801AB1E8 001A81E8  80 09 00 14 */	lwz r0, 0x14(r9)
/* 801AB1EC 001A81EC  2C 00 00 00 */	cmpwi r0, 0
/* 801AB1F0 001A81F0  40 80 00 0C */	bge .L_801AB1FC
/* 801AB1F4 001A81F4  4B EB 29 91 */	bl effDelete
/* 801AB1F8 001A81F8  48 00 00 34 */	b .L_801AB22C
.L_801AB1FC:
/* 801AB1FC 001A81FC  C0 29 00 24 */	lfs f1, 0x24(r9)
/* 801AB200 001A8200  38 61 00 14 */	addi r3, r1, 0x14
/* 801AB204 001A8204  C0 09 00 28 */	lfs f0, 0x28(r9)
/* 801AB208 001A8208  EC 01 00 2A */	fadds f0, f1, f0
/* 801AB20C 001A820C  D0 09 00 24 */	stfs f0, 0x24(r9)
/* 801AB210 001A8210  4B E6 54 B1 */	bl dispCalcZ
/* 801AB214 001A8214  3C 60 80 1B */	lis r3, effBomheiDisp@ha
/* 801AB218 001A8218  7F E6 FB 78 */	mr r6, r31
/* 801AB21C 001A821C  38 A3 AC 6C */	addi r5, r3, effBomheiDisp@l
/* 801AB220 001A8220  38 80 00 02 */	li r4, 2
/* 801AB224 001A8224  38 60 00 04 */	li r3, 4
/* 801AB228 001A8228  4B E6 57 F1 */	bl dispEntry
.L_801AB22C:
/* 801AB22C 001A822C  80 01 00 44 */	lwz r0, 0x44(r1)
/* 801AB230 001A8230  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 801AB234 001A8234  7C 08 03 A6 */	mtlr r0
/* 801AB238 001A8238  38 21 00 40 */	addi r1, r1, 0x40
/* 801AB23C 001A823C  4E 80 00 20 */	blr 

.global effBomheiN64Entry
effBomheiN64Entry:
/* 801AB240 001A8240  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 801AB244 001A8244  7C 08 02 A6 */	mflr r0
/* 801AB248 001A8248  90 01 00 64 */	stw r0, 0x64(r1)
/* 801AB24C 001A824C  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 801AB250 001A8250  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 801AB254 001A8254  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 801AB258 001A8258  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 801AB25C 001A825C  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 801AB260 001A8260  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 801AB264 001A8264  DB 81 00 20 */	stfd f28, 0x20(r1)
/* 801AB268 001A8268  F3 81 00 28 */	psq_st f28, 40(r1), 0, qr0
/* 801AB26C 001A826C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801AB270 001A8270  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801AB274 001A8274  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801AB278 001A8278  FF 80 08 90 */	fmr f28, f1
/* 801AB27C 001A827C  7C 7D 1B 78 */	mr r29, r3
/* 801AB280 001A8280  FF A0 10 90 */	fmr f29, f2
/* 801AB284 001A8284  7C 9E 23 78 */	mr r30, r4
/* 801AB288 001A8288  FF C0 18 90 */	fmr f30, f3
/* 801AB28C 001A828C  FF E0 20 90 */	fmr f31, f4
/* 801AB290 001A8290  4B EB 2B 2D */	bl effEntry
/* 801AB294 001A8294  3C 80 80 30 */	lis r4, lbl_802FA2C8@ha
/* 801AB298 001A8298  7C 7F 1B 78 */	mr r31, r3
/* 801AB29C 001A829C  38 84 A2 C8 */	addi r4, r4, lbl_802FA2C8@l
/* 801AB2A0 001A82A0  38 00 00 01 */	li r0, 1
/* 801AB2A4 001A82A4  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801AB2A8 001A82A8  38 60 00 03 */	li r3, 3
/* 801AB2AC 001A82AC  38 80 00 2C */	li r4, 0x2c
/* 801AB2B0 001A82B0  90 1F 00 08 */	stw r0, 8(r31)
/* 801AB2B4 001A82B4  4B E8 47 D9 */	bl __memAlloc
/* 801AB2B8 001A82B8  3C 80 80 1B */	lis r4, effBomheiMain@ha
/* 801AB2BC 001A82BC  90 7F 00 0C */	stw r3, 0xc(r31)
/* 801AB2C0 001A82C0  38 84 B1 1C */	addi r4, r4, effBomheiMain@l
/* 801AB2C4 001A82C4  38 00 00 00 */	li r0, 0
/* 801AB2C8 001A82C8  90 9F 00 10 */	stw r4, 0x10(r31)
/* 801AB2CC 001A82CC  2C 1D 00 00 */	cmpwi r29, 0
/* 801AB2D0 001A82D0  C0 02 D6 B8 */	lfs f0, lbl_8041EA38@sda21(r2)
/* 801AB2D4 001A82D4  93 C3 00 14 */	stw r30, 0x14(r3)
/* 801AB2D8 001A82D8  90 03 00 18 */	stw r0, 0x18(r3)
/* 801AB2DC 001A82DC  93 C3 00 1C */	stw r30, 0x1c(r3)
/* 801AB2E0 001A82E0  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 801AB2E4 001A82E4  B3 A3 00 00 */	sth r29, 0(r3)
/* 801AB2E8 001A82E8  D3 83 00 04 */	stfs f28, 4(r3)
/* 801AB2EC 001A82EC  D3 A3 00 08 */	stfs f29, 8(r3)
/* 801AB2F0 001A82F0  D3 C3 00 0C */	stfs f30, 0xc(r3)
/* 801AB2F4 001A82F4  D3 E3 00 10 */	stfs f31, 0x10(r3)
/* 801AB2F8 001A82F8  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 801AB2FC 001A82FC  40 82 00 0C */	bne .L_801AB308
/* 801AB300 001A8300  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 801AB304 001A8304  48 00 00 0C */	b .L_801AB310
.L_801AB308:
/* 801AB308 001A8308  C0 02 D6 D0 */	lfs f0, lbl_8041EA50@sda21(r2)
/* 801AB30C 001A830C  D0 03 00 28 */	stfs f0, 0x28(r3)
.L_801AB310:
/* 801AB310 001A8310  7F E3 FB 78 */	mr r3, r31
/* 801AB314 001A8314  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 801AB318 001A8318  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 801AB31C 001A831C  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 801AB320 001A8320  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 801AB324 001A8324  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 801AB328 001A8328  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 801AB32C 001A832C  E3 81 00 28 */	psq_l f28, 40(r1), 0, qr0
/* 801AB330 001A8330  CB 81 00 20 */	lfd f28, 0x20(r1)
/* 801AB334 001A8334  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801AB338 001A8338  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801AB33C 001A833C  80 01 00 64 */	lwz r0, 0x64(r1)
/* 801AB340 001A8340  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801AB344 001A8344  7C 08 03 A6 */	mtlr r0
/* 801AB348 001A8348  38 21 00 60 */	addi r1, r1, 0x60
/* 801AB34C 001A834C  4E 80 00 20 */	blr 
