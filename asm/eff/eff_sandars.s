.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effSandarsDisp2
effSandarsDisp2:
/* 8023BAC0 00238AC0  94 21 FE D0 */	stwu r1, -0x130(r1)
/* 8023BAC4 00238AC4  7C 08 02 A6 */	mflr r0
/* 8023BAC8 00238AC8  90 01 01 34 */	stw r0, 0x134(r1)
/* 8023BACC 00238ACC  DB E1 01 20 */	stfd f31, 0x120(r1)
/* 8023BAD0 00238AD0  F3 E1 01 28 */	psq_st f31, 296(r1), 0, qr0
/* 8023BAD4 00238AD4  DB C1 01 10 */	stfd f30, 0x110(r1)
/* 8023BAD8 00238AD8  F3 C1 01 18 */	psq_st f30, 280(r1), 0, qr0
/* 8023BADC 00238ADC  DB A1 01 00 */	stfd f29, 0x100(r1)
/* 8023BAE0 00238AE0  F3 A1 01 08 */	psq_st f29, 264(r1), 0, qr0
/* 8023BAE4 00238AE4  93 E1 00 FC */	stw r31, 0xfc(r1)
/* 8023BAE8 00238AE8  93 C1 00 F8 */	stw r30, 0xf8(r1)
/* 8023BAEC 00238AEC  93 A1 00 F4 */	stw r29, 0xf4(r1)
/* 8023BAF0 00238AF0  93 81 00 F0 */	stw r28, 0xf0(r1)
/* 8023BAF4 00238AF4  7C 9C 23 78 */	mr r28, r4
/* 8023BAF8 00238AF8  7C 7D 1B 78 */	mr r29, r3
/* 8023BAFC 00238AFC  83 C4 00 0C */	lwz r30, 0xc(r4)
/* 8023BB00 00238B00  4B DD 36 51 */	bl camGetPtr
/* 8023BB04 00238B04  C0 3E 00 04 */	lfs f1, 4(r30)
/* 8023BB08 00238B08  7C 7F 1B 78 */	mr r31, r3
/* 8023BB0C 00238B0C  C0 5E 00 08 */	lfs f2, 8(r30)
/* 8023BB10 00238B10  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BB14 00238B14  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 8023BB18 00238B18  48 05 C9 15 */	bl PSMTXTrans
/* 8023BB1C 00238B1C  7F A3 EB 78 */	mr r3, r29
/* 8023BB20 00238B20  4B DD 36 31 */	bl camGetPtr
/* 8023BB24 00238B24  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8023BB28 00238B28  38 61 00 90 */	addi r3, r1, 0x90
/* 8023BB2C 00238B2C  C0 02 08 20 */	lfs f0, lbl_80421BA0@sda21(r2)
/* 8023BB30 00238B30  38 80 00 79 */	li r4, 0x79
/* 8023BB34 00238B34  FC 20 08 50 */	fneg f1, f1
/* 8023BB38 00238B38  EC 20 00 72 */	fmuls f1, f0, f1
/* 8023BB3C 00238B3C  48 05 C6 B1 */	bl PSMTXRotRad
/* 8023BB40 00238B40  C0 3E 00 10 */	lfs f1, 0x10(r30)
/* 8023BB44 00238B44  38 61 00 60 */	addi r3, r1, 0x60
/* 8023BB48 00238B48  FC 40 08 90 */	fmr f2, f1
/* 8023BB4C 00238B4C  FC 60 08 90 */	fmr f3, f1
/* 8023BB50 00238B50  48 05 C9 5D */	bl PSMTXScale
/* 8023BB54 00238B54  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BB58 00238B58  38 81 00 90 */	addi r4, r1, 0x90
/* 8023BB5C 00238B5C  7C 65 1B 78 */	mr r5, r3
/* 8023BB60 00238B60  48 05 C4 01 */	bl PSMTXConcat
/* 8023BB64 00238B64  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BB68 00238B68  38 81 00 60 */	addi r4, r1, 0x60
/* 8023BB6C 00238B6C  7C 65 1B 78 */	mr r5, r3
/* 8023BB70 00238B70  48 05 C3 F1 */	bl PSMTXConcat
/* 8023BB74 00238B74  38 7F 01 1C */	addi r3, r31, 0x11c
/* 8023BB78 00238B78  38 81 00 C0 */	addi r4, r1, 0xc0
/* 8023BB7C 00238B7C  38 A1 00 30 */	addi r5, r1, 0x30
/* 8023BB80 00238B80  48 05 C3 E1 */	bl PSMTXConcat
/* 8023BB84 00238B84  38 60 00 01 */	li r3, 1
/* 8023BB88 00238B88  48 07 55 B1 */	bl GXSetNumChans
/* 8023BB8C 00238B8C  38 60 00 04 */	li r3, 4
/* 8023BB90 00238B90  38 80 00 00 */	li r4, 0
/* 8023BB94 00238B94  38 A0 00 00 */	li r5, 0
/* 8023BB98 00238B98  38 C0 00 00 */	li r6, 0
/* 8023BB9C 00238B9C  38 E0 00 00 */	li r7, 0
/* 8023BBA0 00238BA0  39 00 00 00 */	li r8, 0
/* 8023BBA4 00238BA4  39 20 00 02 */	li r9, 2
/* 8023BBA8 00238BA8  48 07 55 CD */	bl GXSetChanCtrl
/* 8023BBAC 00238BAC  38 60 00 01 */	li r3, 1
/* 8023BBB0 00238BB0  48 07 36 D1 */	bl GXSetNumTexGens
/* 8023BBB4 00238BB4  38 60 00 00 */	li r3, 0
/* 8023BBB8 00238BB8  38 80 00 01 */	li r4, 1
/* 8023BBBC 00238BBC  38 A0 00 04 */	li r5, 4
/* 8023BBC0 00238BC0  38 C0 00 3C */	li r6, 0x3c
/* 8023BBC4 00238BC4  38 E0 00 00 */	li r7, 0
/* 8023BBC8 00238BC8  39 00 00 7D */	li r8, 0x7d
/* 8023BBCC 00238BCC  48 07 34 35 */	bl GXSetTexCoordGen2
/* 8023BBD0 00238BD0  38 60 00 01 */	li r3, 1
/* 8023BBD4 00238BD4  48 07 75 F5 */	bl GXSetNumTevStages
/* 8023BBD8 00238BD8  38 60 00 00 */	li r3, 0
/* 8023BBDC 00238BDC  38 80 00 00 */	li r4, 0
/* 8023BBE0 00238BE0  38 A0 00 00 */	li r5, 0
/* 8023BBE4 00238BE4  38 C0 00 04 */	li r6, 4
/* 8023BBE8 00238BE8  48 07 74 45 */	bl GXSetTevOrder
/* 8023BBEC 00238BEC  38 60 00 00 */	li r3, 0
/* 8023BBF0 00238BF0  38 80 00 00 */	li r4, 0
/* 8023BBF4 00238BF4  38 A0 00 00 */	li r5, 0
/* 8023BBF8 00238BF8  38 C0 00 00 */	li r6, 0
/* 8023BBFC 00238BFC  38 E0 00 01 */	li r7, 1
/* 8023BC00 00238C00  39 00 00 00 */	li r8, 0
/* 8023BC04 00238C04  48 07 6F E1 */	bl GXSetTevColorOp
/* 8023BC08 00238C08  38 60 00 00 */	li r3, 0
/* 8023BC0C 00238C0C  38 80 00 00 */	li r4, 0
/* 8023BC10 00238C10  38 A0 00 00 */	li r5, 0
/* 8023BC14 00238C14  38 C0 00 00 */	li r6, 0
/* 8023BC18 00238C18  38 E0 00 01 */	li r7, 1
/* 8023BC1C 00238C1C  39 00 00 00 */	li r8, 0
/* 8023BC20 00238C20  48 07 70 2D */	bl GXSetTevAlphaOp
/* 8023BC24 00238C24  38 60 00 00 */	li r3, 0
/* 8023BC28 00238C28  38 80 00 0F */	li r4, 0xf
/* 8023BC2C 00238C2C  38 A0 00 0F */	li r5, 0xf
/* 8023BC30 00238C30  38 C0 00 0F */	li r6, 0xf
/* 8023BC34 00238C34  38 E0 00 0A */	li r7, 0xa
/* 8023BC38 00238C38  48 07 6F 25 */	bl GXSetTevColorIn
/* 8023BC3C 00238C3C  38 60 00 00 */	li r3, 0
/* 8023BC40 00238C40  38 80 00 07 */	li r4, 7
/* 8023BC44 00238C44  38 A0 00 05 */	li r5, 5
/* 8023BC48 00238C48  38 C0 00 04 */	li r6, 4
/* 8023BC4C 00238C4C  38 E0 00 07 */	li r7, 7
/* 8023BC50 00238C50  48 07 6F 51 */	bl GXSetTevAlphaIn
/* 8023BC54 00238C54  38 81 00 10 */	addi r4, r1, 0x10
/* 8023BC58 00238C58  38 60 00 44 */	li r3, 0x44
/* 8023BC5C 00238C5C  4B E2 22 51 */	bl effGetTexObj
/* 8023BC60 00238C60  38 61 00 10 */	addi r3, r1, 0x10
/* 8023BC64 00238C64  38 80 00 00 */	li r4, 0
/* 8023BC68 00238C68  48 07 5E 15 */	bl GXLoadTexObj
/* 8023BC6C 00238C6C  38 60 00 00 */	li r3, 0
/* 8023BC70 00238C70  48 07 42 19 */	bl GXSetCullMode
/* 8023BC74 00238C74  48 07 2A A9 */	bl GXClearVtxDesc
/* 8023BC78 00238C78  38 60 00 09 */	li r3, 9
/* 8023BC7C 00238C7C  38 80 00 01 */	li r4, 1
/* 8023BC80 00238C80  48 07 21 85 */	bl GXSetVtxDesc
/* 8023BC84 00238C84  38 60 00 0D */	li r3, 0xd
/* 8023BC88 00238C88  38 80 00 01 */	li r4, 1
/* 8023BC8C 00238C8C  48 07 21 79 */	bl GXSetVtxDesc
/* 8023BC90 00238C90  38 60 00 00 */	li r3, 0
/* 8023BC94 00238C94  38 80 00 09 */	li r4, 9
/* 8023BC98 00238C98  38 A0 00 01 */	li r5, 1
/* 8023BC9C 00238C9C  38 C0 00 04 */	li r6, 4
/* 8023BCA0 00238CA0  38 E0 00 00 */	li r7, 0
/* 8023BCA4 00238CA4  48 07 2A B1 */	bl GXSetVtxAttrFmt
/* 8023BCA8 00238CA8  38 60 00 00 */	li r3, 0
/* 8023BCAC 00238CAC  38 80 00 0D */	li r4, 0xd
/* 8023BCB0 00238CB0  38 A0 00 01 */	li r5, 1
/* 8023BCB4 00238CB4  38 C0 00 04 */	li r6, 4
/* 8023BCB8 00238CB8  38 E0 00 00 */	li r7, 0
/* 8023BCBC 00238CBC  48 07 2A 99 */	bl GXSetVtxAttrFmt
/* 8023BCC0 00238CC0  C0 22 08 24 */	lfs f1, lbl_80421BA4@sda21(r2)
/* 8023BCC4 00238CC4  3B A0 00 01 */	li r29, 1
/* 8023BCC8 00238CC8  C0 02 08 28 */	lfs f0, lbl_80421BA8@sda21(r2)
/* 8023BCCC 00238CCC  3F E0 CC 01 */	lis r31, 0xcc01
/* 8023BCD0 00238CD0  FC 20 08 50 */	fneg f1, f1
/* 8023BCD4 00238CD4  C3 E2 08 20 */	lfs f31, lbl_80421BA0@sda21(r2)
/* 8023BCD8 00238CD8  C3 A2 08 2C */	lfs f29, lbl_80421BAC@sda21(r2)
/* 8023BCDC 00238CDC  3B DE 00 44 */	addi r30, r30, 0x44
/* 8023BCE0 00238CE0  EF C1 00 32 */	fmuls f30, f1, f0
/* 8023BCE4 00238CE4  48 00 01 48 */	b .L_8023BE2C
.L_8023BCE8:
/* 8023BCE8 00238CE8  C0 3E 00 04 */	lfs f1, 4(r30)
/* 8023BCEC 00238CEC  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BCF0 00238CF0  C0 5E 00 08 */	lfs f2, 8(r30)
/* 8023BCF4 00238CF4  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 8023BCF8 00238CF8  48 05 C7 35 */	bl PSMTXTrans
/* 8023BCFC 00238CFC  C0 1E 00 38 */	lfs f0, 0x38(r30)
/* 8023BD00 00238D00  38 61 00 90 */	addi r3, r1, 0x90
/* 8023BD04 00238D04  38 80 00 7A */	li r4, 0x7a
/* 8023BD08 00238D08  EC 3F 00 32 */	fmuls f1, f31, f0
/* 8023BD0C 00238D0C  48 05 C4 E1 */	bl PSMTXRotRad
/* 8023BD10 00238D10  C0 3E 00 10 */	lfs f1, 0x10(r30)
/* 8023BD14 00238D14  38 61 00 60 */	addi r3, r1, 0x60
/* 8023BD18 00238D18  C0 1E 00 2C */	lfs f0, 0x2c(r30)
/* 8023BD1C 00238D1C  EC 21 00 32 */	fmuls f1, f1, f0
/* 8023BD20 00238D20  FC 40 08 90 */	fmr f2, f1
/* 8023BD24 00238D24  FC 60 08 90 */	fmr f3, f1
/* 8023BD28 00238D28  48 05 C7 85 */	bl PSMTXScale
/* 8023BD2C 00238D2C  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BD30 00238D30  38 81 00 90 */	addi r4, r1, 0x90
/* 8023BD34 00238D34  7C 65 1B 78 */	mr r5, r3
/* 8023BD38 00238D38  48 05 C2 29 */	bl PSMTXConcat
/* 8023BD3C 00238D3C  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BD40 00238D40  38 81 00 60 */	addi r4, r1, 0x60
/* 8023BD44 00238D44  7C 65 1B 78 */	mr r5, r3
/* 8023BD48 00238D48  48 05 C2 19 */	bl PSMTXConcat
/* 8023BD4C 00238D4C  38 81 00 C0 */	addi r4, r1, 0xc0
/* 8023BD50 00238D50  38 61 00 30 */	addi r3, r1, 0x30
/* 8023BD54 00238D54  7C 85 23 78 */	mr r5, r4
/* 8023BD58 00238D58  48 05 C2 09 */	bl PSMTXConcat
/* 8023BD5C 00238D5C  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023BD60 00238D60  38 80 00 00 */	li r4, 0
/* 8023BD64 00238D64  48 07 87 95 */	bl GXLoadPosMtxImm
/* 8023BD68 00238D68  38 60 00 00 */	li r3, 0
/* 8023BD6C 00238D6C  48 07 88 2D */	bl GXSetCurrentMtx
/* 8023BD70 00238D70  80 A2 08 1C */	lwz r5, lbl_80421B9C@sda21(r2)
/* 8023BD74 00238D74  38 81 00 0C */	addi r4, r1, 0xc
/* 8023BD78 00238D78  80 1E 00 20 */	lwz r0, 0x20(r30)
/* 8023BD7C 00238D7C  38 60 00 04 */	li r3, 4
/* 8023BD80 00238D80  90 A1 00 08 */	stw r5, 8(r1)
/* 8023BD84 00238D84  98 01 00 0B */	stb r0, 0xb(r1)
/* 8023BD88 00238D88  80 01 00 08 */	lwz r0, 8(r1)
/* 8023BD8C 00238D8C  90 01 00 0C */	stw r0, 0xc(r1)
/* 8023BD90 00238D90  48 07 52 C1 */	bl GXSetChanMatColor
/* 8023BD94 00238D94  38 60 00 80 */	li r3, 0x80
/* 8023BD98 00238D98  38 80 00 00 */	li r4, 0
/* 8023BD9C 00238D9C  38 A0 00 04 */	li r5, 4
/* 8023BDA0 00238DA0  48 07 3E C9 */	bl GXBegin
/* 8023BDA4 00238DA4  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8023BDA8 00238DA8  3B BD 00 01 */	addi r29, r29, 1
/* 8023BDAC 00238DAC  3B DE 00 44 */	addi r30, r30, 0x44
/* 8023BDB0 00238DB0  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8023BDB4 00238DB4  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BDB8 00238DB8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDBC 00238DBC  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BDC0 00238DC0  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDC4 00238DC4  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BDC8 00238DC8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDCC 00238DCC  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8023BDD0 00238DD0  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8023BDD4 00238DD4  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BDD8 00238DD8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDDC 00238DDC  C0 02 08 34 */	lfs f0, lbl_80421BB4@sda21(r2)
/* 8023BDE0 00238DE0  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDE4 00238DE4  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BDE8 00238DE8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDEC 00238DEC  D3 BF 80 00 */	stfs f29, -0x8000(r31)
/* 8023BDF0 00238DF0  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8023BDF4 00238DF4  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BDF8 00238DF8  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BDFC 00238DFC  C0 02 08 34 */	lfs f0, lbl_80421BB4@sda21(r2)
/* 8023BE00 00238E00  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BE04 00238E04  C0 02 08 34 */	lfs f0, lbl_80421BB4@sda21(r2)
/* 8023BE08 00238E08  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BE0C 00238E0C  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8023BE10 00238E10  D3 DF 80 00 */	stfs f30, -0x8000(r31)
/* 8023BE14 00238E14  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BE18 00238E18  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BE1C 00238E1C  C0 02 08 30 */	lfs f0, lbl_80421BB0@sda21(r2)
/* 8023BE20 00238E20  D0 1F 80 00 */	stfs f0, -0x8000(r31)
/* 8023BE24 00238E24  C0 02 08 34 */	lfs f0, lbl_80421BB4@sda21(r2)
/* 8023BE28 00238E28  D0 1F 80 00 */	stfs f0, -0x8000(r31)
.L_8023BE2C:
/* 8023BE2C 00238E2C  80 1C 00 08 */	lwz r0, 8(r28)
/* 8023BE30 00238E30  7C 1D 00 00 */	cmpw r29, r0
/* 8023BE34 00238E34  41 80 FE B4 */	blt .L_8023BCE8
/* 8023BE38 00238E38  E3 E1 01 28 */	psq_l f31, 296(r1), 0, qr0
/* 8023BE3C 00238E3C  CB E1 01 20 */	lfd f31, 0x120(r1)
/* 8023BE40 00238E40  E3 C1 01 18 */	psq_l f30, 280(r1), 0, qr0
/* 8023BE44 00238E44  CB C1 01 10 */	lfd f30, 0x110(r1)
/* 8023BE48 00238E48  E3 A1 01 08 */	psq_l f29, 264(r1), 0, qr0
/* 8023BE4C 00238E4C  CB A1 01 00 */	lfd f29, 0x100(r1)
/* 8023BE50 00238E50  83 E1 00 FC */	lwz r31, 0xfc(r1)
/* 8023BE54 00238E54  83 C1 00 F8 */	lwz r30, 0xf8(r1)
/* 8023BE58 00238E58  83 A1 00 F4 */	lwz r29, 0xf4(r1)
/* 8023BE5C 00238E5C  80 01 01 34 */	lwz r0, 0x134(r1)
/* 8023BE60 00238E60  83 81 00 F0 */	lwz r28, 0xf0(r1)
/* 8023BE64 00238E64  7C 08 03 A6 */	mtlr r0
/* 8023BE68 00238E68  38 21 01 30 */	addi r1, r1, 0x130
/* 8023BE6C 00238E6C  4E 80 00 20 */	blr 
effSandarsDisp:
/* 8023BE70 00238E70  94 21 FF 20 */	stwu r1, -0xe0(r1)
/* 8023BE74 00238E74  7C 08 02 A6 */	mflr r0
/* 8023BE78 00238E78  90 01 00 E4 */	stw r0, 0xe4(r1)
/* 8023BE7C 00238E7C  93 E1 00 DC */	stw r31, 0xdc(r1)
/* 8023BE80 00238E80  93 C1 00 D8 */	stw r30, 0xd8(r1)
/* 8023BE84 00238E84  7C 7E 1B 78 */	mr r30, r3
/* 8023BE88 00238E88  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 8023BE8C 00238E8C  4B DD 32 C5 */	bl camGetPtr
/* 8023BE90 00238E90  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 8023BE94 00238E94  2C 00 FF FF */	cmpwi r0, -1
/* 8023BE98 00238E98  41 82 01 14 */	beq .L_8023BFAC
/* 8023BE9C 00238E9C  C0 3F 00 04 */	lfs f1, 4(r31)
/* 8023BEA0 00238EA0  38 61 00 A0 */	addi r3, r1, 0xa0
/* 8023BEA4 00238EA4  C0 5F 00 08 */	lfs f2, 8(r31)
/* 8023BEA8 00238EA8  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 8023BEAC 00238EAC  48 05 C5 81 */	bl PSMTXTrans
/* 8023BEB0 00238EB0  7F C3 F3 78 */	mr r3, r30
/* 8023BEB4 00238EB4  4B DD 32 9D */	bl camGetPtr
/* 8023BEB8 00238EB8  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8023BEBC 00238EBC  38 61 00 70 */	addi r3, r1, 0x70
/* 8023BEC0 00238EC0  C0 02 08 20 */	lfs f0, lbl_80421BA0@sda21(r2)
/* 8023BEC4 00238EC4  38 80 00 79 */	li r4, 0x79
/* 8023BEC8 00238EC8  FC 20 08 50 */	fneg f1, f1
/* 8023BECC 00238ECC  EC 20 00 72 */	fmuls f1, f0, f1
/* 8023BED0 00238ED0  48 05 C3 1D */	bl PSMTXRotRad
/* 8023BED4 00238ED4  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 8023BED8 00238ED8  38 61 00 40 */	addi r3, r1, 0x40
/* 8023BEDC 00238EDC  FC 40 08 90 */	fmr f2, f1
/* 8023BEE0 00238EE0  FC 60 08 90 */	fmr f3, f1
/* 8023BEE4 00238EE4  48 05 C5 C9 */	bl PSMTXScale
/* 8023BEE8 00238EE8  38 61 00 A0 */	addi r3, r1, 0xa0
/* 8023BEEC 00238EEC  38 81 00 70 */	addi r4, r1, 0x70
/* 8023BEF0 00238EF0  7C 65 1B 78 */	mr r5, r3
/* 8023BEF4 00238EF4  48 05 C0 6D */	bl PSMTXConcat
/* 8023BEF8 00238EF8  38 61 00 A0 */	addi r3, r1, 0xa0
/* 8023BEFC 00238EFC  38 81 00 40 */	addi r4, r1, 0x40
/* 8023BF00 00238F00  38 A1 00 10 */	addi r5, r1, 0x10
/* 8023BF04 00238F04  48 05 C0 5D */	bl PSMTXConcat
/* 8023BF08 00238F08  C0 3F 00 28 */	lfs f1, 0x28(r31)
/* 8023BF0C 00238F0C  38 61 00 40 */	addi r3, r1, 0x40
/* 8023BF10 00238F10  FC 40 08 90 */	fmr f2, f1
/* 8023BF14 00238F14  FC 60 08 90 */	fmr f3, f1
/* 8023BF18 00238F18  48 05 C5 95 */	bl PSMTXScale
/* 8023BF1C 00238F1C  38 61 00 10 */	addi r3, r1, 0x10
/* 8023BF20 00238F20  38 81 00 40 */	addi r4, r1, 0x40
/* 8023BF24 00238F24  7C 65 1B 78 */	mr r5, r3
/* 8023BF28 00238F28  48 05 C0 39 */	bl PSMTXConcat
/* 8023BF2C 00238F2C  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023BF30 00238F30  38 80 00 40 */	li r4, 0x40
/* 8023BF34 00238F34  4B E0 41 61 */	bl animPoseSetMaterialFlagOn
/* 8023BF38 00238F38  80 62 08 18 */	lwz r3, lbl_80421B98@sda21(r2)
/* 8023BF3C 00238F3C  38 81 00 0C */	addi r4, r1, 0xc
/* 8023BF40 00238F40  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 8023BF44 00238F44  90 61 00 08 */	stw r3, 8(r1)
/* 8023BF48 00238F48  98 01 00 0B */	stb r0, 0xb(r1)
/* 8023BF4C 00238F4C  80 01 00 08 */	lwz r0, 8(r1)
/* 8023BF50 00238F50  90 01 00 0C */	stw r0, 0xc(r1)
/* 8023BF54 00238F54  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023BF58 00238F58  4B E0 40 C1 */	bl animPoseSetMaterialEvtColor
/* 8023BF5C 00238F5C  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023BF60 00238F60  4B E0 27 31 */	bl animPoseMain
/* 8023BF64 00238F64  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023BF68 00238F68  38 81 00 10 */	addi r4, r1, 0x10
/* 8023BF6C 00238F6C  C0 22 08 30 */	lfs f1, lbl_80421BB0@sda21(r2)
/* 8023BF70 00238F70  38 A0 00 01 */	li r5, 1
/* 8023BF74 00238F74  C0 42 08 38 */	lfs f2, lbl_80421BB8@sda21(r2)
/* 8023BF78 00238F78  4B DF EE C5 */	bl animPoseDrawMtx
/* 8023BF7C 00238F7C  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023BF80 00238F80  38 81 00 10 */	addi r4, r1, 0x10
/* 8023BF84 00238F84  C0 22 08 30 */	lfs f1, lbl_80421BB0@sda21(r2)
/* 8023BF88 00238F88  38 A0 00 02 */	li r5, 2
/* 8023BF8C 00238F8C  C0 42 08 38 */	lfs f2, lbl_80421BB8@sda21(r2)
/* 8023BF90 00238F90  4B DF EE AD */	bl animPoseDrawMtx
/* 8023BF94 00238F94  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023BF98 00238F98  38 81 00 10 */	addi r4, r1, 0x10
/* 8023BF9C 00238F9C  C0 22 08 30 */	lfs f1, lbl_80421BB0@sda21(r2)
/* 8023BFA0 00238FA0  38 A0 00 03 */	li r5, 3
/* 8023BFA4 00238FA4  C0 42 08 38 */	lfs f2, lbl_80421BB8@sda21(r2)
/* 8023BFA8 00238FA8  4B DF EE 95 */	bl animPoseDrawMtx
.L_8023BFAC:
/* 8023BFAC 00238FAC  80 01 00 E4 */	lwz r0, 0xe4(r1)
/* 8023BFB0 00238FB0  83 E1 00 DC */	lwz r31, 0xdc(r1)
/* 8023BFB4 00238FB4  83 C1 00 D8 */	lwz r30, 0xd8(r1)
/* 8023BFB8 00238FB8  7C 08 03 A6 */	mtlr r0
/* 8023BFBC 00238FBC  38 21 00 E0 */	addi r1, r1, 0xe0
/* 8023BFC0 00238FC0  4E 80 00 20 */	blr 
effSandarsMain:
/* 8023BFC4 00238FC4  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8023BFC8 00238FC8  7C 08 02 A6 */	mflr r0
/* 8023BFCC 00238FCC  3C 80 80 30 */	lis r4, lbl_80300138@ha
/* 8023BFD0 00238FD0  90 01 00 44 */	stw r0, 0x44(r1)
/* 8023BFD4 00238FD4  38 C4 01 38 */	addi r6, r4, lbl_80300138@l
/* 8023BFD8 00238FD8  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 8023BFDC 00238FDC  93 C1 00 38 */	stw r30, 0x38(r1)
/* 8023BFE0 00238FE0  93 A1 00 34 */	stw r29, 0x34(r1)
/* 8023BFE4 00238FE4  7C 7D 1B 78 */	mr r29, r3
/* 8023BFE8 00238FE8  93 81 00 30 */	stw r28, 0x30(r1)
/* 8023BFEC 00238FEC  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 8023BFF0 00238FF0  80 A6 00 00 */	lwz r5, 0(r6)
/* 8023BFF4 00238FF4  80 86 00 04 */	lwz r4, 4(r6)
/* 8023BFF8 00238FF8  80 06 00 08 */	lwz r0, 8(r6)
/* 8023BFFC 00238FFC  90 A1 00 08 */	stw r5, 8(r1)
/* 8023C000 00239000  C0 3F 00 04 */	lfs f1, 4(r31)
/* 8023C004 00239004  90 81 00 0C */	stw r4, 0xc(r1)
/* 8023C008 00239008  C0 5F 00 08 */	lfs f2, 8(r31)
/* 8023C00C 0023900C  D0 21 00 08 */	stfs f1, 8(r1)
/* 8023C010 00239010  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 8023C014 00239014  90 01 00 10 */	stw r0, 0x10(r1)
/* 8023C018 00239018  80 C1 00 08 */	lwz r6, 8(r1)
/* 8023C01C 0023901C  D0 41 00 0C */	stfs f2, 0xc(r1)
/* 8023C020 00239020  80 AD 90 B0 */	lwz r5, gp@sda21(r13)
/* 8023C024 00239024  D0 61 00 10 */	stfs f3, 0x10(r1)
/* 8023C028 00239028  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8023C02C 0023902C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8023C030 00239030  90 C1 00 14 */	stw r6, 0x14(r1)
/* 8023C034 00239034  90 81 00 18 */	stw r4, 0x18(r1)
/* 8023C038 00239038  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8023C03C 0023903C  80 83 00 00 */	lwz r4, 0(r3)
/* 8023C040 00239040  80 C5 00 14 */	lwz r6, 0x14(r5)
/* 8023C044 00239044  54 80 07 7B */	rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 8023C048 00239048  80 FF 00 00 */	lwz r7, 0(r31)
/* 8023C04C 0023904C  7C A6 00 D0 */	neg r5, r6
/* 8023C050 00239050  83 DF 00 40 */	lwz r30, 0x40(r31)
/* 8023C054 00239054  7C A5 33 78 */	or r5, r5, r6
/* 8023C058 00239058  54 BC 0F FE */	srwi r28, r5, 0x1f
/* 8023C05C 0023905C  41 82 00 28 */	beq .L_8023C084
/* 8023C060 00239060  54 80 07 B8 */	rlwinm r0, r4, 0, 0x1e, 0x1c
/* 8023C064 00239064  90 1D 00 00 */	stw r0, 0(r29)
/* 8023C068 00239068  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023C06C 0023906C  2C 03 FF FF */	cmpwi r3, -1
/* 8023C070 00239070  41 82 00 08 */	beq .L_8023C078
/* 8023C074 00239074  4B DF EB C1 */	bl animPoseRelease
.L_8023C078:
/* 8023C078 00239078  7F A3 EB 78 */	mr r3, r29
/* 8023C07C 0023907C  4B E2 1B 09 */	bl effDelete
/* 8023C080 00239080  48 00 02 00 */	b .L_8023C280
.L_8023C084:
/* 8023C084 00239084  2C 07 00 05 */	cmpwi r7, 5
/* 8023C088 00239088  41 82 00 08 */	beq .L_8023C090
/* 8023C08C 0023908C  48 00 00 D8 */	b .L_8023C164
.L_8023C090:
/* 8023C090 00239090  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 8023C094 00239094  38 04 FF FF */	addi r0, r4, -1
/* 8023C098 00239098  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8023C09C 0023909C  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 8023C0A0 002390A0  2C 00 00 00 */	cmpwi r0, 0
/* 8023C0A4 002390A4  40 80 00 0C */	bge .L_8023C0B0
/* 8023C0A8 002390A8  4B E2 1A DD */	bl effDelete
/* 8023C0AC 002390AC  48 00 01 D4 */	b .L_8023C280
.L_8023C0B0:
/* 8023C0B0 002390B0  38 A0 00 01 */	li r5, 1
/* 8023C0B4 002390B4  3B FF 00 44 */	addi r31, r31, 0x44
/* 8023C0B8 002390B8  48 00 00 7C */	b .L_8023C134
.L_8023C0BC:
/* 8023C0BC 002390BC  80 7F 00 34 */	lwz r3, 0x34(r31)
/* 8023C0C0 002390C0  2C 03 00 00 */	cmpwi r3, 0
/* 8023C0C4 002390C4  41 82 00 10 */	beq .L_8023C0D4
/* 8023C0C8 002390C8  38 03 FF FF */	addi r0, r3, -1
/* 8023C0CC 002390CC  90 1F 00 34 */	stw r0, 0x34(r31)
/* 8023C0D0 002390D0  48 00 00 5C */	b .L_8023C12C
.L_8023C0D4:
/* 8023C0D4 002390D4  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 8023C0D8 002390D8  28 04 00 0F */	cmplwi r4, 0xf
/* 8023C0DC 002390DC  40 80 00 34 */	bge .L_8023C110
/* 8023C0E0 002390E0  38 6D 07 40 */	addi r3, r13, lbl_804179A0@sda21
/* 8023C0E4 002390E4  3C 00 43 30 */	lis r0, 0x4330
/* 8023C0E8 002390E8  7C 83 20 AE */	lbzx r4, r3, r4
/* 8023C0EC 002390EC  3C 60 80 30 */	lis r3, lbl_80300158@ha
/* 8023C0F0 002390F0  90 01 00 20 */	stw r0, 0x20(r1)
/* 8023C0F4 002390F4  C8 43 01 58 */	lfd f2, lbl_80300158@l(r3)
/* 8023C0F8 002390F8  90 81 00 24 */	stw r4, 0x24(r1)
/* 8023C0FC 002390FC  C0 02 08 3C */	lfs f0, lbl_80421BBC@sda21(r2)
/* 8023C100 00239100  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 8023C104 00239104  EC 21 10 28 */	fsubs f1, f1, f2
/* 8023C108 00239108  EC 01 00 24 */	fdivs f0, f1, f0
/* 8023C10C 0023910C  D0 1F 00 10 */	stfs f0, 0x10(r31)
.L_8023C110:
/* 8023C110 00239110  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 8023C114 00239114  38 03 00 01 */	addi r0, r3, 1
/* 8023C118 00239118  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8023C11C 0023911C  C0 3F 00 38 */	lfs f1, 0x38(r31)
/* 8023C120 00239120  C0 1F 00 3C */	lfs f0, 0x3c(r31)
/* 8023C124 00239124  EC 01 00 2A */	fadds f0, f1, f0
/* 8023C128 00239128  D0 1F 00 38 */	stfs f0, 0x38(r31)
.L_8023C12C:
/* 8023C12C 0023912C  38 A5 00 01 */	addi r5, r5, 1
/* 8023C130 00239130  3B FF 00 44 */	addi r31, r31, 0x44
.L_8023C134:
/* 8023C134 00239134  80 1D 00 08 */	lwz r0, 8(r29)
/* 8023C138 00239138  7C 05 00 00 */	cmpw r5, r0
/* 8023C13C 0023913C  41 80 FF 80 */	blt .L_8023C0BC
/* 8023C140 00239140  38 61 00 14 */	addi r3, r1, 0x14
/* 8023C144 00239144  4B DD 45 7D */	bl dispCalcZ
/* 8023C148 00239148  3C 80 80 24 */	lis r4, effSandarsDisp2@ha
/* 8023C14C 0023914C  7F C3 F3 78 */	mr r3, r30
/* 8023C150 00239150  38 A4 BA C0 */	addi r5, r4, effSandarsDisp2@l
/* 8023C154 00239154  7F A6 EB 78 */	mr r6, r29
/* 8023C158 00239158  38 80 00 02 */	li r4, 2
/* 8023C15C 0023915C  4B DD 48 BD */	bl dispEntry
/* 8023C160 00239160  48 00 01 20 */	b .L_8023C280
.L_8023C164:
/* 8023C164 00239164  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 8023C168 00239168  2C 00 00 01 */	cmpwi r0, 1
/* 8023C16C 0023916C  41 82 00 48 */	beq .L_8023C1B4
/* 8023C170 00239170  40 80 00 10 */	bge .L_8023C180
/* 8023C174 00239174  2C 00 00 00 */	cmpwi r0, 0
/* 8023C178 00239178  40 80 00 14 */	bge .L_8023C18C
/* 8023C17C 0023917C  48 00 00 E4 */	b .L_8023C260
.L_8023C180:
/* 8023C180 00239180  2C 00 00 03 */	cmpwi r0, 3
/* 8023C184 00239184  40 80 00 DC */	bge .L_8023C260
/* 8023C188 00239188  48 00 00 A4 */	b .L_8023C22C
.L_8023C18C:
/* 8023C18C 0023918C  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 8023C190 00239190  4B F6 E9 1D */	bl effBombN64Entry
/* 8023C194 00239194  7F C4 F3 78 */	mr r4, r30
/* 8023C198 00239198  4B F6 EA C9 */	bl effBombN64SetCamId
/* 8023C19C 0023919C  38 00 00 00 */	li r0, 0
/* 8023C1A0 002391A0  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8023C1A4 002391A4  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8023C1A8 002391A8  38 03 00 01 */	addi r0, r3, 1
/* 8023C1AC 002391AC  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8023C1B0 002391B0  48 00 00 B0 */	b .L_8023C260
.L_8023C1B4:
/* 8023C1B4 002391B4  2C 07 00 03 */	cmpwi r7, 3
/* 8023C1B8 002391B8  40 80 00 0C */	bge .L_8023C1C4
/* 8023C1BC 002391BC  4B E2 19 C9 */	bl effDelete
/* 8023C1C0 002391C0  48 00 00 C0 */	b .L_8023C280
.L_8023C1C4:
/* 8023C1C4 002391C4  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 8023C1C8 002391C8  2C 03 00 00 */	cmpwi r3, 0
/* 8023C1CC 002391CC  41 82 00 10 */	beq .L_8023C1DC
/* 8023C1D0 002391D0  38 03 FF FF */	addi r0, r3, -1
/* 8023C1D4 002391D4  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8023C1D8 002391D8  48 00 00 88 */	b .L_8023C260
.L_8023C1DC:
/* 8023C1DC 002391DC  3C 60 80 30 */	lis r3, lbl_80300144@ha
/* 8023C1E0 002391E0  7F 84 E3 78 */	mr r4, r28
/* 8023C1E4 002391E4  38 63 01 44 */	addi r3, r3, lbl_80300144@l
/* 8023C1E8 002391E8  38 A0 00 00 */	li r5, 0
/* 8023C1EC 002391EC  4B DF D4 85 */	bl animGroupBaseAsync
/* 8023C1F0 002391F0  2C 03 00 00 */	cmpwi r3, 0
/* 8023C1F4 002391F4  41 82 00 6C */	beq .L_8023C260
/* 8023C1F8 002391F8  3C 60 80 30 */	lis r3, lbl_80300144@ha
/* 8023C1FC 002391FC  7F 84 E3 78 */	mr r4, r28
/* 8023C200 00239200  38 63 01 44 */	addi r3, r3, lbl_80300144@l
/* 8023C204 00239204  4B E0 4E CD */	bl animPoseEntry
/* 8023C208 00239208  90 7F 00 1C */	stw r3, 0x1c(r31)
/* 8023C20C 0023920C  38 82 08 40 */	addi r4, r2, lbl_80421BC0@sda21
/* 8023C210 00239210  38 A0 00 01 */	li r5, 1
/* 8023C214 00239214  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023C218 00239218  4B E0 48 BD */	bl animPoseSetAnim
/* 8023C21C 0023921C  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8023C220 00239220  38 03 00 01 */	addi r0, r3, 1
/* 8023C224 00239224  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8023C228 00239228  48 00 00 38 */	b .L_8023C260
.L_8023C22C:
/* 8023C22C 0023922C  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 8023C230 00239230  38 03 FF F8 */	addi r0, r3, -8
/* 8023C234 00239234  90 1F 00 20 */	stw r0, 0x20(r31)
/* 8023C238 00239238  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 8023C23C 0023923C  2C 00 00 00 */	cmpwi r0, 0
/* 8023C240 00239240  40 80 00 20 */	bge .L_8023C260
/* 8023C244 00239244  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 8023C248 00239248  4B DF E9 ED */	bl animPoseRelease
/* 8023C24C 0023924C  38 00 FF FF */	li r0, -1
/* 8023C250 00239250  7F A3 EB 78 */	mr r3, r29
/* 8023C254 00239254  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8023C258 00239258  4B E2 19 2D */	bl effDelete
/* 8023C25C 0023925C  48 00 00 24 */	b .L_8023C280
.L_8023C260:
/* 8023C260 00239260  38 61 00 14 */	addi r3, r1, 0x14
/* 8023C264 00239264  4B DD 44 5D */	bl dispCalcZ
/* 8023C268 00239268  3C 80 80 24 */	lis r4, effSandarsDisp@ha
/* 8023C26C 0023926C  7F C3 F3 78 */	mr r3, r30
/* 8023C270 00239270  38 A4 BE 70 */	addi r5, r4, effSandarsDisp@l
/* 8023C274 00239274  7F A6 EB 78 */	mr r6, r29
/* 8023C278 00239278  38 80 00 02 */	li r4, 2
/* 8023C27C 0023927C  4B DD 47 9D */	bl dispEntry
.L_8023C280:
/* 8023C280 00239280  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8023C284 00239284  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 8023C288 00239288  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 8023C28C 0023928C  83 A1 00 34 */	lwz r29, 0x34(r1)
/* 8023C290 00239290  83 81 00 30 */	lwz r28, 0x30(r1)
/* 8023C294 00239294  7C 08 03 A6 */	mtlr r0
/* 8023C298 00239298  38 21 00 40 */	addi r1, r1, 0x40
/* 8023C29C 0023929C  4E 80 00 20 */	blr 

