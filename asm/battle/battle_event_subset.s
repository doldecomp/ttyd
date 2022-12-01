.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global _binta_effect
_binta_effect:
/* 8010EC60 0010BC60  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8010EC64 0010BC64  7C 08 02 A6 */	mflr r0
/* 8010EC68 0010BC68  90 01 00 34 */	stw r0, 0x34(r1)
/* 8010EC6C 0010BC6C  BF 81 00 20 */	stmw r28, 0x20(r1)
/* 8010EC70 0010BC70  7C 7C 1B 78 */	mr r28, r3
/* 8010EC74 0010BC74  83 C3 00 18 */	lwz r30, 0x18(r3)
/* 8010EC78 0010BC78  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 8010EC7C 0010BC7C  80 9E 00 00 */	lwz r4, 0(r30)
/* 8010EC80 0010BC80  4B F2 1F 4D */	bl evtGetValue
/* 8010EC84 0010BC84  80 9E 00 04 */	lwz r4, 4(r30)
/* 8010EC88 0010BC88  7C 7D 1B 78 */	mr r29, r3
/* 8010EC8C 0010BC8C  7F 83 E3 78 */	mr r3, r28
/* 8010EC90 0010BC90  4B F2 1F 3D */	bl evtGetValue
/* 8010EC94 0010BC94  7C 7E 1B 78 */	mr r30, r3
/* 8010EC98 0010BC98  7F 83 E3 78 */	mr r3, r28
/* 8010EC9C 0010BC9C  7F A4 EB 78 */	mr r4, r29
/* 8010ECA0 0010BCA0  48 01 12 8D */	bl BattleTransID
/* 8010ECA4 0010BCA4  7C 64 1B 78 */	mr r4, r3
/* 8010ECA8 0010BCA8  7F E3 FB 78 */	mr r3, r31
/* 8010ECAC 0010BCAC  4B FE 4C CD */	bl BattleGetUnitPtr
/* 8010ECB0 0010BCB0  38 A1 00 0C */	addi r5, r1, 0xc
/* 8010ECB4 0010BCB4  38 C1 00 10 */	addi r6, r1, 0x10
/* 8010ECB8 0010BCB8  7C 7F 1B 78 */	mr r31, r3
/* 8010ECBC 0010BCBC  38 81 00 08 */	addi r4, r1, 8
/* 8010ECC0 0010BCC0  48 01 4A D9 */	bl func_80123798
/* 8010ECC4 0010BCC4  C0 3F 01 14 */	lfs f1, 0x114(r31)
/* 8010ECC8 0010BCC8  57 C3 0F FE */	srwi r3, r30, 0x1f
/* 8010ECCC 0010BCCC  38 80 00 00 */	li r4, 0
/* 8010ECD0 0010BCD0  38 A0 00 5A */	li r5, 0x5a
/* 8010ECD4 0010BCD4  48 09 7A D1 */	bl effWhirlwindN64Entry
/* 8010ECD8 0010BCD8  C0 01 00 08 */	lfs f0, 8(r1)
/* 8010ECDC 0010BCDC  80 83 00 0C */	lwz r4, 0xc(r3)
/* 8010ECE0 0010BCE0  D0 04 00 08 */	stfs f0, 8(r4)
/* 8010ECE4 0010BCE4  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 8010ECE8 0010BCE8  80 83 00 0C */	lwz r4, 0xc(r3)
/* 8010ECEC 0010BCEC  D0 04 00 0C */	stfs f0, 0xc(r4)
/* 8010ECF0 0010BCF0  80 83 00 0C */	lwz r4, 0xc(r3)
/* 8010ECF4 0010BCF4  38 60 00 02 */	li r3, 2
/* 8010ECF8 0010BCF8  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 8010ECFC 0010BCFC  D0 04 00 10 */	stfs f0, 0x10(r4)
/* 8010ED00 0010BD00  BB 81 00 20 */	lmw r28, 0x20(r1)
/* 8010ED04 0010BD04  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8010ED08 0010BD08  7C 08 03 A6 */	mtlr r0
/* 8010ED0C 0010BD0C  38 21 00 30 */	addi r1, r1, 0x30
/* 8010ED10 0010BD10  4E 80 00 20 */	blr 

