.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effUpdownDisp
effUpdownDisp:
/* 8018DB2C 0018AB2C  94 21 FE A0 */	stwu r1, -0x160(r1)
/* 8018DB30 0018AB30  7C 08 02 A6 */	mflr r0
/* 8018DB34 0018AB34  90 01 01 64 */	stw r0, 0x164(r1)
/* 8018DB38 0018AB38  BF 41 01 48 */	stmw r26, 0x148(r1)
/* 8018DB3C 0018AB3C  7C 7A 1B 78 */	mr r26, r3
/* 8018DB40 0018AB40  83 A4 00 0C */	lwz r29, 0xc(r4)
/* 8018DB44 0018AB44  4B E8 16 0D */	bl camGetPtr
/* 8018DB48 0018AB48  83 9D 00 18 */	lwz r28, 0x18(r29)
/* 8018DB4C 0018AB4C  7C 7E 1B 78 */	mr r30, r3
/* 8018DB50 0018AB50  83 7D 00 00 */	lwz r27, 0(r29)
/* 8018DB54 0018AB54  38 81 00 08 */	addi r4, r1, 8
/* 8018DB58 0018AB58  8B FD 00 24 */	lbz r31, 0x24(r29)
/* 8018DB5C 0018AB5C  38 60 00 1D */	li r3, 0x1d
/* 8018DB60 0018AB60  4B ED 03 4D */	bl effGetTexObj
/* 8018DB64 0018AB64  38 61 00 08 */	addi r3, r1, 8
/* 8018DB68 0018AB68  38 80 00 00 */	li r4, 0
/* 8018DB6C 0018AB6C  48 12 3F 11 */	bl GXLoadTexObj
/* 8018DB70 0018AB70  38 60 00 01 */	li r3, 1
/* 8018DB74 0018AB74  48 12 35 C5 */	bl GXSetNumChans
/* 8018DB78 0018AB78  38 60 00 04 */	li r3, 4
/* 8018DB7C 0018AB7C  38 80 00 00 */	li r4, 0
/* 8018DB80 0018AB80  38 A0 00 00 */	li r5, 0
/* 8018DB84 0018AB84  38 C0 00 01 */	li r6, 1
/* 8018DB88 0018AB88  38 E0 00 00 */	li r7, 0
/* 8018DB8C 0018AB8C  39 00 00 00 */	li r8, 0
/* 8018DB90 0018AB90  39 20 00 02 */	li r9, 2
/* 8018DB94 0018AB94  48 12 35 E1 */	bl GXSetChanCtrl
/* 8018DB98 0018AB98  38 60 00 01 */	li r3, 1
/* 8018DB9C 0018AB9C  48 12 16 E5 */	bl GXSetNumTexGens
/* 8018DBA0 0018ABA0  38 60 00 00 */	li r3, 0
/* 8018DBA4 0018ABA4  38 80 00 01 */	li r4, 1
/* 8018DBA8 0018ABA8  38 A0 00 04 */	li r5, 4
/* 8018DBAC 0018ABAC  38 C0 00 1E */	li r6, 0x1e
/* 8018DBB0 0018ABB0  38 E0 00 00 */	li r7, 0
/* 8018DBB4 0018ABB4  39 00 00 7D */	li r8, 0x7d
/* 8018DBB8 0018ABB8  48 12 14 49 */	bl GXSetTexCoordGen2
/* 8018DBBC 0018ABBC  2C 1C 00 00 */	cmpwi r28, 0
/* 8018DBC0 0018ABC0  40 80 00 18 */	bge lbl_8018DBD8
/* 8018DBC4 0018ABC4  C0 22 CF 30 */	lfs f1, lbl_8041E2B0@sda21(r2)
/* 8018DBC8 0018ABC8  38 61 00 E8 */	addi r3, r1, 0xe8
/* 8018DBCC 0018ABCC  38 80 00 7A */	li r4, 0x7a
/* 8018DBD0 0018ABD0  48 10 A6 1D */	bl PSMTXRotRad
/* 8018DBD4 0018ABD4  48 00 00 0C */	b lbl_8018DBE0
lbl_8018DBD8:
/* 8018DBD8 0018ABD8  38 61 00 E8 */	addi r3, r1, 0xe8
/* 8018DBDC 0018ABDC  48 10 A3 25 */	bl PSMTXIdentity
lbl_8018DBE0:
/* 8018DBE0 0018ABE0  38 61 00 E8 */	addi r3, r1, 0xe8
/* 8018DBE4 0018ABE4  38 80 00 1E */	li r4, 0x1e
/* 8018DBE8 0018ABE8  38 A0 00 01 */	li r5, 1
/* 8018DBEC 0018ABEC  48 12 69 E1 */	bl GXLoadTexMtxImm
/* 8018DBF0 0018ABF0  38 60 00 01 */	li r3, 1
/* 8018DBF4 0018ABF4  48 12 55 D5 */	bl GXSetNumTevStages
/* 8018DBF8 0018ABF8  38 60 00 00 */	li r3, 0
/* 8018DBFC 0018ABFC  38 80 00 00 */	li r4, 0
/* 8018DC00 0018AC00  38 A0 00 00 */	li r5, 0
/* 8018DC04 0018AC04  38 C0 00 04 */	li r6, 4
/* 8018DC08 0018AC08  48 12 54 25 */	bl GXSetTevOrder
/* 8018DC0C 0018AC0C  38 60 00 00 */	li r3, 0
/* 8018DC10 0018AC10  38 80 00 00 */	li r4, 0
/* 8018DC14 0018AC14  48 12 4E BD */	bl GXSetTevOp
/* 8018DC18 0018AC18  38 60 00 00 */	li r3, 0
/* 8018DC1C 0018AC1C  48 12 22 6D */	bl GXSetCullMode
/* 8018DC20 0018AC20  48 12 0A FD */	bl GXClearVtxDesc
/* 8018DC24 0018AC24  38 60 00 09 */	li r3, 9
/* 8018DC28 0018AC28  38 80 00 01 */	li r4, 1
/* 8018DC2C 0018AC2C  48 12 01 D9 */	bl GXSetVtxDesc
/* 8018DC30 0018AC30  38 60 00 0B */	li r3, 0xb
/* 8018DC34 0018AC34  38 80 00 01 */	li r4, 1
/* 8018DC38 0018AC38  48 12 01 CD */	bl GXSetVtxDesc
/* 8018DC3C 0018AC3C  38 60 00 0D */	li r3, 0xd
/* 8018DC40 0018AC40  38 80 00 01 */	li r4, 1
/* 8018DC44 0018AC44  48 12 01 C1 */	bl GXSetVtxDesc
/* 8018DC48 0018AC48  38 60 00 00 */	li r3, 0
/* 8018DC4C 0018AC4C  38 80 00 09 */	li r4, 9
/* 8018DC50 0018AC50  38 A0 00 01 */	li r5, 1
/* 8018DC54 0018AC54  38 C0 00 04 */	li r6, 4
/* 8018DC58 0018AC58  38 E0 00 00 */	li r7, 0
/* 8018DC5C 0018AC5C  48 12 0A F9 */	bl GXSetVtxAttrFmt
/* 8018DC60 0018AC60  38 60 00 00 */	li r3, 0
/* 8018DC64 0018AC64  38 80 00 0B */	li r4, 0xb
/* 8018DC68 0018AC68  38 A0 00 01 */	li r5, 1
/* 8018DC6C 0018AC6C  38 C0 00 05 */	li r6, 5
/* 8018DC70 0018AC70  38 E0 00 00 */	li r7, 0
/* 8018DC74 0018AC74  48 12 0A E1 */	bl GXSetVtxAttrFmt
/* 8018DC78 0018AC78  38 60 00 00 */	li r3, 0
/* 8018DC7C 0018AC7C  38 80 00 0D */	li r4, 0xd
/* 8018DC80 0018AC80  38 A0 00 01 */	li r5, 1
/* 8018DC84 0018AC84  38 C0 00 04 */	li r6, 4
/* 8018DC88 0018AC88  38 E0 00 00 */	li r7, 0
/* 8018DC8C 0018AC8C  48 12 0A C9 */	bl GXSetVtxAttrFmt
/* 8018DC90 0018AC90  C0 3D 00 04 */	lfs f1, 4(r29)
/* 8018DC94 0018AC94  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DC98 0018AC98  C0 5D 00 08 */	lfs f2, 8(r29)
/* 8018DC9C 0018AC9C  C0 7D 00 0C */	lfs f3, 0xc(r29)
/* 8018DCA0 0018ACA0  48 10 A7 8D */	bl PSMTXTrans
/* 8018DCA4 0018ACA4  C0 3D 00 10 */	lfs f1, 0x10(r29)
/* 8018DCA8 0018ACA8  38 61 00 B8 */	addi r3, r1, 0xb8
/* 8018DCAC 0018ACAC  C0 5D 00 14 */	lfs f2, 0x14(r29)
/* 8018DCB0 0018ACB0  C0 62 CF 34 */	lfs f3, lbl_8041E2B4@sda21(r2)
/* 8018DCB4 0018ACB4  48 10 A7 F9 */	bl PSMTXScale
/* 8018DCB8 0018ACB8  7F 43 D3 78 */	mr r3, r26
/* 8018DCBC 0018ACBC  4B E8 14 95 */	bl camGetPtr
/* 8018DCC0 0018ACC0  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8018DCC4 0018ACC4  38 61 00 E8 */	addi r3, r1, 0xe8
/* 8018DCC8 0018ACC8  C0 02 CF 38 */	lfs f0, lbl_8041E2B8@sda21(r2)
/* 8018DCCC 0018ACCC  38 80 00 79 */	li r4, 0x79
/* 8018DCD0 0018ACD0  FC 20 08 50 */	fneg f1, f1
/* 8018DCD4 0018ACD4  EC 20 00 72 */	fmuls f1, f0, f1
/* 8018DCD8 0018ACD8  48 10 A5 15 */	bl PSMTXRotRad
/* 8018DCDC 0018ACDC  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DCE0 0018ACE0  38 81 00 B8 */	addi r4, r1, 0xb8
/* 8018DCE4 0018ACE4  38 A1 00 88 */	addi r5, r1, 0x88
/* 8018DCE8 0018ACE8  48 10 A2 79 */	bl PSMTXConcat
/* 8018DCEC 0018ACEC  38 61 00 88 */	addi r3, r1, 0x88
/* 8018DCF0 0018ACF0  38 81 00 E8 */	addi r4, r1, 0xe8
/* 8018DCF4 0018ACF4  38 A1 00 58 */	addi r5, r1, 0x58
/* 8018DCF8 0018ACF8  48 10 A2 69 */	bl PSMTXConcat
/* 8018DCFC 0018ACFC  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DD00 0018AD00  38 81 00 E8 */	addi r4, r1, 0xe8
/* 8018DD04 0018AD04  38 A1 00 28 */	addi r5, r1, 0x28
/* 8018DD08 0018AD08  48 10 A2 59 */	bl PSMTXConcat
/* 8018DD0C 0018AD0C  38 7E 01 1C */	addi r3, r30, 0x11c
/* 8018DD10 0018AD10  38 81 00 58 */	addi r4, r1, 0x58
/* 8018DD14 0018AD14  38 A1 00 88 */	addi r5, r1, 0x88
/* 8018DD18 0018AD18  48 10 A2 49 */	bl PSMTXConcat
/* 8018DD1C 0018AD1C  38 61 00 88 */	addi r3, r1, 0x88
/* 8018DD20 0018AD20  38 80 00 00 */	li r4, 0
/* 8018DD24 0018AD24  48 12 67 D5 */	bl GXLoadPosMtxImm
/* 8018DD28 0018AD28  38 60 00 00 */	li r3, 0
/* 8018DD2C 0018AD2C  48 12 68 6D */	bl GXSetCurrentMtx
/* 8018DD30 0018AD30  2C 1B 00 00 */	cmpwi r27, 0
/* 8018DD34 0018AD34  41 82 00 0C */	beq lbl_8018DD40
/* 8018DD38 0018AD38  2C 1B 00 02 */	cmpwi r27, 2
/* 8018DD3C 0018AD3C  40 82 00 2C */	bne lbl_8018DD68
lbl_8018DD40:
/* 8018DD40 0018AD40  C0 42 CF 40 */	lfs f2, lbl_8041E2C0@sda21(r2)
/* 8018DD44 0018AD44  7F E4 FB 78 */	mr r4, r31
/* 8018DD48 0018AD48  C0 A2 CF 34 */	lfs f5, lbl_8041E2B4@sda21(r2)
/* 8018DD4C 0018AD4C  38 60 00 01 */	li r3, 1
/* 8018DD50 0018AD50  FC 60 10 90 */	fmr f3, f2
/* 8018DD54 0018AD54  C0 22 CF 3C */	lfs f1, lbl_8041E2BC@sda21(r2)
/* 8018DD58 0018AD58  FC 80 10 90 */	fmr f4, f2
/* 8018DD5C 0018AD5C  FC C0 28 90 */	fmr f6, f5
/* 8018DD60 0018AD60  48 00 02 29 */	bl polygon
/* 8018DD64 0018AD64  48 00 00 28 */	b lbl_8018DD8C
lbl_8018DD68:
/* 8018DD68 0018AD68  C0 42 CF 40 */	lfs f2, lbl_8041E2C0@sda21(r2)
/* 8018DD6C 0018AD6C  7F E4 FB 78 */	mr r4, r31
/* 8018DD70 0018AD70  C0 A2 CF 34 */	lfs f5, lbl_8041E2B4@sda21(r2)
/* 8018DD74 0018AD74  38 60 00 02 */	li r3, 2
/* 8018DD78 0018AD78  FC 60 10 90 */	fmr f3, f2
/* 8018DD7C 0018AD7C  C0 22 CF 3C */	lfs f1, lbl_8041E2BC@sda21(r2)
/* 8018DD80 0018AD80  FC 80 10 90 */	fmr f4, f2
/* 8018DD84 0018AD84  FC C0 28 90 */	fmr f6, f5
/* 8018DD88 0018AD88  48 00 02 01 */	bl polygon
lbl_8018DD8C:
/* 8018DD8C 0018AD8C  7F 80 FE 70 */	srawi r0, r28, 0x1f
/* 8018DD90 0018AD90  3C 60 66 66 */	lis r3, 0x66666667@ha
/* 8018DD94 0018AD94  7C 06 E2 78 */	xor r6, r0, r28
/* 8018DD98 0018AD98  38 8D B4 40 */	addi r4, r13, lbl_804126A0@sda21
/* 8018DD9C 0018AD9C  7C C0 30 50 */	subf r6, r0, r6
/* 8018DDA0 0018ADA0  38 03 66 67 */	addi r0, r3, 0x66666667@l
/* 8018DDA4 0018ADA4  7C 00 30 96 */	mulhw r0, r0, r6
/* 8018DDA8 0018ADA8  38 61 00 08 */	addi r3, r1, 8
/* 8018DDAC 0018ADAC  7C 00 16 70 */	srawi r0, r0, 2
/* 8018DDB0 0018ADB0  54 05 0F FE */	srwi r5, r0, 0x1f
/* 8018DDB4 0018ADB4  7C 00 2A 14 */	add r0, r0, r5
/* 8018DDB8 0018ADB8  1C 00 00 0A */	mulli r0, r0, 0xa
/* 8018DDBC 0018ADBC  7C 00 30 50 */	subf r0, r0, r6
/* 8018DDC0 0018ADC0  54 00 08 3C */	slwi r0, r0, 1
/* 8018DDC4 0018ADC4  7C 84 02 2E */	lhzx r4, r4, r0
/* 8018DDC8 0018ADC8  4B E8 C1 C1 */	bl iconGetTexObj
/* 8018DDCC 0018ADCC  38 61 00 08 */	addi r3, r1, 8
/* 8018DDD0 0018ADD0  38 80 00 00 */	li r4, 0
/* 8018DDD4 0018ADD4  48 12 3C A9 */	bl GXLoadTexObj
/* 8018DDD8 0018ADD8  38 60 00 01 */	li r3, 1
/* 8018DDDC 0018ADDC  48 12 14 A5 */	bl GXSetNumTexGens
/* 8018DDE0 0018ADE0  38 60 00 00 */	li r3, 0
/* 8018DDE4 0018ADE4  38 80 00 01 */	li r4, 1
/* 8018DDE8 0018ADE8  38 A0 00 04 */	li r5, 4
/* 8018DDEC 0018ADEC  38 C0 00 3C */	li r6, 0x3c
/* 8018DDF0 0018ADF0  38 E0 00 00 */	li r7, 0
/* 8018DDF4 0018ADF4  39 00 00 7D */	li r8, 0x7d
/* 8018DDF8 0018ADF8  48 12 12 09 */	bl GXSetTexCoordGen2
/* 8018DDFC 0018ADFC  2C 1C 00 00 */	cmpwi r28, 0
/* 8018DE00 0018AE00  41 80 00 1C */	blt lbl_8018DE1C
/* 8018DE04 0018AE04  C0 22 CF 44 */	lfs f1, lbl_8041E2C4@sda21(r2)
/* 8018DE08 0018AE08  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DE0C 0018AE0C  C0 42 CF 48 */	lfs f2, lbl_8041E2C8@sda21(r2)
/* 8018DE10 0018AE10  C0 62 CF 34 */	lfs f3, lbl_8041E2B4@sda21(r2)
/* 8018DE14 0018AE14  48 10 A6 19 */	bl PSMTXTrans
/* 8018DE18 0018AE18  48 00 00 18 */	b lbl_8018DE30
lbl_8018DE1C:
/* 8018DE1C 0018AE1C  C0 22 CF 44 */	lfs f1, lbl_8041E2C4@sda21(r2)
/* 8018DE20 0018AE20  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DE24 0018AE24  C0 42 CF 4C */	lfs f2, lbl_8041E2CC@sda21(r2)
/* 8018DE28 0018AE28  C0 62 CF 34 */	lfs f3, lbl_8041E2B4@sda21(r2)
/* 8018DE2C 0018AE2C  48 10 A6 01 */	bl PSMTXTrans
lbl_8018DE30:
/* 8018DE30 0018AE30  80 1D 00 20 */	lwz r0, 0x20(r29)
/* 8018DE34 0018AE34  28 00 00 0F */	cmplwi r0, 0xf
/* 8018DE38 0018AE38  40 80 00 18 */	bge lbl_8018DE50
/* 8018DE3C 0018AE3C  38 61 00 58 */	addi r3, r1, 0x58
/* 8018DE40 0018AE40  38 81 01 18 */	addi r4, r1, 0x118
/* 8018DE44 0018AE44  38 A1 00 88 */	addi r5, r1, 0x88
/* 8018DE48 0018AE48  48 10 A1 19 */	bl PSMTXConcat
/* 8018DE4C 0018AE4C  48 00 00 14 */	b lbl_8018DE60
lbl_8018DE50:
/* 8018DE50 0018AE50  38 61 00 28 */	addi r3, r1, 0x28
/* 8018DE54 0018AE54  38 81 01 18 */	addi r4, r1, 0x118
/* 8018DE58 0018AE58  38 A1 00 88 */	addi r5, r1, 0x88
/* 8018DE5C 0018AE5C  48 10 A1 05 */	bl PSMTXConcat
lbl_8018DE60:
/* 8018DE60 0018AE60  38 81 00 88 */	addi r4, r1, 0x88
/* 8018DE64 0018AE64  38 7E 01 1C */	addi r3, r30, 0x11c
/* 8018DE68 0018AE68  7C 85 23 78 */	mr r5, r4
/* 8018DE6C 0018AE6C  48 10 A0 F5 */	bl PSMTXConcat
/* 8018DE70 0018AE70  38 61 00 88 */	addi r3, r1, 0x88
/* 8018DE74 0018AE74  38 80 00 00 */	li r4, 0
/* 8018DE78 0018AE78  48 12 66 81 */	bl GXLoadPosMtxImm
/* 8018DE7C 0018AE7C  C0 42 CF 54 */	lfs f2, lbl_8041E2D4@sda21(r2)
/* 8018DE80 0018AE80  7F E4 FB 78 */	mr r4, r31
/* 8018DE84 0018AE84  C0 A2 CF 34 */	lfs f5, lbl_8041E2B4@sda21(r2)
/* 8018DE88 0018AE88  38 60 00 00 */	li r3, 0
/* 8018DE8C 0018AE8C  FC 60 10 90 */	fmr f3, f2
/* 8018DE90 0018AE90  C0 22 CF 50 */	lfs f1, lbl_8041E2D0@sda21(r2)
/* 8018DE94 0018AE94  FC 80 10 90 */	fmr f4, f2
/* 8018DE98 0018AE98  FC C0 28 90 */	fmr f6, f5
/* 8018DE9C 0018AE9C  48 00 00 ED */	bl polygon
/* 8018DEA0 0018AEA0  2C 1C 00 00 */	cmpwi r28, 0
/* 8018DEA4 0018AEA4  41 80 00 34 */	blt lbl_8018DED8
/* 8018DEA8 0018AEA8  38 61 00 08 */	addi r3, r1, 8
/* 8018DEAC 0018AEAC  38 80 01 ED */	li r4, 0x1ed
/* 8018DEB0 0018AEB0  4B E8 C0 D9 */	bl iconGetTexObj
/* 8018DEB4 0018AEB4  38 61 00 08 */	addi r3, r1, 8
/* 8018DEB8 0018AEB8  38 80 00 00 */	li r4, 0
/* 8018DEBC 0018AEBC  48 12 3B C1 */	bl GXLoadTexObj
/* 8018DEC0 0018AEC0  C0 22 CF 58 */	lfs f1, lbl_8041E2D8@sda21(r2)
/* 8018DEC4 0018AEC4  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DEC8 0018AEC8  C0 42 CF 48 */	lfs f2, lbl_8041E2C8@sda21(r2)
/* 8018DECC 0018AECC  C0 62 CF 34 */	lfs f3, lbl_8041E2B4@sda21(r2)
/* 8018DED0 0018AED0  48 10 A5 5D */	bl PSMTXTrans
/* 8018DED4 0018AED4  48 00 00 30 */	b lbl_8018DF04
lbl_8018DED8:
/* 8018DED8 0018AED8  38 61 00 08 */	addi r3, r1, 8
/* 8018DEDC 0018AEDC  38 80 01 EE */	li r4, 0x1ee
/* 8018DEE0 0018AEE0  4B E8 C0 A9 */	bl iconGetTexObj
/* 8018DEE4 0018AEE4  38 61 00 08 */	addi r3, r1, 8
/* 8018DEE8 0018AEE8  38 80 00 00 */	li r4, 0
/* 8018DEEC 0018AEEC  48 12 3B 91 */	bl GXLoadTexObj
/* 8018DEF0 0018AEF0  C0 22 CF 58 */	lfs f1, lbl_8041E2D8@sda21(r2)
/* 8018DEF4 0018AEF4  38 61 01 18 */	addi r3, r1, 0x118
/* 8018DEF8 0018AEF8  C0 42 CF 4C */	lfs f2, lbl_8041E2CC@sda21(r2)
/* 8018DEFC 0018AEFC  C0 62 CF 34 */	lfs f3, lbl_8041E2B4@sda21(r2)
/* 8018DF00 0018AF00  48 10 A5 2D */	bl PSMTXTrans
lbl_8018DF04:
/* 8018DF04 0018AF04  80 1D 00 20 */	lwz r0, 0x20(r29)
/* 8018DF08 0018AF08  28 00 00 0F */	cmplwi r0, 0xf
/* 8018DF0C 0018AF0C  40 80 00 18 */	bge lbl_8018DF24
/* 8018DF10 0018AF10  38 61 00 58 */	addi r3, r1, 0x58
/* 8018DF14 0018AF14  38 81 01 18 */	addi r4, r1, 0x118
/* 8018DF18 0018AF18  38 A1 00 88 */	addi r5, r1, 0x88
/* 8018DF1C 0018AF1C  48 10 A0 45 */	bl PSMTXConcat
/* 8018DF20 0018AF20  48 00 00 14 */	b lbl_8018DF34
lbl_8018DF24:
/* 8018DF24 0018AF24  38 61 00 28 */	addi r3, r1, 0x28
/* 8018DF28 0018AF28  38 81 01 18 */	addi r4, r1, 0x118
/* 8018DF2C 0018AF2C  38 A1 00 88 */	addi r5, r1, 0x88
/* 8018DF30 0018AF30  48 10 A0 31 */	bl PSMTXConcat
lbl_8018DF34:
/* 8018DF34 0018AF34  38 81 00 88 */	addi r4, r1, 0x88
/* 8018DF38 0018AF38  38 7E 01 1C */	addi r3, r30, 0x11c
/* 8018DF3C 0018AF3C  7C 85 23 78 */	mr r5, r4
/* 8018DF40 0018AF40  48 10 A0 21 */	bl PSMTXConcat
/* 8018DF44 0018AF44  38 61 00 88 */	addi r3, r1, 0x88
/* 8018DF48 0018AF48  38 80 00 00 */	li r4, 0
/* 8018DF4C 0018AF4C  48 12 65 AD */	bl GXLoadPosMtxImm
/* 8018DF50 0018AF50  C0 42 CF 54 */	lfs f2, lbl_8041E2D4@sda21(r2)
/* 8018DF54 0018AF54  7F E4 FB 78 */	mr r4, r31
/* 8018DF58 0018AF58  C0 A2 CF 34 */	lfs f5, lbl_8041E2B4@sda21(r2)
/* 8018DF5C 0018AF5C  38 60 00 00 */	li r3, 0
/* 8018DF60 0018AF60  FC 60 10 90 */	fmr f3, f2
/* 8018DF64 0018AF64  C0 22 CF 50 */	lfs f1, lbl_8041E2D0@sda21(r2)
/* 8018DF68 0018AF68  FC 80 10 90 */	fmr f4, f2
/* 8018DF6C 0018AF6C  FC C0 28 90 */	fmr f6, f5
/* 8018DF70 0018AF70  48 00 00 19 */	bl polygon
/* 8018DF74 0018AF74  BB 41 01 48 */	lmw r26, 0x148(r1)
/* 8018DF78 0018AF78  80 01 01 64 */	lwz r0, 0x164(r1)
/* 8018DF7C 0018AF7C  7C 08 03 A6 */	mtlr r0
/* 8018DF80 0018AF80  38 21 01 60 */	addi r1, r1, 0x160
/* 8018DF84 0018AF84  4E 80 00 20 */	blr 

