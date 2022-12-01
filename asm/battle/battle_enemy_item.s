.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global _check_status_recover_item
_check_status_recover_item:
/* 801F499C 001F199C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801F49A0 001F19A0  7C 08 02 A6 */	mflr r0
/* 801F49A4 001F19A4  3C 80 80 31 */	lis r4, lbl_8030EE58@ha
/* 801F49A8 001F19A8  90 01 00 34 */	stw r0, 0x34(r1)
/* 801F49AC 001F19AC  38 84 EE 58 */	addi r4, r4, lbl_8030EE58@l
/* 801F49B0 001F19B0  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 801F49B4 001F19B4  7C 7B 1B 78 */	mr r27, r3
/* 801F49B8 001F19B8  83 A3 03 04 */	lwz r29, 0x304(r3)
/* 801F49BC 001F19BC  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 801F49C0 001F19C0  1C 1D 00 28 */	mulli r0, r29, 0x28
/* 801F49C4 001F19C4  7C BE 2B 78 */	mr r30, r5
/* 801F49C8 001F19C8  3B 85 04 28 */	addi r28, r5, 0x428
/* 801F49CC 001F19CC  7F E4 02 14 */	add r31, r4, r0
/* 801F49D0 001F19D0  87 5F 00 24 */	lwzu r26, 0x24(r31)
/* 801F49D4 001F19D4  4B F2 D5 9D */	bl BtlUnit_GetEnemyBelong
/* 801F49D8 001F19D8  88 1B 00 0C */	lbz r0, 0xc(r27)
/* 801F49DC 001F19DC  7C 66 07 74 */	extsb r6, r3
/* 801F49E0 001F19E0  80 BB 00 00 */	lwz r5, 0(r27)
/* 801F49E4 001F19E4  7F 83 E3 78 */	mr r3, r28
/* 801F49E8 001F19E8  7C 00 07 74 */	extsb r0, r0
/* 801F49EC 001F19EC  80 FA 00 64 */	lwz r7, 0x64(r26)
/* 801F49F0 001F19F0  54 00 18 38 */	slwi r0, r0, 3
/* 801F49F4 001F19F4  81 1A 00 68 */	lwz r8, 0x68(r26)
/* 801F49F8 001F19F8  7D 3E 02 14 */	add r9, r30, r0
/* 801F49FC 001F19FC  7F 44 D3 78 */	mr r4, r26
/* 801F4A00 001F1A00  88 09 00 0A */	lbz r0, 0xa(r9)
/* 801F4A04 001F1A04  7C 09 07 74 */	extsb r9, r0
/* 801F4A08 001F1A08  4B F0 5C 41 */	bl BattleSamplingEnemy
/* 801F4A0C 001F1A0C  88 1C 0A 6C */	lbz r0, 0xa6c(r28)
/* 801F4A10 001F1A10  7C 00 07 75 */	extsb. r0, r0
/* 801F4A14 001F1A14  41 81 00 0C */	bgt .L_801F4A20
/* 801F4A18 001F1A18  38 60 00 00 */	li r3, 0
/* 801F4A1C 001F1A1C  48 00 01 44 */	b .L_801F4B60
.L_801F4A20:
/* 801F4A20 001F1A20  3B 40 00 00 */	li r26, 0
/* 801F4A24 001F1A24  48 00 01 28 */	b .L_801F4B4C
.L_801F4A28:
/* 801F4A28 001F1A28  38 1A 0A 6D */	addi r0, r26, 0xa6d
/* 801F4A2C 001F1A2C  7F C3 F3 78 */	mr r3, r30
/* 801F4A30 001F1A30  7C 1C 00 AE */	lbzx r0, r28, r0
/* 801F4A34 001F1A34  7C 00 07 74 */	extsb r0, r0
/* 801F4A38 001F1A38  1C 80 00 24 */	mulli r4, r0, 0x24
/* 801F4A3C 001F1A3C  38 04 00 04 */	addi r0, r4, 4
/* 801F4A40 001F1A40  7C 9C 02 AE */	lhax r4, r28, r0
/* 801F4A44 001F1A44  4B EF EF 35 */	bl BattleGetUnitPtr
/* 801F4A48 001F1A48  80 1B 01 04 */	lwz r0, 0x104(r27)
/* 801F4A4C 001F1A4C  7C 79 1B 78 */	mr r25, r3
/* 801F4A50 001F1A50  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801F4A54 001F1A54  40 82 00 F4 */	bne .L_801F4B48
/* 801F4A58 001F1A58  2C 1D 00 99 */	cmpwi r29, 0x99
/* 801F4A5C 001F1A5C  41 82 00 08 */	beq .L_801F4A64
/* 801F4A60 001F1A60  48 00 00 E8 */	b .L_801F4B48
.L_801F4A64:
/* 801F4A64 001F1A64  38 80 00 01 */	li r4, 1
/* 801F4A68 001F1A68  4B F2 D8 C9 */	bl BtlUnit_CheckStatus
/* 801F4A6C 001F1A6C  2C 03 00 00 */	cmpwi r3, 0
/* 801F4A70 001F1A70  40 82 00 CC */	bne .L_801F4B3C
/* 801F4A74 001F1A74  7F 23 CB 78 */	mr r3, r25
/* 801F4A78 001F1A78  38 80 00 02 */	li r4, 2
/* 801F4A7C 001F1A7C  4B F2 D8 B5 */	bl BtlUnit_CheckStatus
/* 801F4A80 001F1A80  2C 03 00 00 */	cmpwi r3, 0
/* 801F4A84 001F1A84  40 82 00 B8 */	bne .L_801F4B3C
/* 801F4A88 001F1A88  7F 23 CB 78 */	mr r3, r25
/* 801F4A8C 001F1A8C  38 80 00 03 */	li r4, 3
/* 801F4A90 001F1A90  4B F2 D8 A1 */	bl BtlUnit_CheckStatus
/* 801F4A94 001F1A94  2C 03 00 00 */	cmpwi r3, 0
/* 801F4A98 001F1A98  40 82 00 A4 */	bne .L_801F4B3C
/* 801F4A9C 001F1A9C  7F 23 CB 78 */	mr r3, r25
/* 801F4AA0 001F1AA0  38 80 00 04 */	li r4, 4
/* 801F4AA4 001F1AA4  4B F2 D8 8D */	bl BtlUnit_CheckStatus
/* 801F4AA8 001F1AA8  2C 03 00 00 */	cmpwi r3, 0
/* 801F4AAC 001F1AAC  40 82 00 90 */	bne .L_801F4B3C
/* 801F4AB0 001F1AB0  7F 23 CB 78 */	mr r3, r25
/* 801F4AB4 001F1AB4  38 80 00 05 */	li r4, 5
/* 801F4AB8 001F1AB8  4B F2 D8 79 */	bl BtlUnit_CheckStatus
/* 801F4ABC 001F1ABC  2C 03 00 00 */	cmpwi r3, 0
/* 801F4AC0 001F1AC0  40 82 00 7C */	bne .L_801F4B3C
/* 801F4AC4 001F1AC4  7F 23 CB 78 */	mr r3, r25
/* 801F4AC8 001F1AC8  38 80 00 06 */	li r4, 6
/* 801F4ACC 001F1ACC  4B F2 D8 65 */	bl BtlUnit_CheckStatus
/* 801F4AD0 001F1AD0  2C 03 00 00 */	cmpwi r3, 0
/* 801F4AD4 001F1AD4  40 82 00 68 */	bne .L_801F4B3C
/* 801F4AD8 001F1AD8  7F 23 CB 78 */	mr r3, r25
/* 801F4ADC 001F1ADC  38 80 00 08 */	li r4, 8
/* 801F4AE0 001F1AE0  4B F2 D8 51 */	bl BtlUnit_CheckStatus
/* 801F4AE4 001F1AE4  2C 03 00 00 */	cmpwi r3, 0
/* 801F4AE8 001F1AE8  40 82 00 54 */	bne .L_801F4B3C
/* 801F4AEC 001F1AEC  7F 23 CB 78 */	mr r3, r25
/* 801F4AF0 001F1AF0  38 80 00 09 */	li r4, 9
/* 801F4AF4 001F1AF4  4B F2 D8 3D */	bl BtlUnit_CheckStatus
/* 801F4AF8 001F1AF8  2C 03 00 00 */	cmpwi r3, 0
/* 801F4AFC 001F1AFC  40 82 00 40 */	bne .L_801F4B3C
/* 801F4B00 001F1B00  7F 23 CB 78 */	mr r3, r25
/* 801F4B04 001F1B04  38 80 00 0B */	li r4, 0xb
/* 801F4B08 001F1B08  4B F2 D8 29 */	bl BtlUnit_CheckStatus
/* 801F4B0C 001F1B0C  2C 03 00 00 */	cmpwi r3, 0
/* 801F4B10 001F1B10  40 82 00 2C */	bne .L_801F4B3C
/* 801F4B14 001F1B14  7F 23 CB 78 */	mr r3, r25
/* 801F4B18 001F1B18  38 80 00 0F */	li r4, 0xf
/* 801F4B1C 001F1B1C  4B F2 D8 15 */	bl BtlUnit_CheckStatus
/* 801F4B20 001F1B20  2C 03 00 00 */	cmpwi r3, 0
/* 801F4B24 001F1B24  40 82 00 18 */	bne .L_801F4B3C
/* 801F4B28 001F1B28  7F 23 CB 78 */	mr r3, r25
/* 801F4B2C 001F1B2C  38 80 00 14 */	li r4, 0x14
/* 801F4B30 001F1B30  4B F2 D8 01 */	bl BtlUnit_CheckStatus
/* 801F4B34 001F1B34  2C 03 00 00 */	cmpwi r3, 0
/* 801F4B38 001F1B38  41 82 00 10 */	beq .L_801F4B48
.L_801F4B3C:
/* 801F4B3C 001F1B3C  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4B40 001F1B40  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4B44 001F1B44  48 00 00 1C */	b .L_801F4B60
.L_801F4B48:
/* 801F4B48 001F1B48  3B 5A 00 01 */	addi r26, r26, 1
.L_801F4B4C:
/* 801F4B4C 001F1B4C  88 1C 0A 6C */	lbz r0, 0xa6c(r28)
/* 801F4B50 001F1B50  7C 00 07 74 */	extsb r0, r0
/* 801F4B54 001F1B54  7C 1A 00 00 */	cmpw r26, r0
/* 801F4B58 001F1B58  41 80 FE D0 */	blt .L_801F4A28
/* 801F4B5C 001F1B5C  38 60 00 00 */	li r3, 0
.L_801F4B60:
/* 801F4B60 001F1B60  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 801F4B64 001F1B64  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801F4B68 001F1B68  7C 08 03 A6 */	mtlr r0
/* 801F4B6C 001F1B6C  38 21 00 30 */	addi r1, r1, 0x30
/* 801F4B70 001F1B70  4E 80 00 20 */	blr 

