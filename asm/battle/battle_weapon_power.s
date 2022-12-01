.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global weaponGetPowerTatsumaki
weaponGetPowerTatsumaki:
/* 80183D24 00180D24  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80183D28 00180D28  7C 08 02 A6 */	mflr r0
/* 80183D2C 00180D2C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80183D30 00180D30  BF C1 00 08 */	stmw r30, 8(r1)
/* 80183D34 00180D34  7C 9E 23 78 */	mr r30, r4
/* 80183D38 00180D38  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 80183D3C 00180D3C  4B F6 FB 19 */	bl BattleGetMarioPtr
/* 80183D40 00180D40  83 FE 00 20 */	lwz r31, 0x20(r30)
/* 80183D44 00180D44  38 60 00 F3 */	li r3, 0xf3
/* 80183D48 00180D48  4B F4 B4 6D */	bl pouchEquipCheckBadge
/* 80183D4C 00180D4C  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80183D50 00180D50  7C 00 19 D6 */	mullw r0, r0, r3
/* 80183D54 00180D54  7F FF 02 14 */	add r31, r31, r0
/* 80183D58 00180D58  7F E3 FB 78 */	mr r3, r31
/* 80183D5C 00180D5C  BB C1 00 08 */	lmw r30, 8(r1)
/* 80183D60 00180D60  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80183D64 00180D64  7C 08 03 A6 */	mtlr r0
/* 80183D68 00180D68  38 21 00 10 */	addi r1, r1, 0x10
/* 80183D6C 00180D6C  4E 80 00 20 */	blr 

.global weaponGetFPPowerFPHalf
weaponGetFPPowerFPHalf:
/* 80183D70 00180D70  A8 65 01 12 */	lha r3, 0x112(r5)
/* 80183D74 00180D74  54 60 07 FE */	clrlwi r0, r3, 0x1f
/* 80183D78 00180D78  2C 00 00 01 */	cmpwi r0, 1
/* 80183D7C 00180D7C  40 82 00 14 */	bne lbl_80183D90
/* 80183D80 00180D80  7C 60 0E 70 */	srawi r0, r3, 1
/* 80183D84 00180D84  7C 60 01 94 */	addze r3, r0
/* 80183D88 00180D88  38 63 00 01 */	addi r3, r3, 1
/* 80183D8C 00180D8C  4E 80 00 20 */	blr 
lbl_80183D90:
/* 80183D90 00180D90  7C 60 0E 70 */	srawi r0, r3, 1
/* 80183D94 00180D94  7C 60 01 94 */	addze r3, r0
/* 80183D98 00180D98  4E 80 00 20 */	blr 

.global weaponGetPowerHPHalf2
weaponGetPowerHPHalf2:
/* 80183D9C 00180D9C  A8 05 01 0C */	lha r0, 0x10c(r5)
/* 80183DA0 00180DA0  7C 00 0E 70 */	srawi r0, r0, 1
/* 80183DA4 00180DA4  7C 60 01 94 */	addze r3, r0
/* 80183DA8 00180DA8  4E 80 00 20 */	blr 

.global weaponGetPowerHPHalf
weaponGetPowerHPHalf:
/* 80183DAC 00180DAC  A8 65 01 0C */	lha r3, 0x10c(r5)
/* 80183DB0 00180DB0  54 60 07 FE */	clrlwi r0, r3, 0x1f
/* 80183DB4 00180DB4  2C 00 00 01 */	cmpwi r0, 1
/* 80183DB8 00180DB8  40 82 00 14 */	bne lbl_80183DCC
/* 80183DBC 00180DBC  7C 60 0E 70 */	srawi r0, r3, 1
/* 80183DC0 00180DC0  7C 60 01 94 */	addze r3, r0
/* 80183DC4 00180DC4  38 63 00 01 */	addi r3, r3, 1
/* 80183DC8 00180DC8  4E 80 00 20 */	blr 
lbl_80183DCC:
/* 80183DCC 00180DCC  7C 60 0E 70 */	srawi r0, r3, 1
/* 80183DD0 00180DD0  7C 60 01 94 */	addze r3, r0
/* 80183DD4 00180DD4  4E 80 00 20 */	blr 