.global polygon
polygon:
/* 8018DF88 0018AF88  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 8018DF8C 0018AF8C  7C 08 02 A6 */	mflr r0
/* 8018DF90 0018AF90  90 01 00 94 */	stw r0, 0x94(r1)
/* 8018DF94 0018AF94  DB E1 00 80 */	stfd f31, 0x80(r1)
/* 8018DF98 0018AF98  F3 E1 00 88 */	psq_st f31, 136(r1), 0, qr0
/* 8018DF9C 0018AF9C  DB C1 00 70 */	stfd f30, 0x70(r1)
/* 8018DFA0 0018AFA0  F3 C1 00 78 */	psq_st f30, 120(r1), 0, qr0
/* 8018DFA4 0018AFA4  DB A1 00 60 */	stfd f29, 0x60(r1)
/* 8018DFA8 0018AFA8  F3 A1 00 68 */	psq_st f29, 104(r1), 0, qr0
/* 8018DFAC 0018AFAC  DB 81 00 50 */	stfd f28, 0x50(r1)
/* 8018DFB0 0018AFB0  F3 81 00 58 */	psq_st f28, 88(r1), 0, qr0
/* 8018DFB4 0018AFB4  DB 61 00 40 */	stfd f27, 0x40(r1)
/* 8018DFB8 0018AFB8  F3 61 00 48 */	psq_st f27, 72(r1), 0, qr0
/* 8018DFBC 0018AFBC  DB 41 00 30 */	stfd f26, 0x30(r1)
/* 8018DFC0 0018AFC0  F3 41 00 38 */	psq_st f26, 56(r1), 0, qr0
/* 8018DFC4 0018AFC4  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 8018DFC8 0018AFC8  FF 40 08 90 */	fmr f26, f1
/* 8018DFCC 0018AFCC  2C 03 00 01 */	cmpwi r3, 1
/* 8018DFD0 0018AFD0  FF 60 10 90 */	fmr f27, f2
/* 8018DFD4 0018AFD4  FF 80 18 90 */	fmr f28, f3
/* 8018DFD8 0018AFD8  FF A0 20 90 */	fmr f29, f4
/* 8018DFDC 0018AFDC  FF C0 28 90 */	fmr f30, f5
/* 8018DFE0 0018AFE0  FF E0 30 90 */	fmr f31, f6
/* 8018DFE4 0018AFE4  41 82 00 40 */	beq lbl_8018E024
/* 8018DFE8 0018AFE8  40 80 00 10 */	bge lbl_8018DFF8
/* 8018DFEC 0018AFEC  2C 03 00 00 */	cmpwi r3, 0
/* 8018DFF0 0018AFF0  40 80 00 14 */	bge lbl_8018E004
/* 8018DFF4 0018AFF4  48 00 00 6C */	b lbl_8018E060
lbl_8018DFF8:
/* 8018DFF8 0018AFF8  2C 03 00 03 */	cmpwi r3, 3
/* 8018DFFC 0018AFFC  40 80 00 64 */	bge lbl_8018E060
/* 8018E000 0018B000  48 00 00 44 */	b lbl_8018E044
lbl_8018E004:
/* 8018E004 0018B004  54 9C 06 3E */	clrlwi r28, r4, 0x18
/* 8018E008 0018B008  3B A0 00 FF */	li r29, 0xff
/* 8018E00C 0018B00C  3B C0 00 FF */	li r30, 0xff
/* 8018E010 0018B010  3B E0 00 FF */	li r31, 0xff
/* 8018E014 0018B014  3B 20 00 FF */	li r25, 0xff
/* 8018E018 0018B018  3B 40 00 FF */	li r26, 0xff
/* 8018E01C 0018B01C  3B 60 00 FF */	li r27, 0xff
/* 8018E020 0018B020  48 00 00 40 */	b lbl_8018E060
lbl_8018E024:
/* 8018E024 0018B024  54 9C 06 3E */	clrlwi r28, r4, 0x18
/* 8018E028 0018B028  3B E0 00 E9 */	li r31, 0xe9
/* 8018E02C 0018B02C  3B C0 00 4A */	li r30, 0x4a
/* 8018E030 0018B030  3B A0 00 3F */	li r29, 0x3f
/* 8018E034 0018B034  3B 60 00 FE */	li r27, 0xfe
/* 8018E038 0018B038  3B 40 00 E6 */	li r26, 0xe6
/* 8018E03C 0018B03C  3B 20 00 3E */	li r25, 0x3e
/* 8018E040 0018B040  48 00 00 20 */	b lbl_8018E060
lbl_8018E044:
/* 8018E044 0018B044  54 9C 06 3E */	clrlwi r28, r4, 0x18
/* 8018E048 0018B048  3B E0 00 3F */	li r31, 0x3f
/* 8018E04C 0018B04C  3B C0 00 3F */	li r30, 0x3f
/* 8018E050 0018B050  3B A0 00 E9 */	li r29, 0xe9
/* 8018E054 0018B054  3B 60 00 74 */	li r27, 0x74
/* 8018E058 0018B058  3B 40 00 C9 */	li r26, 0xc9
/* 8018E05C 0018B05C  3B 20 00 FF */	li r25, 0xff
lbl_8018E060:
/* 8018E060 0018B060  38 60 00 80 */	li r3, 0x80
/* 8018E064 0018B064  38 80 00 00 */	li r4, 0
/* 8018E068 0018B068  38 A0 00 04 */	li r5, 4
/* 8018E06C 0018B06C  48 12 1B FD */	bl GXBegin
/* 8018E070 0018B070  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8018E074 0018B074  EC 3A E0 2A */	fadds f1, f26, f28
/* 8018E078 0018B078  D3 43 80 00 */	stfs f26, 0xCC008000@l(r3)
/* 8018E07C 0018B07C  EC 5B E8 28 */	fsubs f2, f27, f29
/* 8018E080 0018B080  D3 63 80 00 */	stfs f27, -0x8000(r3)
/* 8018E084 0018B084  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E088 0018B088  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E08C 0018B08C  9B E3 80 00 */	stb r31, -0x8000(r3)
/* 8018E090 0018B090  9B C3 80 00 */	stb r30, -0x8000(r3)
/* 8018E094 0018B094  9B A3 80 00 */	stb r29, -0x8000(r3)
/* 8018E098 0018B098  9B 83 80 00 */	stb r28, -0x8000(r3)
/* 8018E09C 0018B09C  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E0A0 0018B0A0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E0A4 0018B0A4  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E0A8 0018B0A8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E0AC 0018B0AC  D0 23 80 00 */	stfs f1, -0x8000(r3)
/* 8018E0B0 0018B0B0  D3 63 80 00 */	stfs f27, -0x8000(r3)
/* 8018E0B4 0018B0B4  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E0B8 0018B0B8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E0BC 0018B0BC  9B E3 80 00 */	stb r31, -0x8000(r3)
/* 8018E0C0 0018B0C0  9B C3 80 00 */	stb r30, -0x8000(r3)
/* 8018E0C4 0018B0C4  9B A3 80 00 */	stb r29, -0x8000(r3)
/* 8018E0C8 0018B0C8  9B 83 80 00 */	stb r28, -0x8000(r3)
/* 8018E0CC 0018B0CC  D3 C3 80 00 */	stfs f30, -0x8000(r3)
/* 8018E0D0 0018B0D0  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E0D4 0018B0D4  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E0D8 0018B0D8  D0 23 80 00 */	stfs f1, -0x8000(r3)
/* 8018E0DC 0018B0DC  D0 43 80 00 */	stfs f2, -0x8000(r3)
/* 8018E0E0 0018B0E0  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E0E4 0018B0E4  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E0E8 0018B0E8  9B 63 80 00 */	stb r27, -0x8000(r3)
/* 8018E0EC 0018B0EC  9B 43 80 00 */	stb r26, -0x8000(r3)
/* 8018E0F0 0018B0F0  9B 23 80 00 */	stb r25, -0x8000(r3)
/* 8018E0F4 0018B0F4  9B 83 80 00 */	stb r28, -0x8000(r3)
/* 8018E0F8 0018B0F8  D3 C3 80 00 */	stfs f30, -0x8000(r3)
/* 8018E0FC 0018B0FC  D3 E3 80 00 */	stfs f31, -0x8000(r3)
/* 8018E100 0018B100  D3 43 80 00 */	stfs f26, -0x8000(r3)
/* 8018E104 0018B104  D0 43 80 00 */	stfs f2, -0x8000(r3)
/* 8018E108 0018B108  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E10C 0018B10C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E110 0018B110  9B 63 80 00 */	stb r27, -0x8000(r3)
/* 8018E114 0018B114  9B 43 80 00 */	stb r26, -0x8000(r3)
/* 8018E118 0018B118  9B 23 80 00 */	stb r25, -0x8000(r3)
/* 8018E11C 0018B11C  9B 83 80 00 */	stb r28, -0x8000(r3)
/* 8018E120 0018B120  C0 02 CF 48 */	lfs f0, lbl_8041E2C8@sda21(r2)
/* 8018E124 0018B124  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018E128 0018B128  D3 E3 80 00 */	stfs f31, -0x8000(r3)
/* 8018E12C 0018B12C  E3 E1 00 88 */	psq_l f31, 136(r1), 0, qr0
/* 8018E130 0018B130  CB E1 00 80 */	lfd f31, 0x80(r1)
/* 8018E134 0018B134  E3 C1 00 78 */	psq_l f30, 120(r1), 0, qr0
/* 8018E138 0018B138  CB C1 00 70 */	lfd f30, 0x70(r1)
/* 8018E13C 0018B13C  E3 A1 00 68 */	psq_l f29, 104(r1), 0, qr0
/* 8018E140 0018B140  CB A1 00 60 */	lfd f29, 0x60(r1)
/* 8018E144 0018B144  E3 81 00 58 */	psq_l f28, 88(r1), 0, qr0
/* 8018E148 0018B148  CB 81 00 50 */	lfd f28, 0x50(r1)
/* 8018E14C 0018B14C  E3 61 00 48 */	psq_l f27, 72(r1), 0, qr0
/* 8018E150 0018B150  CB 61 00 40 */	lfd f27, 0x40(r1)
/* 8018E154 0018B154  E3 41 00 38 */	psq_l f26, 56(r1), 0, qr0
/* 8018E158 0018B158  CB 41 00 30 */	lfd f26, 0x30(r1)
/* 8018E15C 0018B15C  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 8018E160 0018B160  80 01 00 94 */	lwz r0, 0x94(r1)
/* 8018E164 0018B164  7C 08 03 A6 */	mtlr r0
/* 8018E168 0018B168  38 21 00 90 */	addi r1, r1, 0x90
/* 8018E16C 0018B16C  4E 80 00 20 */	blr 
effUpdownMain:
/* 8018E170 0018B170  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8018E174 0018B174  7C 08 02 A6 */	mflr r0
/* 8018E178 0018B178  90 01 00 44 */	stw r0, 0x44(r1)
/* 8018E17C 0018B17C  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 8018E180 0018B180  93 C1 00 38 */	stw r30, 0x38(r1)
/* 8018E184 0018B184  7C 7E 1B 78 */	mr r30, r3
/* 8018E188 0018B188  93 A1 00 34 */	stw r29, 0x34(r1)
/* 8018E18C 0018B18C  80 63 00 00 */	lwz r3, 0(r3)
/* 8018E190 0018B190  83 FE 00 0C */	lwz r31, 0xc(r30)
/* 8018E194 0018B194  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 8018E198 0018B198  80 9F 00 00 */	lwz r4, 0(r31)
/* 8018E19C 0018B19C  41 82 00 14 */	beq lbl_8018E1B0
/* 8018E1A0 0018B1A0  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 8018E1A4 0018B1A4  38 00 00 10 */	li r0, 0x10
/* 8018E1A8 0018B1A8  90 7E 00 00 */	stw r3, 0(r30)
/* 8018E1AC 0018B1AC  90 1F 00 1C */	stw r0, 0x1c(r31)
lbl_8018E1B0:
/* 8018E1B0 0018B1B0  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8018E1B4 0018B1B4  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 8018E1B8 0018B1B8  40 80 00 0C */	bge lbl_8018E1C4
/* 8018E1BC 0018B1BC  38 03 FF FF */	addi r0, r3, -1
/* 8018E1C0 0018B1C0  90 1F 00 1C */	stw r0, 0x1c(r31)
lbl_8018E1C4:
/* 8018E1C4 0018B1C4  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 8018E1C8 0018B1C8  2C 00 00 00 */	cmpwi r0, 0
/* 8018E1CC 0018B1CC  40 80 00 10 */	bge lbl_8018E1DC
/* 8018E1D0 0018B1D0  7F C3 F3 78 */	mr r3, r30
/* 8018E1D4 0018B1D4  4B EC F9 B1 */	bl effDelete
/* 8018E1D8 0018B1D8  48 00 01 54 */	b lbl_8018E32C
lbl_8018E1DC:
/* 8018E1DC 0018B1DC  2C 00 00 10 */	cmpwi r0, 0x10
/* 8018E1E0 0018B1E0  40 80 00 0C */	bge lbl_8018E1EC
/* 8018E1E4 0018B1E4  54 00 26 36 */	rlwinm r0, r0, 4, 0x18, 0x1b
/* 8018E1E8 0018B1E8  98 1F 00 24 */	stb r0, 0x24(r31)
lbl_8018E1EC:
/* 8018E1EC 0018B1EC  2C 04 00 00 */	cmpwi r4, 0
/* 8018E1F0 0018B1F0  41 82 00 0C */	beq lbl_8018E1FC
/* 8018E1F4 0018B1F4  2C 04 00 01 */	cmpwi r4, 1
/* 8018E1F8 0018B1F8  40 82 00 BC */	bne lbl_8018E2B4
lbl_8018E1FC:
/* 8018E1FC 0018B1FC  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 8018E200 0018B200  28 03 00 0F */	cmplwi r3, 0xf
/* 8018E204 0018B204  40 80 00 64 */	bge lbl_8018E268
/* 8018E208 0018B208  54 60 08 3C */	slwi r0, r3, 1
/* 8018E20C 0018B20C  38 AD B4 54 */	addi r5, r13, lbl_804126B4@sda21
/* 8018E210 0018B210  7C 85 00 AE */	lbzx r4, r5, r0
/* 8018E214 0018B214  3C 00 43 30 */	lis r0, 0x4330
/* 8018E218 0018B218  3C 60 80 30 */	lis r3, lbl_802F8E48@ha
/* 8018E21C 0018B21C  90 01 00 18 */	stw r0, 0x18(r1)
/* 8018E220 0018B220  C8 43 8E 48 */	lfd f2, lbl_802F8E48@l(r3)
/* 8018E224 0018B224  90 81 00 1C */	stw r4, 0x1c(r1)
/* 8018E228 0018B228  C0 22 CF 5C */	lfs f1, lbl_8041E2DC@sda21(r2)
/* 8018E22C 0018B22C  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 8018E230 0018B230  90 01 00 20 */	stw r0, 0x20(r1)
/* 8018E234 0018B234  EC 00 10 28 */	fsubs f0, f0, f2
/* 8018E238 0018B238  EC 00 08 24 */	fdivs f0, f0, f1
/* 8018E23C 0018B23C  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 8018E240 0018B240  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 8018E244 0018B244  54 00 08 3C */	slwi r0, r0, 1
/* 8018E248 0018B248  7C 65 02 14 */	add r3, r5, r0
/* 8018E24C 0018B24C  88 03 00 01 */	lbz r0, 1(r3)
/* 8018E250 0018B250  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018E254 0018B254  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 8018E258 0018B258  EC 00 10 28 */	fsubs f0, f0, f2
/* 8018E25C 0018B25C  EC 00 08 24 */	fdivs f0, f0, f1
/* 8018E260 0018B260  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 8018E264 0018B264  48 00 00 50 */	b lbl_8018E2B4
lbl_8018E268:
/* 8018E268 0018B268  38 63 FF F1 */	addi r3, r3, -15
/* 8018E26C 0018B26C  3C 00 43 30 */	lis r0, 0x4330
/* 8018E270 0018B270  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8018E274 0018B274  3C 80 80 30 */	lis r4, lbl_802F8E50@ha
/* 8018E278 0018B278  90 61 00 24 */	stw r3, 0x24(r1)
/* 8018E27C 0018B27C  C0 62 CF 34 */	lfs f3, lbl_8041E2B4@sda21(r2)
/* 8018E280 0018B280  90 01 00 20 */	stw r0, 0x20(r1)
/* 8018E284 0018B284  C8 44 8E 50 */	lfd f2, lbl_802F8E50@l(r4)
/* 8018E288 0018B288  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 8018E28C 0018B28C  C0 02 CF 60 */	lfs f0, lbl_8041E2E0@sda21(r2)
/* 8018E290 0018B290  EC 21 10 28 */	fsubs f1, f1, f2
/* 8018E294 0018B294  D0 7F 00 10 */	stfs f3, 0x10(r31)
/* 8018E298 0018B298  EC 21 00 32 */	fmuls f1, f1, f0
/* 8018E29C 0018B29C  48 0D E1 5D */	bl sin
/* 8018E2A0 0018B2A0  FC 40 08 18 */	frsp f2, f1
/* 8018E2A4 0018B2A4  C0 22 CF 64 */	lfs f1, lbl_8041E2E4@sda21(r2)
/* 8018E2A8 0018B2A8  C0 02 CF 34 */	lfs f0, lbl_8041E2B4@sda21(r2)
/* 8018E2AC 0018B2AC  EC 01 00 BC */	fnmsubs f0, f1, f2, f0
/* 8018E2B0 0018B2B0  D0 1F 00 14 */	stfs f0, 0x14(r31)
lbl_8018E2B4:
/* 8018E2B4 0018B2B4  80 9F 00 20 */	lwz r4, 0x20(r31)
/* 8018E2B8 0018B2B8  3C 60 80 30 */	lis r3, lbl_802F8E38@ha
/* 8018E2BC 0018B2BC  38 C3 8E 38 */	addi r6, r3, lbl_802F8E38@l
/* 8018E2C0 0018B2C0  38 61 00 08 */	addi r3, r1, 8
/* 8018E2C4 0018B2C4  38 04 00 01 */	addi r0, r4, 1
/* 8018E2C8 0018B2C8  3B A0 00 01 */	li r29, 1
/* 8018E2CC 0018B2CC  90 1F 00 20 */	stw r0, 0x20(r31)
/* 8018E2D0 0018B2D0  80 A6 00 00 */	lwz r5, 0(r6)
/* 8018E2D4 0018B2D4  80 86 00 04 */	lwz r4, 4(r6)
/* 8018E2D8 0018B2D8  80 06 00 08 */	lwz r0, 8(r6)
/* 8018E2DC 0018B2DC  90 A1 00 08 */	stw r5, 8(r1)
/* 8018E2E0 0018B2E0  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018E2E4 0018B2E4  90 01 00 10 */	stw r0, 0x10(r1)
/* 8018E2E8 0018B2E8  C0 1F 00 04 */	lfs f0, 4(r31)
/* 8018E2EC 0018B2EC  D0 01 00 08 */	stfs f0, 8(r1)
/* 8018E2F0 0018B2F0  C0 1F 00 08 */	lfs f0, 8(r31)
/* 8018E2F4 0018B2F4  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8018E2F8 0018B2F8  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 8018E2FC 0018B2FC  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8018E300 0018B300  88 1F 00 24 */	lbz r0, 0x24(r31)
/* 8018E304 0018B304  28 00 00 FF */	cmplwi r0, 0xff
/* 8018E308 0018B308  41 82 00 08 */	beq lbl_8018E310
/* 8018E30C 0018B30C  3B A0 00 02 */	li r29, 2
lbl_8018E310:
/* 8018E310 0018B310  4B E8 23 B1 */	bl dispCalcZ
/* 8018E314 0018B314  3C 60 80 19 */	lis r3, effUpdownDisp@ha
/* 8018E318 0018B318  7F A4 EB 78 */	mr r4, r29
/* 8018E31C 0018B31C  38 A3 DB 2C */	addi r5, r3, effUpdownDisp@l
/* 8018E320 0018B320  7F C6 F3 78 */	mr r6, r30
/* 8018E324 0018B324  38 60 00 04 */	li r3, 4
/* 8018E328 0018B328  4B E8 26 F1 */	bl dispEntry
lbl_8018E32C:
/* 8018E32C 0018B32C  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8018E330 0018B330  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 8018E334 0018B334  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 8018E338 0018B338  83 A1 00 34 */	lwz r29, 0x34(r1)
/* 8018E33C 0018B33C  7C 08 03 A6 */	mtlr r0
/* 8018E340 0018B340  38 21 00 40 */	addi r1, r1, 0x40
/* 8018E344 0018B344  4E 80 00 20 */	blr 