.global _check_status_support_item
_check_status_support_item:
/* 801F4B74 001F1B74  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801F4B78 001F1B78  7C 08 02 A6 */	mflr r0
/* 801F4B7C 001F1B7C  3C 80 80 31 */	lis r4, lbl_8030EE58@ha
/* 801F4B80 001F1B80  90 01 00 34 */	stw r0, 0x34(r1)
/* 801F4B84 001F1B84  38 84 EE 58 */	addi r4, r4, lbl_8030EE58@l
/* 801F4B88 001F1B88  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 801F4B8C 001F1B8C  7C 7B 1B 78 */	mr r27, r3
/* 801F4B90 001F1B90  83 A3 03 04 */	lwz r29, 0x304(r3)
/* 801F4B94 001F1B94  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 801F4B98 001F1B98  1C 1D 00 28 */	mulli r0, r29, 0x28
/* 801F4B9C 001F1B9C  7C BE 2B 78 */	mr r30, r5
/* 801F4BA0 001F1BA0  3B 85 04 28 */	addi r28, r5, 0x428
/* 801F4BA4 001F1BA4  7F E4 02 14 */	add r31, r4, r0
/* 801F4BA8 001F1BA8  87 5F 00 24 */	lwzu r26, 0x24(r31)
/* 801F4BAC 001F1BAC  4B F2 D3 C5 */	bl BtlUnit_GetEnemyBelong
/* 801F4BB0 001F1BB0  88 1B 00 0C */	lbz r0, 0xc(r27)
/* 801F4BB4 001F1BB4  7C 66 07 74 */	extsb r6, r3
/* 801F4BB8 001F1BB8  80 BB 00 00 */	lwz r5, 0(r27)
/* 801F4BBC 001F1BBC  7F 83 E3 78 */	mr r3, r28
/* 801F4BC0 001F1BC0  7C 00 07 74 */	extsb r0, r0
/* 801F4BC4 001F1BC4  80 FA 00 64 */	lwz r7, 0x64(r26)
/* 801F4BC8 001F1BC8  54 00 18 38 */	slwi r0, r0, 3
/* 801F4BCC 001F1BCC  81 1A 00 68 */	lwz r8, 0x68(r26)
/* 801F4BD0 001F1BD0  7D 3E 02 14 */	add r9, r30, r0
/* 801F4BD4 001F1BD4  7F 44 D3 78 */	mr r4, r26
/* 801F4BD8 001F1BD8  88 09 00 0A */	lbz r0, 0xa(r9)
/* 801F4BDC 001F1BDC  7C 09 07 74 */	extsb r9, r0
/* 801F4BE0 001F1BE0  4B F0 5A 69 */	bl BattleSamplingEnemy
/* 801F4BE4 001F1BE4  88 1C 0A 6C */	lbz r0, 0xa6c(r28)
/* 801F4BE8 001F1BE8  7C 00 07 75 */	extsb. r0, r0
/* 801F4BEC 001F1BEC  41 81 00 0C */	bgt .L_801F4BF8
/* 801F4BF0 001F1BF0  38 60 00 00 */	li r3, 0
/* 801F4BF4 001F1BF4  48 00 01 24 */	b .L_801F4D18
.L_801F4BF8:
/* 801F4BF8 001F1BF8  3B 40 00 00 */	li r26, 0
/* 801F4BFC 001F1BFC  48 00 01 08 */	b .L_801F4D04
.L_801F4C00:
/* 801F4C00 001F1C00  38 1A 0A 6D */	addi r0, r26, 0xa6d
/* 801F4C04 001F1C04  7F C3 F3 78 */	mr r3, r30
/* 801F4C08 001F1C08  7C 1C 00 AE */	lbzx r0, r28, r0
/* 801F4C0C 001F1C0C  7C 00 07 74 */	extsb r0, r0
/* 801F4C10 001F1C10  1C 80 00 24 */	mulli r4, r0, 0x24
/* 801F4C14 001F1C14  38 04 00 04 */	addi r0, r4, 4
/* 801F4C18 001F1C18  7C 9C 02 AE */	lhax r4, r28, r0
/* 801F4C1C 001F1C1C  4B EF ED 5D */	bl BattleGetUnitPtr
/* 801F4C20 001F1C20  80 1B 01 04 */	lwz r0, 0x104(r27)
/* 801F4C24 001F1C24  7C 79 1B 78 */	mr r25, r3
/* 801F4C28 001F1C28  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801F4C2C 001F1C2C  40 82 00 D4 */	bne .L_801F4D00
/* 801F4C30 001F1C30  2C 1D 00 88 */	cmpwi r29, 0x88
/* 801F4C34 001F1C34  41 82 00 B0 */	beq .L_801F4CE4
/* 801F4C38 001F1C38  40 80 00 14 */	bge .L_801F4C4C
/* 801F4C3C 001F1C3C  2C 1D 00 86 */	cmpwi r29, 0x86
/* 801F4C40 001F1C40  41 82 00 6C */	beq .L_801F4CAC
/* 801F4C44 001F1C44  40 80 00 84 */	bge .L_801F4CC8
/* 801F4C48 001F1C48  48 00 00 B8 */	b .L_801F4D00
.L_801F4C4C:
/* 801F4C4C 001F1C4C  2C 1D 00 8F */	cmpwi r29, 0x8f
/* 801F4C50 001F1C50  41 82 00 40 */	beq .L_801F4C90
/* 801F4C54 001F1C54  40 80 00 AC */	bge .L_801F4D00
/* 801F4C58 001F1C58  2C 1D 00 8E */	cmpwi r29, 0x8e
/* 801F4C5C 001F1C5C  40 80 00 08 */	bge .L_801F4C64
/* 801F4C60 001F1C60  48 00 00 A0 */	b .L_801F4D00
.L_801F4C64:
/* 801F4C64 001F1C64  4B F2 D1 05 */	bl BtlUnit_CanActStatus
/* 801F4C68 001F1C68  2C 03 00 00 */	cmpwi r3, 0
/* 801F4C6C 001F1C6C  41 82 00 94 */	beq .L_801F4D00
/* 801F4C70 001F1C70  7F 23 CB 78 */	mr r3, r25
/* 801F4C74 001F1C74  38 80 00 0A */	li r4, 0xa
/* 801F4C78 001F1C78  4B F2 D6 B9 */	bl BtlUnit_CheckStatus
/* 801F4C7C 001F1C7C  2C 03 00 00 */	cmpwi r3, 0
/* 801F4C80 001F1C80  40 82 00 80 */	bne .L_801F4D00
/* 801F4C84 001F1C84  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4C88 001F1C88  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4C8C 001F1C8C  48 00 00 8C */	b .L_801F4D18
.L_801F4C90:
/* 801F4C90 001F1C90  38 80 00 0E */	li r4, 0xe
/* 801F4C94 001F1C94  4B F2 D6 9D */	bl BtlUnit_CheckStatus
/* 801F4C98 001F1C98  2C 03 00 00 */	cmpwi r3, 0
/* 801F4C9C 001F1C9C  40 82 00 64 */	bne .L_801F4D00
/* 801F4CA0 001F1CA0  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4CA4 001F1CA4  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4CA8 001F1CA8  48 00 00 70 */	b .L_801F4D18
.L_801F4CAC:
/* 801F4CAC 001F1CAC  38 80 00 12 */	li r4, 0x12
/* 801F4CB0 001F1CB0  4B F2 D6 81 */	bl BtlUnit_CheckStatus
/* 801F4CB4 001F1CB4  2C 03 00 00 */	cmpwi r3, 0
/* 801F4CB8 001F1CB8  40 82 00 48 */	bne .L_801F4D00
/* 801F4CBC 001F1CBC  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4CC0 001F1CC0  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4CC4 001F1CC4  48 00 00 54 */	b .L_801F4D18
.L_801F4CC8:
/* 801F4CC8 001F1CC8  38 80 00 06 */	li r4, 6
/* 801F4CCC 001F1CCC  4B F2 D6 65 */	bl BtlUnit_CheckStatus
/* 801F4CD0 001F1CD0  2C 03 00 00 */	cmpwi r3, 0
/* 801F4CD4 001F1CD4  40 82 00 2C */	bne .L_801F4D00
/* 801F4CD8 001F1CD8  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4CDC 001F1CDC  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4CE0 001F1CE0  48 00 00 38 */	b .L_801F4D18
.L_801F4CE4:
/* 801F4CE4 001F1CE4  38 80 00 07 */	li r4, 7
/* 801F4CE8 001F1CE8  4B F2 D6 49 */	bl BtlUnit_CheckStatus
/* 801F4CEC 001F1CEC  2C 03 00 00 */	cmpwi r3, 0
/* 801F4CF0 001F1CF0  40 82 00 10 */	bne .L_801F4D00
/* 801F4CF4 001F1CF4  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4CF8 001F1CF8  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4CFC 001F1CFC  48 00 00 1C */	b .L_801F4D18
.L_801F4D00:
/* 801F4D00 001F1D00  3B 5A 00 01 */	addi r26, r26, 1
.L_801F4D04:
/* 801F4D04 001F1D04  88 1C 0A 6C */	lbz r0, 0xa6c(r28)
/* 801F4D08 001F1D08  7C 00 07 74 */	extsb r0, r0
/* 801F4D0C 001F1D0C  7C 1A 00 00 */	cmpw r26, r0
/* 801F4D10 001F1D10  41 80 FE F0 */	blt .L_801F4C00
/* 801F4D14 001F1D14  38 60 00 00 */	li r3, 0
.L_801F4D18:
/* 801F4D18 001F1D18  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 801F4D1C 001F1D1C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801F4D20 001F1D20  7C 08 03 A6 */	mtlr r0
/* 801F4D24 001F1D24  38 21 00 30 */	addi r1, r1, 0x30
/* 801F4D28 001F1D28  4E 80 00 20 */	blr 

