.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effLevelupDisp
effLevelupDisp:
/* 8021AA24 00217A24  94 21 FE 50 */	stwu r1, -0x1b0(r1)
/* 8021AA28 00217A28  7C 08 02 A6 */	mflr r0
/* 8021AA2C 00217A2C  90 01 01 B4 */	stw r0, 0x1b4(r1)
/* 8021AA30 00217A30  DB E1 01 A0 */	stfd f31, 0x1a0(r1)
/* 8021AA34 00217A34  F3 E1 01 A8 */	psq_st f31, 424(r1), 0, qr0
/* 8021AA38 00217A38  DB C1 01 90 */	stfd f30, 0x190(r1)
/* 8021AA3C 00217A3C  F3 C1 01 98 */	psq_st f30, 408(r1), 0, qr0
/* 8021AA40 00217A40  DB A1 01 80 */	stfd f29, 0x180(r1)
/* 8021AA44 00217A44  F3 A1 01 88 */	psq_st f29, 392(r1), 0, qr0
/* 8021AA48 00217A48  DB 81 01 70 */	stfd f28, 0x170(r1)
/* 8021AA4C 00217A4C  F3 81 01 78 */	psq_st f28, 376(r1), 0, qr0
/* 8021AA50 00217A50  DB 61 01 60 */	stfd f27, 0x160(r1)
/* 8021AA54 00217A54  F3 61 01 68 */	psq_st f27, 360(r1), 0, qr0
/* 8021AA58 00217A58  BE 61 01 2C */	stmw r19, 0x12c(r1)
/* 8021AA5C 00217A5C  7C 95 23 78 */	mr r21, r4
/* 8021AA60 00217A60  7C 76 1B 78 */	mr r22, r3
/* 8021AA64 00217A64  82 84 00 0C */	lwz r20, 0xc(r4)
/* 8021AA68 00217A68  4B DF 46 E9 */	bl camGetPtr
/* 8021AA6C 00217A6C  C0 34 00 04 */	lfs f1, 4(r20)
/* 8021AA70 00217A70  7C 73 1B 78 */	mr r19, r3
/* 8021AA74 00217A74  C0 54 00 08 */	lfs f2, 8(r20)
/* 8021AA78 00217A78  38 61 00 E0 */	addi r3, r1, 0xe0
/* 8021AA7C 00217A7C  C0 74 00 0C */	lfs f3, 0xc(r20)
/* 8021AA80 00217A80  48 07 D9 AD */	bl PSMTXTrans
/* 8021AA84 00217A84  7E C3 B3 78 */	mr r3, r22
/* 8021AA88 00217A88  4B DF 46 C9 */	bl camGetPtr
/* 8021AA8C 00217A8C  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8021AA90 00217A90  38 61 00 B0 */	addi r3, r1, 0xb0
/* 8021AA94 00217A94  C0 02 FD 08 */	lfs f0, lbl_80421088@sda21(r2)
/* 8021AA98 00217A98  38 80 00 79 */	li r4, 0x79
/* 8021AA9C 00217A9C  FC 20 08 50 */	fneg f1, f1
/* 8021AAA0 00217AA0  EC 20 00 72 */	fmuls f1, f0, f1
/* 8021AAA4 00217AA4  48 07 D7 49 */	bl PSMTXRotRad
/* 8021AAA8 00217AA8  38 61 00 E0 */	addi r3, r1, 0xe0
/* 8021AAAC 00217AAC  38 81 00 B0 */	addi r4, r1, 0xb0
/* 8021AAB0 00217AB0  7C 65 1B 78 */	mr r5, r3
/* 8021AAB4 00217AB4  48 07 D4 AD */	bl PSMTXConcat
/* 8021AAB8 00217AB8  38 73 01 1C */	addi r3, r19, 0x11c
/* 8021AABC 00217ABC  38 81 00 E0 */	addi r4, r1, 0xe0
/* 8021AAC0 00217AC0  38 A1 00 50 */	addi r5, r1, 0x50
/* 8021AAC4 00217AC4  48 07 D4 9D */	bl PSMTXConcat
/* 8021AAC8 00217AC8  38 60 00 01 */	li r3, 1
/* 8021AACC 00217ACC  48 09 66 6D */	bl GXSetNumChans
/* 8021AAD0 00217AD0  38 60 00 04 */	li r3, 4
/* 8021AAD4 00217AD4  38 80 00 00 */	li r4, 0
/* 8021AAD8 00217AD8  38 A0 00 00 */	li r5, 0
/* 8021AADC 00217ADC  38 C0 00 00 */	li r6, 0
/* 8021AAE0 00217AE0  38 E0 00 00 */	li r7, 0
/* 8021AAE4 00217AE4  39 00 00 00 */	li r8, 0
/* 8021AAE8 00217AE8  39 20 00 02 */	li r9, 2
/* 8021AAEC 00217AEC  48 09 66 89 */	bl GXSetChanCtrl
/* 8021AAF0 00217AF0  38 60 00 01 */	li r3, 1
/* 8021AAF4 00217AF4  48 09 47 8D */	bl GXSetNumTexGens
/* 8021AAF8 00217AF8  38 60 00 00 */	li r3, 0
/* 8021AAFC 00217AFC  38 80 00 01 */	li r4, 1
/* 8021AB00 00217B00  38 A0 00 04 */	li r5, 4
/* 8021AB04 00217B04  38 C0 00 3C */	li r6, 0x3c
/* 8021AB08 00217B08  38 E0 00 00 */	li r7, 0
/* 8021AB0C 00217B0C  39 00 00 7D */	li r8, 0x7d
/* 8021AB10 00217B10  48 09 44 F1 */	bl GXSetTexCoordGen2
/* 8021AB14 00217B14  38 60 00 01 */	li r3, 1
/* 8021AB18 00217B18  48 09 86 B1 */	bl GXSetNumTevStages
/* 8021AB1C 00217B1C  38 60 00 00 */	li r3, 0
/* 8021AB20 00217B20  38 80 00 00 */	li r4, 0
/* 8021AB24 00217B24  38 A0 00 00 */	li r5, 0
/* 8021AB28 00217B28  38 C0 00 04 */	li r6, 4
/* 8021AB2C 00217B2C  48 09 85 01 */	bl GXSetTevOrder
/* 8021AB30 00217B30  38 60 00 00 */	li r3, 0
/* 8021AB34 00217B34  38 80 00 00 */	li r4, 0
/* 8021AB38 00217B38  38 A0 00 00 */	li r5, 0
/* 8021AB3C 00217B3C  38 C0 00 00 */	li r6, 0
/* 8021AB40 00217B40  38 E0 00 01 */	li r7, 1
/* 8021AB44 00217B44  39 00 00 00 */	li r8, 0
/* 8021AB48 00217B48  48 09 80 9D */	bl GXSetTevColorOp
/* 8021AB4C 00217B4C  38 60 00 00 */	li r3, 0
/* 8021AB50 00217B50  38 80 00 00 */	li r4, 0
/* 8021AB54 00217B54  38 A0 00 00 */	li r5, 0
/* 8021AB58 00217B58  38 C0 00 00 */	li r6, 0
/* 8021AB5C 00217B5C  38 E0 00 01 */	li r7, 1
/* 8021AB60 00217B60  39 00 00 00 */	li r8, 0
/* 8021AB64 00217B64  48 09 80 E9 */	bl GXSetTevAlphaOp
/* 8021AB68 00217B68  38 60 00 00 */	li r3, 0
/* 8021AB6C 00217B6C  38 80 00 00 */	li r4, 0
/* 8021AB70 00217B70  48 09 7F 61 */	bl GXSetTevOp
/* 8021AB74 00217B74  38 60 00 00 */	li r3, 0
/* 8021AB78 00217B78  48 09 53 11 */	bl GXSetCullMode
/* 8021AB7C 00217B7C  48 09 3B A1 */	bl GXClearVtxDesc
/* 8021AB80 00217B80  38 60 00 09 */	li r3, 9
/* 8021AB84 00217B84  38 80 00 01 */	li r4, 1
/* 8021AB88 00217B88  48 09 32 7D */	bl GXSetVtxDesc
/* 8021AB8C 00217B8C  38 60 00 0D */	li r3, 0xd
/* 8021AB90 00217B90  38 80 00 01 */	li r4, 1
/* 8021AB94 00217B94  48 09 32 71 */	bl GXSetVtxDesc
/* 8021AB98 00217B98  38 60 00 00 */	li r3, 0
/* 8021AB9C 00217B9C  38 80 00 09 */	li r4, 9
/* 8021ABA0 00217BA0  38 A0 00 01 */	li r5, 1
/* 8021ABA4 00217BA4  38 C0 00 04 */	li r6, 4
/* 8021ABA8 00217BA8  38 E0 00 00 */	li r7, 0
/* 8021ABAC 00217BAC  48 09 3B A9 */	bl GXSetVtxAttrFmt
/* 8021ABB0 00217BB0  38 60 00 00 */	li r3, 0
/* 8021ABB4 00217BB4  38 80 00 0D */	li r4, 0xd
/* 8021ABB8 00217BB8  38 A0 00 01 */	li r5, 1
/* 8021ABBC 00217BBC  38 C0 00 04 */	li r6, 4
/* 8021ABC0 00217BC0  38 E0 00 00 */	li r7, 0
/* 8021ABC4 00217BC4  48 09 3B 91 */	bl GXSetVtxAttrFmt
/* 8021ABC8 00217BC8  3C 80 80 30 */	lis r4, lbl_802FE5F8@ha
/* 8021ABCC 00217BCC  3C 60 80 30 */	lis r3, lbl_802FE5D4@ha
/* 8021ABD0 00217BD0  C3 A2 FD 10 */	lfs f29, lbl_80421090@sda21(r2)
/* 8021ABD4 00217BD4  3B E3 E5 D4 */	addi r31, r3, lbl_802FE5D4@l
/* 8021ABD8 00217BD8  CB E4 E5 F8 */	lfd f31, lbl_802FE5F8@l(r4)
/* 8021ABDC 00217BDC  3A 61 00 10 */	addi r19, r1, 0x10
/* 8021ABE0 00217BE0  C3 C2 FD 14 */	lfs f30, lbl_80421094@sda21(r2)
/* 8021ABE4 00217BE4  3A C0 00 01 */	li r22, 1
/* 8021ABE8 00217BE8  3B 20 00 04 */	li r25, 4
/* 8021ABEC 00217BEC  3F A0 43 30 */	lis r29, 0x4330
/* 8021ABF0 00217BF0  3E 80 CC 01 */	lis r20, 0xcc01
.L_8021ABF4:
/* 8021ABF4 00217BF4  80 75 00 08 */	lwz r3, 8(r21)
/* 8021ABF8 00217BF8  7C 16 00 D0 */	neg r0, r22
/* 8021ABFC 00217BFC  54 00 10 3A */	slwi r0, r0, 2
/* 8021AC00 00217C00  6F 3C 80 00 */	xoris r28, r25, 0x8000
/* 8021AC04 00217C04  3A E3 FF FF */	addi r23, r3, -1
/* 8021AC08 00217C08  1F 77 00 24 */	mulli r27, r23, 0x24
/* 8021AC0C 00217C0C  6C 1E 80 00 */	xoris r30, r0, 0x8000
/* 8021AC10 00217C10  56 FA 10 3A */	slwi r26, r23, 2
/* 8021AC14 00217C14  48 00 02 64 */	b .L_8021AE78
.L_8021AC18:
/* 8021AC18 00217C18  93 81 01 14 */	stw r28, 0x114(r1)
/* 8021AC1C 00217C1C  2C 16 00 00 */	cmpwi r22, 0
/* 8021AC20 00217C20  83 15 00 0C */	lwz r24, 0xc(r21)
/* 8021AC24 00217C24  93 A1 01 10 */	stw r29, 0x110(r1)
/* 8021AC28 00217C28  7F 18 DA 14 */	add r24, r24, r27
/* 8021AC2C 00217C2C  C8 01 01 10 */	lfd f0, 0x110(r1)
/* 8021AC30 00217C30  93 C1 01 1C */	stw r30, 0x11c(r1)
/* 8021AC34 00217C34  EF 80 F8 28 */	fsubs f28, f0, f31
/* 8021AC38 00217C38  93 A1 01 18 */	stw r29, 0x118(r1)
/* 8021AC3C 00217C3C  C8 01 01 18 */	lfd f0, 0x118(r1)
/* 8021AC40 00217C40  EF 60 F8 28 */	fsubs f27, f0, f31
/* 8021AC44 00217C44  41 82 00 58 */	beq .L_8021AC9C
/* 8021AC48 00217C48  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 8021AC4C 00217C4C  38 AD EA C0 */	addi r5, r13, lbl_80415D20@sda21
/* 8021AC50 00217C50  38 81 00 30 */	addi r4, r1, 0x30
/* 8021AC54 00217C54  80 63 01 6C */	lwz r3, 0x16c(r3)
/* 8021AC58 00217C58  7C 03 00 D0 */	neg r0, r3
/* 8021AC5C 00217C5C  7C 00 1B 78 */	or r0, r0, r3
/* 8021AC60 00217C60  54 00 0F FE */	srwi r0, r0, 0x1f
/* 8021AC64 00217C64  1C 00 00 18 */	mulli r0, r0, 0x18
/* 8021AC68 00217C68  7C 60 D2 14 */	add r3, r0, r26
/* 8021AC6C 00217C6C  38 03 00 08 */	addi r0, r3, 8
/* 8021AC70 00217C70  7C 65 00 2E */	lwzx r3, r5, r0
/* 8021AC74 00217C74  4B E4 32 39 */	bl effGetTexObj
/* 8021AC78 00217C78  38 61 00 30 */	addi r3, r1, 0x30
/* 8021AC7C 00217C7C  38 80 00 00 */	li r4, 0
/* 8021AC80 00217C80  48 09 6D FD */	bl GXLoadTexObj
/* 8021AC84 00217C84  80 02 FD 00 */	lwz r0, lbl_80421080@sda21(r2)
/* 8021AC88 00217C88  38 81 00 0C */	addi r4, r1, 0xc
/* 8021AC8C 00217C8C  38 60 00 04 */	li r3, 4
/* 8021AC90 00217C90  90 01 00 0C */	stw r0, 0xc(r1)
/* 8021AC94 00217C94  48 09 63 BD */	bl GXSetChanMatColor
/* 8021AC98 00217C98  48 00 00 54 */	b .L_8021ACEC
.L_8021AC9C:
/* 8021AC9C 00217C9C  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 8021ACA0 00217CA0  38 AD EA C0 */	addi r5, r13, lbl_80415D20@sda21
/* 8021ACA4 00217CA4  38 81 00 30 */	addi r4, r1, 0x30
/* 8021ACA8 00217CA8  80 63 01 6C */	lwz r3, 0x16c(r3)
/* 8021ACAC 00217CAC  7C 03 00 D0 */	neg r0, r3
/* 8021ACB0 00217CB0  7C 00 1B 78 */	or r0, r0, r3
/* 8021ACB4 00217CB4  54 00 0F FE */	srwi r0, r0, 0x1f
/* 8021ACB8 00217CB8  1C 00 00 18 */	mulli r0, r0, 0x18
/* 8021ACBC 00217CBC  7C 60 D2 14 */	add r3, r0, r26
/* 8021ACC0 00217CC0  38 03 FF FC */	addi r0, r3, -4
/* 8021ACC4 00217CC4  7C 65 00 2E */	lwzx r3, r5, r0
/* 8021ACC8 00217CC8  4B E4 31 E5 */	bl effGetTexObj
/* 8021ACCC 00217CCC  38 61 00 30 */	addi r3, r1, 0x30
/* 8021ACD0 00217CD0  38 80 00 00 */	li r4, 0
/* 8021ACD4 00217CD4  48 09 6D A9 */	bl GXLoadTexObj
/* 8021ACD8 00217CD8  80 02 FD 04 */	lwz r0, lbl_80421084@sda21(r2)
/* 8021ACDC 00217CDC  38 81 00 08 */	addi r4, r1, 8
/* 8021ACE0 00217CE0  38 60 00 04 */	li r3, 4
/* 8021ACE4 00217CE4  90 01 00 08 */	stw r0, 8(r1)
/* 8021ACE8 00217CE8  48 09 63 69 */	bl GXSetChanMatColor
.L_8021ACEC:
/* 8021ACEC 00217CEC  C0 58 00 04 */	lfs f2, 4(r24)
/* 8021ACF0 00217CF0  38 61 00 E0 */	addi r3, r1, 0xe0
/* 8021ACF4 00217CF4  C0 38 00 10 */	lfs f1, 0x10(r24)
/* 8021ACF8 00217CF8  C0 18 00 08 */	lfs f0, 8(r24)
/* 8021ACFC 00217CFC  EC 22 08 2A */	fadds f1, f2, f1
/* 8021AD00 00217D00  C0 78 00 0C */	lfs f3, 0xc(r24)
/* 8021AD04 00217D04  EC 40 D8 2A */	fadds f2, f0, f27
/* 8021AD08 00217D08  EC 3C 08 2A */	fadds f1, f28, f1
/* 8021AD0C 00217D0C  48 07 D7 21 */	bl PSMTXTrans
/* 8021AD10 00217D10  38 81 00 E0 */	addi r4, r1, 0xe0
/* 8021AD14 00217D14  38 61 00 50 */	addi r3, r1, 0x50
/* 8021AD18 00217D18  7C 85 23 78 */	mr r5, r4
/* 8021AD1C 00217D1C  48 07 D2 45 */	bl PSMTXConcat
/* 8021AD20 00217D20  C0 38 00 1C */	lfs f1, 0x1c(r24)
/* 8021AD24 00217D24  38 61 00 80 */	addi r3, r1, 0x80
/* 8021AD28 00217D28  C0 58 00 20 */	lfs f2, 0x20(r24)
/* 8021AD2C 00217D2C  C0 62 FD 0C */	lfs f3, lbl_8042108C@sda21(r2)
/* 8021AD30 00217D30  48 07 D7 7D */	bl PSMTXScale
/* 8021AD34 00217D34  38 61 00 E0 */	addi r3, r1, 0xe0
/* 8021AD38 00217D38  38 81 00 80 */	addi r4, r1, 0x80
/* 8021AD3C 00217D3C  7C 65 1B 78 */	mr r5, r3
/* 8021AD40 00217D40  48 07 D2 21 */	bl PSMTXConcat
/* 8021AD44 00217D44  38 61 00 E0 */	addi r3, r1, 0xe0
/* 8021AD48 00217D48  38 80 00 00 */	li r4, 0
/* 8021AD4C 00217D4C  48 09 97 AD */	bl GXLoadPosMtxImm
/* 8021AD50 00217D50  38 60 00 00 */	li r3, 0
/* 8021AD54 00217D54  48 09 98 45 */	bl GXSetCurrentMtx
/* 8021AD58 00217D58  38 60 00 80 */	li r3, 0x80
/* 8021AD5C 00217D5C  38 80 00 00 */	li r4, 0
/* 8021AD60 00217D60  38 A0 00 04 */	li r5, 4
/* 8021AD64 00217D64  48 09 4F 05 */	bl GXBegin
/* 8021AD68 00217D68  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 8021AD6C 00217D6C  3A F7 FF FF */	addi r23, r23, -1
/* 8021AD70 00217D70  81 5F 00 00 */	lwz r10, 0(r31)
/* 8021AD74 00217D74  3B 7B FF DC */	addi r27, r27, -36
/* 8021AD78 00217D78  80 63 01 6C */	lwz r3, 0x16c(r3)
/* 8021AD7C 00217D7C  81 3F 00 04 */	lwz r9, 4(r31)
/* 8021AD80 00217D80  7C 03 00 D0 */	neg r0, r3
/* 8021AD84 00217D84  81 1F 00 08 */	lwz r8, 8(r31)
/* 8021AD88 00217D88  7C 00 1B 78 */	or r0, r0, r3
/* 8021AD8C 00217D8C  80 FF 00 0C */	lwz r7, 0xc(r31)
/* 8021AD90 00217D90  80 DF 00 10 */	lwz r6, 0x10(r31)
/* 8021AD94 00217D94  54 00 2E F6 */	rlwinm r0, r0, 5, 0x1b, 0x1b
/* 8021AD98 00217D98  80 BF 00 14 */	lwz r5, 0x14(r31)
/* 8021AD9C 00217D9C  7C 00 D2 14 */	add r0, r0, r26
/* 8021ADA0 00217DA0  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 8021ADA4 00217DA4  3B 5A FF FC */	addi r26, r26, -4
/* 8021ADA8 00217DA8  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8021ADAC 00217DAC  91 41 00 10 */	stw r10, 0x10(r1)
/* 8021ADB0 00217DB0  91 21 00 14 */	stw r9, 0x14(r1)
/* 8021ADB4 00217DB4  91 01 00 18 */	stw r8, 0x18(r1)
/* 8021ADB8 00217DB8  90 E1 00 1C */	stw r7, 0x1c(r1)
/* 8021ADBC 00217DBC  90 C1 00 20 */	stw r6, 0x20(r1)
/* 8021ADC0 00217DC0  90 A1 00 24 */	stw r5, 0x24(r1)
/* 8021ADC4 00217DC4  90 81 00 28 */	stw r4, 0x28(r1)
/* 8021ADC8 00217DC8  90 61 00 2C */	stw r3, 0x2c(r1)
/* 8021ADCC 00217DCC  7C 13 00 2E */	lwzx r0, r19, r0
/* 8021ADD0 00217DD0  93 A1 01 18 */	stw r29, 0x118(r1)
/* 8021ADD4 00217DD4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8021ADD8 00217DD8  90 01 01 1C */	stw r0, 0x11c(r1)
/* 8021ADDC 00217DDC  C8 01 01 18 */	lfd f0, 0x118(r1)
/* 8021ADE0 00217DE0  EC 20 F8 28 */	fsubs f1, f0, f31
/* 8021ADE4 00217DE4  FC 00 08 50 */	fneg f0, f1
/* 8021ADE8 00217DE8  EC 21 07 72 */	fmuls f1, f1, f29
/* 8021ADEC 00217DEC  EC 40 07 72 */	fmuls f2, f0, f29
/* 8021ADF0 00217DF0  D0 54 80 00 */	stfs f2, -0x8000(r20)
/* 8021ADF4 00217DF4  D3 D4 80 00 */	stfs f30, -0x8000(r20)
/* 8021ADF8 00217DF8  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021ADFC 00217DFC  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE00 00217E00  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE04 00217E04  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE08 00217E08  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE0C 00217E0C  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE10 00217E10  D0 34 80 00 */	stfs f1, -0x8000(r20)
/* 8021AE14 00217E14  D3 D4 80 00 */	stfs f30, -0x8000(r20)
/* 8021AE18 00217E18  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE1C 00217E1C  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE20 00217E20  C0 02 FD 0C */	lfs f0, lbl_8042108C@sda21(r2)
/* 8021AE24 00217E24  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE28 00217E28  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE2C 00217E2C  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE30 00217E30  D0 34 80 00 */	stfs f1, -0x8000(r20)
/* 8021AE34 00217E34  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE38 00217E38  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE3C 00217E3C  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE40 00217E40  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE44 00217E44  C0 02 FD 0C */	lfs f0, lbl_8042108C@sda21(r2)
/* 8021AE48 00217E48  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE4C 00217E4C  C0 02 FD 0C */	lfs f0, lbl_8042108C@sda21(r2)
/* 8021AE50 00217E50  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE54 00217E54  D0 54 80 00 */	stfs f2, -0x8000(r20)
/* 8021AE58 00217E58  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE5C 00217E5C  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE60 00217E60  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE64 00217E64  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE68 00217E68  C0 02 FD 18 */	lfs f0, lbl_80421098@sda21(r2)
/* 8021AE6C 00217E6C  D0 14 80 00 */	stfs f0, -0x8000(r20)
/* 8021AE70 00217E70  C0 02 FD 0C */	lfs f0, lbl_8042108C@sda21(r2)
/* 8021AE74 00217E74  D0 14 80 00 */	stfs f0, -0x8000(r20)
.L_8021AE78:
/* 8021AE78 00217E78  2C 17 00 01 */	cmpwi r23, 1
/* 8021AE7C 00217E7C  40 80 FD 9C */	bge .L_8021AC18
/* 8021AE80 00217E80  36 D6 FF FF */	addic. r22, r22, -1
/* 8021AE84 00217E84  3B 39 FF FC */	addi r25, r25, -4
/* 8021AE88 00217E88  40 80 FD 6C */	bge .L_8021ABF4
/* 8021AE8C 00217E8C  E3 E1 01 A8 */	psq_l f31, 424(r1), 0, qr0
/* 8021AE90 00217E90  CB E1 01 A0 */	lfd f31, 0x1a0(r1)
/* 8021AE94 00217E94  E3 C1 01 98 */	psq_l f30, 408(r1), 0, qr0
/* 8021AE98 00217E98  CB C1 01 90 */	lfd f30, 0x190(r1)
/* 8021AE9C 00217E9C  E3 A1 01 88 */	psq_l f29, 392(r1), 0, qr0
/* 8021AEA0 00217EA0  CB A1 01 80 */	lfd f29, 0x180(r1)
/* 8021AEA4 00217EA4  E3 81 01 78 */	psq_l f28, 376(r1), 0, qr0
/* 8021AEA8 00217EA8  CB 81 01 70 */	lfd f28, 0x170(r1)
/* 8021AEAC 00217EAC  E3 61 01 68 */	psq_l f27, 360(r1), 0, qr0
/* 8021AEB0 00217EB0  CB 61 01 60 */	lfd f27, 0x160(r1)
/* 8021AEB4 00217EB4  BA 61 01 2C */	lmw r19, 0x12c(r1)
/* 8021AEB8 00217EB8  80 01 01 B4 */	lwz r0, 0x1b4(r1)
/* 8021AEBC 00217EBC  7C 08 03 A6 */	mtlr r0
/* 8021AEC0 00217EC0  38 21 01 B0 */	addi r1, r1, 0x1b0
/* 8021AEC4 00217EC4  4E 80 00 20 */	blr 
effLevelupMain:
/* 8021AEC8 00217EC8  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8021AECC 00217ECC  7C 08 02 A6 */	mflr r0
/* 8021AED0 00217ED0  3C 80 80 30 */	lis r4, lbl_802FE5C8@ha
/* 8021AED4 00217ED4  90 01 00 44 */	stw r0, 0x44(r1)
/* 8021AED8 00217ED8  38 A4 E5 C8 */	addi r5, r4, lbl_802FE5C8@l
/* 8021AEDC 00217EDC  BF 61 00 2C */	stmw r27, 0x2c(r1)
/* 8021AEE0 00217EE0  7C 7B 1B 78 */	mr r27, r3
/* 8021AEE4 00217EE4  3B 80 00 00 */	li r28, 0
/* 8021AEE8 00217EE8  3B A0 00 01 */	li r29, 1
/* 8021AEEC 00217EEC  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 8021AEF0 00217EF0  80 85 00 00 */	lwz r4, 0(r5)
/* 8021AEF4 00217EF4  80 65 00 04 */	lwz r3, 4(r5)
/* 8021AEF8 00217EF8  80 05 00 08 */	lwz r0, 8(r5)
/* 8021AEFC 00217EFC  90 81 00 08 */	stw r4, 8(r1)
/* 8021AF00 00217F00  C0 1F 00 04 */	lfs f0, 4(r31)
/* 8021AF04 00217F04  90 61 00 0C */	stw r3, 0xc(r1)
/* 8021AF08 00217F08  C0 3F 00 08 */	lfs f1, 8(r31)
/* 8021AF0C 00217F0C  D0 01 00 08 */	stfs f0, 8(r1)
/* 8021AF10 00217F10  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 8021AF14 00217F14  90 01 00 10 */	stw r0, 0x10(r1)
/* 8021AF18 00217F18  80 81 00 08 */	lwz r4, 8(r1)
/* 8021AF1C 00217F1C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 8021AF20 00217F20  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8021AF24 00217F24  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8021AF28 00217F28  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8021AF2C 00217F2C  90 81 00 14 */	stw r4, 0x14(r1)
/* 8021AF30 00217F30  90 61 00 18 */	stw r3, 0x18(r1)
/* 8021AF34 00217F34  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8021AF38 00217F38  83 DF 00 14 */	lwz r30, 0x14(r31)
/* 8021AF3C 00217F3C  3B FF 00 24 */	addi r31, r31, 0x24
/* 8021AF40 00217F40  48 00 01 E0 */	b .L_8021B120
.L_8021AF44:
/* 8021AF44 00217F44  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 8021AF48 00217F48  2C 00 00 02 */	cmpwi r0, 2
/* 8021AF4C 00217F4C  41 82 01 28 */	beq .L_8021B074
/* 8021AF50 00217F50  40 80 00 14 */	bge .L_8021AF64
/* 8021AF54 00217F54  2C 00 00 00 */	cmpwi r0, 0
/* 8021AF58 00217F58  41 82 00 1C */	beq .L_8021AF74
/* 8021AF5C 00217F5C  40 80 00 AC */	bge .L_8021B008
/* 8021AF60 00217F60  48 00 01 B8 */	b .L_8021B118
.L_8021AF64:
/* 8021AF64 00217F64  2C 00 00 04 */	cmpwi r0, 4
/* 8021AF68 00217F68  41 82 01 AC */	beq .L_8021B114
/* 8021AF6C 00217F6C  40 80 01 AC */	bge .L_8021B118
/* 8021AF70 00217F70  48 00 01 30 */	b .L_8021B0A0
.L_8021AF74:
/* 8021AF74 00217F74  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8021AF78 00217F78  38 03 00 01 */	addi r0, r3, 1
/* 8021AF7C 00217F7C  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021AF80 00217F80  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8021AF84 00217F84  28 03 00 2E */	cmplwi r3, 0x2e
/* 8021AF88 00217F88  40 80 00 68 */	bge .L_8021AFF0
/* 8021AF8C 00217F8C  3C 80 80 3B */	lis r4, lbl_803AE098@ha
/* 8021AF90 00217F90  3C 00 43 30 */	lis r0, 0x4330
/* 8021AF94 00217F94  54 65 08 3C */	slwi r5, r3, 1
/* 8021AF98 00217F98  3C 60 80 30 */	lis r3, lbl_802FE600@ha
/* 8021AF9C 00217F9C  38 84 E0 98 */	addi r4, r4, lbl_803AE098@l
/* 8021AFA0 00217FA0  90 01 00 20 */	stw r0, 0x20(r1)
/* 8021AFA4 00217FA4  7C 04 2A 2E */	lhzx r0, r4, r5
/* 8021AFA8 00217FA8  2C 1D 00 01 */	cmpwi r29, 1
/* 8021AFAC 00217FAC  C8 23 E6 00 */	lfd f1, lbl_802FE600@l(r3)
/* 8021AFB0 00217FB0  90 01 00 24 */	stw r0, 0x24(r1)
/* 8021AFB4 00217FB4  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 8021AFB8 00217FB8  EC 00 08 28 */	fsubs f0, f0, f1
/* 8021AFBC 00217FBC  D0 1F 00 08 */	stfs f0, 8(r31)
/* 8021AFC0 00217FC0  40 82 01 58 */	bne .L_8021B118
/* 8021AFC4 00217FC4  C0 22 FD 18 */	lfs f1, lbl_80421098@sda21(r2)
/* 8021AFC8 00217FC8  C0 1F 00 08 */	lfs f0, 8(r31)
/* 8021AFCC 00217FCC  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8021AFD0 00217FD0  40 82 01 48 */	bne .L_8021B118
/* 8021AFD4 00217FD4  38 6D EB 04 */	addi r3, r13, lbl_80415D64@sda21
/* 8021AFD8 00217FD8  38 80 00 00 */	li r4, 0
/* 8021AFDC 00217FDC  38 A0 00 00 */	li r5, 0
/* 8021AFE0 00217FE0  4B E1 BE 31 */	bl evtEntry
/* 8021AFE4 00217FE4  38 60 0A 57 */	li r3, 0xa57
/* 8021AFE8 00217FE8  4B EB A4 D9 */	bl psndSFXOn
/* 8021AFEC 00217FEC  48 00 01 2C */	b .L_8021B118
.L_8021AFF0:
/* 8021AFF0 00217FF0  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 8021AFF4 00217FF4  38 00 00 00 */	li r0, 0
/* 8021AFF8 00217FF8  38 63 00 01 */	addi r3, r3, 1
/* 8021AFFC 00217FFC  90 7F 00 18 */	stw r3, 0x18(r31)
/* 8021B000 00218000  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B004 00218004  48 00 01 14 */	b .L_8021B118
.L_8021B008:
/* 8021B008 00218008  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8021B00C 0021800C  38 03 00 01 */	addi r0, r3, 1
/* 8021B010 00218010  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B014 00218014  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 8021B018 00218018  28 04 00 13 */	cmplwi r4, 0x13
/* 8021B01C 0021801C  40 80 00 40 */	bge .L_8021B05C
/* 8021B020 00218020  2C 1D 00 02 */	cmpwi r29, 2
/* 8021B024 00218024  40 81 00 F4 */	ble .L_8021B118
/* 8021B028 00218028  38 6D EA F0 */	addi r3, r13, lbl_80415D50@sda21
/* 8021B02C 0021802C  3C 00 43 30 */	lis r0, 0x4330
/* 8021B030 00218030  7C 83 20 AE */	lbzx r4, r3, r4
/* 8021B034 00218034  3C 60 80 30 */	lis r3, lbl_802FE600@ha
/* 8021B038 00218038  90 01 00 20 */	stw r0, 0x20(r1)
/* 8021B03C 0021803C  C8 43 E6 00 */	lfd f2, lbl_802FE600@l(r3)
/* 8021B040 00218040  90 81 00 24 */	stw r4, 0x24(r1)
/* 8021B044 00218044  C0 02 FD 1C */	lfs f0, lbl_8042109C@sda21(r2)
/* 8021B048 00218048  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 8021B04C 0021804C  EC 21 10 28 */	fsubs f1, f1, f2
/* 8021B050 00218050  EC 01 00 24 */	fdivs f0, f1, f0
/* 8021B054 00218054  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 8021B058 00218058  48 00 00 C0 */	b .L_8021B118
.L_8021B05C:
/* 8021B05C 0021805C  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 8021B060 00218060  38 00 00 00 */	li r0, 0
/* 8021B064 00218064  38 63 00 01 */	addi r3, r3, 1
/* 8021B068 00218068  90 7F 00 18 */	stw r3, 0x18(r31)
/* 8021B06C 0021806C  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B070 00218070  48 00 00 A8 */	b .L_8021B118
.L_8021B074:
/* 8021B074 00218074  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8021B078 00218078  38 03 00 01 */	addi r0, r3, 1
/* 8021B07C 0021807C  7C 03 F0 00 */	cmpw r3, r30
/* 8021B080 00218080  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B084 00218084  40 81 00 94 */	ble .L_8021B118
/* 8021B088 00218088  38 00 00 00 */	li r0, 0
/* 8021B08C 0021808C  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B090 00218090  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 8021B094 00218094  38 03 00 01 */	addi r0, r3, 1
/* 8021B098 00218098  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8021B09C 0021809C  48 00 00 7C */	b .L_8021B118
.L_8021B0A0:
/* 8021B0A0 002180A0  2C 1D 00 02 */	cmpwi r29, 2
/* 8021B0A4 002180A4  40 80 00 24 */	bge .L_8021B0C8
/* 8021B0A8 002180A8  C0 22 FD 18 */	lfs f1, lbl_80421098@sda21(r2)
/* 8021B0AC 002180AC  38 60 00 01 */	li r3, 1
/* 8021B0B0 002180B0  C0 42 FD 20 */	lfs f2, lbl_804210A0@sda21(r2)
/* 8021B0B4 002180B4  38 A0 00 1E */	li r5, 0x1e
/* 8021B0B8 002180B8  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 8021B0BC 002180BC  4B DE BB 51 */	bl intplGetValue
/* 8021B0C0 002180C0  D0 3F 00 10 */	stfs f1, 0x10(r31)
/* 8021B0C4 002180C4  48 00 00 20 */	b .L_8021B0E4
.L_8021B0C8:
/* 8021B0C8 002180C8  C0 22 FD 18 */	lfs f1, lbl_80421098@sda21(r2)
/* 8021B0CC 002180CC  38 60 00 01 */	li r3, 1
/* 8021B0D0 002180D0  C0 42 FD 24 */	lfs f2, lbl_804210A4@sda21(r2)
/* 8021B0D4 002180D4  38 A0 00 1E */	li r5, 0x1e
/* 8021B0D8 002180D8  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 8021B0DC 002180DC  4B DE BB 31 */	bl intplGetValue
/* 8021B0E0 002180E0  D0 3F 00 10 */	stfs f1, 0x10(r31)
.L_8021B0E4:
/* 8021B0E4 002180E4  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8021B0E8 002180E8  38 03 00 01 */	addi r0, r3, 1
/* 8021B0EC 002180EC  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B0F0 002180F0  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 8021B0F4 002180F4  2C 00 00 1E */	cmpwi r0, 0x1e
/* 8021B0F8 002180F8  40 81 00 20 */	ble .L_8021B118
/* 8021B0FC 002180FC  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 8021B100 00218100  38 00 00 00 */	li r0, 0
/* 8021B104 00218104  38 63 00 01 */	addi r3, r3, 1
/* 8021B108 00218108  90 7F 00 18 */	stw r3, 0x18(r31)
/* 8021B10C 0021810C  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021B110 00218110  48 00 00 08 */	b .L_8021B118
.L_8021B114:
/* 8021B114 00218114  3B 9C 00 01 */	addi r28, r28, 1
.L_8021B118:
/* 8021B118 00218118  3B BD 00 01 */	addi r29, r29, 1
/* 8021B11C 0021811C  3B FF 00 24 */	addi r31, r31, 0x24
.L_8021B120:
/* 8021B120 00218120  80 7B 00 08 */	lwz r3, 8(r27)
/* 8021B124 00218124  7C 1D 18 00 */	cmpw r29, r3
/* 8021B128 00218128  41 80 FE 1C */	blt .L_8021AF44
/* 8021B12C 0021812C  38 03 FF FF */	addi r0, r3, -1
/* 8021B130 00218130  7C 1C 00 00 */	cmpw r28, r0
/* 8021B134 00218134  41 80 00 10 */	blt .L_8021B144
/* 8021B138 00218138  7F 63 DB 78 */	mr r3, r27
/* 8021B13C 0021813C  4B E4 2A 49 */	bl effDelete
/* 8021B140 00218140  48 00 00 24 */	b .L_8021B164
.L_8021B144:
/* 8021B144 00218144  38 61 00 14 */	addi r3, r1, 0x14
/* 8021B148 00218148  4B DF 55 79 */	bl dispCalcZ
/* 8021B14C 0021814C  3C 60 80 22 */	lis r3, effLevelupDisp@ha
/* 8021B150 00218150  7F 66 DB 78 */	mr r6, r27
/* 8021B154 00218154  38 A3 AA 24 */	addi r5, r3, effLevelupDisp@l
/* 8021B158 00218158  38 80 00 02 */	li r4, 2
/* 8021B15C 0021815C  38 60 00 08 */	li r3, 8
/* 8021B160 00218160  4B DF 58 B9 */	bl dispEntry
.L_8021B164:
/* 8021B164 00218164  BB 61 00 2C */	lmw r27, 0x2c(r1)
/* 8021B168 00218168  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8021B16C 0021816C  7C 08 03 A6 */	mtlr r0
/* 8021B170 00218170  38 21 00 40 */	addi r1, r1, 0x40
/* 8021B174 00218174  4E 80 00 20 */	blr 