.global _check_through_pos
_check_through_pos:
/* 8010ED14 0010BD14  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8010ED18 0010BD18  7C 08 02 A6 */	mflr r0
/* 8010ED1C 0010BD1C  90 01 00 34 */	stw r0, 0x34(r1)
/* 8010ED20 0010BD20  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 8010ED24 0010BD24  7C 79 1B 78 */	mr r25, r3
/* 8010ED28 0010BD28  83 A3 00 18 */	lwz r29, 0x18(r3)
/* 8010ED2C 0010BD2C  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 8010ED30 0010BD30  80 9D 00 00 */	lwz r4, 0(r29)
/* 8010ED34 0010BD34  4B F2 1E 99 */	bl evtGetValue
/* 8010ED38 0010BD38  80 9D 00 04 */	lwz r4, 4(r29)
/* 8010ED3C 0010BD3C  7C 7C 1B 78 */	mr r28, r3
/* 8010ED40 0010BD40  7F 23 CB 78 */	mr r3, r25
/* 8010ED44 0010BD44  4B F2 1E 89 */	bl evtGetValue
/* 8010ED48 0010BD48  80 9D 00 08 */	lwz r4, 8(r29)
/* 8010ED4C 0010BD4C  7C 7E 1B 78 */	mr r30, r3
/* 8010ED50 0010BD50  7F 23 CB 78 */	mr r3, r25
/* 8010ED54 0010BD54  4B F2 1E 79 */	bl evtGetValue
/* 8010ED58 0010BD58  80 9D 00 0C */	lwz r4, 0xc(r29)
/* 8010ED5C 0010BD5C  7C 7B 1B 78 */	mr r27, r3
/* 8010ED60 0010BD60  7F 23 CB 78 */	mr r3, r25
/* 8010ED64 0010BD64  4B F2 1E 69 */	bl evtGetValue
/* 8010ED68 0010BD68  83 5D 00 10 */	lwz r26, 0x10(r29)
/* 8010ED6C 0010BD6C  7C 7D 1B 78 */	mr r29, r3
/* 8010ED70 0010BD70  7F 23 CB 78 */	mr r3, r25
/* 8010ED74 0010BD74  7F 84 E3 78 */	mr r4, r28
/* 8010ED78 0010BD78  48 01 11 B5 */	bl BattleTransID
/* 8010ED7C 0010BD7C  7C 64 1B 78 */	mr r4, r3
/* 8010ED80 0010BD80  7F E3 FB 78 */	mr r3, r31
/* 8010ED84 0010BD84  4B FE 4B F5 */	bl BattleGetUnitPtr
/* 8010ED88 0010BD88  7C 1B E8 00 */	cmpw r27, r29
/* 8010ED8C 0010BD8C  7C 7F 1B 78 */	mr r31, r3
/* 8010ED90 0010BD90  40 81 00 10 */	ble lbl_8010EDA0
/* 8010ED94 0010BD94  7F 7C DB 78 */	mr r28, r27
/* 8010ED98 0010BD98  7F BB EB 78 */	mr r27, r29
/* 8010ED9C 0010BD9C  48 00 00 08 */	b lbl_8010EDA4
lbl_8010EDA0:
/* 8010EDA0 0010BDA0  7F BC EB 78 */	mr r28, r29
lbl_8010EDA4:
/* 8010EDA4 0010BDA4  7C 1E D8 00 */	cmpw r30, r27
/* 8010EDA8 0010BDA8  41 80 00 20 */	blt lbl_8010EDC8
/* 8010EDAC 0010BDAC  7C 1E E0 00 */	cmpw r30, r28
/* 8010EDB0 0010BDB0  41 81 00 18 */	bgt lbl_8010EDC8
/* 8010EDB4 0010BDB4  7F 23 CB 78 */	mr r3, r25
/* 8010EDB8 0010BDB8  7F 44 D3 78 */	mr r4, r26
/* 8010EDBC 0010BDBC  38 A0 00 01 */	li r5, 1
/* 8010EDC0 0010BDC0  4B F2 18 A9 */	bl evtSetValue
/* 8010EDC4 0010BDC4  48 00 00 54 */	b lbl_8010EE18
lbl_8010EDC8:
/* 8010EDC8 0010BDC8  7F 23 CB 78 */	mr r3, r25
/* 8010EDCC 0010BDCC  7F 44 D3 78 */	mr r4, r26
/* 8010EDD0 0010BDD0  38 A0 00 00 */	li r5, 0
/* 8010EDD4 0010BDD4  4B F2 18 95 */	bl evtSetValue
/* 8010EDD8 0010BDD8  88 1F 01 85 */	lbz r0, 0x185(r31)
/* 8010EDDC 0010BDDC  7C 00 07 75 */	extsb. r0, r0
/* 8010EDE0 0010BDE0  41 80 00 20 */	blt lbl_8010EE00
/* 8010EDE4 0010BDE4  7C 1E E0 00 */	cmpw r30, r28
/* 8010EDE8 0010BDE8  40 81 00 30 */	ble lbl_8010EE18
/* 8010EDEC 0010BDEC  7F 23 CB 78 */	mr r3, r25
/* 8010EDF0 0010BDF0  7F 44 D3 78 */	mr r4, r26
/* 8010EDF4 0010BDF4  38 A0 00 01 */	li r5, 1
/* 8010EDF8 0010BDF8  4B F2 18 71 */	bl evtSetValue
/* 8010EDFC 0010BDFC  48 00 00 1C */	b lbl_8010EE18
lbl_8010EE00:
/* 8010EE00 0010BE00  7C 1E D8 00 */	cmpw r30, r27
/* 8010EE04 0010BE04  40 80 00 14 */	bge lbl_8010EE18
/* 8010EE08 0010BE08  7F 23 CB 78 */	mr r3, r25
/* 8010EE0C 0010BE0C  7F 44 D3 78 */	mr r4, r26
/* 8010EE10 0010BE10  38 A0 00 01 */	li r5, 1
/* 8010EE14 0010BE14  4B F2 18 55 */	bl evtSetValue
lbl_8010EE18:
/* 8010EE18 0010BE18  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 8010EE1C 0010BE1C  38 60 00 02 */	li r3, 2
/* 8010EE20 0010BE20  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8010EE24 0010BE24  7C 08 03 A6 */	mtlr r0
/* 8010EE28 0010BE28  38 21 00 30 */	addi r1, r1, 0x30
/* 8010EE2C 0010BE2C  4E 80 00 20 */	blr 

