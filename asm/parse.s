.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global parseTagGet1
parseTagGet1:
/* 80083A6C 00080A6C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80083A70 00080A70  7C 08 02 A6 */	mflr r0
/* 80083A74 00080A74  90 01 00 14 */	stw r0, 0x14(r1)
/* 80083A78 00080A78  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80083A7C 00080A7C  7C BF 2B 78 */	mr r31, r5
/* 80083A80 00080A80  93 C1 00 08 */	stw r30, 8(r1)
/* 80083A84 00080A84  7C 9E 23 78 */	mr r30, r4
/* 80083A88 00080A88  48 00 03 1D */	bl parsePush
/* 80083A8C 00080A8C  2C 03 00 00 */	cmpwi r3, 0
/* 80083A90 00080A90  41 82 00 28 */	beq .L_80083AB8
/* 80083A94 00080A94  7F C3 F3 78 */	mr r3, r30
/* 80083A98 00080A98  7F E4 FB 78 */	mr r4, r31
/* 80083A9C 00080A9C  48 00 00 39 */	bl parseGet1Next
/* 80083AA0 00080AA0  3C 80 80 3E */	lis r4, lbl_803D8650@ha
/* 80083AA4 00080AA4  38 A4 86 50 */	addi r5, r4, lbl_803D8650@l
/* 80083AA8 00080AA8  80 85 00 54 */	lwz r4, 0x54(r5)
/* 80083AAC 00080AAC  38 04 FF FF */	addi r0, r4, -1
/* 80083AB0 00080AB0  90 05 00 54 */	stw r0, 0x54(r5)
/* 80083AB4 00080AB4  48 00 00 08 */	b .L_80083ABC
.L_80083AB8:
/* 80083AB8 00080AB8  38 60 00 00 */	li r3, 0
.L_80083ABC:
/* 80083ABC 00080ABC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80083AC0 00080AC0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80083AC4 00080AC4  83 C1 00 08 */	lwz r30, 8(r1)
/* 80083AC8 00080AC8  7C 08 03 A6 */	mtlr r0
/* 80083ACC 00080ACC  38 21 00 10 */	addi r1, r1, 0x10
/* 80083AD0 00080AD0  4E 80 00 20 */	blr 

