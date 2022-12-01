.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global BattlePadMultiCheckRepeat
BattlePadMultiCheckRepeat:
/* 80114B18 00111B18  1C 63 01 FC */	mulli r3, r3, 0x1fc
/* 80114B1C 00111B1C  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80114B20 00111B20  38 03 0F BC */	addi r0, r3, 0xfbc
/* 80114B24 00111B24  7C 05 00 2E */	lwzx r0, r5, r0
/* 80114B28 00111B28  7C 03 20 38 */	and r3, r0, r4
/* 80114B2C 00111B2C  4E 80 00 20 */	blr 

.global func_80114B30
func_80114B30:

.global BattlePadCheckRepeat
BattlePadCheckRepeat:
/* 80114B30 00111B30  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80114B34 00111B34  7C 08 02 A6 */	mflr r0
/* 80114B38 00111B38  7C 64 1B 78 */	mr r4, r3
/* 80114B3C 00111B3C  38 60 00 00 */	li r3, 0
/* 80114B40 00111B40  90 01 00 14 */	stw r0, 0x14(r1)
/* 80114B44 00111B44  4B FF FF D5 */	bl BattlePadMultiCheckRepeat
/* 80114B48 00111B48  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80114B4C 00111B4C  7C 08 03 A6 */	mtlr r0
/* 80114B50 00111B50  38 21 00 10 */	addi r1, r1, 0x10
/* 80114B54 00111B54  4E 80 00 20 */	blr 

.global BattlePadMultiCheckUp
BattlePadMultiCheckUp:
/* 80114B58 00111B58  1C 63 01 FC */	mulli r3, r3, 0x1fc
/* 80114B5C 00111B5C  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80114B60 00111B60  38 03 10 AC */	addi r0, r3, 0x10ac
/* 80114B64 00111B64  7C 05 00 2E */	lwzx r0, r5, r0
/* 80114B68 00111B68  7C 03 20 38 */	and r3, r0, r4
/* 80114B6C 00111B6C  4E 80 00 20 */	blr 

.global func_80114B70
func_80114B70:

.global BattlePadCheckUp
BattlePadCheckUp:
/* 80114B70 00111B70  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80114B74 00111B74  7C 08 02 A6 */	mflr r0
/* 80114B78 00111B78  7C 64 1B 78 */	mr r4, r3
/* 80114B7C 00111B7C  38 60 00 00 */	li r3, 0
/* 80114B80 00111B80  90 01 00 14 */	stw r0, 0x14(r1)
/* 80114B84 00111B84  4B FF FF D5 */	bl BattlePadMultiCheckUp
/* 80114B88 00111B88  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80114B8C 00111B8C  7C 08 03 A6 */	mtlr r0
/* 80114B90 00111B90  38 21 00 10 */	addi r1, r1, 0x10
/* 80114B94 00111B94  4E 80 00 20 */	blr 

.global BattlePadMultiCheckNow
BattlePadMultiCheckNow:
/* 80114B98 00111B98  1C 63 01 FC */	mulli r3, r3, 0x1fc
/* 80114B9C 00111B9C  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80114BA0 00111BA0  38 03 10 34 */	addi r0, r3, 0x1034
/* 80114BA4 00111BA4  7C 05 00 2E */	lwzx r0, r5, r0
/* 80114BA8 00111BA8  7C 03 20 38 */	and r3, r0, r4
/* 80114BAC 00111BAC  4E 80 00 20 */	blr 

.global func_80114BB0
func_80114BB0:

.global BattlePadCheckNow
BattlePadCheckNow:
/* 80114BB0 00111BB0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80114BB4 00111BB4  7C 08 02 A6 */	mflr r0
/* 80114BB8 00111BB8  7C 64 1B 78 */	mr r4, r3
/* 80114BBC 00111BBC  38 60 00 00 */	li r3, 0
/* 80114BC0 00111BC0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80114BC4 00111BC4  4B FF FF D5 */	bl BattlePadMultiCheckNow
/* 80114BC8 00111BC8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80114BCC 00111BCC  7C 08 03 A6 */	mtlr r0
/* 80114BD0 00111BD0  38 21 00 10 */	addi r1, r1, 0x10
/* 80114BD4 00111BD4  4E 80 00 20 */	blr 

