.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effMahojinDisp
effMahojinDisp:
/* 8021CAD4 00219AD4  94 21 FF 00 */	stwu r1, -0x100(r1)
/* 8021CAD8 00219AD8  7C 08 02 A6 */	mflr r0
/* 8021CADC 00219ADC  90 01 01 04 */	stw r0, 0x104(r1)
/* 8021CAE0 00219AE0  BE 21 00 C4 */	stmw r17, 0xc4(r1)
/* 8021CAE4 00219AE4  7C 95 23 78 */	mr r21, r4
/* 8021CAE8 00219AE8  7C 74 1B 78 */	mr r20, r3
/* 8021CAEC 00219AEC  83 44 00 0C */	lwz r26, 0xc(r4)
/* 8021CAF0 00219AF0  4B DF 26 61 */	bl camGetPtr
/* 8021CAF4 00219AF4  83 1A 00 20 */	lwz r24, 0x20(r26)
/* 8021CAF8 00219AF8  4B E0 E3 1D */	bl mapGetWork
/* 8021CAFC 00219AFC  7C 7F 1B 78 */	mr r31, r3
/* 8021CB00 00219B00  3C 60 80 3B */	lis r3, lbl_803AE1F4@ha
/* 8021CB04 00219B04  A2 FF 00 04 */	lhz r23, 4(r31)
/* 8021CB08 00219B08  3B 81 00 10 */	addi r28, r1, 0x10
/* 8021CB0C 00219B0C  3B A1 00 50 */	addi r29, r1, 0x50
/* 8021CB10 00219B10  3A 63 E1 F4 */	addi r19, r3, lbl_803AE1F4@l
/* 8021CB14 00219B14  3B 20 00 00 */	li r25, 0
/* 8021CB18 00219B18  3B C0 00 00 */	li r30, 0
lbl_8021CB1C:
/* 8021CB1C 00219B1C  2C 19 00 00 */	cmpwi r25, 0
/* 8021CB20 00219B20  3A 40 00 00 */	li r18, 0
/* 8021CB24 00219B24  40 82 00 40 */	bne lbl_8021CB64
/* 8021CB28 00219B28  C0 02 FE 80 */	lfs f0, lbl_80421200@sda21(r2)
/* 8021CB2C 00219B2C  56 40 10 3A */	slwi r0, r18, 2
/* 8021CB30 00219B30  38 A1 00 10 */	addi r5, r1, 0x10
/* 8021CB34 00219B34  38 C0 00 00 */	li r6, 0
/* 8021CB38 00219B38  3A 40 00 01 */	li r18, 1
/* 8021CB3C 00219B3C  D0 01 00 50 */	stfs f0, 0x50(r1)
/* 8021CB40 00219B40  56 44 10 3A */	slwi r4, r18, 2
/* 8021CB44 00219B44  C0 02 FE 84 */	lfs f0, lbl_80421204@sda21(r2)
/* 8021CB48 00219B48  38 61 00 50 */	addi r3, r1, 0x50
/* 8021CB4C 00219B4C  7C C5 01 2E */	stwx r6, r5, r0
/* 8021CB50 00219B50  38 00 00 01 */	li r0, 1
/* 8021CB54 00219B54  3A 40 00 02 */	li r18, 2
/* 8021CB58 00219B58  7C 03 25 2E */	stfsx f0, r3, r4
/* 8021CB5C 00219B5C  7C 05 21 2E */	stwx r0, r5, r4
/* 8021CB60 00219B60  48 00 00 3C */	b lbl_8021CB9C
lbl_8021CB64:
/* 8021CB64 00219B64  C0 02 FE 84 */	lfs f0, lbl_80421204@sda21(r2)
/* 8021CB68 00219B68  56 40 10 3A */	slwi r0, r18, 2
/* 8021CB6C 00219B6C  38 A1 00 10 */	addi r5, r1, 0x10
/* 8021CB70 00219B70  38 C0 00 00 */	li r6, 0
/* 8021CB74 00219B74  3A 40 00 01 */	li r18, 1
/* 8021CB78 00219B78  D0 01 00 50 */	stfs f0, 0x50(r1)
/* 8021CB7C 00219B7C  56 44 10 3A */	slwi r4, r18, 2
/* 8021CB80 00219B80  C0 02 FE 88 */	lfs f0, lbl_80421208@sda21(r2)
/* 8021CB84 00219B84  38 61 00 50 */	addi r3, r1, 0x50
/* 8021CB88 00219B88  7C C5 01 2E */	stwx r6, r5, r0
/* 8021CB8C 00219B8C  38 00 00 01 */	li r0, 1
/* 8021CB90 00219B90  3A 40 00 02 */	li r18, 2
/* 8021CB94 00219B94  7C 03 25 2E */	stfsx f0, r3, r4
/* 8021CB98 00219B98  7C 05 21 2E */	stwx r0, r5, r4
lbl_8021CB9C:
/* 8021CB9C 00219B9C  56 56 10 3A */	slwi r22, r18, 2
/* 8021CBA0 00219BA0  3B 61 00 50 */	addi r27, r1, 0x50
/* 8021CBA4 00219BA4  3A 20 00 02 */	li r17, 2
/* 8021CBA8 00219BA8  7F 7B B2 14 */	add r27, r27, r22
/* 8021CBAC 00219BAC  48 00 00 2C */	b lbl_8021CBD8
lbl_8021CBB0:
/* 8021CBB0 00219BB0  38 11 FF FE */	addi r0, r17, -2
/* 8021CBB4 00219BB4  1C 00 00 0C */	mulli r0, r0, 0xc
/* 8021CBB8 00219BB8  7C 73 02 14 */	add r3, r19, r0
/* 8021CBBC 00219BBC  4B DF 3B 05 */	bl dispCalcZ
/* 8021CBC0 00219BC0  7E 3C B1 2E */	stwx r17, r28, r22
/* 8021CBC4 00219BC4  3A 31 00 01 */	addi r17, r17, 1
/* 8021CBC8 00219BC8  3A 52 00 01 */	addi r18, r18, 1
/* 8021CBCC 00219BCC  3A D6 00 04 */	addi r22, r22, 4
/* 8021CBD0 00219BD0  D0 3B 00 00 */	stfs f1, 0(r27)
/* 8021CBD4 00219BD4  3B 7B 00 04 */	addi r27, r27, 4
lbl_8021CBD8:
/* 8021CBD8 00219BD8  80 15 00 08 */	lwz r0, 8(r21)
/* 8021CBDC 00219BDC  7C 11 00 00 */	cmpw r17, r0
/* 8021CBE0 00219BE0  41 80 FF D0 */	blt lbl_8021CBB0
/* 8021CBE4 00219BE4  7F A5 EB 78 */	mr r5, r29
/* 8021CBE8 00219BE8  7F 86 E3 78 */	mr r6, r28
/* 8021CBEC 00219BEC  38 E0 00 00 */	li r7, 0
/* 8021CBF0 00219BF0  48 00 00 6C */	b lbl_8021CC5C
lbl_8021CBF4:
/* 8021CBF4 00219BF4  39 07 00 01 */	addi r8, r7, 1
/* 8021CBF8 00219BF8  38 61 00 50 */	addi r3, r1, 0x50
/* 8021CBFC 00219BFC  55 00 10 3A */	slwi r0, r8, 2
/* 8021CC00 00219C00  38 81 00 10 */	addi r4, r1, 0x10
/* 8021CC04 00219C04  7C 63 02 14 */	add r3, r3, r0
/* 8021CC08 00219C08  7C 84 02 14 */	add r4, r4, r0
/* 8021CC0C 00219C0C  48 00 00 38 */	b lbl_8021CC44
lbl_8021CC10:
/* 8021CC10 00219C10  C0 05 00 00 */	lfs f0, 0(r5)
/* 8021CC14 00219C14  C0 23 00 00 */	lfs f1, 0(r3)
/* 8021CC18 00219C18  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8021CC1C 00219C1C  40 81 00 1C */	ble lbl_8021CC38
/* 8021CC20 00219C20  81 26 00 00 */	lwz r9, 0(r6)
/* 8021CC24 00219C24  80 04 00 00 */	lwz r0, 0(r4)
/* 8021CC28 00219C28  D0 25 00 00 */	stfs f1, 0(r5)
/* 8021CC2C 00219C2C  90 06 00 00 */	stw r0, 0(r6)
/* 8021CC30 00219C30  D0 03 00 00 */	stfs f0, 0(r3)
/* 8021CC34 00219C34  91 24 00 00 */	stw r9, 0(r4)
lbl_8021CC38:
/* 8021CC38 00219C38  38 63 00 04 */	addi r3, r3, 4
/* 8021CC3C 00219C3C  38 84 00 04 */	addi r4, r4, 4
/* 8021CC40 00219C40  39 08 00 01 */	addi r8, r8, 1
lbl_8021CC44:
/* 8021CC44 00219C44  80 15 00 08 */	lwz r0, 8(r21)
/* 8021CC48 00219C48  7C 08 00 00 */	cmpw r8, r0
/* 8021CC4C 00219C4C  41 80 FF C4 */	blt lbl_8021CC10
/* 8021CC50 00219C50  38 A5 00 04 */	addi r5, r5, 4
/* 8021CC54 00219C54  38 C6 00 04 */	addi r6, r6, 4
/* 8021CC58 00219C58  38 E7 00 01 */	addi r7, r7, 1
lbl_8021CC5C:
/* 8021CC5C 00219C5C  80 75 00 08 */	lwz r3, 8(r21)
/* 8021CC60 00219C60  38 03 FF FF */	addi r0, r3, -1
/* 8021CC64 00219C64  7C 07 00 00 */	cmpw r7, r0
/* 8021CC68 00219C68  41 80 FF 8C */	blt lbl_8021CBF4
/* 8021CC6C 00219C6C  A0 1F 00 04 */	lhz r0, 4(r31)
/* 8021CC70 00219C70  38 61 00 90 */	addi r3, r1, 0x90
/* 8021CC74 00219C74  54 00 04 3C */	rlwinm r0, r0, 0, 0x10, 0x1e
/* 8021CC78 00219C78  B0 1F 00 04 */	sth r0, 4(r31)
/* 8021CC7C 00219C7C  C0 3A 00 04 */	lfs f1, 4(r26)
/* 8021CC80 00219C80  C0 5A 00 08 */	lfs f2, 8(r26)
/* 8021CC84 00219C84  C0 7A 00 0C */	lfs f3, 0xc(r26)
/* 8021CC88 00219C88  48 07 B7 A5 */	bl PSMTXTrans
/* 8021CC8C 00219C8C  7F 92 E3 78 */	mr r18, r28
/* 8021CC90 00219C90  3B 60 00 00 */	li r27, 0
/* 8021CC94 00219C94  48 00 00 B8 */	b lbl_8021CD4C
lbl_8021CC98:
/* 8021CC98 00219C98  80 12 00 00 */	lwz r0, 0(r18)
/* 8021CC9C 00219C9C  2C 19 00 01 */	cmpwi r25, 1
/* 8021CCA0 00219CA0  1C 00 00 30 */	mulli r0, r0, 0x30
/* 8021CCA4 00219CA4  7E DA 02 14 */	add r22, r26, r0
/* 8021CCA8 00219CA8  40 82 00 20 */	bne lbl_8021CCC8
/* 8021CCAC 00219CAC  80 96 00 28 */	lwz r4, 0x28(r22)
/* 8021CCB0 00219CB0  28 04 00 00 */	cmplwi r4, 0
/* 8021CCB4 00219CB4  41 82 00 14 */	beq lbl_8021CCC8
/* 8021CCB8 00219CB8  81 96 00 2C */	lwz r12, 0x2c(r22)
/* 8021CCBC 00219CBC  7E 83 A3 78 */	mr r3, r20
/* 8021CCC0 00219CC0  7D 89 03 A6 */	mtctr r12
/* 8021CCC4 00219CC4  4E 80 04 21 */	bctrl 
lbl_8021CCC8:
/* 8021CCC8 00219CC8  3A 36 00 18 */	addi r17, r22, 0x18
/* 8021CCCC 00219CCC  7C 7E 88 2E */	lwzx r3, r30, r17
/* 8021CCD0 00219CD0  2C 03 FF FF */	cmpwi r3, -1
/* 8021CCD4 00219CD4  41 82 00 70 */	beq lbl_8021CD44
/* 8021CCD8 00219CD8  4B E2 19 B9 */	bl animPoseMain
/* 8021CCDC 00219CDC  7C 7E 88 2E */	lwzx r3, r30, r17
/* 8021CCE0 00219CE0  38 80 00 40 */	li r4, 0x40
/* 8021CCE4 00219CE4  4B E2 33 B1 */	bl animPoseSetMaterialFlagOn
/* 8021CCE8 00219CE8  80 16 00 20 */	lwz r0, 0x20(r22)
/* 8021CCEC 00219CEC  3C 60 80 81 */	lis r3, 0x80808081@ha
/* 8021CCF0 00219CF0  80 A2 FE 7C */	lwz r5, lbl_804211FC@sda21(r2)
/* 8021CCF4 00219CF4  38 63 80 81 */	addi r3, r3, 0x80808081@l
/* 8021CCF8 00219CF8  7C 00 C1 D6 */	mullw r0, r0, r24
/* 8021CCFC 00219CFC  38 81 00 0C */	addi r4, r1, 0xc
/* 8021CD00 00219D00  90 A1 00 08 */	stw r5, 8(r1)
/* 8021CD04 00219D04  7C 63 00 96 */	mulhw r3, r3, r0
/* 8021CD08 00219D08  7C 03 02 14 */	add r0, r3, r0
/* 8021CD0C 00219D0C  7C 00 3E 70 */	srawi r0, r0, 7
/* 8021CD10 00219D10  54 03 0F FE */	srwi r3, r0, 0x1f
/* 8021CD14 00219D14  7C 00 1A 14 */	add r0, r0, r3
/* 8021CD18 00219D18  98 01 00 0B */	stb r0, 0xb(r1)
/* 8021CD1C 00219D1C  80 01 00 08 */	lwz r0, 8(r1)
/* 8021CD20 00219D20  90 01 00 0C */	stw r0, 0xc(r1)
/* 8021CD24 00219D24  7C 7E 88 2E */	lwzx r3, r30, r17
/* 8021CD28 00219D28  4B E2 32 F1 */	bl animPoseSetMaterialEvtColor
/* 8021CD2C 00219D2C  7C 7E 88 2E */	lwzx r3, r30, r17
/* 8021CD30 00219D30  38 81 00 90 */	addi r4, r1, 0x90
/* 8021CD34 00219D34  C0 22 FE 8C */	lfs f1, lbl_8042120C@sda21(r2)
/* 8021CD38 00219D38  38 A0 00 03 */	li r5, 3
/* 8021CD3C 00219D3C  C0 42 FE 90 */	lfs f2, lbl_80421210@sda21(r2)
/* 8021CD40 00219D40  4B E1 E0 FD */	bl animPoseDrawMtx
lbl_8021CD44:
/* 8021CD44 00219D44  3A 52 00 04 */	addi r18, r18, 4
/* 8021CD48 00219D48  3B 7B 00 01 */	addi r27, r27, 1
lbl_8021CD4C:
/* 8021CD4C 00219D4C  80 15 00 08 */	lwz r0, 8(r21)
/* 8021CD50 00219D50  7C 1B 00 00 */	cmpw r27, r0
/* 8021CD54 00219D54  41 80 FF 44 */	blt lbl_8021CC98
/* 8021CD58 00219D58  3B 39 00 01 */	addi r25, r25, 1
/* 8021CD5C 00219D5C  B2 FF 00 04 */	sth r23, 4(r31)
/* 8021CD60 00219D60  2C 19 00 02 */	cmpwi r25, 2
/* 8021CD64 00219D64  3B DE 00 04 */	addi r30, r30, 4
/* 8021CD68 00219D68  41 80 FD B4 */	blt lbl_8021CB1C
/* 8021CD6C 00219D6C  BA 21 00 C4 */	lmw r17, 0xc4(r1)
/* 8021CD70 00219D70  80 01 01 04 */	lwz r0, 0x104(r1)
/* 8021CD74 00219D74  7C 08 03 A6 */	mtlr r0
/* 8021CD78 00219D78  38 21 01 00 */	addi r1, r1, 0x100
/* 8021CD7C 00219D7C  4E 80 00 20 */	blr 
effMahojinMain:
/* 8021CD80 00219D80  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8021CD84 00219D84  7C 08 02 A6 */	mflr r0
/* 8021CD88 00219D88  90 01 00 54 */	stw r0, 0x54(r1)
/* 8021CD8C 00219D8C  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8021CD90 00219D90  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8021CD94 00219D94  BF 01 00 20 */	stmw r24, 0x20(r1)
/* 8021CD98 00219D98  3C 80 80 30 */	lis r4, lbl_802FE670@ha
/* 8021CD9C 00219D9C  7C 7A 1B 78 */	mr r26, r3
/* 8021CDA0 00219DA0  3B E4 E6 70 */	addi r31, r4, lbl_802FE670@l
/* 8021CDA4 00219DA4  83 A3 00 0C */	lwz r29, 0xc(r3)
/* 8021CDA8 00219DA8  80 9F 00 00 */	lwz r4, 0(r31)
/* 8021CDAC 00219DAC  80 7F 00 04 */	lwz r3, 4(r31)
/* 8021CDB0 00219DB0  80 1F 00 08 */	lwz r0, 8(r31)
/* 8021CDB4 00219DB4  90 81 00 08 */	stw r4, 8(r1)
/* 8021CDB8 00219DB8  C0 1D 00 04 */	lfs f0, 4(r29)
/* 8021CDBC 00219DBC  90 61 00 0C */	stw r3, 0xc(r1)
/* 8021CDC0 00219DC0  C0 3D 00 08 */	lfs f1, 8(r29)
/* 8021CDC4 00219DC4  D0 01 00 08 */	stfs f0, 8(r1)
/* 8021CDC8 00219DC8  C0 1D 00 0C */	lfs f0, 0xc(r29)
/* 8021CDCC 00219DCC  90 01 00 10 */	stw r0, 0x10(r1)
/* 8021CDD0 00219DD0  80 A1 00 08 */	lwz r5, 8(r1)
/* 8021CDD4 00219DD4  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 8021CDD8 00219DD8  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 8021CDDC 00219DDC  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8021CDE0 00219DE0  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8021CDE4 00219DE4  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8021CDE8 00219DE8  90 A1 00 14 */	stw r5, 0x14(r1)
/* 8021CDEC 00219DEC  C3 E2 FE 8C */	lfs f31, lbl_8042120C@sda21(r2)
/* 8021CDF0 00219DF0  90 81 00 18 */	stw r4, 0x18(r1)
/* 8021CDF4 00219DF4  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8021CDF8 00219DF8  80 83 00 14 */	lwz r4, 0x14(r3)
/* 8021CDFC 00219DFC  80 1D 00 18 */	lwz r0, 0x18(r29)
/* 8021CE00 00219E00  7C 64 00 D0 */	neg r3, r4
/* 8021CE04 00219E04  83 9D 00 00 */	lwz r28, 0(r29)
/* 8021CE08 00219E08  7C 63 23 78 */	or r3, r3, r4
/* 8021CE0C 00219E0C  2C 00 FF FF */	cmpwi r0, -1
/* 8021CE10 00219E10  54 7B 0F FE */	srwi r27, r3, 0x1f
/* 8021CE14 00219E14  40 82 00 B8 */	bne lbl_8021CECC
/* 8021CE18 00219E18  7F 64 DB 78 */	mr r4, r27
/* 8021CE1C 00219E1C  38 7F 00 0C */	addi r3, r31, 0xc
/* 8021CE20 00219E20  38 A0 00 00 */	li r5, 0
/* 8021CE24 00219E24  4B E1 C8 4D */	bl animGroupBaseAsync
/* 8021CE28 00219E28  2C 03 00 00 */	cmpwi r3, 0
/* 8021CE2C 00219E2C  41 82 04 C8 */	beq lbl_8021D2F4
/* 8021CE30 00219E30  7F 64 DB 78 */	mr r4, r27
/* 8021CE34 00219E34  38 7F 00 24 */	addi r3, r31, 0x24
/* 8021CE38 00219E38  38 A0 00 00 */	li r5, 0
/* 8021CE3C 00219E3C  4B E1 C8 35 */	bl animGroupBaseAsync
/* 8021CE40 00219E40  2C 03 00 00 */	cmpwi r3, 0
/* 8021CE44 00219E44  41 82 04 B0 */	beq lbl_8021D2F4
/* 8021CE48 00219E48  7F 64 DB 78 */	mr r4, r27
/* 8021CE4C 00219E4C  38 7F 00 0C */	addi r3, r31, 0xc
/* 8021CE50 00219E50  4B E2 42 81 */	bl animPoseEntry
/* 8021CE54 00219E54  90 7D 00 18 */	stw r3, 0x18(r29)
/* 8021CE58 00219E58  7F 64 DB 78 */	mr r4, r27
/* 8021CE5C 00219E5C  38 7F 00 24 */	addi r3, r31, 0x24
/* 8021CE60 00219E60  4B E2 42 71 */	bl animPoseEntry
/* 8021CE64 00219E64  90 7D 00 1C */	stw r3, 0x1c(r29)
/* 8021CE68 00219E68  38 82 FE 94 */	addi r4, r2, lbl_80421214@sda21
/* 8021CE6C 00219E6C  38 A0 00 01 */	li r5, 1
/* 8021CE70 00219E70  80 7D 00 18 */	lwz r3, 0x18(r29)
/* 8021CE74 00219E74  4B E2 3C 61 */	bl animPoseSetAnim
/* 8021CE78 00219E78  80 7D 00 1C */	lwz r3, 0x1c(r29)
/* 8021CE7C 00219E7C  38 82 FE 94 */	addi r4, r2, lbl_80421214@sda21
/* 8021CE80 00219E80  38 A0 00 01 */	li r5, 1
/* 8021CE84 00219E84  4B E2 3C 51 */	bl animPoseSetAnim
/* 8021CE88 00219E88  7F 64 DB 78 */	mr r4, r27
/* 8021CE8C 00219E8C  38 7F 00 0C */	addi r3, r31, 0xc
/* 8021CE90 00219E90  4B E2 42 41 */	bl animPoseEntry
/* 8021CE94 00219E94  90 7D 00 48 */	stw r3, 0x48(r29)
/* 8021CE98 00219E98  7F 64 DB 78 */	mr r4, r27
/* 8021CE9C 00219E9C  38 7F 00 24 */	addi r3, r31, 0x24
/* 8021CEA0 00219EA0  4B E2 42 31 */	bl animPoseEntry
/* 8021CEA4 00219EA4  90 7D 00 4C */	stw r3, 0x4c(r29)
/* 8021CEA8 00219EA8  38 82 FE 98 */	addi r4, r2, lbl_80421218@sda21
/* 8021CEAC 00219EAC  38 A0 00 01 */	li r5, 1
/* 8021CEB0 00219EB0  80 7D 00 48 */	lwz r3, 0x48(r29)
/* 8021CEB4 00219EB4  4B E2 3C 21 */	bl animPoseSetAnim
/* 8021CEB8 00219EB8  80 7D 00 4C */	lwz r3, 0x4c(r29)
/* 8021CEBC 00219EBC  38 82 FE 98 */	addi r4, r2, lbl_80421218@sda21
/* 8021CEC0 00219EC0  38 A0 00 01 */	li r5, 1
/* 8021CEC4 00219EC4  4B E2 3C 11 */	bl animPoseSetAnim
/* 8021CEC8 00219EC8  83 BA 00 0C */	lwz r29, 0xc(r26)
lbl_8021CECC:
/* 8021CECC 00219ECC  80 7A 00 00 */	lwz r3, 0(r26)
/* 8021CED0 00219ED0  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 8021CED4 00219ED4  41 82 00 14 */	beq lbl_8021CEE8
/* 8021CED8 00219ED8  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 8021CEDC 00219EDC  38 00 00 10 */	li r0, 0x10
/* 8021CEE0 00219EE0  90 7A 00 00 */	stw r3, 0(r26)
/* 8021CEE4 00219EE4  90 1D 00 10 */	stw r0, 0x10(r29)
lbl_8021CEE8:
/* 8021CEE8 00219EE8  80 7D 00 10 */	lwz r3, 0x10(r29)
/* 8021CEEC 00219EEC  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 8021CEF0 00219EF0  40 80 00 0C */	bge lbl_8021CEFC
/* 8021CEF4 00219EF4  38 03 FF FF */	addi r0, r3, -1
/* 8021CEF8 00219EF8  90 1D 00 10 */	stw r0, 0x10(r29)
lbl_8021CEFC:
/* 8021CEFC 00219EFC  80 7D 00 10 */	lwz r3, 0x10(r29)
/* 8021CF00 00219F00  2C 03 00 10 */	cmpwi r3, 0x10
/* 8021CF04 00219F04  40 80 00 18 */	bge lbl_8021CF1C
/* 8021CF08 00219F08  80 1D 00 20 */	lwz r0, 0x20(r29)
/* 8021CF0C 00219F0C  54 63 20 36 */	slwi r3, r3, 4
/* 8021CF10 00219F10  7C 00 18 00 */	cmpw r0, r3
/* 8021CF14 00219F14  40 81 00 08 */	ble lbl_8021CF1C
/* 8021CF18 00219F18  90 7D 00 20 */	stw r3, 0x20(r29)
lbl_8021CF1C:
/* 8021CF1C 00219F1C  80 1D 00 10 */	lwz r0, 0x10(r29)
/* 8021CF20 00219F20  2C 00 00 00 */	cmpwi r0, 0
/* 8021CF24 00219F24  40 80 00 50 */	bge lbl_8021CF74
/* 8021CF28 00219F28  83 1A 00 0C */	lwz r24, 0xc(r26)
/* 8021CF2C 00219F2C  3B 20 00 00 */	li r25, 0
/* 8021CF30 00219F30  48 00 00 2C */	b lbl_8021CF5C
lbl_8021CF34:
/* 8021CF34 00219F34  80 78 00 18 */	lwz r3, 0x18(r24)
/* 8021CF38 00219F38  2C 03 FF FF */	cmpwi r3, -1
/* 8021CF3C 00219F3C  41 82 00 08 */	beq lbl_8021CF44
/* 8021CF40 00219F40  4B E1 DC F5 */	bl animPoseRelease
lbl_8021CF44:
/* 8021CF44 00219F44  80 78 00 1C */	lwz r3, 0x1c(r24)
/* 8021CF48 00219F48  2C 03 FF FF */	cmpwi r3, -1
/* 8021CF4C 00219F4C  41 82 00 08 */	beq lbl_8021CF54
/* 8021CF50 00219F50  4B E1 DC E5 */	bl animPoseRelease
lbl_8021CF54:
/* 8021CF54 00219F54  3B 39 00 01 */	addi r25, r25, 1
/* 8021CF58 00219F58  3B 18 00 30 */	addi r24, r24, 0x30
lbl_8021CF5C:
/* 8021CF5C 00219F5C  80 1A 00 08 */	lwz r0, 8(r26)
/* 8021CF60 00219F60  7C 19 00 00 */	cmpw r25, r0
/* 8021CF64 00219F64  41 80 FF D0 */	blt lbl_8021CF34
/* 8021CF68 00219F68  7F 43 D3 78 */	mr r3, r26
/* 8021CF6C 00219F6C  4B E4 0C 19 */	bl effDelete
/* 8021CF70 00219F70  48 00 03 84 */	b lbl_8021D2F4
lbl_8021CF74:
/* 8021CF74 00219F74  83 DA 00 0C */	lwz r30, 0xc(r26)
/* 8021CF78 00219F78  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 8021CF7C 00219F7C  2C 00 00 01 */	cmpwi r0, 1
/* 8021CF80 00219F80  41 82 00 88 */	beq lbl_8021D008
/* 8021CF84 00219F84  40 80 00 10 */	bge lbl_8021CF94
/* 8021CF88 00219F88  2C 00 00 00 */	cmpwi r0, 0
/* 8021CF8C 00219F8C  40 80 00 14 */	bge lbl_8021CFA0
/* 8021CF90 00219F90  48 00 01 28 */	b lbl_8021D0B8
lbl_8021CF94:
/* 8021CF94 00219F94  2C 00 00 03 */	cmpwi r0, 3
/* 8021CF98 00219F98  40 80 01 20 */	bge lbl_8021D0B8
/* 8021CF9C 00219F9C  48 00 00 F4 */	b lbl_8021D090
lbl_8021CFA0:
/* 8021CFA0 00219FA0  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021CFA4 00219FA4  4B E2 31 5D */	bl animPoseGetLoopTimes
/* 8021CFA8 00219FA8  FF E0 08 90 */	fmr f31, f1
/* 8021CFAC 00219FAC  C0 02 FE 9C */	lfs f0, lbl_8042121C@sda21(r2)
/* 8021CFB0 00219FB0  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8021CFB4 00219FB4  40 81 01 04 */	ble lbl_8021D0B8
/* 8021CFB8 00219FB8  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021CFBC 00219FBC  38 82 FE A0 */	addi r4, r2, lbl_80421220@sda21
/* 8021CFC0 00219FC0  38 A0 00 01 */	li r5, 1
/* 8021CFC4 00219FC4  4B E2 3B 11 */	bl animPoseSetAnim
/* 8021CFC8 00219FC8  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 8021CFCC 00219FCC  38 82 FE A0 */	addi r4, r2, lbl_80421220@sda21
/* 8021CFD0 00219FD0  38 A0 00 01 */	li r5, 1
/* 8021CFD4 00219FD4  4B E2 3B 01 */	bl animPoseSetAnim
/* 8021CFD8 00219FD8  80 7E 00 48 */	lwz r3, 0x48(r30)
/* 8021CFDC 00219FDC  38 82 FE A4 */	addi r4, r2, lbl_80421224@sda21
/* 8021CFE0 00219FE0  38 A0 00 01 */	li r5, 1
/* 8021CFE4 00219FE4  4B E2 3A F1 */	bl animPoseSetAnim
/* 8021CFE8 00219FE8  80 7E 00 4C */	lwz r3, 0x4c(r30)
/* 8021CFEC 00219FEC  38 82 FE A4 */	addi r4, r2, lbl_80421224@sda21
/* 8021CFF0 00219FF0  38 A0 00 01 */	li r5, 1
/* 8021CFF4 00219FF4  4B E2 3A E1 */	bl animPoseSetAnim
/* 8021CFF8 00219FF8  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 8021CFFC 00219FFC  38 03 00 01 */	addi r0, r3, 1
/* 8021D000 0021A000  90 1E 00 24 */	stw r0, 0x24(r30)
/* 8021D004 0021A004  48 00 00 B4 */	b lbl_8021D0B8
lbl_8021D008:
/* 8021D008 0021A008  2C 1C 00 07 */	cmpwi r28, 7
/* 8021D00C 0021A00C  40 82 00 AC */	bne lbl_8021D0B8
/* 8021D010 0021A010  80 1A 00 08 */	lwz r0, 8(r26)
/* 8021D014 0021A014  1C 00 00 30 */	mulli r0, r0, 0x30
/* 8021D018 0021A018  7C 7E 02 14 */	add r3, r30, r0
/* 8021D01C 0021A01C  80 63 FF E8 */	lwz r3, -0x18(r3)
/* 8021D020 0021A020  4B E2 30 E1 */	bl animPoseGetLoopTimes
/* 8021D024 0021A024  C0 02 FE 9C */	lfs f0, lbl_8042121C@sda21(r2)
/* 8021D028 0021A028  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8021D02C 0021A02C  40 81 00 8C */	ble lbl_8021D0B8
/* 8021D030 0021A030  3C 80 80 22 */	lis r4, callback_DUPE_8021d470@ha
/* 8021D034 0021A034  38 60 00 0A */	li r3, 0xa
/* 8021D038 0021A038  38 84 D4 70 */	addi r4, r4, callback_DUPE_8021d470@l
/* 8021D03C 0021A03C  4B DF F4 29 */	bl mapSetTevCallback
/* 8021D040 0021A040  7F D8 F3 78 */	mr r24, r30
/* 8021D044 0021A044  3B 20 00 00 */	li r25, 0
/* 8021D048 0021A048  48 00 00 24 */	b lbl_8021D06C
lbl_8021D04C:
/* 8021D04C 0021A04C  80 78 00 18 */	lwz r3, 0x18(r24)
/* 8021D050 0021A050  3C 80 0A 00 */	lis r4, 0xa00
/* 8021D054 0021A054  4B E2 30 41 */	bl animPoseSetMaterialFlagOn
/* 8021D058 0021A058  80 78 00 1C */	lwz r3, 0x1c(r24)
/* 8021D05C 0021A05C  3C 80 0A 00 */	lis r4, 0xa00
/* 8021D060 0021A060  4B E2 30 35 */	bl animPoseSetMaterialFlagOn
/* 8021D064 0021A064  3B 18 00 30 */	addi r24, r24, 0x30
/* 8021D068 0021A068  3B 39 00 01 */	addi r25, r25, 1
lbl_8021D06C:
/* 8021D06C 0021A06C  80 1A 00 08 */	lwz r0, 8(r26)
/* 8021D070 0021A070  7C 19 00 00 */	cmpw r25, r0
/* 8021D074 0021A074  41 80 FF D8 */	blt lbl_8021D04C
/* 8021D078 0021A078  38 00 00 00 */	li r0, 0
/* 8021D07C 0021A07C  90 0D 18 E8 */	stw r0, lbl_80418B48@sda21(r13)
/* 8021D080 0021A080  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 8021D084 0021A084  38 03 00 01 */	addi r0, r3, 1
/* 8021D088 0021A088  90 1E 00 24 */	stw r0, 0x24(r30)
/* 8021D08C 0021A08C  48 00 00 2C */	b lbl_8021D0B8
lbl_8021D090:
/* 8021D090 0021A090  80 6D 18 E8 */	lwz r3, lbl_80418B48@sda21(r13)
/* 8021D094 0021A094  38 03 00 02 */	addi r0, r3, 2
/* 8021D098 0021A098  2C 00 00 FF */	cmpwi r0, 0xff
/* 8021D09C 0021A09C  90 0D 18 E8 */	stw r0, lbl_80418B48@sda21(r13)
/* 8021D0A0 0021A0A0  40 81 00 18 */	ble lbl_8021D0B8
/* 8021D0A4 0021A0A4  38 00 00 FF */	li r0, 0xff
/* 8021D0A8 0021A0A8  90 0D 18 E8 */	stw r0, lbl_80418B48@sda21(r13)
/* 8021D0AC 0021A0AC  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 8021D0B0 0021A0B0  38 03 00 01 */	addi r0, r3, 1
/* 8021D0B4 0021A0B4  90 1E 00 24 */	stw r0, 0x24(r30)
lbl_8021D0B8:
/* 8021D0B8 0021A0B8  83 DA 00 0C */	lwz r30, 0xc(r26)
/* 8021D0BC 0021A0BC  3B A0 00 02 */	li r29, 2
/* 8021D0C0 0021A0C0  3B DE 00 60 */	addi r30, r30, 0x60
/* 8021D0C4 0021A0C4  48 00 02 04 */	b lbl_8021D2C8
lbl_8021D0C8:
/* 8021D0C8 0021A0C8  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 8021D0CC 0021A0CC  2C 00 00 02 */	cmpwi r0, 2
/* 8021D0D0 0021A0D0  41 82 01 F0 */	beq lbl_8021D2C0
/* 8021D0D4 0021A0D4  40 80 00 14 */	bge lbl_8021D0E8
/* 8021D0D8 0021A0D8  2C 00 00 00 */	cmpwi r0, 0
/* 8021D0DC 0021A0DC  41 82 00 24 */	beq lbl_8021D100
/* 8021D0E0 0021A0E0  40 80 01 60 */	bge lbl_8021D240
/* 8021D0E4 0021A0E4  48 00 01 DC */	b lbl_8021D2C0
lbl_8021D0E8:
/* 8021D0E8 0021A0E8  2C 00 00 0B */	cmpwi r0, 0xb
/* 8021D0EC 0021A0EC  41 82 01 D4 */	beq lbl_8021D2C0
/* 8021D0F0 0021A0F0  40 80 01 D0 */	bge lbl_8021D2C0
/* 8021D0F4 0021A0F4  2C 00 00 0A */	cmpwi r0, 0xa
/* 8021D0F8 0021A0F8  40 80 01 74 */	bge lbl_8021D26C
/* 8021D0FC 0021A0FC  48 00 01 C4 */	b lbl_8021D2C0
lbl_8021D100:
/* 8021D100 0021A100  38 1D FF FF */	addi r0, r29, -1
/* 8021D104 0021A104  7C 00 E0 00 */	cmpw r0, r28
/* 8021D108 0021A108  40 80 00 C8 */	bge lbl_8021D1D0
/* 8021D10C 0021A10C  C0 02 FE A8 */	lfs f0, lbl_80421228@sda21(r2)
/* 8021D110 0021A110  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8021D114 0021A114  40 81 01 AC */	ble lbl_8021D2C0
/* 8021D118 0021A118  7F 64 DB 78 */	mr r4, r27
/* 8021D11C 0021A11C  38 7F 00 0C */	addi r3, r31, 0xc
/* 8021D120 0021A120  4B E2 3F B1 */	bl animPoseEntry
/* 8021D124 0021A124  90 7E 00 18 */	stw r3, 0x18(r30)
/* 8021D128 0021A128  7F 64 DB 78 */	mr r4, r27
/* 8021D12C 0021A12C  38 7F 00 24 */	addi r3, r31, 0x24
/* 8021D130 0021A130  4B E2 3F A1 */	bl animPoseEntry
/* 8021D134 0021A134  2C 1C 00 07 */	cmpwi r28, 7
/* 8021D138 0021A138  90 7E 00 1C */	stw r3, 0x1c(r30)
/* 8021D13C 0021A13C  41 82 00 48 */	beq lbl_8021D184
/* 8021D140 0021A140  2C 1C 00 08 */	cmpwi r28, 8
/* 8021D144 0021A144  41 82 00 40 */	beq lbl_8021D184
/* 8021D148 0021A148  38 1D FF FE */	addi r0, r29, -2
/* 8021D14C 0021A14C  3C 80 80 3B */	lis r4, lbl_803AE1A0@ha
/* 8021D150 0021A150  1C C0 00 0C */	mulli r6, r0, 0xc
/* 8021D154 0021A154  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021D158 0021A158  38 04 E1 A0 */	addi r0, r4, lbl_803AE1A0@l
/* 8021D15C 0021A15C  38 A0 00 01 */	li r5, 1
/* 8021D160 0021A160  7C 80 32 14 */	add r4, r0, r6
/* 8021D164 0021A164  3B 04 00 08 */	addi r24, r4, 8
/* 8021D168 0021A168  80 84 00 08 */	lwz r4, 8(r4)
/* 8021D16C 0021A16C  4B E2 39 69 */	bl animPoseSetAnim
/* 8021D170 0021A170  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 8021D174 0021A174  38 A0 00 01 */	li r5, 1
/* 8021D178 0021A178  80 98 00 00 */	lwz r4, 0(r24)
/* 8021D17C 0021A17C  4B E2 39 59 */	bl animPoseSetAnim
/* 8021D180 0021A180  48 00 00 3C */	b lbl_8021D1BC
lbl_8021D184:
/* 8021D184 0021A184  38 1D FF FE */	addi r0, r29, -2
/* 8021D188 0021A188  3C 80 80 3B */	lis r4, lbl_803AE1A0@ha
/* 8021D18C 0021A18C  1C C0 00 0C */	mulli r6, r0, 0xc
/* 8021D190 0021A190  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021D194 0021A194  38 04 E1 A0 */	addi r0, r4, lbl_803AE1A0@l
/* 8021D198 0021A198  38 A0 00 01 */	li r5, 1
/* 8021D19C 0021A19C  7C 80 32 14 */	add r4, r0, r6
/* 8021D1A0 0021A1A0  3B 04 00 04 */	addi r24, r4, 4
/* 8021D1A4 0021A1A4  80 84 00 04 */	lwz r4, 4(r4)
/* 8021D1A8 0021A1A8  4B E2 39 2D */	bl animPoseSetAnim
/* 8021D1AC 0021A1AC  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 8021D1B0 0021A1B0  38 A0 00 01 */	li r5, 1
/* 8021D1B4 0021A1B4  80 98 00 00 */	lwz r4, 0(r24)
/* 8021D1B8 0021A1B8  4B E2 39 1D */	bl animPoseSetAnim
lbl_8021D1BC:
/* 8021D1BC 0021A1BC  38 60 00 00 */	li r3, 0
/* 8021D1C0 0021A1C0  38 00 00 01 */	li r0, 1
/* 8021D1C4 0021A1C4  90 7E 00 20 */	stw r3, 0x20(r30)
/* 8021D1C8 0021A1C8  90 1E 00 24 */	stw r0, 0x24(r30)
/* 8021D1CC 0021A1CC  48 00 00 F4 */	b lbl_8021D2C0
lbl_8021D1D0:
/* 8021D1D0 0021A1D0  C0 02 FE AC */	lfs f0, lbl_8042122C@sda21(r2)
/* 8021D1D4 0021A1D4  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8021D1D8 0021A1D8  40 81 00 E8 */	ble lbl_8021D2C0
/* 8021D1DC 0021A1DC  7F 64 DB 78 */	mr r4, r27
/* 8021D1E0 0021A1E0  38 7F 00 0C */	addi r3, r31, 0xc
/* 8021D1E4 0021A1E4  4B E2 3E ED */	bl animPoseEntry
/* 8021D1E8 0021A1E8  90 7E 00 18 */	stw r3, 0x18(r30)
/* 8021D1EC 0021A1EC  7F 64 DB 78 */	mr r4, r27
/* 8021D1F0 0021A1F0  38 7F 00 24 */	addi r3, r31, 0x24
/* 8021D1F4 0021A1F4  4B E2 3E DD */	bl animPoseEntry
/* 8021D1F8 0021A1F8  38 1D FF FE */	addi r0, r29, -2
/* 8021D1FC 0021A1FC  90 7E 00 1C */	stw r3, 0x1c(r30)
/* 8021D200 0021A200  1F 00 00 0C */	mulli r24, r0, 0xc
/* 8021D204 0021A204  3C 80 80 3B */	lis r4, lbl_803AE1A0@ha
/* 8021D208 0021A208  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021D20C 0021A20C  38 A0 00 01 */	li r5, 1
/* 8021D210 0021A210  3B 24 E1 A0 */	addi r25, r4, lbl_803AE1A0@l
/* 8021D214 0021A214  7C 99 C0 2E */	lwzx r4, r25, r24
/* 8021D218 0021A218  4B E2 38 BD */	bl animPoseSetAnim
/* 8021D21C 0021A21C  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 8021D220 0021A220  38 A0 00 01 */	li r5, 1
/* 8021D224 0021A224  7C 99 C0 2E */	lwzx r4, r25, r24
/* 8021D228 0021A228  4B E2 38 AD */	bl animPoseSetAnim
/* 8021D22C 0021A22C  38 60 00 FF */	li r3, 0xff
/* 8021D230 0021A230  38 00 00 0A */	li r0, 0xa
/* 8021D234 0021A234  90 7E 00 20 */	stw r3, 0x20(r30)
/* 8021D238 0021A238  90 1E 00 24 */	stw r0, 0x24(r30)
/* 8021D23C 0021A23C  48 00 00 84 */	b lbl_8021D2C0
lbl_8021D240:
/* 8021D240 0021A240  80 7E 00 20 */	lwz r3, 0x20(r30)
/* 8021D244 0021A244  38 03 00 0A */	addi r0, r3, 0xa
/* 8021D248 0021A248  90 1E 00 20 */	stw r0, 0x20(r30)
/* 8021D24C 0021A24C  80 1E 00 20 */	lwz r0, 0x20(r30)
/* 8021D250 0021A250  2C 00 00 FF */	cmpwi r0, 0xff
/* 8021D254 0021A254  40 81 00 6C */	ble lbl_8021D2C0
/* 8021D258 0021A258  38 60 00 FF */	li r3, 0xff
/* 8021D25C 0021A25C  38 00 00 02 */	li r0, 2
/* 8021D260 0021A260  90 7E 00 20 */	stw r3, 0x20(r30)
/* 8021D264 0021A264  90 1E 00 24 */	stw r0, 0x24(r30)
/* 8021D268 0021A268  48 00 00 58 */	b lbl_8021D2C0
lbl_8021D26C:
/* 8021D26C 0021A26C  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021D270 0021A270  4B E2 2E 91 */	bl animPoseGetLoopTimes
/* 8021D274 0021A274  C0 02 FE 9C */	lfs f0, lbl_8042121C@sda21(r2)
/* 8021D278 0021A278  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8021D27C 0021A27C  40 81 00 44 */	ble lbl_8021D2C0
/* 8021D280 0021A280  38 1D FF FE */	addi r0, r29, -2
/* 8021D284 0021A284  3C 80 80 3B */	lis r4, lbl_803AE1A0@ha
/* 8021D288 0021A288  1C C0 00 0C */	mulli r6, r0, 0xc
/* 8021D28C 0021A28C  80 7E 00 18 */	lwz r3, 0x18(r30)
/* 8021D290 0021A290  38 04 E1 A0 */	addi r0, r4, lbl_803AE1A0@l
/* 8021D294 0021A294  38 A0 00 01 */	li r5, 1
/* 8021D298 0021A298  7C 80 32 14 */	add r4, r0, r6
/* 8021D29C 0021A29C  3B 04 00 04 */	addi r24, r4, 4
/* 8021D2A0 0021A2A0  80 84 00 04 */	lwz r4, 4(r4)
/* 8021D2A4 0021A2A4  4B E2 38 31 */	bl animPoseSetAnim
/* 8021D2A8 0021A2A8  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 8021D2AC 0021A2AC  38 A0 00 01 */	li r5, 1
/* 8021D2B0 0021A2B0  80 98 00 00 */	lwz r4, 0(r24)
/* 8021D2B4 0021A2B4  4B E2 38 21 */	bl animPoseSetAnim
/* 8021D2B8 0021A2B8  38 00 00 0B */	li r0, 0xb
/* 8021D2BC 0021A2BC  90 1E 00 24 */	stw r0, 0x24(r30)
lbl_8021D2C0:
/* 8021D2C0 0021A2C0  3B BD 00 01 */	addi r29, r29, 1
/* 8021D2C4 0021A2C4  3B DE 00 30 */	addi r30, r30, 0x30
lbl_8021D2C8:
/* 8021D2C8 0021A2C8  80 1A 00 08 */	lwz r0, 8(r26)
/* 8021D2CC 0021A2CC  7C 1D 00 00 */	cmpw r29, r0
/* 8021D2D0 0021A2D0  41 80 FD F8 */	blt lbl_8021D0C8
/* 8021D2D4 0021A2D4  38 61 00 14 */	addi r3, r1, 0x14
/* 8021D2D8 0021A2D8  4B DF 33 E9 */	bl dispCalcZ
/* 8021D2DC 0021A2DC  3C 60 80 22 */	lis r3, effMahojinDisp@ha
/* 8021D2E0 0021A2E0  7F 46 D3 78 */	mr r6, r26
/* 8021D2E4 0021A2E4  38 A3 CA D4 */	addi r5, r3, effMahojinDisp@l
/* 8021D2E8 0021A2E8  38 80 00 02 */	li r4, 2
/* 8021D2EC 0021A2EC  38 60 00 04 */	li r3, 4
/* 8021D2F0 0021A2F0  4B DF 37 29 */	bl dispEntry
lbl_8021D2F4:
/* 8021D2F4 0021A2F4  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8021D2F8 0021A2F8  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8021D2FC 0021A2FC  BB 01 00 20 */	lmw r24, 0x20(r1)
/* 8021D300 0021A300  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8021D304 0021A304  7C 08 03 A6 */	mtlr r0
/* 8021D308 0021A308  38 21 00 50 */	addi r1, r1, 0x50
/* 8021D30C 0021A30C  4E 80 00 20 */	blr 

