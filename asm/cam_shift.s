.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global camShiftReset
camShiftReset:
/* 800EE814 000EB814  C0 62 A9 C0 */	lfs f3, lbl_8041BD40@sda21(r2)
/* 800EE818 000EB818  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE81C 000EB81C  C0 42 A9 C4 */	lfs f2, lbl_8041BD44@sda21(r2)
/* 800EE820 000EB820  D0 63 00 00 */	stfs f3, 0(r3)
/* 800EE824 000EB824  C0 22 A9 C8 */	lfs f1, lbl_8041BD48@sda21(r2)
/* 800EE828 000EB828  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE82C 000EB82C  C0 02 A9 CC */	lfs f0, lbl_8041BD4C@sda21(r2)
/* 800EE830 000EB830  D0 63 00 04 */	stfs f3, 4(r3)
/* 800EE834 000EB834  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE838 000EB838  D0 63 00 08 */	stfs f3, 8(r3)
/* 800EE83C 000EB83C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE840 000EB840  D0 63 00 0C */	stfs f3, 0xc(r3)
/* 800EE844 000EB844  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE848 000EB848  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 800EE84C 000EB84C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE850 000EB850  D0 43 00 20 */	stfs f2, 0x20(r3)
/* 800EE854 000EB854  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE858 000EB858  D0 23 00 24 */	stfs f1, 0x24(r3)
/* 800EE85C 000EB85C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE860 000EB860  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 800EE864 000EB864  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE868 000EB868  D0 63 00 2C */	stfs f3, 0x2c(r3)
/* 800EE86C 000EB86C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE870 000EB870  D0 63 00 30 */	stfs f3, 0x30(r3)
/* 800EE874 000EB874  4E 80 00 20 */	blr 

.global camShiftPostMain
camShiftPostMain:
/* 800EE878 000EB878  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 800EE87C 000EB87C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE880 000EB880  80 04 00 38 */	lwz r0, 0x38(r4)
/* 800EE884 000EB884  80 84 00 3C */	lwz r4, 0x3c(r4)
/* 800EE888 000EB888  90 83 00 1C */	stw r4, 0x1c(r3)
/* 800EE88C 000EB88C  90 03 00 18 */	stw r0, 0x18(r3)
/* 800EE890 000EB890  4E 80 00 20 */	blr 

