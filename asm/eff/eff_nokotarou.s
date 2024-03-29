.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effNokotarouDisp
effNokotarouDisp:
/* 80253D44 00250D44  94 21 FF 20 */	stwu r1, -0xe0(r1)
/* 80253D48 00250D48  7C 08 02 A6 */	mflr r0
/* 80253D4C 00250D4C  90 01 00 E4 */	stw r0, 0xe4(r1)
/* 80253D50 00250D50  DB E1 00 D0 */	stfd f31, 0xd0(r1)
/* 80253D54 00250D54  F3 E1 00 D8 */	psq_st f31, 216(r1), 0, qr0
/* 80253D58 00250D58  DB C1 00 C0 */	stfd f30, 0xc0(r1)
/* 80253D5C 00250D5C  F3 C1 00 C8 */	psq_st f30, 200(r1), 0, qr0
/* 80253D60 00250D60  DB A1 00 B0 */	stfd f29, 0xb0(r1)
/* 80253D64 00250D64  F3 A1 00 B8 */	psq_st f29, 184(r1), 0, qr0
/* 80253D68 00250D68  93 E1 00 AC */	stw r31, 0xac(r1)
/* 80253D6C 00250D6C  93 C1 00 A8 */	stw r30, 0xa8(r1)
/* 80253D70 00250D70  7C 7E 1B 78 */	mr r30, r3
/* 80253D74 00250D74  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 80253D78 00250D78  4B DB B3 D9 */	bl camGetPtr
/* 80253D7C 00250D7C  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 80253D80 00250D80  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 80253D84 00250D84  C0 1F 00 1C */	lfs f0, 0x1c(r31)
/* 80253D88 00250D88  2C 00 FF FF */	cmpwi r0, -1
/* 80253D8C 00250D8C  EF E1 00 32 */	fmuls f31, f1, f0
/* 80253D90 00250D90  41 82 02 2C */	beq .L_80253FBC
/* 80253D94 00250D94  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80253D98 00250D98  38 61 00 78 */	addi r3, r1, 0x78
/* 80253D9C 00250D9C  C0 5F 00 14 */	lfs f2, 0x14(r31)
/* 80253DA0 00250DA0  C0 7F 00 18 */	lfs f3, 0x18(r31)
/* 80253DA4 00250DA4  48 04 46 89 */	bl PSMTXTrans
/* 80253DA8 00250DA8  FC 20 F8 90 */	fmr f1, f31
/* 80253DAC 00250DAC  38 61 00 18 */	addi r3, r1, 0x18
/* 80253DB0 00250DB0  FC 40 F8 90 */	fmr f2, f31
/* 80253DB4 00250DB4  FC 60 F8 90 */	fmr f3, f31
/* 80253DB8 00250DB8  48 04 46 F5 */	bl PSMTXScale
/* 80253DBC 00250DBC  7F C3 F3 78 */	mr r3, r30
/* 80253DC0 00250DC0  4B DB B3 91 */	bl camGetPtr
/* 80253DC4 00250DC4  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 80253DC8 00250DC8  38 61 00 48 */	addi r3, r1, 0x48
/* 80253DCC 00250DCC  C0 02 11 08 */	lfs f0, lbl_80422488@sda21(r2)
/* 80253DD0 00250DD0  38 80 00 79 */	li r4, 0x79
/* 80253DD4 00250DD4  FC 20 08 50 */	fneg f1, f1
/* 80253DD8 00250DD8  EC 20 00 72 */	fmuls f1, f0, f1
/* 80253DDC 00250DDC  48 04 44 11 */	bl PSMTXRotRad
/* 80253DE0 00250DE0  38 61 00 78 */	addi r3, r1, 0x78
/* 80253DE4 00250DE4  38 81 00 48 */	addi r4, r1, 0x48
/* 80253DE8 00250DE8  7C 65 1B 78 */	mr r5, r3
/* 80253DEC 00250DEC  48 04 41 75 */	bl PSMTXConcat
/* 80253DF0 00250DF0  38 61 00 78 */	addi r3, r1, 0x78
/* 80253DF4 00250DF4  38 81 00 18 */	addi r4, r1, 0x18
/* 80253DF8 00250DF8  7C 65 1B 78 */	mr r5, r3
/* 80253DFC 00250DFC  48 04 41 65 */	bl PSMTXConcat
/* 80253E00 00250E00  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80253E04 00250E04  38 80 00 40 */	li r4, 0x40
/* 80253E08 00250E08  4B DE C2 8D */	bl animPoseSetMaterialFlagOn
/* 80253E0C 00250E0C  80 62 11 00 */	lwz r3, lbl_80422480@sda21(r2)
/* 80253E10 00250E10  38 81 00 14 */	addi r4, r1, 0x14
/* 80253E14 00250E14  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 80253E18 00250E18  90 61 00 10 */	stw r3, 0x10(r1)
/* 80253E1C 00250E1C  98 01 00 13 */	stb r0, 0x13(r1)
/* 80253E20 00250E20  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80253E24 00250E24  90 01 00 14 */	stw r0, 0x14(r1)
/* 80253E28 00250E28  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80253E2C 00250E2C  4B DE C1 ED */	bl animPoseSetMaterialEvtColor
/* 80253E30 00250E30  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80253E34 00250E34  4B DE A8 5D */	bl animPoseMain
/* 80253E38 00250E38  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80253E3C 00250E3C  38 81 00 78 */	addi r4, r1, 0x78
/* 80253E40 00250E40  C0 22 11 0C */	lfs f1, lbl_8042248C@sda21(r2)
/* 80253E44 00250E44  38 A0 00 01 */	li r5, 1
/* 80253E48 00250E48  C0 42 11 10 */	lfs f2, lbl_80422490@sda21(r2)
/* 80253E4C 00250E4C  4B DE 6F F1 */	bl animPoseDrawMtx
/* 80253E50 00250E50  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80253E54 00250E54  38 81 00 78 */	addi r4, r1, 0x78
/* 80253E58 00250E58  C0 22 11 0C */	lfs f1, lbl_8042248C@sda21(r2)
/* 80253E5C 00250E5C  38 A0 00 02 */	li r5, 2
/* 80253E60 00250E60  C0 42 11 10 */	lfs f2, lbl_80422490@sda21(r2)
/* 80253E64 00250E64  4B DE 6F D9 */	bl animPoseDrawMtx
/* 80253E68 00250E68  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80253E6C 00250E6C  38 81 00 78 */	addi r4, r1, 0x78
/* 80253E70 00250E70  C0 22 11 0C */	lfs f1, lbl_8042248C@sda21(r2)
/* 80253E74 00250E74  38 A0 00 03 */	li r5, 3
/* 80253E78 00250E78  C0 42 11 10 */	lfs f2, lbl_80422490@sda21(r2)
/* 80253E7C 00250E7C  4B DE 6F C1 */	bl animPoseDrawMtx
/* 80253E80 00250E80  80 1F 00 34 */	lwz r0, 0x34(r31)
/* 80253E84 00250E84  2C 00 FF FF */	cmpwi r0, -1
/* 80253E88 00250E88  41 82 01 34 */	beq .L_80253FBC
/* 80253E8C 00250E8C  C0 5F 00 14 */	lfs f2, 0x14(r31)
/* 80253E90 00250E90  38 61 00 78 */	addi r3, r1, 0x78
/* 80253E94 00250E94  C0 3F 00 08 */	lfs f1, 8(r31)
/* 80253E98 00250E98  C0 7F 00 18 */	lfs f3, 0x18(r31)
/* 80253E9C 00250E9C  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 80253EA0 00250EA0  EC 82 08 28 */	fsubs f4, f2, f1
/* 80253EA4 00250EA4  C0 C2 11 14 */	lfs f6, lbl_80422494@sda21(r2)
/* 80253EA8 00250EA8  EC 03 00 28 */	fsubs f0, f3, f0
/* 80253EAC 00250EAC  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80253EB0 00250EB0  C0 BF 00 04 */	lfs f5, 4(r31)
/* 80253EB4 00250EB4  EC 84 30 24 */	fdivs f4, f4, f6
/* 80253EB8 00250EB8  C1 1F 00 1C */	lfs f8, 0x1c(r31)
/* 80253EBC 00250EBC  EC E1 28 28 */	fsubs f7, f1, f5
/* 80253EC0 00250EC0  C0 A2 11 18 */	lfs f5, lbl_80422498@sda21(r2)
/* 80253EC4 00250EC4  EC 00 30 24 */	fdivs f0, f0, f6
/* 80253EC8 00250EC8  EF E7 30 24 */	fdivs f31, f7, f6
/* 80253ECC 00250ECC  EF C5 20 2A */	fadds f30, f5, f4
/* 80253ED0 00250ED0  EF A5 00 2A */	fadds f29, f5, f0
/* 80253ED4 00250ED4  EF FF 02 32 */	fmuls f31, f31, f8
/* 80253ED8 00250ED8  EF DE 02 32 */	fmuls f30, f30, f8
/* 80253EDC 00250EDC  EF BD 02 32 */	fmuls f29, f29, f8
/* 80253EE0 00250EE0  48 04 45 4D */	bl PSMTXTrans
/* 80253EE4 00250EE4  FC 20 F8 90 */	fmr f1, f31
/* 80253EE8 00250EE8  38 61 00 18 */	addi r3, r1, 0x18
/* 80253EEC 00250EEC  FC 40 F0 90 */	fmr f2, f30
/* 80253EF0 00250EF0  FC 60 E8 90 */	fmr f3, f29
/* 80253EF4 00250EF4  48 04 45 B9 */	bl PSMTXScale
/* 80253EF8 00250EF8  7F C3 F3 78 */	mr r3, r30
/* 80253EFC 00250EFC  4B DB B2 55 */	bl camGetPtr
/* 80253F00 00250F00  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 80253F04 00250F04  38 61 00 48 */	addi r3, r1, 0x48
/* 80253F08 00250F08  C0 02 11 08 */	lfs f0, lbl_80422488@sda21(r2)
/* 80253F0C 00250F0C  38 80 00 79 */	li r4, 0x79
/* 80253F10 00250F10  FC 20 08 50 */	fneg f1, f1
/* 80253F14 00250F14  EC 20 00 72 */	fmuls f1, f0, f1
/* 80253F18 00250F18  48 04 42 D5 */	bl PSMTXRotRad
/* 80253F1C 00250F1C  38 61 00 78 */	addi r3, r1, 0x78
/* 80253F20 00250F20  38 81 00 48 */	addi r4, r1, 0x48
/* 80253F24 00250F24  7C 65 1B 78 */	mr r5, r3
/* 80253F28 00250F28  48 04 40 39 */	bl PSMTXConcat
/* 80253F2C 00250F2C  38 61 00 78 */	addi r3, r1, 0x78
/* 80253F30 00250F30  38 81 00 18 */	addi r4, r1, 0x18
/* 80253F34 00250F34  7C 65 1B 78 */	mr r5, r3
/* 80253F38 00250F38  48 04 40 29 */	bl PSMTXConcat
/* 80253F3C 00250F3C  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80253F40 00250F40  38 80 00 40 */	li r4, 0x40
/* 80253F44 00250F44  4B DE C1 51 */	bl animPoseSetMaterialFlagOn
/* 80253F48 00250F48  80 62 11 04 */	lwz r3, lbl_80422484@sda21(r2)
/* 80253F4C 00250F4C  38 81 00 0C */	addi r4, r1, 0xc
/* 80253F50 00250F50  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 80253F54 00250F54  90 61 00 08 */	stw r3, 8(r1)
/* 80253F58 00250F58  98 01 00 0B */	stb r0, 0xb(r1)
/* 80253F5C 00250F5C  80 01 00 08 */	lwz r0, 8(r1)
/* 80253F60 00250F60  90 01 00 0C */	stw r0, 0xc(r1)
/* 80253F64 00250F64  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80253F68 00250F68  4B DE C0 B1 */	bl animPoseSetMaterialEvtColor
/* 80253F6C 00250F6C  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80253F70 00250F70  4B DE A7 21 */	bl animPoseMain
/* 80253F74 00250F74  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80253F78 00250F78  38 81 00 78 */	addi r4, r1, 0x78
/* 80253F7C 00250F7C  C0 22 11 0C */	lfs f1, lbl_8042248C@sda21(r2)
/* 80253F80 00250F80  38 A0 00 01 */	li r5, 1
/* 80253F84 00250F84  C0 42 11 10 */	lfs f2, lbl_80422490@sda21(r2)
/* 80253F88 00250F88  4B DE 6E B5 */	bl animPoseDrawMtx
/* 80253F8C 00250F8C  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80253F90 00250F90  38 81 00 78 */	addi r4, r1, 0x78
/* 80253F94 00250F94  C0 22 11 0C */	lfs f1, lbl_8042248C@sda21(r2)
/* 80253F98 00250F98  38 A0 00 02 */	li r5, 2
/* 80253F9C 00250F9C  C0 42 11 10 */	lfs f2, lbl_80422490@sda21(r2)
/* 80253FA0 00250FA0  4B DE 6E 9D */	bl animPoseDrawMtx
/* 80253FA4 00250FA4  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80253FA8 00250FA8  38 81 00 78 */	addi r4, r1, 0x78
/* 80253FAC 00250FAC  C0 22 11 0C */	lfs f1, lbl_8042248C@sda21(r2)
/* 80253FB0 00250FB0  38 A0 00 03 */	li r5, 3
/* 80253FB4 00250FB4  C0 42 11 10 */	lfs f2, lbl_80422490@sda21(r2)
/* 80253FB8 00250FB8  4B DE 6E 85 */	bl animPoseDrawMtx
.L_80253FBC:
/* 80253FBC 00250FBC  E3 E1 00 D8 */	psq_l f31, 216(r1), 0, qr0
/* 80253FC0 00250FC0  CB E1 00 D0 */	lfd f31, 0xd0(r1)
/* 80253FC4 00250FC4  E3 C1 00 C8 */	psq_l f30, 200(r1), 0, qr0
/* 80253FC8 00250FC8  CB C1 00 C0 */	lfd f30, 0xc0(r1)
/* 80253FCC 00250FCC  E3 A1 00 B8 */	psq_l f29, 184(r1), 0, qr0
/* 80253FD0 00250FD0  CB A1 00 B0 */	lfd f29, 0xb0(r1)
/* 80253FD4 00250FD4  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 80253FD8 00250FD8  80 01 00 E4 */	lwz r0, 0xe4(r1)
/* 80253FDC 00250FDC  83 C1 00 A8 */	lwz r30, 0xa8(r1)
/* 80253FE0 00250FE0  7C 08 03 A6 */	mtlr r0
/* 80253FE4 00250FE4  38 21 00 E0 */	addi r1, r1, 0xe0
/* 80253FE8 00250FE8  4E 80 00 20 */	blr 
effNokotarouMain:
/* 80253FEC 00250FEC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80253FF0 00250FF0  7C 08 02 A6 */	mflr r0
/* 80253FF4 00250FF4  3C 80 80 30 */	lis r4, lbl_80301498@ha
/* 80253FF8 00250FF8  90 01 00 34 */	stw r0, 0x34(r1)
/* 80253FFC 00250FFC  38 C4 14 98 */	addi r6, r4, lbl_80301498@l
/* 80254000 00251000  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80254004 00251004  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80254008 00251008  7C 7E 1B 78 */	mr r30, r3
/* 8025400C 0025100C  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80254010 00251010  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 80254014 00251014  3C 60 80 30 */	lis r3, lbl_803014A4@ha
/* 80254018 00251018  80 A6 00 00 */	lwz r5, 0(r6)
/* 8025401C 0025101C  38 63 14 A4 */	addi r3, r3, lbl_803014A4@l
/* 80254020 00251020  80 86 00 04 */	lwz r4, 4(r6)
/* 80254024 00251024  80 06 00 08 */	lwz r0, 8(r6)
/* 80254028 00251028  90 A1 00 08 */	stw r5, 8(r1)
/* 8025402C 0025102C  38 A0 00 00 */	li r5, 0
/* 80254030 00251030  C0 1F 00 10 */	lfs f0, 0x10(r31)
/* 80254034 00251034  90 81 00 0C */	stw r4, 0xc(r1)
/* 80254038 00251038  C0 3F 00 14 */	lfs f1, 0x14(r31)
/* 8025403C 0025103C  D0 01 00 08 */	stfs f0, 8(r1)
/* 80254040 00251040  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 80254044 00251044  90 01 00 10 */	stw r0, 0x10(r1)
/* 80254048 00251048  80 E1 00 08 */	lwz r7, 8(r1)
/* 8025404C 0025104C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 80254050 00251050  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80254054 00251054  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80254058 00251058  80 C1 00 0C */	lwz r6, 0xc(r1)
/* 8025405C 0025105C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80254060 00251060  90 E1 00 14 */	stw r7, 0x14(r1)
/* 80254064 00251064  90 C1 00 18 */	stw r6, 0x18(r1)
/* 80254068 00251068  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8025406C 0025106C  80 84 00 14 */	lwz r4, 0x14(r4)
/* 80254070 00251070  7C 04 00 D0 */	neg r0, r4
/* 80254074 00251074  7C 00 23 78 */	or r0, r0, r4
/* 80254078 00251078  54 1D 0F FE */	srwi r29, r0, 0x1f
/* 8025407C 0025107C  7F A4 EB 78 */	mr r4, r29
/* 80254080 00251080  4B DE 55 F1 */	bl animGroupBaseAsync
/* 80254084 00251084  2C 03 00 00 */	cmpwi r3, 0
/* 80254088 00251088  41 82 01 20 */	beq .L_802541A8
/* 8025408C 0025108C  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 80254090 00251090  2C 00 FF FF */	cmpwi r0, -1
/* 80254094 00251094  40 82 00 4C */	bne .L_802540E0
/* 80254098 00251098  3C 60 80 30 */	lis r3, lbl_803014A4@ha
/* 8025409C 0025109C  7F A4 EB 78 */	mr r4, r29
/* 802540A0 002510A0  38 63 14 A4 */	addi r3, r3, lbl_803014A4@l
/* 802540A4 002510A4  4B DE D0 2D */	bl animPoseEntry
/* 802540A8 002510A8  90 7F 00 30 */	stw r3, 0x30(r31)
/* 802540AC 002510AC  38 82 11 1C */	addi r4, r2, lbl_8042249C@sda21
/* 802540B0 002510B0  38 A0 00 01 */	li r5, 1
/* 802540B4 002510B4  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 802540B8 002510B8  4B DE CA 1D */	bl animPoseSetAnim
/* 802540BC 002510BC  3C 60 80 30 */	lis r3, lbl_803014A4@ha
/* 802540C0 002510C0  7F A4 EB 78 */	mr r4, r29
/* 802540C4 002510C4  38 63 14 A4 */	addi r3, r3, lbl_803014A4@l
/* 802540C8 002510C8  4B DE D0 09 */	bl animPoseEntry
/* 802540CC 002510CC  90 7F 00 34 */	stw r3, 0x34(r31)
/* 802540D0 002510D0  38 82 11 20 */	addi r4, r2, lbl_804224A0@sda21
/* 802540D4 002510D4  38 A0 00 01 */	li r5, 1
/* 802540D8 002510D8  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 802540DC 002510DC  4B DE C9 F9 */	bl animPoseSetAnim
.L_802540E0:
/* 802540E0 002510E0  80 7E 00 00 */	lwz r3, 0(r30)
/* 802540E4 002510E4  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 802540E8 002510E8  41 82 00 14 */	beq .L_802540FC
/* 802540EC 002510EC  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 802540F0 002510F0  38 00 00 20 */	li r0, 0x20
/* 802540F4 002510F4  90 7E 00 00 */	stw r3, 0(r30)
/* 802540F8 002510F8  90 1F 00 28 */	stw r0, 0x28(r31)
.L_802540FC:
/* 802540FC 002510FC  80 7F 00 28 */	lwz r3, 0x28(r31)
/* 80254100 00251100  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 80254104 00251104  40 80 00 0C */	bge .L_80254110
/* 80254108 00251108  38 03 FF FF */	addi r0, r3, -1
/* 8025410C 0025110C  90 1F 00 28 */	stw r0, 0x28(r31)
.L_80254110:
/* 80254110 00251110  80 1F 00 28 */	lwz r0, 0x28(r31)
/* 80254114 00251114  2C 00 00 00 */	cmpwi r0, 0
/* 80254118 00251118  40 80 00 30 */	bge .L_80254148
/* 8025411C 0025111C  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 80254120 00251120  2C 03 FF FF */	cmpwi r3, -1
/* 80254124 00251124  41 82 00 08 */	beq .L_8025412C
/* 80254128 00251128  4B DE 6B 0D */	bl animPoseRelease
.L_8025412C:
/* 8025412C 0025112C  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 80254130 00251130  2C 03 FF FF */	cmpwi r3, -1
/* 80254134 00251134  41 82 00 08 */	beq .L_8025413C
/* 80254138 00251138  4B DE 6A FD */	bl animPoseRelease
.L_8025413C:
/* 8025413C 0025113C  7F C3 F3 78 */	mr r3, r30
/* 80254140 00251140  4B E0 9A 45 */	bl effDelete
/* 80254144 00251144  48 00 00 64 */	b .L_802541A8
.L_80254148:
/* 80254148 00251148  2C 00 00 20 */	cmpwi r0, 0x20
/* 8025414C 0025114C  40 80 00 24 */	bge .L_80254170
/* 80254150 00251150  54 00 18 38 */	slwi r0, r0, 3
/* 80254154 00251154  C0 02 11 24 */	lfs f0, lbl_804224A4@sda21(r2)
/* 80254158 00251158  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8025415C 0025115C  C0 5F 00 20 */	lfs f2, 0x20(r31)
/* 80254160 00251160  FC 20 10 50 */	fneg f1, f2
/* 80254164 00251164  EC 01 10 3A */	fmadds f0, f1, f0, f2
/* 80254168 00251168  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 8025416C 0025116C  48 00 00 1C */	b .L_80254188
.L_80254170:
/* 80254170 00251170  C0 22 11 18 */	lfs f1, lbl_80422498@sda21(r2)
/* 80254174 00251174  C0 5F 00 20 */	lfs f2, 0x20(r31)
/* 80254178 00251178  C0 02 11 24 */	lfs f0, lbl_804224A4@sda21(r2)
/* 8025417C 0025117C  EC 21 10 28 */	fsubs f1, f1, f2
/* 80254180 00251180  EC 01 10 3A */	fmadds f0, f1, f0, f2
/* 80254184 00251184  D0 1F 00 20 */	stfs f0, 0x20(r31)
.L_80254188:
/* 80254188 00251188  38 61 00 14 */	addi r3, r1, 0x14
/* 8025418C 0025118C  4B DB C5 35 */	bl dispCalcZ
/* 80254190 00251190  3C 60 80 25 */	lis r3, effNokotarouDisp@ha
/* 80254194 00251194  7F C6 F3 78 */	mr r6, r30
/* 80254198 00251198  38 A3 3D 44 */	addi r5, r3, effNokotarouDisp@l
/* 8025419C 0025119C  38 80 00 02 */	li r4, 2
/* 802541A0 002511A0  38 60 00 04 */	li r3, 4
/* 802541A4 002511A4  4B DB C8 75 */	bl dispEntry
.L_802541A8:
/* 802541A8 002511A8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 802541AC 002511AC  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 802541B0 002511B0  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 802541B4 002511B4  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 802541B8 002511B8  7C 08 03 A6 */	mtlr r0
/* 802541BC 002511BC  38 21 00 30 */	addi r1, r1, 0x30
/* 802541C0 002511C0  4E 80 00 20 */	blr 