.global parseGet1Next
parseGet1Next:
/* 80083AD4 00080AD4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80083AD8 00080AD8  7C 08 02 A6 */	mflr r0
/* 80083ADC 00080ADC  2C 03 00 03 */	cmpwi r3, 3
/* 80083AE0 00080AE0  90 01 00 24 */	stw r0, 0x24(r1)
/* 80083AE4 00080AE4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80083AE8 00080AE8  3B E0 00 01 */	li r31, 1
/* 80083AEC 00080AEC  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80083AF0 00080AF0  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80083AF4 00080AF4  7C 9D 23 78 */	mr r29, r4
/* 80083AF8 00080AF8  41 82 00 08 */	beq .L_80083B00
/* 80083AFC 00080AFC  48 00 00 38 */	b .L_80083B34
.L_80083B00:
/* 80083B00 00080B00  38 60 00 02 */	li r3, 2
/* 80083B04 00080B04  4B FF FF D1 */	bl parseGet1Next
/* 80083B08 00080B08  7F FF 19 D6 */	mullw r31, r31, r3
/* 80083B0C 00080B0C  38 9D 00 04 */	addi r4, r29, 4
/* 80083B10 00080B10  38 60 00 02 */	li r3, 2
/* 80083B14 00080B14  4B FF FF C1 */	bl parseGet1Next
/* 80083B18 00080B18  7F FF 19 D6 */	mullw r31, r31, r3
/* 80083B1C 00080B1C  38 9D 00 08 */	addi r4, r29, 8
/* 80083B20 00080B20  38 60 00 02 */	li r3, 2
/* 80083B24 00080B24  4B FF FF B1 */	bl parseGet1Next
/* 80083B28 00080B28  7F FF 19 D6 */	mullw r31, r31, r3
/* 80083B2C 00080B2C  7F E3 FB 78 */	mr r3, r31
/* 80083B30 00080B30  48 00 02 18 */	b .L_80083D48
.L_80083B34:
/* 80083B34 00080B34  3C 80 80 3E */	lis r4, lbl_803D8650@ha
/* 80083B38 00080B38  38 A0 00 00 */	li r5, 0
/* 80083B3C 00080B3C  38 E4 86 50 */	addi r7, r4, lbl_803D8650@l
/* 80083B40 00080B40  80 07 00 54 */	lwz r0, 0x54(r7)
/* 80083B44 00080B44  80 87 00 00 */	lwz r4, 0(r7)
/* 80083B48 00080B48  54 00 10 3A */	slwi r0, r0, 2
/* 80083B4C 00080B4C  7F E7 02 14 */	add r31, r7, r0
/* 80083B50 00080B50  81 5F 00 04 */	lwz r10, 4(r31)
/* 80083B54 00080B54  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 80083B58 00080B58  3B FF 00 04 */	addi r31, r31, 4
/* 80083B5C 00080B5C  48 00 00 EC */	b .L_80083C48
.L_80083B60:
/* 80083B60 00080B60  7D 04 52 14 */	add r8, r4, r10
/* 80083B64 00080B64  89 28 00 00 */	lbz r9, 0(r8)
/* 80083B68 00080B68  2C 09 00 2F */	cmpwi r9, 0x2f
/* 80083B6C 00080B6C  40 82 00 40 */	bne .L_80083BAC
/* 80083B70 00080B70  88 E8 00 01 */	lbz r7, 1(r8)
/* 80083B74 00080B74  2C 07 00 2F */	cmpwi r7, 0x2f
/* 80083B78 00080B78  40 82 00 34 */	bne .L_80083BAC
/* 80083B7C 00080B7C  7C EA 00 50 */	subf r7, r10, r0
/* 80083B80 00080B80  7C E9 03 A6 */	mtctr r7
/* 80083B84 00080B84  7C 0A 00 00 */	cmpw r10, r0
/* 80083B88 00080B88  40 80 00 BC */	bge .L_80083C44
.L_80083B8C:
/* 80083B8C 00080B8C  88 E8 00 00 */	lbz r7, 0(r8)
/* 80083B90 00080B90  7C E7 07 74 */	extsb r7, r7
/* 80083B94 00080B94  28 07 2F 6E */	cmplwi r7, 0x2f6e
/* 80083B98 00080B98  41 82 00 AC */	beq .L_80083C44
/* 80083B9C 00080B9C  39 4A 00 01 */	addi r10, r10, 1
/* 80083BA0 00080BA0  39 08 00 01 */	addi r8, r8, 1
/* 80083BA4 00080BA4  42 00 FF E8 */	bdnz .L_80083B8C
/* 80083BA8 00080BA8  48 00 00 9C */	b .L_80083C44
.L_80083BAC:
/* 80083BAC 00080BAC  7D 27 07 74 */	extsb r7, r9
/* 80083BB0 00080BB0  2C 07 00 20 */	cmpwi r7, 0x20
/* 80083BB4 00080BB4  41 82 00 90 */	beq .L_80083C44
/* 80083BB8 00080BB8  2C 07 00 09 */	cmpwi r7, 9
/* 80083BBC 00080BBC  41 82 00 88 */	beq .L_80083C44
/* 80083BC0 00080BC0  2C 07 00 0A */	cmpwi r7, 0xa
/* 80083BC4 00080BC4  41 82 00 80 */	beq .L_80083C44
/* 80083BC8 00080BC8  2C 07 00 0D */	cmpwi r7, 0xd
/* 80083BCC 00080BCC  41 82 00 78 */	beq .L_80083C44
/* 80083BD0 00080BD0  7D 46 53 78 */	mr r6, r10
/* 80083BD4 00080BD4  39 4A 00 01 */	addi r10, r10, 1
/* 80083BD8 00080BD8  7C EA 00 50 */	subf r7, r10, r0
/* 80083BDC 00080BDC  38 A0 00 01 */	li r5, 1
/* 80083BE0 00080BE0  7C E9 03 A6 */	mtctr r7
/* 80083BE4 00080BE4  7C 0A 00 00 */	cmpw r10, r0
/* 80083BE8 00080BE8  40 80 00 68 */	bge .L_80083C50
.L_80083BEC:
/* 80083BEC 00080BEC  7D 24 52 14 */	add r9, r4, r10
/* 80083BF0 00080BF0  88 E9 00 00 */	lbz r7, 0(r9)
/* 80083BF4 00080BF4  7C E8 07 74 */	extsb r8, r7
/* 80083BF8 00080BF8  2C 08 00 20 */	cmpwi r8, 0x20
/* 80083BFC 00080BFC  41 82 00 30 */	beq .L_80083C2C
/* 80083C00 00080C00  38 E7 FF F7 */	addi r7, r7, -9
/* 80083C04 00080C04  54 E7 06 3E */	clrlwi r7, r7, 0x18
/* 80083C08 00080C08  28 07 00 01 */	cmplwi r7, 1
/* 80083C0C 00080C0C  40 81 00 20 */	ble .L_80083C2C
/* 80083C10 00080C10  2C 08 00 0D */	cmpwi r8, 0xd
/* 80083C14 00080C14  41 82 00 18 */	beq .L_80083C2C
/* 80083C18 00080C18  2C 08 00 2F */	cmpwi r8, 0x2f
/* 80083C1C 00080C1C  40 82 00 1C */	bne .L_80083C38
/* 80083C20 00080C20  88 E9 00 01 */	lbz r7, 1(r9)
/* 80083C24 00080C24  2C 07 00 2F */	cmpwi r7, 0x2f
/* 80083C28 00080C28  40 82 00 10 */	bne .L_80083C38
.L_80083C2C:
/* 80083C2C 00080C2C  7D 5E 53 78 */	mr r30, r10
/* 80083C30 00080C30  38 A0 00 02 */	li r5, 2
/* 80083C34 00080C34  48 00 00 1C */	b .L_80083C50
.L_80083C38:
/* 80083C38 00080C38  39 4A 00 01 */	addi r10, r10, 1
/* 80083C3C 00080C3C  42 00 FF B0 */	bdnz .L_80083BEC
/* 80083C40 00080C40  48 00 00 10 */	b .L_80083C50
.L_80083C44:
/* 80083C44 00080C44  39 4A 00 01 */	addi r10, r10, 1
.L_80083C48:
/* 80083C48 00080C48  7C 0A 00 00 */	cmpw r10, r0
/* 80083C4C 00080C4C  41 80 FF 14 */	blt .L_80083B60
.L_80083C50:
/* 80083C50 00080C50  2C 05 00 01 */	cmpwi r5, 1
/* 80083C54 00080C54  41 81 00 0C */	bgt .L_80083C60
/* 80083C58 00080C58  38 60 00 00 */	li r3, 0
/* 80083C5C 00080C5C  48 00 00 EC */	b .L_80083D48
.L_80083C60:
/* 80083C60 00080C60  2C 03 00 01 */	cmpwi r3, 1
/* 80083C64 00080C64  41 82 00 AC */	beq .L_80083D10
/* 80083C68 00080C68  40 80 00 10 */	bge .L_80083C78
/* 80083C6C 00080C6C  2C 03 00 00 */	cmpwi r3, 0
/* 80083C70 00080C70  40 80 00 14 */	bge .L_80083C84
/* 80083C74 00080C74  48 00 00 D0 */	b .L_80083D44
.L_80083C78:
/* 80083C78 00080C78  2C 03 00 03 */	cmpwi r3, 3
/* 80083C7C 00080C7C  40 80 00 C8 */	bge .L_80083D44
/* 80083C80 00080C80  48 00 00 AC */	b .L_80083D2C
.L_80083C84:
/* 80083C84 00080C84  7C CA 33 78 */	mr r10, r6
/* 80083C88 00080C88  7F A8 EB 78 */	mr r8, r29
/* 80083C8C 00080C8C  7C A4 32 14 */	add r5, r4, r6
/* 80083C90 00080C90  39 60 00 00 */	li r11, 0
/* 80083C94 00080C94  48 00 00 64 */	b .L_80083CF8
.L_80083C98:
/* 80083C98 00080C98  88 65 00 00 */	lbz r3, 0(r5)
/* 80083C9C 00080C9C  2C 03 00 22 */	cmpwi r3, 0x22
/* 80083CA0 00080CA0  40 82 00 50 */	bne .L_80083CF0
/* 80083CA4 00080CA4  39 4A 00 01 */	addi r10, r10, 1
/* 80083CA8 00080CA8  7D 07 43 78 */	mr r7, r8
/* 80083CAC 00080CAC  7C 6A 00 50 */	subf r3, r10, r0
/* 80083CB0 00080CB0  7C C4 52 14 */	add r6, r4, r10
/* 80083CB4 00080CB4  7C 69 03 A6 */	mtctr r3
/* 80083CB8 00080CB8  7C 0A 00 00 */	cmpw r10, r0
/* 80083CBC 00080CBC  38 A5 00 01 */	addi r5, r5, 1
/* 80083CC0 00080CC0  40 80 00 30 */	bge .L_80083CF0
.L_80083CC4:
/* 80083CC4 00080CC4  89 26 00 00 */	lbz r9, 0(r6)
/* 80083CC8 00080CC8  2C 09 00 22 */	cmpwi r9, 0x22
/* 80083CCC 00080CCC  41 82 00 24 */	beq .L_80083CF0
/* 80083CD0 00080CD0  99 27 00 00 */	stb r9, 0(r7)
/* 80083CD4 00080CD4  38 E7 00 01 */	addi r7, r7, 1
/* 80083CD8 00080CD8  39 08 00 01 */	addi r8, r8, 1
/* 80083CDC 00080CDC  39 6B 00 01 */	addi r11, r11, 1
/* 80083CE0 00080CE0  39 4A 00 01 */	addi r10, r10, 1
/* 80083CE4 00080CE4  38 A5 00 01 */	addi r5, r5, 1
/* 80083CE8 00080CE8  38 C6 00 01 */	addi r6, r6, 1
/* 80083CEC 00080CEC  42 00 FF D8 */	bdnz .L_80083CC4
.L_80083CF0:
/* 80083CF0 00080CF0  39 4A 00 01 */	addi r10, r10, 1
/* 80083CF4 00080CF4  38 A5 00 01 */	addi r5, r5, 1
.L_80083CF8:
/* 80083CF8 00080CF8  7C 0A 00 00 */	cmpw r10, r0
/* 80083CFC 00080CFC  41 80 FF 9C */	blt .L_80083C98
/* 80083D00 00080D00  38 00 00 00 */	li r0, 0
/* 80083D04 00080D04  7C 0B E9 AE */	stbx r0, r11, r29
/* 80083D08 00080D08  91 5F 00 00 */	stw r10, 0(r31)
/* 80083D0C 00080D0C  48 00 00 38 */	b .L_80083D44
.L_80083D10:
/* 80083D10 00080D10  7F A5 EB 78 */	mr r5, r29
/* 80083D14 00080D14  7C 64 32 14 */	add r3, r4, r6
/* 80083D18 00080D18  38 82 93 30 */	addi r4, r2, lbl_8041A6B0@sda21
/* 80083D1C 00080D1C  4C C6 31 82 */	crclr 6
/* 80083D20 00080D20  48 1E 26 75 */	bl sscanf
/* 80083D24 00080D24  93 DF 00 00 */	stw r30, 0(r31)
/* 80083D28 00080D28  48 00 00 1C */	b .L_80083D44
.L_80083D2C:
/* 80083D2C 00080D2C  7F A5 EB 78 */	mr r5, r29
/* 80083D30 00080D30  7C 64 32 14 */	add r3, r4, r6
/* 80083D34 00080D34  38 82 93 34 */	addi r4, r2, lbl_8041A6B4@sda21
/* 80083D38 00080D38  4C C6 31 82 */	crclr 6
/* 80083D3C 00080D3C  48 1E 26 59 */	bl sscanf
/* 80083D40 00080D40  93 DF 00 00 */	stw r30, 0(r31)
.L_80083D44:
/* 80083D44 00080D44  38 60 00 01 */	li r3, 1
.L_80083D48:
/* 80083D48 00080D48  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80083D4C 00080D4C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80083D50 00080D50  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80083D54 00080D54  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80083D58 00080D58  7C 08 03 A6 */	mtlr r0
/* 80083D5C 00080D5C  38 21 00 20 */	addi r1, r1, 0x20
/* 80083D60 00080D60  4E 80 00 20 */	blr 

