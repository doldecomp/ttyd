.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effUranokoDisp
effUranokoDisp:
/* 80250AC8 0024DAC8  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 80250ACC 0024DACC  7C 08 02 A6 */	mflr r0
/* 80250AD0 0024DAD0  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 80250AD4 0024DAD4  93 E1 00 AC */	stw r31, 0xac(r1)
/* 80250AD8 0024DAD8  93 C1 00 A8 */	stw r30, 0xa8(r1)
/* 80250ADC 0024DADC  7C 7E 1B 78 */	mr r30, r3
/* 80250AE0 0024DAE0  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 80250AE4 0024DAE4  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 80250AE8 0024DAE8  2C 00 FF FF */	cmpwi r0, -1
/* 80250AEC 0024DAEC  41 82 00 F8 */	beq lbl_80250BE4
/* 80250AF0 0024DAF0  C0 3F 00 04 */	lfs f1, 4(r31)
/* 80250AF4 0024DAF4  38 61 00 70 */	addi r3, r1, 0x70
/* 80250AF8 0024DAF8  C0 5F 00 08 */	lfs f2, 8(r31)
/* 80250AFC 0024DAFC  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 80250B00 0024DB00  48 04 79 2D */	bl PSMTXTrans
/* 80250B04 0024DB04  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80250B08 0024DB08  38 61 00 40 */	addi r3, r1, 0x40
/* 80250B0C 0024DB0C  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 80250B10 0024DB10  EC 21 00 32 */	fmuls f1, f1, f0
/* 80250B14 0024DB14  FC 40 08 90 */	fmr f2, f1
/* 80250B18 0024DB18  FC 60 08 90 */	fmr f3, f1
/* 80250B1C 0024DB1C  48 04 79 91 */	bl PSMTXScale
/* 80250B20 0024DB20  7F C3 F3 78 */	mr r3, r30
/* 80250B24 0024DB24  4B DB E6 2D */	bl camGetPtr
/* 80250B28 0024DB28  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 80250B2C 0024DB2C  38 61 00 10 */	addi r3, r1, 0x10
/* 80250B30 0024DB30  C0 02 0F 9C */	lfs f0, lbl_8042231C-_SDA2_BASE_(r2)
/* 80250B34 0024DB34  38 80 00 79 */	li r4, 0x79
/* 80250B38 0024DB38  FC 20 08 50 */	fneg f1, f1
/* 80250B3C 0024DB3C  EC 20 00 72 */	fmuls f1, f0, f1
/* 80250B40 0024DB40  48 04 76 AD */	bl PSMTXRotRad
/* 80250B44 0024DB44  38 61 00 70 */	addi r3, r1, 0x70
/* 80250B48 0024DB48  38 81 00 10 */	addi r4, r1, 0x10
/* 80250B4C 0024DB4C  7C 65 1B 78 */	mr r5, r3
/* 80250B50 0024DB50  48 04 74 11 */	bl PSMTXConcat
/* 80250B54 0024DB54  38 61 00 70 */	addi r3, r1, 0x70
/* 80250B58 0024DB58  38 81 00 40 */	addi r4, r1, 0x40
/* 80250B5C 0024DB5C  7C 65 1B 78 */	mr r5, r3
/* 80250B60 0024DB60  48 04 74 01 */	bl PSMTXConcat
/* 80250B64 0024DB64  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250B68 0024DB68  38 80 00 40 */	li r4, 0x40
/* 80250B6C 0024DB6C  4B DE F5 29 */	bl animPoseSetMaterialFlagOn
/* 80250B70 0024DB70  80 62 0F 98 */	lwz r3, lbl_80422318-_SDA2_BASE_(r2)
/* 80250B74 0024DB74  38 81 00 0C */	addi r4, r1, 0xc
/* 80250B78 0024DB78  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 80250B7C 0024DB7C  90 61 00 08 */	stw r3, 8(r1)
/* 80250B80 0024DB80  98 01 00 0B */	stb r0, 0xb(r1)
/* 80250B84 0024DB84  80 01 00 08 */	lwz r0, 8(r1)
/* 80250B88 0024DB88  90 01 00 0C */	stw r0, 0xc(r1)
/* 80250B8C 0024DB8C  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250B90 0024DB90  4B DE F4 89 */	bl animPoseSetMaterialEvtColor
/* 80250B94 0024DB94  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250B98 0024DB98  4B DE DA F9 */	bl animPoseMain
/* 80250B9C 0024DB9C  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250BA0 0024DBA0  38 81 00 70 */	addi r4, r1, 0x70
/* 80250BA4 0024DBA4  C0 22 0F A0 */	lfs f1, lbl_80422320-_SDA2_BASE_(r2)
/* 80250BA8 0024DBA8  38 A0 00 01 */	li r5, 1
/* 80250BAC 0024DBAC  C0 42 0F A4 */	lfs f2, lbl_80422324-_SDA2_BASE_(r2)
/* 80250BB0 0024DBB0  4B DE A2 8D */	bl animPoseDrawMtx
/* 80250BB4 0024DBB4  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250BB8 0024DBB8  38 81 00 70 */	addi r4, r1, 0x70
/* 80250BBC 0024DBBC  C0 22 0F A0 */	lfs f1, lbl_80422320-_SDA2_BASE_(r2)
/* 80250BC0 0024DBC0  38 A0 00 02 */	li r5, 2
/* 80250BC4 0024DBC4  C0 42 0F A4 */	lfs f2, lbl_80422324-_SDA2_BASE_(r2)
/* 80250BC8 0024DBC8  4B DE A2 75 */	bl animPoseDrawMtx
/* 80250BCC 0024DBCC  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250BD0 0024DBD0  38 81 00 70 */	addi r4, r1, 0x70
/* 80250BD4 0024DBD4  C0 22 0F A0 */	lfs f1, lbl_80422320-_SDA2_BASE_(r2)
/* 80250BD8 0024DBD8  38 A0 00 03 */	li r5, 3
/* 80250BDC 0024DBDC  C0 42 0F A4 */	lfs f2, lbl_80422324-_SDA2_BASE_(r2)
/* 80250BE0 0024DBE0  4B DE A2 5D */	bl animPoseDrawMtx
lbl_80250BE4:
/* 80250BE4 0024DBE4  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 80250BE8 0024DBE8  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 80250BEC 0024DBEC  83 C1 00 A8 */	lwz r30, 0xa8(r1)
/* 80250BF0 0024DBF0  7C 08 03 A6 */	mtlr r0
/* 80250BF4 0024DBF4  38 21 00 B0 */	addi r1, r1, 0xb0
/* 80250BF8 0024DBF8  4E 80 00 20 */	blr 
effUranokoMain:
/* 80250BFC 0024DBFC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80250C00 0024DC00  7C 08 02 A6 */	mflr r0
/* 80250C04 0024DC04  3C 80 80 30 */	lis r4, lbl_80301390@ha
/* 80250C08 0024DC08  90 01 00 34 */	stw r0, 0x34(r1)
/* 80250C0C 0024DC0C  38 C4 13 90 */	addi r6, r4, lbl_80301390@l
/* 80250C10 0024DC10  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80250C14 0024DC14  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80250C18 0024DC18  7C 7E 1B 78 */	mr r30, r3
/* 80250C1C 0024DC1C  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80250C20 0024DC20  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 80250C24 0024DC24  3C 60 80 30 */	lis r3, lbl_8030139C@ha
/* 80250C28 0024DC28  80 A6 00 00 */	lwz r5, 0(r6)
/* 80250C2C 0024DC2C  38 63 13 9C */	addi r3, r3, lbl_8030139C@l
/* 80250C30 0024DC30  80 86 00 04 */	lwz r4, 4(r6)
/* 80250C34 0024DC34  80 06 00 08 */	lwz r0, 8(r6)
/* 80250C38 0024DC38  90 A1 00 08 */	stw r5, 8(r1)
/* 80250C3C 0024DC3C  38 A0 00 00 */	li r5, 0
/* 80250C40 0024DC40  C0 1F 00 04 */	lfs f0, 4(r31)
/* 80250C44 0024DC44  90 81 00 0C */	stw r4, 0xc(r1)
/* 80250C48 0024DC48  C0 3F 00 08 */	lfs f1, 8(r31)
/* 80250C4C 0024DC4C  D0 01 00 08 */	stfs f0, 8(r1)
/* 80250C50 0024DC50  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 80250C54 0024DC54  90 01 00 10 */	stw r0, 0x10(r1)
/* 80250C58 0024DC58  80 E1 00 08 */	lwz r7, 8(r1)
/* 80250C5C 0024DC5C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 80250C60 0024DC60  80 8D 90 B0 */	lwz r4, gp-_SDA_BASE_(r13)
/* 80250C64 0024DC64  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80250C68 0024DC68  80 C1 00 0C */	lwz r6, 0xc(r1)
/* 80250C6C 0024DC6C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80250C70 0024DC70  90 E1 00 14 */	stw r7, 0x14(r1)
/* 80250C74 0024DC74  90 C1 00 18 */	stw r6, 0x18(r1)
/* 80250C78 0024DC78  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80250C7C 0024DC7C  80 84 00 14 */	lwz r4, 0x14(r4)
/* 80250C80 0024DC80  7C 04 00 D0 */	neg r0, r4
/* 80250C84 0024DC84  7C 00 23 78 */	or r0, r0, r4
/* 80250C88 0024DC88  54 1D 0F FE */	srwi r29, r0, 0x1f
/* 80250C8C 0024DC8C  7F A4 EB 78 */	mr r4, r29
/* 80250C90 0024DC90  4B DE 89 E1 */	bl animGroupBaseAsync
/* 80250C94 0024DC94  2C 03 00 00 */	cmpwi r3, 0
/* 80250C98 0024DC98  41 82 00 E4 */	beq lbl_80250D7C
/* 80250C9C 0024DC9C  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 80250CA0 0024DCA0  2C 00 FF FF */	cmpwi r0, -1
/* 80250CA4 0024DCA4  40 82 00 28 */	bne lbl_80250CCC
/* 80250CA8 0024DCA8  3C 60 80 30 */	lis r3, lbl_8030139C@ha
/* 80250CAC 0024DCAC  7F A4 EB 78 */	mr r4, r29
/* 80250CB0 0024DCB0  38 63 13 9C */	addi r3, r3, lbl_8030139C@l
/* 80250CB4 0024DCB4  4B DF 04 1D */	bl animPoseEntry
/* 80250CB8 0024DCB8  90 7F 00 20 */	stw r3, 0x20(r31)
/* 80250CBC 0024DCBC  38 82 0F A8 */	addi r4, r2, lbl_80422328-_SDA2_BASE_
/* 80250CC0 0024DCC0  38 A0 00 01 */	li r5, 1
/* 80250CC4 0024DCC4  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250CC8 0024DCC8  4B DE FE 0D */	bl animPoseSetAnim
lbl_80250CCC:
/* 80250CCC 0024DCCC  80 7E 00 00 */	lwz r3, 0(r30)
/* 80250CD0 0024DCD0  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 80250CD4 0024DCD4  41 82 00 14 */	beq lbl_80250CE8
/* 80250CD8 0024DCD8  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 80250CDC 0024DCDC  38 00 00 10 */	li r0, 0x10
/* 80250CE0 0024DCE0  90 7E 00 00 */	stw r3, 0(r30)
/* 80250CE4 0024DCE4  90 1F 00 1C */	stw r0, 0x1c(r31)
lbl_80250CE8:
/* 80250CE8 0024DCE8  80 7F 00 1C */	lwz r3, 0x1c(r31)
/* 80250CEC 0024DCEC  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 80250CF0 0024DCF0  40 80 00 0C */	bge lbl_80250CFC
/* 80250CF4 0024DCF4  38 03 FF FF */	addi r0, r3, -1
/* 80250CF8 0024DCF8  90 1F 00 1C */	stw r0, 0x1c(r31)
lbl_80250CFC:
/* 80250CFC 0024DCFC  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 80250D00 0024DD00  2C 00 00 10 */	cmpwi r0, 0x10
/* 80250D04 0024DD04  40 80 00 0C */	bge lbl_80250D10
/* 80250D08 0024DD08  54 00 20 36 */	slwi r0, r0, 4
/* 80250D0C 0024DD0C  90 1F 00 24 */	stw r0, 0x24(r31)
lbl_80250D10:
/* 80250D10 0024DD10  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 80250D14 0024DD14  2C 00 00 00 */	cmpwi r0, 0
/* 80250D18 0024DD18  40 80 00 20 */	bge lbl_80250D38
/* 80250D1C 0024DD1C  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80250D20 0024DD20  2C 03 FF FF */	cmpwi r3, -1
/* 80250D24 0024DD24  41 82 00 08 */	beq lbl_80250D2C
/* 80250D28 0024DD28  4B DE 9F 0D */	bl animPoseRelease
lbl_80250D2C:
/* 80250D2C 0024DD2C  7F C3 F3 78 */	mr r3, r30
/* 80250D30 0024DD30  4B E0 CE 55 */	bl effDelete
/* 80250D34 0024DD34  48 00 00 48 */	b lbl_80250D7C
lbl_80250D38:
/* 80250D38 0024DD38  80 9F 00 18 */	lwz r4, 0x18(r31)
/* 80250D3C 0024DD3C  38 61 00 14 */	addi r3, r1, 0x14
/* 80250D40 0024DD40  C0 22 0F AC */	lfs f1, lbl_8042232C-_SDA2_BASE_(r2)
/* 80250D44 0024DD44  38 04 00 01 */	addi r0, r4, 1
/* 80250D48 0024DD48  C0 02 0F B0 */	lfs f0, lbl_80422330-_SDA2_BASE_(r2)
/* 80250D4C 0024DD4C  90 1F 00 18 */	stw r0, 0x18(r31)
/* 80250D50 0024DD50  C0 5F 00 10 */	lfs f2, 0x10(r31)
/* 80250D54 0024DD54  EC 21 10 28 */	fsubs f1, f1, f2
/* 80250D58 0024DD58  EC 01 10 3A */	fmadds f0, f1, f0, f2
/* 80250D5C 0024DD5C  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 80250D60 0024DD60  4B DB F9 61 */	bl dispCalcZ
/* 80250D64 0024DD64  3C 60 80 25 */	lis r3, effUranokoDisp@ha
/* 80250D68 0024DD68  7F C6 F3 78 */	mr r6, r30
/* 80250D6C 0024DD6C  38 A3 0A C8 */	addi r5, r3, effUranokoDisp@l
/* 80250D70 0024DD70  38 80 00 02 */	li r4, 2
/* 80250D74 0024DD74  38 60 00 04 */	li r3, 4
/* 80250D78 0024DD78  4B DB FC A1 */	bl dispEntry
lbl_80250D7C:
/* 80250D7C 0024DD7C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80250D80 0024DD80  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80250D84 0024DD84  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80250D88 0024DD88  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80250D8C 0024DD8C  7C 08 03 A6 */	mtlr r0
/* 80250D90 0024DD90  38 21 00 30 */	addi r1, r1, 0x30
/* 80250D94 0024DD94  4E 80 00 20 */	blr 