.global effUpdownEntry
effUpdownEntry:
/* 8018E348 0018B348  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8018E34C 0018B34C  7C 08 02 A6 */	mflr r0
/* 8018E350 0018B350  90 01 00 54 */	stw r0, 0x54(r1)
/* 8018E354 0018B354  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8018E358 0018B358  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8018E35C 0018B35C  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 8018E360 0018B360  F3 C1 00 38 */	psq_st f30, 56(r1), 0, qr0
/* 8018E364 0018B364  DB A1 00 20 */	stfd f29, 0x20(r1)
/* 8018E368 0018B368  F3 A1 00 28 */	psq_st f29, 40(r1), 0, qr0
/* 8018E36C 0018B36C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8018E370 0018B370  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8018E374 0018B374  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8018E378 0018B378  93 81 00 10 */	stw r28, 0x10(r1)
/* 8018E37C 0018B37C  FF A0 08 90 */	fmr f29, f1
/* 8018E380 0018B380  7C 7C 1B 78 */	mr r28, r3
/* 8018E384 0018B384  FF C0 10 90 */	fmr f30, f2
/* 8018E388 0018B388  7C 9D 23 78 */	mr r29, r4
/* 8018E38C 0018B38C  FF E0 18 90 */	fmr f31, f3
/* 8018E390 0018B390  7C BE 2B 78 */	mr r30, r5
/* 8018E394 0018B394  4B EC FA 29 */	bl effEntry
/* 8018E398 0018B398  3C 80 80 30 */	lis r4, lbl_802F8E58@ha
/* 8018E39C 0018B39C  7C 7F 1B 78 */	mr r31, r3
/* 8018E3A0 0018B3A0  38 84 8E 58 */	addi r4, r4, lbl_802F8E58@l
/* 8018E3A4 0018B3A4  38 00 00 01 */	li r0, 1
/* 8018E3A8 0018B3A8  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8018E3AC 0018B3AC  38 60 00 03 */	li r3, 3
/* 8018E3B0 0018B3B0  38 80 00 28 */	li r4, 0x28
/* 8018E3B4 0018B3B4  90 1F 00 08 */	stw r0, 8(r31)
/* 8018E3B8 0018B3B8  4B EA 16 D5 */	bl __memAlloc
/* 8018E3BC 0018B3BC  3C 80 80 19 */	lis r4, effUpdownMain@ha
/* 8018E3C0 0018B3C0  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8018E3C4 0018B3C4  38 04 E1 70 */	addi r0, r4, effUpdownMain@l
/* 8018E3C8 0018B3C8  C0 02 CF 34 */	lfs f0, lbl_8041E2B4@sda21(r2)
/* 8018E3CC 0018B3CC  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8018E3D0 0018B3D0  38 80 00 00 */	li r4, 0
/* 8018E3D4 0018B3D4  38 00 00 FF */	li r0, 0xff
/* 8018E3D8 0018B3D8  80 BF 00 00 */	lwz r5, 0(r31)
/* 8018E3DC 0018B3DC  60 A5 00 02 */	ori r5, r5, 2
/* 8018E3E0 0018B3E0  90 BF 00 00 */	stw r5, 0(r31)
/* 8018E3E4 0018B3E4  93 83 00 00 */	stw r28, 0(r3)
/* 8018E3E8 0018B3E8  D3 A3 00 04 */	stfs f29, 4(r3)
/* 8018E3EC 0018B3EC  D3 C3 00 08 */	stfs f30, 8(r3)
/* 8018E3F0 0018B3F0  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 8018E3F4 0018B3F4  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 8018E3F8 0018B3F8  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 8018E3FC 0018B3FC  93 A3 00 18 */	stw r29, 0x18(r3)
/* 8018E400 0018B400  93 C3 00 1C */	stw r30, 0x1c(r3)
/* 8018E404 0018B404  90 83 00 20 */	stw r4, 0x20(r3)
/* 8018E408 0018B408  98 03 00 24 */	stb r0, 0x24(r3)
/* 8018E40C 0018B40C  7F E3 FB 78 */	mr r3, r31
/* 8018E410 0018B410  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8018E414 0018B414  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8018E418 0018B418  E3 C1 00 38 */	psq_l f30, 56(r1), 0, qr0
/* 8018E41C 0018B41C  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 8018E420 0018B420  E3 A1 00 28 */	psq_l f29, 40(r1), 0, qr0
/* 8018E424 0018B424  CB A1 00 20 */	lfd f29, 0x20(r1)
/* 8018E428 0018B428  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8018E42C 0018B42C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8018E430 0018B430  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8018E434 0018B434  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8018E438 0018B438  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8018E43C 0018B43C  7C 08 03 A6 */	mtlr r0
/* 8018E440 0018B440  38 21 00 50 */	addi r1, r1, 0x50
/* 8018E444 0018B444  4E 80 00 20 */	blr 