.global effNokotarouEntry
effNokotarouEntry:
/* 802541C4 002511C4  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 802541C8 002511C8  7C 08 02 A6 */	mflr r0
/* 802541CC 002511CC  90 01 00 64 */	stw r0, 0x64(r1)
/* 802541D0 002511D0  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 802541D4 002511D4  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 802541D8 002511D8  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 802541DC 002511DC  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 802541E0 002511E0  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 802541E4 002511E4  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 802541E8 002511E8  DB 81 00 20 */	stfd f28, 0x20(r1)
/* 802541EC 002511EC  F3 81 00 28 */	psq_st f28, 40(r1), 0, qr0
/* 802541F0 002511F0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 802541F4 002511F4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 802541F8 002511F8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 802541FC 002511FC  FF 80 08 90 */	fmr f28, f1
/* 80254200 00251200  7C 7D 1B 78 */	mr r29, r3
/* 80254204 00251204  FF A0 10 90 */	fmr f29, f2
/* 80254208 00251208  7C 9E 23 78 */	mr r30, r4
/* 8025420C 0025120C  FF C0 18 90 */	fmr f30, f3
/* 80254210 00251210  FF E0 20 90 */	fmr f31, f4
/* 80254214 00251214  4B E0 9B A9 */	bl effEntry
/* 80254218 00251218  3C 80 80 30 */	lis r4, lbl_803014B8@ha
/* 8025421C 0025121C  7C 7F 1B 78 */	mr r31, r3
/* 80254220 00251220  38 84 14 B8 */	addi r4, r4, lbl_803014B8@l
/* 80254224 00251224  38 00 00 01 */	li r0, 1
/* 80254228 00251228  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8025422C 0025122C  38 60 00 03 */	li r3, 3
/* 80254230 00251230  38 80 00 38 */	li r4, 0x38
/* 80254234 00251234  90 1F 00 08 */	stw r0, 8(r31)
/* 80254238 00251238  4B DD B8 55 */	bl __memAlloc
/* 8025423C 0025123C  3C 80 80 25 */	lis r4, effNokotarouMain@ha
/* 80254240 00251240  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80254244 00251244  38 04 3F EC */	addi r0, r4, effNokotarouMain@l
/* 80254248 00251248  C0 02 11 0C */	lfs f0, lbl_8042248C@sda21(r2)
/* 8025424C 0025124C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80254250 00251250  2C 1E 00 00 */	cmpwi r30, 0
/* 80254254 00251254  38 00 00 FF */	li r0, 0xff
/* 80254258 00251258  80 9F 00 00 */	lwz r4, 0(r31)
/* 8025425C 0025125C  60 84 00 02 */	ori r4, r4, 2
/* 80254260 00251260  90 9F 00 00 */	stw r4, 0(r31)
/* 80254264 00251264  93 A3 00 00 */	stw r29, 0(r3)
/* 80254268 00251268  D3 83 00 04 */	stfs f28, 4(r3)
/* 8025426C 0025126C  D3 A3 00 08 */	stfs f29, 8(r3)
/* 80254270 00251270  D3 C3 00 0C */	stfs f30, 0xc(r3)
/* 80254274 00251274  C0 23 00 04 */	lfs f1, 4(r3)
/* 80254278 00251278  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 8025427C 0025127C  C0 23 00 08 */	lfs f1, 8(r3)
/* 80254280 00251280  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 80254284 00251284  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 80254288 00251288  D0 23 00 18 */	stfs f1, 0x18(r3)
/* 8025428C 0025128C  D3 E3 00 1C */	stfs f31, 0x1c(r3)
/* 80254290 00251290  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 80254294 00251294  90 03 00 24 */	stw r0, 0x24(r3)
/* 80254298 00251298  41 81 00 10 */	bgt .L_802542A8
/* 8025429C 0025129C  38 00 03 E8 */	li r0, 0x3e8
/* 802542A0 002512A0  90 03 00 28 */	stw r0, 0x28(r3)
/* 802542A4 002512A4  48 00 00 08 */	b .L_802542AC
.L_802542A8:
/* 802542A8 002512A8  93 C3 00 28 */	stw r30, 0x28(r3)
.L_802542AC:
/* 802542AC 002512AC  38 00 FF FF */	li r0, -1
/* 802542B0 002512B0  90 03 00 30 */	stw r0, 0x30(r3)
/* 802542B4 002512B4  90 03 00 34 */	stw r0, 0x34(r3)
/* 802542B8 002512B8  7F E3 FB 78 */	mr r3, r31
/* 802542BC 002512BC  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 802542C0 002512C0  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 802542C4 002512C4  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 802542C8 002512C8  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 802542CC 002512CC  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 802542D0 002512D0  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 802542D4 002512D4  E3 81 00 28 */	psq_l f28, 40(r1), 0, qr0
/* 802542D8 002512D8  CB 81 00 20 */	lfd f28, 0x20(r1)
/* 802542DC 002512DC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 802542E0 002512E0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802542E4 002512E4  80 01 00 64 */	lwz r0, 0x64(r1)
/* 802542E8 002512E8  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802542EC 002512EC  7C 08 03 A6 */	mtlr r0
/* 802542F0 002512F0  38 21 00 60 */	addi r1, r1, 0x60
/* 802542F4 002512F4  4E 80 00 20 */	blr 