.global weaponGetACOutputParam
weaponGetACOutputParam:
/* 80183DD8 00180DD8  80 04 00 20 */	lwz r0, 0x20(r4)
/* 80183DDC 00180DDC  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80183DE0 00180DE0  54 03 10 3A */	slwi r3, r0, 2
/* 80183DE4 00180DE4  80 04 00 24 */	lwz r0, 0x24(r4)
/* 80183DE8 00180DE8  7C 65 1A 14 */	add r3, r5, r3
/* 80183DEC 00180DEC  80 63 1C E8 */	lwz r3, 0x1ce8(r3)
/* 80183DF0 00180DF0  7C 63 02 15 */	add. r3, r3, r0
/* 80183DF4 00180DF4  4C 80 00 20 */	bgelr 
/* 80183DF8 00180DF8  38 60 00 00 */	li r3, 0
/* 80183DFC 00180DFC  4E 80 00 20 */	blr 

.global weaponGetPowerFromGulliblePartyAttackLv
weaponGetPowerFromGulliblePartyAttackLv:
/* 80183E00 00180E00  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80183E04 00180E04  7C 08 02 A6 */	mflr r0
/* 80183E08 00180E08  90 01 00 14 */	stw r0, 0x14(r1)
/* 80183E0C 00180E0C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80183E10 00180E10  7C 9F 23 78 */	mr r31, r4
/* 80183E14 00180E14  80 63 00 08 */	lwz r3, 8(r3)
/* 80183E18 00180E18  4B F6 F6 D9 */	bl BattleTransPartyId
/* 80183E1C 00180E1C  4B F4 BB 25 */	bl pouchGetPartyAttackLv
/* 80183E20 00180E20  2C 03 00 06 */	cmpwi r3, 6
/* 80183E24 00180E24  41 80 00 08 */	blt lbl_80183E2C
/* 80183E28 00180E28  38 60 00 05 */	li r3, 5
lbl_80183E2C:
/* 80183E2C 00180E2C  54 60 10 3A */	slwi r0, r3, 2
/* 80183E30 00180E30  7C 7F 02 14 */	add r3, r31, r0
/* 80183E34 00180E34  80 63 00 20 */	lwz r3, 0x20(r3)
/* 80183E38 00180E38  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80183E3C 00180E3C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80183E40 00180E40  7C 08 03 A6 */	mtlr r0
/* 80183E44 00180E44  38 21 00 10 */	addi r1, r1, 0x10
/* 80183E48 00180E48  4E 80 00 20 */	blr 

.global weaponGetPowerFromPartyAttackLv
weaponGetPowerFromPartyAttackLv:
/* 80183E4C 00180E4C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80183E50 00180E50  7C 08 02 A6 */	mflr r0
/* 80183E54 00180E54  90 01 00 14 */	stw r0, 0x14(r1)
/* 80183E58 00180E58  BF C1 00 08 */	stmw r30, 8(r1)
/* 80183E5C 00180E5C  7C 9E 23 78 */	mr r30, r4
/* 80183E60 00180E60  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 80183E64 00180E64  80 63 00 08 */	lwz r3, 8(r3)
/* 80183E68 00180E68  4B F6 F6 89 */	bl BattleTransPartyId
/* 80183E6C 00180E6C  80 1F 1C B8 */	lwz r0, 0x1cb8(r31)
/* 80183E70 00180E70  54 1F FF FE */	rlwinm r31, r0, 0x1f, 0x1f, 0x1f
/* 80183E74 00180E74  4B F4 BA CD */	bl pouchGetPartyAttackLv
/* 80183E78 00180E78  54 60 08 3C */	slwi r0, r3, 1
/* 80183E7C 00180E7C  7C 1F 02 14 */	add r0, r31, r0
/* 80183E80 00180E80  2C 00 00 06 */	cmpwi r0, 6
/* 80183E84 00180E84  41 80 00 08 */	blt lbl_80183E8C
/* 80183E88 00180E88  38 00 00 05 */	li r0, 5
lbl_80183E8C:
/* 80183E8C 00180E8C  54 00 10 3A */	slwi r0, r0, 2
/* 80183E90 00180E90  7C 7E 02 14 */	add r3, r30, r0
/* 80183E94 00180E94  80 63 00 20 */	lwz r3, 0x20(r3)
/* 80183E98 00180E98  BB C1 00 08 */	lmw r30, 8(r1)
/* 80183E9C 00180E9C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80183EA0 00180EA0  7C 08 03 A6 */	mtlr r0
/* 80183EA4 00180EA4  38 21 00 10 */	addi r1, r1, 0x10
/* 80183EA8 00180EA8  4E 80 00 20 */	blr 

