.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effRippleSetPosition
effRippleSetPosition:
/* 8019326C 0019026C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80193270 00190270  7C 08 02 A6 */	mflr r0
/* 80193274 00190274  90 01 00 34 */	stw r0, 0x34(r1)
/* 80193278 00190278  DB E1 00 28 */	stfd f31, 0x28(r1)
/* 8019327C 0019027C  FF E0 18 90 */	fmr f31, f3
/* 80193280 00190280  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 80193284 00190284  FF C0 10 90 */	fmr f30, f2
/* 80193288 00190288  DB A1 00 18 */	stfd f29, 0x18(r1)
/* 8019328C 0019028C  FF A0 08 90 */	fmr f29, f1
/* 80193290 00190290  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80193294 00190294  7C 7F 1B 78 */	mr r31, r3
/* 80193298 00190298  3C 60 80 30 */	lis r3, lbl_802F9328@ha
/* 8019329C 0019029C  38 83 93 28 */	addi r4, r3, lbl_802F9328@l
/* 801932A0 001902A0  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 801932A4 001902A4  48 0D 41 A9 */	bl strcmp
/* 801932A8 001902A8  2C 03 00 00 */	cmpwi r3, 0
/* 801932AC 001902AC  40 82 00 1C */	bne lbl_801932C8
/* 801932B0 001902B0  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 801932B4 001902B4  D3 A3 00 04 */	stfs f29, 4(r3)
/* 801932B8 001902B8  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 801932BC 001902BC  D3 C3 00 08 */	stfs f30, 8(r3)
/* 801932C0 001902C0  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 801932C4 001902C4  D3 E3 00 0C */	stfs f31, 0xc(r3)
lbl_801932C8:
/* 801932C8 001902C8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801932CC 001902CC  CB E1 00 28 */	lfd f31, 0x28(r1)
/* 801932D0 001902D0  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 801932D4 001902D4  CB A1 00 18 */	lfd f29, 0x18(r1)
/* 801932D8 001902D8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 801932DC 001902DC  7C 08 03 A6 */	mtlr r0
/* 801932E0 001902E0  38 21 00 30 */	addi r1, r1, 0x30
/* 801932E4 001902E4  4E 80 00 20 */	blr 

.global effRippleSetCamId
effRippleSetCamId:
/* 801932E8 001902E8  80 63 00 0C */	lwz r3, 0xc(r3)
/* 801932EC 001902EC  90 83 00 34 */	stw r4, 0x34(r3)
/* 801932F0 001902F0  4E 80 00 20 */	blr 

.global effRippleSetRxRz
effRippleSetRxRz:
/* 801932F4 001902F4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801932F8 001902F8  7C 08 02 A6 */	mflr r0
/* 801932FC 001902FC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80193300 00190300  48 04 B2 95 */	bl effRippleN64SetRxRz
/* 80193304 00190304  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80193308 00190308  7C 08 03 A6 */	mtlr r0
/* 8019330C 0019030C  38 21 00 10 */	addi r1, r1, 0x10
/* 80193310 00190310  4E 80 00 20 */	blr 

.global func_80193314
func_80193314:

.global effRippleEntry
effRippleEntry:
/* 80193314 00190314  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80193318 00190318  7C 08 02 A6 */	mflr r0
/* 8019331C 0019031C  C0 82 D1 88 */	lfs f4, lbl_8041E508-_SDA2_BASE_(r2)
/* 80193320 00190320  90 01 00 14 */	stw r0, 0x14(r1)
/* 80193324 00190324  48 04 B8 05 */	bl effRippleN64Entry
/* 80193328 00190328  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019332C 0019032C  7C 08 03 A6 */	mtlr r0
/* 80193330 00190330  38 21 00 10 */	addi r1, r1, 0x10
/* 80193334 00190334  4E 80 00 20 */	blr 