.global effSandarsEntry
effSandarsEntry:
/* 8023C2A0 002392A0  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 8023C2A4 002392A4  7C 08 02 A6 */	mflr r0
/* 8023C2A8 002392A8  90 01 00 A4 */	stw r0, 0xa4(r1)
/* 8023C2AC 002392AC  DB E1 00 90 */	stfd f31, 0x90(r1)
/* 8023C2B0 002392B0  F3 E1 00 98 */	psq_st f31, 152(r1), 0, qr0
/* 8023C2B4 002392B4  DB C1 00 80 */	stfd f30, 0x80(r1)
/* 8023C2B8 002392B8  F3 C1 00 88 */	psq_st f30, 136(r1), 0, qr0
/* 8023C2BC 002392BC  DB A1 00 70 */	stfd f29, 0x70(r1)
/* 8023C2C0 002392C0  F3 A1 00 78 */	psq_st f29, 120(r1), 0, qr0
/* 8023C2C4 002392C4  DB 81 00 60 */	stfd f28, 0x60(r1)
/* 8023C2C8 002392C8  F3 81 00 68 */	psq_st f28, 104(r1), 0, qr0
/* 8023C2CC 002392CC  DB 61 00 50 */	stfd f27, 0x50(r1)
/* 8023C2D0 002392D0  F3 61 00 58 */	psq_st f27, 88(r1), 0, qr0
/* 8023C2D4 002392D4  BF 61 00 3C */	stmw r27, 0x3c(r1)
/* 8023C2D8 002392D8  FF C0 08 90 */	fmr f30, f1
/* 8023C2DC 002392DC  7C 7C 1B 78 */	mr r28, r3
/* 8023C2E0 002392E0  FF A0 10 90 */	fmr f29, f2
/* 8023C2E4 002392E4  FF 80 18 90 */	fmr f28, f3
/* 8023C2E8 002392E8  FF 60 20 90 */	fmr f27, f4
/* 8023C2EC 002392EC  4B E2 1A D1 */	bl effEntry
/* 8023C2F0 002392F0  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 8023C2F4 002392F4  2C 1C 00 05 */	cmpwi r28, 5
/* 8023C2F8 002392F8  38 A0 00 01 */	li r5, 1
/* 8023C2FC 002392FC  7C 7E 1B 78 */	mr r30, r3
/* 8023C300 00239300  80 84 00 14 */	lwz r4, 0x14(r4)
/* 8023C304 00239304  7C 04 00 D0 */	neg r0, r4
/* 8023C308 00239308  7C 00 23 78 */	or r0, r0, r4
/* 8023C30C 0023930C  54 1D 0F FE */	srwi r29, r0, 0x1f
/* 8023C310 00239310  40 82 00 08 */	bne .L_8023C318
/* 8023C314 00239314  38 A0 00 06 */	li r5, 6
.L_8023C318:
/* 8023C318 00239318  3C 80 80 30 */	lis r4, lbl_80300160@ha
/* 8023C31C 0023931C  38 60 00 03 */	li r3, 3
/* 8023C320 00239320  38 04 01 60 */	addi r0, r4, lbl_80300160@l
/* 8023C324 00239324  90 1E 00 14 */	stw r0, 0x14(r30)
/* 8023C328 00239328  1C 85 00 44 */	mulli r4, r5, 0x44
/* 8023C32C 0023932C  90 BE 00 08 */	stw r5, 8(r30)
/* 8023C330 00239330  4B DF 37 5D */	bl __memAlloc
/* 8023C334 00239334  7C 7F 1B 78 */	mr r31, r3
/* 8023C338 00239338  3C 60 80 24 */	lis r3, effSandarsMain@ha
/* 8023C33C 0023933C  93 FE 00 0C */	stw r31, 0xc(r30)
/* 8023C340 00239340  38 03 BF C4 */	addi r0, r3, effSandarsMain@l
/* 8023C344 00239344  C0 02 08 34 */	lfs f0, lbl_80421BB4@sda21(r2)
/* 8023C348 00239348  38 80 00 00 */	li r4, 0
/* 8023C34C 0023934C  90 1E 00 10 */	stw r0, 0x10(r30)
/* 8023C350 00239350  38 60 FF FF */	li r3, -1
/* 8023C354 00239354  2C 1C 00 04 */	cmpwi r28, 4
/* 8023C358 00239358  38 00 00 04 */	li r0, 4
/* 8023C35C 0023935C  80 BE 00 00 */	lwz r5, 0(r30)
/* 8023C360 00239360  60 A5 00 02 */	ori r5, r5, 2
/* 8023C364 00239364  90 BE 00 00 */	stw r5, 0(r30)
/* 8023C368 00239368  93 9F 00 00 */	stw r28, 0(r31)
/* 8023C36C 0023936C  D3 DF 00 04 */	stfs f30, 4(r31)
/* 8023C370 00239370  D3 BF 00 08 */	stfs f29, 8(r31)
/* 8023C374 00239374  D3 9F 00 0C */	stfs f28, 0xc(r31)
/* 8023C378 00239378  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 8023C37C 0023937C  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8023C380 00239380  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8023C384 00239384  90 7F 00 1C */	stw r3, 0x1c(r31)
/* 8023C388 00239388  90 1F 00 40 */	stw r0, 0x40(r31)
/* 8023C38C 0023938C  41 82 00 24 */	beq .L_8023C3B0
/* 8023C390 00239390  40 80 00 14 */	bge .L_8023C3A4
/* 8023C394 00239394  2C 1C 00 00 */	cmpwi r28, 0
/* 8023C398 00239398  41 82 00 18 */	beq .L_8023C3B0
/* 8023C39C 0023939C  40 80 00 28 */	bge .L_8023C3C4
/* 8023C3A0 002393A0  48 00 00 44 */	b .L_8023C3E4
.L_8023C3A4:
/* 8023C3A4 002393A4  2C 1C 00 06 */	cmpwi r28, 6
/* 8023C3A8 002393A8  40 80 00 3C */	bge .L_8023C3E4
/* 8023C3AC 002393AC  48 00 00 2C */	b .L_8023C3D8
.L_8023C3B0:
/* 8023C3B0 002393B0  38 00 00 01 */	li r0, 1
/* 8023C3B4 002393B4  C0 02 08 34 */	lfs f0, lbl_80421BB4@sda21(r2)
/* 8023C3B8 002393B8  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8023C3BC 002393BC  D0 1F 00 28 */	stfs f0, 0x28(r31)
/* 8023C3C0 002393C0  48 00 00 24 */	b .L_8023C3E4
.L_8023C3C4:
/* 8023C3C4 002393C4  38 00 00 02 */	li r0, 2
/* 8023C3C8 002393C8  C0 02 08 38 */	lfs f0, lbl_80421BB8@sda21(r2)
/* 8023C3CC 002393CC  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8023C3D0 002393D0  D0 1F 00 28 */	stfs f0, 0x28(r31)
/* 8023C3D4 002393D4  48 00 00 10 */	b .L_8023C3E4
.L_8023C3D8:
/* 8023C3D8 002393D8  38 00 00 64 */	li r0, 0x64
/* 8023C3DC 002393DC  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8023C3E0 002393E0  D3 7F 00 30 */	stfs f27, 0x30(r31)
.L_8023C3E4:
/* 8023C3E4 002393E4  80 1F 00 00 */	lwz r0, 0(r31)
/* 8023C3E8 002393E8  2C 00 00 03 */	cmpwi r0, 3
/* 8023C3EC 002393EC  41 82 00 0C */	beq .L_8023C3F8
/* 8023C3F0 002393F0  2C 00 00 04 */	cmpwi r0, 4
/* 8023C3F4 002393F4  40 82 00 28 */	bne .L_8023C41C
.L_8023C3F8:
/* 8023C3F8 002393F8  3C 60 80 30 */	lis r3, lbl_80300144@ha
/* 8023C3FC 002393FC  7F A4 EB 78 */	mr r4, r29
/* 8023C400 00239400  38 63 01 44 */	addi r3, r3, lbl_80300144@l
/* 8023C404 00239404  38 A0 00 00 */	li r5, 0
/* 8023C408 00239408  4B DF D2 69 */	bl animGroupBaseAsync
/* 8023C40C 0023940C  38 60 FF FF */	li r3, -1
/* 8023C410 00239410  38 00 00 FF */	li r0, 0xff
/* 8023C414 00239414  90 7F 00 1C */	stw r3, 0x1c(r31)
/* 8023C418 00239418  90 1F 00 20 */	stw r0, 0x20(r31)
.L_8023C41C:
/* 8023C41C 0023941C  C0 22 08 44 */	lfs f1, lbl_80421BC4@sda21(r2)
/* 8023C420 00239420  3C 60 80 30 */	lis r3, lbl_80300168@ha
/* 8023C424 00239424  C0 02 08 48 */	lfs f0, lbl_80421BC8@sda21(r2)
/* 8023C428 00239428  3B FF 00 44 */	addi r31, r31, 0x44
/* 8023C42C 0023942C  EC 21 06 F2 */	fmuls f1, f1, f27
/* 8023C430 00239430  CB E3 01 68 */	lfd f31, lbl_80300168@l(r3)
/* 8023C434 00239434  C3 62 08 30 */	lfs f27, lbl_80421BB0@sda21(r2)
/* 8023C438 00239438  3B 60 00 01 */	li r27, 1
/* 8023C43C 0023943C  C3 82 08 4C */	lfs f28, lbl_80421BCC@sda21(r2)
/* 8023C440 00239440  3B A0 00 0A */	li r29, 0xa
/* 8023C444 00239444  EF C1 00 24 */	fdivs f30, f1, f0
/* 8023C448 00239448  C3 A2 08 50 */	lfs f29, lbl_80421BD0@sda21(r2)
/* 8023C44C 0023944C  3F 80 43 30 */	lis r28, 0x4330
/* 8023C450 00239450  48 00 00 EC */	b .L_8023C53C
.L_8023C454:
/* 8023C454 00239454  FC 20 F0 90 */	fmr f1, f30
/* 8023C458 00239458  48 02 FA 39 */	bl cos
/* 8023C45C 0023945C  6F A0 80 00 */	xoris r0, r29, 0x8000
/* 8023C460 00239460  FC 40 08 18 */	frsp f2, f1
/* 8023C464 00239464  90 01 00 0C */	stw r0, 0xc(r1)
/* 8023C468 00239468  FC 20 F0 90 */	fmr f1, f30
/* 8023C46C 0023946C  93 81 00 08 */	stw r28, 8(r1)
/* 8023C470 00239470  C8 01 00 08 */	lfd f0, 8(r1)
/* 8023C474 00239474  EC 00 F8 28 */	fsubs f0, f0, f31
/* 8023C478 00239478  EC 00 00 B2 */	fmuls f0, f0, f2
/* 8023C47C 0023947C  D0 1F 00 04 */	stfs f0, 4(r31)
/* 8023C480 00239480  48 02 FF 79 */	bl sin
/* 8023C484 00239484  6F A0 80 00 */	xoris r0, r29, 0x8000
/* 8023C488 00239488  6F 64 80 00 */	xoris r4, r27, 0x8000
/* 8023C48C 0023948C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8023C490 00239490  38 1B FF FF */	addi r0, r27, -1
/* 8023C494 00239494  FC 40 08 18 */	frsp f2, f1
/* 8023C498 00239498  1C 60 00 05 */	mulli r3, r0, 5
/* 8023C49C 0023949C  93 81 00 10 */	stw r28, 0x10(r1)
/* 8023C4A0 002394A0  38 00 00 00 */	li r0, 0
/* 8023C4A4 002394A4  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8023C4A8 002394A8  90 81 00 24 */	stw r4, 0x24(r1)
/* 8023C4AC 002394AC  EC 20 F8 28 */	fsubs f1, f0, f31
/* 8023C4B0 002394B0  93 81 00 20 */	stw r28, 0x20(r1)
/* 8023C4B4 002394B4  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 8023C4B8 002394B8  EC 41 00 B2 */	fmuls f2, f1, f2
/* 8023C4BC 002394BC  90 81 00 1C */	stw r4, 0x1c(r1)
/* 8023C4C0 002394C0  EC 00 F8 28 */	fsubs f0, f0, f31
/* 8023C4C4 002394C4  93 81 00 18 */	stw r28, 0x18(r1)
/* 8023C4C8 002394C8  C8 21 00 18 */	lfd f1, 0x18(r1)
/* 8023C4CC 002394CC  EC 1D 00 32 */	fmuls f0, f29, f0
/* 8023C4D0 002394D0  D0 5F 00 08 */	stfs f2, 8(r31)
/* 8023C4D4 002394D4  EC 21 F8 28 */	fsubs f1, f1, f31
/* 8023C4D8 002394D8  FC 00 00 1E */	fctiwz f0, f0
/* 8023C4DC 002394DC  D3 7F 00 0C */	stfs f27, 0xc(r31)
/* 8023C4E0 002394E0  EC 3C 00 72 */	fmuls f1, f28, f1
/* 8023C4E4 002394E4  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 8023C4E8 002394E8  D0 3F 00 2C */	stfs f1, 0x2c(r31)
/* 8023C4EC 002394EC  80 81 00 2C */	lwz r4, 0x2c(r1)
/* 8023C4F0 002394F0  D3 7F 00 10 */	stfs f27, 0x10(r31)
/* 8023C4F4 002394F4  90 9F 00 20 */	stw r4, 0x20(r31)
/* 8023C4F8 002394F8  90 7F 00 34 */	stw r3, 0x34(r31)
/* 8023C4FC 002394FC  90 1F 00 18 */	stw r0, 0x18(r31)
/* 8023C500 00239500  D3 7F 00 38 */	stfs f27, 0x38(r31)
/* 8023C504 00239504  D3 7F 00 3C */	stfs f27, 0x3c(r31)
/* 8023C508 00239508  80 7E 00 08 */	lwz r3, 8(r30)
/* 8023C50C 0023950C  38 03 FF FF */	addi r0, r3, -1
/* 8023C510 00239510  7C 1B 00 00 */	cmpw r27, r0
/* 8023C514 00239514  40 82 00 1C */	bne .L_8023C530
/* 8023C518 00239518  C0 22 08 54 */	lfs f1, lbl_80421BD4@sda21(r2)
/* 8023C51C 0023951C  38 00 00 CC */	li r0, 0xcc
/* 8023C520 00239520  C0 02 08 58 */	lfs f0, lbl_80421BD8@sda21(r2)
/* 8023C524 00239524  D0 3F 00 2C */	stfs f1, 0x2c(r31)
/* 8023C528 00239528  90 1F 00 20 */	stw r0, 0x20(r31)
/* 8023C52C 0023952C  D0 1F 00 3C */	stfs f0, 0x3c(r31)
.L_8023C530:
/* 8023C530 00239530  3B BD 00 0A */	addi r29, r29, 0xa
/* 8023C534 00239534  3B 7B 00 01 */	addi r27, r27, 1
/* 8023C538 00239538  3B FF 00 44 */	addi r31, r31, 0x44
.L_8023C53C:
/* 8023C53C 0023953C  80 1E 00 08 */	lwz r0, 8(r30)
/* 8023C540 00239540  7C 1B 00 00 */	cmpw r27, r0
/* 8023C544 00239544  41 80 FF 10 */	blt .L_8023C454
/* 8023C548 00239548  7F C3 F3 78 */	mr r3, r30
/* 8023C54C 0023954C  E3 E1 00 98 */	psq_l f31, 152(r1), 0, qr0
/* 8023C550 00239550  CB E1 00 90 */	lfd f31, 0x90(r1)
/* 8023C554 00239554  E3 C1 00 88 */	psq_l f30, 136(r1), 0, qr0
/* 8023C558 00239558  CB C1 00 80 */	lfd f30, 0x80(r1)
/* 8023C55C 0023955C  E3 A1 00 78 */	psq_l f29, 120(r1), 0, qr0
/* 8023C560 00239560  CB A1 00 70 */	lfd f29, 0x70(r1)
/* 8023C564 00239564  E3 81 00 68 */	psq_l f28, 104(r1), 0, qr0
/* 8023C568 00239568  CB 81 00 60 */	lfd f28, 0x60(r1)
/* 8023C56C 0023956C  E3 61 00 58 */	psq_l f27, 88(r1), 0, qr0
/* 8023C570 00239570  CB 61 00 50 */	lfd f27, 0x50(r1)
/* 8023C574 00239574  BB 61 00 3C */	lmw r27, 0x3c(r1)
/* 8023C578 00239578  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 8023C57C 0023957C  7C 08 03 A6 */	mtlr r0
/* 8023C580 00239580  38 21 00 A0 */	addi r1, r1, 0xa0
/* 8023C584 00239584  4E 80 00 20 */	blr 