.global weaponGetPowerOverlapHammer1
weaponGetPowerOverlapHammer1:
/* 80183EAC 00180EAC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80183EB0 00180EB0  7C 08 02 A6 */	mflr r0
/* 80183EB4 00180EB4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80183EB8 00180EB8  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 80183EBC 00180EBC  7C 9D 23 78 */	mr r29, r4
/* 80183EC0 00180EC0  48 00 00 75 */	bl weaponGetPowerFromMarioHammerLv
/* 80183EC4 00180EC4  7C 7F 1B 78 */	mr r31, r3
/* 80183EC8 00180EC8  83 DD 00 3C */	lwz r30, 0x3c(r29)
/* 80183ECC 00180ECC  80 7D 00 38 */	lwz r3, 0x38(r29)
/* 80183ED0 00180ED0  4B F4 B2 E5 */	bl pouchEquipCheckBadge
/* 80183ED4 00180ED4  7C 1E 19 D6 */	mullw r0, r30, r3
/* 80183ED8 00180ED8  7C 7F 02 14 */	add r3, r31, r0
/* 80183EDC 00180EDC  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80183EE0 00180EE0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80183EE4 00180EE4  7C 08 03 A6 */	mtlr r0
/* 80183EE8 00180EE8  38 21 00 20 */	addi r1, r1, 0x20
/* 80183EEC 00180EEC  4E 80 00 20 */	blr 

.global weaponGetPowerOverlapJump1
weaponGetPowerOverlapJump1:
/* 80183EF0 00180EF0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80183EF4 00180EF4  7C 08 02 A6 */	mflr r0
/* 80183EF8 00180EF8  90 01 00 24 */	stw r0, 0x24(r1)
/* 80183EFC 00180EFC  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 80183F00 00180F00  7C 9D 23 78 */	mr r29, r4
/* 80183F04 00180F04  48 00 00 A9 */	bl weaponGetPowerFromMarioJumpLv
/* 80183F08 00180F08  7C 7F 1B 78 */	mr r31, r3
/* 80183F0C 00180F0C  83 DD 00 3C */	lwz r30, 0x3c(r29)
/* 80183F10 00180F10  80 7D 00 38 */	lwz r3, 0x38(r29)
/* 80183F14 00180F14  4B F4 B2 A1 */	bl pouchEquipCheckBadge
/* 80183F18 00180F18  7C 1E 19 D6 */	mullw r0, r30, r3
/* 80183F1C 00180F1C  7C 7F 02 14 */	add r3, r31, r0
/* 80183F20 00180F20  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80183F24 00180F24  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80183F28 00180F28  7C 08 03 A6 */	mtlr r0
/* 80183F2C 00180F2C  38 21 00 20 */	addi r1, r1, 0x20
/* 80183F30 00180F30  4E 80 00 20 */	blr 

.global weaponGetPowerFromMarioHammerLv
weaponGetPowerFromMarioHammerLv:
/* 80183F34 00180F34  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80183F38 00180F38  7C 08 02 A6 */	mflr r0
/* 80183F3C 00180F3C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80183F40 00180F40  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 80183F44 00180F44  7C 7D 1B 78 */	mr r29, r3
/* 80183F48 00180F48  7C 9E 23 78 */	mr r30, r4
/* 80183F4C 00180F4C  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80183F50 00180F50  80 05 1C B8 */	lwz r0, 0x1cb8(r5)
/* 80183F54 00180F54  54 1F FF FE */	rlwinm r31, r0, 0x1f, 0x1f, 0x1f
/* 80183F58 00180F58  4B F4 DD 1D */	bl func_800D1C74
/* 80183F5C 00180F5C  88 03 00 99 */	lbz r0, 0x99(r3)
/* 80183F60 00180F60  7C 03 07 74 */	extsb r3, r0
/* 80183F64 00180F64  38 03 FF FF */	addi r0, r3, -1
/* 80183F68 00180F68  54 00 08 3C */	slwi r0, r0, 1
/* 80183F6C 00180F6C  7C 1F 02 14 */	add r0, r31, r0
/* 80183F70 00180F70  2C 00 00 06 */	cmpwi r0, 6
/* 80183F74 00180F74  41 80 00 08 */	blt lbl_80183F7C
/* 80183F78 00180F78  38 00 00 05 */	li r0, 5
lbl_80183F7C:
/* 80183F7C 00180F7C  88 9D 02 FC */	lbz r4, 0x2fc(r29)
/* 80183F80 00180F80  54 00 10 3A */	slwi r0, r0, 2
/* 80183F84 00180F84  7C 7E 02 14 */	add r3, r30, r0
/* 80183F88 00180F88  28 04 00 00 */	cmplwi r4, 0
/* 80183F8C 00180F8C  80 63 00 20 */	lwz r3, 0x20(r3)
/* 80183F90 00180F90  41 82 00 08 */	beq lbl_80183F98
/* 80183F94 00180F94  7C 63 22 14 */	add r3, r3, r4
lbl_80183F98:
/* 80183F98 00180F98  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80183F9C 00180F9C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80183FA0 00180FA0  7C 08 03 A6 */	mtlr r0
/* 80183FA4 00180FA4  38 21 00 20 */	addi r1, r1, 0x20
/* 80183FA8 00180FA8  4E 80 00 20 */	blr 