.global camShiftMain
camShiftMain:
/* 800EE894 000EB894  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800EE898 000EB898  7C 08 02 A6 */	mflr r0
/* 800EE89C 000EB89C  90 01 00 44 */	stw r0, 0x44(r1)
/* 800EE8A0 000EB8A0  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 800EE8A4 000EB8A4  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 800EE8A8 000EB8A8  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 800EE8AC 000EB8AC  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 800EE8B0 000EB8B0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800EE8B4 000EB8B4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800EE8B8 000EB8B8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800EE8BC 000EB8BC  93 81 00 10 */	stw r28, 0x10(r1)
/* 800EE8C0 000EB8C0  7C 7C 1B 78 */	mr r28, r3
/* 800EE8C4 000EB8C4  7C 9D 23 78 */	mr r29, r4
/* 800EE8C8 000EB8C8  7C BE 2B 78 */	mr r30, r5
/* 800EE8CC 000EB8CC  3B E0 00 00 */	li r31, 0
/* 800EE8D0 000EB8D0  4B F1 C0 AD */	bl camRoadGetCurrentShiftXRate
/* 800EE8D4 000EB8D4  A0 1C 00 00 */	lhz r0, 0(r28)
/* 800EE8D8 000EB8D8  FF E0 08 90 */	fmr f31, f1
/* 800EE8DC 000EB8DC  54 00 06 B5 */	rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 800EE8E0 000EB8E0  41 82 00 08 */	beq .L_800EE8E8
/* 800EE8E4 000EB8E4  3B E0 00 01 */	li r31, 1
.L_800EE8E8:
/* 800EE8E8 000EB8E8  2C 1F 00 00 */	cmpwi r31, 0
/* 800EE8EC 000EB8EC  41 82 00 28 */	beq .L_800EE914
/* 800EE8F0 000EB8F0  C0 02 A9 D0 */	lfs f0, lbl_8041BD50@sda21(r2)
/* 800EE8F4 000EB8F4  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE8F8 000EB8F8  C3 C2 A9 C0 */	lfs f30, lbl_8041BD40@sda21(r2)
/* 800EE8FC 000EB8FC  D0 03 00 08 */	stfs f0, 8(r3)
/* 800EE900 000EB900  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE904 000EB904  D3 C3 00 04 */	stfs f30, 4(r3)
/* 800EE908 000EB908  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE90C 000EB90C  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 800EE910 000EB910  48 00 00 84 */	b .L_800EE994
.L_800EE914:
/* 800EE914 000EB914  88 9D 02 4E */	lbz r4, 0x24e(r29)
/* 800EE918 000EB918  3C 00 43 30 */	lis r0, 0x4330
/* 800EE91C 000EB91C  90 01 00 08 */	stw r0, 8(r1)
/* 800EE920 000EB920  3C 60 80 2F */	lis r3, lbl_802ED668@ha
/* 800EE924 000EB924  7C 80 07 74 */	extsb r0, r4
/* 800EE928 000EB928  C8 43 D6 68 */	lfd f2, lbl_802ED668@l(r3)
/* 800EE92C 000EB92C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 800EE930 000EB930  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EE934 000EB934  90 01 00 0C */	stw r0, 0xc(r1)
/* 800EE938 000EB938  C8 21 00 08 */	lfd f1, 8(r1)
/* 800EE93C 000EB93C  EF C1 10 28 */	fsubs f30, f1, f2
/* 800EE940 000EB940  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 800EE944 000EB944  40 81 00 08 */	ble .L_800EE94C
/* 800EE948 000EB948  C3 C2 A9 D4 */	lfs f30, lbl_8041BD54@sda21(r2)
.L_800EE94C:
/* 800EE94C 000EB94C  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EE950 000EB950  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 800EE954 000EB954  40 80 00 08 */	bge .L_800EE95C
/* 800EE958 000EB958  C3 C2 A9 D8 */	lfs f30, lbl_8041BD58@sda21(r2)
.L_800EE95C:
/* 800EE95C 000EB95C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE960 000EB960  C0 5D 00 8C */	lfs f2, 0x8c(r29)
/* 800EE964 000EB964  C0 03 00 2C */	lfs f0, 0x2c(r3)
/* 800EE968 000EB968  FC 02 00 00 */	fcmpu cr0, f2, f0
/* 800EE96C 000EB96C  40 82 00 18 */	bne .L_800EE984
/* 800EE970 000EB970  C0 3D 00 94 */	lfs f1, 0x94(r29)
/* 800EE974 000EB974  C0 03 00 30 */	lfs f0, 0x30(r3)
/* 800EE978 000EB978  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 800EE97C 000EB97C  40 82 00 08 */	bne .L_800EE984
/* 800EE980 000EB980  C3 C2 A9 C0 */	lfs f30, lbl_8041BD40@sda21(r2)
.L_800EE984:
/* 800EE984 000EB984  D0 43 00 2C */	stfs f2, 0x2c(r3)
/* 800EE988 000EB988  C0 1D 00 94 */	lfs f0, 0x94(r29)
/* 800EE98C 000EB98C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE990 000EB990  D0 03 00 30 */	stfs f0, 0x30(r3)
.L_800EE994:
/* 800EE994 000EB994  C0 22 A9 C0 */	lfs f1, lbl_8041BD40@sda21(r2)
/* 800EE998 000EB998  FC 1E 08 00 */	fcmpu cr0, f30, f1
/* 800EE99C 000EB99C  41 82 01 7C */	beq .L_800EEB18
/* 800EE9A0 000EB9A0  FC 1E 08 40 */	fcmpo cr0, f30, f1
/* 800EE9A4 000EB9A4  40 80 00 C4 */	bge .L_800EEA68
/* 800EE9A8 000EB9A8  80 8D 99 B8 */	lwz r4, lbl_80410C18@sda21(r13)
/* 800EE9AC 000EB9AC  C0 04 00 0C */	lfs f0, 0xc(r4)
/* 800EE9B0 000EB9B0  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 800EE9B4 000EB9B4  40 81 00 2C */	ble .L_800EE9E0
/* 800EE9B8 000EB9B8  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 800EE9BC 000EB9BC  FC 20 F0 90 */	fmr f1, f30
/* 800EE9C0 000EB9C0  80 64 00 18 */	lwz r3, 0x18(r4)
/* 800EE9C4 000EB9C4  80 84 00 1C */	lwz r4, 0x1c(r4)
/* 800EE9C8 000EB9C8  80 A6 00 38 */	lwz r5, 0x38(r6)
/* 800EE9CC 000EB9CC  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 800EE9D0 000EB9D0  4B F1 71 55 */	bl getV60FPS
/* 800EE9D4 000EB9D4  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EE9D8 000EB9D8  D0 23 00 0C */	stfs f1, 0xc(r3)
/* 800EE9DC 000EB9DC  48 00 00 30 */	b .L_800EEA0C
.L_800EE9E0:
/* 800EE9E0 000EB9E0  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 800EE9E4 000EB9E4  FC 20 F0 90 */	fmr f1, f30
/* 800EE9E8 000EB9E8  80 64 00 18 */	lwz r3, 0x18(r4)
/* 800EE9EC 000EB9EC  80 84 00 1C */	lwz r4, 0x1c(r4)
/* 800EE9F0 000EB9F0  80 A6 00 38 */	lwz r5, 0x38(r6)
/* 800EE9F4 000EB9F4  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 800EE9F8 000EB9F8  4B F1 71 2D */	bl getV60FPS
/* 800EE9FC 000EB9FC  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEA00 000EBA00  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 800EEA04 000EBA04  EC 00 08 2A */	fadds f0, f0, f1
/* 800EEA08 000EBA08  D0 03 00 0C */	stfs f0, 0xc(r3)
.L_800EEA0C:
/* 800EEA0C 000EBA0C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEA10 000EBA10  C0 03 00 20 */	lfs f0, 0x20(r3)
/* 800EEA14 000EBA14  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 800EEA18 000EBA18  FC 00 00 50 */	fneg f0, f0
/* 800EEA1C 000EBA1C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEA20 000EBA20  4C 40 13 82 */	cror 2, 0, 2
/* 800EEA24 000EBA24  40 82 00 F4 */	bne .L_800EEB18
/* 800EEA28 000EBA28  C0 22 A9 D0 */	lfs f1, lbl_8041BD50@sda21(r2)
/* 800EEA2C 000EBA2C  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EEA30 000EBA30  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 800EEA34 000EBA34  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEA38 000EBA38  C0 23 00 04 */	lfs f1, 4(r3)
/* 800EEA3C 000EBA3C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEA40 000EBA40  40 81 00 08 */	ble .L_800EEA48
/* 800EEA44 000EBA44  D0 03 00 08 */	stfs f0, 8(r3)
.L_800EEA48:
/* 800EEA48 000EBA48  FC 00 F8 50 */	fneg f0, f31
/* 800EEA4C 000EBA4C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEA50 000EBA50  D0 03 00 04 */	stfs f0, 4(r3)
/* 800EEA54 000EBA54  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEA58 000EBA58  C0 03 00 20 */	lfs f0, 0x20(r3)
/* 800EEA5C 000EBA5C  FC 00 00 50 */	fneg f0, f0
/* 800EEA60 000EBA60  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800EEA64 000EBA64  48 00 00 B4 */	b .L_800EEB18
.L_800EEA68:
/* 800EEA68 000EBA68  80 8D 99 B8 */	lwz r4, lbl_80410C18@sda21(r13)
/* 800EEA6C 000EBA6C  C0 04 00 0C */	lfs f0, 0xc(r4)
/* 800EEA70 000EBA70  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 800EEA74 000EBA74  40 80 00 2C */	bge .L_800EEAA0
/* 800EEA78 000EBA78  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 800EEA7C 000EBA7C  FC 20 F0 90 */	fmr f1, f30
/* 800EEA80 000EBA80  80 64 00 18 */	lwz r3, 0x18(r4)
/* 800EEA84 000EBA84  80 84 00 1C */	lwz r4, 0x1c(r4)
/* 800EEA88 000EBA88  80 A6 00 38 */	lwz r5, 0x38(r6)
/* 800EEA8C 000EBA8C  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 800EEA90 000EBA90  4B F1 70 95 */	bl getV60FPS
/* 800EEA94 000EBA94  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEA98 000EBA98  D0 23 00 0C */	stfs f1, 0xc(r3)
/* 800EEA9C 000EBA9C  48 00 00 30 */	b .L_800EEACC
.L_800EEAA0:
/* 800EEAA0 000EBAA0  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 800EEAA4 000EBAA4  FC 20 F0 90 */	fmr f1, f30
/* 800EEAA8 000EBAA8  80 64 00 18 */	lwz r3, 0x18(r4)
/* 800EEAAC 000EBAAC  80 84 00 1C */	lwz r4, 0x1c(r4)
/* 800EEAB0 000EBAB0  80 A6 00 38 */	lwz r5, 0x38(r6)
/* 800EEAB4 000EBAB4  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 800EEAB8 000EBAB8  4B F1 70 6D */	bl getV60FPS
/* 800EEABC 000EBABC  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEAC0 000EBAC0  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 800EEAC4 000EBAC4  EC 00 08 2A */	fadds f0, f0, f1
/* 800EEAC8 000EBAC8  D0 03 00 0C */	stfs f0, 0xc(r3)
.L_800EEACC:
/* 800EEACC 000EBACC  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEAD0 000EBAD0  C0 23 00 0C */	lfs f1, 0xc(r3)
/* 800EEAD4 000EBAD4  C0 03 00 20 */	lfs f0, 0x20(r3)
/* 800EEAD8 000EBAD8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEADC 000EBADC  4C 41 13 82 */	cror 2, 1, 2
/* 800EEAE0 000EBAE0  40 82 00 38 */	bne .L_800EEB18
/* 800EEAE4 000EBAE4  C0 22 A9 D0 */	lfs f1, lbl_8041BD50@sda21(r2)
/* 800EEAE8 000EBAE8  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EEAEC 000EBAEC  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 800EEAF0 000EBAF0  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEAF4 000EBAF4  C0 23 00 04 */	lfs f1, 4(r3)
/* 800EEAF8 000EBAF8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEAFC 000EBAFC  40 80 00 08 */	bge .L_800EEB04
/* 800EEB00 000EBB00  D0 03 00 08 */	stfs f0, 8(r3)
.L_800EEB04:
/* 800EEB04 000EBB04  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEB08 000EBB08  D3 E3 00 04 */	stfs f31, 4(r3)
/* 800EEB0C 000EBB0C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEB10 000EBB10  C0 03 00 20 */	lfs f0, 0x20(r3)
/* 800EEB14 000EBB14  D0 03 00 0C */	stfs f0, 0xc(r3)
.L_800EEB18:
/* 800EEB18 000EBB18  80 8D 99 B8 */	lwz r4, lbl_80410C18@sda21(r13)
/* 800EEB1C 000EBB1C  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EEB20 000EBB20  C0 24 00 10 */	lfs f1, 0x10(r4)
/* 800EEB24 000EBB24  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 800EEB28 000EBB28  41 82 00 48 */	beq .L_800EEB70
/* 800EEB2C 000EBB2C  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 800EEB30 000EBB30  C0 24 00 28 */	lfs f1, 0x28(r4)
/* 800EEB34 000EBB34  80 64 00 18 */	lwz r3, 0x18(r4)
/* 800EEB38 000EBB38  80 84 00 1C */	lwz r4, 0x1c(r4)
/* 800EEB3C 000EBB3C  80 A6 00 38 */	lwz r5, 0x38(r6)
/* 800EEB40 000EBB40  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 800EEB44 000EBB44  4B F1 6F E1 */	bl getV60FPS
/* 800EEB48 000EBB48  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEB4C 000EBB4C  C0 02 A9 D0 */	lfs f0, lbl_8041BD50@sda21(r2)
/* 800EEB50 000EBB50  C0 43 00 08 */	lfs f2, 8(r3)
/* 800EEB54 000EBB54  EC 22 08 2A */	fadds f1, f2, f1
/* 800EEB58 000EBB58  D0 23 00 08 */	stfs f1, 8(r3)
/* 800EEB5C 000EBB5C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEB60 000EBB60  C0 23 00 08 */	lfs f1, 8(r3)
/* 800EEB64 000EBB64  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEB68 000EBB68  40 81 00 08 */	ble .L_800EEB70
/* 800EEB6C 000EBB6C  D0 03 00 08 */	stfs f0, 8(r3)
.L_800EEB70:
/* 800EEB70 000EBB70  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEB74 000EBB74  C0 42 A9 C0 */	lfs f2, lbl_8041BD40@sda21(r2)
/* 800EEB78 000EBB78  C0 23 00 04 */	lfs f1, 4(r3)
/* 800EEB7C 000EBB7C  C0 03 00 00 */	lfs f0, 0(r3)
/* 800EEB80 000EBB80  EC 01 00 28 */	fsubs f0, f1, f0
/* 800EEB84 000EBB84  FC 02 00 00 */	fcmpu cr0, f2, f0
/* 800EEB88 000EBB88  40 82 00 10 */	bne .L_800EEB98
/* 800EEB8C 000EBB8C  D0 43 00 08 */	stfs f2, 8(r3)
/* 800EEB90 000EBB90  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEB94 000EBB94  D0 43 00 10 */	stfs f2, 0x10(r3)
.L_800EEB98:
/* 800EEB98 000EBB98  80 8D 99 B8 */	lwz r4, lbl_80410C18@sda21(r13)
/* 800EEB9C 000EBB9C  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EEBA0 000EBBA0  C0 44 00 04 */	lfs f2, 4(r4)
/* 800EEBA4 000EBBA4  C0 24 00 00 */	lfs f1, 0(r4)
/* 800EEBA8 000EBBA8  C0 64 00 08 */	lfs f3, 8(r4)
/* 800EEBAC 000EBBAC  EC 42 08 28 */	fsubs f2, f2, f1
/* 800EEBB0 000EBBB0  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 800EEBB4 000EBBB4  EC 23 00 B2 */	fmuls f1, f3, f2
/* 800EEBB8 000EBBB8  40 81 00 28 */	ble .L_800EEBE0
/* 800EEBBC 000EBBBC  C0 02 A9 DC */	lfs f0, lbl_8041BD5C@sda21(r2)
/* 800EEBC0 000EBBC0  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 800EEBC4 000EBBC4  40 80 00 08 */	bge .L_800EEBCC
/* 800EEBC8 000EBBC8  FC 20 10 90 */	fmr f1, f2
.L_800EEBCC:
/* 800EEBCC 000EBBCC  C0 04 00 24 */	lfs f0, 0x24(r4)
/* 800EEBD0 000EBBD0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEBD4 000EBBD4  40 81 00 30 */	ble .L_800EEC04
/* 800EEBD8 000EBBD8  FC 20 00 90 */	fmr f1, f0
/* 800EEBDC 000EBBDC  48 00 00 28 */	b .L_800EEC04
.L_800EEBE0:
/* 800EEBE0 000EBBE0  C0 02 A9 E0 */	lfs f0, lbl_8041BD60@sda21(r2)
/* 800EEBE4 000EBBE4  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 800EEBE8 000EBBE8  40 81 00 08 */	ble .L_800EEBF0
/* 800EEBEC 000EBBEC  FC 20 10 90 */	fmr f1, f2
.L_800EEBF0:
/* 800EEBF0 000EBBF0  C0 04 00 24 */	lfs f0, 0x24(r4)
/* 800EEBF4 000EBBF4  FC 00 00 50 */	fneg f0, f0
/* 800EEBF8 000EBBF8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEBFC 000EBBFC  40 80 00 08 */	bge .L_800EEC04
/* 800EEC00 000EBC00  FC 20 00 90 */	fmr f1, f0
.L_800EEC04:
/* 800EEC04 000EBC04  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EEC08 000EBC08  FC 1E 00 00 */	fcmpu cr0, f30, f0
/* 800EEC0C 000EBC0C  40 82 00 0C */	bne .L_800EEC18
/* 800EEC10 000EBC10  2C 1F 00 00 */	cmpwi r31, 0
/* 800EEC14 000EBC14  41 82 00 68 */	beq .L_800EEC7C
.L_800EEC18:
/* 800EEC18 000EBC18  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 800EEC1C 000EBC1C  80 64 00 18 */	lwz r3, 0x18(r4)
/* 800EEC20 000EBC20  80 A6 00 38 */	lwz r5, 0x38(r6)
/* 800EEC24 000EBC24  80 84 00 1C */	lwz r4, 0x1c(r4)
/* 800EEC28 000EBC28  80 C6 00 3C */	lwz r6, 0x3c(r6)
/* 800EEC2C 000EBC2C  4B F1 6E F9 */	bl getV60FPS
/* 800EEC30 000EBC30  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEC34 000EBC34  C0 02 A9 C0 */	lfs f0, lbl_8041BD40@sda21(r2)
/* 800EEC38 000EBC38  C0 43 00 00 */	lfs f2, 0(r3)
/* 800EEC3C 000EBC3C  EC 22 08 2A */	fadds f1, f2, f1
/* 800EEC40 000EBC40  D0 23 00 00 */	stfs f1, 0(r3)
/* 800EEC44 000EBC44  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEC48 000EBC48  C0 23 00 04 */	lfs f1, 4(r3)
/* 800EEC4C 000EBC4C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800EEC50 000EBC50  40 80 00 18 */	bge .L_800EEC68
/* 800EEC54 000EBC54  C0 03 00 00 */	lfs f0, 0(r3)
/* 800EEC58 000EBC58  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 800EEC5C 000EBC5C  40 80 00 24 */	bge .L_800EEC80
/* 800EEC60 000EBC60  D0 23 00 00 */	stfs f1, 0(r3)
/* 800EEC64 000EBC64  48 00 00 1C */	b .L_800EEC80
.L_800EEC68:
/* 800EEC68 000EBC68  C0 03 00 00 */	lfs f0, 0(r3)
/* 800EEC6C 000EBC6C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 800EEC70 000EBC70  40 81 00 10 */	ble .L_800EEC80
/* 800EEC74 000EBC74  D0 23 00 00 */	stfs f1, 0(r3)
/* 800EEC78 000EBC78  48 00 00 08 */	b .L_800EEC80
.L_800EEC7C:
/* 800EEC7C 000EBC7C  D0 04 00 08 */	stfs f0, 8(r4)
.L_800EEC80:
/* 800EEC80 000EBC80  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EEC84 000EBC84  C0 03 00 00 */	lfs f0, 0(r3)
/* 800EEC88 000EBC88  D0 1E 00 00 */	stfs f0, 0(r30)
/* 800EEC8C 000EBC8C  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 800EEC90 000EBC90  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 800EEC94 000EBC94  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 800EEC98 000EBC98  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 800EEC9C 000EBC9C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800EECA0 000EBCA0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800EECA4 000EBCA4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800EECA8 000EBCA8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800EECAC 000EBCAC  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800EECB0 000EBCB0  7C 08 03 A6 */	mtlr r0
/* 800EECB4 000EBCB4  38 21 00 40 */	addi r1, r1, 0x40
/* 800EECB8 000EBCB8  4E 80 00 20 */	blr 

