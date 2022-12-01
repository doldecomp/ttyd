.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global BattleAcrobatGetResult
BattleAcrobatGetResult:
/* 8018CFA4 00189FA4  80 03 27 30 */	lwz r0, 0x2730(r3)
/* 8018CFA8 00189FA8  90 04 00 00 */	stw r0, 0(r4)
/* 8018CFAC 00189FAC  80 03 27 1C */	lwz r0, 0x271c(r3)
/* 8018CFB0 00189FB0  38 60 00 02 */	li r3, 2
/* 8018CFB4 00189FB4  90 05 00 00 */	stw r0, 0(r5)
/* 8018CFB8 00189FB8  4E 80 00 20 */	blr 
_accrobat_timing_icon_disp:
/* 8018CFBC 00189FBC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8018CFC0 00189FC0  7C 08 02 A6 */	mflr r0
/* 8018CFC4 00189FC4  90 01 00 34 */	stw r0, 0x34(r1)
/* 8018CFC8 00189FC8  38 A1 00 0C */	addi r5, r1, 0xc
/* 8018CFCC 00189FCC  38 C1 00 10 */	addi r6, r1, 0x10
/* 8018CFD0 00189FD0  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 8018CFD4 00189FD4  7C 9F 23 78 */	mr r31, r4
/* 8018CFD8 00189FD8  38 81 00 08 */	addi r4, r1, 8
/* 8018CFDC 00189FDC  7F E3 FB 78 */	mr r3, r31
/* 8018CFE0 00189FE0  4B F9 67 B9 */	bl func_80123798
/* 8018CFE4 00189FE4  7F E3 FB 78 */	mr r3, r31
/* 8018CFE8 00189FE8  4B F9 5F 49 */	bl BtlUnit_GetHeight
/* 8018CFEC 00189FEC  38 63 00 05 */	addi r3, r3, 5
/* 8018CFF0 00189FF0  3C 00 43 30 */	lis r0, 0x4330
/* 8018CFF4 00189FF4  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8018CFF8 00189FF8  3C 80 80 30 */	lis r4, lbl_802F8E18@ha
/* 8018CFFC 00189FFC  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8018D000 0018A000  38 61 00 08 */	addi r3, r1, 8
/* 8018D004 0018A004  C8 24 8E 18 */	lfd f1, lbl_802F8E18@l(r4)
/* 8018D008 0018A008  38 80 00 00 */	li r4, 0
/* 8018D00C 0018A00C  90 01 00 18 */	stw r0, 0x18(r1)
/* 8018D010 0018A010  38 A0 00 9A */	li r5, 0x9a
/* 8018D014 0018A014  C0 61 00 0C */	lfs f3, 0xc(r1)
/* 8018D018 0018A018  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 8018D01C 0018A01C  C0 41 00 08 */	lfs f2, 8(r1)
/* 8018D020 0018A020  EC 80 08 28 */	fsubs f4, f0, f1
/* 8018D024 0018A024  C0 02 CE E8 */	lfs f0, lbl_8041E268@sda21(r2)
/* 8018D028 0018A028  C0 22 CE EC */	lfs f1, lbl_8041E26C@sda21(r2)
/* 8018D02C 0018A02C  EC 02 00 2A */	fadds f0, f2, f0
/* 8018D030 0018A030  EC 43 20 2A */	fadds f2, f3, f4
/* 8018D034 0018A034  D0 01 00 08 */	stfs f0, 8(r1)
/* 8018D038 0018A038  D0 41 00 0C */	stfs f2, 0xc(r1)
/* 8018D03C 0018A03C  4B E8 D4 F9 */	bl iconDispGx
/* 8018D040 0018A040  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8018D044 0018A044  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8018D048 0018A048  7C 08 03 A6 */	mtlr r0
/* 8018D04C 0018A04C  38 21 00 30 */	addi r1, r1, 0x30
/* 8018D050 0018A050  4E 80 00 20 */	blr 