.global BattlePadMultiCheckRecordTrigger
BattlePadMultiCheckRecordTrigger:
/* 80114BD8 00111BD8  1C 63 01 FC */	mulli r3, r3, 0x1fc
/* 80114BDC 00111BDC  54 80 10 3A */	slwi r0, r4, 2
/* 80114BE0 00111BE0  80 8D 17 10 */	lwz r4, lbl_80418970@sda21(r13)
/* 80114BE4 00111BE4  38 63 0F 44 */	addi r3, r3, 0xf44
/* 80114BE8 00111BE8  7C 03 02 14 */	add r0, r3, r0
/* 80114BEC 00111BEC  7C 04 00 2E */	lwzx r0, r4, r0
/* 80114BF0 00111BF0  7C 03 28 38 */	and r3, r0, r5
/* 80114BF4 00111BF4  4E 80 00 20 */	blr 

.global BattlePadCheckRecordTrigger
BattlePadCheckRecordTrigger:
/* 80114BF8 00111BF8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80114BFC 00111BFC  7C 08 02 A6 */	mflr r0
/* 80114C00 00111C00  7C 85 23 78 */	mr r5, r4
/* 80114C04 00111C04  7C 64 1B 78 */	mr r4, r3
/* 80114C08 00111C08  90 01 00 14 */	stw r0, 0x14(r1)
/* 80114C0C 00111C0C  38 60 00 00 */	li r3, 0
/* 80114C10 00111C10  4B FF FF C9 */	bl BattlePadMultiCheckRecordTrigger
/* 80114C14 00111C14  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80114C18 00111C18  7C 08 03 A6 */	mtlr r0
/* 80114C1C 00111C1C  38 21 00 10 */	addi r1, r1, 0x10
/* 80114C20 00111C20  4E 80 00 20 */	blr 

.global BattlePadMultiCheckTrigger
BattlePadMultiCheckTrigger:
/* 80114C24 00111C24  1C 63 01 FC */	mulli r3, r3, 0x1fc
/* 80114C28 00111C28  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80114C2C 00111C2C  38 03 0F 44 */	addi r0, r3, 0xf44
/* 80114C30 00111C30  7C 05 00 2E */	lwzx r0, r5, r0
/* 80114C34 00111C34  7C 03 20 38 */	and r3, r0, r4
/* 80114C38 00111C38  4E 80 00 20 */	blr 

.global func_80114C3C
func_80114C3C:

.global BattlePadCheckTrigger
BattlePadCheckTrigger:
/* 80114C3C 00111C3C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80114C40 00111C40  7C 08 02 A6 */	mflr r0
/* 80114C44 00111C44  7C 64 1B 78 */	mr r4, r3
/* 80114C48 00111C48  38 60 00 00 */	li r3, 0
/* 80114C4C 00111C4C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80114C50 00111C50  4B FF FF D5 */	bl BattlePadMultiCheckTrigger
/* 80114C54 00111C54  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80114C58 00111C58  7C 08 03 A6 */	mtlr r0
/* 80114C5C 00111C5C  38 21 00 10 */	addi r1, r1, 0x10
/* 80114C60 00111C60  4E 80 00 20 */	blr 

.global BattlePadGetNow
BattlePadGetNow:
/* 80114C64 00111C64  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 80114C68 00111C68  80 63 10 34 */	lwz r3, 0x1034(r3)
/* 80114C6C 00111C6C  4E 80 00 20 */	blr 

.global BattlePadGetTrigger
BattlePadGetTrigger:
/* 80114C70 00111C70  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 80114C74 00111C74  80 63 0F 44 */	lwz r3, 0xf44(r3)
/* 80114C78 00111C78  4E 80 00 20 */	blr 

