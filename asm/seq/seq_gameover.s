.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global seq_gameOverMain
seq_gameOverMain:
/* 80077A5C 00074A5C  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80077A60 00074A60  7C 08 02 A6 */	mflr r0
/* 80077A64 00074A64  90 01 00 44 */	stw r0, 0x44(r1)
/* 80077A68 00074A68  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 80077A6C 00074A6C  7C 7F 1B 78 */	mr r31, r3
/* 80077A70 00074A70  93 C1 00 38 */	stw r30, 0x38(r1)
/* 80077A74 00074A74  80 03 00 04 */	lwz r0, 4(r3)
/* 80077A78 00074A78  28 00 00 06 */	cmplwi r0, 6
/* 80077A7C 00074A7C  41 81 04 30 */	bgt lbl_80077EAC
/* 80077A80 00074A80  3C 60 80 31 */	lis r3, lbl_8030B32C@ha
/* 80077A84 00074A84  54 00 10 3A */	slwi r0, r0, 2
/* 80077A88 00074A88  38 63 B3 2C */	addi r3, r3, lbl_8030B32C@l
/* 80077A8C 00074A8C  7C 03 00 2E */	lwzx r0, r3, r0
/* 80077A90 00074A90  7C 09 03 A6 */	mtctr r0
/* 80077A94 00074A94  4E 80 04 20 */	bctr 
/* 80077A98 00074A98  80 1F 00 08 */	lwz r0, 8(r31)
/* 80077A9C 00074A9C  28 00 00 00 */	cmplwi r0, 0
/* 80077AA0 00074AA0  40 82 00 34 */	bne lbl_80077AD4
/* 80077AA4 00074AA4  80 02 90 28 */	lwz r0, lbl_8041A3A8@sda21(r2)
/* 80077AA8 00074AA8  38 A1 00 14 */	addi r5, r1, 0x14
/* 80077AAC 00074AAC  38 60 00 02 */	li r3, 2
/* 80077AB0 00074AB0  38 80 03 E8 */	li r4, 0x3e8
/* 80077AB4 00074AB4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80077AB8 00074AB8  4B F9 B5 F9 */	bl fadeEntry
/* 80077ABC 00074ABC  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077AC0 00074AC0  38 80 00 0A */	li r4, 0xa
/* 80077AC4 00074AC4  38 00 01 2C */	li r0, 0x12c
/* 80077AC8 00074AC8  90 83 01 10 */	stw r4, 0x110(r3)
/* 80077ACC 00074ACC  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077AD0 00074AD0  90 03 01 14 */	stw r0, 0x114(r3)
lbl_80077AD4:
/* 80077AD4 00074AD4  3C 60 80 2C */	lis r3, lbl_802C4960@ha
/* 80077AD8 00074AD8  38 63 49 60 */	addi r3, r3, lbl_802C4960@l
/* 80077ADC 00074ADC  4B FB 0C A5 */	bl func_80028780
/* 80077AE0 00074AE0  80 7F 00 04 */	lwz r3, 4(r31)
/* 80077AE4 00074AE4  38 03 00 01 */	addi r0, r3, 1
/* 80077AE8 00074AE8  90 1F 00 04 */	stw r0, 4(r31)
/* 80077AEC 00074AEC  48 00 03 C0 */	b lbl_80077EAC
/* 80077AF0 00074AF0  4B F9 90 F9 */	bl fadeIsFinish
/* 80077AF4 00074AF4  2C 03 00 00 */	cmpwi r3, 0
/* 80077AF8 00074AF8  41 82 03 B4 */	beq lbl_80077EAC
/* 80077AFC 00074AFC  4B F8 F9 F9 */	bl _relUnLoad
/* 80077B00 00074B00  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077B04 00074B04  38 80 00 00 */	li r4, 0
/* 80077B08 00074B08  38 A0 00 00 */	li r5, 0
/* 80077B0C 00074B0C  38 63 01 2C */	addi r3, r3, 0x12c
/* 80077B10 00074B10  4B F8 FF 21 */	bl _unload
/* 80077B14 00074B14  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80077B18 00074B18  38 64 01 4C */	addi r3, r4, 0x14c
/* 80077B1C 00074B1C  38 84 01 2C */	addi r4, r4, 0x12c
/* 80077B20 00074B20  48 1E FA C5 */	bl strcpy
/* 80077B24 00074B24  48 0B F1 E5 */	bl statusWinForceOff
/* 80077B28 00074B28  48 0B F1 B9 */	bl statusWinDispOff
/* 80077B2C 00074B2C  38 60 00 04 */	li r3, 4
/* 80077B30 00074B30  4B F9 76 21 */	bl camGetPtr
/* 80077B34 00074B34  C0 02 90 38 */	lfs f0, lbl_8041A3B8@sda21(r2)
/* 80077B38 00074B38  3C 00 43 30 */	lis r0, 0x4330
/* 80077B3C 00074B3C  3C 80 80 2C */	lis r4, lbl_802C4968@ha
/* 80077B40 00074B40  90 01 00 18 */	stw r0, 0x18(r1)
/* 80077B44 00074B44  C8 24 49 68 */	lfd f1, lbl_802C4968@l(r4)
/* 80077B48 00074B48  D0 03 00 FC */	stfs f0, 0xfc(r3)
/* 80077B4C 00074B4C  D0 03 01 00 */	stfs f0, 0x100(r3)
/* 80077B50 00074B50  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80077B54 00074B54  90 01 00 20 */	stw r0, 0x20(r1)
/* 80077B58 00074B58  A0 04 01 70 */	lhz r0, 0x170(r4)
/* 80077B5C 00074B5C  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80077B60 00074B60  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 80077B64 00074B64  EC 00 08 28 */	fsubs f0, f0, f1
/* 80077B68 00074B68  D0 03 01 04 */	stfs f0, 0x104(r3)
/* 80077B6C 00074B6C  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80077B70 00074B70  A0 04 01 72 */	lhz r0, 0x172(r4)
/* 80077B74 00074B74  90 01 00 24 */	stw r0, 0x24(r1)
/* 80077B78 00074B78  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 80077B7C 00074B7C  EC 00 08 28 */	fsubs f0, f0, f1
/* 80077B80 00074B80  D0 03 01 08 */	stfs f0, 0x108(r3)
/* 80077B84 00074B84  38 60 00 08 */	li r3, 8
/* 80077B88 00074B88  4B F9 75 C9 */	bl camGetPtr
/* 80077B8C 00074B8C  C0 02 90 38 */	lfs f0, lbl_8041A3B8@sda21(r2)
/* 80077B90 00074B90  3C 00 43 30 */	lis r0, 0x4330
/* 80077B94 00074B94  3C 80 80 2C */	lis r4, lbl_802C4968@ha
/* 80077B98 00074B98  90 01 00 28 */	stw r0, 0x28(r1)
/* 80077B9C 00074B9C  C8 24 49 68 */	lfd f1, lbl_802C4968@l(r4)
/* 80077BA0 00074BA0  D0 03 00 FC */	stfs f0, 0xfc(r3)
/* 80077BA4 00074BA4  D0 03 01 00 */	stfs f0, 0x100(r3)
/* 80077BA8 00074BA8  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80077BAC 00074BAC  90 01 00 30 */	stw r0, 0x30(r1)
/* 80077BB0 00074BB0  A0 04 01 70 */	lhz r0, 0x170(r4)
/* 80077BB4 00074BB4  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80077BB8 00074BB8  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 80077BBC 00074BBC  EC 00 08 28 */	fsubs f0, f0, f1
/* 80077BC0 00074BC0  D0 03 01 04 */	stfs f0, 0x104(r3)
/* 80077BC4 00074BC4  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80077BC8 00074BC8  A0 04 01 72 */	lhz r0, 0x172(r4)
/* 80077BCC 00074BCC  90 01 00 34 */	stw r0, 0x34(r1)
/* 80077BD0 00074BD0  C8 01 00 30 */	lfd f0, 0x30(r1)
/* 80077BD4 00074BD4  EC 00 08 28 */	fsubs f0, f0, f1
/* 80077BD8 00074BD8  D0 03 01 08 */	stfs f0, 0x108(r3)
/* 80077BDC 00074BDC  38 60 00 08 */	li r3, 8
/* 80077BE0 00074BE0  4B F9 75 71 */	bl camGetPtr
/* 80077BE4 00074BE4  A0 03 00 00 */	lhz r0, 0(r3)
/* 80077BE8 00074BE8  54 00 06 2C */	rlwinm r0, r0, 0, 0x18, 0x16
/* 80077BEC 00074BEC  B0 03 00 00 */	sth r0, 0(r3)
/* 80077BF0 00074BF0  38 60 00 08 */	li r3, 8
/* 80077BF4 00074BF4  4B F9 75 5D */	bl camGetPtr
/* 80077BF8 00074BF8  A0 03 00 00 */	lhz r0, 0(r3)
/* 80077BFC 00074BFC  60 00 04 00 */	ori r0, r0, 0x400
/* 80077C00 00074C00  B0 03 00 00 */	sth r0, 0(r3)
/* 80077C04 00074C04  38 60 00 08 */	li r3, 8
/* 80077C08 00074C08  4B F9 75 49 */	bl camGetPtr
/* 80077C0C 00074C0C  A0 03 00 00 */	lhz r0, 0(r3)
/* 80077C10 00074C10  60 00 02 00 */	ori r0, r0, 0x200
/* 80077C14 00074C14  B0 03 00 00 */	sth r0, 0(r3)
/* 80077C18 00074C18  4B F9 B4 71 */	bl fadeTecOff
/* 80077C1C 00074C1C  4B F9 B4 05 */	bl fadeSoftFocusOff
/* 80077C20 00074C20  4B FC B1 51 */	bl npcClearDeadInfo
/* 80077C24 00074C24  48 18 46 FD */	bl countDownEnd
/* 80077C28 00074C28  48 18 D2 E5 */	bl func_80204F0C
/* 80077C2C 00074C2C  80 7F 00 04 */	lwz r3, 4(r31)
/* 80077C30 00074C30  38 03 00 01 */	addi r0, r3, 1
/* 80077C34 00074C34  90 1F 00 04 */	stw r0, 4(r31)
/* 80077C38 00074C38  48 00 02 74 */	b lbl_80077EAC
/* 80077C3C 00074C3C  3C 60 80 2C */	lis r3, lbl_802C4960@ha
/* 80077C40 00074C40  38 63 49 60 */	addi r3, r3, lbl_802C4960@l
/* 80077C44 00074C44  4B FB 0B 3D */	bl func_80028780
/* 80077C48 00074C48  2C 03 00 00 */	cmpwi r3, 0
/* 80077C4C 00074C4C  41 82 02 60 */	beq lbl_80077EAC
/* 80077C50 00074C50  3C 60 80 2C */	lis r3, lbl_802C4960@ha
/* 80077C54 00074C54  38 63 49 60 */	addi r3, r3, lbl_802C4960@l
/* 80077C58 00074C58  4B FB 0A C1 */	bl mapLoad
/* 80077C5C 00074C5C  38 60 00 04 */	li r3, 4
/* 80077C60 00074C60  4B F9 74 F1 */	bl camGetPtr
/* 80077C64 00074C64  7C 7E 1B 78 */	mr r30, r3
/* 80077C68 00074C68  4B FE 55 AD */	bl marioGetPtr
/* 80077C6C 00074C6C  C0 22 90 38 */	lfs f1, lbl_8041A3B8@sda21(r2)
/* 80077C70 00074C70  3C 80 80 2C */	lis r4, lbl_802C4954@ha
/* 80077C74 00074C74  C0 02 90 3C */	lfs f0, lbl_8041A3BC@sda21(r2)
/* 80077C78 00074C78  38 A4 49 54 */	addi r5, r4, lbl_802C4954@l
/* 80077C7C 00074C7C  D0 3E 00 94 */	stfs f1, 0x94(r30)
/* 80077C80 00074C80  D0 1E 00 98 */	stfs f0, 0x98(r30)
/* 80077C84 00074C84  D0 3E 00 9C */	stfs f1, 0x9c(r30)
/* 80077C88 00074C88  C0 1E 00 94 */	lfs f0, 0x94(r30)
/* 80077C8C 00074C8C  D0 1E 00 AC */	stfs f0, 0xac(r30)
/* 80077C90 00074C90  C0 1E 00 98 */	lfs f0, 0x98(r30)
/* 80077C94 00074C94  D0 1E 00 B0 */	stfs f0, 0xb0(r30)
/* 80077C98 00074C98  C0 1E 00 9C */	lfs f0, 0x9c(r30)
/* 80077C9C 00074C9C  D0 1E 00 B4 */	stfs f0, 0xb4(r30)
/* 80077CA0 00074CA0  80 85 00 00 */	lwz r4, 0(r5)
/* 80077CA4 00074CA4  80 05 00 04 */	lwz r0, 4(r5)
/* 80077CA8 00074CA8  90 83 00 8C */	stw r4, 0x8c(r3)
/* 80077CAC 00074CAC  90 03 00 90 */	stw r0, 0x90(r3)
/* 80077CB0 00074CB0  80 05 00 08 */	lwz r0, 8(r5)
/* 80077CB4 00074CB4  90 03 00 94 */	stw r0, 0x94(r3)
/* 80077CB8 00074CB8  80 83 00 8C */	lwz r4, 0x8c(r3)
/* 80077CBC 00074CBC  80 03 00 90 */	lwz r0, 0x90(r3)
/* 80077CC0 00074CC0  90 83 00 EC */	stw r4, 0xec(r3)
/* 80077CC4 00074CC4  90 03 00 F0 */	stw r0, 0xf0(r3)
/* 80077CC8 00074CC8  80 03 00 94 */	lwz r0, 0x94(r3)
/* 80077CCC 00074CCC  90 03 00 F4 */	stw r0, 0xf4(r3)
/* 80077CD0 00074CD0  4B F9 2B A1 */	bl camRoadReset
/* 80077CD4 00074CD4  48 07 6B 41 */	bl camShiftReset
/* 80077CD8 00074CD8  80 7F 00 04 */	lwz r3, 4(r31)
/* 80077CDC 00074CDC  38 03 00 01 */	addi r0, r3, 1
/* 80077CE0 00074CE0  90 1F 00 04 */	stw r0, 4(r31)
/* 80077CE4 00074CE4  48 00 01 C8 */	b lbl_80077EAC
/* 80077CE8 00074CE8  80 02 90 2C */	lwz r0, lbl_8041A3AC@sda21(r2)
/* 80077CEC 00074CEC  38 A1 00 10 */	addi r5, r1, 0x10
/* 80077CF0 00074CF0  38 60 00 1F */	li r3, 0x1f
/* 80077CF4 00074CF4  38 80 00 C8 */	li r4, 0xc8
/* 80077CF8 00074CF8  90 01 00 10 */	stw r0, 0x10(r1)
/* 80077CFC 00074CFC  4B F9 B3 B5 */	bl fadeEntry
/* 80077D00 00074D00  80 7F 00 04 */	lwz r3, 4(r31)
/* 80077D04 00074D04  38 03 00 01 */	addi r0, r3, 1
/* 80077D08 00074D08  90 1F 00 04 */	stw r0, 4(r31)
/* 80077D0C 00074D0C  48 00 01 A0 */	b lbl_80077EAC
/* 80077D10 00074D10  4B F9 8E D9 */	bl fadeIsFinish
/* 80077D14 00074D14  2C 03 00 00 */	cmpwi r3, 0
/* 80077D18 00074D18  41 82 01 94 */	beq lbl_80077EAC
/* 80077D1C 00074D1C  80 02 90 30 */	lwz r0, lbl_8041A3B0@sda21(r2)
/* 80077D20 00074D20  38 A1 00 0C */	addi r5, r1, 0xc
/* 80077D24 00074D24  38 60 00 09 */	li r3, 9
/* 80077D28 00074D28  38 80 03 E8 */	li r4, 0x3e8
/* 80077D2C 00074D2C  90 01 00 0C */	stw r0, 0xc(r1)
/* 80077D30 00074D30  4B F9 B3 81 */	bl fadeEntry
/* 80077D34 00074D34  4B FE 2F ED */	bl marioReset
/* 80077D38 00074D38  4B FE 3F 21 */	bl marioEntry
/* 80077D3C 00074D3C  38 60 02 00 */	li r3, 0x200
/* 80077D40 00074D40  38 80 00 93 */	li r4, 0x93
/* 80077D44 00074D44  48 05 F5 55 */	bl psndBGMOn
/* 80077D48 00074D48  3C 60 80 3E */	lis r3, lbl_803D9C48@ha
/* 80077D4C 00074D4C  38 63 9C 48 */	addi r3, r3, lbl_803D9C48@l
/* 80077D50 00074D50  80 A3 00 04 */	lwz r5, 4(r3)
/* 80077D54 00074D54  3C 05 00 01 */	addis r0, r5, 1
/* 80077D58 00074D58  28 00 FF FF */	cmplwi r0, 0xffff
/* 80077D5C 00074D5C  41 82 00 20 */	beq lbl_80077D7C
/* 80077D60 00074D60  3C 60 80 3E */	lis r3, lbl_803D9DB8@ha
/* 80077D64 00074D64  38 83 9D B8 */	addi r4, r3, lbl_803D9DB8@l
/* 80077D68 00074D68  1C 65 01 38 */	mulli r3, r5, 0x138
/* 80077D6C 00074D6C  80 84 01 00 */	lwz r4, 0x100(r4)
/* 80077D70 00074D70  7C 04 1A 2E */	lhzx r0, r4, r3
/* 80077D74 00074D74  60 00 80 00 */	ori r0, r0, 0x8000
/* 80077D78 00074D78  7C 04 1B 2E */	sthx r0, r4, r3
lbl_80077D7C:
/* 80077D7C 00074D7C  3C 60 80 31 */	lis r3, lbl_8030AFF4@ha
/* 80077D80 00074D80  38 80 00 00 */	li r4, 0
/* 80077D84 00074D84  38 63 AF F4 */	addi r3, r3, lbl_8030AFF4@l
/* 80077D88 00074D88  38 A0 00 00 */	li r5, 0
/* 80077D8C 00074D8C  38 C0 00 00 */	li r6, 0
/* 80077D90 00074D90  4B FB ED F5 */	bl evtEntryType
/* 80077D94 00074D94  80 8D 91 10 */	lwz r4, lbl_80410370@sda21(r13)
/* 80077D98 00074D98  90 64 00 00 */	stw r3, 0(r4)
/* 80077D9C 00074D9C  80 7F 00 04 */	lwz r3, 4(r31)
/* 80077DA0 00074DA0  38 03 00 01 */	addi r0, r3, 1
/* 80077DA4 00074DA4  90 1F 00 04 */	stw r0, 4(r31)
/* 80077DA8 00074DA8  48 00 01 04 */	b lbl_80077EAC
/* 80077DAC 00074DAC  80 6D 91 10 */	lwz r3, lbl_80410370@sda21(r13)
/* 80077DB0 00074DB0  80 63 00 00 */	lwz r3, 0(r3)
/* 80077DB4 00074DB4  80 63 01 5C */	lwz r3, 0x15c(r3)
/* 80077DB8 00074DB8  4B FB E1 B1 */	bl evtCheckID
/* 80077DBC 00074DBC  2C 03 00 00 */	cmpwi r3, 0
/* 80077DC0 00074DC0  41 82 00 14 */	beq lbl_80077DD4
/* 80077DC4 00074DC4  38 60 00 00 */	li r3, 0
/* 80077DC8 00074DC8  4B F8 E2 DD */	bl keyGetButtonTrg
/* 80077DCC 00074DCC  70 60 11 00 */	andi. r0, r3, 0x1100
/* 80077DD0 00074DD0  41 82 00 DC */	beq lbl_80077EAC
lbl_80077DD4:
/* 80077DD4 00074DD4  80 02 90 34 */	lwz r0, lbl_8041A3B4@sda21(r2)
/* 80077DD8 00074DD8  38 A1 00 08 */	addi r5, r1, 8
/* 80077DDC 00074DDC  38 60 00 24 */	li r3, 0x24
/* 80077DE0 00074DE0  38 80 00 00 */	li r4, 0
/* 80077DE4 00074DE4  90 01 00 08 */	stw r0, 8(r1)
/* 80077DE8 00074DE8  4B F9 B2 C9 */	bl fadeEntry
/* 80077DEC 00074DEC  38 60 02 00 */	li r3, 0x200
/* 80077DF0 00074DF0  38 80 0F A0 */	li r4, 0xfa0
/* 80077DF4 00074DF4  38 A0 00 00 */	li r5, 0
/* 80077DF8 00074DF8  48 05 E9 9D */	bl psndBGMOff_f_d
/* 80077DFC 00074DFC  80 7F 00 04 */	lwz r3, 4(r31)
/* 80077E00 00074E00  38 03 00 01 */	addi r0, r3, 1
/* 80077E04 00074E04  90 1F 00 04 */	stw r0, 4(r31)
/* 80077E08 00074E08  48 00 00 A4 */	b lbl_80077EAC
/* 80077E0C 00074E0C  4B F9 8D DD */	bl fadeIsFinish
/* 80077E10 00074E10  2C 03 00 00 */	cmpwi r3, 0
/* 80077E14 00074E14  41 82 00 98 */	beq lbl_80077EAC
/* 80077E18 00074E18  4B F8 F6 DD */	bl _relUnLoad
/* 80077E1C 00074E1C  3C 60 80 2C */	lis r3, lbl_802C4960@ha
/* 80077E20 00074E20  38 80 00 00 */	li r4, 0
/* 80077E24 00074E24  38 63 49 60 */	addi r3, r3, lbl_802C4960@l
/* 80077E28 00074E28  38 A0 00 00 */	li r5, 0
/* 80077E2C 00074E2C  4B F8 FC 05 */	bl _unload
/* 80077E30 00074E30  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077E34 00074E34  38 82 90 40 */	addi r4, r2, lbl_8041A3C0@sda21
/* 80077E38 00074E38  38 63 01 1C */	addi r3, r3, 0x11c
/* 80077E3C 00074E3C  48 1E F7 A9 */	bl strcpy
/* 80077E40 00074E40  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077E44 00074E44  38 82 90 40 */	addi r4, r2, lbl_8041A3C0@sda21
/* 80077E48 00074E48  38 63 01 2C */	addi r3, r3, 0x12c
/* 80077E4C 00074E4C  48 1E F7 99 */	bl strcpy
/* 80077E50 00074E50  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077E54 00074E54  38 82 90 40 */	addi r4, r2, lbl_8041A3C0@sda21
/* 80077E58 00074E58  38 63 01 3C */	addi r3, r3, 0x13c
/* 80077E5C 00074E5C  48 1E F7 89 */	bl strcpy
/* 80077E60 00074E60  48 0B EE 95 */	bl statusWinDispOn
/* 80077E64 00074E64  38 60 00 08 */	li r3, 8
/* 80077E68 00074E68  4B F9 72 E9 */	bl camGetPtr
/* 80077E6C 00074E6C  A0 03 00 00 */	lhz r0, 0(r3)
/* 80077E70 00074E70  54 00 05 EA */	rlwinm r0, r0, 0, 0x17, 0x15
/* 80077E74 00074E74  B0 03 00 00 */	sth r0, 0(r3)
/* 80077E78 00074E78  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80077E7C 00074E7C  80 03 00 00 */	lwz r0, 0(r3)
/* 80077E80 00074E80  54 00 04 E7 */	rlwinm. r0, r0, 0, 0x13, 0x13
/* 80077E84 00074E84  41 82 00 18 */	beq lbl_80077E9C
/* 80077E88 00074E88  38 60 00 07 */	li r3, 7
/* 80077E8C 00074E8C  38 80 00 00 */	li r4, 0
/* 80077E90 00074E90  38 A0 00 00 */	li r5, 0
/* 80077E94 00074E94  4B FB 5D 61 */	bl seqSetSeq
/* 80077E98 00074E98  48 00 00 14 */	b lbl_80077EAC
lbl_80077E9C:
/* 80077E9C 00074E9C  38 60 00 01 */	li r3, 1
/* 80077EA0 00074EA0  38 80 00 00 */	li r4, 0
/* 80077EA4 00074EA4  38 A0 00 00 */	li r5, 0
/* 80077EA8 00074EA8  4B FB 5D 4D */	bl seqSetSeq
lbl_80077EAC:
/* 80077EAC 00074EAC  80 01 00 44 */	lwz r0, 0x44(r1)
/* 80077EB0 00074EB0  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 80077EB4 00074EB4  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 80077EB8 00074EB8  7C 08 03 A6 */	mtlr r0
/* 80077EBC 00074EBC  38 21 00 40 */	addi r1, r1, 0x40
/* 80077EC0 00074EC0  4E 80 00 20 */	blr 