.global unk_JP_US_EU_30_8010ee30
unk_JP_US_EU_30_8010ee30:
/* 8010EE30 0010BE30  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8010EE34 0010BE34  7C 08 02 A6 */	mflr r0
/* 8010EE38 0010BE38  90 01 00 14 */	stw r0, 0x14(r1)
/* 8010EE3C 0010BE3C  BF C1 00 08 */	stmw r30, 8(r1)
/* 8010EE40 0010BE40  7C 7E 1B 78 */	mr r30, r3
/* 8010EE44 0010BE44  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8010EE48 0010BE48  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 8010EE4C 0010BE4C  80 84 00 00 */	lwz r4, 0(r4)
/* 8010EE50 0010BE50  4B F2 1D 7D */	bl evtGetValue
/* 8010EE54 0010BE54  7C 60 1B 78 */	mr r0, r3
/* 8010EE58 0010BE58  7F C3 F3 78 */	mr r3, r30
/* 8010EE5C 0010BE5C  7C 04 03 78 */	mr r4, r0
/* 8010EE60 0010BE60  48 01 10 CD */	bl BattleTransID
/* 8010EE64 0010BE64  7C 64 1B 78 */	mr r4, r3
/* 8010EE68 0010BE68  7F E3 FB 78 */	mr r3, r31
/* 8010EE6C 0010BE6C  4B FE 4B 0D */	bl BattleGetUnitPtr
/* 8010EE70 0010BE70  28 03 00 00 */	cmplwi r3, 0
/* 8010EE74 0010BE74  41 82 00 10 */	beq lbl_8010EE84
/* 8010EE78 0010BE78  A0 03 01 FA */	lhz r0, 0x1fa(r3)
/* 8010EE7C 0010BE7C  60 00 00 01 */	ori r0, r0, 1
/* 8010EE80 0010BE80  B0 03 01 FA */	sth r0, 0x1fa(r3)
lbl_8010EE84:
/* 8010EE84 0010BE84  BB C1 00 08 */	lmw r30, 8(r1)
/* 8010EE88 0010BE88  38 60 00 02 */	li r3, 2
/* 8010EE8C 0010BE8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8010EE90 0010BE90  7C 08 03 A6 */	mtlr r0
/* 8010EE94 0010BE94  38 21 00 10 */	addi r1, r1, 0x10
/* 8010EE98 0010BE98  4E 80 00 20 */	blr 