.global BtlPad_WorkUpdate
BtlPad_WorkUpdate:
/* 80114C7C 00111C7C  80 E3 00 00 */	lwz r7, 0(r3)
/* 80114C80 00111C80  38 00 00 1D */	li r0, 0x1d
/* 80114C84 00111C84  80 C3 00 04 */	lwz r6, 4(r3)
/* 80114C88 00111C88  38 A0 00 70 */	li r5, 0x70
/* 80114C8C 00111C8C  90 E3 00 0C */	stw r7, 0xc(r3)
/* 80114C90 00111C90  90 C3 00 10 */	stw r6, 0x10(r3)
/* 80114C94 00111C94  80 C3 00 08 */	lwz r6, 8(r3)
/* 80114C98 00111C98  90 C3 00 14 */	stw r6, 0x14(r3)
/* 80114C9C 00111C9C  7C 09 03 A6 */	mtctr r0
lbl_80114CA0:
/* 80114CA0 00111CA0  7C C3 2A 14 */	add r6, r3, r5
/* 80114CA4 00111CA4  38 A5 FF FC */	addi r5, r5, -4
/* 80114CA8 00111CA8  80 06 00 18 */	lwz r0, 0x18(r6)
/* 80114CAC 00111CAC  90 06 00 1C */	stw r0, 0x1c(r6)
/* 80114CB0 00111CB0  80 06 00 90 */	lwz r0, 0x90(r6)
/* 80114CB4 00111CB4  90 06 00 94 */	stw r0, 0x94(r6)
/* 80114CB8 00111CB8  80 06 01 08 */	lwz r0, 0x108(r6)
/* 80114CBC 00111CBC  90 06 01 0C */	stw r0, 0x10c(r6)
/* 80114CC0 00111CC0  42 00 FF E0 */	bdnz lbl_80114CA0
/* 80114CC4 00111CC4  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114CC8 00111CC8  54 80 10 3A */	slwi r0, r4, 2
/* 80114CCC 00111CCC  38 A0 00 00 */	li r5, 0
/* 80114CD0 00111CD0  7C C6 02 14 */	add r6, r6, r0
/* 80114CD4 00111CD4  80 C6 13 28 */	lwz r6, 0x1328(r6)
/* 80114CD8 00111CD8  B0 C3 00 00 */	sth r6, 0(r3)
/* 80114CDC 00111CDC  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114CE0 00111CE0  7C C6 22 14 */	add r6, r6, r4
/* 80114CE4 00111CE4  88 C6 13 B8 */	lbz r6, 0x13b8(r6)
/* 80114CE8 00111CE8  98 C3 00 02 */	stb r6, 2(r3)
/* 80114CEC 00111CEC  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114CF0 00111CF0  7C C6 22 14 */	add r6, r6, r4
/* 80114CF4 00111CF4  88 C6 13 BC */	lbz r6, 0x13bc(r6)
/* 80114CF8 00111CF8  98 C3 00 03 */	stb r6, 3(r3)
/* 80114CFC 00111CFC  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114D00 00111D00  7C C6 22 14 */	add r6, r6, r4
/* 80114D04 00111D04  88 C6 13 C0 */	lbz r6, 0x13c0(r6)
/* 80114D08 00111D08  98 C3 00 04 */	stb r6, 4(r3)
/* 80114D0C 00111D0C  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114D10 00111D10  7C C6 22 14 */	add r6, r6, r4
/* 80114D14 00111D14  88 C6 13 C4 */	lbz r6, 0x13c4(r6)
/* 80114D18 00111D18  98 C3 00 05 */	stb r6, 5(r3)
/* 80114D1C 00111D1C  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114D20 00111D20  7C C6 22 14 */	add r6, r6, r4
/* 80114D24 00111D24  88 C6 13 C8 */	lbz r6, 0x13c8(r6)
/* 80114D28 00111D28  98 C3 00 06 */	stb r6, 6(r3)
/* 80114D2C 00111D2C  80 CD 90 B0 */	lwz r6, gp@sda21(r13)
/* 80114D30 00111D30  7C 86 22 14 */	add r4, r6, r4
/* 80114D34 00111D34  88 84 13 CC */	lbz r4, 0x13cc(r4)
/* 80114D38 00111D38  98 83 00 07 */	stb r4, 7(r3)
/* 80114D3C 00111D3C  98 A3 00 08 */	stb r5, 8(r3)
/* 80114D40 00111D40  98 A3 00 09 */	stb r5, 9(r3)
/* 80114D44 00111D44  A0 83 00 00 */	lhz r4, 0(r3)
/* 80114D48 00111D48  90 83 01 08 */	stw r4, 0x108(r3)
/* 80114D4C 00111D4C  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80114D50 00111D50  7C 84 02 14 */	add r4, r4, r0
/* 80114D54 00111D54  80 84 13 48 */	lwz r4, 0x1348(r4)
/* 80114D58 00111D58  90 83 00 90 */	stw r4, 0x90(r3)
/* 80114D5C 00111D5C  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80114D60 00111D60  7C 84 02 14 */	add r4, r4, r0
/* 80114D64 00111D64  80 84 13 38 */	lwz r4, 0x1338(r4)
/* 80114D68 00111D68  90 83 00 18 */	stw r4, 0x18(r3)
/* 80114D6C 00111D6C  80 8D 90 B0 */	lwz r4, gp@sda21(r13)
/* 80114D70 00111D70  7C 84 02 14 */	add r4, r4, r0
/* 80114D74 00111D74  80 04 13 68 */	lwz r0, 0x1368(r4)
/* 80114D78 00111D78  90 03 01 80 */	stw r0, 0x180(r3)
/* 80114D7C 00111D7C  88 03 00 03 */	lbz r0, 3(r3)
/* 80114D80 00111D80  7C 00 07 74 */	extsb r0, r0
/* 80114D84 00111D84  2C 00 00 1E */	cmpwi r0, 0x1e
/* 80114D88 00111D88  41 80 00 10 */	blt lbl_80114D98
/* 80114D8C 00111D8C  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114D90 00111D90  64 00 00 01 */	oris r0, r0, 1
/* 80114D94 00111D94  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114D98:
/* 80114D98 00111D98  88 03 00 03 */	lbz r0, 3(r3)
/* 80114D9C 00111D9C  7C 00 07 74 */	extsb r0, r0
/* 80114DA0 00111DA0  2C 00 FF E2 */	cmpwi r0, -30
/* 80114DA4 00111DA4  41 81 00 10 */	bgt lbl_80114DB4
/* 80114DA8 00111DA8  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114DAC 00111DAC  64 00 00 02 */	oris r0, r0, 2
/* 80114DB0 00111DB0  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114DB4:
/* 80114DB4 00111DB4  88 03 00 02 */	lbz r0, 2(r3)
/* 80114DB8 00111DB8  7C 00 07 74 */	extsb r0, r0
/* 80114DBC 00111DBC  2C 00 FF E2 */	cmpwi r0, -30
/* 80114DC0 00111DC0  41 81 00 10 */	bgt lbl_80114DD0
/* 80114DC4 00111DC4  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114DC8 00111DC8  64 00 00 04 */	oris r0, r0, 4
/* 80114DCC 00111DCC  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114DD0:
/* 80114DD0 00111DD0  88 03 00 02 */	lbz r0, 2(r3)
/* 80114DD4 00111DD4  7C 00 07 74 */	extsb r0, r0
/* 80114DD8 00111DD8  2C 00 00 1E */	cmpwi r0, 0x1e
/* 80114DDC 00111DDC  41 80 00 10 */	blt lbl_80114DEC
/* 80114DE0 00111DE0  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114DE4 00111DE4  64 00 00 08 */	oris r0, r0, 8
/* 80114DE8 00111DE8  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114DEC:
/* 80114DEC 00111DEC  88 03 00 05 */	lbz r0, 5(r3)
/* 80114DF0 00111DF0  7C 00 07 74 */	extsb r0, r0
/* 80114DF4 00111DF4  2C 00 00 1E */	cmpwi r0, 0x1e
/* 80114DF8 00111DF8  41 80 00 10 */	blt lbl_80114E08
/* 80114DFC 00111DFC  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114E00 00111E00  64 00 00 10 */	oris r0, r0, 0x10
/* 80114E04 00111E04  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114E08:
/* 80114E08 00111E08  88 03 00 05 */	lbz r0, 5(r3)
/* 80114E0C 00111E0C  7C 00 07 74 */	extsb r0, r0
/* 80114E10 00111E10  2C 00 FF E2 */	cmpwi r0, -30
/* 80114E14 00111E14  41 81 00 10 */	bgt lbl_80114E24
/* 80114E18 00111E18  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114E1C 00111E1C  64 00 00 20 */	oris r0, r0, 0x20
/* 80114E20 00111E20  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114E24:
/* 80114E24 00111E24  88 03 00 04 */	lbz r0, 4(r3)
/* 80114E28 00111E28  7C 00 07 74 */	extsb r0, r0
/* 80114E2C 00111E2C  2C 00 FF E2 */	cmpwi r0, -30
/* 80114E30 00111E30  41 81 00 10 */	bgt lbl_80114E40
/* 80114E34 00111E34  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114E38 00111E38  64 00 00 40 */	oris r0, r0, 0x40
/* 80114E3C 00111E3C  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114E40:
/* 80114E40 00111E40  88 03 00 04 */	lbz r0, 4(r3)
/* 80114E44 00111E44  7C 00 07 74 */	extsb r0, r0
/* 80114E48 00111E48  2C 00 00 1E */	cmpwi r0, 0x1e
/* 80114E4C 00111E4C  41 80 00 10 */	blt lbl_80114E5C
/* 80114E50 00111E50  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114E54 00111E54  64 00 00 80 */	oris r0, r0, 0x80
/* 80114E58 00111E58  90 03 01 08 */	stw r0, 0x108(r3)
lbl_80114E5C:
/* 80114E5C 00111E5C  80 83 01 08 */	lwz r4, 0x108(r3)
/* 80114E60 00111E60  80 03 01 0C */	lwz r0, 0x10c(r3)
/* 80114E64 00111E64  80 A3 00 18 */	lwz r5, 0x18(r3)
/* 80114E68 00111E68  7C 80 00 78 */	andc r0, r4, r0
/* 80114E6C 00111E6C  54 00 00 1E */	rlwinm r0, r0, 0, 0, 0xf
/* 80114E70 00111E70  7C A0 03 78 */	or r0, r5, r0
/* 80114E74 00111E74  90 03 00 18 */	stw r0, 0x18(r3)
/* 80114E78 00111E78  80 83 01 08 */	lwz r4, 0x108(r3)
/* 80114E7C 00111E7C  28 04 00 00 */	cmplwi r4, 0
/* 80114E80 00111E80  40 82 00 18 */	bne lbl_80114E98
/* 80114E84 00111E84  38 00 00 00 */	li r0, 0
/* 80114E88 00111E88  90 03 00 90 */	stw r0, 0x90(r3)
/* 80114E8C 00111E8C  98 03 01 F8 */	stb r0, 0x1f8(r3)
/* 80114E90 00111E90  98 03 01 F9 */	stb r0, 0x1f9(r3)
/* 80114E94 00111E94  48 00 00 A4 */	b lbl_80114F38
lbl_80114E98:
/* 80114E98 00111E98  80 03 01 0C */	lwz r0, 0x10c(r3)
/* 80114E9C 00111E9C  7C 04 00 40 */	cmplw r4, r0
/* 80114EA0 00111EA0  41 82 00 40 */	beq lbl_80114EE0
/* 80114EA4 00111EA4  80 C3 00 90 */	lwz r6, 0x90(r3)
/* 80114EA8 00111EA8  54 85 00 1E */	rlwinm r5, r4, 0, 0, 0xf
/* 80114EAC 00111EAC  38 80 00 01 */	li r4, 1
/* 80114EB0 00111EB0  38 00 00 00 */	li r0, 0
/* 80114EB4 00111EB4  7C C5 2B 78 */	or r5, r6, r5
/* 80114EB8 00111EB8  90 A3 00 90 */	stw r5, 0x90(r3)
/* 80114EBC 00111EBC  80 A3 00 18 */	lwz r5, 0x18(r3)
/* 80114EC0 00111EC0  80 C3 00 90 */	lwz r6, 0x90(r3)
/* 80114EC4 00111EC4  54 A5 00 1E */	rlwinm r5, r5, 0, 0, 0xf
/* 80114EC8 00111EC8  60 A5 FF FF */	ori r5, r5, 0xffff
/* 80114ECC 00111ECC  7C C5 28 38 */	and r5, r6, r5
/* 80114ED0 00111ED0  90 A3 00 90 */	stw r5, 0x90(r3)
/* 80114ED4 00111ED4  98 83 01 F8 */	stb r4, 0x1f8(r3)
/* 80114ED8 00111ED8  98 03 01 F9 */	stb r0, 0x1f9(r3)
/* 80114EDC 00111EDC  48 00 00 5C */	b lbl_80114F38
lbl_80114EE0:
/* 80114EE0 00111EE0  88 A3 01 F9 */	lbz r5, 0x1f9(r3)
/* 80114EE4 00111EE4  38 80 00 08 */	li r4, 8
/* 80114EE8 00111EE8  38 05 00 01 */	addi r0, r5, 1
/* 80114EEC 00111EEC  98 03 01 F9 */	stb r0, 0x1f9(r3)
/* 80114EF0 00111EF0  88 03 01 F8 */	lbz r0, 0x1f8(r3)
/* 80114EF4 00111EF4  88 A3 01 F9 */	lbz r5, 0x1f9(r3)
/* 80114EF8 00111EF8  7C 00 07 74 */	extsb r0, r0
/* 80114EFC 00111EFC  2C 00 00 01 */	cmpwi r0, 1
/* 80114F00 00111F00  7C A0 07 74 */	extsb r0, r5
/* 80114F04 00111F04  40 82 00 08 */	bne lbl_80114F0C
/* 80114F08 00111F08  38 80 00 10 */	li r4, 0x10
lbl_80114F0C:
/* 80114F0C 00111F0C  7C 00 20 00 */	cmpw r0, r4
/* 80114F10 00111F10  41 80 00 28 */	blt lbl_80114F38
/* 80114F14 00111F14  80 A3 01 08 */	lwz r5, 0x108(r3)
/* 80114F18 00111F18  38 80 00 02 */	li r4, 2
/* 80114F1C 00111F1C  80 C3 00 90 */	lwz r6, 0x90(r3)
/* 80114F20 00111F20  38 00 00 00 */	li r0, 0
/* 80114F24 00111F24  54 A5 00 1E */	rlwinm r5, r5, 0, 0, 0xf
/* 80114F28 00111F28  7C C5 2B 78 */	or r5, r6, r5
/* 80114F2C 00111F2C  90 A3 00 90 */	stw r5, 0x90(r3)
/* 80114F30 00111F30  98 83 01 F8 */	stb r4, 0x1f8(r3)
/* 80114F34 00111F34  98 03 01 F9 */	stb r0, 0x1f9(r3)
lbl_80114F38:
/* 80114F38 00111F38  80 A3 01 0C */	lwz r5, 0x10c(r3)
/* 80114F3C 00111F3C  80 03 01 08 */	lwz r0, 0x108(r3)
/* 80114F40 00111F40  80 83 01 80 */	lwz r4, 0x180(r3)
/* 80114F44 00111F44  7C A0 02 78 */	xor r0, r5, r0
/* 80114F48 00111F48  7C A0 00 38 */	and r0, r5, r0
/* 80114F4C 00111F4C  54 00 00 1E */	rlwinm r0, r0, 0, 0, 0xf
/* 80114F50 00111F50  7C 80 03 78 */	or r0, r4, r0
/* 80114F54 00111F54  90 03 01 80 */	stw r0, 0x180(r3)
/* 80114F58 00111F58  4E 80 00 20 */	blr 