.global N_evt_snd_bgm_unpause
N_evt_snd_bgm_unpause:
/* 80077EC4 00074EC4  3C 60 80 3E */	lis r3, lbl_803D9C48@ha
/* 80077EC8 00074EC8  38 63 9C 48 */	addi r3, r3, lbl_803D9C48@l
/* 80077ECC 00074ECC  80 A3 00 04 */	lwz r5, 4(r3)
/* 80077ED0 00074ED0  3C 05 00 01 */	addis r0, r5, 1
/* 80077ED4 00074ED4  28 00 FF FF */	cmplwi r0, 0xffff
/* 80077ED8 00074ED8  41 82 00 20 */	beq lbl_80077EF8
/* 80077EDC 00074EDC  3C 60 80 3E */	lis r3, lbl_803D9DB8@ha
/* 80077EE0 00074EE0  38 83 9D B8 */	addi r4, r3, lbl_803D9DB8@l
/* 80077EE4 00074EE4  1C 65 01 38 */	mulli r3, r5, 0x138
/* 80077EE8 00074EE8  80 84 01 00 */	lwz r4, 0x100(r4)
/* 80077EEC 00074EEC  7C 04 1A 2E */	lhzx r0, r4, r3
/* 80077EF0 00074EF0  54 00 04 7E */	clrlwi r0, r0, 0x11
/* 80077EF4 00074EF4  7C 04 1B 2E */	sthx r0, r4, r3
lbl_80077EF8:
/* 80077EF8 00074EF8  38 60 00 02 */	li r3, 2
/* 80077EFC 00074EFC  4E 80 00 20 */	blr 