.global BattleAcrobatMain
BattleAcrobatMain:
/* 8018D054 0018A054  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8018D058 0018A058  7C 08 02 A6 */	mflr r0
/* 8018D05C 0018A05C  90 01 00 34 */	stw r0, 0x34(r1)
/* 8018D060 0018A060  BF A1 00 24 */	stmw r29, 0x24(r1)
/* 8018D064 0018A064  7C 7D 1B 78 */	mr r29, r3
/* 8018D068 0018A068  80 83 27 2C */	lwz r4, 0x272c(r3)
/* 8018D06C 0018A06C  4B F6 69 0D */	bl BattleGetUnitPtr
/* 8018D070 0018A070  80 9D 27 1C */	lwz r4, 0x271c(r29)
/* 8018D074 0018A074  7C 7F 1B 79 */	or. r31, r3, r3
/* 8018D078 0018A078  3B C0 00 00 */	li r30, 0
/* 8018D07C 0018A07C  38 04 00 01 */	addi r0, r4, 1
/* 8018D080 0018A080  90 1D 27 1C */	stw r0, 0x271c(r29)
/* 8018D084 0018A084  40 82 00 14 */	bne .L_8018D098
/* 8018D088 0018A088  38 00 00 01 */	li r0, 1
/* 8018D08C 0018A08C  38 60 00 01 */	li r3, 1
/* 8018D090 0018A090  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D094 0018A094  48 00 01 B4 */	b .L_8018D248
.L_8018D098:
/* 8018D098 0018A098  80 1F 02 78 */	lwz r0, 0x278(r31)
/* 8018D09C 0018A09C  54 00 06 F7 */	rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 8018D0A0 0018A0A0  41 82 00 14 */	beq .L_8018D0B4
/* 8018D0A4 0018A0A4  38 00 00 01 */	li r0, 1
/* 8018D0A8 0018A0A8  38 60 00 01 */	li r3, 1
/* 8018D0AC 0018A0AC  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D0B0 0018A0B0  48 00 01 98 */	b .L_8018D248
.L_8018D0B4:
/* 8018D0B4 0018A0B4  3C 7D 00 01 */	addis r3, r29, 1
/* 8018D0B8 0018A0B8  80 03 63 D8 */	lwz r0, 0x63d8(r3)
/* 8018D0BC 0018A0BC  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 8018D0C0 0018A0C0  41 82 00 80 */	beq .L_8018D140
/* 8018D0C4 0018A0C4  80 7D 27 1C */	lwz r3, 0x271c(r29)
/* 8018D0C8 0018A0C8  80 1D 27 20 */	lwz r0, 0x2720(r29)
/* 8018D0CC 0018A0CC  7C 03 00 00 */	cmpw r3, r0
/* 8018D0D0 0018A0D0  40 81 00 70 */	ble .L_8018D140
/* 8018D0D4 0018A0D4  80 1D 27 24 */	lwz r0, 0x2724(r29)
/* 8018D0D8 0018A0D8  7C 03 00 00 */	cmpw r3, r0
/* 8018D0DC 0018A0DC  41 81 00 64 */	bgt .L_8018D140
/* 8018D0E0 0018A0E0  3C 60 80 30 */	lis r3, lbl_802F8E08@ha
/* 8018D0E4 0018A0E4  C0 22 CE E8 */	lfs f1, lbl_8041E268@sda21(r2)
/* 8018D0E8 0018A0E8  38 C3 8E 08 */	addi r6, r3, lbl_802F8E08@l
/* 8018D0EC 0018A0EC  38 61 00 08 */	addi r3, r1, 8
/* 8018D0F0 0018A0F0  80 A6 00 00 */	lwz r5, 0(r6)
/* 8018D0F4 0018A0F4  80 86 00 04 */	lwz r4, 4(r6)
/* 8018D0F8 0018A0F8  80 06 00 08 */	lwz r0, 8(r6)
/* 8018D0FC 0018A0FC  90 A1 00 08 */	stw r5, 8(r1)
/* 8018D100 0018A100  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018D104 0018A104  90 01 00 10 */	stw r0, 0x10(r1)
/* 8018D108 0018A108  C0 1F 00 3C */	lfs f0, 0x3c(r31)
/* 8018D10C 0018A10C  D0 01 00 08 */	stfs f0, 8(r1)
/* 8018D110 0018A110  C0 1F 00 40 */	lfs f0, 0x40(r31)
/* 8018D114 0018A114  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8018D118 0018A118  C0 1F 00 44 */	lfs f0, 0x44(r31)
/* 8018D11C 0018A11C  EC 01 00 2A */	fadds f0, f1, f0
/* 8018D120 0018A120  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8018D124 0018A124  4B E8 35 9D */	bl dispCalcZ
/* 8018D128 0018A128  3C 60 80 19 */	lis r3, _accrobat_timing_icon_disp@ha
/* 8018D12C 0018A12C  7F E6 FB 78 */	mr r6, r31
/* 8018D130 0018A130  38 A3 CF BC */	addi r5, r3, _accrobat_timing_icon_disp@l
/* 8018D134 0018A134  38 80 00 01 */	li r4, 1
/* 8018D138 0018A138  38 60 00 04 */	li r3, 4
/* 8018D13C 0018A13C  4B E8 38 DD */	bl dispEntry
.L_8018D140:
/* 8018D140 0018A140  88 1F 03 03 */	lbz r0, 0x303(r31)
/* 8018D144 0018A144  28 00 00 00 */	cmplwi r0, 0
/* 8018D148 0018A148  41 82 00 24 */	beq .L_8018D16C
/* 8018D14C 0018A14C  80 7D 27 1C */	lwz r3, 0x271c(r29)
/* 8018D150 0018A150  80 1D 27 20 */	lwz r0, 0x2720(r29)
/* 8018D154 0018A154  7C 03 00 00 */	cmpw r3, r0
/* 8018D158 0018A158  40 81 00 14 */	ble .L_8018D16C
/* 8018D15C 0018A15C  80 1D 27 24 */	lwz r0, 0x2724(r29)
/* 8018D160 0018A160  7C 03 00 00 */	cmpw r3, r0
/* 8018D164 0018A164  41 81 00 08 */	bgt .L_8018D16C
/* 8018D168 0018A168  3B C0 00 01 */	li r30, 1
.L_8018D16C:
/* 8018D16C 0018A16C  80 1D 27 1C */	lwz r0, 0x271c(r29)
/* 8018D170 0018A170  2C 00 00 01 */	cmpwi r0, 1
/* 8018D174 0018A174  41 81 00 4C */	bgt .L_8018D1C0
/* 8018D178 0018A178  80 1D 27 34 */	lwz r0, 0x2734(r29)
/* 8018D17C 0018A17C  2C 00 00 00 */	cmpwi r0, 0
/* 8018D180 0018A180  40 81 00 40 */	ble .L_8018D1C0
/* 8018D184 0018A184  3B E0 00 00 */	li r31, 0
/* 8018D188 0018A188  48 00 00 2C */	b .L_8018D1B4
.L_8018D18C:
/* 8018D18C 0018A18C  7F E3 FB 78 */	mr r3, r31
/* 8018D190 0018A190  38 80 01 00 */	li r4, 0x100
/* 8018D194 0018A194  4B F8 7A 65 */	bl BattlePadCheckRecordTrigger
/* 8018D198 0018A198  2C 03 00 00 */	cmpwi r3, 0
/* 8018D19C 0018A19C  41 82 00 14 */	beq .L_8018D1B0
/* 8018D1A0 0018A1A0  38 00 FF FF */	li r0, -1
/* 8018D1A4 0018A1A4  38 60 00 01 */	li r3, 1
/* 8018D1A8 0018A1A8  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D1AC 0018A1AC  48 00 00 9C */	b .L_8018D248
.L_8018D1B0:
/* 8018D1B0 0018A1B0  3B FF 00 01 */	addi r31, r31, 1
.L_8018D1B4:
/* 8018D1B4 0018A1B4  80 1D 27 34 */	lwz r0, 0x2734(r29)
/* 8018D1B8 0018A1B8  7C 1F 00 00 */	cmpw r31, r0
/* 8018D1BC 0018A1BC  41 80 FF D0 */	blt .L_8018D18C
.L_8018D1C0:
/* 8018D1C0 0018A1C0  38 60 01 00 */	li r3, 0x100
/* 8018D1C4 0018A1C4  4B F8 7A 79 */	bl func_80114C3C
/* 8018D1C8 0018A1C8  2C 03 00 00 */	cmpwi r3, 0
/* 8018D1CC 0018A1CC  40 82 00 0C */	bne .L_8018D1D8
/* 8018D1D0 0018A1D0  2C 1E 00 00 */	cmpwi r30, 0
/* 8018D1D4 0018A1D4  41 82 00 50 */	beq .L_8018D224
.L_8018D1D8:
/* 8018D1D8 0018A1D8  80 7D 27 1C */	lwz r3, 0x271c(r29)
/* 8018D1DC 0018A1DC  80 1D 27 20 */	lwz r0, 0x2720(r29)
/* 8018D1E0 0018A1E0  7C 03 00 00 */	cmpw r3, r0
/* 8018D1E4 0018A1E4  41 81 00 14 */	bgt .L_8018D1F8
/* 8018D1E8 0018A1E8  38 00 FF FF */	li r0, -1
/* 8018D1EC 0018A1EC  38 60 00 01 */	li r3, 1
/* 8018D1F0 0018A1F0  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D1F4 0018A1F4  48 00 00 54 */	b .L_8018D248
.L_8018D1F8:
/* 8018D1F8 0018A1F8  80 1D 27 24 */	lwz r0, 0x2724(r29)
/* 8018D1FC 0018A1FC  7C 03 00 00 */	cmpw r3, r0
/* 8018D200 0018A200  41 81 00 14 */	bgt .L_8018D214
/* 8018D204 0018A204  38 00 00 02 */	li r0, 2
/* 8018D208 0018A208  38 60 00 01 */	li r3, 1
/* 8018D20C 0018A20C  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D210 0018A210  48 00 00 38 */	b .L_8018D248
.L_8018D214:
/* 8018D214 0018A214  38 00 FF FE */	li r0, -2
/* 8018D218 0018A218  38 60 00 01 */	li r3, 1
/* 8018D21C 0018A21C  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D220 0018A220  48 00 00 28 */	b .L_8018D248
.L_8018D224:
/* 8018D224 0018A224  80 7D 27 1C */	lwz r3, 0x271c(r29)
/* 8018D228 0018A228  80 1D 27 28 */	lwz r0, 0x2728(r29)
/* 8018D22C 0018A22C  7C 03 00 00 */	cmpw r3, r0
/* 8018D230 0018A230  41 80 00 14 */	blt .L_8018D244
/* 8018D234 0018A234  38 00 00 01 */	li r0, 1
/* 8018D238 0018A238  38 60 00 01 */	li r3, 1
/* 8018D23C 0018A23C  90 1D 27 30 */	stw r0, 0x2730(r29)
/* 8018D240 0018A240  48 00 00 08 */	b .L_8018D248
.L_8018D244:
/* 8018D244 0018A244  38 60 00 00 */	li r3, 0
.L_8018D248:
/* 8018D248 0018A248  BB A1 00 24 */	lmw r29, 0x24(r1)
/* 8018D24C 0018A24C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8018D250 0018A250  7C 08 03 A6 */	mtlr r0
/* 8018D254 0018A254  38 21 00 30 */	addi r1, r1, 0x30
/* 8018D258 0018A258  4E 80 00 20 */	blr 

.global BattleAcrobatStart
BattleAcrobatStart:
/* 8018D25C 0018A25C  38 00 00 00 */	li r0, 0
/* 8018D260 0018A260  90 03 27 1C */	stw r0, 0x271c(r3)
/* 8018D264 0018A264  90 A3 27 20 */	stw r5, 0x2720(r3)
/* 8018D268 0018A268  90 C3 27 24 */	stw r6, 0x2724(r3)
/* 8018D26C 0018A26C  90 E3 27 28 */	stw r7, 0x2728(r3)
/* 8018D270 0018A270  90 83 27 2C */	stw r4, 0x272c(r3)
/* 8018D274 0018A274  90 03 27 30 */	stw r0, 0x2730(r3)
/* 8018D278 0018A278  91 03 27 34 */	stw r8, 0x2734(r3)
/* 8018D27C 0018A27C  38 60 00 00 */	li r3, 0
/* 8018D280 0018A280  4E 80 00 20 */	blr 
