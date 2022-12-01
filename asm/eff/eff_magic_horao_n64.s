.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effMagicHoraoDisp
effMagicHoraoDisp:
/* 801D0B18 001CDB18  94 21 FE C0 */	stwu r1, -0x140(r1)
/* 801D0B1C 001CDB1C  7C 08 02 A6 */	mflr r0
/* 801D0B20 001CDB20  90 01 01 44 */	stw r0, 0x144(r1)
/* 801D0B24 001CDB24  DB E1 01 30 */	stfd f31, 0x130(r1)
/* 801D0B28 001CDB28  F3 E1 01 38 */	psq_st f31, 312(r1), 0, qr0
/* 801D0B2C 001CDB2C  DB C1 01 20 */	stfd f30, 0x120(r1)
/* 801D0B30 001CDB30  F3 C1 01 28 */	psq_st f30, 296(r1), 0, qr0
/* 801D0B34 001CDB34  DB A1 01 10 */	stfd f29, 0x110(r1)
/* 801D0B38 001CDB38  F3 A1 01 18 */	psq_st f29, 280(r1), 0, qr0
/* 801D0B3C 001CDB3C  DB 81 01 00 */	stfd f28, 0x100(r1)
/* 801D0B40 001CDB40  F3 81 01 08 */	psq_st f28, 264(r1), 0, qr0
/* 801D0B44 001CDB44  DB 61 00 F0 */	stfd f27, 0xf0(r1)
/* 801D0B48 001CDB48  F3 61 00 F8 */	psq_st f27, 248(r1), 0, qr0
/* 801D0B4C 001CDB4C  DB 41 00 E0 */	stfd f26, 0xe0(r1)
/* 801D0B50 001CDB50  F3 41 00 E8 */	psq_st f26, 232(r1), 0, qr0
/* 801D0B54 001CDB54  BE C1 00 B8 */	stmw r22, 0xb8(r1)
/* 801D0B58 001CDB58  7C 96 23 78 */	mr r22, r4
/* 801D0B5C 001CDB5C  4B E3 E5 F5 */	bl camGetPtr
/* 801D0B60 001CDB60  C0 22 E3 D4 */	lfs f1, lbl_8041F754@sda21(r2)
/* 801D0B64 001CDB64  7C 77 1B 78 */	mr r23, r3
/* 801D0B68 001CDB68  83 16 00 0C */	lwz r24, 0xc(r22)
/* 801D0B6C 001CDB6C  38 61 00 38 */	addi r3, r1, 0x38
/* 801D0B70 001CDB70  FC 40 08 90 */	fmr f2, f1
/* 801D0B74 001CDB74  FC 60 08 90 */	fmr f3, f1
/* 801D0B78 001CDB78  C3 F8 00 34 */	lfs f31, 0x34(r24)
/* 801D0B7C 001CDB7C  83 38 00 38 */	lwz r25, 0x38(r24)
/* 801D0B80 001CDB80  83 78 00 3C */	lwz r27, 0x3c(r24)
/* 801D0B84 001CDB84  83 58 00 44 */	lwz r26, 0x44(r24)
/* 801D0B88 001CDB88  48 0C 79 25 */	bl PSMTXScale
/* 801D0B8C 001CDB8C  C0 62 E3 D8 */	lfs f3, lbl_8041F758@sda21(r2)
/* 801D0B90 001CDB90  38 61 00 68 */	addi r3, r1, 0x68
/* 801D0B94 001CDB94  C0 38 00 04 */	lfs f1, 4(r24)
/* 801D0B98 001CDB98  C0 58 00 08 */	lfs f2, 8(r24)
/* 801D0B9C 001CDB9C  C0 18 00 0C */	lfs f0, 0xc(r24)
/* 801D0BA0 001CDBA0  EC 23 00 72 */	fmuls f1, f3, f1
/* 801D0BA4 001CDBA4  EC 43 00 B2 */	fmuls f2, f3, f2
/* 801D0BA8 001CDBA8  EC 63 00 32 */	fmuls f3, f3, f0
/* 801D0BAC 001CDBAC  48 0C 78 81 */	bl PSMTXTrans
/* 801D0BB0 001CDBB0  38 81 00 68 */	addi r4, r1, 0x68
/* 801D0BB4 001CDBB4  38 61 00 38 */	addi r3, r1, 0x38
/* 801D0BB8 001CDBB8  7C 85 23 78 */	mr r5, r4
/* 801D0BBC 001CDBBC  48 0C 73 A5 */	bl PSMTXConcat
/* 801D0BC0 001CDBC0  C0 38 00 24 */	lfs f1, 0x24(r24)
/* 801D0BC4 001CDBC4  38 61 00 38 */	addi r3, r1, 0x38
/* 801D0BC8 001CDBC8  FC 40 08 90 */	fmr f2, f1
/* 801D0BCC 001CDBCC  FC 60 08 90 */	fmr f3, f1
/* 801D0BD0 001CDBD0  48 0C 78 DD */	bl PSMTXScale
/* 801D0BD4 001CDBD4  38 61 00 68 */	addi r3, r1, 0x68
/* 801D0BD8 001CDBD8  38 81 00 38 */	addi r4, r1, 0x38
/* 801D0BDC 001CDBDC  7C 65 1B 78 */	mr r5, r3
/* 801D0BE0 001CDBE0  48 0C 73 81 */	bl PSMTXConcat
/* 801D0BE4 001CDBE4  38 81 00 68 */	addi r4, r1, 0x68
/* 801D0BE8 001CDBE8  38 77 01 1C */	addi r3, r23, 0x11c
/* 801D0BEC 001CDBEC  7C 85 23 78 */	mr r5, r4
/* 801D0BF0 001CDBF0  48 0C 73 71 */	bl PSMTXConcat
/* 801D0BF4 001CDBF4  38 61 00 68 */	addi r3, r1, 0x68
/* 801D0BF8 001CDBF8  38 80 00 00 */	li r4, 0
/* 801D0BFC 001CDBFC  48 0E 38 FD */	bl GXLoadPosMtxImm
/* 801D0C00 001CDC00  38 60 00 00 */	li r3, 0
/* 801D0C04 001CDC04  48 0E 39 95 */	bl GXSetCurrentMtx
/* 801D0C08 001CDC08  1C 9A 00 1E */	mulli r4, r26, 0x1e
/* 801D0C0C 001CDC0C  3C 00 43 30 */	lis r0, 0x4330
/* 801D0C10 001CDC10  90 01 00 98 */	stw r0, 0x98(r1)
/* 801D0C14 001CDC14  3C 60 80 30 */	lis r3, lbl_802FABA0@ha
/* 801D0C18 001CDC18  80 A2 E3 D0 */	lwz r5, lbl_8041F750@sda21(r2)
/* 801D0C1C 001CDC1C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 801D0C20 001CDC20  90 01 00 9C */	stw r0, 0x9c(r1)
/* 801D0C24 001CDC24  C8 23 AB A0 */	lfd f1, lbl_802FABA0@l(r3)
/* 801D0C28 001CDC28  C8 01 00 98 */	lfd f0, 0x98(r1)
/* 801D0C2C 001CDC2C  C0 42 E3 DC */	lfs f2, lbl_8041F75C@sda21(r2)
/* 801D0C30 001CDC30  EC 20 08 28 */	fsubs f1, f0, f1
/* 801D0C34 001CDC34  C0 02 E3 E0 */	lfs f0, lbl_8041F760@sda21(r2)
/* 801D0C38 001CDC38  90 A1 00 10 */	stw r5, 0x10(r1)
/* 801D0C3C 001CDC3C  EC 22 00 72 */	fmuls f1, f2, f1
/* 801D0C40 001CDC40  EF 41 00 24 */	fdivs f26, f1, f0
/* 801D0C44 001CDC44  FC 20 D0 90 */	fmr f1, f26
/* 801D0C48 001CDC48  48 09 B7 B1 */	bl sin
/* 801D0C4C 001CDC4C  FC 60 08 18 */	frsp f3, f1
/* 801D0C50 001CDC50  C0 42 E3 E8 */	lfs f2, lbl_8041F768@sda21(r2)
/* 801D0C54 001CDC54  C0 02 E3 E4 */	lfs f0, lbl_8041F764@sda21(r2)
/* 801D0C58 001CDC58  FC 20 D0 90 */	fmr f1, f26
/* 801D0C5C 001CDC5C  EC 02 00 FA */	fmadds f0, f2, f3, f0
/* 801D0C60 001CDC60  FC 00 00 1E */	fctiwz f0, f0
/* 801D0C64 001CDC64  D8 01 00 A0 */	stfd f0, 0xa0(r1)
/* 801D0C68 001CDC68  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 801D0C6C 001CDC6C  98 01 00 10 */	stb r0, 0x10(r1)
/* 801D0C70 001CDC70  48 09 B7 89 */	bl sin
/* 801D0C74 001CDC74  FC 40 08 18 */	frsp f2, f1
/* 801D0C78 001CDC78  C0 22 E3 E8 */	lfs f1, lbl_8041F768@sda21(r2)
/* 801D0C7C 001CDC7C  C0 02 E3 E4 */	lfs f0, lbl_8041F764@sda21(r2)
/* 801D0C80 001CDC80  38 81 00 14 */	addi r4, r1, 0x14
/* 801D0C84 001CDC84  9B 61 00 13 */	stb r27, 0x13(r1)
/* 801D0C88 001CDC88  38 60 00 01 */	li r3, 1
/* 801D0C8C 001CDC8C  EC 01 00 BA */	fmadds f0, f1, f2, f0
/* 801D0C90 001CDC90  FC 00 00 1E */	fctiwz f0, f0
/* 801D0C94 001CDC94  D8 01 00 A8 */	stfd f0, 0xa8(r1)
/* 801D0C98 001CDC98  80 01 00 AC */	lwz r0, 0xac(r1)
/* 801D0C9C 001CDC9C  98 01 00 11 */	stb r0, 0x11(r1)
/* 801D0CA0 001CDCA0  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801D0CA4 001CDCA4  90 01 00 14 */	stw r0, 0x14(r1)
/* 801D0CA8 001CDCA8  48 0E 20 0D */	bl GXSetTevColor
/* 801D0CAC 001CDCAC  38 60 00 00 */	li r3, 0
/* 801D0CB0 001CDCB0  48 0E 04 89 */	bl GXSetNumChans
/* 801D0CB4 001CDCB4  38 60 00 01 */	li r3, 1
/* 801D0CB8 001CDCB8  48 0D E5 C9 */	bl GXSetNumTexGens
/* 801D0CBC 001CDCBC  38 60 00 00 */	li r3, 0
/* 801D0CC0 001CDCC0  38 80 00 01 */	li r4, 1
/* 801D0CC4 001CDCC4  38 A0 00 04 */	li r5, 4
/* 801D0CC8 001CDCC8  38 C0 00 1E */	li r6, 0x1e
/* 801D0CCC 001CDCCC  38 E0 00 00 */	li r7, 0
/* 801D0CD0 001CDCD0  39 00 00 7D */	li r8, 0x7d
/* 801D0CD4 001CDCD4  48 0D E3 2D */	bl GXSetTexCoordGen2
/* 801D0CD8 001CDCD8  C0 22 E3 EC */	lfs f1, lbl_8041F76C@sda21(r2)
/* 801D0CDC 001CDCDC  38 61 00 38 */	addi r3, r1, 0x38
/* 801D0CE0 001CDCE0  C0 62 E3 F0 */	lfs f3, lbl_8041F770@sda21(r2)
/* 801D0CE4 001CDCE4  FC 40 08 90 */	fmr f2, f1
/* 801D0CE8 001CDCE8  48 0C 77 C5 */	bl PSMTXScale
/* 801D0CEC 001CDCEC  38 61 00 38 */	addi r3, r1, 0x38
/* 801D0CF0 001CDCF0  38 80 00 1E */	li r4, 0x1e
/* 801D0CF4 001CDCF4  38 A0 00 01 */	li r5, 1
/* 801D0CF8 001CDCF8  48 0E 38 D5 */	bl GXLoadTexMtxImm
/* 801D0CFC 001CDCFC  3C 60 80 3A */	lis r3, lbl_803A2E28@ha
/* 801D0D00 001CDD00  38 63 2E 28 */	addi r3, r3, lbl_803A2E28@l
/* 801D0D04 001CDD04  48 00 09 AD */	bl effSetVtxDescN64
/* 801D0D08 001CDD08  80 18 00 2C */	lwz r0, 0x2c(r24)
/* 801D0D0C 001CDD0C  2C 00 00 01 */	cmpwi r0, 1
/* 801D0D10 001CDD10  40 82 01 F0 */	bne .L_801D0F00
/* 801D0D14 001CDD14  38 60 00 01 */	li r3, 1
/* 801D0D18 001CDD18  48 0E 24 B1 */	bl GXSetNumTevStages
/* 801D0D1C 001CDD1C  38 60 00 00 */	li r3, 0
/* 801D0D20 001CDD20  38 80 00 00 */	li r4, 0
/* 801D0D24 001CDD24  38 A0 00 00 */	li r5, 0
/* 801D0D28 001CDD28  38 C0 00 FF */	li r6, 0xff
/* 801D0D2C 001CDD2C  48 0E 23 01 */	bl GXSetTevOrder
/* 801D0D30 001CDD30  38 60 00 00 */	li r3, 0
/* 801D0D34 001CDD34  38 80 00 00 */	li r4, 0
/* 801D0D38 001CDD38  38 A0 00 00 */	li r5, 0
/* 801D0D3C 001CDD3C  38 C0 00 00 */	li r6, 0
/* 801D0D40 001CDD40  38 E0 00 01 */	li r7, 1
/* 801D0D44 001CDD44  39 00 00 00 */	li r8, 0
/* 801D0D48 001CDD48  48 0E 1E 9D */	bl GXSetTevColorOp
/* 801D0D4C 001CDD4C  38 60 00 00 */	li r3, 0
/* 801D0D50 001CDD50  38 80 00 00 */	li r4, 0
/* 801D0D54 001CDD54  38 A0 00 00 */	li r5, 0
/* 801D0D58 001CDD58  38 C0 00 00 */	li r6, 0
/* 801D0D5C 001CDD5C  38 E0 00 01 */	li r7, 1
/* 801D0D60 001CDD60  39 00 00 00 */	li r8, 0
/* 801D0D64 001CDD64  48 0E 1E E9 */	bl GXSetTevAlphaOp
/* 801D0D68 001CDD68  38 60 00 00 */	li r3, 0
/* 801D0D6C 001CDD6C  38 80 00 0F */	li r4, 0xf
/* 801D0D70 001CDD70  38 A0 00 0F */	li r5, 0xf
/* 801D0D74 001CDD74  38 C0 00 0F */	li r6, 0xf
/* 801D0D78 001CDD78  38 E0 00 02 */	li r7, 2
/* 801D0D7C 001CDD7C  48 0E 1D E1 */	bl GXSetTevColorIn
/* 801D0D80 001CDD80  38 60 00 00 */	li r3, 0
/* 801D0D84 001CDD84  38 80 00 07 */	li r4, 7
/* 801D0D88 001CDD88  38 A0 00 04 */	li r5, 4
/* 801D0D8C 001CDD8C  38 C0 00 01 */	li r6, 1
/* 801D0D90 001CDD90  38 E0 00 07 */	li r7, 7
/* 801D0D94 001CDD94  48 0E 1E 0D */	bl GXSetTevAlphaIn
/* 801D0D98 001CDD98  38 81 00 18 */	addi r4, r1, 0x18
/* 801D0D9C 001CDD9C  38 60 00 56 */	li r3, 0x56
/* 801D0DA0 001CDDA0  48 00 0A A5 */	bl effGetTexObjN64
/* 801D0DA4 001CDDA4  38 61 00 18 */	addi r3, r1, 0x18
/* 801D0DA8 001CDDA8  38 80 00 00 */	li r4, 0
/* 801D0DAC 001CDDAC  48 0E 0C D1 */	bl GXLoadTexObj
/* 801D0DB0 001CDDB0  38 60 00 90 */	li r3, 0x90
/* 801D0DB4 001CDDB4  38 80 00 00 */	li r4, 0
/* 801D0DB8 001CDDB8  38 A0 00 06 */	li r5, 6
/* 801D0DBC 001CDDBC  48 0D EE AD */	bl GXBegin
/* 801D0DC0 001CDDC0  38 60 00 00 */	li r3, 0
/* 801D0DC4 001CDDC4  38 80 00 01 */	li r4, 1
/* 801D0DC8 001CDDC8  38 A0 00 02 */	li r5, 2
/* 801D0DCC 001CDDCC  38 C0 00 00 */	li r6, 0
/* 801D0DD0 001CDDD0  38 E0 00 00 */	li r7, 0
/* 801D0DD4 001CDDD4  39 00 00 02 */	li r8, 2
/* 801D0DD8 001CDDD8  39 20 00 03 */	li r9, 3
/* 801D0DDC 001CDDDC  39 40 00 00 */	li r10, 0
/* 801D0DE0 001CDDE0  48 00 08 55 */	bl tri2
/* 801D0DE4 001CDDE4  80 18 00 30 */	lwz r0, 0x30(r24)
/* 801D0DE8 001CDDE8  3C 60 88 89 */	lis r3, 0x88888889@ha
/* 801D0DEC 001CDDEC  38 A3 88 89 */	addi r5, r3, 0x88888889@l
/* 801D0DF0 001CDDF0  80 C2 1E 38 */	lwz r6, lbl_804231B8@sda21(r2)
/* 801D0DF4 001CDDF4  20 00 00 1E */	subfic r0, r0, 0x1e
/* 801D0DF8 001CDDF8  38 81 00 0C */	addi r4, r1, 0xc
/* 801D0DFC 001CDDFC  1C 00 00 FF */	mulli r0, r0, 0xff
/* 801D0E00 001CDE00  90 C1 00 08 */	stw r6, 8(r1)
/* 801D0E04 001CDE04  38 60 00 01 */	li r3, 1
/* 801D0E08 001CDE08  7C A5 00 96 */	mulhw r5, r5, r0
/* 801D0E0C 001CDE0C  7C 05 02 14 */	add r0, r5, r0
/* 801D0E10 001CDE10  7C 00 26 70 */	srawi r0, r0, 4
/* 801D0E14 001CDE14  54 05 0F FE */	srwi r5, r0, 0x1f
/* 801D0E18 001CDE18  7C 00 2A 14 */	add r0, r0, r5
/* 801D0E1C 001CDE1C  98 01 00 0B */	stb r0, 0xb(r1)
/* 801D0E20 001CDE20  80 01 00 08 */	lwz r0, 8(r1)
/* 801D0E24 001CDE24  90 01 00 0C */	stw r0, 0xc(r1)
/* 801D0E28 001CDE28  48 0E 1E 8D */	bl GXSetTevColor
/* 801D0E2C 001CDE2C  38 60 00 01 */	li r3, 1
/* 801D0E30 001CDE30  48 0E 23 99 */	bl GXSetNumTevStages
/* 801D0E34 001CDE34  38 60 00 00 */	li r3, 0
/* 801D0E38 001CDE38  38 80 00 00 */	li r4, 0
/* 801D0E3C 001CDE3C  38 A0 00 00 */	li r5, 0
/* 801D0E40 001CDE40  38 C0 00 FF */	li r6, 0xff
/* 801D0E44 001CDE44  48 0E 21 E9 */	bl GXSetTevOrder
/* 801D0E48 001CDE48  38 60 00 00 */	li r3, 0
/* 801D0E4C 001CDE4C  38 80 00 00 */	li r4, 0
/* 801D0E50 001CDE50  38 A0 00 00 */	li r5, 0
/* 801D0E54 001CDE54  38 C0 00 00 */	li r6, 0
/* 801D0E58 001CDE58  38 E0 00 01 */	li r7, 1
/* 801D0E5C 001CDE5C  39 00 00 00 */	li r8, 0
/* 801D0E60 001CDE60  48 0E 1D 85 */	bl GXSetTevColorOp
/* 801D0E64 001CDE64  38 60 00 00 */	li r3, 0
/* 801D0E68 001CDE68  38 80 00 00 */	li r4, 0
/* 801D0E6C 001CDE6C  38 A0 00 00 */	li r5, 0
/* 801D0E70 001CDE70  38 C0 00 00 */	li r6, 0
/* 801D0E74 001CDE74  38 E0 00 01 */	li r7, 1
/* 801D0E78 001CDE78  39 00 00 00 */	li r8, 0
/* 801D0E7C 001CDE7C  48 0E 1D D1 */	bl GXSetTevAlphaOp
/* 801D0E80 001CDE80  38 60 00 00 */	li r3, 0
/* 801D0E84 001CDE84  38 80 00 0F */	li r4, 0xf
/* 801D0E88 001CDE88  38 A0 00 0F */	li r5, 0xf
/* 801D0E8C 001CDE8C  38 C0 00 0F */	li r6, 0xf
/* 801D0E90 001CDE90  38 E0 00 08 */	li r7, 8
/* 801D0E94 001CDE94  48 0E 1C C9 */	bl GXSetTevColorIn
/* 801D0E98 001CDE98  38 60 00 00 */	li r3, 0
/* 801D0E9C 001CDE9C  38 80 00 07 */	li r4, 7
/* 801D0EA0 001CDEA0  38 A0 00 04 */	li r5, 4
/* 801D0EA4 001CDEA4  38 C0 00 01 */	li r6, 1
/* 801D0EA8 001CDEA8  38 E0 00 07 */	li r7, 7
/* 801D0EAC 001CDEAC  48 0E 1C F5 */	bl GXSetTevAlphaIn
/* 801D0EB0 001CDEB0  38 81 00 18 */	addi r4, r1, 0x18
/* 801D0EB4 001CDEB4  38 60 00 57 */	li r3, 0x57
/* 801D0EB8 001CDEB8  48 00 09 8D */	bl effGetTexObjN64
/* 801D0EBC 001CDEBC  38 61 00 18 */	addi r3, r1, 0x18
/* 801D0EC0 001CDEC0  38 80 00 00 */	li r4, 0
/* 801D0EC4 001CDEC4  48 0E 0B B9 */	bl GXLoadTexObj
/* 801D0EC8 001CDEC8  38 60 00 90 */	li r3, 0x90
/* 801D0ECC 001CDECC  38 80 00 00 */	li r4, 0
/* 801D0ED0 001CDED0  38 A0 00 06 */	li r5, 6
/* 801D0ED4 001CDED4  48 0D ED 95 */	bl GXBegin
/* 801D0ED8 001CDED8  38 60 00 00 */	li r3, 0
/* 801D0EDC 001CDEDC  38 80 00 01 */	li r4, 1
/* 801D0EE0 001CDEE0  38 A0 00 02 */	li r5, 2
/* 801D0EE4 001CDEE4  38 C0 00 00 */	li r6, 0
/* 801D0EE8 001CDEE8  38 E0 00 00 */	li r7, 0
/* 801D0EEC 001CDEEC  39 00 00 02 */	li r8, 2
/* 801D0EF0 001CDEF0  39 20 00 03 */	li r9, 3
/* 801D0EF4 001CDEF4  39 40 00 00 */	li r10, 0
/* 801D0EF8 001CDEF8  48 00 07 3D */	bl tri2
/* 801D0EFC 001CDEFC  48 00 02 C0 */	b .L_801D11BC
.L_801D0F00:
/* 801D0F00 001CDF00  41 80 00 A4 */	blt .L_801D0FA4
/* 801D0F04 001CDF04  38 60 00 01 */	li r3, 1
/* 801D0F08 001CDF08  48 0E 22 C1 */	bl GXSetNumTevStages
/* 801D0F0C 001CDF0C  38 60 00 00 */	li r3, 0
/* 801D0F10 001CDF10  38 80 00 00 */	li r4, 0
/* 801D0F14 001CDF14  38 A0 00 00 */	li r5, 0
/* 801D0F18 001CDF18  38 C0 00 FF */	li r6, 0xff
/* 801D0F1C 001CDF1C  48 0E 21 11 */	bl GXSetTevOrder
/* 801D0F20 001CDF20  38 60 00 00 */	li r3, 0
/* 801D0F24 001CDF24  38 80 00 00 */	li r4, 0
/* 801D0F28 001CDF28  38 A0 00 00 */	li r5, 0
/* 801D0F2C 001CDF2C  38 C0 00 00 */	li r6, 0
/* 801D0F30 001CDF30  38 E0 00 01 */	li r7, 1
/* 801D0F34 001CDF34  39 00 00 00 */	li r8, 0
/* 801D0F38 001CDF38  48 0E 1C AD */	bl GXSetTevColorOp
/* 801D0F3C 001CDF3C  38 60 00 00 */	li r3, 0
/* 801D0F40 001CDF40  38 80 00 00 */	li r4, 0
/* 801D0F44 001CDF44  38 A0 00 00 */	li r5, 0
/* 801D0F48 001CDF48  38 C0 00 00 */	li r6, 0
/* 801D0F4C 001CDF4C  38 E0 00 01 */	li r7, 1
/* 801D0F50 001CDF50  39 00 00 00 */	li r8, 0
/* 801D0F54 001CDF54  48 0E 1C F9 */	bl GXSetTevAlphaOp
/* 801D0F58 001CDF58  38 60 00 00 */	li r3, 0
/* 801D0F5C 001CDF5C  38 80 00 0F */	li r4, 0xf
/* 801D0F60 001CDF60  38 A0 00 0F */	li r5, 0xf
/* 801D0F64 001CDF64  38 C0 00 0F */	li r6, 0xf
/* 801D0F68 001CDF68  38 E0 00 08 */	li r7, 8
/* 801D0F6C 001CDF6C  48 0E 1B F1 */	bl GXSetTevColorIn
/* 801D0F70 001CDF70  38 60 00 00 */	li r3, 0
/* 801D0F74 001CDF74  38 80 00 07 */	li r4, 7
/* 801D0F78 001CDF78  38 A0 00 04 */	li r5, 4
/* 801D0F7C 001CDF7C  38 C0 00 01 */	li r6, 1
/* 801D0F80 001CDF80  38 E0 00 07 */	li r7, 7
/* 801D0F84 001CDF84  48 0E 1C 1D */	bl GXSetTevAlphaIn
/* 801D0F88 001CDF88  38 81 00 18 */	addi r4, r1, 0x18
/* 801D0F8C 001CDF8C  38 60 00 57 */	li r3, 0x57
/* 801D0F90 001CDF90  48 00 08 B5 */	bl effGetTexObjN64
/* 801D0F94 001CDF94  38 61 00 18 */	addi r3, r1, 0x18
/* 801D0F98 001CDF98  38 80 00 00 */	li r4, 0
/* 801D0F9C 001CDF9C  48 0E 0A E1 */	bl GXLoadTexObj
/* 801D0FA0 001CDFA0  48 00 00 A0 */	b .L_801D1040
.L_801D0FA4:
/* 801D0FA4 001CDFA4  38 60 00 01 */	li r3, 1
/* 801D0FA8 001CDFA8  48 0E 22 21 */	bl GXSetNumTevStages
/* 801D0FAC 001CDFAC  38 60 00 00 */	li r3, 0
/* 801D0FB0 001CDFB0  38 80 00 00 */	li r4, 0
/* 801D0FB4 001CDFB4  38 A0 00 00 */	li r5, 0
/* 801D0FB8 001CDFB8  38 C0 00 FF */	li r6, 0xff
/* 801D0FBC 001CDFBC  48 0E 20 71 */	bl GXSetTevOrder
/* 801D0FC0 001CDFC0  38 60 00 00 */	li r3, 0
/* 801D0FC4 001CDFC4  38 80 00 00 */	li r4, 0
/* 801D0FC8 001CDFC8  38 A0 00 00 */	li r5, 0
/* 801D0FCC 001CDFCC  38 C0 00 00 */	li r6, 0
/* 801D0FD0 001CDFD0  38 E0 00 01 */	li r7, 1
/* 801D0FD4 001CDFD4  39 00 00 00 */	li r8, 0
/* 801D0FD8 001CDFD8  48 0E 1C 0D */	bl GXSetTevColorOp
/* 801D0FDC 001CDFDC  38 60 00 00 */	li r3, 0
/* 801D0FE0 001CDFE0  38 80 00 00 */	li r4, 0
/* 801D0FE4 001CDFE4  38 A0 00 00 */	li r5, 0
/* 801D0FE8 001CDFE8  38 C0 00 00 */	li r6, 0
/* 801D0FEC 001CDFEC  38 E0 00 01 */	li r7, 1
/* 801D0FF0 001CDFF0  39 00 00 00 */	li r8, 0
/* 801D0FF4 001CDFF4  48 0E 1C 59 */	bl GXSetTevAlphaOp
/* 801D0FF8 001CDFF8  38 60 00 00 */	li r3, 0
/* 801D0FFC 001CDFFC  38 80 00 0F */	li r4, 0xf
/* 801D1000 001CE000  38 A0 00 0F */	li r5, 0xf
/* 801D1004 001CE004  38 C0 00 0F */	li r6, 0xf
/* 801D1008 001CE008  38 E0 00 02 */	li r7, 2
/* 801D100C 001CE00C  48 0E 1B 51 */	bl GXSetTevColorIn
/* 801D1010 001CE010  38 60 00 00 */	li r3, 0
/* 801D1014 001CE014  38 80 00 07 */	li r4, 7
/* 801D1018 001CE018  38 A0 00 04 */	li r5, 4
/* 801D101C 001CE01C  38 C0 00 01 */	li r6, 1
/* 801D1020 001CE020  38 E0 00 07 */	li r7, 7
/* 801D1024 001CE024  48 0E 1B 7D */	bl GXSetTevAlphaIn
/* 801D1028 001CE028  38 81 00 18 */	addi r4, r1, 0x18
/* 801D102C 001CE02C  38 60 00 56 */	li r3, 0x56
/* 801D1030 001CE030  48 00 08 15 */	bl effGetTexObjN64
/* 801D1034 001CE034  38 61 00 18 */	addi r3, r1, 0x18
/* 801D1038 001CE038  38 80 00 00 */	li r4, 0
/* 801D103C 001CE03C  48 0E 0A 41 */	bl GXLoadTexObj
.L_801D1040:
/* 801D1040 001CE040  38 60 01 C0 */	li r3, 0x1c0
/* 801D1044 001CE044  38 80 00 03 */	li r4, 3
/* 801D1048 001CE048  4B E5 DE D5 */	bl smartAlloc
/* 801D104C 001CE04C  1F 9A 00 0A */	mulli r28, r26, 0xa
/* 801D1050 001CE050  3C 80 80 30 */	lis r4, lbl_802FABA0@ha
/* 801D1054 001CE054  83 63 00 00 */	lwz r27, 0(r3)
/* 801D1058 001CE058  3B A0 00 00 */	li r29, 0
/* 801D105C 001CE05C  C3 42 E3 DC */	lfs f26, lbl_8041F75C@sda21(r2)
/* 801D1060 001CE060  3B 40 00 00 */	li r26, 0
/* 801D1064 001CE064  CB 64 AB A0 */	lfd f27, lbl_802FABA0@l(r4)
/* 801D1068 001CE068  7F 7F DB 78 */	mr r31, r27
/* 801D106C 001CE06C  C3 82 E3 E0 */	lfs f28, lbl_8041F760@sda21(r2)
/* 801D1070 001CE070  7F 9E E3 78 */	mr r30, r28
/* 801D1074 001CE074  C3 A2 E3 F4 */	lfs f29, lbl_8041F774@sda21(r2)
/* 801D1078 001CE078  7F B8 EB 78 */	mr r24, r29
/* 801D107C 001CE07C  C3 C2 E3 F8 */	lfs f30, lbl_8041F778@sda21(r2)
/* 801D1080 001CE080  3E E0 43 30 */	lis r23, 0x4330
.L_801D1084:
/* 801D1084 001CE084  7C 19 E2 14 */	add r0, r25, r28
/* 801D1088 001CE088  92 E1 00 A8 */	stw r23, 0xa8(r1)
/* 801D108C 001CE08C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D1090 001CE090  90 01 00 AC */	stw r0, 0xac(r1)
/* 801D1094 001CE094  C8 01 00 A8 */	lfd f0, 0xa8(r1)
/* 801D1098 001CE098  EC 00 D8 28 */	fsubs f0, f0, f27
/* 801D109C 001CE09C  EC 1A 00 32 */	fmuls f0, f26, f0
/* 801D10A0 001CE0A0  EC 20 E0 24 */	fdivs f1, f0, f28
/* 801D10A4 001CE0A4  48 09 B3 55 */	bl sin
/* 801D10A8 001CE0A8  7C 19 F2 14 */	add r0, r25, r30
/* 801D10AC 001CE0AC  FC 00 08 18 */	frsp f0, f1
/* 801D10B0 001CE0B0  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D10B4 001CE0B4  92 E1 00 98 */	stw r23, 0x98(r1)
/* 801D10B8 001CE0B8  90 01 00 9C */	stw r0, 0x9c(r1)
/* 801D10BC 001CE0BC  EC 3D 00 32 */	fmuls f1, f29, f0
/* 801D10C0 001CE0C0  C8 01 00 98 */	lfd f0, 0x98(r1)
/* 801D10C4 001CE0C4  EC 3F 00 72 */	fmuls f1, f31, f1
/* 801D10C8 001CE0C8  EC 00 D8 28 */	fsubs f0, f0, f27
/* 801D10CC 001CE0CC  FC 20 08 1E */	fctiwz f1, f1
/* 801D10D0 001CE0D0  EC 1A 00 32 */	fmuls f0, f26, f0
/* 801D10D4 001CE0D4  D8 21 00 A0 */	stfd f1, 0xa0(r1)
/* 801D10D8 001CE0D8  EC 20 E0 24 */	fdivs f1, f0, f28
/* 801D10DC 001CE0DC  82 C1 00 A4 */	lwz r22, 0xa4(r1)
/* 801D10E0 001CE0E0  48 09 B3 19 */	bl sin
/* 801D10E4 001CE0E4  FC 00 08 18 */	frsp f0, f1
/* 801D10E8 001CE0E8  38 16 F3 80 */	addi r0, r22, -3200
/* 801D10EC 001CE0EC  B0 1F 00 00 */	sth r0, 0(r31)
/* 801D10F0 001CE0F0  3B 5A 00 01 */	addi r26, r26, 1
/* 801D10F4 001CE0F4  38 80 00 00 */	li r4, 0
/* 801D10F8 001CE0F8  38 76 0C 80 */	addi r3, r22, 0xc80
/* 801D10FC 001CE0FC  EC 1E 00 32 */	fmuls f0, f30, f0
/* 801D1100 001CE100  38 00 08 00 */	li r0, 0x800
/* 801D1104 001CE104  2C 1A 00 10 */	cmpwi r26, 0x10
/* 801D1108 001CE108  3B 9C 00 3C */	addi r28, r28, 0x3c
/* 801D110C 001CE10C  3B DE 00 06 */	addi r30, r30, 6
/* 801D1110 001CE110  EC 1F 00 32 */	fmuls f0, f31, f0
/* 801D1114 001CE114  FC 00 00 1E */	fctiwz f0, f0
/* 801D1118 001CE118  D8 01 00 B0 */	stfd f0, 0xb0(r1)
/* 801D111C 001CE11C  80 A1 00 B4 */	lwz r5, 0xb4(r1)
/* 801D1120 001CE120  7C A5 EA 14 */	add r5, r5, r29
/* 801D1124 001CE124  3B BD 01 90 */	addi r29, r29, 0x190
/* 801D1128 001CE128  B0 BF 00 02 */	sth r5, 2(r31)
/* 801D112C 001CE12C  B0 9F 00 04 */	sth r4, 4(r31)
/* 801D1130 001CE130  B0 9F 00 06 */	sth r4, 6(r31)
/* 801D1134 001CE134  B3 1F 00 08 */	sth r24, 8(r31)
/* 801D1138 001CE138  B0 7F 00 0E */	sth r3, 0xe(r31)
/* 801D113C 001CE13C  B0 BF 00 10 */	sth r5, 0x10(r31)
/* 801D1140 001CE140  B0 9F 00 12 */	sth r4, 0x12(r31)
/* 801D1144 001CE144  B0 1F 00 14 */	sth r0, 0x14(r31)
/* 801D1148 001CE148  B3 1F 00 16 */	sth r24, 0x16(r31)
/* 801D114C 001CE14C  3B FF 00 1C */	addi r31, r31, 0x1c
/* 801D1150 001CE150  3B 18 00 80 */	addi r24, r24, 0x80
/* 801D1154 001CE154  41 80 FF 30 */	blt .L_801D1084
/* 801D1158 001CE158  7F 63 DB 78 */	mr r3, r27
/* 801D115C 001CE15C  38 80 01 C0 */	li r4, 0x1c0
/* 801D1160 001CE160  48 0B F8 DD */	bl DCFlushRange
/* 801D1164 001CE164  48 0D DE 8D */	bl GXInvalidateVtxCache
/* 801D1168 001CE168  7F 63 DB 78 */	mr r3, r27
/* 801D116C 001CE16C  48 00 05 45 */	bl effSetVtxDescN64
/* 801D1170 001CE170  3B 00 00 00 */	li r24, 0
/* 801D1174 001CE174  7F 17 C3 78 */	mr r23, r24
.L_801D1178:
/* 801D1178 001CE178  38 60 00 90 */	li r3, 0x90
/* 801D117C 001CE17C  38 80 00 00 */	li r4, 0
/* 801D1180 001CE180  38 A0 00 06 */	li r5, 6
/* 801D1184 001CE184  48 0D EA E5 */	bl GXBegin
/* 801D1188 001CE188  38 97 00 02 */	addi r4, r23, 2
/* 801D118C 001CE18C  38 B7 00 01 */	addi r5, r23, 1
/* 801D1190 001CE190  7E E3 BB 78 */	mr r3, r23
/* 801D1194 001CE194  7E E6 BB 78 */	mr r6, r23
/* 801D1198 001CE198  7C A7 2B 78 */	mr r7, r5
/* 801D119C 001CE19C  7C 88 23 78 */	mr r8, r4
/* 801D11A0 001CE1A0  7E EA BB 78 */	mr r10, r23
/* 801D11A4 001CE1A4  39 37 00 03 */	addi r9, r23, 3
/* 801D11A8 001CE1A8  48 00 04 8D */	bl tri2
/* 801D11AC 001CE1AC  3B 18 00 01 */	addi r24, r24, 1
/* 801D11B0 001CE1B0  3A F7 00 02 */	addi r23, r23, 2
/* 801D11B4 001CE1B4  2C 18 00 0F */	cmpwi r24, 0xf
/* 801D11B8 001CE1B8  41 80 FF C0 */	blt .L_801D1178
.L_801D11BC:
/* 801D11BC 001CE1BC  E3 E1 01 38 */	psq_l f31, 312(r1), 0, qr0
/* 801D11C0 001CE1C0  CB E1 01 30 */	lfd f31, 0x130(r1)
/* 801D11C4 001CE1C4  E3 C1 01 28 */	psq_l f30, 296(r1), 0, qr0
/* 801D11C8 001CE1C8  CB C1 01 20 */	lfd f30, 0x120(r1)
/* 801D11CC 001CE1CC  E3 A1 01 18 */	psq_l f29, 280(r1), 0, qr0
/* 801D11D0 001CE1D0  CB A1 01 10 */	lfd f29, 0x110(r1)
/* 801D11D4 001CE1D4  E3 81 01 08 */	psq_l f28, 264(r1), 0, qr0
/* 801D11D8 001CE1D8  CB 81 01 00 */	lfd f28, 0x100(r1)
/* 801D11DC 001CE1DC  E3 61 00 F8 */	psq_l f27, 248(r1), 0, qr0
/* 801D11E0 001CE1E0  CB 61 00 F0 */	lfd f27, 0xf0(r1)
/* 801D11E4 001CE1E4  E3 41 00 E8 */	psq_l f26, 232(r1), 0, qr0
/* 801D11E8 001CE1E8  CB 41 00 E0 */	lfd f26, 0xe0(r1)
/* 801D11EC 001CE1EC  BA C1 00 B8 */	lmw r22, 0xb8(r1)
/* 801D11F0 001CE1F0  80 01 01 44 */	lwz r0, 0x144(r1)
/* 801D11F4 001CE1F4  7C 08 03 A6 */	mtlr r0
/* 801D11F8 001CE1F8  38 21 01 40 */	addi r1, r1, 0x140
/* 801D11FC 001CE1FC  4E 80 00 20 */	blr 
effMagicHoraoMain:
/* 801D1200 001CE200  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 801D1204 001CE204  7C 08 02 A6 */	mflr r0
/* 801D1208 001CE208  3C 80 80 30 */	lis r4, lbl_802FAB90@ha
/* 801D120C 001CE20C  90 01 00 44 */	stw r0, 0x44(r1)
/* 801D1210 001CE210  38 C4 AB 90 */	addi r6, r4, lbl_802FAB90@l
/* 801D1214 001CE214  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 801D1218 001CE218  93 C1 00 38 */	stw r30, 0x38(r1)
/* 801D121C 001CE21C  7C 7E 1B 78 */	mr r30, r3
/* 801D1220 001CE220  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 801D1224 001CE224  80 A6 00 00 */	lwz r5, 0(r6)
/* 801D1228 001CE228  80 86 00 04 */	lwz r4, 4(r6)
/* 801D122C 001CE22C  80 06 00 08 */	lwz r0, 8(r6)
/* 801D1230 001CE230  90 A1 00 08 */	stw r5, 8(r1)
/* 801D1234 001CE234  C0 1F 00 04 */	lfs f0, 4(r31)
/* 801D1238 001CE238  90 81 00 0C */	stw r4, 0xc(r1)
/* 801D123C 001CE23C  C0 3F 00 08 */	lfs f1, 8(r31)
/* 801D1240 001CE240  D0 01 00 08 */	stfs f0, 8(r1)
/* 801D1244 001CE244  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 801D1248 001CE248  90 01 00 10 */	stw r0, 0x10(r1)
/* 801D124C 001CE24C  80 A1 00 08 */	lwz r5, 8(r1)
/* 801D1250 001CE250  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801D1254 001CE254  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801D1258 001CE258  80 81 00 0C */	lwz r4, 0xc(r1)
/* 801D125C 001CE25C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801D1260 001CE260  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801D1264 001CE264  90 81 00 18 */	stw r4, 0x18(r1)
/* 801D1268 001CE268  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801D126C 001CE26C  80 9F 00 40 */	lwz r4, 0x40(r31)
/* 801D1270 001CE270  38 04 FF FF */	addi r0, r4, -1
/* 801D1274 001CE274  90 1F 00 40 */	stw r0, 0x40(r31)
/* 801D1278 001CE278  80 9F 00 44 */	lwz r4, 0x44(r31)
/* 801D127C 001CE27C  38 04 00 01 */	addi r0, r4, 1
/* 801D1280 001CE280  90 1F 00 44 */	stw r0, 0x44(r31)
/* 801D1284 001CE284  80 9F 00 40 */	lwz r4, 0x40(r31)
/* 801D1288 001CE288  2C 04 00 00 */	cmpwi r4, 0
/* 801D128C 001CE28C  40 80 00 0C */	bge .L_801D1298
/* 801D1290 001CE290  4B E8 C8 F5 */	bl effDelete
/* 801D1294 001CE294  48 00 02 24 */	b .L_801D14B8
.L_801D1298:
/* 801D1298 001CE298  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 801D129C 001CE29C  2C 00 00 03 */	cmpwi r0, 3
/* 801D12A0 001CE2A0  41 82 01 2C */	beq .L_801D13CC
/* 801D12A4 001CE2A4  40 80 00 1C */	bge .L_801D12C0
/* 801D12A8 001CE2A8  2C 00 00 01 */	cmpwi r0, 1
/* 801D12AC 001CE2AC  41 82 00 D0 */	beq .L_801D137C
/* 801D12B0 001CE2B0  40 80 00 F8 */	bge .L_801D13A8
/* 801D12B4 001CE2B4  2C 00 00 00 */	cmpwi r0, 0
/* 801D12B8 001CE2B8  40 80 00 18 */	bge .L_801D12D0
/* 801D12BC 001CE2BC  48 00 01 DC */	b .L_801D1498
.L_801D12C0:
/* 801D12C0 001CE2C0  2C 00 00 05 */	cmpwi r0, 5
/* 801D12C4 001CE2C4  41 82 01 B4 */	beq .L_801D1478
/* 801D12C8 001CE2C8  40 80 01 D0 */	bge .L_801D1498
/* 801D12CC 001CE2CC  48 00 01 88 */	b .L_801D1454
.L_801D12D0:
/* 801D12D0 001CE2D0  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 801D12D4 001CE2D4  3C 00 43 30 */	lis r0, 0x4330
/* 801D12D8 001CE2D8  C0 3F 00 24 */	lfs f1, 0x24(r31)
/* 801D12DC 001CE2DC  3C 60 80 30 */	lis r3, lbl_802FABA0@ha
/* 801D12E0 001CE2E0  C0 5F 00 28 */	lfs f2, 0x28(r31)
/* 801D12E4 001CE2E4  EC 00 08 28 */	fsubs f0, f0, f1
/* 801D12E8 001CE2E8  C8 83 AB A0 */	lfd f4, lbl_802FABA0@l(r3)
/* 801D12EC 001CE2EC  90 01 00 20 */	stw r0, 0x20(r1)
/* 801D12F0 001CE2F0  EC 42 08 3A */	fmadds f2, f2, f0, f1
/* 801D12F4 001CE2F4  90 01 00 28 */	stw r0, 0x28(r1)
/* 801D12F8 001CE2F8  C0 22 E3 FC */	lfs f1, lbl_8041F77C@sda21(r2)
/* 801D12FC 001CE2FC  C0 02 E3 F0 */	lfs f0, lbl_8041F770@sda21(r2)
/* 801D1300 001CE300  D0 5F 00 24 */	stfs f2, 0x24(r31)
/* 801D1304 001CE304  80 9F 00 3C */	lwz r4, 0x3c(r31)
/* 801D1308 001CE308  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 801D130C 001CE30C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 801D1310 001CE310  C0 BF 00 28 */	lfs f5, 0x28(r31)
/* 801D1314 001CE314  90 01 00 2C */	stw r0, 0x2c(r1)
/* 801D1318 001CE318  7C 64 18 50 */	subf r3, r4, r3
/* 801D131C 001CE31C  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 801D1320 001CE320  90 01 00 24 */	stw r0, 0x24(r1)
/* 801D1324 001CE324  C8 41 00 28 */	lfd f2, 0x28(r1)
/* 801D1328 001CE328  C8 61 00 20 */	lfd f3, 0x20(r1)
/* 801D132C 001CE32C  EC 42 20 28 */	fsubs f2, f2, f4
/* 801D1330 001CE330  EC 63 20 28 */	fsubs f3, f3, f4
/* 801D1334 001CE334  EC 45 10 FA */	fmadds f2, f5, f3, f2
/* 801D1338 001CE338  FC 40 10 1E */	fctiwz f2, f2
/* 801D133C 001CE33C  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 801D1340 001CE340  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801D1344 001CE344  90 1F 00 3C */	stw r0, 0x3c(r31)
/* 801D1348 001CE348  C0 5F 00 34 */	lfs f2, 0x34(r31)
/* 801D134C 001CE34C  EC 22 08 28 */	fsubs f1, f2, f1
/* 801D1350 001CE350  D0 3F 00 34 */	stfs f1, 0x34(r31)
/* 801D1354 001CE354  C0 3F 00 34 */	lfs f1, 0x34(r31)
/* 801D1358 001CE358  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 801D135C 001CE35C  40 80 01 3C */	bge .L_801D1498
/* 801D1360 001CE360  D0 1F 00 34 */	stfs f0, 0x34(r31)
/* 801D1364 001CE364  38 60 00 0A */	li r3, 0xa
/* 801D1368 001CE368  38 00 00 01 */	li r0, 1
/* 801D136C 001CE36C  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 801D1370 001CE370  90 7F 00 30 */	stw r3, 0x30(r31)
/* 801D1374 001CE374  90 1F 00 2C */	stw r0, 0x2c(r31)
/* 801D1378 001CE378  48 00 01 20 */	b .L_801D1498
.L_801D137C:
/* 801D137C 001CE37C  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 801D1380 001CE380  38 03 FF FF */	addi r0, r3, -1
/* 801D1384 001CE384  90 1F 00 30 */	stw r0, 0x30(r31)
/* 801D1388 001CE388  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 801D138C 001CE38C  2C 00 00 00 */	cmpwi r0, 0
/* 801D1390 001CE390  41 81 01 08 */	bgt .L_801D1498
/* 801D1394 001CE394  38 60 00 02 */	li r3, 2
/* 801D1398 001CE398  38 00 00 0A */	li r0, 0xa
/* 801D139C 001CE39C  90 7F 00 2C */	stw r3, 0x2c(r31)
/* 801D13A0 001CE3A0  90 1F 00 30 */	stw r0, 0x30(r31)
/* 801D13A4 001CE3A4  48 00 00 F4 */	b .L_801D1498
.L_801D13A8:
/* 801D13A8 001CE3A8  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 801D13AC 001CE3AC  38 03 FF FF */	addi r0, r3, -1
/* 801D13B0 001CE3B0  90 1F 00 30 */	stw r0, 0x30(r31)
/* 801D13B4 001CE3B4  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 801D13B8 001CE3B8  2C 00 00 00 */	cmpwi r0, 0
/* 801D13BC 001CE3BC  41 81 00 DC */	bgt .L_801D1498
/* 801D13C0 001CE3C0  38 00 00 03 */	li r0, 3
/* 801D13C4 001CE3C4  90 1F 00 2C */	stw r0, 0x2c(r31)
/* 801D13C8 001CE3C8  48 00 00 D0 */	b .L_801D1498
.L_801D13CC:
/* 801D13CC 001CE3CC  C0 5F 00 10 */	lfs f2, 0x10(r31)
/* 801D13D0 001CE3D0  C0 22 E4 00 */	lfs f1, lbl_8041F780@sda21(r2)
/* 801D13D4 001CE3D4  C0 02 E3 F0 */	lfs f0, lbl_8041F770@sda21(r2)
/* 801D13D8 001CE3D8  EC 22 08 28 */	fsubs f1, f2, f1
/* 801D13DC 001CE3DC  D0 3F 00 10 */	stfs f1, 0x10(r31)
/* 801D13E0 001CE3E0  C0 5F 00 08 */	lfs f2, 8(r31)
/* 801D13E4 001CE3E4  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 801D13E8 001CE3E8  EC 22 08 2A */	fadds f1, f2, f1
/* 801D13EC 001CE3EC  D0 3F 00 08 */	stfs f1, 8(r31)
/* 801D13F0 001CE3F0  C0 3F 00 08 */	lfs f1, 8(r31)
/* 801D13F4 001CE3F4  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 801D13F8 001CE3F8  40 80 00 A0 */	bge .L_801D1498
/* 801D13FC 001CE3FC  D0 1F 00 08 */	stfs f0, 8(r31)
/* 801D1400 001CE400  38 60 00 02 */	li r3, 2
/* 801D1404 001CE404  C0 22 E4 04 */	lfs f1, lbl_8041F784@sda21(r2)
/* 801D1408 001CE408  38 80 00 1E */	li r4, 0x1e
/* 801D140C 001CE40C  C0 1F 00 04 */	lfs f0, 4(r31)
/* 801D1410 001CE410  C0 5F 00 08 */	lfs f2, 8(r31)
/* 801D1414 001CE414  EC 21 00 2A */	fadds f1, f1, f0
/* 801D1418 001CE418  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 801D141C 001CE41C  4B FE F6 89 */	bl effHokoriN64Entry
/* 801D1420 001CE420  C0 3F 00 04 */	lfs f1, 4(r31)
/* 801D1424 001CE424  38 60 00 02 */	li r3, 2
/* 801D1428 001CE428  C0 02 E4 04 */	lfs f0, lbl_8041F784@sda21(r2)
/* 801D142C 001CE42C  38 80 00 1E */	li r4, 0x1e
/* 801D1430 001CE430  C0 5F 00 08 */	lfs f2, 8(r31)
/* 801D1434 001CE434  EC 21 00 28 */	fsubs f1, f1, f0
/* 801D1438 001CE438  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 801D143C 001CE43C  4B FE F6 69 */	bl effHokoriN64Entry
/* 801D1440 001CE440  38 60 00 04 */	li r3, 4
/* 801D1444 001CE444  38 00 00 14 */	li r0, 0x14
/* 801D1448 001CE448  90 7F 00 2C */	stw r3, 0x2c(r31)
/* 801D144C 001CE44C  90 1F 00 30 */	stw r0, 0x30(r31)
/* 801D1450 001CE450  48 00 00 48 */	b .L_801D1498
.L_801D1454:
/* 801D1454 001CE454  80 7F 00 30 */	lwz r3, 0x30(r31)
/* 801D1458 001CE458  38 03 FF FF */	addi r0, r3, -1
/* 801D145C 001CE45C  90 1F 00 30 */	stw r0, 0x30(r31)
/* 801D1460 001CE460  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 801D1464 001CE464  2C 00 00 00 */	cmpwi r0, 0
/* 801D1468 001CE468  41 81 00 30 */	bgt .L_801D1498
/* 801D146C 001CE46C  38 00 00 05 */	li r0, 5
/* 801D1470 001CE470  90 1F 00 2C */	stw r0, 0x2c(r31)
/* 801D1474 001CE474  48 00 00 24 */	b .L_801D1498
.L_801D1478:
/* 801D1478 001CE478  2C 04 00 0A */	cmpwi r4, 0xa
/* 801D147C 001CE47C  40 80 00 0C */	bge .L_801D1488
/* 801D1480 001CE480  1C 04 00 19 */	mulli r0, r4, 0x19
/* 801D1484 001CE484  90 1F 00 3C */	stw r0, 0x3c(r31)
.L_801D1488:
/* 801D1488 001CE488  C0 3F 00 34 */	lfs f1, 0x34(r31)
/* 801D148C 001CE48C  C0 02 E4 08 */	lfs f0, lbl_8041F788@sda21(r2)
/* 801D1490 001CE490  EC 01 00 28 */	fsubs f0, f1, f0
/* 801D1494 001CE494  D0 1F 00 34 */	stfs f0, 0x34(r31)
.L_801D1498:
/* 801D1498 001CE498  38 61 00 14 */	addi r3, r1, 0x14
/* 801D149C 001CE49C  4B E3 F2 25 */	bl dispCalcZ
/* 801D14A0 001CE4A0  3C 60 80 1D */	lis r3, effMagicHoraoDisp@ha
/* 801D14A4 001CE4A4  7F C6 F3 78 */	mr r6, r30
/* 801D14A8 001CE4A8  38 A3 0B 18 */	addi r5, r3, effMagicHoraoDisp@l
/* 801D14AC 001CE4AC  38 80 00 02 */	li r4, 2
/* 801D14B0 001CE4B0  38 60 00 04 */	li r3, 4
/* 801D14B4 001CE4B4  4B E3 F5 65 */	bl dispEntry
.L_801D14B8:
/* 801D14B8 001CE4B8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 801D14BC 001CE4BC  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 801D14C0 001CE4C0  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 801D14C4 001CE4C4  7C 08 03 A6 */	mtlr r0
/* 801D14C8 001CE4C8  38 21 00 40 */	addi r1, r1, 0x40
/* 801D14CC 001CE4CC  4E 80 00 20 */	blr 

