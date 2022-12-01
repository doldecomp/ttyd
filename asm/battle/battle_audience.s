.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global BattleAudience_GetPresentItemType
BattleAudience_GetPresentItemType:
/* 80198DA8 00195DA8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198DAC 00195DAC  7C 08 02 A6 */	mflr r0
/* 80198DB0 00195DB0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198DB4 00195DB4  48 00 99 21 */	bl BattleAudienceBaseGetPtr
/* 80198DB8 00195DB8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198DBC 00195DBC  3C 63 00 01 */	addis r3, r3, 1
/* 80198DC0 00195DC0  80 63 37 E8 */	lwz r3, 0x37e8(r3)
/* 80198DC4 00195DC4  7C 08 03 A6 */	mtlr r0
/* 80198DC8 00195DC8  38 21 00 10 */	addi r1, r1, 0x10
/* 80198DCC 00195DCC  4E 80 00 20 */	blr 

.global BattleAudience_SetPresentItemType
BattleAudience_SetPresentItemType:
/* 80198DD0 00195DD0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198DD4 00195DD4  7C 08 02 A6 */	mflr r0
/* 80198DD8 00195DD8  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198DDC 00195DDC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80198DE0 00195DE0  7C 7F 1B 78 */	mr r31, r3
/* 80198DE4 00195DE4  48 00 98 F1 */	bl BattleAudienceBaseGetPtr
/* 80198DE8 00195DE8  3C 63 00 01 */	addis r3, r3, 1
/* 80198DEC 00195DEC  93 E3 37 E8 */	stw r31, 0x37e8(r3)
/* 80198DF0 00195DF0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198DF4 00195DF4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80198DF8 00195DF8  7C 08 03 A6 */	mtlr r0
/* 80198DFC 00195DFC  38 21 00 10 */	addi r1, r1, 0x10
/* 80198E00 00195E00  4E 80 00 20 */	blr 

.global BattleAudience_GetPresentTargetUnitId
BattleAudience_GetPresentTargetUnitId:
/* 80198E04 00195E04  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198E08 00195E08  7C 08 02 A6 */	mflr r0
/* 80198E0C 00195E0C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198E10 00195E10  48 00 98 C5 */	bl BattleAudienceBaseGetPtr
/* 80198E14 00195E14  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198E18 00195E18  3C 63 00 01 */	addis r3, r3, 1
/* 80198E1C 00195E1C  80 63 37 EC */	lwz r3, 0x37ec(r3)
/* 80198E20 00195E20  7C 08 03 A6 */	mtlr r0
/* 80198E24 00195E24  38 21 00 10 */	addi r1, r1, 0x10
/* 80198E28 00195E28  4E 80 00 20 */	blr 

.global BattleAudience_SetPresentTargetUnitId
BattleAudience_SetPresentTargetUnitId:
/* 80198E2C 00195E2C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198E30 00195E30  7C 08 02 A6 */	mflr r0
/* 80198E34 00195E34  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198E38 00195E38  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80198E3C 00195E3C  7C 7F 1B 78 */	mr r31, r3
/* 80198E40 00195E40  48 00 98 95 */	bl BattleAudienceBaseGetPtr
/* 80198E44 00195E44  3C 63 00 01 */	addis r3, r3, 1
/* 80198E48 00195E48  93 E3 37 EC */	stw r31, 0x37ec(r3)
/* 80198E4C 00195E4C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198E50 00195E50  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80198E54 00195E54  7C 08 03 A6 */	mtlr r0
/* 80198E58 00195E58  38 21 00 10 */	addi r1, r1, 0x10
/* 80198E5C 00195E5C  4E 80 00 20 */	blr 

.global BattleAudience_GetPresentItemNo
BattleAudience_GetPresentItemNo:
/* 80198E60 00195E60  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198E64 00195E64  7C 08 02 A6 */	mflr r0
/* 80198E68 00195E68  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198E6C 00195E6C  48 00 98 69 */	bl BattleAudienceBaseGetPtr
/* 80198E70 00195E70  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198E74 00195E74  3C 63 00 01 */	addis r3, r3, 1
/* 80198E78 00195E78  80 63 37 E4 */	lwz r3, 0x37e4(r3)
/* 80198E7C 00195E7C  7C 08 03 A6 */	mtlr r0
/* 80198E80 00195E80  38 21 00 10 */	addi r1, r1, 0x10
/* 80198E84 00195E84  4E 80 00 20 */	blr 

.global BattleAudience_SetPresentItemNo
BattleAudience_SetPresentItemNo:
/* 80198E88 00195E88  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198E8C 00195E8C  7C 08 02 A6 */	mflr r0
/* 80198E90 00195E90  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198E94 00195E94  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80198E98 00195E98  7C 7F 1B 78 */	mr r31, r3
/* 80198E9C 00195E9C  48 00 98 39 */	bl BattleAudienceBaseGetPtr
/* 80198EA0 00195EA0  3C 63 00 01 */	addis r3, r3, 1
/* 80198EA4 00195EA4  93 E3 37 E4 */	stw r31, 0x37e4(r3)
/* 80198EA8 00195EA8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198EAC 00195EAC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80198EB0 00195EB0  7C 08 03 A6 */	mtlr r0
/* 80198EB4 00195EB4  38 21 00 10 */	addi r1, r1, 0x10
/* 80198EB8 00195EB8  4E 80 00 20 */	blr 

.global BattleAudience_Case_FirstAttack_Bad
BattleAudience_Case_FirstAttack_Bad:
/* 80198EBC 00195EBC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198EC0 00195EC0  7C 08 02 A6 */	mflr r0
/* 80198EC4 00195EC4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198EC8 00195EC8  48 00 98 0D */	bl BattleAudienceBaseGetPtr
/* 80198ECC 00195ECC  3C 63 00 01 */	addis r3, r3, 1
/* 80198ED0 00195ED0  C0 02 D2 94 */	lfs f0, lbl_8041E614@sda21(r2)
/* 80198ED4 00195ED4  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 80198ED8 00195ED8  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 80198EDC 00195EDC  EC 20 00 72 */	fmuls f1, f0, f1
/* 80198EE0 00195EE0  48 00 2E 29 */	bl BattleAudienceAddTargetNum
/* 80198EE4 00195EE4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198EE8 00195EE8  7C 08 03 A6 */	mtlr r0
/* 80198EEC 00195EEC  38 21 00 10 */	addi r1, r1, 0x10
/* 80198EF0 00195EF0  4E 80 00 20 */	blr 

.global func_80198EF4
func_80198EF4:

.global BattleAudience_Case_FirstAttack_Good
BattleAudience_Case_FirstAttack_Good:
/* 80198EF4 00195EF4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80198EF8 00195EF8  7C 08 02 A6 */	mflr r0
/* 80198EFC 00195EFC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80198F00 00195F00  48 00 97 D5 */	bl BattleAudienceBaseGetPtr
/* 80198F04 00195F04  3C 63 00 01 */	addis r3, r3, 1
/* 80198F08 00195F08  C0 02 D2 9C */	lfs f0, lbl_8041E61C@sda21(r2)
/* 80198F0C 00195F0C  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 80198F10 00195F10  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 80198F14 00195F14  EC 20 00 72 */	fmuls f1, f0, f1
/* 80198F18 00195F18  48 00 2D F1 */	bl BattleAudienceAddTargetNum
/* 80198F1C 00195F1C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80198F20 00195F20  7C 08 03 A6 */	mtlr r0
/* 80198F24 00195F24  38 21 00 10 */	addi r1, r1, 0x10
/* 80198F28 00195F28  4E 80 00 20 */	blr 

.global BattleAudience_Case_FallObject_Aud
BattleAudience_Case_FallObject_Aud:
/* 80198F2C 00195F2C  94 21 FE D0 */	stwu r1, -0x130(r1)
/* 80198F30 00195F30  7C 08 02 A6 */	mflr r0
/* 80198F34 00195F34  90 01 01 34 */	stw r0, 0x134(r1)
/* 80198F38 00195F38  DB E1 01 20 */	stfd f31, 0x120(r1)
/* 80198F3C 00195F3C  F3 E1 01 28 */	psq_st f31, 296(r1), 0, qr0
/* 80198F40 00195F40  BF 61 01 0C */	stmw r27, 0x10c(r1)
/* 80198F44 00195F44  7C 7E 1B 78 */	mr r30, r3
/* 80198F48 00195F48  7C 9B 23 78 */	mr r27, r4
/* 80198F4C 00195F4C  48 00 97 89 */	bl BattleAudienceBaseGetPtr
/* 80198F50 00195F50  3C 80 80 30 */	lis r4, lbl_802F98FC@ha
/* 80198F54 00195F54  38 00 00 08 */	li r0, 8
/* 80198F58 00195F58  38 84 98 FC */	addi r4, r4, lbl_802F98FC@l
/* 80198F5C 00195F5C  7C 7F 1B 78 */	mr r31, r3
/* 80198F60 00195F60  38 A1 00 04 */	addi r5, r1, 4
/* 80198F64 00195F64  38 84 FF FC */	addi r4, r4, -4
/* 80198F68 00195F68  7C 09 03 A6 */	mtctr r0
.L_80198F6C:
/* 80198F6C 00195F6C  80 64 00 04 */	lwz r3, 4(r4)
/* 80198F70 00195F70  84 04 00 08 */	lwzu r0, 8(r4)
/* 80198F74 00195F74  90 65 00 04 */	stw r3, 4(r5)
/* 80198F78 00195F78  94 05 00 08 */	stwu r0, 8(r5)
/* 80198F7C 00195F7C  42 00 FF F0 */	bdnz .L_80198F6C
/* 80198F80 00195F80  3C 60 80 30 */	lis r3, lbl_802F993C@ha
/* 80198F84 00195F84  38 00 00 18 */	li r0, 0x18
/* 80198F88 00195F88  38 63 99 3C */	addi r3, r3, lbl_802F993C@l
/* 80198F8C 00195F8C  38 A1 00 44 */	addi r5, r1, 0x44
/* 80198F90 00195F90  38 83 FF FC */	addi r4, r3, -4
/* 80198F94 00195F94  7C 09 03 A6 */	mtctr r0
.L_80198F98:
/* 80198F98 00195F98  80 64 00 04 */	lwz r3, 4(r4)
/* 80198F9C 00195F9C  84 04 00 08 */	lwzu r0, 8(r4)
/* 80198FA0 00195FA0  90 65 00 04 */	stw r3, 4(r5)
/* 80198FA4 00195FA4  94 05 00 08 */	stwu r0, 8(r5)
/* 80198FA8 00195FA8  42 00 FF F0 */	bdnz .L_80198F98
/* 80198FAC 00195FAC  57 60 06 3E */	clrlwi r0, r27, 0x18
/* 80198FB0 00195FB0  2C 00 00 06 */	cmpwi r0, 6
/* 80198FB4 00195FB4  41 82 01 70 */	beq .L_80199124
/* 80198FB8 00195FB8  40 80 00 1C */	bge .L_80198FD4
/* 80198FBC 00195FBC  2C 00 00 02 */	cmpwi r0, 2
/* 80198FC0 00195FC0  41 82 01 D8 */	beq .L_80199198
/* 80198FC4 00195FC4  40 80 00 20 */	bge .L_80198FE4
/* 80198FC8 00195FC8  2C 00 00 00 */	cmpwi r0, 0
/* 80198FCC 00195FCC  40 80 00 18 */	bge .L_80198FE4
/* 80198FD0 00195FD0  48 00 01 C8 */	b .L_80199198
.L_80198FD4:
/* 80198FD4 00195FD4  2C 00 00 08 */	cmpwi r0, 8
/* 80198FD8 00195FD8  41 82 00 0C */	beq .L_80198FE4
/* 80198FDC 00195FDC  40 80 01 BC */	bge .L_80199198
/* 80198FE0 00195FE0  48 00 00 A4 */	b .L_80199084
.L_80198FE4:
/* 80198FE4 00195FE4  7F C3 F3 78 */	mr r3, r30
/* 80198FE8 00195FE8  48 00 39 CD */	bl BattleAudience_GetSysCtrl
/* 80198FEC 00195FEC  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80198FF0 00195FF0  28 00 00 01 */	cmplwi r0, 1
/* 80198FF4 00195FF4  40 82 00 24 */	bne .L_80199018
/* 80198FF8 00195FF8  7F C3 F3 78 */	mr r3, r30
/* 80198FFC 00195FFC  48 00 96 9D */	bl BattleAudienceGetPtr
/* 80199000 00196000  88 03 00 19 */	lbz r0, 0x19(r3)
/* 80199004 00196004  28 00 00 0F */	cmplwi r0, 0xf
/* 80199008 00196008  41 82 00 10 */	beq .L_80199018
/* 8019900C 0019600C  7F C3 F3 78 */	mr r3, r30
/* 80199010 00196010  38 80 00 0A */	li r4, 0xa
/* 80199014 00196014  48 00 3A 65 */	bl BattleAudience_ChangeStatus
.L_80199018:
/* 80199018 00196018  3B 60 00 00 */	li r27, 0
/* 8019901C 0019601C  3B A0 00 00 */	li r29, 0
.L_80199020:
/* 80199020 00196020  38 A1 00 08 */	addi r5, r1, 8
/* 80199024 00196024  7F C3 F3 78 */	mr r3, r30
/* 80199028 00196028  7C A5 EA 14 */	add r5, r5, r29
/* 8019902C 0019602C  80 85 00 00 */	lwz r4, 0(r5)
/* 80199030 00196030  80 A5 00 04 */	lwz r5, 4(r5)
/* 80199034 00196034  48 00 37 89 */	bl BattleAudience_GetAudienceNoFromOffset
/* 80199038 00196038  7C 7C 1B 78 */	mr r28, r3
/* 8019903C 0019603C  2C 1C FF FF */	cmpwi r28, -1
/* 80199040 00196040  41 82 00 30 */	beq .L_80199070
/* 80199044 00196044  48 00 37 F9 */	bl BattleAudience_GetEscapeChangeOK
/* 80199048 00196048  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019904C 0019604C  41 82 00 24 */	beq .L_80199070
/* 80199050 00196050  7F 83 E3 78 */	mr r3, r28
/* 80199054 00196054  38 80 00 0C */	li r4, 0xc
/* 80199058 00196058  48 00 3A 21 */	bl BattleAudience_ChangeStatus
/* 8019905C 0019605C  3C 7F 00 01 */	addis r3, r31, 1
/* 80199060 00196060  C0 02 D2 A0 */	lfs f0, lbl_8041E620@sda21(r2)
/* 80199064 00196064  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 80199068 00196068  EC 01 00 28 */	fsubs f0, f1, f0
/* 8019906C 0019606C  D0 03 37 7C */	stfs f0, 0x377c(r3)
.L_80199070:
/* 80199070 00196070  3B 7B 00 01 */	addi r27, r27, 1
/* 80199074 00196074  3B BD 00 08 */	addi r29, r29, 8
/* 80199078 00196078  2C 1B 00 08 */	cmpwi r27, 8
/* 8019907C 0019607C  41 80 FF A4 */	blt .L_80199020
/* 80199080 00196080  48 00 01 60 */	b .L_801991E0
.L_80199084:
/* 80199084 00196084  7F C3 F3 78 */	mr r3, r30
/* 80199088 00196088  48 00 39 2D */	bl BattleAudience_GetSysCtrl
/* 8019908C 0019608C  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80199090 00196090  28 00 00 01 */	cmplwi r0, 1
/* 80199094 00196094  40 82 00 24 */	bne .L_801990B8
/* 80199098 00196098  7F C3 F3 78 */	mr r3, r30
/* 8019909C 0019609C  48 00 95 FD */	bl BattleAudienceGetPtr
/* 801990A0 001960A0  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801990A4 001960A4  28 00 00 0F */	cmplwi r0, 0xf
/* 801990A8 001960A8  41 82 00 10 */	beq .L_801990B8
/* 801990AC 001960AC  7F C3 F3 78 */	mr r3, r30
/* 801990B0 001960B0  38 80 00 0A */	li r4, 0xa
/* 801990B4 001960B4  48 00 39 C5 */	bl BattleAudience_ChangeStatus
.L_801990B8:
/* 801990B8 001960B8  3B 80 00 00 */	li r28, 0
/* 801990BC 001960BC  3B A0 00 00 */	li r29, 0
.L_801990C0:
/* 801990C0 001960C0  38 A1 00 48 */	addi r5, r1, 0x48
/* 801990C4 001960C4  7F C3 F3 78 */	mr r3, r30
/* 801990C8 001960C8  7C A5 EA 14 */	add r5, r5, r29
/* 801990CC 001960CC  80 85 00 00 */	lwz r4, 0(r5)
/* 801990D0 001960D0  80 A5 00 04 */	lwz r5, 4(r5)
/* 801990D4 001960D4  48 00 36 E9 */	bl BattleAudience_GetAudienceNoFromOffset
/* 801990D8 001960D8  7C 7B 1B 78 */	mr r27, r3
/* 801990DC 001960DC  2C 1B FF FF */	cmpwi r27, -1
/* 801990E0 001960E0  41 82 00 30 */	beq .L_80199110
/* 801990E4 001960E4  48 00 37 59 */	bl BattleAudience_GetEscapeChangeOK
/* 801990E8 001960E8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801990EC 001960EC  41 82 00 24 */	beq .L_80199110
/* 801990F0 001960F0  7F 63 DB 78 */	mr r3, r27
/* 801990F4 001960F4  38 80 00 0C */	li r4, 0xc
/* 801990F8 001960F8  48 00 39 81 */	bl BattleAudience_ChangeStatus
/* 801990FC 001960FC  3C 7F 00 01 */	addis r3, r31, 1
/* 80199100 00196100  C0 02 D2 A0 */	lfs f0, lbl_8041E620@sda21(r2)
/* 80199104 00196104  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 80199108 00196108  EC 01 00 28 */	fsubs f0, f1, f0
/* 8019910C 0019610C  D0 03 37 7C */	stfs f0, 0x377c(r3)
.L_80199110:
/* 80199110 00196110  3B 9C 00 01 */	addi r28, r28, 1
/* 80199114 00196114  3B BD 00 08 */	addi r29, r29, 8
/* 80199118 00196118  2C 1C 00 18 */	cmpwi r28, 0x18
/* 8019911C 0019611C  41 80 FF A4 */	blt .L_801990C0
/* 80199120 00196120  48 00 00 C0 */	b .L_801991E0
.L_80199124:
/* 80199124 00196124  7F C3 F3 78 */	mr r3, r30
/* 80199128 00196128  48 00 38 8D */	bl BattleAudience_GetSysCtrl
/* 8019912C 0019612C  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80199130 00196130  28 00 00 01 */	cmplwi r0, 1
/* 80199134 00196134  40 82 00 24 */	bne .L_80199158
/* 80199138 00196138  7F C3 F3 78 */	mr r3, r30
/* 8019913C 0019613C  48 00 95 5D */	bl BattleAudienceGetPtr
/* 80199140 00196140  88 03 00 19 */	lbz r0, 0x19(r3)
/* 80199144 00196144  28 00 00 0F */	cmplwi r0, 0xf
/* 80199148 00196148  41 82 00 10 */	beq .L_80199158
/* 8019914C 0019614C  7F C3 F3 78 */	mr r3, r30
/* 80199150 00196150  38 80 00 0A */	li r4, 0xa
/* 80199154 00196154  48 00 39 25 */	bl BattleAudience_ChangeStatus
.L_80199158:
/* 80199158 00196158  C3 E2 D2 A0 */	lfs f31, lbl_8041E620@sda21(r2)
/* 8019915C 0019615C  3F BF 00 01 */	addis r29, r31, 1
/* 80199160 00196160  3B 80 00 00 */	li r28, 0
.L_80199164:
/* 80199164 00196164  7F 83 E3 78 */	mr r3, r28
/* 80199168 00196168  48 00 36 D5 */	bl BattleAudience_GetEscapeChangeOK
/* 8019916C 0019616C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 80199170 00196170  41 82 00 1C */	beq .L_8019918C
/* 80199174 00196174  7F 83 E3 78 */	mr r3, r28
/* 80199178 00196178  38 80 00 0C */	li r4, 0xc
/* 8019917C 0019617C  48 00 38 FD */	bl BattleAudience_ChangeStatus
/* 80199180 00196180  C0 1D 37 7C */	lfs f0, 0x377c(r29)
/* 80199184 00196184  EC 00 F8 28 */	fsubs f0, f0, f31
/* 80199188 00196188  D0 1D 37 7C */	stfs f0, 0x377c(r29)
.L_8019918C:
/* 8019918C 0019618C  3B 9C 00 01 */	addi r28, r28, 1
/* 80199190 00196190  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 80199194 00196194  41 80 FF D0 */	blt .L_80199164
.L_80199198:
/* 80199198 00196198  7F C3 F3 78 */	mr r3, r30
/* 8019919C 0019619C  48 00 38 19 */	bl BattleAudience_GetSysCtrl
/* 801991A0 001961A0  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801991A4 001961A4  28 00 00 01 */	cmplwi r0, 1
/* 801991A8 001961A8  40 82 00 24 */	bne .L_801991CC
/* 801991AC 001961AC  7F C3 F3 78 */	mr r3, r30
/* 801991B0 001961B0  48 00 94 E9 */	bl BattleAudienceGetPtr
/* 801991B4 001961B4  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801991B8 001961B8  28 00 00 0F */	cmplwi r0, 0xf
/* 801991BC 001961BC  41 82 00 10 */	beq .L_801991CC
/* 801991C0 001961C0  7F C3 F3 78 */	mr r3, r30
/* 801991C4 001961C4  38 80 00 0A */	li r4, 0xa
/* 801991C8 001961C8  48 00 38 B1 */	bl BattleAudience_ChangeStatus
.L_801991CC:
/* 801991CC 001961CC  3C 7F 00 01 */	addis r3, r31, 1
/* 801991D0 001961D0  C0 02 D2 A0 */	lfs f0, lbl_8041E620@sda21(r2)
/* 801991D4 001961D4  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 801991D8 001961D8  EC 01 00 28 */	fsubs f0, f1, f0
/* 801991DC 001961DC  D0 03 37 7C */	stfs f0, 0x377c(r3)
.L_801991E0:
/* 801991E0 001961E0  48 00 27 0D */	bl BattleAudiencePuniAllEscape
/* 801991E4 001961E4  E3 E1 01 28 */	psq_l f31, 296(r1), 0, qr0
/* 801991E8 001961E8  CB E1 01 20 */	lfd f31, 0x120(r1)
/* 801991EC 001961EC  BB 61 01 0C */	lmw r27, 0x10c(r1)
/* 801991F0 001961F0  80 01 01 34 */	lwz r0, 0x134(r1)
/* 801991F4 001961F4  7C 08 03 A6 */	mtlr r0
/* 801991F8 001961F8  38 21 01 30 */	addi r1, r1, 0x130
/* 801991FC 001961FC  4E 80 00 20 */	blr 

.global func_80199200
func_80199200:

.global BattleAudience_Case_FallObject_Stage
BattleAudience_Case_FallObject_Stage:
/* 80199200 00196200  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199204 00196204  7C 08 02 A6 */	mflr r0
/* 80199208 00196208  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019920C 0019620C  48 00 94 C9 */	bl BattleAudienceBaseGetPtr
/* 80199210 00196210  3C 63 00 01 */	addis r3, r3, 1
/* 80199214 00196214  C0 02 D2 A4 */	lfs f0, lbl_8041E624@sda21(r2)
/* 80199218 00196218  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 8019921C 0019621C  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 80199220 00196220  EC 20 00 72 */	fmuls f1, f0, f1
/* 80199224 00196224  48 00 2A E5 */	bl BattleAudienceAddTargetNum
/* 80199228 00196228  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019922C 0019622C  7C 08 03 A6 */	mtlr r0
/* 80199230 00196230  38 21 00 10 */	addi r1, r1, 0x10
/* 80199234 00196234  4E 80 00 20 */	blr 

.global BattleAudience_Case_FastVictory
BattleAudience_Case_FastVictory:
/* 80199238 00196238  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019923C 0019623C  7C 08 02 A6 */	mflr r0
/* 80199240 00196240  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199244 00196244  DB E1 00 10 */	stfd f31, 0x10(r1)
/* 80199248 00196248  F3 E1 00 18 */	psq_st f31, 24(r1), 0, qr0
/* 8019924C 0019624C  FF E0 08 90 */	fmr f31, f1
/* 80199250 00196250  48 00 94 85 */	bl BattleAudienceBaseGetPtr
/* 80199254 00196254  C0 02 D2 AC */	lfs f0, lbl_8041E62C@sda21(r2)
/* 80199258 00196258  3C 63 00 01 */	addis r3, r3, 1
/* 8019925C 0019625C  C0 22 D2 A8 */	lfs f1, lbl_8041E628@sda21(r2)
/* 80199260 00196260  EC 00 07 F2 */	fmuls f0, f0, f31
/* 80199264 00196264  C0 63 37 78 */	lfs f3, 0x3778(r3)
/* 80199268 00196268  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 8019926C 0019626C  EC 01 00 32 */	fmuls f0, f1, f0
/* 80199270 00196270  EC 20 00 F2 */	fmuls f1, f0, f3
/* 80199274 00196274  48 00 2A 95 */	bl BattleAudienceAddTargetNum
/* 80199278 00196278  E3 E1 00 18 */	psq_l f31, 24(r1), 0, qr0
/* 8019927C 0019627C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199280 00196280  CB E1 00 10 */	lfd f31, 0x10(r1)
/* 80199284 00196284  7C 08 03 A6 */	mtlr r0
/* 80199288 00196288  38 21 00 20 */	addi r1, r1, 0x20
/* 8019928C 0019628C  4E 80 00 20 */	blr 

.global func_80199290
func_80199290:

.global BattleAudience_Case_GreatVictory
BattleAudience_Case_GreatVictory:
/* 80199290 00196290  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199294 00196294  7C 08 02 A6 */	mflr r0
/* 80199298 00196298  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019929C 0019629C  48 00 94 39 */	bl BattleAudienceBaseGetPtr
/* 801992A0 001962A0  3C 63 00 01 */	addis r3, r3, 1
/* 801992A4 001962A4  C0 02 D2 B0 */	lfs f0, lbl_8041E630@sda21(r2)
/* 801992A8 001962A8  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801992AC 001962AC  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801992B0 001962B0  EC 20 00 72 */	fmuls f1, f0, f1
/* 801992B4 001962B4  48 00 2A 55 */	bl BattleAudienceAddTargetNum
/* 801992B8 001962B8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801992BC 001962BC  7C 08 03 A6 */	mtlr r0
/* 801992C0 001962C0  38 21 00 10 */	addi r1, r1, 0x10
/* 801992C4 001962C4  4E 80 00 20 */	blr 

.global func_801992C8
func_801992C8:

.global BattleAudience_Case_HaikeiSet
BattleAudience_Case_HaikeiSet:
/* 801992C8 001962C8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801992CC 001962CC  7C 08 02 A6 */	mflr r0
/* 801992D0 001962D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801992D4 001962D4  48 00 94 01 */	bl BattleAudienceBaseGetPtr
/* 801992D8 001962D8  3C 63 00 01 */	addis r3, r3, 1
/* 801992DC 001962DC  C0 02 D2 A4 */	lfs f0, lbl_8041E624@sda21(r2)
/* 801992E0 001962E0  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801992E4 001962E4  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801992E8 001962E8  EC 20 00 72 */	fmuls f1, f0, f1
/* 801992EC 001962EC  48 00 2A 1D */	bl BattleAudienceAddTargetNum
/* 801992F0 001962F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801992F4 001962F4  7C 08 03 A6 */	mtlr r0
/* 801992F8 001962F8  38 21 00 10 */	addi r1, r1, 0x10
/* 801992FC 001962FC  4E 80 00 20 */	blr 

.global BattleAudience_Case_Countered
BattleAudience_Case_Countered:
/* 80199300 00196300  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199304 00196304  7C 08 02 A6 */	mflr r0
/* 80199308 00196308  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019930C 0019630C  48 00 93 C9 */	bl BattleAudienceBaseGetPtr
/* 80199310 00196310  3C 63 00 01 */	addis r3, r3, 1
/* 80199314 00196314  C0 02 D2 B4 */	lfs f0, lbl_8041E634@sda21(r2)
/* 80199318 00196318  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 8019931C 0019631C  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 80199320 00196320  EC 20 00 72 */	fmuls f1, f0, f1
/* 80199324 00196324  48 00 29 E5 */	bl BattleAudienceAddTargetNum
/* 80199328 00196328  38 60 00 05 */	li r3, 5
/* 8019932C 0019632C  48 00 24 89 */	bl BattleAudienceAddPhaseEvtList
/* 80199330 00196330  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199334 00196334  7C 08 03 A6 */	mtlr r0
/* 80199338 00196338  38 21 00 10 */	addi r1, r1, 0x10
/* 8019933C 0019633C  4E 80 00 20 */	blr 

.global BattleAudience_Case_EnemyNoDamage
BattleAudience_Case_EnemyNoDamage:
/* 80199340 00196340  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199344 00196344  7C 08 02 A6 */	mflr r0
/* 80199348 00196348  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019934C 0019634C  48 00 93 89 */	bl BattleAudienceBaseGetPtr
/* 80199350 00196350  80 03 00 00 */	lwz r0, 0(r3)
/* 80199354 00196354  60 00 08 00 */	ori r0, r0, 0x800
/* 80199358 00196358  90 03 00 00 */	stw r0, 0(r3)
/* 8019935C 0019635C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199360 00196360  7C 08 03 A6 */	mtlr r0
/* 80199364 00196364  38 21 00 10 */	addi r1, r1, 0x10
/* 80199368 00196368  4E 80 00 20 */	blr 

.global BattleAudience_Case_EnemyDamage
BattleAudience_Case_EnemyDamage:
/* 8019936C 0019636C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199370 00196370  7C 08 02 A6 */	mflr r0
/* 80199374 00196374  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199378 00196378  48 00 93 5D */	bl BattleAudienceBaseGetPtr
/* 8019937C 0019637C  80 03 00 00 */	lwz r0, 0(r3)
/* 80199380 00196380  60 00 04 00 */	ori r0, r0, 0x400
/* 80199384 00196384  90 03 00 00 */	stw r0, 0(r3)
/* 80199388 00196388  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019938C 0019638C  7C 08 03 A6 */	mtlr r0
/* 80199390 00196390  38 21 00 10 */	addi r1, r1, 0x10
/* 80199394 00196394  4E 80 00 20 */	blr 

.global BattleAudience_Case_Escape_Bad
BattleAudience_Case_Escape_Bad:
/* 80199398 00196398  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019939C 0019639C  7C 08 02 A6 */	mflr r0
/* 801993A0 001963A0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801993A4 001963A4  48 00 93 31 */	bl BattleAudienceBaseGetPtr
/* 801993A8 001963A8  3C 63 00 01 */	addis r3, r3, 1
/* 801993AC 001963AC  C0 02 D2 B8 */	lfs f0, lbl_8041E638@sda21(r2)
/* 801993B0 001963B0  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801993B4 001963B4  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801993B8 001963B8  EC 20 00 72 */	fmuls f1, f0, f1
/* 801993BC 001963BC  48 00 29 4D */	bl BattleAudienceAddTargetNum
/* 801993C0 001963C0  48 00 1E A5 */	bl BattleAudienceSoundBooing
/* 801993C4 001963C4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801993C8 001963C8  7C 08 03 A6 */	mtlr r0
/* 801993CC 001963CC  38 21 00 10 */	addi r1, r1, 0x10
/* 801993D0 001963D0  4E 80 00 20 */	blr 

.global BattleAudience_Case_Escape_Good
BattleAudience_Case_Escape_Good:
/* 801993D4 001963D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801993D8 001963D8  7C 08 02 A6 */	mflr r0
/* 801993DC 001963DC  90 01 00 14 */	stw r0, 0x14(r1)
/* 801993E0 001963E0  48 00 92 F5 */	bl BattleAudienceBaseGetPtr
/* 801993E4 001963E4  3C 63 00 01 */	addis r3, r3, 1
/* 801993E8 001963E8  C0 02 D2 B4 */	lfs f0, lbl_8041E634@sda21(r2)
/* 801993EC 001963EC  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801993F0 001963F0  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801993F4 001963F4  EC 20 00 72 */	fmuls f1, f0, f1
/* 801993F8 001963F8  48 00 29 11 */	bl BattleAudienceAddTargetNum
/* 801993FC 001963FC  38 60 00 02 */	li r3, 2
/* 80199400 00196400  38 80 00 64 */	li r4, 0x64
/* 80199404 00196404  38 A0 00 1E */	li r5, 0x1e
/* 80199408 00196408  48 00 0C B5 */	bl BattleAudienceSoundSetVol
/* 8019940C 0019640C  48 00 1E 59 */	bl BattleAudienceSoundBooing
/* 80199410 00196410  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199414 00196414  7C 08 03 A6 */	mtlr r0
/* 80199418 00196418  38 21 00 10 */	addi r1, r1, 0x10
/* 8019941C 0019641C  4E 80 00 20 */	blr 

.global func_80199420
func_80199420:
/* 80199420 00196420  4E 80 00 20 */	blr 

.global BattleAudience_Case_Appeal
BattleAudience_Case_Appeal:
/* 80199424 00196424  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199428 00196428  7C 08 02 A6 */	mflr r0
/* 8019942C 0019642C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199430 00196430  BF C1 00 18 */	stmw r30, 0x18(r1)
/* 80199434 00196434  7C 7E 1B 78 */	mr r30, r3
/* 80199438 00196438  48 00 92 9D */	bl BattleAudienceBaseGetPtr
/* 8019943C 0019643C  7C 7F 1B 78 */	mr r31, r3
/* 80199440 00196440  48 00 2F 99 */	bl BattleAudience_GetPPAudienceNum
/* 80199444 00196444  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80199448 00196448  3C 00 43 30 */	lis r0, 0x4330
/* 8019944C 0019644C  90 61 00 0C */	stw r3, 0xc(r1)
/* 80199450 00196450  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 80199454 00196454  C8 44 9A 00 */	lfd f2, lbl_802F9A00@l(r4)
/* 80199458 00196458  90 01 00 08 */	stw r0, 8(r1)
/* 8019945C 0019645C  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 80199460 00196460  C8 21 00 08 */	lfd f1, 8(r1)
/* 80199464 00196464  EC 21 10 28 */	fsubs f1, f1, f2
/* 80199468 00196468  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019946C 0019646C  40 81 00 90 */	ble .L_801994FC
/* 80199470 00196470  48 00 2F 69 */	bl BattleAudience_GetPPAudienceNum
/* 80199474 00196474  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 80199478 00196478  3C 00 43 30 */	lis r0, 0x4330
/* 8019947C 0019647C  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 80199480 00196480  90 61 00 0C */	stw r3, 0xc(r1)
/* 80199484 00196484  38 64 9A 00 */	addi r3, r4, lbl_802F9A00@l
/* 80199488 00196488  3C 9F 00 01 */	addis r4, r31, 1
/* 8019948C 0019648C  90 01 00 08 */	stw r0, 8(r1)
/* 80199490 00196490  C8 43 00 00 */	lfd f2, 0(r3)
/* 80199494 00196494  C8 21 00 08 */	lfd f1, 8(r1)
/* 80199498 00196498  C0 02 D2 BC */	lfs f0, lbl_8041E63C@sda21(r2)
/* 8019949C 0019649C  EC 21 10 28 */	fsubs f1, f1, f2
/* 801994A0 001964A0  80 04 37 C4 */	lwz r0, 0x37c4(r4)
/* 801994A4 001964A4  EC 01 00 32 */	fmuls f0, f1, f0
/* 801994A8 001964A8  FC 00 00 1E */	fctiwz f0, f0
/* 801994AC 001964AC  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 801994B0 001964B0  80 61 00 14 */	lwz r3, 0x14(r1)
/* 801994B4 001964B4  7C 63 02 14 */	add r3, r3, r0
/* 801994B8 001964B8  38 03 00 19 */	addi r0, r3, 0x19
/* 801994BC 001964BC  90 04 37 C4 */	stw r0, 0x37c4(r4)
/* 801994C0 001964C0  88 1E 02 FF */	lbz r0, 0x2ff(r30)
/* 801994C4 001964C4  28 00 00 00 */	cmplwi r0, 0
/* 801994C8 001964C8  41 82 00 14 */	beq .L_801994DC
/* 801994CC 001964CC  1C 00 00 19 */	mulli r0, r0, 0x19
/* 801994D0 001964D0  80 64 37 C4 */	lwz r3, 0x37c4(r4)
/* 801994D4 001964D4  7C 03 02 14 */	add r0, r3, r0
/* 801994D8 001964D8  90 04 37 C4 */	stw r0, 0x37c4(r4)
.L_801994DC:
/* 801994DC 001964DC  38 60 00 B4 */	li r3, 0xb4
/* 801994E0 001964E0  38 80 00 3C */	li r4, 0x3c
/* 801994E4 001964E4  48 00 18 9D */	bl BattleAudienceSoundCheer
/* 801994E8 001964E8  38 60 00 B4 */	li r3, 0xb4
/* 801994EC 001964EC  38 80 00 3C */	li r4, 0x3c
/* 801994F0 001964F0  48 00 1A 91 */	bl BattleAudienceSoundClap
/* 801994F4 001964F4  38 60 00 00 */	li r3, 0
/* 801994F8 001964F8  48 00 20 99 */	bl BattleAudienceJoy
.L_801994FC:
/* 801994FC 001964FC  48 00 91 D9 */	bl BattleAudienceBaseGetPtr
/* 80199500 00196500  3C 63 00 01 */	addis r3, r3, 1
/* 80199504 00196504  C0 02 D2 A4 */	lfs f0, lbl_8041E624@sda21(r2)
/* 80199508 00196508  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 8019950C 0019650C  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 80199510 00196510  EC 20 00 72 */	fmuls f1, f0, f1
/* 80199514 00196514  48 00 27 F5 */	bl BattleAudienceAddTargetNum
/* 80199518 00196518  BB C1 00 18 */	lmw r30, 0x18(r1)
/* 8019951C 0019651C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199520 00196520  7C 08 03 A6 */	mtlr r0
/* 80199524 00196524  38 21 00 20 */	addi r1, r1, 0x20
/* 80199528 00196528  4E 80 00 20 */	blr 

.global BattleAudience_Case_TurnEnd
BattleAudience_Case_TurnEnd:
/* 8019952C 0019652C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199530 00196530  7C 08 02 A6 */	mflr r0
/* 80199534 00196534  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199538 00196538  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019953C 0019653C  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 80199540 00196540  7F C3 F3 78 */	mr r3, r30
/* 80199544 00196544  4B F5 A3 11 */	bl BattleGetMarioPtr
/* 80199548 00196548  7C 7D 1B 78 */	mr r29, r3
/* 8019954C 0019654C  48 00 91 89 */	bl BattleAudienceBaseGetPtr
/* 80199550 00196550  7C 7F 1B 78 */	mr r31, r3
/* 80199554 00196554  4B F3 87 21 */	bl func_800D1C74
/* 80199558 00196558  80 7E 27 38 */	lwz r3, 0x2738(r30)
/* 8019955C 0019655C  38 A0 00 00 */	li r5, 0
/* 80199560 00196560  80 1F 00 00 */	lwz r0, 0(r31)
/* 80199564 00196564  80 63 00 0C */	lwz r3, 0xc(r3)
/* 80199568 00196568  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 8019956C 0019656C  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 80199570 00196570  80 E6 00 04 */	lwz r7, 4(r6)
/* 80199574 00196574  40 82 01 0C */	bne .L_80199680
/* 80199578 00196578  3C 9F 00 01 */	addis r4, r31, 1
/* 8019957C 0019657C  80 64 39 08 */	lwz r3, 0x3908(r4)
/* 80199580 00196580  38 03 00 03 */	addi r0, r3, 3
/* 80199584 00196584  90 04 39 08 */	stw r0, 0x3908(r4)
/* 80199588 00196588  80 04 39 08 */	lwz r0, 0x3908(r4)
/* 8019958C 0019658C  2C 00 00 64 */	cmpwi r0, 0x64
/* 80199590 00196590  40 81 00 0C */	ble .L_8019959C
/* 80199594 00196594  38 00 00 64 */	li r0, 0x64
/* 80199598 00196598  90 04 39 08 */	stw r0, 0x3908(r4)
.L_8019959C:
/* 8019959C 0019659C  80 06 00 00 */	lwz r0, 0(r6)
/* 801995A0 001965A0  7C 09 03 A6 */	mtctr r0
/* 801995A4 001965A4  2C 00 00 00 */	cmpwi r0, 0
/* 801995A8 001965A8  40 81 00 18 */	ble .L_801995C0
.L_801995AC:
/* 801995AC 001965AC  80 67 00 00 */	lwz r3, 0(r7)
/* 801995B0 001965B0  38 E7 00 30 */	addi r7, r7, 0x30
/* 801995B4 001965B4  88 03 00 0E */	lbz r0, 0xe(r3)
/* 801995B8 001965B8  7C A5 02 14 */	add r5, r5, r0
/* 801995BC 001965BC  42 00 FF F0 */	bdnz .L_801995AC
.L_801995C0:
/* 801995C0 001965C0  88 1D 00 0D */	lbz r0, 0xd(r29)
/* 801995C4 001965C4  54 A3 08 3C */	slwi r3, r5, 1
/* 801995C8 001965C8  7F A3 03 D6 */	divw r29, r3, r0
/* 801995CC 001965CC  2C 1D 00 05 */	cmpwi r29, 5
/* 801995D0 001965D0  40 80 00 08 */	bge .L_801995D8
/* 801995D4 001965D4  3B A0 00 05 */	li r29, 5
.L_801995D8:
/* 801995D8 001965D8  A8 1E 00 00 */	lha r0, 0(r30)
/* 801995DC 001965DC  7C 00 E8 00 */	cmpw r0, r29
/* 801995E0 001965E0  41 80 00 20 */	blt .L_80199600
/* 801995E4 001965E4  48 00 90 F1 */	bl BattleAudienceBaseGetPtr
/* 801995E8 001965E8  3C 63 00 01 */	addis r3, r3, 1
/* 801995EC 001965EC  C0 02 D2 94 */	lfs f0, lbl_8041E614@sda21(r2)
/* 801995F0 001965F0  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801995F4 001965F4  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801995F8 001965F8  EC 20 00 72 */	fmuls f1, f0, f1
/* 801995FC 001965FC  48 00 27 0D */	bl BattleAudienceAddTargetNum
.L_80199600:
/* 80199600 00196600  A8 1E 00 00 */	lha r0, 0(r30)
/* 80199604 00196604  7C 00 E8 00 */	cmpw r0, r29
/* 80199608 00196608  40 82 00 0C */	bne .L_80199614
/* 8019960C 0019660C  38 60 00 06 */	li r3, 6
/* 80199610 00196610  48 00 21 A5 */	bl BattleAudienceAddPhaseEvtList
.L_80199614:
/* 80199614 00196614  38 60 00 64 */	li r3, 0x64
/* 80199618 00196618  4B E6 C8 AD */	bl irand
/* 8019961C 0019661C  3C 9F 00 01 */	addis r4, r31, 1
/* 80199620 00196620  80 04 39 08 */	lwz r0, 0x3908(r4)
/* 80199624 00196624  7C 03 00 00 */	cmpw r3, r0
/* 80199628 00196628  40 80 00 54 */	bge .L_8019967C
/* 8019962C 0019662C  A8 1E 00 00 */	lha r0, 0(r30)
/* 80199630 00196630  7C 00 E8 00 */	cmpw r0, r29
/* 80199634 00196634  41 80 00 0C */	blt .L_80199640
/* 80199638 00196638  38 60 00 01 */	li r3, 1
/* 8019963C 0019663C  48 00 21 79 */	bl BattleAudienceAddPhaseEvtList
.L_80199640:
/* 80199640 00196640  38 60 00 04 */	li r3, 4
/* 80199644 00196644  48 00 21 71 */	bl BattleAudienceAddPhaseEvtList
/* 80199648 00196648  38 60 00 09 */	li r3, 9
/* 8019964C 0019664C  48 00 21 69 */	bl BattleAudienceAddPhaseEvtList
/* 80199650 00196650  38 60 00 0A */	li r3, 0xa
/* 80199654 00196654  48 00 21 61 */	bl BattleAudienceAddPhaseEvtList
/* 80199658 00196658  38 60 00 0B */	li r3, 0xb
/* 8019965C 0019665C  48 00 21 59 */	bl BattleAudienceAddPhaseEvtList
/* 80199660 00196660  38 60 00 0C */	li r3, 0xc
/* 80199664 00196664  48 00 21 51 */	bl BattleAudienceAddPhaseEvtList
/* 80199668 00196668  38 60 00 0D */	li r3, 0xd
/* 8019966C 0019666C  48 00 21 49 */	bl BattleAudienceAddPhaseEvtList
/* 80199670 00196670  3C 7F 00 01 */	addis r3, r31, 1
/* 80199674 00196674  38 00 00 00 */	li r0, 0
/* 80199678 00196678  90 03 39 08 */	stw r0, 0x3908(r3)
.L_8019967C:
/* 8019967C 0019667C  48 00 28 79 */	bl BattleAudienceNumToTarget
.L_80199680:
/* 80199680 00196680  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80199684 00196684  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199688 00196688  7C 08 03 A6 */	mtlr r0
/* 8019968C 0019668C  38 21 00 20 */	addi r1, r1, 0x20
/* 80199690 00196690  4E 80 00 20 */	blr 

.global func_80199694
func_80199694:

.global BattleAudience_Case_FinalAttack
BattleAudience_Case_FinalAttack:
/* 80199694 00196694  4E 80 00 20 */	blr 

.global func_80199698
func_80199698:

.global BattleAudience_Case_JumpNewRecord
BattleAudience_Case_JumpNewRecord:
/* 80199698 00196698  4E 80 00 20 */	blr 

.global func_8019969C
func_8019969C:

.global BattleAudience_Case_PartyDown
BattleAudience_Case_PartyDown:
/* 8019969C 0019669C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801996A0 001966A0  7C 08 02 A6 */	mflr r0
/* 801996A4 001966A4  90 01 00 14 */	stw r0, 0x14(r1)
/* 801996A8 001966A8  48 00 90 2D */	bl BattleAudienceBaseGetPtr
/* 801996AC 001966AC  3C 63 00 01 */	addis r3, r3, 1
/* 801996B0 001966B0  C0 02 D2 C0 */	lfs f0, lbl_8041E640@sda21(r2)
/* 801996B4 001966B4  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801996B8 001966B8  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801996BC 001966BC  EC 20 00 72 */	fmuls f1, f0, f1
/* 801996C0 001966C0  48 00 26 49 */	bl BattleAudienceAddTargetNum
/* 801996C4 001966C4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801996C8 001966C8  7C 08 03 A6 */	mtlr r0
/* 801996CC 001966CC  38 21 00 10 */	addi r1, r1, 0x10
/* 801996D0 001966D0  4E 80 00 20 */	blr 

.global func_801996D4
func_801996D4:

.global BattleAudience_Case_MarioDanger
BattleAudience_Case_MarioDanger:
/* 801996D4 001966D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801996D8 001966D8  7C 08 02 A6 */	mflr r0
/* 801996DC 001966DC  90 01 00 14 */	stw r0, 0x14(r1)
/* 801996E0 001966E0  48 00 8F F5 */	bl BattleAudienceBaseGetPtr
/* 801996E4 001966E4  3C 63 00 01 */	addis r3, r3, 1
/* 801996E8 001966E8  C0 02 D2 B0 */	lfs f0, lbl_8041E630@sda21(r2)
/* 801996EC 001966EC  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801996F0 001966F0  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801996F4 001966F4  EC 20 00 72 */	fmuls f1, f0, f1
/* 801996F8 001966F8  48 00 26 11 */	bl BattleAudienceAddTargetNum
/* 801996FC 001966FC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199700 00196700  7C 08 03 A6 */	mtlr r0
/* 80199704 00196704  38 21 00 10 */	addi r1, r1, 0x10
/* 80199708 00196708  4E 80 00 20 */	blr 

.global func_8019970C
func_8019970C:

.global BattleAudience_Case_MarioPinch
BattleAudience_Case_MarioPinch:
/* 8019970C 0019670C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199710 00196710  7C 08 02 A6 */	mflr r0
/* 80199714 00196714  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199718 00196718  48 00 8F BD */	bl BattleAudienceBaseGetPtr
/* 8019971C 0019671C  3C 63 00 01 */	addis r3, r3, 1
/* 80199720 00196720  C0 02 D2 A4 */	lfs f0, lbl_8041E624@sda21(r2)
/* 80199724 00196724  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 80199728 00196728  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 8019972C 0019672C  EC 20 00 72 */	fmuls f1, f0, f1
/* 80199730 00196730  48 00 25 D9 */	bl BattleAudienceAddTargetNum
/* 80199734 00196734  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199738 00196738  7C 08 03 A6 */	mtlr r0
/* 8019973C 0019673C  38 21 00 10 */	addi r1, r1, 0x10
/* 80199740 00196740  4E 80 00 20 */	blr 

.global func_80199744
func_80199744:

.global BattleAudience_Case_MarioBigDamage
BattleAudience_Case_MarioBigDamage:
/* 80199744 00196744  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199748 00196748  7C 08 02 A6 */	mflr r0
/* 8019974C 0019674C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199750 00196750  48 00 8F 85 */	bl BattleAudienceBaseGetPtr
/* 80199754 00196754  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199758 00196758  7C 08 03 A6 */	mtlr r0
/* 8019975C 0019675C  38 21 00 10 */	addi r1, r1, 0x10
/* 80199760 00196760  4E 80 00 20 */	blr 

.global func_80199764
func_80199764:

.global BattleAudience_Case_AcrobatNoTry
BattleAudience_Case_AcrobatNoTry:
/* 80199764 00196764  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199768 00196768  7C 08 02 A6 */	mflr r0
/* 8019976C 0019676C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199770 00196770  48 00 8F 65 */	bl BattleAudienceBaseGetPtr
/* 80199774 00196774  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199778 00196778  7C 08 03 A6 */	mtlr r0
/* 8019977C 0019677C  38 21 00 10 */	addi r1, r1, 0x10
/* 80199780 00196780  4E 80 00 20 */	blr 

.global BattleAudience_Case_AcrobatBad
BattleAudience_Case_AcrobatBad:
/* 80199784 00196784  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199788 00196788  7C 08 02 A6 */	mflr r0
/* 8019978C 0019678C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199790 00196790  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 80199794 00196794  48 00 8F 41 */	bl BattleAudienceBaseGetPtr
/* 80199798 00196798  7C 7F 1B 78 */	mr r31, r3
/* 8019979C 0019679C  3B C0 00 00 */	li r30, 0
/* 801997A0 001967A0  3B A0 00 00 */	li r29, 0
.L_801997A4:
/* 801997A4 001967A4  7F A3 EB 78 */	mr r3, r29
/* 801997A8 001967A8  48 00 31 91 */	bl BattleAudience_GetWaiting
/* 801997AC 001967AC  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801997B0 001967B0  28 00 00 01 */	cmplwi r0, 1
/* 801997B4 001967B4  40 82 00 08 */	bne .L_801997BC
/* 801997B8 001967B8  3B DE 00 01 */	addi r30, r30, 1
.L_801997BC:
/* 801997BC 001967BC  3B BD 00 01 */	addi r29, r29, 1
/* 801997C0 001967C0  2C 1D 00 C8 */	cmpwi r29, 0xc8
/* 801997C4 001967C4  41 80 FF E0 */	blt .L_801997A4
/* 801997C8 001967C8  2C 1E 00 01 */	cmpwi r30, 1
/* 801997CC 001967CC  41 80 00 10 */	blt .L_801997DC
/* 801997D0 001967D0  48 00 1A 95 */	bl BattleAudienceSoundBooing
/* 801997D4 001967D4  38 60 00 00 */	li r3, 0
/* 801997D8 001967D8  48 00 1D B9 */	bl BattleAudienceJoy
.L_801997DC:
/* 801997DC 001967DC  80 1F 00 00 */	lwz r0, 0(r31)
/* 801997E0 001967E0  60 00 02 00 */	ori r0, r0, 0x200
/* 801997E4 001967E4  90 1F 00 00 */	stw r0, 0(r31)
/* 801997E8 001967E8  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 801997EC 001967EC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801997F0 001967F0  7C 08 03 A6 */	mtlr r0
/* 801997F4 001967F4  38 21 00 20 */	addi r1, r1, 0x20
/* 801997F8 001967F8  4E 80 00 20 */	blr 

.global BattleAudience_Case_AcrobatGood
BattleAudience_Case_AcrobatGood:
/* 801997FC 001967FC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199800 00196800  7C 08 02 A6 */	mflr r0
/* 80199804 00196804  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199808 00196808  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019980C 0019680C  48 00 8E C9 */	bl BattleAudienceBaseGetPtr
/* 80199810 00196810  7C 7F 1B 78 */	mr r31, r3
/* 80199814 00196814  3B C0 00 00 */	li r30, 0
/* 80199818 00196818  3B A0 00 00 */	li r29, 0
.L_8019981C:
/* 8019981C 0019681C  7F A3 EB 78 */	mr r3, r29
/* 80199820 00196820  48 00 31 19 */	bl BattleAudience_GetWaiting
/* 80199824 00196824  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80199828 00196828  28 00 00 01 */	cmplwi r0, 1
/* 8019982C 0019682C  40 82 00 08 */	bne .L_80199834
/* 80199830 00196830  3B DE 00 01 */	addi r30, r30, 1
.L_80199834:
/* 80199834 00196834  3B BD 00 01 */	addi r29, r29, 1
/* 80199838 00196838  2C 1D 00 C8 */	cmpwi r29, 0xc8
/* 8019983C 0019683C  41 80 FF E0 */	blt .L_8019981C
/* 80199840 00196840  2C 1E 00 01 */	cmpwi r30, 1
/* 80199844 00196844  41 80 00 24 */	blt .L_80199868
/* 80199848 00196848  38 60 00 B4 */	li r3, 0xb4
/* 8019984C 0019684C  38 80 00 78 */	li r4, 0x78
/* 80199850 00196850  48 00 15 31 */	bl BattleAudienceSoundCheer
/* 80199854 00196854  38 60 00 B4 */	li r3, 0xb4
/* 80199858 00196858  38 80 00 78 */	li r4, 0x78
/* 8019985C 0019685C  48 00 17 25 */	bl BattleAudienceSoundClap
/* 80199860 00196860  38 60 00 01 */	li r3, 1
/* 80199864 00196864  48 00 1D 2D */	bl BattleAudienceJoy
.L_80199868:
/* 80199868 00196868  3C 9F 00 01 */	addis r4, r31, 1
/* 8019986C 0019686C  80 64 37 D4 */	lwz r3, 0x37d4(r4)
/* 80199870 00196870  38 03 00 01 */	addi r0, r3, 1
/* 80199874 00196874  90 04 37 D4 */	stw r0, 0x37d4(r4)
/* 80199878 00196878  80 04 37 D4 */	lwz r0, 0x37d4(r4)
/* 8019987C 0019687C  2C 00 00 05 */	cmpwi r0, 5
/* 80199880 00196880  40 81 00 0C */	ble .L_8019988C
/* 80199884 00196884  38 00 00 05 */	li r0, 5
/* 80199888 00196888  90 04 37 D4 */	stw r0, 0x37d4(r4)
.L_8019988C:
/* 8019988C 0019688C  80 1F 00 00 */	lwz r0, 0(r31)
/* 80199890 00196890  60 00 01 00 */	ori r0, r0, 0x100
/* 80199894 00196894  90 1F 00 00 */	stw r0, 0(r31)
/* 80199898 00196898  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019989C 0019689C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801998A0 001968A0  7C 08 03 A6 */	mtlr r0
/* 801998A4 001968A4  38 21 00 20 */	addi r1, r1, 0x20
/* 801998A8 001968A8  4E 80 00 20 */	blr 

.global BattleAudience_Case_GuardBad
BattleAudience_Case_GuardBad:
/* 801998AC 001968AC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801998B0 001968B0  7C 08 02 A6 */	mflr r0
/* 801998B4 001968B4  90 01 00 14 */	stw r0, 0x14(r1)
/* 801998B8 001968B8  48 00 8E 1D */	bl BattleAudienceBaseGetPtr
/* 801998BC 001968BC  80 03 00 00 */	lwz r0, 0(r3)
/* 801998C0 001968C0  60 00 00 80 */	ori r0, r0, 0x80
/* 801998C4 001968C4  90 03 00 00 */	stw r0, 0(r3)
/* 801998C8 001968C8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801998CC 001968CC  7C 08 03 A6 */	mtlr r0
/* 801998D0 001968D0  38 21 00 10 */	addi r1, r1, 0x10
/* 801998D4 001968D4  4E 80 00 20 */	blr 

.global BattleAudience_Case_GuardGood
BattleAudience_Case_GuardGood:
/* 801998D8 001968D8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801998DC 001968DC  7C 08 02 A6 */	mflr r0
/* 801998E0 001968E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801998E4 001968E4  48 00 8D F1 */	bl BattleAudienceBaseGetPtr
/* 801998E8 001968E8  80 03 00 00 */	lwz r0, 0(r3)
/* 801998EC 001968EC  60 00 00 40 */	ori r0, r0, 0x40
/* 801998F0 001968F0  90 03 00 00 */	stw r0, 0(r3)
/* 801998F4 001968F4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801998F8 001968F8  7C 08 03 A6 */	mtlr r0
/* 801998FC 001968FC  38 21 00 10 */	addi r1, r1, 0x10
/* 80199900 00196900  4E 80 00 20 */	blr 

.global BattleAudience_Case_ActionCommandBad
BattleAudience_Case_ActionCommandBad:
/* 80199904 00196904  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199908 00196908  7C 08 02 A6 */	mflr r0
/* 8019990C 0019690C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199910 00196910  BF 81 00 10 */	stmw r28, 0x10(r1)
/* 80199914 00196914  7C 7C 1B 78 */	mr r28, r3
/* 80199918 00196918  48 00 8D BD */	bl BattleAudienceBaseGetPtr
/* 8019991C 0019691C  7C 7F 1B 78 */	mr r31, r3
/* 80199920 00196920  3B C0 00 00 */	li r30, 0
/* 80199924 00196924  3B A0 00 00 */	li r29, 0
.L_80199928:
/* 80199928 00196928  7F A3 EB 78 */	mr r3, r29
/* 8019992C 0019692C  48 00 30 0D */	bl BattleAudience_GetWaiting
/* 80199930 00196930  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 80199934 00196934  28 00 00 01 */	cmplwi r0, 1
/* 80199938 00196938  40 82 00 08 */	bne .L_80199940
/* 8019993C 0019693C  3B DE 00 01 */	addi r30, r30, 1
.L_80199940:
/* 80199940 00196940  3B BD 00 01 */	addi r29, r29, 1
/* 80199944 00196944  2C 1D 00 C8 */	cmpwi r29, 0xc8
/* 80199948 00196948  41 80 FF E0 */	blt .L_80199928
/* 8019994C 0019694C  2C 1E 00 00 */	cmpwi r30, 0
/* 80199950 00196950  41 82 00 2C */	beq .L_8019997C
/* 80199954 00196954  48 00 19 11 */	bl BattleAudienceSoundBooing
/* 80199958 00196958  38 60 00 00 */	li r3, 0
/* 8019995C 0019695C  48 00 1C 35 */	bl BattleAudienceJoy
/* 80199960 00196960  3C 60 80 18 */	lis r3, weaponGetPowerFromMarioHammerLv@ha
/* 80199964 00196964  80 9C 00 1C */	lwz r4, 0x1c(r28)
/* 80199968 00196968  38 03 3F 34 */	addi r0, r3, weaponGetPowerFromMarioHammerLv@l
/* 8019996C 0019696C  7C 04 00 40 */	cmplw r4, r0
/* 80199970 00196970  40 82 00 0C */	bne .L_8019997C
/* 80199974 00196974  38 60 00 07 */	li r3, 7
/* 80199978 00196978  48 00 1E 3D */	bl BattleAudienceAddPhaseEvtList
.L_8019997C:
/* 8019997C 0019697C  80 1F 00 00 */	lwz r0, 0(r31)
/* 80199980 00196980  60 00 00 20 */	ori r0, r0, 0x20
/* 80199984 00196984  90 1F 00 00 */	stw r0, 0(r31)
/* 80199988 00196988  BB 81 00 10 */	lmw r28, 0x10(r1)
/* 8019998C 0019698C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199990 00196990  7C 08 03 A6 */	mtlr r0
/* 80199994 00196994  38 21 00 20 */	addi r1, r1, 0x20
/* 80199998 00196998  4E 80 00 20 */	blr 

.global BattleAudience_Case_ActionCommandGood
BattleAudience_Case_ActionCommandGood:
/* 8019999C 0019699C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801999A0 001969A0  7C 08 02 A6 */	mflr r0
/* 801999A4 001969A4  90 01 00 24 */	stw r0, 0x24(r1)
/* 801999A8 001969A8  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 801999AC 001969AC  48 00 8D 29 */	bl BattleAudienceBaseGetPtr
/* 801999B0 001969B0  7C 7F 1B 78 */	mr r31, r3
/* 801999B4 001969B4  3B A0 00 00 */	li r29, 0
/* 801999B8 001969B8  3B C0 00 00 */	li r30, 0
.L_801999BC:
/* 801999BC 001969BC  7F C3 F3 78 */	mr r3, r30
/* 801999C0 001969C0  48 00 2F 79 */	bl BattleAudience_GetWaiting
/* 801999C4 001969C4  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801999C8 001969C8  28 00 00 01 */	cmplwi r0, 1
/* 801999CC 001969CC  40 82 00 08 */	bne .L_801999D4
/* 801999D0 001969D0  3B BD 00 01 */	addi r29, r29, 1
.L_801999D4:
/* 801999D4 001969D4  3B DE 00 01 */	addi r30, r30, 1
/* 801999D8 001969D8  2C 1E 00 C8 */	cmpwi r30, 0xc8
/* 801999DC 001969DC  41 80 FF E0 */	blt .L_801999BC
/* 801999E0 001969E0  2C 1D 00 00 */	cmpwi r29, 0
/* 801999E4 001969E4  41 82 00 18 */	beq .L_801999FC
/* 801999E8 001969E8  38 60 00 B4 */	li r3, 0xb4
/* 801999EC 001969EC  38 80 00 78 */	li r4, 0x78
/* 801999F0 001969F0  48 00 13 91 */	bl BattleAudienceSoundCheer
/* 801999F4 001969F4  38 60 00 00 */	li r3, 0
/* 801999F8 001969F8  48 00 1B 99 */	bl BattleAudienceJoy
.L_801999FC:
/* 801999FC 001969FC  80 1F 00 00 */	lwz r0, 0(r31)
/* 80199A00 00196A00  60 00 00 10 */	ori r0, r0, 0x10
/* 80199A04 00196A04  90 1F 00 00 */	stw r0, 0(r31)
/* 80199A08 00196A08  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80199A0C 00196A0C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199A10 00196A10  7C 08 03 A6 */	mtlr r0
/* 80199A14 00196A14  38 21 00 20 */	addi r1, r1, 0x20
/* 80199A18 00196A18  4E 80 00 20 */	blr 

.global BattleAudience_Case_KillEnemy
BattleAudience_Case_KillEnemy:
/* 80199A1C 00196A1C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199A20 00196A20  7C 08 02 A6 */	mflr r0
/* 80199A24 00196A24  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199A28 00196A28  48 00 8C AD */	bl BattleAudienceBaseGetPtr
/* 80199A2C 00196A2C  80 03 00 00 */	lwz r0, 0(r3)
/* 80199A30 00196A30  60 00 10 00 */	ori r0, r0, 0x1000
/* 80199A34 00196A34  90 03 00 00 */	stw r0, 0(r3)
/* 80199A38 00196A38  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199A3C 00196A3C  7C 08 03 A6 */	mtlr r0
/* 80199A40 00196A40  38 21 00 10 */	addi r1, r1, 0x10
/* 80199A44 00196A44  4E 80 00 20 */	blr 

.global BattleAudienceNoiseMain
BattleAudienceNoiseMain:
/* 80199A48 00196A48  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80199A4C 00196A4C  7C 08 02 A6 */	mflr r0
/* 80199A50 00196A50  90 01 00 34 */	stw r0, 0x34(r1)
/* 80199A54 00196A54  BF 81 00 20 */	stmw r28, 0x20(r1)
/* 80199A58 00196A58  83 8D 17 10 */	lwz r28, lbl_80418970@sda21(r13)
/* 80199A5C 00196A5C  48 00 8C 79 */	bl BattleAudienceBaseGetPtr
/* 80199A60 00196A60  7C 7D 1B 78 */	mr r29, r3
/* 80199A64 00196A64  38 60 00 02 */	li r3, 2
/* 80199A68 00196A68  48 00 8B 89 */	bl BattleAudienceSoundGetPtr
/* 80199A6C 00196A6C  7C 7E 1B 78 */	mr r30, r3
/* 80199A70 00196A70  48 00 29 69 */	bl BattleAudience_GetPPAudienceNum
/* 80199A74 00196A74  80 1D 00 00 */	lwz r0, 0(r29)
/* 80199A78 00196A78  7C 7F 1B 78 */	mr r31, r3
/* 80199A7C 00196A7C  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 80199A80 00196A80  40 82 00 20 */	bne .L_80199AA0
/* 80199A84 00196A84  80 1C 0E F4 */	lwz r0, 0xef4(r28)
/* 80199A88 00196A88  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 80199A8C 00196A8C  41 82 00 14 */	beq .L_80199AA0
/* 80199A90 00196A90  38 60 00 02 */	li r3, 2
/* 80199A94 00196A94  38 80 00 3C */	li r4, 0x3c
/* 80199A98 00196A98  38 A0 00 50 */	li r5, 0x50
/* 80199A9C 00196A9C  48 00 06 21 */	bl BattleAudienceSoundSetVol
.L_80199AA0:
/* 80199AA0 00196AA0  80 1D 00 00 */	lwz r0, 0(r29)
/* 80199AA4 00196AA4  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 80199AA8 00196AA8  41 82 00 20 */	beq .L_80199AC8
/* 80199AAC 00196AAC  80 1C 0E F4 */	lwz r0, 0xef4(r28)
/* 80199AB0 00196AB0  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 80199AB4 00196AB4  40 82 00 14 */	bne .L_80199AC8
/* 80199AB8 00196AB8  38 60 00 02 */	li r3, 2
/* 80199ABC 00196ABC  38 80 00 00 */	li r4, 0
/* 80199AC0 00196AC0  38 A0 00 50 */	li r5, 0x50
/* 80199AC4 00196AC4  48 00 05 F9 */	bl BattleAudienceSoundSetVol
.L_80199AC8:
/* 80199AC8 00196AC8  2C 1F 00 00 */	cmpwi r31, 0
/* 80199ACC 00196ACC  40 82 00 20 */	bne .L_80199AEC
/* 80199AD0 00196AD0  88 1E 00 08 */	lbz r0, 8(r30)
/* 80199AD4 00196AD4  28 00 00 00 */	cmplwi r0, 0
/* 80199AD8 00196AD8  41 82 00 14 */	beq .L_80199AEC
/* 80199ADC 00196ADC  80 7E 00 04 */	lwz r3, 4(r30)
/* 80199AE0 00196AE0  4B F3 B7 1D */	bl psndSFXOff
/* 80199AE4 00196AE4  38 00 00 00 */	li r0, 0
/* 80199AE8 00196AE8  98 1E 00 08 */	stb r0, 8(r30)
.L_80199AEC:
/* 80199AEC 00196AEC  2C 1F 00 01 */	cmpwi r31, 1
/* 80199AF0 00196AF0  41 80 00 24 */	blt .L_80199B14
/* 80199AF4 00196AF4  2C 1F 00 31 */	cmpwi r31, 0x31
/* 80199AF8 00196AF8  41 81 00 1C */	bgt .L_80199B14
/* 80199AFC 00196AFC  88 1E 00 08 */	lbz r0, 8(r30)
/* 80199B00 00196B00  28 00 00 01 */	cmplwi r0, 1
/* 80199B04 00196B04  41 82 00 10 */	beq .L_80199B14
/* 80199B08 00196B08  48 00 13 15 */	bl BattleAudienceSoundNoiseAlways
/* 80199B0C 00196B0C  38 00 00 01 */	li r0, 1
/* 80199B10 00196B10  98 1E 00 08 */	stb r0, 8(r30)
.L_80199B14:
/* 80199B14 00196B14  2C 1F 00 32 */	cmpwi r31, 0x32
/* 80199B18 00196B18  41 80 00 24 */	blt .L_80199B3C
/* 80199B1C 00196B1C  2C 1F 00 63 */	cmpwi r31, 0x63
/* 80199B20 00196B20  41 81 00 1C */	bgt .L_80199B3C
/* 80199B24 00196B24  88 1E 00 08 */	lbz r0, 8(r30)
/* 80199B28 00196B28  28 00 00 02 */	cmplwi r0, 2
/* 80199B2C 00196B2C  41 82 00 10 */	beq .L_80199B3C
/* 80199B30 00196B30  48 00 12 ED */	bl BattleAudienceSoundNoiseAlways
/* 80199B34 00196B34  38 00 00 02 */	li r0, 2
/* 80199B38 00196B38  98 1E 00 08 */	stb r0, 8(r30)
.L_80199B3C:
/* 80199B3C 00196B3C  2C 1F 00 64 */	cmpwi r31, 0x64
/* 80199B40 00196B40  41 80 00 24 */	blt .L_80199B64
/* 80199B44 00196B44  2C 1F 00 95 */	cmpwi r31, 0x95
/* 80199B48 00196B48  41 81 00 1C */	bgt .L_80199B64
/* 80199B4C 00196B4C  88 1E 00 08 */	lbz r0, 8(r30)
/* 80199B50 00196B50  28 00 00 03 */	cmplwi r0, 3
/* 80199B54 00196B54  41 82 00 10 */	beq .L_80199B64
/* 80199B58 00196B58  48 00 12 C5 */	bl BattleAudienceSoundNoiseAlways
/* 80199B5C 00196B5C  38 00 00 03 */	li r0, 3
/* 80199B60 00196B60  98 1E 00 08 */	stb r0, 8(r30)
.L_80199B64:
/* 80199B64 00196B64  2C 1F 00 96 */	cmpwi r31, 0x96
/* 80199B68 00196B68  41 80 00 24 */	blt .L_80199B8C
/* 80199B6C 00196B6C  2C 1F 00 C8 */	cmpwi r31, 0xc8
/* 80199B70 00196B70  41 81 00 1C */	bgt .L_80199B8C
/* 80199B74 00196B74  88 1E 00 08 */	lbz r0, 8(r30)
/* 80199B78 00196B78  28 00 00 04 */	cmplwi r0, 4
/* 80199B7C 00196B7C  41 82 00 10 */	beq .L_80199B8C
/* 80199B80 00196B80  48 00 12 9D */	bl BattleAudienceSoundNoiseAlways
/* 80199B84 00196B84  38 00 00 04 */	li r0, 4
/* 80199B88 00196B88  98 1E 00 08 */	stb r0, 8(r30)
.L_80199B8C:
/* 80199B8C 00196B8C  80 1D 00 00 */	lwz r0, 0(r29)
/* 80199B90 00196B90  54 00 04 A5 */	rlwinm. r0, r0, 0, 0x12, 0x12
/* 80199B94 00196B94  40 82 00 10 */	bne .L_80199BA4
/* 80199B98 00196B98  38 00 00 00 */	li r0, 0
/* 80199B9C 00196B9C  98 1E 00 1D */	stb r0, 0x1d(r30)
/* 80199BA0 00196BA0  48 00 00 5C */	b .L_80199BFC
.L_80199BA4:
/* 80199BA4 00196BA4  2C 1F 00 00 */	cmpwi r31, 0
/* 80199BA8 00196BA8  40 82 00 10 */	bne .L_80199BB8
/* 80199BAC 00196BAC  38 00 00 00 */	li r0, 0
/* 80199BB0 00196BB0  98 1E 00 1D */	stb r0, 0x1d(r30)
/* 80199BB4 00196BB4  48 00 00 48 */	b .L_80199BFC
.L_80199BB8:
/* 80199BB8 00196BB8  6F E3 80 00 */	xoris r3, r31, 0x8000
/* 80199BBC 00196BBC  3C 00 43 30 */	lis r0, 0x4330
/* 80199BC0 00196BC0  90 61 00 0C */	stw r3, 0xc(r1)
/* 80199BC4 00196BC4  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 80199BC8 00196BC8  C8 44 9A 00 */	lfd f2, lbl_802F9A00@l(r4)
/* 80199BCC 00196BCC  90 01 00 08 */	stw r0, 8(r1)
/* 80199BD0 00196BD0  C0 62 D2 C4 */	lfs f3, lbl_8041E644@sda21(r2)
/* 80199BD4 00196BD4  C8 21 00 08 */	lfd f1, 8(r1)
/* 80199BD8 00196BD8  C0 02 D2 C8 */	lfs f0, lbl_8041E648@sda21(r2)
/* 80199BDC 00196BDC  EC 21 10 28 */	fsubs f1, f1, f2
/* 80199BE0 00196BE0  EC 23 00 72 */	fmuls f1, f3, f1
/* 80199BE4 00196BE4  EC 01 00 24 */	fdivs f0, f1, f0
/* 80199BE8 00196BE8  EC 03 00 2A */	fadds f0, f3, f0
/* 80199BEC 00196BEC  FC 00 00 1E */	fctiwz f0, f0
/* 80199BF0 00196BF0  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80199BF4 00196BF4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199BF8 00196BF8  98 1E 00 1D */	stb r0, 0x1d(r30)
.L_80199BFC:
/* 80199BFC 00196BFC  BB 81 00 20 */	lmw r28, 0x20(r1)
/* 80199C00 00196C00  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80199C04 00196C04  7C 08 03 A6 */	mtlr r0
/* 80199C08 00196C08  38 21 00 30 */	addi r1, r1, 0x30
/* 80199C0C 00196C0C  4E 80 00 20 */	blr 

.global BattleAudienceSoundMain
BattleAudienceSoundMain:
/* 80199C10 00196C10  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80199C14 00196C14  7C 08 02 A6 */	mflr r0
/* 80199C18 00196C18  90 01 00 34 */	stw r0, 0x34(r1)
/* 80199C1C 00196C1C  BF C1 00 28 */	stmw r30, 0x28(r1)
/* 80199C20 00196C20  48 00 8A B5 */	bl BattleAudienceBaseGetPtr
/* 80199C24 00196C24  4B FF FE 25 */	bl BattleAudienceNoiseMain
/* 80199C28 00196C28  3B C0 00 00 */	li r30, 0
/* 80199C2C 00196C2C  38 60 00 00 */	li r3, 0
/* 80199C30 00196C30  48 00 89 C1 */	bl BattleAudienceSoundGetPtr
/* 80199C34 00196C34  7C 7F 1B 78 */	mr r31, r3
.L_80199C38:
/* 80199C38 00196C38  80 7F 00 04 */	lwz r3, 4(r31)
/* 80199C3C 00196C3C  4B F3 B5 69 */	bl psndSFXChk
/* 80199C40 00196C40  2C 03 FF FF */	cmpwi r3, -1
/* 80199C44 00196C44  40 82 00 14 */	bne .L_80199C58
/* 80199C48 00196C48  80 1F 00 00 */	lwz r0, 0(r31)
/* 80199C4C 00196C4C  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 80199C50 00196C50  90 1F 00 00 */	stw r0, 0(r31)
/* 80199C54 00196C54  48 00 01 80 */	b .L_80199DD4
.L_80199C58:
/* 80199C58 00196C58  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 80199C5C 00196C5C  2C 00 00 00 */	cmpwi r0, 0
/* 80199C60 00196C60  40 82 00 1C */	bne .L_80199C7C
/* 80199C64 00196C64  80 7F 00 04 */	lwz r3, 4(r31)
/* 80199C68 00196C68  4B F3 B5 95 */	bl psndSFXOff
/* 80199C6C 00196C6C  80 1F 00 00 */	lwz r0, 0(r31)
/* 80199C70 00196C70  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 80199C74 00196C74  90 1F 00 00 */	stw r0, 0(r31)
/* 80199C78 00196C78  48 00 01 5C */	b .L_80199DD4
.L_80199C7C:
/* 80199C7C 00196C7C  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 80199C80 00196C80  2C 00 00 00 */	cmpwi r0, 0
/* 80199C84 00196C84  40 81 00 9C */	ble .L_80199D20
/* 80199C88 00196C88  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80199C8C 00196C8C  3C C0 43 30 */	lis r6, 0x4330
/* 80199C90 00196C90  3C 80 80 30 */	lis r4, lbl_802F9A08@ha
/* 80199C94 00196C94  90 C1 00 08 */	stw r6, 8(r1)
/* 80199C98 00196C98  38 03 00 01 */	addi r0, r3, 1
/* 80199C9C 00196C9C  C8 44 9A 08 */	lfd f2, lbl_802F9A08@l(r4)
/* 80199CA0 00196CA0  90 1F 00 14 */	stw r0, 0x14(r31)
/* 80199CA4 00196CA4  38 60 00 00 */	li r3, 0
/* 80199CA8 00196CA8  88 9F 00 1F */	lbz r4, 0x1f(r31)
/* 80199CAC 00196CAC  88 1F 00 20 */	lbz r0, 0x20(r31)
/* 80199CB0 00196CB0  90 81 00 0C */	stw r4, 0xc(r1)
/* 80199CB4 00196CB4  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 80199CB8 00196CB8  C8 01 00 08 */	lfd f0, 8(r1)
/* 80199CBC 00196CBC  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199CC0 00196CC0  EC 20 10 28 */	fsubs f1, f0, f2
/* 80199CC4 00196CC4  80 BF 00 18 */	lwz r5, 0x18(r31)
/* 80199CC8 00196CC8  90 C1 00 10 */	stw r6, 0x10(r1)
/* 80199CCC 00196CCC  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80199CD0 00196CD0  EC 40 10 28 */	fsubs f2, f0, f2
/* 80199CD4 00196CD4  4B E6 CF 39 */	bl intplGetValue
/* 80199CD8 00196CD8  FC 00 08 1E */	fctiwz f0, f1
/* 80199CDC 00196CDC  38 00 00 64 */	li r0, 0x64
/* 80199CE0 00196CE0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80199CE4 00196CE4  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 80199CE8 00196CE8  98 7F 00 1E */	stb r3, 0x1e(r31)
/* 80199CEC 00196CEC  88 BF 00 1D */	lbz r5, 0x1d(r31)
/* 80199CF0 00196CF0  88 9F 00 1E */	lbz r4, 0x1e(r31)
/* 80199CF4 00196CF4  80 7F 00 04 */	lwz r3, 4(r31)
/* 80199CF8 00196CF8  7C 85 21 D6 */	mullw r4, r5, r4
/* 80199CFC 00196CFC  7C 04 03 D6 */	divw r0, r4, r0
/* 80199D00 00196D00  54 04 06 3E */	clrlwi r4, r0, 0x18
/* 80199D04 00196D04  4B F3 B6 D1 */	bl psndSFX_vol
/* 80199D08 00196D08  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 80199D0C 00196D0C  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 80199D10 00196D10  7C 03 00 00 */	cmpw r3, r0
/* 80199D14 00196D14  41 80 00 0C */	blt .L_80199D20
/* 80199D18 00196D18  38 00 00 00 */	li r0, 0
/* 80199D1C 00196D1C  90 1F 00 18 */	stw r0, 0x18(r31)
.L_80199D20:
/* 80199D20 00196D20  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80199D24 00196D24  2C 03 00 00 */	cmpwi r3, 0
/* 80199D28 00196D28  40 81 00 AC */	ble .L_80199DD4
/* 80199D2C 00196D2C  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 80199D30 00196D30  7C 03 00 00 */	cmpw r3, r0
/* 80199D34 00196D34  40 82 00 14 */	bne .L_80199D48
/* 80199D38 00196D38  88 7F 00 1E */	lbz r3, 0x1e(r31)
/* 80199D3C 00196D3C  38 00 00 00 */	li r0, 0
/* 80199D40 00196D40  98 7F 00 1F */	stb r3, 0x1f(r31)
/* 80199D44 00196D44  98 1F 00 20 */	stb r0, 0x20(r31)
.L_80199D48:
/* 80199D48 00196D48  80 FF 00 0C */	lwz r7, 0xc(r31)
/* 80199D4C 00196D4C  80 BF 00 10 */	lwz r5, 0x10(r31)
/* 80199D50 00196D50  7C 07 28 00 */	cmpw r7, r5
/* 80199D54 00196D54  41 81 00 74 */	bgt .L_80199DC8
/* 80199D58 00196D58  88 9F 00 1F */	lbz r4, 0x1f(r31)
/* 80199D5C 00196D5C  3C C0 43 30 */	lis r6, 0x4330
/* 80199D60 00196D60  88 1F 00 20 */	lbz r0, 0x20(r31)
/* 80199D64 00196D64  3C 60 80 30 */	lis r3, lbl_802F9A08@ha
/* 80199D68 00196D68  90 81 00 1C */	stw r4, 0x1c(r1)
/* 80199D6C 00196D6C  7C 87 28 50 */	subf r4, r7, r5
/* 80199D70 00196D70  C8 43 9A 08 */	lfd f2, lbl_802F9A08@l(r3)
/* 80199D74 00196D74  38 60 00 00 */	li r3, 0
/* 80199D78 00196D78  90 C1 00 18 */	stw r6, 0x18(r1)
/* 80199D7C 00196D7C  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 80199D80 00196D80  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199D84 00196D84  EC 20 10 28 */	fsubs f1, f0, f2
/* 80199D88 00196D88  90 C1 00 10 */	stw r6, 0x10(r1)
/* 80199D8C 00196D8C  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80199D90 00196D90  EC 40 10 28 */	fsubs f2, f0, f2
/* 80199D94 00196D94  4B E6 CE 79 */	bl intplGetValue
/* 80199D98 00196D98  FC 00 08 1E */	fctiwz f0, f1
/* 80199D9C 00196D9C  38 00 00 64 */	li r0, 0x64
/* 80199DA0 00196DA0  D8 01 00 08 */	stfd f0, 8(r1)
/* 80199DA4 00196DA4  80 61 00 0C */	lwz r3, 0xc(r1)
/* 80199DA8 00196DA8  98 7F 00 1E */	stb r3, 0x1e(r31)
/* 80199DAC 00196DAC  88 BF 00 1D */	lbz r5, 0x1d(r31)
/* 80199DB0 00196DB0  88 9F 00 1E */	lbz r4, 0x1e(r31)
/* 80199DB4 00196DB4  80 7F 00 04 */	lwz r3, 4(r31)
/* 80199DB8 00196DB8  7C 85 21 D6 */	mullw r4, r5, r4
/* 80199DBC 00196DBC  7C 04 03 D6 */	divw r0, r4, r0
/* 80199DC0 00196DC0  54 04 06 3E */	clrlwi r4, r0, 0x18
/* 80199DC4 00196DC4  4B F3 B6 11 */	bl psndSFX_vol
.L_80199DC8:
/* 80199DC8 00196DC8  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 80199DCC 00196DCC  38 03 FF FF */	addi r0, r3, -1
/* 80199DD0 00196DD0  90 1F 00 0C */	stw r0, 0xc(r31)
.L_80199DD4:
/* 80199DD4 00196DD4  3B DE 00 01 */	addi r30, r30, 1
/* 80199DD8 00196DD8  3B FF 00 24 */	addi r31, r31, 0x24
/* 80199DDC 00196DDC  2C 1E 00 18 */	cmpwi r30, 0x18
/* 80199DE0 00196DE0  41 80 FE 58 */	blt .L_80199C38
/* 80199DE4 00196DE4  BB C1 00 28 */	lmw r30, 0x28(r1)
/* 80199DE8 00196DE8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80199DEC 00196DEC  7C 08 03 A6 */	mtlr r0
/* 80199DF0 00196DF0  38 21 00 30 */	addi r1, r1, 0x30
/* 80199DF4 00196DF4  4E 80 00 20 */	blr 

.global BattleAudienceSoundGetInfo2
BattleAudienceSoundGetInfo2:
/* 80199DF8 00196DF8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199DFC 00196DFC  7C 08 02 A6 */	mflr r0
/* 80199E00 00196E00  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199E04 00196E04  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80199E08 00196E08  7C 9F 23 78 */	mr r31, r4
/* 80199E0C 00196E0C  48 00 88 8D */	bl BattleAudienceGetPtr
/* 80199E10 00196E10  C0 03 00 48 */	lfs f0, 0x48(r3)
/* 80199E14 00196E14  D0 1F 00 00 */	stfs f0, 0(r31)
/* 80199E18 00196E18  C0 03 00 4C */	lfs f0, 0x4c(r3)
/* 80199E1C 00196E1C  D0 1F 00 04 */	stfs f0, 4(r31)
/* 80199E20 00196E20  C0 03 00 50 */	lfs f0, 0x50(r3)
/* 80199E24 00196E24  D0 1F 00 08 */	stfs f0, 8(r31)
/* 80199E28 00196E28  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80199E2C 00196E2C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199E30 00196E30  7C 08 03 A6 */	mtlr r0
/* 80199E34 00196E34  38 21 00 10 */	addi r1, r1, 0x10
/* 80199E38 00196E38  4E 80 00 20 */	blr 

.global BattleAudienceSound2
BattleAudienceSound2:
/* 80199E3C 00196E3C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199E40 00196E40  7C 08 02 A6 */	mflr r0
/* 80199E44 00196E44  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199E48 00196E48  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80199E4C 00196E4C  7C 7F 1B 78 */	mr r31, r3
/* 80199E50 00196E50  7C 83 23 78 */	mr r3, r4
/* 80199E54 00196E54  38 81 00 08 */	addi r4, r1, 8
/* 80199E58 00196E58  4B FF FF A1 */	bl BattleAudienceSoundGetInfo2
/* 80199E5C 00196E5C  7F E3 FB 78 */	mr r3, r31
/* 80199E60 00196E60  38 81 00 08 */	addi r4, r1, 8
/* 80199E64 00196E64  4B F3 B5 E9 */	bl psndSFXOn_3D
/* 80199E68 00196E68  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199E6C 00196E6C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80199E70 00196E70  7C 08 03 A6 */	mtlr r0
/* 80199E74 00196E74  38 21 00 20 */	addi r1, r1, 0x20
/* 80199E78 00196E78  4E 80 00 20 */	blr 

.global BattleAudienceSoundGetInfo1
BattleAudienceSoundGetInfo1:
/* 80199E7C 00196E7C  7D 23 22 15 */	add. r9, r3, r4
/* 80199E80 00196E80  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80199E84 00196E84  40 82 00 10 */	bne .L_80199E94
/* 80199E88 00196E88  38 00 00 00 */	li r0, 0
/* 80199E8C 00196E8C  98 05 00 00 */	stb r0, 0(r5)
/* 80199E90 00196E90  48 00 00 4C */	b .L_80199EDC
.L_80199E94:
/* 80199E94 00196E94  6D 27 80 00 */	xoris r7, r9, 0x8000
/* 80199E98 00196E98  3C 00 43 30 */	lis r0, 0x4330
/* 80199E9C 00196E9C  90 E1 00 0C */	stw r7, 0xc(r1)
/* 80199EA0 00196EA0  3D 00 80 30 */	lis r8, lbl_802F9A00@ha
/* 80199EA4 00196EA4  C8 48 9A 00 */	lfd f2, lbl_802F9A00@l(r8)
/* 80199EA8 00196EA8  90 01 00 08 */	stw r0, 8(r1)
/* 80199EAC 00196EAC  C0 62 D2 D0 */	lfs f3, lbl_8041E650@sda21(r2)
/* 80199EB0 00196EB0  C8 21 00 08 */	lfd f1, 8(r1)
/* 80199EB4 00196EB4  C0 02 D2 C8 */	lfs f0, lbl_8041E648@sda21(r2)
/* 80199EB8 00196EB8  EC 21 10 28 */	fsubs f1, f1, f2
/* 80199EBC 00196EBC  C0 42 D2 CC */	lfs f2, lbl_8041E64C@sda21(r2)
/* 80199EC0 00196EC0  EC 23 00 72 */	fmuls f1, f3, f1
/* 80199EC4 00196EC4  EC 01 00 24 */	fdivs f0, f1, f0
/* 80199EC8 00196EC8  EC 02 00 2A */	fadds f0, f2, f0
/* 80199ECC 00196ECC  FC 00 00 1E */	fctiwz f0, f0
/* 80199ED0 00196ED0  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 80199ED4 00196ED4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199ED8 00196ED8  98 05 00 00 */	stb r0, 0(r5)
.L_80199EDC:
/* 80199EDC 00196EDC  2C 04 00 00 */	cmpwi r4, 0
/* 80199EE0 00196EE0  41 82 00 0C */	beq .L_80199EEC
/* 80199EE4 00196EE4  2C 09 00 00 */	cmpwi r9, 0
/* 80199EE8 00196EE8  40 82 00 10 */	bne .L_80199EF8
.L_80199EEC:
/* 80199EEC 00196EEC  C0 02 D2 D4 */	lfs f0, lbl_8041E654@sda21(r2)
/* 80199EF0 00196EF0  D0 06 00 00 */	stfs f0, 0(r6)
/* 80199EF4 00196EF4  48 00 00 78 */	b .L_80199F6C
.L_80199EF8:
/* 80199EF8 00196EF8  7C 04 18 50 */	subf r0, r4, r3
/* 80199EFC 00196EFC  3C 80 43 30 */	lis r4, 0x4330
/* 80199F00 00196F00  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80199F04 00196F04  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 80199F08 00196F08  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199F0C 00196F0C  38 A3 9A 00 */	addi r5, r3, lbl_802F9A00@l
/* 80199F10 00196F10  6D 20 80 00 */	xoris r0, r9, 0x8000
/* 80199F14 00196F14  3C 60 80 30 */	lis r3, lbl_802F9A08@ha
/* 80199F18 00196F18  90 81 00 10 */	stw r4, 0x10(r1)
/* 80199F1C 00196F1C  C8 65 00 00 */	lfd f3, 0(r5)
/* 80199F20 00196F20  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 80199F24 00196F24  90 01 00 0C */	stw r0, 0xc(r1)
/* 80199F28 00196F28  EC 40 18 28 */	fsubs f2, f0, f3
/* 80199F2C 00196F2C  C0 82 D2 D4 */	lfs f4, lbl_8041E654@sda21(r2)
/* 80199F30 00196F30  90 81 00 08 */	stw r4, 8(r1)
/* 80199F34 00196F34  C8 23 9A 08 */	lfd f1, lbl_802F9A08@l(r3)
/* 80199F38 00196F38  C8 01 00 08 */	lfd f0, 8(r1)
/* 80199F3C 00196F3C  EC 44 00 B2 */	fmuls f2, f4, f2
/* 80199F40 00196F40  90 81 00 20 */	stw r4, 0x20(r1)
/* 80199F44 00196F44  EC 00 18 28 */	fsubs f0, f0, f3
/* 80199F48 00196F48  EC 02 00 24 */	fdivs f0, f2, f0
/* 80199F4C 00196F4C  FC 00 00 1E */	fctiwz f0, f0
/* 80199F50 00196F50  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 80199F54 00196F54  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80199F58 00196F58  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 80199F5C 00196F5C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199F60 00196F60  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 80199F64 00196F64  EC 00 08 28 */	fsubs f0, f0, f1
/* 80199F68 00196F68  D0 06 00 00 */	stfs f0, 0(r6)
.L_80199F6C:
/* 80199F6C 00196F6C  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 80199F70 00196F70  D0 06 00 04 */	stfs f0, 4(r6)
/* 80199F74 00196F74  D0 06 00 08 */	stfs f0, 8(r6)
/* 80199F78 00196F78  38 21 00 30 */	addi r1, r1, 0x30
/* 80199F7C 00196F7C  4E 80 00 20 */	blr 

.global BattleAudienceSound1
BattleAudienceSound1:
/* 80199F80 00196F80  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80199F84 00196F84  7C 08 02 A6 */	mflr r0
/* 80199F88 00196F88  90 01 00 24 */	stw r0, 0x24(r1)
/* 80199F8C 00196F8C  7C A0 2B 78 */	mr r0, r5
/* 80199F90 00196F90  38 A1 00 08 */	addi r5, r1, 8
/* 80199F94 00196F94  38 C1 00 0C */	addi r6, r1, 0xc
/* 80199F98 00196F98  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80199F9C 00196F9C  7C 7F 1B 78 */	mr r31, r3
/* 80199FA0 00196FA0  7C 83 23 78 */	mr r3, r4
/* 80199FA4 00196FA4  7C 04 03 78 */	mr r4, r0
/* 80199FA8 00196FA8  4B FF FE D5 */	bl BattleAudienceSoundGetInfo1
/* 80199FAC 00196FAC  7F E3 FB 78 */	mr r3, r31
/* 80199FB0 00196FB0  38 81 00 0C */	addi r4, r1, 0xc
/* 80199FB4 00196FB4  4B F3 B4 99 */	bl psndSFXOn_3D
/* 80199FB8 00196FB8  88 81 00 08 */	lbz r4, 8(r1)
/* 80199FBC 00196FBC  7C 7F 1B 78 */	mr r31, r3
/* 80199FC0 00196FC0  4B F3 B4 15 */	bl psndSFX_vol
/* 80199FC4 00196FC4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80199FC8 00196FC8  7F E3 FB 78 */	mr r3, r31
/* 80199FCC 00196FCC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80199FD0 00196FD0  7C 08 03 A6 */	mtlr r0
/* 80199FD4 00196FD4  38 21 00 20 */	addi r1, r1, 0x20
/* 80199FD8 00196FD8  4E 80 00 20 */	blr 

.global func_80199FDC
func_80199FDC:

.global BattleAudienceSound0
BattleAudienceSound0:
/* 80199FDC 00196FDC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80199FE0 00196FE0  7C 08 02 A6 */	mflr r0
/* 80199FE4 00196FE4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80199FE8 00196FE8  4B F3 B4 D9 */	bl psndSFXOn
/* 80199FEC 00196FEC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80199FF0 00196FF0  7C 08 03 A6 */	mtlr r0
/* 80199FF4 00196FF4  38 21 00 10 */	addi r1, r1, 0x10
/* 80199FF8 00196FF8  4E 80 00 20 */	blr 

.global BattleAudienceSoundStop
BattleAudienceSoundStop:
/* 80199FFC 00196FFC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A000 00197000  7C 08 02 A6 */	mflr r0
/* 8019A004 00197004  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A008 00197008  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019A00C 0019700C  48 00 85 E5 */	bl BattleAudienceSoundGetPtr
/* 8019A010 00197010  80 03 00 00 */	lwz r0, 0(r3)
/* 8019A014 00197014  7C 7F 1B 78 */	mr r31, r3
/* 8019A018 00197018  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019A01C 0019701C  41 82 00 18 */	beq .L_8019A034
/* 8019A020 00197020  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A024 00197024  4B F3 B1 D9 */	bl psndSFXOff
/* 8019A028 00197028  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019A02C 0019702C  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 8019A030 00197030  90 1F 00 00 */	stw r0, 0(r31)
.L_8019A034:
/* 8019A034 00197034  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A038 00197038  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019A03C 0019703C  7C 08 03 A6 */	mtlr r0
/* 8019A040 00197040  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A044 00197044  4E 80 00 20 */	blr 

.global BattleAudienceSoundCheck
BattleAudienceSoundCheck:
/* 8019A048 00197048  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A04C 0019704C  7C 08 02 A6 */	mflr r0
/* 8019A050 00197050  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A054 00197054  48 00 85 9D */	bl BattleAudienceSoundGetPtr
/* 8019A058 00197058  80 03 00 00 */	lwz r0, 0(r3)
/* 8019A05C 0019705C  54 03 07 FE */	clrlwi r3, r0, 0x1f
/* 8019A060 00197060  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A064 00197064  7C 08 03 A6 */	mtlr r0
/* 8019A068 00197068  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A06C 0019706C  4E 80 00 20 */	blr 

.global BattleAudienceSoundSetVolAll
BattleAudienceSoundSetVolAll:
/* 8019A070 00197070  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019A074 00197074  7C 08 02 A6 */	mflr r0
/* 8019A078 00197078  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019A07C 0019707C  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019A080 00197080  7C 7D 1B 78 */	mr r29, r3
/* 8019A084 00197084  7C 9E 23 78 */	mr r30, r4
/* 8019A088 00197088  3B E0 00 00 */	li r31, 0
.L_8019A08C:
/* 8019A08C 0019708C  7F E3 FB 78 */	mr r3, r31
/* 8019A090 00197090  7F A4 EB 78 */	mr r4, r29
/* 8019A094 00197094  7F C5 F3 78 */	mr r5, r30
/* 8019A098 00197098  48 00 00 25 */	bl BattleAudienceSoundSetVol
/* 8019A09C 0019709C  3B FF 00 01 */	addi r31, r31, 1
/* 8019A0A0 001970A0  2C 1F 00 18 */	cmpwi r31, 0x18
/* 8019A0A4 001970A4  41 80 FF E8 */	blt .L_8019A08C
/* 8019A0A8 001970A8  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019A0AC 001970AC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019A0B0 001970B0  7C 08 03 A6 */	mtlr r0
/* 8019A0B4 001970B4  38 21 00 20 */	addi r1, r1, 0x20
/* 8019A0B8 001970B8  4E 80 00 20 */	blr 

.global BattleAudienceSoundSetVol
BattleAudienceSoundSetVol:
/* 8019A0BC 001970BC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A0C0 001970C0  7C 08 02 A6 */	mflr r0
/* 8019A0C4 001970C4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A0C8 001970C8  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019A0CC 001970CC  7C 9E 23 78 */	mr r30, r4
/* 8019A0D0 001970D0  7C BF 2B 78 */	mr r31, r5
/* 8019A0D4 001970D4  48 00 85 1D */	bl BattleAudienceSoundGetPtr
/* 8019A0D8 001970D8  88 83 00 1E */	lbz r4, 0x1e(r3)
/* 8019A0DC 001970DC  38 00 00 00 */	li r0, 0
/* 8019A0E0 001970E0  98 83 00 1F */	stb r4, 0x1f(r3)
/* 8019A0E4 001970E4  9B C3 00 20 */	stb r30, 0x20(r3)
/* 8019A0E8 001970E8  90 03 00 14 */	stw r0, 0x14(r3)
/* 8019A0EC 001970EC  93 E3 00 18 */	stw r31, 0x18(r3)
/* 8019A0F0 001970F0  90 03 00 10 */	stw r0, 0x10(r3)
/* 8019A0F4 001970F4  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019A0F8 001970F8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A0FC 001970FC  7C 08 03 A6 */	mtlr r0
/* 8019A100 00197100  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A104 00197104  4E 80 00 20 */	blr 

.global BattleAudienceSoundPakkunEat
BattleAudienceSoundPakkunEat:
/* 8019A108 00197108  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A10C 0019710C  7C 08 02 A6 */	mflr r0
/* 8019A110 00197110  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A114 00197114  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019A118 00197118  7C 7E 1B 78 */	mr r30, r3
/* 8019A11C 0019711C  38 60 00 17 */	li r3, 0x17
/* 8019A120 00197120  48 00 84 D1 */	bl BattleAudienceSoundGetPtr
/* 8019A124 00197124  7C 7F 1B 78 */	mr r31, r3
/* 8019A128 00197128  38 60 00 17 */	li r3, 0x17
/* 8019A12C 0019712C  4B FF FE D1 */	bl BattleAudienceSoundStop
/* 8019A130 00197130  3C 60 80 30 */	lis r3, lbl_802F9A10@ha
/* 8019A134 00197134  7F C4 F3 78 */	mr r4, r30
/* 8019A138 00197138  38 63 9A 10 */	addi r3, r3, lbl_802F9A10@l
/* 8019A13C 0019713C  4B FF FD 01 */	bl BattleAudienceSound2
/* 8019A140 00197140  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A144 00197144  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A148 00197148  2C 00 FF FF */	cmpwi r0, -1
/* 8019A14C 0019714C  41 82 00 44 */	beq .L_8019A190
/* 8019A150 00197150  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A154 00197154  38 60 FF FF */	li r3, -1
/* 8019A158 00197158  38 00 00 00 */	li r0, 0
/* 8019A15C 0019715C  60 84 00 01 */	ori r4, r4, 1
/* 8019A160 00197160  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A164 00197164  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A168 00197168  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A16C 0019716C  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A170 00197170  4B F3 AF ED */	bl psndSFX_get_vol
/* 8019A174 00197174  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A178 00197178  38 80 00 00 */	li r4, 0
/* 8019A17C 0019717C  38 00 00 64 */	li r0, 0x64
/* 8019A180 00197180  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A184 00197184  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A188 00197188  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A18C 0019718C  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A190:
/* 8019A190 00197190  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019A194 00197194  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A198 00197198  7C 08 03 A6 */	mtlr r0
/* 8019A19C 0019719C  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A1A0 001971A0  4E 80 00 20 */	blr 

.global BattleAudienceSoundBombFire
BattleAudienceSoundBombFire:
/* 8019A1A4 001971A4  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019A1A8 001971A8  7C 08 02 A6 */	mflr r0
/* 8019A1AC 001971AC  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019A1B0 001971B0  38 81 00 08 */	addi r4, r1, 8
/* 8019A1B4 001971B4  BF A1 00 24 */	stmw r29, 0x24(r1)
/* 8019A1B8 001971B8  7C 7D 1B 78 */	mr r29, r3
/* 8019A1BC 001971BC  4B FF FC 3D */	bl BattleAudienceSoundGetInfo2
/* 8019A1C0 001971C0  C0 21 00 08 */	lfs f1, 8(r1)
/* 8019A1C4 001971C4  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019A1C8 001971C8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019A1CC 001971CC  4C 40 13 82 */	cror 2, 0, 2
/* 8019A1D0 001971D0  40 82 00 0C */	bne .L_8019A1DC
/* 8019A1D4 001971D4  3B C0 00 15 */	li r30, 0x15
/* 8019A1D8 001971D8  48 00 00 08 */	b .L_8019A1E0
.L_8019A1DC:
/* 8019A1DC 001971DC  3B C0 00 16 */	li r30, 0x16
.L_8019A1E0:
/* 8019A1E0 001971E0  7F C3 F3 78 */	mr r3, r30
/* 8019A1E4 001971E4  48 00 84 0D */	bl BattleAudienceSoundGetPtr
/* 8019A1E8 001971E8  7C 7F 1B 78 */	mr r31, r3
/* 8019A1EC 001971EC  7F C3 F3 78 */	mr r3, r30
/* 8019A1F0 001971F0  4B FF FE 0D */	bl BattleAudienceSoundStop
/* 8019A1F4 001971F4  3C 60 80 30 */	lis r3, lbl_802F9A28@ha
/* 8019A1F8 001971F8  7F A4 EB 78 */	mr r4, r29
/* 8019A1FC 001971FC  38 63 9A 28 */	addi r3, r3, lbl_802F9A28@l
/* 8019A200 00197200  4B FF FC 3D */	bl BattleAudienceSound2
/* 8019A204 00197204  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A208 00197208  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A20C 0019720C  2C 00 FF FF */	cmpwi r0, -1
/* 8019A210 00197210  41 82 00 44 */	beq .L_8019A254
/* 8019A214 00197214  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A218 00197218  38 60 FF FF */	li r3, -1
/* 8019A21C 0019721C  38 00 00 00 */	li r0, 0
/* 8019A220 00197220  60 84 00 01 */	ori r4, r4, 1
/* 8019A224 00197224  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A228 00197228  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A22C 0019722C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A230 00197230  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A234 00197234  4B F3 AF 29 */	bl psndSFX_get_vol
/* 8019A238 00197238  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A23C 0019723C  38 80 00 00 */	li r4, 0
/* 8019A240 00197240  38 00 00 64 */	li r0, 0x64
/* 8019A244 00197244  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A248 00197248  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A24C 0019724C  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A250 00197250  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A254:
/* 8019A254 00197254  BB A1 00 24 */	lmw r29, 0x24(r1)
/* 8019A258 00197258  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019A25C 0019725C  7C 08 03 A6 */	mtlr r0
/* 8019A260 00197260  38 21 00 30 */	addi r1, r1, 0x30
/* 8019A264 00197264  4E 80 00 20 */	blr 

.global BattleAudienceSoundBombIgnite
BattleAudienceSoundBombIgnite:
/* 8019A268 00197268  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019A26C 0019726C  7C 08 02 A6 */	mflr r0
/* 8019A270 00197270  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019A274 00197274  BF 81 00 10 */	stmw r28, 0x10(r1)
/* 8019A278 00197278  7C 7C 1B 78 */	mr r28, r3
/* 8019A27C 0019727C  7C 9D 23 78 */	mr r29, r4
/* 8019A280 00197280  7C BE 2B 78 */	mr r30, r5
/* 8019A284 00197284  38 60 00 14 */	li r3, 0x14
/* 8019A288 00197288  48 00 83 69 */	bl BattleAudienceSoundGetPtr
/* 8019A28C 0019728C  7C 7F 1B 78 */	mr r31, r3
/* 8019A290 00197290  38 60 00 14 */	li r3, 0x14
/* 8019A294 00197294  4B FF FD 69 */	bl BattleAudienceSoundStop
/* 8019A298 00197298  3C 60 80 30 */	lis r3, lbl_802F9A44@ha
/* 8019A29C 0019729C  7F 84 E3 78 */	mr r4, r28
/* 8019A2A0 001972A0  38 63 9A 44 */	addi r3, r3, lbl_802F9A44@l
/* 8019A2A4 001972A4  4B FF FB 99 */	bl BattleAudienceSound2
/* 8019A2A8 001972A8  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A2AC 001972AC  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A2B0 001972B0  2C 00 FF FF */	cmpwi r0, -1
/* 8019A2B4 001972B4  41 82 00 40 */	beq .L_8019A2F4
/* 8019A2B8 001972B8  80 7F 00 00 */	lwz r3, 0(r31)
/* 8019A2BC 001972BC  7C 1D F2 14 */	add r0, r29, r30
/* 8019A2C0 001972C0  60 63 00 01 */	ori r3, r3, 1
/* 8019A2C4 001972C4  90 7F 00 00 */	stw r3, 0(r31)
/* 8019A2C8 001972C8  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8019A2CC 001972CC  93 DF 00 10 */	stw r30, 0x10(r31)
/* 8019A2D0 001972D0  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A2D4 001972D4  4B F3 AE 89 */	bl psndSFX_get_vol
/* 8019A2D8 001972D8  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A2DC 001972DC  38 80 00 00 */	li r4, 0
/* 8019A2E0 001972E0  38 00 00 64 */	li r0, 0x64
/* 8019A2E4 001972E4  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A2E8 001972E8  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A2EC 001972EC  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A2F0 001972F0  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A2F4:
/* 8019A2F4 001972F4  BB 81 00 10 */	lmw r28, 0x10(r1)
/* 8019A2F8 001972F8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019A2FC 001972FC  7C 08 03 A6 */	mtlr r0
/* 8019A300 00197300  38 21 00 20 */	addi r1, r1, 0x20
/* 8019A304 00197304  4E 80 00 20 */	blr 

.global BattleAudienceSoundShell
BattleAudienceSoundShell:
/* 8019A308 00197308  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019A30C 0019730C  7C 08 02 A6 */	mflr r0
/* 8019A310 00197310  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019A314 00197314  38 81 00 08 */	addi r4, r1, 8
/* 8019A318 00197318  BF A1 00 24 */	stmw r29, 0x24(r1)
/* 8019A31C 0019731C  7C 7D 1B 78 */	mr r29, r3
/* 8019A320 00197320  4B FF FA D9 */	bl BattleAudienceSoundGetInfo2
/* 8019A324 00197324  C0 21 00 08 */	lfs f1, 8(r1)
/* 8019A328 00197328  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019A32C 0019732C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019A330 00197330  4C 40 13 82 */	cror 2, 0, 2
/* 8019A334 00197334  40 82 00 0C */	bne .L_8019A340
/* 8019A338 00197338  3B C0 00 12 */	li r30, 0x12
/* 8019A33C 0019733C  48 00 00 08 */	b .L_8019A344
.L_8019A340:
/* 8019A340 00197340  3B C0 00 13 */	li r30, 0x13
.L_8019A344:
/* 8019A344 00197344  7F C3 F3 78 */	mr r3, r30
/* 8019A348 00197348  48 00 82 A9 */	bl BattleAudienceSoundGetPtr
/* 8019A34C 0019734C  7C 7F 1B 78 */	mr r31, r3
/* 8019A350 00197350  7F C3 F3 78 */	mr r3, r30
/* 8019A354 00197354  4B FF FC A9 */	bl BattleAudienceSoundStop
/* 8019A358 00197358  3C 60 80 30 */	lis r3, lbl_802F9A60@ha
/* 8019A35C 0019735C  7F A4 EB 78 */	mr r4, r29
/* 8019A360 00197360  38 63 9A 60 */	addi r3, r3, lbl_802F9A60@l
/* 8019A364 00197364  4B FF FA D9 */	bl BattleAudienceSound2
/* 8019A368 00197368  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A36C 0019736C  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A370 00197370  2C 00 FF FF */	cmpwi r0, -1
/* 8019A374 00197374  41 82 00 44 */	beq .L_8019A3B8
/* 8019A378 00197378  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A37C 0019737C  38 60 FF FF */	li r3, -1
/* 8019A380 00197380  38 00 00 00 */	li r0, 0
/* 8019A384 00197384  60 84 00 01 */	ori r4, r4, 1
/* 8019A388 00197388  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A38C 0019738C  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A390 00197390  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A394 00197394  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A398 00197398  4B F3 AD C5 */	bl psndSFX_get_vol
/* 8019A39C 0019739C  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A3A0 001973A0  38 80 00 00 */	li r4, 0
/* 8019A3A4 001973A4  38 00 00 64 */	li r0, 0x64
/* 8019A3A8 001973A8  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A3AC 001973AC  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A3B0 001973B0  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A3B4 001973B4  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A3B8:
/* 8019A3B8 001973B8  BB A1 00 24 */	lmw r29, 0x24(r1)
/* 8019A3BC 001973BC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019A3C0 001973C0  7C 08 03 A6 */	mtlr r0
/* 8019A3C4 001973C4  38 21 00 30 */	addi r1, r1, 0x30
/* 8019A3C8 001973C8  4E 80 00 20 */	blr 

.global BattleAudienceSoundSing
BattleAudienceSoundSing:
/* 8019A3CC 001973CC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A3D0 001973D0  7C 08 02 A6 */	mflr r0
/* 8019A3D4 001973D4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A3D8 001973D8  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019A3DC 001973DC  7C 7E 1B 78 */	mr r30, r3
/* 8019A3E0 001973E0  38 60 00 11 */	li r3, 0x11
/* 8019A3E4 001973E4  48 00 82 0D */	bl BattleAudienceSoundGetPtr
/* 8019A3E8 001973E8  7C 7F 1B 78 */	mr r31, r3
/* 8019A3EC 001973EC  38 60 00 11 */	li r3, 0x11
/* 8019A3F0 001973F0  4B FF FC 0D */	bl BattleAudienceSoundStop
/* 8019A3F4 001973F4  3C 60 80 30 */	lis r3, lbl_802F9A80@ha
/* 8019A3F8 001973F8  7F C4 F3 78 */	mr r4, r30
/* 8019A3FC 001973FC  38 63 9A 80 */	addi r3, r3, lbl_802F9A80@l
/* 8019A400 00197400  4B FF FA 3D */	bl BattleAudienceSound2
/* 8019A404 00197404  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A408 00197408  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A40C 0019740C  2C 00 FF FF */	cmpwi r0, -1
/* 8019A410 00197410  41 82 00 44 */	beq .L_8019A454
/* 8019A414 00197414  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A418 00197418  38 60 FF FF */	li r3, -1
/* 8019A41C 0019741C  38 00 00 00 */	li r0, 0
/* 8019A420 00197420  60 84 00 01 */	ori r4, r4, 1
/* 8019A424 00197424  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A428 00197428  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A42C 0019742C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A430 00197430  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A434 00197434  4B F3 AD 29 */	bl psndSFX_get_vol
/* 8019A438 00197438  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A43C 0019743C  38 80 00 00 */	li r4, 0
/* 8019A440 00197440  38 00 00 64 */	li r0, 0x64
/* 8019A444 00197444  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A448 00197448  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A44C 0019744C  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A450 00197450  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A454:
/* 8019A454 00197454  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019A458 00197458  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A45C 0019745C  7C 08 03 A6 */	mtlr r0
/* 8019A460 00197460  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A464 00197464  4E 80 00 20 */	blr 

.global BattleAudienceSoundZZZ
BattleAudienceSoundZZZ:
/* 8019A468 00197468  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A46C 0019746C  7C 08 02 A6 */	mflr r0
/* 8019A470 00197470  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A474 00197474  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019A478 00197478  7C 7E 1B 78 */	mr r30, r3
/* 8019A47C 0019747C  38 60 00 10 */	li r3, 0x10
/* 8019A480 00197480  48 00 81 71 */	bl BattleAudienceSoundGetPtr
/* 8019A484 00197484  7C 7F 1B 78 */	mr r31, r3
/* 8019A488 00197488  38 60 00 10 */	li r3, 0x10
/* 8019A48C 0019748C  4B FF FB 71 */	bl BattleAudienceSoundStop
/* 8019A490 00197490  3C 60 80 30 */	lis r3, lbl_802F9A9C@ha
/* 8019A494 00197494  7F C4 F3 78 */	mr r4, r30
/* 8019A498 00197498  38 63 9A 9C */	addi r3, r3, lbl_802F9A9C@l
/* 8019A49C 0019749C  4B FF F9 A1 */	bl BattleAudienceSound2
/* 8019A4A0 001974A0  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A4A4 001974A4  2C 00 FF FF */	cmpwi r0, -1
/* 8019A4A8 001974A8  41 82 00 44 */	beq .L_8019A4EC
/* 8019A4AC 001974AC  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A4B0 001974B0  38 60 FF FF */	li r3, -1
/* 8019A4B4 001974B4  38 00 00 00 */	li r0, 0
/* 8019A4B8 001974B8  60 84 00 01 */	ori r4, r4, 1
/* 8019A4BC 001974BC  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A4C0 001974C0  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A4C4 001974C4  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A4C8 001974C8  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A4CC 001974CC  4B F3 AC 91 */	bl psndSFX_get_vol
/* 8019A4D0 001974D0  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A4D4 001974D4  38 80 00 00 */	li r4, 0
/* 8019A4D8 001974D8  38 00 00 64 */	li r0, 0x64
/* 8019A4DC 001974DC  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A4E0 001974E0  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A4E4 001974E4  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A4E8 001974E8  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A4EC:
/* 8019A4EC 001974EC  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019A4F0 001974F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A4F4 001974F4  7C 08 03 A6 */	mtlr r0
/* 8019A4F8 001974F8  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A4FC 001974FC  4E 80 00 20 */	blr 

.global BattleAudienceSoundSleep
BattleAudienceSoundSleep:
/* 8019A500 00197500  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019A504 00197504  7C 08 02 A6 */	mflr r0
/* 8019A508 00197508  3C 80 80 30 */	lis r4, lbl_802F9578@ha
/* 8019A50C 0019750C  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019A510 00197510  BF 81 00 20 */	stmw r28, 0x20(r1)
/* 8019A514 00197514  3B C4 95 78 */	addi r30, r4, lbl_802F9578@l
/* 8019A518 00197518  7C 7C 1B 78 */	mr r28, r3
/* 8019A51C 0019751C  38 81 00 08 */	addi r4, r1, 8
/* 8019A520 00197520  4B FF F8 D9 */	bl BattleAudienceSoundGetInfo2
/* 8019A524 00197524  C0 21 00 08 */	lfs f1, 8(r1)
/* 8019A528 00197528  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019A52C 0019752C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019A530 00197530  4C 40 13 82 */	cror 2, 0, 2
/* 8019A534 00197534  40 82 00 0C */	bne .L_8019A540
/* 8019A538 00197538  3B A0 00 0E */	li r29, 0xe
/* 8019A53C 0019753C  48 00 00 08 */	b .L_8019A544
.L_8019A540:
/* 8019A540 00197540  3B A0 00 0F */	li r29, 0xf
.L_8019A544:
/* 8019A544 00197544  7F A3 EB 78 */	mr r3, r29
/* 8019A548 00197548  48 00 80 A9 */	bl BattleAudienceSoundGetPtr
/* 8019A54C 0019754C  7C 7F 1B 78 */	mr r31, r3
/* 8019A550 00197550  7F A3 EB 78 */	mr r3, r29
/* 8019A554 00197554  4B FF FA A9 */	bl BattleAudienceSoundStop
/* 8019A558 00197558  38 60 00 03 */	li r3, 3
/* 8019A55C 0019755C  4B E6 B9 69 */	bl irand
/* 8019A560 00197560  2C 03 00 01 */	cmpwi r3, 1
/* 8019A564 00197564  41 82 00 34 */	beq .L_8019A598
/* 8019A568 00197568  40 80 00 10 */	bge .L_8019A578
/* 8019A56C 0019756C  2C 03 00 00 */	cmpwi r3, 0
/* 8019A570 00197570  40 80 00 14 */	bge .L_8019A584
/* 8019A574 00197574  48 00 00 48 */	b .L_8019A5BC
.L_8019A578:
/* 8019A578 00197578  2C 03 00 03 */	cmpwi r3, 3
/* 8019A57C 0019757C  40 80 00 40 */	bge .L_8019A5BC
/* 8019A580 00197580  48 00 00 2C */	b .L_8019A5AC
.L_8019A584:
/* 8019A584 00197584  7F 84 E3 78 */	mr r4, r28
/* 8019A588 00197588  38 7E 05 38 */	addi r3, r30, 0x538
/* 8019A58C 0019758C  4B FF F8 B1 */	bl BattleAudienceSound2
/* 8019A590 00197590  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A594 00197594  48 00 00 28 */	b .L_8019A5BC
.L_8019A598:
/* 8019A598 00197598  7F 84 E3 78 */	mr r4, r28
/* 8019A59C 0019759C  38 7E 05 4C */	addi r3, r30, 0x54c
/* 8019A5A0 001975A0  4B FF F8 9D */	bl BattleAudienceSound2
/* 8019A5A4 001975A4  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A5A8 001975A8  48 00 00 14 */	b .L_8019A5BC
.L_8019A5AC:
/* 8019A5AC 001975AC  7F 84 E3 78 */	mr r4, r28
/* 8019A5B0 001975B0  38 7E 05 60 */	addi r3, r30, 0x560
/* 8019A5B4 001975B4  4B FF F8 89 */	bl BattleAudienceSound2
/* 8019A5B8 001975B8  90 7F 00 04 */	stw r3, 4(r31)
.L_8019A5BC:
/* 8019A5BC 001975BC  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A5C0 001975C0  2C 00 FF FF */	cmpwi r0, -1
/* 8019A5C4 001975C4  41 82 00 44 */	beq .L_8019A608
/* 8019A5C8 001975C8  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A5CC 001975CC  38 60 FF FF */	li r3, -1
/* 8019A5D0 001975D0  38 00 00 00 */	li r0, 0
/* 8019A5D4 001975D4  60 84 00 01 */	ori r4, r4, 1
/* 8019A5D8 001975D8  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A5DC 001975DC  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A5E0 001975E0  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A5E4 001975E4  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A5E8 001975E8  4B F3 AB 75 */	bl psndSFX_get_vol
/* 8019A5EC 001975EC  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A5F0 001975F0  38 80 00 00 */	li r4, 0
/* 8019A5F4 001975F4  38 00 00 64 */	li r0, 0x64
/* 8019A5F8 001975F8  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A5FC 001975FC  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A600 00197600  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A604 00197604  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A608:
/* 8019A608 00197608  BB 81 00 20 */	lmw r28, 0x20(r1)
/* 8019A60C 0019760C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019A610 00197610  7C 08 03 A6 */	mtlr r0
/* 8019A614 00197614  38 21 00 30 */	addi r1, r1, 0x30
/* 8019A618 00197618  4E 80 00 20 */	blr 

.global BattleAudienceSoundRun
BattleAudienceSoundRun:
/* 8019A61C 0019761C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019A620 00197620  7C 08 02 A6 */	mflr r0
/* 8019A624 00197624  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A628 00197628  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019A62C 0019762C  7C 7E 1B 78 */	mr r30, r3
/* 8019A630 00197630  38 60 00 0D */	li r3, 0xd
/* 8019A634 00197634  48 00 7F BD */	bl BattleAudienceSoundGetPtr
/* 8019A638 00197638  7C 7F 1B 78 */	mr r31, r3
/* 8019A63C 0019763C  38 60 00 0D */	li r3, 0xd
/* 8019A640 00197640  4B FF F9 BD */	bl BattleAudienceSoundStop
/* 8019A644 00197644  2C 1E 00 01 */	cmpwi r30, 1
/* 8019A648 00197648  41 82 00 28 */	beq .L_8019A670
/* 8019A64C 0019764C  40 80 00 34 */	bge .L_8019A680
/* 8019A650 00197650  2C 1E 00 00 */	cmpwi r30, 0
/* 8019A654 00197654  40 80 00 08 */	bge .L_8019A65C
/* 8019A658 00197658  48 00 00 28 */	b .L_8019A680
.L_8019A65C:
/* 8019A65C 0019765C  3C 60 80 30 */	lis r3, lbl_802F9AEC@ha
/* 8019A660 00197660  38 63 9A EC */	addi r3, r3, lbl_802F9AEC@l
/* 8019A664 00197664  4B FF F9 79 */	bl func_80199FDC
/* 8019A668 00197668  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A66C 0019766C  48 00 00 14 */	b .L_8019A680
.L_8019A670:
/* 8019A670 00197670  3C 60 80 30 */	lis r3, lbl_802F9B00@ha
/* 8019A674 00197674  38 63 9B 00 */	addi r3, r3, lbl_802F9B00@l
/* 8019A678 00197678  4B FF F9 65 */	bl func_80199FDC
/* 8019A67C 0019767C  90 7F 00 04 */	stw r3, 4(r31)
.L_8019A680:
/* 8019A680 00197680  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A684 00197684  2C 00 FF FF */	cmpwi r0, -1
/* 8019A688 00197688  41 82 00 44 */	beq .L_8019A6CC
/* 8019A68C 0019768C  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A690 00197690  38 60 FF FF */	li r3, -1
/* 8019A694 00197694  38 00 00 00 */	li r0, 0
/* 8019A698 00197698  60 84 00 01 */	ori r4, r4, 1
/* 8019A69C 0019769C  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A6A0 001976A0  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A6A4 001976A4  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A6A8 001976A8  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A6AC 001976AC  4B F3 AA B1 */	bl psndSFX_get_vol
/* 8019A6B0 001976B0  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A6B4 001976B4  38 80 00 00 */	li r4, 0
/* 8019A6B8 001976B8  38 00 00 64 */	li r0, 0x64
/* 8019A6BC 001976BC  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A6C0 001976C0  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A6C4 001976C4  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A6C8 001976C8  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A6CC:
/* 8019A6CC 001976CC  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019A6D0 001976D0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019A6D4 001976D4  7C 08 03 A6 */	mtlr r0
/* 8019A6D8 001976D8  38 21 00 10 */	addi r1, r1, 0x10
/* 8019A6DC 001976DC  4E 80 00 20 */	blr 

.global BattleAudienceSoundItemThrow
BattleAudienceSoundItemThrow:
/* 8019A6E0 001976E0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019A6E4 001976E4  7C 08 02 A6 */	mflr r0
/* 8019A6E8 001976E8  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019A6EC 001976EC  BF 81 00 20 */	stmw r28, 0x20(r1)
/* 8019A6F0 001976F0  7C 9D 23 78 */	mr r29, r4
/* 8019A6F4 001976F4  7C 7C 1B 78 */	mr r28, r3
/* 8019A6F8 001976F8  38 81 00 08 */	addi r4, r1, 8
/* 8019A6FC 001976FC  7F A3 EB 78 */	mr r3, r29
/* 8019A700 00197700  4B FF F6 F9 */	bl BattleAudienceSoundGetInfo2
/* 8019A704 00197704  C0 21 00 08 */	lfs f1, 8(r1)
/* 8019A708 00197708  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019A70C 0019770C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019A710 00197710  4C 40 13 82 */	cror 2, 0, 2
/* 8019A714 00197714  40 82 00 0C */	bne .L_8019A720
/* 8019A718 00197718  3B C0 00 0A */	li r30, 0xa
/* 8019A71C 0019771C  48 00 00 08 */	b .L_8019A724
.L_8019A720:
/* 8019A720 00197720  3B C0 00 0B */	li r30, 0xb
.L_8019A724:
/* 8019A724 00197724  7F C3 F3 78 */	mr r3, r30
/* 8019A728 00197728  48 00 7E C9 */	bl BattleAudienceSoundGetPtr
/* 8019A72C 0019772C  7C 7F 1B 78 */	mr r31, r3
/* 8019A730 00197730  7F C3 F3 78 */	mr r3, r30
/* 8019A734 00197734  4B FF F8 C9 */	bl BattleAudienceSoundStop
/* 8019A738 00197738  2C 1C 00 00 */	cmpwi r28, 0
/* 8019A73C 0019773C  41 82 00 08 */	beq .L_8019A744
/* 8019A740 00197740  48 00 00 1C */	b .L_8019A75C
.L_8019A744:
/* 8019A744 00197744  3C 60 80 30 */	lis r3, lbl_802F9B14@ha
/* 8019A748 00197748  7F A4 EB 78 */	mr r4, r29
/* 8019A74C 0019774C  38 63 9B 14 */	addi r3, r3, lbl_802F9B14@l
/* 8019A750 00197750  4B FF F6 ED */	bl BattleAudienceSound2
/* 8019A754 00197754  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A758 00197758  48 00 00 18 */	b .L_8019A770
.L_8019A75C:
/* 8019A75C 0019775C  3C 60 80 30 */	lis r3, lbl_802F9B30@ha
/* 8019A760 00197760  7F A4 EB 78 */	mr r4, r29
/* 8019A764 00197764  38 63 9B 30 */	addi r3, r3, lbl_802F9B30@l
/* 8019A768 00197768  4B FF F6 D5 */	bl BattleAudienceSound2
/* 8019A76C 0019776C  90 7F 00 04 */	stw r3, 4(r31)
.L_8019A770:
/* 8019A770 00197770  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A774 00197774  2C 00 FF FF */	cmpwi r0, -1
/* 8019A778 00197778  41 82 00 44 */	beq .L_8019A7BC
/* 8019A77C 0019777C  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A780 00197780  38 60 FF FF */	li r3, -1
/* 8019A784 00197784  38 00 00 00 */	li r0, 0
/* 8019A788 00197788  60 84 00 01 */	ori r4, r4, 1
/* 8019A78C 0019778C  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A790 00197790  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A794 00197794  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A798 00197798  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A79C 0019779C  4B F3 A9 C1 */	bl psndSFX_get_vol
/* 8019A7A0 001977A0  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A7A4 001977A4  38 80 00 00 */	li r4, 0
/* 8019A7A8 001977A8  38 00 00 64 */	li r0, 0x64
/* 8019A7AC 001977AC  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A7B0 001977B0  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A7B4 001977B4  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A7B8 001977B8  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A7BC:
/* 8019A7BC 001977BC  BB 81 00 20 */	lmw r28, 0x20(r1)
/* 8019A7C0 001977C0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019A7C4 001977C4  7C 08 03 A6 */	mtlr r0
/* 8019A7C8 001977C8  38 21 00 30 */	addi r1, r1, 0x30
/* 8019A7CC 001977CC  4E 80 00 20 */	blr 

.global BattleAudienceSoundHandBeat
BattleAudienceSoundHandBeat:
/* 8019A7D0 001977D0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019A7D4 001977D4  7C 08 02 A6 */	mflr r0
/* 8019A7D8 001977D8  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019A7DC 001977DC  BF 81 00 20 */	stmw r28, 0x20(r1)
/* 8019A7E0 001977E0  48 00 7E F5 */	bl BattleAudienceBaseGetPtr
/* 8019A7E4 001977E4  38 60 00 09 */	li r3, 9
/* 8019A7E8 001977E8  48 00 7E 09 */	bl BattleAudienceSoundGetPtr
/* 8019A7EC 001977EC  7C 7E 1B 78 */	mr r30, r3
/* 8019A7F0 001977F0  48 00 1B 59 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019A7F4 001977F4  7C 7F 1B 78 */	mr r31, r3
/* 8019A7F8 001977F8  48 00 1B 2D */	bl func_8019C324
/* 8019A7FC 001977FC  7C 60 1B 78 */	mr r0, r3
/* 8019A800 00197800  38 60 00 09 */	li r3, 9
/* 8019A804 00197804  7C 1D 03 78 */	mr r29, r0
/* 8019A808 00197808  7F 9F EA 14 */	add r28, r31, r29
/* 8019A80C 0019780C  4B FF F7 F1 */	bl BattleAudienceSoundStop
/* 8019A810 00197810  3C 60 80 30 */	lis r3, lbl_802F9B4C@ha
/* 8019A814 00197814  7F E4 FB 78 */	mr r4, r31
/* 8019A818 00197818  38 63 9B 4C */	addi r3, r3, lbl_802F9B4C@l
/* 8019A81C 0019781C  7F A5 EB 78 */	mr r5, r29
/* 8019A820 00197820  4B FF F7 61 */	bl BattleAudienceSound1
/* 8019A824 00197824  90 7E 00 04 */	stw r3, 4(r30)
/* 8019A828 00197828  80 1E 00 04 */	lwz r0, 4(r30)
/* 8019A82C 0019782C  2C 00 FF FF */	cmpwi r0, -1
/* 8019A830 00197830  41 82 00 B4 */	beq .L_8019A8E4
/* 8019A834 00197834  80 7E 00 00 */	lwz r3, 0(r30)
/* 8019A838 00197838  38 00 FF FF */	li r0, -1
/* 8019A83C 0019783C  3B E0 00 00 */	li r31, 0
/* 8019A840 00197840  2C 1C 00 00 */	cmpwi r28, 0
/* 8019A844 00197844  60 63 00 01 */	ori r3, r3, 1
/* 8019A848 00197848  90 7E 00 00 */	stw r3, 0(r30)
/* 8019A84C 0019784C  90 1E 00 0C */	stw r0, 0xc(r30)
/* 8019A850 00197850  93 FE 00 10 */	stw r31, 0x10(r30)
/* 8019A854 00197854  93 FE 00 18 */	stw r31, 0x18(r30)
/* 8019A858 00197858  93 FE 00 14 */	stw r31, 0x14(r30)
/* 8019A85C 0019785C  40 82 00 08 */	bne .L_8019A864
/* 8019A860 00197860  48 00 00 68 */	b .L_8019A8C8
.L_8019A864:
/* 8019A864 00197864  38 60 00 1A */	li r3, 0x1a
/* 8019A868 00197868  4B E6 B6 5D */	bl irand
/* 8019A86C 0019786C  3C 80 43 30 */	lis r4, 0x4330
/* 8019A870 00197870  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 8019A874 00197874  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019A878 00197878  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 8019A87C 0019787C  6F 80 80 00 */	xoris r0, r28, 0x8000
/* 8019A880 00197880  C8 83 9A 00 */	lfd f4, lbl_802F9A00@l(r3)
/* 8019A884 00197884  90 81 00 08 */	stw r4, 8(r1)
/* 8019A888 00197888  C0 22 D2 C8 */	lfs f1, lbl_8041E648@sda21(r2)
/* 8019A88C 0019788C  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019A890 00197890  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019A894 00197894  EC 60 20 28 */	fsubs f3, f0, f4
/* 8019A898 00197898  C0 02 D2 D0 */	lfs f0, lbl_8041E650@sda21(r2)
/* 8019A89C 0019789C  90 81 00 10 */	stw r4, 0x10(r1)
/* 8019A8A0 001978A0  C8 41 00 10 */	lfd f2, 0x10(r1)
/* 8019A8A4 001978A4  EC 60 18 2A */	fadds f3, f0, f3
/* 8019A8A8 001978A8  C0 02 D2 D8 */	lfs f0, lbl_8041E658@sda21(r2)
/* 8019A8AC 001978AC  EC 42 20 28 */	fsubs f2, f2, f4
/* 8019A8B0 001978B0  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019A8B4 001978B4  EC 22 08 24 */	fdivs f1, f2, f1
/* 8019A8B8 001978B8  EC 00 08 2A */	fadds f0, f0, f1
/* 8019A8BC 001978BC  FC 00 00 1E */	fctiwz f0, f0
/* 8019A8C0 001978C0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 8019A8C4 001978C4  83 E1 00 1C */	lwz r31, 0x1c(r1)
.L_8019A8C8:
/* 8019A8C8 001978C8  80 7E 00 04 */	lwz r3, 4(r30)
/* 8019A8CC 001978CC  7F E4 FB 78 */	mr r4, r31
/* 8019A8D0 001978D0  4B F3 AB 05 */	bl psndSFX_vol
/* 8019A8D4 001978D4  9B FE 00 1D */	stb r31, 0x1d(r30)
/* 8019A8D8 001978D8  38 00 00 64 */	li r0, 0x64
/* 8019A8DC 001978DC  9B FE 00 1C */	stb r31, 0x1c(r30)
/* 8019A8E0 001978E0  98 1E 00 1E */	stb r0, 0x1e(r30)
.L_8019A8E4:
/* 8019A8E4 001978E4  BB 81 00 20 */	lmw r28, 0x20(r1)
/* 8019A8E8 001978E8  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019A8EC 001978EC  7C 08 03 A6 */	mtlr r0
/* 8019A8F0 001978F0  38 21 00 30 */	addi r1, r1, 0x30
/* 8019A8F4 001978F4  4E 80 00 20 */	blr 

.global BattleAudienceSoundCallKind
BattleAudienceSoundCallKind:
/* 8019A8F8 001978F8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019A8FC 001978FC  7C 08 02 A6 */	mflr r0
/* 8019A900 00197900  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019A904 00197904  BF 81 00 10 */	stmw r28, 0x10(r1)
/* 8019A908 00197908  7C 7C 1B 78 */	mr r28, r3
/* 8019A90C 0019790C  48 00 7D C9 */	bl BattleAudienceBaseGetPtr
/* 8019A910 00197910  38 60 00 08 */	li r3, 8
/* 8019A914 00197914  48 00 7C DD */	bl BattleAudienceSoundGetPtr
/* 8019A918 00197918  7C 7F 1B 78 */	mr r31, r3
/* 8019A91C 0019791C  48 00 1A 2D */	bl BattleAudience_GetPPAudienceNum_R
/* 8019A920 00197920  7C 7E 1B 78 */	mr r30, r3
/* 8019A924 00197924  48 00 1A 01 */	bl func_8019C324
/* 8019A928 00197928  7C 60 1B 78 */	mr r0, r3
/* 8019A92C 0019792C  38 60 00 08 */	li r3, 8
/* 8019A930 00197930  7C 1D 03 78 */	mr r29, r0
/* 8019A934 00197934  4B FF F6 C9 */	bl BattleAudienceSoundStop
/* 8019A938 00197938  2C 1C 00 02 */	cmpwi r28, 2
/* 8019A93C 0019793C  41 82 00 30 */	beq .L_8019A96C
/* 8019A940 00197940  40 80 00 44 */	bge .L_8019A984
/* 8019A944 00197944  2C 1C 00 01 */	cmpwi r28, 1
/* 8019A948 00197948  40 80 00 08 */	bge .L_8019A950
/* 8019A94C 0019794C  48 00 00 38 */	b .L_8019A984
.L_8019A950:
/* 8019A950 00197950  3C 60 80 30 */	lis r3, lbl_802F9B64@ha
/* 8019A954 00197954  7F C4 F3 78 */	mr r4, r30
/* 8019A958 00197958  38 63 9B 64 */	addi r3, r3, lbl_802F9B64@l
/* 8019A95C 0019795C  7F A5 EB 78 */	mr r5, r29
/* 8019A960 00197960  4B FF F6 21 */	bl BattleAudienceSound1
/* 8019A964 00197964  90 7F 00 04 */	stw r3, 4(r31)
/* 8019A968 00197968  48 00 00 1C */	b .L_8019A984
.L_8019A96C:
/* 8019A96C 0019796C  3C 60 80 30 */	lis r3, lbl_802F9B7C@ha
/* 8019A970 00197970  7F C4 F3 78 */	mr r4, r30
/* 8019A974 00197974  38 63 9B 7C */	addi r3, r3, lbl_802F9B7C@l
/* 8019A978 00197978  7F A5 EB 78 */	mr r5, r29
/* 8019A97C 0019797C  4B FF F6 05 */	bl BattleAudienceSound1
/* 8019A980 00197980  90 7F 00 04 */	stw r3, 4(r31)
.L_8019A984:
/* 8019A984 00197984  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019A988 00197988  2C 00 FF FF */	cmpwi r0, -1
/* 8019A98C 0019798C  41 82 00 44 */	beq .L_8019A9D0
/* 8019A990 00197990  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019A994 00197994  38 60 FF FF */	li r3, -1
/* 8019A998 00197998  38 00 00 00 */	li r0, 0
/* 8019A99C 0019799C  60 84 00 01 */	ori r4, r4, 1
/* 8019A9A0 001979A0  90 9F 00 00 */	stw r4, 0(r31)
/* 8019A9A4 001979A4  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019A9A8 001979A8  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019A9AC 001979AC  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019A9B0 001979B0  4B F3 A7 AD */	bl psndSFX_get_vol
/* 8019A9B4 001979B4  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019A9B8 001979B8  38 80 00 00 */	li r4, 0
/* 8019A9BC 001979BC  38 00 00 64 */	li r0, 0x64
/* 8019A9C0 001979C0  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019A9C4 001979C4  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019A9C8 001979C8  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019A9CC 001979CC  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019A9D0:
/* 8019A9D0 001979D0  BB 81 00 10 */	lmw r28, 0x10(r1)
/* 8019A9D4 001979D4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019A9D8 001979D8  7C 08 03 A6 */	mtlr r0
/* 8019A9DC 001979DC  38 21 00 20 */	addi r1, r1, 0x20
/* 8019A9E0 001979E0  4E 80 00 20 */	blr 

.global BattleAudienceSoundWhistleKind
BattleAudienceSoundWhistleKind:
/* 8019A9E4 001979E4  94 21 FC B0 */	stwu r1, -0x350(r1)
/* 8019A9E8 001979E8  7C 08 02 A6 */	mflr r0
/* 8019A9EC 001979EC  3C 80 80 30 */	lis r4, lbl_802F9578@ha
/* 8019A9F0 001979F0  90 01 03 54 */	stw r0, 0x354(r1)
/* 8019A9F4 001979F4  BF 41 03 38 */	stmw r26, 0x338(r1)
/* 8019A9F8 001979F8  7C 7A 1B 78 */	mr r26, r3
/* 8019A9FC 001979FC  3B A4 95 78 */	addi r29, r4, lbl_802F9578@l
/* 8019AA00 00197A00  3B C1 00 14 */	addi r30, r1, 0x14
/* 8019AA04 00197A04  3B 60 00 00 */	li r27, 0
/* 8019AA08 00197A08  3B E0 00 00 */	li r31, 0
/* 8019AA0C 00197A0C  3B 80 00 00 */	li r28, 0
.L_8019AA10:
/* 8019AA10 00197A10  7F 83 E3 78 */	mr r3, r28
/* 8019AA14 00197A14  48 00 1F 25 */	bl BattleAudience_GetWaiting
/* 8019AA18 00197A18  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8019AA1C 00197A1C  28 00 00 01 */	cmplwi r0, 1
/* 8019AA20 00197A20  40 82 00 10 */	bne .L_8019AA30
/* 8019AA24 00197A24  7F 9E F9 2E */	stwx r28, r30, r31
/* 8019AA28 00197A28  3B 7B 00 01 */	addi r27, r27, 1
/* 8019AA2C 00197A2C  3B FF 00 04 */	addi r31, r31, 4
.L_8019AA30:
/* 8019AA30 00197A30  3B 9C 00 01 */	addi r28, r28, 1
/* 8019AA34 00197A34  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 8019AA38 00197A38  41 80 FF D8 */	blt .L_8019AA10
/* 8019AA3C 00197A3C  2C 1B 00 00 */	cmpwi r27, 0
/* 8019AA40 00197A40  41 82 01 00 */	beq .L_8019AB40
/* 8019AA44 00197A44  7F 63 DB 78 */	mr r3, r27
/* 8019AA48 00197A48  4B E6 B4 7D */	bl irand
/* 8019AA4C 00197A4C  54 60 10 3A */	slwi r0, r3, 2
/* 8019AA50 00197A50  38 61 00 14 */	addi r3, r1, 0x14
/* 8019AA54 00197A54  7F 83 00 2E */	lwzx r28, r3, r0
/* 8019AA58 00197A58  38 81 00 08 */	addi r4, r1, 8
/* 8019AA5C 00197A5C  7F 83 E3 78 */	mr r3, r28
/* 8019AA60 00197A60  4B FF F3 99 */	bl BattleAudienceSoundGetInfo2
/* 8019AA64 00197A64  C0 21 00 08 */	lfs f1, 8(r1)
/* 8019AA68 00197A68  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019AA6C 00197A6C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019AA70 00197A70  4C 40 13 82 */	cror 2, 0, 2
/* 8019AA74 00197A74  40 82 00 0C */	bne .L_8019AA80
/* 8019AA78 00197A78  3B C0 00 06 */	li r30, 6
/* 8019AA7C 00197A7C  48 00 00 08 */	b .L_8019AA84
.L_8019AA80:
/* 8019AA80 00197A80  3B C0 00 07 */	li r30, 7
.L_8019AA84:
/* 8019AA84 00197A84  7F C3 F3 78 */	mr r3, r30
/* 8019AA88 00197A88  48 00 7B 69 */	bl BattleAudienceSoundGetPtr
/* 8019AA8C 00197A8C  7C 7F 1B 78 */	mr r31, r3
/* 8019AA90 00197A90  7F C3 F3 78 */	mr r3, r30
/* 8019AA94 00197A94  4B FF F5 69 */	bl BattleAudienceSoundStop
/* 8019AA98 00197A98  2C 1A 00 02 */	cmpwi r26, 2
/* 8019AA9C 00197A9C  41 82 00 34 */	beq .L_8019AAD0
/* 8019AAA0 00197AA0  40 80 00 10 */	bge .L_8019AAB0
/* 8019AAA4 00197AA4  2C 1A 00 01 */	cmpwi r26, 1
/* 8019AAA8 00197AA8  40 80 00 14 */	bge .L_8019AABC
/* 8019AAAC 00197AAC  48 00 00 48 */	b .L_8019AAF4
.L_8019AAB0:
/* 8019AAB0 00197AB0  2C 1A 00 04 */	cmpwi r26, 4
/* 8019AAB4 00197AB4  40 80 00 40 */	bge .L_8019AAF4
/* 8019AAB8 00197AB8  48 00 00 2C */	b .L_8019AAE4
.L_8019AABC:
/* 8019AABC 00197ABC  7F 84 E3 78 */	mr r4, r28
/* 8019AAC0 00197AC0  38 7D 06 1C */	addi r3, r29, 0x61c
/* 8019AAC4 00197AC4  4B FF F3 79 */	bl BattleAudienceSound2
/* 8019AAC8 00197AC8  90 7F 00 04 */	stw r3, 4(r31)
/* 8019AACC 00197ACC  48 00 00 28 */	b .L_8019AAF4
.L_8019AAD0:
/* 8019AAD0 00197AD0  7F 84 E3 78 */	mr r4, r28
/* 8019AAD4 00197AD4  38 7D 06 34 */	addi r3, r29, 0x634
/* 8019AAD8 00197AD8  4B FF F3 65 */	bl BattleAudienceSound2
/* 8019AADC 00197ADC  90 7F 00 04 */	stw r3, 4(r31)
/* 8019AAE0 00197AE0  48 00 00 14 */	b .L_8019AAF4
.L_8019AAE4:
/* 8019AAE4 00197AE4  7F 84 E3 78 */	mr r4, r28
/* 8019AAE8 00197AE8  38 7D 06 4C */	addi r3, r29, 0x64c
/* 8019AAEC 00197AEC  4B FF F3 51 */	bl BattleAudienceSound2
/* 8019AAF0 00197AF0  90 7F 00 04 */	stw r3, 4(r31)
.L_8019AAF4:
/* 8019AAF4 00197AF4  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019AAF8 00197AF8  2C 00 FF FF */	cmpwi r0, -1
/* 8019AAFC 00197AFC  41 82 00 44 */	beq .L_8019AB40
/* 8019AB00 00197B00  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019AB04 00197B04  38 60 FF FF */	li r3, -1
/* 8019AB08 00197B08  38 00 00 00 */	li r0, 0
/* 8019AB0C 00197B0C  60 84 00 01 */	ori r4, r4, 1
/* 8019AB10 00197B10  90 9F 00 00 */	stw r4, 0(r31)
/* 8019AB14 00197B14  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019AB18 00197B18  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019AB1C 00197B1C  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019AB20 00197B20  4B F3 A6 3D */	bl psndSFX_get_vol
/* 8019AB24 00197B24  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019AB28 00197B28  38 80 00 00 */	li r4, 0
/* 8019AB2C 00197B2C  38 00 00 64 */	li r0, 0x64
/* 8019AB30 00197B30  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019AB34 00197B34  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019AB38 00197B38  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019AB3C 00197B3C  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019AB40:
/* 8019AB40 00197B40  BB 41 03 38 */	lmw r26, 0x338(r1)
/* 8019AB44 00197B44  80 01 03 54 */	lwz r0, 0x354(r1)
/* 8019AB48 00197B48  7C 08 03 A6 */	mtlr r0
/* 8019AB4C 00197B4C  38 21 03 50 */	addi r1, r1, 0x350
/* 8019AB50 00197B50  4E 80 00 20 */	blr 

.global BattleAudienceSoundWhistle
BattleAudienceSoundWhistle:
/* 8019AB54 00197B54  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019AB58 00197B58  7C 08 02 A6 */	mflr r0
/* 8019AB5C 00197B5C  38 60 00 03 */	li r3, 3
/* 8019AB60 00197B60  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019AB64 00197B64  4B E6 B3 61 */	bl irand
/* 8019AB68 00197B68  38 63 00 01 */	addi r3, r3, 1
/* 8019AB6C 00197B6C  4B FF FE 79 */	bl BattleAudienceSoundWhistleKind
/* 8019AB70 00197B70  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019AB74 00197B74  7C 08 03 A6 */	mtlr r0
/* 8019AB78 00197B78  38 21 00 10 */	addi r1, r1, 0x10
/* 8019AB7C 00197B7C  4E 80 00 20 */	blr 

.global BattleAudienceSoundCheerKind
BattleAudienceSoundCheerKind:
/* 8019AB80 00197B80  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 8019AB84 00197B84  7C 08 02 A6 */	mflr r0
/* 8019AB88 00197B88  3C C0 80 30 */	lis r6, lbl_802F9578@ha
/* 8019AB8C 00197B8C  90 01 00 74 */	stw r0, 0x74(r1)
/* 8019AB90 00197B90  BF 01 00 50 */	stmw r24, 0x50(r1)
/* 8019AB94 00197B94  7C 78 1B 78 */	mr r24, r3
/* 8019AB98 00197B98  7C 99 23 78 */	mr r25, r4
/* 8019AB9C 00197B9C  7C BA 2B 78 */	mr r26, r5
/* 8019ABA0 00197BA0  3B E6 95 78 */	addi r31, r6, lbl_802F9578@l
/* 8019ABA4 00197BA4  48 00 7B 31 */	bl BattleAudienceBaseGetPtr
/* 8019ABA8 00197BA8  3B 60 00 00 */	li r27, 0
/* 8019ABAC 00197BAC  48 00 17 9D */	bl BattleAudience_GetPPAudienceNum_R
/* 8019ABB0 00197BB0  7C 7D 1B 78 */	mr r29, r3
/* 8019ABB4 00197BB4  48 00 17 71 */	bl func_8019C324
/* 8019ABB8 00197BB8  7C 60 1B 78 */	mr r0, r3
/* 8019ABBC 00197BBC  38 60 00 04 */	li r3, 4
/* 8019ABC0 00197BC0  7C 1C 03 78 */	mr r28, r0
/* 8019ABC4 00197BC4  48 00 7A 2D */	bl BattleAudienceSoundGetPtr
/* 8019ABC8 00197BC8  7C 7E 1B 78 */	mr r30, r3
/* 8019ABCC 00197BCC  38 60 00 05 */	li r3, 5
/* 8019ABD0 00197BD0  48 00 7A 21 */	bl BattleAudienceSoundGetPtr
/* 8019ABD4 00197BD4  80 1E 00 00 */	lwz r0, 0(r30)
/* 8019ABD8 00197BD8  54 04 07 FF */	clrlwi. r4, r0, 0x1f
/* 8019ABDC 00197BDC  41 82 00 50 */	beq .L_8019AC2C
/* 8019ABE0 00197BE0  80 03 00 00 */	lwz r0, 0(r3)
/* 8019ABE4 00197BE4  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019ABE8 00197BE8  41 82 00 44 */	beq .L_8019AC2C
/* 8019ABEC 00197BEC  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 8019ABF0 00197BF0  80 03 00 0C */	lwz r0, 0xc(r3)
/* 8019ABF4 00197BF4  7C 04 00 00 */	cmpw r4, r0
/* 8019ABF8 00197BF8  41 81 00 1C */	bgt .L_8019AC14
/* 8019ABFC 00197BFC  38 60 00 04 */	li r3, 4
/* 8019AC00 00197C00  4B FF F3 FD */	bl BattleAudienceSoundStop
/* 8019AC04 00197C04  38 60 00 04 */	li r3, 4
/* 8019AC08 00197C08  48 00 79 E9 */	bl BattleAudienceSoundGetPtr
/* 8019AC0C 00197C0C  7C 7E 1B 78 */	mr r30, r3
/* 8019AC10 00197C10  48 00 00 64 */	b .L_8019AC74
.L_8019AC14:
/* 8019AC14 00197C14  38 60 00 05 */	li r3, 5
/* 8019AC18 00197C18  4B FF F3 E5 */	bl BattleAudienceSoundStop
/* 8019AC1C 00197C1C  38 60 00 05 */	li r3, 5
/* 8019AC20 00197C20  48 00 79 D1 */	bl BattleAudienceSoundGetPtr
/* 8019AC24 00197C24  7C 7E 1B 78 */	mr r30, r3
/* 8019AC28 00197C28  48 00 00 4C */	b .L_8019AC74
.L_8019AC2C:
/* 8019AC2C 00197C2C  2C 04 00 00 */	cmpwi r4, 0
/* 8019AC30 00197C30  41 82 00 18 */	beq .L_8019AC48
/* 8019AC34 00197C34  38 60 00 05 */	li r3, 5
/* 8019AC38 00197C38  48 00 79 B9 */	bl BattleAudienceSoundGetPtr
/* 8019AC3C 00197C3C  3B 60 00 01 */	li r27, 1
/* 8019AC40 00197C40  7C 7E 1B 78 */	mr r30, r3
/* 8019AC44 00197C44  48 00 00 30 */	b .L_8019AC74
.L_8019AC48:
/* 8019AC48 00197C48  80 03 00 00 */	lwz r0, 0(r3)
/* 8019AC4C 00197C4C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019AC50 00197C50  41 82 00 18 */	beq .L_8019AC68
/* 8019AC54 00197C54  38 60 00 04 */	li r3, 4
/* 8019AC58 00197C58  48 00 79 99 */	bl BattleAudienceSoundGetPtr
/* 8019AC5C 00197C5C  3B 60 00 01 */	li r27, 1
/* 8019AC60 00197C60  7C 7E 1B 78 */	mr r30, r3
/* 8019AC64 00197C64  48 00 00 10 */	b .L_8019AC74
.L_8019AC68:
/* 8019AC68 00197C68  38 60 00 04 */	li r3, 4
/* 8019AC6C 00197C6C  48 00 79 85 */	bl BattleAudienceSoundGetPtr
/* 8019AC70 00197C70  7C 7E 1B 78 */	mr r30, r3
.L_8019AC74:
/* 8019AC74 00197C74  2C 18 00 01 */	cmpwi r24, 1
/* 8019AC78 00197C78  40 82 00 18 */	bne .L_8019AC90
/* 8019AC7C 00197C7C  38 61 00 08 */	addi r3, r1, 8
/* 8019AC80 00197C80  38 9F 06 64 */	addi r4, r31, 0x664
/* 8019AC84 00197C84  48 0C C9 61 */	bl strcpy
/* 8019AC88 00197C88  38 00 00 01 */	li r0, 1
/* 8019AC8C 00197C8C  98 1E 00 08 */	stb r0, 8(r30)
.L_8019AC90:
/* 8019AC90 00197C90  2C 18 00 02 */	cmpwi r24, 2
/* 8019AC94 00197C94  40 82 00 18 */	bne .L_8019ACAC
/* 8019AC98 00197C98  38 61 00 08 */	addi r3, r1, 8
/* 8019AC9C 00197C9C  38 9F 06 80 */	addi r4, r31, 0x680
/* 8019ACA0 00197CA0  48 0C C9 45 */	bl strcpy
/* 8019ACA4 00197CA4  38 00 00 02 */	li r0, 2
/* 8019ACA8 00197CA8  98 1E 00 08 */	stb r0, 8(r30)
.L_8019ACAC:
/* 8019ACAC 00197CAC  2C 18 00 03 */	cmpwi r24, 3
/* 8019ACB0 00197CB0  40 82 00 18 */	bne .L_8019ACC8
/* 8019ACB4 00197CB4  38 61 00 08 */	addi r3, r1, 8
/* 8019ACB8 00197CB8  38 9F 06 9C */	addi r4, r31, 0x69c
/* 8019ACBC 00197CBC  48 0C C9 29 */	bl strcpy
/* 8019ACC0 00197CC0  38 00 00 03 */	li r0, 3
/* 8019ACC4 00197CC4  98 1E 00 08 */	stb r0, 8(r30)
.L_8019ACC8:
/* 8019ACC8 00197CC8  2C 18 00 04 */	cmpwi r24, 4
/* 8019ACCC 00197CCC  40 82 00 18 */	bne .L_8019ACE4
/* 8019ACD0 00197CD0  38 61 00 08 */	addi r3, r1, 8
/* 8019ACD4 00197CD4  38 9F 06 B8 */	addi r4, r31, 0x6b8
/* 8019ACD8 00197CD8  48 0C C9 0D */	bl strcpy
/* 8019ACDC 00197CDC  38 00 00 04 */	li r0, 4
/* 8019ACE0 00197CE0  98 1E 00 08 */	stb r0, 8(r30)
.L_8019ACE4:
/* 8019ACE4 00197CE4  2C 1B 00 01 */	cmpwi r27, 1
/* 8019ACE8 00197CE8  40 82 00 28 */	bne .L_8019AD10
/* 8019ACEC 00197CEC  7F A4 EB 78 */	mr r4, r29
/* 8019ACF0 00197CF0  7F 85 E3 78 */	mr r5, r28
/* 8019ACF4 00197CF4  38 61 00 08 */	addi r3, r1, 8
/* 8019ACF8 00197CF8  4B FF F2 89 */	bl BattleAudienceSound1
/* 8019ACFC 00197CFC  90 7E 00 04 */	stw r3, 4(r30)
/* 8019AD00 00197D00  38 80 00 7F */	li r4, 0x7f
/* 8019AD04 00197D04  80 7E 00 04 */	lwz r3, 4(r30)
/* 8019AD08 00197D08  4B F3 A6 41 */	bl psndSFX_pit
/* 8019AD0C 00197D0C  48 00 00 18 */	b .L_8019AD24
.L_8019AD10:
/* 8019AD10 00197D10  7F A4 EB 78 */	mr r4, r29
/* 8019AD14 00197D14  7F 85 E3 78 */	mr r5, r28
/* 8019AD18 00197D18  38 61 00 08 */	addi r3, r1, 8
/* 8019AD1C 00197D1C  4B FF F2 65 */	bl BattleAudienceSound1
/* 8019AD20 00197D20  90 7E 00 04 */	stw r3, 4(r30)
.L_8019AD24:
/* 8019AD24 00197D24  80 1E 00 04 */	lwz r0, 4(r30)
/* 8019AD28 00197D28  2C 00 FF FF */	cmpwi r0, -1
/* 8019AD2C 00197D2C  41 82 00 40 */	beq .L_8019AD6C
/* 8019AD30 00197D30  80 7E 00 00 */	lwz r3, 0(r30)
/* 8019AD34 00197D34  7C 19 D2 14 */	add r0, r25, r26
/* 8019AD38 00197D38  60 63 00 01 */	ori r3, r3, 1
/* 8019AD3C 00197D3C  90 7E 00 00 */	stw r3, 0(r30)
/* 8019AD40 00197D40  90 1E 00 0C */	stw r0, 0xc(r30)
/* 8019AD44 00197D44  93 5E 00 10 */	stw r26, 0x10(r30)
/* 8019AD48 00197D48  80 7E 00 04 */	lwz r3, 4(r30)
/* 8019AD4C 00197D4C  4B F3 A4 11 */	bl psndSFX_get_vol
/* 8019AD50 00197D50  98 7E 00 1D */	stb r3, 0x1d(r30)
/* 8019AD54 00197D54  38 80 00 00 */	li r4, 0
/* 8019AD58 00197D58  38 00 00 64 */	li r0, 0x64
/* 8019AD5C 00197D5C  98 7E 00 1C */	stb r3, 0x1c(r30)
/* 8019AD60 00197D60  90 9E 00 18 */	stw r4, 0x18(r30)
/* 8019AD64 00197D64  90 9E 00 14 */	stw r4, 0x14(r30)
/* 8019AD68 00197D68  98 1E 00 1E */	stb r0, 0x1e(r30)
.L_8019AD6C:
/* 8019AD6C 00197D6C  BB 01 00 50 */	lmw r24, 0x50(r1)
/* 8019AD70 00197D70  80 01 00 74 */	lwz r0, 0x74(r1)
/* 8019AD74 00197D74  7C 08 03 A6 */	mtlr r0
/* 8019AD78 00197D78  38 21 00 70 */	addi r1, r1, 0x70
/* 8019AD7C 00197D7C  4E 80 00 20 */	blr 

.global BattleAudienceSoundCheer
BattleAudienceSoundCheer:
/* 8019AD80 00197D80  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019AD84 00197D84  7C 08 02 A6 */	mflr r0
/* 8019AD88 00197D88  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019AD8C 00197D8C  BF 81 00 10 */	stmw r28, 0x10(r1)
/* 8019AD90 00197D90  7C 7C 1B 78 */	mr r28, r3
/* 8019AD94 00197D94  7C 9D 23 78 */	mr r29, r4
/* 8019AD98 00197D98  48 00 79 3D */	bl BattleAudienceBaseGetPtr
/* 8019AD9C 00197D9C  3B C0 00 00 */	li r30, 0
/* 8019ADA0 00197DA0  48 00 15 85 */	bl func_8019C324
/* 8019ADA4 00197DA4  7C 7F 1B 78 */	mr r31, r3
/* 8019ADA8 00197DA8  48 00 15 A1 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019ADAC 00197DAC  7C 03 FA 14 */	add r0, r3, r31
/* 8019ADB0 00197DB0  2C 00 00 01 */	cmpwi r0, 1
/* 8019ADB4 00197DB4  41 80 00 10 */	blt .L_8019ADC4
/* 8019ADB8 00197DB8  2C 00 00 31 */	cmpwi r0, 0x31
/* 8019ADBC 00197DBC  41 81 00 08 */	bgt .L_8019ADC4
/* 8019ADC0 00197DC0  3B C0 00 01 */	li r30, 1
.L_8019ADC4:
/* 8019ADC4 00197DC4  2C 00 00 32 */	cmpwi r0, 0x32
/* 8019ADC8 00197DC8  41 80 00 10 */	blt .L_8019ADD8
/* 8019ADCC 00197DCC  2C 00 00 63 */	cmpwi r0, 0x63
/* 8019ADD0 00197DD0  41 81 00 08 */	bgt .L_8019ADD8
/* 8019ADD4 00197DD4  3B C0 00 02 */	li r30, 2
.L_8019ADD8:
/* 8019ADD8 00197DD8  2C 00 00 64 */	cmpwi r0, 0x64
/* 8019ADDC 00197DDC  41 80 00 10 */	blt .L_8019ADEC
/* 8019ADE0 00197DE0  2C 00 00 95 */	cmpwi r0, 0x95
/* 8019ADE4 00197DE4  41 81 00 08 */	bgt .L_8019ADEC
/* 8019ADE8 00197DE8  3B C0 00 03 */	li r30, 3
.L_8019ADEC:
/* 8019ADEC 00197DEC  2C 00 00 96 */	cmpwi r0, 0x96
/* 8019ADF0 00197DF0  41 80 00 08 */	blt .L_8019ADF8
/* 8019ADF4 00197DF4  3B C0 00 04 */	li r30, 4
.L_8019ADF8:
/* 8019ADF8 00197DF8  7F C3 F3 78 */	mr r3, r30
/* 8019ADFC 00197DFC  7F 84 E3 78 */	mr r4, r28
/* 8019AE00 00197E00  7F A5 EB 78 */	mr r5, r29
/* 8019AE04 00197E04  4B FF FD 7D */	bl BattleAudienceSoundCheerKind
/* 8019AE08 00197E08  BB 81 00 10 */	lmw r28, 0x10(r1)
/* 8019AE0C 00197E0C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019AE10 00197E10  7C 08 03 A6 */	mtlr r0
/* 8019AE14 00197E14  38 21 00 20 */	addi r1, r1, 0x20
/* 8019AE18 00197E18  4E 80 00 20 */	blr 

.global BattleAudienceSoundNoiseAlways
BattleAudienceSoundNoiseAlways:
/* 8019AE1C 00197E1C  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 8019AE20 00197E20  7C 08 02 A6 */	mflr r0
/* 8019AE24 00197E24  3C 60 80 30 */	lis r3, lbl_802F9578@ha
/* 8019AE28 00197E28  90 01 00 64 */	stw r0, 0x64(r1)
/* 8019AE2C 00197E2C  BF 41 00 48 */	stmw r26, 0x48(r1)
/* 8019AE30 00197E30  3B A3 95 78 */	addi r29, r3, lbl_802F9578@l
/* 8019AE34 00197E34  48 00 78 A1 */	bl BattleAudienceBaseGetPtr
/* 8019AE38 00197E38  7C 7E 1B 78 */	mr r30, r3
/* 8019AE3C 00197E3C  38 60 00 02 */	li r3, 2
/* 8019AE40 00197E40  48 00 77 B1 */	bl BattleAudienceSoundGetPtr
/* 8019AE44 00197E44  7C 7F 1B 78 */	mr r31, r3
/* 8019AE48 00197E48  48 00 15 01 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019AE4C 00197E4C  7C 7C 1B 78 */	mr r28, r3
/* 8019AE50 00197E50  48 00 14 D5 */	bl func_8019C324
/* 8019AE54 00197E54  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019AE58 00197E58  7C 7B 1B 78 */	mr r27, r3
/* 8019AE5C 00197E5C  7F 5C DA 14 */	add r26, r28, r27
/* 8019AE60 00197E60  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019AE64 00197E64  40 82 01 08 */	bne .L_8019AF6C
/* 8019AE68 00197E68  2C 1A 00 00 */	cmpwi r26, 0
/* 8019AE6C 00197E6C  40 82 00 0C */	bne .L_8019AE78
/* 8019AE70 00197E70  38 00 00 00 */	li r0, 0
/* 8019AE74 00197E74  98 1F 00 08 */	stb r0, 8(r31)
.L_8019AE78:
/* 8019AE78 00197E78  2C 1A 00 01 */	cmpwi r26, 1
/* 8019AE7C 00197E7C  41 80 00 20 */	blt .L_8019AE9C
/* 8019AE80 00197E80  2C 1A 00 31 */	cmpwi r26, 0x31
/* 8019AE84 00197E84  41 81 00 18 */	bgt .L_8019AE9C
/* 8019AE88 00197E88  38 61 00 08 */	addi r3, r1, 8
/* 8019AE8C 00197E8C  38 9D 06 D4 */	addi r4, r29, 0x6d4
/* 8019AE90 00197E90  48 0C C7 55 */	bl strcpy
/* 8019AE94 00197E94  38 00 00 01 */	li r0, 1
/* 8019AE98 00197E98  98 1F 00 08 */	stb r0, 8(r31)
.L_8019AE9C:
/* 8019AE9C 00197E9C  2C 1A 00 32 */	cmpwi r26, 0x32
/* 8019AEA0 00197EA0  41 80 00 20 */	blt .L_8019AEC0
/* 8019AEA4 00197EA4  2C 1A 00 63 */	cmpwi r26, 0x63
/* 8019AEA8 00197EA8  41 81 00 18 */	bgt .L_8019AEC0
/* 8019AEAC 00197EAC  38 61 00 08 */	addi r3, r1, 8
/* 8019AEB0 00197EB0  38 9D 06 E8 */	addi r4, r29, 0x6e8
/* 8019AEB4 00197EB4  48 0C C7 31 */	bl strcpy
/* 8019AEB8 00197EB8  38 00 00 02 */	li r0, 2
/* 8019AEBC 00197EBC  98 1F 00 08 */	stb r0, 8(r31)
.L_8019AEC0:
/* 8019AEC0 00197EC0  2C 1A 00 64 */	cmpwi r26, 0x64
/* 8019AEC4 00197EC4  41 80 00 20 */	blt .L_8019AEE4
/* 8019AEC8 00197EC8  2C 1A 00 95 */	cmpwi r26, 0x95
/* 8019AECC 00197ECC  41 81 00 18 */	bgt .L_8019AEE4
/* 8019AED0 00197ED0  38 61 00 08 */	addi r3, r1, 8
/* 8019AED4 00197ED4  38 9D 06 FC */	addi r4, r29, 0x6fc
/* 8019AED8 00197ED8  48 0C C7 0D */	bl strcpy
/* 8019AEDC 00197EDC  38 00 00 03 */	li r0, 3
/* 8019AEE0 00197EE0  98 1F 00 08 */	stb r0, 8(r31)
.L_8019AEE4:
/* 8019AEE4 00197EE4  2C 1A 00 96 */	cmpwi r26, 0x96
/* 8019AEE8 00197EE8  41 80 00 18 */	blt .L_8019AF00
/* 8019AEEC 00197EEC  38 61 00 08 */	addi r3, r1, 8
/* 8019AEF0 00197EF0  38 9D 07 10 */	addi r4, r29, 0x710
/* 8019AEF4 00197EF4  48 0C C6 F1 */	bl strcpy
/* 8019AEF8 00197EF8  38 00 00 04 */	li r0, 4
/* 8019AEFC 00197EFC  98 1F 00 08 */	stb r0, 8(r31)
.L_8019AF00:
/* 8019AF00 00197F00  7F 84 E3 78 */	mr r4, r28
/* 8019AF04 00197F04  7F 65 DB 78 */	mr r5, r27
/* 8019AF08 00197F08  38 61 00 08 */	addi r3, r1, 8
/* 8019AF0C 00197F0C  4B FF F0 75 */	bl BattleAudienceSound1
/* 8019AF10 00197F10  90 7F 00 04 */	stw r3, 4(r31)
/* 8019AF14 00197F14  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019AF18 00197F18  2C 00 FF FF */	cmpwi r0, -1
/* 8019AF1C 00197F1C  41 82 00 50 */	beq .L_8019AF6C
/* 8019AF20 00197F20  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019AF24 00197F24  38 60 FF FF */	li r3, -1
/* 8019AF28 00197F28  38 00 00 00 */	li r0, 0
/* 8019AF2C 00197F2C  60 84 00 01 */	ori r4, r4, 1
/* 8019AF30 00197F30  90 9F 00 00 */	stw r4, 0(r31)
/* 8019AF34 00197F34  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019AF38 00197F38  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019AF3C 00197F3C  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019AF40 00197F40  4B F3 A2 1D */	bl psndSFX_get_vol
/* 8019AF44 00197F44  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019AF48 00197F48  38 80 00 00 */	li r4, 0
/* 8019AF4C 00197F4C  38 00 00 64 */	li r0, 0x64
/* 8019AF50 00197F50  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019AF54 00197F54  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019AF58 00197F58  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019AF5C 00197F5C  98 1F 00 1E */	stb r0, 0x1e(r31)
/* 8019AF60 00197F60  80 1E 00 00 */	lwz r0, 0(r30)
/* 8019AF64 00197F64  60 00 20 00 */	ori r0, r0, 0x2000
/* 8019AF68 00197F68  90 1E 00 00 */	stw r0, 0(r30)
.L_8019AF6C:
/* 8019AF6C 00197F6C  BB 41 00 48 */	lmw r26, 0x48(r1)
/* 8019AF70 00197F70  80 01 00 64 */	lwz r0, 0x64(r1)
/* 8019AF74 00197F74  7C 08 03 A6 */	mtlr r0
/* 8019AF78 00197F78  38 21 00 60 */	addi r1, r1, 0x60
/* 8019AF7C 00197F7C  4E 80 00 20 */	blr 

.global BattleAudienceSoundClap
BattleAudienceSoundClap:
/* 8019AF80 00197F80  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 8019AF84 00197F84  7C 08 02 A6 */	mflr r0
/* 8019AF88 00197F88  3C A0 80 30 */	lis r5, lbl_802F9578@ha
/* 8019AF8C 00197F8C  90 01 00 74 */	stw r0, 0x74(r1)
/* 8019AF90 00197F90  BF 21 00 54 */	stmw r25, 0x54(r1)
/* 8019AF94 00197F94  7C 79 1B 78 */	mr r25, r3
/* 8019AF98 00197F98  7C 9A 23 78 */	mr r26, r4
/* 8019AF9C 00197F9C  3B C5 95 78 */	addi r30, r5, lbl_802F9578@l
/* 8019AFA0 00197FA0  48 00 77 35 */	bl BattleAudienceBaseGetPtr
/* 8019AFA4 00197FA4  38 60 00 01 */	li r3, 1
/* 8019AFA8 00197FA8  48 00 76 49 */	bl BattleAudienceSoundGetPtr
/* 8019AFAC 00197FAC  7C 7F 1B 78 */	mr r31, r3
/* 8019AFB0 00197FB0  48 00 13 99 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019AFB4 00197FB4  7C 7D 1B 78 */	mr r29, r3
/* 8019AFB8 00197FB8  48 00 13 6D */	bl func_8019C324
/* 8019AFBC 00197FBC  7C 60 1B 78 */	mr r0, r3
/* 8019AFC0 00197FC0  38 60 00 01 */	li r3, 1
/* 8019AFC4 00197FC4  7C 1C 03 78 */	mr r28, r0
/* 8019AFC8 00197FC8  7F 7D E2 14 */	add r27, r29, r28
/* 8019AFCC 00197FCC  4B FF F0 31 */	bl BattleAudienceSoundStop
/* 8019AFD0 00197FD0  2C 1B 00 01 */	cmpwi r27, 1
/* 8019AFD4 00197FD4  41 80 00 20 */	blt .L_8019AFF4
/* 8019AFD8 00197FD8  2C 1B 00 31 */	cmpwi r27, 0x31
/* 8019AFDC 00197FDC  41 81 00 18 */	bgt .L_8019AFF4
/* 8019AFE0 00197FE0  38 61 00 08 */	addi r3, r1, 8
/* 8019AFE4 00197FE4  38 9E 07 24 */	addi r4, r30, 0x724
/* 8019AFE8 00197FE8  48 0C C5 FD */	bl strcpy
/* 8019AFEC 00197FEC  38 00 00 01 */	li r0, 1
/* 8019AFF0 00197FF0  98 1F 00 08 */	stb r0, 8(r31)
.L_8019AFF4:
/* 8019AFF4 00197FF4  2C 1B 00 32 */	cmpwi r27, 0x32
/* 8019AFF8 00197FF8  41 80 00 20 */	blt .L_8019B018
/* 8019AFFC 00197FFC  2C 1B 00 63 */	cmpwi r27, 0x63
/* 8019B000 00198000  41 81 00 18 */	bgt .L_8019B018
/* 8019B004 00198004  38 61 00 08 */	addi r3, r1, 8
/* 8019B008 00198008  38 9E 07 3C */	addi r4, r30, 0x73c
/* 8019B00C 0019800C  48 0C C5 D9 */	bl strcpy
/* 8019B010 00198010  38 00 00 02 */	li r0, 2
/* 8019B014 00198014  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B018:
/* 8019B018 00198018  2C 1B 00 64 */	cmpwi r27, 0x64
/* 8019B01C 0019801C  41 80 00 20 */	blt .L_8019B03C
/* 8019B020 00198020  2C 1B 00 95 */	cmpwi r27, 0x95
/* 8019B024 00198024  41 81 00 18 */	bgt .L_8019B03C
/* 8019B028 00198028  38 61 00 08 */	addi r3, r1, 8
/* 8019B02C 0019802C  38 9E 07 54 */	addi r4, r30, 0x754
/* 8019B030 00198030  48 0C C5 B5 */	bl strcpy
/* 8019B034 00198034  38 00 00 03 */	li r0, 3
/* 8019B038 00198038  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B03C:
/* 8019B03C 0019803C  2C 1B 00 96 */	cmpwi r27, 0x96
/* 8019B040 00198040  41 80 00 18 */	blt .L_8019B058
/* 8019B044 00198044  38 61 00 08 */	addi r3, r1, 8
/* 8019B048 00198048  38 9E 07 6C */	addi r4, r30, 0x76c
/* 8019B04C 0019804C  48 0C C5 99 */	bl strcpy
/* 8019B050 00198050  38 00 00 04 */	li r0, 4
/* 8019B054 00198054  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B058:
/* 8019B058 00198058  7F A4 EB 78 */	mr r4, r29
/* 8019B05C 0019805C  7F 85 E3 78 */	mr r5, r28
/* 8019B060 00198060  38 61 00 08 */	addi r3, r1, 8
/* 8019B064 00198064  4B FF EF 1D */	bl BattleAudienceSound1
/* 8019B068 00198068  90 7F 00 04 */	stw r3, 4(r31)
/* 8019B06C 0019806C  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019B070 00198070  2C 00 FF FF */	cmpwi r0, -1
/* 8019B074 00198074  41 82 00 40 */	beq .L_8019B0B4
/* 8019B078 00198078  80 7F 00 00 */	lwz r3, 0(r31)
/* 8019B07C 0019807C  7C 19 D2 14 */	add r0, r25, r26
/* 8019B080 00198080  60 63 00 01 */	ori r3, r3, 1
/* 8019B084 00198084  90 7F 00 00 */	stw r3, 0(r31)
/* 8019B088 00198088  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8019B08C 0019808C  93 5F 00 10 */	stw r26, 0x10(r31)
/* 8019B090 00198090  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019B094 00198094  4B F3 A0 C9 */	bl psndSFX_get_vol
/* 8019B098 00198098  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019B09C 0019809C  38 80 00 00 */	li r4, 0
/* 8019B0A0 001980A0  38 00 00 64 */	li r0, 0x64
/* 8019B0A4 001980A4  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019B0A8 001980A8  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019B0AC 001980AC  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019B0B0 001980B0  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019B0B4:
/* 8019B0B4 001980B4  BB 21 00 54 */	lmw r25, 0x54(r1)
/* 8019B0B8 001980B8  80 01 00 74 */	lwz r0, 0x74(r1)
/* 8019B0BC 001980BC  7C 08 03 A6 */	mtlr r0
/* 8019B0C0 001980C0  38 21 00 70 */	addi r1, r1, 0x70
/* 8019B0C4 001980C4  4E 80 00 20 */	blr 

.global BattleAudienceSoundBooingKind
BattleAudienceSoundBooingKind:
/* 8019B0C8 001980C8  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 8019B0CC 001980CC  7C 08 02 A6 */	mflr r0
/* 8019B0D0 001980D0  3C 80 80 30 */	lis r4, lbl_802F9578@ha
/* 8019B0D4 001980D4  90 01 00 64 */	stw r0, 0x64(r1)
/* 8019B0D8 001980D8  BF 61 00 4C */	stmw r27, 0x4c(r1)
/* 8019B0DC 001980DC  7C 7B 1B 78 */	mr r27, r3
/* 8019B0E0 001980E0  3B C4 95 78 */	addi r30, r4, lbl_802F9578@l
/* 8019B0E4 001980E4  48 00 75 F1 */	bl BattleAudienceBaseGetPtr
/* 8019B0E8 001980E8  38 60 00 00 */	li r3, 0
/* 8019B0EC 001980EC  48 00 75 05 */	bl BattleAudienceSoundGetPtr
/* 8019B0F0 001980F0  7C 7F 1B 78 */	mr r31, r3
/* 8019B0F4 001980F4  48 00 12 55 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019B0F8 001980F8  7C 7D 1B 78 */	mr r29, r3
/* 8019B0FC 001980FC  48 00 12 29 */	bl func_8019C324
/* 8019B100 00198100  7C 60 1B 78 */	mr r0, r3
/* 8019B104 00198104  38 60 00 00 */	li r3, 0
/* 8019B108 00198108  7C 1C 03 78 */	mr r28, r0
/* 8019B10C 0019810C  4B FF EE F1 */	bl BattleAudienceSoundStop
/* 8019B110 00198110  2C 1B 00 01 */	cmpwi r27, 1
/* 8019B114 00198114  40 82 00 18 */	bne .L_8019B12C
/* 8019B118 00198118  38 61 00 08 */	addi r3, r1, 8
/* 8019B11C 0019811C  38 9E 07 84 */	addi r4, r30, 0x784
/* 8019B120 00198120  48 0C C4 C5 */	bl strcpy
/* 8019B124 00198124  38 00 00 01 */	li r0, 1
/* 8019B128 00198128  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B12C:
/* 8019B12C 0019812C  2C 1B 00 02 */	cmpwi r27, 2
/* 8019B130 00198130  40 82 00 18 */	bne .L_8019B148
/* 8019B134 00198134  38 61 00 08 */	addi r3, r1, 8
/* 8019B138 00198138  38 9E 07 9C */	addi r4, r30, 0x79c
/* 8019B13C 0019813C  48 0C C4 A9 */	bl strcpy
/* 8019B140 00198140  38 00 00 02 */	li r0, 2
/* 8019B144 00198144  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B148:
/* 8019B148 00198148  2C 1B 00 03 */	cmpwi r27, 3
/* 8019B14C 0019814C  40 82 00 18 */	bne .L_8019B164
/* 8019B150 00198150  38 61 00 08 */	addi r3, r1, 8
/* 8019B154 00198154  38 9E 07 B4 */	addi r4, r30, 0x7b4
/* 8019B158 00198158  48 0C C4 8D */	bl strcpy
/* 8019B15C 0019815C  38 00 00 03 */	li r0, 3
/* 8019B160 00198160  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B164:
/* 8019B164 00198164  2C 1B 00 04 */	cmpwi r27, 4
/* 8019B168 00198168  40 82 00 18 */	bne .L_8019B180
/* 8019B16C 0019816C  38 61 00 08 */	addi r3, r1, 8
/* 8019B170 00198170  38 9E 07 CC */	addi r4, r30, 0x7cc
/* 8019B174 00198174  48 0C C4 71 */	bl strcpy
/* 8019B178 00198178  38 00 00 04 */	li r0, 4
/* 8019B17C 0019817C  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B180:
/* 8019B180 00198180  2C 1B 00 05 */	cmpwi r27, 5
/* 8019B184 00198184  40 82 00 18 */	bne .L_8019B19C
/* 8019B188 00198188  38 61 00 08 */	addi r3, r1, 8
/* 8019B18C 0019818C  38 9E 07 E4 */	addi r4, r30, 0x7e4
/* 8019B190 00198190  48 0C C4 55 */	bl strcpy
/* 8019B194 00198194  38 00 00 05 */	li r0, 5
/* 8019B198 00198198  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B19C:
/* 8019B19C 0019819C  2C 1B 00 06 */	cmpwi r27, 6
/* 8019B1A0 001981A0  40 82 00 18 */	bne .L_8019B1B8
/* 8019B1A4 001981A4  38 61 00 08 */	addi r3, r1, 8
/* 8019B1A8 001981A8  38 9E 07 FC */	addi r4, r30, 0x7fc
/* 8019B1AC 001981AC  48 0C C4 39 */	bl strcpy
/* 8019B1B0 001981B0  38 00 00 06 */	li r0, 6
/* 8019B1B4 001981B4  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B1B8:
/* 8019B1B8 001981B8  2C 1B 00 07 */	cmpwi r27, 7
/* 8019B1BC 001981BC  40 82 00 18 */	bne .L_8019B1D4
/* 8019B1C0 001981C0  38 61 00 08 */	addi r3, r1, 8
/* 8019B1C4 001981C4  38 9E 08 14 */	addi r4, r30, 0x814
/* 8019B1C8 001981C8  48 0C C4 1D */	bl strcpy
/* 8019B1CC 001981CC  38 00 00 07 */	li r0, 7
/* 8019B1D0 001981D0  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B1D4:
/* 8019B1D4 001981D4  2C 1B 00 08 */	cmpwi r27, 8
/* 8019B1D8 001981D8  40 82 00 18 */	bne .L_8019B1F0
/* 8019B1DC 001981DC  38 61 00 08 */	addi r3, r1, 8
/* 8019B1E0 001981E0  38 9E 08 2C */	addi r4, r30, 0x82c
/* 8019B1E4 001981E4  48 0C C4 01 */	bl strcpy
/* 8019B1E8 001981E8  38 00 00 08 */	li r0, 8
/* 8019B1EC 001981EC  98 1F 00 08 */	stb r0, 8(r31)
.L_8019B1F0:
/* 8019B1F0 001981F0  7F A4 EB 78 */	mr r4, r29
/* 8019B1F4 001981F4  7F 85 E3 78 */	mr r5, r28
/* 8019B1F8 001981F8  38 61 00 08 */	addi r3, r1, 8
/* 8019B1FC 001981FC  4B FF ED 85 */	bl BattleAudienceSound1
/* 8019B200 00198200  90 7F 00 04 */	stw r3, 4(r31)
/* 8019B204 00198204  80 1F 00 04 */	lwz r0, 4(r31)
/* 8019B208 00198208  2C 00 FF FF */	cmpwi r0, -1
/* 8019B20C 0019820C  41 82 00 44 */	beq .L_8019B250
/* 8019B210 00198210  80 9F 00 00 */	lwz r4, 0(r31)
/* 8019B214 00198214  38 60 FF FF */	li r3, -1
/* 8019B218 00198218  38 00 00 00 */	li r0, 0
/* 8019B21C 0019821C  60 84 00 01 */	ori r4, r4, 1
/* 8019B220 00198220  90 9F 00 00 */	stw r4, 0(r31)
/* 8019B224 00198224  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8019B228 00198228  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8019B22C 0019822C  80 7F 00 04 */	lwz r3, 4(r31)
/* 8019B230 00198230  4B F3 9F 2D */	bl psndSFX_get_vol
/* 8019B234 00198234  98 7F 00 1D */	stb r3, 0x1d(r31)
/* 8019B238 00198238  38 80 00 00 */	li r4, 0
/* 8019B23C 0019823C  38 00 00 64 */	li r0, 0x64
/* 8019B240 00198240  98 7F 00 1C */	stb r3, 0x1c(r31)
/* 8019B244 00198244  90 9F 00 18 */	stw r4, 0x18(r31)
/* 8019B248 00198248  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8019B24C 0019824C  98 1F 00 1E */	stb r0, 0x1e(r31)
.L_8019B250:
/* 8019B250 00198250  BB 61 00 4C */	lmw r27, 0x4c(r1)
/* 8019B254 00198254  80 01 00 64 */	lwz r0, 0x64(r1)
/* 8019B258 00198258  7C 08 03 A6 */	mtlr r0
/* 8019B25C 0019825C  38 21 00 60 */	addi r1, r1, 0x60
/* 8019B260 00198260  4E 80 00 20 */	blr 

.global BattleAudienceSoundBooing
BattleAudienceSoundBooing:
/* 8019B264 00198264  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B268 00198268  7C 08 02 A6 */	mflr r0
/* 8019B26C 0019826C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B270 00198270  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019B274 00198274  48 00 74 61 */	bl BattleAudienceBaseGetPtr
/* 8019B278 00198278  3B C0 00 00 */	li r30, 0
/* 8019B27C 0019827C  48 00 10 A9 */	bl func_8019C324
/* 8019B280 00198280  7C 7F 1B 78 */	mr r31, r3
/* 8019B284 00198284  48 00 10 C5 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019B288 00198288  7C 03 FA 15 */	add. r0, r3, r31
/* 8019B28C 0019828C  41 80 00 10 */	blt .L_8019B29C
/* 8019B290 00198290  2C 00 00 31 */	cmpwi r0, 0x31
/* 8019B294 00198294  41 81 00 08 */	bgt .L_8019B29C
/* 8019B298 00198298  3B C0 00 01 */	li r30, 1
.L_8019B29C:
/* 8019B29C 0019829C  2C 00 00 32 */	cmpwi r0, 0x32
/* 8019B2A0 001982A0  41 80 00 10 */	blt .L_8019B2B0
/* 8019B2A4 001982A4  2C 00 00 63 */	cmpwi r0, 0x63
/* 8019B2A8 001982A8  41 81 00 08 */	bgt .L_8019B2B0
/* 8019B2AC 001982AC  3B C0 00 02 */	li r30, 2
.L_8019B2B0:
/* 8019B2B0 001982B0  2C 00 00 64 */	cmpwi r0, 0x64
/* 8019B2B4 001982B4  41 80 00 10 */	blt .L_8019B2C4
/* 8019B2B8 001982B8  2C 00 00 95 */	cmpwi r0, 0x95
/* 8019B2BC 001982BC  41 81 00 08 */	bgt .L_8019B2C4
/* 8019B2C0 001982C0  3B C0 00 03 */	li r30, 3
.L_8019B2C4:
/* 8019B2C4 001982C4  2C 00 00 96 */	cmpwi r0, 0x96
/* 8019B2C8 001982C8  41 80 00 08 */	blt .L_8019B2D0
/* 8019B2CC 001982CC  3B C0 00 04 */	li r30, 4
.L_8019B2D0:
/* 8019B2D0 001982D0  7F C3 F3 78 */	mr r3, r30
/* 8019B2D4 001982D4  4B FF FD F5 */	bl BattleAudienceSoundBooingKind
/* 8019B2D8 001982D8  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019B2DC 001982DC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B2E0 001982E0  7C 08 03 A6 */	mtlr r0
/* 8019B2E4 001982E4  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B2E8 001982E8  4E 80 00 20 */	blr 

.global BattleAudienceDetectPakkunEatTarget
BattleAudienceDetectPakkunEatTarget:
/* 8019B2EC 001982EC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B2F0 001982F0  7C 08 02 A6 */	mflr r0
/* 8019B2F4 001982F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B2F8 001982F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019B2FC 001982FC  7C 7F 1B 78 */	mr r31, r3
/* 8019B300 00198300  38 60 00 02 */	li r3, 2
/* 8019B304 00198304  4B E6 AB C1 */	bl irand
/* 8019B308 00198308  2C 03 00 00 */	cmpwi r3, 0
/* 8019B30C 0019830C  40 82 00 18 */	bne .L_8019B324
/* 8019B310 00198310  7F E3 FB 78 */	mr r3, r31
/* 8019B314 00198314  38 80 FF FF */	li r4, -1
/* 8019B318 00198318  38 A0 00 01 */	li r5, 1
/* 8019B31C 0019831C  48 00 00 2D */	bl BattleAudienceDetectPakkunEatTargetSub
/* 8019B320 00198320  48 00 00 14 */	b .L_8019B334
.L_8019B324:
/* 8019B324 00198324  7F E3 FB 78 */	mr r3, r31
/* 8019B328 00198328  38 80 00 01 */	li r4, 1
/* 8019B32C 0019832C  38 A0 FF FF */	li r5, -1
/* 8019B330 00198330  48 00 00 19 */	bl BattleAudienceDetectPakkunEatTargetSub
.L_8019B334:
/* 8019B334 00198334  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B338 00198338  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019B33C 0019833C  7C 08 03 A6 */	mtlr r0
/* 8019B340 00198340  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B344 00198344  4E 80 00 20 */	blr 

.global BattleAudienceDetectPakkunEatTargetSub
BattleAudienceDetectPakkunEatTargetSub:
/* 8019B348 00198348  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B34C 0019834C  7C 08 02 A6 */	mflr r0
/* 8019B350 00198350  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B354 00198354  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019B358 00198358  7C 7F 1B 78 */	mr r31, r3
/* 8019B35C 0019835C  7C BE 2B 78 */	mr r30, r5
/* 8019B360 00198360  48 00 00 51 */	bl BattleAudienceDetectPakkunEatTargetSub2
/* 8019B364 00198364  7C 60 1B 78 */	mr r0, r3
/* 8019B368 00198368  7F E3 FB 78 */	mr r3, r31
/* 8019B36C 0019836C  7C 1F 03 78 */	mr r31, r0
/* 8019B370 00198370  7F C4 F3 78 */	mr r4, r30
/* 8019B374 00198374  48 00 00 3D */	bl BattleAudienceDetectPakkunEatTargetSub2
/* 8019B378 00198378  2C 1F FF FF */	cmpwi r31, -1
/* 8019B37C 0019837C  41 82 00 0C */	beq .L_8019B388
/* 8019B380 00198380  7F E3 FB 78 */	mr r3, r31
/* 8019B384 00198384  48 00 00 18 */	b .L_8019B39C
.L_8019B388:
/* 8019B388 00198388  2C 03 FF FF */	cmpwi r3, -1
/* 8019B38C 0019838C  38 00 FF FF */	li r0, -1
/* 8019B390 00198390  41 82 00 08 */	beq .L_8019B398
/* 8019B394 00198394  7C 60 1B 78 */	mr r0, r3
.L_8019B398:
/* 8019B398 00198398  7C 03 03 78 */	mr r3, r0
.L_8019B39C:
/* 8019B39C 0019839C  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019B3A0 001983A0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B3A4 001983A4  7C 08 03 A6 */	mtlr r0
/* 8019B3A8 001983A8  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B3AC 001983AC  4E 80 00 20 */	blr 

.global BattleAudienceDetectPakkunEatTargetSub2
BattleAudienceDetectPakkunEatTargetSub2:
/* 8019B3B0 001983B0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B3B4 001983B4  7C 08 02 A6 */	mflr r0
/* 8019B3B8 001983B8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B3BC 001983BC  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019B3C0 001983C0  7C 7E 1B 78 */	mr r30, r3
/* 8019B3C4 001983C4  7C 9F 23 78 */	mr r31, r4
/* 8019B3C8 001983C8  48 00 73 0D */	bl BattleAudienceBaseGetPtr
/* 8019B3CC 001983CC  7F C3 F3 78 */	mr r3, r30
/* 8019B3D0 001983D0  7F E4 FB 78 */	mr r4, r31
/* 8019B3D4 001983D4  38 A0 00 00 */	li r5, 0
/* 8019B3D8 001983D8  48 00 13 E5 */	bl BattleAudience_GetAudienceNoFromOffset
/* 8019B3DC 001983DC  7C 7F 1B 78 */	mr r31, r3
/* 8019B3E0 001983E0  2C 1F FF FF */	cmpwi r31, -1
/* 8019B3E4 001983E4  40 82 00 0C */	bne .L_8019B3F0
/* 8019B3E8 001983E8  38 60 FF FF */	li r3, -1
/* 8019B3EC 001983EC  48 00 00 24 */	b .L_8019B410
.L_8019B3F0:
/* 8019B3F0 001983F0  48 00 72 A9 */	bl BattleAudienceGetPtr
/* 8019B3F4 001983F4  7F E3 FB 78 */	mr r3, r31
/* 8019B3F8 001983F8  48 00 15 BD */	bl BattleAudience_GetSysCtrl
/* 8019B3FC 001983FC  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8019B400 00198400  38 60 FF FF */	li r3, -1
/* 8019B404 00198404  28 00 00 01 */	cmplwi r0, 1
/* 8019B408 00198408  40 82 00 08 */	bne .L_8019B410
/* 8019B40C 0019840C  7F E3 FB 78 */	mr r3, r31
.L_8019B410:
/* 8019B410 00198410  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019B414 00198414  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B418 00198418  7C 08 03 A6 */	mtlr r0
/* 8019B41C 0019841C  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B420 00198420  4E 80 00 20 */	blr 

.global BattleAudienceJoy_Sub
BattleAudienceJoy_Sub:
/* 8019B424 00198424  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019B428 00198428  7C 08 02 A6 */	mflr r0
/* 8019B42C 0019842C  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019B430 00198430  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 8019B434 00198434  7C 79 1B 78 */	mr r25, r3
/* 8019B438 00198438  7C 9A 23 78 */	mr r26, r4
/* 8019B43C 0019843C  7C BB 2B 78 */	mr r27, r5
/* 8019B440 00198440  7C DC 33 78 */	mr r28, r6
/* 8019B444 00198444  48 00 72 91 */	bl BattleAudienceBaseGetPtr
/* 8019B448 00198448  7F BA DA 14 */	add r29, r26, r27
/* 8019B44C 0019844C  3B C0 00 00 */	li r30, 0
/* 8019B450 00198450  7F B9 EA 14 */	add r29, r25, r29
/* 8019B454 00198454  38 60 00 00 */	li r3, 0
/* 8019B458 00198458  48 00 72 41 */	bl BattleAudienceGetPtr
/* 8019B45C 0019845C  7C 7F 1B 78 */	mr r31, r3
.L_8019B460:
/* 8019B460 00198460  7F C3 F3 78 */	mr r3, r30
/* 8019B464 00198464  48 00 14 D5 */	bl BattleAudience_GetWaiting
/* 8019B468 00198468  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019B46C 0019846C  41 82 00 AC */	beq .L_8019B518
/* 8019B470 00198470  88 1F 00 1B */	lbz r0, 0x1b(r31)
/* 8019B474 00198474  28 00 00 0B */	cmplwi r0, 0xb
/* 8019B478 00198478  40 82 00 30 */	bne .L_8019B4A8
/* 8019B47C 0019847C  7F C3 F3 78 */	mr r3, r30
/* 8019B480 00198480  38 80 00 04 */	li r4, 4
/* 8019B484 00198484  48 00 15 F5 */	bl BattleAudience_ChangeStatus
/* 8019B488 00198488  2C 1C 00 03 */	cmpwi r28, 3
/* 8019B48C 0019848C  40 82 00 10 */	bne .L_8019B49C
/* 8019B490 00198490  C0 02 D2 DC */	lfs f0, lbl_8041E65C@sda21(r2)
/* 8019B494 00198494  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 8019B498 00198498  48 00 00 80 */	b .L_8019B518
.L_8019B49C:
/* 8019B49C 0019849C  C0 02 D2 E0 */	lfs f0, lbl_8041E660@sda21(r2)
/* 8019B4A0 001984A0  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 8019B4A4 001984A4  48 00 00 74 */	b .L_8019B518
.L_8019B4A8:
/* 8019B4A8 001984A8  7F A3 EB 78 */	mr r3, r29
/* 8019B4AC 001984AC  4B E6 AA 19 */	bl irand
/* 8019B4B0 001984B0  7C 03 C8 00 */	cmpw r3, r25
/* 8019B4B4 001984B4  40 80 00 30 */	bge .L_8019B4E4
/* 8019B4B8 001984B8  7F C3 F3 78 */	mr r3, r30
/* 8019B4BC 001984BC  38 80 00 04 */	li r4, 4
/* 8019B4C0 001984C0  48 00 15 B9 */	bl BattleAudience_ChangeStatus
/* 8019B4C4 001984C4  2C 1C 00 03 */	cmpwi r28, 3
/* 8019B4C8 001984C8  40 82 00 10 */	bne .L_8019B4D8
/* 8019B4CC 001984CC  C0 02 D2 DC */	lfs f0, lbl_8041E65C@sda21(r2)
/* 8019B4D0 001984D0  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 8019B4D4 001984D4  48 00 00 44 */	b .L_8019B518
.L_8019B4D8:
/* 8019B4D8 001984D8  C0 02 D2 E0 */	lfs f0, lbl_8041E660@sda21(r2)
/* 8019B4DC 001984DC  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 8019B4E0 001984E0  48 00 00 38 */	b .L_8019B518
.L_8019B4E4:
/* 8019B4E4 001984E4  7C 19 D2 14 */	add r0, r25, r26
/* 8019B4E8 001984E8  7C 03 00 00 */	cmpw r3, r0
/* 8019B4EC 001984EC  40 80 00 14 */	bge .L_8019B500
/* 8019B4F0 001984F0  7F C3 F3 78 */	mr r3, r30
/* 8019B4F4 001984F4  38 80 00 05 */	li r4, 5
/* 8019B4F8 001984F8  48 00 15 81 */	bl BattleAudience_ChangeStatus
/* 8019B4FC 001984FC  48 00 00 1C */	b .L_8019B518
.L_8019B500:
/* 8019B500 00198500  7C 00 DA 14 */	add r0, r0, r27
/* 8019B504 00198504  7C 03 00 00 */	cmpw r3, r0
/* 8019B508 00198508  40 80 00 10 */	bge .L_8019B518
/* 8019B50C 0019850C  7F C3 F3 78 */	mr r3, r30
/* 8019B510 00198510  38 80 00 06 */	li r4, 6
/* 8019B514 00198514  48 00 15 65 */	bl BattleAudience_ChangeStatus
.L_8019B518:
/* 8019B518 00198518  3B DE 00 01 */	addi r30, r30, 1
/* 8019B51C 0019851C  3B FF 01 34 */	addi r31, r31, 0x134
/* 8019B520 00198520  2C 1E 00 C8 */	cmpwi r30, 0xc8
/* 8019B524 00198524  41 80 FF 3C */	blt .L_8019B460
/* 8019B528 00198528  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 8019B52C 0019852C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019B530 00198530  7C 08 03 A6 */	mtlr r0
/* 8019B534 00198534  38 21 00 30 */	addi r1, r1, 0x30
/* 8019B538 00198538  4E 80 00 20 */	blr 

.global BattleAudienceJoyEnding
BattleAudienceJoyEnding:
/* 8019B53C 0019853C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B540 00198540  7C 08 02 A6 */	mflr r0
/* 8019B544 00198544  38 60 00 03 */	li r3, 3
/* 8019B548 00198548  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B54C 0019854C  48 00 00 45 */	bl BattleAudienceJoy
/* 8019B550 00198550  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B554 00198554  7C 08 03 A6 */	mtlr r0
/* 8019B558 00198558  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B55C 0019855C  4E 80 00 20 */	blr 

.global BattleAudienceJoySACLecture
BattleAudienceJoySACLecture:
/* 8019B560 00198560  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B564 00198564  7C 08 02 A6 */	mflr r0
/* 8019B568 00198568  38 60 00 78 */	li r3, 0x78
/* 8019B56C 0019856C  38 80 00 3C */	li r4, 0x3c
/* 8019B570 00198570  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B574 00198574  4B FF F8 0D */	bl BattleAudienceSoundCheer
/* 8019B578 00198578  38 60 00 02 */	li r3, 2
/* 8019B57C 0019857C  48 00 00 15 */	bl BattleAudienceJoy
/* 8019B580 00198580  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B584 00198584  7C 08 03 A6 */	mtlr r0
/* 8019B588 00198588  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B58C 0019858C  4E 80 00 20 */	blr 

.global BattleAudienceJoy
BattleAudienceJoy:
/* 8019B590 00198590  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B594 00198594  7C 08 02 A6 */	mflr r0
/* 8019B598 00198598  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B59C 0019859C  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019B5A0 001985A0  7C 7E 1B 78 */	mr r30, r3
/* 8019B5A4 001985A4  48 00 71 31 */	bl BattleAudienceBaseGetPtr
/* 8019B5A8 001985A8  2C 1E 00 02 */	cmpwi r30, 2
/* 8019B5AC 001985AC  7C 7F 1B 78 */	mr r31, r3
/* 8019B5B0 001985B0  41 82 00 54 */	beq .L_8019B604
/* 8019B5B4 001985B4  40 80 00 14 */	bge .L_8019B5C8
/* 8019B5B8 001985B8  2C 1E 00 00 */	cmpwi r30, 0
/* 8019B5BC 001985BC  41 82 00 18 */	beq .L_8019B5D4
/* 8019B5C0 001985C0  40 80 00 2C */	bge .L_8019B5EC
/* 8019B5C4 001985C4  48 00 01 3C */	b .L_8019B700
.L_8019B5C8:
/* 8019B5C8 001985C8  2C 1E 00 04 */	cmpwi r30, 4
/* 8019B5CC 001985CC  40 80 01 34 */	bge .L_8019B700
/* 8019B5D0 001985D0  48 00 00 4C */	b .L_8019B61C
.L_8019B5D4:
/* 8019B5D4 001985D4  7F C6 F3 78 */	mr r6, r30
/* 8019B5D8 001985D8  38 60 00 64 */	li r3, 0x64
/* 8019B5DC 001985DC  38 80 00 00 */	li r4, 0
/* 8019B5E0 001985E0  38 A0 00 00 */	li r5, 0
/* 8019B5E4 001985E4  4B FF FE 41 */	bl BattleAudienceJoy_Sub
/* 8019B5E8 001985E8  48 00 01 18 */	b .L_8019B700
.L_8019B5EC:
/* 8019B5EC 001985EC  7F C6 F3 78 */	mr r6, r30
/* 8019B5F0 001985F0  38 60 00 00 */	li r3, 0
/* 8019B5F4 001985F4  38 80 00 64 */	li r4, 0x64
/* 8019B5F8 001985F8  38 A0 00 00 */	li r5, 0
/* 8019B5FC 001985FC  4B FF FE 29 */	bl BattleAudienceJoy_Sub
/* 8019B600 00198600  48 00 01 00 */	b .L_8019B700
.L_8019B604:
/* 8019B604 00198604  7F C6 F3 78 */	mr r6, r30
/* 8019B608 00198608  38 60 00 46 */	li r3, 0x46
/* 8019B60C 0019860C  38 80 00 1E */	li r4, 0x1e
/* 8019B610 00198610  38 A0 00 00 */	li r5, 0
/* 8019B614 00198614  4B FF FE 11 */	bl BattleAudienceJoy_Sub
/* 8019B618 00198618  48 00 00 E8 */	b .L_8019B700
.L_8019B61C:
/* 8019B61C 0019861C  3C 7F 00 01 */	addis r3, r31, 1
/* 8019B620 00198620  80 03 39 0C */	lwz r0, 0x390c(r3)
/* 8019B624 00198624  2C 00 00 02 */	cmpwi r0, 2
/* 8019B628 00198628  41 82 00 58 */	beq .L_8019B680
/* 8019B62C 0019862C  40 80 00 14 */	bge .L_8019B640
/* 8019B630 00198630  2C 00 00 00 */	cmpwi r0, 0
/* 8019B634 00198634  41 82 00 1C */	beq .L_8019B650
/* 8019B638 00198638  40 80 00 30 */	bge .L_8019B668
/* 8019B63C 0019863C  48 00 00 8C */	b .L_8019B6C8
.L_8019B640:
/* 8019B640 00198640  2C 00 00 04 */	cmpwi r0, 4
/* 8019B644 00198644  41 82 00 6C */	beq .L_8019B6B0
/* 8019B648 00198648  40 80 00 80 */	bge .L_8019B6C8
/* 8019B64C 0019864C  48 00 00 4C */	b .L_8019B698
.L_8019B650:
/* 8019B650 00198650  7F C6 F3 78 */	mr r6, r30
/* 8019B654 00198654  38 60 00 32 */	li r3, 0x32
/* 8019B658 00198658  38 80 00 28 */	li r4, 0x28
/* 8019B65C 0019865C  38 A0 00 0A */	li r5, 0xa
/* 8019B660 00198660  4B FF FD C5 */	bl BattleAudienceJoy_Sub
/* 8019B664 00198664  48 00 00 78 */	b .L_8019B6DC
.L_8019B668:
/* 8019B668 00198668  7F C6 F3 78 */	mr r6, r30
/* 8019B66C 0019866C  38 60 00 28 */	li r3, 0x28
/* 8019B670 00198670  38 80 00 28 */	li r4, 0x28
/* 8019B674 00198674  38 A0 00 14 */	li r5, 0x14
/* 8019B678 00198678  4B FF FD AD */	bl BattleAudienceJoy_Sub
/* 8019B67C 0019867C  48 00 00 60 */	b .L_8019B6DC
.L_8019B680:
/* 8019B680 00198680  7F C6 F3 78 */	mr r6, r30
/* 8019B684 00198684  38 60 00 1E */	li r3, 0x1e
/* 8019B688 00198688  38 80 00 28 */	li r4, 0x28
/* 8019B68C 0019868C  38 A0 00 1E */	li r5, 0x1e
/* 8019B690 00198690  4B FF FD 95 */	bl BattleAudienceJoy_Sub
/* 8019B694 00198694  48 00 00 48 */	b .L_8019B6DC
.L_8019B698:
/* 8019B698 00198698  7F C6 F3 78 */	mr r6, r30
/* 8019B69C 0019869C  38 60 00 14 */	li r3, 0x14
/* 8019B6A0 001986A0  38 80 00 28 */	li r4, 0x28
/* 8019B6A4 001986A4  38 A0 00 28 */	li r5, 0x28
/* 8019B6A8 001986A8  4B FF FD 7D */	bl BattleAudienceJoy_Sub
/* 8019B6AC 001986AC  48 00 00 30 */	b .L_8019B6DC
.L_8019B6B0:
/* 8019B6B0 001986B0  7F C6 F3 78 */	mr r6, r30
/* 8019B6B4 001986B4  38 60 00 0A */	li r3, 0xa
/* 8019B6B8 001986B8  38 80 00 28 */	li r4, 0x28
/* 8019B6BC 001986BC  38 A0 00 32 */	li r5, 0x32
/* 8019B6C0 001986C0  4B FF FD 65 */	bl BattleAudienceJoy_Sub
/* 8019B6C4 001986C4  48 00 00 18 */	b .L_8019B6DC
.L_8019B6C8:
/* 8019B6C8 001986C8  7F C6 F3 78 */	mr r6, r30
/* 8019B6CC 001986CC  38 60 00 32 */	li r3, 0x32
/* 8019B6D0 001986D0  38 80 00 28 */	li r4, 0x28
/* 8019B6D4 001986D4  38 A0 00 0A */	li r5, 0xa
/* 8019B6D8 001986D8  4B FF FD 4D */	bl BattleAudienceJoy_Sub
.L_8019B6DC:
/* 8019B6DC 001986DC  3C 9F 00 01 */	addis r4, r31, 1
/* 8019B6E0 001986E0  80 64 39 0C */	lwz r3, 0x390c(r4)
/* 8019B6E4 001986E4  38 03 00 01 */	addi r0, r3, 1
/* 8019B6E8 001986E8  90 04 39 0C */	stw r0, 0x390c(r4)
/* 8019B6EC 001986EC  80 04 39 0C */	lwz r0, 0x390c(r4)
/* 8019B6F0 001986F0  2C 00 00 04 */	cmpwi r0, 4
/* 8019B6F4 001986F4  40 81 00 0C */	ble .L_8019B700
/* 8019B6F8 001986F8  38 00 00 04 */	li r0, 4
/* 8019B6FC 001986FC  90 04 39 0C */	stw r0, 0x390c(r4)
.L_8019B700:
/* 8019B700 00198700  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019B704 00198704  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B708 00198708  7C 08 03 A6 */	mtlr r0
/* 8019B70C 0019870C  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B710 00198710  4E 80 00 20 */	blr 

.global BattleAudienceCheer
BattleAudienceCheer:
/* 8019B714 00198714  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B718 00198718  7C 08 02 A6 */	mflr r0
/* 8019B71C 0019871C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B720 00198720  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019B724 00198724  7C 7E 1B 78 */	mr r30, r3
/* 8019B728 00198728  48 00 6F AD */	bl BattleAudienceBaseGetPtr
/* 8019B72C 0019872C  7C 7F 1B 78 */	mr r31, r3
/* 8019B730 00198730  3C 7F 00 01 */	addis r3, r31, 1
/* 8019B734 00198734  80 03 37 C4 */	lwz r0, 0x37c4(r3)
/* 8019B738 00198738  2C 00 03 20 */	cmpwi r0, 0x320
/* 8019B73C 0019873C  40 81 00 0C */	ble .L_8019B748
/* 8019B740 00198740  38 00 03 20 */	li r0, 0x320
/* 8019B744 00198744  90 03 37 C4 */	stw r0, 0x37c4(r3)
.L_8019B748:
/* 8019B748 00198748  3C 7F 00 01 */	addis r3, r31, 1
/* 8019B74C 0019874C  80 03 37 C4 */	lwz r0, 0x37c4(r3)
/* 8019B750 00198750  2C 00 00 00 */	cmpwi r0, 0
/* 8019B754 00198754  40 81 00 4C */	ble .L_8019B7A0
/* 8019B758 00198758  4B F3 65 1D */	bl func_800D1C74
/* 8019B75C 0019875C  A8 03 00 7C */	lha r0, 0x7c(r3)
/* 8019B760 00198760  2C 00 00 00 */	cmpwi r0, 0
/* 8019B764 00198764  40 82 00 14 */	bne .L_8019B778
/* 8019B768 00198768  3C 7F 00 01 */	addis r3, r31, 1
/* 8019B76C 0019876C  38 00 00 00 */	li r0, 0
/* 8019B770 00198770  90 03 37 C4 */	stw r0, 0x37c4(r3)
/* 8019B774 00198774  48 00 00 10 */	b .L_8019B784
.L_8019B778:
/* 8019B778 00198778  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019B77C 0019877C  60 00 00 02 */	ori r0, r0, 2
/* 8019B780 00198780  90 1F 00 00 */	stw r0, 0(r31)
.L_8019B784:
/* 8019B784 00198784  7F C3 F3 78 */	mr r3, r30
/* 8019B788 00198788  4B FF FE 09 */	bl BattleAudienceJoy
/* 8019B78C 0019878C  3C 7F 00 01 */	addis r3, r31, 1
/* 8019B790 00198790  80 03 37 C4 */	lwz r0, 0x37c4(r3)
/* 8019B794 00198794  2C 00 00 00 */	cmpwi r0, 0
/* 8019B798 00198798  41 82 00 08 */	beq .L_8019B7A0
/* 8019B79C 0019879C  4B F5 6F C1 */	bl BattleStatusWindowAPRecoveryOn
.L_8019B7A0:
/* 8019B7A0 001987A0  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019B7A4 001987A4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B7A8 001987A8  7C 08 03 A6 */	mtlr r0
/* 8019B7AC 001987AC  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B7B0 001987B0  4E 80 00 20 */	blr 

.global BattleAudienceAddPhaseEvtList
BattleAudienceAddPhaseEvtList:
/* 8019B7B4 001987B4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019B7B8 001987B8  7C 08 02 A6 */	mflr r0
/* 8019B7BC 001987BC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019B7C0 001987C0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019B7C4 001987C4  7C 7F 1B 78 */	mr r31, r3
/* 8019B7C8 001987C8  48 00 6F 0D */	bl BattleAudienceBaseGetPtr
/* 8019B7CC 001987CC  3C 83 00 01 */	addis r4, r3, 1
/* 8019B7D0 001987D0  80 C4 39 04 */	lwz r6, 0x3904(r4)
/* 8019B7D4 001987D4  38 80 00 00 */	li r4, 0
/* 8019B7D8 001987D8  7C C9 03 A6 */	mtctr r6
/* 8019B7DC 001987DC  2C 06 00 00 */	cmpwi r6, 0
/* 8019B7E0 001987E0  40 81 00 20 */	ble .L_8019B800
.L_8019B7E4:
/* 8019B7E4 001987E4  3C A4 00 01 */	addis r5, r4, 1
/* 8019B7E8 001987E8  38 A5 38 CC */	addi r5, r5, 0x38cc
/* 8019B7EC 001987EC  7C 03 28 2E */	lwzx r0, r3, r5
/* 8019B7F0 001987F0  7C 00 F8 00 */	cmpw r0, r31
/* 8019B7F4 001987F4  41 82 00 28 */	beq .L_8019B81C
/* 8019B7F8 001987F8  38 84 00 04 */	addi r4, r4, 4
/* 8019B7FC 001987FC  42 00 FF E8 */	bdnz .L_8019B7E4
.L_8019B800:
/* 8019B800 00198800  3C 83 00 01 */	addis r4, r3, 1
/* 8019B804 00198804  54 C0 10 3A */	slwi r0, r6, 2
/* 8019B808 00198808  7C 64 02 14 */	add r3, r4, r0
/* 8019B80C 0019880C  93 E3 38 CC */	stw r31, 0x38cc(r3)
/* 8019B810 00198810  80 64 39 04 */	lwz r3, 0x3904(r4)
/* 8019B814 00198814  38 03 00 01 */	addi r0, r3, 1
/* 8019B818 00198818  90 04 39 04 */	stw r0, 0x3904(r4)
.L_8019B81C:
/* 8019B81C 0019881C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019B820 00198820  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019B824 00198824  7C 08 03 A6 */	mtlr r0
/* 8019B828 00198828  38 21 00 10 */	addi r1, r1, 0x10
/* 8019B82C 0019882C  4E 80 00 20 */	blr 

.global BattleAudienceAddPuni
BattleAudienceAddPuni:
/* 8019B830 00198830  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019B834 00198834  7C 08 02 A6 */	mflr r0
/* 8019B838 00198838  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019B83C 0019883C  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 8019B840 00198840  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 8019B844 00198844  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019B848 00198848  7C 7D 1B 78 */	mr r29, r3
/* 8019B84C 0019884C  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 8019B850 00198850  48 00 6E 85 */	bl BattleAudienceBaseGetPtr
/* 8019B854 00198854  7C 7F 1B 78 */	mr r31, r3
/* 8019B858 00198858  4B F3 64 1D */	bl func_800D1C74
/* 8019B85C 0019885C  A0 03 00 8C */	lhz r0, 0x8c(r3)
/* 8019B860 00198860  28 00 00 00 */	cmplwi r0, 0
/* 8019B864 00198864  41 82 00 6C */	beq .L_8019B8D0
/* 8019B868 00198868  3F FF 00 01 */	addis r31, r31, 1
/* 8019B86C 0019886C  80 1F 37 B0 */	lwz r0, 0x37b0(r31)
/* 8019B870 00198870  2C 00 00 00 */	cmpwi r0, 0
/* 8019B874 00198874  40 81 00 5C */	ble .L_8019B8D0
/* 8019B878 00198878  2C 1D 00 00 */	cmpwi r29, 0
/* 8019B87C 0019887C  40 81 00 54 */	ble .L_8019B8D0
/* 8019B880 00198880  80 1E 0E F4 */	lwz r0, 0xef4(r30)
/* 8019B884 00198884  54 00 05 EF */	rlwinm. r0, r0, 0, 0x17, 0x17
/* 8019B888 00198888  40 82 00 48 */	bne .L_8019B8D0
/* 8019B88C 0019888C  C3 E2 D2 A0 */	lfs f31, lbl_8041E620@sda21(r2)
/* 8019B890 00198890  3B C0 00 00 */	li r30, 0
/* 8019B894 00198894  48 00 00 34 */	b .L_8019B8C8
.L_8019B898:
/* 8019B898 00198898  48 00 0B 9D */	bl BattleAudience_NoUsedFCHaitiRand
/* 8019B89C 0019889C  2C 03 FF FF */	cmpwi r3, -1
/* 8019B8A0 001988A0  41 82 00 30 */	beq .L_8019B8D0
/* 8019B8A4 001988A4  38 80 00 07 */	li r4, 7
/* 8019B8A8 001988A8  38 A0 00 0B */	li r5, 0xb
/* 8019B8AC 001988AC  48 00 1B A9 */	bl BattleAudience_Entry
/* 8019B8B0 001988B0  2C 03 00 01 */	cmpwi r3, 1
/* 8019B8B4 001988B4  40 82 00 10 */	bne .L_8019B8C4
/* 8019B8B8 001988B8  C0 1F 37 80 */	lfs f0, 0x3780(r31)
/* 8019B8BC 001988BC  EC 00 F8 2A */	fadds f0, f0, f31
/* 8019B8C0 001988C0  D0 1F 37 80 */	stfs f0, 0x3780(r31)
.L_8019B8C4:
/* 8019B8C4 001988C4  3B DE 00 01 */	addi r30, r30, 1
.L_8019B8C8:
/* 8019B8C8 001988C8  7C 1E E8 00 */	cmpw r30, r29
/* 8019B8CC 001988CC  41 80 FF CC */	blt .L_8019B898
.L_8019B8D0:
/* 8019B8D0 001988D0  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 8019B8D4 001988D4  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 8019B8D8 001988D8  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019B8DC 001988DC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019B8E0 001988E0  7C 08 03 A6 */	mtlr r0
/* 8019B8E4 001988E4  38 21 00 30 */	addi r1, r1, 0x30
/* 8019B8E8 001988E8  4E 80 00 20 */	blr 

.global BattleAudiencePuniAllEscape
BattleAudiencePuniAllEscape:
/* 8019B8EC 001988EC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019B8F0 001988F0  7C 08 02 A6 */	mflr r0
/* 8019B8F4 001988F4  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019B8F8 001988F8  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 8019B8FC 001988FC  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 8019B900 00198900  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 8019B904 00198904  48 00 6D D1 */	bl BattleAudienceBaseGetPtr
/* 8019B908 00198908  7C 7D 1B 78 */	mr r29, r3
/* 8019B90C 0019890C  C3 E2 D2 A0 */	lfs f31, lbl_8041E620@sda21(r2)
/* 8019B910 00198910  3F FD 00 01 */	addis r31, r29, 1
/* 8019B914 00198914  3B 60 00 00 */	li r27, 0
/* 8019B918 00198918  3B 80 00 00 */	li r28, 0
.L_8019B91C:
/* 8019B91C 0019891C  7F 83 E3 78 */	mr r3, r28
/* 8019B920 00198920  48 00 6D 79 */	bl BattleAudienceGetPtr
/* 8019B924 00198924  7C 7E 1B 78 */	mr r30, r3
/* 8019B928 00198928  7F 83 E3 78 */	mr r3, r28
/* 8019B92C 0019892C  48 00 0F 11 */	bl BattleAudience_GetEscapeChangeOK
/* 8019B930 00198930  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019B934 00198934  41 82 00 2C */	beq .L_8019B960
/* 8019B938 00198938  88 1E 00 1B */	lbz r0, 0x1b(r30)
/* 8019B93C 0019893C  28 00 00 07 */	cmplwi r0, 7
/* 8019B940 00198940  40 82 00 20 */	bne .L_8019B960
/* 8019B944 00198944  7F 83 E3 78 */	mr r3, r28
/* 8019B948 00198948  38 80 00 0C */	li r4, 0xc
/* 8019B94C 0019894C  48 00 11 2D */	bl BattleAudience_ChangeStatus
/* 8019B950 00198950  C0 1F 37 80 */	lfs f0, 0x3780(r31)
/* 8019B954 00198954  3B 7B 00 01 */	addi r27, r27, 1
/* 8019B958 00198958  EC 00 F8 28 */	fsubs f0, f0, f31
/* 8019B95C 0019895C  D0 1F 37 80 */	stfs f0, 0x3780(r31)
.L_8019B960:
/* 8019B960 00198960  3B 9C 00 01 */	addi r28, r28, 1
/* 8019B964 00198964  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 8019B968 00198968  41 80 FF B4 */	blt .L_8019B91C
/* 8019B96C 0019896C  2C 1B 00 01 */	cmpwi r27, 1
/* 8019B970 00198970  41 80 00 10 */	blt .L_8019B980
/* 8019B974 00198974  80 1D 00 00 */	lwz r0, 0(r29)
/* 8019B978 00198978  60 00 80 00 */	ori r0, r0, 0x8000
/* 8019B97C 0019897C  90 1D 00 00 */	stw r0, 0(r29)
.L_8019B980:
/* 8019B980 00198980  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 8019B984 00198984  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 8019B988 00198988  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 8019B98C 0019898C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019B990 00198990  7C 08 03 A6 */	mtlr r0
/* 8019B994 00198994  38 21 00 30 */	addi r1, r1, 0x30
/* 8019B998 00198998  4E 80 00 20 */	blr 

.global BattleAudienceAddAudienceNum
BattleAudienceAddAudienceNum:
/* 8019B99C 0019899C  94 21 FC B0 */	stwu r1, -0x350(r1)
/* 8019B9A0 001989A0  7C 08 02 A6 */	mflr r0
/* 8019B9A4 001989A4  90 01 03 54 */	stw r0, 0x354(r1)
/* 8019B9A8 001989A8  BF 21 03 34 */	stmw r25, 0x334(r1)
/* 8019B9AC 001989AC  7C 7C 1B 78 */	mr r28, r3
/* 8019B9B0 001989B0  83 4D 17 10 */	lwz r26, lbl_80418970@sda21(r13)
/* 8019B9B4 001989B4  48 00 6D 21 */	bl BattleAudienceBaseGetPtr
/* 8019B9B8 001989B8  7C 7B 1B 78 */	mr r27, r3
/* 8019B9BC 001989BC  3B E0 00 00 */	li r31, 0
/* 8019B9C0 001989C0  3B A0 00 00 */	li r29, 0
/* 8019B9C4 001989C4  4B F3 62 B1 */	bl func_800D1C74
/* 8019B9C8 001989C8  A0 03 00 8C */	lhz r0, 0x8c(r3)
/* 8019B9CC 001989CC  28 00 00 00 */	cmplwi r0, 0
/* 8019B9D0 001989D0  40 82 00 0C */	bne .L_8019B9DC
/* 8019B9D4 001989D4  38 60 00 00 */	li r3, 0
/* 8019B9D8 001989D8  48 00 01 74 */	b .L_8019BB4C
.L_8019B9DC:
/* 8019B9DC 001989DC  2C 1C 00 00 */	cmpwi r28, 0
/* 8019B9E0 001989E0  40 82 00 0C */	bne .L_8019B9EC
/* 8019B9E4 001989E4  38 60 00 00 */	li r3, 0
/* 8019B9E8 001989E8  48 00 01 64 */	b .L_8019BB4C
.L_8019B9EC:
/* 8019B9EC 001989EC  80 1A 0E F4 */	lwz r0, 0xef4(r26)
/* 8019B9F0 001989F0  54 00 05 EF */	rlwinm. r0, r0, 0, 0x17, 0x17
/* 8019B9F4 001989F4  41 82 00 0C */	beq .L_8019BA00
/* 8019B9F8 001989F8  38 60 00 00 */	li r3, 0
/* 8019B9FC 001989FC  48 00 01 50 */	b .L_8019BB4C
.L_8019BA00:
/* 8019BA00 00198A00  2C 1C 00 00 */	cmpwi r28, 0
/* 8019BA04 00198A04  40 81 00 BC */	ble .L_8019BAC0
/* 8019BA08 00198A08  38 00 00 0C */	li r0, 0xc
/* 8019BA0C 00198A0C  38 60 00 00 */	li r3, 0
/* 8019BA10 00198A10  7C 09 03 A6 */	mtctr r0
.L_8019BA14:
/* 8019BA14 00198A14  3C 83 00 01 */	addis r4, r3, 1
/* 8019BA18 00198A18  38 63 00 04 */	addi r3, r3, 4
/* 8019BA1C 00198A1C  38 84 37 94 */	addi r4, r4, 0x3794
/* 8019BA20 00198A20  7C 1B 20 2E */	lwzx r0, r27, r4
/* 8019BA24 00198A24  7F FF 02 14 */	add r31, r31, r0
/* 8019BA28 00198A28  42 00 FF EC */	bdnz .L_8019BA14
/* 8019BA2C 00198A2C  3B 40 00 00 */	li r26, 0
/* 8019BA30 00198A30  48 00 00 84 */	b .L_8019BAB4
.L_8019BA34:
/* 8019BA34 00198A34  7F E3 FB 78 */	mr r3, r31
/* 8019BA38 00198A38  3B 20 00 00 */	li r25, 0
/* 8019BA3C 00198A3C  4B E6 A4 89 */	bl irand
/* 8019BA40 00198A40  38 00 00 0C */	li r0, 0xc
/* 8019BA44 00198A44  38 C0 00 00 */	li r6, 0
/* 8019BA48 00198A48  38 80 00 00 */	li r4, 0
/* 8019BA4C 00198A4C  7C 09 03 A6 */	mtctr r0
.L_8019BA50:
/* 8019BA50 00198A50  3C A4 00 01 */	addis r5, r4, 1
/* 8019BA54 00198A54  38 A5 37 94 */	addi r5, r5, 0x3794
/* 8019BA58 00198A58  7C 1B 28 2E */	lwzx r0, r27, r5
/* 8019BA5C 00198A5C  7F 39 02 14 */	add r25, r25, r0
/* 8019BA60 00198A60  7C 03 C8 00 */	cmpw r3, r25
/* 8019BA64 00198A64  40 80 00 0C */	bge .L_8019BA70
/* 8019BA68 00198A68  54 DE 06 3E */	clrlwi r30, r6, 0x18
/* 8019BA6C 00198A6C  48 00 00 10 */	b .L_8019BA7C
.L_8019BA70:
/* 8019BA70 00198A70  38 C6 00 01 */	addi r6, r6, 1
/* 8019BA74 00198A74  38 84 00 04 */	addi r4, r4, 4
/* 8019BA78 00198A78  42 00 FF D8 */	bdnz .L_8019BA50
.L_8019BA7C:
/* 8019BA7C 00198A7C  48 00 09 B9 */	bl BattleAudience_NoUsedFCHaitiRand
/* 8019BA80 00198A80  7C 79 1B 78 */	mr r25, r3
/* 8019BA84 00198A84  2C 19 FF FF */	cmpwi r25, -1
/* 8019BA88 00198A88  41 82 00 C0 */	beq .L_8019BB48
/* 8019BA8C 00198A8C  7F C4 F3 78 */	mr r4, r30
/* 8019BA90 00198A90  38 A0 00 0B */	li r5, 0xb
/* 8019BA94 00198A94  48 00 19 C1 */	bl BattleAudience_Entry
/* 8019BA98 00198A98  2C 03 00 01 */	cmpwi r3, 1
/* 8019BA9C 00198A9C  40 82 00 14 */	bne .L_8019BAB0
/* 8019BAA0 00198AA0  7F 23 CB 78 */	mr r3, r25
/* 8019BAA4 00198AA4  3B BD 00 01 */	addi r29, r29, 1
/* 8019BAA8 00198AA8  48 00 6B F1 */	bl BattleAudienceGetPtr
/* 8019BAAC 00198AAC  93 A3 00 08 */	stw r29, 8(r3)
.L_8019BAB0:
/* 8019BAB0 00198AB0  3B 5A 00 01 */	addi r26, r26, 1
.L_8019BAB4:
/* 8019BAB4 00198AB4  7C 1A E0 00 */	cmpw r26, r28
/* 8019BAB8 00198AB8  41 80 FF 7C */	blt .L_8019BA34
/* 8019BABC 00198ABC  48 00 00 8C */	b .L_8019BB48
.L_8019BAC0:
/* 8019BAC0 00198AC0  3B E1 00 08 */	addi r31, r1, 8
/* 8019BAC4 00198AC4  3B 60 00 00 */	li r27, 0
/* 8019BAC8 00198AC8  48 00 00 78 */	b .L_8019BB40
.L_8019BACC:
/* 8019BACC 00198ACC  3B 20 00 00 */	li r25, 0
/* 8019BAD0 00198AD0  3B C0 00 00 */	li r30, 0
/* 8019BAD4 00198AD4  3B 40 00 00 */	li r26, 0
.L_8019BAD8:
/* 8019BAD8 00198AD8  7F 43 D3 78 */	mr r3, r26
/* 8019BADC 00198ADC  48 00 0D 61 */	bl BattleAudience_GetEscapeChangeOK
/* 8019BAE0 00198AE0  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019BAE4 00198AE4  41 82 00 10 */	beq .L_8019BAF4
/* 8019BAE8 00198AE8  7F 5F F1 2E */	stwx r26, r31, r30
/* 8019BAEC 00198AEC  3B 39 00 01 */	addi r25, r25, 1
/* 8019BAF0 00198AF0  3B DE 00 04 */	addi r30, r30, 4
.L_8019BAF4:
/* 8019BAF4 00198AF4  3B 5A 00 01 */	addi r26, r26, 1
/* 8019BAF8 00198AF8  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 8019BAFC 00198AFC  41 80 FF DC */	blt .L_8019BAD8
/* 8019BB00 00198B00  2C 19 00 01 */	cmpwi r25, 1
/* 8019BB04 00198B04  41 80 00 38 */	blt .L_8019BB3C
/* 8019BB08 00198B08  7F 23 CB 78 */	mr r3, r25
/* 8019BB0C 00198B0C  4B E6 A3 B9 */	bl irand
/* 8019BB10 00198B10  54 60 10 3A */	slwi r0, r3, 2
/* 8019BB14 00198B14  38 61 00 08 */	addi r3, r1, 8
/* 8019BB18 00198B18  7F 43 00 2E */	lwzx r26, r3, r0
/* 8019BB1C 00198B1C  38 80 00 0C */	li r4, 0xc
/* 8019BB20 00198B20  7F 43 D3 78 */	mr r3, r26
/* 8019BB24 00198B24  48 00 0F 55 */	bl BattleAudience_ChangeStatus
/* 8019BB28 00198B28  3B BD FF FF */	addi r29, r29, -1
/* 8019BB2C 00198B2C  7F 43 D3 78 */	mr r3, r26
/* 8019BB30 00198B30  7F DD 00 D0 */	neg r30, r29
/* 8019BB34 00198B34  48 00 6B 65 */	bl BattleAudienceGetPtr
/* 8019BB38 00198B38  93 C3 00 08 */	stw r30, 8(r3)
.L_8019BB3C:
/* 8019BB3C 00198B3C  3B 7B FF FF */	addi r27, r27, -1
.L_8019BB40:
/* 8019BB40 00198B40  7C 1B E0 00 */	cmpw r27, r28
/* 8019BB44 00198B44  41 81 FF 88 */	bgt .L_8019BACC
.L_8019BB48:
/* 8019BB48 00198B48  7F A3 EB 78 */	mr r3, r29
.L_8019BB4C:
/* 8019BB4C 00198B4C  BB 21 03 34 */	lmw r25, 0x334(r1)
/* 8019BB50 00198B50  80 01 03 54 */	lwz r0, 0x354(r1)
/* 8019BB54 00198B54  7C 08 03 A6 */	mtlr r0
/* 8019BB58 00198B58  38 21 03 50 */	addi r1, r1, 0x350
/* 8019BB5C 00198B5C  4E 80 00 20 */	blr 

.global BattleAudienceAddTargetNumSub
BattleAudienceAddTargetNumSub:
/* 8019BB60 00198B60  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019BB64 00198B64  7C 08 02 A6 */	mflr r0
/* 8019BB68 00198B68  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019BB6C 00198B6C  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 8019BB70 00198B70  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 8019BB74 00198B74  DB C1 00 10 */	stfd f30, 0x10(r1)
/* 8019BB78 00198B78  F3 C1 00 18 */	psq_st f30, 24(r1), 0, qr0
/* 8019BB7C 00198B7C  FF C0 08 90 */	fmr f30, f1
/* 8019BB80 00198B80  48 00 6B 55 */	bl BattleAudienceBaseGetPtr
/* 8019BB84 00198B84  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
.L_8019BB88:
/* 8019BB88 00198B88  FC 00 F0 00 */	fcmpu cr0, f0, f30
/* 8019BB8C 00198B8C  41 82 01 5C */	beq .L_8019BCE8
/* 8019BB90 00198B90  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 8019BB94 00198B94  40 81 00 2C */	ble .L_8019BBC0
/* 8019BB98 00198B98  C0 42 D2 A0 */	lfs f2, lbl_8041E620@sda21(r2)
/* 8019BB9C 00198B9C  FC 1E 10 40 */	fcmpo cr0, f30, f2
/* 8019BBA0 00198BA0  40 80 00 08 */	bge .L_8019BBA8
/* 8019BBA4 00198BA4  FC 40 F0 90 */	fmr f2, f30
.L_8019BBA8:
/* 8019BBA8 00198BA8  EF DE 10 28 */	fsubs f30, f30, f2
/* 8019BBAC 00198BAC  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019BBB0 00198BB0  FF E0 10 90 */	fmr f31, f2
/* 8019BBB4 00198BB4  FC 1E 08 40 */	fcmpo cr0, f30, f1
/* 8019BBB8 00198BB8  40 80 00 08 */	bge .L_8019BBC0
/* 8019BBBC 00198BBC  FF C0 08 90 */	fmr f30, f1
.L_8019BBC0:
/* 8019BBC0 00198BC0  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 8019BBC4 00198BC4  40 80 00 2C */	bge .L_8019BBF0
/* 8019BBC8 00198BC8  C0 42 D2 E4 */	lfs f2, lbl_8041E664@sda21(r2)
/* 8019BBCC 00198BCC  FC 1E 10 40 */	fcmpo cr0, f30, f2
/* 8019BBD0 00198BD0  40 81 00 08 */	ble .L_8019BBD8
/* 8019BBD4 00198BD4  FC 40 F0 90 */	fmr f2, f30
.L_8019BBD8:
/* 8019BBD8 00198BD8  EF DE 10 28 */	fsubs f30, f30, f2
/* 8019BBDC 00198BDC  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019BBE0 00198BE0  FF E0 10 90 */	fmr f31, f2
/* 8019BBE4 00198BE4  FC 1E 08 40 */	fcmpo cr0, f30, f1
/* 8019BBE8 00198BE8  40 81 00 08 */	ble .L_8019BBF0
/* 8019BBEC 00198BEC  FF C0 08 90 */	fmr f30, f1
.L_8019BBF0:
/* 8019BBF0 00198BF0  FC 1F 00 40 */	fcmpo cr0, f31, f0
/* 8019BBF4 00198BF4  40 81 00 6C */	ble .L_8019BC60
/* 8019BBF8 00198BF8  3C C3 00 01 */	addis r6, r3, 1
/* 8019BBFC 00198BFC  C0 42 D2 A0 */	lfs f2, lbl_8041E620@sda21(r2)
/* 8019BC00 00198C00  C0 86 37 7C */	lfs f4, 0x377c(r6)
/* 8019BC04 00198C04  C0 66 37 78 */	lfs f3, 0x3778(r6)
/* 8019BC08 00198C08  C0 22 D2 BC */	lfs f1, lbl_8041E63C@sda21(r2)
/* 8019BC0C 00198C0C  EC 64 18 24 */	fdivs f3, f4, f3
/* 8019BC10 00198C10  EC 43 10 28 */	fsubs f2, f3, f2
/* 8019BC14 00198C14  EC 22 08 24 */	fdivs f1, f2, f1
/* 8019BC18 00198C18  FC 20 08 1E */	fctiwz f1, f1
/* 8019BC1C 00198C1C  D8 21 00 08 */	stfd f1, 8(r1)
/* 8019BC20 00198C20  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8019BC24 00198C24  2C 04 00 01 */	cmpwi r4, 1
/* 8019BC28 00198C28  41 80 00 38 */	blt .L_8019BC60
/* 8019BC2C 00198C2C  38 84 00 01 */	addi r4, r4, 1
/* 8019BC30 00198C30  3C 00 43 30 */	lis r0, 0x4330
/* 8019BC34 00198C34  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 8019BC38 00198C38  3C A0 80 30 */	lis r5, lbl_802F9A00@ha
/* 8019BC3C 00198C3C  90 81 00 0C */	stw r4, 0xc(r1)
/* 8019BC40 00198C40  C8 45 9A 00 */	lfd f2, lbl_802F9A00@l(r5)
/* 8019BC44 00198C44  90 01 00 08 */	stw r0, 8(r1)
/* 8019BC48 00198C48  C8 21 00 08 */	lfd f1, 8(r1)
/* 8019BC4C 00198C4C  EC 21 10 28 */	fsubs f1, f1, f2
/* 8019BC50 00198C50  EC 3F 08 24 */	fdivs f1, f31, f1
/* 8019BC54 00198C54  EC 24 08 2A */	fadds f1, f4, f1
/* 8019BC58 00198C58  D0 26 37 7C */	stfs f1, 0x377c(r6)
/* 8019BC5C 00198C5C  4B FF FF 2C */	b .L_8019BB88
.L_8019BC60:
/* 8019BC60 00198C60  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019BC64 00198C64  FC 1F 08 40 */	fcmpo cr0, f31, f1
/* 8019BC68 00198C68  40 80 00 6C */	bge .L_8019BCD4
/* 8019BC6C 00198C6C  3C C3 00 01 */	addis r6, r3, 1
/* 8019BC70 00198C70  C0 42 D2 A0 */	lfs f2, lbl_8041E620@sda21(r2)
/* 8019BC74 00198C74  C0 86 37 7C */	lfs f4, 0x377c(r6)
/* 8019BC78 00198C78  C0 66 37 78 */	lfs f3, 0x3778(r6)
/* 8019BC7C 00198C7C  C0 22 D2 BC */	lfs f1, lbl_8041E63C@sda21(r2)
/* 8019BC80 00198C80  EC 64 18 24 */	fdivs f3, f4, f3
/* 8019BC84 00198C84  EC 43 10 28 */	fsubs f2, f3, f2
/* 8019BC88 00198C88  EC 22 08 24 */	fdivs f1, f2, f1
/* 8019BC8C 00198C8C  FC 20 08 1E */	fctiwz f1, f1
/* 8019BC90 00198C90  D8 21 00 08 */	stfd f1, 8(r1)
/* 8019BC94 00198C94  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8019BC98 00198C98  2C 04 FF FF */	cmpwi r4, -1
/* 8019BC9C 00198C9C  41 81 00 38 */	bgt .L_8019BCD4
/* 8019BCA0 00198CA0  38 84 FF FF */	addi r4, r4, -1
/* 8019BCA4 00198CA4  3C 00 43 30 */	lis r0, 0x4330
/* 8019BCA8 00198CA8  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 8019BCAC 00198CAC  3C A0 80 30 */	lis r5, lbl_802F9A00@ha
/* 8019BCB0 00198CB0  90 81 00 0C */	stw r4, 0xc(r1)
/* 8019BCB4 00198CB4  C8 45 9A 00 */	lfd f2, lbl_802F9A00@l(r5)
/* 8019BCB8 00198CB8  90 01 00 08 */	stw r0, 8(r1)
/* 8019BCBC 00198CBC  C8 21 00 08 */	lfd f1, 8(r1)
/* 8019BCC0 00198CC0  EC 21 10 28 */	fsubs f1, f1, f2
/* 8019BCC4 00198CC4  EC 3F 08 24 */	fdivs f1, f31, f1
/* 8019BCC8 00198CC8  EC 24 08 28 */	fsubs f1, f4, f1
/* 8019BCCC 00198CCC  D0 26 37 7C */	stfs f1, 0x377c(r6)
/* 8019BCD0 00198CD0  4B FF FE B8 */	b .L_8019BB88
.L_8019BCD4:
/* 8019BCD4 00198CD4  3C 83 00 01 */	addis r4, r3, 1
/* 8019BCD8 00198CD8  C0 24 37 7C */	lfs f1, 0x377c(r4)
/* 8019BCDC 00198CDC  EC 21 F8 2A */	fadds f1, f1, f31
/* 8019BCE0 00198CE0  D0 24 37 7C */	stfs f1, 0x377c(r4)
/* 8019BCE4 00198CE4  4B FF FE A4 */	b .L_8019BB88
.L_8019BCE8:
/* 8019BCE8 00198CE8  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 8019BCEC 00198CEC  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 8019BCF0 00198CF0  E3 C1 00 18 */	psq_l f30, 24(r1), 0, qr0
/* 8019BCF4 00198CF4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019BCF8 00198CF8  CB C1 00 10 */	lfd f30, 0x10(r1)
/* 8019BCFC 00198CFC  7C 08 03 A6 */	mtlr r0
/* 8019BD00 00198D00  38 21 00 30 */	addi r1, r1, 0x30
/* 8019BD04 00198D04  4E 80 00 20 */	blr 

.global BattleAudienceAddTargetNum
BattleAudienceAddTargetNum:
/* 8019BD08 00198D08  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8019BD0C 00198D0C  7C 08 02 A6 */	mflr r0
/* 8019BD10 00198D10  90 01 00 44 */	stw r0, 0x44(r1)
/* 8019BD14 00198D14  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 8019BD18 00198D18  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 8019BD1C 00198D1C  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 8019BD20 00198D20  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 8019BD24 00198D24  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8019BD28 00198D28  FF C0 08 90 */	fmr f30, f1
/* 8019BD2C 00198D2C  FF E0 10 90 */	fmr f31, f2
/* 8019BD30 00198D30  48 00 69 A5 */	bl BattleAudienceBaseGetPtr
/* 8019BD34 00198D34  7C 7F 1B 78 */	mr r31, r3
/* 8019BD38 00198D38  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019BD3C 00198D3C  3C 7F 00 01 */	addis r3, r31, 1
/* 8019BD40 00198D40  C0 03 37 80 */	lfs f0, 0x3780(r3)
/* 8019BD44 00198D44  EC 00 F8 2A */	fadds f0, f0, f31
/* 8019BD48 00198D48  D0 03 37 80 */	stfs f0, 0x3780(r3)
/* 8019BD4C 00198D4C  C0 03 37 80 */	lfs f0, 0x3780(r3)
/* 8019BD50 00198D50  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8019BD54 00198D54  40 81 00 34 */	ble .L_8019BD88
/* 8019BD58 00198D58  FC 1E 08 40 */	fcmpo cr0, f30, f1
/* 8019BD5C 00198D5C  40 80 00 2C */	bge .L_8019BD88
/* 8019BD60 00198D60  EC 00 F0 2A */	fadds f0, f0, f30
/* 8019BD64 00198D64  D0 03 37 80 */	stfs f0, 0x3780(r3)
/* 8019BD68 00198D68  C0 03 37 80 */	lfs f0, 0x3780(r3)
/* 8019BD6C 00198D6C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8019BD70 00198D70  40 80 00 10 */	bge .L_8019BD80
/* 8019BD74 00198D74  FF C0 00 90 */	fmr f30, f0
/* 8019BD78 00198D78  D0 23 37 80 */	stfs f1, 0x3780(r3)
/* 8019BD7C 00198D7C  48 00 00 4C */	b .L_8019BDC8
.L_8019BD80:
/* 8019BD80 00198D80  FF C0 08 90 */	fmr f30, f1
/* 8019BD84 00198D84  48 00 00 44 */	b .L_8019BDC8
.L_8019BD88:
/* 8019BD88 00198D88  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019BD8C 00198D8C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8019BD90 00198D90  40 80 00 38 */	bge .L_8019BDC8
/* 8019BD94 00198D94  FC 1E 08 40 */	fcmpo cr0, f30, f1
/* 8019BD98 00198D98  40 81 00 30 */	ble .L_8019BDC8
/* 8019BD9C 00198D9C  3C 7F 00 01 */	addis r3, r31, 1
/* 8019BDA0 00198DA0  C0 03 37 80 */	lfs f0, 0x3780(r3)
/* 8019BDA4 00198DA4  EC 00 F0 2A */	fadds f0, f0, f30
/* 8019BDA8 00198DA8  D0 03 37 80 */	stfs f0, 0x3780(r3)
/* 8019BDAC 00198DAC  C0 03 37 80 */	lfs f0, 0x3780(r3)
/* 8019BDB0 00198DB0  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8019BDB4 00198DB4  40 81 00 10 */	ble .L_8019BDC4
/* 8019BDB8 00198DB8  FF C0 00 90 */	fmr f30, f0
/* 8019BDBC 00198DBC  D0 23 37 80 */	stfs f1, 0x3780(r3)
/* 8019BDC0 00198DC0  48 00 00 08 */	b .L_8019BDC8
.L_8019BDC4:
/* 8019BDC4 00198DC4  FF C0 08 90 */	fmr f30, f1
.L_8019BDC8:
/* 8019BDC8 00198DC8  FC 20 F0 90 */	fmr f1, f30
/* 8019BDCC 00198DCC  4B FF FD 95 */	bl BattleAudienceAddTargetNumSub
/* 8019BDD0 00198DD0  3C 7F 00 01 */	addis r3, r31, 1
/* 8019BDD4 00198DD4  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019BDD8 00198DD8  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 8019BDDC 00198DDC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019BDE0 00198DE0  40 80 00 08 */	bge .L_8019BDE8
/* 8019BDE4 00198DE4  D0 03 37 7C */	stfs f0, 0x377c(r3)
.L_8019BDE8:
/* 8019BDE8 00198DE8  3C BF 00 01 */	addis r5, r31, 1
/* 8019BDEC 00198DEC  3C 00 43 30 */	lis r0, 0x4330
/* 8019BDF0 00198DF0  80 C5 37 90 */	lwz r6, 0x3790(r5)
/* 8019BDF4 00198DF4  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 8019BDF8 00198DF8  38 83 9A 00 */	addi r4, r3, lbl_802F9A00@l
/* 8019BDFC 00198DFC  90 01 00 08 */	stw r0, 8(r1)
/* 8019BE00 00198E00  6C C3 80 00 */	xoris r3, r6, 0x8000
/* 8019BE04 00198E04  C8 24 00 00 */	lfd f1, 0(r4)
/* 8019BE08 00198E08  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019BE0C 00198E0C  C0 45 37 7C */	lfs f2, 0x377c(r5)
/* 8019BE10 00198E10  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019BE14 00198E14  EC 00 08 28 */	fsubs f0, f0, f1
/* 8019BE18 00198E18  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 8019BE1C 00198E1C  40 81 00 18 */	ble .L_8019BE34
/* 8019BE20 00198E20  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019BE24 00198E24  90 01 00 08 */	stw r0, 8(r1)
/* 8019BE28 00198E28  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019BE2C 00198E2C  EC 00 08 28 */	fsubs f0, f0, f1
/* 8019BE30 00198E30  D0 05 37 7C */	stfs f0, 0x377c(r5)
.L_8019BE34:
/* 8019BE34 00198E34  3C 7F 00 01 */	addis r3, r31, 1
/* 8019BE38 00198E38  C0 02 D2 E8 */	lfs f0, lbl_8041E668@sda21(r2)
/* 8019BE3C 00198E3C  C0 23 37 80 */	lfs f1, 0x3780(r3)
/* 8019BE40 00198E40  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019BE44 00198E44  40 80 00 08 */	bge .L_8019BE4C
/* 8019BE48 00198E48  D0 03 37 80 */	stfs f0, 0x3780(r3)
.L_8019BE4C:
/* 8019BE4C 00198E4C  3C 7F 00 01 */	addis r3, r31, 1
/* 8019BE50 00198E50  C0 02 D2 EC */	lfs f0, lbl_8041E66C@sda21(r2)
/* 8019BE54 00198E54  C0 23 37 80 */	lfs f1, 0x3780(r3)
/* 8019BE58 00198E58  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019BE5C 00198E5C  40 81 00 08 */	ble .L_8019BE64
/* 8019BE60 00198E60  D0 03 37 80 */	stfs f0, 0x3780(r3)
.L_8019BE64:
/* 8019BE64 00198E64  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 8019BE68 00198E68  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 8019BE6C 00198E6C  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 8019BE70 00198E70  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 8019BE74 00198E74  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8019BE78 00198E78  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8019BE7C 00198E7C  7C 08 03 A6 */	mtlr r0
/* 8019BE80 00198E80  38 21 00 40 */	addi r1, r1, 0x40
/* 8019BE84 00198E84  4E 80 00 20 */	blr 

.global BattleAudienceNumToTargetSub
BattleAudienceNumToTargetSub:
/* 8019BE88 00198E88  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019BE8C 00198E8C  7C 08 02 A6 */	mflr r0
/* 8019BE90 00198E90  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019BE94 00198E94  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019BE98 00198E98  48 00 68 3D */	bl BattleAudienceBaseGetPtr
/* 8019BE9C 00198E9C  3B C0 00 00 */	li r30, 0
/* 8019BEA0 00198EA0  3B E0 00 00 */	li r31, 0
.L_8019BEA4:
/* 8019BEA4 00198EA4  7F E3 FB 78 */	mr r3, r31
/* 8019BEA8 00198EA8  48 00 0B 6D */	bl BattleAudience_GetExist
/* 8019BEAC 00198EAC  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8019BEB0 00198EB0  28 00 00 01 */	cmplwi r0, 1
/* 8019BEB4 00198EB4  40 82 00 1C */	bne .L_8019BED0
/* 8019BEB8 00198EB8  7F E3 FB 78 */	mr r3, r31
/* 8019BEBC 00198EBC  48 00 67 DD */	bl BattleAudienceGetPtr
/* 8019BEC0 00198EC0  88 03 00 19 */	lbz r0, 0x19(r3)
/* 8019BEC4 00198EC4  28 00 00 0C */	cmplwi r0, 0xc
/* 8019BEC8 00198EC8  41 82 00 08 */	beq .L_8019BED0
/* 8019BECC 00198ECC  3B DE 00 01 */	addi r30, r30, 1
.L_8019BED0:
/* 8019BED0 00198ED0  3B FF 00 01 */	addi r31, r31, 1
/* 8019BED4 00198ED4  2C 1F 00 C8 */	cmpwi r31, 0xc8
/* 8019BED8 00198ED8  41 80 FF CC */	blt .L_8019BEA4
/* 8019BEDC 00198EDC  7F C3 F3 78 */	mr r3, r30
/* 8019BEE0 00198EE0  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019BEE4 00198EE4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019BEE8 00198EE8  7C 08 03 A6 */	mtlr r0
/* 8019BEEC 00198EEC  38 21 00 10 */	addi r1, r1, 0x10
/* 8019BEF0 00198EF0  4E 80 00 20 */	blr 

.global BattleAudienceNumToTarget
BattleAudienceNumToTarget:
/* 8019BEF4 00198EF4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019BEF8 00198EF8  7C 08 02 A6 */	mflr r0
/* 8019BEFC 00198EFC  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019BF00 00198F00  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8019BF04 00198F04  48 00 67 D1 */	bl BattleAudienceBaseGetPtr
/* 8019BF08 00198F08  80 03 00 00 */	lwz r0, 0(r3)
/* 8019BF0C 00198F0C  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 8019BF10 00198F10  40 82 00 4C */	bne .L_8019BF5C
/* 8019BF14 00198F14  3C 83 00 01 */	addis r4, r3, 1
/* 8019BF18 00198F18  C0 24 37 7C */	lfs f1, 0x377c(r4)
/* 8019BF1C 00198F1C  C0 04 37 80 */	lfs f0, 0x3780(r4)
/* 8019BF20 00198F20  EC 01 00 2A */	fadds f0, f1, f0
/* 8019BF24 00198F24  FC 00 00 1E */	fctiwz f0, f0
/* 8019BF28 00198F28  D8 01 00 08 */	stfd f0, 8(r1)
/* 8019BF2C 00198F2C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019BF30 00198F30  2C 1F 00 00 */	cmpwi r31, 0
/* 8019BF34 00198F34  40 80 00 08 */	bge .L_8019BF3C
/* 8019BF38 00198F38  3B E0 00 00 */	li r31, 0
.L_8019BF3C:
/* 8019BF3C 00198F3C  3C 63 00 01 */	addis r3, r3, 1
/* 8019BF40 00198F40  80 03 37 90 */	lwz r0, 0x3790(r3)
/* 8019BF44 00198F44  7C 1F 00 00 */	cmpw r31, r0
/* 8019BF48 00198F48  40 81 00 08 */	ble .L_8019BF50
/* 8019BF4C 00198F4C  7C 1F 03 78 */	mr r31, r0
.L_8019BF50:
/* 8019BF50 00198F50  4B FF FF 39 */	bl BattleAudienceNumToTargetSub
/* 8019BF54 00198F54  7C 63 F8 50 */	subf r3, r3, r31
/* 8019BF58 00198F58  4B FF FA 45 */	bl BattleAudienceAddAudienceNum
.L_8019BF5C:
/* 8019BF5C 00198F5C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019BF60 00198F60  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8019BF64 00198F64  7C 08 03 A6 */	mtlr r0
/* 8019BF68 00198F68  38 21 00 20 */	addi r1, r1, 0x20
/* 8019BF6C 00198F6C  4E 80 00 20 */	blr 

.global BattleAudience_WinSetActive
BattleAudience_WinSetActive:
/* 8019BF70 00198F70  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019BF74 00198F74  7C 08 02 A6 */	mflr r0
/* 8019BF78 00198F78  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019BF7C 00198F7C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019BF80 00198F80  7C 7F 1B 78 */	mr r31, r3
/* 8019BF84 00198F84  48 00 66 AD */	bl BattleAudienceWinGetPtr
/* 8019BF88 00198F88  9B E3 00 00 */	stb r31, 0(r3)
/* 8019BF8C 00198F8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019BF90 00198F90  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019BF94 00198F94  7C 08 03 A6 */	mtlr r0
/* 8019BF98 00198F98  38 21 00 10 */	addi r1, r1, 0x10
/* 8019BF9C 00198F9C  4E 80 00 20 */	blr 

.global BattleAudience_ApRecoveryBuild
BattleAudience_ApRecoveryBuild:
/* 8019BFA0 00198FA0  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 8019BFA4 00198FA4  7C 08 02 A6 */	mflr r0
/* 8019BFA8 00198FA8  90 01 00 94 */	stw r0, 0x94(r1)
/* 8019BFAC 00198FAC  DB E1 00 80 */	stfd f31, 0x80(r1)
/* 8019BFB0 00198FB0  F3 E1 00 88 */	psq_st f31, 136(r1), 0, qr0
/* 8019BFB4 00198FB4  DB C1 00 70 */	stfd f30, 0x70(r1)
/* 8019BFB8 00198FB8  F3 C1 00 78 */	psq_st f30, 120(r1), 0, qr0
/* 8019BFBC 00198FBC  DB A1 00 60 */	stfd f29, 0x60(r1)
/* 8019BFC0 00198FC0  F3 A1 00 68 */	psq_st f29, 104(r1), 0, qr0
/* 8019BFC4 00198FC4  DB 81 00 50 */	stfd f28, 0x50(r1)
/* 8019BFC8 00198FC8  F3 81 00 58 */	psq_st f28, 88(r1), 0, qr0
/* 8019BFCC 00198FCC  DB 61 00 40 */	stfd f27, 0x40(r1)
/* 8019BFD0 00198FD0  F3 61 00 48 */	psq_st f27, 72(r1), 0, qr0
/* 8019BFD4 00198FD4  DB 41 00 30 */	stfd f26, 0x30(r1)
/* 8019BFD8 00198FD8  F3 41 00 38 */	psq_st f26, 56(r1), 0, qr0
/* 8019BFDC 00198FDC  BF 01 00 10 */	stmw r24, 0x10(r1)
/* 8019BFE0 00198FE0  7C 7E 1B 78 */	mr r30, r3
/* 8019BFE4 00198FE4  83 4D 17 10 */	lwz r26, lbl_80418970@sda21(r13)
/* 8019BFE8 00198FE8  48 00 66 ED */	bl BattleAudienceBaseGetPtr
/* 8019BFEC 00198FEC  7C 7F 1B 78 */	mr r31, r3
/* 8019BFF0 00198FF0  3C 7F 00 01 */	addis r3, r31, 1
/* 8019BFF4 00198FF4  80 03 37 C8 */	lwz r0, 0x37c8(r3)
/* 8019BFF8 00198FF8  28 00 00 00 */	cmplwi r0, 0
/* 8019BFFC 00198FFC  40 82 00 14 */	bne .L_8019C010
/* 8019C000 00199000  38 60 00 0C */	li r3, 0xc
/* 8019C004 00199004  4B F5 79 E1 */	bl BattleAlloc
/* 8019C008 00199008  3C 9F 00 01 */	addis r4, r31, 1
/* 8019C00C 0019900C  90 64 37 C8 */	stw r3, 0x37c8(r4)
.L_8019C010:
/* 8019C010 00199010  3C 7F 00 01 */	addis r3, r31, 1
/* 8019C014 00199014  7F C4 F3 78 */	mr r4, r30
/* 8019C018 00199018  80 63 37 C8 */	lwz r3, 0x37c8(r3)
/* 8019C01C 0019901C  38 A0 00 0C */	li r5, 0xc
/* 8019C020 00199020  4B E6 91 7D */	bl func_8000519C
/* 8019C024 00199024  7F 43 D3 78 */	mr r3, r26
/* 8019C028 00199028  4B F5 78 2D */	bl BattleGetMarioPtr
/* 8019C02C 0019902C  7C 79 1B 78 */	mr r25, r3
/* 8019C030 00199030  7F 43 D3 78 */	mr r3, r26
/* 8019C034 00199034  4B F5 77 A1 */	bl BattleGetPartyPtr
/* 8019C038 00199038  3C A0 80 30 */	lis r5, lbl_802F9A00@ha
/* 8019C03C 0019903C  3C 80 80 3B */	lis r4, lbl_803B1924@ha
/* 8019C040 00199040  C3 E2 D2 98 */	lfs f31, lbl_8041E618@sda21(r2)
/* 8019C044 00199044  7C 7A 1B 78 */	mr r26, r3
/* 8019C048 00199048  CB C5 9A 00 */	lfd f30, lbl_802F9A00@l(r5)
/* 8019C04C 0019904C  3B 84 19 24 */	addi r28, r4, lbl_803B1924@l
/* 8019C050 00199050  3B 00 00 00 */	li r24, 0
/* 8019C054 00199054  3B A0 00 00 */	li r29, 0
/* 8019C058 00199058  3F 60 43 30 */	lis r27, 0x4330
.L_8019C05C:
/* 8019C05C 0019905C  7F 03 C3 78 */	mr r3, r24
/* 8019C060 00199060  48 00 03 0D */	bl BattleAudience_GetPPAudienceNumKind
/* 8019C064 00199064  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 8019C068 00199068  7C 7C EA 14 */	add r3, r28, r29
/* 8019C06C 0019906C  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019C070 00199070  3B 18 00 01 */	addi r24, r24, 1
/* 8019C074 00199074  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 8019C078 00199078  2C 18 00 0D */	cmpwi r24, 0xd
/* 8019C07C 0019907C  93 61 00 08 */	stw r27, 8(r1)
/* 8019C080 00199080  3B BD 00 20 */	addi r29, r29, 0x20
/* 8019C084 00199084  C8 21 00 08 */	lfd f1, 8(r1)
/* 8019C088 00199088  EC 21 F0 28 */	fsubs f1, f1, f30
/* 8019C08C 0019908C  EF E0 F8 7A */	fmadds f31, f0, f1, f31
/* 8019C090 00199090  41 80 FF CC */	blt .L_8019C05C
/* 8019C094 00199094  FC 20 F8 90 */	fmr f1, f31
/* 8019C098 00199098  48 0D 08 21 */	bl func_8026C8B8
/* 8019C09C 0019909C  88 9E 00 08 */	lbz r4, 8(r30)
/* 8019C0A0 001990A0  3C 00 43 30 */	lis r0, 0x4330
/* 8019C0A4 001990A4  90 01 00 08 */	stw r0, 8(r1)
/* 8019C0A8 001990A8  3C 60 80 30 */	lis r3, lbl_802F9A08@ha
/* 8019C0AC 001990AC  FF A0 08 18 */	frsp f29, f1
/* 8019C0B0 001990B0  C3 9E 00 04 */	lfs f28, 4(r30)
/* 8019C0B4 001990B4  90 81 00 0C */	stw r4, 0xc(r1)
/* 8019C0B8 001990B8  C3 E2 D2 98 */	lfs f31, lbl_8041E618@sda21(r2)
/* 8019C0BC 001990BC  C8 23 9A 08 */	lfd f1, lbl_802F9A08@l(r3)
/* 8019C0C0 001990C0  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019C0C4 001990C4  FC 1C F8 40 */	fcmpo cr0, f28, f31
/* 8019C0C8 001990C8  EF 60 08 28 */	fsubs f27, f0, f1
/* 8019C0CC 001990CC  40 81 00 0C */	ble .L_8019C0D8
/* 8019C0D0 001990D0  C0 02 D2 A0 */	lfs f0, lbl_8041E620@sda21(r2)
/* 8019C0D4 001990D4  EF FF 00 2A */	fadds f31, f31, f0
.L_8019C0D8:
/* 8019C0D8 001990D8  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019C0DC 001990DC  FC 1B 00 40 */	fcmpo cr0, f27, f0
/* 8019C0E0 001990E0  40 81 00 0C */	ble .L_8019C0EC
/* 8019C0E4 001990E4  C0 02 D2 A0 */	lfs f0, lbl_8041E620@sda21(r2)
/* 8019C0E8 001990E8  EF FF 00 2A */	fadds f31, f31, f0
.L_8019C0EC:
/* 8019C0EC 001990EC  80 79 01 38 */	lwz r3, 0x138(r25)
/* 8019C0F0 001990F0  54 60 00 85 */	rlwinm. r0, r3, 0, 2, 2
/* 8019C0F4 001990F4  41 82 00 0C */	beq .L_8019C100
/* 8019C0F8 001990F8  C3 42 D2 DC */	lfs f26, lbl_8041E65C@sda21(r2)
/* 8019C0FC 001990FC  48 00 00 18 */	b .L_8019C114
.L_8019C100:
/* 8019C100 00199100  54 60 00 C7 */	rlwinm. r0, r3, 0, 3, 3
/* 8019C104 00199104  41 82 00 0C */	beq .L_8019C110
/* 8019C108 00199108  C3 42 D2 E0 */	lfs f26, lbl_8041E660@sda21(r2)
/* 8019C10C 0019910C  48 00 00 08 */	b .L_8019C114
.L_8019C110:
/* 8019C110 00199110  C3 42 D2 A0 */	lfs f26, lbl_8041E620@sda21(r2)
.L_8019C114:
/* 8019C114 00199114  28 1A 00 00 */	cmplwi r26, 0
/* 8019C118 00199118  41 82 00 30 */	beq .L_8019C148
/* 8019C11C 0019911C  80 7A 01 38 */	lwz r3, 0x138(r26)
/* 8019C120 00199120  54 60 00 85 */	rlwinm. r0, r3, 0, 2, 2
/* 8019C124 00199124  41 82 00 0C */	beq .L_8019C130
/* 8019C128 00199128  C3 C2 D2 E0 */	lfs f30, lbl_8041E660@sda21(r2)
/* 8019C12C 0019912C  48 00 00 20 */	b .L_8019C14C
.L_8019C130:
/* 8019C130 00199130  54 60 00 C7 */	rlwinm. r0, r3, 0, 3, 3
/* 8019C134 00199134  41 82 00 0C */	beq .L_8019C140
/* 8019C138 00199138  C3 C2 D2 F0 */	lfs f30, lbl_8041E670@sda21(r2)
/* 8019C13C 0019913C  48 00 00 10 */	b .L_8019C14C
.L_8019C140:
/* 8019C140 00199140  C3 C2 D2 A0 */	lfs f30, lbl_8041E620@sda21(r2)
/* 8019C144 00199144  48 00 00 08 */	b .L_8019C14C
.L_8019C148:
/* 8019C148 00199148  C3 C2 D2 A0 */	lfs f30, lbl_8041E620@sda21(r2)
.L_8019C14C:
/* 8019C14C 0019914C  48 06 2D C1 */	bl BattleBreakSlot_GetBreakTurn
/* 8019C150 00199150  2C 03 00 01 */	cmpwi r3, 1
/* 8019C154 00199154  41 80 00 4C */	blt .L_8019C1A0
/* 8019C158 00199158  48 06 4C 59 */	bl BattleBreakSlotGetPtr
/* 8019C15C 0019915C  C0 22 D2 A0 */	lfs f1, lbl_8041E620@sda21(r2)
/* 8019C160 00199160  3C 9F 00 01 */	addis r4, r31, 1
/* 8019C164 00199164  EC 1C D8 2A */	fadds f0, f28, f27
/* 8019C168 00199168  C0 43 00 14 */	lfs f2, 0x14(r3)
/* 8019C16C 0019916C  EC 21 07 72 */	fmuls f1, f1, f29
/* 8019C170 00199170  80 04 37 C4 */	lwz r0, 0x37c4(r4)
/* 8019C174 00199174  EC 01 00 32 */	fmuls f0, f1, f0
/* 8019C178 00199178  EC 1F 00 32 */	fmuls f0, f31, f0
/* 8019C17C 0019917C  EC 1A 00 32 */	fmuls f0, f26, f0
/* 8019C180 00199180  EC 1E 00 32 */	fmuls f0, f30, f0
/* 8019C184 00199184  EC 00 00 B2 */	fmuls f0, f0, f2
/* 8019C188 00199188  FC 00 00 1E */	fctiwz f0, f0
/* 8019C18C 0019918C  D8 01 00 08 */	stfd f0, 8(r1)
/* 8019C190 00199190  80 61 00 0C */	lwz r3, 0xc(r1)
/* 8019C194 00199194  7C 00 1A 14 */	add r0, r0, r3
/* 8019C198 00199198  90 04 37 C4 */	stw r0, 0x37c4(r4)
/* 8019C19C 0019919C  48 00 00 3C */	b .L_8019C1D8
.L_8019C1A0:
/* 8019C1A0 001991A0  C0 22 D2 A0 */	lfs f1, lbl_8041E620@sda21(r2)
/* 8019C1A4 001991A4  3C 9F 00 01 */	addis r4, r31, 1
/* 8019C1A8 001991A8  EC 1C D8 2A */	fadds f0, f28, f27
/* 8019C1AC 001991AC  80 64 37 C4 */	lwz r3, 0x37c4(r4)
/* 8019C1B0 001991B0  EC 21 07 72 */	fmuls f1, f1, f29
/* 8019C1B4 001991B4  EC 01 00 32 */	fmuls f0, f1, f0
/* 8019C1B8 001991B8  EC 1F 00 32 */	fmuls f0, f31, f0
/* 8019C1BC 001991BC  EC 1A 00 32 */	fmuls f0, f26, f0
/* 8019C1C0 001991C0  EC 1E 00 32 */	fmuls f0, f30, f0
/* 8019C1C4 001991C4  FC 00 00 1E */	fctiwz f0, f0
/* 8019C1C8 001991C8  D8 01 00 08 */	stfd f0, 8(r1)
/* 8019C1CC 001991CC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8019C1D0 001991D0  7C 03 02 14 */	add r0, r3, r0
/* 8019C1D4 001991D4  90 04 37 C4 */	stw r0, 0x37c4(r4)
.L_8019C1D8:
/* 8019C1D8 001991D8  38 60 00 64 */	li r3, 0x64
/* 8019C1DC 001991DC  4B E6 9C E9 */	bl irand
/* 8019C1E0 001991E0  88 1E 00 0A */	lbz r0, 0xa(r30)
/* 8019C1E4 001991E4  7C 03 00 00 */	cmpw r3, r0
/* 8019C1E8 001991E8  40 80 00 08 */	bge .L_8019C1F0
/* 8019C1EC 001991EC  48 06 2E 41 */	bl BattleBreakSlot_PointInc
.L_8019C1F0:
/* 8019C1F0 001991F0  E3 E1 00 88 */	psq_l f31, 136(r1), 0, qr0
/* 8019C1F4 001991F4  CB E1 00 80 */	lfd f31, 0x80(r1)
/* 8019C1F8 001991F8  E3 C1 00 78 */	psq_l f30, 120(r1), 0, qr0
/* 8019C1FC 001991FC  CB C1 00 70 */	lfd f30, 0x70(r1)
/* 8019C200 00199200  E3 A1 00 68 */	psq_l f29, 104(r1), 0, qr0
/* 8019C204 00199204  CB A1 00 60 */	lfd f29, 0x60(r1)
/* 8019C208 00199208  E3 81 00 58 */	psq_l f28, 88(r1), 0, qr0
/* 8019C20C 0019920C  CB 81 00 50 */	lfd f28, 0x50(r1)
/* 8019C210 00199210  E3 61 00 48 */	psq_l f27, 72(r1), 0, qr0
/* 8019C214 00199214  CB 61 00 40 */	lfd f27, 0x40(r1)
/* 8019C218 00199218  E3 41 00 38 */	psq_l f26, 56(r1), 0, qr0
/* 8019C21C 0019921C  CB 41 00 30 */	lfd f26, 0x30(r1)
/* 8019C220 00199220  BB 01 00 10 */	lmw r24, 0x10(r1)
/* 8019C224 00199224  80 01 00 94 */	lwz r0, 0x94(r1)
/* 8019C228 00199228  7C 08 03 A6 */	mtlr r0
/* 8019C22C 0019922C  38 21 00 90 */	addi r1, r1, 0x90
/* 8019C230 00199230  4E 80 00 20 */	blr 

.global BattleAudience_GetPPAudienceNum_Sub
BattleAudience_GetPPAudienceNum_Sub:
/* 8019C234 00199234  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C238 00199238  7C 08 02 A6 */	mflr r0
/* 8019C23C 0019923C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C240 00199240  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019C244 00199244  7C 7E 1B 78 */	mr r30, r3
/* 8019C248 00199248  48 00 64 51 */	bl BattleAudienceGetPtr
/* 8019C24C 0019924C  7C 7F 1B 78 */	mr r31, r3
/* 8019C250 00199250  7F C3 F3 78 */	mr r3, r30
/* 8019C254 00199254  48 00 07 C1 */	bl BattleAudience_GetExist
/* 8019C258 00199258  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019C25C 0019925C  40 82 00 0C */	bne .L_8019C268
/* 8019C260 00199260  38 60 00 00 */	li r3, 0
/* 8019C264 00199264  48 00 00 38 */	b .L_8019C29C
.L_8019C268:
/* 8019C268 00199268  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 8019C26C 0019926C  28 00 00 0D */	cmplwi r0, 0xd
/* 8019C270 00199270  41 80 00 10 */	blt .L_8019C280
/* 8019C274 00199274  41 81 00 0C */	bgt .L_8019C280
/* 8019C278 00199278  38 60 00 00 */	li r3, 0
/* 8019C27C 0019927C  48 00 00 20 */	b .L_8019C29C
.L_8019C280:
/* 8019C280 00199280  28 00 00 11 */	cmplwi r0, 0x11
/* 8019C284 00199284  40 82 00 0C */	bne .L_8019C290
/* 8019C288 00199288  38 60 00 00 */	li r3, 0
/* 8019C28C 0019928C  48 00 00 10 */	b .L_8019C29C
.L_8019C290:
/* 8019C290 00199290  20 60 00 0C */	subfic r3, r0, 0xc
/* 8019C294 00199294  30 03 FF FF */	addic r0, r3, -1
/* 8019C298 00199298  7C 60 19 10 */	subfe r3, r0, r3
.L_8019C29C:
/* 8019C29C 0019929C  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019C2A0 001992A0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C2A4 001992A4  7C 08 03 A6 */	mtlr r0
/* 8019C2A8 001992A8  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C2AC 001992AC  4E 80 00 20 */	blr 

.global BattleAudience_GetPPAudienceNum_RL_Sub
BattleAudience_GetPPAudienceNum_RL_Sub:
/* 8019C2B0 001992B0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019C2B4 001992B4  7C 08 02 A6 */	mflr r0
/* 8019C2B8 001992B8  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019C2BC 001992BC  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 8019C2C0 001992C0  7C 7B 1B 78 */	mr r27, r3
/* 8019C2C4 001992C4  48 00 64 11 */	bl BattleAudienceBaseGetPtr
/* 8019C2C8 001992C8  3B 80 00 00 */	li r28, 0
/* 8019C2CC 001992CC  3B C0 00 00 */	li r30, 0
/* 8019C2D0 001992D0  3B E0 00 00 */	li r31, 0
.L_8019C2D4:
/* 8019C2D4 001992D4  3B A0 00 00 */	li r29, 0
.L_8019C2D8:
/* 8019C2D8 001992D8  7C 7F DA 14 */	add r3, r31, r27
/* 8019C2DC 001992DC  7C 7D 1A 14 */	add r3, r29, r3
/* 8019C2E0 001992E0  4B FF FF 55 */	bl BattleAudience_GetPPAudienceNum_Sub
/* 8019C2E4 001992E4  2C 03 00 01 */	cmpwi r3, 1
/* 8019C2E8 001992E8  40 82 00 08 */	bne .L_8019C2F0
/* 8019C2EC 001992EC  3B 9C 00 01 */	addi r28, r28, 1
.L_8019C2F0:
/* 8019C2F0 001992F0  3B BD 00 01 */	addi r29, r29, 1
/* 8019C2F4 001992F4  2C 1D 00 0A */	cmpwi r29, 0xa
/* 8019C2F8 001992F8  41 80 FF E0 */	blt .L_8019C2D8
/* 8019C2FC 001992FC  3B DE 00 01 */	addi r30, r30, 1
/* 8019C300 00199300  3B FF 00 14 */	addi r31, r31, 0x14
/* 8019C304 00199304  2C 1E 00 0A */	cmpwi r30, 0xa
/* 8019C308 00199308  41 80 FF CC */	blt .L_8019C2D4
/* 8019C30C 0019930C  7F 83 E3 78 */	mr r3, r28
/* 8019C310 00199310  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 8019C314 00199314  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019C318 00199318  7C 08 03 A6 */	mtlr r0
/* 8019C31C 0019931C  38 21 00 20 */	addi r1, r1, 0x20
/* 8019C320 00199320  4E 80 00 20 */	blr 

.global func_8019C324
func_8019C324:

.global BattleAudience_GetPPAudienceNum_L
BattleAudience_GetPPAudienceNum_L:
/* 8019C324 00199324  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C328 00199328  7C 08 02 A6 */	mflr r0
/* 8019C32C 0019932C  38 60 00 00 */	li r3, 0
/* 8019C330 00199330  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C334 00199334  4B FF FF 7D */	bl BattleAudience_GetPPAudienceNum_RL_Sub
/* 8019C338 00199338  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C33C 0019933C  7C 08 03 A6 */	mtlr r0
/* 8019C340 00199340  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C344 00199344  4E 80 00 20 */	blr 

.global BattleAudience_GetPPAudienceNum_R
BattleAudience_GetPPAudienceNum_R:
/* 8019C348 00199348  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C34C 0019934C  7C 08 02 A6 */	mflr r0
/* 8019C350 00199350  38 60 00 0A */	li r3, 0xa
/* 8019C354 00199354  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C358 00199358  4B FF FF 59 */	bl BattleAudience_GetPPAudienceNum_RL_Sub
/* 8019C35C 0019935C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C360 00199360  7C 08 03 A6 */	mtlr r0
/* 8019C364 00199364  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C368 00199368  4E 80 00 20 */	blr 

.global BattleAudience_GetPPAudienceNumKind
BattleAudience_GetPPAudienceNumKind:
/* 8019C36C 0019936C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019C370 00199370  7C 08 02 A6 */	mflr r0
/* 8019C374 00199374  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019C378 00199378  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019C37C 0019937C  7C 7D 1B 78 */	mr r29, r3
/* 8019C380 00199380  48 00 63 55 */	bl BattleAudienceBaseGetPtr
/* 8019C384 00199384  3B C0 00 00 */	li r30, 0
/* 8019C388 00199388  3B E0 00 00 */	li r31, 0
.L_8019C38C:
/* 8019C38C 0019938C  7F E3 FB 78 */	mr r3, r31
/* 8019C390 00199390  4B FF FE A5 */	bl BattleAudience_GetPPAudienceNum_Sub
/* 8019C394 00199394  2C 03 00 00 */	cmpwi r3, 0
/* 8019C398 00199398  41 82 00 1C */	beq .L_8019C3B4
/* 8019C39C 0019939C  7F E3 FB 78 */	mr r3, r31
/* 8019C3A0 001993A0  48 00 62 F9 */	bl BattleAudienceGetPtr
/* 8019C3A4 001993A4  88 03 00 1B */	lbz r0, 0x1b(r3)
/* 8019C3A8 001993A8  7C 1D 00 00 */	cmpw r29, r0
/* 8019C3AC 001993AC  40 82 00 08 */	bne .L_8019C3B4
/* 8019C3B0 001993B0  3B DE 00 01 */	addi r30, r30, 1
.L_8019C3B4:
/* 8019C3B4 001993B4  3B FF 00 01 */	addi r31, r31, 1
/* 8019C3B8 001993B8  2C 1F 00 C8 */	cmpwi r31, 0xc8
/* 8019C3BC 001993BC  41 80 FF D0 */	blt .L_8019C38C
/* 8019C3C0 001993C0  7F C3 F3 78 */	mr r3, r30
/* 8019C3C4 001993C4  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019C3C8 001993C8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019C3CC 001993CC  7C 08 03 A6 */	mtlr r0
/* 8019C3D0 001993D0  38 21 00 20 */	addi r1, r1, 0x20
/* 8019C3D4 001993D4  4E 80 00 20 */	blr 

.global BattleAudience_GetPPAudienceNum
BattleAudience_GetPPAudienceNum:
/* 8019C3D8 001993D8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C3DC 001993DC  7C 08 02 A6 */	mflr r0
/* 8019C3E0 001993E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C3E4 001993E4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019C3E8 001993E8  4B FF FF 3D */	bl func_8019C324
/* 8019C3EC 001993EC  7C 7F 1B 78 */	mr r31, r3
/* 8019C3F0 001993F0  4B FF FF 59 */	bl BattleAudience_GetPPAudienceNum_R
/* 8019C3F4 001993F4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C3F8 001993F8  7C 63 FA 14 */	add r3, r3, r31
/* 8019C3FC 001993FC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019C400 00199400  7C 08 03 A6 */	mtlr r0
/* 8019C404 00199404  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C408 00199408  4E 80 00 20 */	blr 

.global BattleAudience_GetAudienceNum
BattleAudience_GetAudienceNum:
/* 8019C40C 0019940C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C410 00199410  7C 08 02 A6 */	mflr r0
/* 8019C414 00199414  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C418 00199418  48 00 62 BD */	bl BattleAudienceBaseGetPtr
/* 8019C41C 0019941C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C420 00199420  3C 63 00 01 */	addis r3, r3, 1
/* 8019C424 00199424  80 63 37 84 */	lwz r3, 0x3784(r3)
/* 8019C428 00199428  7C 08 03 A6 */	mtlr r0
/* 8019C42C 0019942C  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C430 00199430  4E 80 00 20 */	blr 

.global BattleAudience_NoUsedFCHaitiRand
BattleAudience_NoUsedFCHaitiRand:
/* 8019C434 00199434  94 21 F8 F0 */	stwu r1, -0x710(r1)
/* 8019C438 00199438  7C 08 02 A6 */	mflr r0
/* 8019C43C 0019943C  90 01 07 14 */	stw r0, 0x714(r1)
/* 8019C440 00199440  BE 81 06 E0 */	stmw r20, 0x6e0(r1)
/* 8019C444 00199444  48 00 62 91 */	bl BattleAudienceBaseGetPtr
/* 8019C448 00199448  4B F3 58 2D */	bl func_800D1C74
/* 8019C44C 0019944C  3C 80 80 30 */	lis r4, lbl_802F9884@ha
/* 8019C450 00199450  38 00 00 05 */	li r0, 5
/* 8019C454 00199454  38 84 98 84 */	addi r4, r4, lbl_802F9884@l
/* 8019C458 00199458  38 A1 00 04 */	addi r5, r1, 4
/* 8019C45C 0019945C  38 84 FF FC */	addi r4, r4, -4
/* 8019C460 00199460  A8 C3 00 88 */	lha r6, 0x88(r3)
/* 8019C464 00199464  3B A0 00 00 */	li r29, 0
/* 8019C468 00199468  3A A0 00 00 */	li r21, 0
/* 8019C46C 0019946C  3B 80 00 00 */	li r28, 0
/* 8019C470 00199470  7C 09 03 A6 */	mtctr r0
.L_8019C474:
/* 8019C474 00199474  80 64 00 04 */	lwz r3, 4(r4)
/* 8019C478 00199478  84 04 00 08 */	lwzu r0, 8(r4)
/* 8019C47C 0019947C  90 65 00 04 */	stw r3, 4(r5)
/* 8019C480 00199480  94 05 00 08 */	stwu r0, 8(r5)
/* 8019C484 00199484  42 00 FF F0 */	bdnz .L_8019C474
/* 8019C488 00199488  3C 60 80 30 */	lis r3, lbl_802F98AC@ha
/* 8019C48C 0019948C  38 00 00 0A */	li r0, 0xa
/* 8019C490 00199490  38 63 98 AC */	addi r3, r3, lbl_802F98AC@l
/* 8019C494 00199494  38 A1 00 2C */	addi r5, r1, 0x2c
/* 8019C498 00199498  38 83 FF FC */	addi r4, r3, -4
/* 8019C49C 0019949C  7C 09 03 A6 */	mtctr r0
.L_8019C4A0:
/* 8019C4A0 001994A0  80 64 00 04 */	lwz r3, 4(r4)
/* 8019C4A4 001994A4  84 04 00 08 */	lwzu r0, 8(r4)
/* 8019C4A8 001994A8  90 65 00 04 */	stw r3, 4(r5)
/* 8019C4AC 001994AC  94 05 00 08 */	stwu r0, 8(r5)
/* 8019C4B0 001994B0  42 00 FF F0 */	bdnz .L_8019C4A0
/* 8019C4B4 001994B4  1C 86 00 28 */	mulli r4, r6, 0x28
/* 8019C4B8 001994B8  3C 60 80 3A */	lis r3, lbl_80399C80@ha
/* 8019C4BC 001994BC  3B E1 00 08 */	addi r31, r1, 8
/* 8019C4C0 001994C0  38 03 9C 80 */	addi r0, r3, lbl_80399C80@l
/* 8019C4C4 001994C4  7F C0 22 14 */	add r30, r0, r4
/* 8019C4C8 001994C8  3B 60 00 00 */	li r27, 0
/* 8019C4CC 001994CC  3A E0 00 00 */	li r23, 0
/* 8019C4D0 001994D0  3A C0 00 00 */	li r22, 0
.L_8019C4D4:
/* 8019C4D4 001994D4  7C 1E B0 2E */	lwzx r0, r30, r22
/* 8019C4D8 001994D8  3B 40 00 00 */	li r26, 0
/* 8019C4DC 001994DC  20 00 00 14 */	subfic r0, r0, 0x14
/* 8019C4E0 001994E0  7C 00 0E 70 */	srawi r0, r0, 1
/* 8019C4E4 001994E4  7F 20 01 94 */	addze r25, r0
/* 8019C4E8 001994E8  57 34 10 3A */	slwi r20, r25, 2
/* 8019C4EC 001994EC  48 00 00 8C */	b .L_8019C578
.L_8019C4F0:
/* 8019C4F0 001994F0  7F 19 BA 14 */	add r24, r25, r23
/* 8019C4F4 001994F4  7F 03 C3 78 */	mr r3, r24
/* 8019C4F8 001994F8  48 00 61 A1 */	bl BattleAudienceGetPtr
/* 8019C4FC 001994FC  80 03 00 00 */	lwz r0, 0(r3)
/* 8019C500 00199500  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019C504 00199504  40 82 00 68 */	bne .L_8019C56C
/* 8019C508 00199508  7F 03 C3 78 */	mr r3, r24
/* 8019C50C 0019950C  48 00 61 8D */	bl BattleAudienceGetPtr
/* 8019C510 00199510  80 03 00 00 */	lwz r0, 0(r3)
/* 8019C514 00199514  54 00 05 EF */	rlwinm. r0, r0, 0, 0x17, 0x17
/* 8019C518 00199518  40 82 00 54 */	bne .L_8019C56C
/* 8019C51C 0019951C  38 81 00 30 */	addi r4, r1, 0x30
/* 8019C520 00199520  38 61 03 A0 */	addi r3, r1, 0x3a0
/* 8019C524 00199524  7C BF B0 2E */	lwzx r5, r31, r22
/* 8019C528 00199528  2C 1D 00 00 */	cmpwi r29, 0
/* 8019C52C 0019952C  7C 04 A0 2E */	lwzx r0, r4, r20
/* 8019C530 00199530  7F 03 A9 2E */	stwx r24, r3, r21
/* 8019C534 00199534  7C 65 01 D6 */	mullw r3, r5, r0
/* 8019C538 00199538  38 83 00 01 */	addi r4, r3, 1
/* 8019C53C 0019953C  41 82 00 1C */	beq .L_8019C558
/* 8019C540 00199540  38 61 00 80 */	addi r3, r1, 0x80
/* 8019C544 00199544  7C 63 AA 14 */	add r3, r3, r21
/* 8019C548 00199548  80 03 FF FC */	lwz r0, -4(r3)
/* 8019C54C 0019954C  7C 04 02 14 */	add r0, r4, r0
/* 8019C550 00199550  90 03 00 00 */	stw r0, 0(r3)
/* 8019C554 00199554  48 00 00 0C */	b .L_8019C560
.L_8019C558:
/* 8019C558 00199558  38 61 00 80 */	addi r3, r1, 0x80
/* 8019C55C 0019955C  7C 83 A9 2E */	stwx r4, r3, r21
.L_8019C560:
/* 8019C560 00199560  7F 9C 22 14 */	add r28, r28, r4
/* 8019C564 00199564  3B BD 00 01 */	addi r29, r29, 1
/* 8019C568 00199568  3A B5 00 04 */	addi r21, r21, 4
.L_8019C56C:
/* 8019C56C 0019956C  3B 5A 00 01 */	addi r26, r26, 1
/* 8019C570 00199570  3B 39 00 01 */	addi r25, r25, 1
/* 8019C574 00199574  3A 94 00 04 */	addi r20, r20, 4
.L_8019C578:
/* 8019C578 00199578  7C 1E B0 2E */	lwzx r0, r30, r22
/* 8019C57C 0019957C  7C 1A 00 00 */	cmpw r26, r0
/* 8019C580 00199580  41 80 FF 70 */	blt .L_8019C4F0
/* 8019C584 00199584  3B 7B 00 01 */	addi r27, r27, 1
/* 8019C588 00199588  3A D6 00 04 */	addi r22, r22, 4
/* 8019C58C 0019958C  2C 1B 00 0A */	cmpwi r27, 0xa
/* 8019C590 00199590  3A F7 00 14 */	addi r23, r23, 0x14
/* 8019C594 00199594  41 80 FF 40 */	blt .L_8019C4D4
/* 8019C598 00199598  48 0C 9D DD */	bl rand
/* 8019C59C 0019959C  3C A0 43 30 */	lis r5, 0x4330
/* 8019C5A0 001995A0  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019C5A4 001995A4  90 61 06 C4 */	stw r3, 0x6c4(r1)
/* 8019C5A8 001995A8  6F 80 80 00 */	xoris r0, r28, 0x8000
/* 8019C5AC 001995AC  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019C5B0 001995B0  C0 02 D2 F4 */	lfs f0, lbl_8041E674@sda21(r2)
/* 8019C5B4 001995B4  90 A1 06 C0 */	stw r5, 0x6c0(r1)
/* 8019C5B8 001995B8  38 60 00 00 */	li r3, 0
/* 8019C5BC 001995BC  C8 64 9A 00 */	lfd f3, lbl_802F9A00@l(r4)
/* 8019C5C0 001995C0  38 81 00 80 */	addi r4, r1, 0x80
/* 8019C5C4 001995C4  C8 21 06 C0 */	lfd f1, 0x6c0(r1)
/* 8019C5C8 001995C8  90 01 06 CC */	stw r0, 0x6cc(r1)
/* 8019C5CC 001995CC  EC 41 18 28 */	fsubs f2, f1, f3
/* 8019C5D0 001995D0  90 A1 06 C8 */	stw r5, 0x6c8(r1)
/* 8019C5D4 001995D4  C8 21 06 C8 */	lfd f1, 0x6c8(r1)
/* 8019C5D8 001995D8  EC 21 18 28 */	fsubs f1, f1, f3
/* 8019C5DC 001995DC  EC 21 00 B2 */	fmuls f1, f1, f2
/* 8019C5E0 001995E0  EC 01 00 24 */	fdivs f0, f1, f0
/* 8019C5E4 001995E4  FC 00 00 1E */	fctiwz f0, f0
/* 8019C5E8 001995E8  D8 01 06 D0 */	stfd f0, 0x6d0(r1)
/* 8019C5EC 001995EC  80 A1 06 D4 */	lwz r5, 0x6d4(r1)
/* 8019C5F0 001995F0  7F A9 03 A6 */	mtctr r29
/* 8019C5F4 001995F4  2C 1D 00 00 */	cmpwi r29, 0
/* 8019C5F8 001995F8  40 81 00 24 */	ble .L_8019C61C
.L_8019C5FC:
/* 8019C5FC 001995FC  7C 04 18 2E */	lwzx r0, r4, r3
/* 8019C600 00199600  7C 05 00 00 */	cmpw r5, r0
/* 8019C604 00199604  40 80 00 10 */	bge .L_8019C614
/* 8019C608 00199608  38 81 03 A0 */	addi r4, r1, 0x3a0
/* 8019C60C 0019960C  7C 64 18 2E */	lwzx r3, r4, r3
/* 8019C610 00199610  48 00 00 10 */	b .L_8019C620
.L_8019C614:
/* 8019C614 00199614  38 63 00 04 */	addi r3, r3, 4
/* 8019C618 00199618  42 00 FF E4 */	bdnz .L_8019C5FC
.L_8019C61C:
/* 8019C61C 0019961C  38 60 FF FF */	li r3, -1
.L_8019C620:
/* 8019C620 00199620  BA 81 06 E0 */	lmw r20, 0x6e0(r1)
/* 8019C624 00199624  80 01 07 14 */	lwz r0, 0x714(r1)
/* 8019C628 00199628  7C 08 03 A6 */	mtlr r0
/* 8019C62C 0019962C  38 21 07 10 */	addi r1, r1, 0x710
/* 8019C630 00199630  4E 80 00 20 */	blr 

.global BattleAudience_NoUsedHaitiRand
BattleAudience_NoUsedHaitiRand:
/* 8019C634 00199634  94 21 FC B0 */	stwu r1, -0x350(r1)
/* 8019C638 00199638  7C 08 02 A6 */	mflr r0
/* 8019C63C 0019963C  90 01 03 54 */	stw r0, 0x354(r1)
/* 8019C640 00199640  BE C1 03 28 */	stmw r22, 0x328(r1)
/* 8019C644 00199644  48 00 60 91 */	bl BattleAudienceBaseGetPtr
/* 8019C648 00199648  4B F3 56 2D */	bl func_800D1C74
/* 8019C64C 0019964C  A8 83 00 88 */	lha r4, 0x88(r3)
/* 8019C650 00199650  3C 60 80 3A */	lis r3, lbl_80399C80@ha
/* 8019C654 00199654  38 03 9C 80 */	addi r0, r3, lbl_80399C80@l
/* 8019C658 00199658  3B 41 00 08 */	addi r26, r1, 8
/* 8019C65C 0019965C  1C 64 00 28 */	mulli r3, r4, 0x28
/* 8019C660 00199660  3B E0 00 00 */	li r31, 0
/* 8019C664 00199664  3B 60 00 00 */	li r27, 0
/* 8019C668 00199668  3B C0 00 00 */	li r30, 0
/* 8019C66C 0019966C  7F 20 1A 14 */	add r25, r0, r3
/* 8019C670 00199670  3B A0 00 00 */	li r29, 0
/* 8019C674 00199674  3B 80 00 00 */	li r28, 0
.L_8019C678:
/* 8019C678 00199678  7C 19 E0 2E */	lwzx r0, r25, r28
/* 8019C67C 0019967C  3A E0 00 00 */	li r23, 0
/* 8019C680 00199680  20 00 00 14 */	subfic r0, r0, 0x14
/* 8019C684 00199684  7C 00 0E 70 */	srawi r0, r0, 1
/* 8019C688 00199688  7E C0 01 94 */	addze r22, r0
/* 8019C68C 0019968C  48 00 00 44 */	b .L_8019C6D0
.L_8019C690:
/* 8019C690 00199690  7F 16 EA 14 */	add r24, r22, r29
/* 8019C694 00199694  7F 03 C3 78 */	mr r3, r24
/* 8019C698 00199698  48 00 60 01 */	bl BattleAudienceGetPtr
/* 8019C69C 0019969C  80 03 00 00 */	lwz r0, 0(r3)
/* 8019C6A0 001996A0  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019C6A4 001996A4  40 82 00 24 */	bne .L_8019C6C8
/* 8019C6A8 001996A8  7F 03 C3 78 */	mr r3, r24
/* 8019C6AC 001996AC  48 00 5F ED */	bl BattleAudienceGetPtr
/* 8019C6B0 001996B0  80 03 00 00 */	lwz r0, 0(r3)
/* 8019C6B4 001996B4  54 00 05 EF */	rlwinm. r0, r0, 0, 0x17, 0x17
/* 8019C6B8 001996B8  40 82 00 10 */	bne .L_8019C6C8
/* 8019C6BC 001996BC  7F 1A D9 2E */	stwx r24, r26, r27
/* 8019C6C0 001996C0  3B FF 00 01 */	addi r31, r31, 1
/* 8019C6C4 001996C4  3B 7B 00 04 */	addi r27, r27, 4
.L_8019C6C8:
/* 8019C6C8 001996C8  3A F7 00 01 */	addi r23, r23, 1
/* 8019C6CC 001996CC  3A D6 00 01 */	addi r22, r22, 1
.L_8019C6D0:
/* 8019C6D0 001996D0  7C 19 E0 2E */	lwzx r0, r25, r28
/* 8019C6D4 001996D4  7C 17 00 00 */	cmpw r23, r0
/* 8019C6D8 001996D8  41 80 FF B8 */	blt .L_8019C690
/* 8019C6DC 001996DC  3B DE 00 01 */	addi r30, r30, 1
/* 8019C6E0 001996E0  3B 9C 00 04 */	addi r28, r28, 4
/* 8019C6E4 001996E4  2C 1E 00 0A */	cmpwi r30, 0xa
/* 8019C6E8 001996E8  3B BD 00 14 */	addi r29, r29, 0x14
/* 8019C6EC 001996EC  41 80 FF 8C */	blt .L_8019C678
/* 8019C6F0 001996F0  2C 1F 00 01 */	cmpwi r31, 1
/* 8019C6F4 001996F4  41 80 00 1C */	blt .L_8019C710
/* 8019C6F8 001996F8  7F E3 FB 78 */	mr r3, r31
/* 8019C6FC 001996FC  4B E6 97 C9 */	bl irand
/* 8019C700 00199700  54 60 10 3A */	slwi r0, r3, 2
/* 8019C704 00199704  38 61 00 08 */	addi r3, r1, 8
/* 8019C708 00199708  7C 63 00 2E */	lwzx r3, r3, r0
/* 8019C70C 0019970C  48 00 00 08 */	b .L_8019C714
.L_8019C710:
/* 8019C710 00199710  38 60 FF FF */	li r3, -1
.L_8019C714:
/* 8019C714 00199714  BA C1 03 28 */	lmw r22, 0x328(r1)
/* 8019C718 00199718  80 01 03 54 */	lwz r0, 0x354(r1)
/* 8019C71C 0019971C  7C 08 03 A6 */	mtlr r0
/* 8019C720 00199720  38 21 03 50 */	addi r1, r1, 0x350
/* 8019C724 00199724  4E 80 00 20 */	blr 

.global BattleAudience_HaitiRandForFallObject
BattleAudience_HaitiRandForFallObject:
/* 8019C728 00199728  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C72C 0019972C  7C 08 02 A6 */	mflr r0
/* 8019C730 00199730  38 60 00 03 */	li r3, 3
/* 8019C734 00199734  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C738 00199738  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019C73C 0019973C  4B E6 97 89 */	bl irand
/* 8019C740 00199740  7C 7F 1B 78 */	mr r31, r3
/* 8019C744 00199744  3B C0 00 0A */	li r30, 0xa
/* 8019C748 00199748  38 60 00 0C */	li r3, 0xc
/* 8019C74C 0019974C  4B E6 97 79 */	bl irand
/* 8019C750 00199750  2C 1F 00 01 */	cmpwi r31, 1
/* 8019C754 00199754  41 82 00 30 */	beq .L_8019C784
/* 8019C758 00199758  40 80 00 10 */	bge .L_8019C768
/* 8019C75C 0019975C  2C 1F 00 00 */	cmpwi r31, 0
/* 8019C760 00199760  40 80 00 14 */	bge .L_8019C774
/* 8019C764 00199764  48 00 00 3C */	b .L_8019C7A0
.L_8019C768:
/* 8019C768 00199768  2C 1F 00 03 */	cmpwi r31, 3
/* 8019C76C 0019976C  40 80 00 34 */	bge .L_8019C7A0
/* 8019C770 00199770  48 00 00 24 */	b .L_8019C794
.L_8019C774:
/* 8019C774 00199774  38 60 00 0C */	li r3, 0xc
/* 8019C778 00199778  4B E6 97 4D */	bl irand
/* 8019C77C 0019977C  3B C3 00 04 */	addi r30, r3, 4
/* 8019C780 00199780  48 00 00 20 */	b .L_8019C7A0
.L_8019C784:
/* 8019C784 00199784  38 60 00 0A */	li r3, 0xa
/* 8019C788 00199788  4B E6 97 3D */	bl irand
/* 8019C78C 0019978C  3B C3 00 05 */	addi r30, r3, 5
/* 8019C790 00199790  48 00 00 10 */	b .L_8019C7A0
.L_8019C794:
/* 8019C794 00199794  38 60 00 08 */	li r3, 8
/* 8019C798 00199798  4B E6 97 2D */	bl irand
/* 8019C79C 0019979C  3B C3 00 06 */	addi r30, r3, 6
.L_8019C7A0:
/* 8019C7A0 001997A0  1C 1F 00 14 */	mulli r0, r31, 0x14
/* 8019C7A4 001997A4  7C 7E 02 14 */	add r3, r30, r0
/* 8019C7A8 001997A8  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019C7AC 001997AC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C7B0 001997B0  7C 08 03 A6 */	mtlr r0
/* 8019C7B4 001997B4  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C7B8 001997B8  4E 80 00 20 */	blr 

.global BattleAudience_GetAudienceNoFromOffset
BattleAudience_GetAudienceNoFromOffset:
/* 8019C7BC 001997BC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019C7C0 001997C0  7C 08 02 A6 */	mflr r0
/* 8019C7C4 001997C4  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019C7C8 001997C8  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019C7CC 001997CC  7C 7D 1B 78 */	mr r29, r3
/* 8019C7D0 001997D0  7C 9E 23 78 */	mr r30, r4
/* 8019C7D4 001997D4  7C BF 2B 78 */	mr r31, r5
/* 8019C7D8 001997D8  48 00 5E FD */	bl BattleAudienceBaseGetPtr
/* 8019C7DC 001997DC  7F A3 EB 78 */	mr r3, r29
/* 8019C7E0 001997E0  48 00 5E B9 */	bl BattleAudienceGetPtr
/* 8019C7E4 001997E4  38 60 00 14 */	li r3, 0x14
/* 8019C7E8 001997E8  7C 1D 1B D6 */	divw r0, r29, r3
/* 8019C7EC 001997EC  7C 00 19 D6 */	mullw r0, r0, r3
/* 8019C7F0 001997F0  7C 00 E8 50 */	subf r0, r0, r29
/* 8019C7F4 001997F4  7C 00 F2 15 */	add. r0, r0, r30
/* 8019C7F8 001997F8  41 80 00 0C */	blt .L_8019C804
/* 8019C7FC 001997FC  2C 00 00 14 */	cmpwi r0, 0x14
/* 8019C800 00199800  41 80 00 0C */	blt .L_8019C80C
.L_8019C804:
/* 8019C804 00199804  38 60 FF FF */	li r3, -1
/* 8019C808 00199808  48 00 00 20 */	b .L_8019C828
.L_8019C80C:
/* 8019C80C 0019980C  1C 1F 00 14 */	mulli r0, r31, 0x14
/* 8019C810 00199810  7C 00 E8 50 */	subf r0, r0, r29
/* 8019C814 00199814  7C 7E 02 15 */	add. r3, r30, r0
/* 8019C818 00199818  41 80 00 0C */	blt .L_8019C824
/* 8019C81C 0019981C  2C 03 00 C8 */	cmpwi r3, 0xc8
/* 8019C820 00199820  41 80 00 08 */	blt .L_8019C828
.L_8019C824:
/* 8019C824 00199824  38 60 FF FF */	li r3, -1
.L_8019C828:
/* 8019C828 00199828  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019C82C 0019982C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019C830 00199830  7C 08 03 A6 */	mtlr r0
/* 8019C834 00199834  38 21 00 20 */	addi r1, r1, 0x20
/* 8019C838 00199838  4E 80 00 20 */	blr 

.global BattleAudience_GetEscapeChangeOK
BattleAudience_GetEscapeChangeOK:
/* 8019C83C 0019983C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C840 00199840  7C 08 02 A6 */	mflr r0
/* 8019C844 00199844  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C848 00199848  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019C84C 0019984C  7C 7E 1B 78 */	mr r30, r3
/* 8019C850 00199850  48 00 5E 85 */	bl BattleAudienceBaseGetPtr
/* 8019C854 00199854  7C 7F 1B 78 */	mr r31, r3
/* 8019C858 00199858  7F C3 F3 78 */	mr r3, r30
/* 8019C85C 0019985C  48 00 5E 3D */	bl BattleAudienceGetPtr
/* 8019C860 00199860  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019C864 00199864  7C 7F 1B 78 */	mr r31, r3
/* 8019C868 00199868  54 00 04 63 */	rlwinm. r0, r0, 0, 0x11, 0x11
/* 8019C86C 0019986C  41 82 00 0C */	beq .L_8019C878
/* 8019C870 00199870  38 60 00 00 */	li r3, 0
/* 8019C874 00199874  48 00 00 B0 */	b .L_8019C924
.L_8019C878:
/* 8019C878 00199878  7F C3 F3 78 */	mr r3, r30
/* 8019C87C 0019987C  48 00 01 39 */	bl BattleAudience_GetSysCtrl
/* 8019C880 00199880  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019C884 00199884  40 82 00 0C */	bne .L_8019C890
/* 8019C888 00199888  38 60 00 00 */	li r3, 0
/* 8019C88C 0019988C  48 00 00 98 */	b .L_8019C924
.L_8019C890:
/* 8019C890 00199890  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019C894 00199894  54 00 05 AD */	rlwinm. r0, r0, 0, 0x16, 0x16
/* 8019C898 00199898  41 82 00 0C */	beq .L_8019C8A4
/* 8019C89C 0019989C  38 60 00 00 */	li r3, 0
/* 8019C8A0 001998A0  48 00 00 84 */	b .L_8019C924
.L_8019C8A4:
/* 8019C8A4 001998A4  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 8019C8A8 001998A8  28 00 00 0D */	cmplwi r0, 0xd
/* 8019C8AC 001998AC  40 82 00 0C */	bne .L_8019C8B8
/* 8019C8B0 001998B0  38 60 00 00 */	li r3, 0
/* 8019C8B4 001998B4  48 00 00 70 */	b .L_8019C924
.L_8019C8B8:
/* 8019C8B8 001998B8  28 00 00 11 */	cmplwi r0, 0x11
/* 8019C8BC 001998BC  40 82 00 0C */	bne .L_8019C8C8
/* 8019C8C0 001998C0  38 60 00 00 */	li r3, 0
/* 8019C8C4 001998C4  48 00 00 60 */	b .L_8019C924
.L_8019C8C8:
/* 8019C8C8 001998C8  28 00 00 12 */	cmplwi r0, 0x12
/* 8019C8CC 001998CC  40 82 00 0C */	bne .L_8019C8D8
/* 8019C8D0 001998D0  38 60 00 00 */	li r3, 0
/* 8019C8D4 001998D4  48 00 00 50 */	b .L_8019C924
.L_8019C8D8:
/* 8019C8D8 001998D8  28 00 00 0E */	cmplwi r0, 0xe
/* 8019C8DC 001998DC  40 82 00 0C */	bne .L_8019C8E8
/* 8019C8E0 001998E0  38 60 00 00 */	li r3, 0
/* 8019C8E4 001998E4  48 00 00 40 */	b .L_8019C924
.L_8019C8E8:
/* 8019C8E8 001998E8  28 00 00 0F */	cmplwi r0, 0xf
/* 8019C8EC 001998EC  40 82 00 0C */	bne .L_8019C8F8
/* 8019C8F0 001998F0  38 60 00 00 */	li r3, 0
/* 8019C8F4 001998F4  48 00 00 30 */	b .L_8019C924
.L_8019C8F8:
/* 8019C8F8 001998F8  28 00 00 15 */	cmplwi r0, 0x15
/* 8019C8FC 001998FC  40 82 00 0C */	bne .L_8019C908
/* 8019C900 00199900  38 60 00 00 */	li r3, 0
/* 8019C904 00199904  48 00 00 20 */	b .L_8019C924
.L_8019C908:
/* 8019C908 00199908  28 00 00 16 */	cmplwi r0, 0x16
/* 8019C90C 0019990C  40 82 00 0C */	bne .L_8019C918
/* 8019C910 00199910  38 60 00 00 */	li r3, 0
/* 8019C914 00199914  48 00 00 10 */	b .L_8019C924
.L_8019C918:
/* 8019C918 00199918  20 60 00 0C */	subfic r3, r0, 0xc
/* 8019C91C 0019991C  30 03 FF FF */	addic r0, r3, -1
/* 8019C920 00199920  7C 60 19 10 */	subfe r3, r0, r3
.L_8019C924:
/* 8019C924 00199924  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019C928 00199928  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C92C 0019992C  7C 08 03 A6 */	mtlr r0
/* 8019C930 00199930  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C934 00199934  4E 80 00 20 */	blr 

.global BattleAudience_GetWaiting
BattleAudience_GetWaiting:
/* 8019C938 00199938  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C93C 0019993C  7C 08 02 A6 */	mflr r0
/* 8019C940 00199940  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C944 00199944  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019C948 00199948  7C 7E 1B 78 */	mr r30, r3
/* 8019C94C 0019994C  48 00 5D 89 */	bl BattleAudienceBaseGetPtr
/* 8019C950 00199950  7F C3 F3 78 */	mr r3, r30
/* 8019C954 00199954  48 00 5D 45 */	bl BattleAudienceGetPtr
/* 8019C958 00199958  7C 7F 1B 78 */	mr r31, r3
/* 8019C95C 0019995C  7F C3 F3 78 */	mr r3, r30
/* 8019C960 00199960  48 00 00 55 */	bl BattleAudience_GetSysCtrl
/* 8019C964 00199964  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019C968 00199968  40 82 00 0C */	bne .L_8019C974
/* 8019C96C 0019996C  38 60 00 00 */	li r3, 0
/* 8019C970 00199970  48 00 00 30 */	b .L_8019C9A0
.L_8019C974:
/* 8019C974 00199974  A8 1F 00 1C */	lha r0, 0x1c(r31)
/* 8019C978 00199978  2C 00 FF FF */	cmpwi r0, -1
/* 8019C97C 0019997C  41 82 00 0C */	beq .L_8019C988
/* 8019C980 00199980  38 60 00 00 */	li r3, 0
/* 8019C984 00199984  48 00 00 1C */	b .L_8019C9A0
.L_8019C988:
/* 8019C988 00199988  88 9F 00 19 */	lbz r4, 0x19(r31)
/* 8019C98C 0019998C  38 00 00 03 */	li r0, 3
/* 8019C990 00199990  38 60 FF FF */	li r3, -1
/* 8019C994 00199994  7C 04 00 10 */	subfc r0, r4, r0
/* 8019C998 00199998  7C 03 01 90 */	subfze r0, r3
/* 8019C99C 0019999C  54 03 06 3E */	clrlwi r3, r0, 0x18
.L_8019C9A0:
/* 8019C9A0 001999A0  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019C9A4 001999A4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019C9A8 001999A8  7C 08 03 A6 */	mtlr r0
/* 8019C9AC 001999AC  38 21 00 10 */	addi r1, r1, 0x10
/* 8019C9B0 001999B0  4E 80 00 20 */	blr 

.global BattleAudience_GetSysCtrl
BattleAudience_GetSysCtrl:
/* 8019C9B4 001999B4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019C9B8 001999B8  7C 08 02 A6 */	mflr r0
/* 8019C9BC 001999BC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019C9C0 001999C0  BF C1 00 08 */	stmw r30, 8(r1)
/* 8019C9C4 001999C4  7C 7E 1B 78 */	mr r30, r3
/* 8019C9C8 001999C8  48 00 5D 0D */	bl BattleAudienceBaseGetPtr
/* 8019C9CC 001999CC  7F C3 F3 78 */	mr r3, r30
/* 8019C9D0 001999D0  48 00 5C C9 */	bl BattleAudienceGetPtr
/* 8019C9D4 001999D4  7C 7F 1B 78 */	mr r31, r3
/* 8019C9D8 001999D8  7F C3 F3 78 */	mr r3, r30
/* 8019C9DC 001999DC  48 00 00 39 */	bl BattleAudience_GetExist
/* 8019C9E0 001999E0  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019C9E4 001999E4  40 82 00 0C */	bne .L_8019C9F0
/* 8019C9E8 001999E8  38 60 00 00 */	li r3, 0
/* 8019C9EC 001999EC  48 00 00 14 */	b .L_8019CA00
.L_8019C9F0:
/* 8019C9F0 001999F0  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019C9F4 001999F4  54 00 06 F6 */	rlwinm r0, r0, 0, 0x1b, 0x1b
/* 8019C9F8 001999F8  7C 00 00 34 */	cntlzw r0, r0
/* 8019C9FC 001999FC  54 03 D9 7E */	srwi r3, r0, 5
.L_8019CA00:
/* 8019CA00 00199A00  BB C1 00 08 */	lmw r30, 8(r1)
/* 8019CA04 00199A04  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019CA08 00199A08  7C 08 03 A6 */	mtlr r0
/* 8019CA0C 00199A0C  38 21 00 10 */	addi r1, r1, 0x10
/* 8019CA10 00199A10  4E 80 00 20 */	blr 

.global BattleAudience_GetExist
BattleAudience_GetExist:
/* 8019CA14 00199A14  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019CA18 00199A18  7C 08 02 A6 */	mflr r0
/* 8019CA1C 00199A1C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019CA20 00199A20  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019CA24 00199A24  7C 7F 1B 78 */	mr r31, r3
/* 8019CA28 00199A28  48 00 5C AD */	bl BattleAudienceBaseGetPtr
/* 8019CA2C 00199A2C  7F E3 FB 78 */	mr r3, r31
/* 8019CA30 00199A30  48 00 5C 69 */	bl BattleAudienceGetPtr
/* 8019CA34 00199A34  80 63 00 00 */	lwz r3, 0(r3)
/* 8019CA38 00199A38  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019CA3C 00199A3C  40 82 00 0C */	bne .L_8019CA48
/* 8019CA40 00199A40  38 60 00 00 */	li r3, 0
/* 8019CA44 00199A44  48 00 00 20 */	b .L_8019CA64
.L_8019CA48:
/* 8019CA48 00199A48  54 60 05 EF */	rlwinm. r0, r3, 0, 0x17, 0x17
/* 8019CA4C 00199A4C  41 82 00 0C */	beq .L_8019CA58
/* 8019CA50 00199A50  38 60 00 00 */	li r3, 0
/* 8019CA54 00199A54  48 00 00 10 */	b .L_8019CA64
.L_8019CA58:
/* 8019CA58 00199A58  54 60 07 BC */	rlwinm r0, r3, 0, 0x1e, 0x1e
/* 8019CA5C 00199A5C  7C 00 00 34 */	cntlzw r0, r0
/* 8019CA60 00199A60  54 03 D9 7E */	srwi r3, r0, 5
.L_8019CA64:
/* 8019CA64 00199A64  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019CA68 00199A68  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019CA6C 00199A6C  7C 08 03 A6 */	mtlr r0
/* 8019CA70 00199A70  38 21 00 10 */	addi r1, r1, 0x10
/* 8019CA74 00199A74  4E 80 00 20 */	blr 

.global BattleAudience_ChangeStatus
BattleAudience_ChangeStatus:
/* 8019CA78 00199A78  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CA7C 00199A7C  7C 08 02 A6 */	mflr r0
/* 8019CA80 00199A80  3C A0 80 30 */	lis r5, lbl_802F9578@ha
/* 8019CA84 00199A84  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CA88 00199A88  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019CA8C 00199A8C  7C 7D 1B 78 */	mr r29, r3
/* 8019CA90 00199A90  7C 9F 23 78 */	mr r31, r4
/* 8019CA94 00199A94  3B C5 95 78 */	addi r30, r5, lbl_802F9578@l
/* 8019CA98 00199A98  48 00 5C 3D */	bl BattleAudienceBaseGetPtr
/* 8019CA9C 00199A9C  7F A3 EB 78 */	mr r3, r29
/* 8019CAA0 00199AA0  48 00 5B F9 */	bl BattleAudienceGetPtr
/* 8019CAA4 00199AA4  80 83 00 00 */	lwz r4, 0(r3)
/* 8019CAA8 00199AA8  54 80 07 FF */	clrlwi. r0, r4, 0x1f
/* 8019CAAC 00199AAC  41 82 00 BC */	beq .L_8019CB68
/* 8019CAB0 00199AB0  54 80 05 EF */	rlwinm. r0, r4, 0, 0x17, 0x17
/* 8019CAB4 00199AB4  41 82 00 1C */	beq .L_8019CAD0
/* 8019CAB8 00199AB8  2C 1D 00 01 */	cmpwi r29, 1
/* 8019CABC 00199ABC  41 80 00 AC */	blt .L_8019CB68
/* 8019CAC0 00199AC0  7F E4 FB 78 */	mr r4, r31
/* 8019CAC4 00199AC4  38 7D FF FF */	addi r3, r29, -1
/* 8019CAC8 00199AC8  4B FF FF B1 */	bl BattleAudience_ChangeStatus
/* 8019CACC 00199ACC  48 00 00 9C */	b .L_8019CB68
.L_8019CAD0:
/* 8019CAD0 00199AD0  38 A0 00 00 */	li r5, 0
/* 8019CAD4 00199AD4  38 00 00 FF */	li r0, 0xff
/* 8019CAD8 00199AD8  98 A3 00 43 */	stb r5, 0x43(r3)
/* 8019CADC 00199ADC  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019CAE0 00199AE0  98 A3 00 42 */	stb r5, 0x42(r3)
/* 8019CAE4 00199AE4  98 A3 00 41 */	stb r5, 0x41(r3)
/* 8019CAE8 00199AE8  98 03 00 44 */	stb r0, 0x44(r3)
/* 8019CAEC 00199AEC  80 9E 02 DC */	lwz r4, 0x2dc(r30)
/* 8019CAF0 00199AF0  80 1E 02 E0 */	lwz r0, 0x2e0(r30)
/* 8019CAF4 00199AF4  90 83 00 9C */	stw r4, 0x9c(r3)
/* 8019CAF8 00199AF8  90 03 00 A0 */	stw r0, 0xa0(r3)
/* 8019CAFC 00199AFC  80 1E 02 E4 */	lwz r0, 0x2e4(r30)
/* 8019CB00 00199B00  90 03 00 A4 */	stw r0, 0xa4(r3)
/* 8019CB04 00199B04  80 9E 02 E8 */	lwz r4, 0x2e8(r30)
/* 8019CB08 00199B08  80 1E 02 EC */	lwz r0, 0x2ec(r30)
/* 8019CB0C 00199B0C  90 83 00 6C */	stw r4, 0x6c(r3)
/* 8019CB10 00199B10  90 03 00 70 */	stw r0, 0x70(r3)
/* 8019CB14 00199B14  80 1E 02 F0 */	lwz r0, 0x2f0(r30)
/* 8019CB18 00199B18  90 03 00 74 */	stw r0, 0x74(r3)
/* 8019CB1C 00199B1C  80 9E 02 F4 */	lwz r4, 0x2f4(r30)
/* 8019CB20 00199B20  80 1E 02 F8 */	lwz r0, 0x2f8(r30)
/* 8019CB24 00199B24  90 83 00 60 */	stw r4, 0x60(r3)
/* 8019CB28 00199B28  90 03 00 64 */	stw r0, 0x64(r3)
/* 8019CB2C 00199B2C  80 1E 02 FC */	lwz r0, 0x2fc(r30)
/* 8019CB30 00199B30  90 03 00 68 */	stw r0, 0x68(r3)
/* 8019CB34 00199B34  80 9E 03 00 */	lwz r4, 0x300(r30)
/* 8019CB38 00199B38  80 1E 03 04 */	lwz r0, 0x304(r30)
/* 8019CB3C 00199B3C  90 83 00 78 */	stw r4, 0x78(r3)
/* 8019CB40 00199B40  90 03 00 7C */	stw r0, 0x7c(r3)
/* 8019CB44 00199B44  80 1E 03 08 */	lwz r0, 0x308(r30)
/* 8019CB48 00199B48  90 03 00 80 */	stw r0, 0x80(r3)
/* 8019CB4C 00199B4C  90 A3 00 30 */	stw r5, 0x30(r3)
/* 8019CB50 00199B50  90 A3 00 04 */	stw r5, 4(r3)
/* 8019CB54 00199B54  90 A3 00 08 */	stw r5, 8(r3)
/* 8019CB58 00199B58  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 8019CB5C 00199B5C  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 8019CB60 00199B60  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 8019CB64 00199B64  9B E3 00 19 */	stb r31, 0x19(r3)
.L_8019CB68:
/* 8019CB68 00199B68  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019CB6C 00199B6C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019CB70 00199B70  7C 08 03 A6 */	mtlr r0
/* 8019CB74 00199B74  38 21 00 20 */	addi r1, r1, 0x20
/* 8019CB78 00199B78  4E 80 00 20 */	blr 

.global BattleAudience_GetFront
BattleAudience_GetFront:
/* 8019CB7C 00199B7C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019CB80 00199B80  7C 08 02 A6 */	mflr r0
/* 8019CB84 00199B84  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019CB88 00199B88  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019CB8C 00199B8C  7C 7F 1B 78 */	mr r31, r3
/* 8019CB90 00199B90  48 00 5B 45 */	bl BattleAudienceBaseGetPtr
/* 8019CB94 00199B94  7F E3 FB 78 */	mr r3, r31
/* 8019CB98 00199B98  48 00 5B 01 */	bl BattleAudienceGetPtr
/* 8019CB9C 00199B9C  7C 7F 1B 78 */	mr r31, r3
/* 8019CBA0 00199BA0  38 60 00 04 */	li r3, 4
/* 8019CBA4 00199BA4  4B E7 25 AD */	bl camGetPtr
/* 8019CBA8 00199BA8  C0 23 00 1C */	lfs f1, 0x1c(r3)
/* 8019CBAC 00199BAC  C0 03 00 10 */	lfs f0, 0x10(r3)
/* 8019CBB0 00199BB0  C0 63 00 18 */	lfs f3, 0x18(r3)
/* 8019CBB4 00199BB4  EC 21 00 28 */	fsubs f1, f1, f0
/* 8019CBB8 00199BB8  C0 43 00 0C */	lfs f2, 0xc(r3)
/* 8019CBBC 00199BBC  C0 1F 00 94 */	lfs f0, 0x94(r31)
/* 8019CBC0 00199BC0  EC 43 10 28 */	fsubs f2, f3, f2
/* 8019CBC4 00199BC4  C0 83 00 20 */	lfs f4, 0x20(r3)
/* 8019CBC8 00199BC8  EC 01 00 32 */	fmuls f0, f1, f0
/* 8019CBCC 00199BCC  C0 63 00 14 */	lfs f3, 0x14(r3)
/* 8019CBD0 00199BD0  C0 3F 00 90 */	lfs f1, 0x90(r31)
/* 8019CBD4 00199BD4  EC 64 18 28 */	fsubs f3, f4, f3
/* 8019CBD8 00199BD8  EC 22 00 7A */	fmadds f1, f2, f1, f0
/* 8019CBDC 00199BDC  C0 5F 00 98 */	lfs f2, 0x98(r31)
/* 8019CBE0 00199BE0  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019CBE4 00199BE4  EC 23 08 BA */	fmadds f1, f3, f2, f1
/* 8019CBE8 00199BE8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019CBEC 00199BEC  4C 41 13 82 */	cror 2, 1, 2
/* 8019CBF0 00199BF0  7C 00 00 26 */	mfcr r0
/* 8019CBF4 00199BF4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019CBF8 00199BF8  54 00 1F FE */	rlwinm r0, r0, 3, 0x1f, 0x1f
/* 8019CBFC 00199BFC  7C 00 00 34 */	cntlzw r0, r0
/* 8019CC00 00199C00  54 03 D9 7E */	srwi r3, r0, 5
/* 8019CC04 00199C04  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019CC08 00199C08  7C 08 03 A6 */	mtlr r0
/* 8019CC0C 00199C0C  38 21 00 10 */	addi r1, r1, 0x10
/* 8019CC10 00199C10  4E 80 00 20 */	blr 

.global func_8019CC14
func_8019CC14:

.global BattleAudience_Attack
BattleAudience_Attack:
/* 8019CC14 00199C14  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019CC18 00199C18  7C 08 02 A6 */	mflr r0
/* 8019CC1C 00199C1C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019CC20 00199C20  48 00 5A 79 */	bl BattleAudienceGetPtr
/* 8019CC24 00199C24  80 03 00 00 */	lwz r0, 0(r3)
/* 8019CC28 00199C28  60 00 00 40 */	ori r0, r0, 0x40
/* 8019CC2C 00199C2C  90 03 00 00 */	stw r0, 0(r3)
/* 8019CC30 00199C30  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019CC34 00199C34  7C 08 03 A6 */	mtlr r0
/* 8019CC38 00199C38  38 21 00 10 */	addi r1, r1, 0x10
/* 8019CC3C 00199C3C  4E 80 00 20 */	blr 

.global BattleAudience_SetTarget
BattleAudience_SetTarget:
/* 8019CC40 00199C40  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CC44 00199C44  7C 08 02 A6 */	mflr r0
/* 8019CC48 00199C48  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CC4C 00199C4C  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 8019CC50 00199C50  7C 7B 1B 78 */	mr r27, r3
/* 8019CC54 00199C54  48 00 5A 45 */	bl BattleAudienceGetPtr
/* 8019CC58 00199C58  80 03 00 00 */	lwz r0, 0(r3)
/* 8019CC5C 00199C5C  3B 80 00 00 */	li r28, 0
/* 8019CC60 00199C60  3B C0 00 00 */	li r30, 0
/* 8019CC64 00199C64  3B E0 FF FF */	li r31, -1
/* 8019CC68 00199C68  60 00 00 20 */	ori r0, r0, 0x20
/* 8019CC6C 00199C6C  90 03 00 00 */	stw r0, 0(r3)
.L_8019CC70:
/* 8019CC70 00199C70  7C 1C D8 00 */	cmpw r28, r27
/* 8019CC74 00199C74  41 82 00 48 */	beq .L_8019CCBC
/* 8019CC78 00199C78  7F 83 E3 78 */	mr r3, r28
/* 8019CC7C 00199C7C  4B FF FD 99 */	bl BattleAudience_GetExist
/* 8019CC80 00199C80  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019CC84 00199C84  41 82 00 38 */	beq .L_8019CCBC
/* 8019CC88 00199C88  7F 83 E3 78 */	mr r3, r28
/* 8019CC8C 00199C8C  48 00 5A 0D */	bl BattleAudienceGetPtr
/* 8019CC90 00199C90  7C 7D 1B 78 */	mr r29, r3
/* 8019CC94 00199C94  88 03 00 19 */	lbz r0, 0x19(r3)
/* 8019CC98 00199C98  28 00 00 07 */	cmplwi r0, 7
/* 8019CC9C 00199C9C  40 82 00 20 */	bne .L_8019CCBC
/* 8019CCA0 00199CA0  A8 7D 00 1C */	lha r3, 0x1c(r29)
/* 8019CCA4 00199CA4  48 00 59 B5 */	bl BattleAudienceItemGetPtr
/* 8019CCA8 00199CA8  93 C3 00 00 */	stw r30, 0(r3)
/* 8019CCAC 00199CAC  7F 83 E3 78 */	mr r3, r28
/* 8019CCB0 00199CB0  38 80 00 00 */	li r4, 0
/* 8019CCB4 00199CB4  B3 FD 00 1C */	sth r31, 0x1c(r29)
/* 8019CCB8 00199CB8  4B FF FD C1 */	bl BattleAudience_ChangeStatus
.L_8019CCBC:
/* 8019CCBC 00199CBC  3B 9C 00 01 */	addi r28, r28, 1
/* 8019CCC0 00199CC0  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 8019CCC4 00199CC4  41 80 FF AC */	blt .L_8019CC70
/* 8019CCC8 00199CC8  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 8019CCCC 00199CCC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019CCD0 00199CD0  7C 08 03 A6 */	mtlr r0
/* 8019CCD4 00199CD4  38 21 00 20 */	addi r1, r1, 0x20
/* 8019CCD8 00199CD8  4E 80 00 20 */	blr 

.global BattleAudience_GetItemOn2
BattleAudience_GetItemOn2:
/* 8019CCDC 00199CDC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CCE0 00199CE0  7C 08 02 A6 */	mflr r0
/* 8019CCE4 00199CE4  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CCE8 00199CE8  BF 41 00 08 */	stmw r26, 8(r1)
/* 8019CCEC 00199CEC  7C 7A 1B 78 */	mr r26, r3
/* 8019CCF0 00199CF0  7C 9B 23 78 */	mr r27, r4
/* 8019CCF4 00199CF4  7C BC 2B 78 */	mr r28, r5
/* 8019CCF8 00199CF8  7C DD 33 78 */	mr r29, r6
/* 8019CCFC 00199CFC  7C FE 3B 78 */	mr r30, r7
/* 8019CD00 00199D00  48 00 59 D5 */	bl BattleAudienceBaseGetPtr
/* 8019CD04 00199D04  7C 7F 1B 78 */	mr r31, r3
/* 8019CD08 00199D08  3C 7F 00 01 */	addis r3, r31, 1
/* 8019CD0C 00199D0C  80 63 38 BC */	lwz r3, 0x38bc(r3)
/* 8019CD10 00199D10  48 00 59 89 */	bl BattleAudienceGetPtr
/* 8019CD14 00199D14  28 1A 00 00 */	cmplwi r26, 0
/* 8019CD18 00199D18  41 82 00 10 */	beq .L_8019CD28
/* 8019CD1C 00199D1C  3C 9F 00 01 */	addis r4, r31, 1
/* 8019CD20 00199D20  80 04 38 BC */	lwz r0, 0x38bc(r4)
/* 8019CD24 00199D24  90 1A 00 00 */	stw r0, 0(r26)
.L_8019CD28:
/* 8019CD28 00199D28  28 1B 00 00 */	cmplwi r27, 0
/* 8019CD2C 00199D2C  41 82 00 10 */	beq .L_8019CD3C
/* 8019CD30 00199D30  3C 9F 00 01 */	addis r4, r31, 1
/* 8019CD34 00199D34  C0 04 38 C0 */	lfs f0, 0x38c0(r4)
/* 8019CD38 00199D38  D0 1B 00 00 */	stfs f0, 0(r27)
.L_8019CD3C:
/* 8019CD3C 00199D3C  28 1C 00 00 */	cmplwi r28, 0
/* 8019CD40 00199D40  41 82 00 10 */	beq .L_8019CD50
/* 8019CD44 00199D44  3C 9F 00 01 */	addis r4, r31, 1
/* 8019CD48 00199D48  C0 04 38 C4 */	lfs f0, 0x38c4(r4)
/* 8019CD4C 00199D4C  D0 1C 00 00 */	stfs f0, 0(r28)
.L_8019CD50:
/* 8019CD50 00199D50  28 1D 00 00 */	cmplwi r29, 0
/* 8019CD54 00199D54  41 82 00 10 */	beq .L_8019CD64
/* 8019CD58 00199D58  3C 9F 00 01 */	addis r4, r31, 1
/* 8019CD5C 00199D5C  C0 04 38 C8 */	lfs f0, 0x38c8(r4)
/* 8019CD60 00199D60  D0 1D 00 00 */	stfs f0, 0(r29)
.L_8019CD64:
/* 8019CD64 00199D64  28 1E 00 00 */	cmplwi r30, 0
/* 8019CD68 00199D68  41 82 00 30 */	beq .L_8019CD98
/* 8019CD6C 00199D6C  A8 63 00 1C */	lha r3, 0x1c(r3)
/* 8019CD70 00199D70  7C 60 07 35 */	extsh. r0, r3
/* 8019CD74 00199D74  40 80 00 10 */	bge .L_8019CD84
/* 8019CD78 00199D78  38 00 00 00 */	li r0, 0
/* 8019CD7C 00199D7C  90 1E 00 00 */	stw r0, 0(r30)
/* 8019CD80 00199D80  48 00 00 18 */	b .L_8019CD98
.L_8019CD84:
/* 8019CD84 00199D84  1C 03 00 48 */	mulli r0, r3, 0x48
/* 8019CD88 00199D88  3C 7F 00 01 */	addis r3, r31, 1
/* 8019CD8C 00199D8C  7C 63 02 14 */	add r3, r3, r0
/* 8019CD90 00199D90  80 03 F2 6C */	lwz r0, -0xd94(r3)
/* 8019CD94 00199D94  90 1E 00 00 */	stw r0, 0(r30)
.L_8019CD98:
/* 8019CD98 00199D98  BB 41 00 08 */	lmw r26, 8(r1)
/* 8019CD9C 00199D9C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019CDA0 00199DA0  7C 08 03 A6 */	mtlr r0
/* 8019CDA4 00199DA4  38 21 00 20 */	addi r1, r1, 0x20
/* 8019CDA8 00199DA8  4E 80 00 20 */	blr 

.global BattleAudience_GetItemOn
BattleAudience_GetItemOn:
/* 8019CDAC 00199DAC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019CDB0 00199DB0  7C 08 02 A6 */	mflr r0
/* 8019CDB4 00199DB4  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019CDB8 00199DB8  BF 01 00 10 */	stmw r24, 0x10(r1)
/* 8019CDBC 00199DBC  7C 78 1B 78 */	mr r24, r3
/* 8019CDC0 00199DC0  7C 99 23 78 */	mr r25, r4
/* 8019CDC4 00199DC4  7C BA 2B 78 */	mr r26, r5
/* 8019CDC8 00199DC8  7C DB 33 78 */	mr r27, r6
/* 8019CDCC 00199DCC  7C FF 3B 78 */	mr r31, r7
/* 8019CDD0 00199DD0  48 00 59 05 */	bl BattleAudienceBaseGetPtr
/* 8019CDD4 00199DD4  7C 7E 1B 78 */	mr r30, r3
/* 8019CDD8 00199DD8  3B 80 00 00 */	li r28, 0
/* 8019CDDC 00199DDC  38 60 00 00 */	li r3, 0
/* 8019CDE0 00199DE0  48 00 58 B9 */	bl BattleAudienceGetPtr
/* 8019CDE4 00199DE4  7C 7D 1B 78 */	mr r29, r3
.L_8019CDE8:
/* 8019CDE8 00199DE8  80 7D 00 00 */	lwz r3, 0(r29)
/* 8019CDEC 00199DEC  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019CDF0 00199DF0  41 82 00 E0 */	beq .L_8019CED0
/* 8019CDF4 00199DF4  54 60 05 EF */	rlwinm. r0, r3, 0, 0x17, 0x17
/* 8019CDF8 00199DF8  40 82 00 D8 */	bne .L_8019CED0
/* 8019CDFC 00199DFC  54 60 07 BD */	rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 8019CE00 00199E00  40 82 00 D0 */	bne .L_8019CED0
/* 8019CE04 00199E04  A8 7D 00 1C */	lha r3, 0x1c(r29)
/* 8019CE08 00199E08  2C 03 FF FF */	cmpwi r3, -1
/* 8019CE0C 00199E0C  41 82 00 C4 */	beq .L_8019CED0
/* 8019CE10 00199E10  48 00 58 49 */	bl BattleAudienceItemGetPtr
/* 8019CE14 00199E14  80 03 00 04 */	lwz r0, 4(r3)
/* 8019CE18 00199E18  2C 00 00 04 */	cmpwi r0, 4
/* 8019CE1C 00199E1C  40 81 00 0C */	ble .L_8019CE28
/* 8019CE20 00199E20  2C 00 00 07 */	cmpwi r0, 7
/* 8019CE24 00199E24  40 82 00 AC */	bne .L_8019CED0
.L_8019CE28:
/* 8019CE28 00199E28  28 18 00 00 */	cmplwi r24, 0
/* 8019CE2C 00199E2C  41 82 00 10 */	beq .L_8019CE3C
/* 8019CE30 00199E30  3C 7E 00 01 */	addis r3, r30, 1
/* 8019CE34 00199E34  93 83 38 BC */	stw r28, 0x38bc(r3)
/* 8019CE38 00199E38  93 98 00 00 */	stw r28, 0(r24)
.L_8019CE3C:
/* 8019CE3C 00199E3C  C0 1D 00 48 */	lfs f0, 0x48(r29)
/* 8019CE40 00199E40  3C 7E 00 01 */	addis r3, r30, 1
/* 8019CE44 00199E44  C0 22 D2 DC */	lfs f1, lbl_8041E65C@sda21(r2)
/* 8019CE48 00199E48  28 19 00 00 */	cmplwi r25, 0
/* 8019CE4C 00199E4C  D0 03 38 C0 */	stfs f0, 0x38c0(r3)
/* 8019CE50 00199E50  C0 1D 00 4C */	lfs f0, 0x4c(r29)
/* 8019CE54 00199E54  D0 03 38 C4 */	stfs f0, 0x38c4(r3)
/* 8019CE58 00199E58  C0 1D 00 50 */	lfs f0, 0x50(r29)
/* 8019CE5C 00199E5C  EC 01 00 2A */	fadds f0, f1, f0
/* 8019CE60 00199E60  D0 03 38 C8 */	stfs f0, 0x38c8(r3)
/* 8019CE64 00199E64  41 82 00 0C */	beq .L_8019CE70
/* 8019CE68 00199E68  C0 03 38 C0 */	lfs f0, 0x38c0(r3)
/* 8019CE6C 00199E6C  D0 19 00 00 */	stfs f0, 0(r25)
.L_8019CE70:
/* 8019CE70 00199E70  28 1A 00 00 */	cmplwi r26, 0
/* 8019CE74 00199E74  41 82 00 10 */	beq .L_8019CE84
/* 8019CE78 00199E78  3C 7E 00 01 */	addis r3, r30, 1
/* 8019CE7C 00199E7C  C0 03 38 C4 */	lfs f0, 0x38c4(r3)
/* 8019CE80 00199E80  D0 1A 00 00 */	stfs f0, 0(r26)
.L_8019CE84:
/* 8019CE84 00199E84  28 1B 00 00 */	cmplwi r27, 0
/* 8019CE88 00199E88  41 82 00 10 */	beq .L_8019CE98
/* 8019CE8C 00199E8C  3C 7E 00 01 */	addis r3, r30, 1
/* 8019CE90 00199E90  C0 03 38 C8 */	lfs f0, 0x38c8(r3)
/* 8019CE94 00199E94  D0 1B 00 00 */	stfs f0, 0(r27)
.L_8019CE98:
/* 8019CE98 00199E98  28 1F 00 00 */	cmplwi r31, 0
/* 8019CE9C 00199E9C  41 82 00 4C */	beq .L_8019CEE8
/* 8019CEA0 00199EA0  A8 7D 00 1C */	lha r3, 0x1c(r29)
/* 8019CEA4 00199EA4  7C 60 07 35 */	extsh. r0, r3
/* 8019CEA8 00199EA8  40 80 00 10 */	bge .L_8019CEB8
/* 8019CEAC 00199EAC  38 00 00 00 */	li r0, 0
/* 8019CEB0 00199EB0  90 1F 00 00 */	stw r0, 0(r31)
/* 8019CEB4 00199EB4  48 00 00 34 */	b .L_8019CEE8
.L_8019CEB8:
/* 8019CEB8 00199EB8  1C 03 00 48 */	mulli r0, r3, 0x48
/* 8019CEBC 00199EBC  3C 7E 00 01 */	addis r3, r30, 1
/* 8019CEC0 00199EC0  7C 63 02 14 */	add r3, r3, r0
/* 8019CEC4 00199EC4  80 03 F2 6C */	lwz r0, -0xd94(r3)
/* 8019CEC8 00199EC8  90 1F 00 00 */	stw r0, 0(r31)
/* 8019CECC 00199ECC  48 00 00 1C */	b .L_8019CEE8
.L_8019CED0:
/* 8019CED0 00199ED0  3B 9C 00 01 */	addi r28, r28, 1
/* 8019CED4 00199ED4  3B BD 01 34 */	addi r29, r29, 0x134
/* 8019CED8 00199ED8  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 8019CEDC 00199EDC  41 80 FF 0C */	blt .L_8019CDE8
/* 8019CEE0 00199EE0  38 00 FF FF */	li r0, -1
/* 8019CEE4 00199EE4  90 18 00 00 */	stw r0, 0(r24)
.L_8019CEE8:
/* 8019CEE8 00199EE8  BB 01 00 10 */	lmw r24, 0x10(r1)
/* 8019CEEC 00199EEC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019CEF0 00199EF0  7C 08 03 A6 */	mtlr r0
/* 8019CEF4 00199EF4  38 21 00 30 */	addi r1, r1, 0x30
/* 8019CEF8 00199EF8  4E 80 00 20 */	blr 

.global BattleAudience_SetRotateOffset
BattleAudience_SetRotateOffset:
/* 8019CEFC 00199EFC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CF00 00199F00  7C 08 02 A6 */	mflr r0
/* 8019CF04 00199F04  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CF08 00199F08  39 61 00 20 */	addi r11, r1, 0x20
/* 8019CF0C 00199F0C  48 0C 1A 3D */	bl _savefpr_29
/* 8019CF10 00199F10  FF A0 08 90 */	fmr f29, f1
/* 8019CF14 00199F14  FF C0 10 90 */	fmr f30, f2
/* 8019CF18 00199F18  FF E0 18 90 */	fmr f31, f3
/* 8019CF1C 00199F1C  48 00 57 7D */	bl BattleAudienceGetPtr
/* 8019CF20 00199F20  D3 A3 00 A8 */	stfs f29, 0xa8(r3)
/* 8019CF24 00199F24  D3 C3 00 AC */	stfs f30, 0xac(r3)
/* 8019CF28 00199F28  D3 E3 00 B0 */	stfs f31, 0xb0(r3)
/* 8019CF2C 00199F2C  39 61 00 20 */	addi r11, r1, 0x20
/* 8019CF30 00199F30  48 0C 1A 65 */	bl _restfpr_29
/* 8019CF34 00199F34  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019CF38 00199F38  7C 08 03 A6 */	mtlr r0
/* 8019CF3C 00199F3C  38 21 00 20 */	addi r1, r1, 0x20
/* 8019CF40 00199F40  4E 80 00 20 */	blr 

.global BattleAudience_SetRotate
BattleAudience_SetRotate:
/* 8019CF44 00199F44  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CF48 00199F48  7C 08 02 A6 */	mflr r0
/* 8019CF4C 00199F4C  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CF50 00199F50  39 61 00 20 */	addi r11, r1, 0x20
/* 8019CF54 00199F54  48 0C 19 F5 */	bl _savefpr_29
/* 8019CF58 00199F58  FF A0 08 90 */	fmr f29, f1
/* 8019CF5C 00199F5C  FF C0 10 90 */	fmr f30, f2
/* 8019CF60 00199F60  FF E0 18 90 */	fmr f31, f3
/* 8019CF64 00199F64  48 00 57 35 */	bl BattleAudienceGetPtr
/* 8019CF68 00199F68  D3 A3 00 9C */	stfs f29, 0x9c(r3)
/* 8019CF6C 00199F6C  D3 C3 00 A0 */	stfs f30, 0xa0(r3)
/* 8019CF70 00199F70  D3 E3 00 A4 */	stfs f31, 0xa4(r3)
/* 8019CF74 00199F74  39 61 00 20 */	addi r11, r1, 0x20
/* 8019CF78 00199F78  48 0C 1A 1D */	bl _restfpr_29
/* 8019CF7C 00199F7C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019CF80 00199F80  7C 08 03 A6 */	mtlr r0
/* 8019CF84 00199F84  38 21 00 20 */	addi r1, r1, 0x20
/* 8019CF88 00199F88  4E 80 00 20 */	blr 

.global BattleAudience_SetPosition
BattleAudience_SetPosition:
/* 8019CF8C 00199F8C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CF90 00199F90  7C 08 02 A6 */	mflr r0
/* 8019CF94 00199F94  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CF98 00199F98  39 61 00 20 */	addi r11, r1, 0x20
/* 8019CF9C 00199F9C  48 0C 19 AD */	bl _savefpr_29
/* 8019CFA0 00199FA0  FF A0 08 90 */	fmr f29, f1
/* 8019CFA4 00199FA4  FF C0 10 90 */	fmr f30, f2
/* 8019CFA8 00199FA8  FF E0 18 90 */	fmr f31, f3
/* 8019CFAC 00199FAC  48 00 56 ED */	bl BattleAudienceGetPtr
/* 8019CFB0 00199FB0  D3 A3 00 48 */	stfs f29, 0x48(r3)
/* 8019CFB4 00199FB4  D3 C3 00 4C */	stfs f30, 0x4c(r3)
/* 8019CFB8 00199FB8  D3 E3 00 50 */	stfs f31, 0x50(r3)
/* 8019CFBC 00199FBC  39 61 00 20 */	addi r11, r1, 0x20
/* 8019CFC0 00199FC0  48 0C 19 D5 */	bl _restfpr_29
/* 8019CFC4 00199FC4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019CFC8 00199FC8  7C 08 03 A6 */	mtlr r0
/* 8019CFCC 00199FCC  38 21 00 20 */	addi r1, r1, 0x20
/* 8019CFD0 00199FD0  4E 80 00 20 */	blr 

.global BattleAudience_GetRotate
BattleAudience_GetRotate:
/* 8019CFD4 00199FD4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019CFD8 00199FD8  7C 08 02 A6 */	mflr r0
/* 8019CFDC 00199FDC  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019CFE0 00199FE0  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019CFE4 00199FE4  7C 9D 23 78 */	mr r29, r4
/* 8019CFE8 00199FE8  7C BE 2B 78 */	mr r30, r5
/* 8019CFEC 00199FEC  7C DF 33 78 */	mr r31, r6
/* 8019CFF0 00199FF0  48 00 56 A9 */	bl BattleAudienceGetPtr
/* 8019CFF4 00199FF4  C0 03 00 9C */	lfs f0, 0x9c(r3)
/* 8019CFF8 00199FF8  D0 1D 00 00 */	stfs f0, 0(r29)
/* 8019CFFC 00199FFC  C0 03 00 A0 */	lfs f0, 0xa0(r3)
/* 8019D000 0019A000  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8019D004 0019A004  C0 03 00 A4 */	lfs f0, 0xa4(r3)
/* 8019D008 0019A008  D0 1F 00 00 */	stfs f0, 0(r31)
/* 8019D00C 0019A00C  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019D010 0019A010  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019D014 0019A014  7C 08 03 A6 */	mtlr r0
/* 8019D018 0019A018  38 21 00 20 */	addi r1, r1, 0x20
/* 8019D01C 0019A01C  4E 80 00 20 */	blr 

.global BattleAudience_GetHomePosition
BattleAudience_GetHomePosition:
/* 8019D020 0019A020  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019D024 0019A024  7C 08 02 A6 */	mflr r0
/* 8019D028 0019A028  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019D02C 0019A02C  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019D030 0019A030  7C 9D 23 78 */	mr r29, r4
/* 8019D034 0019A034  7C BE 2B 78 */	mr r30, r5
/* 8019D038 0019A038  7C DF 33 78 */	mr r31, r6
/* 8019D03C 0019A03C  48 00 56 5D */	bl BattleAudienceGetPtr
/* 8019D040 0019A040  C0 03 00 B4 */	lfs f0, 0xb4(r3)
/* 8019D044 0019A044  D0 1D 00 00 */	stfs f0, 0(r29)
/* 8019D048 0019A048  C0 03 00 B8 */	lfs f0, 0xb8(r3)
/* 8019D04C 0019A04C  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8019D050 0019A050  C0 03 00 BC */	lfs f0, 0xbc(r3)
/* 8019D054 0019A054  D0 1F 00 00 */	stfs f0, 0(r31)
/* 8019D058 0019A058  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019D05C 0019A05C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019D060 0019A060  7C 08 03 A6 */	mtlr r0
/* 8019D064 0019A064  38 21 00 20 */	addi r1, r1, 0x20
/* 8019D068 0019A068  4E 80 00 20 */	blr 

.global BattleAudience_GetPosition
BattleAudience_GetPosition:
/* 8019D06C 0019A06C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019D070 0019A070  7C 08 02 A6 */	mflr r0
/* 8019D074 0019A074  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019D078 0019A078  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019D07C 0019A07C  7C 9D 23 78 */	mr r29, r4
/* 8019D080 0019A080  7C BE 2B 78 */	mr r30, r5
/* 8019D084 0019A084  7C DF 33 78 */	mr r31, r6
/* 8019D088 0019A088  48 00 56 11 */	bl BattleAudienceGetPtr
/* 8019D08C 0019A08C  C0 03 00 48 */	lfs f0, 0x48(r3)
/* 8019D090 0019A090  D0 1D 00 00 */	stfs f0, 0(r29)
/* 8019D094 0019A094  C0 03 00 4C */	lfs f0, 0x4c(r3)
/* 8019D098 0019A098  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8019D09C 0019A09C  C0 03 00 50 */	lfs f0, 0x50(r3)
/* 8019D0A0 0019A0A0  D0 1F 00 00 */	stfs f0, 0(r31)
/* 8019D0A4 0019A0A4  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019D0A8 0019A0A8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019D0AC 0019A0AC  7C 08 03 A6 */	mtlr r0
/* 8019D0B0 0019A0B0  38 21 00 20 */	addi r1, r1, 0x20
/* 8019D0B4 0019A0B4  4E 80 00 20 */	blr 

.global BattleAudience_GetAnimEnd
BattleAudience_GetAnimEnd:
/* 8019D0B8 0019A0B8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019D0BC 0019A0BC  7C 08 02 A6 */	mflr r0
/* 8019D0C0 0019A0C0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019D0C4 0019A0C4  48 00 55 D5 */	bl BattleAudienceGetPtr
/* 8019D0C8 0019A0C8  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019D0CC 0019A0CC  80 04 00 00 */	lwz r0, 0(r4)
/* 8019D0D0 0019A0D0  2C 00 FF FF */	cmpwi r0, -1
/* 8019D0D4 0019A0D4  41 82 00 0C */	beq .L_8019D0E0
/* 8019D0D8 0019A0D8  38 60 00 00 */	li r3, 0
/* 8019D0DC 0019A0DC  48 00 00 14 */	b .L_8019D0F0
.L_8019D0E0:
/* 8019D0E0 0019A0E0  80 03 00 2C */	lwz r0, 0x2c(r3)
/* 8019D0E4 0019A0E4  38 60 00 01 */	li r3, 1
/* 8019D0E8 0019A0E8  7C 00 00 34 */	cntlzw r0, r0
/* 8019D0EC 0019A0EC  5C 63 07 FE */	rlwnm r3, r3, r0, 0x1f, 0x1f
.L_8019D0F0:
/* 8019D0F0 0019A0F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019D0F4 0019A0F4  7C 08 03 A6 */	mtlr r0
/* 8019D0F8 0019A0F8  38 21 00 10 */	addi r1, r1, 0x10
/* 8019D0FC 0019A0FC  4E 80 00 20 */	blr 

.global BattleAudience_SetAnim
BattleAudience_SetAnim:
/* 8019D100 0019A100  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019D104 0019A104  7C 08 02 A6 */	mflr r0
/* 8019D108 0019A108  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019D10C 0019A10C  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 8019D110 0019A110  7C 7D 1B 78 */	mr r29, r3
/* 8019D114 0019A114  7C 9E 23 78 */	mr r30, r4
/* 8019D118 0019A118  7C BF 2B 78 */	mr r31, r5
/* 8019D11C 0019A11C  48 00 55 B9 */	bl BattleAudienceBaseGetPtr
/* 8019D120 0019A120  7F A3 EB 78 */	mr r3, r29
/* 8019D124 0019A124  48 00 55 75 */	bl BattleAudienceGetPtr
/* 8019D128 0019A128  80 83 00 00 */	lwz r4, 0(r3)
/* 8019D12C 0019A12C  54 80 07 FF */	clrlwi. r0, r4, 0x1f
/* 8019D130 0019A130  41 82 00 68 */	beq .L_8019D198
/* 8019D134 0019A134  54 80 05 EF */	rlwinm. r0, r4, 0, 0x17, 0x17
/* 8019D138 0019A138  40 82 00 60 */	bne .L_8019D198
/* 8019D13C 0019A13C  80 A3 00 24 */	lwz r5, 0x24(r3)
/* 8019D140 0019A140  57 C0 10 3A */	slwi r0, r30, 2
/* 8019D144 0019A144  80 83 00 20 */	lwz r4, 0x20(r3)
/* 8019D148 0019A148  28 05 00 00 */	cmplwi r5, 0
/* 8019D14C 0019A14C  7C 84 00 2E */	lwzx r4, r4, r0
/* 8019D150 0019A150  41 82 00 14 */	beq .L_8019D164
/* 8019D154 0019A154  7C 05 20 40 */	cmplw r5, r4
/* 8019D158 0019A158  40 82 00 0C */	bne .L_8019D164
/* 8019D15C 0019A15C  2C 1F 00 00 */	cmpwi r31, 0
/* 8019D160 0019A160  41 82 00 38 */	beq .L_8019D198
.L_8019D164:
/* 8019D164 0019A164  90 83 00 24 */	stw r4, 0x24(r3)
/* 8019D168 0019A168  38 A0 00 00 */	li r5, 0
/* 8019D16C 0019A16C  38 00 00 03 */	li r0, 3
/* 8019D170 0019A170  90 83 00 28 */	stw r4, 0x28(r3)
/* 8019D174 0019A174  7C A4 2B 78 */	mr r4, r5
/* 8019D178 0019A178  90 A3 00 2C */	stw r5, 0x2c(r3)
/* 8019D17C 0019A17C  7C 09 03 A6 */	mtctr r0
.L_8019D180:
/* 8019D180 0019A180  38 04 00 34 */	addi r0, r4, 0x34
/* 8019D184 0019A184  38 84 00 04 */	addi r4, r4, 4
/* 8019D188 0019A188  7C A3 01 2E */	stwx r5, r3, r0
/* 8019D18C 0019A18C  42 00 FF F4 */	bdnz .L_8019D180
/* 8019D190 0019A190  38 00 00 00 */	li r0, 0
/* 8019D194 0019A194  98 03 00 40 */	stb r0, 0x40(r3)
.L_8019D198:
/* 8019D198 0019A198  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 8019D19C 0019A19C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019D1A0 0019A1A0  7C 08 03 A6 */	mtlr r0
/* 8019D1A4 0019A1A4  38 21 00 20 */	addi r1, r1, 0x20
/* 8019D1A8 0019A1A8  4E 80 00 20 */	blr 

.global BattleAudience_Delete
BattleAudience_Delete:
/* 8019D1AC 0019A1AC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019D1B0 0019A1B0  7C 08 02 A6 */	mflr r0
/* 8019D1B4 0019A1B4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019D1B8 0019A1B8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019D1BC 0019A1BC  7C 7F 1B 78 */	mr r31, r3
/* 8019D1C0 0019A1C0  48 00 55 15 */	bl BattleAudienceBaseGetPtr
/* 8019D1C4 0019A1C4  7F E3 FB 78 */	mr r3, r31
/* 8019D1C8 0019A1C8  48 00 54 D1 */	bl BattleAudienceGetPtr
/* 8019D1CC 0019A1CC  80 03 00 00 */	lwz r0, 0(r3)
/* 8019D1D0 0019A1D0  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 8019D1D4 0019A1D4  41 82 00 0C */	beq .L_8019D1E0
/* 8019D1D8 0019A1D8  38 00 00 00 */	li r0, 0
/* 8019D1DC 0019A1DC  90 03 01 34 */	stw r0, 0x134(r3)
.L_8019D1E0:
/* 8019D1E0 0019A1E0  38 00 00 00 */	li r0, 0
/* 8019D1E4 0019A1E4  90 03 00 00 */	stw r0, 0(r3)
/* 8019D1E8 0019A1E8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019D1EC 0019A1EC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019D1F0 0019A1F0  7C 08 03 A6 */	mtlr r0
/* 8019D1F4 0019A1F4  38 21 00 10 */	addi r1, r1, 0x10
/* 8019D1F8 0019A1F8  4E 80 00 20 */	blr 

.global BattleAudience_Entry_Sub
BattleAudience_Entry_Sub:
/* 8019D1FC 0019A1FC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019D200 0019A200  7C 08 02 A6 */	mflr r0
/* 8019D204 0019A204  3C C0 80 30 */	lis r6, lbl_802F9578@ha
/* 8019D208 0019A208  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019D20C 0019A20C  BF 41 00 18 */	stmw r26, 0x18(r1)
/* 8019D210 0019A210  7C 7C 1B 78 */	mr r28, r3
/* 8019D214 0019A214  7C 9A 23 78 */	mr r26, r4
/* 8019D218 0019A218  7C BB 2B 78 */	mr r27, r5
/* 8019D21C 0019A21C  3B A6 95 78 */	addi r29, r6, lbl_802F9578@l
/* 8019D220 0019A220  48 00 54 B5 */	bl BattleAudienceBaseGetPtr
/* 8019D224 0019A224  4B F9 71 15 */	bl BattleStageGetPtr
/* 8019D228 0019A228  7C 7E 1B 78 */	mr r30, r3
/* 8019D22C 0019A22C  7F 83 E3 78 */	mr r3, r28
/* 8019D230 0019A230  48 00 54 69 */	bl BattleAudienceGetPtr
/* 8019D234 0019A234  39 00 00 00 */	li r8, 0
/* 8019D238 0019A238  7C 7F 1B 78 */	mr r31, r3
/* 8019D23C 0019A23C  91 03 00 04 */	stw r8, 4(r3)
/* 8019D240 0019A240  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019D244 0019A244  38 E0 FF FF */	li r7, -1
/* 8019D248 0019A248  57 40 28 34 */	slwi r0, r26, 5
/* 8019D24C 0019A24C  91 1F 00 08 */	stw r8, 8(r31)
/* 8019D250 0019A250  38 63 19 24 */	addi r3, r3, lbl_803B1924@l
/* 8019D254 0019A254  7C C3 02 14 */	add r6, r3, r0
/* 8019D258 0019A258  38 80 00 01 */	li r4, 1
/* 8019D25C 0019A25C  9B 7F 00 19 */	stb r27, 0x19(r31)
/* 8019D260 0019A260  7F 83 E3 78 */	mr r3, r28
/* 8019D264 0019A264  38 A0 00 01 */	li r5, 1
/* 8019D268 0019A268  9B 5F 00 1B */	stb r26, 0x1b(r31)
/* 8019D26C 0019A26C  B0 FF 00 1C */	sth r7, 0x1c(r31)
/* 8019D270 0019A270  80 06 00 04 */	lwz r0, 4(r6)
/* 8019D274 0019A274  90 1F 00 20 */	stw r0, 0x20(r31)
/* 8019D278 0019A278  91 1F 00 30 */	stw r8, 0x30(r31)
/* 8019D27C 0019A27C  4B FF FE 85 */	bl BattleAudience_SetAnim
/* 8019D280 0019A280  38 00 00 14 */	li r0, 0x14
/* 8019D284 0019A284  3C 80 43 30 */	lis r4, 0x4330
/* 8019D288 0019A288  7C 7C 03 D6 */	divw r3, r28, r0
/* 8019D28C 0019A28C  38 C0 00 00 */	li r6, 0
/* 8019D290 0019A290  98 DF 00 40 */	stb r6, 0x40(r31)
/* 8019D294 0019A294  38 A0 00 FF */	li r5, 0xff
/* 8019D298 0019A298  C8 5D 04 88 */	lfd f2, 0x488(r29)
/* 8019D29C 0019A29C  98 DF 00 43 */	stb r6, 0x43(r31)
/* 8019D2A0 0019A2A0  7C 03 01 D6 */	mullw r0, r3, r0
/* 8019D2A4 0019A2A4  98 DF 00 42 */	stb r6, 0x42(r31)
/* 8019D2A8 0019A2A8  C0 62 D2 F8 */	lfs f3, lbl_8041E678@sda21(r2)
/* 8019D2AC 0019A2AC  98 DF 00 41 */	stb r6, 0x41(r31)
/* 8019D2B0 0019A2B0  98 BF 00 44 */	stb r5, 0x44(r31)
/* 8019D2B4 0019A2B4  1C 63 00 1E */	mulli r3, r3, 0x1e
/* 8019D2B8 0019A2B8  7C A0 E0 50 */	subf r5, r0, r28
/* 8019D2BC 0019A2BC  90 81 00 08 */	stw r4, 8(r1)
/* 8019D2C0 0019A2C0  C0 9E 0B 34 */	lfs f4, 0xb34(r30)
/* 8019D2C4 0019A2C4  38 03 00 73 */	addi r0, r3, 0x73
/* 8019D2C8 0019A2C8  6C A3 80 00 */	xoris r3, r5, 0x8000
/* 8019D2CC 0019A2CC  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8019D2D0 0019A2D0  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019D2D4 0019A2D4  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019D2D8 0019A2D8  D0 9F 00 4C */	stfs f4, 0x4c(r31)
/* 8019D2DC 0019A2DC  EC 20 10 28 */	fsubs f1, f0, f2
/* 8019D2E0 0019A2E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019D2E4 0019A2E4  90 81 00 10 */	stw r4, 0x10(r1)
/* 8019D2E8 0019A2E8  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 8019D2EC 0019A2EC  D0 9F 00 B8 */	stfs f4, 0xb8(r31)
/* 8019D2F0 0019A2F0  EC 00 10 28 */	fsubs f0, f0, f2
/* 8019D2F4 0019A2F4  EC 03 00 7A */	fmadds f0, f3, f1, f0
/* 8019D2F8 0019A2F8  D0 1F 00 50 */	stfs f0, 0x50(r31)
/* 8019D2FC 0019A2FC  D0 1F 00 BC */	stfs f0, 0xbc(r31)
/* 8019D300 0019A300  88 1F 00 1B */	lbz r0, 0x1b(r31)
/* 8019D304 0019A304  28 00 00 0B */	cmplwi r0, 0xb
/* 8019D308 0019A308  40 82 00 20 */	bne .L_8019D328
/* 8019D30C 0019A30C  C0 1F 00 BC */	lfs f0, 0xbc(r31)
/* 8019D310 0019A310  C0 22 D2 FC */	lfs f1, lbl_8041E67C@sda21(r2)
/* 8019D314 0019A314  EC 00 08 2A */	fadds f0, f0, f1
/* 8019D318 0019A318  D0 1F 00 BC */	stfs f0, 0xbc(r31)
/* 8019D31C 0019A31C  C0 1F 00 50 */	lfs f0, 0x50(r31)
/* 8019D320 0019A320  EC 00 08 2A */	fadds f0, f0, f1
/* 8019D324 0019A324  D0 1F 00 50 */	stfs f0, 0x50(r31)
.L_8019D328:
/* 8019D328 0019A328  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 8019D32C 0019A32C  28 00 00 0B */	cmplwi r0, 0xb
/* 8019D330 0019A330  40 82 00 0C */	bne .L_8019D33C
/* 8019D334 0019A334  C0 02 D3 00 */	lfs f0, lbl_8041E680@sda21(r2)
/* 8019D338 0019A338  D0 1F 00 4C */	stfs f0, 0x4c(r31)
.L_8019D33C:
/* 8019D33C 0019A33C  80 7D 02 88 */	lwz r3, 0x288(r29)
/* 8019D340 0019A340  2C 1C 00 04 */	cmpwi r28, 4
/* 8019D344 0019A344  80 1D 02 8C */	lwz r0, 0x28c(r29)
/* 8019D348 0019A348  C0 02 D3 04 */	lfs f0, lbl_8041E684@sda21(r2)
/* 8019D34C 0019A34C  90 7F 00 84 */	stw r3, 0x84(r31)
/* 8019D350 0019A350  90 1F 00 88 */	stw r0, 0x88(r31)
/* 8019D354 0019A354  80 1D 02 90 */	lwz r0, 0x290(r29)
/* 8019D358 0019A358  90 1F 00 8C */	stw r0, 0x8c(r31)
/* 8019D35C 0019A35C  80 7F 00 84 */	lwz r3, 0x84(r31)
/* 8019D360 0019A360  80 1F 00 88 */	lwz r0, 0x88(r31)
/* 8019D364 0019A364  90 7F 00 78 */	stw r3, 0x78(r31)
/* 8019D368 0019A368  90 1F 00 7C */	stw r0, 0x7c(r31)
/* 8019D36C 0019A36C  80 1F 00 8C */	lwz r0, 0x8c(r31)
/* 8019D370 0019A370  90 1F 00 80 */	stw r0, 0x80(r31)
/* 8019D374 0019A374  80 7D 02 94 */	lwz r3, 0x294(r29)
/* 8019D378 0019A378  80 1D 02 98 */	lwz r0, 0x298(r29)
/* 8019D37C 0019A37C  90 7F 00 90 */	stw r3, 0x90(r31)
/* 8019D380 0019A380  90 1F 00 94 */	stw r0, 0x94(r31)
/* 8019D384 0019A384  80 1D 02 9C */	lwz r0, 0x29c(r29)
/* 8019D388 0019A388  90 1F 00 98 */	stw r0, 0x98(r31)
/* 8019D38C 0019A38C  80 7D 02 A0 */	lwz r3, 0x2a0(r29)
/* 8019D390 0019A390  80 1D 02 A4 */	lwz r0, 0x2a4(r29)
/* 8019D394 0019A394  90 7F 00 9C */	stw r3, 0x9c(r31)
/* 8019D398 0019A398  90 1F 00 A0 */	stw r0, 0xa0(r31)
/* 8019D39C 0019A39C  80 1D 02 A8 */	lwz r0, 0x2a8(r29)
/* 8019D3A0 0019A3A0  90 1F 00 A4 */	stw r0, 0xa4(r31)
/* 8019D3A4 0019A3A4  80 7D 02 AC */	lwz r3, 0x2ac(r29)
/* 8019D3A8 0019A3A8  80 1D 02 B0 */	lwz r0, 0x2b0(r29)
/* 8019D3AC 0019A3AC  90 7F 00 A8 */	stw r3, 0xa8(r31)
/* 8019D3B0 0019A3B0  90 1F 00 AC */	stw r0, 0xac(r31)
/* 8019D3B4 0019A3B4  80 1D 02 B4 */	lwz r0, 0x2b4(r29)
/* 8019D3B8 0019A3B8  90 1F 00 B0 */	stw r0, 0xb0(r31)
/* 8019D3BC 0019A3BC  80 7D 02 B8 */	lwz r3, 0x2b8(r29)
/* 8019D3C0 0019A3C0  80 1D 02 BC */	lwz r0, 0x2bc(r29)
/* 8019D3C4 0019A3C4  90 7F 00 54 */	stw r3, 0x54(r31)
/* 8019D3C8 0019A3C8  90 1F 00 58 */	stw r0, 0x58(r31)
/* 8019D3CC 0019A3CC  80 1D 02 C0 */	lwz r0, 0x2c0(r29)
/* 8019D3D0 0019A3D0  90 1F 00 5C */	stw r0, 0x5c(r31)
/* 8019D3D4 0019A3D4  80 7D 02 C4 */	lwz r3, 0x2c4(r29)
/* 8019D3D8 0019A3D8  80 1D 02 C8 */	lwz r0, 0x2c8(r29)
/* 8019D3DC 0019A3DC  90 7F 00 60 */	stw r3, 0x60(r31)
/* 8019D3E0 0019A3E0  90 1F 00 64 */	stw r0, 0x64(r31)
/* 8019D3E4 0019A3E4  80 1D 02 CC */	lwz r0, 0x2cc(r29)
/* 8019D3E8 0019A3E8  90 1F 00 68 */	stw r0, 0x68(r31)
/* 8019D3EC 0019A3EC  80 7D 02 D0 */	lwz r3, 0x2d0(r29)
/* 8019D3F0 0019A3F0  80 1D 02 D4 */	lwz r0, 0x2d4(r29)
/* 8019D3F4 0019A3F4  90 7F 00 6C */	stw r3, 0x6c(r31)
/* 8019D3F8 0019A3F8  90 1F 00 70 */	stw r0, 0x70(r31)
/* 8019D3FC 0019A3FC  80 1D 02 D8 */	lwz r0, 0x2d8(r29)
/* 8019D400 0019A400  90 1F 00 74 */	stw r0, 0x74(r31)
/* 8019D404 0019A404  D0 1F 00 E8 */	stfs f0, 0xe8(r31)
/* 8019D408 0019A408  41 80 00 0C */	blt .L_8019D414
/* 8019D40C 0019A40C  2C 1C 00 0F */	cmpwi r28, 0xf
/* 8019D410 0019A410  40 81 00 24 */	ble .L_8019D434
.L_8019D414:
/* 8019D414 0019A414  2C 1C 00 18 */	cmpwi r28, 0x18
/* 8019D418 0019A418  41 80 00 0C */	blt .L_8019D424
/* 8019D41C 0019A41C  2C 1C 00 23 */	cmpwi r28, 0x23
/* 8019D420 0019A420  40 81 00 14 */	ble .L_8019D434
.L_8019D424:
/* 8019D424 0019A424  2C 1C 00 2C */	cmpwi r28, 0x2c
/* 8019D428 0019A428  41 80 00 18 */	blt .L_8019D440
/* 8019D42C 0019A42C  2C 1C 00 37 */	cmpwi r28, 0x37
/* 8019D430 0019A430  41 81 00 10 */	bgt .L_8019D440
.L_8019D434:
/* 8019D434 0019A434  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019D438 0019A438  60 00 00 08 */	ori r0, r0, 8
/* 8019D43C 0019A43C  90 1F 00 00 */	stw r0, 0(r31)
.L_8019D440:
/* 8019D440 0019A440  BB 41 00 18 */	lmw r26, 0x18(r1)
/* 8019D444 0019A444  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019D448 0019A448  7C 08 03 A6 */	mtlr r0
/* 8019D44C 0019A44C  38 21 00 30 */	addi r1, r1, 0x30
/* 8019D450 0019A450  4E 80 00 20 */	blr 

.global BattleAudience_Entry
BattleAudience_Entry:
/* 8019D454 0019A454  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8019D458 0019A458  7C 08 02 A6 */	mflr r0
/* 8019D45C 0019A45C  90 01 00 34 */	stw r0, 0x34(r1)
/* 8019D460 0019A460  BF 81 00 20 */	stmw r28, 0x20(r1)
/* 8019D464 0019A464  7C 7C 1B 78 */	mr r28, r3
/* 8019D468 0019A468  7C 9D 23 78 */	mr r29, r4
/* 8019D46C 0019A46C  7C BE 2B 78 */	mr r30, r5
/* 8019D470 0019A470  48 00 52 65 */	bl BattleAudienceBaseGetPtr
/* 8019D474 0019A474  4B F9 6E C5 */	bl BattleStageGetPtr
/* 8019D478 0019A478  7F 83 E3 78 */	mr r3, r28
/* 8019D47C 0019A47C  48 00 52 1D */	bl BattleAudienceGetPtr
/* 8019D480 0019A480  3C 80 80 3B */	lis r4, lbl_803B1924@ha
/* 8019D484 0019A484  57 A0 2C F4 */	rlwinm r0, r29, 5, 0x13, 0x1a
/* 8019D488 0019A488  38 84 19 24 */	addi r4, r4, lbl_803B1924@l
/* 8019D48C 0019A48C  7C 7F 1B 78 */	mr r31, r3
/* 8019D490 0019A490  7C 04 00 AE */	lbzx r0, r4, r0
/* 8019D494 0019A494  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019D498 0019A498  40 82 00 98 */	bne .L_8019D530
/* 8019D49C 0019A49C  80 7F 00 00 */	lwz r3, 0(r31)
/* 8019D4A0 0019A4A0  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019D4A4 0019A4A4  41 82 00 0C */	beq .L_8019D4B0
/* 8019D4A8 0019A4A8  38 60 00 00 */	li r3, 0
/* 8019D4AC 0019A4AC  48 00 01 64 */	b .L_8019D610
.L_8019D4B0:
/* 8019D4B0 0019A4B0  54 60 05 EF */	rlwinm. r0, r3, 0, 0x17, 0x17
/* 8019D4B4 0019A4B4  41 82 00 0C */	beq .L_8019D4C0
/* 8019D4B8 0019A4B8  38 60 00 00 */	li r3, 0
/* 8019D4BC 0019A4BC  48 00 01 54 */	b .L_8019D610
.L_8019D4C0:
/* 8019D4C0 0019A4C0  38 00 00 05 */	li r0, 5
/* 8019D4C4 0019A4C4  90 1F 00 00 */	stw r0, 0(r31)
/* 8019D4C8 0019A4C8  48 0C 8E AD */	bl rand
/* 8019D4CC 0019A4CC  38 E0 00 14 */	li r7, 0x14
/* 8019D4D0 0019A4D0  3C 00 43 30 */	lis r0, 0x4330
/* 8019D4D4 0019A4D4  7C DC 3B D6 */	divw r6, r28, r7
/* 8019D4D8 0019A4D8  90 01 00 08 */	stw r0, 8(r1)
/* 8019D4DC 0019A4DC  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019D4E0 0019A4E0  C8 24 9A 00 */	lfd f1, lbl_802F9A00@l(r4)
/* 8019D4E4 0019A4E4  39 00 7F FF */	li r8, 0x7fff
/* 8019D4E8 0019A4E8  7F C5 F3 78 */	mr r5, r30
/* 8019D4EC 0019A4EC  1D 23 00 0A */	mulli r9, r3, 0xa
/* 8019D4F0 0019A4F0  7F 83 E3 78 */	mr r3, r28
/* 8019D4F4 0019A4F4  57 A4 06 3E */	clrlwi r4, r29, 0x18
/* 8019D4F8 0019A4F8  7C 06 39 D6 */	mullw r0, r6, r7
/* 8019D4FC 0019A4FC  7C C9 43 D6 */	divw r6, r9, r8
/* 8019D500 0019A500  7C 00 E0 50 */	subf r0, r0, r28
/* 8019D504 0019A504  1C 00 00 19 */	mulli r0, r0, 0x19
/* 8019D508 0019A508  7C C0 32 14 */	add r6, r0, r6
/* 8019D50C 0019A50C  38 06 FF 15 */	addi r0, r6, -235
/* 8019D510 0019A510  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8019D514 0019A514  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019D518 0019A518  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019D51C 0019A51C  EC 00 08 28 */	fsubs f0, f0, f1
/* 8019D520 0019A520  D0 1F 00 48 */	stfs f0, 0x48(r31)
/* 8019D524 0019A524  D0 1F 00 B4 */	stfs f0, 0xb4(r31)
/* 8019D528 0019A528  4B FF FC D5 */	bl BattleAudience_Entry_Sub
/* 8019D52C 0019A52C  48 00 00 E0 */	b .L_8019D60C
.L_8019D530:
/* 8019D530 0019A530  57 83 0F FE */	srwi r3, r28, 0x1f
/* 8019D534 0019A534  57 80 07 FE */	clrlwi r0, r28, 0x1f
/* 8019D538 0019A538  7C 00 1A 78 */	xor r0, r0, r3
/* 8019D53C 0019A53C  7C 03 00 50 */	subf r0, r3, r0
/* 8019D540 0019A540  2C 00 00 01 */	cmpwi r0, 1
/* 8019D544 0019A544  40 82 00 0C */	bne .L_8019D550
/* 8019D548 0019A548  38 60 00 00 */	li r3, 0
/* 8019D54C 0019A54C  48 00 00 C4 */	b .L_8019D610
.L_8019D550:
/* 8019D550 0019A550  80 7F 00 00 */	lwz r3, 0(r31)
/* 8019D554 0019A554  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019D558 0019A558  41 82 00 0C */	beq .L_8019D564
/* 8019D55C 0019A55C  38 60 00 00 */	li r3, 0
/* 8019D560 0019A560  48 00 00 B0 */	b .L_8019D610
.L_8019D564:
/* 8019D564 0019A564  54 60 05 EF */	rlwinm. r0, r3, 0, 0x17, 0x17
/* 8019D568 0019A568  41 82 00 0C */	beq .L_8019D574
/* 8019D56C 0019A56C  38 60 00 00 */	li r3, 0
/* 8019D570 0019A570  48 00 00 A0 */	b .L_8019D610
.L_8019D574:
/* 8019D574 0019A574  38 00 00 85 */	li r0, 0x85
/* 8019D578 0019A578  90 1F 00 00 */	stw r0, 0(r31)
/* 8019D57C 0019A57C  48 0C 8D F9 */	bl rand
/* 8019D580 0019A580  38 C0 00 14 */	li r6, 0x14
/* 8019D584 0019A584  3C 80 43 30 */	lis r4, 0x4330
/* 8019D588 0019A588  7C 1C 33 D6 */	divw r0, r28, r6
/* 8019D58C 0019A58C  3C A0 80 30 */	lis r5, lbl_802F9A00@ha
/* 8019D590 0019A590  C8 85 9A 00 */	lfd f4, lbl_802F9A00@l(r5)
/* 8019D594 0019A594  38 E0 7F FF */	li r7, 0x7fff
/* 8019D598 0019A598  90 81 00 08 */	stw r4, 8(r1)
/* 8019D59C 0019A59C  7F C5 F3 78 */	mr r5, r30
/* 8019D5A0 0019A5A0  1D 03 00 0A */	mulli r8, r3, 0xa
/* 8019D5A4 0019A5A4  90 81 00 10 */	stw r4, 0x10(r1)
/* 8019D5A8 0019A5A8  C0 42 D3 08 */	lfs f2, lbl_8041E688@sda21(r2)
/* 8019D5AC 0019A5AC  7F 83 E3 78 */	mr r3, r28
/* 8019D5B0 0019A5B0  C0 02 D2 AC */	lfs f0, lbl_8041E62C@sda21(r2)
/* 8019D5B4 0019A5B4  57 A4 06 3E */	clrlwi r4, r29, 0x18
/* 8019D5B8 0019A5B8  7C 00 31 D6 */	mullw r0, r0, r6
/* 8019D5BC 0019A5BC  7C E8 3B D6 */	divw r7, r8, r7
/* 8019D5C0 0019A5C0  7C 00 E0 50 */	subf r0, r0, r28
/* 8019D5C4 0019A5C4  6C E6 80 00 */	xoris r6, r7, 0x8000
/* 8019D5C8 0019A5C8  90 C1 00 0C */	stw r6, 0xc(r1)
/* 8019D5CC 0019A5CC  1C C0 00 19 */	mulli r6, r0, 0x19
/* 8019D5D0 0019A5D0  C8 21 00 08 */	lfd f1, 8(r1)
/* 8019D5D4 0019A5D4  38 06 FF 1A */	addi r0, r6, -230
/* 8019D5D8 0019A5D8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8019D5DC 0019A5DC  EC 61 20 28 */	fsubs f3, f1, f4
/* 8019D5E0 0019A5E0  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019D5E4 0019A5E4  C8 21 00 10 */	lfd f1, 0x10(r1)
/* 8019D5E8 0019A5E8  EC 21 20 28 */	fsubs f1, f1, f4
/* 8019D5EC 0019A5EC  EC 22 08 2A */	fadds f1, f2, f1
/* 8019D5F0 0019A5F0  EC 21 18 2A */	fadds f1, f1, f3
/* 8019D5F4 0019A5F4  EC 01 00 28 */	fsubs f0, f1, f0
/* 8019D5F8 0019A5F8  D0 1F 00 48 */	stfs f0, 0x48(r31)
/* 8019D5FC 0019A5FC  D0 1F 00 B4 */	stfs f0, 0xb4(r31)
/* 8019D600 0019A600  4B FF FB FD */	bl BattleAudience_Entry_Sub
/* 8019D604 0019A604  38 00 01 01 */	li r0, 0x101
/* 8019D608 0019A608  90 1F 01 34 */	stw r0, 0x134(r31)
.L_8019D60C:
/* 8019D60C 0019A60C  38 60 00 01 */	li r3, 1
.L_8019D610:
/* 8019D610 0019A610  BB 81 00 20 */	lmw r28, 0x20(r1)
/* 8019D614 0019A614  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019D618 0019A618  7C 08 03 A6 */	mtlr r0
/* 8019D61C 0019A61C  38 21 00 30 */	addi r1, r1, 0x30
/* 8019D620 0019A620  4E 80 00 20 */	blr 
BattleAudienceDispWin:
/* 8019D624 0019A624  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 8019D628 0019A628  7C 08 02 A6 */	mflr r0
/* 8019D62C 0019A62C  90 01 00 64 */	stw r0, 0x64(r1)
/* 8019D630 0019A630  93 E1 00 5C */	stw r31, 0x5c(r1)
/* 8019D634 0019A634  48 00 50 A1 */	bl BattleAudienceBaseGetPtr
/* 8019D638 0019A638  48 00 4F F9 */	bl BattleAudienceWinGetPtr
/* 8019D63C 0019A63C  80 02 D2 8C */	lwz r0, lbl_8041E60C@sda21(r2)
/* 8019D640 0019A640  7C 7F 1B 78 */	mr r31, r3
/* 8019D644 0019A644  C0 62 D3 0C */	lfs f3, lbl_8041E68C@sda21(r2)
/* 8019D648 0019A648  38 81 00 0C */	addi r4, r1, 0xc
/* 8019D64C 0019A64C  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019D650 0019A650  38 60 00 00 */	li r3, 0
/* 8019D654 0019A654  C0 82 D3 10 */	lfs f4, lbl_8041E690@sda21(r2)
/* 8019D658 0019A658  C0 3F 00 08 */	lfs f1, 8(r31)
/* 8019D65C 0019A65C  C0 5F 00 0C */	lfs f2, 0xc(r31)
/* 8019D660 0019A660  C0 A2 D3 14 */	lfs f5, lbl_8041E694@sda21(r2)
/* 8019D664 0019A664  4B ED D2 FD */	bl windowDispGX_Waku_col
/* 8019D668 0019A668  3C 60 80 30 */	lis r3, lbl_802F97F4@ha
/* 8019D66C 0019A66C  C0 62 D3 18 */	lfs f3, lbl_8041E698@sda21(r2)
/* 8019D670 0019A670  38 A3 97 F4 */	addi r5, r3, lbl_802F97F4@l
/* 8019D674 0019A674  C0 02 D3 10 */	lfs f0, lbl_8041E690@sda21(r2)
/* 8019D678 0019A678  80 E5 00 00 */	lwz r7, 0(r5)
/* 8019D67C 0019A67C  38 61 00 10 */	addi r3, r1, 0x10
/* 8019D680 0019A680  80 C5 00 04 */	lwz r6, 4(r5)
/* 8019D684 0019A684  38 80 00 10 */	li r4, 0x10
/* 8019D688 0019A688  80 05 00 08 */	lwz r0, 8(r5)
/* 8019D68C 0019A68C  38 A0 02 09 */	li r5, 0x209
/* 8019D690 0019A690  90 E1 00 10 */	stw r7, 0x10(r1)
/* 8019D694 0019A694  C0 22 D3 1C */	lfs f1, lbl_8041E69C@sda21(r2)
/* 8019D698 0019A698  90 C1 00 14 */	stw r6, 0x14(r1)
/* 8019D69C 0019A69C  90 01 00 18 */	stw r0, 0x18(r1)
/* 8019D6A0 0019A6A0  C0 5F 00 08 */	lfs f2, 8(r31)
/* 8019D6A4 0019A6A4  EC 43 10 2A */	fadds f2, f3, f2
/* 8019D6A8 0019A6A8  D0 41 00 10 */	stfs f2, 0x10(r1)
/* 8019D6AC 0019A6AC  C0 5F 00 0C */	lfs f2, 0xc(r31)
/* 8019D6B0 0019A6B0  EC 02 00 28 */	fsubs f0, f2, f0
/* 8019D6B4 0019A6B4  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 8019D6B8 0019A6B8  4B E7 CE 7D */	bl iconDispGx
/* 8019D6BC 0019A6BC  C0 62 D2 D8 */	lfs f3, lbl_8041E658@sda21(r2)
/* 8019D6C0 0019A6C0  38 61 00 1C */	addi r3, r1, 0x1c
/* 8019D6C4 0019A6C4  C0 3F 00 08 */	lfs f1, 8(r31)
/* 8019D6C8 0019A6C8  C0 5F 00 0C */	lfs f2, 0xc(r31)
/* 8019D6CC 0019A6CC  C0 02 D3 10 */	lfs f0, lbl_8041E690@sda21(r2)
/* 8019D6D0 0019A6D0  EC 23 08 2A */	fadds f1, f3, f1
/* 8019D6D4 0019A6D4  C0 62 D2 98 */	lfs f3, lbl_8041E618@sda21(r2)
/* 8019D6D8 0019A6D8  EC 42 00 28 */	fsubs f2, f2, f0
/* 8019D6DC 0019A6DC  48 0F AD 51 */	bl PSMTXTrans
/* 8019D6E0 0019A6E0  80 02 D2 90 */	lwz r0, lbl_8041E610@sda21(r2)
/* 8019D6E4 0019A6E4  38 61 00 1C */	addi r3, r1, 0x1c
/* 8019D6E8 0019A6E8  38 C1 00 08 */	addi r6, r1, 8
/* 8019D6EC 0019A6EC  38 A0 00 00 */	li r5, 0
/* 8019D6F0 0019A6F0  90 01 00 08 */	stw r0, 8(r1)
/* 8019D6F4 0019A6F4  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8019D6F8 0019A6F8  FC 00 00 1E */	fctiwz f0, f0
/* 8019D6FC 0019A6FC  D8 01 00 50 */	stfd f0, 0x50(r1)
/* 8019D700 0019A700  80 81 00 54 */	lwz r4, 0x54(r1)
/* 8019D704 0019A704  4B E7 B7 55 */	bl iconNumberDispGx
/* 8019D708 0019A708  80 01 00 64 */	lwz r0, 0x64(r1)
/* 8019D70C 0019A70C  83 E1 00 5C */	lwz r31, 0x5c(r1)
/* 8019D710 0019A710  7C 08 03 A6 */	mtlr r0
/* 8019D714 0019A714  38 21 00 60 */	addi r1, r1, 0x60
/* 8019D718 0019A718  4E 80 00 20 */	blr 
BattleAudienceDispApSrc:
/* 8019D71C 0019A71C  94 21 FF 20 */	stwu r1, -0xe0(r1)
/* 8019D720 0019A720  7C 08 02 A6 */	mflr r0
/* 8019D724 0019A724  90 01 00 E4 */	stw r0, 0xe4(r1)
/* 8019D728 0019A728  BF C1 00 D8 */	stmw r30, 0xd8(r1)
/* 8019D72C 0019A72C  48 00 4F A9 */	bl BattleAudienceBaseGetPtr
/* 8019D730 0019A730  7C 7F 1B 78 */	mr r31, r3
/* 8019D734 0019A734  38 60 00 08 */	li r3, 8
/* 8019D738 0019A738  4B E7 1A 19 */	bl camGetPtr
/* 8019D73C 0019A73C  48 00 0D 21 */	bl BattleAudienceGXInit
/* 8019D740 0019A740  38 60 00 01 */	li r3, 1
/* 8019D744 0019A744  38 80 00 04 */	li r4, 4
/* 8019D748 0019A748  38 A0 00 05 */	li r5, 5
/* 8019D74C 0019A74C  38 C0 00 00 */	li r6, 0
/* 8019D750 0019A750  48 11 5D D9 */	bl GXSetBlendMode
/* 8019D754 0019A754  38 60 00 01 */	li r3, 1
/* 8019D758 0019A758  48 11 5E B1 */	bl GXSetZCompLoc
/* 8019D75C 0019A75C  38 60 00 07 */	li r3, 7
/* 8019D760 0019A760  38 80 00 00 */	li r4, 0
/* 8019D764 0019A764  38 A0 00 00 */	li r5, 0
/* 8019D768 0019A768  38 C0 00 07 */	li r6, 7
/* 8019D76C 0019A76C  38 E0 00 00 */	li r7, 0
/* 8019D770 0019A770  48 11 57 ED */	bl GXSetAlphaCompare
/* 8019D774 0019A774  38 60 00 01 */	li r3, 1
/* 8019D778 0019A778  38 80 00 03 */	li r4, 3
/* 8019D77C 0019A77C  38 A0 00 00 */	li r5, 0
/* 8019D780 0019A780  48 11 5E 55 */	bl GXSetZMode
/* 8019D784 0019A784  3F FF 00 01 */	addis r31, r31, 1
/* 8019D788 0019A788  3B C0 00 00 */	li r30, 0
/* 8019D78C 0019A78C  3B FF 0E 7C */	addi r31, r31, 0xe7c
.L_8019D790:
/* 8019D790 0019A790  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019D794 0019A794  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019D798 0019A798  41 82 00 88 */	beq .L_8019D820
/* 8019D79C 0019A79C  C0 3F 00 38 */	lfs f1, 0x38(r31)
/* 8019D7A0 0019A7A0  38 61 00 70 */	addi r3, r1, 0x70
/* 8019D7A4 0019A7A4  C0 5F 00 3C */	lfs f2, 0x3c(r31)
/* 8019D7A8 0019A7A8  C0 7F 00 40 */	lfs f3, 0x40(r31)
/* 8019D7AC 0019A7AC  48 0F AD 01 */	bl PSMTXScale
/* 8019D7B0 0019A7B0  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019D7B4 0019A7B4  38 61 00 A0 */	addi r3, r1, 0xa0
/* 8019D7B8 0019A7B8  38 80 00 7A */	li r4, 0x7a
/* 8019D7BC 0019A7BC  48 0F AA 31 */	bl PSMTXRotRad
/* 8019D7C0 0019A7C0  C0 3F 00 08 */	lfs f1, 8(r31)
/* 8019D7C4 0019A7C4  38 61 00 40 */	addi r3, r1, 0x40
/* 8019D7C8 0019A7C8  C0 5F 00 0C */	lfs f2, 0xc(r31)
/* 8019D7CC 0019A7CC  C0 62 D2 98 */	lfs f3, lbl_8041E618@sda21(r2)
/* 8019D7D0 0019A7D0  48 0F AC 5D */	bl PSMTXTrans
/* 8019D7D4 0019A7D4  38 61 00 70 */	addi r3, r1, 0x70
/* 8019D7D8 0019A7D8  38 81 00 A0 */	addi r4, r1, 0xa0
/* 8019D7DC 0019A7DC  38 A1 00 10 */	addi r5, r1, 0x10
/* 8019D7E0 0019A7E0  48 0F A7 81 */	bl PSMTXConcat
/* 8019D7E4 0019A7E4  38 81 00 10 */	addi r4, r1, 0x10
/* 8019D7E8 0019A7E8  38 61 00 40 */	addi r3, r1, 0x40
/* 8019D7EC 0019A7EC  7C 85 23 78 */	mr r5, r4
/* 8019D7F0 0019A7F0  48 0F A7 71 */	bl PSMTXConcat
/* 8019D7F4 0019A7F4  80 82 D2 88 */	lwz r4, lbl_8041E608@sda21(r2)
/* 8019D7F8 0019A7F8  38 61 00 10 */	addi r3, r1, 0x10
/* 8019D7FC 0019A7FC  88 1F 00 5C */	lbz r0, 0x5c(r31)
/* 8019D800 0019A800  38 C1 00 0C */	addi r6, r1, 0xc
/* 8019D804 0019A804  90 81 00 08 */	stw r4, 8(r1)
/* 8019D808 0019A808  38 80 00 10 */	li r4, 0x10
/* 8019D80C 0019A80C  38 A0 01 B2 */	li r5, 0x1b2
/* 8019D810 0019A810  98 01 00 0B */	stb r0, 0xb(r1)
/* 8019D814 0019A814  80 01 00 08 */	lwz r0, 8(r1)
/* 8019D818 0019A818  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019D81C 0019A81C  4B E7 C9 45 */	bl iconDispGxCol
.L_8019D820:
/* 8019D820 0019A820  3B DE 00 01 */	addi r30, r30, 1
/* 8019D824 0019A824  3B FF 00 60 */	addi r31, r31, 0x60
/* 8019D828 0019A828  2C 1E 00 64 */	cmpwi r30, 0x64
/* 8019D82C 0019A82C  41 80 FF 64 */	blt .L_8019D790
/* 8019D830 0019A830  BB C1 00 D8 */	lmw r30, 0xd8(r1)
/* 8019D834 0019A834  80 01 00 E4 */	lwz r0, 0xe4(r1)
/* 8019D838 0019A838  7C 08 03 A6 */	mtlr r0
/* 8019D83C 0019A83C  38 21 00 E0 */	addi r1, r1, 0xe0
/* 8019D840 0019A840  4E 80 00 20 */	blr 
BattleAudienceDispItem:
/* 8019D844 0019A844  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 8019D848 0019A848  7C 08 02 A6 */	mflr r0
/* 8019D84C 0019A84C  90 01 00 84 */	stw r0, 0x84(r1)
/* 8019D850 0019A850  BF A1 00 74 */	stmw r29, 0x74(r1)
/* 8019D854 0019A854  48 00 0C 09 */	bl BattleAudienceGXInit
/* 8019D858 0019A858  3B C0 00 00 */	li r30, 0
/* 8019D85C 0019A85C  38 60 00 00 */	li r3, 0
/* 8019D860 0019A860  48 00 4D F9 */	bl BattleAudienceItemGetPtr
/* 8019D864 0019A864  7C 7F 1B 78 */	mr r31, r3
.L_8019D868:
/* 8019D868 0019A868  80 7F 00 00 */	lwz r3, 0(r31)
/* 8019D86C 0019A86C  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019D870 0019A870  41 82 00 B8 */	beq .L_8019D928
/* 8019D874 0019A874  54 60 07 BD */	rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 8019D878 0019A878  41 82 00 B0 */	beq .L_8019D928
/* 8019D87C 0019A87C  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 8019D880 0019A880  3C 60 80 31 */	lis r3, lbl_8030EE58@ha
/* 8019D884 0019A884  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019D888 0019A888  38 03 EE 58 */	addi r0, r3, lbl_8030EE58@l
/* 8019D88C 0019A88C  1C 84 00 28 */	mulli r4, r4, 0x28
/* 8019D890 0019A890  C0 42 D3 20 */	lfs f2, lbl_8041E6A0@sda21(r2)
/* 8019D894 0019A894  FC 60 08 90 */	fmr f3, f1
/* 8019D898 0019A898  38 61 00 38 */	addi r3, r1, 0x38
/* 8019D89C 0019A89C  7C 80 22 14 */	add r4, r0, r4
/* 8019D8A0 0019A8A0  A3 A4 00 20 */	lhz r29, 0x20(r4)
/* 8019D8A4 0019A8A4  48 0F AB 89 */	bl PSMTXTrans
/* 8019D8A8 0019A8A8  C0 22 D3 24 */	lfs f1, lbl_8041E6A4@sda21(r2)
/* 8019D8AC 0019A8AC  38 61 00 08 */	addi r3, r1, 8
/* 8019D8B0 0019A8B0  C0 1F 00 24 */	lfs f0, 0x24(r31)
/* 8019D8B4 0019A8B4  38 80 00 7A */	li r4, 0x7a
/* 8019D8B8 0019A8B8  EC 21 00 32 */	fmuls f1, f1, f0
/* 8019D8BC 0019A8BC  48 0F A9 31 */	bl PSMTXRotRad
/* 8019D8C0 0019A8C0  38 81 00 38 */	addi r4, r1, 0x38
/* 8019D8C4 0019A8C4  38 61 00 08 */	addi r3, r1, 8
/* 8019D8C8 0019A8C8  7C 85 23 78 */	mr r5, r4
/* 8019D8CC 0019A8CC  48 0F A6 95 */	bl PSMTXConcat
/* 8019D8D0 0019A8D0  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019D8D4 0019A8D4  38 61 00 38 */	addi r3, r1, 0x38
/* 8019D8D8 0019A8D8  C0 42 D3 28 */	lfs f2, lbl_8041E6A8@sda21(r2)
/* 8019D8DC 0019A8DC  7C 64 1B 78 */	mr r4, r3
/* 8019D8E0 0019A8E0  FC 60 08 90 */	fmr f3, f1
/* 8019D8E4 0019A8E4  48 0F AB 7D */	bl PSMTXTransApply
/* 8019D8E8 0019A8E8  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 8019D8EC 0019A8EC  38 61 00 38 */	addi r3, r1, 0x38
/* 8019D8F0 0019A8F0  C0 62 D2 A0 */	lfs f3, lbl_8041E620@sda21(r2)
/* 8019D8F4 0019A8F4  7C 64 1B 78 */	mr r4, r3
/* 8019D8F8 0019A8F8  FC 40 08 90 */	fmr f2, f1
/* 8019D8FC 0019A8FC  48 0F AB D9 */	bl PSMTXScaleApply
/* 8019D900 0019A900  38 61 00 38 */	addi r3, r1, 0x38
/* 8019D904 0019A904  C0 3F 00 14 */	lfs f1, 0x14(r31)
/* 8019D908 0019A908  C0 5F 00 18 */	lfs f2, 0x18(r31)
/* 8019D90C 0019A90C  7C 64 1B 78 */	mr r4, r3
/* 8019D910 0019A910  C0 7F 00 1C */	lfs f3, 0x1c(r31)
/* 8019D914 0019A914  48 0F AB 4D */	bl PSMTXTransApply
/* 8019D918 0019A918  7F A5 EB 78 */	mr r5, r29
/* 8019D91C 0019A91C  38 61 00 38 */	addi r3, r1, 0x38
/* 8019D920 0019A920  38 80 00 00 */	li r4, 0
/* 8019D924 0019A924  4B E7 CA 1D */	bl iconDispGx2
.L_8019D928:
/* 8019D928 0019A928  3B DE 00 01 */	addi r30, r30, 1
/* 8019D92C 0019A92C  3B FF 00 48 */	addi r31, r31, 0x48
/* 8019D930 0019A930  2C 1E 00 64 */	cmpwi r30, 0x64
/* 8019D934 0019A934  41 80 FF 34 */	blt .L_8019D868
/* 8019D938 0019A938  BB A1 00 74 */	lmw r29, 0x74(r1)
/* 8019D93C 0019A93C  80 01 00 84 */	lwz r0, 0x84(r1)
/* 8019D940 0019A940  7C 08 03 A6 */	mtlr r0
/* 8019D944 0019A944  38 21 00 80 */	addi r1, r1, 0x80
/* 8019D948 0019A948  4E 80 00 20 */	blr 
BattleAudienceDispAudience:
/* 8019D94C 0019A94C  94 21 FD F0 */	stwu r1, -0x210(r1)
/* 8019D950 0019A950  7C 08 02 A6 */	mflr r0
/* 8019D954 0019A954  90 01 02 14 */	stw r0, 0x214(r1)
/* 8019D958 0019A958  DB E1 02 00 */	stfd f31, 0x200(r1)
/* 8019D95C 0019A95C  F3 E1 02 08 */	psq_st f31, 520(r1), 0, qr0
/* 8019D960 0019A960  DB C1 01 F0 */	stfd f30, 0x1f0(r1)
/* 8019D964 0019A964  F3 C1 01 F8 */	psq_st f30, 504(r1), 0, qr0
/* 8019D968 0019A968  DB A1 01 E0 */	stfd f29, 0x1e0(r1)
/* 8019D96C 0019A96C  F3 A1 01 E8 */	psq_st f29, 488(r1), 0, qr0
/* 8019D970 0019A970  DB 81 01 D0 */	stfd f28, 0x1d0(r1)
/* 8019D974 0019A974  F3 81 01 D8 */	psq_st f28, 472(r1), 0, qr0
/* 8019D978 0019A978  DB 61 01 C0 */	stfd f27, 0x1c0(r1)
/* 8019D97C 0019A97C  F3 61 01 C8 */	psq_st f27, 456(r1), 0, qr0
/* 8019D980 0019A980  DB 41 01 B0 */	stfd f26, 0x1b0(r1)
/* 8019D984 0019A984  F3 41 01 B8 */	psq_st f26, 440(r1), 0, qr0
/* 8019D988 0019A988  DB 21 01 A0 */	stfd f25, 0x1a0(r1)
/* 8019D98C 0019A98C  F3 21 01 A8 */	psq_st f25, 424(r1), 0, qr0
/* 8019D990 0019A990  DB 01 01 90 */	stfd f24, 0x190(r1)
/* 8019D994 0019A994  F3 01 01 98 */	psq_st f24, 408(r1), 0, qr0
/* 8019D998 0019A998  DA E1 01 80 */	stfd f23, 0x180(r1)
/* 8019D99C 0019A99C  F2 E1 01 88 */	psq_st f23, 392(r1), 0, qr0
/* 8019D9A0 0019A9A0  DA C1 01 70 */	stfd f22, 0x170(r1)
/* 8019D9A4 0019A9A4  F2 C1 01 78 */	psq_st f22, 376(r1), 0, qr0
/* 8019D9A8 0019A9A8  BF 41 01 58 */	stmw r26, 0x158(r1)
/* 8019D9AC 0019A9AC  48 00 4D 29 */	bl BattleAudienceBaseGetPtr
/* 8019D9B0 0019A9B0  7C 7E 1B 78 */	mr r30, r3
/* 8019D9B4 0019A9B4  38 60 00 04 */	li r3, 4
/* 8019D9B8 0019A9B8  4B E7 17 99 */	bl camGetPtr
/* 8019D9BC 0019A9BC  7C 7F 1B 78 */	mr r31, r3
/* 8019D9C0 0019A9C0  38 60 00 00 */	li r3, 0
/* 8019D9C4 0019A9C4  48 11 24 C5 */	bl GXSetCullMode
/* 8019D9C8 0019A9C8  48 11 0D 55 */	bl GXClearVtxDesc
/* 8019D9CC 0019A9CC  38 60 00 09 */	li r3, 9
/* 8019D9D0 0019A9D0  38 80 00 01 */	li r4, 1
/* 8019D9D4 0019A9D4  48 11 04 31 */	bl GXSetVtxDesc
/* 8019D9D8 0019A9D8  38 60 00 0D */	li r3, 0xd
/* 8019D9DC 0019A9DC  38 80 00 01 */	li r4, 1
/* 8019D9E0 0019A9E0  48 11 04 25 */	bl GXSetVtxDesc
/* 8019D9E4 0019A9E4  38 60 00 00 */	li r3, 0
/* 8019D9E8 0019A9E8  38 80 00 09 */	li r4, 9
/* 8019D9EC 0019A9EC  38 A0 00 01 */	li r5, 1
/* 8019D9F0 0019A9F0  38 C0 00 04 */	li r6, 4
/* 8019D9F4 0019A9F4  38 E0 00 00 */	li r7, 0
/* 8019D9F8 0019A9F8  48 11 0D 5D */	bl GXSetVtxAttrFmt
/* 8019D9FC 0019A9FC  38 60 00 00 */	li r3, 0
/* 8019DA00 0019AA00  38 80 00 0D */	li r4, 0xd
/* 8019DA04 0019AA04  38 A0 00 01 */	li r5, 1
/* 8019DA08 0019AA08  38 C0 00 04 */	li r6, 4
/* 8019DA0C 0019AA0C  38 E0 00 00 */	li r7, 0
/* 8019DA10 0019AA10  48 11 0D 45 */	bl GXSetVtxAttrFmt
/* 8019DA14 0019AA14  38 60 00 01 */	li r3, 1
/* 8019DA18 0019AA18  48 11 37 21 */	bl GXSetNumChans
/* 8019DA1C 0019AA1C  38 60 00 04 */	li r3, 4
/* 8019DA20 0019AA20  38 80 00 00 */	li r4, 0
/* 8019DA24 0019AA24  38 A0 00 01 */	li r5, 1
/* 8019DA28 0019AA28  38 C0 00 00 */	li r6, 0
/* 8019DA2C 0019AA2C  38 E0 00 00 */	li r7, 0
/* 8019DA30 0019AA30  39 00 00 02 */	li r8, 2
/* 8019DA34 0019AA34  39 20 00 02 */	li r9, 2
/* 8019DA38 0019AA38  48 11 37 3D */	bl GXSetChanCtrl
/* 8019DA3C 0019AA3C  38 60 00 01 */	li r3, 1
/* 8019DA40 0019AA40  48 11 18 41 */	bl GXSetNumTexGens
/* 8019DA44 0019AA44  38 60 00 00 */	li r3, 0
/* 8019DA48 0019AA48  38 80 00 01 */	li r4, 1
/* 8019DA4C 0019AA4C  38 A0 00 04 */	li r5, 4
/* 8019DA50 0019AA50  38 C0 00 3C */	li r6, 0x3c
/* 8019DA54 0019AA54  38 E0 00 00 */	li r7, 0
/* 8019DA58 0019AA58  39 00 00 7D */	li r8, 0x7d
/* 8019DA5C 0019AA5C  48 11 15 A5 */	bl GXSetTexCoordGen2
/* 8019DA60 0019AA60  38 60 00 01 */	li r3, 1
/* 8019DA64 0019AA64  48 11 57 65 */	bl GXSetNumTevStages
/* 8019DA68 0019AA68  38 60 00 00 */	li r3, 0
/* 8019DA6C 0019AA6C  38 80 00 00 */	li r4, 0
/* 8019DA70 0019AA70  38 A0 00 00 */	li r5, 0
/* 8019DA74 0019AA74  38 C0 00 00 */	li r6, 0
/* 8019DA78 0019AA78  38 E0 00 01 */	li r7, 1
/* 8019DA7C 0019AA7C  39 00 00 00 */	li r8, 0
/* 8019DA80 0019AA80  48 11 51 65 */	bl GXSetTevColorOp
/* 8019DA84 0019AA84  38 60 00 00 */	li r3, 0
/* 8019DA88 0019AA88  38 80 00 0F */	li r4, 0xf
/* 8019DA8C 0019AA8C  38 A0 00 0C */	li r5, 0xc
/* 8019DA90 0019AA90  38 C0 00 08 */	li r6, 8
/* 8019DA94 0019AA94  38 E0 00 0A */	li r7, 0xa
/* 8019DA98 0019AA98  48 11 50 C5 */	bl GXSetTevColorIn
/* 8019DA9C 0019AA9C  38 60 00 00 */	li r3, 0
/* 8019DAA0 0019AAA0  38 80 00 00 */	li r4, 0
/* 8019DAA4 0019AAA4  38 A0 00 00 */	li r5, 0
/* 8019DAA8 0019AAA8  38 C0 00 00 */	li r6, 0
/* 8019DAAC 0019AAAC  38 E0 00 01 */	li r7, 1
/* 8019DAB0 0019AAB0  39 00 00 00 */	li r8, 0
/* 8019DAB4 0019AAB4  48 11 51 99 */	bl GXSetTevAlphaOp
/* 8019DAB8 0019AAB8  38 60 00 00 */	li r3, 0
/* 8019DABC 0019AABC  38 80 00 07 */	li r4, 7
/* 8019DAC0 0019AAC0  38 A0 00 05 */	li r5, 5
/* 8019DAC4 0019AAC4  38 C0 00 04 */	li r6, 4
/* 8019DAC8 0019AAC8  38 E0 00 07 */	li r7, 7
/* 8019DACC 0019AACC  48 11 50 D5 */	bl GXSetTevAlphaIn
/* 8019DAD0 0019AAD0  38 60 00 00 */	li r3, 0
/* 8019DAD4 0019AAD4  38 80 00 00 */	li r4, 0
/* 8019DAD8 0019AAD8  38 A0 00 00 */	li r5, 0
/* 8019DADC 0019AADC  38 C0 00 04 */	li r6, 4
/* 8019DAE0 0019AAE0  48 11 55 4D */	bl GXSetTevOrder
/* 8019DAE4 0019AAE4  3B A0 00 00 */	li r29, 0
/* 8019DAE8 0019AAE8  38 60 00 00 */	li r3, 0
/* 8019DAEC 0019AAEC  48 00 4B AD */	bl BattleAudienceGetPtr
/* 8019DAF0 0019AAF0  C0 02 D3 28 */	lfs f0, lbl_8041E6A8@sda21(r2)
/* 8019DAF4 0019AAF4  7C 7C 1B 78 */	mr r28, r3
/* 8019DAF8 0019AAF8  FF 60 00 50 */	fneg f27, f0
.L_8019DAFC:
/* 8019DAFC 0019AAFC  4B E7 2B BD */	bl dispGetCurWork
/* 8019DB00 0019AB00  88 03 00 01 */	lbz r0, 1(r3)
/* 8019DB04 0019AB04  28 00 00 02 */	cmplwi r0, 2
/* 8019DB08 0019AB08  41 82 00 14 */	beq .L_8019DB1C
/* 8019DB0C 0019AB0C  88 1C 00 44 */	lbz r0, 0x44(r28)
/* 8019DB10 0019AB10  28 00 00 FF */	cmplwi r0, 0xff
/* 8019DB14 0019AB14  40 82 06 F0 */	bne .L_8019E204
/* 8019DB18 0019AB18  48 00 00 10 */	b .L_8019DB28
.L_8019DB1C:
/* 8019DB1C 0019AB1C  88 1C 00 44 */	lbz r0, 0x44(r28)
/* 8019DB20 0019AB20  28 00 00 FF */	cmplwi r0, 0xff
/* 8019DB24 0019AB24  41 82 06 E0 */	beq .L_8019E204
.L_8019DB28:
/* 8019DB28 0019AB28  80 7C 00 00 */	lwz r3, 0(r28)
/* 8019DB2C 0019AB2C  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019DB30 0019AB30  41 82 06 D4 */	beq .L_8019E204
/* 8019DB34 0019AB34  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 8019DB38 0019AB38  41 82 06 CC */	beq .L_8019E204
/* 8019DB3C 0019AB3C  88 7C 00 1B */	lbz r3, 0x1b(r28)
/* 8019DB40 0019AB40  28 03 00 0B */	cmplwi r3, 0xb
/* 8019DB44 0019AB44  41 81 00 DC */	bgt .L_8019DC20
/* 8019DB48 0019AB48  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 8019DB4C 0019AB4C  38 81 00 10 */	addi r4, r1, 0x10
/* 8019DB50 0019AB50  88 BC 00 1A */	lbz r5, 0x1a(r28)
/* 8019DB54 0019AB54  80 63 00 A0 */	lwz r3, 0xa0(r3)
/* 8019DB58 0019AB58  80 63 00 00 */	lwz r3, 0(r3)
/* 8019DB5C 0019AB5C  4B E9 98 89 */	bl TEXGetGXTexObjFromPalette
/* 8019DB60 0019AB60  38 61 00 10 */	addi r3, r1, 0x10
/* 8019DB64 0019AB64  38 80 00 00 */	li r4, 0
/* 8019DB68 0019AB68  48 11 3F 15 */	bl GXLoadTexObj
/* 8019DB6C 0019AB6C  38 61 00 10 */	addi r3, r1, 0x10
/* 8019DB70 0019AB70  48 11 3D 51 */	bl GXGetTexObjWidth
/* 8019DB74 0019AB74  54 60 04 3E */	clrlwi r0, r3, 0x10
/* 8019DB78 0019AB78  3C 60 43 30 */	lis r3, 0x4330
/* 8019DB7C 0019AB7C  90 01 01 44 */	stw r0, 0x144(r1)
/* 8019DB80 0019AB80  3C 80 80 30 */	lis r4, lbl_802F9A08@ha
/* 8019DB84 0019AB84  88 1C 00 1B */	lbz r0, 0x1b(r28)
/* 8019DB88 0019AB88  90 61 01 40 */	stw r3, 0x140(r1)
/* 8019DB8C 0019AB8C  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019DB90 0019AB90  C8 44 9A 08 */	lfd f2, lbl_802F9A08@l(r4)
/* 8019DB94 0019AB94  54 04 28 34 */	slwi r4, r0, 5
/* 8019DB98 0019AB98  C8 01 01 40 */	lfd f0, 0x140(r1)
/* 8019DB9C 0019AB9C  38 03 19 24 */	addi r0, r3, lbl_803B1924@l
/* 8019DBA0 0019ABA0  7C 60 22 14 */	add r3, r0, r4
/* 8019DBA4 0019ABA4  C0 22 D3 2C */	lfs f1, lbl_8041E6AC@sda21(r2)
/* 8019DBA8 0019ABA8  EC 60 10 28 */	fsubs f3, f0, f2
/* 8019DBAC 0019ABAC  C0 43 00 18 */	lfs f2, 0x18(r3)
/* 8019DBB0 0019ABB0  C0 1C 00 60 */	lfs f0, 0x60(r28)
/* 8019DBB4 0019ABB4  38 61 00 10 */	addi r3, r1, 0x10
/* 8019DBB8 0019ABB8  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019DBBC 0019ABBC  EC 22 00 72 */	fmuls f1, f2, f1
/* 8019DBC0 0019ABC0  EC 00 00 72 */	fmuls f0, f0, f1
/* 8019DBC4 0019ABC4  D0 1C 00 54 */	stfs f0, 0x54(r28)
/* 8019DBC8 0019ABC8  48 11 3D 09 */	bl GXGetTexObjHeight
/* 8019DBCC 0019ABCC  54 60 04 3E */	clrlwi r0, r3, 0x10
/* 8019DBD0 0019ABD0  3C 60 43 30 */	lis r3, 0x4330
/* 8019DBD4 0019ABD4  90 01 01 4C */	stw r0, 0x14c(r1)
/* 8019DBD8 0019ABD8  3C 80 80 30 */	lis r4, lbl_802F9A08@ha
/* 8019DBDC 0019ABDC  88 1C 00 1B */	lbz r0, 0x1b(r28)
/* 8019DBE0 0019ABE0  90 61 01 48 */	stw r3, 0x148(r1)
/* 8019DBE4 0019ABE4  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019DBE8 0019ABE8  C8 44 9A 08 */	lfd f2, lbl_802F9A08@l(r4)
/* 8019DBEC 0019ABEC  54 04 28 34 */	slwi r4, r0, 5
/* 8019DBF0 0019ABF0  C8 01 01 48 */	lfd f0, 0x148(r1)
/* 8019DBF4 0019ABF4  38 03 19 24 */	addi r0, r3, lbl_803B1924@l
/* 8019DBF8 0019ABF8  7C 60 22 14 */	add r3, r0, r4
/* 8019DBFC 0019ABFC  C0 22 D3 2C */	lfs f1, lbl_8041E6AC@sda21(r2)
/* 8019DC00 0019AC00  EC 60 10 28 */	fsubs f3, f0, f2
/* 8019DC04 0019AC04  C0 43 00 1C */	lfs f2, 0x1c(r3)
/* 8019DC08 0019AC08  C0 1C 00 64 */	lfs f0, 0x64(r28)
/* 8019DC0C 0019AC0C  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019DC10 0019AC10  EC 22 00 72 */	fmuls f1, f2, f1
/* 8019DC14 0019AC14  EC 00 00 72 */	fmuls f0, f0, f1
/* 8019DC18 0019AC18  D0 1C 00 58 */	stfs f0, 0x58(r28)
/* 8019DC1C 0019AC1C  48 00 01 08 */	b .L_8019DD24
.L_8019DC20:
/* 8019DC20 0019AC20  38 00 00 02 */	li r0, 2
/* 8019DC24 0019AC24  38 80 00 00 */	li r4, 0
/* 8019DC28 0019AC28  7C 09 03 A6 */	mtctr r0
.L_8019DC2C:
/* 8019DC2C 0019AC2C  38 04 00 18 */	addi r0, r4, 0x18
/* 8019DC30 0019AC30  7C 1E 00 AE */	lbzx r0, r30, r0
/* 8019DC34 0019AC34  7C 03 00 40 */	cmplw r3, r0
/* 8019DC38 0019AC38  40 82 00 E4 */	bne .L_8019DD1C
/* 8019DC3C 0019AC3C  54 83 10 3A */	slwi r3, r4, 2
/* 8019DC40 0019AC40  88 BC 00 1A */	lbz r5, 0x1a(r28)
/* 8019DC44 0019AC44  38 03 00 10 */	addi r0, r3, 0x10
/* 8019DC48 0019AC48  38 81 00 10 */	addi r4, r1, 0x10
/* 8019DC4C 0019AC4C  7C 7E 00 2E */	lwzx r3, r30, r0
/* 8019DC50 0019AC50  80 63 00 A0 */	lwz r3, 0xa0(r3)
/* 8019DC54 0019AC54  80 63 00 00 */	lwz r3, 0(r3)
/* 8019DC58 0019AC58  4B E9 97 8D */	bl TEXGetGXTexObjFromPalette
/* 8019DC5C 0019AC5C  38 61 00 10 */	addi r3, r1, 0x10
/* 8019DC60 0019AC60  38 80 00 00 */	li r4, 0
/* 8019DC64 0019AC64  48 11 3E 19 */	bl GXLoadTexObj
/* 8019DC68 0019AC68  38 61 00 10 */	addi r3, r1, 0x10
/* 8019DC6C 0019AC6C  48 11 3C 55 */	bl GXGetTexObjWidth
/* 8019DC70 0019AC70  54 60 04 3E */	clrlwi r0, r3, 0x10
/* 8019DC74 0019AC74  3C 60 43 30 */	lis r3, 0x4330
/* 8019DC78 0019AC78  90 01 01 4C */	stw r0, 0x14c(r1)
/* 8019DC7C 0019AC7C  3C 80 80 30 */	lis r4, lbl_802F9A08@ha
/* 8019DC80 0019AC80  88 1C 00 1B */	lbz r0, 0x1b(r28)
/* 8019DC84 0019AC84  90 61 01 48 */	stw r3, 0x148(r1)
/* 8019DC88 0019AC88  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019DC8C 0019AC8C  C8 44 9A 08 */	lfd f2, lbl_802F9A08@l(r4)
/* 8019DC90 0019AC90  54 04 28 34 */	slwi r4, r0, 5
/* 8019DC94 0019AC94  C8 01 01 48 */	lfd f0, 0x148(r1)
/* 8019DC98 0019AC98  38 03 19 24 */	addi r0, r3, lbl_803B1924@l
/* 8019DC9C 0019AC9C  7C 60 22 14 */	add r3, r0, r4
/* 8019DCA0 0019ACA0  C0 22 D3 2C */	lfs f1, lbl_8041E6AC@sda21(r2)
/* 8019DCA4 0019ACA4  EC 60 10 28 */	fsubs f3, f0, f2
/* 8019DCA8 0019ACA8  C0 43 00 18 */	lfs f2, 0x18(r3)
/* 8019DCAC 0019ACAC  C0 1C 00 60 */	lfs f0, 0x60(r28)
/* 8019DCB0 0019ACB0  38 61 00 10 */	addi r3, r1, 0x10
/* 8019DCB4 0019ACB4  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019DCB8 0019ACB8  EC 22 00 72 */	fmuls f1, f2, f1
/* 8019DCBC 0019ACBC  EC 00 00 72 */	fmuls f0, f0, f1
/* 8019DCC0 0019ACC0  D0 1C 00 54 */	stfs f0, 0x54(r28)
/* 8019DCC4 0019ACC4  48 11 3C 0D */	bl GXGetTexObjHeight
/* 8019DCC8 0019ACC8  54 60 04 3E */	clrlwi r0, r3, 0x10
/* 8019DCCC 0019ACCC  3C 60 43 30 */	lis r3, 0x4330
/* 8019DCD0 0019ACD0  90 01 01 44 */	stw r0, 0x144(r1)
/* 8019DCD4 0019ACD4  3C 80 80 30 */	lis r4, lbl_802F9A08@ha
/* 8019DCD8 0019ACD8  88 1C 00 1B */	lbz r0, 0x1b(r28)
/* 8019DCDC 0019ACDC  90 61 01 40 */	stw r3, 0x140(r1)
/* 8019DCE0 0019ACE0  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019DCE4 0019ACE4  C8 44 9A 08 */	lfd f2, lbl_802F9A08@l(r4)
/* 8019DCE8 0019ACE8  54 04 28 34 */	slwi r4, r0, 5
/* 8019DCEC 0019ACEC  C8 01 01 40 */	lfd f0, 0x140(r1)
/* 8019DCF0 0019ACF0  38 03 19 24 */	addi r0, r3, lbl_803B1924@l
/* 8019DCF4 0019ACF4  7C 60 22 14 */	add r3, r0, r4
/* 8019DCF8 0019ACF8  C0 22 D3 2C */	lfs f1, lbl_8041E6AC@sda21(r2)
/* 8019DCFC 0019ACFC  EC 60 10 28 */	fsubs f3, f0, f2
/* 8019DD00 0019AD00  C0 43 00 1C */	lfs f2, 0x1c(r3)
/* 8019DD04 0019AD04  C0 1C 00 64 */	lfs f0, 0x64(r28)
/* 8019DD08 0019AD08  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019DD0C 0019AD0C  EC 22 00 72 */	fmuls f1, f2, f1
/* 8019DD10 0019AD10  EC 00 00 72 */	fmuls f0, f0, f1
/* 8019DD14 0019AD14  D0 1C 00 58 */	stfs f0, 0x58(r28)
/* 8019DD18 0019AD18  48 00 00 0C */	b .L_8019DD24
.L_8019DD1C:
/* 8019DD1C 0019AD1C  38 84 00 01 */	addi r4, r4, 1
/* 8019DD20 0019AD20  42 00 FF 0C */	bdnz .L_8019DC2C
.L_8019DD24:
/* 8019DD24 0019AD24  C0 3C 00 54 */	lfs f1, 0x54(r28)
/* 8019DD28 0019AD28  38 61 00 60 */	addi r3, r1, 0x60
/* 8019DD2C 0019AD2C  C0 1C 00 A8 */	lfs f0, 0xa8(r28)
/* 8019DD30 0019AD30  C0 5C 00 58 */	lfs f2, 0x58(r28)
/* 8019DD34 0019AD34  C0 9C 00 AC */	lfs f4, 0xac(r28)
/* 8019DD38 0019AD38  EF 40 00 72 */	fmuls f26, f0, f1
/* 8019DD3C 0019AD3C  C0 7C 00 5C */	lfs f3, 0x5c(r28)
/* 8019DD40 0019AD40  C0 1C 00 B0 */	lfs f0, 0xb0(r28)
/* 8019DD44 0019AD44  EF 24 00 B2 */	fmuls f25, f4, f2
/* 8019DD48 0019AD48  EF 00 00 F2 */	fmuls f24, f0, f3
/* 8019DD4C 0019AD4C  48 0F A7 61 */	bl PSMTXScale
/* 8019DD50 0019AD50  C0 1C 00 9C */	lfs f0, 0x9c(r28)
/* 8019DD54 0019AD54  C0 42 D3 30 */	lfs f2, lbl_8041E6B0@sda21(r2)
/* 8019DD58 0019AD58  C0 3C 00 A0 */	lfs f1, 0xa0(r28)
/* 8019DD5C 0019AD5C  EF 80 00 B2 */	fmuls f28, f0, f2
/* 8019DD60 0019AD60  C0 1C 00 A4 */	lfs f0, 0xa4(r28)
/* 8019DD64 0019AD64  EF A1 00 B2 */	fmuls f29, f1, f2
/* 8019DD68 0019AD68  EE C0 00 B2 */	fmuls f22, f0, f2
/* 8019DD6C 0019AD6C  FC 20 E0 90 */	fmr f1, f28
/* 8019DD70 0019AD70  48 0C E6 89 */	bl sin
/* 8019DD74 0019AD74  FE E0 08 18 */	frsp f23, f1
/* 8019DD78 0019AD78  FC 20 E0 90 */	fmr f1, f28
/* 8019DD7C 0019AD7C  48 0C E1 15 */	bl cos
/* 8019DD80 0019AD80  FF E0 08 18 */	frsp f31, f1
/* 8019DD84 0019AD84  FC 20 E8 90 */	fmr f1, f29
/* 8019DD88 0019AD88  48 0C E6 71 */	bl sin
/* 8019DD8C 0019AD8C  FF C0 08 18 */	frsp f30, f1
/* 8019DD90 0019AD90  FC 20 E8 90 */	fmr f1, f29
/* 8019DD94 0019AD94  48 0C E0 FD */	bl cos
/* 8019DD98 0019AD98  FF A0 08 18 */	frsp f29, f1
/* 8019DD9C 0019AD9C  FC 20 B0 90 */	fmr f1, f22
/* 8019DDA0 0019ADA0  48 0C E6 59 */	bl sin
/* 8019DDA4 0019ADA4  FF 80 08 18 */	frsp f28, f1
/* 8019DDA8 0019ADA8  FC 20 B0 90 */	fmr f1, f22
/* 8019DDAC 0019ADAC  48 0C E0 E5 */	bl cos
/* 8019DDB0 0019ADB0  FC C0 08 18 */	frsp f6, f1
/* 8019DDB4 0019ADB4  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 8019DDB8 0019ADB8  EC F7 07 B2 */	fmuls f7, f23, f30
/* 8019DDBC 0019ADBC  3C 60 80 30 */	lis r3, lbl_802F9768@ha
/* 8019DDC0 0019ADC0  ED 17 07 72 */	fmuls f8, f23, f29
/* 8019DDC4 0019ADC4  38 E3 97 68 */	addi r7, r3, lbl_802F9768@l
/* 8019DDC8 0019ADC8  EC 67 07 32 */	fmuls f3, f7, f28
/* 8019DDCC 0019ADCC  38 9C 00 90 */	addi r4, r28, 0x90
/* 8019DDD0 0019ADD0  FC 40 F8 50 */	fneg f2, f31
/* 8019DDD4 0019ADD4  D0 21 00 9C */	stfs f1, 0x9c(r1)
/* 8019DDD8 0019ADD8  EC 08 07 32 */	fmuls f0, f8, f28
/* 8019DDDC 0019ADDC  80 C7 00 00 */	lwz r6, 0(r7)
/* 8019DDE0 0019ADE0  EC 7D 19 B8 */	fmsubs f3, f29, f6, f3
/* 8019DDE4 0019ADE4  D0 21 00 AC */	stfs f1, 0xac(r1)
/* 8019DDE8 0019ADE8  EC A2 07 B2 */	fmuls f5, f2, f30
/* 8019DDEC 0019ADEC  80 07 00 04 */	lwz r0, 4(r7)
/* 8019DDF0 0019ADF0  EC 9F 07 32 */	fmuls f4, f31, f28
/* 8019DDF4 0019ADF4  D0 21 00 BC */	stfs f1, 0xbc(r1)
/* 8019DDF8 0019ADF8  EC 5F 01 B2 */	fmuls f2, f31, f6
/* 8019DDFC 0019ADFC  D0 61 00 90 */	stfs f3, 0x90(r1)
/* 8019DE00 0019AE00  FC 20 B8 50 */	fneg f1, f23
/* 8019DE04 0019AE04  7C 85 23 78 */	mr r5, r4
/* 8019DE08 0019AE08  EC 7E 01 BA */	fmadds f3, f30, f6, f0
/* 8019DE0C 0019AE0C  D0 A1 00 98 */	stfs f5, 0x98(r1)
/* 8019DE10 0019AE10  EC 1F 07 72 */	fmuls f0, f31, f29
/* 8019DE14 0019AE14  D0 81 00 A0 */	stfs f4, 0xa0(r1)
/* 8019DE18 0019AE18  FC A0 E8 50 */	fneg f5, f29
/* 8019DE1C 0019AE1C  38 61 00 90 */	addi r3, r1, 0x90
/* 8019DE20 0019AE20  EC 87 01 B2 */	fmuls f4, f7, f6
/* 8019DE24 0019AE24  D0 41 00 A4 */	stfs f2, 0xa4(r1)
/* 8019DE28 0019AE28  FC 40 F0 50 */	fneg f2, f30
/* 8019DE2C 0019AE2C  D0 21 00 A8 */	stfs f1, 0xa8(r1)
/* 8019DE30 0019AE30  EC 28 01 B2 */	fmuls f1, f8, f6
/* 8019DE34 0019AE34  EC 85 27 38 */	fmsubs f4, f5, f28, f4
/* 8019DE38 0019AE38  D0 61 00 B0 */	stfs f3, 0xb0(r1)
/* 8019DE3C 0019AE3C  EC 22 0F 3A */	fmadds f1, f2, f28, f1
/* 8019DE40 0019AE40  D0 01 00 B8 */	stfs f0, 0xb8(r1)
/* 8019DE44 0019AE44  D0 81 00 94 */	stfs f4, 0x94(r1)
/* 8019DE48 0019AE48  D0 21 00 B4 */	stfs f1, 0xb4(r1)
/* 8019DE4C 0019AE4C  90 DC 00 90 */	stw r6, 0x90(r28)
/* 8019DE50 0019AE50  90 1C 00 94 */	stw r0, 0x94(r28)
/* 8019DE54 0019AE54  80 07 00 08 */	lwz r0, 8(r7)
/* 8019DE58 0019AE58  90 1C 00 98 */	stw r0, 0x98(r28)
/* 8019DE5C 0019AE5C  48 0F AA 45 */	bl PSMTXMultVec
/* 8019DE60 0019AE60  C0 41 00 6C */	lfs f2, 0x6c(r1)
/* 8019DE64 0019AE64  38 81 00 60 */	addi r4, r1, 0x60
/* 8019DE68 0019AE68  C0 21 00 7C */	lfs f1, 0x7c(r1)
/* 8019DE6C 0019AE6C  7C 85 23 78 */	mr r5, r4
/* 8019DE70 0019AE70  C0 01 00 8C */	lfs f0, 0x8c(r1)
/* 8019DE74 0019AE74  EC 42 D0 2A */	fadds f2, f2, f26
/* 8019DE78 0019AE78  EC 21 C8 2A */	fadds f1, f1, f25
/* 8019DE7C 0019AE7C  38 61 00 90 */	addi r3, r1, 0x90
/* 8019DE80 0019AE80  EC 00 C0 2A */	fadds f0, f0, f24
/* 8019DE84 0019AE84  D0 41 00 6C */	stfs f2, 0x6c(r1)
/* 8019DE88 0019AE88  D0 21 00 7C */	stfs f1, 0x7c(r1)
/* 8019DE8C 0019AE8C  D0 01 00 8C */	stfs f0, 0x8c(r1)
/* 8019DE90 0019AE90  48 0F A0 D1 */	bl PSMTXConcat
/* 8019DE94 0019AE94  FC 40 D0 50 */	fneg f2, f26
/* 8019DE98 0019AE98  C0 1C 00 48 */	lfs f0, 0x48(r28)
/* 8019DE9C 0019AE9C  C0 9C 00 CC */	lfs f4, 0xcc(r28)
/* 8019DEA0 0019AEA0  FC 20 C0 50 */	fneg f1, f24
/* 8019DEA4 0019AEA4  C0 A1 00 6C */	lfs f5, 0x6c(r1)
/* 8019DEA8 0019AEA8  EC 02 00 2A */	fadds f0, f2, f0
/* 8019DEAC 0019AEAC  C0 61 00 8C */	lfs f3, 0x8c(r1)
/* 8019DEB0 0019AEB0  EC 04 00 2A */	fadds f0, f4, f0
/* 8019DEB4 0019AEB4  EC 05 00 2A */	fadds f0, f5, f0
/* 8019DEB8 0019AEB8  D0 01 00 6C */	stfs f0, 0x6c(r1)
/* 8019DEBC 0019AEBC  C0 1C 00 50 */	lfs f0, 0x50(r28)
/* 8019DEC0 0019AEC0  C0 5C 00 D4 */	lfs f2, 0xd4(r28)
/* 8019DEC4 0019AEC4  EC 01 00 2A */	fadds f0, f1, f0
/* 8019DEC8 0019AEC8  EC 02 00 2A */	fadds f0, f2, f0
/* 8019DECC 0019AECC  EC 03 00 2A */	fadds f0, f3, f0
/* 8019DED0 0019AED0  D0 01 00 8C */	stfs f0, 0x8c(r1)
/* 8019DED4 0019AED4  88 1C 00 1B */	lbz r0, 0x1b(r28)
/* 8019DED8 0019AED8  28 00 00 02 */	cmplwi r0, 2
/* 8019DEDC 0019AEDC  41 82 00 28 */	beq .L_8019DF04
/* 8019DEE0 0019AEE0  FC 20 C8 50 */	fneg f1, f25
/* 8019DEE4 0019AEE4  C0 1C 00 4C */	lfs f0, 0x4c(r28)
/* 8019DEE8 0019AEE8  C0 5C 00 D0 */	lfs f2, 0xd0(r28)
/* 8019DEEC 0019AEEC  C0 61 00 7C */	lfs f3, 0x7c(r1)
/* 8019DEF0 0019AEF0  EC 01 00 2A */	fadds f0, f1, f0
/* 8019DEF4 0019AEF4  EC 02 00 2A */	fadds f0, f2, f0
/* 8019DEF8 0019AEF8  EC 03 00 2A */	fadds f0, f3, f0
/* 8019DEFC 0019AEFC  D0 01 00 7C */	stfs f0, 0x7c(r1)
/* 8019DF00 0019AF00  48 00 00 2C */	b .L_8019DF2C
.L_8019DF04:
/* 8019DF04 0019AF04  FC 20 C8 50 */	fneg f1, f25
/* 8019DF08 0019AF08  C0 1C 00 4C */	lfs f0, 0x4c(r28)
/* 8019DF0C 0019AF0C  C0 5C 00 D0 */	lfs f2, 0xd0(r28)
/* 8019DF10 0019AF10  C0 7C 01 30 */	lfs f3, 0x130(r28)
/* 8019DF14 0019AF14  EC 01 00 2A */	fadds f0, f1, f0
/* 8019DF18 0019AF18  C0 21 00 7C */	lfs f1, 0x7c(r1)
/* 8019DF1C 0019AF1C  EC 02 00 2A */	fadds f0, f2, f0
/* 8019DF20 0019AF20  EC 03 00 2A */	fadds f0, f3, f0
/* 8019DF24 0019AF24  EC 01 00 2A */	fadds f0, f1, f0
/* 8019DF28 0019AF28  D0 01 00 7C */	stfs f0, 0x7c(r1)
.L_8019DF2C:
/* 8019DF2C 0019AF2C  38 7F 01 1C */	addi r3, r31, 0x11c
/* 8019DF30 0019AF30  38 81 00 60 */	addi r4, r1, 0x60
/* 8019DF34 0019AF34  38 A1 00 30 */	addi r5, r1, 0x30
/* 8019DF38 0019AF38  48 0F A0 29 */	bl PSMTXConcat
/* 8019DF3C 0019AF3C  38 61 00 30 */	addi r3, r1, 0x30
/* 8019DF40 0019AF40  38 80 00 00 */	li r4, 0
/* 8019DF44 0019AF44  48 11 65 B5 */	bl GXLoadPosMtxImm
/* 8019DF48 0019AF48  3C 60 80 30 */	lis r3, lbl_802F9774@ha
/* 8019DF4C 0019AF4C  38 00 00 10 */	li r0, 0x10
/* 8019DF50 0019AF50  38 63 97 74 */	addi r3, r3, lbl_802F9774@l
/* 8019DF54 0019AF54  38 A1 00 BC */	addi r5, r1, 0xbc
/* 8019DF58 0019AF58  38 83 FF FC */	addi r4, r3, -4
/* 8019DF5C 0019AF5C  7C 09 03 A6 */	mtctr r0
.L_8019DF60:
/* 8019DF60 0019AF60  80 64 00 04 */	lwz r3, 4(r4)
/* 8019DF64 0019AF64  84 04 00 08 */	lwzu r0, 8(r4)
/* 8019DF68 0019AF68  90 65 00 04 */	stw r3, 4(r5)
/* 8019DF6C 0019AF6C  94 05 00 08 */	stwu r0, 8(r5)
/* 8019DF70 0019AF70  42 00 FF F0 */	bdnz .L_8019DF60
/* 8019DF74 0019AF74  7F A3 EB 78 */	mr r3, r29
/* 8019DF78 0019AF78  3B 40 00 00 */	li r26, 0
/* 8019DF7C 0019AF7C  4B FF EC 01 */	bl BattleAudience_GetFront
/* 8019DF80 0019AF80  80 9C 00 20 */	lwz r4, 0x20(r28)
/* 8019DF84 0019AF84  80 BC 00 24 */	lwz r5, 0x24(r28)
/* 8019DF88 0019AF88  80 84 00 24 */	lwz r4, 0x24(r4)
/* 8019DF8C 0019AF8C  88 1C 00 41 */	lbz r0, 0x41(r28)
/* 8019DF90 0019AF90  7C 05 20 40 */	cmplw r5, r4
/* 8019DF94 0019AF94  88 BC 00 42 */	lbz r5, 0x42(r28)
/* 8019DF98 0019AF98  88 DC 00 43 */	lbz r6, 0x43(r28)
/* 8019DF9C 0019AF9C  88 FC 00 44 */	lbz r7, 0x44(r28)
/* 8019DFA0 0019AFA0  40 82 00 08 */	bne .L_8019DFA8
/* 8019DFA4 0019AFA4  3B 40 00 08 */	li r26, 8
.L_8019DFA8:
/* 8019DFA8 0019AFA8  C0 7C 00 E8 */	lfs f3, 0xe8(r28)
/* 8019DFAC 0019AFAC  C0 42 D3 34 */	lfs f2, lbl_8041E6B4@sda21(r2)
/* 8019DFB0 0019AFB0  FC 03 10 40 */	fcmpo cr0, f3, f2
/* 8019DFB4 0019AFB4  4C 41 13 82 */	cror 2, 1, 2
/* 8019DFB8 0019AFB8  40 82 00 3C */	bne .L_8019DFF4
/* 8019DFBC 0019AFBC  EC 03 10 24 */	fdivs f0, f3, f2
/* 8019DFC0 0019AFC0  3C 80 43 30 */	lis r4, 0x4330
/* 8019DFC4 0019AFC4  3D 00 80 30 */	lis r8, lbl_802F9A00@ha
/* 8019DFC8 0019AFC8  90 81 01 40 */	stw r4, 0x140(r1)
/* 8019DFCC 0019AFCC  C8 28 9A 00 */	lfd f1, lbl_802F9A00@l(r8)
/* 8019DFD0 0019AFD0  FC 00 00 1E */	fctiwz f0, f0
/* 8019DFD4 0019AFD4  D8 01 01 48 */	stfd f0, 0x148(r1)
/* 8019DFD8 0019AFD8  80 81 01 4C */	lwz r4, 0x14c(r1)
/* 8019DFDC 0019AFDC  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 8019DFE0 0019AFE0  90 81 01 44 */	stw r4, 0x144(r1)
/* 8019DFE4 0019AFE4  C8 01 01 40 */	lfd f0, 0x140(r1)
/* 8019DFE8 0019AFE8  EC 00 08 28 */	fsubs f0, f0, f1
/* 8019DFEC 0019AFEC  EC 02 18 3C */	fnmsubs f0, f2, f0, f3
/* 8019DFF0 0019AFF0  D0 1C 00 E8 */	stfs f0, 0xe8(r28)
.L_8019DFF4:
/* 8019DFF4 0019AFF4  C0 7C 00 E8 */	lfs f3, 0xe8(r28)
/* 8019DFF8 0019AFF8  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019DFFC 0019AFFC  FC 03 00 40 */	fcmpo cr0, f3, f0
/* 8019E000 0019B000  40 80 00 44 */	bge .L_8019E044
/* 8019E004 0019B004  C0 42 D3 34 */	lfs f2, lbl_8041E6B4@sda21(r2)
/* 8019E008 0019B008  3C 80 43 30 */	lis r4, 0x4330
/* 8019E00C 0019B00C  3D 00 80 30 */	lis r8, lbl_802F9A00@ha
/* 8019E010 0019B010  90 81 01 40 */	stw r4, 0x140(r1)
/* 8019E014 0019B014  EC 03 10 24 */	fdivs f0, f3, f2
/* 8019E018 0019B018  C8 28 9A 00 */	lfd f1, lbl_802F9A00@l(r8)
/* 8019E01C 0019B01C  FC 00 00 1E */	fctiwz f0, f0
/* 8019E020 0019B020  D8 01 01 48 */	stfd f0, 0x148(r1)
/* 8019E024 0019B024  80 81 01 4C */	lwz r4, 0x14c(r1)
/* 8019E028 0019B028  20 84 00 01 */	subfic r4, r4, 1
/* 8019E02C 0019B02C  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 8019E030 0019B030  90 81 01 44 */	stw r4, 0x144(r1)
/* 8019E034 0019B034  C8 01 01 40 */	lfd f0, 0x140(r1)
/* 8019E038 0019B038  EC 00 08 28 */	fsubs f0, f0, f1
/* 8019E03C 0019B03C  EC 02 18 3A */	fmadds f0, f2, f0, f3
/* 8019E040 0019B040  D0 1C 00 E8 */	stfs f0, 0xe8(r28)
.L_8019E044:
/* 8019E044 0019B044  C0 3C 00 E8 */	lfs f1, 0xe8(r28)
/* 8019E048 0019B048  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E04C 0019B04C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E050 0019B050  40 81 00 18 */	ble .L_8019E068
/* 8019E054 0019B054  C0 02 D3 38 */	lfs f0, lbl_8041E6B8@sda21(r2)
/* 8019E058 0019B058  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E05C 0019B05C  4C 40 13 82 */	cror 2, 0, 2
/* 8019E060 0019B060  40 82 00 08 */	bne .L_8019E068
/* 8019E064 0019B064  3B 60 00 01 */	li r27, 1
.L_8019E068:
/* 8019E068 0019B068  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E06C 0019B06C  FC 00 08 00 */	fcmpu cr0, f0, f1
/* 8019E070 0019B070  41 82 00 1C */	beq .L_8019E08C
/* 8019E074 0019B074  C0 02 D3 38 */	lfs f0, lbl_8041E6B8@sda21(r2)
/* 8019E078 0019B078  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E07C 0019B07C  40 81 00 14 */	ble .L_8019E090
/* 8019E080 0019B080  C0 02 D3 34 */	lfs f0, lbl_8041E6B4@sda21(r2)
/* 8019E084 0019B084  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E088 0019B088  40 80 00 08 */	bge .L_8019E090
.L_8019E08C:
/* 8019E08C 0019B08C  3B 60 00 00 */	li r27, 0
.L_8019E090:
/* 8019E090 0019B090  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 8019E094 0019B094  28 03 00 01 */	cmplwi r3, 1
/* 8019E098 0019B098  40 82 00 34 */	bne .L_8019E0CC
/* 8019E09C 0019B09C  80 9C 00 20 */	lwz r4, 0x20(r28)
/* 8019E0A0 0019B0A0  81 1C 00 24 */	lwz r8, 0x24(r28)
/* 8019E0A4 0019B0A4  80 64 00 24 */	lwz r3, 0x24(r4)
/* 8019E0A8 0019B0A8  7C 08 18 40 */	cmplw r8, r3
/* 8019E0AC 0019B0AC  41 82 00 20 */	beq .L_8019E0CC
/* 8019E0B0 0019B0B0  80 64 00 20 */	lwz r3, 0x20(r4)
/* 8019E0B4 0019B0B4  7C 08 18 40 */	cmplw r8, r3
/* 8019E0B8 0019B0B8  41 82 00 14 */	beq .L_8019E0CC
/* 8019E0BC 0019B0BC  80 64 00 1C */	lwz r3, 0x1c(r4)
/* 8019E0C0 0019B0C0  7C 08 18 40 */	cmplw r8, r3
/* 8019E0C4 0019B0C4  41 82 00 08 */	beq .L_8019E0CC
/* 8019E0C8 0019B0C8  6B 7B 00 01 */	xori r27, r27, 1
.L_8019E0CC:
/* 8019E0CC 0019B0CC  2C 1B 00 01 */	cmpwi r27, 1
/* 8019E0D0 0019B0D0  40 82 00 08 */	bne .L_8019E0D8
/* 8019E0D4 0019B0D4  3B 5A 00 04 */	addi r26, r26, 4
.L_8019E0D8:
/* 8019E0D8 0019B0D8  81 02 1D 00 */	lwz r8, lbl_80423080@sda21(r2)
/* 8019E0DC 0019B0DC  38 81 00 0C */	addi r4, r1, 0xc
/* 8019E0E0 0019B0E0  38 60 00 04 */	li r3, 4
/* 8019E0E4 0019B0E4  91 01 00 08 */	stw r8, 8(r1)
/* 8019E0E8 0019B0E8  98 01 00 08 */	stb r0, 8(r1)
/* 8019E0EC 0019B0EC  98 A1 00 09 */	stb r5, 9(r1)
/* 8019E0F0 0019B0F0  98 C1 00 0A */	stb r6, 0xa(r1)
/* 8019E0F4 0019B0F4  98 E1 00 0B */	stb r7, 0xb(r1)
/* 8019E0F8 0019B0F8  80 01 00 08 */	lwz r0, 8(r1)
/* 8019E0FC 0019B0FC  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019E100 0019B100  48 11 2F 51 */	bl GXSetChanMatColor
/* 8019E104 0019B104  38 60 00 80 */	li r3, 0x80
/* 8019E108 0019B108  38 80 00 00 */	li r4, 0
/* 8019E10C 0019B10C  38 A0 00 04 */	li r5, 4
/* 8019E110 0019B110  48 11 1B 59 */	bl GXBegin
/* 8019E114 0019B114  C0 1C 00 6C */	lfs f0, 0x6c(r28)
/* 8019E118 0019B118  38 9A 00 01 */	addi r4, r26, 1
/* 8019E11C 0019B11C  38 7A 00 02 */	addi r3, r26, 2
/* 8019E120 0019B120  38 1A 00 03 */	addi r0, r26, 3
/* 8019E124 0019B124  EC 1B 00 2A */	fadds f0, f27, f0
/* 8019E128 0019B128  C0 62 D3 10 */	lfs f3, lbl_8041E690@sda21(r2)
/* 8019E12C 0019B12C  C0 3C 00 70 */	lfs f1, 0x70(r28)
/* 8019E130 0019B130  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 8019E134 0019B134  C0 9C 00 74 */	lfs f4, 0x74(r28)
/* 8019E138 0019B138  57 45 18 38 */	slwi r5, r26, 3
/* 8019E13C 0019B13C  EC 43 08 2A */	fadds f2, f3, f1
/* 8019E140 0019B140  D0 06 80 00 */	stfs f0, 0xCC008000@l(r6)
/* 8019E144 0019B144  38 E1 00 C0 */	addi r7, r1, 0xc0
/* 8019E148 0019B148  C0 22 D3 28 */	lfs f1, lbl_8041E6A8@sda21(r2)
/* 8019E14C 0019B14C  7C E7 2A 14 */	add r7, r7, r5
/* 8019E150 0019B150  54 84 18 38 */	slwi r4, r4, 3
/* 8019E154 0019B154  D0 46 80 00 */	stfs f2, -0x8000(r6)
/* 8019E158 0019B158  38 A1 00 C0 */	addi r5, r1, 0xc0
/* 8019E15C 0019B15C  7C A5 22 14 */	add r5, r5, r4
/* 8019E160 0019B160  54 63 18 38 */	slwi r3, r3, 3
/* 8019E164 0019B164  D0 86 80 00 */	stfs f4, -0x8000(r6)
/* 8019E168 0019B168  38 81 00 C0 */	addi r4, r1, 0xc0
/* 8019E16C 0019B16C  7C 84 1A 14 */	add r4, r4, r3
/* 8019E170 0019B170  54 00 18 38 */	slwi r0, r0, 3
/* 8019E174 0019B174  C0 07 00 00 */	lfs f0, 0(r7)
/* 8019E178 0019B178  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8019E17C 0019B17C  7C 63 02 14 */	add r3, r3, r0
/* 8019E180 0019B180  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E184 0019B184  C0 07 00 04 */	lfs f0, 4(r7)
/* 8019E188 0019B188  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E18C 0019B18C  C0 1C 00 6C */	lfs f0, 0x6c(r28)
/* 8019E190 0019B190  C0 5C 00 70 */	lfs f2, 0x70(r28)
/* 8019E194 0019B194  EC 01 00 2A */	fadds f0, f1, f0
/* 8019E198 0019B198  C0 9C 00 74 */	lfs f4, 0x74(r28)
/* 8019E19C 0019B19C  EC 43 10 2A */	fadds f2, f3, f2
/* 8019E1A0 0019B1A0  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1A4 0019B1A4  D0 46 80 00 */	stfs f2, -0x8000(r6)
/* 8019E1A8 0019B1A8  D0 86 80 00 */	stfs f4, -0x8000(r6)
/* 8019E1AC 0019B1AC  C0 05 00 00 */	lfs f0, 0(r5)
/* 8019E1B0 0019B1B0  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1B4 0019B1B4  C0 05 00 04 */	lfs f0, 4(r5)
/* 8019E1B8 0019B1B8  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1BC 0019B1BC  D0 26 80 00 */	stfs f1, -0x8000(r6)
/* 8019E1C0 0019B1C0  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E1C4 0019B1C4  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1C8 0019B1C8  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E1CC 0019B1CC  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1D0 0019B1D0  C0 04 00 00 */	lfs f0, 0(r4)
/* 8019E1D4 0019B1D4  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1D8 0019B1D8  C0 04 00 04 */	lfs f0, 4(r4)
/* 8019E1DC 0019B1DC  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1E0 0019B1E0  D3 66 80 00 */	stfs f27, -0x8000(r6)
/* 8019E1E4 0019B1E4  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E1E8 0019B1E8  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1EC 0019B1EC  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E1F0 0019B1F0  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1F4 0019B1F4  C0 03 00 00 */	lfs f0, 0(r3)
/* 8019E1F8 0019B1F8  D0 06 80 00 */	stfs f0, -0x8000(r6)
/* 8019E1FC 0019B1FC  C0 03 00 04 */	lfs f0, 4(r3)
/* 8019E200 0019B200  D0 06 80 00 */	stfs f0, -0x8000(r6)
.L_8019E204:
/* 8019E204 0019B204  3B BD 00 01 */	addi r29, r29, 1
/* 8019E208 0019B208  3B 9C 01 34 */	addi r28, r28, 0x134
/* 8019E20C 0019B20C  2C 1D 00 C8 */	cmpwi r29, 0xc8
/* 8019E210 0019B210  41 80 F8 EC */	blt .L_8019DAFC
/* 8019E214 0019B214  E3 E1 02 08 */	psq_l f31, 520(r1), 0, qr0
/* 8019E218 0019B218  CB E1 02 00 */	lfd f31, 0x200(r1)
/* 8019E21C 0019B21C  E3 C1 01 F8 */	psq_l f30, 504(r1), 0, qr0
/* 8019E220 0019B220  CB C1 01 F0 */	lfd f30, 0x1f0(r1)
/* 8019E224 0019B224  E3 A1 01 E8 */	psq_l f29, 488(r1), 0, qr0
/* 8019E228 0019B228  CB A1 01 E0 */	lfd f29, 0x1e0(r1)
/* 8019E22C 0019B22C  E3 81 01 D8 */	psq_l f28, 472(r1), 0, qr0
/* 8019E230 0019B230  CB 81 01 D0 */	lfd f28, 0x1d0(r1)
/* 8019E234 0019B234  E3 61 01 C8 */	psq_l f27, 456(r1), 0, qr0
/* 8019E238 0019B238  CB 61 01 C0 */	lfd f27, 0x1c0(r1)
/* 8019E23C 0019B23C  E3 41 01 B8 */	psq_l f26, 440(r1), 0, qr0
/* 8019E240 0019B240  CB 41 01 B0 */	lfd f26, 0x1b0(r1)
/* 8019E244 0019B244  E3 21 01 A8 */	psq_l f25, 424(r1), 0, qr0
/* 8019E248 0019B248  CB 21 01 A0 */	lfd f25, 0x1a0(r1)
/* 8019E24C 0019B24C  E3 01 01 98 */	psq_l f24, 408(r1), 0, qr0
/* 8019E250 0019B250  CB 01 01 90 */	lfd f24, 0x190(r1)
/* 8019E254 0019B254  E2 E1 01 88 */	psq_l f23, 392(r1), 0, qr0
/* 8019E258 0019B258  CA E1 01 80 */	lfd f23, 0x180(r1)
/* 8019E25C 0019B25C  E2 C1 01 78 */	psq_l f22, 376(r1), 0, qr0
/* 8019E260 0019B260  CA C1 01 70 */	lfd f22, 0x170(r1)
/* 8019E264 0019B264  BB 41 01 58 */	lmw r26, 0x158(r1)
/* 8019E268 0019B268  80 01 02 14 */	lwz r0, 0x214(r1)
/* 8019E26C 0019B26C  7C 08 03 A6 */	mtlr r0
/* 8019E270 0019B270  38 21 02 10 */	addi r1, r1, 0x210
/* 8019E274 0019B274  4E 80 00 20 */	blr 

.global BattleAudienceAnimProcess
BattleAudienceAnimProcess:
/* 8019E278 0019B278  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019E27C 0019B27C  7C 08 02 A6 */	mflr r0
/* 8019E280 0019B280  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019E284 0019B284  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019E288 0019B288  48 00 44 4D */	bl BattleAudienceBaseGetPtr
/* 8019E28C 0019B28C  3B E0 00 00 */	li r31, 0
/* 8019E290 0019B290  38 60 00 00 */	li r3, 0
/* 8019E294 0019B294  48 00 44 05 */	bl BattleAudienceGetPtr
.L_8019E298:
/* 8019E298 0019B298  80 83 00 00 */	lwz r4, 0(r3)
/* 8019E29C 0019B29C  54 80 07 FF */	clrlwi. r0, r4, 0x1f
/* 8019E2A0 0019B2A0  41 82 01 98 */	beq .L_8019E438
/* 8019E2A4 0019B2A4  54 80 07 7B */	rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 8019E2A8 0019B2A8  41 82 01 90 */	beq .L_8019E438
/* 8019E2AC 0019B2AC  80 83 00 2C */	lwz r4, 0x2c(r3)
/* 8019E2B0 0019B2B0  80 A3 00 28 */	lwz r5, 0x28(r3)
/* 8019E2B4 0019B2B4  2C 04 00 00 */	cmpwi r4, 0
/* 8019E2B8 0019B2B8  40 81 00 10 */	ble .L_8019E2C8
/* 8019E2BC 0019B2BC  38 04 FF FF */	addi r0, r4, -1
/* 8019E2C0 0019B2C0  90 03 00 2C */	stw r0, 0x2c(r3)
/* 8019E2C4 0019B2C4  48 00 01 74 */	b .L_8019E438
.L_8019E2C8:
/* 8019E2C8 0019B2C8  80 85 00 00 */	lwz r4, 0(r5)
/* 8019E2CC 0019B2CC  38 04 00 08 */	addi r0, r4, 8
/* 8019E2D0 0019B2D0  28 00 00 07 */	cmplwi r0, 7
/* 8019E2D4 0019B2D4  41 81 01 64 */	bgt .L_8019E438
/* 8019E2D8 0019B2D8  3C 80 80 3A */	lis r4, lbl_80399D20@ha
/* 8019E2DC 0019B2DC  54 00 10 3A */	slwi r0, r0, 2
/* 8019E2E0 0019B2E0  38 84 9D 20 */	addi r4, r4, lbl_80399D20@l
/* 8019E2E4 0019B2E4  7C 04 00 2E */	lwzx r0, r4, r0
/* 8019E2E8 0019B2E8  7C 09 03 A6 */	mtctr r0
/* 8019E2EC 0019B2EC  4E 80 04 20 */	bctr 
/* 8019E2F0 0019B2F0  80 05 00 04 */	lwz r0, 4(r5)
/* 8019E2F4 0019B2F4  98 03 00 1A */	stb r0, 0x1a(r3)
/* 8019E2F8 0019B2F8  80 05 00 08 */	lwz r0, 8(r5)
/* 8019E2FC 0019B2FC  90 03 00 2C */	stw r0, 0x2c(r3)
/* 8019E300 0019B300  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E304 0019B304  38 04 00 0C */	addi r0, r4, 0xc
/* 8019E308 0019B308  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E30C 0019B30C  48 00 01 2C */	b .L_8019E438
/* 8019E310 0019B310  80 03 00 24 */	lwz r0, 0x24(r3)
/* 8019E314 0019B314  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E318 0019B318  48 00 01 20 */	b .L_8019E438
/* 8019E31C 0019B31C  38 05 00 08 */	addi r0, r5, 8
/* 8019E320 0019B320  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E324 0019B324  48 00 01 14 */	b .L_8019E438
/* 8019E328 0019B328  80 A5 00 04 */	lwz r5, 4(r5)
/* 8019E32C 0019B32C  80 03 00 24 */	lwz r0, 0x24(r3)
/* 8019E330 0019B330  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E334 0019B334  48 00 00 10 */	b .L_8019E344
.L_8019E338:
/* 8019E338 0019B338  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E33C 0019B33C  38 04 00 04 */	addi r0, r4, 4
/* 8019E340 0019B340  90 03 00 28 */	stw r0, 0x28(r3)
.L_8019E344:
/* 8019E344 0019B344  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E348 0019B348  80 04 00 00 */	lwz r0, 0(r4)
/* 8019E34C 0019B34C  2C 00 FF FC */	cmpwi r0, -4
/* 8019E350 0019B350  40 82 FF E8 */	bne .L_8019E338
/* 8019E354 0019B354  80 04 00 04 */	lwz r0, 4(r4)
/* 8019E358 0019B358  7C 00 28 00 */	cmpw r0, r5
/* 8019E35C 0019B35C  40 82 FF DC */	bne .L_8019E338
/* 8019E360 0019B360  48 00 00 D8 */	b .L_8019E438
/* 8019E364 0019B364  88 03 00 40 */	lbz r0, 0x40(r3)
/* 8019E368 0019B368  80 A5 00 04 */	lwz r5, 4(r5)
/* 8019E36C 0019B36C  54 04 10 3A */	slwi r4, r0, 2
/* 8019E370 0019B370  38 04 00 34 */	addi r0, r4, 0x34
/* 8019E374 0019B374  7C A3 01 2E */	stwx r5, r3, r0
/* 8019E378 0019B378  88 83 00 40 */	lbz r4, 0x40(r3)
/* 8019E37C 0019B37C  38 04 00 01 */	addi r0, r4, 1
/* 8019E380 0019B380  98 03 00 40 */	stb r0, 0x40(r3)
/* 8019E384 0019B384  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E388 0019B388  38 04 00 08 */	addi r0, r4, 8
/* 8019E38C 0019B38C  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E390 0019B390  48 00 00 A8 */	b .L_8019E438
/* 8019E394 0019B394  88 03 00 40 */	lbz r0, 0x40(r3)
/* 8019E398 0019B398  54 04 10 3A */	slwi r4, r0, 2
/* 8019E39C 0019B39C  38 A4 00 30 */	addi r5, r4, 0x30
/* 8019E3A0 0019B3A0  7C 83 28 2E */	lwzx r4, r3, r5
/* 8019E3A4 0019B3A4  38 04 FF FF */	addi r0, r4, -1
/* 8019E3A8 0019B3A8  7C 03 29 2E */	stwx r0, r3, r5
/* 8019E3AC 0019B3AC  88 A3 00 40 */	lbz r5, 0x40(r3)
/* 8019E3B0 0019B3B0  54 A4 10 3A */	slwi r4, r5, 2
/* 8019E3B4 0019B3B4  38 04 00 30 */	addi r0, r4, 0x30
/* 8019E3B8 0019B3B8  7C 03 00 2E */	lwzx r0, r3, r0
/* 8019E3BC 0019B3BC  2C 00 00 00 */	cmpwi r0, 0
/* 8019E3C0 0019B3C0  41 81 00 1C */	bgt .L_8019E3DC
/* 8019E3C4 0019B3C4  38 05 FF FF */	addi r0, r5, -1
/* 8019E3C8 0019B3C8  98 03 00 40 */	stb r0, 0x40(r3)
/* 8019E3CC 0019B3CC  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E3D0 0019B3D0  38 04 00 04 */	addi r0, r4, 4
/* 8019E3D4 0019B3D4  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E3D8 0019B3D8  48 00 00 60 */	b .L_8019E438
.L_8019E3DC:
/* 8019E3DC 0019B3DC  38 A0 00 01 */	li r5, 1
.L_8019E3E0:
/* 8019E3E0 0019B3E0  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E3E4 0019B3E4  38 04 FF FC */	addi r0, r4, -4
/* 8019E3E8 0019B3E8  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E3EC 0019B3EC  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E3F0 0019B3F0  80 04 00 00 */	lwz r0, 0(r4)
/* 8019E3F4 0019B3F4  2C 00 FF FA */	cmpwi r0, -6
/* 8019E3F8 0019B3F8  40 82 00 08 */	bne .L_8019E400
/* 8019E3FC 0019B3FC  38 A5 FF FF */	addi r5, r5, -1
.L_8019E400:
/* 8019E400 0019B400  2C 00 FF F9 */	cmpwi r0, -7
/* 8019E404 0019B404  40 82 00 08 */	bne .L_8019E40C
/* 8019E408 0019B408  38 A5 00 01 */	addi r5, r5, 1
.L_8019E40C:
/* 8019E40C 0019B40C  2C 05 00 00 */	cmpwi r5, 0
/* 8019E410 0019B410  41 81 FF D0 */	bgt .L_8019E3E0
/* 8019E414 0019B414  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E418 0019B418  38 04 00 08 */	addi r0, r4, 8
/* 8019E41C 0019B41C  90 03 00 28 */	stw r0, 0x28(r3)
/* 8019E420 0019B420  48 00 00 18 */	b .L_8019E438
/* 8019E424 0019B424  80 05 00 04 */	lwz r0, 4(r5)
/* 8019E428 0019B428  90 03 00 2C */	stw r0, 0x2c(r3)
/* 8019E42C 0019B42C  80 83 00 28 */	lwz r4, 0x28(r3)
/* 8019E430 0019B430  38 04 00 08 */	addi r0, r4, 8
/* 8019E434 0019B434  90 03 00 28 */	stw r0, 0x28(r3)
.L_8019E438:
/* 8019E438 0019B438  3B FF 00 01 */	addi r31, r31, 1
/* 8019E43C 0019B43C  38 63 01 34 */	addi r3, r3, 0x134
/* 8019E440 0019B440  2C 1F 00 C8 */	cmpwi r31, 0xc8
/* 8019E444 0019B444  41 80 FE 54 */	blt .L_8019E298
/* 8019E448 0019B448  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019E44C 0019B44C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019E450 0019B450  7C 08 03 A6 */	mtlr r0
/* 8019E454 0019B454  38 21 00 10 */	addi r1, r1, 0x10
/* 8019E458 0019B458  4E 80 00 20 */	blr 

.global BattleAudienceGXInit
BattleAudienceGXInit:
/* 8019E45C 0019B45C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019E460 0019B460  7C 08 02 A6 */	mflr r0
/* 8019E464 0019B464  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019E468 0019B468  48 00 42 6D */	bl BattleAudienceBaseGetPtr
/* 8019E46C 0019B46C  38 60 00 00 */	li r3, 0
/* 8019E470 0019B470  48 11 1A 19 */	bl GXSetCullMode
/* 8019E474 0019B474  48 11 02 A9 */	bl GXClearVtxDesc
/* 8019E478 0019B478  38 60 00 09 */	li r3, 9
/* 8019E47C 0019B47C  38 80 00 01 */	li r4, 1
/* 8019E480 0019B480  48 10 F9 85 */	bl GXSetVtxDesc
/* 8019E484 0019B484  38 60 00 0B */	li r3, 0xb
/* 8019E488 0019B488  38 80 00 01 */	li r4, 1
/* 8019E48C 0019B48C  48 10 F9 79 */	bl GXSetVtxDesc
/* 8019E490 0019B490  38 60 00 0D */	li r3, 0xd
/* 8019E494 0019B494  38 80 00 01 */	li r4, 1
/* 8019E498 0019B498  48 10 F9 6D */	bl GXSetVtxDesc
/* 8019E49C 0019B49C  38 60 00 00 */	li r3, 0
/* 8019E4A0 0019B4A0  38 80 00 09 */	li r4, 9
/* 8019E4A4 0019B4A4  38 A0 00 01 */	li r5, 1
/* 8019E4A8 0019B4A8  38 C0 00 04 */	li r6, 4
/* 8019E4AC 0019B4AC  38 E0 00 00 */	li r7, 0
/* 8019E4B0 0019B4B0  48 11 02 A5 */	bl GXSetVtxAttrFmt
/* 8019E4B4 0019B4B4  38 60 00 00 */	li r3, 0
/* 8019E4B8 0019B4B8  38 80 00 0B */	li r4, 0xb
/* 8019E4BC 0019B4BC  38 A0 00 01 */	li r5, 1
/* 8019E4C0 0019B4C0  38 C0 00 05 */	li r6, 5
/* 8019E4C4 0019B4C4  38 E0 00 00 */	li r7, 0
/* 8019E4C8 0019B4C8  48 11 02 8D */	bl GXSetVtxAttrFmt
/* 8019E4CC 0019B4CC  38 60 00 00 */	li r3, 0
/* 8019E4D0 0019B4D0  38 80 00 0D */	li r4, 0xd
/* 8019E4D4 0019B4D4  38 A0 00 01 */	li r5, 1
/* 8019E4D8 0019B4D8  38 C0 00 04 */	li r6, 4
/* 8019E4DC 0019B4DC  38 E0 00 00 */	li r7, 0
/* 8019E4E0 0019B4E0  48 11 02 75 */	bl GXSetVtxAttrFmt
/* 8019E4E4 0019B4E4  38 60 00 01 */	li r3, 1
/* 8019E4E8 0019B4E8  48 11 2C 51 */	bl GXSetNumChans
/* 8019E4EC 0019B4EC  38 60 00 04 */	li r3, 4
/* 8019E4F0 0019B4F0  38 80 00 00 */	li r4, 0
/* 8019E4F4 0019B4F4  38 A0 00 01 */	li r5, 1
/* 8019E4F8 0019B4F8  38 C0 00 01 */	li r6, 1
/* 8019E4FC 0019B4FC  38 E0 00 00 */	li r7, 0
/* 8019E500 0019B500  39 00 00 02 */	li r8, 2
/* 8019E504 0019B504  39 20 00 02 */	li r9, 2
/* 8019E508 0019B508  48 11 2C 6D */	bl GXSetChanCtrl
/* 8019E50C 0019B50C  38 60 00 01 */	li r3, 1
/* 8019E510 0019B510  48 11 0D 71 */	bl GXSetNumTexGens
/* 8019E514 0019B514  38 60 00 00 */	li r3, 0
/* 8019E518 0019B518  38 80 00 01 */	li r4, 1
/* 8019E51C 0019B51C  38 A0 00 04 */	li r5, 4
/* 8019E520 0019B520  38 C0 00 3C */	li r6, 0x3c
/* 8019E524 0019B524  38 E0 00 00 */	li r7, 0
/* 8019E528 0019B528  39 00 00 7D */	li r8, 0x7d
/* 8019E52C 0019B52C  48 11 0A D5 */	bl GXSetTexCoordGen2
/* 8019E530 0019B530  38 60 00 01 */	li r3, 1
/* 8019E534 0019B534  48 11 4C 95 */	bl GXSetNumTevStages
/* 8019E538 0019B538  38 60 00 00 */	li r3, 0
/* 8019E53C 0019B53C  38 80 00 00 */	li r4, 0
/* 8019E540 0019B540  38 A0 00 00 */	li r5, 0
/* 8019E544 0019B544  38 C0 00 00 */	li r6, 0
/* 8019E548 0019B548  38 E0 00 01 */	li r7, 1
/* 8019E54C 0019B54C  39 00 00 00 */	li r8, 0
/* 8019E550 0019B550  48 11 46 95 */	bl GXSetTevColorOp
/* 8019E554 0019B554  38 60 00 00 */	li r3, 0
/* 8019E558 0019B558  38 80 00 0F */	li r4, 0xf
/* 8019E55C 0019B55C  38 A0 00 0A */	li r5, 0xa
/* 8019E560 0019B560  38 C0 00 08 */	li r6, 8
/* 8019E564 0019B564  38 E0 00 0F */	li r7, 0xf
/* 8019E568 0019B568  48 11 45 F5 */	bl GXSetTevColorIn
/* 8019E56C 0019B56C  38 60 00 00 */	li r3, 0
/* 8019E570 0019B570  38 80 00 00 */	li r4, 0
/* 8019E574 0019B574  38 A0 00 00 */	li r5, 0
/* 8019E578 0019B578  38 C0 00 00 */	li r6, 0
/* 8019E57C 0019B57C  38 E0 00 01 */	li r7, 1
/* 8019E580 0019B580  39 00 00 00 */	li r8, 0
/* 8019E584 0019B584  48 11 46 C9 */	bl GXSetTevAlphaOp
/* 8019E588 0019B588  38 60 00 00 */	li r3, 0
/* 8019E58C 0019B58C  38 80 00 07 */	li r4, 7
/* 8019E590 0019B590  38 A0 00 05 */	li r5, 5
/* 8019E594 0019B594  38 C0 00 04 */	li r6, 4
/* 8019E598 0019B598  38 E0 00 07 */	li r7, 7
/* 8019E59C 0019B59C  48 11 46 05 */	bl GXSetTevAlphaIn
/* 8019E5A0 0019B5A0  38 60 00 00 */	li r3, 0
/* 8019E5A4 0019B5A4  38 80 00 00 */	li r4, 0
/* 8019E5A8 0019B5A8  38 A0 00 00 */	li r5, 0
/* 8019E5AC 0019B5AC  38 C0 00 04 */	li r6, 4
/* 8019E5B0 0019B5B0  48 11 4A 7D */	bl GXSetTevOrder
/* 8019E5B4 0019B5B4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019E5B8 0019B5B8  7C 08 03 A6 */	mtlr r0
/* 8019E5BC 0019B5BC  38 21 00 10 */	addi r1, r1, 0x10
/* 8019E5C0 0019B5C0  4E 80 00 20 */	blr 

.global BattleAudienceWinCtrlProcess
BattleAudienceWinCtrlProcess:
/* 8019E5C4 0019B5C4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019E5C8 0019B5C8  7C 08 02 A6 */	mflr r0
/* 8019E5CC 0019B5CC  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019E5D0 0019B5D0  BF C1 00 18 */	stmw r30, 0x18(r1)
/* 8019E5D4 0019B5D4  48 00 41 01 */	bl BattleAudienceBaseGetPtr
/* 8019E5D8 0019B5D8  7C 7E 1B 78 */	mr r30, r3
/* 8019E5DC 0019B5DC  48 00 40 55 */	bl BattleAudienceWinGetPtr
/* 8019E5E0 0019B5E0  3C 9E 00 01 */	addis r4, r30, 1
/* 8019E5E4 0019B5E4  3C 00 43 30 */	lis r0, 0x4330
/* 8019E5E8 0019B5E8  80 A4 37 84 */	lwz r5, 0x3784(r4)
/* 8019E5EC 0019B5EC  7C 7F 1B 78 */	mr r31, r3
/* 8019E5F0 0019B5F0  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019E5F4 0019B5F4  90 01 00 08 */	stw r0, 8(r1)
/* 8019E5F8 0019B5F8  6C A3 80 00 */	xoris r3, r5, 0x8000
/* 8019E5FC 0019B5FC  C8 64 9A 00 */	lfd f3, lbl_802F9A00@l(r4)
/* 8019E600 0019B600  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019E604 0019B604  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 8019E608 0019B608  C8 41 00 08 */	lfd f2, 8(r1)
/* 8019E60C 0019B60C  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E610 0019B610  EC 42 18 28 */	fsubs f2, f2, f3
/* 8019E614 0019B614  EC 62 08 28 */	fsubs f3, f2, f1
/* 8019E618 0019B618  FC 00 18 00 */	fcmpu cr0, f0, f3
/* 8019E61C 0019B61C  41 82 00 FC */	beq .L_8019E718
/* 8019E620 0019B620  FC 03 00 40 */	fcmpo cr0, f3, f0
/* 8019E624 0019B624  40 81 00 7C */	ble .L_8019E6A0
/* 8019E628 0019B628  C0 22 D2 F8 */	lfs f1, lbl_8041E678@sda21(r2)
/* 8019E62C 0019B62C  EC 01 00 F2 */	fmuls f0, f1, f3
/* 8019E630 0019B630  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 8019E634 0019B634  40 80 00 08 */	bge .L_8019E63C
/* 8019E638 0019B638  48 00 00 08 */	b .L_8019E640
.L_8019E63C:
/* 8019E63C 0019B63C  FC 20 00 90 */	fmr f1, f0
.L_8019E640:
/* 8019E640 0019B640  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8019E644 0019B644  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 8019E648 0019B648  3C 00 43 30 */	lis r0, 0x4330
/* 8019E64C 0019B64C  3C 9E 00 01 */	addis r4, r30, 1
/* 8019E650 0019B650  EC 00 08 2A */	fadds f0, f0, f1
/* 8019E654 0019B654  C8 63 9A 00 */	lfd f3, lbl_802F9A00@l(r3)
/* 8019E658 0019B658  90 01 00 08 */	stw r0, 8(r1)
/* 8019E65C 0019B65C  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 8019E660 0019B660  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E664 0019B664  80 64 37 84 */	lwz r3, 0x3784(r4)
/* 8019E668 0019B668  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 8019E66C 0019B66C  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019E670 0019B670  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019E674 0019B674  C8 41 00 08 */	lfd f2, 8(r1)
/* 8019E678 0019B678  EC 42 18 28 */	fsubs f2, f2, f3
/* 8019E67C 0019B67C  EC 22 08 28 */	fsubs f1, f2, f1
/* 8019E680 0019B680  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E684 0019B684  40 80 00 94 */	bge .L_8019E718
/* 8019E688 0019B688  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019E68C 0019B68C  90 01 00 08 */	stw r0, 8(r1)
/* 8019E690 0019B690  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019E694 0019B694  EC 00 18 28 */	fsubs f0, f0, f3
/* 8019E698 0019B698  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 8019E69C 0019B69C  48 00 00 7C */	b .L_8019E718
.L_8019E6A0:
/* 8019E6A0 0019B6A0  C0 42 D2 F8 */	lfs f2, lbl_8041E678@sda21(r2)
/* 8019E6A4 0019B6A4  C0 02 D3 3C */	lfs f0, lbl_8041E6BC@sda21(r2)
/* 8019E6A8 0019B6A8  EC 22 00 F2 */	fmuls f1, f2, f3
/* 8019E6AC 0019B6AC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E6B0 0019B6B0  40 81 00 08 */	ble .L_8019E6B8
/* 8019E6B4 0019B6B4  48 00 00 08 */	b .L_8019E6BC
.L_8019E6B8:
/* 8019E6B8 0019B6B8  EC 40 00 F2 */	fmuls f2, f0, f3
.L_8019E6BC:
/* 8019E6BC 0019B6BC  C0 1F 00 18 */	lfs f0, 0x18(r31)
/* 8019E6C0 0019B6C0  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 8019E6C4 0019B6C4  3C 00 43 30 */	lis r0, 0x4330
/* 8019E6C8 0019B6C8  3C 9E 00 01 */	addis r4, r30, 1
/* 8019E6CC 0019B6CC  EC 00 10 28 */	fsubs f0, f0, f2
/* 8019E6D0 0019B6D0  C8 63 9A 00 */	lfd f3, lbl_802F9A00@l(r3)
/* 8019E6D4 0019B6D4  90 01 00 08 */	stw r0, 8(r1)
/* 8019E6D8 0019B6D8  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 8019E6DC 0019B6DC  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E6E0 0019B6E0  80 64 37 84 */	lwz r3, 0x3784(r4)
/* 8019E6E4 0019B6E4  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 8019E6E8 0019B6E8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019E6EC 0019B6EC  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019E6F0 0019B6F0  C8 41 00 08 */	lfd f2, 8(r1)
/* 8019E6F4 0019B6F4  EC 42 18 28 */	fsubs f2, f2, f3
/* 8019E6F8 0019B6F8  EC 22 08 28 */	fsubs f1, f2, f1
/* 8019E6FC 0019B6FC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019E700 0019B700  40 81 00 18 */	ble .L_8019E718
/* 8019E704 0019B704  90 61 00 0C */	stw r3, 0xc(r1)
/* 8019E708 0019B708  90 01 00 08 */	stw r0, 8(r1)
/* 8019E70C 0019B70C  C8 01 00 08 */	lfd f0, 8(r1)
/* 8019E710 0019B710  EC 00 18 28 */	fsubs f0, f0, f3
/* 8019E714 0019B714  D0 1F 00 18 */	stfs f0, 0x18(r31)
.L_8019E718:
/* 8019E718 0019B718  88 1F 00 00 */	lbz r0, 0(r31)
/* 8019E71C 0019B71C  28 00 00 00 */	cmplwi r0, 0
/* 8019E720 0019B720  41 82 00 28 */	beq .L_8019E748
/* 8019E724 0019B724  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8019E728 0019B728  38 03 00 01 */	addi r0, r3, 1
/* 8019E72C 0019B72C  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8019E730 0019B730  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 8019E734 0019B734  2C 00 00 0F */	cmpwi r0, 0xf
/* 8019E738 0019B738  40 81 00 30 */	ble .L_8019E768
/* 8019E73C 0019B73C  38 00 00 0F */	li r0, 0xf
/* 8019E740 0019B740  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8019E744 0019B744  48 00 00 24 */	b .L_8019E768
.L_8019E748:
/* 8019E748 0019B748  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8019E74C 0019B74C  38 03 FF FF */	addi r0, r3, -1
/* 8019E750 0019B750  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8019E754 0019B754  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 8019E758 0019B758  2C 00 00 00 */	cmpwi r0, 0
/* 8019E75C 0019B75C  40 80 00 0C */	bge .L_8019E768
/* 8019E760 0019B760  38 00 00 00 */	li r0, 0
/* 8019E764 0019B764  90 1F 00 14 */	stw r0, 0x14(r31)
.L_8019E768:
/* 8019E768 0019B768  C0 22 D3 40 */	lfs f1, lbl_8041E6C0@sda21(r2)
/* 8019E76C 0019B76C  38 60 00 04 */	li r3, 4
/* 8019E770 0019B770  C0 42 D3 44 */	lfs f2, lbl_8041E6C4@sda21(r2)
/* 8019E774 0019B774  38 A0 00 0F */	li r5, 0xf
/* 8019E778 0019B778  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 8019E77C 0019B77C  4B E6 84 91 */	bl intplGetValue
/* 8019E780 0019B780  D0 3F 00 08 */	stfs f1, 8(r31)
/* 8019E784 0019B784  C0 22 D3 48 */	lfs f1, lbl_8041E6C8@sda21(r2)
/* 8019E788 0019B788  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E78C 0019B78C  D0 3F 00 0C */	stfs f1, 0xc(r31)
/* 8019E790 0019B790  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 8019E794 0019B794  BB C1 00 18 */	lmw r30, 0x18(r1)
/* 8019E798 0019B798  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019E79C 0019B79C  7C 08 03 A6 */	mtlr r0
/* 8019E7A0 0019B7A0  38 21 00 20 */	addi r1, r1, 0x20
/* 8019E7A4 0019B7A4  4E 80 00 20 */	blr 

.global BattleAudienceApSrcEntry
BattleAudienceApSrcEntry:
/* 8019E7A8 0019B7A8  94 21 FC B0 */	stwu r1, -0x350(r1)
/* 8019E7AC 0019B7AC  7C 08 02 A6 */	mflr r0
/* 8019E7B0 0019B7B0  90 01 03 54 */	stw r0, 0x354(r1)
/* 8019E7B4 0019B7B4  BF 61 03 3C */	stmw r27, 0x33c(r1)
/* 8019E7B8 0019B7B8  48 00 3F 1D */	bl BattleAudienceBaseGetPtr
/* 8019E7BC 0019B7BC  38 00 00 64 */	li r0, 0x64
/* 8019E7C0 0019B7C0  3F E3 00 01 */	addis r31, r3, 1
/* 8019E7C4 0019B7C4  38 60 00 00 */	li r3, 0
/* 8019E7C8 0019B7C8  7C 09 03 A6 */	mtctr r0
/* 8019E7CC 0019B7CC  3B FF 0E 7C */	addi r31, r31, 0xe7c
.L_8019E7D0:
/* 8019E7D0 0019B7D0  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019E7D4 0019B7D4  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019E7D8 0019B7D8  41 82 00 10 */	beq .L_8019E7E8
/* 8019E7DC 0019B7DC  38 63 00 01 */	addi r3, r3, 1
/* 8019E7E0 0019B7E0  3B FF 00 60 */	addi r31, r31, 0x60
/* 8019E7E4 0019B7E4  42 00 FF EC */	bdnz .L_8019E7D0
.L_8019E7E8:
/* 8019E7E8 0019B7E8  2C 03 00 64 */	cmpwi r3, 0x64
/* 8019E7EC 0019B7EC  40 82 00 0C */	bne .L_8019E7F8
/* 8019E7F0 0019B7F0  38 60 00 00 */	li r3, 0
/* 8019E7F4 0019B7F4  48 00 01 E4 */	b .L_8019E9D8
.L_8019E7F8:
/* 8019E7F8 0019B7F8  3B C0 00 00 */	li r30, 0
/* 8019E7FC 0019B7FC  3B 60 00 00 */	li r27, 0
/* 8019E800 0019B800  7F DC F3 78 */	mr r28, r30
/* 8019E804 0019B804  38 60 00 00 */	li r3, 0
/* 8019E808 0019B808  48 00 3E 91 */	bl BattleAudienceGetPtr
/* 8019E80C 0019B80C  3B A1 00 08 */	addi r29, r1, 8
.L_8019E810:
/* 8019E810 0019B810  7F 83 E3 78 */	mr r3, r28
/* 8019E814 0019B814  4B FF E2 01 */	bl BattleAudience_GetExist
/* 8019E818 0019B818  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8019E81C 0019B81C  28 00 00 01 */	cmplwi r0, 1
/* 8019E820 0019B820  40 82 00 10 */	bne .L_8019E830
/* 8019E824 0019B824  7F 9D F1 2E */	stwx r28, r29, r30
/* 8019E828 0019B828  3B 7B 00 01 */	addi r27, r27, 1
/* 8019E82C 0019B82C  3B DE 00 04 */	addi r30, r30, 4
.L_8019E830:
/* 8019E830 0019B830  3B 9C 00 01 */	addi r28, r28, 1
/* 8019E834 0019B834  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 8019E838 0019B838  41 80 FF D8 */	blt .L_8019E810
/* 8019E83C 0019B83C  2C 1B 00 00 */	cmpwi r27, 0
/* 8019E840 0019B840  40 82 00 0C */	bne .L_8019E84C
/* 8019E844 0019B844  38 60 00 01 */	li r3, 1
/* 8019E848 0019B848  48 00 01 90 */	b .L_8019E9D8
.L_8019E84C:
/* 8019E84C 0019B84C  38 00 00 01 */	li r0, 1
/* 8019E850 0019B850  3C 60 80 30 */	lis r3, lbl_802F9750@ha
/* 8019E854 0019B854  90 1F 00 00 */	stw r0, 0(r31)
/* 8019E858 0019B858  38 80 00 00 */	li r4, 0
/* 8019E85C 0019B85C  38 C3 97 50 */	addi r6, r3, lbl_802F9750@l
/* 8019E860 0019B860  38 00 00 80 */	li r0, 0x80
/* 8019E864 0019B864  90 9F 00 04 */	stw r4, 4(r31)
/* 8019E868 0019B868  7F 63 DB 78 */	mr r3, r27
/* 8019E86C 0019B86C  90 9F 00 44 */	stw r4, 0x44(r31)
/* 8019E870 0019B870  80 A6 00 00 */	lwz r5, 0(r6)
/* 8019E874 0019B874  80 86 00 04 */	lwz r4, 4(r6)
/* 8019E878 0019B878  90 BF 00 38 */	stw r5, 0x38(r31)
/* 8019E87C 0019B87C  90 9F 00 3C */	stw r4, 0x3c(r31)
/* 8019E880 0019B880  80 86 00 08 */	lwz r4, 8(r6)
/* 8019E884 0019B884  90 9F 00 40 */	stw r4, 0x40(r31)
/* 8019E888 0019B888  98 1F 00 5C */	stb r0, 0x5c(r31)
/* 8019E88C 0019B88C  4B E6 76 39 */	bl irand
/* 8019E890 0019B890  54 60 10 3A */	slwi r0, r3, 2
/* 8019E894 0019B894  38 61 00 08 */	addi r3, r1, 8
/* 8019E898 0019B898  7C 63 00 2E */	lwzx r3, r3, r0
/* 8019E89C 0019B89C  48 00 3D FD */	bl BattleAudienceGetPtr
/* 8019E8A0 0019B8A0  C0 03 00 48 */	lfs f0, 0x48(r3)
/* 8019E8A4 0019B8A4  C0 42 D3 28 */	lfs f2, lbl_8041E6A8@sda21(r2)
/* 8019E8A8 0019B8A8  D0 1F 00 08 */	stfs f0, 8(r31)
/* 8019E8AC 0019B8AC  C0 22 D2 A0 */	lfs f1, lbl_8041E620@sda21(r2)
/* 8019E8B0 0019B8B0  C0 03 00 4C */	lfs f0, 0x4c(r3)
/* 8019E8B4 0019B8B4  EC 02 00 2A */	fadds f0, f2, f0
/* 8019E8B8 0019B8B8  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 8019E8BC 0019B8BC  C0 03 00 50 */	lfs f0, 0x50(r3)
/* 8019E8C0 0019B8C0  38 60 00 04 */	li r3, 4
/* 8019E8C4 0019B8C4  EC 01 00 2A */	fadds f0, f1, f0
/* 8019E8C8 0019B8C8  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 8019E8CC 0019B8CC  4B E7 08 85 */	bl camGetPtr
/* 8019E8D0 0019B8D0  7C 7E 1B 78 */	mr r30, r3
/* 8019E8D4 0019B8D4  38 9F 00 08 */	addi r4, r31, 8
/* 8019E8D8 0019B8D8  7C 85 23 78 */	mr r5, r4
/* 8019E8DC 0019B8DC  38 7E 01 1C */	addi r3, r30, 0x11c
/* 8019E8E0 0019B8E0  48 0F 9F C1 */	bl PSMTXMultVec
/* 8019E8E4 0019B8E4  38 9F 00 08 */	addi r4, r31, 8
/* 8019E8E8 0019B8E8  38 7E 01 5C */	addi r3, r30, 0x15c
/* 8019E8EC 0019B8EC  7C 85 23 78 */	mr r5, r4
/* 8019E8F0 0019B8F0  48 0F A4 15 */	bl PSMTX44MultVec
/* 8019E8F4 0019B8F4  C0 5F 00 08 */	lfs f2, 8(r31)
/* 8019E8F8 0019B8F8  C0 02 D3 4C */	lfs f0, lbl_8041E6CC@sda21(r2)
/* 8019E8FC 0019B8FC  C0 22 D3 50 */	lfs f1, lbl_8041E6D0@sda21(r2)
/* 8019E900 0019B900  EC 42 00 32 */	fmuls f2, f2, f0
/* 8019E904 0019B904  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E908 0019B908  D0 5F 00 08 */	stfs f2, 8(r31)
/* 8019E90C 0019B90C  C0 5F 00 0C */	lfs f2, 0xc(r31)
/* 8019E910 0019B910  EC 22 00 72 */	fmuls f1, f2, f1
/* 8019E914 0019B914  D0 3F 00 0C */	stfs f1, 0xc(r31)
/* 8019E918 0019B918  D0 1F 00 10 */	stfs f0, 0x10(r31)
/* 8019E91C 0019B91C  48 0C 7A 59 */	bl rand
/* 8019E920 0019B920  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019E924 0019B924  3C 00 43 30 */	lis r0, 0x4330
/* 8019E928 0019B928  90 61 03 2C */	stw r3, 0x32c(r1)
/* 8019E92C 0019B92C  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019E930 0019B930  C8 64 9A 00 */	lfd f3, lbl_802F9A00@l(r4)
/* 8019E934 0019B934  90 01 03 28 */	stw r0, 0x328(r1)
/* 8019E938 0019B938  C0 42 D3 10 */	lfs f2, lbl_8041E690@sda21(r2)
/* 8019E93C 0019B93C  C8 01 03 28 */	lfd f0, 0x328(r1)
/* 8019E940 0019B940  C0 22 D2 F4 */	lfs f1, lbl_8041E674@sda21(r2)
/* 8019E944 0019B944  EC 60 18 28 */	fsubs f3, f0, f3
/* 8019E948 0019B948  C0 02 D3 28 */	lfs f0, lbl_8041E6A8@sda21(r2)
/* 8019E94C 0019B94C  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019E950 0019B950  EC 22 08 24 */	fdivs f1, f2, f1
/* 8019E954 0019B954  EC 01 00 28 */	fsubs f0, f1, f0
/* 8019E958 0019B958  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 8019E95C 0019B95C  48 0C 7A 19 */	bl rand
/* 8019E960 0019B960  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019E964 0019B964  3C 00 43 30 */	lis r0, 0x4330
/* 8019E968 0019B968  90 61 03 34 */	stw r3, 0x334(r1)
/* 8019E96C 0019B96C  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019E970 0019B970  3C 60 80 30 */	lis r3, lbl_802F975C@ha
/* 8019E974 0019B974  C8 24 9A 00 */	lfd f1, lbl_802F9A00@l(r4)
/* 8019E978 0019B978  90 01 03 30 */	stw r0, 0x330(r1)
/* 8019E97C 0019B97C  38 A3 97 5C */	addi r5, r3, lbl_802F975C@l
/* 8019E980 0019B980  C0 42 D3 14 */	lfs f2, lbl_8041E694@sda21(r2)
/* 8019E984 0019B984  38 60 00 01 */	li r3, 1
/* 8019E988 0019B988  C8 01 03 30 */	lfd f0, 0x330(r1)
/* 8019E98C 0019B98C  EC 60 08 28 */	fsubs f3, f0, f1
/* 8019E990 0019B990  C0 22 D2 F4 */	lfs f1, lbl_8041E674@sda21(r2)
/* 8019E994 0019B994  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019E998 0019B998  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019E99C 0019B99C  EC 22 08 24 */	fdivs f1, f2, f1
/* 8019E9A0 0019B9A0  D0 3F 00 18 */	stfs f1, 0x18(r31)
/* 8019E9A4 0019B9A4  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 8019E9A8 0019B9A8  80 9F 00 08 */	lwz r4, 8(r31)
/* 8019E9AC 0019B9AC  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8019E9B0 0019B9B0  90 9F 00 20 */	stw r4, 0x20(r31)
/* 8019E9B4 0019B9B4  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8019E9B8 0019B9B8  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 8019E9BC 0019B9BC  90 1F 00 28 */	stw r0, 0x28(r31)
/* 8019E9C0 0019B9C0  80 85 00 00 */	lwz r4, 0(r5)
/* 8019E9C4 0019B9C4  80 05 00 04 */	lwz r0, 4(r5)
/* 8019E9C8 0019B9C8  90 9F 00 2C */	stw r4, 0x2c(r31)
/* 8019E9CC 0019B9CC  90 1F 00 30 */	stw r0, 0x30(r31)
/* 8019E9D0 0019B9D0  80 05 00 08 */	lwz r0, 8(r5)
/* 8019E9D4 0019B9D4  90 1F 00 34 */	stw r0, 0x34(r31)
.L_8019E9D8:
/* 8019E9D8 0019B9D8  BB 61 03 3C */	lmw r27, 0x33c(r1)
/* 8019E9DC 0019B9DC  80 01 03 54 */	lwz r0, 0x354(r1)
/* 8019E9E0 0019B9E0  7C 08 03 A6 */	mtlr r0
/* 8019E9E4 0019B9E4  38 21 03 50 */	addi r1, r1, 0x350
/* 8019E9E8 0019B9E8  4E 80 00 20 */	blr 

.global BattleAudienceApSrcCtrlProcess
BattleAudienceApSrcCtrlProcess:
/* 8019E9EC 0019B9EC  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8019E9F0 0019B9F0  7C 08 02 A6 */	mflr r0
/* 8019E9F4 0019B9F4  90 01 00 54 */	stw r0, 0x54(r1)
/* 8019E9F8 0019B9F8  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8019E9FC 0019B9FC  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8019EA00 0019BA00  BF 81 00 30 */	stmw r28, 0x30(r1)
/* 8019EA04 0019BA04  48 00 3C D1 */	bl BattleAudienceBaseGetPtr
/* 8019EA08 0019BA08  80 03 00 00 */	lwz r0, 0(r3)
/* 8019EA0C 0019BA0C  7C 7F 1B 78 */	mr r31, r3
/* 8019EA10 0019BA10  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 8019EA14 0019BA14  41 82 05 30 */	beq .L_8019EF44
/* 8019EA18 0019BA18  38 00 00 64 */	li r0, 0x64
/* 8019EA1C 0019BA1C  3B 80 00 00 */	li r28, 0
/* 8019EA20 0019BA20  38 60 00 00 */	li r3, 0
/* 8019EA24 0019BA24  7C 09 03 A6 */	mtctr r0
.L_8019EA28:
/* 8019EA28 0019BA28  3C 83 00 01 */	addis r4, r3, 1
/* 8019EA2C 0019BA2C  38 84 0E 7C */	addi r4, r4, 0xe7c
/* 8019EA30 0019BA30  7C 1F 20 2E */	lwzx r0, r31, r4
/* 8019EA34 0019BA34  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019EA38 0019BA38  41 82 00 08 */	beq .L_8019EA40
/* 8019EA3C 0019BA3C  3B 9C 00 01 */	addi r28, r28, 1
.L_8019EA40:
/* 8019EA40 0019BA40  38 63 00 60 */	addi r3, r3, 0x60
/* 8019EA44 0019BA44  42 00 FF E4 */	bdnz .L_8019EA28
/* 8019EA48 0019BA48  80 7F 00 08 */	lwz r3, 8(r31)
/* 8019EA4C 0019BA4C  4B F3 67 59 */	bl psndSFXChk
/* 8019EA50 0019BA50  2C 03 FF FF */	cmpwi r3, -1
/* 8019EA54 0019BA54  41 82 00 50 */	beq .L_8019EAA4
/* 8019EA58 0019BA58  6F 83 80 00 */	xoris r3, r28, 0x8000
/* 8019EA5C 0019BA5C  3C 00 43 30 */	lis r0, 0x4330
/* 8019EA60 0019BA60  90 61 00 24 */	stw r3, 0x24(r1)
/* 8019EA64 0019BA64  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019EA68 0019BA68  C8 44 9A 00 */	lfd f2, lbl_802F9A00@l(r4)
/* 8019EA6C 0019BA6C  90 01 00 20 */	stw r0, 0x20(r1)
/* 8019EA70 0019BA70  C0 62 D2 C4 */	lfs f3, lbl_8041E644@sda21(r2)
/* 8019EA74 0019BA74  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 8019EA78 0019BA78  C0 02 D2 CC */	lfs f0, lbl_8041E64C@sda21(r2)
/* 8019EA7C 0019BA7C  EC 21 10 28 */	fsubs f1, f1, f2
/* 8019EA80 0019BA80  C0 42 D3 54 */	lfs f2, lbl_8041E6D4@sda21(r2)
/* 8019EA84 0019BA84  80 7F 00 08 */	lwz r3, 8(r31)
/* 8019EA88 0019BA88  EC 23 00 72 */	fmuls f1, f3, f1
/* 8019EA8C 0019BA8C  EC 01 00 24 */	fdivs f0, f1, f0
/* 8019EA90 0019BA90  EC 02 00 2A */	fadds f0, f2, f0
/* 8019EA94 0019BA94  FC 00 00 1E */	fctiwz f0, f0
/* 8019EA98 0019BA98  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 8019EA9C 0019BA9C  80 81 00 2C */	lwz r4, 0x2c(r1)
/* 8019EAA0 0019BAA0  4B F3 69 35 */	bl psndSFX_vol
.L_8019EAA4:
/* 8019EAA4 0019BAA4  3C 7F 00 01 */	addis r3, r31, 1
/* 8019EAA8 0019BAA8  80 03 37 C4 */	lwz r0, 0x37c4(r3)
/* 8019EAAC 0019BAAC  2C 00 00 00 */	cmpwi r0, 0
/* 8019EAB0 0019BAB0  40 81 00 4C */	ble .L_8019EAFC
/* 8019EAB4 0019BAB4  4B FF FC F5 */	bl BattleAudienceApSrcEntry
/* 8019EAB8 0019BAB8  2C 03 00 01 */	cmpwi r3, 1
/* 8019EABC 0019BABC  40 82 00 14 */	bne .L_8019EAD0
/* 8019EAC0 0019BAC0  3C 9F 00 01 */	addis r4, r31, 1
/* 8019EAC4 0019BAC4  80 64 37 C4 */	lwz r3, 0x37c4(r4)
/* 8019EAC8 0019BAC8  38 03 FF FF */	addi r0, r3, -1
/* 8019EACC 0019BACC  90 04 37 C4 */	stw r0, 0x37c4(r4)
.L_8019EAD0:
/* 8019EAD0 0019BAD0  2C 1C 00 00 */	cmpwi r28, 0
/* 8019EAD4 0019BAD4  40 82 00 8C */	bne .L_8019EB60
/* 8019EAD8 0019BAD8  80 7F 00 08 */	lwz r3, 8(r31)
/* 8019EADC 0019BADC  4B F3 66 C9 */	bl psndSFXChk
/* 8019EAE0 0019BAE0  2C 03 FF FF */	cmpwi r3, -1
/* 8019EAE4 0019BAE4  40 82 00 7C */	bne .L_8019EB60
/* 8019EAE8 0019BAE8  3C 60 80 30 */	lis r3, lbl_802F9DBC@ha
/* 8019EAEC 0019BAEC  38 63 9D BC */	addi r3, r3, lbl_802F9DBC@l
/* 8019EAF0 0019BAF0  4B F3 69 D1 */	bl psndSFXOn
/* 8019EAF4 0019BAF4  90 7F 00 08 */	stw r3, 8(r31)
/* 8019EAF8 0019BAF8  48 00 00 68 */	b .L_8019EB60
.L_8019EAFC:
/* 8019EAFC 0019BAFC  38 00 00 64 */	li r0, 0x64
/* 8019EB00 0019BB00  38 A0 00 00 */	li r5, 0
/* 8019EB04 0019BB04  38 60 00 00 */	li r3, 0
/* 8019EB08 0019BB08  7C 09 03 A6 */	mtctr r0
.L_8019EB0C:
/* 8019EB0C 0019BB0C  3C 83 00 01 */	addis r4, r3, 1
/* 8019EB10 0019BB10  38 84 0E 7C */	addi r4, r4, 0xe7c
/* 8019EB14 0019BB14  7C 1F 20 2E */	lwzx r0, r31, r4
/* 8019EB18 0019BB18  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019EB1C 0019BB1C  40 82 00 10 */	bne .L_8019EB2C
/* 8019EB20 0019BB20  38 A5 00 01 */	addi r5, r5, 1
/* 8019EB24 0019BB24  38 63 00 60 */	addi r3, r3, 0x60
/* 8019EB28 0019BB28  42 00 FF E4 */	bdnz .L_8019EB0C
.L_8019EB2C:
/* 8019EB2C 0019BB2C  2C 05 00 64 */	cmpwi r5, 0x64
/* 8019EB30 0019BB30  40 82 00 30 */	bne .L_8019EB60
/* 8019EB34 0019BB34  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019EB38 0019BB38  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8019EB3C 0019BB3C  90 1F 00 00 */	stw r0, 0(r31)
/* 8019EB40 0019BB40  80 7F 00 08 */	lwz r3, 8(r31)
/* 8019EB44 0019BB44  4B F3 66 B9 */	bl psndSFXOff
/* 8019EB48 0019BB48  38 00 00 00 */	li r0, 0
/* 8019EB4C 0019BB4C  3C 7F 00 01 */	addis r3, r31, 1
/* 8019EB50 0019BB50  90 1F 00 08 */	stw r0, 8(r31)
/* 8019EB54 0019BB54  90 03 37 C4 */	stw r0, 0x37c4(r3)
/* 8019EB58 0019BB58  4B F5 3B D9 */	bl BattleStatusWindowAPRecoveryOff
/* 8019EB5C 0019BB5C  48 00 03 E8 */	b .L_8019EF44
.L_8019EB60:
/* 8019EB60 0019BB60  3B C0 00 00 */	li r30, 0
/* 8019EB64 0019BB64  3B 80 00 00 */	li r28, 0
.L_8019EB68:
/* 8019EB68 0019BB68  3F BC 00 01 */	addis r29, r28, 1
/* 8019EB6C 0019BB6C  3B BD 0E 7C */	addi r29, r29, 0xe7c
/* 8019EB70 0019BB70  7F BF EA 14 */	add r29, r31, r29
/* 8019EB74 0019BB74  4B F3 31 01 */	bl func_800D1C74
/* 8019EB78 0019BB78  80 1D 00 00 */	lwz r0, 0(r29)
/* 8019EB7C 0019BB7C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019EB80 0019BB80  41 82 03 B4 */	beq .L_8019EF34
/* 8019EB84 0019BB84  80 1D 00 04 */	lwz r0, 4(r29)
/* 8019EB88 0019BB88  28 00 00 14 */	cmplwi r0, 0x14
/* 8019EB8C 0019BB8C  41 81 03 A8 */	bgt .L_8019EF34
/* 8019EB90 0019BB90  3C 60 80 3A */	lis r3, lbl_80399D40@ha
/* 8019EB94 0019BB94  54 00 10 3A */	slwi r0, r0, 2
/* 8019EB98 0019BB98  38 63 9D 40 */	addi r3, r3, lbl_80399D40@l
/* 8019EB9C 0019BB9C  7C 03 00 2E */	lwzx r0, r3, r0
/* 8019EBA0 0019BBA0  7C 09 03 A6 */	mtctr r0
/* 8019EBA4 0019BBA4  4E 80 04 20 */	bctr 
/* 8019EBA8 0019BBA8  38 00 00 05 */	li r0, 5
/* 8019EBAC 0019BBAC  90 1D 00 04 */	stw r0, 4(r29)
/* 8019EBB0 0019BBB0  80 7D 00 08 */	lwz r3, 8(r29)
/* 8019EBB4 0019BBB4  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8019EBB8 0019BBB8  90 7D 00 2C */	stw r3, 0x2c(r29)
/* 8019EBBC 0019BBBC  90 1D 00 30 */	stw r0, 0x30(r29)
/* 8019EBC0 0019BBC0  80 1D 00 10 */	lwz r0, 0x10(r29)
/* 8019EBC4 0019BBC4  90 1D 00 34 */	stw r0, 0x34(r29)
/* 8019EBC8 0019BBC8  80 7D 00 2C */	lwz r3, 0x2c(r29)
/* 8019EBCC 0019BBCC  80 1D 00 30 */	lwz r0, 0x30(r29)
/* 8019EBD0 0019BBD0  90 7D 00 20 */	stw r3, 0x20(r29)
/* 8019EBD4 0019BBD4  90 1D 00 24 */	stw r0, 0x24(r29)
/* 8019EBD8 0019BBD8  80 1D 00 34 */	lwz r0, 0x34(r29)
/* 8019EBDC 0019BBDC  90 1D 00 28 */	stw r0, 0x28(r29)
/* 8019EBE0 0019BBE0  48 0C 77 95 */	bl rand
/* 8019EBE4 0019BBE4  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019EBE8 0019BBE8  3C 00 43 30 */	lis r0, 0x4330
/* 8019EBEC 0019BBEC  90 61 00 2C */	stw r3, 0x2c(r1)
/* 8019EBF0 0019BBF0  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019EBF4 0019BBF4  C8 44 9A 00 */	lfd f2, lbl_802F9A00@l(r4)
/* 8019EBF8 0019BBF8  38 60 00 00 */	li r3, 0
/* 8019EBFC 0019BBFC  90 01 00 28 */	stw r0, 0x28(r1)
/* 8019EC00 0019BC00  38 00 00 1E */	li r0, 0x1e
/* 8019EC04 0019BC04  C0 62 D3 58 */	lfs f3, lbl_8041E6D8@sda21(r2)
/* 8019EC08 0019BC08  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 8019EC0C 0019BC0C  C0 22 D2 F4 */	lfs f1, lbl_8041E674@sda21(r2)
/* 8019EC10 0019BC10  EC 80 10 28 */	fsubs f4, f0, f2
/* 8019EC14 0019BC14  C0 42 D3 5C */	lfs f2, lbl_8041E6DC@sda21(r2)
/* 8019EC18 0019BC18  C0 1D 00 2C */	lfs f0, 0x2c(r29)
/* 8019EC1C 0019BC1C  EC 63 01 32 */	fmuls f3, f3, f4
/* 8019EC20 0019BC20  EC 23 08 24 */	fdivs f1, f3, f1
/* 8019EC24 0019BC24  EC 21 10 28 */	fsubs f1, f1, f2
/* 8019EC28 0019BC28  EC 00 08 2A */	fadds f0, f0, f1
/* 8019EC2C 0019BC2C  D0 1D 00 2C */	stfs f0, 0x2c(r29)
/* 8019EC30 0019BC30  C0 1D 00 30 */	lfs f0, 0x30(r29)
/* 8019EC34 0019BC34  EC 00 10 2A */	fadds f0, f0, f2
/* 8019EC38 0019BC38  D0 1D 00 30 */	stfs f0, 0x30(r29)
/* 8019EC3C 0019BC3C  90 7D 00 44 */	stw r3, 0x44(r29)
/* 8019EC40 0019BC40  90 1D 00 48 */	stw r0, 0x48(r29)
/* 8019EC44 0019BC44  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EC48 0019BC48  38 60 00 05 */	li r3, 5
/* 8019EC4C 0019BC4C  38 04 00 01 */	addi r0, r4, 1
/* 8019EC50 0019BC50  90 1D 00 44 */	stw r0, 0x44(r29)
/* 8019EC54 0019BC54  C0 3D 00 20 */	lfs f1, 0x20(r29)
/* 8019EC58 0019BC58  C0 5D 00 2C */	lfs f2, 0x2c(r29)
/* 8019EC5C 0019BC5C  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EC60 0019BC60  80 BD 00 48 */	lwz r5, 0x48(r29)
/* 8019EC64 0019BC64  4B E6 7F A9 */	bl intplGetValue
/* 8019EC68 0019BC68  D0 3D 00 08 */	stfs f1, 8(r29)
/* 8019EC6C 0019BC6C  38 60 00 05 */	li r3, 5
/* 8019EC70 0019BC70  C0 3D 00 24 */	lfs f1, 0x24(r29)
/* 8019EC74 0019BC74  C0 5D 00 30 */	lfs f2, 0x30(r29)
/* 8019EC78 0019BC78  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EC7C 0019BC7C  80 BD 00 48 */	lwz r5, 0x48(r29)
/* 8019EC80 0019BC80  4B E6 7F 8D */	bl intplGetValue
/* 8019EC84 0019BC84  D0 3D 00 0C */	stfs f1, 0xc(r29)
/* 8019EC88 0019BC88  80 7D 00 48 */	lwz r3, 0x48(r29)
/* 8019EC8C 0019BC8C  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EC90 0019BC90  38 03 FF EC */	addi r0, r3, -20
/* 8019EC94 0019BC94  7C 04 00 00 */	cmpw r4, r0
/* 8019EC98 0019BC98  41 80 00 20 */	blt .L_8019ECB8
/* 8019EC9C 0019BC9C  C0 22 D3 60 */	lfs f1, lbl_8041E6E0@sda21(r2)
/* 8019ECA0 0019BCA0  7C 80 20 50 */	subf r4, r0, r4
/* 8019ECA4 0019BCA4  C0 42 D3 1C */	lfs f2, lbl_8041E69C@sda21(r2)
/* 8019ECA8 0019BCA8  38 60 00 04 */	li r3, 4
/* 8019ECAC 0019BCAC  38 A0 00 0A */	li r5, 0xa
/* 8019ECB0 0019BCB0  4B E6 7F 5D */	bl intplGetValue
/* 8019ECB4 0019BCB4  D0 3D 00 3C */	stfs f1, 0x3c(r29)
.L_8019ECB8:
/* 8019ECB8 0019BCB8  80 7D 00 44 */	lwz r3, 0x44(r29)
/* 8019ECBC 0019BCBC  80 1D 00 48 */	lwz r0, 0x48(r29)
/* 8019ECC0 0019BCC0  7C 03 00 00 */	cmpw r3, r0
/* 8019ECC4 0019BCC4  41 80 02 70 */	blt .L_8019EF34
/* 8019ECC8 0019BCC8  38 60 00 0A */	li r3, 0xa
/* 8019ECCC 0019BCCC  38 00 00 00 */	li r0, 0
/* 8019ECD0 0019BCD0  90 7D 00 04 */	stw r3, 4(r29)
/* 8019ECD4 0019BCD4  38 60 00 0A */	li r3, 0xa
/* 8019ECD8 0019BCD8  90 1D 00 44 */	stw r0, 0x44(r29)
/* 8019ECDC 0019BCDC  4B E6 71 E9 */	bl irand
/* 8019ECE0 0019BCE0  38 03 00 0F */	addi r0, r3, 0xf
/* 8019ECE4 0019BCE4  3C 60 80 30 */	lis r3, lbl_802F9744@ha
/* 8019ECE8 0019BCE8  90 1D 00 48 */	stw r0, 0x48(r29)
/* 8019ECEC 0019BCEC  38 83 97 44 */	addi r4, r3, lbl_802F9744@l
/* 8019ECF0 0019BCF0  80 64 00 00 */	lwz r3, 0(r4)
/* 8019ECF4 0019BCF4  80 04 00 04 */	lwz r0, 4(r4)
/* 8019ECF8 0019BCF8  90 7D 00 38 */	stw r3, 0x38(r29)
/* 8019ECFC 0019BCFC  90 1D 00 3C */	stw r0, 0x3c(r29)
/* 8019ED00 0019BD00  80 04 00 08 */	lwz r0, 8(r4)
/* 8019ED04 0019BD04  90 1D 00 40 */	stw r0, 0x40(r29)
/* 8019ED08 0019BD08  48 00 02 2C */	b .L_8019EF34
/* 8019ED0C 0019BD0C  80 7D 00 44 */	lwz r3, 0x44(r29)
/* 8019ED10 0019BD10  38 03 00 01 */	addi r0, r3, 1
/* 8019ED14 0019BD14  90 1D 00 44 */	stw r0, 0x44(r29)
/* 8019ED18 0019BD18  80 7D 00 44 */	lwz r3, 0x44(r29)
/* 8019ED1C 0019BD1C  80 1D 00 48 */	lwz r0, 0x48(r29)
/* 8019ED20 0019BD20  7C 03 00 00 */	cmpw r3, r0
/* 8019ED24 0019BD24  41 80 02 10 */	blt .L_8019EF34
/* 8019ED28 0019BD28  38 60 00 0F */	li r3, 0xf
/* 8019ED2C 0019BD2C  38 00 00 00 */	li r0, 0
/* 8019ED30 0019BD30  90 7D 00 04 */	stw r3, 4(r29)
/* 8019ED34 0019BD34  38 60 00 14 */	li r3, 0x14
/* 8019ED38 0019BD38  90 1D 00 44 */	stw r0, 0x44(r29)
/* 8019ED3C 0019BD3C  4B E6 71 89 */	bl irand
/* 8019ED40 0019BD40  38 03 00 14 */	addi r0, r3, 0x14
/* 8019ED44 0019BD44  38 61 00 14 */	addi r3, r1, 0x14
/* 8019ED48 0019BD48  90 1D 00 48 */	stw r0, 0x48(r29)
/* 8019ED4C 0019BD4C  80 9D 00 08 */	lwz r4, 8(r29)
/* 8019ED50 0019BD50  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8019ED54 0019BD54  90 9D 00 20 */	stw r4, 0x20(r29)
/* 8019ED58 0019BD58  90 1D 00 24 */	stw r0, 0x24(r29)
/* 8019ED5C 0019BD5C  80 1D 00 10 */	lwz r0, 0x10(r29)
/* 8019ED60 0019BD60  90 1D 00 28 */	stw r0, 0x28(r29)
/* 8019ED64 0019BD64  4B F9 7D C1 */	bl statusGetApPos
/* 8019ED68 0019BD68  80 61 00 14 */	lwz r3, 0x14(r1)
/* 8019ED6C 0019BD6C  80 01 00 18 */	lwz r0, 0x18(r1)
/* 8019ED70 0019BD70  90 7D 00 2C */	stw r3, 0x2c(r29)
/* 8019ED74 0019BD74  90 1D 00 30 */	stw r0, 0x30(r29)
/* 8019ED78 0019BD78  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8019ED7C 0019BD7C  90 1D 00 34 */	stw r0, 0x34(r29)
/* 8019ED80 0019BD80  C0 3D 00 24 */	lfs f1, 0x24(r29)
/* 8019ED84 0019BD84  C0 1D 00 30 */	lfs f0, 0x30(r29)
/* 8019ED88 0019BD88  C0 5D 00 20 */	lfs f2, 0x20(r29)
/* 8019ED8C 0019BD8C  EF E1 00 28 */	fsubs f31, f1, f0
/* 8019ED90 0019BD90  C0 1D 00 2C */	lfs f0, 0x2c(r29)
/* 8019ED94 0019BD94  EC 22 00 28 */	fsubs f1, f2, f0
/* 8019ED98 0019BD98  EC 1F 07 F2 */	fmuls f0, f31, f31
/* 8019ED9C 0019BD9C  EC 21 00 7A */	fmadds f1, f1, f1, f0
/* 8019EDA0 0019BDA0  48 0C DB 19 */	bl func_8026C8B8
/* 8019EDA4 0019BDA4  FC 00 08 18 */	frsp f0, f1
/* 8019EDA8 0019BDA8  D0 1D 00 50 */	stfs f0, 0x50(r29)
/* 8019EDAC 0019BDAC  D0 1D 00 4C */	stfs f0, 0x4c(r29)
/* 8019EDB0 0019BDB0  C0 1D 00 4C */	lfs f0, 0x4c(r29)
/* 8019EDB4 0019BDB4  EC 3F 00 24 */	fdivs f1, f31, f0
/* 8019EDB8 0019BDB8  48 0C D7 B1 */	bl func_8026C568
/* 8019EDBC 0019BDBC  FC 00 08 18 */	frsp f0, f1
/* 8019EDC0 0019BDC0  D0 1D 00 54 */	stfs f0, 0x54(r29)
/* 8019EDC4 0019BDC4  48 0C 75 B1 */	bl rand
/* 8019EDC8 0019BDC8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8019EDCC 0019BDCC  3C 00 43 30 */	lis r0, 0x4330
/* 8019EDD0 0019BDD0  90 61 00 2C */	stw r3, 0x2c(r1)
/* 8019EDD4 0019BDD4  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 8019EDD8 0019BDD8  C8 64 9A 00 */	lfd f3, lbl_802F9A00@l(r4)
/* 8019EDDC 0019BDDC  90 01 00 28 */	stw r0, 0x28(r1)
/* 8019EDE0 0019BDE0  C0 42 D2 FC */	lfs f2, lbl_8041E67C@sda21(r2)
/* 8019EDE4 0019BDE4  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 8019EDE8 0019BDE8  C0 22 D2 F4 */	lfs f1, lbl_8041E674@sda21(r2)
/* 8019EDEC 0019BDEC  EC 60 18 28 */	fsubs f3, f0, f3
/* 8019EDF0 0019BDF0  C0 02 D3 64 */	lfs f0, lbl_8041E6E4@sda21(r2)
/* 8019EDF4 0019BDF4  EC 42 00 F2 */	fmuls f2, f2, f3
/* 8019EDF8 0019BDF8  EC 22 08 24 */	fdivs f1, f2, f1
/* 8019EDFC 0019BDFC  EC 00 08 2A */	fadds f0, f0, f1
/* 8019EE00 0019BE00  D0 1D 00 58 */	stfs f0, 0x58(r29)
/* 8019EE04 0019BE04  48 00 01 30 */	b .L_8019EF34
/* 8019EE08 0019BE08  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EE0C 0019BE0C  38 60 00 04 */	li r3, 4
/* 8019EE10 0019BE10  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 8019EE14 0019BE14  38 04 00 01 */	addi r0, r4, 1
/* 8019EE18 0019BE18  90 1D 00 44 */	stw r0, 0x44(r29)
/* 8019EE1C 0019BE1C  C0 3D 00 50 */	lfs f1, 0x50(r29)
/* 8019EE20 0019BE20  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EE24 0019BE24  80 BD 00 48 */	lwz r5, 0x48(r29)
/* 8019EE28 0019BE28  4B E6 7D E5 */	bl intplGetValue
/* 8019EE2C 0019BE2C  D0 3D 00 4C */	stfs f1, 0x4c(r29)
/* 8019EE30 0019BE30  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019EE34 0019BE34  C0 5D 00 54 */	lfs f2, 0x54(r29)
/* 8019EE38 0019BE38  C0 3D 00 58 */	lfs f1, 0x58(r29)
/* 8019EE3C 0019BE3C  EC 22 08 2A */	fadds f1, f2, f1
/* 8019EE40 0019BE40  D0 3D 00 54 */	stfs f1, 0x54(r29)
/* 8019EE44 0019BE44  C0 3D 00 54 */	lfs f1, 0x54(r29)
/* 8019EE48 0019BE48  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019EE4C 0019BE4C  40 80 00 10 */	bge .L_8019EE5C
/* 8019EE50 0019BE50  C0 02 D3 68 */	lfs f0, lbl_8041E6E8@sda21(r2)
/* 8019EE54 0019BE54  EC 01 00 2A */	fadds f0, f1, f0
/* 8019EE58 0019BE58  D0 1D 00 54 */	stfs f0, 0x54(r29)
.L_8019EE5C:
/* 8019EE5C 0019BE5C  C0 3D 00 54 */	lfs f1, 0x54(r29)
/* 8019EE60 0019BE60  48 0C D0 31 */	bl cos
/* 8019EE64 0019BE64  FC 40 08 18 */	frsp f2, f1
/* 8019EE68 0019BE68  C0 3D 00 4C */	lfs f1, 0x4c(r29)
/* 8019EE6C 0019BE6C  C0 1D 00 2C */	lfs f0, 0x2c(r29)
/* 8019EE70 0019BE70  EC 01 00 BA */	fmadds f0, f1, f2, f0
/* 8019EE74 0019BE74  D0 1D 00 08 */	stfs f0, 8(r29)
/* 8019EE78 0019BE78  C0 3D 00 54 */	lfs f1, 0x54(r29)
/* 8019EE7C 0019BE7C  48 0C D5 7D */	bl sin
/* 8019EE80 0019BE80  FC 40 08 18 */	frsp f2, f1
/* 8019EE84 0019BE84  C0 3D 00 4C */	lfs f1, 0x4c(r29)
/* 8019EE88 0019BE88  C0 1D 00 30 */	lfs f0, 0x30(r29)
/* 8019EE8C 0019BE8C  EC 01 00 BA */	fmadds f0, f1, f2, f0
/* 8019EE90 0019BE90  D0 1D 00 0C */	stfs f0, 0xc(r29)
/* 8019EE94 0019BE94  80 7D 00 44 */	lwz r3, 0x44(r29)
/* 8019EE98 0019BE98  80 1D 00 48 */	lwz r0, 0x48(r29)
/* 8019EE9C 0019BE9C  7C 03 00 00 */	cmpw r3, r0
/* 8019EEA0 0019BEA0  41 80 00 94 */	blt .L_8019EF34
/* 8019EEA4 0019BEA4  38 00 00 14 */	li r0, 0x14
/* 8019EEA8 0019BEA8  38 80 00 00 */	li r4, 0
/* 8019EEAC 0019BEAC  90 1D 00 04 */	stw r0, 4(r29)
/* 8019EEB0 0019BEB0  38 00 00 0F */	li r0, 0xf
/* 8019EEB4 0019BEB4  38 61 00 08 */	addi r3, r1, 8
/* 8019EEB8 0019BEB8  90 9D 00 44 */	stw r4, 0x44(r29)
/* 8019EEBC 0019BEBC  90 1D 00 48 */	stw r0, 0x48(r29)
/* 8019EEC0 0019BEC0  4B F9 7C 65 */	bl statusGetApPos
/* 8019EEC4 0019BEC4  80 61 00 08 */	lwz r3, 8(r1)
/* 8019EEC8 0019BEC8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8019EECC 0019BECC  90 7D 00 08 */	stw r3, 8(r29)
/* 8019EED0 0019BED0  90 1D 00 0C */	stw r0, 0xc(r29)
/* 8019EED4 0019BED4  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8019EED8 0019BED8  90 1D 00 10 */	stw r0, 0x10(r29)
/* 8019EEDC 0019BEDC  48 00 00 58 */	b .L_8019EF34
/* 8019EEE0 0019BEE0  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EEE4 0019BEE4  38 60 00 04 */	li r3, 4
/* 8019EEE8 0019BEE8  C0 22 D3 6C */	lfs f1, lbl_8041E6EC@sda21(r2)
/* 8019EEEC 0019BEEC  38 04 00 01 */	addi r0, r4, 1
/* 8019EEF0 0019BEF0  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 8019EEF4 0019BEF4  90 1D 00 44 */	stw r0, 0x44(r29)
/* 8019EEF8 0019BEF8  80 9D 00 44 */	lwz r4, 0x44(r29)
/* 8019EEFC 0019BEFC  80 BD 00 48 */	lwz r5, 0x48(r29)
/* 8019EF00 0019BF00  4B E6 7D 0D */	bl intplGetValue
/* 8019EF04 0019BF04  FC 00 08 1E */	fctiwz f0, f1
/* 8019EF08 0019BF08  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 8019EF0C 0019BF0C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8019EF10 0019BF10  98 1D 00 5C */	stb r0, 0x5c(r29)
/* 8019EF14 0019BF14  80 7D 00 44 */	lwz r3, 0x44(r29)
/* 8019EF18 0019BF18  80 1D 00 48 */	lwz r0, 0x48(r29)
/* 8019EF1C 0019BF1C  7C 03 00 00 */	cmpw r3, r0
/* 8019EF20 0019BF20  41 80 00 14 */	blt .L_8019EF34
/* 8019EF24 0019BF24  38 00 00 00 */	li r0, 0
/* 8019EF28 0019BF28  38 60 00 01 */	li r3, 1
/* 8019EF2C 0019BF2C  90 1D 00 00 */	stw r0, 0(r29)
/* 8019EF30 0019BF30  4B F3 0B 85 */	bl pouchAddAP
.L_8019EF34:
/* 8019EF34 0019BF34  3B DE 00 01 */	addi r30, r30, 1
/* 8019EF38 0019BF38  3B 9C 00 60 */	addi r28, r28, 0x60
/* 8019EF3C 0019BF3C  2C 1E 00 64 */	cmpwi r30, 0x64
/* 8019EF40 0019BF40  41 80 FC 28 */	blt .L_8019EB68
.L_8019EF44:
/* 8019EF44 0019BF44  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8019EF48 0019BF48  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8019EF4C 0019BF4C  BB 81 00 30 */	lmw r28, 0x30(r1)
/* 8019EF50 0019BF50  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8019EF54 0019BF54  7C 08 03 A6 */	mtlr r0
/* 8019EF58 0019BF58  38 21 00 50 */	addi r1, r1, 0x50
/* 8019EF5C 0019BF5C  4E 80 00 20 */	blr 

.global BattleAudienceItemCtrlProcess
BattleAudienceItemCtrlProcess:
/* 8019EF60 0019BF60  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 8019EF64 0019BF64  7C 08 02 A6 */	mflr r0
/* 8019EF68 0019BF68  3C 60 80 3A */	lis r3, lbl_80399940@ha
/* 8019EF6C 0019BF6C  90 01 00 64 */	stw r0, 0x64(r1)
/* 8019EF70 0019BF70  BE C1 00 38 */	stmw r22, 0x38(r1)
/* 8019EF74 0019BF74  3B A3 99 40 */	addi r29, r3, lbl_80399940@l
/* 8019EF78 0019BF78  83 2D 17 10 */	lwz r25, lbl_80418970@sda21(r13)
/* 8019EF7C 0019BF7C  48 00 37 59 */	bl BattleAudienceBaseGetPtr
/* 8019EF80 0019BF80  7C 7E 1B 78 */	mr r30, r3
/* 8019EF84 0019BF84  3B 40 00 00 */	li r26, 0
/* 8019EF88 0019BF88  38 60 00 00 */	li r3, 0
/* 8019EF8C 0019BF8C  48 00 36 CD */	bl BattleAudienceItemGetPtr
/* 8019EF90 0019BF90  3B 81 00 2C */	addi r28, r1, 0x2c
/* 8019EF94 0019BF94  7C 78 1B 78 */	mr r24, r3
/* 8019EF98 0019BF98  3B 61 00 28 */	addi r27, r1, 0x28
.L_8019EF9C:
/* 8019EF9C 0019BF9C  80 18 00 00 */	lwz r0, 0(r24)
/* 8019EFA0 0019BFA0  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019EFA4 0019BFA4  41 82 08 F0 */	beq .L_8019F894
/* 8019EFA8 0019BFA8  80 78 00 0C */	lwz r3, 0xc(r24)
/* 8019EFAC 0019BFAC  48 00 36 ED */	bl BattleAudienceGetPtr
/* 8019EFB0 0019BFB0  7C 7F 1B 78 */	mr r31, r3
/* 8019EFB4 0019BFB4  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019EFB8 0019BFB8  88 9F 00 19 */	lbz r4, 0x19(r31)
/* 8019EFBC 0019BFBC  38 03 19 24 */	addi r0, r3, lbl_803B1924@l
/* 8019EFC0 0019BFC0  88 7F 00 1B */	lbz r3, 0x1b(r31)
/* 8019EFC4 0019BFC4  28 04 00 0D */	cmplwi r4, 0xd
/* 8019EFC8 0019BFC8  54 63 28 34 */	slwi r3, r3, 5
/* 8019EFCC 0019BFCC  7E E0 1A 14 */	add r23, r0, r3
/* 8019EFD0 0019BFD0  41 82 08 9C */	beq .L_8019F86C
/* 8019EFD4 0019BFD4  28 04 00 13 */	cmplwi r4, 0x13
/* 8019EFD8 0019BFD8  41 82 08 94 */	beq .L_8019F86C
/* 8019EFDC 0019BFDC  28 04 00 15 */	cmplwi r4, 0x15
/* 8019EFE0 0019BFE0  41 82 08 8C */	beq .L_8019F86C
/* 8019EFE4 0019BFE4  28 04 00 0C */	cmplwi r4, 0xc
/* 8019EFE8 0019BFE8  41 82 08 84 */	beq .L_8019F86C
/* 8019EFEC 0019BFEC  80 78 00 0C */	lwz r3, 0xc(r24)
/* 8019EFF0 0019BFF0  4B FF DA 25 */	bl BattleAudience_GetExist
/* 8019EFF4 0019BFF4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019EFF8 0019BFF8  41 82 08 74 */	beq .L_8019F86C
/* 8019EFFC 0019BFFC  80 18 00 04 */	lwz r0, 4(r24)
/* 8019F000 0019C000  28 00 00 07 */	cmplwi r0, 7
/* 8019F004 0019C004  41 81 08 90 */	bgt .L_8019F894
/* 8019F008 0019C008  3C 60 80 3A */	lis r3, lbl_80399D94@ha
/* 8019F00C 0019C00C  54 00 10 3A */	slwi r0, r0, 2
/* 8019F010 0019C010  38 63 9D 94 */	addi r3, r3, lbl_80399D94@l
/* 8019F014 0019C014  7C 03 00 2E */	lwzx r0, r3, r0
/* 8019F018 0019C018  7C 09 03 A6 */	mtctr r0
/* 8019F01C 0019C01C  4E 80 04 20 */	bctr 
/* 8019F020 0019C020  80 18 00 00 */	lwz r0, 0(r24)
/* 8019F024 0019C024  60 00 00 02 */	ori r0, r0, 2
/* 8019F028 0019C028  90 18 00 00 */	stw r0, 0(r24)
/* 8019F02C 0019C02C  80 18 00 10 */	lwz r0, 0x10(r24)
/* 8019F030 0019C030  2C 00 00 00 */	cmpwi r0, 0
/* 8019F034 0019C034  40 82 00 84 */	bne .L_8019F0B8
/* 8019F038 0019C038  82 D7 00 08 */	lwz r22, 8(r23)
/* 8019F03C 0019C03C  38 C0 00 00 */	li r6, 0
/* 8019F040 0019C040  38 80 00 00 */	li r4, 0
/* 8019F044 0019C044  38 60 00 00 */	li r3, 0
.L_8019F048:
/* 8019F048 0019C048  7C B6 22 14 */	add r5, r22, r4
/* 8019F04C 0019C04C  80 05 00 00 */	lwz r0, 0(r5)
/* 8019F050 0019C050  2C 00 00 00 */	cmpwi r0, 0
/* 8019F054 0019C054  41 82 00 18 */	beq .L_8019F06C
/* 8019F058 0019C058  80 05 00 04 */	lwz r0, 4(r5)
/* 8019F05C 0019C05C  38 C6 00 01 */	addi r6, r6, 1
/* 8019F060 0019C060  38 84 00 08 */	addi r4, r4, 8
/* 8019F064 0019C064  7C 63 02 14 */	add r3, r3, r0
/* 8019F068 0019C068  4B FF FF E0 */	b .L_8019F048
.L_8019F06C:
/* 8019F06C 0019C06C  2C 06 00 00 */	cmpwi r6, 0
/* 8019F070 0019C070  41 82 07 D0 */	beq .L_8019F840
/* 8019F074 0019C074  4B E6 6E 51 */	bl irand
/* 8019F078 0019C078  38 80 00 00 */	li r4, 0
/* 8019F07C 0019C07C  38 C0 00 00 */	li r6, 0
.L_8019F080:
/* 8019F080 0019C080  7C 03 30 00 */	cmpw r3, r6
/* 8019F084 0019C084  41 80 00 18 */	blt .L_8019F09C
/* 8019F088 0019C088  7C B6 22 14 */	add r5, r22, r4
/* 8019F08C 0019C08C  80 05 00 04 */	lwz r0, 4(r5)
/* 8019F090 0019C090  7C 06 02 14 */	add r0, r6, r0
/* 8019F094 0019C094  7C 03 00 00 */	cmpw r3, r0
/* 8019F098 0019C098  41 80 00 18 */	blt .L_8019F0B0
.L_8019F09C:
/* 8019F09C 0019C09C  38 04 00 04 */	addi r0, r4, 4
/* 8019F0A0 0019C0A0  38 84 00 08 */	addi r4, r4, 8
/* 8019F0A4 0019C0A4  7C 16 00 2E */	lwzx r0, r22, r0
/* 8019F0A8 0019C0A8  7C C6 02 14 */	add r6, r6, r0
/* 8019F0AC 0019C0AC  4B FF FF D4 */	b .L_8019F080
.L_8019F0B0:
/* 8019F0B0 0019C0B0  80 05 00 00 */	lwz r0, 0(r5)
/* 8019F0B4 0019C0B4  90 18 00 10 */	stw r0, 0x10(r24)
.L_8019F0B8:
/* 8019F0B8 0019C0B8  38 1A 00 B4 */	addi r0, r26, 0xb4
/* 8019F0BC 0019C0BC  3C 60 80 30 */	lis r3, lbl_802F972C@ha
/* 8019F0C0 0019C0C0  90 18 00 08 */	stw r0, 8(r24)
/* 8019F0C4 0019C0C4  38 A3 97 2C */	addi r5, r3, lbl_802F972C@l
/* 8019F0C8 0019C0C8  C0 82 D2 A0 */	lfs f4, lbl_8041E620@sda21(r2)
/* 8019F0CC 0019C0CC  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019F0D0 0019C0D0  D0 98 00 20 */	stfs f4, 0x20(r24)
/* 8019F0D4 0019C0D4  C0 22 D3 14 */	lfs f1, lbl_8041E694@sda21(r2)
/* 8019F0D8 0019C0D8  D0 18 00 24 */	stfs f0, 0x24(r24)
/* 8019F0DC 0019C0DC  C0 5F 00 4C */	lfs f2, 0x4c(r31)
/* 8019F0E0 0019C0E0  C0 17 00 10 */	lfs f0, 0x10(r23)
/* 8019F0E4 0019C0E4  80 85 00 00 */	lwz r4, 0(r5)
/* 8019F0E8 0019C0E8  EC 42 00 2A */	fadds f2, f2, f0
/* 8019F0EC 0019C0EC  80 65 00 04 */	lwz r3, 4(r5)
/* 8019F0F0 0019C0F0  C0 1F 00 50 */	lfs f0, 0x50(r31)
/* 8019F0F4 0019C0F4  80 05 00 08 */	lwz r0, 8(r5)
/* 8019F0F8 0019C0F8  C0 7F 00 48 */	lfs f3, 0x48(r31)
/* 8019F0FC 0019C0FC  EC 22 08 28 */	fsubs f1, f2, f1
/* 8019F100 0019C100  C0 57 00 0C */	lfs f2, 0xc(r23)
/* 8019F104 0019C104  EC 04 00 2A */	fadds f0, f4, f0
/* 8019F108 0019C108  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8019F10C 0019C10C  EC 43 10 2A */	fadds f2, f3, f2
/* 8019F110 0019C110  90 81 00 18 */	stw r4, 0x18(r1)
/* 8019F114 0019C114  D0 41 00 18 */	stfs f2, 0x18(r1)
/* 8019F118 0019C118  90 01 00 20 */	stw r0, 0x20(r1)
/* 8019F11C 0019C11C  80 01 00 18 */	lwz r0, 0x18(r1)
/* 8019F120 0019C120  D0 21 00 1C */	stfs f1, 0x1c(r1)
/* 8019F124 0019C124  D0 01 00 20 */	stfs f0, 0x20(r1)
/* 8019F128 0019C128  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 8019F12C 0019C12C  90 18 00 14 */	stw r0, 0x14(r24)
/* 8019F130 0019C130  80 01 00 20 */	lwz r0, 0x20(r1)
/* 8019F134 0019C134  90 78 00 18 */	stw r3, 0x18(r24)
/* 8019F138 0019C138  90 18 00 1C */	stw r0, 0x1c(r24)
/* 8019F13C 0019C13C  80 78 00 04 */	lwz r3, 4(r24)
/* 8019F140 0019C140  38 03 00 01 */	addi r0, r3, 1
/* 8019F144 0019C144  90 18 00 04 */	stw r0, 4(r24)
/* 8019F148 0019C148  80 18 00 08 */	lwz r0, 8(r24)
/* 8019F14C 0019C14C  2C 00 00 00 */	cmpwi r0, 0
/* 8019F150 0019C150  41 81 01 38 */	bgt .L_8019F288
/* 8019F154 0019C154  3A C0 00 00 */	li r22, 0
.L_8019F158:
/* 8019F158 0019C158  7C 16 D0 00 */	cmpw r22, r26
/* 8019F15C 0019C15C  41 82 00 38 */	beq .L_8019F194
/* 8019F160 0019C160  7E C3 B3 78 */	mr r3, r22
/* 8019F164 0019C164  48 00 34 F5 */	bl BattleAudienceItemGetPtr
/* 8019F168 0019C168  80 03 00 00 */	lwz r0, 0(r3)
/* 8019F16C 0019C16C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8019F170 0019C170  41 82 00 24 */	beq .L_8019F194
/* 8019F174 0019C174  7E C3 B3 78 */	mr r3, r22
/* 8019F178 0019C178  48 00 34 E1 */	bl BattleAudienceItemGetPtr
/* 8019F17C 0019C17C  80 03 00 04 */	lwz r0, 4(r3)
/* 8019F180 0019C180  2C 00 00 01 */	cmpwi r0, 1
/* 8019F184 0019C184  40 82 00 10 */	bne .L_8019F194
/* 8019F188 0019C188  38 00 00 02 */	li r0, 2
/* 8019F18C 0019C18C  90 18 00 44 */	stw r0, 0x44(r24)
/* 8019F190 0019C190  48 00 00 10 */	b .L_8019F1A0
.L_8019F194:
/* 8019F194 0019C194  3A D6 00 01 */	addi r22, r22, 1
/* 8019F198 0019C198  2C 16 00 64 */	cmpwi r22, 0x64
/* 8019F19C 0019C19C  41 80 FF BC */	blt .L_8019F158
.L_8019F1A0:
/* 8019F1A0 0019C1A0  2C 16 00 64 */	cmpwi r22, 0x64
/* 8019F1A4 0019C1A4  40 82 00 0C */	bne .L_8019F1B0
/* 8019F1A8 0019C1A8  38 00 00 01 */	li r0, 1
/* 8019F1AC 0019C1AC  90 18 00 44 */	stw r0, 0x44(r24)
.L_8019F1B0:
/* 8019F1B0 0019C1B0  48 00 07 09 */	bl BattleAudienceDetectTargetPlayer
/* 8019F1B4 0019C1B4  7C 76 1B 79 */	or. r22, r3, r3
/* 8019F1B8 0019C1B8  41 82 06 88 */	beq .L_8019F840
/* 8019F1BC 0019C1BC  92 D8 00 40 */	stw r22, 0x40(r24)
/* 8019F1C0 0019C1C0  4B F8 45 F5 */	bl BtlUnit_GetBodyPartsId
/* 8019F1C4 0019C1C4  7C 64 1B 78 */	mr r4, r3
/* 8019F1C8 0019C1C8  7E C3 B3 78 */	mr r3, r22
/* 8019F1CC 0019C1CC  4B F8 46 29 */	bl BtlUnit_GetPartsPtr
/* 8019F1D0 0019C1D0  7C 60 1B 78 */	mr r0, r3
/* 8019F1D4 0019C1D4  7E C3 B3 78 */	mr r3, r22
/* 8019F1D8 0019C1D8  7C 04 03 78 */	mr r4, r0
/* 8019F1DC 0019C1DC  7F 66 DB 78 */	mr r6, r27
/* 8019F1E0 0019C1E0  7F 87 E3 78 */	mr r7, r28
/* 8019F1E4 0019C1E4  38 A1 00 24 */	addi r5, r1, 0x24
/* 8019F1E8 0019C1E8  4B F8 43 21 */	bl BtlUnit_GetHitPos
/* 8019F1EC 0019C1EC  C0 41 00 24 */	lfs f2, 0x24(r1)
/* 8019F1F0 0019C1F0  C0 38 00 14 */	lfs f1, 0x14(r24)
/* 8019F1F4 0019C1F4  C0 02 D3 74 */	lfs f0, lbl_8041E6F4@sda21(r2)
/* 8019F1F8 0019C1F8  EC 82 08 28 */	fsubs f4, f2, f1
/* 8019F1FC 0019C1FC  C0 62 D3 70 */	lfs f3, lbl_8041E6F0@sda21(r2)
/* 8019F200 0019C200  C0 C2 D2 98 */	lfs f6, lbl_8041E618@sda21(r2)
/* 8019F204 0019C204  C0 42 D3 78 */	lfs f2, lbl_8041E6F8@sda21(r2)
/* 8019F208 0019C208  FC 20 22 10 */	fabs f1, f4
/* 8019F20C 0019C20C  C0 A2 D2 E0 */	lfs f5, lbl_8041E660@sda21(r2)
/* 8019F210 0019C210  FC 20 08 18 */	frsp f1, f1
/* 8019F214 0019C214  EC 01 00 24 */	fdivs f0, f1, f0
/* 8019F218 0019C218  EC E3 00 2A */	fadds f7, f3, f0
/* 8019F21C 0019C21C  EC 04 38 24 */	fdivs f0, f4, f7
/* 8019F220 0019C220  D0 18 00 28 */	stfs f0, 0x28(r24)
/* 8019F224 0019C224  FC 00 38 1E */	fctiwz f0, f7
/* 8019F228 0019C228  EC 27 01 F2 */	fmuls f1, f7, f7
/* 8019F22C 0019C22C  D0 D8 00 34 */	stfs f6, 0x34(r24)
/* 8019F230 0019C230  D0 58 00 2C */	stfs f2, 0x2c(r24)
/* 8019F234 0019C234  C0 61 00 28 */	lfs f3, 0x28(r1)
/* 8019F238 0019C238  C0 58 00 18 */	lfs f2, 0x18(r24)
/* 8019F23C 0019C23C  C0 98 00 2C */	lfs f4, 0x2c(r24)
/* 8019F240 0019C240  EC 43 10 28 */	fsubs f2, f3, f2
/* 8019F244 0019C244  D8 01 00 30 */	stfd f0, 0x30(r1)
/* 8019F248 0019C248  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8019F24C 0019C24C  EC 04 11 FC */	fnmsubs f0, f4, f7, f2
/* 8019F250 0019C250  EC 05 00 32 */	fmuls f0, f5, f0
/* 8019F254 0019C254  EC 00 08 24 */	fdivs f0, f0, f1
/* 8019F258 0019C258  D0 18 00 38 */	stfs f0, 0x38(r24)
/* 8019F25C 0019C25C  C0 21 00 2C */	lfs f1, 0x2c(r1)
/* 8019F260 0019C260  C0 18 00 1C */	lfs f0, 0x1c(r24)
/* 8019F264 0019C264  EC 01 00 28 */	fsubs f0, f1, f0
/* 8019F268 0019C268  EC 00 38 24 */	fdivs f0, f0, f7
/* 8019F26C 0019C26C  D0 18 00 30 */	stfs f0, 0x30(r24)
/* 8019F270 0019C270  D0 D8 00 3C */	stfs f6, 0x3c(r24)
/* 8019F274 0019C274  90 18 00 08 */	stw r0, 8(r24)
/* 8019F278 0019C278  80 78 00 04 */	lwz r3, 4(r24)
/* 8019F27C 0019C27C  38 03 00 01 */	addi r0, r3, 1
/* 8019F280 0019C280  90 18 00 04 */	stw r0, 4(r24)
/* 8019F284 0019C284  48 00 06 10 */	b .L_8019F894
.L_8019F288:
/* 8019F288 0019C288  20 80 00 B4 */	subfic r4, r0, 0xb4
/* 8019F28C 0019C28C  2C 04 00 05 */	cmpwi r4, 5
/* 8019F290 0019C290  41 80 00 08 */	blt .L_8019F298
/* 8019F294 0019C294  38 80 00 05 */	li r4, 5
.L_8019F298:
/* 8019F298 0019C298  3C 60 80 30 */	lis r3, lbl_802F9738@ha
/* 8019F29C 0019C29C  C0 3F 00 C0 */	lfs f1, 0xc0(r31)
/* 8019F2A0 0019C2A0  38 A3 97 38 */	addi r5, r3, lbl_802F9738@l
/* 8019F2A4 0019C2A4  C0 17 00 0C */	lfs f0, 0xc(r23)
/* 8019F2A8 0019C2A8  80 05 00 00 */	lwz r0, 0(r5)
/* 8019F2AC 0019C2AC  38 60 00 00 */	li r3, 0
/* 8019F2B0 0019C2B0  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F2B4 0019C2B4  80 C5 00 04 */	lwz r6, 4(r5)
/* 8019F2B8 0019C2B8  90 01 00 0C */	stw r0, 0xc(r1)
/* 8019F2BC 0019C2BC  80 05 00 08 */	lwz r0, 8(r5)
/* 8019F2C0 0019C2C0  38 A0 00 05 */	li r5, 5
/* 8019F2C4 0019C2C4  90 C1 00 10 */	stw r6, 0x10(r1)
/* 8019F2C8 0019C2C8  C0 22 D3 7C */	lfs f1, lbl_8041E6FC@sda21(r2)
/* 8019F2CC 0019C2CC  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019F2D0 0019C2D0  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 8019F2D4 0019C2D4  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8019F2D8 0019C2D8  4B E6 79 35 */	bl intplGetValue
/* 8019F2DC 0019C2DC  C0 7F 00 C4 */	lfs f3, 0xc4(r31)
/* 8019F2E0 0019C2E0  C0 17 00 10 */	lfs f0, 0x10(r23)
/* 8019F2E4 0019C2E4  C0 42 D2 A0 */	lfs f2, lbl_8041E620@sda21(r2)
/* 8019F2E8 0019C2E8  EC 63 00 2A */	fadds f3, f3, f0
/* 8019F2EC 0019C2EC  C0 1F 00 C8 */	lfs f0, 0xc8(r31)
/* 8019F2F0 0019C2F0  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8019F2F4 0019C2F4  EC 02 00 2A */	fadds f0, f2, f0
/* 8019F2F8 0019C2F8  EC 23 08 2A */	fadds f1, f3, f1
/* 8019F2FC 0019C2FC  90 18 00 14 */	stw r0, 0x14(r24)
/* 8019F300 0019C300  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 8019F304 0019C304  D0 21 00 10 */	stfs f1, 0x10(r1)
/* 8019F308 0019C308  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019F30C 0019C30C  80 61 00 10 */	lwz r3, 0x10(r1)
/* 8019F310 0019C310  90 78 00 18 */	stw r3, 0x18(r24)
/* 8019F314 0019C314  90 18 00 1C */	stw r0, 0x1c(r24)
/* 8019F318 0019C318  48 00 05 7C */	b .L_8019F894
/* 8019F31C 0019C31C  80 19 0E F4 */	lwz r0, 0xef4(r25)
/* 8019F320 0019C320  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 8019F324 0019C324  40 82 00 0C */	bne .L_8019F330
/* 8019F328 0019C328  38 00 00 00 */	li r0, 0
/* 8019F32C 0019C32C  90 18 00 44 */	stw r0, 0x44(r24)
.L_8019F330:
/* 8019F330 0019C330  80 18 00 08 */	lwz r0, 8(r24)
/* 8019F334 0019C334  2C 00 00 14 */	cmpwi r0, 0x14
/* 8019F338 0019C338  40 82 00 10 */	bne .L_8019F348
/* 8019F33C 0019C33C  80 78 00 0C */	lwz r3, 0xc(r24)
/* 8019F340 0019C340  38 80 00 00 */	li r4, 0
/* 8019F344 0019C344  4B FF D7 35 */	bl BattleAudience_ChangeStatus
.L_8019F348:
/* 8019F348 0019C348  80 18 00 08 */	lwz r0, 8(r24)
/* 8019F34C 0019C34C  2C 00 00 00 */	cmpwi r0, 0
/* 8019F350 0019C350  40 82 00 10 */	bne .L_8019F360
/* 8019F354 0019C354  80 78 00 04 */	lwz r3, 4(r24)
/* 8019F358 0019C358  38 03 00 01 */	addi r0, r3, 1
/* 8019F35C 0019C35C  90 18 00 04 */	stw r0, 4(r24)
.L_8019F360:
/* 8019F360 0019C360  80 18 00 08 */	lwz r0, 8(r24)
/* 8019F364 0019C364  2C 00 00 00 */	cmpwi r0, 0
/* 8019F368 0019C368  40 81 05 2C */	ble .L_8019F894
/* 8019F36C 0019C36C  C0 38 00 14 */	lfs f1, 0x14(r24)
/* 8019F370 0019C370  C0 18 00 28 */	lfs f0, 0x28(r24)
/* 8019F374 0019C374  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F378 0019C378  D0 18 00 14 */	stfs f0, 0x14(r24)
/* 8019F37C 0019C37C  C0 38 00 18 */	lfs f1, 0x18(r24)
/* 8019F380 0019C380  C0 18 00 2C */	lfs f0, 0x2c(r24)
/* 8019F384 0019C384  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F388 0019C388  D0 18 00 18 */	stfs f0, 0x18(r24)
/* 8019F38C 0019C38C  C0 38 00 1C */	lfs f1, 0x1c(r24)
/* 8019F390 0019C390  C0 18 00 30 */	lfs f0, 0x30(r24)
/* 8019F394 0019C394  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F398 0019C398  D0 18 00 1C */	stfs f0, 0x1c(r24)
/* 8019F39C 0019C39C  C0 38 00 28 */	lfs f1, 0x28(r24)
/* 8019F3A0 0019C3A0  C0 18 00 34 */	lfs f0, 0x34(r24)
/* 8019F3A4 0019C3A4  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F3A8 0019C3A8  D0 18 00 28 */	stfs f0, 0x28(r24)
/* 8019F3AC 0019C3AC  C0 38 00 2C */	lfs f1, 0x2c(r24)
/* 8019F3B0 0019C3B0  C0 18 00 38 */	lfs f0, 0x38(r24)
/* 8019F3B4 0019C3B4  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F3B8 0019C3B8  D0 18 00 2C */	stfs f0, 0x2c(r24)
/* 8019F3BC 0019C3BC  C0 38 00 30 */	lfs f1, 0x30(r24)
/* 8019F3C0 0019C3C0  C0 18 00 3C */	lfs f0, 0x3c(r24)
/* 8019F3C4 0019C3C4  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F3C8 0019C3C8  D0 18 00 30 */	stfs f0, 0x30(r24)
/* 8019F3CC 0019C3CC  80 18 00 10 */	lwz r0, 0x10(r24)
/* 8019F3D0 0019C3D0  2C 00 00 EF */	cmpwi r0, 0xef
/* 8019F3D4 0019C3D4  40 82 00 14 */	bne .L_8019F3E8
/* 8019F3D8 0019C3D8  C0 38 00 24 */	lfs f1, 0x24(r24)
/* 8019F3DC 0019C3DC  C0 02 D3 80 */	lfs f0, lbl_8041E700@sda21(r2)
/* 8019F3E0 0019C3E0  EC 01 00 2A */	fadds f0, f1, f0
/* 8019F3E4 0019C3E4  D0 18 00 24 */	stfs f0, 0x24(r24)
.L_8019F3E8:
/* 8019F3E8 0019C3E8  80 78 00 08 */	lwz r3, 8(r24)
/* 8019F3EC 0019C3EC  38 03 FF FF */	addi r0, r3, -1
/* 8019F3F0 0019C3F0  90 18 00 08 */	stw r0, 8(r24)
/* 8019F3F4 0019C3F4  48 00 04 A0 */	b .L_8019F894
/* 8019F3F8 0019C3F8  80 19 0E F4 */	lwz r0, 0xef4(r25)
/* 8019F3FC 0019C3FC  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 8019F400 0019C400  40 82 00 0C */	bne .L_8019F40C
/* 8019F404 0019C404  38 00 00 00 */	li r0, 0
/* 8019F408 0019C408  90 18 00 44 */	stw r0, 0x44(r24)
.L_8019F40C:
/* 8019F40C 0019C40C  83 F8 00 40 */	lwz r31, 0x40(r24)
/* 8019F410 0019C410  38 A1 00 09 */	addi r5, r1, 9
/* 8019F414 0019C414  38 C1 00 08 */	addi r6, r1, 8
/* 8019F418 0019C418  38 80 00 12 */	li r4, 0x12
/* 8019F41C 0019C41C  7F E3 FB 78 */	mr r3, r31
/* 8019F420 0019C420  4B F8 36 31 */	bl BtlUnit_GetStatus
/* 8019F424 0019C424  88 01 00 09 */	lbz r0, 9(r1)
/* 8019F428 0019C428  7C 00 07 74 */	extsb r0, r0
/* 8019F42C 0019C42C  2C 00 00 01 */	cmpwi r0, 1
/* 8019F430 0019C430  40 80 00 14 */	bge .L_8019F444
/* 8019F434 0019C434  7F E3 FB 78 */	mr r3, r31
/* 8019F438 0019C438  4B F8 14 11 */	bl BtlUnit_CheckShadowGuard
/* 8019F43C 0019C43C  2C 03 00 00 */	cmpwi r3, 0
/* 8019F440 0019C440  41 82 00 0C */	beq .L_8019F44C
.L_8019F444:
/* 8019F444 0019C444  38 00 00 00 */	li r0, 0
/* 8019F448 0019C448  90 18 00 44 */	stw r0, 0x44(r24)
.L_8019F44C:
/* 8019F44C 0019C44C  80 18 00 00 */	lwz r0, 0(r24)
/* 8019F450 0019C450  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 8019F454 0019C454  41 82 00 0C */	beq .L_8019F460
/* 8019F458 0019C458  38 00 00 00 */	li r0, 0
/* 8019F45C 0019C45C  90 18 00 44 */	stw r0, 0x44(r24)
.L_8019F460:
/* 8019F460 0019C460  80 18 00 10 */	lwz r0, 0x10(r24)
/* 8019F464 0019C464  2C 00 00 80 */	cmpwi r0, 0x80
/* 8019F468 0019C468  41 80 00 20 */	blt .L_8019F488
/* 8019F46C 0019C46C  2C 00 00 EC */	cmpwi r0, 0xec
/* 8019F470 0019C470  40 80 00 18 */	bge .L_8019F488
/* 8019F474 0019C474  4B F3 1F 81 */	bl pouchGetEmptyHaveItemCnt
/* 8019F478 0019C478  2C 03 00 00 */	cmpwi r3, 0
/* 8019F47C 0019C47C  41 81 00 0C */	bgt .L_8019F488
/* 8019F480 0019C480  38 00 00 00 */	li r0, 0
/* 8019F484 0019C484  90 18 00 44 */	stw r0, 0x44(r24)
.L_8019F488:
/* 8019F488 0019C488  80 18 00 44 */	lwz r0, 0x44(r24)
/* 8019F48C 0019C48C  2C 00 00 00 */	cmpwi r0, 0
/* 8019F490 0019C490  41 82 02 04 */	beq .L_8019F694
/* 8019F494 0019C494  3C 9E 00 01 */	addis r4, r30, 1
/* 8019F498 0019C498  80 64 37 F8 */	lwz r3, 0x37f8(r4)
/* 8019F49C 0019C49C  38 03 00 01 */	addi r0, r3, 1
/* 8019F4A0 0019C4A0  90 04 37 F8 */	stw r0, 0x37f8(r4)
/* 8019F4A4 0019C4A4  80 04 37 F8 */	lwz r0, 0x37f8(r4)
/* 8019F4A8 0019C4A8  2C 00 00 03 */	cmpwi r0, 3
/* 8019F4AC 0019C4AC  40 81 00 0C */	ble .L_8019F4B8
/* 8019F4B0 0019C4B0  38 00 00 03 */	li r0, 3
/* 8019F4B4 0019C4B4  90 04 37 F8 */	stw r0, 0x37f8(r4)
.L_8019F4B8:
/* 8019F4B8 0019C4B8  80 18 00 44 */	lwz r0, 0x44(r24)
/* 8019F4BC 0019C4BC  2C 00 00 02 */	cmpwi r0, 2
/* 8019F4C0 0019C4C0  40 82 00 10 */	bne .L_8019F4D0
/* 8019F4C4 0019C4C4  38 00 00 04 */	li r0, 4
/* 8019F4C8 0019C4C8  90 18 00 04 */	stw r0, 4(r24)
/* 8019F4CC 0019C4CC  48 00 01 DC */	b .L_8019F6A8
.L_8019F4D0:
/* 8019F4D0 0019C4D0  80 18 00 10 */	lwz r0, 0x10(r24)
/* 8019F4D4 0019C4D4  2C 00 00 79 */	cmpwi r0, 0x79
/* 8019F4D8 0019C4D8  41 80 00 18 */	blt .L_8019F4F0
/* 8019F4DC 0019C4DC  2C 00 00 EC */	cmpwi r0, 0xec
/* 8019F4E0 0019C4E0  40 80 00 10 */	bge .L_8019F4F0
/* 8019F4E4 0019C4E4  38 60 00 00 */	li r3, 0
/* 8019F4E8 0019C4E8  4B FF 98 E9 */	bl BattleAudience_SetPresentItemType
/* 8019F4EC 0019C4EC  48 00 00 1C */	b .L_8019F508
.L_8019F4F0:
/* 8019F4F0 0019C4F0  2C 00 00 EC */	cmpwi r0, 0xec
/* 8019F4F4 0019C4F4  41 80 00 14 */	blt .L_8019F508
/* 8019F4F8 0019C4F8  2C 00 00 F0 */	cmpwi r0, 0xf0
/* 8019F4FC 0019C4FC  40 80 00 0C */	bge .L_8019F508
/* 8019F500 0019C500  38 60 00 01 */	li r3, 1
/* 8019F504 0019C504  4B FF 98 CD */	bl BattleAudience_SetPresentItemType
.L_8019F508:
/* 8019F508 0019C508  7F E3 FB 78 */	mr r3, r31
/* 8019F50C 0019C50C  4B F8 43 29 */	bl func_80123834
/* 8019F510 0019C510  4B FF 99 1D */	bl BattleAudience_SetPresentTargetUnitId
/* 8019F514 0019C514  80 18 00 10 */	lwz r0, 0x10(r24)
/* 8019F518 0019C518  2C 00 00 EE */	cmpwi r0, 0xee
/* 8019F51C 0019C51C  41 82 00 84 */	beq .L_8019F5A0
/* 8019F520 0019C520  40 80 00 14 */	bge .L_8019F534
/* 8019F524 0019C524  2C 00 00 EC */	cmpwi r0, 0xec
/* 8019F528 0019C528  41 82 00 18 */	beq .L_8019F540
/* 8019F52C 0019C52C  40 80 00 44 */	bge .L_8019F570
/* 8019F530 0019C530  48 00 00 CC */	b .L_8019F5FC
.L_8019F534:
/* 8019F534 0019C534  2C 00 00 F0 */	cmpwi r0, 0xf0
/* 8019F538 0019C538  40 80 00 C4 */	bge .L_8019F5FC
/* 8019F53C 0019C53C  48 00 00 94 */	b .L_8019F5D0
.L_8019F540:
/* 8019F540 0019C540  3C 7E 00 01 */	addis r3, r30, 1
/* 8019F544 0019C544  38 9D 00 40 */	addi r4, r29, 0x40
/* 8019F548 0019C548  38 A0 00 C0 */	li r5, 0xc0
/* 8019F54C 0019C54C  38 63 37 FC */	addi r3, r3, 0x37fc
/* 8019F550 0019C550  4B E6 5C 4D */	bl func_8000519C
/* 8019F554 0019C554  3C 9E 00 01 */	addis r4, r30, 1
/* 8019F558 0019C558  80 64 38 1C */	lwz r3, 0x381c(r4)
/* 8019F55C 0019C55C  80 04 37 F8 */	lwz r0, 0x37f8(r4)
/* 8019F560 0019C560  7C 60 1A 14 */	add r3, r0, r3
/* 8019F564 0019C564  38 03 FF FF */	addi r0, r3, -1
/* 8019F568 0019C568  90 04 38 1C */	stw r0, 0x381c(r4)
/* 8019F56C 0019C56C  48 00 00 90 */	b .L_8019F5FC
.L_8019F570:
/* 8019F570 0019C570  3C 7E 00 01 */	addis r3, r30, 1
/* 8019F574 0019C574  38 9D 01 00 */	addi r4, r29, 0x100
/* 8019F578 0019C578  38 A0 00 C0 */	li r5, 0xc0
/* 8019F57C 0019C57C  38 63 37 FC */	addi r3, r3, 0x37fc
/* 8019F580 0019C580  4B E6 5C 1D */	bl func_8000519C
/* 8019F584 0019C584  3C 9E 00 01 */	addis r4, r30, 1
/* 8019F588 0019C588  80 64 38 1C */	lwz r3, 0x381c(r4)
/* 8019F58C 0019C58C  80 04 37 F8 */	lwz r0, 0x37f8(r4)
/* 8019F590 0019C590  7C 60 1A 14 */	add r3, r0, r3
/* 8019F594 0019C594  38 03 FF FF */	addi r0, r3, -1
/* 8019F598 0019C598  90 04 38 1C */	stw r0, 0x381c(r4)
/* 8019F59C 0019C59C  48 00 00 60 */	b .L_8019F5FC
.L_8019F5A0:
/* 8019F5A0 0019C5A0  3C 7E 00 01 */	addis r3, r30, 1
/* 8019F5A4 0019C5A4  38 9D 01 C0 */	addi r4, r29, 0x1c0
/* 8019F5A8 0019C5A8  38 A0 00 C0 */	li r5, 0xc0
/* 8019F5AC 0019C5AC  38 63 37 FC */	addi r3, r3, 0x37fc
/* 8019F5B0 0019C5B0  4B E6 5B ED */	bl func_8000519C
/* 8019F5B4 0019C5B4  3C 9E 00 01 */	addis r4, r30, 1
/* 8019F5B8 0019C5B8  80 64 38 1C */	lwz r3, 0x381c(r4)
/* 8019F5BC 0019C5BC  80 04 37 F8 */	lwz r0, 0x37f8(r4)
/* 8019F5C0 0019C5C0  7C 60 1A 14 */	add r3, r0, r3
/* 8019F5C4 0019C5C4  38 03 FF FF */	addi r0, r3, -1
/* 8019F5C8 0019C5C8  90 04 38 1C */	stw r0, 0x381c(r4)
/* 8019F5CC 0019C5CC  48 00 00 30 */	b .L_8019F5FC
.L_8019F5D0:
/* 8019F5D0 0019C5D0  3C 7E 00 01 */	addis r3, r30, 1
/* 8019F5D4 0019C5D4  38 9D 02 80 */	addi r4, r29, 0x280
/* 8019F5D8 0019C5D8  38 A0 00 C0 */	li r5, 0xc0
/* 8019F5DC 0019C5DC  38 63 37 FC */	addi r3, r3, 0x37fc
/* 8019F5E0 0019C5E0  4B E6 5B BD */	bl func_8000519C
/* 8019F5E4 0019C5E4  3C 9E 00 01 */	addis r4, r30, 1
/* 8019F5E8 0019C5E8  80 64 38 1C */	lwz r3, 0x381c(r4)
/* 8019F5EC 0019C5EC  80 04 37 F8 */	lwz r0, 0x37f8(r4)
/* 8019F5F0 0019C5F0  7C 60 1A 14 */	add r3, r0, r3
/* 8019F5F4 0019C5F4  38 03 FF FF */	addi r0, r3, -1
/* 8019F5F8 0019C5F8  90 04 38 1C */	stw r0, 0x381c(r4)
.L_8019F5FC:
/* 8019F5FC 0019C5FC  80 78 00 10 */	lwz r3, 0x10(r24)
/* 8019F600 0019C600  4B FF 98 89 */	bl BattleAudience_SetPresentItemNo
/* 8019F604 0019C604  4B FF 97 A5 */	bl BattleAudience_GetPresentItemType
/* 8019F608 0019C608  2C 03 00 01 */	cmpwi r3, 1
/* 8019F60C 0019C60C  41 82 00 34 */	beq .L_8019F640
/* 8019F610 0019C610  40 80 00 74 */	bge .L_8019F684
/* 8019F614 0019C614  2C 03 00 00 */	cmpwi r3, 0
/* 8019F618 0019C618  40 80 00 08 */	bge .L_8019F620
/* 8019F61C 0019C61C  48 00 00 68 */	b .L_8019F684
.L_8019F620:
/* 8019F620 0019C620  80 98 00 00 */	lwz r4, 0(r24)
/* 8019F624 0019C624  38 60 00 05 */	li r3, 5
/* 8019F628 0019C628  38 00 00 07 */	li r0, 7
/* 8019F62C 0019C62C  54 84 07 FA */	rlwinm r4, r4, 0, 0x1f, 0x1d
/* 8019F630 0019C630  90 98 00 00 */	stw r4, 0(r24)
/* 8019F634 0019C634  90 78 00 08 */	stw r3, 8(r24)
/* 8019F638 0019C638  90 18 00 04 */	stw r0, 4(r24)
/* 8019F63C 0019C63C  48 00 00 48 */	b .L_8019F684
.L_8019F640:
/* 8019F640 0019C640  38 60 00 0A */	li r3, 0xa
/* 8019F644 0019C644  4B FF A9 B9 */	bl BattleAudienceSoundStop
/* 8019F648 0019C648  38 60 00 0B */	li r3, 0xb
/* 8019F64C 0019C64C  4B FF A9 B1 */	bl BattleAudienceSoundStop
/* 8019F650 0019C650  C0 38 00 28 */	lfs f1, 0x28(r24)
/* 8019F654 0019C654  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019F658 0019C658  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019F65C 0019C65C  40 80 00 10 */	bge .L_8019F66C
/* 8019F660 0019C660  C0 02 D3 84 */	lfs f0, lbl_8041E704@sda21(r2)
/* 8019F664 0019C664  EC 01 00 32 */	fmuls f0, f1, f0
/* 8019F668 0019C668  D0 18 00 28 */	stfs f0, 0x28(r24)
.L_8019F66C:
/* 8019F66C 0019C66C  C0 22 D2 F0 */	lfs f1, lbl_8041E670@sda21(r2)
/* 8019F670 0019C670  38 00 00 04 */	li r0, 4
/* 8019F674 0019C674  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019F678 0019C678  D0 38 00 2C */	stfs f1, 0x2c(r24)
/* 8019F67C 0019C67C  D0 18 00 30 */	stfs f0, 0x30(r24)
/* 8019F680 0019C680  90 18 00 04 */	stw r0, 4(r24)
.L_8019F684:
/* 8019F684 0019C684  3C 7E 00 01 */	addis r3, r30, 1
/* 8019F688 0019C688  38 00 00 00 */	li r0, 0
/* 8019F68C 0019C68C  90 03 37 F8 */	stw r0, 0x37f8(r3)
/* 8019F690 0019C690  48 00 00 0C */	b .L_8019F69C
.L_8019F694:
/* 8019F694 0019C694  38 00 00 04 */	li r0, 4
/* 8019F698 0019C698  90 18 00 04 */	stw r0, 4(r24)
.L_8019F69C:
/* 8019F69C 0019C69C  80 18 00 04 */	lwz r0, 4(r24)
/* 8019F6A0 0019C6A0  2C 00 00 04 */	cmpwi r0, 4
/* 8019F6A4 0019C6A4  40 82 01 F0 */	bne .L_8019F894
.L_8019F6A8:
/* 8019F6A8 0019C6A8  C0 58 00 14 */	lfs f2, 0x14(r24)
/* 8019F6AC 0019C6AC  C0 38 00 28 */	lfs f1, 0x28(r24)
/* 8019F6B0 0019C6B0  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019F6B4 0019C6B4  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F6B8 0019C6B8  D0 38 00 14 */	stfs f1, 0x14(r24)
/* 8019F6BC 0019C6BC  C0 58 00 18 */	lfs f2, 0x18(r24)
/* 8019F6C0 0019C6C0  C0 38 00 2C */	lfs f1, 0x2c(r24)
/* 8019F6C4 0019C6C4  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F6C8 0019C6C8  D0 38 00 18 */	stfs f1, 0x18(r24)
/* 8019F6CC 0019C6CC  C0 58 00 1C */	lfs f2, 0x1c(r24)
/* 8019F6D0 0019C6D0  C0 38 00 30 */	lfs f1, 0x30(r24)
/* 8019F6D4 0019C6D4  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F6D8 0019C6D8  D0 38 00 1C */	stfs f1, 0x1c(r24)
/* 8019F6DC 0019C6DC  C0 58 00 28 */	lfs f2, 0x28(r24)
/* 8019F6E0 0019C6E0  C0 38 00 34 */	lfs f1, 0x34(r24)
/* 8019F6E4 0019C6E4  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F6E8 0019C6E8  D0 38 00 28 */	stfs f1, 0x28(r24)
/* 8019F6EC 0019C6EC  C0 58 00 2C */	lfs f2, 0x2c(r24)
/* 8019F6F0 0019C6F0  C0 38 00 38 */	lfs f1, 0x38(r24)
/* 8019F6F4 0019C6F4  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F6F8 0019C6F8  D0 38 00 2C */	stfs f1, 0x2c(r24)
/* 8019F6FC 0019C6FC  C0 58 00 30 */	lfs f2, 0x30(r24)
/* 8019F700 0019C700  C0 38 00 3C */	lfs f1, 0x3c(r24)
/* 8019F704 0019C704  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F708 0019C708  D0 38 00 30 */	stfs f1, 0x30(r24)
/* 8019F70C 0019C70C  C0 38 00 18 */	lfs f1, 0x18(r24)
/* 8019F710 0019C710  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019F714 0019C714  4C 40 13 82 */	cror 2, 0, 2
/* 8019F718 0019C718  40 82 01 7C */	bne .L_8019F894
/* 8019F71C 0019C71C  38 60 00 0A */	li r3, 0xa
/* 8019F720 0019C720  4B FF A8 DD */	bl BattleAudienceSoundStop
/* 8019F724 0019C724  38 60 00 0B */	li r3, 0xb
/* 8019F728 0019C728  4B FF A8 D5 */	bl BattleAudienceSoundStop
/* 8019F72C 0019C72C  38 00 00 05 */	li r0, 5
/* 8019F730 0019C730  C0 02 D2 F8 */	lfs f0, lbl_8041E678@sda21(r2)
/* 8019F734 0019C734  90 18 00 04 */	stw r0, 4(r24)
/* 8019F738 0019C738  C0 22 D2 A0 */	lfs f1, lbl_8041E620@sda21(r2)
/* 8019F73C 0019C73C  D0 18 00 18 */	stfs f0, 0x18(r24)
/* 8019F740 0019C740  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019F744 0019C744  D0 38 00 2C */	stfs f1, 0x2c(r24)
/* 8019F748 0019C748  D0 18 00 30 */	stfs f0, 0x30(r24)
/* 8019F74C 0019C74C  48 00 01 48 */	b .L_8019F894
/* 8019F750 0019C750  C0 58 00 14 */	lfs f2, 0x14(r24)
/* 8019F754 0019C754  C0 38 00 28 */	lfs f1, 0x28(r24)
/* 8019F758 0019C758  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019F75C 0019C75C  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F760 0019C760  D0 38 00 14 */	stfs f1, 0x14(r24)
/* 8019F764 0019C764  C0 58 00 18 */	lfs f2, 0x18(r24)
/* 8019F768 0019C768  C0 38 00 2C */	lfs f1, 0x2c(r24)
/* 8019F76C 0019C76C  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F770 0019C770  D0 38 00 18 */	stfs f1, 0x18(r24)
/* 8019F774 0019C774  C0 58 00 1C */	lfs f2, 0x1c(r24)
/* 8019F778 0019C778  C0 38 00 30 */	lfs f1, 0x30(r24)
/* 8019F77C 0019C77C  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F780 0019C780  D0 38 00 1C */	stfs f1, 0x1c(r24)
/* 8019F784 0019C784  C0 58 00 28 */	lfs f2, 0x28(r24)
/* 8019F788 0019C788  C0 38 00 34 */	lfs f1, 0x34(r24)
/* 8019F78C 0019C78C  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F790 0019C790  D0 38 00 28 */	stfs f1, 0x28(r24)
/* 8019F794 0019C794  C0 58 00 2C */	lfs f2, 0x2c(r24)
/* 8019F798 0019C798  C0 38 00 38 */	lfs f1, 0x38(r24)
/* 8019F79C 0019C79C  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F7A0 0019C7A0  D0 38 00 2C */	stfs f1, 0x2c(r24)
/* 8019F7A4 0019C7A4  C0 58 00 30 */	lfs f2, 0x30(r24)
/* 8019F7A8 0019C7A8  C0 38 00 3C */	lfs f1, 0x3c(r24)
/* 8019F7AC 0019C7AC  EC 22 08 2A */	fadds f1, f2, f1
/* 8019F7B0 0019C7B0  D0 38 00 30 */	stfs f1, 0x30(r24)
/* 8019F7B4 0019C7B4  C0 38 00 18 */	lfs f1, 0x18(r24)
/* 8019F7B8 0019C7B8  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019F7BC 0019C7BC  4C 40 13 82 */	cror 2, 0, 2
/* 8019F7C0 0019C7C0  40 82 00 D4 */	bne .L_8019F894
/* 8019F7C4 0019C7C4  38 60 00 3C */	li r3, 0x3c
/* 8019F7C8 0019C7C8  38 00 00 06 */	li r0, 6
/* 8019F7CC 0019C7CC  90 78 00 08 */	stw r3, 8(r24)
/* 8019F7D0 0019C7D0  90 18 00 04 */	stw r0, 4(r24)
/* 8019F7D4 0019C7D4  D0 18 00 18 */	stfs f0, 0x18(r24)
/* 8019F7D8 0019C7D8  48 00 00 BC */	b .L_8019F894
/* 8019F7DC 0019C7DC  80 18 00 08 */	lwz r0, 8(r24)
/* 8019F7E0 0019C7E0  2C 00 00 00 */	cmpwi r0, 0
/* 8019F7E4 0019C7E4  40 81 00 5C */	ble .L_8019F840
/* 8019F7E8 0019C7E8  2C 00 00 1E */	cmpwi r0, 0x1e
/* 8019F7EC 0019C7EC  40 80 00 2C */	bge .L_8019F818
/* 8019F7F0 0019C7F0  54 00 07 BE */	clrlwi r0, r0, 0x1e
/* 8019F7F4 0019C7F4  2C 00 00 01 */	cmpwi r0, 1
/* 8019F7F8 0019C7F8  41 81 00 14 */	bgt .L_8019F80C
/* 8019F7FC 0019C7FC  80 18 00 00 */	lwz r0, 0(r24)
/* 8019F800 0019C800  60 00 00 02 */	ori r0, r0, 2
/* 8019F804 0019C804  90 18 00 00 */	stw r0, 0(r24)
/* 8019F808 0019C808  48 00 00 10 */	b .L_8019F818
.L_8019F80C:
/* 8019F80C 0019C80C  80 18 00 00 */	lwz r0, 0(r24)
/* 8019F810 0019C810  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8019F814 0019C814  90 18 00 00 */	stw r0, 0(r24)
.L_8019F818:
/* 8019F818 0019C818  80 78 00 08 */	lwz r3, 8(r24)
/* 8019F81C 0019C81C  38 03 FF FF */	addi r0, r3, -1
/* 8019F820 0019C820  90 18 00 08 */	stw r0, 8(r24)
/* 8019F824 0019C824  48 00 00 70 */	b .L_8019F894
/* 8019F828 0019C828  80 78 00 08 */	lwz r3, 8(r24)
/* 8019F82C 0019C82C  38 03 FF FF */	addi r0, r3, -1
/* 8019F830 0019C830  90 18 00 08 */	stw r0, 8(r24)
/* 8019F834 0019C834  80 18 00 08 */	lwz r0, 8(r24)
/* 8019F838 0019C838  2C 00 00 00 */	cmpwi r0, 0
/* 8019F83C 0019C83C  41 81 00 58 */	bgt .L_8019F894
.L_8019F840:
/* 8019F840 0019C840  38 60 00 0A */	li r3, 0xa
/* 8019F844 0019C844  4B FF A7 B9 */	bl BattleAudienceSoundStop
/* 8019F848 0019C848  38 60 00 0B */	li r3, 0xb
/* 8019F84C 0019C84C  4B FF A7 B1 */	bl BattleAudienceSoundStop
/* 8019F850 0019C850  80 78 00 0C */	lwz r3, 0xc(r24)
/* 8019F854 0019C854  2C 03 FF FF */	cmpwi r3, -1
/* 8019F858 0019C858  41 82 00 14 */	beq .L_8019F86C
/* 8019F85C 0019C85C  48 00 2E 3D */	bl BattleAudienceGetPtr
/* 8019F860 0019C860  80 78 00 0C */	lwz r3, 0xc(r24)
/* 8019F864 0019C864  38 80 00 00 */	li r4, 0
/* 8019F868 0019C868  4B FF D2 11 */	bl BattleAudience_ChangeStatus
.L_8019F86C:
/* 8019F86C 0019C86C  38 00 00 00 */	li r0, 0
/* 8019F870 0019C870  90 18 00 00 */	stw r0, 0(r24)
/* 8019F874 0019C874  90 18 00 08 */	stw r0, 8(r24)
/* 8019F878 0019C878  90 18 00 04 */	stw r0, 4(r24)
/* 8019F87C 0019C87C  80 78 00 0C */	lwz r3, 0xc(r24)
/* 8019F880 0019C880  2C 03 FF FF */	cmpwi r3, -1
/* 8019F884 0019C884  41 82 00 10 */	beq .L_8019F894
/* 8019F888 0019C888  48 00 2E 11 */	bl BattleAudienceGetPtr
/* 8019F88C 0019C88C  38 00 FF FF */	li r0, -1
/* 8019F890 0019C890  B0 03 00 1C */	sth r0, 0x1c(r3)
.L_8019F894:
/* 8019F894 0019C894  3B 5A 00 01 */	addi r26, r26, 1
/* 8019F898 0019C898  3B 18 00 48 */	addi r24, r24, 0x48
/* 8019F89C 0019C89C  2C 1A 00 64 */	cmpwi r26, 0x64
/* 8019F8A0 0019C8A0  41 80 F6 FC */	blt .L_8019EF9C
/* 8019F8A4 0019C8A4  BA C1 00 38 */	lmw r22, 0x38(r1)
/* 8019F8A8 0019C8A8  80 01 00 64 */	lwz r0, 0x64(r1)
/* 8019F8AC 0019C8AC  7C 08 03 A6 */	mtlr r0
/* 8019F8B0 0019C8B0  38 21 00 60 */	addi r1, r1, 0x60
/* 8019F8B4 0019C8B4  4E 80 00 20 */	blr 

.global BattleAudienceDetectTargetPlayer
BattleAudienceDetectTargetPlayer:
/* 8019F8B8 0019C8B8  94 21 FE E0 */	stwu r1, -0x120(r1)
/* 8019F8BC 0019C8BC  7C 08 02 A6 */	mflr r0
/* 8019F8C0 0019C8C0  90 01 01 24 */	stw r0, 0x124(r1)
/* 8019F8C4 0019C8C4  BF 41 01 08 */	stmw r26, 0x108(r1)
/* 8019F8C8 0019C8C8  83 8D 17 10 */	lwz r28, lbl_80418970@sda21(r13)
/* 8019F8CC 0019C8CC  48 00 2E 09 */	bl BattleAudienceBaseGetPtr
/* 8019F8D0 0019C8D0  3B 40 00 00 */	li r26, 0
/* 8019F8D4 0019C8D4  3B E0 00 00 */	li r31, 0
/* 8019F8D8 0019C8D8  3B A0 00 00 */	li r29, 0
/* 8019F8DC 0019C8DC  3B C0 00 00 */	li r30, 0
.L_8019F8E0:
/* 8019F8E0 0019C8E0  38 1E 00 20 */	addi r0, r30, 0x20
/* 8019F8E4 0019C8E4  7F 7C 00 2E */	lwzx r27, r28, r0
/* 8019F8E8 0019C8E8  28 1B 00 00 */	cmplwi r27, 0
/* 8019F8EC 0019C8EC  41 82 00 4C */	beq .L_8019F938
/* 8019F8F0 0019C8F0  7F 63 DB 78 */	mr r3, r27
/* 8019F8F4 0019C8F4  4B F8 3E C1 */	bl BtlUnit_GetBodyPartsId
/* 8019F8F8 0019C8F8  7C 64 1B 78 */	mr r4, r3
/* 8019F8FC 0019C8FC  7F A3 EB 78 */	mr r3, r29
/* 8019F900 0019C900  4B F5 40 21 */	bl BattleGetUnitPartsPtr
/* 8019F904 0019C904  88 1B 00 0C */	lbz r0, 0xc(r27)
/* 8019F908 0019C908  7C 00 07 75 */	extsb. r0, r0
/* 8019F90C 0019C90C  40 82 00 2C */	bne .L_8019F938
/* 8019F910 0019C910  A8 1B 01 0C */	lha r0, 0x10c(r27)
/* 8019F914 0019C914  2C 00 00 00 */	cmpwi r0, 0
/* 8019F918 0019C918  40 81 00 20 */	ble .L_8019F938
/* 8019F91C 0019C91C  80 03 01 AC */	lwz r0, 0x1ac(r3)
/* 8019F920 0019C920  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 8019F924 0019C924  40 82 00 14 */	bne .L_8019F938
/* 8019F928 0019C928  38 61 00 08 */	addi r3, r1, 8
/* 8019F92C 0019C92C  3B 5A 00 01 */	addi r26, r26, 1
/* 8019F930 0019C930  7F A3 F9 2E */	stwx r29, r3, r31
/* 8019F934 0019C934  3B FF 00 04 */	addi r31, r31, 4
.L_8019F938:
/* 8019F938 0019C938  3B BD 00 01 */	addi r29, r29, 1
/* 8019F93C 0019C93C  3B DE 00 04 */	addi r30, r30, 4
/* 8019F940 0019C940  2C 1D 00 40 */	cmpwi r29, 0x40
/* 8019F944 0019C944  41 80 FF 9C */	blt .L_8019F8E0
/* 8019F948 0019C948  2C 1A 00 00 */	cmpwi r26, 0
/* 8019F94C 0019C94C  40 82 00 0C */	bne .L_8019F958
/* 8019F950 0019C950  38 60 00 00 */	li r3, 0
/* 8019F954 0019C954  48 00 00 20 */	b .L_8019F974
.L_8019F958:
/* 8019F958 0019C958  7F 43 D3 78 */	mr r3, r26
/* 8019F95C 0019C95C  4B E6 65 69 */	bl irand
/* 8019F960 0019C960  54 60 10 3A */	slwi r0, r3, 2
/* 8019F964 0019C964  38 81 00 08 */	addi r4, r1, 8
/* 8019F968 0019C968  7C 84 00 2E */	lwzx r4, r4, r0
/* 8019F96C 0019C96C  7F 83 E3 78 */	mr r3, r28
/* 8019F970 0019C970  4B F5 40 09 */	bl BattleGetUnitPtr
.L_8019F974:
/* 8019F974 0019C974  BB 41 01 08 */	lmw r26, 0x108(r1)
/* 8019F978 0019C978  80 01 01 24 */	lwz r0, 0x124(r1)
/* 8019F97C 0019C97C  7C 08 03 A6 */	mtlr r0
/* 8019F980 0019C980  38 21 01 20 */	addi r1, r1, 0x120
/* 8019F984 0019C984  4E 80 00 20 */	blr 

.global BattleAudienceDetectTargetAll
BattleAudienceDetectTargetAll:
/* 8019F988 0019C988  94 21 FE E0 */	stwu r1, -0x120(r1)
/* 8019F98C 0019C98C  7C 08 02 A6 */	mflr r0
/* 8019F990 0019C990  90 01 01 24 */	stw r0, 0x124(r1)
/* 8019F994 0019C994  BF 41 01 08 */	stmw r26, 0x108(r1)
/* 8019F998 0019C998  83 8D 17 10 */	lwz r28, lbl_80418970@sda21(r13)
/* 8019F99C 0019C99C  48 00 2D 39 */	bl BattleAudienceBaseGetPtr
/* 8019F9A0 0019C9A0  3B 40 00 00 */	li r26, 0
/* 8019F9A4 0019C9A4  3B E0 00 00 */	li r31, 0
/* 8019F9A8 0019C9A8  3B A0 00 00 */	li r29, 0
/* 8019F9AC 0019C9AC  3B C0 00 00 */	li r30, 0
.L_8019F9B0:
/* 8019F9B0 0019C9B0  38 1E 00 20 */	addi r0, r30, 0x20
/* 8019F9B4 0019C9B4  7F 7C 00 2E */	lwzx r27, r28, r0
/* 8019F9B8 0019C9B8  28 1B 00 00 */	cmplwi r27, 0
/* 8019F9BC 0019C9BC  41 82 00 54 */	beq .L_8019FA10
/* 8019F9C0 0019C9C0  7F 63 DB 78 */	mr r3, r27
/* 8019F9C4 0019C9C4  4B F8 3D F1 */	bl BtlUnit_GetBodyPartsId
/* 8019F9C8 0019C9C8  7C 64 1B 78 */	mr r4, r3
/* 8019F9CC 0019C9CC  7F A3 EB 78 */	mr r3, r29
/* 8019F9D0 0019C9D0  4B F5 3F 51 */	bl BattleGetUnitPartsPtr
/* 8019F9D4 0019C9D4  80 03 01 AC */	lwz r0, 0x1ac(r3)
/* 8019F9D8 0019C9D8  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 8019F9DC 0019C9DC  40 82 00 34 */	bne .L_8019FA10
/* 8019F9E0 0019C9E0  A8 1B 01 0C */	lha r0, 0x10c(r27)
/* 8019F9E4 0019C9E4  2C 00 00 00 */	cmpwi r0, 0
/* 8019F9E8 0019C9E8  40 81 00 28 */	ble .L_8019FA10
/* 8019F9EC 0019C9EC  80 1B 00 08 */	lwz r0, 8(r27)
/* 8019F9F0 0019C9F0  2C 00 00 D8 */	cmpwi r0, 0xd8
/* 8019F9F4 0019C9F4  41 80 00 0C */	blt .L_8019FA00
/* 8019F9F8 0019C9F8  2C 00 00 DA */	cmpwi r0, 0xda
/* 8019F9FC 0019C9FC  41 80 00 14 */	blt .L_8019FA10
.L_8019FA00:
/* 8019FA00 0019CA00  38 61 00 08 */	addi r3, r1, 8
/* 8019FA04 0019CA04  3B 5A 00 01 */	addi r26, r26, 1
/* 8019FA08 0019CA08  7F A3 F9 2E */	stwx r29, r3, r31
/* 8019FA0C 0019CA0C  3B FF 00 04 */	addi r31, r31, 4
.L_8019FA10:
/* 8019FA10 0019CA10  3B BD 00 01 */	addi r29, r29, 1
/* 8019FA14 0019CA14  3B DE 00 04 */	addi r30, r30, 4
/* 8019FA18 0019CA18  2C 1D 00 40 */	cmpwi r29, 0x40
/* 8019FA1C 0019CA1C  41 80 FF 94 */	blt .L_8019F9B0
/* 8019FA20 0019CA20  2C 1A 00 00 */	cmpwi r26, 0
/* 8019FA24 0019CA24  40 82 00 0C */	bne .L_8019FA30
/* 8019FA28 0019CA28  38 60 00 00 */	li r3, 0
/* 8019FA2C 0019CA2C  48 00 00 20 */	b .L_8019FA4C
.L_8019FA30:
/* 8019FA30 0019CA30  7F 43 D3 78 */	mr r3, r26
/* 8019FA34 0019CA34  4B E6 64 91 */	bl irand
/* 8019FA38 0019CA38  54 60 10 3A */	slwi r0, r3, 2
/* 8019FA3C 0019CA3C  38 81 00 08 */	addi r4, r1, 8
/* 8019FA40 0019CA40  7C 84 00 2E */	lwzx r4, r4, r0
/* 8019FA44 0019CA44  7F 83 E3 78 */	mr r3, r28
/* 8019FA48 0019CA48  4B F5 3F 31 */	bl BattleGetUnitPtr
.L_8019FA4C:
/* 8019FA4C 0019CA4C  BB 41 01 08 */	lmw r26, 0x108(r1)
/* 8019FA50 0019CA50  80 01 01 24 */	lwz r0, 0x124(r1)
/* 8019FA54 0019CA54  7C 08 03 A6 */	mtlr r0
/* 8019FA58 0019CA58  38 21 01 20 */	addi r1, r1, 0x120
/* 8019FA5C 0019CA5C  4E 80 00 20 */	blr 

.global BattleAudienceSetThrowItemMax
BattleAudienceSetThrowItemMax:
/* 8019FA60 0019CA60  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8019FA64 0019CA64  7C 08 02 A6 */	mflr r0
/* 8019FA68 0019CA68  90 01 00 14 */	stw r0, 0x14(r1)
/* 8019FA6C 0019CA6C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8019FA70 0019CA70  48 00 2C 65 */	bl BattleAudienceBaseGetPtr
/* 8019FA74 0019CA74  7C 7F 1B 78 */	mr r31, r3
/* 8019FA78 0019CA78  38 60 00 64 */	li r3, 0x64
/* 8019FA7C 0019CA7C  4B E6 64 49 */	bl irand
/* 8019FA80 0019CA80  2C 03 00 50 */	cmpwi r3, 0x50
/* 8019FA84 0019CA84  40 80 00 14 */	bge .L_8019FA98
/* 8019FA88 0019CA88  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FA8C 0019CA8C  38 00 00 00 */	li r0, 0
/* 8019FA90 0019CA90  90 03 37 F4 */	stw r0, 0x37f4(r3)
/* 8019FA94 0019CA94  48 00 00 48 */	b .L_8019FADC
.L_8019FA98:
/* 8019FA98 0019CA98  2C 03 00 5A */	cmpwi r3, 0x5a
/* 8019FA9C 0019CA9C  40 80 00 14 */	bge .L_8019FAB0
/* 8019FAA0 0019CAA0  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FAA4 0019CAA4  38 00 00 01 */	li r0, 1
/* 8019FAA8 0019CAA8  90 03 37 F4 */	stw r0, 0x37f4(r3)
/* 8019FAAC 0019CAAC  48 00 00 30 */	b .L_8019FADC
.L_8019FAB0:
/* 8019FAB0 0019CAB0  2C 03 00 5F */	cmpwi r3, 0x5f
/* 8019FAB4 0019CAB4  40 80 00 14 */	bge .L_8019FAC8
/* 8019FAB8 0019CAB8  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FABC 0019CABC  38 00 00 02 */	li r0, 2
/* 8019FAC0 0019CAC0  90 03 37 F4 */	stw r0, 0x37f4(r3)
/* 8019FAC4 0019CAC4  48 00 00 18 */	b .L_8019FADC
.L_8019FAC8:
/* 8019FAC8 0019CAC8  2C 03 00 64 */	cmpwi r3, 0x64
/* 8019FACC 0019CACC  40 80 00 10 */	bge .L_8019FADC
/* 8019FAD0 0019CAD0  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FAD4 0019CAD4  38 00 00 03 */	li r0, 3
/* 8019FAD8 0019CAD8  90 03 37 F4 */	stw r0, 0x37f4(r3)
.L_8019FADC:
/* 8019FADC 0019CADC  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FAE0 0019CAE0  38 00 00 00 */	li r0, 0
/* 8019FAE4 0019CAE4  90 03 37 F0 */	stw r0, 0x37f0(r3)
/* 8019FAE8 0019CAE8  90 03 37 F8 */	stw r0, 0x37f8(r3)
/* 8019FAEC 0019CAEC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8019FAF0 0019CAF0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8019FAF4 0019CAF4  7C 08 03 A6 */	mtlr r0
/* 8019FAF8 0019CAF8  38 21 00 10 */	addi r1, r1, 0x10
/* 8019FAFC 0019CAFC  4E 80 00 20 */	blr 

.global BattleAudienceItemOn
BattleAudienceItemOn:
/* 8019FB00 0019CB00  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8019FB04 0019CB04  7C 08 02 A6 */	mflr r0
/* 8019FB08 0019CB08  90 01 00 24 */	stw r0, 0x24(r1)
/* 8019FB0C 0019CB0C  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 8019FB10 0019CB10  7C 7C 1B 78 */	mr r28, r3
/* 8019FB14 0019CB14  7C 9D 23 78 */	mr r29, r4
/* 8019FB18 0019CB18  7C BE 2B 78 */	mr r30, r5
/* 8019FB1C 0019CB1C  48 00 2B B9 */	bl BattleAudienceBaseGetPtr
/* 8019FB20 0019CB20  7C 7F 1B 78 */	mr r31, r3
/* 8019FB24 0019CB24  7F 83 E3 78 */	mr r3, r28
/* 8019FB28 0019CB28  48 00 2B 71 */	bl BattleAudienceGetPtr
/* 8019FB2C 0019CB2C  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019FB30 0019CB30  7C 7F 1B 78 */	mr r31, r3
/* 8019FB34 0019CB34  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 8019FB38 0019CB38  41 82 00 0C */	beq .L_8019FB44
/* 8019FB3C 0019CB3C  38 60 00 00 */	li r3, 0
/* 8019FB40 0019CB40  48 00 01 A8 */	b .L_8019FCE8
.L_8019FB44:
/* 8019FB44 0019CB44  88 1F 00 1B */	lbz r0, 0x1b(r31)
/* 8019FB48 0019CB48  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 8019FB4C 0019CB4C  38 63 19 24 */	addi r3, r3, lbl_803B1924@l
/* 8019FB50 0019CB50  54 00 28 34 */	slwi r0, r0, 5
/* 8019FB54 0019CB54  7C 63 02 14 */	add r3, r3, r0
/* 8019FB58 0019CB58  80 63 00 08 */	lwz r3, 8(r3)
/* 8019FB5C 0019CB5C  80 03 00 00 */	lwz r0, 0(r3)
/* 8019FB60 0019CB60  2C 00 00 00 */	cmpwi r0, 0
/* 8019FB64 0019CB64  40 82 00 0C */	bne .L_8019FB70
/* 8019FB68 0019CB68  38 60 00 00 */	li r3, 0
/* 8019FB6C 0019CB6C  48 00 01 7C */	b .L_8019FCE8
.L_8019FB70:
/* 8019FB70 0019CB70  57 A0 04 3E */	clrlwi r0, r29, 0x10
/* 8019FB74 0019CB74  28 00 00 79 */	cmplwi r0, 0x79
/* 8019FB78 0019CB78  41 80 00 24 */	blt .L_8019FB9C
/* 8019FB7C 0019CB7C  28 00 00 EC */	cmplwi r0, 0xec
/* 8019FB80 0019CB80  40 80 00 1C */	bge .L_8019FB9C
/* 8019FB84 0019CB84  38 60 00 EB */	li r3, 0xeb
/* 8019FB88 0019CB88  4B EE 4D A1 */	bl swGet
/* 8019FB8C 0019CB8C  2C 03 00 00 */	cmpwi r3, 0
/* 8019FB90 0019CB90  40 82 00 0C */	bne .L_8019FB9C
/* 8019FB94 0019CB94  38 60 00 00 */	li r3, 0
/* 8019FB98 0019CB98  48 00 01 50 */	b .L_8019FCE8
.L_8019FB9C:
/* 8019FB9C 0019CB9C  38 60 00 14 */	li r3, 0x14
/* 8019FBA0 0019CBA0  7C 1C 1B D6 */	divw r0, r28, r3
/* 8019FBA4 0019CBA4  7C 00 19 D6 */	mullw r0, r0, r3
/* 8019FBA8 0019CBA8  7C 00 E0 50 */	subf r0, r0, r28
/* 8019FBAC 0019CBAC  2C 00 00 04 */	cmpwi r0, 4
/* 8019FBB0 0019CBB0  41 80 00 0C */	blt .L_8019FBBC
/* 8019FBB4 0019CBB4  2C 00 00 0F */	cmpwi r0, 0xf
/* 8019FBB8 0019CBB8  40 81 00 0C */	ble .L_8019FBC4
.L_8019FBBC:
/* 8019FBBC 0019CBBC  38 60 00 00 */	li r3, 0
/* 8019FBC0 0019CBC0  48 00 01 28 */	b .L_8019FCE8
.L_8019FBC4:
/* 8019FBC4 0019CBC4  7F 83 E3 78 */	mr r3, r28
/* 8019FBC8 0019CBC8  4B FF CE 4D */	bl BattleAudience_GetExist
/* 8019FBCC 0019CBCC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019FBD0 0019CBD0  40 82 00 0C */	bne .L_8019FBDC
/* 8019FBD4 0019CBD4  38 60 00 00 */	li r3, 0
/* 8019FBD8 0019CBD8  48 00 01 10 */	b .L_8019FCE8
.L_8019FBDC:
/* 8019FBDC 0019CBDC  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 8019FBE0 0019CBE0  28 00 00 07 */	cmplwi r0, 7
/* 8019FBE4 0019CBE4  40 82 00 0C */	bne .L_8019FBF0
/* 8019FBE8 0019CBE8  38 60 00 00 */	li r3, 0
/* 8019FBEC 0019CBEC  48 00 00 FC */	b .L_8019FCE8
.L_8019FBF0:
/* 8019FBF0 0019CBF0  28 00 00 08 */	cmplwi r0, 8
/* 8019FBF4 0019CBF4  40 82 00 0C */	bne .L_8019FC00
/* 8019FBF8 0019CBF8  38 60 00 00 */	li r3, 0
/* 8019FBFC 0019CBFC  48 00 00 EC */	b .L_8019FCE8
.L_8019FC00:
/* 8019FC00 0019CC00  28 00 00 0D */	cmplwi r0, 0xd
/* 8019FC04 0019CC04  40 82 00 0C */	bne .L_8019FC10
/* 8019FC08 0019CC08  38 60 00 00 */	li r3, 0
/* 8019FC0C 0019CC0C  48 00 00 DC */	b .L_8019FCE8
.L_8019FC10:
/* 8019FC10 0019CC10  28 00 00 0C */	cmplwi r0, 0xc
/* 8019FC14 0019CC14  40 82 00 0C */	bne .L_8019FC20
/* 8019FC18 0019CC18  38 60 00 00 */	li r3, 0
/* 8019FC1C 0019CC1C  48 00 00 CC */	b .L_8019FCE8
.L_8019FC20:
/* 8019FC20 0019CC20  28 00 00 0B */	cmplwi r0, 0xb
/* 8019FC24 0019CC24  40 82 00 0C */	bne .L_8019FC30
/* 8019FC28 0019CC28  38 60 00 00 */	li r3, 0
/* 8019FC2C 0019CC2C  48 00 00 BC */	b .L_8019FCE8
.L_8019FC30:
/* 8019FC30 0019CC30  28 00 00 12 */	cmplwi r0, 0x12
/* 8019FC34 0019CC34  40 82 00 0C */	bne .L_8019FC40
/* 8019FC38 0019CC38  38 60 00 00 */	li r3, 0
/* 8019FC3C 0019CC3C  48 00 00 AC */	b .L_8019FCE8
.L_8019FC40:
/* 8019FC40 0019CC40  28 00 00 11 */	cmplwi r0, 0x11
/* 8019FC44 0019CC44  40 82 00 0C */	bne .L_8019FC50
/* 8019FC48 0019CC48  38 60 00 00 */	li r3, 0
/* 8019FC4C 0019CC4C  48 00 00 9C */	b .L_8019FCE8
.L_8019FC50:
/* 8019FC50 0019CC50  28 00 00 15 */	cmplwi r0, 0x15
/* 8019FC54 0019CC54  40 82 00 0C */	bne .L_8019FC60
/* 8019FC58 0019CC58  38 60 00 00 */	li r3, 0
/* 8019FC5C 0019CC5C  48 00 00 8C */	b .L_8019FCE8
.L_8019FC60:
/* 8019FC60 0019CC60  28 00 00 0A */	cmplwi r0, 0xa
/* 8019FC64 0019CC64  40 82 00 0C */	bne .L_8019FC70
/* 8019FC68 0019CC68  38 60 00 00 */	li r3, 0
/* 8019FC6C 0019CC6C  48 00 00 7C */	b .L_8019FCE8
.L_8019FC70:
/* 8019FC70 0019CC70  80 1F 00 00 */	lwz r0, 0(r31)
/* 8019FC74 0019CC74  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8019FC78 0019CC78  41 82 00 6C */	beq .L_8019FCE4
/* 8019FC7C 0019CC7C  3B 60 00 00 */	li r27, 0
/* 8019FC80 0019CC80  38 60 00 00 */	li r3, 0
/* 8019FC84 0019CC84  48 00 29 D5 */	bl BattleAudienceItemGetPtr
/* 8019FC88 0019CC88  7C 66 1B 78 */	mr r6, r3
/* 8019FC8C 0019CC8C  7F C9 03 A6 */	mtctr r30
/* 8019FC90 0019CC90  2C 1E 00 00 */	cmpwi r30, 0
/* 8019FC94 0019CC94  40 81 00 50 */	ble .L_8019FCE4
.L_8019FC98:
/* 8019FC98 0019CC98  80 66 00 00 */	lwz r3, 0(r6)
/* 8019FC9C 0019CC9C  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 8019FCA0 0019CCA0  40 82 00 38 */	bne .L_8019FCD8
/* 8019FCA4 0019CCA4  60 60 00 01 */	ori r0, r3, 1
/* 8019FCA8 0019CCA8  38 A0 00 00 */	li r5, 0
/* 8019FCAC 0019CCAC  90 06 00 00 */	stw r0, 0(r6)
/* 8019FCB0 0019CCB0  57 A0 04 3E */	clrlwi r0, r29, 0x10
/* 8019FCB4 0019CCB4  7F 83 E3 78 */	mr r3, r28
/* 8019FCB8 0019CCB8  38 80 00 07 */	li r4, 7
/* 8019FCBC 0019CCBC  90 A6 00 04 */	stw r5, 4(r6)
/* 8019FCC0 0019CCC0  93 86 00 0C */	stw r28, 0xc(r6)
/* 8019FCC4 0019CCC4  90 06 00 10 */	stw r0, 0x10(r6)
/* 8019FCC8 0019CCC8  4B FF CD B1 */	bl BattleAudience_ChangeStatus
/* 8019FCCC 0019CCCC  B3 7F 00 1C */	sth r27, 0x1c(r31)
/* 8019FCD0 0019CCD0  38 60 00 01 */	li r3, 1
/* 8019FCD4 0019CCD4  48 00 00 14 */	b .L_8019FCE8
.L_8019FCD8:
/* 8019FCD8 0019CCD8  3B 7B 00 01 */	addi r27, r27, 1
/* 8019FCDC 0019CCDC  38 C6 00 48 */	addi r6, r6, 0x48
/* 8019FCE0 0019CCE0  42 00 FF B8 */	bdnz .L_8019FC98
.L_8019FCE4:
/* 8019FCE4 0019CCE4  38 60 00 00 */	li r3, 0
.L_8019FCE8:
/* 8019FCE8 0019CCE8  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 8019FCEC 0019CCEC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8019FCF0 0019CCF0  7C 08 03 A6 */	mtlr r0
/* 8019FCF4 0019CCF4  38 21 00 20 */	addi r1, r1, 0x20
/* 8019FCF8 0019CCF8  4E 80 00 20 */	blr 

.global BattleAudienceCtrlProcess
BattleAudienceCtrlProcess:
/* 8019FCFC 0019CCFC  94 21 FC B0 */	stwu r1, -0x350(r1)
/* 8019FD00 0019CD00  7C 08 02 A6 */	mflr r0
/* 8019FD04 0019CD04  90 01 03 54 */	stw r0, 0x354(r1)
/* 8019FD08 0019CD08  BE E1 03 2C */	stmw r23, 0x32c(r1)
/* 8019FD0C 0019CD0C  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 8019FD10 0019CD10  3F 7E 00 02 */	addis r27, r30, 2
/* 8019FD14 0019CD14  48 00 29 C1 */	bl BattleAudienceBaseGetPtr
/* 8019FD18 0019CD18  7C 7F 1B 78 */	mr r31, r3
/* 8019FD1C 0019CD1C  3B A0 00 00 */	li r29, 0
/* 8019FD20 0019CD20  3F 5F 00 01 */	addis r26, r31, 1
/* 8019FD24 0019CD24  3A E0 00 00 */	li r23, 0
/* 8019FD28 0019CD28  93 BA 37 8C */	stw r29, 0x378c(r26)
/* 8019FD2C 0019CD2C  93 BA 37 88 */	stw r29, 0x3788(r26)
/* 8019FD30 0019CD30  93 BA 37 84 */	stw r29, 0x3784(r26)
.L_8019FD34:
/* 8019FD34 0019CD34  3B 00 00 00 */	li r24, 0
.L_8019FD38:
/* 8019FD38 0019CD38  3B 3D 00 0A */	addi r25, r29, 0xa
/* 8019FD3C 0019CD3C  7F 38 CA 14 */	add r25, r24, r25
/* 8019FD40 0019CD40  7F 23 CB 78 */	mr r3, r25
/* 8019FD44 0019CD44  4B FF CC D1 */	bl BattleAudience_GetExist
/* 8019FD48 0019CD48  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8019FD4C 0019CD4C  28 00 00 01 */	cmplwi r0, 1
/* 8019FD50 0019CD50  40 82 00 2C */	bne .L_8019FD7C
/* 8019FD54 0019CD54  7F 23 CB 78 */	mr r3, r25
/* 8019FD58 0019CD58  48 00 29 41 */	bl BattleAudienceGetPtr
/* 8019FD5C 0019CD5C  88 03 00 19 */	lbz r0, 0x19(r3)
/* 8019FD60 0019CD60  28 00 00 0C */	cmplwi r0, 0xc
/* 8019FD64 0019CD64  41 82 00 18 */	beq .L_8019FD7C
/* 8019FD68 0019CD68  28 00 00 0B */	cmplwi r0, 0xb
/* 8019FD6C 0019CD6C  41 82 00 10 */	beq .L_8019FD7C
/* 8019FD70 0019CD70  80 7A 37 88 */	lwz r3, 0x3788(r26)
/* 8019FD74 0019CD74  38 03 00 01 */	addi r0, r3, 1
/* 8019FD78 0019CD78  90 1A 37 88 */	stw r0, 0x3788(r26)
.L_8019FD7C:
/* 8019FD7C 0019CD7C  3B 18 00 01 */	addi r24, r24, 1
/* 8019FD80 0019CD80  2C 18 00 0A */	cmpwi r24, 0xa
/* 8019FD84 0019CD84  41 80 FF B4 */	blt .L_8019FD38
/* 8019FD88 0019CD88  3A F7 00 01 */	addi r23, r23, 1
/* 8019FD8C 0019CD8C  3B BD 00 14 */	addi r29, r29, 0x14
/* 8019FD90 0019CD90  2C 17 00 0A */	cmpwi r23, 0xa
/* 8019FD94 0019CD94  41 80 FF A0 */	blt .L_8019FD34
/* 8019FD98 0019CD98  3F 5F 00 01 */	addis r26, r31, 1
/* 8019FD9C 0019CD9C  3B 20 00 00 */	li r25, 0
/* 8019FDA0 0019CDA0  3B A0 00 00 */	li r29, 0
.L_8019FDA4:
/* 8019FDA4 0019CDA4  3B 00 00 00 */	li r24, 0
.L_8019FDA8:
/* 8019FDA8 0019CDA8  7E F8 EA 14 */	add r23, r24, r29
/* 8019FDAC 0019CDAC  7E E3 BB 78 */	mr r3, r23
/* 8019FDB0 0019CDB0  4B FF CC 65 */	bl BattleAudience_GetExist
/* 8019FDB4 0019CDB4  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 8019FDB8 0019CDB8  28 00 00 01 */	cmplwi r0, 1
/* 8019FDBC 0019CDBC  40 82 00 2C */	bne .L_8019FDE8
/* 8019FDC0 0019CDC0  7E E3 BB 78 */	mr r3, r23
/* 8019FDC4 0019CDC4  48 00 28 D5 */	bl BattleAudienceGetPtr
/* 8019FDC8 0019CDC8  88 03 00 19 */	lbz r0, 0x19(r3)
/* 8019FDCC 0019CDCC  28 00 00 0C */	cmplwi r0, 0xc
/* 8019FDD0 0019CDD0  41 82 00 18 */	beq .L_8019FDE8
/* 8019FDD4 0019CDD4  28 00 00 0B */	cmplwi r0, 0xb
/* 8019FDD8 0019CDD8  41 82 00 10 */	beq .L_8019FDE8
/* 8019FDDC 0019CDDC  80 7A 37 8C */	lwz r3, 0x378c(r26)
/* 8019FDE0 0019CDE0  38 03 00 01 */	addi r0, r3, 1
/* 8019FDE4 0019CDE4  90 1A 37 8C */	stw r0, 0x378c(r26)
.L_8019FDE8:
/* 8019FDE8 0019CDE8  3B 18 00 01 */	addi r24, r24, 1
/* 8019FDEC 0019CDEC  2C 18 00 0A */	cmpwi r24, 0xa
/* 8019FDF0 0019CDF0  41 80 FF B8 */	blt .L_8019FDA8
/* 8019FDF4 0019CDF4  3B 39 00 01 */	addi r25, r25, 1
/* 8019FDF8 0019CDF8  3B BD 00 14 */	addi r29, r29, 0x14
/* 8019FDFC 0019CDFC  2C 19 00 0A */	cmpwi r25, 0xa
/* 8019FE00 0019CE00  41 80 FF A4 */	blt .L_8019FDA4
/* 8019FE04 0019CE04  3C BF 00 01 */	addis r5, r31, 1
/* 8019FE08 0019CE08  3B A0 00 00 */	li r29, 0
/* 8019FE0C 0019CE0C  80 85 37 88 */	lwz r4, 0x3788(r5)
/* 8019FE10 0019CE10  38 60 00 00 */	li r3, 0
/* 8019FE14 0019CE14  80 05 37 8C */	lwz r0, 0x378c(r5)
/* 8019FE18 0019CE18  7C 04 02 14 */	add r0, r4, r0
/* 8019FE1C 0019CE1C  90 05 37 84 */	stw r0, 0x3784(r5)
/* 8019FE20 0019CE20  48 00 28 79 */	bl BattleAudienceGetPtr
/* 8019FE24 0019CE24  7C 77 1B 78 */	mr r23, r3
.L_8019FE28:
/* 8019FE28 0019CE28  80 17 00 00 */	lwz r0, 0(r23)
/* 8019FE2C 0019CE2C  54 00 06 F7 */	rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 8019FE30 0019CE30  41 82 00 48 */	beq .L_8019FE78
/* 8019FE34 0019CE34  C0 57 00 D0 */	lfs f2, 0xd0(r23)
/* 8019FE38 0019CE38  C0 37 00 DC */	lfs f1, 0xdc(r23)
/* 8019FE3C 0019CE3C  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 8019FE40 0019CE40  EC 22 08 2A */	fadds f1, f2, f1
/* 8019FE44 0019CE44  D0 37 00 D0 */	stfs f1, 0xd0(r23)
/* 8019FE48 0019CE48  C0 57 00 DC */	lfs f2, 0xdc(r23)
/* 8019FE4C 0019CE4C  C0 37 00 E4 */	lfs f1, 0xe4(r23)
/* 8019FE50 0019CE50  EC 22 08 2A */	fadds f1, f2, f1
/* 8019FE54 0019CE54  D0 37 00 DC */	stfs f1, 0xdc(r23)
/* 8019FE58 0019CE58  C0 37 00 D0 */	lfs f1, 0xd0(r23)
/* 8019FE5C 0019CE5C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8019FE60 0019CE60  4C 40 13 82 */	cror 2, 0, 2
/* 8019FE64 0019CE64  40 82 00 E0 */	bne .L_8019FF44
/* 8019FE68 0019CE68  D0 17 00 D0 */	stfs f0, 0xd0(r23)
/* 8019FE6C 0019CE6C  D0 17 00 DC */	stfs f0, 0xdc(r23)
/* 8019FE70 0019CE70  D0 17 00 E4 */	stfs f0, 0xe4(r23)
/* 8019FE74 0019CE74  48 00 00 D0 */	b .L_8019FF44
.L_8019FE78:
/* 8019FE78 0019CE78  7F A3 EB 78 */	mr r3, r29
/* 8019FE7C 0019CE7C  4B FF CB 99 */	bl BattleAudience_GetExist
/* 8019FE80 0019CE80  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 8019FE84 0019CE84  41 82 00 C0 */	beq .L_8019FF44
/* 8019FE88 0019CE88  88 17 00 1B */	lbz r0, 0x1b(r23)
/* 8019FE8C 0019CE8C  28 00 00 0C */	cmplwi r0, 0xc
/* 8019FE90 0019CE90  41 81 00 B4 */	bgt .L_8019FF44
/* 8019FE94 0019CE94  3C 60 80 3A */	lis r3, lbl_80399DB4@ha
/* 8019FE98 0019CE98  54 00 10 3A */	slwi r0, r0, 2
/* 8019FE9C 0019CE9C  38 63 9D B4 */	addi r3, r3, lbl_80399DB4@l
/* 8019FEA0 0019CEA0  7C 03 00 2E */	lwzx r0, r3, r0
/* 8019FEA4 0019CEA4  7C 09 03 A6 */	mtctr r0
/* 8019FEA8 0019CEA8  4E 80 04 20 */	bctr 
/* 8019FEAC 0019CEAC  7F A3 EB 78 */	mr r3, r29
/* 8019FEB0 0019CEB0  4B FE CD FD */	bl BattleAudienceCtrlProcessKinopio
/* 8019FEB4 0019CEB4  48 00 00 90 */	b .L_8019FF44
/* 8019FEB8 0019CEB8  7F A3 EB 78 */	mr r3, r29
/* 8019FEBC 0019CEBC  4B FE CD F1 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FEC0 0019CEC0  48 00 00 84 */	b .L_8019FF44
/* 8019FEC4 0019CEC4  7F A3 EB 78 */	mr r3, r29
/* 8019FEC8 0019CEC8  4B FE CD E5 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FECC 0019CECC  48 00 00 78 */	b .L_8019FF44
/* 8019FED0 0019CED0  7F A3 EB 78 */	mr r3, r29
/* 8019FED4 0019CED4  4B FE CD D9 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FED8 0019CED8  48 00 00 6C */	b .L_8019FF44
/* 8019FEDC 0019CEDC  7F A3 EB 78 */	mr r3, r29
/* 8019FEE0 0019CEE0  4B FE CD CD */	bl BattleAudienceCtrlProcessKinopio
/* 8019FEE4 0019CEE4  48 00 00 60 */	b .L_8019FF44
/* 8019FEE8 0019CEE8  7F A3 EB 78 */	mr r3, r29
/* 8019FEEC 0019CEEC  4B FE CD C1 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FEF0 0019CEF0  48 00 00 54 */	b .L_8019FF44
/* 8019FEF4 0019CEF4  7F A3 EB 78 */	mr r3, r29
/* 8019FEF8 0019CEF8  4B FE CD B5 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FEFC 0019CEFC  48 00 00 48 */	b .L_8019FF44
/* 8019FF00 0019CF00  7F A3 EB 78 */	mr r3, r29
/* 8019FF04 0019CF04  4B FE CD A9 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FF08 0019CF08  48 00 00 3C */	b .L_8019FF44
/* 8019FF0C 0019CF0C  7F A3 EB 78 */	mr r3, r29
/* 8019FF10 0019CF10  4B FE CD 9D */	bl BattleAudienceCtrlProcessKinopio
/* 8019FF14 0019CF14  48 00 00 30 */	b .L_8019FF44
/* 8019FF18 0019CF18  7F A3 EB 78 */	mr r3, r29
/* 8019FF1C 0019CF1C  4B FE CD 91 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FF20 0019CF20  48 00 00 24 */	b .L_8019FF44
/* 8019FF24 0019CF24  7F A3 EB 78 */	mr r3, r29
/* 8019FF28 0019CF28  4B FE CD 85 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FF2C 0019CF2C  48 00 00 18 */	b .L_8019FF44
/* 8019FF30 0019CF30  7F A3 EB 78 */	mr r3, r29
/* 8019FF34 0019CF34  4B FE CD 79 */	bl BattleAudienceCtrlProcessKinopio
/* 8019FF38 0019CF38  48 00 00 0C */	b .L_8019FF44
/* 8019FF3C 0019CF3C  7F A3 EB 78 */	mr r3, r29
/* 8019FF40 0019CF40  4B FE CD 6D */	bl BattleAudienceCtrlProcessKinopio
.L_8019FF44:
/* 8019FF44 0019CF44  3B BD 00 01 */	addi r29, r29, 1
/* 8019FF48 0019CF48  3A F7 01 34 */	addi r23, r23, 0x134
/* 8019FF4C 0019CF4C  2C 1D 00 C8 */	cmpwi r29, 0xc8
/* 8019FF50 0019CF50  41 80 FE D8 */	blt .L_8019FE28
/* 8019FF54 0019CF54  80 1B 90 68 */	lwz r0, -0x6f98(r27)
/* 8019FF58 0019CF58  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 8019FF5C 0019CF5C  41 82 00 10 */	beq .L_8019FF6C
/* 8019FF60 0019CF60  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FF64 0019CF64  38 00 27 10 */	li r0, 0x2710
/* 8019FF68 0019CF68  90 03 37 F4 */	stw r0, 0x37f4(r3)
.L_8019FF6C:
/* 8019FF6C 0019CF6C  80 1E 0E F4 */	lwz r0, 0xef4(r30)
/* 8019FF70 0019CF70  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 8019FF74 0019CF74  41 82 01 1C */	beq .L_801A0090
/* 8019FF78 0019CF78  3C 7F 00 01 */	addis r3, r31, 1
/* 8019FF7C 0019CF7C  80 83 37 F0 */	lwz r4, 0x37f0(r3)
/* 8019FF80 0019CF80  80 03 37 F4 */	lwz r0, 0x37f4(r3)
/* 8019FF84 0019CF84  7C 04 00 00 */	cmpw r4, r0
/* 8019FF88 0019CF88  40 80 01 08 */	bge .L_801A0090
/* 8019FF8C 0019CF8C  2C 04 00 01 */	cmpwi r4, 1
/* 8019FF90 0019CF90  41 82 00 28 */	beq .L_8019FFB8
/* 8019FF94 0019CF94  40 80 00 10 */	bge .L_8019FFA4
/* 8019FF98 0019CF98  2C 04 00 00 */	cmpwi r4, 0
/* 8019FF9C 0019CF9C  40 80 00 14 */	bge .L_8019FFB0
/* 8019FFA0 0019CFA0  48 00 00 24 */	b .L_8019FFC4
.L_8019FFA4:
/* 8019FFA4 0019CFA4  2C 04 00 03 */	cmpwi r4, 3
/* 8019FFA8 0019CFA8  40 80 00 1C */	bge .L_8019FFC4
/* 8019FFAC 0019CFAC  48 00 00 14 */	b .L_8019FFC0
.L_8019FFB0:
/* 8019FFB0 0019CFB0  3B 80 07 08 */	li r28, 0x708
/* 8019FFB4 0019CFB4  48 00 00 10 */	b .L_8019FFC4
.L_8019FFB8:
/* 8019FFB8 0019CFB8  3B 80 17 70 */	li r28, 0x1770
/* 8019FFBC 0019CFBC  48 00 00 08 */	b .L_8019FFC4
.L_8019FFC0:
/* 8019FFC0 0019CFC0  3B 80 75 30 */	li r28, 0x7530
.L_8019FFC4:
/* 8019FFC4 0019CFC4  80 1B 90 68 */	lwz r0, -0x6f98(r27)
/* 8019FFC8 0019CFC8  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 8019FFCC 0019CFCC  41 82 00 08 */	beq .L_8019FFD4
/* 8019FFD0 0019CFD0  3B 80 00 3C */	li r28, 0x3c
.L_8019FFD4:
/* 8019FFD4 0019CFD4  7F 83 E3 78 */	mr r3, r28
/* 8019FFD8 0019CFD8  4B E6 5E ED */	bl irand
/* 8019FFDC 0019CFDC  2C 03 00 00 */	cmpwi r3, 0
/* 8019FFE0 0019CFE0  40 82 00 B0 */	bne .L_801A0090
/* 8019FFE4 0019CFE4  38 00 00 C8 */	li r0, 0xc8
/* 8019FFE8 0019CFE8  38 81 00 08 */	addi r4, r1, 8
/* 8019FFEC 0019CFEC  38 A0 00 00 */	li r5, 0
/* 8019FFF0 0019CFF0  38 60 00 00 */	li r3, 0
/* 8019FFF4 0019CFF4  7C 09 03 A6 */	mtctr r0
.L_8019FFF8:
/* 8019FFF8 0019CFF8  7C A4 19 2E */	stwx r5, r4, r3
/* 8019FFFC 0019CFFC  38 A5 00 01 */	addi r5, r5, 1
/* 801A0000 0019D000  38 63 00 04 */	addi r3, r3, 4
/* 801A0004 0019D004  42 00 FF F4 */	bdnz .L_8019FFF8
/* 801A0008 0019D008  3B 80 00 00 */	li r28, 0
/* 801A000C 0019D00C  3B 41 00 08 */	addi r26, r1, 8
.L_801A0010:
/* 801A0010 0019D010  38 60 00 C8 */	li r3, 0xc8
/* 801A0014 0019D014  4B E6 5E B1 */	bl irand
/* 801A0018 0019D018  7C 7B 1B 78 */	mr r27, r3
/* 801A001C 0019D01C  38 60 00 C8 */	li r3, 0xc8
/* 801A0020 0019D020  4B E6 5E A5 */	bl irand
/* 801A0024 0019D024  57 64 10 3A */	slwi r4, r27, 2
/* 801A0028 0019D028  54 63 10 3A */	slwi r3, r3, 2
/* 801A002C 0019D02C  7C BA 20 2E */	lwzx r5, r26, r4
/* 801A0030 0019D030  3B 9C 00 01 */	addi r28, r28, 1
/* 801A0034 0019D034  7C 1A 18 2E */	lwzx r0, r26, r3
/* 801A0038 0019D038  2C 1C 03 E8 */	cmpwi r28, 0x3e8
/* 801A003C 0019D03C  7C 1A 21 2E */	stwx r0, r26, r4
/* 801A0040 0019D040  7C BA 19 2E */	stwx r5, r26, r3
/* 801A0044 0019D044  41 80 FF CC */	blt .L_801A0010
/* 801A0048 0019D048  3B 81 00 08 */	addi r28, r1, 8
/* 801A004C 0019D04C  3B 40 00 00 */	li r26, 0
/* 801A0050 0019D050  3B 60 00 00 */	li r27, 0
.L_801A0054:
/* 801A0054 0019D054  7C 7C D8 2E */	lwzx r3, r28, r27
/* 801A0058 0019D058  38 80 00 00 */	li r4, 0
/* 801A005C 0019D05C  38 A0 00 01 */	li r5, 1
/* 801A0060 0019D060  4B FF FA A1 */	bl BattleAudienceItemOn
/* 801A0064 0019D064  2C 03 00 01 */	cmpwi r3, 1
/* 801A0068 0019D068  40 82 00 18 */	bne .L_801A0080
/* 801A006C 0019D06C  3C 9F 00 01 */	addis r4, r31, 1
/* 801A0070 0019D070  80 64 37 F0 */	lwz r3, 0x37f0(r4)
/* 801A0074 0019D074  38 03 00 01 */	addi r0, r3, 1
/* 801A0078 0019D078  90 04 37 F0 */	stw r0, 0x37f0(r4)
/* 801A007C 0019D07C  48 00 00 14 */	b .L_801A0090
.L_801A0080:
/* 801A0080 0019D080  3B 5A 00 01 */	addi r26, r26, 1
/* 801A0084 0019D084  3B 7B 00 04 */	addi r27, r27, 4
/* 801A0088 0019D088  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 801A008C 0019D08C  41 80 FF C8 */	blt .L_801A0054
.L_801A0090:
/* 801A0090 0019D090  BA E1 03 2C */	lmw r23, 0x32c(r1)
/* 801A0094 0019D094  80 01 03 54 */	lwz r0, 0x354(r1)
/* 801A0098 0019D098  7C 08 03 A6 */	mtlr r0
/* 801A009C 0019D09C  38 21 03 50 */	addi r1, r1, 0x350
/* 801A00A0 0019D0A0  4E 80 00 20 */	blr 

.global BattleAudienceGuestTPLRead
BattleAudienceGuestTPLRead:
/* 801A00A4 0019D0A4  94 21 FE E0 */	stwu r1, -0x120(r1)
/* 801A00A8 0019D0A8  7C 08 02 A6 */	mflr r0
/* 801A00AC 0019D0AC  90 01 01 24 */	stw r0, 0x124(r1)
/* 801A00B0 0019D0B0  BF 81 01 10 */	stmw r28, 0x110(r1)
/* 801A00B4 0019D0B4  7C 7C 1B 78 */	mr r28, r3
/* 801A00B8 0019D0B8  7C 9D 23 78 */	mr r29, r4
/* 801A00BC 0019D0BC  7C BE 2B 78 */	mr r30, r5
/* 801A00C0 0019D0C0  48 00 26 15 */	bl BattleAudienceBaseGetPtr
/* 801A00C4 0019D0C4  2C 1C 00 02 */	cmpwi r28, 2
/* 801A00C8 0019D0C8  7C 7F 1B 78 */	mr r31, r3
/* 801A00CC 0019D0CC  40 80 00 38 */	bge .L_801A0104
/* 801A00D0 0019D0D0  3C 60 80 30 */	lis r3, lbl_802F9DD4@ha
/* 801A00D4 0019D0D4  7F C5 F3 78 */	mr r5, r30
/* 801A00D8 0019D0D8  38 83 9D D4 */	addi r4, r3, lbl_802F9DD4@l
/* 801A00DC 0019D0DC  38 61 00 08 */	addi r3, r1, 8
/* 801A00E0 0019D0E0  4C C6 31 82 */	crclr 6
/* 801A00E4 0019D0E4  48 0C 40 25 */	bl sprintf
/* 801A00E8 0019D0E8  38 61 00 08 */	addi r3, r1, 8
/* 801A00EC 0019D0EC  48 00 25 F5 */	bl tplRead
/* 801A00F0 0019D0F0  57 80 10 3A */	slwi r0, r28, 2
/* 801A00F4 0019D0F4  7C 9F E2 14 */	add r4, r31, r28
/* 801A00F8 0019D0F8  7C BF 02 14 */	add r5, r31, r0
/* 801A00FC 0019D0FC  90 65 00 10 */	stw r3, 0x10(r5)
/* 801A0100 0019D100  9B A4 00 18 */	stb r29, 0x18(r4)
.L_801A0104:
/* 801A0104 0019D104  BB 81 01 10 */	lmw r28, 0x110(r1)
/* 801A0108 0019D108  80 01 01 24 */	lwz r0, 0x124(r1)
/* 801A010C 0019D10C  7C 08 03 A6 */	mtlr r0
/* 801A0110 0019D110  38 21 01 20 */	addi r1, r1, 0x120
/* 801A0114 0019D114  4E 80 00 20 */	blr 

.global BattleAudienceSettingAudience
BattleAudienceSettingAudience:
/* 801A0118 0019D118  94 21 FA B0 */	stwu r1, -0x550(r1)
/* 801A011C 0019D11C  7C 08 02 A6 */	mflr r0
/* 801A0120 0019D120  90 01 05 54 */	stw r0, 0x554(r1)
/* 801A0124 0019D124  DB E1 05 40 */	stfd f31, 0x540(r1)
/* 801A0128 0019D128  F3 E1 05 48 */	psq_st f31, 1352(r1), 0, qr0
/* 801A012C 0019D12C  DB C1 05 30 */	stfd f30, 0x530(r1)
/* 801A0130 0019D130  F3 C1 05 38 */	psq_st f30, 1336(r1), 0, qr0
/* 801A0134 0019D134  BE 81 05 00 */	stmw r20, 0x500(r1)
/* 801A0138 0019D138  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 801A013C 0019D13C  3F 23 00 02 */	addis r25, r3, 2
/* 801A0140 0019D140  48 00 25 95 */	bl BattleAudienceBaseGetPtr
/* 801A0144 0019D144  80 8D 17 10 */	lwz r4, lbl_80418970@sda21(r13)
/* 801A0148 0019D148  7C 7E 1B 78 */	mr r30, r3
/* 801A014C 0019D14C  80 64 27 38 */	lwz r3, 0x2738(r4)
/* 801A0150 0019D150  80 63 00 0C */	lwz r3, 0xc(r3)
/* 801A0154 0019D154  3B 03 00 AC */	addi r24, r3, 0xac
/* 801A0158 0019D158  4B F3 1B 1D */	bl func_800D1C74
/* 801A015C 0019D15C  3C 80 80 30 */	lis r4, lbl_802F95FC@ha
/* 801A0160 0019D160  38 00 00 20 */	li r0, 0x20
/* 801A0164 0019D164  38 84 95 FC */	addi r4, r4, lbl_802F95FC@l
/* 801A0168 0019D168  7C 7F 1B 78 */	mr r31, r3
/* 801A016C 0019D16C  38 A1 00 C4 */	addi r5, r1, 0xc4
/* 801A0170 0019D170  38 84 FF FC */	addi r4, r4, -4
/* 801A0174 0019D174  7C 09 03 A6 */	mtctr r0
.L_801A0178:
/* 801A0178 0019D178  80 64 00 04 */	lwz r3, 4(r4)
/* 801A017C 0019D17C  84 04 00 08 */	lwzu r0, 8(r4)
/* 801A0180 0019D180  90 65 00 04 */	stw r3, 4(r5)
/* 801A0184 0019D184  94 05 00 08 */	stwu r0, 8(r5)
/* 801A0188 0019D188  42 00 FF F0 */	bdnz .L_801A0178
/* 801A018C 0019D18C  80 04 00 04 */	lwz r0, 4(r4)
/* 801A0190 0019D190  90 05 00 04 */	stw r0, 4(r5)
/* 801A0194 0019D194  A8 1F 00 88 */	lha r0, 0x88(r31)
/* 801A0198 0019D198  2C 00 00 02 */	cmpwi r0, 2
/* 801A019C 0019D19C  41 82 00 44 */	beq .L_801A01E0
/* 801A01A0 0019D1A0  40 80 00 14 */	bge .L_801A01B4
/* 801A01A4 0019D1A4  2C 00 00 00 */	cmpwi r0, 0
/* 801A01A8 0019D1A8  41 82 00 18 */	beq .L_801A01C0
/* 801A01AC 0019D1AC  40 80 00 24 */	bge .L_801A01D0
/* 801A01B0 0019D1B0  48 00 00 4C */	b .L_801A01FC
.L_801A01B4:
/* 801A01B4 0019D1B4  2C 00 00 04 */	cmpwi r0, 4
/* 801A01B8 0019D1B8  40 80 00 44 */	bge .L_801A01FC
/* 801A01BC 0019D1BC  48 00 00 34 */	b .L_801A01F0
.L_801A01C0:
/* 801A01C0 0019D1C0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A01C4 0019D1C4  38 00 00 32 */	li r0, 0x32
/* 801A01C8 0019D1C8  90 03 37 90 */	stw r0, 0x3790(r3)
/* 801A01CC 0019D1CC  48 00 00 30 */	b .L_801A01FC
.L_801A01D0:
/* 801A01D0 0019D1D0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A01D4 0019D1D4  38 00 00 64 */	li r0, 0x64
/* 801A01D8 0019D1D8  90 03 37 90 */	stw r0, 0x3790(r3)
/* 801A01DC 0019D1DC  48 00 00 20 */	b .L_801A01FC
.L_801A01E0:
/* 801A01E0 0019D1E0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A01E4 0019D1E4  38 00 00 96 */	li r0, 0x96
/* 801A01E8 0019D1E8  90 03 37 90 */	stw r0, 0x3790(r3)
/* 801A01EC 0019D1EC  48 00 00 10 */	b .L_801A01FC
.L_801A01F0:
/* 801A01F0 0019D1F0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A01F4 0019D1F4  38 00 00 C8 */	li r0, 0xc8
/* 801A01F8 0019D1F8  90 03 37 90 */	stw r0, 0x3790(r3)
.L_801A01FC:
/* 801A01FC 0019D1FC  4B F3 1A 79 */	bl func_800D1C74
/* 801A0200 0019D200  A0 03 00 8C */	lhz r0, 0x8c(r3)
/* 801A0204 0019D204  28 00 00 00 */	cmplwi r0, 0
/* 801A0208 0019D208  40 82 00 10 */	bne .L_801A0218
/* 801A020C 0019D20C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0210 0019D210  38 00 00 00 */	li r0, 0
/* 801A0214 0019D214  90 03 37 90 */	stw r0, 0x3790(r3)
.L_801A0218:
/* 801A0218 0019D218  A8 7F 00 8A */	lha r3, 0x8a(r31)
/* 801A021C 0019D21C  38 00 00 40 */	li r0, 0x40
/* 801A0220 0019D220  38 63 FF FF */	addi r3, r3, -1
/* 801A0224 0019D224  2C 03 00 41 */	cmpwi r3, 0x41
/* 801A0228 0019D228  40 80 00 08 */	bge .L_801A0230
/* 801A022C 0019D22C  7C 60 1B 78 */	mr r0, r3
.L_801A0230:
/* 801A0230 0019D230  54 00 10 3A */	slwi r0, r0, 2
/* 801A0234 0019D234  38 61 00 C8 */	addi r3, r1, 0xc8
/* 801A0238 0019D238  7C 03 04 2E */	lfsx f0, r3, r0
/* 801A023C 0019D23C  3C BE 00 01 */	addis r5, r30, 1
/* 801A0240 0019D240  D0 05 37 78 */	stfs f0, 0x3778(r5)
/* 801A0244 0019D244  80 19 90 68 */	lwz r0, -0x6f98(r25)
/* 801A0248 0019D248  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 801A024C 0019D24C  41 82 00 68 */	beq .L_801A02B4
/* 801A0250 0019D250  80 19 90 74 */	lwz r0, -0x6f8c(r25)
/* 801A0254 0019D254  3C 60 43 30 */	lis r3, 0x4330
/* 801A0258 0019D258  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 801A025C 0019D25C  90 61 04 F0 */	stw r3, 0x4f0(r1)
/* 801A0260 0019D260  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801A0264 0019D264  C8 44 9A 00 */	lfd f2, lbl_802F9A00@l(r4)
/* 801A0268 0019D268  90 01 04 F4 */	stw r0, 0x4f4(r1)
/* 801A026C 0019D26C  C8 01 04 F0 */	lfd f0, 0x4f0(r1)
/* 801A0270 0019D270  90 61 04 F8 */	stw r3, 0x4f8(r1)
/* 801A0274 0019D274  EC 00 10 28 */	fsubs f0, f0, f2
/* 801A0278 0019D278  D0 05 37 7C */	stfs f0, 0x377c(r5)
/* 801A027C 0019D27C  80 05 37 90 */	lwz r0, 0x3790(r5)
/* 801A0280 0019D280  C0 25 37 7C */	lfs f1, 0x377c(r5)
/* 801A0284 0019D284  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801A0288 0019D288  90 01 04 FC */	stw r0, 0x4fc(r1)
/* 801A028C 0019D28C  C8 01 04 F8 */	lfd f0, 0x4f8(r1)
/* 801A0290 0019D290  EC 00 10 28 */	fsubs f0, f0, f2
/* 801A0294 0019D294  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 801A0298 0019D298  40 81 00 80 */	ble .L_801A0318
/* 801A029C 0019D29C  90 01 04 FC */	stw r0, 0x4fc(r1)
/* 801A02A0 0019D2A0  90 61 04 F8 */	stw r3, 0x4f8(r1)
/* 801A02A4 0019D2A4  C8 01 04 F8 */	lfd f0, 0x4f8(r1)
/* 801A02A8 0019D2A8  EC 00 10 28 */	fsubs f0, f0, f2
/* 801A02AC 0019D2AC  D0 05 37 7C */	stfs f0, 0x377c(r5)
/* 801A02B0 0019D2B0  48 00 00 68 */	b .L_801A0318
.L_801A02B4:
/* 801A02B4 0019D2B4  4B F2 F7 AD */	bl pouchGetAudienceNum
/* 801A02B8 0019D2B8  FF C0 08 90 */	fmr f30, f1
/* 801A02BC 0019D2BC  38 60 00 0A */	li r3, 0xa
/* 801A02C0 0019D2C0  4B E6 5C 05 */	bl irand
/* 801A02C4 0019D2C4  7C 77 1B 78 */	mr r23, r3
/* 801A02C8 0019D2C8  38 60 00 0A */	li r3, 0xa
/* 801A02CC 0019D2CC  4B E6 5B F9 */	bl irand
/* 801A02D0 0019D2D0  7C 63 BA 14 */	add r3, r3, r23
/* 801A02D4 0019D2D4  3C 00 43 30 */	lis r0, 0x4330
/* 801A02D8 0019D2D8  38 63 FF F3 */	addi r3, r3, -13
/* 801A02DC 0019D2DC  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 801A02E0 0019D2E0  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801A02E4 0019D2E4  90 01 04 F8 */	stw r0, 0x4f8(r1)
/* 801A02E8 0019D2E8  C8 24 9A 00 */	lfd f1, lbl_802F9A00@l(r4)
/* 801A02EC 0019D2EC  90 61 04 FC */	stw r3, 0x4fc(r1)
/* 801A02F0 0019D2F0  C8 01 04 F8 */	lfd f0, 0x4f8(r1)
/* 801A02F4 0019D2F4  EF E0 08 28 */	fsubs f31, f0, f1
/* 801A02F8 0019D2F8  4B F2 F7 69 */	bl pouchGetAudienceNum
/* 801A02FC 0019D2FC  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0300 0019D300  C0 02 D2 A8 */	lfs f0, lbl_8041E628@sda21(r2)
/* 801A0304 0019D304  C0 43 37 78 */	lfs f2, 0x3778(r3)
/* 801A0308 0019D308  EC 21 10 28 */	fsubs f1, f1, f2
/* 801A030C 0019D30C  EC 21 07 F2 */	fmuls f1, f1, f31
/* 801A0310 0019D310  EC 00 F0 7A */	fmadds f0, f0, f1, f30
/* 801A0314 0019D314  D0 03 37 7C */	stfs f0, 0x377c(r3)
.L_801A0318:
/* 801A0318 0019D318  80 18 00 00 */	lwz r0, 0(r24)
/* 801A031C 0019D31C  2C 00 00 04 */	cmpwi r0, 4
/* 801A0320 0019D320  41 82 00 38 */	beq .L_801A0358
/* 801A0324 0019D324  40 80 00 18 */	bge .L_801A033C
/* 801A0328 0019D328  2C 00 00 02 */	cmpwi r0, 2
/* 801A032C 0019D32C  40 80 00 44 */	bge .L_801A0370
/* 801A0330 0019D330  2C 00 00 00 */	cmpwi r0, 0
/* 801A0334 0019D334  40 80 00 14 */	bge .L_801A0348
/* 801A0338 0019D338  48 00 00 6C */	b .L_801A03A4
.L_801A033C:
/* 801A033C 0019D33C  2C 00 00 07 */	cmpwi r0, 7
/* 801A0340 0019D340  40 80 00 64 */	bge .L_801A03A4
/* 801A0344 0019D344  48 00 00 2C */	b .L_801A0370
.L_801A0348:
/* 801A0348 0019D348  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 801A034C 0019D34C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0350 0019D350  D0 03 37 80 */	stfs f0, 0x3780(r3)
/* 801A0354 0019D354  48 00 00 50 */	b .L_801A03A4
.L_801A0358:
/* 801A0358 0019D358  3C 7E 00 01 */	addis r3, r30, 1
/* 801A035C 0019D35C  C0 22 D3 88 */	lfs f1, lbl_8041E708@sda21(r2)
/* 801A0360 0019D360  C0 03 37 7C */	lfs f0, 0x377c(r3)
/* 801A0364 0019D364  EC 01 00 32 */	fmuls f0, f1, f0
/* 801A0368 0019D368  D0 03 37 80 */	stfs f0, 0x3780(r3)
/* 801A036C 0019D36C  48 00 00 38 */	b .L_801A03A4
.L_801A0370:
/* 801A0370 0019D370  3C BE 00 01 */	addis r5, r30, 1
/* 801A0374 0019D374  3C 00 43 30 */	lis r0, 0x4330
/* 801A0378 0019D378  80 85 37 90 */	lwz r4, 0x3790(r5)
/* 801A037C 0019D37C  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 801A0380 0019D380  90 01 04 F8 */	stw r0, 0x4f8(r1)
/* 801A0384 0019D384  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 801A0388 0019D388  C8 43 9A 00 */	lfd f2, lbl_802F9A00@l(r3)
/* 801A038C 0019D38C  90 01 04 FC */	stw r0, 0x4fc(r1)
/* 801A0390 0019D390  C0 05 37 7C */	lfs f0, 0x377c(r5)
/* 801A0394 0019D394  C8 21 04 F8 */	lfd f1, 0x4f8(r1)
/* 801A0398 0019D398  EC 21 10 28 */	fsubs f1, f1, f2
/* 801A039C 0019D39C  EC 01 00 28 */	fsubs f0, f1, f0
/* 801A03A0 0019D3A0  D0 05 37 80 */	stfs f0, 0x3780(r5)
.L_801A03A4:
/* 801A03A4 0019D3A4  80 18 00 00 */	lwz r0, 0(r24)
/* 801A03A8 0019D3A8  2C 00 00 05 */	cmpwi r0, 5
/* 801A03AC 0019D3AC  41 82 00 6C */	beq .L_801A0418
/* 801A03B0 0019D3B0  40 80 00 10 */	bge .L_801A03C0
/* 801A03B4 0019D3B4  2C 00 00 02 */	cmpwi r0, 2
/* 801A03B8 0019D3B8  41 82 00 14 */	beq .L_801A03CC
/* 801A03BC 0019D3BC  48 00 00 F0 */	b .L_801A04AC
.L_801A03C0:
/* 801A03C0 0019D3C0  2C 00 00 07 */	cmpwi r0, 7
/* 801A03C4 0019D3C4  40 80 00 E8 */	bge .L_801A04AC
/* 801A03C8 0019D3C8  48 00 00 94 */	b .L_801A045C
.L_801A03CC:
/* 801A03CC 0019D3CC  38 60 00 00 */	li r3, 0
/* 801A03D0 0019D3D0  38 00 00 0C */	li r0, 0xc
/* 801A03D4 0019D3D4  7C 64 1B 78 */	mr r4, r3
/* 801A03D8 0019D3D8  38 A1 00 68 */	addi r5, r1, 0x68
/* 801A03DC 0019D3DC  38 E0 00 00 */	li r7, 0
/* 801A03E0 0019D3E0  38 C0 00 01 */	li r6, 1
/* 801A03E4 0019D3E4  7C 09 03 A6 */	mtctr r0
.L_801A03E8:
/* 801A03E8 0019D3E8  2C 07 00 01 */	cmpwi r7, 1
/* 801A03EC 0019D3EC  41 82 00 0C */	beq .L_801A03F8
/* 801A03F0 0019D3F0  2C 07 00 07 */	cmpwi r7, 7
/* 801A03F4 0019D3F4  40 82 00 0C */	bne .L_801A0400
.L_801A03F8:
/* 801A03F8 0019D3F8  7C C5 19 2E */	stwx r6, r5, r3
/* 801A03FC 0019D3FC  48 00 00 08 */	b .L_801A0404
.L_801A0400:
/* 801A0400 0019D400  7C 85 19 2E */	stwx r4, r5, r3
.L_801A0404:
/* 801A0404 0019D404  38 E7 00 01 */	addi r7, r7, 1
/* 801A0408 0019D408  38 63 00 04 */	addi r3, r3, 4
/* 801A040C 0019D40C  42 00 FF DC */	bdnz .L_801A03E8
/* 801A0410 0019D410  3B A0 00 00 */	li r29, 0
/* 801A0414 0019D414  48 00 02 F4 */	b .L_801A0708
.L_801A0418:
/* 801A0418 0019D418  38 E0 00 00 */	li r7, 0
/* 801A041C 0019D41C  38 00 00 0C */	li r0, 0xc
/* 801A0420 0019D420  7C E4 3B 78 */	mr r4, r7
/* 801A0424 0019D424  38 A1 00 68 */	addi r5, r1, 0x68
/* 801A0428 0019D428  38 60 00 00 */	li r3, 0
/* 801A042C 0019D42C  38 C0 00 01 */	li r6, 1
/* 801A0430 0019D430  7C 09 03 A6 */	mtctr r0
.L_801A0434:
/* 801A0434 0019D434  2C 07 00 01 */	cmpwi r7, 1
/* 801A0438 0019D438  40 82 00 0C */	bne .L_801A0444
/* 801A043C 0019D43C  7C C5 19 2E */	stwx r6, r5, r3
/* 801A0440 0019D440  48 00 00 08 */	b .L_801A0448
.L_801A0444:
/* 801A0444 0019D444  7C 85 19 2E */	stwx r4, r5, r3
.L_801A0448:
/* 801A0448 0019D448  38 E7 00 01 */	addi r7, r7, 1
/* 801A044C 0019D44C  38 63 00 04 */	addi r3, r3, 4
/* 801A0450 0019D450  42 00 FF E4 */	bdnz .L_801A0434
/* 801A0454 0019D454  3B A0 00 00 */	li r29, 0
/* 801A0458 0019D458  48 00 02 B0 */	b .L_801A0708
.L_801A045C:
/* 801A045C 0019D45C  3C 60 80 3B */	lis r3, lbl_803B1924@ha
/* 801A0460 0019D460  38 00 00 0C */	li r0, 0xc
/* 801A0464 0019D464  39 03 19 24 */	addi r8, r3, lbl_803B1924@l
/* 801A0468 0019D468  38 C1 00 68 */	addi r6, r1, 0x68
/* 801A046C 0019D46C  38 60 00 00 */	li r3, 0
/* 801A0470 0019D470  38 80 00 00 */	li r4, 0
/* 801A0474 0019D474  38 E0 00 02 */	li r7, 2
/* 801A0478 0019D478  38 A0 00 01 */	li r5, 1
/* 801A047C 0019D47C  7C 09 03 A6 */	mtctr r0
.L_801A0480:
/* 801A0480 0019D480  7C 08 20 AE */	lbzx r0, r8, r4
/* 801A0484 0019D484  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 801A0488 0019D488  41 82 00 0C */	beq .L_801A0494
/* 801A048C 0019D48C  7C E6 19 2E */	stwx r7, r6, r3
/* 801A0490 0019D490  48 00 00 08 */	b .L_801A0498
.L_801A0494:
/* 801A0494 0019D494  7C A6 19 2E */	stwx r5, r6, r3
.L_801A0498:
/* 801A0498 0019D498  38 63 00 04 */	addi r3, r3, 4
/* 801A049C 0019D49C  38 84 00 20 */	addi r4, r4, 0x20
/* 801A04A0 0019D4A0  42 00 FF E0 */	bdnz .L_801A0480
/* 801A04A4 0019D4A4  3B A0 00 01 */	li r29, 1
/* 801A04A8 0019D4A8  48 00 02 60 */	b .L_801A0708
.L_801A04AC:
/* 801A04AC 0019D4AC  3C 60 80 30 */	lis r3, lbl_802F9700@ha
/* 801A04B0 0019D4B0  38 00 00 05 */	li r0, 5
/* 801A04B4 0019D4B4  38 63 97 00 */	addi r3, r3, lbl_802F9700@l
/* 801A04B8 0019D4B8  38 A1 00 04 */	addi r5, r1, 4
/* 801A04BC 0019D4BC  38 83 FF FC */	addi r4, r3, -4
/* 801A04C0 0019D4C0  7C 09 03 A6 */	mtctr r0
.L_801A04C4:
/* 801A04C4 0019D4C4  80 64 00 04 */	lwz r3, 4(r4)
/* 801A04C8 0019D4C8  84 04 00 08 */	lwzu r0, 8(r4)
/* 801A04CC 0019D4CC  90 65 00 04 */	stw r3, 4(r5)
/* 801A04D0 0019D4D0  94 05 00 08 */	stwu r0, 8(r5)
/* 801A04D4 0019D4D4  42 00 FF F0 */	bdnz .L_801A04C4
/* 801A04D8 0019D4D8  80 04 00 04 */	lwz r0, 4(r4)
/* 801A04DC 0019D4DC  3A 80 00 00 */	li r20, 0
/* 801A04E0 0019D4E0  38 60 00 64 */	li r3, 0x64
/* 801A04E4 0019D4E4  90 05 00 04 */	stw r0, 4(r5)
/* 801A04E8 0019D4E8  4B E6 59 DD */	bl irand
/* 801A04EC 0019D4EC  38 00 00 0B */	li r0, 0xb
/* 801A04F0 0019D4F0  38 A1 00 08 */	addi r5, r1, 8
/* 801A04F4 0019D4F4  3B 40 00 0C */	li r26, 0xc
/* 801A04F8 0019D4F8  38 C0 00 01 */	li r6, 1
/* 801A04FC 0019D4FC  38 80 00 04 */	li r4, 4
/* 801A0500 0019D500  7C 09 03 A6 */	mtctr r0
.L_801A0504:
/* 801A0504 0019D504  38 04 FF FC */	addi r0, r4, -4
/* 801A0508 0019D508  7C 05 00 2E */	lwzx r0, r5, r0
/* 801A050C 0019D50C  7E 94 02 14 */	add r20, r20, r0
/* 801A0510 0019D510  7C 03 A0 00 */	cmpw r3, r20
/* 801A0514 0019D514  40 80 00 0C */	bge .L_801A0520
/* 801A0518 0019D518  7C DA 33 78 */	mr r26, r6
/* 801A051C 0019D51C  48 00 00 10 */	b .L_801A052C
.L_801A0520:
/* 801A0520 0019D520  38 C6 00 01 */	addi r6, r6, 1
/* 801A0524 0019D524  38 84 00 04 */	addi r4, r4, 4
/* 801A0528 0019D528  42 00 FF DC */	bdnz .L_801A0504
.L_801A052C:
/* 801A052C 0019D52C  38 00 00 0C */	li r0, 0xc
/* 801A0530 0019D530  38 81 00 98 */	addi r4, r1, 0x98
/* 801A0534 0019D534  38 A0 00 00 */	li r5, 0
/* 801A0538 0019D538  38 60 00 00 */	li r3, 0
/* 801A053C 0019D53C  7C 09 03 A6 */	mtctr r0
.L_801A0540:
/* 801A0540 0019D540  7C A4 19 2E */	stwx r5, r4, r3
/* 801A0544 0019D544  38 A5 00 01 */	addi r5, r5, 1
/* 801A0548 0019D548  38 63 00 04 */	addi r3, r3, 4
/* 801A054C 0019D54C  42 00 FF F4 */	bdnz .L_801A0540
/* 801A0550 0019D550  3A 80 00 00 */	li r20, 0
/* 801A0554 0019D554  3B 61 00 98 */	addi r27, r1, 0x98
.L_801A0558:
/* 801A0558 0019D558  38 60 00 0C */	li r3, 0xc
/* 801A055C 0019D55C  4B E6 59 69 */	bl irand
/* 801A0560 0019D560  7C 77 1B 78 */	mr r23, r3
/* 801A0564 0019D564  38 60 00 0C */	li r3, 0xc
/* 801A0568 0019D568  4B E6 59 5D */	bl irand
/* 801A056C 0019D56C  56 E4 10 3A */	slwi r4, r23, 2
/* 801A0570 0019D570  54 63 10 3A */	slwi r3, r3, 2
/* 801A0574 0019D574  7C BB 20 2E */	lwzx r5, r27, r4
/* 801A0578 0019D578  3A 94 00 01 */	addi r20, r20, 1
/* 801A057C 0019D57C  7C 1B 18 2E */	lwzx r0, r27, r3
/* 801A0580 0019D580  2C 14 00 18 */	cmpwi r20, 0x18
/* 801A0584 0019D584  7C 1B 21 2E */	stwx r0, r27, r4
/* 801A0588 0019D588  7C BB 19 2E */	stwx r5, r27, r3
/* 801A058C 0019D58C  41 80 FF CC */	blt .L_801A0558
/* 801A0590 0019D590  3B E1 00 98 */	addi r31, r1, 0x98
/* 801A0594 0019D594  3B A0 00 00 */	li r29, 0
/* 801A0598 0019D598  3A E0 00 00 */	li r23, 0
/* 801A059C 0019D59C  3B 60 00 00 */	li r27, 0
.L_801A05A0:
/* 801A05A0 0019D5A0  7C 1B D0 00 */	cmpw r27, r26
/* 801A05A4 0019D5A4  7F 9F B8 2E */	lwzx r28, r31, r23
/* 801A05A8 0019D5A8  41 80 00 18 */	blt .L_801A05C0
/* 801A05AC 0019D5AC  57 80 10 3A */	slwi r0, r28, 2
/* 801A05B0 0019D5B0  38 61 00 68 */	addi r3, r1, 0x68
/* 801A05B4 0019D5B4  38 80 00 00 */	li r4, 0
/* 801A05B8 0019D5B8  7C 83 01 2E */	stwx r4, r3, r0
/* 801A05BC 0019D5BC  48 00 00 74 */	b .L_801A0630
.L_801A05C0:
/* 801A05C0 0019D5C0  3A DC 00 04 */	addi r22, r28, 4
/* 801A05C4 0019D5C4  7C 18 B0 AE */	lbzx r0, r24, r22
/* 801A05C8 0019D5C8  7C 00 07 75 */	extsb. r0, r0
/* 801A05CC 0019D5CC  41 82 00 54 */	beq .L_801A0620
/* 801A05D0 0019D5D0  38 60 00 0A */	li r3, 0xa
/* 801A05D4 0019D5D4  4B E6 58 F1 */	bl irand
/* 801A05D8 0019D5D8  7C B8 B0 AE */	lbzx r5, r24, r22
/* 801A05DC 0019D5DC  3C 80 80 3B */	lis r4, lbl_803B1924@ha
/* 801A05E0 0019D5E0  38 C3 00 01 */	addi r6, r3, 1
/* 801A05E4 0019D5E4  57 80 28 34 */	slwi r0, r28, 5
/* 801A05E8 0019D5E8  7C A5 07 74 */	extsb r5, r5
/* 801A05EC 0019D5EC  38 64 19 24 */	addi r3, r4, lbl_803B1924@l
/* 801A05F0 0019D5F0  7C 85 31 D6 */	mullw r4, r5, r6
/* 801A05F4 0019D5F4  7C 03 00 AE */	lbzx r0, r3, r0
/* 801A05F8 0019D5F8  57 83 10 3A */	slwi r3, r28, 2
/* 801A05FC 0019D5FC  38 A1 00 68 */	addi r5, r1, 0x68
/* 801A0600 0019D600  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 801A0604 0019D604  7C 85 19 2E */	stwx r4, r5, r3
/* 801A0608 0019D608  41 82 00 10 */	beq .L_801A0618
/* 801A060C 0019D60C  7C 05 18 2E */	lwzx r0, r5, r3
/* 801A0610 0019D610  54 00 08 3C */	slwi r0, r0, 1
/* 801A0614 0019D614  7C 05 19 2E */	stwx r0, r5, r3
.L_801A0618:
/* 801A0618 0019D618  3B 7B 00 01 */	addi r27, r27, 1
/* 801A061C 0019D61C  48 00 00 14 */	b .L_801A0630
.L_801A0620:
/* 801A0620 0019D620  57 80 10 3A */	slwi r0, r28, 2
/* 801A0624 0019D624  38 61 00 68 */	addi r3, r1, 0x68
/* 801A0628 0019D628  38 80 00 00 */	li r4, 0
/* 801A062C 0019D62C  7C 83 01 2E */	stwx r4, r3, r0
.L_801A0630:
/* 801A0630 0019D630  3B BD 00 01 */	addi r29, r29, 1
/* 801A0634 0019D634  3A F7 00 04 */	addi r23, r23, 4
/* 801A0638 0019D638  2C 1D 00 0B */	cmpwi r29, 0xb
/* 801A063C 0019D63C  40 81 FF 64 */	ble .L_801A05A0
/* 801A0640 0019D640  80 19 90 78 */	lwz r0, -0x6f88(r25)
/* 801A0644 0019D644  2C 00 00 00 */	cmpwi r0, 0
/* 801A0648 0019D648  41 82 00 BC */	beq .L_801A0704
/* 801A064C 0019D64C  28 00 00 0C */	cmplwi r0, 0xc
/* 801A0650 0019D650  41 81 00 78 */	bgt .L_801A06C8
/* 801A0654 0019D654  3C 60 80 3A */	lis r3, lbl_80399DE8@ha
/* 801A0658 0019D658  54 00 10 3A */	slwi r0, r0, 2
/* 801A065C 0019D65C  38 63 9D E8 */	addi r3, r3, lbl_80399DE8@l
/* 801A0660 0019D660  7C 03 00 2E */	lwzx r0, r3, r0
/* 801A0664 0019D664  7C 09 03 A6 */	mtctr r0
/* 801A0668 0019D668  4E 80 04 20 */	bctr 
/* 801A066C 0019D66C  3B 80 00 00 */	li r28, 0
/* 801A0670 0019D670  48 00 00 58 */	b .L_801A06C8
/* 801A0674 0019D674  3B 80 00 0A */	li r28, 0xa
/* 801A0678 0019D678  48 00 00 50 */	b .L_801A06C8
/* 801A067C 0019D67C  3B 80 00 08 */	li r28, 8
/* 801A0680 0019D680  48 00 00 48 */	b .L_801A06C8
/* 801A0684 0019D684  3B 80 00 04 */	li r28, 4
/* 801A0688 0019D688  48 00 00 40 */	b .L_801A06C8
/* 801A068C 0019D68C  3B 80 00 07 */	li r28, 7
/* 801A0690 0019D690  48 00 00 38 */	b .L_801A06C8
/* 801A0694 0019D694  3B 80 00 02 */	li r28, 2
/* 801A0698 0019D698  48 00 00 30 */	b .L_801A06C8
/* 801A069C 0019D69C  3B 80 00 01 */	li r28, 1
/* 801A06A0 0019D6A0  48 00 00 28 */	b .L_801A06C8
/* 801A06A4 0019D6A4  3B 80 00 03 */	li r28, 3
/* 801A06A8 0019D6A8  48 00 00 20 */	b .L_801A06C8
/* 801A06AC 0019D6AC  3B 80 00 05 */	li r28, 5
/* 801A06B0 0019D6B0  48 00 00 18 */	b .L_801A06C8
/* 801A06B4 0019D6B4  3B 80 00 06 */	li r28, 6
/* 801A06B8 0019D6B8  48 00 00 10 */	b .L_801A06C8
/* 801A06BC 0019D6BC  3B 80 00 09 */	li r28, 9
/* 801A06C0 0019D6C0  48 00 00 08 */	b .L_801A06C8
/* 801A06C4 0019D6C4  3B 80 00 0B */	li r28, 0xb
.L_801A06C8:
/* 801A06C8 0019D6C8  38 E0 00 00 */	li r7, 0
/* 801A06CC 0019D6CC  38 00 00 0C */	li r0, 0xc
/* 801A06D0 0019D6D0  7C E4 3B 78 */	mr r4, r7
/* 801A06D4 0019D6D4  38 A1 00 68 */	addi r5, r1, 0x68
/* 801A06D8 0019D6D8  38 60 00 00 */	li r3, 0
/* 801A06DC 0019D6DC  38 C0 00 01 */	li r6, 1
/* 801A06E0 0019D6E0  7C 09 03 A6 */	mtctr r0
.L_801A06E4:
/* 801A06E4 0019D6E4  7C 07 E0 00 */	cmpw r7, r28
/* 801A06E8 0019D6E8  40 82 00 0C */	bne .L_801A06F4
/* 801A06EC 0019D6EC  7C C5 19 2E */	stwx r6, r5, r3
/* 801A06F0 0019D6F0  48 00 00 08 */	b .L_801A06F8
.L_801A06F4:
/* 801A06F4 0019D6F4  7C 85 19 2E */	stwx r4, r5, r3
.L_801A06F8:
/* 801A06F8 0019D6F8  38 E7 00 01 */	addi r7, r7, 1
/* 801A06FC 0019D6FC  38 63 00 04 */	addi r3, r3, 4
/* 801A0700 0019D700  42 00 FF E4 */	bdnz .L_801A06E4
.L_801A0704:
/* 801A0704 0019D704  3B A0 00 01 */	li r29, 1
.L_801A0708:
/* 801A0708 0019D708  38 61 00 34 */	addi r3, r1, 0x34
/* 801A070C 0019D70C  38 80 00 00 */	li r4, 0
/* 801A0710 0019D710  38 A0 00 34 */	li r5, 0x34
/* 801A0714 0019D714  4B E6 49 A1 */	bl memset
/* 801A0718 0019D718  3C 7E 00 01 */	addis r3, r30, 1
/* 801A071C 0019D71C  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 801A0720 0019D720  C0 03 37 80 */	lfs f0, 0x3780(r3)
/* 801A0724 0019D724  EC 01 00 2A */	fadds f0, f1, f0
/* 801A0728 0019D728  FC 00 00 1E */	fctiwz f0, f0
/* 801A072C 0019D72C  D8 01 04 F8 */	stfd f0, 0x4f8(r1)
/* 801A0730 0019D730  83 61 04 FC */	lwz r27, 0x4fc(r1)
/* 801A0734 0019D734  2C 1B 00 00 */	cmpwi r27, 0
/* 801A0738 0019D738  40 80 00 08 */	bge .L_801A0740
/* 801A073C 0019D73C  3B 60 00 00 */	li r27, 0
.L_801A0740:
/* 801A0740 0019D740  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0744 0019D744  80 03 37 90 */	lwz r0, 0x3790(r3)
/* 801A0748 0019D748  7C 1B 00 00 */	cmpw r27, r0
/* 801A074C 0019D74C  40 81 00 08 */	ble .L_801A0754
/* 801A0750 0019D750  7C 1B 03 78 */	mr r27, r0
.L_801A0754:
/* 801A0754 0019D754  38 60 00 0C */	li r3, 0xc
/* 801A0758 0019D758  38 A1 00 68 */	addi r5, r1, 0x68
/* 801A075C 0019D75C  3B 40 00 00 */	li r26, 0
/* 801A0760 0019D760  38 00 00 00 */	li r0, 0
/* 801A0764 0019D764  38 80 00 00 */	li r4, 0
/* 801A0768 0019D768  7C 69 03 A6 */	mtctr r3
.L_801A076C:
/* 801A076C 0019D76C  7C 65 20 2E */	lwzx r3, r5, r4
/* 801A0770 0019D770  38 84 00 04 */	addi r4, r4, 4
/* 801A0774 0019D774  7C 00 1A 14 */	add r0, r0, r3
/* 801A0778 0019D778  42 00 FF F4 */	bdnz .L_801A076C
/* 801A077C 0019D77C  3C 80 80 3B */	lis r4, lbl_803B1924@ha
/* 801A0780 0019D780  38 60 00 0C */	li r3, 0xc
/* 801A0784 0019D784  38 C4 19 24 */	addi r6, r4, lbl_803B1924@l
/* 801A0788 0019D788  39 01 00 68 */	addi r8, r1, 0x68
/* 801A078C 0019D78C  39 21 00 34 */	addi r9, r1, 0x34
/* 801A0790 0019D790  38 80 00 00 */	li r4, 0
/* 801A0794 0019D794  38 A0 00 00 */	li r5, 0
/* 801A0798 0019D798  7C 69 03 A6 */	mtctr r3
.L_801A079C:
/* 801A079C 0019D79C  7C E8 28 2E */	lwzx r7, r8, r5
/* 801A07A0 0019D7A0  7C 66 20 AE */	lbzx r3, r6, r4
/* 801A07A4 0019D7A4  7C FB 39 D6 */	mullw r7, r27, r7
/* 801A07A8 0019D7A8  54 63 07 FF */	clrlwi. r3, r3, 0x1f
/* 801A07AC 0019D7AC  7C 67 03 D6 */	divw r3, r7, r0
/* 801A07B0 0019D7B0  7C 69 29 2E */	stwx r3, r9, r5
/* 801A07B4 0019D7B4  41 82 00 24 */	beq .L_801A07D8
/* 801A07B8 0019D7B8  7C 69 28 2E */	lwzx r3, r9, r5
/* 801A07BC 0019D7BC  7C 63 0E 70 */	srawi r3, r3, 1
/* 801A07C0 0019D7C0  7C 63 01 94 */	addze r3, r3
/* 801A07C4 0019D7C4  7C 69 29 2E */	stwx r3, r9, r5
/* 801A07C8 0019D7C8  7C 69 28 2E */	lwzx r3, r9, r5
/* 801A07CC 0019D7CC  54 63 08 3C */	slwi r3, r3, 1
/* 801A07D0 0019D7D0  7F 5A 1A 14 */	add r26, r26, r3
/* 801A07D4 0019D7D4  48 00 00 0C */	b .L_801A07E0
.L_801A07D8:
/* 801A07D8 0019D7D8  7C 69 28 2E */	lwzx r3, r9, r5
/* 801A07DC 0019D7DC  7F 5A 1A 14 */	add r26, r26, r3
.L_801A07E0:
/* 801A07E0 0019D7E0  38 84 00 20 */	addi r4, r4, 0x20
/* 801A07E4 0019D7E4  38 A5 00 04 */	addi r5, r5, 4
/* 801A07E8 0019D7E8  42 00 FF B4 */	bdnz .L_801A079C
/* 801A07EC 0019D7EC  38 00 00 0C */	li r0, 0xc
/* 801A07F0 0019D7F0  38 81 00 98 */	addi r4, r1, 0x98
/* 801A07F4 0019D7F4  38 A0 00 00 */	li r5, 0
/* 801A07F8 0019D7F8  38 60 00 00 */	li r3, 0
/* 801A07FC 0019D7FC  7C 09 03 A6 */	mtctr r0
.L_801A0800:
/* 801A0800 0019D800  7C A4 19 2E */	stwx r5, r4, r3
/* 801A0804 0019D804  38 A5 00 01 */	addi r5, r5, 1
/* 801A0808 0019D808  38 63 00 04 */	addi r3, r3, 4
/* 801A080C 0019D80C  42 00 FF F4 */	bdnz .L_801A0800
/* 801A0810 0019D810  3A C1 00 68 */	addi r22, r1, 0x68
/* 801A0814 0019D814  3A A1 00 98 */	addi r21, r1, 0x98
/* 801A0818 0019D818  3A 80 00 00 */	li r20, 0
/* 801A081C 0019D81C  3B E0 00 00 */	li r31, 0
.L_801A0820:
/* 801A0820 0019D820  3B 94 00 01 */	addi r28, r20, 1
/* 801A0824 0019D824  57 97 10 3A */	slwi r23, r28, 2
/* 801A0828 0019D828  48 00 00 4C */	b .L_801A0874
.L_801A082C:
/* 801A082C 0019D82C  7C 76 F8 2E */	lwzx r3, r22, r31
/* 801A0830 0019D830  7C 16 B8 2E */	lwzx r0, r22, r23
/* 801A0834 0019D834  7C 03 00 00 */	cmpw r3, r0
/* 801A0838 0019D838  40 82 00 14 */	bne .L_801A084C
/* 801A083C 0019D83C  38 60 00 02 */	li r3, 2
/* 801A0840 0019D840  4B E6 56 85 */	bl irand
/* 801A0844 0019D844  2C 03 00 00 */	cmpwi r3, 0
/* 801A0848 0019D848  41 82 00 14 */	beq .L_801A085C
.L_801A084C:
/* 801A084C 0019D84C  7C 76 F8 2E */	lwzx r3, r22, r31
/* 801A0850 0019D850  7C 16 B8 2E */	lwzx r0, r22, r23
/* 801A0854 0019D854  7C 03 00 00 */	cmpw r3, r0
/* 801A0858 0019D858  40 80 00 14 */	bge .L_801A086C
.L_801A085C:
/* 801A085C 0019D85C  7C 75 F8 2E */	lwzx r3, r21, r31
/* 801A0860 0019D860  7C 15 B8 2E */	lwzx r0, r21, r23
/* 801A0864 0019D864  7C 15 F9 2E */	stwx r0, r21, r31
/* 801A0868 0019D868  7C 75 B9 2E */	stwx r3, r21, r23
.L_801A086C:
/* 801A086C 0019D86C  3B 9C 00 01 */	addi r28, r28, 1
/* 801A0870 0019D870  3A F7 00 04 */	addi r23, r23, 4
.L_801A0874:
/* 801A0874 0019D874  2C 1C 00 0B */	cmpwi r28, 0xb
/* 801A0878 0019D878  40 81 FF B4 */	ble .L_801A082C
/* 801A087C 0019D87C  3A 94 00 01 */	addi r20, r20, 1
/* 801A0880 0019D880  3B FF 00 04 */	addi r31, r31, 4
/* 801A0884 0019D884  2C 14 00 0A */	cmpwi r20, 0xa
/* 801A0888 0019D888  40 81 FF 98 */	ble .L_801A0820
/* 801A088C 0019D88C  38 60 00 00 */	li r3, 0
/* 801A0890 0019D890  39 01 00 98 */	addi r8, r1, 0x98
/* 801A0894 0019D894  7C 64 1B 78 */	mr r4, r3
/* 801A0898 0019D898  38 E1 00 68 */	addi r7, r1, 0x68
/* 801A089C 0019D89C  48 00 00 94 */	b .L_801A0930
.L_801A08A0:
/* 801A08A0 0019D8A0  54 60 10 3A */	slwi r0, r3, 2
/* 801A08A4 0019D8A4  7C C8 00 2E */	lwzx r6, r8, r0
/* 801A08A8 0019D8A8  54 C9 10 3A */	slwi r9, r6, 2
/* 801A08AC 0019D8AC  7C 07 48 2E */	lwzx r0, r7, r9
/* 801A08B0 0019D8B0  2C 00 00 00 */	cmpwi r0, 0
/* 801A08B4 0019D8B4  40 81 00 68 */	ble .L_801A091C
/* 801A08B8 0019D8B8  3C A0 80 3B */	lis r5, lbl_803B1924@ha
/* 801A08BC 0019D8BC  54 C0 28 34 */	slwi r0, r6, 5
/* 801A08C0 0019D8C0  38 A5 19 24 */	addi r5, r5, lbl_803B1924@l
/* 801A08C4 0019D8C4  7C 05 00 AE */	lbzx r0, r5, r0
/* 801A08C8 0019D8C8  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 801A08CC 0019D8CC  41 82 00 3C */	beq .L_801A0908
/* 801A08D0 0019D8D0  38 1B FF FE */	addi r0, r27, -2
/* 801A08D4 0019D8D4  7C 1A 00 00 */	cmpw r26, r0
/* 801A08D8 0019D8D8  41 81 00 20 */	bgt .L_801A08F8
/* 801A08DC 0019D8DC  38 C1 00 34 */	addi r6, r1, 0x34
/* 801A08E0 0019D8E0  38 80 00 00 */	li r4, 0
/* 801A08E4 0019D8E4  7C A6 48 2E */	lwzx r5, r6, r9
/* 801A08E8 0019D8E8  3B 5A 00 02 */	addi r26, r26, 2
/* 801A08EC 0019D8EC  38 05 00 01 */	addi r0, r5, 1
/* 801A08F0 0019D8F0  7C 06 49 2E */	stwx r0, r6, r9
/* 801A08F4 0019D8F4  48 00 00 28 */	b .L_801A091C
.L_801A08F8:
/* 801A08F8 0019D8F8  38 84 00 01 */	addi r4, r4, 1
/* 801A08FC 0019D8FC  2C 04 00 0C */	cmpwi r4, 0xc
/* 801A0900 0019D900  40 80 00 38 */	bge .L_801A0938
/* 801A0904 0019D904  48 00 00 18 */	b .L_801A091C
.L_801A0908:
/* 801A0908 0019D908  38 C1 00 34 */	addi r6, r1, 0x34
/* 801A090C 0019D90C  3B 5A 00 01 */	addi r26, r26, 1
/* 801A0910 0019D910  7C A6 48 2E */	lwzx r5, r6, r9
/* 801A0914 0019D914  38 05 00 01 */	addi r0, r5, 1
/* 801A0918 0019D918  7C 06 49 2E */	stwx r0, r6, r9
.L_801A091C:
/* 801A091C 0019D91C  38 A0 00 0C */	li r5, 0xc
/* 801A0920 0019D920  38 63 00 01 */	addi r3, r3, 1
/* 801A0924 0019D924  7C 03 2B D6 */	divw r0, r3, r5
/* 801A0928 0019D928  7C 00 29 D6 */	mullw r0, r0, r5
/* 801A092C 0019D92C  7C 60 18 50 */	subf r3, r0, r3
.L_801A0930:
/* 801A0930 0019D930  7C 1A D8 00 */	cmpw r26, r27
/* 801A0934 0019D934  41 80 FF 6C */	blt .L_801A08A0
.L_801A0938:
/* 801A0938 0019D938  2C 1D 00 01 */	cmpwi r29, 1
/* 801A093C 0019D93C  40 82 00 D4 */	bne .L_801A0A10
/* 801A0940 0019D940  2C 1A 00 00 */	cmpwi r26, 0
/* 801A0944 0019D944  41 82 00 CC */	beq .L_801A0A10
/* 801A0948 0019D948  38 60 00 14 */	li r3, 0x14
/* 801A094C 0019D94C  4B E6 55 79 */	bl irand
/* 801A0950 0019D950  2C 03 00 00 */	cmpwi r3, 0
/* 801A0954 0019D954  41 82 00 10 */	beq .L_801A0964
/* 801A0958 0019D958  80 19 90 68 */	lwz r0, -0x6f98(r25)
/* 801A095C 0019D95C  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 801A0960 0019D960  41 82 00 B0 */	beq .L_801A0A10
.L_801A0964:
/* 801A0964 0019D964  38 00 00 0C */	li r0, 0xc
/* 801A0968 0019D968  38 81 00 98 */	addi r4, r1, 0x98
/* 801A096C 0019D96C  38 A0 00 00 */	li r5, 0
/* 801A0970 0019D970  38 60 00 00 */	li r3, 0
/* 801A0974 0019D974  7C 09 03 A6 */	mtctr r0
.L_801A0978:
/* 801A0978 0019D978  7C A4 19 2E */	stwx r5, r4, r3
/* 801A097C 0019D97C  38 A5 00 01 */	addi r5, r5, 1
/* 801A0980 0019D980  38 63 00 04 */	addi r3, r3, 4
/* 801A0984 0019D984  42 00 FF F4 */	bdnz .L_801A0978
/* 801A0988 0019D988  3A C0 00 00 */	li r22, 0
/* 801A098C 0019D98C  3A A1 00 98 */	addi r21, r1, 0x98
.L_801A0990:
/* 801A0990 0019D990  38 60 00 0C */	li r3, 0xc
/* 801A0994 0019D994  4B E6 55 31 */	bl irand
/* 801A0998 0019D998  7C 77 1B 78 */	mr r23, r3
/* 801A099C 0019D99C  38 60 00 0C */	li r3, 0xc
/* 801A09A0 0019D9A0  4B E6 55 25 */	bl irand
/* 801A09A4 0019D9A4  56 E4 10 3A */	slwi r4, r23, 2
/* 801A09A8 0019D9A8  54 63 10 3A */	slwi r3, r3, 2
/* 801A09AC 0019D9AC  7C B5 20 2E */	lwzx r5, r21, r4
/* 801A09B0 0019D9B0  3A D6 00 01 */	addi r22, r22, 1
/* 801A09B4 0019D9B4  7C 15 18 2E */	lwzx r0, r21, r3
/* 801A09B8 0019D9B8  2C 16 00 18 */	cmpwi r22, 0x18
/* 801A09BC 0019D9BC  7C 15 21 2E */	stwx r0, r21, r4
/* 801A09C0 0019D9C0  7C B5 19 2E */	stwx r5, r21, r3
/* 801A09C4 0019D9C4  41 80 FF CC */	blt .L_801A0990
/* 801A09C8 0019D9C8  38 00 00 0C */	li r0, 0xc
/* 801A09CC 0019D9CC  38 C1 00 98 */	addi r6, r1, 0x98
/* 801A09D0 0019D9D0  38 E1 00 34 */	addi r7, r1, 0x34
/* 801A09D4 0019D9D4  38 60 00 00 */	li r3, 0
/* 801A09D8 0019D9D8  7C 09 03 A6 */	mtctr r0
.L_801A09DC:
/* 801A09DC 0019D9DC  7C 06 18 2E */	lwzx r0, r6, r3
/* 801A09E0 0019D9E0  54 05 10 3A */	slwi r5, r0, 2
/* 801A09E4 0019D9E4  7C 87 28 2E */	lwzx r4, r7, r5
/* 801A09E8 0019D9E8  2C 04 00 00 */	cmpwi r4, 0
/* 801A09EC 0019D9EC  40 81 00 1C */	ble .L_801A0A08
/* 801A09F0 0019D9F0  38 04 FF FF */	addi r0, r4, -1
/* 801A09F4 0019D9F4  7C 07 29 2E */	stwx r0, r7, r5
/* 801A09F8 0019D9F8  80 61 00 64 */	lwz r3, 0x64(r1)
/* 801A09FC 0019D9FC  38 03 00 01 */	addi r0, r3, 1
/* 801A0A00 0019DA00  90 01 00 64 */	stw r0, 0x64(r1)
/* 801A0A04 0019DA04  48 00 00 0C */	b .L_801A0A10
.L_801A0A08:
/* 801A0A08 0019DA08  38 63 00 04 */	addi r3, r3, 4
/* 801A0A0C 0019DA0C  42 00 FF D0 */	bdnz .L_801A09DC
.L_801A0A10:
/* 801A0A10 0019DA10  80 18 00 00 */	lwz r0, 0(r24)
/* 801A0A14 0019DA14  2C 00 00 02 */	cmpwi r0, 2
/* 801A0A18 0019DA18  41 82 00 08 */	beq .L_801A0A20
/* 801A0A1C 0019DA1C  48 00 00 4C */	b .L_801A0A68
.L_801A0A20:
/* 801A0A20 0019DA20  3A E0 00 14 */	li r23, 0x14
/* 801A0A24 0019DA24  48 00 00 34 */	b .L_801A0A58
.L_801A0A28:
/* 801A0A28 0019DA28  7C 03 BB D6 */	divw r0, r3, r23
/* 801A0A2C 0019DA2C  7C 00 B9 D6 */	mullw r0, r0, r23
/* 801A0A30 0019DA30  7C 00 18 50 */	subf r0, r0, r3
/* 801A0A34 0019DA34  2C 00 00 09 */	cmpwi r0, 9
/* 801A0A38 0019DA38  41 81 00 14 */	bgt .L_801A0A4C
/* 801A0A3C 0019DA3C  38 80 00 07 */	li r4, 7
/* 801A0A40 0019DA40  38 A0 00 00 */	li r5, 0
/* 801A0A44 0019DA44  4B FF CA 11 */	bl BattleAudience_Entry
/* 801A0A48 0019DA48  48 00 00 10 */	b .L_801A0A58
.L_801A0A4C:
/* 801A0A4C 0019DA4C  38 80 00 01 */	li r4, 1
/* 801A0A50 0019DA50  38 A0 00 00 */	li r5, 0
/* 801A0A54 0019DA54  4B FF CA 01 */	bl BattleAudience_Entry
.L_801A0A58:
/* 801A0A58 0019DA58  4B FF BB DD */	bl BattleAudience_NoUsedHaitiRand
/* 801A0A5C 0019DA5C  2C 03 FF FF */	cmpwi r3, -1
/* 801A0A60 0019DA60  40 82 FF C8 */	bne .L_801A0A28
/* 801A0A64 0019DA64  48 00 00 C8 */	b .L_801A0B2C
.L_801A0A68:
/* 801A0A68 0019DA68  38 A1 01 CC */	addi r5, r1, 0x1cc
/* 801A0A6C 0019DA6C  38 C1 00 34 */	addi r6, r1, 0x34
/* 801A0A70 0019DA70  38 E0 00 00 */	li r7, 0
/* 801A0A74 0019DA74  38 60 00 00 */	li r3, 0
/* 801A0A78 0019DA78  3B 00 00 00 */	li r24, 0
/* 801A0A7C 0019DA7C  38 80 00 00 */	li r4, 0
.L_801A0A80:
/* 801A0A80 0019DA80  7C 06 18 2E */	lwzx r0, r6, r3
/* 801A0A84 0019DA84  7C 09 03 A6 */	mtctr r0
/* 801A0A88 0019DA88  2C 00 00 00 */	cmpwi r0, 0
/* 801A0A8C 0019DA8C  40 81 00 14 */	ble .L_801A0AA0
.L_801A0A90:
/* 801A0A90 0019DA90  7C E5 21 2E */	stwx r7, r5, r4
/* 801A0A94 0019DA94  3B 18 00 01 */	addi r24, r24, 1
/* 801A0A98 0019DA98  38 84 00 04 */	addi r4, r4, 4
/* 801A0A9C 0019DA9C  42 00 FF F4 */	bdnz .L_801A0A90
.L_801A0AA0:
/* 801A0AA0 0019DAA0  38 E7 00 01 */	addi r7, r7, 1
/* 801A0AA4 0019DAA4  38 63 00 04 */	addi r3, r3, 4
/* 801A0AA8 0019DAA8  2C 07 00 0C */	cmpwi r7, 0xc
/* 801A0AAC 0019DAAC  40 81 FF D4 */	ble .L_801A0A80
/* 801A0AB0 0019DAB0  3A C0 00 00 */	li r22, 0
/* 801A0AB4 0019DAB4  3A A1 01 CC */	addi r21, r1, 0x1cc
.L_801A0AB8:
/* 801A0AB8 0019DAB8  7F 03 C3 78 */	mr r3, r24
/* 801A0ABC 0019DABC  4B E6 54 09 */	bl irand
/* 801A0AC0 0019DAC0  7C 77 1B 78 */	mr r23, r3
/* 801A0AC4 0019DAC4  7F 03 C3 78 */	mr r3, r24
/* 801A0AC8 0019DAC8  4B E6 53 FD */	bl irand
/* 801A0ACC 0019DACC  56 E4 10 3A */	slwi r4, r23, 2
/* 801A0AD0 0019DAD0  54 63 10 3A */	slwi r3, r3, 2
/* 801A0AD4 0019DAD4  7C B5 20 2E */	lwzx r5, r21, r4
/* 801A0AD8 0019DAD8  3A D6 00 01 */	addi r22, r22, 1
/* 801A0ADC 0019DADC  7C 15 18 2E */	lwzx r0, r21, r3
/* 801A0AE0 0019DAE0  2C 16 00 96 */	cmpwi r22, 0x96
/* 801A0AE4 0019DAE4  7C 15 21 2E */	stwx r0, r21, r4
/* 801A0AE8 0019DAE8  7C B5 19 2E */	stwx r5, r21, r3
/* 801A0AEC 0019DAEC  41 80 FF CC */	blt .L_801A0AB8
/* 801A0AF0 0019DAF0  3A E1 01 CC */	addi r23, r1, 0x1cc
/* 801A0AF4 0019DAF4  3A A0 00 00 */	li r21, 0
/* 801A0AF8 0019DAF8  3B 20 00 00 */	li r25, 0
/* 801A0AFC 0019DAFC  48 00 00 28 */	b .L_801A0B24
.L_801A0B00:
/* 801A0B00 0019DB00  4B FF B9 35 */	bl BattleAudience_NoUsedFCHaitiRand
/* 801A0B04 0019DB04  2C 03 FF FF */	cmpwi r3, -1
/* 801A0B08 0019DB08  41 82 00 24 */	beq .L_801A0B2C
/* 801A0B0C 0019DB0C  7C 17 C8 2E */	lwzx r0, r23, r25
/* 801A0B10 0019DB10  38 A0 00 00 */	li r5, 0
/* 801A0B14 0019DB14  54 04 06 3E */	clrlwi r4, r0, 0x18
/* 801A0B18 0019DB18  4B FF C9 3D */	bl BattleAudience_Entry
/* 801A0B1C 0019DB1C  3A B5 00 01 */	addi r21, r21, 1
/* 801A0B20 0019DB20  3B 39 00 04 */	addi r25, r25, 4
.L_801A0B24:
/* 801A0B24 0019DB24  7C 15 C0 00 */	cmpw r21, r24
/* 801A0B28 0019DB28  41 80 FF D8 */	blt .L_801A0B00
.L_801A0B2C:
/* 801A0B2C 0019DB2C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0B30 0019DB30  38 81 00 68 */	addi r4, r1, 0x68
/* 801A0B34 0019DB34  38 A0 00 30 */	li r5, 0x30
/* 801A0B38 0019DB38  38 63 37 94 */	addi r3, r3, 0x3794
/* 801A0B3C 0019DB3C  4B E6 46 61 */	bl func_8000519C
/* 801A0B40 0019DB40  E3 E1 05 48 */	psq_l f31, 1352(r1), 0, qr0
/* 801A0B44 0019DB44  CB E1 05 40 */	lfd f31, 0x540(r1)
/* 801A0B48 0019DB48  E3 C1 05 38 */	psq_l f30, 1336(r1), 0, qr0
/* 801A0B4C 0019DB4C  CB C1 05 30 */	lfd f30, 0x530(r1)
/* 801A0B50 0019DB50  BA 81 05 00 */	lmw r20, 0x500(r1)
/* 801A0B54 0019DB54  80 01 05 54 */	lwz r0, 0x554(r1)
/* 801A0B58 0019DB58  7C 08 03 A6 */	mtlr r0
/* 801A0B5C 0019DB5C  38 21 05 50 */	addi r1, r1, 0x550
/* 801A0B60 0019DB60  4E 80 00 20 */	blr 

.global BattleAudience_End
BattleAudience_End:
/* 801A0B64 0019DB64  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801A0B68 0019DB68  7C 08 02 A6 */	mflr r0
/* 801A0B6C 0019DB6C  90 01 00 24 */	stw r0, 0x24(r1)
/* 801A0B70 0019DB70  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 801A0B74 0019DB74  48 00 1B 61 */	bl BattleAudienceBaseGetPtr
/* 801A0B78 0019DB78  7C 7E 1B 78 */	mr r30, r3
/* 801A0B7C 0019DB7C  3B A0 00 00 */	li r29, 0
/* 801A0B80 0019DB80  3B E0 00 00 */	li r31, 0
.L_801A0B84:
/* 801A0B84 0019DB84  38 1F 00 10 */	addi r0, r31, 0x10
/* 801A0B88 0019DB88  7C 7E 00 2E */	lwzx r3, r30, r0
/* 801A0B8C 0019DB8C  28 03 00 00 */	cmplwi r3, 0
/* 801A0B90 0019DB90  41 82 00 08 */	beq .L_801A0B98
/* 801A0B94 0019DB94  4B FE 39 C9 */	bl fileFree
.L_801A0B98:
/* 801A0B98 0019DB98  3B BD 00 01 */	addi r29, r29, 1
/* 801A0B9C 0019DB9C  3B FF 00 04 */	addi r31, r31, 4
/* 801A0BA0 0019DBA0  2C 1D 00 02 */	cmpwi r29, 2
/* 801A0BA4 0019DBA4  41 80 FF E0 */	blt .L_801A0B84
/* 801A0BA8 0019DBA8  80 7E 00 0C */	lwz r3, 0xc(r30)
/* 801A0BAC 0019DBAC  28 03 00 00 */	cmplwi r3, 0
/* 801A0BB0 0019DBB0  41 82 00 08 */	beq .L_801A0BB8
/* 801A0BB4 0019DBB4  4B FE 39 A9 */	bl fileFree
.L_801A0BB8:
/* 801A0BB8 0019DBB8  4B F3 10 BD */	bl func_800D1C74
/* 801A0BBC 0019DBBC  A0 03 00 8C */	lhz r0, 0x8c(r3)
/* 801A0BC0 0019DBC0  28 00 00 00 */	cmplwi r0, 0
/* 801A0BC4 0019DBC4  41 82 00 74 */	beq .L_801A0C38
/* 801A0BC8 0019DBC8  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0BCC 0019DBCC  C0 02 D2 98 */	lfs f0, lbl_8041E618@sda21(r2)
/* 801A0BD0 0019DBD0  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 801A0BD4 0019DBD4  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 801A0BD8 0019DBD8  40 80 00 08 */	bge .L_801A0BE0
/* 801A0BDC 0019DBDC  D0 03 37 7C */	stfs f0, 0x377c(r3)
.L_801A0BE0:
/* 801A0BE0 0019DBE0  3C BE 00 01 */	addis r5, r30, 1
/* 801A0BE4 0019DBE4  3C 00 43 30 */	lis r0, 0x4330
/* 801A0BE8 0019DBE8  80 C5 37 90 */	lwz r6, 0x3790(r5)
/* 801A0BEC 0019DBEC  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 801A0BF0 0019DBF0  38 83 9A 00 */	addi r4, r3, lbl_802F9A00@l
/* 801A0BF4 0019DBF4  90 01 00 08 */	stw r0, 8(r1)
/* 801A0BF8 0019DBF8  6C C3 80 00 */	xoris r3, r6, 0x8000
/* 801A0BFC 0019DBFC  C8 24 00 00 */	lfd f1, 0(r4)
/* 801A0C00 0019DC00  90 61 00 0C */	stw r3, 0xc(r1)
/* 801A0C04 0019DC04  C0 45 37 7C */	lfs f2, 0x377c(r5)
/* 801A0C08 0019DC08  C8 01 00 08 */	lfd f0, 8(r1)
/* 801A0C0C 0019DC0C  EC 00 08 28 */	fsubs f0, f0, f1
/* 801A0C10 0019DC10  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 801A0C14 0019DC14  40 81 00 18 */	ble .L_801A0C2C
/* 801A0C18 0019DC18  90 61 00 0C */	stw r3, 0xc(r1)
/* 801A0C1C 0019DC1C  90 01 00 08 */	stw r0, 8(r1)
/* 801A0C20 0019DC20  C8 01 00 08 */	lfd f0, 8(r1)
/* 801A0C24 0019DC24  EC 00 08 28 */	fsubs f0, f0, f1
/* 801A0C28 0019DC28  D0 05 37 7C */	stfs f0, 0x377c(r5)
.L_801A0C2C:
/* 801A0C2C 0019DC2C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0C30 0019DC30  C0 23 37 7C */	lfs f1, 0x377c(r3)
/* 801A0C34 0019DC34  4B F2 EE 21 */	bl pouchSetAudienceNum
.L_801A0C38:
/* 801A0C38 0019DC38  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 801A0C3C 0019DC3C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801A0C40 0019DC40  7C 08 03 A6 */	mtlr r0
/* 801A0C44 0019DC44  38 21 00 20 */	addi r1, r1, 0x20
/* 801A0C48 0019DC48  4E 80 00 20 */	blr 

.global BattleAudience_Disp
BattleAudience_Disp:
/* 801A0C4C 0019DC4C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A0C50 0019DC50  7C 08 02 A6 */	mflr r0
/* 801A0C54 0019DC54  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A0C58 0019DC58  48 00 1A 7D */	bl BattleAudienceBaseGetPtr
/* 801A0C5C 0019DC5C  4B FF D6 1D */	bl BattleAudienceAnimProcess
/* 801A0C60 0019DC60  48 00 1A 75 */	bl BattleAudienceBaseGetPtr
/* 801A0C64 0019DC64  80 03 00 00 */	lwz r0, 0(r3)
/* 801A0C68 0019DC68  54 00 03 9D */	rlwinm. r0, r0, 0, 0xe, 0xe
/* 801A0C6C 0019DC6C  40 82 00 74 */	bne .L_801A0CE0
/* 801A0C70 0019DC70  3C 60 80 1A */	lis r3, BattleAudienceDispAudience@ha
/* 801A0C74 0019DC74  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 801A0C78 0019DC78  38 A3 D9 4C */	addi r5, r3, BattleAudienceDispAudience@l
/* 801A0C7C 0019DC7C  38 80 00 01 */	li r4, 1
/* 801A0C80 0019DC80  38 60 00 04 */	li r3, 4
/* 801A0C84 0019DC84  38 C0 00 00 */	li r6, 0
/* 801A0C88 0019DC88  4B E6 FD 91 */	bl dispEntry
/* 801A0C8C 0019DC8C  3C 60 80 1A */	lis r3, BattleAudienceDispAudience@ha
/* 801A0C90 0019DC90  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 801A0C94 0019DC94  38 A3 D9 4C */	addi r5, r3, BattleAudienceDispAudience@l
/* 801A0C98 0019DC98  38 80 00 02 */	li r4, 2
/* 801A0C9C 0019DC9C  38 60 00 04 */	li r3, 4
/* 801A0CA0 0019DCA0  38 C0 00 00 */	li r6, 0
/* 801A0CA4 0019DCA4  4B E6 FD 75 */	bl dispEntry
/* 801A0CA8 0019DCA8  3C 60 80 1A */	lis r3, BattleAudienceDispItem@ha
/* 801A0CAC 0019DCAC  C0 22 D2 98 */	lfs f1, lbl_8041E618@sda21(r2)
/* 801A0CB0 0019DCB0  38 A3 D8 44 */	addi r5, r3, BattleAudienceDispItem@l
/* 801A0CB4 0019DCB4  38 80 00 01 */	li r4, 1
/* 801A0CB8 0019DCB8  38 60 00 04 */	li r3, 4
/* 801A0CBC 0019DCBC  38 C0 00 00 */	li r6, 0
/* 801A0CC0 0019DCC0  4B E6 FD 59 */	bl dispEntry
/* 801A0CC4 0019DCC4  3C 60 80 1A */	lis r3, BattleAudienceDispApSrc@ha
/* 801A0CC8 0019DCC8  C0 22 D3 8C */	lfs f1, lbl_8041E70C@sda21(r2)
/* 801A0CCC 0019DCCC  38 A3 D7 1C */	addi r5, r3, BattleAudienceDispApSrc@l
/* 801A0CD0 0019DCD0  38 80 00 00 */	li r4, 0
/* 801A0CD4 0019DCD4  38 60 00 08 */	li r3, 8
/* 801A0CD8 0019DCD8  38 C0 00 00 */	li r6, 0
/* 801A0CDC 0019DCDC  4B E6 FD 3D */	bl dispEntry
.L_801A0CE0:
/* 801A0CE0 0019DCE0  4B F3 0F 95 */	bl func_800D1C74
/* 801A0CE4 0019DCE4  A0 03 00 8C */	lhz r0, 0x8c(r3)
/* 801A0CE8 0019DCE8  28 00 00 00 */	cmplwi r0, 0
/* 801A0CEC 0019DCEC  41 82 00 20 */	beq .L_801A0D0C
/* 801A0CF0 0019DCF0  3C 60 80 1A */	lis r3, BattleAudienceDispWin@ha
/* 801A0CF4 0019DCF4  C0 22 D3 8C */	lfs f1, lbl_8041E70C@sda21(r2)
/* 801A0CF8 0019DCF8  38 A3 D6 24 */	addi r5, r3, BattleAudienceDispWin@l
/* 801A0CFC 0019DCFC  38 80 00 01 */	li r4, 1
/* 801A0D00 0019DD00  38 60 00 08 */	li r3, 8
/* 801A0D04 0019DD04  38 C0 00 00 */	li r6, 0
/* 801A0D08 0019DD08  4B E6 FD 11 */	bl dispEntry
.L_801A0D0C:
/* 801A0D0C 0019DD0C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A0D10 0019DD10  7C 08 03 A6 */	mtlr r0
/* 801A0D14 0019DD14  38 21 00 10 */	addi r1, r1, 0x10
/* 801A0D18 0019DD18  4E 80 00 20 */	blr 

.global BattleAudience_CheckReactionPerPhase
BattleAudience_CheckReactionPerPhase:
/* 801A0D1C 0019DD1C  94 21 FC 80 */	stwu r1, -0x380(r1)
/* 801A0D20 0019DD20  7C 08 02 A6 */	mflr r0
/* 801A0D24 0019DD24  90 01 03 84 */	stw r0, 0x384(r1)
/* 801A0D28 0019DD28  BF 21 03 64 */	stmw r25, 0x364(r1)
/* 801A0D2C 0019DD2C  48 00 19 A9 */	bl BattleAudienceBaseGetPtr
/* 801A0D30 0019DD30  7C 7E 1B 78 */	mr r30, r3
/* 801A0D34 0019DD34  4B F3 0F 41 */	bl func_800D1C74
/* 801A0D38 0019DD38  80 BE 00 00 */	lwz r5, 0(r30)
/* 801A0D3C 0019DD3C  54 A0 07 39 */	rlwinm. r0, r5, 0, 0x1c, 0x1c
/* 801A0D40 0019DD40  40 82 00 0C */	bne .L_801A0D4C
/* 801A0D44 0019DD44  38 60 00 00 */	li r3, 0
/* 801A0D48 0019DD48  48 00 0F 40 */	b .L_801A1C88
.L_801A0D4C:
/* 801A0D4C 0019DD4C  3C 9E 00 01 */	addis r4, r30, 1
/* 801A0D50 0019DD50  80 04 37 DC */	lwz r0, 0x37dc(r4)
/* 801A0D54 0019DD54  28 00 00 14 */	cmplwi r0, 0x14
/* 801A0D58 0019DD58  41 81 0F 2C */	bgt .L_801A1C84
/* 801A0D5C 0019DD5C  3C 60 80 3A */	lis r3, lbl_80399F0C@ha
/* 801A0D60 0019DD60  54 00 10 3A */	slwi r0, r0, 2
/* 801A0D64 0019DD64  38 63 9F 0C */	addi r3, r3, lbl_80399F0C@l
/* 801A0D68 0019DD68  7C 03 00 2E */	lwzx r0, r3, r0
/* 801A0D6C 0019DD6C  7C 09 03 A6 */	mtctr r0
/* 801A0D70 0019DD70  4E 80 04 20 */	bctr 
/* 801A0D74 0019DD74  38 00 00 05 */	li r0, 5
/* 801A0D78 0019DD78  90 04 37 DC */	stw r0, 0x37dc(r4)
/* 801A0D7C 0019DD7C  80 1E 00 00 */	lwz r0, 0(r30)
/* 801A0D80 0019DD80  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 801A0D84 0019DD84  41 82 00 10 */	beq .L_801A0D94
/* 801A0D88 0019DD88  38 00 00 0F */	li r0, 0xf
/* 801A0D8C 0019DD8C  90 04 37 DC */	stw r0, 0x37dc(r4)
/* 801A0D90 0019DD90  48 00 0E F4 */	b .L_801A1C84
.L_801A0D94:
/* 801A0D94 0019DD94  3B 60 00 00 */	li r27, 0
/* 801A0D98 0019DD98  3B 20 00 00 */	li r25, 0
.L_801A0D9C:
/* 801A0D9C 0019DD9C  7F 23 CB 78 */	mr r3, r25
/* 801A0DA0 0019DDA0  48 00 18 F9 */	bl BattleAudienceGetPtr
/* 801A0DA4 0019DDA4  7C 7A 1B 78 */	mr r26, r3
/* 801A0DA8 0019DDA8  7F 23 CB 78 */	mr r3, r25
/* 801A0DAC 0019DDAC  4B FF BC 09 */	bl BattleAudience_GetSysCtrl
/* 801A0DB0 0019DDB0  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A0DB4 0019DDB4  28 00 00 01 */	cmplwi r0, 1
/* 801A0DB8 0019DDB8  40 82 00 44 */	bne .L_801A0DFC
/* 801A0DBC 0019DDBC  88 1A 00 1B */	lbz r0, 0x1b(r26)
/* 801A0DC0 0019DDC0  28 00 00 09 */	cmplwi r0, 9
/* 801A0DC4 0019DDC4  40 82 00 38 */	bne .L_801A0DFC
/* 801A0DC8 0019DDC8  88 1A 00 19 */	lbz r0, 0x19(r26)
/* 801A0DCC 0019DDCC  28 00 00 12 */	cmplwi r0, 0x12
/* 801A0DD0 0019DDD0  40 82 00 2C */	bne .L_801A0DFC
/* 801A0DD4 0019DDD4  80 7A 01 2C */	lwz r3, 0x12c(r26)
/* 801A0DD8 0019DDD8  38 03 FF FF */	addi r0, r3, -1
/* 801A0DDC 0019DDDC  90 1A 01 2C */	stw r0, 0x12c(r26)
/* 801A0DE0 0019DDE0  80 1A 01 2C */	lwz r0, 0x12c(r26)
/* 801A0DE4 0019DDE4  2C 00 00 00 */	cmpwi r0, 0
/* 801A0DE8 0019DDE8  41 81 00 14 */	bgt .L_801A0DFC
/* 801A0DEC 0019DDEC  7F 23 CB 78 */	mr r3, r25
/* 801A0DF0 0019DDF0  38 80 00 13 */	li r4, 0x13
/* 801A0DF4 0019DDF4  4B FF BC 85 */	bl BattleAudience_ChangeStatus
/* 801A0DF8 0019DDF8  3B 7B 00 01 */	addi r27, r27, 1
.L_801A0DFC:
/* 801A0DFC 0019DDFC  3B 39 00 01 */	addi r25, r25, 1
/* 801A0E00 0019DE00  2C 19 00 C8 */	cmpwi r25, 0xc8
/* 801A0E04 0019DE04  41 80 FF 98 */	blt .L_801A0D9C
/* 801A0E08 0019DE08  2C 1B 00 01 */	cmpwi r27, 1
/* 801A0E0C 0019DE0C  41 80 00 14 */	blt .L_801A0E20
/* 801A0E10 0019DE10  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0E14 0019DE14  38 00 00 06 */	li r0, 6
/* 801A0E18 0019DE18  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0E1C 0019DE1C  48 00 00 10 */	b .L_801A0E2C
.L_801A0E20:
/* 801A0E20 0019DE20  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0E24 0019DE24  38 00 00 07 */	li r0, 7
/* 801A0E28 0019DE28  90 03 37 DC */	stw r0, 0x37dc(r3)
.L_801A0E2C:
/* 801A0E2C 0019DE2C  3B 20 00 00 */	li r25, 0
.L_801A0E30:
/* 801A0E30 0019DE30  7F 23 CB 78 */	mr r3, r25
/* 801A0E34 0019DE34  48 00 18 65 */	bl BattleAudienceGetPtr
/* 801A0E38 0019DE38  7C 7A 1B 78 */	mr r26, r3
/* 801A0E3C 0019DE3C  7F 23 CB 78 */	mr r3, r25
/* 801A0E40 0019DE40  4B FF BB 75 */	bl BattleAudience_GetSysCtrl
/* 801A0E44 0019DE44  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A0E48 0019DE48  28 00 00 01 */	cmplwi r0, 1
/* 801A0E4C 0019DE4C  40 82 00 1C */	bne .L_801A0E68
/* 801A0E50 0019DE50  88 1A 00 1B */	lbz r0, 0x1b(r26)
/* 801A0E54 0019DE54  28 00 00 09 */	cmplwi r0, 9
/* 801A0E58 0019DE58  40 82 00 10 */	bne .L_801A0E68
/* 801A0E5C 0019DE5C  88 1A 00 19 */	lbz r0, 0x19(r26)
/* 801A0E60 0019DE60  28 00 00 13 */	cmplwi r0, 0x13
/* 801A0E64 0019DE64  41 82 00 10 */	beq .L_801A0E74
.L_801A0E68:
/* 801A0E68 0019DE68  3B 39 00 01 */	addi r25, r25, 1
/* 801A0E6C 0019DE6C  2C 19 00 C8 */	cmpwi r25, 0xc8
/* 801A0E70 0019DE70  41 80 FF C0 */	blt .L_801A0E30
.L_801A0E74:
/* 801A0E74 0019DE74  2C 19 00 C8 */	cmpwi r25, 0xc8
/* 801A0E78 0019DE78  40 82 0E 0C */	bne .L_801A1C84
/* 801A0E7C 0019DE7C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0E80 0019DE80  80 03 37 DC */	lwz r0, 0x37dc(r3)
/* 801A0E84 0019DE84  2C 00 00 06 */	cmpwi r0, 6
/* 801A0E88 0019DE88  40 82 00 10 */	bne .L_801A0E98
/* 801A0E8C 0019DE8C  38 00 00 08 */	li r0, 8
/* 801A0E90 0019DE90  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0E94 0019DE94  48 00 0D F0 */	b .L_801A1C84
.L_801A0E98:
/* 801A0E98 0019DE98  38 00 00 0D */	li r0, 0xd
/* 801A0E9C 0019DE9C  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0EA0 0019DEA0  48 00 0D E4 */	b .L_801A1C84
/* 801A0EA4 0019DEA4  38 6D B9 BC */	addi r3, r13, lbl_80412C1C@sda21
/* 801A0EA8 0019DEA8  38 80 00 00 */	li r4, 0
/* 801A0EAC 0019DEAC  38 A0 00 20 */	li r5, 0x20
/* 801A0EB0 0019DEB0  4B E9 5F 61 */	bl evtEntry
/* 801A0EB4 0019DEB4  90 7E 00 04 */	stw r3, 4(r30)
/* 801A0EB8 0019DEB8  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0EBC 0019DEBC  38 00 00 09 */	li r0, 9
/* 801A0EC0 0019DEC0  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0EC4 0019DEC4  48 00 0D C0 */	b .L_801A1C84
/* 801A0EC8 0019DEC8  80 7E 00 04 */	lwz r3, 4(r30)
/* 801A0ECC 0019DECC  80 63 01 5C */	lwz r3, 0x15c(r3)
/* 801A0ED0 0019DED0  4B E9 50 99 */	bl evtCheckID
/* 801A0ED4 0019DED4  2C 03 00 00 */	cmpwi r3, 0
/* 801A0ED8 0019DED8  40 82 0D AC */	bne .L_801A1C84
/* 801A0EDC 0019DEDC  38 00 00 00 */	li r0, 0
/* 801A0EE0 0019DEE0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0EE4 0019DEE4  90 1E 00 04 */	stw r0, 4(r30)
/* 801A0EE8 0019DEE8  38 00 00 0A */	li r0, 0xa
/* 801A0EEC 0019DEEC  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0EF0 0019DEF0  48 00 0D 94 */	b .L_801A1C84
/* 801A0EF4 0019DEF4  54 A0 04 21 */	rlwinm. r0, r5, 0, 0x10, 0x10
/* 801A0EF8 0019DEF8  41 82 00 34 */	beq .L_801A0F2C
/* 801A0EFC 0019DEFC  38 6D B9 50 */	addi r3, r13, lbl_80412BB0@sda21
/* 801A0F00 0019DF00  38 80 00 00 */	li r4, 0
/* 801A0F04 0019DF04  38 A0 00 20 */	li r5, 0x20
/* 801A0F08 0019DF08  4B E9 5F 09 */	bl evtEntry
/* 801A0F0C 0019DF0C  90 7E 00 04 */	stw r3, 4(r30)
/* 801A0F10 0019DF10  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0F14 0019DF14  38 00 00 0B */	li r0, 0xb
/* 801A0F18 0019DF18  80 9E 00 00 */	lwz r4, 0(r30)
/* 801A0F1C 0019DF1C  54 84 04 5E */	rlwinm r4, r4, 0, 0x11, 0xf
/* 801A0F20 0019DF20  90 9E 00 00 */	stw r4, 0(r30)
/* 801A0F24 0019DF24  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0F28 0019DF28  48 00 0D 5C */	b .L_801A1C84
.L_801A0F2C:
/* 801A0F2C 0019DF2C  38 00 00 0F */	li r0, 0xf
/* 801A0F30 0019DF30  90 04 37 DC */	stw r0, 0x37dc(r4)
/* 801A0F34 0019DF34  48 00 0D 50 */	b .L_801A1C84
/* 801A0F38 0019DF38  80 7E 00 04 */	lwz r3, 4(r30)
/* 801A0F3C 0019DF3C  80 63 01 5C */	lwz r3, 0x15c(r3)
/* 801A0F40 0019DF40  4B E9 50 29 */	bl evtCheckID
/* 801A0F44 0019DF44  2C 03 00 00 */	cmpwi r3, 0
/* 801A0F48 0019DF48  40 82 0D 3C */	bne .L_801A1C84
/* 801A0F4C 0019DF4C  38 00 00 00 */	li r0, 0
/* 801A0F50 0019DF50  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0F54 0019DF54  90 1E 00 04 */	stw r0, 4(r30)
/* 801A0F58 0019DF58  38 00 00 0F */	li r0, 0xf
/* 801A0F5C 0019DF5C  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A0F60 0019DF60  48 00 0D 24 */	b .L_801A1C84
/* 801A0F64 0019DF64  80 04 39 04 */	lwz r0, 0x3904(r4)
/* 801A0F68 0019DF68  38 61 00 08 */	addi r3, r1, 8
/* 801A0F6C 0019DF6C  38 84 38 CC */	addi r4, r4, 0x38cc
/* 801A0F70 0019DF70  54 05 10 3A */	slwi r5, r0, 2
/* 801A0F74 0019DF74  4B E6 42 29 */	bl func_8000519C
/* 801A0F78 0019DF78  3C 7E 00 01 */	addis r3, r30, 1
/* 801A0F7C 0019DF7C  3B A0 00 00 */	li r29, 0
/* 801A0F80 0019DF80  83 83 39 04 */	lwz r28, 0x3904(r3)
/* 801A0F84 0019DF84  7F BB EB 78 */	mr r27, r29
/* 801A0F88 0019DF88  3B E1 00 08 */	addi r31, r1, 8
/* 801A0F8C 0019DF8C  93 A3 39 04 */	stw r29, 0x3904(r3)
/* 801A0F90 0019DF90  48 00 03 90 */	b .L_801A1320
.L_801A0F94:
/* 801A0F94 0019DF94  7C 1F D8 2E */	lwzx r0, r31, r27
/* 801A0F98 0019DF98  28 00 00 0D */	cmplwi r0, 0xd
/* 801A0F9C 0019DF9C  41 81 03 7C */	bgt .L_801A1318
/* 801A0FA0 0019DFA0  3C 60 80 3A */	lis r3, lbl_80399ED4@ha
/* 801A0FA4 0019DFA4  54 00 10 3A */	slwi r0, r0, 2
/* 801A0FA8 0019DFA8  38 63 9E D4 */	addi r3, r3, lbl_80399ED4@l
/* 801A0FAC 0019DFAC  7C 03 00 2E */	lwzx r0, r3, r0
/* 801A0FB0 0019DFB0  7C 09 03 A6 */	mtctr r0
/* 801A0FB4 0019DFB4  4E 80 04 20 */	bctr 
/* 801A0FB8 0019DFB8  3B 20 00 00 */	li r25, 0
.L_801A0FBC:
/* 801A0FBC 0019DFBC  7F 23 CB 78 */	mr r3, r25
/* 801A0FC0 0019DFC0  38 80 00 00 */	li r4, 0
/* 801A0FC4 0019DFC4  48 00 0D E5 */	bl check_exe_phase_evt_status
/* 801A0FC8 0019DFC8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A0FCC 0019DFCC  41 82 00 10 */	beq .L_801A0FDC
/* 801A0FD0 0019DFD0  38 60 00 00 */	li r3, 0
/* 801A0FD4 0019DFD4  4B FF A7 E1 */	bl BattleAudienceAddPhaseEvtList
/* 801A0FD8 0019DFD8  48 00 03 40 */	b .L_801A1318
.L_801A0FDC:
/* 801A0FDC 0019DFDC  3B 39 00 01 */	addi r25, r25, 1
/* 801A0FE0 0019DFE0  2C 19 00 3B */	cmpwi r25, 0x3b
/* 801A0FE4 0019DFE4  40 81 FF D8 */	ble .L_801A0FBC
/* 801A0FE8 0019DFE8  48 00 03 30 */	b .L_801A1318
/* 801A0FEC 0019DFEC  3B 20 00 00 */	li r25, 0
.L_801A0FF0:
/* 801A0FF0 0019DFF0  7F 23 CB 78 */	mr r3, r25
/* 801A0FF4 0019DFF4  38 80 00 08 */	li r4, 8
/* 801A0FF8 0019DFF8  48 00 0D B1 */	bl check_exe_phase_evt_status
/* 801A0FFC 0019DFFC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1000 0019E000  41 82 00 24 */	beq .L_801A1024
/* 801A1004 0019E004  7F 23 CB 78 */	mr r3, r25
/* 801A1008 0019E008  48 00 16 91 */	bl BattleAudienceGetPtr
/* 801A100C 0019E00C  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1010 0019E010  28 00 00 11 */	cmplwi r0, 0x11
/* 801A1014 0019E014  41 82 00 10 */	beq .L_801A1024
/* 801A1018 0019E018  38 60 00 01 */	li r3, 1
/* 801A101C 0019E01C  4B FF A7 99 */	bl BattleAudienceAddPhaseEvtList
/* 801A1020 0019E020  48 00 02 F8 */	b .L_801A1318
.L_801A1024:
/* 801A1024 0019E024  3B 39 00 01 */	addi r25, r25, 1
/* 801A1028 0019E028  2C 19 00 3B */	cmpwi r25, 0x3b
/* 801A102C 0019E02C  40 81 FF C4 */	ble .L_801A0FF0
/* 801A1030 0019E030  48 00 02 E8 */	b .L_801A1318
/* 801A1034 0019E034  3B 20 00 00 */	li r25, 0
.L_801A1038:
/* 801A1038 0019E038  7F 23 CB 78 */	mr r3, r25
/* 801A103C 0019E03C  38 80 00 04 */	li r4, 4
/* 801A1040 0019E040  48 00 0D 69 */	bl check_exe_phase_evt_status
/* 801A1044 0019E044  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1048 0019E048  41 82 00 10 */	beq .L_801A1058
/* 801A104C 0019E04C  38 60 00 02 */	li r3, 2
/* 801A1050 0019E050  4B FF A7 65 */	bl BattleAudienceAddPhaseEvtList
/* 801A1054 0019E054  48 00 02 C4 */	b .L_801A1318
.L_801A1058:
/* 801A1058 0019E058  3B 39 00 01 */	addi r25, r25, 1
/* 801A105C 0019E05C  2C 19 00 3B */	cmpwi r25, 0x3b
/* 801A1060 0019E060  40 81 FF D8 */	ble .L_801A1038
/* 801A1064 0019E064  48 00 02 B4 */	b .L_801A1318
/* 801A1068 0019E068  3F 5E 00 01 */	addis r26, r30, 1
/* 801A106C 0019E06C  80 1A 37 B0 */	lwz r0, 0x37b0(r26)
/* 801A1070 0019E070  2C 00 00 00 */	cmpwi r0, 0
/* 801A1074 0019E074  41 82 02 A4 */	beq .L_801A1318
/* 801A1078 0019E078  3B 20 00 00 */	li r25, 0
/* 801A107C 0019E07C  48 00 00 40 */	b .L_801A10BC
.L_801A1080:
/* 801A1080 0019E080  7F 23 CB 78 */	mr r3, r25
/* 801A1084 0019E084  4B FF B9 91 */	bl BattleAudience_GetExist
/* 801A1088 0019E088  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A108C 0019E08C  40 82 00 10 */	bne .L_801A109C
/* 801A1090 0019E090  38 60 00 03 */	li r3, 3
/* 801A1094 0019E094  4B FF A7 21 */	bl BattleAudienceAddPhaseEvtList
/* 801A1098 0019E098  48 00 02 80 */	b .L_801A1318
.L_801A109C:
/* 801A109C 0019E09C  7F 23 CB 78 */	mr r3, r25
/* 801A10A0 0019E0A0  48 00 15 F9 */	bl BattleAudienceGetPtr
/* 801A10A4 0019E0A4  80 03 00 00 */	lwz r0, 0(r3)
/* 801A10A8 0019E0A8  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 801A10AC 0019E0AC  41 82 00 0C */	beq .L_801A10B8
/* 801A10B0 0019E0B0  3B 39 00 02 */	addi r25, r25, 2
/* 801A10B4 0019E0B4  48 00 00 08 */	b .L_801A10BC
.L_801A10B8:
/* 801A10B8 0019E0B8  3B 39 00 01 */	addi r25, r25, 1
.L_801A10BC:
/* 801A10BC 0019E0BC  80 1A 37 90 */	lwz r0, 0x3790(r26)
/* 801A10C0 0019E0C0  7C 19 00 00 */	cmpw r25, r0
/* 801A10C4 0019E0C4  41 80 FF BC */	blt .L_801A1080
/* 801A10C8 0019E0C8  48 00 02 50 */	b .L_801A1318
/* 801A10CC 0019E0CC  3B 40 00 00 */	li r26, 0
.L_801A10D0:
/* 801A10D0 0019E0D0  7F 43 D3 78 */	mr r3, r26
/* 801A10D4 0019E0D4  38 80 00 02 */	li r4, 2
/* 801A10D8 0019E0D8  48 00 0C D1 */	bl check_exe_phase_evt_status
/* 801A10DC 0019E0DC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A10E0 0019E0E0  41 82 00 10 */	beq .L_801A10F0
/* 801A10E4 0019E0E4  38 60 00 04 */	li r3, 4
/* 801A10E8 0019E0E8  4B FF A6 CD */	bl BattleAudienceAddPhaseEvtList
/* 801A10EC 0019E0EC  48 00 02 2C */	b .L_801A1318
.L_801A10F0:
/* 801A10F0 0019E0F0  3B 5A 00 01 */	addi r26, r26, 1
/* 801A10F4 0019E0F4  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A10F8 0019E0F8  40 81 FF D8 */	ble .L_801A10D0
/* 801A10FC 0019E0FC  48 00 02 1C */	b .L_801A1318
/* 801A1100 0019E100  3B 40 00 00 */	li r26, 0
.L_801A1104:
/* 801A1104 0019E104  7F 43 D3 78 */	mr r3, r26
/* 801A1108 0019E108  38 80 00 01 */	li r4, 1
/* 801A110C 0019E10C  48 00 0C 9D */	bl check_exe_phase_evt_status
/* 801A1110 0019E110  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1114 0019E114  41 82 00 10 */	beq .L_801A1124
/* 801A1118 0019E118  38 60 00 05 */	li r3, 5
/* 801A111C 0019E11C  4B FF A6 99 */	bl BattleAudienceAddPhaseEvtList
/* 801A1120 0019E120  48 00 01 F8 */	b .L_801A1318
.L_801A1124:
/* 801A1124 0019E124  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1128 0019E128  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A112C 0019E12C  40 81 FF D8 */	ble .L_801A1104
/* 801A1130 0019E130  48 00 01 E8 */	b .L_801A1318
/* 801A1134 0019E134  3B 40 00 00 */	li r26, 0
.L_801A1138:
/* 801A1138 0019E138  7F 43 D3 78 */	mr r3, r26
/* 801A113C 0019E13C  38 80 00 01 */	li r4, 1
/* 801A1140 0019E140  48 00 0C 69 */	bl check_exe_phase_evt_status
/* 801A1144 0019E144  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1148 0019E148  41 82 00 10 */	beq .L_801A1158
/* 801A114C 0019E14C  38 60 00 06 */	li r3, 6
/* 801A1150 0019E150  4B FF A6 65 */	bl BattleAudienceAddPhaseEvtList
/* 801A1154 0019E154  48 00 01 C4 */	b .L_801A1318
.L_801A1158:
/* 801A1158 0019E158  3B 5A 00 01 */	addi r26, r26, 1
/* 801A115C 0019E15C  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1160 0019E160  40 81 FF D8 */	ble .L_801A1138
/* 801A1164 0019E164  48 00 01 B4 */	b .L_801A1318
/* 801A1168 0019E168  3B 40 00 00 */	li r26, 0
.L_801A116C:
/* 801A116C 0019E16C  7F 43 D3 78 */	mr r3, r26
/* 801A1170 0019E170  38 80 00 03 */	li r4, 3
/* 801A1174 0019E174  48 00 0C 35 */	bl check_exe_phase_evt_status
/* 801A1178 0019E178  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A117C 0019E17C  41 82 00 10 */	beq .L_801A118C
/* 801A1180 0019E180  38 60 00 07 */	li r3, 7
/* 801A1184 0019E184  4B FF A6 31 */	bl BattleAudienceAddPhaseEvtList
/* 801A1188 0019E188  48 00 01 90 */	b .L_801A1318
.L_801A118C:
/* 801A118C 0019E18C  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1190 0019E190  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1194 0019E194  40 81 FF D8 */	ble .L_801A116C
/* 801A1198 0019E198  48 00 01 80 */	b .L_801A1318
/* 801A119C 0019E19C  3B 40 00 00 */	li r26, 0
.L_801A11A0:
/* 801A11A0 0019E1A0  7F 43 D3 78 */	mr r3, r26
/* 801A11A4 0019E1A4  38 80 00 05 */	li r4, 5
/* 801A11A8 0019E1A8  48 00 0C 01 */	bl check_exe_phase_evt_status
/* 801A11AC 0019E1AC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A11B0 0019E1B0  41 82 00 10 */	beq .L_801A11C0
/* 801A11B4 0019E1B4  38 60 00 08 */	li r3, 8
/* 801A11B8 0019E1B8  4B FF A5 FD */	bl BattleAudienceAddPhaseEvtList
/* 801A11BC 0019E1BC  48 00 01 5C */	b .L_801A1318
.L_801A11C0:
/* 801A11C0 0019E1C0  3B 5A 00 01 */	addi r26, r26, 1
/* 801A11C4 0019E1C4  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A11C8 0019E1C8  40 81 FF D8 */	ble .L_801A11A0
/* 801A11CC 0019E1CC  48 00 01 4C */	b .L_801A1318
/* 801A11D0 0019E1D0  80 1E 00 00 */	lwz r0, 0(r30)
/* 801A11D4 0019E1D4  54 00 04 63 */	rlwinm. r0, r0, 0, 0x11, 0x11
/* 801A11D8 0019E1D8  40 82 01 40 */	bne .L_801A1318
/* 801A11DC 0019E1DC  3B 40 00 00 */	li r26, 0
.L_801A11E0:
/* 801A11E0 0019E1E0  7F 43 D3 78 */	mr r3, r26
/* 801A11E4 0019E1E4  38 80 00 05 */	li r4, 5
/* 801A11E8 0019E1E8  48 00 0B C1 */	bl check_exe_phase_evt_status
/* 801A11EC 0019E1EC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A11F0 0019E1F0  41 82 00 10 */	beq .L_801A1200
/* 801A11F4 0019E1F4  38 60 00 09 */	li r3, 9
/* 801A11F8 0019E1F8  4B FF A5 BD */	bl BattleAudienceAddPhaseEvtList
/* 801A11FC 0019E1FC  48 00 01 1C */	b .L_801A1318
.L_801A1200:
/* 801A1200 0019E200  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1204 0019E204  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1208 0019E208  40 81 FF D8 */	ble .L_801A11E0
/* 801A120C 0019E20C  48 00 01 0C */	b .L_801A1318
/* 801A1210 0019E210  3B 40 00 00 */	li r26, 0
.L_801A1214:
/* 801A1214 0019E214  7F 43 D3 78 */	mr r3, r26
/* 801A1218 0019E218  38 80 00 06 */	li r4, 6
/* 801A121C 0019E21C  48 00 0B 8D */	bl check_exe_phase_evt_status
/* 801A1220 0019E220  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1224 0019E224  41 82 00 10 */	beq .L_801A1234
/* 801A1228 0019E228  38 60 00 0A */	li r3, 0xa
/* 801A122C 0019E22C  4B FF A5 89 */	bl BattleAudienceAddPhaseEvtList
/* 801A1230 0019E230  48 00 00 E8 */	b .L_801A1318
.L_801A1234:
/* 801A1234 0019E234  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1238 0019E238  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A123C 0019E23C  40 81 FF D8 */	ble .L_801A1214
/* 801A1240 0019E240  48 00 00 D8 */	b .L_801A1318
/* 801A1244 0019E244  80 1E 00 00 */	lwz r0, 0(r30)
/* 801A1248 0019E248  54 00 04 63 */	rlwinm. r0, r0, 0, 0x11, 0x11
/* 801A124C 0019E24C  40 82 00 CC */	bne .L_801A1318
/* 801A1250 0019E250  3B 40 00 00 */	li r26, 0
.L_801A1254:
/* 801A1254 0019E254  7F 43 D3 78 */	mr r3, r26
/* 801A1258 0019E258  38 80 00 09 */	li r4, 9
/* 801A125C 0019E25C  48 00 0B 4D */	bl check_exe_phase_evt_status
/* 801A1260 0019E260  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1264 0019E264  41 82 00 24 */	beq .L_801A1288
/* 801A1268 0019E268  7F 43 D3 78 */	mr r3, r26
/* 801A126C 0019E26C  48 00 14 2D */	bl BattleAudienceGetPtr
/* 801A1270 0019E270  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1274 0019E274  28 00 00 12 */	cmplwi r0, 0x12
/* 801A1278 0019E278  41 82 00 10 */	beq .L_801A1288
/* 801A127C 0019E27C  38 60 00 0B */	li r3, 0xb
/* 801A1280 0019E280  4B FF A5 35 */	bl BattleAudienceAddPhaseEvtList
/* 801A1284 0019E284  48 00 00 94 */	b .L_801A1318
.L_801A1288:
/* 801A1288 0019E288  3B 5A 00 01 */	addi r26, r26, 1
/* 801A128C 0019E28C  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1290 0019E290  40 81 FF C4 */	ble .L_801A1254
/* 801A1294 0019E294  48 00 00 84 */	b .L_801A1318
/* 801A1298 0019E298  80 1E 00 00 */	lwz r0, 0(r30)
/* 801A129C 0019E29C  54 00 04 63 */	rlwinm. r0, r0, 0, 0x11, 0x11
/* 801A12A0 0019E2A0  40 82 00 78 */	bne .L_801A1318
/* 801A12A4 0019E2A4  3B 40 00 00 */	li r26, 0
.L_801A12A8:
/* 801A12A8 0019E2A8  7F 43 D3 78 */	mr r3, r26
/* 801A12AC 0019E2AC  38 80 00 0B */	li r4, 0xb
/* 801A12B0 0019E2B0  48 00 0A F9 */	bl check_exe_phase_evt_status
/* 801A12B4 0019E2B4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A12B8 0019E2B8  41 82 00 20 */	beq .L_801A12D8
/* 801A12BC 0019E2BC  7F 43 D3 78 */	mr r3, r26
/* 801A12C0 0019E2C0  4B FF A0 2D */	bl BattleAudienceDetectPakkunEatTarget
/* 801A12C4 0019E2C4  2C 03 FF FF */	cmpwi r3, -1
/* 801A12C8 0019E2C8  41 82 00 10 */	beq .L_801A12D8
/* 801A12CC 0019E2CC  38 60 00 0C */	li r3, 0xc
/* 801A12D0 0019E2D0  4B FF A4 E5 */	bl BattleAudienceAddPhaseEvtList
/* 801A12D4 0019E2D4  48 00 00 44 */	b .L_801A1318
.L_801A12D8:
/* 801A12D8 0019E2D8  3B 5A 00 01 */	addi r26, r26, 1
/* 801A12DC 0019E2DC  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A12E0 0019E2E0  40 81 FF C8 */	ble .L_801A12A8
/* 801A12E4 0019E2E4  48 00 00 34 */	b .L_801A1318
/* 801A12E8 0019E2E8  3B 40 00 00 */	li r26, 0
.L_801A12EC:
/* 801A12EC 0019E2EC  7F 43 D3 78 */	mr r3, r26
/* 801A12F0 0019E2F0  38 80 00 0C */	li r4, 0xc
/* 801A12F4 0019E2F4  48 00 0A B5 */	bl check_exe_phase_evt_status
/* 801A12F8 0019E2F8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A12FC 0019E2FC  41 82 00 10 */	beq .L_801A130C
/* 801A1300 0019E300  38 60 00 0D */	li r3, 0xd
/* 801A1304 0019E304  4B FF A4 B1 */	bl BattleAudienceAddPhaseEvtList
/* 801A1308 0019E308  48 00 00 10 */	b .L_801A1318
.L_801A130C:
/* 801A130C 0019E30C  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1310 0019E310  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1314 0019E314  40 81 FF D8 */	ble .L_801A12EC
.L_801A1318:
/* 801A1318 0019E318  3B BD 00 01 */	addi r29, r29, 1
/* 801A131C 0019E31C  3B 7B 00 04 */	addi r27, r27, 4
.L_801A1320:
/* 801A1320 0019E320  7C 1D E0 00 */	cmpw r29, r28
/* 801A1324 0019E324  41 80 FC 70 */	blt .L_801A0F94
/* 801A1328 0019E328  3C 9E 00 01 */	addis r4, r30, 1
/* 801A132C 0019E32C  80 64 39 04 */	lwz r3, 0x3904(r4)
/* 801A1330 0019E330  2C 03 00 01 */	cmpwi r3, 1
/* 801A1334 0019E334  41 80 00 28 */	blt .L_801A135C
/* 801A1338 0019E338  4B E6 4B 8D */	bl irand
/* 801A133C 0019E33C  54 60 10 3A */	slwi r0, r3, 2
/* 801A1340 0019E340  3C 9E 00 01 */	addis r4, r30, 1
/* 801A1344 0019E344  7C 64 02 14 */	add r3, r4, r0
/* 801A1348 0019E348  38 00 00 01 */	li r0, 1
/* 801A134C 0019E34C  80 63 38 CC */	lwz r3, 0x38cc(r3)
/* 801A1350 0019E350  90 64 38 CC */	stw r3, 0x38cc(r4)
/* 801A1354 0019E354  90 04 39 04 */	stw r0, 0x3904(r4)
/* 801A1358 0019E358  48 00 00 0C */	b .L_801A1364
.L_801A135C:
/* 801A135C 0019E35C  38 00 00 00 */	li r0, 0
/* 801A1360 0019E360  90 04 39 04 */	stw r0, 0x3904(r4)
.L_801A1364:
/* 801A1364 0019E364  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1368 0019E368  38 00 00 0C */	li r0, 0xc
/* 801A136C 0019E36C  90 03 37 DC */	stw r0, 0x37dc(r3)
/* 801A1370 0019E370  38 00 00 00 */	li r0, 0
/* 801A1374 0019E374  90 03 37 E0 */	stw r0, 0x37e0(r3)
/* 801A1378 0019E378  3C 9E 00 01 */	addis r4, r30, 1
/* 801A137C 0019E37C  80 04 39 04 */	lwz r0, 0x3904(r4)
/* 801A1380 0019E380  2C 00 00 01 */	cmpwi r0, 1
/* 801A1384 0019E384  40 82 08 00 */	bne .L_801A1B84
/* 801A1388 0019E388  80 04 38 CC */	lwz r0, 0x38cc(r4)
/* 801A138C 0019E38C  28 00 00 0D */	cmplwi r0, 0xd
/* 801A1390 0019E390  41 81 08 F4 */	bgt .L_801A1C84
/* 801A1394 0019E394  3C 60 80 3A */	lis r3, lbl_80399E9C@ha
/* 801A1398 0019E398  54 00 10 3A */	slwi r0, r0, 2
/* 801A139C 0019E39C  38 63 9E 9C */	addi r3, r3, lbl_80399E9C@l
/* 801A13A0 0019E3A0  7C 03 00 2E */	lwzx r0, r3, r0
/* 801A13A4 0019E3A4  7C 09 03 A6 */	mtctr r0
/* 801A13A8 0019E3A8  4E 80 04 20 */	bctr 
/* 801A13AC 0019E3AC  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A13B0 0019E3B0  3B 20 00 00 */	li r25, 0
/* 801A13B4 0019E3B4  3B 80 00 00 */	li r28, 0
/* 801A13B8 0019E3B8  3B 40 00 00 */	li r26, 0
.L_801A13BC:
/* 801A13BC 0019E3BC  7F 43 D3 78 */	mr r3, r26
/* 801A13C0 0019E3C0  38 80 00 00 */	li r4, 0
/* 801A13C4 0019E3C4  48 00 09 E5 */	bl check_exe_phase_evt_status
/* 801A13C8 0019E3C8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A13CC 0019E3CC  41 82 00 10 */	beq .L_801A13DC
/* 801A13D0 0019E3D0  7F 5B E1 2E */	stwx r26, r27, r28
/* 801A13D4 0019E3D4  3B 39 00 01 */	addi r25, r25, 1
/* 801A13D8 0019E3D8  3B 9C 00 04 */	addi r28, r28, 4
.L_801A13DC:
/* 801A13DC 0019E3DC  3B 5A 00 01 */	addi r26, r26, 1
/* 801A13E0 0019E3E0  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A13E4 0019E3E4  40 81 FF D8 */	ble .L_801A13BC
/* 801A13E8 0019E3E8  7F 23 CB 78 */	mr r3, r25
/* 801A13EC 0019E3EC  4B E6 4A D9 */	bl irand
/* 801A13F0 0019E3F0  54 60 10 3A */	slwi r0, r3, 2
/* 801A13F4 0019E3F4  38 61 00 40 */	addi r3, r1, 0x40
/* 801A13F8 0019E3F8  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A13FC 0019E3FC  38 80 00 00 */	li r4, 0
/* 801A1400 0019E400  38 A0 00 01 */	li r5, 1
/* 801A1404 0019E404  4B FF E6 FD */	bl BattleAudienceItemOn
/* 801A1408 0019E408  3C 7E 00 01 */	addis r3, r30, 1
/* 801A140C 0019E40C  38 00 00 00 */	li r0, 0
/* 801A1410 0019E410  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1414 0019E414  48 00 08 70 */	b .L_801A1C84
/* 801A1418 0019E418  3B 40 00 00 */	li r26, 0
/* 801A141C 0019E41C  3B 60 00 05 */	li r27, 5
.L_801A1420:
/* 801A1420 0019E420  7F 43 D3 78 */	mr r3, r26
/* 801A1424 0019E424  38 80 00 08 */	li r4, 8
/* 801A1428 0019E428  48 00 09 81 */	bl check_exe_phase_evt_status
/* 801A142C 0019E42C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1430 0019E430  41 82 00 30 */	beq .L_801A1460
/* 801A1434 0019E434  7F 43 D3 78 */	mr r3, r26
/* 801A1438 0019E438  48 00 12 61 */	bl BattleAudienceGetPtr
/* 801A143C 0019E43C  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1440 0019E440  28 00 00 11 */	cmplwi r0, 0x11
/* 801A1444 0019E444  41 82 00 1C */	beq .L_801A1460
/* 801A1448 0019E448  7F 43 D3 78 */	mr r3, r26
/* 801A144C 0019E44C  38 80 00 11 */	li r4, 0x11
/* 801A1450 0019E450  4B FF B6 29 */	bl BattleAudience_ChangeStatus
/* 801A1454 0019E454  7F 43 D3 78 */	mr r3, r26
/* 801A1458 0019E458  48 00 12 41 */	bl BattleAudienceGetPtr
/* 801A145C 0019E45C  93 63 01 2C */	stw r27, 0x12c(r3)
.L_801A1460:
/* 801A1460 0019E460  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1464 0019E464  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 801A1468 0019E468  41 80 FF B8 */	blt .L_801A1420
/* 801A146C 0019E46C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1470 0019E470  38 00 00 00 */	li r0, 0
/* 801A1474 0019E474  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1478 0019E478  48 00 08 0C */	b .L_801A1C84
/* 801A147C 0019E47C  3B 40 00 00 */	li r26, 0
.L_801A1480:
/* 801A1480 0019E480  7F 43 D3 78 */	mr r3, r26
/* 801A1484 0019E484  38 80 00 04 */	li r4, 4
/* 801A1488 0019E488  48 00 09 21 */	bl check_exe_phase_evt_status
/* 801A148C 0019E48C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1490 0019E490  41 82 00 14 */	beq .L_801A14A4
/* 801A1494 0019E494  7F 43 D3 78 */	mr r3, r26
/* 801A1498 0019E498  38 80 00 EE */	li r4, 0xee
/* 801A149C 0019E49C  38 A0 00 64 */	li r5, 0x64
/* 801A14A0 0019E4A0  4B FF E6 61 */	bl BattleAudienceItemOn
.L_801A14A4:
/* 801A14A4 0019E4A4  3B 5A 00 01 */	addi r26, r26, 1
/* 801A14A8 0019E4A8  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A14AC 0019E4AC  40 81 FF D4 */	ble .L_801A1480
/* 801A14B0 0019E4B0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A14B4 0019E4B4  38 00 00 00 */	li r0, 0
/* 801A14B8 0019E4B8  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A14BC 0019E4BC  48 00 07 C8 */	b .L_801A1C84
/* 801A14C0 0019E4C0  80 04 37 E0 */	lwz r0, 0x37e0(r4)
/* 801A14C4 0019E4C4  28 00 00 0F */	cmplwi r0, 0xf
/* 801A14C8 0019E4C8  41 81 07 BC */	bgt .L_801A1C84
/* 801A14CC 0019E4CC  3C 60 80 3A */	lis r3, lbl_80399E5C@ha
/* 801A14D0 0019E4D0  54 00 10 3A */	slwi r0, r0, 2
/* 801A14D4 0019E4D4  38 63 9E 5C */	addi r3, r3, lbl_80399E5C@l
/* 801A14D8 0019E4D8  7C 03 00 2E */	lwzx r0, r3, r0
/* 801A14DC 0019E4DC  7C 09 03 A6 */	mtctr r0
/* 801A14E0 0019E4E0  4E 80 04 20 */	bctr 
/* 801A14E4 0019E4E4  38 60 00 C8 */	li r3, 0xc8
/* 801A14E8 0019E4E8  4B FF A3 49 */	bl BattleAudienceAddPuni
/* 801A14EC 0019E4EC  3C 7E 00 01 */	addis r3, r30, 1
/* 801A14F0 0019E4F0  38 00 00 05 */	li r0, 5
/* 801A14F4 0019E4F4  90 03 37 E0 */	stw r0, 0x37e0(r3)
/* 801A14F8 0019E4F8  48 00 07 8C */	b .L_801A1C84
/* 801A14FC 0019E4FC  3B 40 00 00 */	li r26, 0
.L_801A1500:
/* 801A1500 0019E500  7F 43 D3 78 */	mr r3, r26
/* 801A1504 0019E504  4B FF B4 B1 */	bl BattleAudience_GetSysCtrl
/* 801A1508 0019E508  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A150C 0019E50C  41 82 00 18 */	beq .L_801A1524
/* 801A1510 0019E510  7F 43 D3 78 */	mr r3, r26
/* 801A1514 0019E514  48 00 11 85 */	bl BattleAudienceGetPtr
/* 801A1518 0019E518  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A151C 0019E51C  28 00 00 0B */	cmplwi r0, 0xb
/* 801A1520 0019E520  41 82 00 10 */	beq .L_801A1530
.L_801A1524:
/* 801A1524 0019E524  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1528 0019E528  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 801A152C 0019E52C  41 80 FF D4 */	blt .L_801A1500
.L_801A1530:
/* 801A1530 0019E530  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 801A1534 0019E534  40 82 07 50 */	bne .L_801A1C84
/* 801A1538 0019E538  3C 7E 00 01 */	addis r3, r30, 1
/* 801A153C 0019E53C  38 00 00 0A */	li r0, 0xa
/* 801A1540 0019E540  90 03 37 E0 */	stw r0, 0x37e0(r3)
/* 801A1544 0019E544  48 00 07 40 */	b .L_801A1C84
/* 801A1548 0019E548  38 00 00 0F */	li r0, 0xf
/* 801A154C 0019E54C  38 6D B9 74 */	addi r3, r13, lbl_80412BD4@sda21
/* 801A1550 0019E550  90 04 37 E0 */	stw r0, 0x37e0(r4)
/* 801A1554 0019E554  38 80 00 00 */	li r4, 0
/* 801A1558 0019E558  38 A0 00 20 */	li r5, 0x20
/* 801A155C 0019E55C  4B E9 58 B5 */	bl evtEntry
/* 801A1560 0019E560  90 7E 00 04 */	stw r3, 4(r30)
/* 801A1564 0019E564  48 00 07 20 */	b .L_801A1C84
/* 801A1568 0019E568  80 7E 00 04 */	lwz r3, 4(r30)
/* 801A156C 0019E56C  80 63 01 5C */	lwz r3, 0x15c(r3)
/* 801A1570 0019E570  4B E9 49 F9 */	bl evtCheckID
/* 801A1574 0019E574  2C 03 00 00 */	cmpwi r3, 0
/* 801A1578 0019E578  40 82 07 0C */	bne .L_801A1C84
/* 801A157C 0019E57C  38 00 00 00 */	li r0, 0
/* 801A1580 0019E580  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1584 0019E584  90 1E 00 04 */	stw r0, 4(r30)
/* 801A1588 0019E588  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A158C 0019E58C  48 00 06 F8 */	b .L_801A1C84
/* 801A1590 0019E590  80 04 37 E0 */	lwz r0, 0x37e0(r4)
/* 801A1594 0019E594  2C 00 00 05 */	cmpwi r0, 5
/* 801A1598 0019E598  41 82 00 78 */	beq .L_801A1610
/* 801A159C 0019E59C  40 80 06 E8 */	bge .L_801A1C84
/* 801A15A0 0019E5A0  2C 00 00 00 */	cmpwi r0, 0
/* 801A15A4 0019E5A4  41 82 00 08 */	beq .L_801A15AC
/* 801A15A8 0019E5A8  48 00 06 DC */	b .L_801A1C84
.L_801A15AC:
/* 801A15AC 0019E5AC  3B 40 00 00 */	li r26, 0
/* 801A15B0 0019E5B0  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A15B4 0019E5B4  7F 5D D3 78 */	mr r29, r26
/* 801A15B8 0019E5B8  3B 80 00 00 */	li r28, 0
.L_801A15BC:
/* 801A15BC 0019E5BC  7F A3 EB 78 */	mr r3, r29
/* 801A15C0 0019E5C0  38 80 00 02 */	li r4, 2
/* 801A15C4 0019E5C4  48 00 07 E5 */	bl check_exe_phase_evt_status
/* 801A15C8 0019E5C8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A15CC 0019E5CC  41 82 00 10 */	beq .L_801A15DC
/* 801A15D0 0019E5D0  7F BB E1 2E */	stwx r29, r27, r28
/* 801A15D4 0019E5D4  3B 5A 00 01 */	addi r26, r26, 1
/* 801A15D8 0019E5D8  3B 9C 00 04 */	addi r28, r28, 4
.L_801A15DC:
/* 801A15DC 0019E5DC  3B BD 00 01 */	addi r29, r29, 1
/* 801A15E0 0019E5E0  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A15E4 0019E5E4  40 81 FF D8 */	ble .L_801A15BC
/* 801A15E8 0019E5E8  7F 43 D3 78 */	mr r3, r26
/* 801A15EC 0019E5EC  4B E6 48 D9 */	bl irand
/* 801A15F0 0019E5F0  54 60 10 3A */	slwi r0, r3, 2
/* 801A15F4 0019E5F4  38 61 00 40 */	addi r3, r1, 0x40
/* 801A15F8 0019E5F8  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A15FC 0019E5FC  38 80 00 0E */	li r4, 0xe
/* 801A1600 0019E600  4B FF B4 79 */	bl BattleAudience_ChangeStatus
/* 801A1604 0019E604  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1608 0019E608  38 00 00 05 */	li r0, 5
/* 801A160C 0019E60C  90 03 37 E0 */	stw r0, 0x37e0(r3)
.L_801A1610:
/* 801A1610 0019E610  3B 40 00 00 */	li r26, 0
.L_801A1614:
/* 801A1614 0019E614  7F 43 D3 78 */	mr r3, r26
/* 801A1618 0019E618  4B FF B3 9D */	bl BattleAudience_GetSysCtrl
/* 801A161C 0019E61C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1620 0019E620  41 82 00 18 */	beq .L_801A1638
/* 801A1624 0019E624  7F 43 D3 78 */	mr r3, r26
/* 801A1628 0019E628  48 00 10 71 */	bl BattleAudienceGetPtr
/* 801A162C 0019E62C  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1630 0019E630  28 00 00 0E */	cmplwi r0, 0xe
/* 801A1634 0019E634  41 82 00 10 */	beq .L_801A1644
.L_801A1638:
/* 801A1638 0019E638  3B 5A 00 01 */	addi r26, r26, 1
/* 801A163C 0019E63C  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1640 0019E640  40 81 FF D4 */	ble .L_801A1614
.L_801A1644:
/* 801A1644 0019E644  2C 1A 00 3C */	cmpwi r26, 0x3c
/* 801A1648 0019E648  40 82 06 3C */	bne .L_801A1C84
/* 801A164C 0019E64C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1650 0019E650  38 00 00 00 */	li r0, 0
/* 801A1654 0019E654  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1658 0019E658  48 00 06 2C */	b .L_801A1C84
/* 801A165C 0019E65C  3B 40 00 00 */	li r26, 0
.L_801A1660:
/* 801A1660 0019E660  7F 43 D3 78 */	mr r3, r26
/* 801A1664 0019E664  38 80 00 01 */	li r4, 1
/* 801A1668 0019E668  48 00 07 41 */	bl check_exe_phase_evt_status
/* 801A166C 0019E66C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1670 0019E670  41 82 00 14 */	beq .L_801A1684
/* 801A1674 0019E674  7F 43 D3 78 */	mr r3, r26
/* 801A1678 0019E678  38 80 00 ED */	li r4, 0xed
/* 801A167C 0019E67C  38 A0 00 64 */	li r5, 0x64
/* 801A1680 0019E680  4B FF E4 81 */	bl BattleAudienceItemOn
.L_801A1684:
/* 801A1684 0019E684  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1688 0019E688  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A168C 0019E68C  40 81 FF D4 */	ble .L_801A1660
/* 801A1690 0019E690  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1694 0019E694  38 00 00 00 */	li r0, 0
/* 801A1698 0019E698  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A169C 0019E69C  48 00 05 E8 */	b .L_801A1C84
/* 801A16A0 0019E6A0  3B 40 00 00 */	li r26, 0
/* 801A16A4 0019E6A4  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A16A8 0019E6A8  7F 5D D3 78 */	mr r29, r26
/* 801A16AC 0019E6AC  3B 80 00 00 */	li r28, 0
.L_801A16B0:
/* 801A16B0 0019E6B0  7F A3 EB 78 */	mr r3, r29
/* 801A16B4 0019E6B4  38 80 00 01 */	li r4, 1
/* 801A16B8 0019E6B8  48 00 06 F1 */	bl check_exe_phase_evt_status
/* 801A16BC 0019E6BC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A16C0 0019E6C0  41 82 00 10 */	beq .L_801A16D0
/* 801A16C4 0019E6C4  7F BB E1 2E */	stwx r29, r27, r28
/* 801A16C8 0019E6C8  3B 5A 00 01 */	addi r26, r26, 1
/* 801A16CC 0019E6CC  3B 9C 00 04 */	addi r28, r28, 4
.L_801A16D0:
/* 801A16D0 0019E6D0  3B BD 00 01 */	addi r29, r29, 1
/* 801A16D4 0019E6D4  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A16D8 0019E6D8  40 81 FF D8 */	ble .L_801A16B0
/* 801A16DC 0019E6DC  7F 43 D3 78 */	mr r3, r26
/* 801A16E0 0019E6E0  4B E6 47 E5 */	bl irand
/* 801A16E4 0019E6E4  54 60 10 3A */	slwi r0, r3, 2
/* 801A16E8 0019E6E8  38 61 00 40 */	addi r3, r1, 0x40
/* 801A16EC 0019E6EC  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A16F0 0019E6F0  38 80 00 00 */	li r4, 0
/* 801A16F4 0019E6F4  38 A0 00 01 */	li r5, 1
/* 801A16F8 0019E6F8  4B FF E4 09 */	bl BattleAudienceItemOn
/* 801A16FC 0019E6FC  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1700 0019E700  38 00 00 00 */	li r0, 0
/* 801A1704 0019E704  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1708 0019E708  48 00 05 7C */	b .L_801A1C84
/* 801A170C 0019E70C  3B 40 00 00 */	li r26, 0
/* 801A1710 0019E710  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A1714 0019E714  7F 5D D3 78 */	mr r29, r26
/* 801A1718 0019E718  3B 80 00 00 */	li r28, 0
.L_801A171C:
/* 801A171C 0019E71C  7F A3 EB 78 */	mr r3, r29
/* 801A1720 0019E720  38 80 00 03 */	li r4, 3
/* 801A1724 0019E724  48 00 06 85 */	bl check_exe_phase_evt_status
/* 801A1728 0019E728  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A172C 0019E72C  41 82 00 10 */	beq .L_801A173C
/* 801A1730 0019E730  7F BB E1 2E */	stwx r29, r27, r28
/* 801A1734 0019E734  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1738 0019E738  3B 9C 00 04 */	addi r28, r28, 4
.L_801A173C:
/* 801A173C 0019E73C  3B BD 00 01 */	addi r29, r29, 1
/* 801A1740 0019E740  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A1744 0019E744  40 81 FF D8 */	ble .L_801A171C
/* 801A1748 0019E748  7F 43 D3 78 */	mr r3, r26
/* 801A174C 0019E74C  4B E6 47 79 */	bl irand
/* 801A1750 0019E750  54 60 10 3A */	slwi r0, r3, 2
/* 801A1754 0019E754  38 61 00 40 */	addi r3, r1, 0x40
/* 801A1758 0019E758  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A175C 0019E75C  38 80 00 EF */	li r4, 0xef
/* 801A1760 0019E760  38 A0 00 01 */	li r5, 1
/* 801A1764 0019E764  4B FF E3 9D */	bl BattleAudienceItemOn
/* 801A1768 0019E768  3C 7E 00 01 */	addis r3, r30, 1
/* 801A176C 0019E76C  38 00 00 00 */	li r0, 0
/* 801A1770 0019E770  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1774 0019E774  48 00 05 10 */	b .L_801A1C84
/* 801A1778 0019E778  3B 40 00 00 */	li r26, 0
/* 801A177C 0019E77C  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A1780 0019E780  7F 5D D3 78 */	mr r29, r26
/* 801A1784 0019E784  3B 80 00 00 */	li r28, 0
.L_801A1788:
/* 801A1788 0019E788  7F A3 EB 78 */	mr r3, r29
/* 801A178C 0019E78C  38 80 00 05 */	li r4, 5
/* 801A1790 0019E790  48 00 06 19 */	bl check_exe_phase_evt_status
/* 801A1794 0019E794  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1798 0019E798  41 82 00 10 */	beq .L_801A17A8
/* 801A179C 0019E79C  7F BB E1 2E */	stwx r29, r27, r28
/* 801A17A0 0019E7A0  3B 5A 00 01 */	addi r26, r26, 1
/* 801A17A4 0019E7A4  3B 9C 00 04 */	addi r28, r28, 4
.L_801A17A8:
/* 801A17A8 0019E7A8  3B BD 00 01 */	addi r29, r29, 1
/* 801A17AC 0019E7AC  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A17B0 0019E7B0  40 81 FF D8 */	ble .L_801A1788
/* 801A17B4 0019E7B4  7F 43 D3 78 */	mr r3, r26
/* 801A17B8 0019E7B8  4B E6 47 0D */	bl irand
/* 801A17BC 0019E7BC  54 60 10 3A */	slwi r0, r3, 2
/* 801A17C0 0019E7C0  38 61 00 40 */	addi r3, r1, 0x40
/* 801A17C4 0019E7C4  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A17C8 0019E7C8  38 80 00 00 */	li r4, 0
/* 801A17CC 0019E7CC  38 A0 00 01 */	li r5, 1
/* 801A17D0 0019E7D0  4B FF E3 31 */	bl BattleAudienceItemOn
/* 801A17D4 0019E7D4  3C 7E 00 01 */	addis r3, r30, 1
/* 801A17D8 0019E7D8  38 00 00 00 */	li r0, 0
/* 801A17DC 0019E7DC  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A17E0 0019E7E0  48 00 04 A4 */	b .L_801A1C84
/* 801A17E4 0019E7E4  80 04 37 E0 */	lwz r0, 0x37e0(r4)
/* 801A17E8 0019E7E8  2C 00 00 05 */	cmpwi r0, 5
/* 801A17EC 0019E7EC  41 82 00 78 */	beq .L_801A1864
/* 801A17F0 0019E7F0  40 80 04 94 */	bge .L_801A1C84
/* 801A17F4 0019E7F4  2C 00 00 00 */	cmpwi r0, 0
/* 801A17F8 0019E7F8  41 82 00 08 */	beq .L_801A1800
/* 801A17FC 0019E7FC  48 00 04 88 */	b .L_801A1C84
.L_801A1800:
/* 801A1800 0019E800  3B 40 00 00 */	li r26, 0
/* 801A1804 0019E804  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A1808 0019E808  7F 5D D3 78 */	mr r29, r26
/* 801A180C 0019E80C  3B 80 00 00 */	li r28, 0
.L_801A1810:
/* 801A1810 0019E810  7F A3 EB 78 */	mr r3, r29
/* 801A1814 0019E814  38 80 00 05 */	li r4, 5
/* 801A1818 0019E818  48 00 05 91 */	bl check_exe_phase_evt_status
/* 801A181C 0019E81C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1820 0019E820  41 82 00 10 */	beq .L_801A1830
/* 801A1824 0019E824  7F BB E1 2E */	stwx r29, r27, r28
/* 801A1828 0019E828  3B 5A 00 01 */	addi r26, r26, 1
/* 801A182C 0019E82C  3B 9C 00 04 */	addi r28, r28, 4
.L_801A1830:
/* 801A1830 0019E830  3B BD 00 01 */	addi r29, r29, 1
/* 801A1834 0019E834  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A1838 0019E838  40 81 FF D8 */	ble .L_801A1810
/* 801A183C 0019E83C  7F 43 D3 78 */	mr r3, r26
/* 801A1840 0019E840  4B E6 46 85 */	bl irand
/* 801A1844 0019E844  54 60 10 3A */	slwi r0, r3, 2
/* 801A1848 0019E848  38 61 00 40 */	addi r3, r1, 0x40
/* 801A184C 0019E84C  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A1850 0019E850  38 80 00 0F */	li r4, 0xf
/* 801A1854 0019E854  4B FF B2 25 */	bl BattleAudience_ChangeStatus
/* 801A1858 0019E858  3C 7E 00 01 */	addis r3, r30, 1
/* 801A185C 0019E85C  38 00 00 05 */	li r0, 5
/* 801A1860 0019E860  90 03 37 E0 */	stw r0, 0x37e0(r3)
.L_801A1864:
/* 801A1864 0019E864  3B 40 00 00 */	li r26, 0
.L_801A1868:
/* 801A1868 0019E868  7F 43 D3 78 */	mr r3, r26
/* 801A186C 0019E86C  4B FF B1 49 */	bl BattleAudience_GetSysCtrl
/* 801A1870 0019E870  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1874 0019E874  41 82 00 18 */	beq .L_801A188C
/* 801A1878 0019E878  7F 43 D3 78 */	mr r3, r26
/* 801A187C 0019E87C  48 00 0E 1D */	bl BattleAudienceGetPtr
/* 801A1880 0019E880  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1884 0019E884  28 00 00 0F */	cmplwi r0, 0xf
/* 801A1888 0019E888  41 82 00 10 */	beq .L_801A1898
.L_801A188C:
/* 801A188C 0019E88C  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1890 0019E890  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1894 0019E894  40 81 FF D4 */	ble .L_801A1868
.L_801A1898:
/* 801A1898 0019E898  2C 1A 00 3C */	cmpwi r26, 0x3c
/* 801A189C 0019E89C  40 82 03 E8 */	bne .L_801A1C84
/* 801A18A0 0019E8A0  3C 7E 00 01 */	addis r3, r30, 1
/* 801A18A4 0019E8A4  38 00 00 00 */	li r0, 0
/* 801A18A8 0019E8A8  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A18AC 0019E8AC  48 00 03 D8 */	b .L_801A1C84
/* 801A18B0 0019E8B0  80 04 37 E0 */	lwz r0, 0x37e0(r4)
/* 801A18B4 0019E8B4  28 00 00 0F */	cmplwi r0, 0xf
/* 801A18B8 0019E8B8  41 81 03 CC */	bgt .L_801A1C84
/* 801A18BC 0019E8BC  3C 60 80 3A */	lis r3, lbl_80399E1C@ha
/* 801A18C0 0019E8C0  54 00 10 3A */	slwi r0, r0, 2
/* 801A18C4 0019E8C4  38 63 9E 1C */	addi r3, r3, lbl_80399E1C@l
/* 801A18C8 0019E8C8  7C 03 00 2E */	lwzx r0, r3, r0
/* 801A18CC 0019E8CC  7C 09 03 A6 */	mtctr r0
/* 801A18D0 0019E8D0  4E 80 04 20 */	bctr 
/* 801A18D4 0019E8D4  3B 40 00 00 */	li r26, 0
/* 801A18D8 0019E8D8  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A18DC 0019E8DC  7F 5D D3 78 */	mr r29, r26
/* 801A18E0 0019E8E0  3B 80 00 00 */	li r28, 0
.L_801A18E4:
/* 801A18E4 0019E8E4  7F A3 EB 78 */	mr r3, r29
/* 801A18E8 0019E8E8  38 80 00 06 */	li r4, 6
/* 801A18EC 0019E8EC  48 00 04 BD */	bl check_exe_phase_evt_status
/* 801A18F0 0019E8F0  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A18F4 0019E8F4  41 82 00 10 */	beq .L_801A1904
/* 801A18F8 0019E8F8  7F BB E1 2E */	stwx r29, r27, r28
/* 801A18FC 0019E8FC  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1900 0019E900  3B 9C 00 04 */	addi r28, r28, 4
.L_801A1904:
/* 801A1904 0019E904  3B BD 00 01 */	addi r29, r29, 1
/* 801A1908 0019E908  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A190C 0019E90C  40 81 FF D8 */	ble .L_801A18E4
/* 801A1910 0019E910  7F 43 D3 78 */	mr r3, r26
/* 801A1914 0019E914  4B E6 45 B1 */	bl irand
/* 801A1918 0019E918  54 60 10 3A */	slwi r0, r3, 2
/* 801A191C 0019E91C  38 61 00 40 */	addi r3, r1, 0x40
/* 801A1920 0019E920  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A1924 0019E924  38 80 00 10 */	li r4, 0x10
/* 801A1928 0019E928  4B FF B1 51 */	bl BattleAudience_ChangeStatus
/* 801A192C 0019E92C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1930 0019E930  38 00 00 05 */	li r0, 5
/* 801A1934 0019E934  90 03 37 E0 */	stw r0, 0x37e0(r3)
/* 801A1938 0019E938  3B 40 00 00 */	li r26, 0
.L_801A193C:
/* 801A193C 0019E93C  7F 43 D3 78 */	mr r3, r26
/* 801A1940 0019E940  4B FF B0 75 */	bl BattleAudience_GetSysCtrl
/* 801A1944 0019E944  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1948 0019E948  41 82 00 18 */	beq .L_801A1960
/* 801A194C 0019E94C  7F 43 D3 78 */	mr r3, r26
/* 801A1950 0019E950  48 00 0D 49 */	bl BattleAudienceGetPtr
/* 801A1954 0019E954  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1958 0019E958  28 00 00 10 */	cmplwi r0, 0x10
/* 801A195C 0019E95C  41 82 00 10 */	beq .L_801A196C
.L_801A1960:
/* 801A1960 0019E960  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1964 0019E964  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1968 0019E968  40 81 FF D4 */	ble .L_801A193C
.L_801A196C:
/* 801A196C 0019E96C  2C 1A 00 3C */	cmpwi r26, 0x3c
/* 801A1970 0019E970  40 82 03 14 */	bne .L_801A1C84
/* 801A1974 0019E974  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1978 0019E978  38 00 00 0A */	li r0, 0xa
/* 801A197C 0019E97C  90 03 37 E0 */	stw r0, 0x37e0(r3)
/* 801A1980 0019E980  48 00 03 04 */	b .L_801A1C84
/* 801A1984 0019E984  38 00 00 0F */	li r0, 0xf
/* 801A1988 0019E988  38 6D B9 98 */	addi r3, r13, lbl_80412BF8@sda21
/* 801A198C 0019E98C  90 04 37 E0 */	stw r0, 0x37e0(r4)
/* 801A1990 0019E990  38 80 00 00 */	li r4, 0
/* 801A1994 0019E994  38 A0 00 20 */	li r5, 0x20
/* 801A1998 0019E998  4B E9 54 79 */	bl evtEntry
/* 801A199C 0019E99C  90 7E 00 04 */	stw r3, 4(r30)
/* 801A19A0 0019E9A0  48 00 02 E4 */	b .L_801A1C84
/* 801A19A4 0019E9A4  80 7E 00 04 */	lwz r3, 4(r30)
/* 801A19A8 0019E9A8  80 63 01 5C */	lwz r3, 0x15c(r3)
/* 801A19AC 0019E9AC  4B E9 45 BD */	bl evtCheckID
/* 801A19B0 0019E9B0  2C 03 00 00 */	cmpwi r3, 0
/* 801A19B4 0019E9B4  40 82 02 D0 */	bne .L_801A1C84
/* 801A19B8 0019E9B8  38 00 00 00 */	li r0, 0
/* 801A19BC 0019E9BC  3C 7E 00 01 */	addis r3, r30, 1
/* 801A19C0 0019E9C0  90 1E 00 04 */	stw r0, 4(r30)
/* 801A19C4 0019E9C4  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A19C8 0019E9C8  48 00 02 BC */	b .L_801A1C84
/* 801A19CC 0019E9CC  3B 40 00 00 */	li r26, 0
/* 801A19D0 0019E9D0  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A19D4 0019E9D4  7F 5D D3 78 */	mr r29, r26
/* 801A19D8 0019E9D8  3B 80 00 00 */	li r28, 0
.L_801A19DC:
/* 801A19DC 0019E9DC  7F A3 EB 78 */	mr r3, r29
/* 801A19E0 0019E9E0  38 80 00 09 */	li r4, 9
/* 801A19E4 0019E9E4  48 00 03 C5 */	bl check_exe_phase_evt_status
/* 801A19E8 0019E9E8  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A19EC 0019E9EC  41 82 00 24 */	beq .L_801A1A10
/* 801A19F0 0019E9F0  7F A3 EB 78 */	mr r3, r29
/* 801A19F4 0019E9F4  48 00 0C A5 */	bl BattleAudienceGetPtr
/* 801A19F8 0019E9F8  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A19FC 0019E9FC  28 00 00 12 */	cmplwi r0, 0x12
/* 801A1A00 0019EA00  41 82 00 10 */	beq .L_801A1A10
/* 801A1A04 0019EA04  7F BB E1 2E */	stwx r29, r27, r28
/* 801A1A08 0019EA08  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1A0C 0019EA0C  3B 9C 00 04 */	addi r28, r28, 4
.L_801A1A10:
/* 801A1A10 0019EA10  3B BD 00 01 */	addi r29, r29, 1
/* 801A1A14 0019EA14  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A1A18 0019EA18  40 81 FF C4 */	ble .L_801A19DC
/* 801A1A1C 0019EA1C  7F 43 D3 78 */	mr r3, r26
/* 801A1A20 0019EA20  4B E6 44 A5 */	bl irand
/* 801A1A24 0019EA24  54 60 10 3A */	slwi r0, r3, 2
/* 801A1A28 0019EA28  38 61 00 40 */	addi r3, r1, 0x40
/* 801A1A2C 0019EA2C  7F 23 00 2E */	lwzx r25, r3, r0
/* 801A1A30 0019EA30  7F 23 CB 78 */	mr r3, r25
/* 801A1A34 0019EA34  48 00 0C 65 */	bl BattleAudienceGetPtr
/* 801A1A38 0019EA38  7C 7B 1B 78 */	mr r27, r3
/* 801A1A3C 0019EA3C  7F 23 CB 78 */	mr r3, r25
/* 801A1A40 0019EA40  38 80 00 12 */	li r4, 0x12
/* 801A1A44 0019EA44  4B FF B0 35 */	bl BattleAudience_ChangeStatus
/* 801A1A48 0019EA48  38 00 00 05 */	li r0, 5
/* 801A1A4C 0019EA4C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1A50 0019EA50  90 1B 01 2C */	stw r0, 0x12c(r27)
/* 801A1A54 0019EA54  38 00 00 00 */	li r0, 0
/* 801A1A58 0019EA58  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1A5C 0019EA5C  48 00 02 28 */	b .L_801A1C84
/* 801A1A60 0019EA60  80 04 37 E0 */	lwz r0, 0x37e0(r4)
/* 801A1A64 0019EA64  2C 00 00 05 */	cmpwi r0, 5
/* 801A1A68 0019EA68  41 82 00 88 */	beq .L_801A1AF0
/* 801A1A6C 0019EA6C  40 80 02 18 */	bge .L_801A1C84
/* 801A1A70 0019EA70  2C 00 00 00 */	cmpwi r0, 0
/* 801A1A74 0019EA74  41 82 00 08 */	beq .L_801A1A7C
/* 801A1A78 0019EA78  48 00 02 0C */	b .L_801A1C84
.L_801A1A7C:
/* 801A1A7C 0019EA7C  3B 40 00 00 */	li r26, 0
/* 801A1A80 0019EA80  3B 61 00 40 */	addi r27, r1, 0x40
/* 801A1A84 0019EA84  7F 5D D3 78 */	mr r29, r26
/* 801A1A88 0019EA88  3B 80 00 00 */	li r28, 0
.L_801A1A8C:
/* 801A1A8C 0019EA8C  7F A3 EB 78 */	mr r3, r29
/* 801A1A90 0019EA90  38 80 00 0B */	li r4, 0xb
/* 801A1A94 0019EA94  48 00 03 15 */	bl check_exe_phase_evt_status
/* 801A1A98 0019EA98  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1A9C 0019EA9C  41 82 00 20 */	beq .L_801A1ABC
/* 801A1AA0 0019EAA0  7F A3 EB 78 */	mr r3, r29
/* 801A1AA4 0019EAA4  4B FF 98 49 */	bl BattleAudienceDetectPakkunEatTarget
/* 801A1AA8 0019EAA8  2C 03 FF FF */	cmpwi r3, -1
/* 801A1AAC 0019EAAC  41 82 00 10 */	beq .L_801A1ABC
/* 801A1AB0 0019EAB0  7F BB E1 2E */	stwx r29, r27, r28
/* 801A1AB4 0019EAB4  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1AB8 0019EAB8  3B 9C 00 04 */	addi r28, r28, 4
.L_801A1ABC:
/* 801A1ABC 0019EABC  3B BD 00 01 */	addi r29, r29, 1
/* 801A1AC0 0019EAC0  2C 1D 00 3B */	cmpwi r29, 0x3b
/* 801A1AC4 0019EAC4  40 81 FF C8 */	ble .L_801A1A8C
/* 801A1AC8 0019EAC8  7F 43 D3 78 */	mr r3, r26
/* 801A1ACC 0019EACC  4B E6 43 F9 */	bl irand
/* 801A1AD0 0019EAD0  54 60 10 3A */	slwi r0, r3, 2
/* 801A1AD4 0019EAD4  38 61 00 40 */	addi r3, r1, 0x40
/* 801A1AD8 0019EAD8  7C 63 00 2E */	lwzx r3, r3, r0
/* 801A1ADC 0019EADC  38 80 00 14 */	li r4, 0x14
/* 801A1AE0 0019EAE0  4B FF AF 99 */	bl BattleAudience_ChangeStatus
/* 801A1AE4 0019EAE4  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1AE8 0019EAE8  38 00 00 05 */	li r0, 5
/* 801A1AEC 0019EAEC  90 03 37 E0 */	stw r0, 0x37e0(r3)
.L_801A1AF0:
/* 801A1AF0 0019EAF0  3B 40 00 00 */	li r26, 0
.L_801A1AF4:
/* 801A1AF4 0019EAF4  7F 43 D3 78 */	mr r3, r26
/* 801A1AF8 0019EAF8  4B FF AE BD */	bl BattleAudience_GetSysCtrl
/* 801A1AFC 0019EAFC  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1B00 0019EB00  41 82 00 18 */	beq .L_801A1B18
/* 801A1B04 0019EB04  7F 43 D3 78 */	mr r3, r26
/* 801A1B08 0019EB08  48 00 0B 91 */	bl BattleAudienceGetPtr
/* 801A1B0C 0019EB0C  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A1B10 0019EB10  28 00 00 14 */	cmplwi r0, 0x14
/* 801A1B14 0019EB14  41 82 00 10 */	beq .L_801A1B24
.L_801A1B18:
/* 801A1B18 0019EB18  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1B1C 0019EB1C  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1B20 0019EB20  40 81 FF D4 */	ble .L_801A1AF4
.L_801A1B24:
/* 801A1B24 0019EB24  2C 1A 00 3C */	cmpwi r26, 0x3c
/* 801A1B28 0019EB28  40 82 01 5C */	bne .L_801A1C84
/* 801A1B2C 0019EB2C  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1B30 0019EB30  38 00 00 00 */	li r0, 0
/* 801A1B34 0019EB34  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1B38 0019EB38  48 00 01 4C */	b .L_801A1C84
/* 801A1B3C 0019EB3C  3B 40 00 00 */	li r26, 0
.L_801A1B40:
/* 801A1B40 0019EB40  7F 43 D3 78 */	mr r3, r26
/* 801A1B44 0019EB44  38 80 00 0C */	li r4, 0xc
/* 801A1B48 0019EB48  48 00 02 61 */	bl check_exe_phase_evt_status
/* 801A1B4C 0019EB4C  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1B50 0019EB50  41 82 00 18 */	beq .L_801A1B68
/* 801A1B54 0019EB54  7F 43 D3 78 */	mr r3, r26
/* 801A1B58 0019EB58  38 80 00 00 */	li r4, 0
/* 801A1B5C 0019EB5C  38 A0 00 01 */	li r5, 1
/* 801A1B60 0019EB60  4B FF DF A1 */	bl BattleAudienceItemOn
/* 801A1B64 0019EB64  48 00 00 10 */	b .L_801A1B74
.L_801A1B68:
/* 801A1B68 0019EB68  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1B6C 0019EB6C  2C 1A 00 3B */	cmpwi r26, 0x3b
/* 801A1B70 0019EB70  40 81 FF D0 */	ble .L_801A1B40
.L_801A1B74:
/* 801A1B74 0019EB74  3C 7E 00 01 */	addis r3, r30, 1
/* 801A1B78 0019EB78  38 00 00 00 */	li r0, 0
/* 801A1B7C 0019EB7C  90 03 39 04 */	stw r0, 0x3904(r3)
/* 801A1B80 0019EB80  48 00 01 04 */	b .L_801A1C84
.L_801A1B84:
/* 801A1B84 0019EB84  38 00 00 0F */	li r0, 0xf
/* 801A1B88 0019EB88  90 04 37 DC */	stw r0, 0x37dc(r4)
/* 801A1B8C 0019EB8C  48 00 00 F8 */	b .L_801A1C84
/* 801A1B90 0019EB90  3B 40 00 00 */	li r26, 0
/* 801A1B94 0019EB94  7F 5B D3 78 */	mr r27, r26
.L_801A1B98:
/* 801A1B98 0019EB98  7F 43 D3 78 */	mr r3, r26
/* 801A1B9C 0019EB9C  48 00 0A FD */	bl BattleAudienceGetPtr
/* 801A1BA0 0019EBA0  7C 7C 1B 78 */	mr r28, r3
/* 801A1BA4 0019EBA4  7F 43 D3 78 */	mr r3, r26
/* 801A1BA8 0019EBA8  4B FF AE 0D */	bl BattleAudience_GetSysCtrl
/* 801A1BAC 0019EBAC  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A1BB0 0019EBB0  28 00 00 01 */	cmplwi r0, 1
/* 801A1BB4 0019EBB4  40 82 00 38 */	bne .L_801A1BEC
/* 801A1BB8 0019EBB8  88 1C 00 19 */	lbz r0, 0x19(r28)
/* 801A1BBC 0019EBBC  28 00 00 0D */	cmplwi r0, 0xd
/* 801A1BC0 0019EBC0  40 82 00 2C */	bne .L_801A1BEC
/* 801A1BC4 0019EBC4  80 7C 00 F4 */	lwz r3, 0xf4(r28)
/* 801A1BC8 0019EBC8  38 03 FF FF */	addi r0, r3, -1
/* 801A1BCC 0019EBCC  90 1C 00 F4 */	stw r0, 0xf4(r28)
/* 801A1BD0 0019EBD0  80 1C 00 F4 */	lwz r0, 0xf4(r28)
/* 801A1BD4 0019EBD4  2C 00 00 00 */	cmpwi r0, 0
/* 801A1BD8 0019EBD8  41 81 00 14 */	bgt .L_801A1BEC
/* 801A1BDC 0019EBDC  7F 43 D3 78 */	mr r3, r26
/* 801A1BE0 0019EBE0  38 80 00 03 */	li r4, 3
/* 801A1BE4 0019EBE4  4B FF AE 95 */	bl BattleAudience_ChangeStatus
/* 801A1BE8 0019EBE8  93 7C 00 F4 */	stw r27, 0xf4(r28)
.L_801A1BEC:
/* 801A1BEC 0019EBEC  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1BF0 0019EBF0  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 801A1BF4 0019EBF4  41 80 FF A4 */	blt .L_801A1B98
/* 801A1BF8 0019EBF8  3B 40 00 00 */	li r26, 0
/* 801A1BFC 0019EBFC  3B 60 00 04 */	li r27, 4
.L_801A1C00:
/* 801A1C00 0019EC00  7F 43 D3 78 */	mr r3, r26
/* 801A1C04 0019EC04  48 00 0A 95 */	bl BattleAudienceGetPtr
/* 801A1C08 0019EC08  7C 7C 1B 78 */	mr r28, r3
/* 801A1C0C 0019EC0C  7F 43 D3 78 */	mr r3, r26
/* 801A1C10 0019EC10  4B FF AD A5 */	bl BattleAudience_GetSysCtrl
/* 801A1C14 0019EC14  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A1C18 0019EC18  28 00 00 01 */	cmplwi r0, 1
/* 801A1C1C 0019EC1C  40 82 00 38 */	bne .L_801A1C54
/* 801A1C20 0019EC20  88 1C 00 1B */	lbz r0, 0x1b(r28)
/* 801A1C24 0019EC24  28 00 00 08 */	cmplwi r0, 8
/* 801A1C28 0019EC28  40 82 00 2C */	bne .L_801A1C54
/* 801A1C2C 0019EC2C  88 1C 00 19 */	lbz r0, 0x19(r28)
/* 801A1C30 0019EC30  28 00 00 11 */	cmplwi r0, 0x11
/* 801A1C34 0019EC34  40 82 00 20 */	bne .L_801A1C54
/* 801A1C38 0019EC38  80 7C 01 2C */	lwz r3, 0x12c(r28)
/* 801A1C3C 0019EC3C  38 03 FF FF */	addi r0, r3, -1
/* 801A1C40 0019EC40  90 1C 01 2C */	stw r0, 0x12c(r28)
/* 801A1C44 0019EC44  80 1C 01 2C */	lwz r0, 0x12c(r28)
/* 801A1C48 0019EC48  2C 00 00 00 */	cmpwi r0, 0
/* 801A1C4C 0019EC4C  41 81 00 08 */	bgt .L_801A1C54
/* 801A1C50 0019EC50  93 7C 00 04 */	stw r27, 4(r28)
.L_801A1C54:
/* 801A1C54 0019EC54  3B 5A 00 01 */	addi r26, r26, 1
/* 801A1C58 0019EC58  2C 1A 00 C8 */	cmpwi r26, 0xc8
/* 801A1C5C 0019EC5C  41 80 FF A4 */	blt .L_801A1C00
/* 801A1C60 0019EC60  48 05 D2 6D */	bl BattleBreakSlot_DecBreakTurn
/* 801A1C64 0019EC64  80 BE 00 00 */	lwz r5, 0(r30)
/* 801A1C68 0019EC68  3C 9E 00 01 */	addis r4, r30, 1
/* 801A1C6C 0019EC6C  38 00 00 00 */	li r0, 0
/* 801A1C70 0019EC70  38 60 00 00 */	li r3, 0
/* 801A1C74 0019EC74  54 A5 07 76 */	rlwinm r5, r5, 0, 0x1d, 0x1b
/* 801A1C78 0019EC78  90 BE 00 00 */	stw r5, 0(r30)
/* 801A1C7C 0019EC7C  90 04 39 04 */	stw r0, 0x3904(r4)
/* 801A1C80 0019EC80  48 00 00 08 */	b .L_801A1C88
.L_801A1C84:
/* 801A1C84 0019EC84  38 60 00 01 */	li r3, 1
.L_801A1C88:
/* 801A1C88 0019EC88  BB 21 03 64 */	lmw r25, 0x364(r1)
/* 801A1C8C 0019EC8C  80 01 03 84 */	lwz r0, 0x384(r1)
/* 801A1C90 0019EC90  7C 08 03 A6 */	mtlr r0
/* 801A1C94 0019EC94  38 21 03 80 */	addi r1, r1, 0x380
/* 801A1C98 0019EC98  4E 80 00 20 */	blr 

.global BattleAudience_PerPhase
BattleAudience_PerPhase:
/* 801A1C9C 0019EC9C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801A1CA0 0019ECA0  7C 08 02 A6 */	mflr r0
/* 801A1CA4 0019ECA4  90 01 00 24 */	stw r0, 0x24(r1)
/* 801A1CA8 0019ECA8  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 801A1CAC 0019ECAC  7C 7B 1B 78 */	mr r27, r3
/* 801A1CB0 0019ECB0  48 00 0A 25 */	bl BattleAudienceBaseGetPtr
/* 801A1CB4 0019ECB4  3C 1B FC 00 */	addis r0, r27, 0xfc00
/* 801A1CB8 0019ECB8  7C 7D 1B 78 */	mr r29, r3
/* 801A1CBC 0019ECBC  28 00 00 02 */	cmplwi r0, 2
/* 801A1CC0 0019ECC0  40 82 00 AC */	bne .L_801A1D6C
/* 801A1CC4 0019ECC4  80 1D 00 00 */	lwz r0, 0(r29)
/* 801A1CC8 0019ECC8  54 00 03 5B */	rlwinm. r0, r0, 0, 0xd, 0xd
/* 801A1CCC 0019ECCC  40 82 00 A0 */	bne .L_801A1D6C
/* 801A1CD0 0019ECD0  3B 80 00 00 */	li r28, 0
.L_801A1CD4:
/* 801A1CD4 0019ECD4  7F 83 E3 78 */	mr r3, r28
/* 801A1CD8 0019ECD8  48 00 09 C1 */	bl BattleAudienceGetPtr
/* 801A1CDC 0019ECDC  7C 7E 1B 78 */	mr r30, r3
/* 801A1CE0 0019ECE0  7F 83 E3 78 */	mr r3, r28
/* 801A1CE4 0019ECE4  4B FF AD 31 */	bl BattleAudience_GetExist
/* 801A1CE8 0019ECE8  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A1CEC 0019ECEC  28 00 00 01 */	cmplwi r0, 1
/* 801A1CF0 0019ECF0  40 82 00 3C */	bne .L_801A1D2C
/* 801A1CF4 0019ECF4  88 1E 00 19 */	lbz r0, 0x19(r30)
/* 801A1CF8 0019ECF8  28 00 00 07 */	cmplwi r0, 7
/* 801A1CFC 0019ECFC  40 82 00 30 */	bne .L_801A1D2C
/* 801A1D00 0019ED00  A8 7E 00 1C */	lha r3, 0x1c(r30)
/* 801A1D04 0019ED04  2C 03 FF FF */	cmpwi r3, -1
/* 801A1D08 0019ED08  41 82 00 10 */	beq .L_801A1D18
/* 801A1D0C 0019ED0C  3B E0 00 00 */	li r31, 0
/* 801A1D10 0019ED10  48 00 09 49 */	bl BattleAudienceItemGetPtr
/* 801A1D14 0019ED14  93 E3 00 00 */	stw r31, 0(r3)
.L_801A1D18:
/* 801A1D18 0019ED18  38 00 FF FF */	li r0, -1
/* 801A1D1C 0019ED1C  7F 83 E3 78 */	mr r3, r28
/* 801A1D20 0019ED20  B0 1E 00 1C */	sth r0, 0x1c(r30)
/* 801A1D24 0019ED24  38 80 00 00 */	li r4, 0
/* 801A1D28 0019ED28  4B FF AD 51 */	bl BattleAudience_ChangeStatus
.L_801A1D2C:
/* 801A1D2C 0019ED2C  3B 9C 00 01 */	addi r28, r28, 1
/* 801A1D30 0019ED30  2C 1C 00 C8 */	cmpwi r28, 0xc8
/* 801A1D34 0019ED34  41 80 FF A0 */	blt .L_801A1CD4
/* 801A1D38 0019ED38  3B C0 00 00 */	li r30, 0
/* 801A1D3C 0019ED3C  7F DF F3 78 */	mr r31, r30
.L_801A1D40:
/* 801A1D40 0019ED40  7F C3 F3 78 */	mr r3, r30
/* 801A1D44 0019ED44  48 00 09 15 */	bl BattleAudienceItemGetPtr
/* 801A1D48 0019ED48  80 03 00 04 */	lwz r0, 4(r3)
/* 801A1D4C 0019ED4C  2C 00 00 01 */	cmpwi r0, 1
/* 801A1D50 0019ED50  41 81 00 10 */	bgt .L_801A1D60
/* 801A1D54 0019ED54  7F C3 F3 78 */	mr r3, r30
/* 801A1D58 0019ED58  48 00 09 01 */	bl BattleAudienceItemGetPtr
/* 801A1D5C 0019ED5C  93 E3 00 00 */	stw r31, 0(r3)
.L_801A1D60:
/* 801A1D60 0019ED60  3B DE 00 01 */	addi r30, r30, 1
/* 801A1D64 0019ED64  2C 1E 00 64 */	cmpwi r30, 0x64
/* 801A1D68 0019ED68  41 80 FF D8 */	blt .L_801A1D40
.L_801A1D6C:
/* 801A1D6C 0019ED6C  3C 1B FC 00 */	addis r0, r27, 0xfc00
/* 801A1D70 0019ED70  28 00 00 04 */	cmplwi r0, 4
/* 801A1D74 0019ED74  40 82 00 20 */	bne .L_801A1D94
/* 801A1D78 0019ED78  4B FF DC E9 */	bl BattleAudienceSetThrowItemMax
/* 801A1D7C 0019ED7C  80 9D 00 00 */	lwz r4, 0(r29)
/* 801A1D80 0019ED80  3C 7D 00 01 */	addis r3, r29, 1
/* 801A1D84 0019ED84  38 00 00 00 */	li r0, 0
/* 801A1D88 0019ED88  60 84 00 08 */	ori r4, r4, 8
/* 801A1D8C 0019ED8C  90 9D 00 00 */	stw r4, 0(r29)
/* 801A1D90 0019ED90  90 03 37 DC */	stw r0, 0x37dc(r3)
.L_801A1D94:
/* 801A1D94 0019ED94  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 801A1D98 0019ED98  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801A1D9C 0019ED9C  7C 08 03 A6 */	mtlr r0
/* 801A1DA0 0019EDA0  38 21 00 20 */	addi r1, r1, 0x20
/* 801A1DA4 0019EDA4  4E 80 00 20 */	blr 

.global check_exe_phase_evt_status
check_exe_phase_evt_status:
/* 801A1DA8 0019EDA8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801A1DAC 0019EDAC  7C 08 02 A6 */	mflr r0
/* 801A1DB0 0019EDB0  90 01 00 24 */	stw r0, 0x24(r1)
/* 801A1DB4 0019EDB4  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 801A1DB8 0019EDB8  7C 7D 1B 78 */	mr r29, r3
/* 801A1DBC 0019EDBC  7C 9E 23 78 */	mr r30, r4
/* 801A1DC0 0019EDC0  48 00 08 D9 */	bl BattleAudienceGetPtr
/* 801A1DC4 0019EDC4  7C 7F 1B 78 */	mr r31, r3
/* 801A1DC8 0019EDC8  7F A3 EB 78 */	mr r3, r29
/* 801A1DCC 0019EDCC  4B FF AB E9 */	bl BattleAudience_GetSysCtrl
/* 801A1DD0 0019EDD0  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 801A1DD4 0019EDD4  40 82 00 0C */	bne .L_801A1DE0
/* 801A1DD8 0019EDD8  38 60 00 00 */	li r3, 0
/* 801A1DDC 0019EDDC  48 00 00 74 */	b .L_801A1E50
.L_801A1DE0:
/* 801A1DE0 0019EDE0  88 1F 00 1B */	lbz r0, 0x1b(r31)
/* 801A1DE4 0019EDE4  7C 00 F0 00 */	cmpw r0, r30
/* 801A1DE8 0019EDE8  41 82 00 0C */	beq .L_801A1DF4
/* 801A1DEC 0019EDEC  38 60 00 00 */	li r3, 0
/* 801A1DF0 0019EDF0  48 00 00 60 */	b .L_801A1E50
.L_801A1DF4:
/* 801A1DF4 0019EDF4  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 801A1DF8 0019EDF8  28 00 00 0D */	cmplwi r0, 0xd
/* 801A1DFC 0019EDFC  40 82 00 0C */	bne .L_801A1E08
/* 801A1E00 0019EE00  38 60 00 00 */	li r3, 0
/* 801A1E04 0019EE04  48 00 00 4C */	b .L_801A1E50
.L_801A1E08:
/* 801A1E08 0019EE08  28 00 00 0C */	cmplwi r0, 0xc
/* 801A1E0C 0019EE0C  40 82 00 0C */	bne .L_801A1E18
/* 801A1E10 0019EE10  38 60 00 00 */	li r3, 0
/* 801A1E14 0019EE14  48 00 00 3C */	b .L_801A1E50
.L_801A1E18:
/* 801A1E18 0019EE18  28 00 00 0B */	cmplwi r0, 0xb
/* 801A1E1C 0019EE1C  40 82 00 0C */	bne .L_801A1E28
/* 801A1E20 0019EE20  38 60 00 00 */	li r3, 0
/* 801A1E24 0019EE24  48 00 00 2C */	b .L_801A1E50
.L_801A1E28:
/* 801A1E28 0019EE28  28 00 00 15 */	cmplwi r0, 0x15
/* 801A1E2C 0019EE2C  40 82 00 0C */	bne .L_801A1E38
/* 801A1E30 0019EE30  38 60 00 00 */	li r3, 0
/* 801A1E34 0019EE34  48 00 00 1C */	b .L_801A1E50
.L_801A1E38:
/* 801A1E38 0019EE38  28 00 00 16 */	cmplwi r0, 0x16
/* 801A1E3C 0019EE3C  40 82 00 0C */	bne .L_801A1E48
/* 801A1E40 0019EE40  38 60 00 00 */	li r3, 0
/* 801A1E44 0019EE44  48 00 00 0C */	b .L_801A1E50
.L_801A1E48:
/* 801A1E48 0019EE48  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A1E4C 0019EE4C  54 03 EF FE */	rlwinm r3, r0, 0x1d, 0x1f, 0x1f
.L_801A1E50:
/* 801A1E50 0019EE50  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 801A1E54 0019EE54  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801A1E58 0019EE58  7C 08 03 A6 */	mtlr r0
/* 801A1E5C 0019EE5C  38 21 00 20 */	addi r1, r1, 0x20
/* 801A1E60 0019EE60  4E 80 00 20 */	blr 

.global BattleAudience_CheckReaction
BattleAudience_CheckReaction:
/* 801A1E64 0019EE64  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A1E68 0019EE68  7C 08 02 A6 */	mflr r0
/* 801A1E6C 0019EE6C  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A1E70 0019EE70  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801A1E74 0019EE74  48 00 08 61 */	bl BattleAudienceBaseGetPtr
/* 801A1E78 0019EE78  7C 7F 1B 78 */	mr r31, r3
/* 801A1E7C 0019EE7C  38 60 00 00 */	li r3, 0
/* 801A1E80 0019EE80  48 00 08 19 */	bl BattleAudienceGetPtr
/* 801A1E84 0019EE84  80 7F 00 04 */	lwz r3, 4(r31)
/* 801A1E88 0019EE88  28 03 00 00 */	cmplwi r3, 0
/* 801A1E8C 0019EE8C  41 82 00 1C */	beq .L_801A1EA8
/* 801A1E90 0019EE90  80 63 01 5C */	lwz r3, 0x15c(r3)
/* 801A1E94 0019EE94  4B E9 40 D5 */	bl evtCheckID
/* 801A1E98 0019EE98  2C 03 00 00 */	cmpwi r3, 0
/* 801A1E9C 0019EE9C  41 82 00 0C */	beq .L_801A1EA8
/* 801A1EA0 0019EEA0  38 60 00 01 */	li r3, 1
/* 801A1EA4 0019EEA4  48 00 00 10 */	b .L_801A1EB4
.L_801A1EA8:
/* 801A1EA8 0019EEA8  38 00 00 00 */	li r0, 0
/* 801A1EAC 0019EEAC  38 60 00 00 */	li r3, 0
/* 801A1EB0 0019EEB0  90 1F 00 04 */	stw r0, 4(r31)
.L_801A1EB4:
/* 801A1EB4 0019EEB4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A1EB8 0019EEB8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801A1EBC 0019EEBC  7C 08 03 A6 */	mtlr r0
/* 801A1EC0 0019EEC0  38 21 00 10 */	addi r1, r1, 0x10
/* 801A1EC4 0019EEC4  4E 80 00 20 */	blr 

.global BattleAudience_PerAct
BattleAudience_PerAct:
/* 801A1EC8 0019EEC8  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 801A1ECC 0019EECC  7C 08 02 A6 */	mflr r0
/* 801A1ED0 0019EED0  90 01 00 44 */	stw r0, 0x44(r1)
/* 801A1ED4 0019EED4  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 801A1ED8 0019EED8  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 801A1EDC 0019EEDC  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 801A1EE0 0019EEE0  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 801A1EE4 0019EEE4  BF C1 00 18 */	stmw r30, 0x18(r1)
/* 801A1EE8 0019EEE8  48 00 07 ED */	bl BattleAudienceBaseGetPtr
/* 801A1EEC 0019EEEC  7C 7F 1B 78 */	mr r31, r3
/* 801A1EF0 0019EEF0  4B F2 FD 85 */	bl func_800D1C74
/* 801A1EF4 0019EEF4  80 7F 00 00 */	lwz r3, 0(r31)
/* 801A1EF8 0019EEF8  C3 E2 D2 98 */	lfs f31, lbl_8041E618@sda21(r2)
/* 801A1EFC 0019EEFC  54 60 05 EF */	rlwinm. r0, r3, 0, 0x17, 0x17
/* 801A1F00 0019EF00  FF C0 F8 90 */	fmr f30, f31
/* 801A1F04 0019EF04  41 82 00 18 */	beq .L_801A1F1C
/* 801A1F08 0019EF08  54 60 05 AD */	rlwinm. r0, r3, 0, 0x16, 0x16
/* 801A1F0C 0019EF0C  40 82 00 18 */	bne .L_801A1F24
/* 801A1F10 0019EF10  38 60 00 03 */	li r3, 3
/* 801A1F14 0019EF14  4B FF 98 01 */	bl BattleAudienceCheer
/* 801A1F18 0019EF18  48 00 00 0C */	b .L_801A1F24
.L_801A1F1C:
/* 801A1F1C 0019EF1C  38 60 00 02 */	li r3, 2
/* 801A1F20 0019EF20  4B FF 97 F5 */	bl BattleAudienceCheer
.L_801A1F24:
/* 801A1F24 0019EF24  80 7F 00 00 */	lwz r3, 0(r31)
/* 801A1F28 0019EF28  54 60 03 5B */	rlwinm. r0, r3, 0, 0xd, 0xd
/* 801A1F2C 0019EF2C  40 82 03 B8 */	bne .L_801A22E4
/* 801A1F30 0019EF30  54 60 05 6B */	rlwinm. r0, r3, 0, 0x15, 0x15
/* 801A1F34 0019EF34  40 82 00 1C */	bne .L_801A1F50
/* 801A1F38 0019EF38  54 60 05 29 */	rlwinm. r0, r3, 0, 0x14, 0x14
/* 801A1F3C 0019EF3C  41 82 00 14 */	beq .L_801A1F50
/* 801A1F40 0019EF40  C0 02 D2 AC */	lfs f0, lbl_8041E62C@sda21(r2)
/* 801A1F44 0019EF44  38 60 00 05 */	li r3, 5
/* 801A1F48 0019EF48  EF FF 00 28 */	fsubs f31, f31, f0
/* 801A1F4C 0019EF4C  4B FF 98 69 */	bl BattleAudienceAddPhaseEvtList
.L_801A1F50:
/* 801A1F50 0019EF50  3C 7F 00 01 */	addis r3, r31, 1
/* 801A1F54 0019EF54  80 03 37 C8 */	lwz r0, 0x37c8(r3)
/* 801A1F58 0019EF58  28 00 00 00 */	cmplwi r0, 0
/* 801A1F5C 0019EF5C  41 82 00 D0 */	beq .L_801A202C
/* 801A1F60 0019EF60  80 7F 00 00 */	lwz r3, 0(r31)
/* 801A1F64 0019EF64  54 64 06 F7 */	rlwinm. r4, r3, 0, 0x1b, 0x1b
/* 801A1F68 0019EF68  40 82 00 0C */	bne .L_801A1F74
/* 801A1F6C 0019EF6C  54 60 06 B5 */	rlwinm. r0, r3, 0, 0x1a, 0x1a
/* 801A1F70 0019EF70  41 82 00 BC */	beq .L_801A202C
.L_801A1F74:
/* 801A1F74 0019EF74  2C 04 00 00 */	cmpwi r4, 0
/* 801A1F78 0019EF78  41 82 00 74 */	beq .L_801A1FEC
/* 801A1F7C 0019EF7C  3C 9F 00 01 */	addis r4, r31, 1
/* 801A1F80 0019EF80  3B C0 00 01 */	li r30, 1
/* 801A1F84 0019EF84  80 64 37 CC */	lwz r3, 0x37cc(r4)
/* 801A1F88 0019EF88  38 03 00 01 */	addi r0, r3, 1
/* 801A1F8C 0019EF8C  90 04 37 CC */	stw r0, 0x37cc(r4)
/* 801A1F90 0019EF90  80 04 37 CC */	lwz r0, 0x37cc(r4)
/* 801A1F94 0019EF94  2C 00 00 02 */	cmpwi r0, 2
/* 801A1F98 0019EF98  40 81 00 0C */	ble .L_801A1FA4
/* 801A1F9C 0019EF9C  38 00 00 02 */	li r0, 2
/* 801A1FA0 0019EFA0  90 04 37 CC */	stw r0, 0x37cc(r4)
.L_801A1FA4:
/* 801A1FA4 0019EFA4  3C DF 00 01 */	addis r6, r31, 1
/* 801A1FA8 0019EFA8  3C 00 43 30 */	lis r0, 0x4330
/* 801A1FAC 0019EFAC  80 86 37 CC */	lwz r4, 0x37cc(r6)
/* 801A1FB0 0019EFB0  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 801A1FB4 0019EFB4  38 A3 9A 00 */	addi r5, r3, lbl_802F9A00@l
/* 801A1FB8 0019EFB8  80 66 37 C8 */	lwz r3, 0x37c8(r6)
/* 801A1FBC 0019EFBC  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 801A1FC0 0019EFC0  90 01 00 08 */	stw r0, 8(r1)
/* 801A1FC4 0019EFC4  C8 45 00 00 */	lfd f2, 0(r5)
/* 801A1FC8 0019EFC8  38 00 00 00 */	li r0, 0
/* 801A1FCC 0019EFCC  90 81 00 0C */	stw r4, 0xc(r1)
/* 801A1FD0 0019EFD0  C0 03 00 04 */	lfs f0, 4(r3)
/* 801A1FD4 0019EFD4  C8 21 00 08 */	lfd f1, 8(r1)
/* 801A1FD8 0019EFD8  90 06 37 D0 */	stw r0, 0x37d0(r6)
/* 801A1FDC 0019EFDC  EC 21 10 28 */	fsubs f1, f1, f2
/* 801A1FE0 0019EFE0  EF C1 00 32 */	fmuls f30, f1, f0
/* 801A1FE4 0019EFE4  EF FF F0 2A */	fadds f31, f31, f30
/* 801A1FE8 0019EFE8  48 00 00 44 */	b .L_801A202C
.L_801A1FEC:
/* 801A1FEC 0019EFEC  54 60 04 E7 */	rlwinm. r0, r3, 0, 0x13, 0x13
/* 801A1FF0 0019EFF0  40 82 00 3C */	bne .L_801A202C
/* 801A1FF4 0019EFF4  3C 9F 00 01 */	addis r4, r31, 1
/* 801A1FF8 0019EFF8  38 00 00 00 */	li r0, 0
/* 801A1FFC 0019EFFC  90 04 37 CC */	stw r0, 0x37cc(r4)
/* 801A2000 0019F000  3B C0 00 00 */	li r30, 0
/* 801A2004 0019F004  80 64 37 D0 */	lwz r3, 0x37d0(r4)
/* 801A2008 0019F008  38 03 00 01 */	addi r0, r3, 1
/* 801A200C 0019F00C  90 04 37 D0 */	stw r0, 0x37d0(r4)
/* 801A2010 0019F010  80 04 37 D0 */	lwz r0, 0x37d0(r4)
/* 801A2014 0019F014  2C 00 00 05 */	cmpwi r0, 5
/* 801A2018 0019F018  40 81 00 0C */	ble .L_801A2024
/* 801A201C 0019F01C  38 00 00 05 */	li r0, 5
/* 801A2020 0019F020  90 04 37 D0 */	stw r0, 0x37d0(r4)
.L_801A2024:
/* 801A2024 0019F024  C3 C2 D3 90 */	lfs f30, lbl_8041E710@sda21(r2)
/* 801A2028 0019F028  EF FF F0 2A */	fadds f31, f31, f30
.L_801A202C:
/* 801A202C 0019F02C  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A2030 0019F030  54 03 06 73 */	rlwinm. r3, r0, 0, 0x19, 0x19
/* 801A2034 0019F034  40 82 00 0C */	bne .L_801A2040
/* 801A2038 0019F038  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 801A203C 0019F03C  41 82 00 80 */	beq .L_801A20BC
.L_801A2040:
/* 801A2040 0019F040  2C 03 00 00 */	cmpwi r3, 0
/* 801A2044 0019F044  41 82 00 68 */	beq .L_801A20AC
/* 801A2048 0019F048  3C 9F 00 01 */	addis r4, r31, 1
/* 801A204C 0019F04C  3B C0 00 01 */	li r30, 1
/* 801A2050 0019F050  80 64 37 CC */	lwz r3, 0x37cc(r4)
/* 801A2054 0019F054  38 03 00 01 */	addi r0, r3, 1
/* 801A2058 0019F058  90 04 37 CC */	stw r0, 0x37cc(r4)
/* 801A205C 0019F05C  80 04 37 CC */	lwz r0, 0x37cc(r4)
/* 801A2060 0019F060  2C 00 00 02 */	cmpwi r0, 2
/* 801A2064 0019F064  40 81 00 0C */	ble .L_801A2070
/* 801A2068 0019F068  38 00 00 02 */	li r0, 2
/* 801A206C 0019F06C  90 04 37 CC */	stw r0, 0x37cc(r4)
.L_801A2070:
/* 801A2070 0019F070  3C FF 00 01 */	addis r7, r31, 1
/* 801A2074 0019F074  3C 60 43 30 */	lis r3, 0x4330
/* 801A2078 0019F078  80 C7 37 CC */	lwz r6, 0x37cc(r7)
/* 801A207C 0019F07C  3C 80 80 30 */	lis r4, lbl_802F9A00@ha
/* 801A2080 0019F080  38 A4 9A 00 */	addi r5, r4, lbl_802F9A00@l
/* 801A2084 0019F084  38 00 00 00 */	li r0, 0
/* 801A2088 0019F088  6C C4 80 00 */	xoris r4, r6, 0x8000
/* 801A208C 0019F08C  90 61 00 08 */	stw r3, 8(r1)
/* 801A2090 0019F090  C8 25 00 00 */	lfd f1, 0(r5)
/* 801A2094 0019F094  90 81 00 0C */	stw r4, 0xc(r1)
/* 801A2098 0019F098  C8 01 00 08 */	lfd f0, 8(r1)
/* 801A209C 0019F09C  90 07 37 D0 */	stw r0, 0x37d0(r7)
/* 801A20A0 0019F0A0  EF C0 08 28 */	fsubs f30, f0, f1
/* 801A20A4 0019F0A4  EF FF F0 2A */	fadds f31, f31, f30
/* 801A20A8 0019F0A8  48 00 00 14 */	b .L_801A20BC
.L_801A20AC:
/* 801A20AC 0019F0AC  3C 7F 00 01 */	addis r3, r31, 1
/* 801A20B0 0019F0B0  38 00 00 00 */	li r0, 0
/* 801A20B4 0019F0B4  90 03 37 CC */	stw r0, 0x37cc(r3)
/* 801A20B8 0019F0B8  3B C0 00 00 */	li r30, 0
.L_801A20BC:
/* 801A20BC 0019F0BC  2C 1E 00 01 */	cmpwi r30, 1
/* 801A20C0 0019F0C0  40 82 00 68 */	bne .L_801A2128
/* 801A20C4 0019F0C4  C0 02 D3 5C */	lfs f0, lbl_8041E6DC@sda21(r2)
/* 801A20C8 0019F0C8  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A20CC 0019F0CC  4C 41 13 82 */	cror 2, 1, 2
/* 801A20D0 0019F0D0  40 82 00 0C */	bne .L_801A20DC
/* 801A20D4 0019F0D4  38 60 00 00 */	li r3, 0
/* 801A20D8 0019F0D8  4B FF 96 DD */	bl BattleAudienceAddPhaseEvtList
.L_801A20DC:
/* 801A20DC 0019F0DC  C0 02 D3 10 */	lfs f0, lbl_8041E690@sda21(r2)
/* 801A20E0 0019F0E0  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A20E4 0019F0E4  4C 41 13 82 */	cror 2, 1, 2
/* 801A20E8 0019F0E8  40 82 00 0C */	bne .L_801A20F4
/* 801A20EC 0019F0EC  38 60 00 03 */	li r3, 3
/* 801A20F0 0019F0F0  4B FF 96 C5 */	bl BattleAudienceAddPhaseEvtList
.L_801A20F4:
/* 801A20F4 0019F0F4  C0 02 D3 28 */	lfs f0, lbl_8041E6A8@sda21(r2)
/* 801A20F8 0019F0F8  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A20FC 0019F0FC  4C 41 13 82 */	cror 2, 1, 2
/* 801A2100 0019F100  40 82 00 0C */	bne .L_801A210C
/* 801A2104 0019F104  38 60 00 08 */	li r3, 8
/* 801A2108 0019F108  4B FF 96 AD */	bl BattleAudienceAddPhaseEvtList
.L_801A210C:
/* 801A210C 0019F10C  C0 02 D3 74 */	lfs f0, lbl_8041E6F4@sda21(r2)
/* 801A2110 0019F110  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2114 0019F114  4C 41 13 82 */	cror 2, 1, 2
/* 801A2118 0019F118  40 82 00 A0 */	bne .L_801A21B8
/* 801A211C 0019F11C  38 60 00 0D */	li r3, 0xd
/* 801A2120 0019F120  4B FF 96 95 */	bl BattleAudienceAddPhaseEvtList
/* 801A2124 0019F124  48 00 00 94 */	b .L_801A21B8
.L_801A2128:
/* 801A2128 0019F128  C0 02 D3 94 */	lfs f0, lbl_8041E714@sda21(r2)
/* 801A212C 0019F12C  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2130 0019F130  4C 40 13 82 */	cror 2, 0, 2
/* 801A2134 0019F134  40 82 00 0C */	bne .L_801A2140
/* 801A2138 0019F138  38 60 00 01 */	li r3, 1
/* 801A213C 0019F13C  4B FF 96 79 */	bl BattleAudienceAddPhaseEvtList
.L_801A2140:
/* 801A2140 0019F140  C0 02 D3 20 */	lfs f0, lbl_8041E6A0@sda21(r2)
/* 801A2144 0019F144  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2148 0019F148  4C 40 13 82 */	cror 2, 0, 2
/* 801A214C 0019F14C  40 82 00 0C */	bne .L_801A2158
/* 801A2150 0019F150  38 60 00 02 */	li r3, 2
/* 801A2154 0019F154  4B FF 96 61 */	bl BattleAudienceAddPhaseEvtList
.L_801A2158:
/* 801A2158 0019F158  C0 02 D3 20 */	lfs f0, lbl_8041E6A0@sda21(r2)
/* 801A215C 0019F15C  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2160 0019F160  4C 40 13 82 */	cror 2, 0, 2
/* 801A2164 0019F164  40 82 00 0C */	bne .L_801A2170
/* 801A2168 0019F168  38 60 00 05 */	li r3, 5
/* 801A216C 0019F16C  4B FF 96 49 */	bl BattleAudienceAddPhaseEvtList
.L_801A2170:
/* 801A2170 0019F170  C0 02 D3 94 */	lfs f0, lbl_8041E714@sda21(r2)
/* 801A2174 0019F174  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2178 0019F178  4C 40 13 82 */	cror 2, 0, 2
/* 801A217C 0019F17C  40 82 00 0C */	bne .L_801A2188
/* 801A2180 0019F180  38 60 00 09 */	li r3, 9
/* 801A2184 0019F184  4B FF 96 31 */	bl BattleAudienceAddPhaseEvtList
.L_801A2188:
/* 801A2188 0019F188  C0 02 D3 20 */	lfs f0, lbl_8041E6A0@sda21(r2)
/* 801A218C 0019F18C  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2190 0019F190  4C 40 13 82 */	cror 2, 0, 2
/* 801A2194 0019F194  40 82 00 0C */	bne .L_801A21A0
/* 801A2198 0019F198  38 60 00 0B */	li r3, 0xb
/* 801A219C 0019F19C  4B FF 96 19 */	bl BattleAudienceAddPhaseEvtList
.L_801A21A0:
/* 801A21A0 0019F1A0  C0 02 D3 7C */	lfs f0, lbl_8041E6FC@sda21(r2)
/* 801A21A4 0019F1A4  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A21A8 0019F1A8  4C 40 13 82 */	cror 2, 0, 2
/* 801A21AC 0019F1AC  40 82 00 0C */	bne .L_801A21B8
/* 801A21B0 0019F1B0  38 60 00 0D */	li r3, 0xd
/* 801A21B4 0019F1B4  4B FF 96 01 */	bl BattleAudienceAddPhaseEvtList
.L_801A21B8:
/* 801A21B8 0019F1B8  3C 7F 00 01 */	addis r3, r31, 1
/* 801A21BC 0019F1BC  80 A3 37 C8 */	lwz r5, 0x37c8(r3)
/* 801A21C0 0019F1C0  28 05 00 00 */	cmplwi r5, 0
/* 801A21C4 0019F1C4  41 82 00 D4 */	beq .L_801A2298
/* 801A21C8 0019F1C8  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A21CC 0019F1CC  54 03 05 EF */	rlwinm. r3, r0, 0, 0x17, 0x17
/* 801A21D0 0019F1D0  40 82 00 0C */	bne .L_801A21DC
/* 801A21D4 0019F1D4  54 00 05 AD */	rlwinm. r0, r0, 0, 0x16, 0x16
/* 801A21D8 0019F1D8  41 82 00 C0 */	beq .L_801A2298
.L_801A21DC:
/* 801A21DC 0019F1DC  2C 03 00 00 */	cmpwi r3, 0
/* 801A21E0 0019F1E0  41 82 00 A4 */	beq .L_801A2284
/* 801A21E4 0019F1E4  3C 7F 00 01 */	addis r3, r31, 1
/* 801A21E8 0019F1E8  3C 00 43 30 */	lis r0, 0x4330
/* 801A21EC 0019F1EC  80 83 37 D4 */	lwz r4, 0x37d4(r3)
/* 801A21F0 0019F1F0  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 801A21F4 0019F1F4  88 A5 00 08 */	lbz r5, 8(r5)
/* 801A21F8 0019F1F8  54 84 08 3C */	slwi r4, r4, 1
/* 801A21FC 0019F1FC  90 01 00 08 */	stw r0, 8(r1)
/* 801A2200 0019F200  7C 05 21 D6 */	mullw r0, r5, r4
/* 801A2204 0019F204  C8 43 9A 00 */	lfd f2, lbl_802F9A00@l(r3)
/* 801A2208 0019F208  C0 02 D3 70 */	lfs f0, lbl_8041E6F0@sda21(r2)
/* 801A220C 0019F20C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801A2210 0019F210  90 01 00 0C */	stw r0, 0xc(r1)
/* 801A2214 0019F214  C8 21 00 08 */	lfd f1, 8(r1)
/* 801A2218 0019F218  EF C1 10 28 */	fsubs f30, f1, f2
/* 801A221C 0019F21C  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2220 0019F220  EF FF F0 2A */	fadds f31, f31, f30
/* 801A2224 0019F224  4C 41 13 82 */	cror 2, 1, 2
/* 801A2228 0019F228  40 82 00 0C */	bne .L_801A2234
/* 801A222C 0019F22C  38 60 00 00 */	li r3, 0
/* 801A2230 0019F230  4B FF 95 85 */	bl BattleAudienceAddPhaseEvtList
.L_801A2234:
/* 801A2234 0019F234  C0 02 D3 10 */	lfs f0, lbl_8041E690@sda21(r2)
/* 801A2238 0019F238  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A223C 0019F23C  4C 41 13 82 */	cror 2, 1, 2
/* 801A2240 0019F240  40 82 00 0C */	bne .L_801A224C
/* 801A2244 0019F244  38 60 00 03 */	li r3, 3
/* 801A2248 0019F248  4B FF 95 6D */	bl BattleAudienceAddPhaseEvtList
.L_801A224C:
/* 801A224C 0019F24C  C0 02 D3 5C */	lfs f0, lbl_8041E6DC@sda21(r2)
/* 801A2250 0019F250  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A2254 0019F254  4C 41 13 82 */	cror 2, 1, 2
/* 801A2258 0019F258  40 82 00 0C */	bne .L_801A2264
/* 801A225C 0019F25C  38 60 00 08 */	li r3, 8
/* 801A2260 0019F260  4B FF 95 55 */	bl BattleAudienceAddPhaseEvtList
.L_801A2264:
/* 801A2264 0019F264  C0 02 D3 28 */	lfs f0, lbl_8041E6A8@sda21(r2)
/* 801A2268 0019F268  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 801A226C 0019F26C  4C 41 13 82 */	cror 2, 1, 2
/* 801A2270 0019F270  40 82 00 0C */	bne .L_801A227C
/* 801A2274 0019F274  38 60 00 0D */	li r3, 0xd
/* 801A2278 0019F278  4B FF 95 3D */	bl BattleAudienceAddPhaseEvtList
.L_801A227C:
/* 801A227C 0019F27C  38 60 00 0A */	li r3, 0xa
/* 801A2280 0019F280  4B FF 95 B1 */	bl BattleAudienceAddPuni
.L_801A2284:
/* 801A2284 0019F284  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A2288 0019F288  54 00 05 AD */	rlwinm. r0, r0, 0, 0x16, 0x16
/* 801A228C 0019F28C  41 82 00 0C */	beq .L_801A2298
/* 801A2290 0019F290  C0 02 D2 AC */	lfs f0, lbl_8041E62C@sda21(r2)
/* 801A2294 0019F294  EF FF 00 28 */	fsubs f31, f31, f0
.L_801A2298:
/* 801A2298 0019F298  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A229C 0019F29C  54 00 04 21 */	rlwinm. r0, r0, 0, 0x10, 0x10
/* 801A22A0 0019F2A0  41 82 00 24 */	beq .L_801A22C4
/* 801A22A4 0019F2A4  38 6D B9 50 */	addi r3, r13, lbl_80412BB0@sda21
/* 801A22A8 0019F2A8  38 80 00 00 */	li r4, 0
/* 801A22AC 0019F2AC  38 A0 00 20 */	li r5, 0x20
/* 801A22B0 0019F2B0  4B E9 4B 61 */	bl evtEntry
/* 801A22B4 0019F2B4  90 7F 00 04 */	stw r3, 4(r31)
/* 801A22B8 0019F2B8  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A22BC 0019F2BC  54 00 04 5E */	rlwinm r0, r0, 0, 0x11, 0xf
/* 801A22C0 0019F2C0  90 1F 00 00 */	stw r0, 0(r31)
.L_801A22C4:
/* 801A22C4 0019F2C4  C0 02 D2 A8 */	lfs f0, lbl_8041E628@sda21(r2)
/* 801A22C8 0019F2C8  3C 7F 00 01 */	addis r3, r31, 1
/* 801A22CC 0019F2CC  C0 23 37 78 */	lfs f1, 0x3778(r3)
/* 801A22D0 0019F2D0  EC 00 07 F2 */	fmuls f0, f0, f31
/* 801A22D4 0019F2D4  C0 42 D2 98 */	lfs f2, lbl_8041E618@sda21(r2)
/* 801A22D8 0019F2D8  EC 21 00 32 */	fmuls f1, f1, f0
/* 801A22DC 0019F2DC  4B FF 9A 2D */	bl BattleAudienceAddTargetNum
/* 801A22E0 0019F2E0  48 00 00 29 */	bl BattleAudience_ActInit
.L_801A22E4:
/* 801A22E4 0019F2E4  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 801A22E8 0019F2E8  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 801A22EC 0019F2EC  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 801A22F0 0019F2F0  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 801A22F4 0019F2F4  BB C1 00 18 */	lmw r30, 0x18(r1)
/* 801A22F8 0019F2F8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 801A22FC 0019F2FC  7C 08 03 A6 */	mtlr r0
/* 801A2300 0019F300  38 21 00 40 */	addi r1, r1, 0x40
/* 801A2304 0019F304  4E 80 00 20 */	blr 

.global BattleAudience_ActInit
BattleAudience_ActInit:
/* 801A2308 0019F308  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A230C 0019F30C  7C 08 02 A6 */	mflr r0
/* 801A2310 0019F310  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A2314 0019F314  48 00 03 C1 */	bl BattleAudienceBaseGetPtr
/* 801A2318 0019F318  3C 83 00 01 */	addis r4, r3, 1
/* 801A231C 0019F31C  38 00 00 00 */	li r0, 0
/* 801A2320 0019F320  90 04 37 D4 */	stw r0, 0x37d4(r4)
/* 801A2324 0019F324  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2328 0019F328  54 00 07 34 */	rlwinm r0, r0, 0, 0x1c, 0x1a
/* 801A232C 0019F32C  90 03 00 00 */	stw r0, 0(r3)
/* 801A2330 0019F330  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2334 0019F334  54 00 06 F2 */	rlwinm r0, r0, 0, 0x1b, 0x19
/* 801A2338 0019F338  90 03 00 00 */	stw r0, 0(r3)
/* 801A233C 0019F33C  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2340 0019F340  54 00 06 B0 */	rlwinm r0, r0, 0, 0x1a, 0x18
/* 801A2344 0019F344  90 03 00 00 */	stw r0, 0(r3)
/* 801A2348 0019F348  80 03 00 00 */	lwz r0, 0(r3)
/* 801A234C 0019F34C  54 00 06 6E */	rlwinm r0, r0, 0, 0x19, 0x17
/* 801A2350 0019F350  90 03 00 00 */	stw r0, 0(r3)
/* 801A2354 0019F354  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2358 0019F358  54 00 06 2C */	rlwinm r0, r0, 0, 0x18, 0x16
/* 801A235C 0019F35C  90 03 00 00 */	stw r0, 0(r3)
/* 801A2360 0019F360  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2364 0019F364  54 00 05 EA */	rlwinm r0, r0, 0, 0x17, 0x15
/* 801A2368 0019F368  90 03 00 00 */	stw r0, 0(r3)
/* 801A236C 0019F36C  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2370 0019F370  54 00 05 A8 */	rlwinm r0, r0, 0, 0x16, 0x14
/* 801A2374 0019F374  90 03 00 00 */	stw r0, 0(r3)
/* 801A2378 0019F378  80 03 00 00 */	lwz r0, 0(r3)
/* 801A237C 0019F37C  54 00 05 66 */	rlwinm r0, r0, 0, 0x15, 0x13
/* 801A2380 0019F380  90 03 00 00 */	stw r0, 0(r3)
/* 801A2384 0019F384  80 03 00 00 */	lwz r0, 0(r3)
/* 801A2388 0019F388  54 00 05 24 */	rlwinm r0, r0, 0, 0x14, 0x12
/* 801A238C 0019F38C  90 03 00 00 */	stw r0, 0(r3)
/* 801A2390 0019F390  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A2394 0019F394  7C 08 03 A6 */	mtlr r0
/* 801A2398 0019F398  38 21 00 10 */	addi r1, r1, 0x10
/* 801A239C 0019F39C  4E 80 00 20 */	blr 

.global BattleAudience_Main
BattleAudience_Main:
/* 801A23A0 0019F3A0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A23A4 0019F3A4  7C 08 02 A6 */	mflr r0
/* 801A23A8 0019F3A8  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A23AC 0019F3AC  BF C1 00 08 */	stmw r30, 8(r1)
/* 801A23B0 0019F3B0  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 801A23B4 0019F3B4  48 00 03 21 */	bl BattleAudienceBaseGetPtr
/* 801A23B8 0019F3B8  80 03 00 00 */	lwz r0, 0(r3)
/* 801A23BC 0019F3BC  7C 7F 1B 78 */	mr r31, r3
/* 801A23C0 0019F3C0  54 00 03 DF */	rlwinm. r0, r0, 0, 0xf, 0xf
/* 801A23C4 0019F3C4  40 82 00 18 */	bne .L_801A23DC
/* 801A23C8 0019F3C8  80 1E 0E F4 */	lwz r0, 0xef4(r30)
/* 801A23CC 0019F3CC  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 801A23D0 0019F3D0  41 82 00 0C */	beq .L_801A23DC
/* 801A23D4 0019F3D4  38 60 00 01 */	li r3, 1
/* 801A23D8 0019F3D8  4B FF 9B 99 */	bl BattleAudience_WinSetActive
.L_801A23DC:
/* 801A23DC 0019F3DC  4B FF D9 21 */	bl BattleAudienceCtrlProcess
/* 801A23E0 0019F3E0  4B FF CB 81 */	bl BattleAudienceItemCtrlProcess
/* 801A23E4 0019F3E4  4B FF C6 09 */	bl BattleAudienceApSrcCtrlProcess
/* 801A23E8 0019F3E8  4B FF C1 DD */	bl BattleAudienceWinCtrlProcess
/* 801A23EC 0019F3EC  4B FF 78 25 */	bl BattleAudienceSoundMain
/* 801A23F0 0019F3F0  80 1E 0E F4 */	lwz r0, 0xef4(r30)
/* 801A23F4 0019F3F4  54 00 06 31 */	rlwinm. r0, r0, 0, 0x18, 0x18
/* 801A23F8 0019F3F8  41 82 00 14 */	beq .L_801A240C
/* 801A23FC 0019F3FC  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A2400 0019F400  64 00 00 01 */	oris r0, r0, 1
/* 801A2404 0019F404  90 1F 00 00 */	stw r0, 0(r31)
/* 801A2408 0019F408  48 00 00 10 */	b .L_801A2418
.L_801A240C:
/* 801A240C 0019F40C  80 1F 00 00 */	lwz r0, 0(r31)
/* 801A2410 0019F410  54 00 04 1C */	rlwinm r0, r0, 0, 0x10, 0xe
/* 801A2414 0019F414  90 1F 00 00 */	stw r0, 0(r31)
.L_801A2418:
/* 801A2418 0019F418  BB C1 00 08 */	lmw r30, 8(r1)
/* 801A241C 0019F41C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A2420 0019F420  7C 08 03 A6 */	mtlr r0
/* 801A2424 0019F424  38 21 00 10 */	addi r1, r1, 0x10
/* 801A2428 0019F428  4E 80 00 20 */	blr 

.global BattleAudience_Init
BattleAudience_Init:
/* 801A242C 0019F42C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801A2430 0019F430  7C 08 02 A6 */	mflr r0
/* 801A2434 0019F434  90 01 00 34 */	stw r0, 0x34(r1)
/* 801A2438 0019F438  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 801A243C 0019F43C  48 00 02 99 */	bl BattleAudienceBaseGetPtr
/* 801A2440 0019F440  7C 7E 1B 78 */	mr r30, r3
/* 801A2444 0019F444  48 00 01 ED */	bl BattleAudienceWinGetPtr
/* 801A2448 0019F448  7C 7F 1B 78 */	mr r31, r3
/* 801A244C 0019F44C  4B F2 F8 29 */	bl func_800D1C74
/* 801A2450 0019F450  3C 80 00 01 */	lis r4, 0x00013914@ha
/* 801A2454 0019F454  7F C3 F3 78 */	mr r3, r30
/* 801A2458 0019F458  38 A4 39 14 */	addi r5, r4, 0x00013914@l
/* 801A245C 0019F45C  38 80 00 00 */	li r4, 0
/* 801A2460 0019F460  4B E6 2C 55 */	bl memset
/* 801A2464 0019F464  4B FF DC B5 */	bl BattleAudienceSettingAudience
/* 801A2468 0019F468  3C 60 80 30 */	lis r3, lbl_802F9DE8@ha
/* 801A246C 0019F46C  38 63 9D E8 */	addi r3, r3, lbl_802F9DE8@l
/* 801A2470 0019F470  48 00 02 71 */	bl tplRead
/* 801A2474 0019F474  3C 80 80 30 */	lis r4, lbl_802F9E0C@ha
/* 801A2478 0019F478  90 7E 00 0C */	stw r3, 0xc(r30)
/* 801A247C 0019F47C  38 A4 9E 0C */	addi r5, r4, lbl_802F9E0C@l
/* 801A2480 0019F480  38 60 00 00 */	li r3, 0
/* 801A2484 0019F484  38 80 00 0C */	li r4, 0xc
/* 801A2488 0019F488  4B FF DC 1D */	bl BattleAudienceGuestTPLRead
/* 801A248C 0019F48C  4B FF D5 D5 */	bl BattleAudienceSetThrowItemMax
/* 801A2490 0019F490  3B A0 00 00 */	li r29, 0
/* 801A2494 0019F494  3F 9E 00 01 */	addis r28, r30, 1
/* 801A2498 0019F498  93 BC 39 08 */	stw r29, 0x3908(r28)
/* 801A249C 0019F49C  3B 20 00 00 */	li r25, 0
/* 801A24A0 0019F4A0  93 BC 37 8C */	stw r29, 0x378c(r28)
/* 801A24A4 0019F4A4  93 BC 37 88 */	stw r29, 0x3788(r28)
/* 801A24A8 0019F4A8  93 BC 37 84 */	stw r29, 0x3784(r28)
.L_801A24AC:
/* 801A24AC 0019F4AC  3B 40 00 00 */	li r26, 0
.L_801A24B0:
/* 801A24B0 0019F4B0  3B 7D 00 0A */	addi r27, r29, 0xa
/* 801A24B4 0019F4B4  7F 7A DA 14 */	add r27, r26, r27
/* 801A24B8 0019F4B8  7F 63 DB 78 */	mr r3, r27
/* 801A24BC 0019F4BC  4B FF A5 59 */	bl BattleAudience_GetExist
/* 801A24C0 0019F4C0  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A24C4 0019F4C4  28 00 00 01 */	cmplwi r0, 1
/* 801A24C8 0019F4C8  40 82 00 2C */	bne .L_801A24F4
/* 801A24CC 0019F4CC  7F 63 DB 78 */	mr r3, r27
/* 801A24D0 0019F4D0  48 00 01 C9 */	bl BattleAudienceGetPtr
/* 801A24D4 0019F4D4  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A24D8 0019F4D8  28 00 00 0C */	cmplwi r0, 0xc
/* 801A24DC 0019F4DC  41 82 00 18 */	beq .L_801A24F4
/* 801A24E0 0019F4E0  28 00 00 0B */	cmplwi r0, 0xb
/* 801A24E4 0019F4E4  41 82 00 10 */	beq .L_801A24F4
/* 801A24E8 0019F4E8  80 7C 37 88 */	lwz r3, 0x3788(r28)
/* 801A24EC 0019F4EC  38 03 00 01 */	addi r0, r3, 1
/* 801A24F0 0019F4F0  90 1C 37 88 */	stw r0, 0x3788(r28)
.L_801A24F4:
/* 801A24F4 0019F4F4  3B 5A 00 01 */	addi r26, r26, 1
/* 801A24F8 0019F4F8  2C 1A 00 0A */	cmpwi r26, 0xa
/* 801A24FC 0019F4FC  41 80 FF B4 */	blt .L_801A24B0
/* 801A2500 0019F500  3B 39 00 01 */	addi r25, r25, 1
/* 801A2504 0019F504  3B BD 00 14 */	addi r29, r29, 0x14
/* 801A2508 0019F508  2C 19 00 0A */	cmpwi r25, 0xa
/* 801A250C 0019F50C  41 80 FF A0 */	blt .L_801A24AC
/* 801A2510 0019F510  3F 9E 00 01 */	addis r28, r30, 1
/* 801A2514 0019F514  3B 60 00 00 */	li r27, 0
/* 801A2518 0019F518  3B A0 00 00 */	li r29, 0
.L_801A251C:
/* 801A251C 0019F51C  3B 40 00 00 */	li r26, 0
.L_801A2520:
/* 801A2520 0019F520  7F 3A EA 14 */	add r25, r26, r29
/* 801A2524 0019F524  7F 23 CB 78 */	mr r3, r25
/* 801A2528 0019F528  4B FF A4 ED */	bl BattleAudience_GetExist
/* 801A252C 0019F52C  54 60 06 3E */	clrlwi r0, r3, 0x18
/* 801A2530 0019F530  28 00 00 01 */	cmplwi r0, 1
/* 801A2534 0019F534  40 82 00 2C */	bne .L_801A2560
/* 801A2538 0019F538  7F 23 CB 78 */	mr r3, r25
/* 801A253C 0019F53C  48 00 01 5D */	bl BattleAudienceGetPtr
/* 801A2540 0019F540  88 03 00 19 */	lbz r0, 0x19(r3)
/* 801A2544 0019F544  28 00 00 0C */	cmplwi r0, 0xc
/* 801A2548 0019F548  41 82 00 18 */	beq .L_801A2560
/* 801A254C 0019F54C  28 00 00 0B */	cmplwi r0, 0xb
/* 801A2550 0019F550  41 82 00 10 */	beq .L_801A2560
/* 801A2554 0019F554  80 7C 37 8C */	lwz r3, 0x378c(r28)
/* 801A2558 0019F558  38 03 00 01 */	addi r0, r3, 1
/* 801A255C 0019F55C  90 1C 37 8C */	stw r0, 0x378c(r28)
.L_801A2560:
/* 801A2560 0019F560  3B 5A 00 01 */	addi r26, r26, 1
/* 801A2564 0019F564  2C 1A 00 0A */	cmpwi r26, 0xa
/* 801A2568 0019F568  41 80 FF B8 */	blt .L_801A2520
/* 801A256C 0019F56C  3B 7B 00 01 */	addi r27, r27, 1
/* 801A2570 0019F570  3B BD 00 14 */	addi r29, r29, 0x14
/* 801A2574 0019F574  2C 1B 00 0A */	cmpwi r27, 0xa
/* 801A2578 0019F578  41 80 FF A4 */	blt .L_801A251C
/* 801A257C 0019F57C  3C DE 00 01 */	addis r6, r30, 1
/* 801A2580 0019F580  3C 00 43 30 */	lis r0, 0x4330
/* 801A2584 0019F584  80 A6 37 88 */	lwz r5, 0x3788(r6)
/* 801A2588 0019F588  3C 60 80 30 */	lis r3, lbl_802F9A00@ha
/* 801A258C 0019F58C  80 86 37 8C */	lwz r4, 0x378c(r6)
/* 801A2590 0019F590  90 01 00 08 */	stw r0, 8(r1)
/* 801A2594 0019F594  7C 05 22 14 */	add r0, r5, r4
/* 801A2598 0019F598  C8 23 9A 00 */	lfd f1, lbl_802F9A00@l(r3)
/* 801A259C 0019F59C  90 06 37 84 */	stw r0, 0x3784(r6)
/* 801A25A0 0019F5A0  80 06 37 84 */	lwz r0, 0x3784(r6)
/* 801A25A4 0019F5A4  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801A25A8 0019F5A8  90 01 00 0C */	stw r0, 0xc(r1)
/* 801A25AC 0019F5AC  C8 01 00 08 */	lfd f0, 8(r1)
/* 801A25B0 0019F5B0  EC 00 08 28 */	fsubs f0, f0, f1
/* 801A25B4 0019F5B4  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 801A25B8 0019F5B8  4B FF 88 65 */	bl BattleAudienceSoundNoiseAlways
/* 801A25BC 0019F5BC  38 60 00 02 */	li r3, 2
/* 801A25C0 0019F5C0  38 80 00 3C */	li r4, 0x3c
/* 801A25C4 0019F5C4  38 A0 00 B4 */	li r5, 0xb4
/* 801A25C8 0019F5C8  4B FF 7A F5 */	bl BattleAudienceSoundSetVol
/* 801A25CC 0019F5CC  3C 7E 00 01 */	addis r3, r30, 1
/* 801A25D0 0019F5D0  38 00 00 00 */	li r0, 0
/* 801A25D4 0019F5D4  90 03 39 10 */	stw r0, 0x3910(r3)
/* 801A25D8 0019F5D8  4B FF 99 1D */	bl BattleAudienceNumToTarget
/* 801A25DC 0019F5DC  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 801A25E0 0019F5E0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801A25E4 0019F5E4  7C 08 03 A6 */	mtlr r0
/* 801A25E8 0019F5E8  38 21 00 30 */	addi r1, r1, 0x30
/* 801A25EC 0019F5EC  4E 80 00 20 */	blr 

.global BattleAudienceSoundGetPtr
BattleAudienceSoundGetPtr:
/* 801A25F0 0019F5F0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A25F4 0019F5F4  7C 08 02 A6 */	mflr r0
/* 801A25F8 0019F5F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A25FC 0019F5FC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801A2600 0019F600  7C 7F 1B 78 */	mr r31, r3
/* 801A2604 0019F604  48 00 00 D1 */	bl BattleAudienceBaseGetPtr
/* 801A2608 0019F608  1C 9F 00 24 */	mulli r4, r31, 0x24
/* 801A260C 0019F60C  7C 60 1B 78 */	mr r0, r3
/* 801A2610 0019F610  3C 64 00 01 */	addis r3, r4, 1
/* 801A2614 0019F614  38 63 33 FC */	addi r3, r3, 0x33fc
/* 801A2618 0019F618  7C 60 1A 14 */	add r3, r0, r3
/* 801A261C 0019F61C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801A2620 0019F620  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A2624 0019F624  7C 08 03 A6 */	mtlr r0
/* 801A2628 0019F628  38 21 00 10 */	addi r1, r1, 0x10
/* 801A262C 0019F62C  4E 80 00 20 */	blr 

.global BattleAudienceWinGetPtr
BattleAudienceWinGetPtr:
/* 801A2630 0019F630  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A2634 0019F634  7C 08 02 A6 */	mflr r0
/* 801A2638 0019F638  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A263C 0019F63C  48 00 00 99 */	bl BattleAudienceBaseGetPtr
/* 801A2640 0019F640  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A2644 0019F644  3C 63 00 01 */	addis r3, r3, 1
/* 801A2648 0019F648  38 63 37 5C */	addi r3, r3, 0x375c
/* 801A264C 0019F64C  7C 08 03 A6 */	mtlr r0
/* 801A2650 0019F650  38 21 00 10 */	addi r1, r1, 0x10
/* 801A2654 0019F654  4E 80 00 20 */	blr 

.global BattleAudienceItemGetPtr
BattleAudienceItemGetPtr:
/* 801A2658 0019F658  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A265C 0019F65C  7C 08 02 A6 */	mflr r0
/* 801A2660 0019F660  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A2664 0019F664  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801A2668 0019F668  7C 7F 1B 78 */	mr r31, r3
/* 801A266C 0019F66C  48 00 00 69 */	bl BattleAudienceBaseGetPtr
/* 801A2670 0019F670  1C 9F 00 48 */	mulli r4, r31, 0x48
/* 801A2674 0019F674  7C 60 1B 78 */	mr r0, r3
/* 801A2678 0019F678  3C 64 00 01 */	addis r3, r4, 1
/* 801A267C 0019F67C  38 63 F2 5C */	addi r3, r3, -3492
/* 801A2680 0019F680  7C 60 1A 14 */	add r3, r0, r3
/* 801A2684 0019F684  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801A2688 0019F688  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A268C 0019F68C  7C 08 03 A6 */	mtlr r0
/* 801A2690 0019F690  38 21 00 10 */	addi r1, r1, 0x10
/* 801A2694 0019F694  4E 80 00 20 */	blr 

.global BattleAudienceGetPtr
BattleAudienceGetPtr:
/* 801A2698 0019F698  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A269C 0019F69C  7C 08 02 A6 */	mflr r0
/* 801A26A0 0019F6A0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A26A4 0019F6A4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801A26A8 0019F6A8  7C 7F 1B 78 */	mr r31, r3
/* 801A26AC 0019F6AC  48 00 00 29 */	bl BattleAudienceBaseGetPtr
/* 801A26B0 0019F6B0  1C 9F 01 34 */	mulli r4, r31, 0x134
/* 801A26B4 0019F6B4  7C 60 1B 78 */	mr r0, r3
/* 801A26B8 0019F6B8  38 64 01 BC */	addi r3, r4, 0x1bc
/* 801A26BC 0019F6BC  7C 60 1A 14 */	add r3, r0, r3
/* 801A26C0 0019F6C0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801A26C4 0019F6C4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A26C8 0019F6C8  7C 08 03 A6 */	mtlr r0
/* 801A26CC 0019F6CC  38 21 00 10 */	addi r1, r1, 0x10
/* 801A26D0 0019F6D0  4E 80 00 20 */	blr 

.global BattleAudienceBaseGetPtr
BattleAudienceBaseGetPtr:
/* 801A26D4 0019F6D4  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 801A26D8 0019F6D8  38 63 28 58 */	addi r3, r3, 0x2858
/* 801A26DC 0019F6DC  4E 80 00 20 */	blr 

.global tplRead
tplRead:
/* 801A26E0 0019F6E0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801A26E4 0019F6E4  7C 08 02 A6 */	mflr r0
/* 801A26E8 0019F6E8  90 01 00 14 */	stw r0, 0x14(r1)
/* 801A26EC 0019F6EC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801A26F0 0019F6F0  7C 7F 1B 78 */	mr r31, r3
/* 801A26F4 0019F6F4  4B E6 4C 15 */	bl func_80007308
/* 801A26F8 0019F6F8  7C 65 1B 78 */	mr r5, r3
/* 801A26FC 0019F6FC  7F E6 FB 78 */	mr r6, r31
/* 801A2700 0019F700  38 60 00 04 */	li r3, 4
/* 801A2704 0019F704  38 82 D3 98 */	addi r4, r2, lbl_8041E718@sda21
/* 801A2708 0019F708  4C C6 31 82 */	crclr 6
/* 801A270C 0019F70C  4B FE 22 05 */	bl fileAllocf
/* 801A2710 0019F710  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801A2714 0019F714  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801A2718 0019F718  7C 08 03 A6 */	mtlr r0
/* 801A271C 0019F71C  38 21 00 10 */	addi r1, r1, 0x10
/* 801A2720 0019F720  4E 80 00 20 */	blr 