.global BtlPad_WorkInit
BtlPad_WorkInit:
/* 80114F5C 00111F5C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80114F60 00111F60  38 80 00 00 */	li r4, 0
/* 80114F64 00111F64  38 00 00 02 */	li r0, 2
/* 80114F68 00111F68  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 80114F6C 00111F6C  7C 9E 23 78 */	mr r30, r4
/* 80114F70 00111F70  7C 9F 23 78 */	mr r31, r4
/* 80114F74 00111F74  7C 8C 23 78 */	mr r12, r4
/* 80114F78 00111F78  7C 8B 23 78 */	mr r11, r4
/* 80114F7C 00111F7C  7C 8A 23 78 */	mr r10, r4
/* 80114F80 00111F80  7C 89 23 78 */	mr r9, r4
/* 80114F84 00111F84  7C 88 23 78 */	mr r8, r4
/* 80114F88 00111F88  7C 87 23 78 */	mr r7, r4
/* 80114F8C 00111F8C  7C 86 23 78 */	mr r6, r4
/* 80114F90 00111F90  7C 85 23 78 */	mr r5, r4
/* 80114F94 00111F94  7C 09 03 A6 */	mtctr r0
lbl_80114F98:
/* 80114F98 00111F98  7F A3 22 14 */	add r29, r3, r4
/* 80114F9C 00111F9C  38 84 00 0C */	addi r4, r4, 0xc
/* 80114FA0 00111FA0  B3 DD 00 00 */	sth r30, 0(r29)
/* 80114FA4 00111FA4  9B FD 00 02 */	stb r31, 2(r29)
/* 80114FA8 00111FA8  99 9D 00 03 */	stb r12, 3(r29)
/* 80114FAC 00111FAC  99 7D 00 04 */	stb r11, 4(r29)
/* 80114FB0 00111FB0  99 5D 00 05 */	stb r10, 5(r29)
/* 80114FB4 00111FB4  99 3D 00 06 */	stb r9, 6(r29)
/* 80114FB8 00111FB8  99 1D 00 07 */	stb r8, 7(r29)
/* 80114FBC 00111FBC  98 FD 00 08 */	stb r7, 8(r29)
/* 80114FC0 00111FC0  98 DD 00 09 */	stb r6, 9(r29)
/* 80114FC4 00111FC4  98 BD 00 0A */	stb r5, 0xa(r29)
/* 80114FC8 00111FC8  42 00 FF D0 */	bdnz lbl_80114F98
/* 80114FCC 00111FCC  38 00 00 1E */	li r0, 0x1e
/* 80114FD0 00111FD0  38 C0 00 00 */	li r6, 0
/* 80114FD4 00111FD4  38 80 00 00 */	li r4, 0
/* 80114FD8 00111FD8  7C 09 03 A6 */	mtctr r0
lbl_80114FDC:
/* 80114FDC 00111FDC  7C A3 22 14 */	add r5, r3, r4
/* 80114FE0 00111FE0  38 84 00 04 */	addi r4, r4, 4
/* 80114FE4 00111FE4  90 C5 00 18 */	stw r6, 0x18(r5)
/* 80114FE8 00111FE8  90 C5 00 90 */	stw r6, 0x90(r5)
/* 80114FEC 00111FEC  90 C5 01 08 */	stw r6, 0x108(r5)
/* 80114FF0 00111FF0  42 00 FF EC */	bdnz lbl_80114FDC
/* 80114FF4 00111FF4  38 00 00 00 */	li r0, 0
/* 80114FF8 00111FF8  98 03 01 F8 */	stb r0, 0x1f8(r3)
/* 80114FFC 00111FFC  98 03 01 F9 */	stb r0, 0x1f9(r3)
/* 80115000 00112000  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80115004 00112004  38 21 00 20 */	addi r1, r1, 0x20
/* 80115008 00112008  4E 80 00 20 */	blr 