.global effMahojinEntry
effMahojinEntry:
/* 8021D310 0021A310  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8021D314 0021A314  7C 08 02 A6 */	mflr r0
/* 8021D318 0021A318  90 01 00 34 */	stw r0, 0x34(r1)
/* 8021D31C 0021A31C  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 8021D320 0021A320  FF E0 18 90 */	fmr f31, f3
/* 8021D324 0021A324  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 8021D328 0021A328  FF C0 10 90 */	fmr f30, f2
/* 8021D32C 0021A32C  DB A1 00 18 */	stfd f29, 0x18(r1)
/* 8021D330 0021A330  FF A0 08 90 */	fmr f29, f1
/* 8021D334 0021A334  93 E1 00 14 */	stw r31, 0x14(r1)
/* 8021D338 0021A338  93 C1 00 10 */	stw r30, 0x10(r1)
/* 8021D33C 0021A33C  7C 7E 1B 78 */	mr r30, r3
/* 8021D340 0021A340  4B E4 0A 7D */	bl effEntry
/* 8021D344 0021A344  2C 1E 00 08 */	cmpwi r30, 8
/* 8021D348 0021A348  7C 7F 1B 78 */	mr r31, r3
/* 8021D34C 0021A34C  38 80 00 07 */	li r4, 7
/* 8021D350 0021A350  40 80 00 08 */	bge lbl_8021D358
/* 8021D354 0021A354  7F C4 F3 78 */	mr r4, r30
lbl_8021D358:
/* 8021D358 0021A358  3C 60 80 30 */	lis r3, lbl_802FE6AC@ha
/* 8021D35C 0021A35C  38 A4 00 02 */	addi r5, r4, 2
/* 8021D360 0021A360  38 03 E6 AC */	addi r0, r3, lbl_802FE6AC@l
/* 8021D364 0021A364  38 60 00 03 */	li r3, 3
/* 8021D368 0021A368  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8021D36C 0021A36C  1C 85 00 30 */	mulli r4, r5, 0x30
/* 8021D370 0021A370  90 BF 00 08 */	stw r5, 8(r31)
/* 8021D374 0021A374  4B E1 27 19 */	bl __memAlloc
/* 8021D378 0021A378  3C 80 80 22 */	lis r4, effMahojinMain@ha
/* 8021D37C 0021A37C  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8021D380 0021A380  38 04 CD 80 */	addi r0, r4, effMahojinMain@l
/* 8021D384 0021A384  38 C0 03 E8 */	li r6, 0x3e8
/* 8021D388 0021A388  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8021D38C 0021A38C  38 A0 00 00 */	li r5, 0
/* 8021D390 0021A390  38 80 FF FF */	li r4, -1
/* 8021D394 0021A394  38 00 00 FF */	li r0, 0xff
/* 8021D398 0021A398  80 FF 00 00 */	lwz r7, 0(r31)
/* 8021D39C 0021A39C  39 23 00 60 */	addi r9, r3, 0x60
/* 8021D3A0 0021A3A0  39 00 00 02 */	li r8, 2
/* 8021D3A4 0021A3A4  60 E7 00 02 */	ori r7, r7, 2
/* 8021D3A8 0021A3A8  90 FF 00 00 */	stw r7, 0(r31)
/* 8021D3AC 0021A3AC  93 C3 00 00 */	stw r30, 0(r3)
/* 8021D3B0 0021A3B0  D3 A3 00 04 */	stfs f29, 4(r3)
/* 8021D3B4 0021A3B4  D3 C3 00 08 */	stfs f30, 8(r3)
/* 8021D3B8 0021A3B8  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 8021D3BC 0021A3BC  90 C3 00 10 */	stw r6, 0x10(r3)
/* 8021D3C0 0021A3C0  90 A3 00 14 */	stw r5, 0x14(r3)
/* 8021D3C4 0021A3C4  90 83 00 18 */	stw r4, 0x18(r3)
/* 8021D3C8 0021A3C8  90 83 00 1C */	stw r4, 0x1c(r3)
/* 8021D3CC 0021A3CC  90 03 00 20 */	stw r0, 0x20(r3)
/* 8021D3D0 0021A3D0  90 A3 00 24 */	stw r5, 0x24(r3)
/* 8021D3D4 0021A3D4  90 A3 00 28 */	stw r5, 0x28(r3)
/* 8021D3D8 0021A3D8  90 A3 00 2C */	stw r5, 0x2c(r3)
/* 8021D3DC 0021A3DC  93 C3 00 30 */	stw r30, 0x30(r3)
/* 8021D3E0 0021A3E0  D3 A3 00 34 */	stfs f29, 0x34(r3)
/* 8021D3E4 0021A3E4  D3 C3 00 38 */	stfs f30, 0x38(r3)
/* 8021D3E8 0021A3E8  D3 E3 00 3C */	stfs f31, 0x3c(r3)
/* 8021D3EC 0021A3EC  90 C3 00 40 */	stw r6, 0x40(r3)
/* 8021D3F0 0021A3F0  90 A3 00 44 */	stw r5, 0x44(r3)
/* 8021D3F4 0021A3F4  90 83 00 48 */	stw r4, 0x48(r3)
/* 8021D3F8 0021A3F8  90 83 00 4C */	stw r4, 0x4c(r3)
/* 8021D3FC 0021A3FC  90 03 00 50 */	stw r0, 0x50(r3)
/* 8021D400 0021A400  90 A3 00 54 */	stw r5, 0x54(r3)
/* 8021D404 0021A404  90 A3 00 58 */	stw r5, 0x58(r3)
/* 8021D408 0021A408  90 A3 00 5C */	stw r5, 0x5c(r3)
/* 8021D40C 0021A40C  48 00 00 30 */	b lbl_8021D43C
lbl_8021D410:
/* 8021D410 0021A410  D3 A9 00 04 */	stfs f29, 4(r9)
/* 8021D414 0021A414  39 08 00 01 */	addi r8, r8, 1
/* 8021D418 0021A418  D3 C9 00 08 */	stfs f30, 8(r9)
/* 8021D41C 0021A41C  D3 E9 00 0C */	stfs f31, 0xc(r9)
/* 8021D420 0021A420  90 89 00 18 */	stw r4, 0x18(r9)
/* 8021D424 0021A424  90 89 00 1C */	stw r4, 0x1c(r9)
/* 8021D428 0021A428  90 A9 00 20 */	stw r5, 0x20(r9)
/* 8021D42C 0021A42C  90 A9 00 24 */	stw r5, 0x24(r9)
/* 8021D430 0021A430  90 A9 00 28 */	stw r5, 0x28(r9)
/* 8021D434 0021A434  90 A9 00 2C */	stw r5, 0x2c(r9)
/* 8021D438 0021A438  39 29 00 30 */	addi r9, r9, 0x30
lbl_8021D43C:
/* 8021D43C 0021A43C  80 1F 00 08 */	lwz r0, 8(r31)
/* 8021D440 0021A440  7C 08 00 00 */	cmpw r8, r0
/* 8021D444 0021A444  41 80 FF CC */	blt lbl_8021D410
/* 8021D448 0021A448  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8021D44C 0021A44C  7F E3 FB 78 */	mr r3, r31
/* 8021D450 0021A450  CB E1 00 28 */	lfd f31, 0x28(r1)
/* 8021D454 0021A454  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 8021D458 0021A458  CB A1 00 18 */	lfd f29, 0x18(r1)
/* 8021D45C 0021A45C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 8021D460 0021A460  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 8021D464 0021A464  7C 08 03 A6 */	mtlr r0
/* 8021D468 0021A468  38 21 00 30 */	addi r1, r1, 0x30
/* 8021D46C 0021A46C  4E 80 00 20 */	blr 
callback_DUPE_8021d470:
/* 8021D470 0021A470  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8021D474 0021A474  7C 08 02 A6 */	mflr r0
/* 8021D478 0021A478  90 01 00 34 */	stw r0, 0x34(r1)
/* 8021D47C 0021A47C  38 81 00 0C */	addi r4, r1, 0xc
/* 8021D480 0021A480  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 8021D484 0021A484  7C 7B 1B 78 */	mr r27, r3
/* 8021D488 0021A488  38 60 00 01 */	li r3, 1
/* 8021D48C 0021A48C  80 A2 FE 78 */	lwz r5, lbl_804211F8@sda21(r2)
/* 8021D490 0021A490  80 0D 18 E8 */	lwz r0, lbl_80418B48@sda21(r13)
/* 8021D494 0021A494  90 A1 00 08 */	stw r5, 8(r1)
/* 8021D498 0021A498  83 FB 00 0C */	lwz r31, 0xc(r27)
/* 8021D49C 0021A49C  98 01 00 0B */	stb r0, 0xb(r1)
/* 8021D4A0 0021A4A0  83 DB 00 10 */	lwz r30, 0x10(r27)
/* 8021D4A4 0021A4A4  83 BB 00 14 */	lwz r29, 0x14(r27)
/* 8021D4A8 0021A4A8  83 9B 00 18 */	lwz r28, 0x18(r27)
/* 8021D4AC 0021A4AC  80 01 00 08 */	lwz r0, 8(r1)
/* 8021D4B0 0021A4B0  90 01 00 0C */	stw r0, 0xc(r1)
/* 8021D4B4 0021A4B4  48 09 58 01 */	bl GXSetTevColor
/* 8021D4B8 0021A4B8  7F E3 FB 78 */	mr r3, r31
/* 8021D4BC 0021A4BC  38 80 00 FF */	li r4, 0xff
/* 8021D4C0 0021A4C0  38 A0 00 FF */	li r5, 0xff
/* 8021D4C4 0021A4C4  38 C0 00 FF */	li r6, 0xff
/* 8021D4C8 0021A4C8  48 09 5B 65 */	bl GXSetTevOrder
/* 8021D4CC 0021A4CC  7F E3 FB 78 */	mr r3, r31
/* 8021D4D0 0021A4D0  38 80 00 00 */	li r4, 0
/* 8021D4D4 0021A4D4  38 A0 00 00 */	li r5, 0
/* 8021D4D8 0021A4D8  38 C0 00 00 */	li r6, 0
/* 8021D4DC 0021A4DC  38 E0 00 01 */	li r7, 1
/* 8021D4E0 0021A4E0  39 00 00 00 */	li r8, 0
/* 8021D4E4 0021A4E4  48 09 57 01 */	bl GXSetTevColorOp
/* 8021D4E8 0021A4E8  7F E3 FB 78 */	mr r3, r31
/* 8021D4EC 0021A4EC  38 80 00 00 */	li r4, 0
/* 8021D4F0 0021A4F0  38 A0 00 00 */	li r5, 0
/* 8021D4F4 0021A4F4  38 C0 00 00 */	li r6, 0
/* 8021D4F8 0021A4F8  38 E0 00 01 */	li r7, 1
/* 8021D4FC 0021A4FC  39 00 00 00 */	li r8, 0
/* 8021D500 0021A500  48 09 57 4D */	bl GXSetTevAlphaOp
/* 8021D504 0021A504  7F E3 FB 78 */	mr r3, r31
/* 8021D508 0021A508  38 80 00 00 */	li r4, 0
/* 8021D50C 0021A50C  38 A0 00 02 */	li r5, 2
/* 8021D510 0021A510  38 C0 00 03 */	li r6, 3
/* 8021D514 0021A514  38 E0 00 0F */	li r7, 0xf
/* 8021D518 0021A518  48 09 56 45 */	bl GXSetTevColorIn
/* 8021D51C 0021A51C  7F E3 FB 78 */	mr r3, r31
/* 8021D520 0021A520  38 80 00 07 */	li r4, 7
/* 8021D524 0021A524  38 A0 00 07 */	li r5, 7
/* 8021D528 0021A528  38 C0 00 07 */	li r6, 7
/* 8021D52C 0021A52C  38 E0 00 00 */	li r7, 0
/* 8021D530 0021A530  48 09 56 71 */	bl GXSetTevAlphaIn
/* 8021D534 0021A534  7F E3 FB 78 */	mr r3, r31
/* 8021D538 0021A538  38 80 00 00 */	li r4, 0
/* 8021D53C 0021A53C  38 A0 00 00 */	li r5, 0
/* 8021D540 0021A540  48 09 59 55 */	bl GXSetTevSwapMode
/* 8021D544 0021A544  38 1F 00 01 */	addi r0, r31, 1
/* 8021D548 0021A548  90 1B 00 0C */	stw r0, 0xc(r27)
/* 8021D54C 0021A54C  93 BB 00 14 */	stw r29, 0x14(r27)
/* 8021D550 0021A550  93 9B 00 18 */	stw r28, 0x18(r27)
/* 8021D554 0021A554  93 DB 00 10 */	stw r30, 0x10(r27)
/* 8021D558 0021A558  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 8021D55C 0021A55C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8021D560 0021A560  7C 08 03 A6 */	mtlr r0
/* 8021D564 0021A564  38 21 00 30 */	addi r1, r1, 0x30
/* 8021D568 0021A568  4E 80 00 20 */	blr 
