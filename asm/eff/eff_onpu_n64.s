.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effOnpuDisp
effOnpuDisp:
/* 801D1A18 001CEA18  94 21 FF 20 */	stwu r1, -0xe0(r1)
/* 801D1A1C 001CEA1C  7C 08 02 A6 */	mflr r0
/* 801D1A20 001CEA20  90 01 00 E4 */	stw r0, 0xe4(r1)
/* 801D1A24 001CEA24  93 E1 00 DC */	stw r31, 0xdc(r1)
/* 801D1A28 001CEA28  93 C1 00 D8 */	stw r30, 0xd8(r1)
/* 801D1A2C 001CEA2C  93 A1 00 D4 */	stw r29, 0xd4(r1)
/* 801D1A30 001CEA30  93 81 00 D0 */	stw r28, 0xd0(r1)
/* 801D1A34 001CEA34  7C 9C 23 78 */	mr r28, r4
/* 801D1A38 001CEA38  4B E3 D7 19 */	bl camGetPtr
/* 801D1A3C 001CEA3C  83 DC 00 0C */	lwz r30, 0xc(r28)
/* 801D1A40 001CEA40  3C 80 38 E4 */	lis r4, 0x38E38E39@ha
/* 801D1A44 001CEA44  7C 7F 1B 78 */	mr r31, r3
/* 801D1A48 001CEA48  38 60 00 00 */	li r3, 0
/* 801D1A4C 001CEA4C  80 BE 00 1C */	lwz r5, 0x1c(r30)
/* 801D1A50 001CEA50  38 04 8E 39 */	addi r0, r4, 0x38E38E39@l
/* 801D1A54 001CEA54  83 9E 00 20 */	lwz r28, 0x20(r30)
/* 801D1A58 001CEA58  1F A5 00 03 */	mulli r29, r5, 3
/* 801D1A5C 001CEA5C  7C 00 E8 96 */	mulhw r0, r0, r29
/* 801D1A60 001CEA60  7C 00 1E 70 */	srawi r0, r0, 3
/* 801D1A64 001CEA64  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801D1A68 001CEA68  7C 00 22 14 */	add r0, r0, r4
/* 801D1A6C 001CEA6C  1C 00 00 24 */	mulli r0, r0, 0x24
/* 801D1A70 001CEA70  7F A0 E8 50 */	subf r29, r0, r29
/* 801D1A74 001CEA74  48 0D F6 C5 */	bl GXSetNumChans
/* 801D1A78 001CEA78  38 60 00 02 */	li r3, 2
/* 801D1A7C 001CEA7C  48 0D D8 05 */	bl GXSetNumTexGens
/* 801D1A80 001CEA80  38 60 00 00 */	li r3, 0
/* 801D1A84 001CEA84  38 80 00 01 */	li r4, 1
/* 801D1A88 001CEA88  38 A0 00 04 */	li r5, 4
/* 801D1A8C 001CEA8C  38 C0 00 1E */	li r6, 0x1e
/* 801D1A90 001CEA90  38 E0 00 00 */	li r7, 0
/* 801D1A94 001CEA94  39 00 00 7D */	li r8, 0x7d
/* 801D1A98 001CEA98  48 0D D5 69 */	bl GXSetTexCoordGen2
/* 801D1A9C 001CEA9C  38 60 00 01 */	li r3, 1
/* 801D1AA0 001CEAA0  38 80 00 01 */	li r4, 1
/* 801D1AA4 001CEAA4  38 A0 00 04 */	li r5, 4
/* 801D1AA8 001CEAA8  38 C0 00 21 */	li r6, 0x21
/* 801D1AAC 001CEAAC  38 E0 00 00 */	li r7, 0
/* 801D1AB0 001CEAB0  39 00 00 7D */	li r8, 0x7d
/* 801D1AB4 001CEAB4  48 0D D5 4D */	bl GXSetTexCoordGen2
/* 801D1AB8 001CEAB8  C0 22 E4 10 */	lfs f1, lbl_8041F790@sda21(r2)
/* 801D1ABC 001CEABC  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1AC0 001CEAC0  C0 42 E4 14 */	lfs f2, lbl_8041F794@sda21(r2)
/* 801D1AC4 001CEAC4  C0 62 E4 18 */	lfs f3, lbl_8041F798@sda21(r2)
/* 801D1AC8 001CEAC8  48 0C 69 E5 */	bl PSMTXScale
/* 801D1ACC 001CEACC  57 9C 28 34 */	slwi r28, r28, 5
/* 801D1AD0 001CEAD0  3C 00 43 30 */	lis r0, 0x4330
/* 801D1AD4 001CEAD4  6F 83 80 00 */	xoris r3, r28, 0x8000
/* 801D1AD8 001CEAD8  3C 80 80 30 */	lis r4, lbl_802FB210@ha
/* 801D1ADC 001CEADC  90 61 00 C4 */	stw r3, 0xc4(r1)
/* 801D1AE0 001CEAE0  38 61 00 90 */	addi r3, r1, 0x90
/* 801D1AE4 001CEAE4  C0 22 E4 18 */	lfs f1, lbl_8041F798@sda21(r2)
/* 801D1AE8 001CEAE8  90 01 00 C0 */	stw r0, 0xc0(r1)
/* 801D1AEC 001CEAEC  C8 44 B2 10 */	lfd f2, lbl_802FB210@l(r4)
/* 801D1AF0 001CEAF0  FC 60 08 90 */	fmr f3, f1
/* 801D1AF4 001CEAF4  C8 01 00 C0 */	lfd f0, 0xc0(r1)
/* 801D1AF8 001CEAF8  EC 40 10 28 */	fsubs f2, f0, f2
/* 801D1AFC 001CEAFC  48 0C 69 31 */	bl PSMTXTrans
/* 801D1B00 001CEB00  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1B04 001CEB04  38 81 00 90 */	addi r4, r1, 0x90
/* 801D1B08 001CEB08  7C 65 1B 78 */	mr r5, r3
/* 801D1B0C 001CEB0C  48 0C 64 55 */	bl PSMTXConcat
/* 801D1B10 001CEB10  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1B14 001CEB14  38 80 00 1E */	li r4, 0x1e
/* 801D1B18 001CEB18  38 A0 00 01 */	li r5, 1
/* 801D1B1C 001CEB1C  48 0E 2A B1 */	bl GXLoadTexMtxImm
/* 801D1B20 001CEB20  C0 22 E4 10 */	lfs f1, lbl_8041F790@sda21(r2)
/* 801D1B24 001CEB24  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1B28 001CEB28  C0 42 E4 14 */	lfs f2, lbl_8041F794@sda21(r2)
/* 801D1B2C 001CEB2C  C0 62 E4 18 */	lfs f3, lbl_8041F798@sda21(r2)
/* 801D1B30 001CEB30  48 0C 69 7D */	bl PSMTXScale
/* 801D1B34 001CEB34  6F 83 80 00 */	xoris r3, r28, 0x8000
/* 801D1B38 001CEB38  3C 00 43 30 */	lis r0, 0x4330
/* 801D1B3C 001CEB3C  90 61 00 CC */	stw r3, 0xcc(r1)
/* 801D1B40 001CEB40  3C 80 80 30 */	lis r4, lbl_802FB210@ha
/* 801D1B44 001CEB44  C0 22 E4 18 */	lfs f1, lbl_8041F798@sda21(r2)
/* 801D1B48 001CEB48  38 61 00 90 */	addi r3, r1, 0x90
/* 801D1B4C 001CEB4C  90 01 00 C8 */	stw r0, 0xc8(r1)
/* 801D1B50 001CEB50  C8 44 B2 10 */	lfd f2, lbl_802FB210@l(r4)
/* 801D1B54 001CEB54  FC 60 08 90 */	fmr f3, f1
/* 801D1B58 001CEB58  C8 01 00 C8 */	lfd f0, 0xc8(r1)
/* 801D1B5C 001CEB5C  EC 40 10 28 */	fsubs f2, f0, f2
/* 801D1B60 001CEB60  48 0C 68 CD */	bl PSMTXTrans
/* 801D1B64 001CEB64  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1B68 001CEB68  38 81 00 90 */	addi r4, r1, 0x90
/* 801D1B6C 001CEB6C  7C 65 1B 78 */	mr r5, r3
/* 801D1B70 001CEB70  48 0C 63 F1 */	bl PSMTXConcat
/* 801D1B74 001CEB74  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1B78 001CEB78  38 80 00 21 */	li r4, 0x21
/* 801D1B7C 001CEB7C  38 A0 00 01 */	li r5, 1
/* 801D1B80 001CEB80  48 0E 2A 4D */	bl GXLoadTexMtxImm
/* 801D1B84 001CEB84  38 60 00 02 */	li r3, 2
/* 801D1B88 001CEB88  48 0E 16 41 */	bl GXSetNumTevStages
/* 801D1B8C 001CEB8C  38 60 00 00 */	li r3, 0
/* 801D1B90 001CEB90  38 80 00 00 */	li r4, 0
/* 801D1B94 001CEB94  38 A0 00 00 */	li r5, 0
/* 801D1B98 001CEB98  38 C0 00 FF */	li r6, 0xff
/* 801D1B9C 001CEB9C  48 0E 14 91 */	bl GXSetTevOrder
/* 801D1BA0 001CEBA0  38 60 00 00 */	li r3, 0
/* 801D1BA4 001CEBA4  38 80 00 00 */	li r4, 0
/* 801D1BA8 001CEBA8  38 A0 00 00 */	li r5, 0
/* 801D1BAC 001CEBAC  38 C0 00 00 */	li r6, 0
/* 801D1BB0 001CEBB0  38 E0 00 01 */	li r7, 1
/* 801D1BB4 001CEBB4  39 00 00 00 */	li r8, 0
/* 801D1BB8 001CEBB8  48 0E 10 2D */	bl GXSetTevColorOp
/* 801D1BBC 001CEBBC  38 60 00 00 */	li r3, 0
/* 801D1BC0 001CEBC0  38 80 00 00 */	li r4, 0
/* 801D1BC4 001CEBC4  38 A0 00 00 */	li r5, 0
/* 801D1BC8 001CEBC8  38 C0 00 00 */	li r6, 0
/* 801D1BCC 001CEBCC  38 E0 00 01 */	li r7, 1
/* 801D1BD0 001CEBD0  39 00 00 00 */	li r8, 0
/* 801D1BD4 001CEBD4  48 0E 10 79 */	bl GXSetTevAlphaOp
/* 801D1BD8 001CEBD8  38 60 00 00 */	li r3, 0
/* 801D1BDC 001CEBDC  38 80 00 02 */	li r4, 2
/* 801D1BE0 001CEBE0  38 A0 00 0F */	li r5, 0xf
/* 801D1BE4 001CEBE4  38 C0 00 08 */	li r6, 8
/* 801D1BE8 001CEBE8  38 E0 00 0F */	li r7, 0xf
/* 801D1BEC 001CEBEC  48 0E 0F 71 */	bl GXSetTevColorIn
/* 801D1BF0 001CEBF0  38 60 00 00 */	li r3, 0
/* 801D1BF4 001CEBF4  38 80 00 07 */	li r4, 7
/* 801D1BF8 001CEBF8  38 A0 00 07 */	li r5, 7
/* 801D1BFC 001CEBFC  38 C0 00 07 */	li r6, 7
/* 801D1C00 001CEC00  38 E0 00 07 */	li r7, 7
/* 801D1C04 001CEC04  48 0E 0F 9D */	bl GXSetTevAlphaIn
/* 801D1C08 001CEC08  38 60 00 01 */	li r3, 1
/* 801D1C0C 001CEC0C  38 80 00 01 */	li r4, 1
/* 801D1C10 001CEC10  38 A0 00 01 */	li r5, 1
/* 801D1C14 001CEC14  38 C0 00 FF */	li r6, 0xff
/* 801D1C18 001CEC18  48 0E 14 15 */	bl GXSetTevOrder
/* 801D1C1C 001CEC1C  38 60 00 01 */	li r3, 1
/* 801D1C20 001CEC20  38 80 00 00 */	li r4, 0
/* 801D1C24 001CEC24  38 A0 00 00 */	li r5, 0
/* 801D1C28 001CEC28  38 C0 00 00 */	li r6, 0
/* 801D1C2C 001CEC2C  38 E0 00 01 */	li r7, 1
/* 801D1C30 001CEC30  39 00 00 00 */	li r8, 0
/* 801D1C34 001CEC34  48 0E 0F B1 */	bl GXSetTevColorOp
/* 801D1C38 001CEC38  38 60 00 01 */	li r3, 1
/* 801D1C3C 001CEC3C  38 80 00 00 */	li r4, 0
/* 801D1C40 001CEC40  38 A0 00 00 */	li r5, 0
/* 801D1C44 001CEC44  38 C0 00 00 */	li r6, 0
/* 801D1C48 001CEC48  38 E0 00 01 */	li r7, 1
/* 801D1C4C 001CEC4C  39 00 00 00 */	li r8, 0
/* 801D1C50 001CEC50  48 0E 0F FD */	bl GXSetTevAlphaOp
/* 801D1C54 001CEC54  38 60 00 01 */	li r3, 1
/* 801D1C58 001CEC58  38 80 00 0F */	li r4, 0xf
/* 801D1C5C 001CEC5C  38 A0 00 0F */	li r5, 0xf
/* 801D1C60 001CEC60  38 C0 00 0F */	li r6, 0xf
/* 801D1C64 001CEC64  38 E0 00 00 */	li r7, 0
/* 801D1C68 001CEC68  48 0E 0E F5 */	bl GXSetTevColorIn
/* 801D1C6C 001CEC6C  38 60 00 01 */	li r3, 1
/* 801D1C70 001CEC70  38 80 00 07 */	li r4, 7
/* 801D1C74 001CEC74  38 A0 00 01 */	li r5, 1
/* 801D1C78 001CEC78  38 C0 00 04 */	li r6, 4
/* 801D1C7C 001CEC7C  38 E0 00 07 */	li r7, 7
/* 801D1C80 001CEC80  48 0E 0F 21 */	bl GXSetTevAlphaIn
/* 801D1C84 001CEC84  38 6D C9 48 */	addi r3, r13, lbl_80413BA8@sda21
/* 801D1C88 001CEC88  80 82 1E 40 */	lwz r4, lbl_804231C0@sda21(r2)
/* 801D1C8C 001CEC8C  7C A3 EA 14 */	add r5, r3, r29
/* 801D1C90 001CEC90  7C E3 E8 AE */	lbzx r7, r3, r29
/* 801D1C94 001CEC94  90 81 00 08 */	stw r4, 8(r1)
/* 801D1C98 001CEC98  38 81 00 0C */	addi r4, r1, 0xc
/* 801D1C9C 001CEC9C  88 C5 00 01 */	lbz r6, 1(r5)
/* 801D1CA0 001CECA0  38 60 00 01 */	li r3, 1
/* 801D1CA4 001CECA4  80 1E 00 14 */	lwz r0, 0x14(r30)
/* 801D1CA8 001CECA8  88 A5 00 02 */	lbz r5, 2(r5)
/* 801D1CAC 001CECAC  98 E1 00 08 */	stb r7, 8(r1)
/* 801D1CB0 001CECB0  98 C1 00 09 */	stb r6, 9(r1)
/* 801D1CB4 001CECB4  98 A1 00 0A */	stb r5, 0xa(r1)
/* 801D1CB8 001CECB8  98 01 00 0B */	stb r0, 0xb(r1)
/* 801D1CBC 001CECBC  80 01 00 08 */	lwz r0, 8(r1)
/* 801D1CC0 001CECC0  90 01 00 0C */	stw r0, 0xc(r1)
/* 801D1CC4 001CECC4  48 0E 0F F1 */	bl GXSetTevColor
/* 801D1CC8 001CECC8  38 81 00 10 */	addi r4, r1, 0x10
/* 801D1CCC 001CECCC  38 60 00 28 */	li r3, 0x28
/* 801D1CD0 001CECD0  4B FF FB 75 */	bl effGetTexObjN64
/* 801D1CD4 001CECD4  38 61 00 10 */	addi r3, r1, 0x10
/* 801D1CD8 001CECD8  38 80 00 00 */	li r4, 0
/* 801D1CDC 001CECDC  48 0D FD A1 */	bl GXLoadTexObj
/* 801D1CE0 001CECE0  38 81 00 10 */	addi r4, r1, 0x10
/* 801D1CE4 001CECE4  38 60 00 29 */	li r3, 0x29
/* 801D1CE8 001CECE8  4B FF FB 5D */	bl effGetTexObjN64
/* 801D1CEC 001CECEC  38 61 00 10 */	addi r3, r1, 0x10
/* 801D1CF0 001CECF0  38 80 00 01 */	li r4, 1
/* 801D1CF4 001CECF4  48 0D FD 89 */	bl GXLoadTexObj
/* 801D1CF8 001CECF8  C0 3E 00 04 */	lfs f1, 4(r30)
/* 801D1CFC 001CECFC  38 61 00 90 */	addi r3, r1, 0x90
/* 801D1D00 001CED00  C0 5E 00 08 */	lfs f2, 8(r30)
/* 801D1D04 001CED04  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 801D1D08 001CED08  48 0C 67 25 */	bl PSMTXTrans
/* 801D1D0C 001CED0C  38 60 00 04 */	li r3, 4
/* 801D1D10 001CED10  4B E3 D4 41 */	bl camGetPtr
/* 801D1D14 001CED14  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 801D1D18 001CED18  38 61 00 60 */	addi r3, r1, 0x60
/* 801D1D1C 001CED1C  C0 02 E4 1C */	lfs f0, lbl_8041F79C@sda21(r2)
/* 801D1D20 001CED20  38 80 00 79 */	li r4, 0x79
/* 801D1D24 001CED24  FC 20 08 50 */	fneg f1, f1
/* 801D1D28 001CED28  EC 20 00 72 */	fmuls f1, f0, f1
/* 801D1D2C 001CED2C  48 0C 64 C1 */	bl PSMTXRotRad
/* 801D1D30 001CED30  38 61 00 90 */	addi r3, r1, 0x90
/* 801D1D34 001CED34  38 81 00 60 */	addi r4, r1, 0x60
/* 801D1D38 001CED38  7C 65 1B 78 */	mr r5, r3
/* 801D1D3C 001CED3C  48 0C 62 25 */	bl PSMTXConcat
/* 801D1D40 001CED40  C0 3E 00 10 */	lfs f1, 0x10(r30)
/* 801D1D44 001CED44  38 61 00 30 */	addi r3, r1, 0x30
/* 801D1D48 001CED48  C0 62 E4 18 */	lfs f3, lbl_8041F798@sda21(r2)
/* 801D1D4C 001CED4C  FC 40 08 90 */	fmr f2, f1
/* 801D1D50 001CED50  48 0C 67 5D */	bl PSMTXScale
/* 801D1D54 001CED54  38 61 00 90 */	addi r3, r1, 0x90
/* 801D1D58 001CED58  38 81 00 30 */	addi r4, r1, 0x30
/* 801D1D5C 001CED5C  7C 65 1B 78 */	mr r5, r3
/* 801D1D60 001CED60  48 0C 62 01 */	bl PSMTXConcat
/* 801D1D64 001CED64  38 81 00 90 */	addi r4, r1, 0x90
/* 801D1D68 001CED68  38 7F 01 1C */	addi r3, r31, 0x11c
/* 801D1D6C 001CED6C  7C 85 23 78 */	mr r5, r4
/* 801D1D70 001CED70  48 0C 61 F1 */	bl PSMTXConcat
/* 801D1D74 001CED74  38 61 00 90 */	addi r3, r1, 0x90
/* 801D1D78 001CED78  38 80 00 00 */	li r4, 0
/* 801D1D7C 001CED7C  48 0E 27 7D */	bl GXLoadPosMtxImm
/* 801D1D80 001CED80  38 60 00 00 */	li r3, 0
/* 801D1D84 001CED84  48 0E 28 15 */	bl GXSetCurrentMtx
/* 801D1D88 001CED88  38 60 00 00 */	li r3, 0
/* 801D1D8C 001CED8C  48 0D E0 FD */	bl GXSetCullMode
/* 801D1D90 001CED90  3C 60 80 3A */	lis r3, lbl_803A33A0@ha
/* 801D1D94 001CED94  38 63 33 A0 */	addi r3, r3, lbl_803A33A0@l
/* 801D1D98 001CED98  4B FF F9 19 */	bl effSetVtxDescN64
/* 801D1D9C 001CED9C  38 60 00 90 */	li r3, 0x90
/* 801D1DA0 001CEDA0  38 80 00 00 */	li r4, 0
/* 801D1DA4 001CEDA4  38 A0 00 06 */	li r5, 6
/* 801D1DA8 001CEDA8  48 0D DE C1 */	bl GXBegin
/* 801D1DAC 001CEDAC  38 60 00 00 */	li r3, 0
/* 801D1DB0 001CEDB0  38 80 00 01 */	li r4, 1
/* 801D1DB4 001CEDB4  38 A0 00 02 */	li r5, 2
/* 801D1DB8 001CEDB8  38 C0 00 00 */	li r6, 0
/* 801D1DBC 001CEDBC  38 E0 00 00 */	li r7, 0
/* 801D1DC0 001CEDC0  39 00 00 02 */	li r8, 2
/* 801D1DC4 001CEDC4  39 20 00 03 */	li r9, 3
/* 801D1DC8 001CEDC8  39 40 00 00 */	li r10, 0
/* 801D1DCC 001CEDCC  4B FF F8 69 */	bl tri2
/* 801D1DD0 001CEDD0  80 01 00 E4 */	lwz r0, 0xe4(r1)
/* 801D1DD4 001CEDD4  83 E1 00 DC */	lwz r31, 0xdc(r1)
/* 801D1DD8 001CEDD8  83 C1 00 D8 */	lwz r30, 0xd8(r1)
/* 801D1DDC 001CEDDC  83 A1 00 D4 */	lwz r29, 0xd4(r1)
/* 801D1DE0 001CEDE0  83 81 00 D0 */	lwz r28, 0xd0(r1)
/* 801D1DE4 001CEDE4  7C 08 03 A6 */	mtlr r0
/* 801D1DE8 001CEDE8  38 21 00 E0 */	addi r1, r1, 0xe0
/* 801D1DEC 001CEDEC  4E 80 00 20 */	blr 
effOnpuMain:
/* 801D1DF0 001CEDF0  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 801D1DF4 001CEDF4  7C 08 02 A6 */	mflr r0
/* 801D1DF8 001CEDF8  3C 80 80 30 */	lis r4, lbl_802FB200@ha
/* 801D1DFC 001CEDFC  90 01 00 44 */	stw r0, 0x44(r1)
/* 801D1E00 001CEE00  38 C4 B2 00 */	addi r6, r4, lbl_802FB200@l
/* 801D1E04 001CEE04  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 801D1E08 001CEE08  7C 7F 1B 78 */	mr r31, r3
/* 801D1E0C 001CEE0C  80 E3 00 0C */	lwz r7, 0xc(r3)
/* 801D1E10 001CEE10  80 A6 00 00 */	lwz r5, 0(r6)
/* 801D1E14 001CEE14  80 86 00 04 */	lwz r4, 4(r6)
/* 801D1E18 001CEE18  80 06 00 08 */	lwz r0, 8(r6)
/* 801D1E1C 001CEE1C  90 A1 00 08 */	stw r5, 8(r1)
/* 801D1E20 001CEE20  C0 07 00 04 */	lfs f0, 4(r7)
/* 801D1E24 001CEE24  90 81 00 0C */	stw r4, 0xc(r1)
/* 801D1E28 001CEE28  C0 27 00 08 */	lfs f1, 8(r7)
/* 801D1E2C 001CEE2C  D0 01 00 08 */	stfs f0, 8(r1)
/* 801D1E30 001CEE30  C0 07 00 0C */	lfs f0, 0xc(r7)
/* 801D1E34 001CEE34  90 01 00 10 */	stw r0, 0x10(r1)
/* 801D1E38 001CEE38  80 A1 00 08 */	lwz r5, 8(r1)
/* 801D1E3C 001CEE3C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801D1E40 001CEE40  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801D1E44 001CEE44  80 81 00 0C */	lwz r4, 0xc(r1)
/* 801D1E48 001CEE48  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801D1E4C 001CEE4C  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801D1E50 001CEE50  90 81 00 18 */	stw r4, 0x18(r1)
/* 801D1E54 001CEE54  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801D1E58 001CEE58  80 87 00 18 */	lwz r4, 0x18(r7)
/* 801D1E5C 001CEE5C  38 04 FF FF */	addi r0, r4, -1
/* 801D1E60 001CEE60  90 07 00 18 */	stw r0, 0x18(r7)
/* 801D1E64 001CEE64  80 87 00 1C */	lwz r4, 0x1c(r7)
/* 801D1E68 001CEE68  38 04 00 01 */	addi r0, r4, 1
/* 801D1E6C 001CEE6C  90 07 00 1C */	stw r0, 0x1c(r7)
/* 801D1E70 001CEE70  80 C7 00 18 */	lwz r6, 0x18(r7)
/* 801D1E74 001CEE74  2C 06 00 00 */	cmpwi r6, 0
/* 801D1E78 001CEE78  40 80 00 0C */	bge .L_801D1E84
/* 801D1E7C 001CEE7C  4B E8 BD 09 */	bl effDelete
/* 801D1E80 001CEE80  48 00 00 F0 */	b .L_801D1F70
.L_801D1E84:
/* 801D1E84 001CEE84  2C 06 00 05 */	cmpwi r6, 5
/* 801D1E88 001CEE88  40 81 00 6C */	ble .L_801D1EF4
/* 801D1E8C 001CEE8C  80 07 00 14 */	lwz r0, 0x14(r7)
/* 801D1E90 001CEE90  3C 60 43 30 */	lis r3, 0x4330
/* 801D1E94 001CEE94  3C A0 80 30 */	lis r5, lbl_802FB210@ha
/* 801D1E98 001CEE98  90 61 00 20 */	stw r3, 0x20(r1)
/* 801D1E9C 001CEE9C  20 80 00 FF */	subfic r4, r0, 0xff
/* 801D1EA0 001CEEA0  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D1EA4 001CEEA4  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 801D1EA8 001CEEA8  90 01 00 2C */	stw r0, 0x2c(r1)
/* 801D1EAC 001CEEAC  C8 65 B2 10 */	lfd f3, lbl_802FB210@l(r5)
/* 801D1EB0 001CEEB0  90 81 00 24 */	stw r4, 0x24(r1)
/* 801D1EB4 001CEEB4  C0 82 E4 20 */	lfs f4, lbl_8041F7A0@sda21(r2)
/* 801D1EB8 001CEEB8  90 61 00 28 */	stw r3, 0x28(r1)
/* 801D1EBC 001CEEBC  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801D1EC0 001CEEC0  C8 21 00 28 */	lfd f1, 0x28(r1)
/* 801D1EC4 001CEEC4  EC 40 18 28 */	fsubs f2, f0, f3
/* 801D1EC8 001CEEC8  C0 02 E4 24 */	lfs f0, lbl_8041F7A4@sda21(r2)
/* 801D1ECC 001CEECC  EC 21 18 28 */	fsubs f1, f1, f3
/* 801D1ED0 001CEED0  EC 24 08 BA */	fmadds f1, f4, f2, f1
/* 801D1ED4 001CEED4  FC 20 08 1E */	fctiwz f1, f1
/* 801D1ED8 001CEED8  D8 21 00 30 */	stfd f1, 0x30(r1)
/* 801D1EDC 001CEEDC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801D1EE0 001CEEE0  90 07 00 14 */	stw r0, 0x14(r7)
/* 801D1EE4 001CEEE4  C0 27 00 10 */	lfs f1, 0x10(r7)
/* 801D1EE8 001CEEE8  EC 00 08 28 */	fsubs f0, f0, f1
/* 801D1EEC 001CEEEC  EC 04 08 3A */	fmadds f0, f4, f0, f1
/* 801D1EF0 001CEEF0  D0 07 00 10 */	stfs f0, 0x10(r7)
.L_801D1EF4:
/* 801D1EF4 001CEEF4  2C 06 00 0A */	cmpwi r6, 0xa
/* 801D1EF8 001CEEF8  40 80 00 0C */	bge .L_801D1F04
/* 801D1EFC 001CEEFC  1C 06 00 19 */	mulli r0, r6, 0x19
/* 801D1F00 001CEF00  90 07 00 14 */	stw r0, 0x14(r7)
.L_801D1F04:
/* 801D1F04 001CEF04  C0 27 00 04 */	lfs f1, 4(r7)
/* 801D1F08 001CEF08  38 61 00 14 */	addi r3, r1, 0x14
/* 801D1F0C 001CEF0C  C0 07 00 24 */	lfs f0, 0x24(r7)
/* 801D1F10 001CEF10  C0 42 E4 28 */	lfs f2, lbl_8041F7A8@sda21(r2)
/* 801D1F14 001CEF14  EC 01 00 2A */	fadds f0, f1, f0
/* 801D1F18 001CEF18  D0 07 00 04 */	stfs f0, 4(r7)
/* 801D1F1C 001CEF1C  C0 27 00 08 */	lfs f1, 8(r7)
/* 801D1F20 001CEF20  C0 07 00 28 */	lfs f0, 0x28(r7)
/* 801D1F24 001CEF24  EC 01 00 2A */	fadds f0, f1, f0
/* 801D1F28 001CEF28  D0 07 00 08 */	stfs f0, 8(r7)
/* 801D1F2C 001CEF2C  C0 07 00 2C */	lfs f0, 0x2c(r7)
/* 801D1F30 001CEF30  C0 27 00 24 */	lfs f1, 0x24(r7)
/* 801D1F34 001CEF34  EC 00 08 28 */	fsubs f0, f0, f1
/* 801D1F38 001CEF38  EC 02 08 3A */	fmadds f0, f2, f0, f1
/* 801D1F3C 001CEF3C  D0 07 00 24 */	stfs f0, 0x24(r7)
/* 801D1F40 001CEF40  C0 07 00 30 */	lfs f0, 0x30(r7)
/* 801D1F44 001CEF44  C0 27 00 28 */	lfs f1, 0x28(r7)
/* 801D1F48 001CEF48  EC 00 08 28 */	fsubs f0, f0, f1
/* 801D1F4C 001CEF4C  EC 02 08 3A */	fmadds f0, f2, f0, f1
/* 801D1F50 001CEF50  D0 07 00 28 */	stfs f0, 0x28(r7)
/* 801D1F54 001CEF54  4B E3 E7 6D */	bl dispCalcZ
/* 801D1F58 001CEF58  3C 60 80 1D */	lis r3, effOnpuDisp@ha
/* 801D1F5C 001CEF5C  7F E6 FB 78 */	mr r6, r31
/* 801D1F60 001CEF60  38 A3 1A 18 */	addi r5, r3, effOnpuDisp@l
/* 801D1F64 001CEF64  38 80 00 02 */	li r4, 2
/* 801D1F68 001CEF68  38 60 00 04 */	li r3, 4
/* 801D1F6C 001CEF6C  4B E3 EA AD */	bl dispEntry
.L_801D1F70:
/* 801D1F70 001CEF70  80 01 00 44 */	lwz r0, 0x44(r1)
/* 801D1F74 001CEF74  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 801D1F78 001CEF78  7C 08 03 A6 */	mtlr r0
/* 801D1F7C 001CEF7C  38 21 00 40 */	addi r1, r1, 0x40
/* 801D1F80 001CEF80  4E 80 00 20 */	blr 