.global camShiftInit
camShiftInit:
/* 800EECBC 000EBCBC  C0 62 A9 C0 */	lfs f3, lbl_8041BD40@sda21(r2)
/* 800EECC0 000EBCC0  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EECC4 000EBCC4  C0 42 A9 C4 */	lfs f2, lbl_8041BD44@sda21(r2)
/* 800EECC8 000EBCC8  D0 63 00 00 */	stfs f3, 0(r3)
/* 800EECCC 000EBCCC  C0 22 A9 C8 */	lfs f1, lbl_8041BD48@sda21(r2)
/* 800EECD0 000EBCD0  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EECD4 000EBCD4  C0 02 A9 CC */	lfs f0, lbl_8041BD4C@sda21(r2)
/* 800EECD8 000EBCD8  D0 63 00 04 */	stfs f3, 4(r3)
/* 800EECDC 000EBCDC  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EECE0 000EBCE0  D0 63 00 08 */	stfs f3, 8(r3)
/* 800EECE4 000EBCE4  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EECE8 000EBCE8  D0 63 00 0C */	stfs f3, 0xc(r3)
/* 800EECEC 000EBCEC  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EECF0 000EBCF0  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 800EECF4 000EBCF4  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EECF8 000EBCF8  D0 43 00 20 */	stfs f2, 0x20(r3)
/* 800EECFC 000EBCFC  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EED00 000EBD00  D0 23 00 24 */	stfs f1, 0x24(r3)
/* 800EED04 000EBD04  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EED08 000EBD08  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 800EED0C 000EBD0C  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EED10 000EBD10  D0 63 00 2C */	stfs f3, 0x2c(r3)
/* 800EED14 000EBD14  80 6D 99 B8 */	lwz r3, lbl_80410C18@sda21(r13)
/* 800EED18 000EBD18  D0 63 00 30 */	stfs f3, 0x30(r3)
/* 800EED1C 000EBD1C  4E 80 00 20 */	blr 