.global _check_status_attack_item
_check_status_attack_item:
/* 801F4D2C 001F1D2C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801F4D30 001F1D30  7C 08 02 A6 */	mflr r0
/* 801F4D34 001F1D34  3C 80 80 31 */	lis r4, lbl_8030EE58@ha
/* 801F4D38 001F1D38  90 01 00 34 */	stw r0, 0x34(r1)
/* 801F4D3C 001F1D3C  38 84 EE 58 */	addi r4, r4, lbl_8030EE58@l
/* 801F4D40 001F1D40  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 801F4D44 001F1D44  7C 7A 1B 78 */	mr r26, r3
/* 801F4D48 001F1D48  83 A3 03 04 */	lwz r29, 0x304(r3)
/* 801F4D4C 001F1D4C  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 801F4D50 001F1D50  1C 1D 00 28 */	mulli r0, r29, 0x28
/* 801F4D54 001F1D54  7C BE 2B 78 */	mr r30, r5
/* 801F4D58 001F1D58  3B 85 04 28 */	addi r28, r5, 0x428
/* 801F4D5C 001F1D5C  7F E4 02 14 */	add r31, r4, r0
/* 801F4D60 001F1D60  87 7F 00 24 */	lwzu r27, 0x24(r31)
/* 801F4D64 001F1D64  4B F2 D2 0D */	bl BtlUnit_GetEnemyBelong
/* 801F4D68 001F1D68  88 1A 00 0C */	lbz r0, 0xc(r26)
/* 801F4D6C 001F1D6C  7C 66 07 74 */	extsb r6, r3
/* 801F4D70 001F1D70  80 BA 00 00 */	lwz r5, 0(r26)
/* 801F4D74 001F1D74  7F 83 E3 78 */	mr r3, r28
/* 801F4D78 001F1D78  7C 00 07 74 */	extsb r0, r0
/* 801F4D7C 001F1D7C  80 FB 00 64 */	lwz r7, 0x64(r27)
/* 801F4D80 001F1D80  54 00 18 38 */	slwi r0, r0, 3
/* 801F4D84 001F1D84  81 1B 00 68 */	lwz r8, 0x68(r27)
/* 801F4D88 001F1D88  7D 3E 02 14 */	add r9, r30, r0
/* 801F4D8C 001F1D8C  7F 64 DB 78 */	mr r4, r27
/* 801F4D90 001F1D90  88 09 00 0A */	lbz r0, 0xa(r9)
/* 801F4D94 001F1D94  7C 09 07 74 */	extsb r9, r0
/* 801F4D98 001F1D98  4B F0 58 B1 */	bl BattleSamplingEnemy
/* 801F4D9C 001F1D9C  88 1C 0A 6C */	lbz r0, 0xa6c(r28)
/* 801F4DA0 001F1DA0  7C 00 07 75 */	extsb. r0, r0
/* 801F4DA4 001F1DA4  41 81 00 0C */	bgt .L_801F4DB0
/* 801F4DA8 001F1DA8  38 60 00 00 */	li r3, 0
/* 801F4DAC 001F1DAC  48 00 01 44 */	b .L_801F4EF0
.L_801F4DB0:
/* 801F4DB0 001F1DB0  3B 60 00 00 */	li r27, 0
/* 801F4DB4 001F1DB4  48 00 01 28 */	b .L_801F4EDC
.L_801F4DB8:
/* 801F4DB8 001F1DB8  38 1B 0A 6D */	addi r0, r27, 0xa6d
/* 801F4DBC 001F1DBC  7F C3 F3 78 */	mr r3, r30
/* 801F4DC0 001F1DC0  7C 1C 00 AE */	lbzx r0, r28, r0
/* 801F4DC4 001F1DC4  7C 00 07 74 */	extsb r0, r0
/* 801F4DC8 001F1DC8  1C 80 00 24 */	mulli r4, r0, 0x24
/* 801F4DCC 001F1DCC  38 04 00 04 */	addi r0, r4, 4
/* 801F4DD0 001F1DD0  7C 9C 02 AE */	lhax r4, r28, r0
/* 801F4DD4 001F1DD4  4B EF EB A5 */	bl BattleGetUnitPtr
/* 801F4DD8 001F1DD8  80 1A 01 04 */	lwz r0, 0x104(r26)
/* 801F4DDC 001F1DDC  7C 79 1B 78 */	mr r25, r3
/* 801F4DE0 001F1DE0  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801F4DE4 001F1DE4  40 82 00 F4 */	bne .L_801F4ED8
/* 801F4DE8 001F1DE8  38 1D FF 77 */	addi r0, r29, -137
/* 801F4DEC 001F1DEC  28 00 00 0A */	cmplwi r0, 0xa
/* 801F4DF0 001F1DF0  41 81 00 E8 */	bgt .L_801F4ED8
/* 801F4DF4 001F1DF4  3C 80 80 3B */	lis r4, lbl_803AA0F0@ha
/* 801F4DF8 001F1DF8  54 00 10 3A */	slwi r0, r0, 2
/* 801F4DFC 001F1DFC  38 84 A0 F0 */	addi r4, r4, lbl_803AA0F0@l
/* 801F4E00 001F1E00  7C 04 00 2E */	lwzx r0, r4, r0
/* 801F4E04 001F1E04  7C 09 03 A6 */	mtctr r0
/* 801F4E08 001F1E08  4E 80 04 20 */	bctr 
/* 801F4E0C 001F1E0C  7F 23 CB 78 */	mr r3, r25
/* 801F4E10 001F1E10  4B F2 CF 59 */	bl BtlUnit_CanActStatus
/* 801F4E14 001F1E14  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E18 001F1E18  41 82 00 C0 */	beq .L_801F4ED8
/* 801F4E1C 001F1E1C  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4E20 001F1E20  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4E24 001F1E24  48 00 00 CC */	b .L_801F4EF0
/* 801F4E28 001F1E28  4B F2 CF 41 */	bl BtlUnit_CanActStatus
/* 801F4E2C 001F1E2C  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E30 001F1E30  41 82 00 A8 */	beq .L_801F4ED8
/* 801F4E34 001F1E34  7F 23 CB 78 */	mr r3, r25
/* 801F4E38 001F1E38  38 80 00 0B */	li r4, 0xb
/* 801F4E3C 001F1E3C  4B F2 D4 F5 */	bl BtlUnit_CheckStatus
/* 801F4E40 001F1E40  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E44 001F1E44  40 82 00 94 */	bne .L_801F4ED8
/* 801F4E48 001F1E48  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4E4C 001F1E4C  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4E50 001F1E50  48 00 00 A0 */	b .L_801F4EF0
/* 801F4E54 001F1E54  4B F2 CF 15 */	bl BtlUnit_CanActStatus
/* 801F4E58 001F1E58  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E5C 001F1E5C  41 82 00 7C */	beq .L_801F4ED8
/* 801F4E60 001F1E60  7F 23 CB 78 */	mr r3, r25
/* 801F4E64 001F1E64  38 80 00 0F */	li r4, 0xf
/* 801F4E68 001F1E68  4B F2 D4 C9 */	bl BtlUnit_CheckStatus
/* 801F4E6C 001F1E6C  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E70 001F1E70  40 82 00 68 */	bne .L_801F4ED8
/* 801F4E74 001F1E74  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4E78 001F1E78  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4E7C 001F1E7C  48 00 00 74 */	b .L_801F4EF0
/* 801F4E80 001F1E80  4B F2 CE E9 */	bl BtlUnit_CanActStatus
/* 801F4E84 001F1E84  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E88 001F1E88  41 82 00 50 */	beq .L_801F4ED8
/* 801F4E8C 001F1E8C  7F 23 CB 78 */	mr r3, r25
/* 801F4E90 001F1E90  38 80 00 05 */	li r4, 5
/* 801F4E94 001F1E94  4B F2 D4 9D */	bl BtlUnit_CheckStatus
/* 801F4E98 001F1E98  2C 03 00 00 */	cmpwi r3, 0
/* 801F4E9C 001F1E9C  40 82 00 3C */	bne .L_801F4ED8
/* 801F4EA0 001F1EA0  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4EA4 001F1EA4  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4EA8 001F1EA8  48 00 00 48 */	b .L_801F4EF0
/* 801F4EAC 001F1EAC  4B F2 CE BD */	bl BtlUnit_CanActStatus
/* 801F4EB0 001F1EB0  2C 03 00 00 */	cmpwi r3, 0
/* 801F4EB4 001F1EB4  41 82 00 24 */	beq .L_801F4ED8
/* 801F4EB8 001F1EB8  7F 23 CB 78 */	mr r3, r25
/* 801F4EBC 001F1EBC  38 80 00 03 */	li r4, 3
/* 801F4EC0 001F1EC0  4B F2 D4 71 */	bl BtlUnit_CheckStatus
/* 801F4EC4 001F1EC4  2C 03 00 00 */	cmpwi r3, 0
/* 801F4EC8 001F1EC8  40 82 00 10 */	bne .L_801F4ED8
/* 801F4ECC 001F1ECC  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4ED0 001F1ED0  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4ED4 001F1ED4  48 00 00 1C */	b .L_801F4EF0
.L_801F4ED8:
/* 801F4ED8 001F1ED8  3B 7B 00 01 */	addi r27, r27, 1
.L_801F4EDC:
/* 801F4EDC 001F1EDC  88 1C 0A 6C */	lbz r0, 0xa6c(r28)
/* 801F4EE0 001F1EE0  7C 00 07 74 */	extsb r0, r0
/* 801F4EE4 001F1EE4  7C 1B 00 00 */	cmpw r27, r0
/* 801F4EE8 001F1EE8  41 80 FE D0 */	blt .L_801F4DB8
/* 801F4EEC 001F1EEC  38 60 00 00 */	li r3, 0
.L_801F4EF0:
/* 801F4EF0 001F1EF0  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 801F4EF4 001F1EF4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801F4EF8 001F1EF8  7C 08 03 A6 */	mtlr r0
/* 801F4EFC 001F1EFC  38 21 00 30 */	addi r1, r1, 0x30
/* 801F4F00 001F1F00  4E 80 00 20 */	blr 