.global effOnpuN64Entry
effOnpuN64Entry:
/* 801D1F84 001CEF84  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 801D1F88 001CEF88  7C 08 02 A6 */	mflr r0
/* 801D1F8C 001CEF8C  90 01 00 64 */	stw r0, 0x64(r1)
/* 801D1F90 001CEF90  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 801D1F94 001CEF94  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 801D1F98 001CEF98  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 801D1F9C 001CEF9C  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 801D1FA0 001CEFA0  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 801D1FA4 001CEFA4  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 801D1FA8 001CEFA8  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801D1FAC 001CEFAC  93 C1 00 28 */	stw r30, 0x28(r1)
/* 801D1FB0 001CEFB0  93 A1 00 24 */	stw r29, 0x24(r1)
/* 801D1FB4 001CEFB4  FF A0 08 90 */	fmr f29, f1
/* 801D1FB8 001CEFB8  7C 7D 1B 78 */	mr r29, r3
/* 801D1FBC 001CEFBC  FF C0 10 90 */	fmr f30, f2
/* 801D1FC0 001CEFC0  FF E0 18 90 */	fmr f31, f3
/* 801D1FC4 001CEFC4  4B E8 BD F9 */	bl effEntry
/* 801D1FC8 001CEFC8  3C 80 80 30 */	lis r4, lbl_802FB218@ha
/* 801D1FCC 001CEFCC  7C 7E 1B 78 */	mr r30, r3
/* 801D1FD0 001CEFD0  38 84 B2 18 */	addi r4, r4, lbl_802FB218@l
/* 801D1FD4 001CEFD4  38 00 00 01 */	li r0, 1
/* 801D1FD8 001CEFD8  90 9E 00 14 */	stw r4, 0x14(r30)
/* 801D1FDC 001CEFDC  38 60 00 03 */	li r3, 3
/* 801D1FE0 001CEFE0  38 80 00 34 */	li r4, 0x34
/* 801D1FE4 001CEFE4  90 1E 00 08 */	stw r0, 8(r30)
/* 801D1FE8 001CEFE8  4B E5 DA A5 */	bl __memAlloc
/* 801D1FEC 001CEFEC  7C 7F 1B 78 */	mr r31, r3
/* 801D1FF0 001CEFF0  3C 60 80 1D */	lis r3, effOnpuMain@ha
/* 801D1FF4 001CEFF4  93 FE 00 0C */	stw r31, 0xc(r30)
/* 801D1FF8 001CEFF8  38 03 1D F0 */	addi r0, r3, effOnpuMain@l
/* 801D1FFC 001CEFFC  C0 02 E4 18 */	lfs f0, lbl_8041F798@sda21(r2)
/* 801D2000 001CF000  38 60 00 40 */	li r3, 0x40
/* 801D2004 001CF004  90 1E 00 10 */	stw r0, 0x10(r30)
/* 801D2008 001CF008  38 00 00 00 */	li r0, 0
/* 801D200C 001CF00C  93 BF 00 00 */	stw r29, 0(r31)
/* 801D2010 001CF010  D3 BF 00 04 */	stfs f29, 4(r31)
/* 801D2014 001CF014  D3 DF 00 08 */	stfs f30, 8(r31)
/* 801D2018 001CF018  D3 FF 00 0C */	stfs f31, 0xc(r31)
/* 801D201C 001CF01C  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 801D2020 001CF020  90 7F 00 18 */	stw r3, 0x18(r31)
/* 801D2024 001CF024  90 1F 00 14 */	stw r0, 0x14(r31)
/* 801D2028 001CF028  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 801D202C 001CF02C  48 09 43 49 */	bl rand
/* 801D2030 001CF030  3C 80 92 49 */	lis r4, 0x92492493@ha
/* 801D2034 001CF034  2C 1D 00 01 */	cmpwi r29, 1
/* 801D2038 001CF038  38 04 24 93 */	addi r0, r4, 0x92492493@l
/* 801D203C 001CF03C  7C 00 18 96 */	mulhw r0, r0, r3
/* 801D2040 001CF040  7C 00 1A 14 */	add r0, r0, r3
/* 801D2044 001CF044  7C 00 16 70 */	srawi r0, r0, 2
/* 801D2048 001CF048  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801D204C 001CF04C  7C 00 22 14 */	add r0, r0, r4
/* 801D2050 001CF050  1C 00 00 07 */	mulli r0, r0, 7
/* 801D2054 001CF054  7C 00 18 50 */	subf r0, r0, r3
/* 801D2058 001CF058  90 1F 00 20 */	stw r0, 0x20(r31)
/* 801D205C 001CF05C  41 82 00 30 */	beq .L_801D208C
/* 801D2060 001CF060  40 80 00 E4 */	bge .L_801D2144
/* 801D2064 001CF064  2C 1D 00 00 */	cmpwi r29, 0
/* 801D2068 001CF068  40 80 00 08 */	bge .L_801D2070
/* 801D206C 001CF06C  48 00 00 D8 */	b .L_801D2144
.L_801D2070:
/* 801D2070 001CF070  C0 22 E4 18 */	lfs f1, lbl_8041F798@sda21(r2)
/* 801D2074 001CF074  C0 02 E4 24 */	lfs f0, lbl_8041F7A4@sda21(r2)
/* 801D2078 001CF078  D0 3F 00 24 */	stfs f1, 0x24(r31)
/* 801D207C 001CF07C  D0 3F 00 2C */	stfs f1, 0x2c(r31)
/* 801D2080 001CF080  D0 1F 00 28 */	stfs f0, 0x28(r31)
/* 801D2084 001CF084  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 801D2088 001CF088  48 00 01 70 */	b .L_801D21F8
.L_801D208C:
/* 801D208C 001CF08C  48 09 42 E9 */	bl rand
/* 801D2090 001CF090  3C 80 2E 8C */	lis r4, 0x2E8BA2E9@ha
/* 801D2094 001CF094  3C 00 43 30 */	lis r0, 0x4330
/* 801D2098 001CF098  38 A4 A2 E9 */	addi r5, r4, 0x2E8BA2E9@l
/* 801D209C 001CF09C  90 01 00 08 */	stw r0, 8(r1)
/* 801D20A0 001CF0A0  7C A5 18 96 */	mulhw r5, r5, r3
/* 801D20A4 001CF0A4  3C 80 80 30 */	lis r4, lbl_802FB210@ha
/* 801D20A8 001CF0A8  C8 64 B2 10 */	lfd f3, lbl_802FB210@l(r4)
/* 801D20AC 001CF0AC  C0 22 E4 30 */	lfs f1, lbl_8041F7B0@sda21(r2)
/* 801D20B0 001CF0B0  C0 02 E4 2C */	lfs f0, lbl_8041F7AC@sda21(r2)
/* 801D20B4 001CF0B4  7C A0 0E 70 */	srawi r0, r5, 1
/* 801D20B8 001CF0B8  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801D20BC 001CF0BC  7C 00 22 14 */	add r0, r0, r4
/* 801D20C0 001CF0C0  1C 00 00 0B */	mulli r0, r0, 0xb
/* 801D20C4 001CF0C4  7C 00 18 50 */	subf r0, r0, r3
/* 801D20C8 001CF0C8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D20CC 001CF0CC  90 01 00 0C */	stw r0, 0xc(r1)
/* 801D20D0 001CF0D0  C8 41 00 08 */	lfd f2, 8(r1)
/* 801D20D4 001CF0D4  EC 42 18 28 */	fsubs f2, f2, f3
/* 801D20D8 001CF0D8  EC 01 00 BA */	fmadds f0, f1, f2, f0
/* 801D20DC 001CF0DC  D0 1F 00 24 */	stfs f0, 0x24(r31)
/* 801D20E0 001CF0E0  48 09 42 95 */	bl rand
/* 801D20E4 001CF0E4  3C 80 2E 8C */	lis r4, 0x2E8BA2E9@ha
/* 801D20E8 001CF0E8  3C 00 43 30 */	lis r0, 0x4330
/* 801D20EC 001CF0EC  38 A4 A2 E9 */	addi r5, r4, 0x2E8BA2E9@l
/* 801D20F0 001CF0F0  90 01 00 10 */	stw r0, 0x10(r1)
/* 801D20F4 001CF0F4  7C A5 18 96 */	mulhw r5, r5, r3
/* 801D20F8 001CF0F8  3C 80 80 30 */	lis r4, lbl_802FB210@ha
/* 801D20FC 001CF0FC  C8 84 B2 10 */	lfd f4, lbl_802FB210@l(r4)
/* 801D2100 001CF100  C0 42 E4 30 */	lfs f2, lbl_8041F7B0@sda21(r2)
/* 801D2104 001CF104  C0 22 E4 34 */	lfs f1, lbl_8041F7B4@sda21(r2)
/* 801D2108 001CF108  C0 02 E4 18 */	lfs f0, lbl_8041F798@sda21(r2)
/* 801D210C 001CF10C  7C A0 0E 70 */	srawi r0, r5, 1
/* 801D2110 001CF110  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801D2114 001CF114  7C 00 22 14 */	add r0, r0, r4
/* 801D2118 001CF118  1C 00 00 0B */	mulli r0, r0, 0xb
/* 801D211C 001CF11C  7C 00 18 50 */	subf r0, r0, r3
/* 801D2120 001CF120  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D2124 001CF124  90 01 00 14 */	stw r0, 0x14(r1)
/* 801D2128 001CF128  C8 61 00 10 */	lfd f3, 0x10(r1)
/* 801D212C 001CF12C  EC 63 20 28 */	fsubs f3, f3, f4
/* 801D2130 001CF130  EC 22 08 FA */	fmadds f1, f2, f3, f1
/* 801D2134 001CF134  D0 3F 00 28 */	stfs f1, 0x28(r31)
/* 801D2138 001CF138  D0 1F 00 2C */	stfs f0, 0x2c(r31)
/* 801D213C 001CF13C  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 801D2140 001CF140  48 00 00 B8 */	b .L_801D21F8
.L_801D2144:
/* 801D2144 001CF144  48 09 42 31 */	bl rand
/* 801D2148 001CF148  3C 80 2E 8C */	lis r4, 0x2E8BA2E9@ha
/* 801D214C 001CF14C  3C 00 43 30 */	lis r0, 0x4330
/* 801D2150 001CF150  38 A4 A2 E9 */	addi r5, r4, 0x2E8BA2E9@l
/* 801D2154 001CF154  90 01 00 10 */	stw r0, 0x10(r1)
/* 801D2158 001CF158  7C A5 18 96 */	mulhw r5, r5, r3
/* 801D215C 001CF15C  3C 80 80 30 */	lis r4, lbl_802FB210@ha
/* 801D2160 001CF160  C8 64 B2 10 */	lfd f3, lbl_802FB210@l(r4)
/* 801D2164 001CF164  C0 22 E4 30 */	lfs f1, lbl_8041F7B0@sda21(r2)
/* 801D2168 001CF168  C0 02 E4 38 */	lfs f0, lbl_8041F7B8@sda21(r2)
/* 801D216C 001CF16C  7C A0 0E 70 */	srawi r0, r5, 1
/* 801D2170 001CF170  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801D2174 001CF174  7C 00 22 14 */	add r0, r0, r4
/* 801D2178 001CF178  1C 00 00 0B */	mulli r0, r0, 0xb
/* 801D217C 001CF17C  7C 00 18 50 */	subf r0, r0, r3
/* 801D2180 001CF180  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D2184 001CF184  90 01 00 14 */	stw r0, 0x14(r1)
/* 801D2188 001CF188  C8 41 00 10 */	lfd f2, 0x10(r1)
/* 801D218C 001CF18C  EC 42 18 28 */	fsubs f2, f2, f3
/* 801D2190 001CF190  EC 01 00 BC */	fnmsubs f0, f1, f2, f0
/* 801D2194 001CF194  D0 1F 00 24 */	stfs f0, 0x24(r31)
/* 801D2198 001CF198  48 09 41 DD */	bl rand
/* 801D219C 001CF19C  3C 80 2E 8C */	lis r4, 0x2E8BA2E9@ha
/* 801D21A0 001CF1A0  3C 00 43 30 */	lis r0, 0x4330
/* 801D21A4 001CF1A4  38 A4 A2 E9 */	addi r5, r4, 0x2E8BA2E9@l
/* 801D21A8 001CF1A8  90 01 00 08 */	stw r0, 8(r1)
/* 801D21AC 001CF1AC  7C A5 18 96 */	mulhw r5, r5, r3
/* 801D21B0 001CF1B0  3C 80 80 30 */	lis r4, lbl_802FB210@ha
/* 801D21B4 001CF1B4  C8 84 B2 10 */	lfd f4, lbl_802FB210@l(r4)
/* 801D21B8 001CF1B8  C0 42 E4 30 */	lfs f2, lbl_8041F7B0@sda21(r2)
/* 801D21BC 001CF1BC  C0 22 E4 24 */	lfs f1, lbl_8041F7A4@sda21(r2)
/* 801D21C0 001CF1C0  C0 02 E4 18 */	lfs f0, lbl_8041F798@sda21(r2)
/* 801D21C4 001CF1C4  7C A0 0E 70 */	srawi r0, r5, 1
/* 801D21C8 001CF1C8  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801D21CC 001CF1CC  7C 00 22 14 */	add r0, r0, r4
/* 801D21D0 001CF1D0  1C 00 00 0B */	mulli r0, r0, 0xb
/* 801D21D4 001CF1D4  7C 00 18 50 */	subf r0, r0, r3
/* 801D21D8 001CF1D8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801D21DC 001CF1DC  90 01 00 0C */	stw r0, 0xc(r1)
/* 801D21E0 001CF1E0  C8 61 00 08 */	lfd f3, 8(r1)
/* 801D21E4 001CF1E4  EC 63 20 28 */	fsubs f3, f3, f4
/* 801D21E8 001CF1E8  EC 22 08 FA */	fmadds f1, f2, f3, f1
/* 801D21EC 001CF1EC  D0 3F 00 28 */	stfs f1, 0x28(r31)
/* 801D21F0 001CF1F0  D0 1F 00 2C */	stfs f0, 0x2c(r31)
/* 801D21F4 001CF1F4  D0 1F 00 30 */	stfs f0, 0x30(r31)
.L_801D21F8:
/* 801D21F8 001CF1F8  7F C3 F3 78 */	mr r3, r30
/* 801D21FC 001CF1FC  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 801D2200 001CF200  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 801D2204 001CF204  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 801D2208 001CF208  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 801D220C 001CF20C  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 801D2210 001CF210  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 801D2214 001CF214  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801D2218 001CF218  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 801D221C 001CF21C  80 01 00 64 */	lwz r0, 0x64(r1)
/* 801D2220 001CF220  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 801D2224 001CF224  7C 08 03 A6 */	mtlr r0
/* 801D2228 001CF228  38 21 00 60 */	addi r1, r1, 0x60
/* 801D222C 001CF22C  4E 80 00 20 */	blr 
