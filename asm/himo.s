.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global vivihimoDisp
vivihimoDisp:
/* 8017DD38 0017AD38  94 21 FE 50 */	stwu r1, -0x1b0(r1)
/* 8017DD3C 0017AD3C  7C 08 02 A6 */	mflr r0
/* 8017DD40 0017AD40  90 01 01 B4 */	stw r0, 0x1b4(r1)
/* 8017DD44 0017AD44  DB E1 01 A0 */	stfd f31, 0x1a0(r1)
/* 8017DD48 0017AD48  F3 E1 01 A8 */	psq_st f31, 424(r1), 0, qr0
/* 8017DD4C 0017AD4C  DB C1 01 90 */	stfd f30, 0x190(r1)
/* 8017DD50 0017AD50  F3 C1 01 98 */	psq_st f30, 408(r1), 0, qr0
/* 8017DD54 0017AD54  DB A1 01 80 */	stfd f29, 0x180(r1)
/* 8017DD58 0017AD58  F3 A1 01 88 */	psq_st f29, 392(r1), 0, qr0
/* 8017DD5C 0017AD5C  DB 81 01 70 */	stfd f28, 0x170(r1)
/* 8017DD60 0017AD60  F3 81 01 78 */	psq_st f28, 376(r1), 0, qr0
/* 8017DD64 0017AD64  DB 61 01 60 */	stfd f27, 0x160(r1)
/* 8017DD68 0017AD68  F3 61 01 68 */	psq_st f27, 360(r1), 0, qr0
/* 8017DD6C 0017AD6C  DB 41 01 50 */	stfd f26, 0x150(r1)
/* 8017DD70 0017AD70  F3 41 01 58 */	psq_st f26, 344(r1), 0, qr0
/* 8017DD74 0017AD74  DB 21 01 40 */	stfd f25, 0x140(r1)
/* 8017DD78 0017AD78  F3 21 01 48 */	psq_st f25, 328(r1), 0, qr0
/* 8017DD7C 0017AD7C  DB 01 01 30 */	stfd f24, 0x130(r1)
/* 8017DD80 0017AD80  F3 01 01 38 */	psq_st f24, 312(r1), 0, qr0
/* 8017DD84 0017AD84  DA E1 01 20 */	stfd f23, 0x120(r1)
/* 8017DD88 0017AD88  F2 E1 01 28 */	psq_st f23, 296(r1), 0, qr0
/* 8017DD8C 0017AD8C  DA C1 01 10 */	stfd f22, 0x110(r1)
/* 8017DD90 0017AD90  F2 C1 01 18 */	psq_st f22, 280(r1), 0, qr0
/* 8017DD94 0017AD94  DA A1 01 00 */	stfd f21, 0x100(r1)
/* 8017DD98 0017AD98  F2 A1 01 08 */	psq_st f21, 264(r1), 0, qr0
/* 8017DD9C 0017AD9C  DA 81 00 F0 */	stfd f20, 0xf0(r1)
/* 8017DDA0 0017ADA0  F2 81 00 F8 */	psq_st f20, 248(r1), 0, qr0
/* 8017DDA4 0017ADA4  BE A1 00 C4 */	stmw r21, 0xc4(r1)
/* 8017DDA8 0017ADA8  7C 96 23 78 */	mr r22, r4
/* 8017DDAC 0017ADAC  3B B6 00 78 */	addi r29, r22, 0x78
/* 8017DDB0 0017ADB0  3B 96 00 A8 */	addi r28, r22, 0xa8
/* 8017DDB4 0017ADB4  3B 76 00 B8 */	addi r27, r22, 0xb8
/* 8017DDB8 0017ADB8  4B E9 13 99 */	bl camGetPtr
/* 8017DDBC 0017ADBC  7C 7E 1B 78 */	mr r30, r3
/* 8017DDC0 0017ADC0  48 13 09 5D */	bl GXClearVtxDesc
/* 8017DDC4 0017ADC4  38 60 00 00 */	li r3, 0
/* 8017DDC8 0017ADC8  38 80 00 01 */	li r4, 1
/* 8017DDCC 0017ADCC  48 13 00 39 */	bl GXSetVtxDesc
/* 8017DDD0 0017ADD0  38 60 00 09 */	li r3, 9
/* 8017DDD4 0017ADD4  38 80 00 02 */	li r4, 2
/* 8017DDD8 0017ADD8  48 13 00 2D */	bl GXSetVtxDesc
/* 8017DDDC 0017ADDC  38 60 00 0A */	li r3, 0xa
/* 8017DDE0 0017ADE0  38 80 00 02 */	li r4, 2
/* 8017DDE4 0017ADE4  48 13 00 21 */	bl GXSetVtxDesc
/* 8017DDE8 0017ADE8  38 60 00 0B */	li r3, 0xb
/* 8017DDEC 0017ADEC  38 80 00 02 */	li r4, 2
/* 8017DDF0 0017ADF0  48 13 00 15 */	bl GXSetVtxDesc
/* 8017DDF4 0017ADF4  38 60 00 0D */	li r3, 0xd
/* 8017DDF8 0017ADF8  38 80 00 01 */	li r4, 1
/* 8017DDFC 0017ADFC  48 13 00 09 */	bl GXSetVtxDesc
/* 8017DE00 0017AE00  38 60 00 00 */	li r3, 0
/* 8017DE04 0017AE04  38 80 00 09 */	li r4, 9
/* 8017DE08 0017AE08  38 A0 00 01 */	li r5, 1
/* 8017DE0C 0017AE0C  38 C0 00 01 */	li r6, 1
/* 8017DE10 0017AE10  38 E0 00 00 */	li r7, 0
/* 8017DE14 0017AE14  48 13 09 41 */	bl GXSetVtxAttrFmt
/* 8017DE18 0017AE18  38 60 00 00 */	li r3, 0
/* 8017DE1C 0017AE1C  38 80 00 0A */	li r4, 0xa
/* 8017DE20 0017AE20  38 A0 00 00 */	li r5, 0
/* 8017DE24 0017AE24  38 C0 00 01 */	li r6, 1
/* 8017DE28 0017AE28  38 E0 00 07 */	li r7, 7
/* 8017DE2C 0017AE2C  48 13 09 29 */	bl GXSetVtxAttrFmt
/* 8017DE30 0017AE30  38 60 00 00 */	li r3, 0
/* 8017DE34 0017AE34  38 80 00 0B */	li r4, 0xb
/* 8017DE38 0017AE38  38 A0 00 01 */	li r5, 1
/* 8017DE3C 0017AE3C  38 C0 00 05 */	li r6, 5
/* 8017DE40 0017AE40  38 E0 00 00 */	li r7, 0
/* 8017DE44 0017AE44  48 13 09 11 */	bl GXSetVtxAttrFmt
/* 8017DE48 0017AE48  38 60 00 00 */	li r3, 0
/* 8017DE4C 0017AE4C  38 80 00 0D */	li r4, 0xd
/* 8017DE50 0017AE50  38 A0 00 01 */	li r5, 1
/* 8017DE54 0017AE54  38 C0 00 04 */	li r6, 4
/* 8017DE58 0017AE58  38 E0 00 00 */	li r7, 0
/* 8017DE5C 0017AE5C  48 13 08 F9 */	bl GXSetVtxAttrFmt
/* 8017DE60 0017AE60  38 60 00 09 */	li r3, 9
/* 8017DE64 0017AE64  38 8D B2 40 */	addi r4, r13, lbl_804124A0-_SDA_BASE_
/* 8017DE68 0017AE68  38 A0 00 03 */	li r5, 3
/* 8017DE6C 0017AE6C  48 13 11 41 */	bl GXSetArray
/* 8017DE70 0017AE70  38 60 00 0A */	li r3, 0xa
/* 8017DE74 0017AE74  38 8D B2 60 */	addi r4, r13, lbl_804124C0-_SDA_BASE_
/* 8017DE78 0017AE78  38 A0 00 03 */	li r5, 3
/* 8017DE7C 0017AE7C  48 13 11 31 */	bl GXSetArray
/* 8017DE80 0017AE80  38 60 00 0B */	li r3, 0xb
/* 8017DE84 0017AE84  38 8D B2 80 */	addi r4, r13, lbl_804124E0-_SDA_BASE_
/* 8017DE88 0017AE88  38 A0 00 04 */	li r5, 4
/* 8017DE8C 0017AE8C  48 13 11 21 */	bl GXSetArray
/* 8017DE90 0017AE90  3C 60 80 30 */	lis r3, lbl_802F8078@ha
/* 8017DE94 0017AE94  C8 23 80 78 */	lfd f1, lbl_802F8078@l(r3)
/* 8017DE98 0017AE98  48 0E E6 39 */	bl tan
/* 8017DE9C 0017AE9C  FF 40 08 18 */	frsp f26, f1
/* 8017DEA0 0017AEA0  C0 02 CB 40 */	lfs f0, lbl_8041DEC0-_SDA2_BASE_(r2)
/* 8017DEA4 0017AEA4  C3 02 CB 44 */	lfs f24, lbl_8041DEC4-_SDA2_BASE_(r2)
/* 8017DEA8 0017AEA8  C0 22 CB 48 */	lfs f1, lbl_8041DEC8-_SDA2_BASE_(r2)
/* 8017DEAC 0017AEAC  EF 20 D0 24 */	fdivs f25, f0, f26
/* 8017DEB0 0017AEB0  48 0E E6 21 */	bl tan
/* 8017DEB4 0017AEB4  FC 00 08 18 */	frsp f0, f1
/* 8017DEB8 0017AEB8  C0 22 CB 4C */	lfs f1, lbl_8041DECC-_SDA2_BASE_(r2)
/* 8017DEBC 0017AEBC  7F A5 EB 78 */	mr r5, r29
/* 8017DEC0 0017AEC0  7F 86 E3 78 */	mr r6, r28
/* 8017DEC4 0017AEC4  7F 67 DB 78 */	mr r7, r27
/* 8017DEC8 0017AEC8  3B 21 00 80 */	addi r25, r1, 0x80
/* 8017DECC 0017AECC  EC 1A 00 2A */	fadds f0, f26, f0
/* 8017DED0 0017AED0  3B 01 00 50 */	addi r24, r1, 0x50
/* 8017DED4 0017AED4  38 61 00 14 */	addi r3, r1, 0x14
/* 8017DED8 0017AED8  38 80 00 04 */	li r4, 4
/* 8017DEDC 0017AEDC  EE F9 00 32 */	fmuls f23, f25, f0
/* 8017DEE0 0017AEE0  4B E9 E6 4D */	bl spline_getvalue
/* 8017DEE4 0017AEE4  C0 02 CB 4C */	lfs f0, lbl_8041DECC-_SDA2_BASE_(r2)
/* 8017DEE8 0017AEE8  38 7E 01 1C */	addi r3, r30, 0x11c
/* 8017DEEC 0017AEEC  C0 56 00 48 */	lfs f2, 0x48(r22)
/* 8017DEF0 0017AEF0  38 81 00 20 */	addi r4, r1, 0x20
/* 8017DEF4 0017AEF4  C0 22 CB 54 */	lfs f1, lbl_8041DED4-_SDA2_BASE_(r2)
/* 8017DEF8 0017AEF8  7F 25 CB 78 */	mr r5, r25
/* 8017DEFC 0017AEFC  EC 60 00 B2 */	fmuls f3, f0, f2
/* 8017DF00 0017AF00  C0 96 00 18 */	lfs f4, 0x18(r22)
/* 8017DF04 0017AF04  C0 42 CB 50 */	lfs f2, lbl_8041DED0-_SDA2_BASE_(r2)
/* 8017DF08 0017AF08  C0 A1 00 14 */	lfs f5, 0x14(r1)
/* 8017DF0C 0017AF0C  EC C1 19 3A */	fmadds f6, f1, f4, f3
/* 8017DF10 0017AF10  C0 81 00 18 */	lfs f4, 0x18(r1)
/* 8017DF14 0017AF14  C0 61 00 1C */	lfs f3, 0x1c(r1)
/* 8017DF18 0017AF18  EC C2 01 B2 */	fmuls f6, f2, f6
/* 8017DF1C 0017AF1C  D0 C1 00 20 */	stfs f6, 0x20(r1)
/* 8017DF20 0017AF20  C0 D6 00 4C */	lfs f6, 0x4c(r22)
/* 8017DF24 0017AF24  C0 F6 00 1C */	lfs f7, 0x1c(r22)
/* 8017DF28 0017AF28  EC C0 01 B2 */	fmuls f6, f0, f6
/* 8017DF2C 0017AF2C  EC C1 31 FA */	fmadds f6, f1, f7, f6
/* 8017DF30 0017AF30  D0 C1 00 24 */	stfs f6, 0x24(r1)
/* 8017DF34 0017AF34  C0 D6 00 50 */	lfs f6, 0x50(r22)
/* 8017DF38 0017AF38  C0 F6 00 20 */	lfs f7, 0x20(r22)
/* 8017DF3C 0017AF3C  EC C0 01 B2 */	fmuls f6, f0, f6
/* 8017DF40 0017AF40  D0 A1 00 2C */	stfs f5, 0x2c(r1)
/* 8017DF44 0017AF44  EC A1 31 FA */	fmadds f5, f1, f7, f6
/* 8017DF48 0017AF48  D0 A1 00 28 */	stfs f5, 0x28(r1)
/* 8017DF4C 0017AF4C  C0 B6 00 58 */	lfs f5, 0x58(r22)
/* 8017DF50 0017AF50  C0 D6 00 28 */	lfs f6, 0x28(r22)
/* 8017DF54 0017AF54  EC A0 01 72 */	fmuls f5, f0, f5
/* 8017DF58 0017AF58  EC A1 29 BA */	fmadds f5, f1, f6, f5
/* 8017DF5C 0017AF5C  EC A2 01 72 */	fmuls f5, f2, f5
/* 8017DF60 0017AF60  D0 A1 00 30 */	stfs f5, 0x30(r1)
/* 8017DF64 0017AF64  C0 B6 00 5C */	lfs f5, 0x5c(r22)
/* 8017DF68 0017AF68  C0 D6 00 2C */	lfs f6, 0x2c(r22)
/* 8017DF6C 0017AF6C  EC A0 01 72 */	fmuls f5, f0, f5
/* 8017DF70 0017AF70  EC A1 29 BA */	fmadds f5, f1, f6, f5
/* 8017DF74 0017AF74  D0 A1 00 34 */	stfs f5, 0x34(r1)
/* 8017DF78 0017AF78  C0 B6 00 60 */	lfs f5, 0x60(r22)
/* 8017DF7C 0017AF7C  C0 D6 00 30 */	lfs f6, 0x30(r22)
/* 8017DF80 0017AF80  EC A0 01 72 */	fmuls f5, f0, f5
/* 8017DF84 0017AF84  D0 81 00 3C */	stfs f4, 0x3c(r1)
/* 8017DF88 0017AF88  EC 81 29 BA */	fmadds f4, f1, f6, f5
/* 8017DF8C 0017AF8C  D0 81 00 38 */	stfs f4, 0x38(r1)
/* 8017DF90 0017AF90  C0 96 00 68 */	lfs f4, 0x68(r22)
/* 8017DF94 0017AF94  C0 B6 00 38 */	lfs f5, 0x38(r22)
/* 8017DF98 0017AF98  EC 80 01 32 */	fmuls f4, f0, f4
/* 8017DF9C 0017AF9C  EC 81 21 7A */	fmadds f4, f1, f5, f4
/* 8017DFA0 0017AFA0  EC 42 01 32 */	fmuls f2, f2, f4
/* 8017DFA4 0017AFA4  D0 41 00 40 */	stfs f2, 0x40(r1)
/* 8017DFA8 0017AFA8  C0 56 00 6C */	lfs f2, 0x6c(r22)
/* 8017DFAC 0017AFAC  C0 96 00 3C */	lfs f4, 0x3c(r22)
/* 8017DFB0 0017AFB0  EC 40 00 B2 */	fmuls f2, f0, f2
/* 8017DFB4 0017AFB4  EC 41 11 3A */	fmadds f2, f1, f4, f2
/* 8017DFB8 0017AFB8  D0 41 00 44 */	stfs f2, 0x44(r1)
/* 8017DFBC 0017AFBC  C0 56 00 70 */	lfs f2, 0x70(r22)
/* 8017DFC0 0017AFC0  C0 96 00 40 */	lfs f4, 0x40(r22)
/* 8017DFC4 0017AFC4  EC 00 00 B2 */	fmuls f0, f0, f2
/* 8017DFC8 0017AFC8  D0 61 00 4C */	stfs f3, 0x4c(r1)
/* 8017DFCC 0017AFCC  EC 01 01 3A */	fmadds f0, f1, f4, f0
/* 8017DFD0 0017AFD0  D0 01 00 48 */	stfs f0, 0x48(r1)
/* 8017DFD4 0017AFD4  48 11 9F 8D */	bl PSMTXConcat
/* 8017DFD8 0017AFD8  3C 60 80 30 */	lis r3, lbl_802F8080@ha
/* 8017DFDC 0017AFDC  C3 62 CB 54 */	lfs f27, lbl_8041DED4-_SDA2_BASE_(r2)
/* 8017DFE0 0017AFE0  C3 82 CB 50 */	lfs f28, lbl_8041DED0-_SDA2_BASE_(r2)
/* 8017DFE4 0017AFE4  3A E1 00 20 */	addi r23, r1, 0x20
/* 8017DFE8 0017AFE8  C3 A2 CB 58 */	lfs f29, lbl_8041DED8-_SDA2_BASE_(r2)
/* 8017DFEC 0017AFEC  3B 40 00 00 */	li r26, 0
/* 8017DFF0 0017AFF0  C3 C2 CB 5C */	lfs f30, lbl_8041DEDC-_SDA2_BASE_(r2)
/* 8017DFF4 0017AFF4  3F E0 CC 01 */	lis r31, 0xcc01
/* 8017DFF8 0017AFF8  C3 E2 CB 60 */	lfs f31, lbl_8041DEE0-_SDA2_BASE_(r2)
/* 8017DFFC 0017AFFC  3E A0 43 30 */	lis r21, 0x4330
/* 8017E000 0017B000  CA A3 80 80 */	lfd f21, lbl_802F8080@l(r3)
/* 8017E004 0017B004  C2 C2 CB 64 */	lfs f22, lbl_8041DEE4-_SDA2_BASE_(r2)
lbl_8017E008:
/* 8017E008 0017B008  FC 20 C0 90 */	fmr f1, f24
/* 8017E00C 0017B00C  7F A5 EB 78 */	mr r5, r29
/* 8017E010 0017B010  7F 86 E3 78 */	mr r6, r28
/* 8017E014 0017B014  7F 67 DB 78 */	mr r7, r27
/* 8017E018 0017B018  38 61 00 08 */	addi r3, r1, 8
/* 8017E01C 0017B01C  38 80 00 04 */	li r4, 4
/* 8017E020 0017B020  4B E9 E5 0D */	bl spline_getvalue
/* 8017E024 0017B024  7F 23 CB 78 */	mr r3, r25
/* 8017E028 0017B028  38 80 00 00 */	li r4, 0
/* 8017E02C 0017B02C  48 13 64 CD */	bl GXLoadPosMtxImm
/* 8017E030 0017B030  C0 36 00 48 */	lfs f1, 0x48(r22)
/* 8017E034 0017B034  EC 1B C0 28 */	fsubs f0, f27, f24
/* 8017E038 0017B038  C0 B6 00 18 */	lfs f5, 0x18(r22)
/* 8017E03C 0017B03C  7E E4 BB 78 */	mr r4, r23
/* 8017E040 0017B040  EC 98 00 72 */	fmuls f4, f24, f1
/* 8017E044 0017B044  C0 61 00 08 */	lfs f3, 8(r1)
/* 8017E048 0017B048  C0 41 00 0C */	lfs f2, 0xc(r1)
/* 8017E04C 0017B04C  C0 21 00 10 */	lfs f1, 0x10(r1)
/* 8017E050 0017B050  7F 05 C3 78 */	mr r5, r24
/* 8017E054 0017B054  EC 80 21 7A */	fmadds f4, f0, f5, f4
/* 8017E058 0017B058  38 7E 01 1C */	addi r3, r30, 0x11c
/* 8017E05C 0017B05C  EC 9C 01 32 */	fmuls f4, f28, f4
/* 8017E060 0017B060  D0 81 00 20 */	stfs f4, 0x20(r1)
/* 8017E064 0017B064  C0 96 00 4C */	lfs f4, 0x4c(r22)
/* 8017E068 0017B068  C0 B6 00 1C */	lfs f5, 0x1c(r22)
/* 8017E06C 0017B06C  EC 98 01 32 */	fmuls f4, f24, f4
/* 8017E070 0017B070  EC 80 21 7A */	fmadds f4, f0, f5, f4
/* 8017E074 0017B074  D0 81 00 24 */	stfs f4, 0x24(r1)
/* 8017E078 0017B078  C0 96 00 50 */	lfs f4, 0x50(r22)
/* 8017E07C 0017B07C  C0 B6 00 20 */	lfs f5, 0x20(r22)
/* 8017E080 0017B080  EC 98 01 32 */	fmuls f4, f24, f4
/* 8017E084 0017B084  D0 61 00 2C */	stfs f3, 0x2c(r1)
/* 8017E088 0017B088  EC 60 21 7A */	fmadds f3, f0, f5, f4
/* 8017E08C 0017B08C  D0 61 00 28 */	stfs f3, 0x28(r1)
/* 8017E090 0017B090  C0 76 00 58 */	lfs f3, 0x58(r22)
/* 8017E094 0017B094  C0 96 00 28 */	lfs f4, 0x28(r22)
/* 8017E098 0017B098  EC 78 00 F2 */	fmuls f3, f24, f3
/* 8017E09C 0017B09C  EC 60 19 3A */	fmadds f3, f0, f4, f3
/* 8017E0A0 0017B0A0  EC 7C 00 F2 */	fmuls f3, f28, f3
/* 8017E0A4 0017B0A4  D0 61 00 30 */	stfs f3, 0x30(r1)
/* 8017E0A8 0017B0A8  C0 76 00 5C */	lfs f3, 0x5c(r22)
/* 8017E0AC 0017B0AC  C0 96 00 2C */	lfs f4, 0x2c(r22)
/* 8017E0B0 0017B0B0  EC 78 00 F2 */	fmuls f3, f24, f3
/* 8017E0B4 0017B0B4  EC 60 19 3A */	fmadds f3, f0, f4, f3
/* 8017E0B8 0017B0B8  D0 61 00 34 */	stfs f3, 0x34(r1)
/* 8017E0BC 0017B0BC  C0 76 00 60 */	lfs f3, 0x60(r22)
/* 8017E0C0 0017B0C0  C0 96 00 30 */	lfs f4, 0x30(r22)
/* 8017E0C4 0017B0C4  EC 78 00 F2 */	fmuls f3, f24, f3
/* 8017E0C8 0017B0C8  D0 41 00 3C */	stfs f2, 0x3c(r1)
/* 8017E0CC 0017B0CC  EC 40 19 3A */	fmadds f2, f0, f4, f3
/* 8017E0D0 0017B0D0  D0 41 00 38 */	stfs f2, 0x38(r1)
/* 8017E0D4 0017B0D4  C0 56 00 68 */	lfs f2, 0x68(r22)
/* 8017E0D8 0017B0D8  C0 76 00 38 */	lfs f3, 0x38(r22)
/* 8017E0DC 0017B0DC  EC 58 00 B2 */	fmuls f2, f24, f2
/* 8017E0E0 0017B0E0  EC 40 10 FA */	fmadds f2, f0, f3, f2
/* 8017E0E4 0017B0E4  EC 5C 00 B2 */	fmuls f2, f28, f2
/* 8017E0E8 0017B0E8  D0 41 00 40 */	stfs f2, 0x40(r1)
/* 8017E0EC 0017B0EC  C0 56 00 6C */	lfs f2, 0x6c(r22)
/* 8017E0F0 0017B0F0  C0 76 00 3C */	lfs f3, 0x3c(r22)
/* 8017E0F4 0017B0F4  EC 58 00 B2 */	fmuls f2, f24, f2
/* 8017E0F8 0017B0F8  EC 40 10 FA */	fmadds f2, f0, f3, f2
/* 8017E0FC 0017B0FC  D0 41 00 44 */	stfs f2, 0x44(r1)
/* 8017E100 0017B100  C0 56 00 70 */	lfs f2, 0x70(r22)
/* 8017E104 0017B104  C0 76 00 40 */	lfs f3, 0x40(r22)
/* 8017E108 0017B108  EC 58 00 B2 */	fmuls f2, f24, f2
/* 8017E10C 0017B10C  D0 21 00 4C */	stfs f1, 0x4c(r1)
/* 8017E110 0017B110  EC 00 10 FA */	fmadds f0, f0, f3, f2
/* 8017E114 0017B114  D0 01 00 48 */	stfs f0, 0x48(r1)
/* 8017E118 0017B118  48 11 9E 49 */	bl PSMTXConcat
/* 8017E11C 0017B11C  7F 03 C3 78 */	mr r3, r24
/* 8017E120 0017B120  38 80 00 03 */	li r4, 3
/* 8017E124 0017B124  48 13 63 D5 */	bl GXLoadPosMtxImm
/* 8017E128 0017B128  EC 1E 06 32 */	fmuls f0, f30, f24
/* 8017E12C 0017B12C  EC 3D F8 38 */	fmsubs f1, f29, f0, f31
/* 8017E130 0017B130  48 0E E3 A1 */	bl tan
/* 8017E134 0017B134  FC 00 08 18 */	frsp f0, f1
/* 8017E138 0017B138  38 60 00 80 */	li r3, 0x80
/* 8017E13C 0017B13C  38 80 00 00 */	li r4, 0
/* 8017E140 0017B140  38 A0 00 04 */	li r5, 4
/* 8017E144 0017B144  EC 1A 00 2A */	fadds f0, f26, f0
/* 8017E148 0017B148  EE 99 00 32 */	fmuls f20, f25, f0
/* 8017E14C 0017B14C  48 13 1B 1D */	bl GXBegin
/* 8017E150 0017B150  38 A0 00 00 */	li r5, 0
/* 8017E154 0017B154  38 1A 00 02 */	addi r0, r26, 2
/* 8017E158 0017B158  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E15C 0017B15C  38 80 00 01 */	li r4, 1
/* 8017E160 0017B160  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8017E164 0017B164  3B 5A 00 01 */	addi r26, r26, 1
/* 8017E168 0017B168  98 9F 80 00 */	stb r4, -0x8000(r31)
/* 8017E16C 0017B16C  7F 26 CB 78 */	mr r6, r25
/* 8017E170 0017B170  7F 19 C3 78 */	mr r25, r24
/* 8017E174 0017B174  38 60 00 03 */	li r3, 3
/* 8017E178 0017B178  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E17C 0017B17C  2C 1A 00 0F */	cmpwi r26, 0xf
/* 8017E180 0017B180  7C D8 33 78 */	mr r24, r6
/* 8017E184 0017B184  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E188 0017B188  C0 02 CB 4C */	lfs f0, lbl_8041DECC-_SDA2_BASE_(r2)
/* 8017E18C 0017B18C  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 8017E190 0017B190  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8017E194 0017B194  D2 FF 80 00 */	stfs f23, -0x8000(r31)
/* 8017E198 0017B198  98 7F 80 00 */	stb r3, -0x8000(r31)
/* 8017E19C 0017B19C  98 9F 80 00 */	stb r4, -0x8000(r31)
/* 8017E1A0 0017B1A0  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1A4 0017B1A4  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1A8 0017B1A8  C0 02 CB 4C */	lfs f0, lbl_8041DECC-_SDA2_BASE_(r2)
/* 8017E1AC 0017B1AC  92 A1 00 B0 */	stw r21, 0xb0(r1)
/* 8017E1B0 0017B1B0  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8017E1B4 0017B1B4  C8 01 00 B0 */	lfd f0, 0xb0(r1)
/* 8017E1B8 0017B1B8  D2 9F 80 00 */	stfs f20, -0x8000(r31)
/* 8017E1BC 0017B1BC  EC 00 A8 28 */	fsubs f0, f0, f21
/* 8017E1C0 0017B1C0  98 7F 80 00 */	stb r3, -0x8000(r31)
/* 8017E1C4 0017B1C4  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1C8 0017B1C8  EF 00 B0 24 */	fdivs f24, f0, f22
/* 8017E1CC 0017B1CC  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1D0 0017B1D0  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1D4 0017B1D4  C0 02 CB 54 */	lfs f0, lbl_8041DED4-_SDA2_BASE_(r2)
/* 8017E1D8 0017B1D8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8017E1DC 0017B1DC  D2 9F 80 00 */	stfs f20, -0x8000(r31)
/* 8017E1E0 0017B1E0  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1E4 0017B1E4  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1E8 0017B1E8  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1EC 0017B1EC  98 BF 80 00 */	stb r5, -0x8000(r31)
/* 8017E1F0 0017B1F0  C0 02 CB 54 */	lfs f0, lbl_8041DED4-_SDA2_BASE_(r2)
/* 8017E1F4 0017B1F4  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8017E1F8 0017B1F8  D2 FF 80 00 */	stfs f23, -0x8000(r31)
/* 8017E1FC 0017B1FC  FE E0 A0 90 */	fmr f23, f20
/* 8017E200 0017B200  80 81 00 08 */	lwz r4, 8(r1)
/* 8017E204 0017B204  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8017E208 0017B208  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8017E20C 0017B20C  90 81 00 14 */	stw r4, 0x14(r1)
/* 8017E210 0017B210  90 61 00 18 */	stw r3, 0x18(r1)
/* 8017E214 0017B214  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8017E218 0017B218  41 80 FD F0 */	blt lbl_8017E008
/* 8017E21C 0017B21C  E3 E1 01 A8 */	psq_l f31, 424(r1), 0, qr0
/* 8017E220 0017B220  CB E1 01 A0 */	lfd f31, 0x1a0(r1)
/* 8017E224 0017B224  E3 C1 01 98 */	psq_l f30, 408(r1), 0, qr0
/* 8017E228 0017B228  CB C1 01 90 */	lfd f30, 0x190(r1)
/* 8017E22C 0017B22C  E3 A1 01 88 */	psq_l f29, 392(r1), 0, qr0
/* 8017E230 0017B230  CB A1 01 80 */	lfd f29, 0x180(r1)
/* 8017E234 0017B234  E3 81 01 78 */	psq_l f28, 376(r1), 0, qr0
/* 8017E238 0017B238  CB 81 01 70 */	lfd f28, 0x170(r1)
/* 8017E23C 0017B23C  E3 61 01 68 */	psq_l f27, 360(r1), 0, qr0
/* 8017E240 0017B240  CB 61 01 60 */	lfd f27, 0x160(r1)
/* 8017E244 0017B244  E3 41 01 58 */	psq_l f26, 344(r1), 0, qr0
/* 8017E248 0017B248  CB 41 01 50 */	lfd f26, 0x150(r1)
/* 8017E24C 0017B24C  E3 21 01 48 */	psq_l f25, 328(r1), 0, qr0
/* 8017E250 0017B250  CB 21 01 40 */	lfd f25, 0x140(r1)
/* 8017E254 0017B254  E3 01 01 38 */	psq_l f24, 312(r1), 0, qr0
/* 8017E258 0017B258  CB 01 01 30 */	lfd f24, 0x130(r1)
/* 8017E25C 0017B25C  E2 E1 01 28 */	psq_l f23, 296(r1), 0, qr0
/* 8017E260 0017B260  CA E1 01 20 */	lfd f23, 0x120(r1)
/* 8017E264 0017B264  E2 C1 01 18 */	psq_l f22, 280(r1), 0, qr0
/* 8017E268 0017B268  CA C1 01 10 */	lfd f22, 0x110(r1)
/* 8017E26C 0017B26C  E2 A1 01 08 */	psq_l f21, 264(r1), 0, qr0
/* 8017E270 0017B270  CA A1 01 00 */	lfd f21, 0x100(r1)
/* 8017E274 0017B274  E2 81 00 F8 */	psq_l f20, 248(r1), 0, qr0
/* 8017E278 0017B278  CA 81 00 F0 */	lfd f20, 0xf0(r1)
/* 8017E27C 0017B27C  BA A1 00 C4 */	lmw r21, 0xc4(r1)
/* 8017E280 0017B280  80 01 01 B4 */	lwz r0, 0x1b4(r1)
/* 8017E284 0017B284  7C 08 03 A6 */	mtlr r0
/* 8017E288 0017B288  38 21 01 B0 */	addi r1, r1, 0x1b0
/* 8017E28C 0017B28C  4E 80 00 20 */	blr 