.global BattlePadManager
BattlePadManager:
/* 8011500C 0011200C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80115010 00112010  7C 08 02 A6 */	mflr r0
/* 80115014 00112014  90 01 00 14 */	stw r0, 0x14(r1)
/* 80115018 00112018  BF C1 00 08 */	stmw r30, 8(r1)
/* 8011501C 0011201C  3B C0 00 00 */	li r30, 0
/* 80115020 00112020  3B E0 00 00 */	li r31, 0
lbl_80115024:
/* 80115024 00112024  80 0D 17 10 */	lwz r0, lbl_80418970@sda21(r13)
/* 80115028 00112028  38 7F 0F 2C */	addi r3, r31, 0xf2c
/* 8011502C 0011202C  7F C4 F3 78 */	mr r4, r30
/* 80115030 00112030  7C 60 1A 14 */	add r3, r0, r3
/* 80115034 00112034  4B FF FC 49 */	bl BtlPad_WorkUpdate
/* 80115038 00112038  3B DE 00 01 */	addi r30, r30, 1
/* 8011503C 0011203C  3B FF 01 FC */	addi r31, r31, 0x1fc
/* 80115040 00112040  2C 1E 00 04 */	cmpwi r30, 4
/* 80115044 00112044  41 80 FF E0 */	blt lbl_80115024
/* 80115048 00112048  BB C1 00 08 */	lmw r30, 8(r1)
/* 8011504C 0011204C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80115050 00112050  7C 08 03 A6 */	mtlr r0
/* 80115054 00112054  38 21 00 10 */	addi r1, r1, 0x10
/* 80115058 00112058  4E 80 00 20 */	blr 