.global parsePopNext
parsePopNext:
/* 80083D64 00080D64  3C 60 80 3E */	lis r3, lbl_803D8650@ha
/* 80083D68 00080D68  38 83 86 50 */	addi r4, r3, lbl_803D8650@l
/* 80083D6C 00080D6C  80 64 00 54 */	lwz r3, 0x54(r4)
/* 80083D70 00080D70  38 03 FF FF */	addi r0, r3, -1
/* 80083D74 00080D74  54 03 10 3A */	slwi r3, r0, 2
/* 80083D78 00080D78  90 04 00 54 */	stw r0, 0x54(r4)
/* 80083D7C 00080D7C  7C 64 1A 14 */	add r3, r4, r3
/* 80083D80 00080D80  80 03 00 30 */	lwz r0, 0x30(r3)
/* 80083D84 00080D84  90 03 00 04 */	stw r0, 4(r3)
/* 80083D88 00080D88  4E 80 00 20 */	blr 

.global parsePop
parsePop:
/* 80083D8C 00080D8C  3C 60 80 3E */	lis r3, lbl_803D8650@ha
/* 80083D90 00080D90  38 83 86 50 */	addi r4, r3, lbl_803D8650@l
/* 80083D94 00080D94  80 64 00 54 */	lwz r3, 0x54(r4)
/* 80083D98 00080D98  38 03 FF FF */	addi r0, r3, -1
/* 80083D9C 00080D9C  90 04 00 54 */	stw r0, 0x54(r4)
/* 80083DA0 00080DA0  4E 80 00 20 */	blr 