.global _check_attack_item
_check_attack_item:
/* 801F4F04 001F1F04  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801F4F08 001F1F08  7C 08 02 A6 */	mflr r0
/* 801F4F0C 001F1F0C  3C 80 80 31 */	lis r4, lbl_8030EE58@ha
/* 801F4F10 001F1F10  90 01 00 24 */	stw r0, 0x24(r1)
/* 801F4F14 001F1F14  38 84 EE 58 */	addi r4, r4, lbl_8030EE58@l
/* 801F4F18 001F1F18  BF 41 00 08 */	stmw r26, 8(r1)
/* 801F4F1C 001F1F1C  7C 7C 1B 78 */	mr r28, r3
/* 801F4F20 001F1F20  83 63 03 04 */	lwz r27, 0x304(r3)
/* 801F4F24 001F1F24  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 801F4F28 001F1F28  1C 1B 00 28 */	mulli r0, r27, 0x28
/* 801F4F2C 001F1F2C  7C BE 2B 78 */	mr r30, r5
/* 801F4F30 001F1F30  3B A5 04 28 */	addi r29, r5, 0x428
/* 801F4F34 001F1F34  7F E4 02 14 */	add r31, r4, r0
/* 801F4F38 001F1F38  87 5F 00 24 */	lwzu r26, 0x24(r31)
/* 801F4F3C 001F1F3C  4B F2 D0 35 */	bl BtlUnit_GetEnemyBelong
/* 801F4F40 001F1F40  88 1C 00 0C */	lbz r0, 0xc(r28)
/* 801F4F44 001F1F44  7C 66 07 74 */	extsb r6, r3
/* 801F4F48 001F1F48  80 BC 00 00 */	lwz r5, 0(r28)
/* 801F4F4C 001F1F4C  7F A3 EB 78 */	mr r3, r29
/* 801F4F50 001F1F50  7C 00 07 74 */	extsb r0, r0
/* 801F4F54 001F1F54  80 FA 00 64 */	lwz r7, 0x64(r26)
/* 801F4F58 001F1F58  54 00 18 38 */	slwi r0, r0, 3
/* 801F4F5C 001F1F5C  81 1A 00 68 */	lwz r8, 0x68(r26)
/* 801F4F60 001F1F60  7D 3E 02 14 */	add r9, r30, r0
/* 801F4F64 001F1F64  7F 44 D3 78 */	mr r4, r26
/* 801F4F68 001F1F68  88 09 00 0A */	lbz r0, 0xa(r9)
/* 801F4F6C 001F1F6C  7C 09 07 74 */	extsb r9, r0
/* 801F4F70 001F1F70  4B F0 56 D9 */	bl BattleSamplingEnemy
/* 801F4F74 001F1F74  88 1D 0A 6C */	lbz r0, 0xa6c(r29)
/* 801F4F78 001F1F78  7C 00 07 75 */	extsb. r0, r0
/* 801F4F7C 001F1F7C  41 81 00 0C */	bgt .L_801F4F88
/* 801F4F80 001F1F80  38 60 00 00 */	li r3, 0
/* 801F4F84 001F1F84  48 00 00 A8 */	b .L_801F502C
.L_801F4F88:
/* 801F4F88 001F1F88  2C 1B 00 8B */	cmpwi r27, 0x8b
/* 801F4F8C 001F1F8C  41 82 00 0C */	beq .L_801F4F98
/* 801F4F90 001F1F90  2C 1B 00 85 */	cmpwi r27, 0x85
/* 801F4F94 001F1F94  40 82 00 70 */	bne .L_801F5004
.L_801F4F98:
/* 801F4F98 001F1F98  3B 40 00 00 */	li r26, 0
/* 801F4F9C 001F1F9C  48 00 00 58 */	b .L_801F4FF4
.L_801F4FA0:
/* 801F4FA0 001F1FA0  38 1A 0A 6D */	addi r0, r26, 0xa6d
/* 801F4FA4 001F1FA4  7F C3 F3 78 */	mr r3, r30
/* 801F4FA8 001F1FA8  7C 1D 00 AE */	lbzx r0, r29, r0
/* 801F4FAC 001F1FAC  7C 00 07 74 */	extsb r0, r0
/* 801F4FB0 001F1FB0  1C 80 00 24 */	mulli r4, r0, 0x24
/* 801F4FB4 001F1FB4  38 04 00 04 */	addi r0, r4, 4
/* 801F4FB8 001F1FB8  7C 9D 02 AE */	lhax r4, r29, r0
/* 801F4FBC 001F1FBC  4B EF E9 BD */	bl BattleGetUnitPtr
/* 801F4FC0 001F1FC0  80 03 00 08 */	lwz r0, 8(r3)
/* 801F4FC4 001F1FC4  2C 00 00 E1 */	cmpwi r0, 0xe1
/* 801F4FC8 001F1FC8  40 82 00 28 */	bne .L_801F4FF0
/* 801F4FCC 001F1FCC  80 1C 01 04 */	lwz r0, 0x104(r28)
/* 801F4FD0 001F1FD0  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801F4FD4 001F1FD4  40 82 00 1C */	bne .L_801F4FF0
/* 801F4FD8 001F1FD8  4B F2 CD 91 */	bl BtlUnit_CanActStatus
/* 801F4FDC 001F1FDC  2C 03 00 00 */	cmpwi r3, 0
/* 801F4FE0 001F1FE0  40 82 00 10 */	bne .L_801F4FF0
/* 801F4FE4 001F1FE4  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F4FE8 001F1FE8  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F4FEC 001F1FEC  48 00 00 40 */	b .L_801F502C
.L_801F4FF0:
/* 801F4FF0 001F1FF0  3B 5A 00 01 */	addi r26, r26, 1
.L_801F4FF4:
/* 801F4FF4 001F1FF4  88 1D 0A 6C */	lbz r0, 0xa6c(r29)
/* 801F4FF8 001F1FF8  7C 00 07 74 */	extsb r0, r0
/* 801F4FFC 001F1FFC  7C 1A 00 00 */	cmpw r26, r0
/* 801F5000 001F2000  41 80 FF A0 */	blt .L_801F4FA0
.L_801F5004:
/* 801F5004 001F2004  38 60 00 64 */	li r3, 0x64
/* 801F5008 001F2008  4B E1 0E BD */	bl irand
/* 801F500C 001F200C  A8 1E 00 00 */	lha r0, 0(r30)
/* 801F5010 001F2010  1C 00 00 14 */	mulli r0, r0, 0x14
/* 801F5014 001F2014  7C 03 00 00 */	cmpw r3, r0
/* 801F5018 001F2018  41 80 00 0C */	blt .L_801F5024
/* 801F501C 001F201C  38 60 00 00 */	li r3, 0
/* 801F5020 001F2020  48 00 00 0C */	b .L_801F502C
.L_801F5024:
/* 801F5024 001F2024  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F5028 001F2028  80 63 00 B0 */	lwz r3, 0xb0(r3)
.L_801F502C:
/* 801F502C 001F202C  BB 41 00 08 */	lmw r26, 8(r1)
/* 801F5030 001F2030  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801F5034 001F2034  7C 08 03 A6 */	mtlr r0
/* 801F5038 001F2038  38 21 00 20 */	addi r1, r1, 0x20
/* 801F503C 001F203C  4E 80 00 20 */	blr 