.global effUranokoEntry
effUranokoEntry:
/* 80250D98 0024DD98  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 80250D9C 0024DD9C  7C 08 02 A6 */	mflr r0
/* 80250DA0 0024DDA0  90 01 00 54 */	stw r0, 0x54(r1)
/* 80250DA4 0024DDA4  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 80250DA8 0024DDA8  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 80250DAC 0024DDAC  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 80250DB0 0024DDB0  F3 C1 00 38 */	psq_st f30, 56(r1), 0, qr0
/* 80250DB4 0024DDB4  DB A1 00 20 */	stfd f29, 0x20(r1)
/* 80250DB8 0024DDB8  F3 A1 00 28 */	psq_st f29, 40(r1), 0, qr0
/* 80250DBC 0024DDBC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80250DC0 0024DDC0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80250DC4 0024DDC4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80250DC8 0024DDC8  FF A0 08 90 */	fmr f29, f1
/* 80250DCC 0024DDCC  7C 7D 1B 78 */	mr r29, r3
/* 80250DD0 0024DDD0  FF C0 10 90 */	fmr f30, f2
/* 80250DD4 0024DDD4  7C 9E 23 78 */	mr r30, r4
/* 80250DD8 0024DDD8  FF E0 18 90 */	fmr f31, f3
/* 80250DDC 0024DDDC  4B E0 CF E1 */	bl effEntry
/* 80250DE0 0024DDE0  3C 80 80 30 */	lis r4, lbl_803013B0@ha
/* 80250DE4 0024DDE4  7C 7F 1B 78 */	mr r31, r3
/* 80250DE8 0024DDE8  38 84 13 B0 */	addi r4, r4, lbl_803013B0@l
/* 80250DEC 0024DDEC  38 00 00 01 */	li r0, 1
/* 80250DF0 0024DDF0  90 9F 00 14 */	stw r4, 0x14(r31)
/* 80250DF4 0024DDF4  38 60 00 03 */	li r3, 3
/* 80250DF8 0024DDF8  90 1F 00 08 */	stw r0, 8(r31)
/* 80250DFC 0024DDFC  80 1F 00 08 */	lwz r0, 8(r31)
/* 80250E00 0024DE00  1C 80 00 28 */	mulli r4, r0, 0x28
/* 80250E04 0024DE04  4B DD EC 89 */	bl __memAlloc
/* 80250E08 0024DE08  3C 80 80 25 */	lis r4, effUranokoMain@ha
/* 80250E0C 0024DE0C  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80250E10 0024DE10  38 04 0B FC */	addi r0, r4, effUranokoMain@l
/* 80250E14 0024DE14  C0 22 0F AC */	lfs f1, lbl_8042232C-_SDA2_BASE_(r2)
/* 80250E18 0024DE18  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80250E1C 0024DE1C  2C 1E 00 00 */	cmpwi r30, 0
/* 80250E20 0024DE20  C0 02 0F A0 */	lfs f0, lbl_80422320-_SDA2_BASE_(r2)
/* 80250E24 0024DE24  38 00 00 00 */	li r0, 0
/* 80250E28 0024DE28  80 9F 00 00 */	lwz r4, 0(r31)
/* 80250E2C 0024DE2C  60 84 00 02 */	ori r4, r4, 2
/* 80250E30 0024DE30  90 9F 00 00 */	stw r4, 0(r31)
/* 80250E34 0024DE34  93 A3 00 00 */	stw r29, 0(r3)
/* 80250E38 0024DE38  D3 A3 00 04 */	stfs f29, 4(r3)
/* 80250E3C 0024DE3C  D3 C3 00 08 */	stfs f30, 8(r3)
/* 80250E40 0024DE40  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 80250E44 0024DE44  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 80250E48 0024DE48  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 80250E4C 0024DE4C  90 03 00 18 */	stw r0, 0x18(r3)
/* 80250E50 0024DE50  41 81 00 10 */	bgt lbl_80250E60
/* 80250E54 0024DE54  38 00 03 E8 */	li r0, 0x3e8
/* 80250E58 0024DE58  90 03 00 1C */	stw r0, 0x1c(r3)
/* 80250E5C 0024DE5C  48 00 00 08 */	b lbl_80250E64
lbl_80250E60:
/* 80250E60 0024DE60  93 C3 00 1C */	stw r30, 0x1c(r3)
lbl_80250E64:
/* 80250E64 0024DE64  38 80 00 FF */	li r4, 0xff
/* 80250E68 0024DE68  38 00 FF FF */	li r0, -1
/* 80250E6C 0024DE6C  90 83 00 24 */	stw r4, 0x24(r3)
/* 80250E70 0024DE70  90 03 00 20 */	stw r0, 0x20(r3)
/* 80250E74 0024DE74  7F E3 FB 78 */	mr r3, r31
/* 80250E78 0024DE78  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 80250E7C 0024DE7C  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 80250E80 0024DE80  E3 C1 00 38 */	psq_l f30, 56(r1), 0, qr0
/* 80250E84 0024DE84  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 80250E88 0024DE88  E3 A1 00 28 */	psq_l f29, 40(r1), 0, qr0
/* 80250E8C 0024DE8C  CB A1 00 20 */	lfd f29, 0x20(r1)
/* 80250E90 0024DE90  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80250E94 0024DE94  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80250E98 0024DE98  80 01 00 54 */	lwz r0, 0x54(r1)
/* 80250E9C 0024DE9C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80250EA0 0024DEA0  7C 08 03 A6 */	mtlr r0
/* 80250EA4 0024DEA4  38 21 00 50 */	addi r1, r1, 0x50
/* 80250EA8 0024DEA8  4E 80 00 20 */	blr 
