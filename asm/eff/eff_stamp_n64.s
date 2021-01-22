.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effStampDisp
effStampDisp:
/* 801E4930 001E1930  94 21 FE E0 */	stwu r1, -0x120(r1)
/* 801E4934 001E1934  7C 08 02 A6 */	mflr r0
/* 801E4938 001E1938  90 01 01 24 */	stw r0, 0x124(r1)
/* 801E493C 001E193C  DB E1 01 10 */	stfd f31, 0x110(r1)
/* 801E4940 001E1940  F3 E1 01 18 */	psq_st f31, 280(r1), 0, qr0
/* 801E4944 001E1944  93 E1 01 0C */	stw r31, 0x10c(r1)
/* 801E4948 001E1948  93 C1 01 08 */	stw r30, 0x108(r1)
/* 801E494C 001E194C  93 A1 01 04 */	stw r29, 0x104(r1)
/* 801E4950 001E1950  7C 9F 23 78 */	mr r31, r4
/* 801E4954 001E1954  4B E2 A7 FD */	bl camGetPtr
/* 801E4958 001E1958  83 BF 00 0C */	lwz r29, 0xc(r31)
/* 801E495C 001E195C  7C 7E 1B 78 */	mr r30, r3
/* 801E4960 001E1960  38 60 00 01 */	li r3, 1
/* 801E4964 001E1964  48 0C C7 D5 */	bl GXSetNumChans
/* 801E4968 001E1968  38 60 00 04 */	li r3, 4
/* 801E496C 001E196C  38 80 00 00 */	li r4, 0
/* 801E4970 001E1970  38 A0 00 00 */	li r5, 0
/* 801E4974 001E1974  38 C0 00 01 */	li r6, 1
/* 801E4978 001E1978  38 E0 00 00 */	li r7, 0
/* 801E497C 001E197C  39 00 00 00 */	li r8, 0
/* 801E4980 001E1980  39 20 00 02 */	li r9, 2
/* 801E4984 001E1984  48 0C C7 F1 */	bl GXSetChanCtrl
/* 801E4988 001E1988  38 60 00 01 */	li r3, 1
/* 801E498C 001E198C  48 0C E8 3D */	bl GXSetNumTevStages
/* 801E4990 001E1990  38 60 00 00 */	li r3, 0
/* 801E4994 001E1994  38 80 00 00 */	li r4, 0
/* 801E4998 001E1998  38 A0 00 00 */	li r5, 0
/* 801E499C 001E199C  38 C0 00 04 */	li r6, 4
/* 801E49A0 001E19A0  48 0C E6 8D */	bl GXSetTevOrder
/* 801E49A4 001E19A4  38 60 00 00 */	li r3, 0
/* 801E49A8 001E19A8  38 80 00 00 */	li r4, 0
/* 801E49AC 001E19AC  38 A0 00 00 */	li r5, 0
/* 801E49B0 001E19B0  38 C0 00 00 */	li r6, 0
/* 801E49B4 001E19B4  38 E0 00 01 */	li r7, 1
/* 801E49B8 001E19B8  39 00 00 00 */	li r8, 0
/* 801E49BC 001E19BC  48 0C E2 29 */	bl GXSetTevColorOp
/* 801E49C0 001E19C0  38 60 00 00 */	li r3, 0
/* 801E49C4 001E19C4  38 80 00 00 */	li r4, 0
/* 801E49C8 001E19C8  38 A0 00 00 */	li r5, 0
/* 801E49CC 001E19CC  38 C0 00 00 */	li r6, 0
/* 801E49D0 001E19D0  38 E0 00 01 */	li r7, 1
/* 801E49D4 001E19D4  39 00 00 00 */	li r8, 0
/* 801E49D8 001E19D8  48 0C E2 75 */	bl GXSetTevAlphaOp
/* 801E49DC 001E19DC  38 60 00 00 */	li r3, 0
/* 801E49E0 001E19E0  38 80 00 02 */	li r4, 2
/* 801E49E4 001E19E4  38 A0 00 04 */	li r5, 4
/* 801E49E8 001E19E8  38 C0 00 0B */	li r6, 0xb
/* 801E49EC 001E19EC  38 E0 00 0F */	li r7, 0xf
/* 801E49F0 001E19F0  48 0C E1 6D */	bl GXSetTevColorIn
/* 801E49F4 001E19F4  38 60 00 00 */	li r3, 0
/* 801E49F8 001E19F8  38 80 00 07 */	li r4, 7
/* 801E49FC 001E19FC  38 A0 00 01 */	li r5, 1
/* 801E4A00 001E1A00  38 C0 00 04 */	li r6, 4
/* 801E4A04 001E1A04  38 E0 00 07 */	li r7, 7
/* 801E4A08 001E1A08  48 0C E1 99 */	bl GXSetTevAlphaIn
/* 801E4A0C 001E1A0C  C0 3D 00 04 */	lfs f1, 4(r29)
/* 801E4A10 001E1A10  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801E4A14 001E1A14  C0 5D 00 08 */	lfs f2, 8(r29)
/* 801E4A18 001E1A18  C0 7D 00 0C */	lfs f3, 0xc(r29)
/* 801E4A1C 001E1A1C  48 0B 3A 11 */	bl PSMTXTrans
/* 801E4A20 001E1A20  38 60 00 04 */	li r3, 4
/* 801E4A24 001E1A24  4B E2 A7 2D */	bl camGetPtr
/* 801E4A28 001E1A28  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 801E4A2C 001E1A2C  38 61 00 68 */	addi r3, r1, 0x68
/* 801E4A30 001E1A30  C0 02 EA 60 */	lfs f0, lbl_8041FDE0-_SDA2_BASE_(r2)
/* 801E4A34 001E1A34  38 80 00 79 */	li r4, 0x79
/* 801E4A38 001E1A38  FC 20 08 50 */	fneg f1, f1
/* 801E4A3C 001E1A3C  EC 20 00 72 */	fmuls f1, f0, f1
/* 801E4A40 001E1A40  48 0B 37 AD */	bl PSMTXRotRad
/* 801E4A44 001E1A44  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801E4A48 001E1A48  38 81 00 68 */	addi r4, r1, 0x68
/* 801E4A4C 001E1A4C  7C 65 1B 78 */	mr r5, r3
/* 801E4A50 001E1A50  48 0B 35 11 */	bl PSMTXConcat
/* 801E4A54 001E1A54  38 7E 01 1C */	addi r3, r30, 0x11c
/* 801E4A58 001E1A58  38 81 00 C8 */	addi r4, r1, 0xc8
/* 801E4A5C 001E1A5C  38 A1 00 38 */	addi r5, r1, 0x38
/* 801E4A60 001E1A60  48 0B 35 01 */	bl PSMTXConcat
/* 801E4A64 001E1A64  80 A2 1E F0 */	lwz r5, lbl_80423270-_SDA2_BASE_(r2)
/* 801E4A68 001E1A68  38 81 00 14 */	addi r4, r1, 0x14
/* 801E4A6C 001E1A6C  80 1D 00 34 */	lwz r0, 0x34(r29)
/* 801E4A70 001E1A70  38 60 00 01 */	li r3, 1
/* 801E4A74 001E1A74  90 A1 00 10 */	stw r5, 0x10(r1)
/* 801E4A78 001E1A78  88 FD 00 38 */	lbz r7, 0x38(r29)
/* 801E4A7C 001E1A7C  88 DD 00 39 */	lbz r6, 0x39(r29)
/* 801E4A80 001E1A80  88 BD 00 3A */	lbz r5, 0x3a(r29)
/* 801E4A84 001E1A84  98 E1 00 10 */	stb r7, 0x10(r1)
/* 801E4A88 001E1A88  98 C1 00 11 */	stb r6, 0x11(r1)
/* 801E4A8C 001E1A8C  98 A1 00 12 */	stb r5, 0x12(r1)
/* 801E4A90 001E1A90  98 01 00 13 */	stb r0, 0x13(r1)
/* 801E4A94 001E1A94  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801E4A98 001E1A98  90 01 00 14 */	stw r0, 0x14(r1)
/* 801E4A9C 001E1A9C  48 0C E2 19 */	bl GXSetTevColor
/* 801E4AA0 001E1AA0  80 02 1E F4 */	lwz r0, lbl_80423274-_SDA2_BASE_(r2)
/* 801E4AA4 001E1AA4  38 81 00 0C */	addi r4, r1, 0xc
/* 801E4AA8 001E1AA8  88 DD 00 3B */	lbz r6, 0x3b(r29)
/* 801E4AAC 001E1AAC  38 60 00 02 */	li r3, 2
/* 801E4AB0 001E1AB0  90 01 00 08 */	stw r0, 8(r1)
/* 801E4AB4 001E1AB4  88 BD 00 3C */	lbz r5, 0x3c(r29)
/* 801E4AB8 001E1AB8  88 1D 00 3D */	lbz r0, 0x3d(r29)
/* 801E4ABC 001E1ABC  98 C1 00 08 */	stb r6, 8(r1)
/* 801E4AC0 001E1AC0  98 A1 00 09 */	stb r5, 9(r1)
/* 801E4AC4 001E1AC4  98 01 00 0A */	stb r0, 0xa(r1)
/* 801E4AC8 001E1AC8  80 01 00 08 */	lwz r0, 8(r1)
/* 801E4ACC 001E1ACC  90 01 00 0C */	stw r0, 0xc(r1)
/* 801E4AD0 001E1AD0  48 0C E1 E5 */	bl GXSetTevColor
/* 801E4AD4 001E1AD4  38 60 00 01 */	li r3, 1
/* 801E4AD8 001E1AD8  48 0C A7 A9 */	bl GXSetNumTexGens
/* 801E4ADC 001E1ADC  38 60 00 00 */	li r3, 0
/* 801E4AE0 001E1AE0  38 80 00 01 */	li r4, 1
/* 801E4AE4 001E1AE4  38 A0 00 04 */	li r5, 4
/* 801E4AE8 001E1AE8  38 C0 00 1E */	li r6, 0x1e
/* 801E4AEC 001E1AEC  38 E0 00 00 */	li r7, 0
/* 801E4AF0 001E1AF0  39 00 00 7D */	li r8, 0x7d
/* 801E4AF4 001E1AF4  48 0C A5 0D */	bl GXSetTexCoordGen2
/* 801E4AF8 001E1AF8  C0 22 EA 64 */	lfs f1, lbl_8041FDE4-_SDA2_BASE_(r2)
/* 801E4AFC 001E1AFC  38 61 00 98 */	addi r3, r1, 0x98
/* 801E4B00 001E1B00  C0 62 EA 68 */	lfs f3, lbl_8041FDE8-_SDA2_BASE_(r2)
/* 801E4B04 001E1B04  FC 40 08 90 */	fmr f2, f1
/* 801E4B08 001E1B08  48 0B 39 A5 */	bl PSMTXScale
/* 801E4B0C 001E1B0C  38 61 00 98 */	addi r3, r1, 0x98
/* 801E4B10 001E1B10  38 80 00 1E */	li r4, 0x1e
/* 801E4B14 001E1B14  38 A0 00 01 */	li r5, 1
/* 801E4B18 001E1B18  48 0C FA B5 */	bl GXLoadTexMtxImm
/* 801E4B1C 001E1B1C  38 81 00 18 */	addi r4, r1, 0x18
/* 801E4B20 001E1B20  38 60 00 2B */	li r3, 0x2b
/* 801E4B24 001E1B24  4B FE CD 21 */	bl effGetTexObjN64
/* 801E4B28 001E1B28  38 61 00 18 */	addi r3, r1, 0x18
/* 801E4B2C 001E1B2C  38 80 00 00 */	li r4, 0
/* 801E4B30 001E1B30  48 0C CF 4D */	bl GXLoadTexObj
/* 801E4B34 001E1B34  38 60 00 00 */	li r3, 0
/* 801E4B38 001E1B38  3B BD 00 40 */	addi r29, r29, 0x40
/* 801E4B3C 001E1B3C  48 0C B3 4D */	bl GXSetCullMode
/* 801E4B40 001E1B40  3C 60 80 3A */	lis r3, lbl_803A5DE0@ha
/* 801E4B44 001E1B44  38 63 5D E0 */	addi r3, r3, lbl_803A5DE0@l
/* 801E4B48 001E1B48  4B FE CB 69 */	bl effSetVtxDescN64
/* 801E4B4C 001E1B4C  C3 E2 EA 60 */	lfs f31, lbl_8041FDE0-_SDA2_BASE_(r2)
/* 801E4B50 001E1B50  3B C0 00 01 */	li r30, 1
/* 801E4B54 001E1B54  48 00 00 C0 */	b lbl_801E4C14
lbl_801E4B58:
/* 801E4B58 001E1B58  C0 3D 00 04 */	lfs f1, 4(r29)
/* 801E4B5C 001E1B5C  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801E4B60 001E1B60  C0 5D 00 08 */	lfs f2, 8(r29)
/* 801E4B64 001E1B64  C0 7D 00 0C */	lfs f3, 0xc(r29)
/* 801E4B68 001E1B68  48 0B 38 C5 */	bl PSMTXTrans
/* 801E4B6C 001E1B6C  C0 1D 00 2C */	lfs f0, 0x2c(r29)
/* 801E4B70 001E1B70  38 61 00 68 */	addi r3, r1, 0x68
/* 801E4B74 001E1B74  38 80 00 7A */	li r4, 0x7a
/* 801E4B78 001E1B78  EC 3F 00 32 */	fmuls f1, f31, f0
/* 801E4B7C 001E1B7C  48 0B 36 71 */	bl PSMTXRotRad
/* 801E4B80 001E1B80  C0 3D 00 20 */	lfs f1, 0x20(r29)
/* 801E4B84 001E1B84  38 61 00 98 */	addi r3, r1, 0x98
/* 801E4B88 001E1B88  C0 5D 00 1C */	lfs f2, 0x1c(r29)
/* 801E4B8C 001E1B8C  C0 62 EA 6C */	lfs f3, lbl_8041FDEC-_SDA2_BASE_(r2)
/* 801E4B90 001E1B90  48 0B 39 1D */	bl PSMTXScale
/* 801E4B94 001E1B94  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801E4B98 001E1B98  38 81 00 68 */	addi r4, r1, 0x68
/* 801E4B9C 001E1B9C  7C 65 1B 78 */	mr r5, r3
/* 801E4BA0 001E1BA0  48 0B 33 C1 */	bl PSMTXConcat
/* 801E4BA4 001E1BA4  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801E4BA8 001E1BA8  38 81 00 98 */	addi r4, r1, 0x98
/* 801E4BAC 001E1BAC  7C 65 1B 78 */	mr r5, r3
/* 801E4BB0 001E1BB0  48 0B 33 B1 */	bl PSMTXConcat
/* 801E4BB4 001E1BB4  38 81 00 C8 */	addi r4, r1, 0xc8
/* 801E4BB8 001E1BB8  38 61 00 38 */	addi r3, r1, 0x38
/* 801E4BBC 001E1BBC  7C 85 23 78 */	mr r5, r4
/* 801E4BC0 001E1BC0  48 0B 33 A1 */	bl PSMTXConcat
/* 801E4BC4 001E1BC4  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801E4BC8 001E1BC8  38 80 00 00 */	li r4, 0
/* 801E4BCC 001E1BCC  48 0C F9 2D */	bl GXLoadPosMtxImm
/* 801E4BD0 001E1BD0  38 60 00 00 */	li r3, 0
/* 801E4BD4 001E1BD4  48 0C F9 C5 */	bl GXSetCurrentMtx
/* 801E4BD8 001E1BD8  38 60 00 90 */	li r3, 0x90
/* 801E4BDC 001E1BDC  38 80 00 00 */	li r4, 0
/* 801E4BE0 001E1BE0  38 A0 00 06 */	li r5, 6
/* 801E4BE4 001E1BE4  48 0C B0 85 */	bl GXBegin
/* 801E4BE8 001E1BE8  38 60 00 00 */	li r3, 0
/* 801E4BEC 001E1BEC  38 80 00 01 */	li r4, 1
/* 801E4BF0 001E1BF0  38 A0 00 02 */	li r5, 2
/* 801E4BF4 001E1BF4  38 C0 00 00 */	li r6, 0
/* 801E4BF8 001E1BF8  38 E0 00 00 */	li r7, 0
/* 801E4BFC 001E1BFC  39 00 00 02 */	li r8, 2
/* 801E4C00 001E1C00  39 20 00 03 */	li r9, 3
/* 801E4C04 001E1C04  39 40 00 00 */	li r10, 0
/* 801E4C08 001E1C08  4B FE CA 2D */	bl tri2
/* 801E4C0C 001E1C0C  3B DE 00 01 */	addi r30, r30, 1
/* 801E4C10 001E1C10  3B BD 00 40 */	addi r29, r29, 0x40
lbl_801E4C14:
/* 801E4C14 001E1C14  80 1F 00 08 */	lwz r0, 8(r31)
/* 801E4C18 001E1C18  7C 1E 00 00 */	cmpw r30, r0
/* 801E4C1C 001E1C1C  41 80 FF 3C */	blt lbl_801E4B58
/* 801E4C20 001E1C20  E3 E1 01 18 */	psq_l f31, 280(r1), 0, qr0
/* 801E4C24 001E1C24  80 01 01 24 */	lwz r0, 0x124(r1)
/* 801E4C28 001E1C28  CB E1 01 10 */	lfd f31, 0x110(r1)
/* 801E4C2C 001E1C2C  83 E1 01 0C */	lwz r31, 0x10c(r1)
/* 801E4C30 001E1C30  83 C1 01 08 */	lwz r30, 0x108(r1)
/* 801E4C34 001E1C34  83 A1 01 04 */	lwz r29, 0x104(r1)
/* 801E4C38 001E1C38  7C 08 03 A6 */	mtlr r0
/* 801E4C3C 001E1C3C  38 21 01 20 */	addi r1, r1, 0x120
/* 801E4C40 001E1C40  4E 80 00 20 */	blr 
effStampMain:
/* 801E4C44 001E1C44  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 801E4C48 001E1C48  7C 08 02 A6 */	mflr r0
/* 801E4C4C 001E1C4C  90 01 00 74 */	stw r0, 0x74(r1)
/* 801E4C50 001E1C50  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 801E4C54 001E1C54  F3 E1 00 68 */	psq_st f31, 104(r1), 0, qr0
/* 801E4C58 001E1C58  DB C1 00 50 */	stfd f30, 0x50(r1)
/* 801E4C5C 001E1C5C  F3 C1 00 58 */	psq_st f30, 88(r1), 0, qr0
/* 801E4C60 001E1C60  DB A1 00 40 */	stfd f29, 0x40(r1)
/* 801E4C64 001E1C64  F3 A1 00 48 */	psq_st f29, 72(r1), 0, qr0
/* 801E4C68 001E1C68  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 801E4C6C 001E1C6C  93 C1 00 38 */	stw r30, 0x38(r1)
/* 801E4C70 001E1C70  93 A1 00 34 */	stw r29, 0x34(r1)
/* 801E4C74 001E1C74  93 81 00 30 */	stw r28, 0x30(r1)
/* 801E4C78 001E1C78  3C 80 80 30 */	lis r4, lbl_802FB6F0@ha
/* 801E4C7C 001E1C7C  7C 7E 1B 78 */	mr r30, r3
/* 801E4C80 001E1C80  38 C4 B6 F0 */	addi r6, r4, lbl_802FB6F0@l
/* 801E4C84 001E1C84  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 801E4C88 001E1C88  80 A6 00 00 */	lwz r5, 0(r6)
/* 801E4C8C 001E1C8C  80 86 00 04 */	lwz r4, 4(r6)
/* 801E4C90 001E1C90  80 06 00 08 */	lwz r0, 8(r6)
/* 801E4C94 001E1C94  90 A1 00 08 */	stw r5, 8(r1)
/* 801E4C98 001E1C98  C0 1F 00 04 */	lfs f0, 4(r31)
/* 801E4C9C 001E1C9C  90 81 00 0C */	stw r4, 0xc(r1)
/* 801E4CA0 001E1CA0  C0 3F 00 08 */	lfs f1, 8(r31)
/* 801E4CA4 001E1CA4  D0 01 00 08 */	stfs f0, 8(r1)
/* 801E4CA8 001E1CA8  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 801E4CAC 001E1CAC  90 01 00 10 */	stw r0, 0x10(r1)
/* 801E4CB0 001E1CB0  80 A1 00 08 */	lwz r5, 8(r1)
/* 801E4CB4 001E1CB4  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801E4CB8 001E1CB8  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801E4CBC 001E1CBC  80 81 00 0C */	lwz r4, 0xc(r1)
/* 801E4CC0 001E1CC0  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801E4CC4 001E1CC4  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801E4CC8 001E1CC8  90 81 00 18 */	stw r4, 0x18(r1)
/* 801E4CCC 001E1CCC  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801E4CD0 001E1CD0  80 9F 00 28 */	lwz r4, 0x28(r31)
/* 801E4CD4 001E1CD4  38 04 00 01 */	addi r0, r4, 1
/* 801E4CD8 001E1CD8  90 1F 00 28 */	stw r0, 0x28(r31)
/* 801E4CDC 001E1CDC  80 9F 00 24 */	lwz r4, 0x24(r31)
/* 801E4CE0 001E1CE0  38 04 FF FF */	addi r0, r4, -1
/* 801E4CE4 001E1CE4  90 1F 00 24 */	stw r0, 0x24(r31)
/* 801E4CE8 001E1CE8  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 801E4CEC 001E1CEC  2C 00 00 00 */	cmpwi r0, 0
/* 801E4CF0 001E1CF0  40 80 00 0C */	bge lbl_801E4CFC
/* 801E4CF4 001E1CF4  4B E7 8E 91 */	bl effDelete
/* 801E4CF8 001E1CF8  48 00 01 88 */	b lbl_801E4E80
lbl_801E4CFC:
/* 801E4CFC 001E1CFC  83 9F 00 28 */	lwz r28, 0x28(r31)
/* 801E4D00 001E1D00  2C 1C 00 0A */	cmpwi r28, 0xa
/* 801E4D04 001E1D04  40 81 00 40 */	ble lbl_801E4D44
/* 801E4D08 001E1D08  80 9F 00 34 */	lwz r4, 0x34(r31)
/* 801E4D0C 001E1D0C  3C 00 43 30 */	lis r0, 0x4330
/* 801E4D10 001E1D10  90 01 00 20 */	stw r0, 0x20(r1)
/* 801E4D14 001E1D14  3C 60 80 30 */	lis r3, lbl_802FB700@ha
/* 801E4D18 001E1D18  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 801E4D1C 001E1D1C  C8 43 B7 00 */	lfd f2, lbl_802FB700@l(r3)
/* 801E4D20 001E1D20  90 01 00 24 */	stw r0, 0x24(r1)
/* 801E4D24 001E1D24  C0 02 EA 70 */	lfs f0, lbl_8041FDF0-_SDA2_BASE_(r2)
/* 801E4D28 001E1D28  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 801E4D2C 001E1D2C  EC 21 10 28 */	fsubs f1, f1, f2
/* 801E4D30 001E1D30  EC 01 00 32 */	fmuls f0, f1, f0
/* 801E4D34 001E1D34  FC 00 00 1E */	fctiwz f0, f0
/* 801E4D38 001E1D38  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 801E4D3C 001E1D3C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 801E4D40 001E1D40  90 1F 00 34 */	stw r0, 0x34(r31)
lbl_801E4D44:
/* 801E4D44 001E1D44  C3 A2 EA 98 */	lfs f29, lbl_8041FE18-_SDA2_BASE_(r2)
/* 801E4D48 001E1D48  3B A0 00 01 */	li r29, 1
/* 801E4D4C 001E1D4C  C3 C2 EA 9C */	lfs f30, lbl_8041FE1C-_SDA2_BASE_(r2)
/* 801E4D50 001E1D50  3B FF 00 40 */	addi r31, r31, 0x40
/* 801E4D54 001E1D54  C3 E2 EA A0 */	lfs f31, lbl_8041FE20-_SDA2_BASE_(r2)
/* 801E4D58 001E1D58  48 00 00 FC */	b lbl_801E4E54
lbl_801E4D5C:
/* 801E4D5C 001E1D5C  2C 1C 00 0A */	cmpwi r28, 0xa
/* 801E4D60 001E1D60  40 81 00 50 */	ble lbl_801E4DB0
/* 801E4D64 001E1D64  C0 02 EA 6C */	lfs f0, lbl_8041FDEC-_SDA2_BASE_(r2)
/* 801E4D68 001E1D68  C0 9F 00 1C */	lfs f4, 0x1c(r31)
/* 801E4D6C 001E1D6C  C0 A2 EA 74 */	lfs f5, lbl_8041FDF4-_SDA2_BASE_(r2)
/* 801E4D70 001E1D70  EC 60 20 28 */	fsubs f3, f0, f4
/* 801E4D74 001E1D74  C0 22 EA 78 */	lfs f1, lbl_8041FDF8-_SDA2_BASE_(r2)
/* 801E4D78 001E1D78  C0 02 EA 84 */	lfs f0, lbl_8041FE04-_SDA2_BASE_(r2)
/* 801E4D7C 001E1D7C  C0 42 EA 80 */	lfs f2, lbl_8041FE00-_SDA2_BASE_(r2)
/* 801E4D80 001E1D80  EC 85 20 FA */	fmadds f4, f5, f3, f4
/* 801E4D84 001E1D84  C0 62 EA 7C */	lfs f3, lbl_8041FDFC-_SDA2_BASE_(r2)
/* 801E4D88 001E1D88  D0 9F 00 1C */	stfs f4, 0x1c(r31)
/* 801E4D8C 001E1D8C  C0 9F 00 20 */	lfs f4, 0x20(r31)
/* 801E4D90 001E1D90  EC 21 20 28 */	fsubs f1, f1, f4
/* 801E4D94 001E1D94  EC 25 20 7A */	fmadds f1, f5, f1, f4
/* 801E4D98 001E1D98  D0 3F 00 20 */	stfs f1, 0x20(r31)
/* 801E4D9C 001E1D9C  C0 3F 00 30 */	lfs f1, 0x30(r31)
/* 801E4DA0 001E1DA0  EC 00 08 28 */	fsubs f0, f0, f1
/* 801E4DA4 001E1DA4  EC 02 00 32 */	fmuls f0, f2, f0
/* 801E4DA8 001E1DA8  EC 03 08 3A */	fmadds f0, f3, f0, f1
/* 801E4DAC 001E1DAC  D0 1F 00 30 */	stfs f0, 0x30(r31)
lbl_801E4DB0:
/* 801E4DB0 001E1DB0  2C 1C 00 0A */	cmpwi r28, 0xa
/* 801E4DB4 001E1DB4  40 80 00 50 */	bge lbl_801E4E04
/* 801E4DB8 001E1DB8  C0 02 EA 8C */	lfs f0, lbl_8041FE0C-_SDA2_BASE_(r2)
/* 801E4DBC 001E1DBC  C0 7F 00 1C */	lfs f3, 0x1c(r31)
/* 801E4DC0 001E1DC0  C0 A2 EA 88 */	lfs f5, lbl_8041FE08-_SDA2_BASE_(r2)
/* 801E4DC4 001E1DC4  EC 40 18 28 */	fsubs f2, f0, f3
/* 801E4DC8 001E1DC8  C0 22 EA 6C */	lfs f1, lbl_8041FDEC-_SDA2_BASE_(r2)
/* 801E4DCC 001E1DCC  C0 82 EA 74 */	lfs f4, lbl_8041FDF4-_SDA2_BASE_(r2)
/* 801E4DD0 001E1DD0  C0 02 EA 94 */	lfs f0, lbl_8041FE14-_SDA2_BASE_(r2)
/* 801E4DD4 001E1DD4  EC 65 18 BA */	fmadds f3, f5, f2, f3
/* 801E4DD8 001E1DD8  C0 42 EA 90 */	lfs f2, lbl_8041FE10-_SDA2_BASE_(r2)
/* 801E4DDC 001E1DDC  D0 7F 00 1C */	stfs f3, 0x1c(r31)
/* 801E4DE0 001E1DE0  C0 7F 00 20 */	lfs f3, 0x20(r31)
/* 801E4DE4 001E1DE4  EC 21 18 28 */	fsubs f1, f1, f3
/* 801E4DE8 001E1DE8  EC 24 18 7A */	fmadds f1, f4, f1, f3
/* 801E4DEC 001E1DEC  D0 3F 00 20 */	stfs f1, 0x20(r31)
/* 801E4DF0 001E1DF0  C0 3F 00 30 */	lfs f1, 0x30(r31)
/* 801E4DF4 001E1DF4  EC 00 08 28 */	fsubs f0, f0, f1
/* 801E4DF8 001E1DF8  EC 05 00 32 */	fmuls f0, f5, f0
/* 801E4DFC 001E1DFC  EC 02 08 3A */	fmadds f0, f2, f0, f1
/* 801E4E00 001E1E00  D0 1F 00 30 */	stfs f0, 0x30(r31)
lbl_801E4E04:
/* 801E4E04 001E1E04  C0 1F 00 2C */	lfs f0, 0x2c(r31)
/* 801E4E08 001E1E08  EC 1E 00 2A */	fadds f0, f30, f0
/* 801E4E0C 001E1E0C  EC 1D 00 32 */	fmuls f0, f29, f0
/* 801E4E10 001E1E10  EC 20 F8 24 */	fdivs f1, f0, f31
/* 801E4E14 001E1E14  48 08 70 7D */	bl cos
/* 801E4E18 001E1E18  FC 20 08 18 */	frsp f1, f1
/* 801E4E1C 001E1E1C  C0 1F 00 30 */	lfs f0, 0x30(r31)
/* 801E4E20 001E1E20  EC 00 00 72 */	fmuls f0, f0, f1
/* 801E4E24 001E1E24  D0 1F 00 04 */	stfs f0, 4(r31)
/* 801E4E28 001E1E28  C0 1F 00 2C */	lfs f0, 0x2c(r31)
/* 801E4E2C 001E1E2C  EC 1E 00 2A */	fadds f0, f30, f0
/* 801E4E30 001E1E30  EC 1D 00 32 */	fmuls f0, f29, f0
/* 801E4E34 001E1E34  EC 20 F8 24 */	fdivs f1, f0, f31
/* 801E4E38 001E1E38  48 08 75 C1 */	bl sin
/* 801E4E3C 001E1E3C  FC 20 08 18 */	frsp f1, f1
/* 801E4E40 001E1E40  C0 1F 00 30 */	lfs f0, 0x30(r31)
/* 801E4E44 001E1E44  3B BD 00 01 */	addi r29, r29, 1
/* 801E4E48 001E1E48  EC 00 00 72 */	fmuls f0, f0, f1
/* 801E4E4C 001E1E4C  D0 1F 00 08 */	stfs f0, 8(r31)
/* 801E4E50 001E1E50  3B FF 00 40 */	addi r31, r31, 0x40
lbl_801E4E54:
/* 801E4E54 001E1E54  80 1E 00 08 */	lwz r0, 8(r30)
/* 801E4E58 001E1E58  7C 1D 00 00 */	cmpw r29, r0
/* 801E4E5C 001E1E5C  41 80 FF 00 */	blt lbl_801E4D5C
/* 801E4E60 001E1E60  38 61 00 14 */	addi r3, r1, 0x14
/* 801E4E64 001E1E64  4B E2 B8 5D */	bl dispCalcZ
/* 801E4E68 001E1E68  3C 60 80 1E */	lis r3, effStampDisp@ha
/* 801E4E6C 001E1E6C  7F C6 F3 78 */	mr r6, r30
/* 801E4E70 001E1E70  38 A3 49 30 */	addi r5, r3, effStampDisp@l
/* 801E4E74 001E1E74  38 80 00 02 */	li r4, 2
/* 801E4E78 001E1E78  38 60 00 04 */	li r3, 4
/* 801E4E7C 001E1E7C  4B E2 BB 9D */	bl dispEntry
lbl_801E4E80:
/* 801E4E80 001E1E80  E3 E1 00 68 */	psq_l f31, 104(r1), 0, qr0
/* 801E4E84 001E1E84  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 801E4E88 001E1E88  E3 C1 00 58 */	psq_l f30, 88(r1), 0, qr0
/* 801E4E8C 001E1E8C  CB C1 00 50 */	lfd f30, 0x50(r1)
/* 801E4E90 001E1E90  E3 A1 00 48 */	psq_l f29, 72(r1), 0, qr0
/* 801E4E94 001E1E94  CB A1 00 40 */	lfd f29, 0x40(r1)
/* 801E4E98 001E1E98  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 801E4E9C 001E1E9C  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 801E4EA0 001E1EA0  83 A1 00 34 */	lwz r29, 0x34(r1)
/* 801E4EA4 001E1EA4  80 01 00 74 */	lwz r0, 0x74(r1)
/* 801E4EA8 001E1EA8  83 81 00 30 */	lwz r28, 0x30(r1)
/* 801E4EAC 001E1EAC  7C 08 03 A6 */	mtlr r0
/* 801E4EB0 001E1EB0  38 21 00 70 */	addi r1, r1, 0x70
/* 801E4EB4 001E1EB4  4E 80 00 20 */	blr 