.global _check_fp_recover_item
_check_fp_recover_item:
/* 801F5040 001F2040  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801F5044 001F2044  7C 08 02 A6 */	mflr r0
/* 801F5048 001F2048  3C 80 80 31 */	lis r4, lbl_8030EE58@ha
/* 801F504C 001F204C  90 01 00 34 */	stw r0, 0x34(r1)
/* 801F5050 001F2050  38 84 EE 58 */	addi r4, r4, lbl_8030EE58@l
/* 801F5054 001F2054  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 801F5058 001F2058  7C 7C 1B 78 */	mr r28, r3
/* 801F505C 001F205C  80 03 03 04 */	lwz r0, 0x304(r3)
/* 801F5060 001F2060  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 801F5064 001F2064  1C 00 00 28 */	mulli r0, r0, 0x28
/* 801F5068 001F2068  7C BE 2B 78 */	mr r30, r5
/* 801F506C 001F206C  3B A5 04 28 */	addi r29, r5, 0x428
/* 801F5070 001F2070  7F E4 02 14 */	add r31, r4, r0
/* 801F5074 001F2074  87 7F 00 24 */	lwzu r27, 0x24(r31)
/* 801F5078 001F2078  4B F2 CE F9 */	bl BtlUnit_GetEnemyBelong
/* 801F507C 001F207C  88 1C 00 0C */	lbz r0, 0xc(r28)
/* 801F5080 001F2080  7C 66 07 74 */	extsb r6, r3
/* 801F5084 001F2084  80 BC 00 00 */	lwz r5, 0(r28)
/* 801F5088 001F2088  7F A3 EB 78 */	mr r3, r29
/* 801F508C 001F208C  7C 00 07 74 */	extsb r0, r0
/* 801F5090 001F2090  80 FB 00 64 */	lwz r7, 0x64(r27)
/* 801F5094 001F2094  54 00 18 38 */	slwi r0, r0, 3
/* 801F5098 001F2098  81 1B 00 68 */	lwz r8, 0x68(r27)
/* 801F509C 001F209C  7D 3E 02 14 */	add r9, r30, r0
/* 801F50A0 001F20A0  7F 64 DB 78 */	mr r4, r27
/* 801F50A4 001F20A4  88 09 00 0A */	lbz r0, 0xa(r9)
/* 801F50A8 001F20A8  7C 09 07 74 */	extsb r9, r0
/* 801F50AC 001F20AC  4B F0 55 9D */	bl BattleSamplingEnemy
/* 801F50B0 001F20B0  3B 40 00 00 */	li r26, 0
/* 801F50B4 001F20B4  48 00 00 5C */	b .L_801F5110
.L_801F50B8:
/* 801F50B8 001F20B8  38 1A 0A 6D */	addi r0, r26, 0xa6d
/* 801F50BC 001F20BC  7F C3 F3 78 */	mr r3, r30
/* 801F50C0 001F20C0  7C 1D 00 AE */	lbzx r0, r29, r0
/* 801F50C4 001F20C4  7C 00 07 74 */	extsb r0, r0
/* 801F50C8 001F20C8  1C 80 00 24 */	mulli r4, r0, 0x24
/* 801F50CC 001F20CC  38 04 00 04 */	addi r0, r4, 4
/* 801F50D0 001F20D0  7C 9D 02 AE */	lhax r4, r29, r0
/* 801F50D4 001F20D4  4B EF E8 A5 */	bl BattleGetUnitPtr
/* 801F50D8 001F20D8  80 1C 01 04 */	lwz r0, 0x104(r28)
/* 801F50DC 001F20DC  7C 79 1B 78 */	mr r25, r3
/* 801F50E0 001F20E0  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801F50E4 001F20E4  40 82 00 28 */	bne .L_801F510C
/* 801F50E8 001F20E8  4B F2 C5 6D */	bl BtlUnit_GetMaxFp
/* 801F50EC 001F20EC  7C 7B 1B 78 */	mr r27, r3
/* 801F50F0 001F20F0  7F 23 CB 78 */	mr r3, r25
/* 801F50F4 001F20F4  4B F2 C6 B1 */	bl BtlUnit_GetFp
/* 801F50F8 001F20F8  7C 03 D8 00 */	cmpw r3, r27
/* 801F50FC 001F20FC  40 80 00 10 */	bge .L_801F510C
/* 801F5100 001F2100  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F5104 001F2104  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F5108 001F2108  48 00 00 1C */	b .L_801F5124
.L_801F510C:
/* 801F510C 001F210C  3B 5A 00 01 */	addi r26, r26, 1
.L_801F5110:
/* 801F5110 001F2110  88 1D 0A 6C */	lbz r0, 0xa6c(r29)
/* 801F5114 001F2114  7C 00 07 74 */	extsb r0, r0
/* 801F5118 001F2118  7C 1A 00 00 */	cmpw r26, r0
/* 801F511C 001F211C  41 80 FF 9C */	blt .L_801F50B8
/* 801F5120 001F2120  38 60 00 00 */	li r3, 0
.L_801F5124:
/* 801F5124 001F2124  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 801F5128 001F2128  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801F512C 001F212C  7C 08 03 A6 */	mtlr r0
/* 801F5130 001F2130  38 21 00 30 */	addi r1, r1, 0x30
/* 801F5134 001F2134  4E 80 00 20 */	blr 