.global vivihimo
vivihimo:
/* 8017E290 0017B290  94 21 FE 00 */	stwu r1, -0x200(r1)
/* 8017E294 0017B294  7C 08 02 A6 */	mflr r0
/* 8017E298 0017B298  90 01 02 04 */	stw r0, 0x204(r1)
/* 8017E29C 0017B29C  DB E1 01 F0 */	stfd f31, 0x1f0(r1)
/* 8017E2A0 0017B2A0  F3 E1 01 F8 */	psq_st f31, 504(r1), 0, qr0
/* 8017E2A4 0017B2A4  DB C1 01 E0 */	stfd f30, 0x1e0(r1)
/* 8017E2A8 0017B2A8  F3 C1 01 E8 */	psq_st f30, 488(r1), 0, qr0
/* 8017E2AC 0017B2AC  DB A1 01 D0 */	stfd f29, 0x1d0(r1)
/* 8017E2B0 0017B2B0  F3 A1 01 D8 */	psq_st f29, 472(r1), 0, qr0
/* 8017E2B4 0017B2B4  DB 81 01 C0 */	stfd f28, 0x1c0(r1)
/* 8017E2B8 0017B2B8  F3 81 01 C8 */	psq_st f28, 456(r1), 0, qr0
/* 8017E2BC 0017B2BC  DB 61 01 B0 */	stfd f27, 0x1b0(r1)
/* 8017E2C0 0017B2C0  F3 61 01 B8 */	psq_st f27, 440(r1), 0, qr0
/* 8017E2C4 0017B2C4  DB 41 01 A0 */	stfd f26, 0x1a0(r1)
/* 8017E2C8 0017B2C8  F3 41 01 A8 */	psq_st f26, 424(r1), 0, qr0
/* 8017E2CC 0017B2CC  DB 21 01 90 */	stfd f25, 0x190(r1)
/* 8017E2D0 0017B2D0  F3 21 01 98 */	psq_st f25, 408(r1), 0, qr0
/* 8017E2D4 0017B2D4  DB 01 01 80 */	stfd f24, 0x180(r1)
/* 8017E2D8 0017B2D8  F3 01 01 88 */	psq_st f24, 392(r1), 0, qr0
/* 8017E2DC 0017B2DC  DA E1 01 70 */	stfd f23, 0x170(r1)
/* 8017E2E0 0017B2E0  F2 E1 01 78 */	psq_st f23, 376(r1), 0, qr0
/* 8017E2E4 0017B2E4  DA C1 01 60 */	stfd f22, 0x160(r1)
/* 8017E2E8 0017B2E8  F2 C1 01 68 */	psq_st f22, 360(r1), 0, qr0
/* 8017E2EC 0017B2EC  BF 41 01 48 */	stmw r26, 0x148(r1)
/* 8017E2F0 0017B2F0  7C 7B 1B 78 */	mr r27, r3
/* 8017E2F4 0017B2F4  3C A0 80 30 */	lis r5, lbl_802F8068@ha
/* 8017E2F8 0017B2F8  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 8017E2FC 0017B2FC  7C 9A 23 78 */	mr r26, r4
/* 8017E300 0017B300  FE E0 08 90 */	fmr f23, f1
/* 8017E304 0017B304  3B E5 80 68 */	addi r31, r5, lbl_802F8068@l
/* 8017E308 0017B308  D0 01 00 3C */	stfs f0, 0x3c(r1)
/* 8017E30C 0017B30C  FE C0 10 90 */	fmr f22, f2
/* 8017E310 0017B310  3B C1 00 3C */	addi r30, r1, 0x3c
/* 8017E314 0017B314  C0 03 00 1C */	lfs f0, 0x1c(r3)
/* 8017E318 0017B318  EC 00 18 2A */	fadds f0, f0, f3
/* 8017E31C 0017B31C  D0 01 00 40 */	stfs f0, 0x40(r1)
/* 8017E320 0017B320  C0 03 00 2C */	lfs f0, 0x2c(r3)
/* 8017E324 0017B324  D0 01 00 44 */	stfs f0, 0x44(r1)
/* 8017E328 0017B328  C0 04 00 0C */	lfs f0, 0xc(r4)
/* 8017E32C 0017B32C  D0 01 00 48 */	stfs f0, 0x48(r1)
/* 8017E330 0017B330  C0 04 00 1C */	lfs f0, 0x1c(r4)
/* 8017E334 0017B334  EC 00 20 2A */	fadds f0, f0, f4
/* 8017E338 0017B338  D0 01 00 4C */	stfs f0, 0x4c(r1)
/* 8017E33C 0017B33C  C0 04 00 2C */	lfs f0, 0x2c(r4)
/* 8017E340 0017B340  D0 01 00 50 */	stfs f0, 0x50(r1)
/* 8017E344 0017B344  48 11 AA F9 */	bl PSVECMag
/* 8017E348 0017B348  C0 02 CB 40 */	lfs f0, lbl_8041DEC0-_SDA2_BASE_(r2)
/* 8017E34C 0017B34C  38 7B 00 20 */	addi r3, r27, 0x20
/* 8017E350 0017B350  EF 00 00 72 */	fmuls f24, f0, f1
/* 8017E354 0017B354  48 11 AA E9 */	bl PSVECMag
/* 8017E358 0017B358  C0 42 CB 40 */	lfs f2, lbl_8041DEC0-_SDA2_BASE_(r2)
/* 8017E35C 0017B35C  C0 02 CB 4C */	lfs f0, lbl_8041DECC-_SDA2_BASE_(r2)
/* 8017E360 0017B360  EC 22 00 72 */	fmuls f1, f2, f1
/* 8017E364 0017B364  EC 21 00 72 */	fmuls f1, f1, f1
/* 8017E368 0017B368  EC 98 0E 3A */	fmadds f4, f24, f24, f1
/* 8017E36C 0017B36C  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 8017E370 0017B370  40 81 00 4C */	ble lbl_8017E3BC
/* 8017E374 0017B374  FC 20 20 34 */	frsqrte f1, f4
/* 8017E378 0017B378  C8 7F 00 20 */	lfd f3, 0x20(r31)
/* 8017E37C 0017B37C  C8 5F 00 28 */	lfd f2, 0x28(r31)
/* 8017E380 0017B380  FC 01 00 72 */	fmul f0, f1, f1
/* 8017E384 0017B384  FC 23 00 72 */	fmul f1, f3, f1
/* 8017E388 0017B388  FC 04 10 3C */	fnmsub f0, f4, f0, f2
/* 8017E38C 0017B38C  FC 21 00 32 */	fmul f1, f1, f0
/* 8017E390 0017B390  FC 01 00 72 */	fmul f0, f1, f1
/* 8017E394 0017B394  FC 23 00 72 */	fmul f1, f3, f1
/* 8017E398 0017B398  FC 04 10 3C */	fnmsub f0, f4, f0, f2
/* 8017E39C 0017B39C  FC 21 00 32 */	fmul f1, f1, f0
/* 8017E3A0 0017B3A0  FC 01 00 72 */	fmul f0, f1, f1
/* 8017E3A4 0017B3A4  FC 23 00 72 */	fmul f1, f3, f1
/* 8017E3A8 0017B3A8  FC 04 10 3C */	fnmsub f0, f4, f0, f2
/* 8017E3AC 0017B3AC  FC 01 00 32 */	fmul f0, f1, f0
/* 8017E3B0 0017B3B0  FC 84 00 32 */	fmul f4, f4, f0
/* 8017E3B4 0017B3B4  FC 80 20 18 */	frsp f4, f4
/* 8017E3B8 0017B3B8  48 00 00 88 */	b lbl_8017E440
lbl_8017E3BC:
/* 8017E3BC 0017B3BC  C8 1F 00 30 */	lfd f0, 0x30(r31)
/* 8017E3C0 0017B3C0  FC 04 00 40 */	fcmpo cr0, f4, f0
/* 8017E3C4 0017B3C4  40 80 00 10 */	bge lbl_8017E3D4
/* 8017E3C8 0017B3C8  3C 60 80 42 */	lis r3, lbl_804181A8@ha
/* 8017E3CC 0017B3CC  C0 83 81 A8 */	lfs f4, lbl_804181A8@l(r3)
/* 8017E3D0 0017B3D0  48 00 00 70 */	b lbl_8017E440
lbl_8017E3D4:
/* 8017E3D4 0017B3D4  D0 81 00 08 */	stfs f4, 8(r1)
/* 8017E3D8 0017B3D8  3C 00 7F 80 */	lis r0, 0x7f80
/* 8017E3DC 0017B3DC  80 81 00 08 */	lwz r4, 8(r1)
/* 8017E3E0 0017B3E0  54 83 00 50 */	rlwinm r3, r4, 0, 1, 8
/* 8017E3E4 0017B3E4  7C 03 00 00 */	cmpw r3, r0
/* 8017E3E8 0017B3E8  41 82 00 14 */	beq lbl_8017E3FC
/* 8017E3EC 0017B3EC  40 80 00 40 */	bge lbl_8017E42C
/* 8017E3F0 0017B3F0  2C 03 00 00 */	cmpwi r3, 0
/* 8017E3F4 0017B3F4  41 82 00 20 */	beq lbl_8017E414
/* 8017E3F8 0017B3F8  48 00 00 34 */	b lbl_8017E42C
lbl_8017E3FC:
/* 8017E3FC 0017B3FC  54 80 02 7F */	clrlwi. r0, r4, 9
/* 8017E400 0017B400  41 82 00 0C */	beq lbl_8017E40C
/* 8017E404 0017B404  38 00 00 01 */	li r0, 1
/* 8017E408 0017B408  48 00 00 28 */	b lbl_8017E430
lbl_8017E40C:
/* 8017E40C 0017B40C  38 00 00 02 */	li r0, 2
/* 8017E410 0017B410  48 00 00 20 */	b lbl_8017E430
lbl_8017E414:
/* 8017E414 0017B414  54 80 02 7F */	clrlwi. r0, r4, 9
/* 8017E418 0017B418  41 82 00 0C */	beq lbl_8017E424
/* 8017E41C 0017B41C  38 00 00 05 */	li r0, 5
/* 8017E420 0017B420  48 00 00 10 */	b lbl_8017E430
lbl_8017E424:
/* 8017E424 0017B424  38 00 00 03 */	li r0, 3
/* 8017E428 0017B428  48 00 00 08 */	b lbl_8017E430
lbl_8017E42C:
/* 8017E42C 0017B42C  38 00 00 04 */	li r0, 4
lbl_8017E430:
/* 8017E430 0017B430  2C 00 00 01 */	cmpwi r0, 1
/* 8017E434 0017B434  40 82 00 0C */	bne lbl_8017E440
/* 8017E438 0017B438  3C 60 80 42 */	lis r3, lbl_804181A8@ha
/* 8017E43C 0017B43C  C0 83 81 A8 */	lfs f4, lbl_804181A8@l(r3)
lbl_8017E440:
/* 8017E440 0017B440  C0 02 CB 40 */	lfs f0, lbl_8041DEC0-_SDA2_BASE_(r2)
/* 8017E444 0017B444  7F 63 DB 78 */	mr r3, r27
/* 8017E448 0017B448  38 9E 00 18 */	addi r4, r30, 0x18
/* 8017E44C 0017B44C  EC 00 01 32 */	fmuls f0, f0, f4
/* 8017E450 0017B450  EE D6 00 32 */	fmuls f22, f22, f0
/* 8017E454 0017B454  48 11 9A D9 */	bl PSMTXCopy
/* 8017E458 0017B458  7F 43 D3 78 */	mr r3, r26
/* 8017E45C 0017B45C  38 9E 00 48 */	addi r4, r30, 0x48
/* 8017E460 0017B460  48 11 9A CD */	bl PSMTXCopy
/* 8017E464 0017B464  80 7B 00 00 */	lwz r3, 0(r27)
/* 8017E468 0017B468  80 1B 00 04 */	lwz r0, 4(r27)
/* 8017E46C 0017B46C  C0 22 CB 4C */	lfs f1, lbl_8041DECC-_SDA2_BASE_(r2)
/* 8017E470 0017B470  90 61 00 30 */	stw r3, 0x30(r1)
/* 8017E474 0017B474  90 01 00 34 */	stw r0, 0x34(r1)
/* 8017E478 0017B478  C0 01 00 30 */	lfs f0, 0x30(r1)
/* 8017E47C 0017B47C  80 1B 00 08 */	lwz r0, 8(r27)
/* 8017E480 0017B480  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8017E484 0017B484  90 01 00 38 */	stw r0, 0x38(r1)
/* 8017E488 0017B488  40 82 00 1C */	bne lbl_8017E4A4
/* 8017E48C 0017B48C  C0 01 00 34 */	lfs f0, 0x34(r1)
/* 8017E490 0017B490  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8017E494 0017B494  40 82 00 10 */	bne lbl_8017E4A4
/* 8017E498 0017B498  C0 01 00 38 */	lfs f0, 0x38(r1)
/* 8017E49C 0017B49C  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 8017E4A0 0017B4A0  41 82 02 3C */	beq lbl_8017E6DC
lbl_8017E4A4:
/* 8017E4A4 0017B4A4  38 61 00 30 */	addi r3, r1, 0x30
/* 8017E4A8 0017B4A8  7C 64 1B 78 */	mr r4, r3
/* 8017E4AC 0017B4AC  48 11 A9 35 */	bl PSVECNormalize
/* 8017E4B0 0017B4B0  80 6D 90 B0 */	lwz r3, lbl_80410310-_SDA_BASE_(r13)
/* 8017E4B4 0017B4B4  3C 00 43 30 */	lis r0, 0x4330
/* 8017E4B8 0017B4B8  C0 01 00 30 */	lfs f0, 0x30(r1)
/* 8017E4BC 0017B4BC  3B BE 00 78 */	addi r29, r30, 0x78
/* 8017E4C0 0017B4C0  80 63 00 1C */	lwz r3, 0x1c(r3)
/* 8017E4C4 0017B4C4  C0 21 00 34 */	lfs f1, 0x34(r1)
/* 8017E4C8 0017B4C8  FC 80 00 50 */	fneg f4, f0
/* 8017E4CC 0017B4CC  90 61 01 2C */	stw r3, 0x12c(r1)
/* 8017E4D0 0017B4D0  C0 01 00 38 */	lfs f0, 0x38(r1)
/* 8017E4D4 0017B4D4  FC 60 08 50 */	fneg f3, f1
/* 8017E4D8 0017B4D8  90 01 01 28 */	stw r0, 0x128(r1)
/* 8017E4DC 0017B4DC  80 9F 00 00 */	lwz r4, 0(r31)
/* 8017E4E0 0017B4E0  FC 40 00 50 */	fneg f2, f0
/* 8017E4E4 0017B4E4  80 7F 00 04 */	lwz r3, 4(r31)
/* 8017E4E8 0017B4E8  80 1F 00 08 */	lwz r0, 8(r31)
/* 8017E4EC 0017B4EC  90 81 00 0C */	stw r4, 0xc(r1)
/* 8017E4F0 0017B4F0  C8 3F 00 38 */	lfd f1, 0x38(r31)
/* 8017E4F4 0017B4F4  C8 01 01 28 */	lfd f0, 0x128(r1)
/* 8017E4F8 0017B4F8  90 61 00 10 */	stw r3, 0x10(r1)
/* 8017E4FC 0017B4FC  EC 00 08 28 */	fsubs f0, f0, f1
/* 8017E500 0017B500  C0 22 CB 68 */	lfs f1, lbl_8041DEE8-_SDA2_BASE_(r2)
/* 8017E504 0017B504  90 01 00 14 */	stw r0, 0x14(r1)
/* 8017E508 0017B508  D0 81 00 0C */	stfs f4, 0xc(r1)
/* 8017E50C 0017B50C  EC 00 05 F2 */	fmuls f0, f0, f23
/* 8017E510 0017B510  D0 61 00 10 */	stfs f3, 0x10(r1)
/* 8017E514 0017B514  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8017E518 0017B518  EC 21 00 32 */	fmuls f1, f1, f0
/* 8017E51C 0017B51C  D0 41 00 14 */	stfs f2, 0x14(r1)
/* 8017E520 0017B520  80 61 00 10 */	lwz r3, 0x10(r1)
/* 8017E524 0017B524  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8017E528 0017B528  90 81 00 24 */	stw r4, 0x24(r1)
/* 8017E52C 0017B52C  90 61 00 28 */	stw r3, 0x28(r1)
/* 8017E530 0017B530  90 01 00 2C */	stw r0, 0x2c(r1)
/* 8017E534 0017B534  48 0E DE C5 */	bl sin
/* 8017E538 0017B538  FC 20 08 18 */	frsp f1, f1
/* 8017E53C 0017B53C  C0 02 CB 6C */	lfs f0, lbl_8041DEEC-_SDA2_BASE_(r2)
/* 8017E540 0017B540  7F C4 F3 78 */	mr r4, r30
/* 8017E544 0017B544  38 7E 00 0C */	addi r3, r30, 0xc
/* 8017E548 0017B548  38 A1 00 18 */	addi r5, r1, 0x18
/* 8017E54C 0017B54C  EE E0 00 72 */	fmuls f23, f0, f1
/* 8017E550 0017B550  48 11 A8 51 */	bl PSVECSubtract
/* 8017E554 0017B554  C3 21 00 28 */	lfs f25, 0x28(r1)
/* 8017E558 0017B558  7F BB EB 78 */	mr r27, r29
/* 8017E55C 0017B55C  C3 01 00 2C */	lfs f24, 0x2c(r1)
/* 8017E560 0017B560  3B 40 00 00 */	li r26, 0
/* 8017E564 0017B564  C3 42 CB 58 */	lfs f26, lbl_8041DED8-_SDA2_BASE_(r2)
/* 8017E568 0017B568  3F 80 43 30 */	lis r28, 0x4330
/* 8017E56C 0017B56C  CB 7F 00 18 */	lfd f27, 0x18(r31)
/* 8017E570 0017B570  C3 82 CB 70 */	lfs f28, lbl_8041DEF0-_SDA2_BASE_(r2)
/* 8017E574 0017B574  C3 A2 CB 50 */	lfs f29, lbl_8041DED0-_SDA2_BASE_(r2)
/* 8017E578 0017B578  C3 C1 00 24 */	lfs f30, 0x24(r1)
/* 8017E57C 0017B57C  C3 E2 CB 7C */	lfs f31, lbl_8041DEFC-_SDA2_BASE_(r2)
lbl_8017E580:
/* 8017E580 0017B580  6F 40 80 00 */	xoris r0, r26, 0x8000
/* 8017E584 0017B584  93 81 01 28 */	stw r28, 0x128(r1)
/* 8017E588 0017B588  90 01 01 2C */	stw r0, 0x12c(r1)
/* 8017E58C 0017B58C  C8 01 01 28 */	lfd f0, 0x128(r1)
/* 8017E590 0017B590  EC 00 D8 28 */	fsubs f0, f0, f27
/* 8017E594 0017B594  EC 1A 00 32 */	fmuls f0, f26, f0
/* 8017E598 0017B598  EC 20 07 32 */	fmuls f1, f0, f28
/* 8017E59C 0017B59C  48 0E DE 5D */	bl sin
/* 8017E5A0 0017B5A0  FC 00 08 18 */	frsp f0, f1
/* 8017E5A4 0017B5A4  2C 1A 00 01 */	cmpwi r26, 1
/* 8017E5A8 0017B5A8  EC 7D B8 3A */	fmadds f3, f29, f0, f23
/* 8017E5AC 0017B5AC  40 82 00 14 */	bne lbl_8017E5C0
/* 8017E5B0 0017B5B0  C0 02 CB 74 */	lfs f0, lbl_8041DEF4-_SDA2_BASE_(r2)
/* 8017E5B4 0017B5B4  EC 00 00 F2 */	fmuls f0, f0, f3
/* 8017E5B8 0017B5B8  EC D6 00 32 */	fmuls f6, f22, f0
/* 8017E5BC 0017B5BC  48 00 00 44 */	b lbl_8017E600
lbl_8017E5C0:
/* 8017E5C0 0017B5C0  2C 1A 00 02 */	cmpwi r26, 2
/* 8017E5C4 0017B5C4  40 82 00 0C */	bne lbl_8017E5D0
/* 8017E5C8 0017B5C8  EC D6 00 F2 */	fmuls f6, f22, f3
/* 8017E5CC 0017B5CC  48 00 00 34 */	b lbl_8017E600
lbl_8017E5D0:
/* 8017E5D0 0017B5D0  57 43 07 FE */	clrlwi r3, r26, 0x1f
/* 8017E5D4 0017B5D4  3C 00 43 30 */	lis r0, 0x4330
/* 8017E5D8 0017B5D8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8017E5DC 0017B5DC  90 01 01 28 */	stw r0, 0x128(r1)
/* 8017E5E0 0017B5E0  C8 3F 00 18 */	lfd f1, 0x18(r31)
/* 8017E5E4 0017B5E4  90 61 01 2C */	stw r3, 0x12c(r1)
/* 8017E5E8 0017B5E8  C0 42 CB 78 */	lfs f2, lbl_8041DEF8-_SDA2_BASE_(r2)
/* 8017E5EC 0017B5EC  C8 01 01 28 */	lfd f0, 0x128(r1)
/* 8017E5F0 0017B5F0  EC 00 08 28 */	fsubs f0, f0, f1
/* 8017E5F4 0017B5F4  EC 02 00 32 */	fmuls f0, f2, f0
/* 8017E5F8 0017B5F8  EC 00 00 F2 */	fmuls f0, f0, f3
/* 8017E5FC 0017B5FC  EC D6 00 32 */	fmuls f6, f22, f0
lbl_8017E600:
/* 8017E600 0017B600  6F 40 80 00 */	xoris r0, r26, 0x8000
/* 8017E604 0017B604  3B 5A 00 01 */	addi r26, r26, 1
/* 8017E608 0017B608  90 01 01 2C */	stw r0, 0x12c(r1)
/* 8017E60C 0017B60C  2C 1A 00 04 */	cmpwi r26, 4
/* 8017E610 0017B610  C0 41 00 18 */	lfs f2, 0x18(r1)
/* 8017E614 0017B614  93 81 01 28 */	stw r28, 0x128(r1)
/* 8017E618 0017B618  C0 81 00 3C */	lfs f4, 0x3c(r1)
/* 8017E61C 0017B61C  C8 01 01 28 */	lfd f0, 0x128(r1)
/* 8017E620 0017B620  90 01 01 34 */	stw r0, 0x134(r1)
/* 8017E624 0017B624  EC 00 D8 28 */	fsubs f0, f0, f27
/* 8017E628 0017B628  C0 61 00 1C */	lfs f3, 0x1c(r1)
/* 8017E62C 0017B62C  93 81 01 30 */	stw r28, 0x130(r1)
/* 8017E630 0017B630  C0 21 00 20 */	lfs f1, 0x20(r1)
/* 8017E634 0017B634  EC A2 00 32 */	fmuls f5, f2, f0
/* 8017E638 0017B638  C8 01 01 30 */	lfd f0, 0x130(r1)
/* 8017E63C 0017B63C  90 01 01 3C */	stw r0, 0x13c(r1)
/* 8017E640 0017B640  EC 40 D8 28 */	fsubs f2, f0, f27
/* 8017E644 0017B644  93 81 01 38 */	stw r28, 0x138(r1)
/* 8017E648 0017B648  EC 9F 21 7A */	fmadds f4, f31, f5, f4
/* 8017E64C 0017B64C  C8 01 01 38 */	lfd f0, 0x138(r1)
/* 8017E650 0017B650  EC 43 00 B2 */	fmuls f2, f3, f2
/* 8017E654 0017B654  EC 7E 21 BA */	fmadds f3, f30, f6, f4
/* 8017E658 0017B658  EC 00 D8 28 */	fsubs f0, f0, f27
/* 8017E65C 0017B65C  D0 7B 00 00 */	stfs f3, 0(r27)
/* 8017E660 0017B660  EC 21 00 32 */	fmuls f1, f1, f0
/* 8017E664 0017B664  C0 01 00 40 */	lfs f0, 0x40(r1)
/* 8017E668 0017B668  EC 1F 00 BA */	fmadds f0, f31, f2, f0
/* 8017E66C 0017B66C  EC 19 01 BA */	fmadds f0, f25, f6, f0
/* 8017E670 0017B670  D0 1B 00 04 */	stfs f0, 4(r27)
/* 8017E674 0017B674  C0 01 00 44 */	lfs f0, 0x44(r1)
/* 8017E678 0017B678  EC 1F 00 7A */	fmadds f0, f31, f1, f0
/* 8017E67C 0017B67C  EC 18 01 BA */	fmadds f0, f24, f6, f0
/* 8017E680 0017B680  D0 1B 00 08 */	stfs f0, 8(r27)
/* 8017E684 0017B684  3B 7B 00 0C */	addi r27, r27, 0xc
/* 8017E688 0017B688  41 80 FE F8 */	blt lbl_8017E580
/* 8017E68C 0017B68C  81 61 00 3C */	lwz r11, 0x3c(r1)
/* 8017E690 0017B690  7F A4 EB 78 */	mr r4, r29
/* 8017E694 0017B694  81 41 00 40 */	lwz r10, 0x40(r1)
/* 8017E698 0017B698  38 BE 00 A8 */	addi r5, r30, 0xa8
/* 8017E69C 0017B69C  81 21 00 44 */	lwz r9, 0x44(r1)
/* 8017E6A0 0017B6A0  38 DE 00 B8 */	addi r6, r30, 0xb8
/* 8017E6A4 0017B6A4  81 01 00 48 */	lwz r8, 0x48(r1)
/* 8017E6A8 0017B6A8  38 60 00 04 */	li r3, 4
/* 8017E6AC 0017B6AC  80 E1 00 4C */	lwz r7, 0x4c(r1)
/* 8017E6B0 0017B6B0  80 01 00 50 */	lwz r0, 0x50(r1)
/* 8017E6B4 0017B6B4  91 7D 00 00 */	stw r11, 0(r29)
/* 8017E6B8 0017B6B8  91 5D 00 04 */	stw r10, 4(r29)
/* 8017E6BC 0017B6BC  91 3D 00 08 */	stw r9, 8(r29)
/* 8017E6C0 0017B6C0  91 1D 00 24 */	stw r8, 0x24(r29)
/* 8017E6C4 0017B6C4  90 FD 00 28 */	stw r7, 0x28(r29)
/* 8017E6C8 0017B6C8  90 1D 00 2C */	stw r0, 0x2c(r29)
/* 8017E6CC 0017B6CC  4B E9 DF D9 */	bl spline_maketable
/* 8017E6D0 0017B6D0  4B E9 0A 61 */	bl func_8000F130
/* 8017E6D4 0017B6D4  7F C4 F3 78 */	mr r4, r30
/* 8017E6D8 0017B6D8  4B FF F6 61 */	bl vivihimoDisp
lbl_8017E6DC:
/* 8017E6DC 0017B6DC  E3 E1 01 F8 */	psq_l f31, 504(r1), 0, qr0
/* 8017E6E0 0017B6E0  CB E1 01 F0 */	lfd f31, 0x1f0(r1)
/* 8017E6E4 0017B6E4  E3 C1 01 E8 */	psq_l f30, 488(r1), 0, qr0
/* 8017E6E8 0017B6E8  CB C1 01 E0 */	lfd f30, 0x1e0(r1)
/* 8017E6EC 0017B6EC  E3 A1 01 D8 */	psq_l f29, 472(r1), 0, qr0
/* 8017E6F0 0017B6F0  CB A1 01 D0 */	lfd f29, 0x1d0(r1)
/* 8017E6F4 0017B6F4  E3 81 01 C8 */	psq_l f28, 456(r1), 0, qr0
/* 8017E6F8 0017B6F8  CB 81 01 C0 */	lfd f28, 0x1c0(r1)
/* 8017E6FC 0017B6FC  E3 61 01 B8 */	psq_l f27, 440(r1), 0, qr0
/* 8017E700 0017B700  CB 61 01 B0 */	lfd f27, 0x1b0(r1)
/* 8017E704 0017B704  E3 41 01 A8 */	psq_l f26, 424(r1), 0, qr0
/* 8017E708 0017B708  CB 41 01 A0 */	lfd f26, 0x1a0(r1)
/* 8017E70C 0017B70C  E3 21 01 98 */	psq_l f25, 408(r1), 0, qr0
/* 8017E710 0017B710  CB 21 01 90 */	lfd f25, 0x190(r1)
/* 8017E714 0017B714  E3 01 01 88 */	psq_l f24, 392(r1), 0, qr0
/* 8017E718 0017B718  CB 01 01 80 */	lfd f24, 0x180(r1)
/* 8017E71C 0017B71C  E2 E1 01 78 */	psq_l f23, 376(r1), 0, qr0
/* 8017E720 0017B720  CA E1 01 70 */	lfd f23, 0x170(r1)
/* 8017E724 0017B724  E2 C1 01 68 */	psq_l f22, 360(r1), 0, qr0
/* 8017E728 0017B728  CA C1 01 60 */	lfd f22, 0x160(r1)
/* 8017E72C 0017B72C  BB 41 01 48 */	lmw r26, 0x148(r1)
/* 8017E730 0017B730  80 01 02 04 */	lwz r0, 0x204(r1)
/* 8017E734 0017B734  7C 08 03 A6 */	mtlr r0
/* 8017E738 0017B738  38 21 02 00 */	addi r1, r1, 0x200
/* 8017E73C 0017B73C  4E 80 00 20 */	blr 