.global _add_star_point_disp_offset
_add_star_point_disp_offset:
/* 8010EE9C 0010BE9C  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 8010EEA0 0010BEA0  7C 08 02 A6 */	mflr r0
/* 8010EEA4 0010BEA4  90 01 00 74 */	stw r0, 0x74(r1)
/* 8010EEA8 0010BEA8  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 8010EEAC 0010BEAC  F3 E1 00 68 */	psq_st f31, 104(r1), 0, qr0
/* 8010EEB0 0010BEB0  DB C1 00 50 */	stfd f30, 0x50(r1)
/* 8010EEB4 0010BEB4  F3 C1 00 58 */	psq_st f30, 88(r1), 0, qr0
/* 8010EEB8 0010BEB8  BF 61 00 3C */	stmw r27, 0x3c(r1)
/* 8010EEBC 0010BEBC  7C 7F 1B 78 */	mr r31, r3
/* 8010EEC0 0010BEC0  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 8010EEC4 0010BEC4  83 A3 00 18 */	lwz r29, 0x18(r3)
/* 8010EEC8 0010BEC8  80 9D 00 00 */	lwz r4, 0(r29)
/* 8010EECC 0010BECC  4B F2 1D 01 */	bl evtGetValue
/* 8010EED0 0010BED0  7C 60 1B 78 */	mr r0, r3
/* 8010EED4 0010BED4  7F E3 FB 78 */	mr r3, r31
/* 8010EED8 0010BED8  7C 04 03 78 */	mr r4, r0
/* 8010EEDC 0010BEDC  48 01 10 51 */	bl BattleTransID
/* 8010EEE0 0010BEE0  7C 64 1B 78 */	mr r4, r3
/* 8010EEE4 0010BEE4  7F C3 F3 78 */	mr r3, r30
/* 8010EEE8 0010BEE8  4B FE 4A 91 */	bl BattleGetUnitPtr
/* 8010EEEC 0010BEEC  83 9D 00 04 */	lwz r28, 4(r29)
/* 8010EEF0 0010BEF0  7C 7E 1B 78 */	mr r30, r3
/* 8010EEF4 0010BEF4  7F E3 FB 78 */	mr r3, r31
/* 8010EEF8 0010BEF8  7F 84 E3 78 */	mr r4, r28
/* 8010EEFC 0010BEFC  4B F2 1C D1 */	bl evtGetValue
/* 8010EF00 0010BF00  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8010EF04 0010BF04  3C 00 43 30 */	lis r0, 0x4330
/* 8010EF08 0010BF08  90 61 00 0C */	stw r3, 0xc(r1)
/* 8010EF0C 0010BF0C  3C 80 80 2F */	lis r4, lbl_802EE468@ha
/* 8010EF10 0010BF10  C8 24 E4 68 */	lfd f1, lbl_802EE468@l(r4)
/* 8010EF14 0010BF14  7F E3 FB 78 */	mr r3, r31
/* 8010EF18 0010BF18  90 01 00 08 */	stw r0, 8(r1)
/* 8010EF1C 0010BF1C  83 7D 00 08 */	lwz r27, 8(r29)
/* 8010EF20 0010BF20  C8 01 00 08 */	lfd f0, 8(r1)
/* 8010EF24 0010BF24  7F 64 DB 78 */	mr r4, r27
/* 8010EF28 0010BF28  EF E0 08 28 */	fsubs f31, f0, f1
/* 8010EF2C 0010BF2C  4B F2 1C A1 */	bl evtGetValue
/* 8010EF30 0010BF30  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8010EF34 0010BF34  3C 00 43 30 */	lis r0, 0x4330
/* 8010EF38 0010BF38  90 61 00 14 */	stw r3, 0x14(r1)
/* 8010EF3C 0010BF3C  3C 80 80 2F */	lis r4, lbl_802EE468@ha
/* 8010EF40 0010BF40  C8 24 E4 68 */	lfd f1, lbl_802EE468@l(r4)
/* 8010EF44 0010BF44  7F E3 FB 78 */	mr r3, r31
/* 8010EF48 0010BF48  90 01 00 10 */	stw r0, 0x10(r1)
/* 8010EF4C 0010BF4C  83 BD 00 0C */	lwz r29, 0xc(r29)
/* 8010EF50 0010BF50  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8010EF54 0010BF54  7F A4 EB 78 */	mr r4, r29
/* 8010EF58 0010BF58  EF C0 08 28 */	fsubs f30, f0, f1
/* 8010EF5C 0010BF5C  4B F2 1C 71 */	bl evtGetValue
/* 8010EF60 0010BF60  80 DE 00 10 */	lwz r6, 0x10(r30)
/* 8010EF64 0010BF64  6C 64 80 00 */	xoris r4, r3, 0x8000
/* 8010EF68 0010BF68  3C 00 43 30 */	lis r0, 0x4330
/* 8010EF6C 0010BF6C  3C 60 80 2F */	lis r3, lbl_802EE468@ha
/* 8010EF70 0010BF70  C0 26 00 90 */	lfs f1, 0x90(r6)
/* 8010EF74 0010BF74  38 A3 E4 68 */	addi r5, r3, lbl_802EE468@l
/* 8010EF78 0010BF78  C0 06 00 94 */	lfs f0, 0x94(r6)
/* 8010EF7C 0010BF7C  7F E3 FB 78 */	mr r3, r31
/* 8010EF80 0010BF80  EF FF 08 2A */	fadds f31, f31, f1
/* 8010EF84 0010BF84  90 81 00 1C */	stw r4, 0x1c(r1)
/* 8010EF88 0010BF88  C8 65 00 00 */	lfd f3, 0(r5)
/* 8010EF8C 0010BF8C  EF DE 00 2A */	fadds f30, f30, f0
/* 8010EF90 0010BF90  90 01 00 18 */	stw r0, 0x18(r1)
/* 8010EF94 0010BF94  7F 84 E3 78 */	mr r4, r28
/* 8010EF98 0010BF98  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 8010EF9C 0010BF9C  FC 00 F8 1E */	fctiwz f0, f31
/* 8010EFA0 0010BFA0  C0 26 00 98 */	lfs f1, 0x98(r6)
/* 8010EFA4 0010BFA4  EF E2 18 28 */	fsubs f31, f2, f3
/* 8010EFA8 0010BFA8  D8 01 00 20 */	stfd f0, 0x20(r1)
/* 8010EFAC 0010BFAC  EF FF 08 2A */	fadds f31, f31, f1
/* 8010EFB0 0010BFB0  80 A1 00 24 */	lwz r5, 0x24(r1)
/* 8010EFB4 0010BFB4  4B F2 16 B5 */	bl evtSetValue
/* 8010EFB8 0010BFB8  FC 00 F0 1E */	fctiwz f0, f30
/* 8010EFBC 0010BFBC  7F E3 FB 78 */	mr r3, r31
/* 8010EFC0 0010BFC0  7F 64 DB 78 */	mr r4, r27
/* 8010EFC4 0010BFC4  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 8010EFC8 0010BFC8  80 A1 00 2C */	lwz r5, 0x2c(r1)
/* 8010EFCC 0010BFCC  4B F2 16 9D */	bl evtSetValue
/* 8010EFD0 0010BFD0  FC 00 F8 1E */	fctiwz f0, f31
/* 8010EFD4 0010BFD4  7F E3 FB 78 */	mr r3, r31
/* 8010EFD8 0010BFD8  7F A4 EB 78 */	mr r4, r29
/* 8010EFDC 0010BFDC  D8 01 00 30 */	stfd f0, 0x30(r1)
/* 8010EFE0 0010BFE0  80 A1 00 34 */	lwz r5, 0x34(r1)
/* 8010EFE4 0010BFE4  4B F2 16 85 */	bl evtSetValue
/* 8010EFE8 0010BFE8  38 60 00 02 */	li r3, 2
/* 8010EFEC 0010BFEC  E3 E1 00 68 */	psq_l f31, 104(r1), 0, qr0
/* 8010EFF0 0010BFF0  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 8010EFF4 0010BFF4  E3 C1 00 58 */	psq_l f30, 88(r1), 0, qr0
/* 8010EFF8 0010BFF8  CB C1 00 50 */	lfd f30, 0x50(r1)
/* 8010EFFC 0010BFFC  BB 61 00 3C */	lmw r27, 0x3c(r1)
/* 8010F000 0010C000  80 01 00 74 */	lwz r0, 0x74(r1)
/* 8010F004 0010C004  7C 08 03 A6 */	mtlr r0
/* 8010F008 0010C008  38 21 00 70 */	addi r1, r1, 0x70
/* 8010F00C 0010C00C  4E 80 00 20 */	blr 