.global effMagicHoraoN64Entry
effMagicHoraoN64Entry:
/* 801D14D0 001CE4D0  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 801D14D4 001CE4D4  7C 08 02 A6 */	mflr r0
/* 801D14D8 001CE4D8  90 01 00 84 */	stw r0, 0x84(r1)
/* 801D14DC 001CE4DC  DB E1 00 70 */	stfd f31, 0x70(r1)
/* 801D14E0 001CE4E0  F3 E1 00 78 */	psq_st f31, 120(r1), 0, qr0
/* 801D14E4 001CE4E4  DB C1 00 60 */	stfd f30, 0x60(r1)
/* 801D14E8 001CE4E8  F3 C1 00 68 */	psq_st f30, 104(r1), 0, qr0
/* 801D14EC 001CE4EC  DB A1 00 50 */	stfd f29, 0x50(r1)
/* 801D14F0 001CE4F0  F3 A1 00 58 */	psq_st f29, 88(r1), 0, qr0
/* 801D14F4 001CE4F4  DB 81 00 40 */	stfd f28, 0x40(r1)
/* 801D14F8 001CE4F8  F3 81 00 48 */	psq_st f28, 72(r1), 0, qr0
/* 801D14FC 001CE4FC  DB 61 00 30 */	stfd f27, 0x30(r1)
/* 801D1500 001CE500  F3 61 00 38 */	psq_st f27, 56(r1), 0, qr0
/* 801D1504 001CE504  DB 41 00 20 */	stfd f26, 0x20(r1)
/* 801D1508 001CE508  F3 41 00 28 */	psq_st f26, 40(r1), 0, qr0
/* 801D150C 001CE50C  BF 41 00 08 */	stmw r26, 8(r1)
/* 801D1510 001CE510  FF 40 08 90 */	fmr f26, f1
/* 801D1514 001CE514  7C 7A 1B 78 */	mr r26, r3
/* 801D1518 001CE518  FF 60 10 90 */	fmr f27, f2
/* 801D151C 001CE51C  7C 9D 23 78 */	mr r29, r4
/* 801D1520 001CE520  FF 80 18 90 */	fmr f28, f3
/* 801D1524 001CE524  7C BB 2B 78 */	mr r27, r5
/* 801D1528 001CE528  FF A0 20 90 */	fmr f29, f4
/* 801D152C 001CE52C  7C DE 33 78 */	mr r30, r6
/* 801D1530 001CE530  FF C0 28 90 */	fmr f30, f5
/* 801D1534 001CE534  FF E0 30 90 */	fmr f31, f6
/* 801D1538 001CE538  4B E8 C8 85 */	bl effEntry
/* 801D153C 001CE53C  3C 80 80 30 */	lis r4, lbl_802FABA8@ha
/* 801D1540 001CE540  7C 7F 1B 78 */	mr r31, r3
/* 801D1544 001CE544  38 84 AB A8 */	addi r4, r4, lbl_802FABA8@l
/* 801D1548 001CE548  38 00 00 01 */	li r0, 1
/* 801D154C 001CE54C  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801D1550 001CE550  38 60 00 03 */	li r3, 3
/* 801D1554 001CE554  38 80 00 48 */	li r4, 0x48
/* 801D1558 001CE558  90 1F 00 08 */	stw r0, 8(r31)
/* 801D155C 001CE55C  4B E5 E5 31 */	bl __memAlloc
/* 801D1560 001CE560  7C 7C 1B 78 */	mr r28, r3
/* 801D1564 001CE564  3C 60 80 1D */	lis r3, effMagicHoraoMain@ha
/* 801D1568 001CE568  93 9F 00 0C */	stw r28, 0xc(r31)
/* 801D156C 001CE56C  38 03 12 00 */	addi r0, r3, effMagicHoraoMain@l
/* 801D1570 001CE570  C0 02 E4 00 */	lfs f0, lbl_8041F780@sda21(r2)
/* 801D1574 001CE574  90 1F 00 10 */	stw r0, 0x10(r31)
/* 801D1578 001CE578  93 5C 00 00 */	stw r26, 0(r28)
/* 801D157C 001CE57C  D3 5C 00 04 */	stfs f26, 4(r28)
/* 801D1580 001CE580  D3 7C 00 08 */	stfs f27, 8(r28)
/* 801D1584 001CE584  D3 9C 00 0C */	stfs f28, 0xc(r28)
/* 801D1588 001CE588  D3 FC 00 28 */	stfs f31, 0x28(r28)
/* 801D158C 001CE58C  D3 BC 00 14 */	stfs f29, 0x14(r28)
/* 801D1590 001CE590  93 BC 00 1C */	stw r29, 0x1c(r28)
/* 801D1594 001CE594  D3 DC 00 18 */	stfs f30, 0x18(r28)
/* 801D1598 001CE598  93 7C 00 20 */	stw r27, 0x20(r28)
/* 801D159C 001CE59C  D0 1C 00 34 */	stfs f0, 0x34(r28)
/* 801D15A0 001CE5A0  48 09 4D D5 */	bl rand
/* 801D15A4 001CE5A4  3C 80 B6 0B */	lis r4, 0xB60B60B7@ha
/* 801D15A8 001CE5A8  38 00 00 00 */	li r0, 0
/* 801D15AC 001CE5AC  38 84 60 B7 */	addi r4, r4, 0xB60B60B7@l
/* 801D15B0 001CE5B0  C0 02 E3 F0 */	lfs f0, lbl_8041F770@sda21(r2)
/* 801D15B4 001CE5B4  7C 84 18 96 */	mulhw r4, r4, r3
/* 801D15B8 001CE5B8  7C 84 1A 14 */	add r4, r4, r3
/* 801D15BC 001CE5BC  7C 84 46 70 */	srawi r4, r4, 8
/* 801D15C0 001CE5C0  54 85 0F FE */	srwi r5, r4, 0x1f
/* 801D15C4 001CE5C4  7C 84 2A 14 */	add r4, r4, r5
/* 801D15C8 001CE5C8  1C 84 01 68 */	mulli r4, r4, 0x168
/* 801D15CC 001CE5CC  7C 84 18 50 */	subf r4, r4, r3
/* 801D15D0 001CE5D0  7F E3 FB 78 */	mr r3, r31
/* 801D15D4 001CE5D4  90 9C 00 38 */	stw r4, 0x38(r28)
/* 801D15D8 001CE5D8  93 DC 00 40 */	stw r30, 0x40(r28)
/* 801D15DC 001CE5DC  90 1C 00 44 */	stw r0, 0x44(r28)
/* 801D15E0 001CE5E0  93 BC 00 3C */	stw r29, 0x3c(r28)
/* 801D15E4 001CE5E4  D3 BC 00 24 */	stfs f29, 0x24(r28)
/* 801D15E8 001CE5E8  D0 1C 00 10 */	stfs f0, 0x10(r28)
/* 801D15EC 001CE5EC  90 1C 00 2C */	stw r0, 0x2c(r28)
/* 801D15F0 001CE5F0  E3 E1 00 78 */	psq_l f31, 120(r1), 0, qr0
/* 801D15F4 001CE5F4  CB E1 00 70 */	lfd f31, 0x70(r1)
/* 801D15F8 001CE5F8  E3 C1 00 68 */	psq_l f30, 104(r1), 0, qr0
/* 801D15FC 001CE5FC  CB C1 00 60 */	lfd f30, 0x60(r1)
/* 801D1600 001CE600  E3 A1 00 58 */	psq_l f29, 88(r1), 0, qr0
/* 801D1604 001CE604  CB A1 00 50 */	lfd f29, 0x50(r1)
/* 801D1608 001CE608  E3 81 00 48 */	psq_l f28, 72(r1), 0, qr0
/* 801D160C 001CE60C  CB 81 00 40 */	lfd f28, 0x40(r1)
/* 801D1610 001CE610  E3 61 00 38 */	psq_l f27, 56(r1), 0, qr0
/* 801D1614 001CE614  CB 61 00 30 */	lfd f27, 0x30(r1)
/* 801D1618 001CE618  E3 41 00 28 */	psq_l f26, 40(r1), 0, qr0
/* 801D161C 001CE61C  CB 41 00 20 */	lfd f26, 0x20(r1)
/* 801D1620 001CE620  BB 41 00 08 */	lmw r26, 8(r1)
/* 801D1624 001CE624  80 01 00 84 */	lwz r0, 0x84(r1)
/* 801D1628 001CE628  7C 08 03 A6 */	mtlr r0
/* 801D162C 001CE62C  38 21 00 80 */	addi r1, r1, 0x80
/* 801D1630 001CE630  4E 80 00 20 */	blr 