.global seq_gameOverExit
seq_gameOverExit:
/* 80077F00 00074F00  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80077F04 00074F04  7C 08 02 A6 */	mflr r0
/* 80077F08 00074F08  90 01 00 14 */	stw r0, 0x14(r1)
/* 80077F0C 00074F0C  48 05 FD 69 */	bl psndStopAllFadeOut
/* 80077F10 00074F10  38 60 00 00 */	li r3, 0
/* 80077F14 00074F14  4B FF 66 45 */	bl marioStSystemLevel
/* 80077F18 00074F18  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80077F1C 00074F1C  7C 08 03 A6 */	mtlr r0
/* 80077F20 00074F20  38 21 00 10 */	addi r1, r1, 0x10
/* 80077F24 00074F24  4E 80 00 20 */	blr 

.global seq_gameOverInit
seq_gameOverInit:
/* 80077F28 00074F28  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80077F2C 00074F2C  7C 08 02 A6 */	mflr r0
/* 80077F30 00074F30  90 01 00 14 */	stw r0, 0x14(r1)
/* 80077F34 00074F34  48 10 0F B5 */	bl winReInit
/* 80077F38 00074F38  38 60 00 04 */	li r3, 4
/* 80077F3C 00074F3C  4B F9 68 55 */	bl L_camDispOn
/* 80077F40 00074F40  48 05 FD 35 */	bl psndStopAllFadeOut
/* 80077F44 00074F44  38 60 00 00 */	li r3, 0
/* 80077F48 00074F48  48 05 FC B5 */	bl psndSetReverb
/* 80077F4C 00074F4C  48 05 F8 71 */	bl L_psndBGM_stop
/* 80077F50 00074F50  38 60 00 80 */	li r3, 0x80
/* 80077F54 00074F54  48 05 FC 15 */	bl psndClearFlag
/* 80077F58 00074F58  38 60 00 20 */	li r3, 0x20
/* 80077F5C 00074F5C  48 05 FC 0D */	bl psndClearFlag
/* 80077F60 00074F60  38 60 00 40 */	li r3, 0x40
/* 80077F64 00074F64  48 05 FC 05 */	bl psndClearFlag
/* 80077F68 00074F68  38 60 01 43 */	li r3, 0x143
/* 80077F6C 00074F6C  48 05 71 7D */	bl N_pouchUnEquipBadgeID
/* 80077F70 00074F70  38 60 00 04 */	li r3, 4
/* 80077F74 00074F74  4B FF 65 E5 */	bl marioStSystemLevel
/* 80077F78 00074F78  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80077F7C 00074F7C  7C 08 03 A6 */	mtlr r0
/* 80077F80 00074F80  38 21 00 10 */	addi r1, r1, 0x10
/* 80077F84 00074F84  4E 80 00 20 */	blr 