.global parsePush
parsePush:
/* 80083DA4 00080DA4  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80083DA8 00080DA8  7C 08 02 A6 */	mflr r0
/* 80083DAC 00080DAC  3C 80 80 3E */	lis r4, lbl_803D8650@ha
/* 80083DB0 00080DB0  90 01 00 44 */	stw r0, 0x44(r1)
/* 80083DB4 00080DB4  BE A1 00 14 */	stmw r21, 0x14(r1)
/* 80083DB8 00080DB8  3B E4 86 50 */	addi r31, r4, lbl_803D8650@l
/* 80083DBC 00080DBC  3B DF 00 04 */	addi r30, r31, 4
/* 80083DC0 00080DC0  7C 75 1B 78 */	mr r21, r3
/* 80083DC4 00080DC4  3B BF 00 2C */	addi r29, r31, 0x2c
/* 80083DC8 00080DC8  3A C0 00 00 */	li r22, 0
/* 80083DCC 00080DCC  3B 20 00 00 */	li r25, 0
/* 80083DD0 00080DD0  80 1F 00 54 */	lwz r0, 0x54(r31)
/* 80083DD4 00080DD4  83 5F 00 00 */	lwz r26, 0(r31)
/* 80083DD8 00080DD8  54 00 10 3A */	slwi r0, r0, 2
/* 80083DDC 00080DDC  7F 9E 00 2E */	lwzx r28, r30, r0
/* 80083DE0 00080DE0  7F 7D 00 2E */	lwzx r27, r29, r0
/* 80083DE4 00080DE4  48 00 01 54 */	b .L_80083F38
.L_80083DE8:
/* 80083DE8 00080DE8  7C BA E2 14 */	add r5, r26, r28
/* 80083DEC 00080DEC  88 05 00 00 */	lbz r0, 0(r5)
/* 80083DF0 00080DF0  2C 00 00 3C */	cmpwi r0, 0x3c
/* 80083DF4 00080DF4  40 82 01 40 */	bne .L_80083F34
/* 80083DF8 00080DF8  88 05 00 01 */	lbz r0, 1(r5)
/* 80083DFC 00080DFC  2C 00 00 2F */	cmpwi r0, 0x2f
/* 80083E00 00080E00  40 82 00 54 */	bne .L_80083E54
/* 80083E04 00080E04  2C 19 00 01 */	cmpwi r25, 1
/* 80083E08 00080E08  3A D6 FF FF */	addi r22, r22, -1
/* 80083E0C 00080E0C  40 82 01 28 */	bne .L_80083F34
/* 80083E10 00080E10  2C 16 00 00 */	cmpwi r22, 0
/* 80083E14 00080E14  40 82 01 20 */	bne .L_80083F34
/* 80083E18 00080E18  7C 1C D8 50 */	subf r0, r28, r27
/* 80083E1C 00080E1C  7C 09 03 A6 */	mtctr r0
/* 80083E20 00080E20  7C 1C D8 00 */	cmpw r28, r27
/* 80083E24 00080E24  40 80 00 24 */	bge .L_80083E48
.L_80083E28:
/* 80083E28 00080E28  88 05 00 00 */	lbz r0, 0(r5)
/* 80083E2C 00080E2C  2C 00 00 3E */	cmpwi r0, 0x3e
/* 80083E30 00080E30  40 82 00 0C */	bne .L_80083E3C
/* 80083E34 00080E34  3B 9C 00 01 */	addi r28, r28, 1
/* 80083E38 00080E38  48 00 00 10 */	b .L_80083E48
.L_80083E3C:
/* 80083E3C 00080E3C  3B 9C 00 01 */	addi r28, r28, 1
/* 80083E40 00080E40  38 A5 00 01 */	addi r5, r5, 1
/* 80083E44 00080E44  42 00 FF E4 */	bdnz .L_80083E28
.L_80083E48:
/* 80083E48 00080E48  7F 97 E3 78 */	mr r23, r28
/* 80083E4C 00080E4C  3B 20 00 02 */	li r25, 2
/* 80083E50 00080E50  48 00 00 F0 */	b .L_80083F40
.L_80083E54:
/* 80083E54 00080E54  2C 19 00 00 */	cmpwi r25, 0
/* 80083E58 00080E58  40 82 00 D8 */	bne .L_80083F30
/* 80083E5C 00080E5C  2C 16 00 00 */	cmpwi r22, 0
/* 80083E60 00080E60  40 82 00 D0 */	bne .L_80083F30
/* 80083E64 00080E64  3C 60 80 3E */	lis r3, lbl_803D85D0@ha
/* 80083E68 00080E68  7C 1C D8 50 */	subf r0, r28, r27
/* 80083E6C 00080E6C  38 C3 85 D0 */	addi r6, r3, lbl_803D85D0@l
/* 80083E70 00080E70  7F 84 E3 78 */	mr r4, r28
/* 80083E74 00080E74  7C A3 2B 78 */	mr r3, r5
/* 80083E78 00080E78  38 A0 00 00 */	li r5, 0
/* 80083E7C 00080E7C  7C 09 03 A6 */	mtctr r0
/* 80083E80 00080E80  7C 1C D8 00 */	cmpw r28, r27
/* 80083E84 00080E84  40 80 00 58 */	bge .L_80083EDC
.L_80083E88:
/* 80083E88 00080E88  88 E3 00 00 */	lbz r7, 0(r3)
/* 80083E8C 00080E8C  7C E0 07 74 */	extsb r0, r7
/* 80083E90 00080E90  2C 00 00 20 */	cmpwi r0, 0x20
/* 80083E94 00080E94  41 82 00 28 */	beq .L_80083EBC
/* 80083E98 00080E98  2C 00 00 09 */	cmpwi r0, 9
/* 80083E9C 00080E9C  41 82 00 20 */	beq .L_80083EBC
/* 80083EA0 00080EA0  2C 00 00 0A */	cmpwi r0, 0xa
/* 80083EA4 00080EA4  41 82 00 18 */	beq .L_80083EBC
/* 80083EA8 00080EA8  2C 00 00 0D */	cmpwi r0, 0xd
/* 80083EAC 00080EAC  41 82 00 10 */	beq .L_80083EBC
/* 80083EB0 00080EB0  98 E6 00 00 */	stb r7, 0(r6)
/* 80083EB4 00080EB4  38 C6 00 01 */	addi r6, r6, 1
/* 80083EB8 00080EB8  38 A5 00 01 */	addi r5, r5, 1
.L_80083EBC:
/* 80083EBC 00080EBC  2C 05 00 7F */	cmpwi r5, 0x7f
/* 80083EC0 00080EC0  40 80 00 1C */	bge .L_80083EDC
/* 80083EC4 00080EC4  88 03 00 00 */	lbz r0, 0(r3)
/* 80083EC8 00080EC8  2C 00 00 3E */	cmpwi r0, 0x3e
/* 80083ECC 00080ECC  41 82 00 10 */	beq .L_80083EDC
/* 80083ED0 00080ED0  38 84 00 01 */	addi r4, r4, 1
/* 80083ED4 00080ED4  38 63 00 01 */	addi r3, r3, 1
/* 80083ED8 00080ED8  42 00 FF B0 */	bdnz .L_80083E88
.L_80083EDC:
/* 80083EDC 00080EDC  3C 60 80 3E */	lis r3, lbl_803D85D0@ha
/* 80083EE0 00080EE0  38 00 00 00 */	li r0, 0
/* 80083EE4 00080EE4  38 63 85 D0 */	addi r3, r3, lbl_803D85D0@l
/* 80083EE8 00080EE8  7E A4 AB 78 */	mr r4, r21
/* 80083EEC 00080EEC  7C 03 29 AE */	stbx r0, r3, r5
/* 80083EF0 00080EF0  48 1E 35 5D */	bl strcmp
/* 80083EF4 00080EF4  2C 03 00 00 */	cmpwi r3, 0
/* 80083EF8 00080EF8  40 82 00 38 */	bne .L_80083F30
/* 80083EFC 00080EFC  7C 1C D8 50 */	subf r0, r28, r27
/* 80083F00 00080F00  7C 7A E2 14 */	add r3, r26, r28
/* 80083F04 00080F04  7C 09 03 A6 */	mtctr r0
/* 80083F08 00080F08  7C 1C D8 00 */	cmpw r28, r27
/* 80083F0C 00080F0C  40 80 00 1C */	bge .L_80083F28
.L_80083F10:
/* 80083F10 00080F10  88 03 00 00 */	lbz r0, 0(r3)
/* 80083F14 00080F14  2C 00 00 3E */	cmpwi r0, 0x3e
/* 80083F18 00080F18  41 82 00 10 */	beq .L_80083F28
/* 80083F1C 00080F1C  3B 9C 00 01 */	addi r28, r28, 1
/* 80083F20 00080F20  38 63 00 01 */	addi r3, r3, 1
/* 80083F24 00080F24  42 00 FF EC */	bdnz .L_80083F10
.L_80083F28:
/* 80083F28 00080F28  3B 20 00 01 */	li r25, 1
/* 80083F2C 00080F2C  3B 1C 00 01 */	addi r24, r28, 1
.L_80083F30:
/* 80083F30 00080F30  3A D6 00 01 */	addi r22, r22, 1
.L_80083F34:
/* 80083F34 00080F34  3B 9C 00 01 */	addi r28, r28, 1
.L_80083F38:
/* 80083F38 00080F38  7C 1C D8 00 */	cmpw r28, r27
/* 80083F3C 00080F3C  41 80 FE AC */	blt .L_80083DE8
.L_80083F40:
/* 80083F40 00080F40  2C 19 00 02 */	cmpwi r25, 2
/* 80083F44 00080F44  41 82 00 0C */	beq .L_80083F50
/* 80083F48 00080F48  38 60 00 00 */	li r3, 0
/* 80083F4C 00080F4C  48 00 00 20 */	b .L_80083F6C
.L_80083F50:
/* 80083F50 00080F50  80 9F 00 54 */	lwz r4, 0x54(r31)
/* 80083F54 00080F54  38 60 00 01 */	li r3, 1
/* 80083F58 00080F58  38 04 00 01 */	addi r0, r4, 1
/* 80083F5C 00080F5C  90 1F 00 54 */	stw r0, 0x54(r31)
/* 80083F60 00080F60  54 00 10 3A */	slwi r0, r0, 2
/* 80083F64 00080F64  7F 1E 01 2E */	stwx r24, r30, r0
/* 80083F68 00080F68  7E FD 01 2E */	stwx r23, r29, r0
.L_80083F6C:
/* 80083F6C 00080F6C  BA A1 00 14 */	lmw r21, 0x14(r1)
/* 80083F70 00080F70  80 01 00 44 */	lwz r0, 0x44(r1)
/* 80083F74 00080F74  7C 08 03 A6 */	mtlr r0
/* 80083F78 00080F78  38 21 00 40 */	addi r1, r1, 0x40
/* 80083F7C 00080F7C  4E 80 00 20 */	blr 

.global parseInit
parseInit:
/* 80083F80 00080F80  3C A0 80 3E */	lis r5, lbl_803D8650@ha
/* 80083F84 00080F84  94 65 86 50 */	stwu r3, lbl_803D8650@l(r5)
/* 80083F88 00080F88  38 00 00 00 */	li r0, 0
/* 80083F8C 00080F8C  90 05 00 54 */	stw r0, 0x54(r5)
/* 80083F90 00080F90  90 05 00 04 */	stw r0, 4(r5)
/* 80083F94 00080F94  90 85 00 2C */	stw r4, 0x2c(r5)
/* 80083F98 00080F98  4E 80 00 20 */	blr 