.global BattlePadInit
BattlePadInit:
/* 8011505C 0011205C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80115060 00112060  7C 08 02 A6 */	mflr r0
/* 80115064 00112064  90 01 00 14 */	stw r0, 0x14(r1)
/* 80115068 00112068  BF C1 00 08 */	stmw r30, 8(r1)
/* 8011506C 0011206C  3B C0 00 00 */	li r30, 0
/* 80115070 00112070  3B E0 00 00 */	li r31, 0
lbl_80115074:
/* 80115074 00112074  80 0D 17 10 */	lwz r0, lbl_80418970@sda21(r13)
/* 80115078 00112078  38 7F 0F 2C */	addi r3, r31, 0xf2c
/* 8011507C 0011207C  7C 60 1A 14 */	add r3, r0, r3
/* 80115080 00112080  4B FF FE DD */	bl BtlPad_WorkInit
/* 80115084 00112084  3B DE 00 01 */	addi r30, r30, 1
/* 80115088 00112088  3B FF 01 FC */	addi r31, r31, 0x1fc
/* 8011508C 0011208C  2C 1E 00 04 */	cmpwi r30, 4
/* 80115090 00112090  41 80 FF E4 */	blt lbl_80115074
/* 80115094 00112094  BB C1 00 08 */	lmw r30, 8(r1)
/* 80115098 00112098  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8011509C 0011209C  7C 08 03 A6 */	mtlr r0
/* 801150A0 001120A0  38 21 00 10 */	addi r1, r1, 0x10
/* 801150A4 001120A4  4E 80 00 20 */	blr 