.global _check_hp_recover_item
_check_hp_recover_item:
/* 801F5138 001F2138  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801F513C 001F213C  7C 08 02 A6 */	mflr r0
/* 801F5140 001F2140  3C 80 80 31 */	lis r4, lbl_8030EE58@ha
/* 801F5144 001F2144  90 01 00 24 */	stw r0, 0x24(r1)
/* 801F5148 001F2148  38 84 EE 58 */	addi r4, r4, lbl_8030EE58@l
/* 801F514C 001F214C  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 801F5150 001F2150  7C 7C 1B 78 */	mr r28, r3
/* 801F5154 001F2154  80 03 03 04 */	lwz r0, 0x304(r3)
/* 801F5158 001F2158  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 801F515C 001F215C  1C 00 00 28 */	mulli r0, r0, 0x28
/* 801F5160 001F2160  7C BE 2B 78 */	mr r30, r5
/* 801F5164 001F2164  3B A5 04 28 */	addi r29, r5, 0x428
/* 801F5168 001F2168  7F E4 02 14 */	add r31, r4, r0
/* 801F516C 001F216C  87 7F 00 24 */	lwzu r27, 0x24(r31)
/* 801F5170 001F2170  4B F2 CE 01 */	bl BtlUnit_GetEnemyBelong
/* 801F5174 001F2174  88 1C 00 0C */	lbz r0, 0xc(r28)
/* 801F5178 001F2178  7C 66 07 74 */	extsb r6, r3
/* 801F517C 001F217C  80 BC 00 00 */	lwz r5, 0(r28)
/* 801F5180 001F2180  7F A3 EB 78 */	mr r3, r29
/* 801F5184 001F2184  7C 00 07 74 */	extsb r0, r0
/* 801F5188 001F2188  80 FB 00 64 */	lwz r7, 0x64(r27)
/* 801F518C 001F218C  54 00 18 38 */	slwi r0, r0, 3
/* 801F5190 001F2190  81 1B 00 68 */	lwz r8, 0x68(r27)
/* 801F5194 001F2194  7D 3E 02 14 */	add r9, r30, r0
/* 801F5198 001F2198  7F 64 DB 78 */	mr r4, r27
/* 801F519C 001F219C  88 09 00 0A */	lbz r0, 0xa(r9)
/* 801F51A0 001F21A0  7C 09 07 74 */	extsb r9, r0
/* 801F51A4 001F21A4  4B F0 54 A5 */	bl BattleSamplingEnemy
/* 801F51A8 001F21A8  3B 60 00 00 */	li r27, 0
/* 801F51AC 001F21AC  48 00 00 50 */	b .L_801F51FC
.L_801F51B0:
/* 801F51B0 001F21B0  38 1B 0A 6D */	addi r0, r27, 0xa6d
/* 801F51B4 001F21B4  7F C3 F3 78 */	mr r3, r30
/* 801F51B8 001F21B8  7C 1D 00 AE */	lbzx r0, r29, r0
/* 801F51BC 001F21BC  7C 00 07 74 */	extsb r0, r0
/* 801F51C0 001F21C0  1C 80 00 24 */	mulli r4, r0, 0x24
/* 801F51C4 001F21C4  38 04 00 04 */	addi r0, r4, 4
/* 801F51C8 001F21C8  7C 9D 02 AE */	lhax r4, r29, r0
/* 801F51CC 001F21CC  4B EF E7 AD */	bl BattleGetUnitPtr
/* 801F51D0 001F21D0  80 1C 01 04 */	lwz r0, 0x104(r28)
/* 801F51D4 001F21D4  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801F51D8 001F21D8  40 82 00 20 */	bne .L_801F51F8
/* 801F51DC 001F21DC  A8 83 01 0C */	lha r4, 0x10c(r3)
/* 801F51E0 001F21E0  A8 03 01 08 */	lha r0, 0x108(r3)
/* 801F51E4 001F21E4  7C 04 00 00 */	cmpw r4, r0
/* 801F51E8 001F21E8  40 80 00 10 */	bge .L_801F51F8
/* 801F51EC 001F21EC  80 7F 00 00 */	lwz r3, 0(r31)
/* 801F51F0 001F21F0  80 63 00 B0 */	lwz r3, 0xb0(r3)
/* 801F51F4 001F21F4  48 00 00 1C */	b .L_801F5210
.L_801F51F8:
/* 801F51F8 001F21F8  3B 7B 00 01 */	addi r27, r27, 1
.L_801F51FC:
/* 801F51FC 001F21FC  88 1D 0A 6C */	lbz r0, 0xa6c(r29)
/* 801F5200 001F2200  7C 00 07 74 */	extsb r0, r0
/* 801F5204 001F2204  7C 1B 00 00 */	cmpw r27, r0
/* 801F5208 001F2208  41 80 FF A8 */	blt .L_801F51B0
/* 801F520C 001F220C  38 60 00 00 */	li r3, 0
.L_801F5210:
/* 801F5210 001F2210  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 801F5214 001F2214  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801F5218 001F2218  7C 08 03 A6 */	mtlr r0
/* 801F521C 001F221C  38 21 00 20 */	addi r1, r1, 0x20
/* 801F5220 001F2220  4E 80 00 20 */	blr 