.global _check_at_dm_event_wait
_check_at_dm_event_wait:
/* 8010F010 0010C010  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8010F014 0010C014  7C 08 02 A6 */	mflr r0
/* 8010F018 0010C018  90 01 00 14 */	stw r0, 0x14(r1)
/* 8010F01C 0010C01C  BF C1 00 08 */	stmw r30, 8(r1)
/* 8010F020 0010C020  7C 7E 1B 78 */	mr r30, r3
/* 8010F024 0010C024  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8010F028 0010C028  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 8010F02C 0010C02C  80 84 00 00 */	lwz r4, 0(r4)
/* 8010F030 0010C030  4B F2 1B 9D */	bl evtGetValue
/* 8010F034 0010C034  7C 60 1B 78 */	mr r0, r3
/* 8010F038 0010C038  7F C3 F3 78 */	mr r3, r30
/* 8010F03C 0010C03C  7C 04 03 78 */	mr r4, r0
/* 8010F040 0010C040  48 01 0E ED */	bl BattleTransID
/* 8010F044 0010C044  7C 64 1B 78 */	mr r4, r3
/* 8010F048 0010C048  7F E3 FB 78 */	mr r3, r31
/* 8010F04C 0010C04C  4B FE 49 2D */	bl BattleGetUnitPtr
/* 8010F050 0010C050  7C 7F 1B 79 */	or. r31, r3, r3
/* 8010F054 0010C054  40 82 00 0C */	bne lbl_8010F060
/* 8010F058 0010C058  38 60 00 02 */	li r3, 2
/* 8010F05C 0010C05C  48 00 00 48 */	b lbl_8010F0A4
lbl_8010F060:
/* 8010F060 0010C060  80 7F 02 A4 */	lwz r3, 0x2a4(r31)
/* 8010F064 0010C064  2C 03 00 00 */	cmpwi r3, 0
/* 8010F068 0010C068  41 82 00 18 */	beq lbl_8010F080
/* 8010F06C 0010C06C  4B F2 6E FD */	bl evtCheckID
/* 8010F070 0010C070  2C 03 00 00 */	cmpwi r3, 0
/* 8010F074 0010C074  41 82 00 0C */	beq lbl_8010F080
/* 8010F078 0010C078  38 60 00 00 */	li r3, 0
/* 8010F07C 0010C07C  48 00 00 28 */	b lbl_8010F0A4
lbl_8010F080:
/* 8010F080 0010C080  80 7F 02 B0 */	lwz r3, 0x2b0(r31)
/* 8010F084 0010C084  2C 03 00 00 */	cmpwi r3, 0
/* 8010F088 0010C088  41 82 00 18 */	beq lbl_8010F0A0
/* 8010F08C 0010C08C  4B F2 6E DD */	bl evtCheckID
/* 8010F090 0010C090  2C 03 00 00 */	cmpwi r3, 0
/* 8010F094 0010C094  41 82 00 0C */	beq lbl_8010F0A0
/* 8010F098 0010C098  38 60 00 00 */	li r3, 0
/* 8010F09C 0010C09C  48 00 00 08 */	b lbl_8010F0A4
lbl_8010F0A0:
/* 8010F0A0 0010C0A0  38 60 00 02 */	li r3, 2
lbl_8010F0A4:
/* 8010F0A4 0010C0A4  BB C1 00 08 */	lmw r30, 8(r1)
/* 8010F0A8 0010C0A8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8010F0AC 0010C0AC  7C 08 03 A6 */	mtlr r0
/* 8010F0B0 0010C0B0  38 21 00 10 */	addi r1, r1, 0x10
/* 8010F0B4 0010C0B4  4E 80 00 20 */	blr 

.global _disable_restore_command_cursor
_disable_restore_command_cursor:
/* 8010F0B8 0010C0B8  80 8D 17 10 */	lwz r4, lbl_80418970@sda21(r13)
/* 8010F0BC 0010C0BC  38 00 00 00 */	li r0, 0
/* 8010F0C0 0010C0C0  38 60 00 02 */	li r3, 2
/* 8010F0C4 0010C0C4  90 04 1C 70 */	stw r0, 0x1c70(r4)
/* 8010F0C8 0010C0C8  98 04 1C 74 */	stb r0, 0x1c74(r4)
/* 8010F0CC 0010C0CC  4E 80 00 20 */	blr 