.global effStampN64Entry
effStampN64Entry:
/* 801E4EB8 001E1EB8  94 21 FF 40 */	stwu r1, -0xc0(r1)
/* 801E4EBC 001E1EBC  7C 08 02 A6 */	mflr r0
/* 801E4EC0 001E1EC0  90 01 00 C4 */	stw r0, 0xc4(r1)
/* 801E4EC4 001E1EC4  DB E1 00 B0 */	stfd f31, 0xb0(r1)
/* 801E4EC8 001E1EC8  F3 E1 00 B8 */	psq_st f31, 184(r1), 0, qr0
/* 801E4ECC 001E1ECC  DB C1 00 A0 */	stfd f30, 0xa0(r1)
/* 801E4ED0 001E1ED0  F3 C1 00 A8 */	psq_st f30, 168(r1), 0, qr0
/* 801E4ED4 001E1ED4  DB A1 00 90 */	stfd f29, 0x90(r1)
/* 801E4ED8 001E1ED8  F3 A1 00 98 */	psq_st f29, 152(r1), 0, qr0
/* 801E4EDC 001E1EDC  DB 81 00 80 */	stfd f28, 0x80(r1)
/* 801E4EE0 001E1EE0  F3 81 00 88 */	psq_st f28, 136(r1), 0, qr0
/* 801E4EE4 001E1EE4  DB 61 00 70 */	stfd f27, 0x70(r1)
/* 801E4EE8 001E1EE8  F3 61 00 78 */	psq_st f27, 120(r1), 0, qr0
/* 801E4EEC 001E1EEC  DB 41 00 60 */	stfd f26, 0x60(r1)
/* 801E4EF0 001E1EF0  F3 41 00 68 */	psq_st f26, 104(r1), 0, qr0
/* 801E4EF4 001E1EF4  DB 21 00 50 */	stfd f25, 0x50(r1)
/* 801E4EF8 001E1EF8  F3 21 00 58 */	psq_st f25, 88(r1), 0, qr0
/* 801E4EFC 001E1EFC  DB 01 00 40 */	stfd f24, 0x40(r1)
/* 801E4F00 001E1F00  F3 01 00 48 */	psq_st f24, 72(r1), 0, qr0
/* 801E4F04 001E1F04  DA E1 00 30 */	stfd f23, 0x30(r1)
/* 801E4F08 001E1F08  F2 E1 00 38 */	psq_st f23, 56(r1), 0, qr0
/* 801E4F0C 001E1F0C  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 801E4F10 001E1F10  FF 20 08 90 */	fmr f25, f1
/* 801E4F14 001E1F14  7C 7B 1B 78 */	mr r27, r3
/* 801E4F18 001E1F18  FF 00 10 90 */	fmr f24, f2
/* 801E4F1C 001E1F1C  FE E0 18 90 */	fmr f23, f3
/* 801E4F20 001E1F20  4B E7 8E 9D */	bl effEntry
/* 801E4F24 001E1F24  3C 80 80 30 */	lis r4, lbl_802FB708@ha
/* 801E4F28 001E1F28  7C 7F 1B 78 */	mr r31, r3
/* 801E4F2C 001E1F2C  38 84 B7 08 */	addi r4, r4, lbl_802FB708@l
/* 801E4F30 001E1F30  38 00 00 08 */	li r0, 8
/* 801E4F34 001E1F34  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801E4F38 001E1F38  38 60 00 03 */	li r3, 3
/* 801E4F3C 001E1F3C  38 80 02 00 */	li r4, 0x200
/* 801E4F40 001E1F40  90 1F 00 08 */	stw r0, 8(r31)
/* 801E4F44 001E1F44  4B E4 AB 49 */	bl __memAlloc
/* 801E4F48 001E1F48  3C 80 80 1E */	lis r4, effStampMain@ha
/* 801E4F4C 001E1F4C  90 7F 00 0C */	stw r3, 0xc(r31)
/* 801E4F50 001E1F50  38 04 4C 44 */	addi r0, r4, effStampMain@l
/* 801E4F54 001E1F54  2C 1B 00 01 */	cmpwi r27, 1
/* 801E4F58 001E1F58  90 1F 00 10 */	stw r0, 0x10(r31)
/* 801E4F5C 001E1F5C  38 80 00 1E */	li r4, 0x1e
/* 801E4F60 001E1F60  38 00 00 00 */	li r0, 0
/* 801E4F64 001E1F64  38 A0 00 FF */	li r5, 0xff
/* 801E4F68 001E1F68  90 83 00 24 */	stw r4, 0x24(r3)
/* 801E4F6C 001E1F6C  90 03 00 28 */	stw r0, 0x28(r3)
/* 801E4F70 001E1F70  B3 63 00 00 */	sth r27, 0(r3)
/* 801E4F74 001E1F74  D3 23 00 04 */	stfs f25, 4(r3)
/* 801E4F78 001E1F78  D3 03 00 08 */	stfs f24, 8(r3)
/* 801E4F7C 001E1F7C  D2 E3 00 0C */	stfs f23, 0xc(r3)
/* 801E4F80 001E1F80  90 A3 00 34 */	stw r5, 0x34(r3)
/* 801E4F84 001E1F84  41 82 00 48 */	beq lbl_801E4FCC
/* 801E4F88 001E1F88  40 80 00 10 */	bge lbl_801E4F98
/* 801E4F8C 001E1F8C  2C 1B 00 00 */	cmpwi r27, 0
/* 801E4F90 001E1F90  40 80 00 14 */	bge lbl_801E4FA4
/* 801E4F94 001E1F94  48 00 00 80 */	b lbl_801E5014
lbl_801E4F98:
/* 801E4F98 001E1F98  2C 1B 00 03 */	cmpwi r27, 3
/* 801E4F9C 001E1F9C  40 80 00 78 */	bge lbl_801E5014
/* 801E4FA0 001E1FA0  48 00 00 54 */	b lbl_801E4FF4
lbl_801E4FA4:
/* 801E4FA4 001E1FA4  38 A0 00 14 */	li r5, 0x14
/* 801E4FA8 001E1FA8  38 80 00 15 */	li r4, 0x15
/* 801E4FAC 001E1FAC  98 A3 00 3B */	stb r5, 0x3b(r3)
/* 801E4FB0 001E1FB0  38 00 00 F2 */	li r0, 0xf2
/* 801E4FB4 001E1FB4  98 A3 00 38 */	stb r5, 0x38(r3)
/* 801E4FB8 001E1FB8  98 83 00 3C */	stb r4, 0x3c(r3)
/* 801E4FBC 001E1FBC  98 83 00 39 */	stb r4, 0x39(r3)
/* 801E4FC0 001E1FC0  98 03 00 3D */	stb r0, 0x3d(r3)
/* 801E4FC4 001E1FC4  98 03 00 3A */	stb r0, 0x3a(r3)
/* 801E4FC8 001E1FC8  48 00 00 4C */	b lbl_801E5014
lbl_801E4FCC:
/* 801E4FCC 001E1FCC  38 A0 00 C8 */	li r5, 0xc8
/* 801E4FD0 001E1FD0  38 80 00 15 */	li r4, 0x15
/* 801E4FD4 001E1FD4  98 A3 00 3B */	stb r5, 0x3b(r3)
/* 801E4FD8 001E1FD8  38 00 00 D4 */	li r0, 0xd4
/* 801E4FDC 001E1FDC  98 A3 00 38 */	stb r5, 0x38(r3)
/* 801E4FE0 001E1FE0  98 83 00 3C */	stb r4, 0x3c(r3)
/* 801E4FE4 001E1FE4  98 83 00 39 */	stb r4, 0x39(r3)
/* 801E4FE8 001E1FE8  98 03 00 3D */	stb r0, 0x3d(r3)
/* 801E4FEC 001E1FEC  98 03 00 3A */	stb r0, 0x3a(r3)
/* 801E4FF0 001E1FF0  48 00 00 24 */	b lbl_801E5014
lbl_801E4FF4:
/* 801E4FF4 001E1FF4  98 A3 00 3B */	stb r5, 0x3b(r3)
/* 801E4FF8 001E1FF8  38 80 00 B5 */	li r4, 0xb5
/* 801E4FFC 001E1FFC  38 00 00 DA */	li r0, 0xda
/* 801E5000 001E2000  98 A3 00 38 */	stb r5, 0x38(r3)
/* 801E5004 001E2004  98 83 00 3C */	stb r4, 0x3c(r3)
/* 801E5008 001E2008  98 83 00 39 */	stb r4, 0x39(r3)
/* 801E500C 001E200C  98 03 00 3D */	stb r0, 0x3d(r3)
/* 801E5010 001E2010  98 03 00 3A */	stb r0, 0x3a(r3)
lbl_801E5014:
/* 801E5014 001E2014  3C 80 80 30 */	lis r4, lbl_802FB700@ha
/* 801E5018 001E2018  3C A0 92 49 */	lis r5, 0x92492493@ha
/* 801E501C 001E201C  C3 42 EA 98 */	lfs f26, lbl_8041FE18-_SDA2_BASE_(r2)
/* 801E5020 001E2020  3B 83 00 40 */	addi r28, r3, 0x40
/* 801E5024 001E2024  CB 24 B7 00 */	lfd f25, lbl_802FB700@l(r4)
/* 801E5028 001E2028  3B A5 24 93 */	addi r29, r5, 0x92492493@l
/* 801E502C 001E202C  C3 62 EA 9C */	lfs f27, lbl_8041FE1C-_SDA2_BASE_(r2)
/* 801E5030 001E2030  3B 60 00 01 */	li r27, 1
/* 801E5034 001E2034  C3 82 EA A0 */	lfs f28, lbl_8041FE20-_SDA2_BASE_(r2)
/* 801E5038 001E2038  3F C0 43 30 */	lis r30, 0x4330
/* 801E503C 001E203C  C3 A2 EA 6C */	lfs f29, lbl_8041FDEC-_SDA2_BASE_(r2)
/* 801E5040 001E2040  C3 C2 EA 68 */	lfs f30, lbl_8041FDE8-_SDA2_BASE_(r2)
/* 801E5044 001E2044  C3 E2 EA 74 */	lfs f31, lbl_8041FDF4-_SDA2_BASE_(r2)
lbl_801E5048:
/* 801E5048 001E2048  38 1B FF FF */	addi r0, r27, -1
/* 801E504C 001E204C  93 C1 00 08 */	stw r30, 8(r1)
/* 801E5050 001E2050  1C 00 01 68 */	mulli r0, r0, 0x168
/* 801E5054 001E2054  7C 7D 00 96 */	mulhw r3, r29, r0
/* 801E5058 001E2058  7C 03 02 14 */	add r0, r3, r0
/* 801E505C 001E205C  7C 00 16 70 */	srawi r0, r0, 2
/* 801E5060 001E2060  54 03 0F FE */	srwi r3, r0, 0x1f
/* 801E5064 001E2064  7C 00 1A 14 */	add r0, r0, r3
/* 801E5068 001E2068  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801E506C 001E206C  90 01 00 0C */	stw r0, 0xc(r1)
/* 801E5070 001E2070  C8 01 00 08 */	lfd f0, 8(r1)
/* 801E5074 001E2074  EE E0 C8 28 */	fsubs f23, f0, f25
/* 801E5078 001E2078  EC 1B B8 2A */	fadds f0, f27, f23
/* 801E507C 001E207C  EC 1A 00 32 */	fmuls f0, f26, f0
/* 801E5080 001E2080  EF 00 E0 24 */	fdivs f24, f0, f28
/* 801E5084 001E2084  FC 20 C0 90 */	fmr f1, f24
/* 801E5088 001E2088  48 08 6E 09 */	bl cos
/* 801E508C 001E208C  FC 00 08 18 */	frsp f0, f1
/* 801E5090 001E2090  FC 20 C0 90 */	fmr f1, f24
/* 801E5094 001E2094  EC 1D 00 32 */	fmuls f0, f29, f0
/* 801E5098 001E2098  D0 1C 00 04 */	stfs f0, 4(r28)
/* 801E509C 001E209C  48 08 73 5D */	bl sin
/* 801E50A0 001E20A0  FC 00 08 18 */	frsp f0, f1
/* 801E50A4 001E20A4  3B 7B 00 01 */	addi r27, r27, 1
/* 801E50A8 001E20A8  2C 1B 00 08 */	cmpwi r27, 8
/* 801E50AC 001E20AC  EC 1D 00 32 */	fmuls f0, f29, f0
/* 801E50B0 001E20B0  D0 1C 00 08 */	stfs f0, 8(r28)
/* 801E50B4 001E20B4  D3 DC 00 0C */	stfs f30, 0xc(r28)
/* 801E50B8 001E20B8  D3 DC 00 10 */	stfs f30, 0x10(r28)
/* 801E50BC 001E20BC  D3 DC 00 14 */	stfs f30, 0x14(r28)
/* 801E50C0 001E20C0  D3 DC 00 18 */	stfs f30, 0x18(r28)
/* 801E50C4 001E20C4  D3 FC 00 1C */	stfs f31, 0x1c(r28)
/* 801E50C8 001E20C8  D3 FC 00 20 */	stfs f31, 0x20(r28)
/* 801E50CC 001E20CC  D3 BC 00 30 */	stfs f29, 0x30(r28)
/* 801E50D0 001E20D0  D2 FC 00 2C */	stfs f23, 0x2c(r28)
/* 801E50D4 001E20D4  3B 9C 00 40 */	addi r28, r28, 0x40
/* 801E50D8 001E20D8  41 80 FF 70 */	blt lbl_801E5048
/* 801E50DC 001E20DC  7F E3 FB 78 */	mr r3, r31
/* 801E50E0 001E20E0  E3 E1 00 B8 */	psq_l f31, 184(r1), 0, qr0
/* 801E50E4 001E20E4  CB E1 00 B0 */	lfd f31, 0xb0(r1)
/* 801E50E8 001E20E8  E3 C1 00 A8 */	psq_l f30, 168(r1), 0, qr0
/* 801E50EC 001E20EC  CB C1 00 A0 */	lfd f30, 0xa0(r1)
/* 801E50F0 001E20F0  E3 A1 00 98 */	psq_l f29, 152(r1), 0, qr0
/* 801E50F4 001E20F4  CB A1 00 90 */	lfd f29, 0x90(r1)
/* 801E50F8 001E20F8  E3 81 00 88 */	psq_l f28, 136(r1), 0, qr0
/* 801E50FC 001E20FC  CB 81 00 80 */	lfd f28, 0x80(r1)
/* 801E5100 001E2100  E3 61 00 78 */	psq_l f27, 120(r1), 0, qr0
/* 801E5104 001E2104  CB 61 00 70 */	lfd f27, 0x70(r1)
/* 801E5108 001E2108  E3 41 00 68 */	psq_l f26, 104(r1), 0, qr0
/* 801E510C 001E210C  CB 41 00 60 */	lfd f26, 0x60(r1)
/* 801E5110 001E2110  E3 21 00 58 */	psq_l f25, 88(r1), 0, qr0
/* 801E5114 001E2114  CB 21 00 50 */	lfd f25, 0x50(r1)
/* 801E5118 001E2118  E3 01 00 48 */	psq_l f24, 72(r1), 0, qr0
/* 801E511C 001E211C  CB 01 00 40 */	lfd f24, 0x40(r1)
/* 801E5120 001E2120  E2 E1 00 38 */	psq_l f23, 56(r1), 0, qr0
/* 801E5124 001E2124  CA E1 00 30 */	lfd f23, 0x30(r1)
/* 801E5128 001E2128  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 801E512C 001E212C  80 01 00 C4 */	lwz r0, 0xc4(r1)
/* 801E5130 001E2130  7C 08 03 A6 */	mtlr r0
/* 801E5134 001E2134  38 21 00 C0 */	addi r1, r1, 0xc0
/* 801E5138 001E2138  4E 80 00 20 */	blr 