.global effLevelupEntry
effLevelupEntry:
/* 8021B178 00218178  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 8021B17C 0021817C  7C 08 02 A6 */	mflr r0
/* 8021B180 00218180  90 01 00 A4 */	stw r0, 0xa4(r1)
/* 8021B184 00218184  DB E1 00 90 */	stfd f31, 0x90(r1)
/* 8021B188 00218188  F3 E1 00 98 */	psq_st f31, 152(r1), 0, qr0
/* 8021B18C 0021818C  DB C1 00 80 */	stfd f30, 0x80(r1)
/* 8021B190 00218190  F3 C1 00 88 */	psq_st f30, 136(r1), 0, qr0
/* 8021B194 00218194  DB A1 00 70 */	stfd f29, 0x70(r1)
/* 8021B198 00218198  F3 A1 00 78 */	psq_st f29, 120(r1), 0, qr0
/* 8021B19C 0021819C  BE C1 00 48 */	stmw r22, 0x48(r1)
/* 8021B1A0 002181A0  FF A0 08 90 */	fmr f29, f1
/* 8021B1A4 002181A4  7C 76 1B 78 */	mr r22, r3
/* 8021B1A8 002181A8  FF C0 10 90 */	fmr f30, f2
/* 8021B1AC 002181AC  7C 9E 23 78 */	mr r30, r4
/* 8021B1B0 002181B0  FF E0 18 90 */	fmr f31, f3
/* 8021B1B4 002181B4  4B E4 2C 09 */	bl effEntry
/* 8021B1B8 002181B8  3C 80 80 30 */	lis r4, lbl_802FE608@ha
/* 8021B1BC 002181BC  7C 7F 1B 78 */	mr r31, r3
/* 8021B1C0 002181C0  38 84 E6 08 */	addi r4, r4, lbl_802FE608@l
/* 8021B1C4 002181C4  38 00 00 04 */	li r0, 4
/* 8021B1C8 002181C8  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8021B1CC 002181CC  38 60 00 03 */	li r3, 3
/* 8021B1D0 002181D0  90 1F 00 08 */	stw r0, 8(r31)
/* 8021B1D4 002181D4  80 1F 00 08 */	lwz r0, 8(r31)
/* 8021B1D8 002181D8  1C 80 00 24 */	mulli r4, r0, 0x24
/* 8021B1DC 002181DC  4B E1 48 B1 */	bl __memAlloc
/* 8021B1E0 002181E0  3C 80 80 22 */	lis r4, effLevelupMain@ha
/* 8021B1E4 002181E4  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8021B1E8 002181E8  38 04 AE C8 */	addi r0, r4, effLevelupMain@l
/* 8021B1EC 002181EC  3C A0 80 30 */	lis r5, lbl_802FE5F8@ha
/* 8021B1F0 002181F0  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021B1F4 002181F4  3C 80 80 30 */	lis r4, lbl_802FE600@ha
/* 8021B1F8 002181F8  39 05 E5 F8 */	addi r8, r5, lbl_802FE5F8@l
/* 8021B1FC 002181FC  3D 20 80 30 */	lis r9, lbl_802FE5A0@ha
/* 8021B200 00218200  92 C3 00 00 */	stw r22, 0(r3)
/* 8021B204 00218204  38 A4 E6 00 */	addi r5, r4, lbl_802FE600@l
/* 8021B208 00218208  3C E0 80 3B */	lis r7, lbl_803AE098@ha
/* 8021B20C 0021820C  38 00 00 00 */	li r0, 0
/* 8021B210 00218210  D3 A3 00 04 */	stfs f29, 4(r3)
/* 8021B214 00218214  38 C3 00 24 */	addi r6, r3, 0x24
/* 8021B218 00218218  C8 88 00 00 */	lfd f4, 0(r8)
/* 8021B21C 0021821C  38 89 E5 A0 */	addi r4, r9, lbl_802FE5A0@l
/* 8021B220 00218220  D3 C3 00 08 */	stfs f30, 8(r3)
/* 8021B224 00218224  39 61 00 08 */	addi r11, r1, 8
/* 8021B228 00218228  C8 65 00 00 */	lfd f3, 0(r5)
/* 8021B22C 0021822C  39 07 E0 98 */	addi r8, r7, lbl_803AE098@l
/* 8021B230 00218230  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 8021B234 00218234  38 E0 00 01 */	li r7, 1
/* 8021B238 00218238  C0 42 FD 18 */	lfs f2, lbl_80421098@sda21(r2)
/* 8021B23C 0021823C  38 A0 00 04 */	li r5, 4
/* 8021B240 00218240  93 C3 00 14 */	stw r30, 0x14(r3)
/* 8021B244 00218244  3D 20 43 30 */	lis r9, 0x4330
/* 8021B248 00218248  C0 22 FD 0C */	lfs f1, lbl_8042108C@sda21(r2)
/* 8021B24C 0021824C  90 03 00 18 */	stw r0, 0x18(r3)
/* 8021B250 00218250  48 00 00 EC */	b .L_8021B33C
.L_8021B254:
/* 8021B254 00218254  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 8021B258 00218258  38 00 00 00 */	li r0, 0
/* 8021B25C 0021825C  82 C4 00 00 */	lwz r22, 0(r4)
/* 8021B260 00218260  2C 07 00 03 */	cmpwi r7, 3
/* 8021B264 00218264  80 63 01 6C */	lwz r3, 0x16c(r3)
/* 8021B268 00218268  82 E4 00 04 */	lwz r23, 4(r4)
/* 8021B26C 0021826C  7C 63 00 34 */	cntlzw r3, r3
/* 8021B270 00218270  83 04 00 08 */	lwz r24, 8(r4)
/* 8021B274 00218274  54 63 D9 7E */	srwi r3, r3, 5
/* 8021B278 00218278  83 24 00 0C */	lwz r25, 0xc(r4)
/* 8021B27C 0021827C  7C 63 00 34 */	cntlzw r3, r3
/* 8021B280 00218280  83 44 00 10 */	lwz r26, 0x10(r4)
/* 8021B284 00218284  54 63 D9 7E */	srwi r3, r3, 5
/* 8021B288 00218288  83 64 00 14 */	lwz r27, 0x14(r4)
/* 8021B28C 0021828C  1C 63 00 14 */	mulli r3, r3, 0x14
/* 8021B290 00218290  83 84 00 18 */	lwz r28, 0x18(r4)
/* 8021B294 00218294  83 A4 00 1C */	lwz r29, 0x1c(r4)
/* 8021B298 00218298  83 C4 00 20 */	lwz r30, 0x20(r4)
/* 8021B29C 0021829C  81 84 00 24 */	lwz r12, 0x24(r4)
/* 8021B2A0 002182A0  39 43 00 10 */	addi r10, r3, 0x10
/* 8021B2A4 002182A4  92 C1 00 08 */	stw r22, 8(r1)
/* 8021B2A8 002182A8  7C 63 2A 14 */	add r3, r3, r5
/* 8021B2AC 002182AC  92 E1 00 0C */	stw r23, 0xc(r1)
/* 8021B2B0 002182B0  93 01 00 10 */	stw r24, 0x10(r1)
/* 8021B2B4 002182B4  93 21 00 14 */	stw r25, 0x14(r1)
/* 8021B2B8 002182B8  93 41 00 18 */	stw r26, 0x18(r1)
/* 8021B2BC 002182BC  93 61 00 1C */	stw r27, 0x1c(r1)
/* 8021B2C0 002182C0  93 81 00 20 */	stw r28, 0x20(r1)
/* 8021B2C4 002182C4  93 A1 00 24 */	stw r29, 0x24(r1)
/* 8021B2C8 002182C8  93 C1 00 28 */	stw r30, 0x28(r1)
/* 8021B2CC 002182CC  91 81 00 2C */	stw r12, 0x2c(r1)
/* 8021B2D0 002182D0  7D 4B 50 2E */	lwzx r10, r11, r10
/* 8021B2D4 002182D4  7C 6B 18 2E */	lwzx r3, r11, r3
/* 8021B2D8 002182D8  91 21 00 30 */	stw r9, 0x30(r1)
/* 8021B2DC 002182DC  7C 6A 18 50 */	subf r3, r10, r3
/* 8021B2E0 002182E0  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8021B2E4 002182E4  91 21 00 38 */	stw r9, 0x38(r1)
/* 8021B2E8 002182E8  90 61 00 34 */	stw r3, 0x34(r1)
/* 8021B2EC 002182EC  C8 01 00 30 */	lfd f0, 0x30(r1)
/* 8021B2F0 002182F0  EC 00 20 28 */	fsubs f0, f0, f4
/* 8021B2F4 002182F4  D0 06 00 04 */	stfs f0, 4(r6)
/* 8021B2F8 002182F8  A0 68 00 00 */	lhz r3, 0(r8)
/* 8021B2FC 002182FC  90 61 00 3C */	stw r3, 0x3c(r1)
/* 8021B300 00218300  C8 01 00 38 */	lfd f0, 0x38(r1)
/* 8021B304 00218304  EC 00 18 28 */	fsubs f0, f0, f3
/* 8021B308 00218308  D0 06 00 08 */	stfs f0, 8(r6)
/* 8021B30C 0021830C  D0 46 00 0C */	stfs f2, 0xc(r6)
/* 8021B310 00218310  D0 46 00 10 */	stfs f2, 0x10(r6)
/* 8021B314 00218314  90 06 00 18 */	stw r0, 0x18(r6)
/* 8021B318 00218318  D0 26 00 1C */	stfs f1, 0x1c(r6)
/* 8021B31C 0021831C  40 80 00 0C */	bge .L_8021B328
/* 8021B320 00218320  FC 00 08 90 */	fmr f0, f1
/* 8021B324 00218324  48 00 00 08 */	b .L_8021B32C
.L_8021B328:
/* 8021B328 00218328  FC 00 10 90 */	fmr f0, f2
.L_8021B32C:
/* 8021B32C 0021832C  D0 06 00 20 */	stfs f0, 0x20(r6)
/* 8021B330 00218330  38 A5 00 04 */	addi r5, r5, 4
/* 8021B334 00218334  38 E7 00 01 */	addi r7, r7, 1
/* 8021B338 00218338  38 C6 00 24 */	addi r6, r6, 0x24
.L_8021B33C:
/* 8021B33C 0021833C  80 1F 00 08 */	lwz r0, 8(r31)
/* 8021B340 00218340  7C 07 00 00 */	cmpw r7, r0
/* 8021B344 00218344  41 80 FF 10 */	blt .L_8021B254
/* 8021B348 00218348  7F E3 FB 78 */	mr r3, r31
/* 8021B34C 0021834C  E3 E1 00 98 */	psq_l f31, 152(r1), 0, qr0
/* 8021B350 00218350  CB E1 00 90 */	lfd f31, 0x90(r1)
/* 8021B354 00218354  E3 C1 00 88 */	psq_l f30, 136(r1), 0, qr0
/* 8021B358 00218358  CB C1 00 80 */	lfd f30, 0x80(r1)
/* 8021B35C 0021835C  E3 A1 00 78 */	psq_l f29, 120(r1), 0, qr0
/* 8021B360 00218360  CB A1 00 70 */	lfd f29, 0x70(r1)
/* 8021B364 00218364  BA C1 00 48 */	lmw r22, 0x48(r1)
/* 8021B368 00218368  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 8021B36C 0021836C  7C 08 03 A6 */	mtlr r0
/* 8021B370 00218370  38 21 00 A0 */	addi r1, r1, 0xa0
/* 8021B374 00218374  4E 80 00 20 */	blr 