.global weaponGetPowerFromMarioJumpLv
weaponGetPowerFromMarioJumpLv:
/* 80183FAC 00180FAC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80183FB0 00180FB0  7C 08 02 A6 */	mflr r0
/* 80183FB4 00180FB4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80183FB8 00180FB8  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 80183FBC 00180FBC  7C 7D 1B 78 */	mr r29, r3
/* 80183FC0 00180FC0  7C 9E 23 78 */	mr r30, r4
/* 80183FC4 00180FC4  80 AD 17 10 */	lwz r5, lbl_80418970@sda21(r13)
/* 80183FC8 00180FC8  80 05 1C B8 */	lwz r0, 0x1cb8(r5)
/* 80183FCC 00180FCC  54 1F FF FE */	rlwinm r31, r0, 0x1f, 0x1f, 0x1f
/* 80183FD0 00180FD0  4B F4 DC A5 */	bl func_800D1C74
/* 80183FD4 00180FD4  88 03 00 98 */	lbz r0, 0x98(r3)
/* 80183FD8 00180FD8  7C 03 07 74 */	extsb r3, r0
/* 80183FDC 00180FDC  38 03 FF FF */	addi r0, r3, -1
/* 80183FE0 00180FE0  54 00 08 3C */	slwi r0, r0, 1
/* 80183FE4 00180FE4  7C 1F 02 14 */	add r0, r31, r0
/* 80183FE8 00180FE8  2C 00 00 06 */	cmpwi r0, 6
/* 80183FEC 00180FEC  41 80 00 08 */	blt lbl_80183FF4
/* 80183FF0 00180FF0  38 00 00 05 */	li r0, 5
lbl_80183FF4:
/* 80183FF4 00180FF4  88 9D 02 FB */	lbz r4, 0x2fb(r29)
/* 80183FF8 00180FF8  54 00 10 3A */	slwi r0, r0, 2
/* 80183FFC 00180FFC  7C 7E 02 14 */	add r3, r30, r0
/* 80184000 00181000  28 04 00 00 */	cmplwi r4, 0
/* 80184004 00181004  80 63 00 20 */	lwz r3, 0x20(r3)
/* 80184008 00181008  41 82 00 08 */	beq lbl_80184010
/* 8018400C 0018100C  7C 63 22 14 */	add r3, r3, r4
lbl_80184010:
/* 80184010 00181010  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80184014 00181014  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80184018 00181018  7C 08 03 A6 */	mtlr r0
/* 8018401C 0018101C  38 21 00 20 */	addi r1, r1, 0x20
/* 80184020 00181020  4E 80 00 20 */	blr 

.global weaponGetFPPowerDefault
weaponGetFPPowerDefault:
/* 80184024 00181024  80 64 00 44 */	lwz r3, 0x44(r4)
/* 80184028 00181028  4E 80 00 20 */	blr 

.global weaponGetPowerDefault
weaponGetPowerDefault:
/* 8018402C 0018102C  80 64 00 20 */	lwz r3, 0x20(r4)
/* 80184030 00181030  4E 80 00 20 */	blr 