.global BattleEnemyUseItemCheck
BattleEnemyUseItemCheck:
/* 801F5224 001F2224  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801F5228 001F2228  7C 08 02 A6 */	mflr r0
/* 801F522C 001F222C  90 01 00 14 */	stw r0, 0x14(r1)
/* 801F5230 001F2230  BF C1 00 08 */	stmw r30, 8(r1)
/* 801F5234 001F2234  7C 7E 1B 78 */	mr r30, r3
/* 801F5238 001F2238  80 83 03 04 */	lwz r4, 0x304(r3)
/* 801F523C 001F223C  2C 04 00 00 */	cmpwi r4, 0
/* 801F5240 001F2240  40 82 00 0C */	bne .L_801F524C
/* 801F5244 001F2244  38 60 00 00 */	li r3, 0
/* 801F5248 001F2248  48 00 01 10 */	b .L_801F5358
.L_801F524C:
/* 801F524C 001F224C  1F E4 00 28 */	mulli r31, r4, 0x28
/* 801F5250 001F2250  3C 60 80 31 */	lis r3, lbl_8030EE58@ha
/* 801F5254 001F2254  38 03 EE 58 */	addi r0, r3, lbl_8030EE58@l
/* 801F5258 001F2258  7C 60 FA 14 */	add r3, r0, r31
/* 801F525C 001F225C  80 63 00 24 */	lwz r3, 0x24(r3)
/* 801F5260 001F2260  28 03 00 00 */	cmplwi r3, 0
/* 801F5264 001F2264  40 82 00 0C */	bne .L_801F5270
/* 801F5268 001F2268  38 60 00 00 */	li r3, 0
/* 801F526C 001F226C  48 00 00 EC */	b .L_801F5358
.L_801F5270:
/* 801F5270 001F2270  80 1E 02 78 */	lwz r0, 0x278(r30)
/* 801F5274 001F2274  54 00 06 F7 */	rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 801F5278 001F2278  41 82 00 18 */	beq .L_801F5290
/* 801F527C 001F227C  80 03 00 74 */	lwz r0, 0x74(r3)
/* 801F5280 001F2280  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 801F5284 001F2284  40 82 00 0C */	bne .L_801F5290
/* 801F5288 001F2288  38 60 00 00 */	li r3, 0
/* 801F528C 001F228C  48 00 00 CC */	b .L_801F5358
.L_801F5290:
/* 801F5290 001F2290  38 04 FF 80 */	addi r0, r4, -128
/* 801F5294 001F2294  28 00 00 1E */	cmplwi r0, 0x1e
/* 801F5298 001F2298  41 81 00 64 */	bgt .L_801F52FC
/* 801F529C 001F229C  3C 60 80 3B */	lis r3, lbl_803AA11C@ha
/* 801F52A0 001F22A0  54 00 10 3A */	slwi r0, r0, 2
/* 801F52A4 001F22A4  38 63 A1 1C */	addi r3, r3, lbl_803AA11C@l
/* 801F52A8 001F22A8  7C 03 00 2E */	lwzx r0, r3, r0
/* 801F52AC 001F22AC  7C 09 03 A6 */	mtctr r0
/* 801F52B0 001F22B0  4E 80 04 20 */	bctr 
/* 801F52B4 001F22B4  7F C3 F3 78 */	mr r3, r30
/* 801F52B8 001F22B8  4B FF FC 4D */	bl _check_attack_item
/* 801F52BC 001F22BC  48 00 00 9C */	b .L_801F5358
/* 801F52C0 001F22C0  7F C3 F3 78 */	mr r3, r30
/* 801F52C4 001F22C4  4B FF FA 69 */	bl _check_status_attack_item
/* 801F52C8 001F22C8  48 00 00 90 */	b .L_801F5358
/* 801F52CC 001F22CC  7F C3 F3 78 */	mr r3, r30
/* 801F52D0 001F22D0  4B FF F8 A5 */	bl _check_status_support_item
/* 801F52D4 001F22D4  48 00 00 84 */	b .L_801F5358
/* 801F52D8 001F22D8  7F C3 F3 78 */	mr r3, r30
/* 801F52DC 001F22DC  4B FF F6 C1 */	bl _check_status_recover_item
/* 801F52E0 001F22E0  48 00 00 78 */	b .L_801F5358
/* 801F52E4 001F22E4  7F C3 F3 78 */	mr r3, r30
/* 801F52E8 001F22E8  4B FF FE 51 */	bl _check_hp_recover_item
/* 801F52EC 001F22EC  48 00 00 6C */	b .L_801F5358
/* 801F52F0 001F22F0  7F C3 F3 78 */	mr r3, r30
/* 801F52F4 001F22F4  4B FF FD 4D */	bl _check_fp_recover_item
/* 801F52F8 001F22F8  48 00 00 60 */	b .L_801F5358
.L_801F52FC:
/* 801F52FC 001F22FC  3C 60 80 31 */	lis r3, lbl_8030EE58@ha
/* 801F5300 001F2300  38 03 EE 58 */	addi r0, r3, lbl_8030EE58@l
/* 801F5304 001F2304  7C 60 FA 14 */	add r3, r0, r31
/* 801F5308 001F2308  88 03 00 1D */	lbz r0, 0x1d(r3)
/* 801F530C 001F230C  28 00 00 00 */	cmplwi r0, 0
/* 801F5310 001F2310  41 82 00 18 */	beq .L_801F5328
/* 801F5314 001F2314  7F C3 F3 78 */	mr r3, r30
/* 801F5318 001F2318  4B FF FE 21 */	bl _check_hp_recover_item
/* 801F531C 001F231C  28 03 00 00 */	cmplwi r3, 0
/* 801F5320 001F2320  41 82 00 08 */	beq .L_801F5328
/* 801F5324 001F2324  48 00 00 34 */	b .L_801F5358
.L_801F5328:
/* 801F5328 001F2328  3C 60 80 31 */	lis r3, lbl_8030EE58@ha
/* 801F532C 001F232C  38 03 EE 58 */	addi r0, r3, lbl_8030EE58@l
/* 801F5330 001F2330  7C 60 FA 14 */	add r3, r0, r31
/* 801F5334 001F2334  88 03 00 1E */	lbz r0, 0x1e(r3)
/* 801F5338 001F2338  28 00 00 00 */	cmplwi r0, 0
/* 801F533C 001F233C  41 82 00 18 */	beq .L_801F5354
/* 801F5340 001F2340  7F C3 F3 78 */	mr r3, r30
/* 801F5344 001F2344  4B FF FC FD */	bl _check_fp_recover_item
/* 801F5348 001F2348  28 03 00 00 */	cmplwi r3, 0
/* 801F534C 001F234C  41 82 00 08 */	beq .L_801F5354
/* 801F5350 001F2350  48 00 00 08 */	b .L_801F5358
.L_801F5354:
/* 801F5354 001F2354  38 60 00 00 */	li r3, 0
.L_801F5358:
/* 801F5358 001F2358  BB C1 00 08 */	lmw r30, 8(r1)
/* 801F535C 001F235C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801F5360 001F2360  7C 08 03 A6 */	mtlr r0
/* 801F5364 001F2364  38 21 00 10 */	addi r1, r1, 0x10
/* 801F5368 001F2368  4E 80 00 20 */	blr 
