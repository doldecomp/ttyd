.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global evt_pouch_get_yoshiname
evt_pouch_get_yoshiname:
/* 800EBB14 000E8B14  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBB18 000E8B18  7C 08 02 A6 */	mflr r0
/* 800EBB1C 000E8B1C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBB20 000E8B20  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBB24 000E8B24  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBB28 000E8B28  7C 7E 1B 78 */	mr r30, r3
/* 800EBB2C 000E8B2C  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBB30 000E8B30  4B FE 31 39 */	bl pouchGetYoshiName
/* 800EBB34 000E8B34  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBB38 000E8B38  7C 65 1B 78 */	mr r5, r3
/* 800EBB3C 000E8B3C  7F C3 F3 78 */	mr r3, r30
/* 800EBB40 000E8B40  4B F4 4B 29 */	bl evtSetValue
/* 800EBB44 000E8B44  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBB48 000E8B48  38 60 00 02 */	li r3, 2
/* 800EBB4C 000E8B4C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBB50 000E8B50  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBB54 000E8B54  7C 08 03 A6 */	mtlr r0
/* 800EBB58 000E8B58  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBB5C 000E8B5C  4E 80 00 20 */	blr 

.global evt_pouch_set_yoshiname
evt_pouch_set_yoshiname:
/* 800EBB60 000E8B60  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBB64 000E8B64  7C 08 02 A6 */	mflr r0
/* 800EBB68 000E8B68  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBB6C 000E8B6C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBB70 000E8B70  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBB74 000E8B74  4B F4 50 59 */	bl evtGetValue
/* 800EBB78 000E8B78  4B FE 31 39 */	bl pouchSetYoshiName
/* 800EBB7C 000E8B7C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBB80 000E8B80  38 60 00 02 */	li r3, 2
/* 800EBB84 000E8B84  7C 08 03 A6 */	mtlr r0
/* 800EBB88 000E8B88  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBB8C 000E8B8C  4E 80 00 20 */	blr 

.global evt_pouch_open_mail
evt_pouch_open_mail:
/* 800EBB90 000E8B90  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBB94 000E8B94  7C 08 02 A6 */	mflr r0
/* 800EBB98 000E8B98  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBB9C 000E8B9C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBBA0 000E8BA0  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBBA4 000E8BA4  4B F4 50 29 */	bl evtGetValue
/* 800EBBA8 000E8BA8  4B FE 31 C1 */	bl pouchOpenMail
/* 800EBBAC 000E8BAC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBBB0 000E8BB0  38 60 00 02 */	li r3, 2
/* 800EBBB4 000E8BB4  7C 08 03 A6 */	mtlr r0
/* 800EBBB8 000E8BB8  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBBBC 000E8BBC  4E 80 00 20 */	blr 

.global evt_pouch_receive_mail
evt_pouch_receive_mail:
/* 800EBBC0 000E8BC0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBBC4 000E8BC4  7C 08 02 A6 */	mflr r0
/* 800EBBC8 000E8BC8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBBCC 000E8BCC  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBBD0 000E8BD0  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBBD4 000E8BD4  4B F4 4F F9 */	bl evtGetValue
/* 800EBBD8 000E8BD8  4B FE 31 D1 */	bl pouchReceiveMail
/* 800EBBDC 000E8BDC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBBE0 000E8BE0  38 60 00 02 */	li r3, 2
/* 800EBBE4 000E8BE4  7C 08 03 A6 */	mtlr r0
/* 800EBBE8 000E8BE8  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBBEC 000E8BEC  4E 80 00 20 */	blr 

.global evt_pouch_majinai_set
evt_pouch_majinai_set:
/* 800EBBF0 000E8BF0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBBF4 000E8BF4  7C 08 02 A6 */	mflr r0
/* 800EBBF8 000E8BF8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBBFC 000E8BFC  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBC00 000E8C00  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBC04 000E8C04  4B F4 4F C9 */	bl evtGetValue
/* 800EBC08 000E8C08  4B FE 34 81 */	bl pouchMajinaiInit
/* 800EBC0C 000E8C0C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBC10 000E8C10  38 60 00 02 */	li r3, 2
/* 800EBC14 000E8C14  7C 08 03 A6 */	mtlr r0
/* 800EBC18 000E8C18  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBC1C 000E8C1C  4E 80 00 20 */	blr 

.global evt_pouch_get_equipbadgecnt
evt_pouch_get_equipbadgecnt:
/* 800EBC20 000E8C20  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBC24 000E8C24  7C 08 02 A6 */	mflr r0
/* 800EBC28 000E8C28  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBC2C 000E8C2C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBC30 000E8C30  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBC34 000E8C34  7C 7E 1B 78 */	mr r30, r3
/* 800EBC38 000E8C38  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBC3C 000E8C3C  4B FE 58 19 */	bl pouchGetEquipBadgeCnt
/* 800EBC40 000E8C40  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBC44 000E8C44  7C 65 1B 78 */	mr r5, r3
/* 800EBC48 000E8C48  7F C3 F3 78 */	mr r3, r30
/* 800EBC4C 000E8C4C  4B F4 4A 1D */	bl evtSetValue
/* 800EBC50 000E8C50  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBC54 000E8C54  38 60 00 02 */	li r3, 2
/* 800EBC58 000E8C58  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBC5C 000E8C5C  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBC60 000E8C60  7C 08 03 A6 */	mtlr r0
/* 800EBC64 000E8C64  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBC68 000E8C68  4E 80 00 20 */	blr 

.global evt_pouch_get_havebadgecnt
evt_pouch_get_havebadgecnt:
/* 800EBC6C 000E8C6C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBC70 000E8C70  7C 08 02 A6 */	mflr r0
/* 800EBC74 000E8C74  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBC78 000E8C78  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBC7C 000E8C7C  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBC80 000E8C80  7C 7E 1B 78 */	mr r30, r3
/* 800EBC84 000E8C84  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBC88 000E8C88  4B FE 58 91 */	bl pouchGetHaveBadgeCnt
/* 800EBC8C 000E8C8C  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBC90 000E8C90  7C 65 1B 78 */	mr r5, r3
/* 800EBC94 000E8C94  7F C3 F3 78 */	mr r3, r30
/* 800EBC98 000E8C98  4B F4 49 D1 */	bl evtSetValue
/* 800EBC9C 000E8C9C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBCA0 000E8CA0  38 60 00 02 */	li r3, 2
/* 800EBCA4 000E8CA4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBCA8 000E8CA8  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBCAC 000E8CAC  7C 08 03 A6 */	mtlr r0
/* 800EBCB0 000E8CB0  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBCB4 000E8CB4  4E 80 00 20 */	blr 

.global evt_pouch_get_haveitemcnt
evt_pouch_get_haveitemcnt:
/* 800EBCB8 000E8CB8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBCBC 000E8CBC  7C 08 02 A6 */	mflr r0
/* 800EBCC0 000E8CC0  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBCC4 000E8CC4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBCC8 000E8CC8  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBCCC 000E8CCC  7C 7E 1B 78 */	mr r30, r3
/* 800EBCD0 000E8CD0  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBCD4 000E8CD4  4B FE 59 AD */	bl pouchGetHaveItemCnt
/* 800EBCD8 000E8CD8  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBCDC 000E8CDC  7C 65 1B 78 */	mr r5, r3
/* 800EBCE0 000E8CE0  7F C3 F3 78 */	mr r3, r30
/* 800EBCE4 000E8CE4  4B F4 49 85 */	bl evtSetValue
/* 800EBCE8 000E8CE8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBCEC 000E8CEC  38 60 00 02 */	li r3, 2
/* 800EBCF0 000E8CF0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBCF4 000E8CF4  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBCF8 000E8CF8  7C 08 03 A6 */	mtlr r0
/* 800EBCFC 000E8CFC  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBD00 000E8D00  4E 80 00 20 */	blr 

.global evt_pouch_all_party_recovery
evt_pouch_all_party_recovery:
/* 800EBD04 000E8D04  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBD08 000E8D08  7C 08 02 A6 */	mflr r0
/* 800EBD0C 000E8D0C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBD10 000E8D10  4B FE 5F 65 */	bl func_800D1C74
/* 800EBD14 000E8D14  A8 03 00 02 */	lha r0, 2(r3)
/* 800EBD18 000E8D18  B0 03 00 06 */	sth r0, 6(r3)
/* 800EBD1C 000E8D1C  A8 03 00 10 */	lha r0, 0x10(r3)
/* 800EBD20 000E8D20  B0 03 00 14 */	sth r0, 0x14(r3)
/* 800EBD24 000E8D24  A8 03 00 1E */	lha r0, 0x1e(r3)
/* 800EBD28 000E8D28  B0 03 00 22 */	sth r0, 0x22(r3)
/* 800EBD2C 000E8D2C  A8 03 00 2C */	lha r0, 0x2c(r3)
/* 800EBD30 000E8D30  B0 03 00 30 */	sth r0, 0x30(r3)
/* 800EBD34 000E8D34  A8 03 00 3A */	lha r0, 0x3a(r3)
/* 800EBD38 000E8D38  B0 03 00 3E */	sth r0, 0x3e(r3)
/* 800EBD3C 000E8D3C  A8 03 00 48 */	lha r0, 0x48(r3)
/* 800EBD40 000E8D40  B0 03 00 4C */	sth r0, 0x4c(r3)
/* 800EBD44 000E8D44  A8 03 00 56 */	lha r0, 0x56(r3)
/* 800EBD48 000E8D48  B0 03 00 5A */	sth r0, 0x5a(r3)
/* 800EBD4C 000E8D4C  A8 03 00 64 */	lha r0, 0x64(r3)
/* 800EBD50 000E8D50  B0 03 00 68 */	sth r0, 0x68(r3)
/* 800EBD54 000E8D54  38 60 00 02 */	li r3, 2
/* 800EBD58 000E8D58  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBD5C 000E8D5C  7C 08 03 A6 */	mtlr r0
/* 800EBD60 000E8D60  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBD64 000E8D64  4E 80 00 20 */	blr 

.global evt_pouch_mario_recovery
evt_pouch_mario_recovery:
/* 800EBD68 000E8D68  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBD6C 000E8D6C  7C 08 02 A6 */	mflr r0
/* 800EBD70 000E8D70  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBD74 000E8D74  4B FE 3E 65 */	bl pouchGetMaxHP
/* 800EBD78 000E8D78  4B FE 3E 3D */	bl pouchSetHP
/* 800EBD7C 000E8D7C  4B FE 3D C5 */	bl pouchGetMaxFP
/* 800EBD80 000E8D80  4B FE 3D 9D */	bl pouchSetFP
/* 800EBD84 000E8D84  4B FE 3C E9 */	bl pouchGetMaxAP
/* 800EBD88 000E8D88  4B FE 3C F1 */	bl pouchSetAP
/* 800EBD8C 000E8D8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBD90 000E8D90  38 60 00 02 */	li r3, 2
/* 800EBD94 000E8D94  7C 08 03 A6 */	mtlr r0
/* 800EBD98 000E8D98  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBD9C 000E8D9C  4E 80 00 20 */	blr 

.global evt_pouch_party_left
evt_pouch_party_left:
/* 800EBDA0 000E8DA0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBDA4 000E8DA4  7C 08 02 A6 */	mflr r0
/* 800EBDA8 000E8DA8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBDAC 000E8DAC  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBDB0 000E8DB0  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBDB4 000E8DB4  4B F4 4E 19 */	bl evtGetValue
/* 800EBDB8 000E8DB8  48 04 FB 81 */	bl partyLeft
/* 800EBDBC 000E8DBC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBDC0 000E8DC0  38 60 00 02 */	li r3, 2
/* 800EBDC4 000E8DC4  7C 08 03 A6 */	mtlr r0
/* 800EBDC8 000E8DC8  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBDCC 000E8DCC  4E 80 00 20 */	blr 

.global evt_pouch_party_join
evt_pouch_party_join:
/* 800EBDD0 000E8DD0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBDD4 000E8DD4  7C 08 02 A6 */	mflr r0
/* 800EBDD8 000E8DD8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBDDC 000E8DDC  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBDE0 000E8DE0  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBDE4 000E8DE4  4B F4 4D E9 */	bl evtGetValue
/* 800EBDE8 000E8DE8  48 04 FB 95 */	bl partyJoin
/* 800EBDEC 000E8DEC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBDF0 000E8DF0  38 60 00 02 */	li r3, 2
/* 800EBDF4 000E8DF4  7C 08 03 A6 */	mtlr r0
/* 800EBDF8 000E8DF8  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBDFC 000E8DFC  4E 80 00 20 */	blr 

.global evt_pouch_set_ap
evt_pouch_set_ap:
/* 800EBE00 000E8E00  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBE04 000E8E04  7C 08 02 A6 */	mflr r0
/* 800EBE08 000E8E08  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBE0C 000E8E0C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBE10 000E8E10  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBE14 000E8E14  4B F4 4D B9 */	bl evtGetValue
/* 800EBE18 000E8E18  4B FE 3C 61 */	bl pouchSetAP
/* 800EBE1C 000E8E1C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBE20 000E8E20  38 60 00 02 */	li r3, 2
/* 800EBE24 000E8E24  7C 08 03 A6 */	mtlr r0
/* 800EBE28 000E8E28  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBE2C 000E8E2C  4E 80 00 20 */	blr 

.global evt_pouch_get_max_ap
evt_pouch_get_max_ap:
/* 800EBE30 000E8E30  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBE34 000E8E34  7C 08 02 A6 */	mflr r0
/* 800EBE38 000E8E38  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBE3C 000E8E3C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBE40 000E8E40  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBE44 000E8E44  7C 7E 1B 78 */	mr r30, r3
/* 800EBE48 000E8E48  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBE4C 000E8E4C  4B FE 3C 21 */	bl pouchGetMaxAP
/* 800EBE50 000E8E50  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBE54 000E8E54  7C 65 1B 78 */	mr r5, r3
/* 800EBE58 000E8E58  7F C3 F3 78 */	mr r3, r30
/* 800EBE5C 000E8E5C  4B F4 48 0D */	bl evtSetValue
/* 800EBE60 000E8E60  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBE64 000E8E64  38 60 00 02 */	li r3, 2
/* 800EBE68 000E8E68  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBE6C 000E8E6C  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBE70 000E8E70  7C 08 03 A6 */	mtlr r0
/* 800EBE74 000E8E74  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBE78 000E8E78  4E 80 00 20 */	blr 

.global L_evt_pouch_set_hp
L_evt_pouch_set_hp:
/* 800EBE7C 000E8E7C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBE80 000E8E80  7C 08 02 A6 */	mflr r0
/* 800EBE84 000E8E84  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBE88 000E8E88  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EBE8C 000E8E8C  80 84 00 00 */	lwz r4, 0(r4)
/* 800EBE90 000E8E90  4B F4 4D 3D */	bl evtGetValue
/* 800EBE94 000E8E94  4B FE 3D 21 */	bl pouchSetHP
/* 800EBE98 000E8E98  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBE9C 000E8E9C  38 60 00 02 */	li r3, 2
/* 800EBEA0 000E8EA0  7C 08 03 A6 */	mtlr r0
/* 800EBEA4 000E8EA4  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBEA8 000E8EA8  4E 80 00 20 */	blr 

.global L_evt_pouch_get_hp
L_evt_pouch_get_hp:
/* 800EBEAC 000E8EAC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBEB0 000E8EB0  7C 08 02 A6 */	mflr r0
/* 800EBEB4 000E8EB4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBEB8 000E8EB8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBEBC 000E8EBC  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBEC0 000E8EC0  7C 7E 1B 78 */	mr r30, r3
/* 800EBEC4 000E8EC4  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBEC8 000E8EC8  4B FE 3D 1D */	bl pouchGetHP
/* 800EBECC 000E8ECC  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBED0 000E8ED0  7C 65 1B 78 */	mr r5, r3
/* 800EBED4 000E8ED4  7F C3 F3 78 */	mr r3, r30
/* 800EBED8 000E8ED8  4B F4 47 91 */	bl evtSetValue
/* 800EBEDC 000E8EDC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBEE0 000E8EE0  38 60 00 02 */	li r3, 2
/* 800EBEE4 000E8EE4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBEE8 000E8EE8  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBEEC 000E8EEC  7C 08 03 A6 */	mtlr r0
/* 800EBEF0 000E8EF0  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBEF4 000E8EF4  4E 80 00 20 */	blr 

.global evt_pouch_check_item
evt_pouch_check_item:
/* 800EBEF8 000E8EF8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBEFC 000E8EFC  7C 08 02 A6 */	mflr r0
/* 800EBF00 000E8F00  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBF04 000E8F04  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBF08 000E8F08  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBF0C 000E8F0C  7C 7E 1B 78 */	mr r30, r3
/* 800EBF10 000E8F10  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBF14 000E8F14  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBF18 000E8F18  4B F4 4C B5 */	bl evtGetValue
/* 800EBF1C 000E8F1C  4B FE 4D 99 */	bl pouchCheckItem
/* 800EBF20 000E8F20  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EBF24 000E8F24  7C 65 1B 78 */	mr r5, r3
/* 800EBF28 000E8F28  7F C3 F3 78 */	mr r3, r30
/* 800EBF2C 000E8F2C  4B F4 47 3D */	bl evtSetValue
/* 800EBF30 000E8F30  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EBF34 000E8F34  38 60 00 02 */	li r3, 2
/* 800EBF38 000E8F38  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EBF3C 000E8F3C  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EBF40 000E8F40  7C 08 03 A6 */	mtlr r0
/* 800EBF44 000E8F44  38 21 00 10 */	addi r1, r1, 0x10
/* 800EBF48 000E8F48  4E 80 00 20 */	blr 

.global evt_pouch_remove_keepitem
evt_pouch_remove_keepitem:
/* 800EBF4C 000E8F4C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800EBF50 000E8F50  7C 08 02 A6 */	mflr r0
/* 800EBF54 000E8F54  90 01 00 24 */	stw r0, 0x24(r1)
/* 800EBF58 000E8F58  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800EBF5C 000E8F5C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800EBF60 000E8F60  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800EBF64 000E8F64  7C 7D 1B 78 */	mr r29, r3
/* 800EBF68 000E8F68  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBF6C 000E8F6C  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EBF70 000E8F70  4B F4 4C 5D */	bl evtGetValue
/* 800EBF74 000E8F74  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EBF78 000E8F78  7C 7E 1B 78 */	mr r30, r3
/* 800EBF7C 000E8F7C  7F A3 EB 78 */	mr r3, r29
/* 800EBF80 000E8F80  4B F4 4C 4D */	bl evtGetValue
/* 800EBF84 000E8F84  7C 60 1B 78 */	mr r0, r3
/* 800EBF88 000E8F88  7F C3 F3 78 */	mr r3, r30
/* 800EBF8C 000E8F8C  7C 04 03 78 */	mr r4, r0
/* 800EBF90 000E8F90  4B FE 37 55 */	bl pouchRemoveKeepItem
/* 800EBF94 000E8F94  2C 03 00 00 */	cmpwi r3, 0
/* 800EBF98 000E8F98  41 82 00 18 */	beq lbl_800EBFB0
/* 800EBF9C 000E8F9C  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EBFA0 000E8FA0  7F A3 EB 78 */	mr r3, r29
/* 800EBFA4 000E8FA4  38 A0 00 00 */	li r5, 0
/* 800EBFA8 000E8FA8  4B F4 46 C1 */	bl evtSetValue
/* 800EBFAC 000E8FAC  48 00 00 14 */	b lbl_800EBFC0
lbl_800EBFB0:
/* 800EBFB0 000E8FB0  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EBFB4 000E8FB4  7F A3 EB 78 */	mr r3, r29
/* 800EBFB8 000E8FB8  38 A0 FF FF */	li r5, -1
/* 800EBFBC 000E8FBC  4B F4 46 AD */	bl evtSetValue
lbl_800EBFC0:
/* 800EBFC0 000E8FC0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800EBFC4 000E8FC4  38 60 00 02 */	li r3, 2
/* 800EBFC8 000E8FC8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800EBFCC 000E8FCC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800EBFD0 000E8FD0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800EBFD4 000E8FD4  7C 08 03 A6 */	mtlr r0
/* 800EBFD8 000E8FD8  38 21 00 20 */	addi r1, r1, 0x20
/* 800EBFDC 000E8FDC  4E 80 00 20 */	blr 

.global evt_pouch_add_keepitem
evt_pouch_add_keepitem:
/* 800EBFE0 000E8FE0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EBFE4 000E8FE4  7C 08 02 A6 */	mflr r0
/* 800EBFE8 000E8FE8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EBFEC 000E8FEC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EBFF0 000E8FF0  93 C1 00 08 */	stw r30, 8(r1)
/* 800EBFF4 000E8FF4  7C 7E 1B 78 */	mr r30, r3
/* 800EBFF8 000E8FF8  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EBFFC 000E8FFC  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC000 000E9000  4B F4 4B CD */	bl evtGetValue
/* 800EC004 000E9004  4B FE 38 15 */	bl pouchAddKeepItem
/* 800EC008 000E9008  2C 03 00 00 */	cmpwi r3, 0
/* 800EC00C 000E900C  41 82 00 18 */	beq lbl_800EC024
/* 800EC010 000E9010  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC014 000E9014  7F C3 F3 78 */	mr r3, r30
/* 800EC018 000E9018  38 A0 00 00 */	li r5, 0
/* 800EC01C 000E901C  4B F4 46 4D */	bl evtSetValue
/* 800EC020 000E9020  48 00 00 14 */	b lbl_800EC034
lbl_800EC024:
/* 800EC024 000E9024  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC028 000E9028  7F C3 F3 78 */	mr r3, r30
/* 800EC02C 000E902C  38 A0 FF FF */	li r5, -1
/* 800EC030 000E9030  4B F4 46 39 */	bl evtSetValue
lbl_800EC034:
/* 800EC034 000E9034  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC038 000E9038  38 60 00 02 */	li r3, 2
/* 800EC03C 000E903C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC040 000E9040  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC044 000E9044  7C 08 03 A6 */	mtlr r0
/* 800EC048 000E9048  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC04C 000E904C  4E 80 00 20 */	blr 

.global N_evt_pouch_remove_item_index
N_evt_pouch_remove_item_index:
/* 800EC050 000E9050  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800EC054 000E9054  7C 08 02 A6 */	mflr r0
/* 800EC058 000E9058  90 01 00 24 */	stw r0, 0x24(r1)
/* 800EC05C 000E905C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800EC060 000E9060  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800EC064 000E9064  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800EC068 000E9068  7C 7D 1B 78 */	mr r29, r3
/* 800EC06C 000E906C  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC070 000E9070  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC074 000E9074  4B F4 4B 59 */	bl evtGetValue
/* 800EC078 000E9078  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC07C 000E907C  7C 7E 1B 78 */	mr r30, r3
/* 800EC080 000E9080  7F A3 EB 78 */	mr r3, r29
/* 800EC084 000E9084  4B F4 4B 49 */	bl evtGetValue
/* 800EC088 000E9088  7C 60 1B 78 */	mr r0, r3
/* 800EC08C 000E908C  7F C3 F3 78 */	mr r3, r30
/* 800EC090 000E9090  7C 04 03 78 */	mr r4, r0
/* 800EC094 000E9094  4B FE 46 C1 */	bl pouchRemoveItemIndex
/* 800EC098 000E9098  2C 03 00 01 */	cmpwi r3, 1
/* 800EC09C 000E909C  40 82 00 20 */	bne lbl_800EC0BC
/* 800EC0A0 000E90A0  4B FE 33 BD */	bl pouchReviseMarioParam
/* 800EC0A4 000E90A4  4B FE 32 41 */	bl pouchRevisePartyParam
/* 800EC0A8 000E90A8  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC0AC 000E90AC  7F A3 EB 78 */	mr r3, r29
/* 800EC0B0 000E90B0  38 A0 00 00 */	li r5, 0
/* 800EC0B4 000E90B4  4B F4 45 B5 */	bl evtSetValue
/* 800EC0B8 000E90B8  48 00 00 14 */	b lbl_800EC0CC
lbl_800EC0BC:
/* 800EC0BC 000E90BC  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC0C0 000E90C0  7F A3 EB 78 */	mr r3, r29
/* 800EC0C4 000E90C4  38 A0 FF FF */	li r5, -1
/* 800EC0C8 000E90C8  4B F4 45 A1 */	bl evtSetValue
lbl_800EC0CC:
/* 800EC0CC 000E90CC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800EC0D0 000E90D0  38 60 00 02 */	li r3, 2
/* 800EC0D4 000E90D4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800EC0D8 000E90D8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800EC0DC 000E90DC  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800EC0E0 000E90E0  7C 08 03 A6 */	mtlr r0
/* 800EC0E4 000E90E4  38 21 00 20 */	addi r1, r1, 0x20
/* 800EC0E8 000E90E8  4E 80 00 20 */	blr 

.global evt_pouch_remove_item
evt_pouch_remove_item:
/* 800EC0EC 000E90EC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC0F0 000E90F0  7C 08 02 A6 */	mflr r0
/* 800EC0F4 000E90F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC0F8 000E90F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC0FC 000E90FC  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC100 000E9100  7C 7E 1B 78 */	mr r30, r3
/* 800EC104 000E9104  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC108 000E9108  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC10C 000E910C  4B F4 4A C1 */	bl evtGetValue
/* 800EC110 000E9110  4B FE 49 09 */	bl pouchRemoveItem
/* 800EC114 000E9114  2C 03 00 01 */	cmpwi r3, 1
/* 800EC118 000E9118  40 82 00 20 */	bne lbl_800EC138
/* 800EC11C 000E911C  4B FE 33 41 */	bl pouchReviseMarioParam
/* 800EC120 000E9120  4B FE 31 C5 */	bl pouchRevisePartyParam
/* 800EC124 000E9124  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC128 000E9128  7F C3 F3 78 */	mr r3, r30
/* 800EC12C 000E912C  38 A0 00 00 */	li r5, 0
/* 800EC130 000E9130  4B F4 45 39 */	bl evtSetValue
/* 800EC134 000E9134  48 00 00 14 */	b lbl_800EC148
lbl_800EC138:
/* 800EC138 000E9138  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC13C 000E913C  7F C3 F3 78 */	mr r3, r30
/* 800EC140 000E9140  38 A0 FF FF */	li r5, -1
/* 800EC144 000E9144  4B F4 45 25 */	bl evtSetValue
lbl_800EC148:
/* 800EC148 000E9148  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC14C 000E914C  38 60 00 02 */	li r3, 2
/* 800EC150 000E9150  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC154 000E9154  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC158 000E9158  7C 08 03 A6 */	mtlr r0
/* 800EC15C 000E915C  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC160 000E9160  4E 80 00 20 */	blr 

.global evt_pouch_add_item
evt_pouch_add_item:
/* 800EC164 000E9164  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC168 000E9168  7C 08 02 A6 */	mflr r0
/* 800EC16C 000E916C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC170 000E9170  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC174 000E9174  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC178 000E9178  7C 7E 1B 78 */	mr r30, r3
/* 800EC17C 000E917C  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC180 000E9180  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC184 000E9184  4B F4 4A 49 */	bl evtGetValue
/* 800EC188 000E9188  4B FE 4D 25 */	bl pouchGetItem
/* 800EC18C 000E918C  2C 03 00 01 */	cmpwi r3, 1
/* 800EC190 000E9190  40 82 00 18 */	bne lbl_800EC1A8
/* 800EC194 000E9194  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC198 000E9198  7F C3 F3 78 */	mr r3, r30
/* 800EC19C 000E919C  38 A0 00 00 */	li r5, 0
/* 800EC1A0 000E91A0  4B F4 44 C9 */	bl evtSetValue
/* 800EC1A4 000E91A4  48 00 00 14 */	b lbl_800EC1B8
lbl_800EC1A8:
/* 800EC1A8 000E91A8  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC1AC 000E91AC  7F C3 F3 78 */	mr r3, r30
/* 800EC1B0 000E91B0  38 A0 FF FF */	li r5, -1
/* 800EC1B4 000E91B4  4B F4 44 B5 */	bl evtSetValue
lbl_800EC1B8:
/* 800EC1B8 000E91B8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC1BC 000E91BC  38 60 00 02 */	li r3, 2
/* 800EC1C0 000E91C0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC1C4 000E91C4  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC1C8 000E91C8  7C 08 03 A6 */	mtlr r0
/* 800EC1CC 000E91CC  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC1D0 000E91D0  4E 80 00 20 */	blr 

.global evt_pouch_get_starstone
evt_pouch_get_starstone:
/* 800EC1D4 000E91D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC1D8 000E91D8  7C 08 02 A6 */	mflr r0
/* 800EC1DC 000E91DC  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC1E0 000E91E0  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EC1E4 000E91E4  80 84 00 00 */	lwz r4, 0(r4)
/* 800EC1E8 000E91E8  4B F4 49 E5 */	bl evtGetValue
/* 800EC1EC 000E91EC  4B FE 2D A9 */	bl pouchGetStarStone
/* 800EC1F0 000E91F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC1F4 000E91F4  38 60 00 02 */	li r3, 2
/* 800EC1F8 000E91F8  7C 08 03 A6 */	mtlr r0
/* 800EC1FC 000E91FC  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC200 000E9200  4E 80 00 20 */	blr 

.global evt_pouch_add_starpiece
evt_pouch_add_starpiece:
/* 800EC204 000E9204  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC208 000E9208  7C 08 02 A6 */	mflr r0
/* 800EC20C 000E920C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC210 000E9210  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EC214 000E9214  80 84 00 00 */	lwz r4, 0(r4)
/* 800EC218 000E9218  4B F4 49 B5 */	bl evtGetValue
/* 800EC21C 000E921C  4B FE 3A 25 */	bl pouchAddStarPiece
/* 800EC220 000E9220  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC224 000E9224  38 60 00 02 */	li r3, 2
/* 800EC228 000E9228  7C 08 03 A6 */	mtlr r0
/* 800EC22C 000E922C  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC230 000E9230  4E 80 00 20 */	blr 

.global evt_pouch_get_starpiece
evt_pouch_get_starpiece:
/* 800EC234 000E9234  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC238 000E9238  7C 08 02 A6 */	mflr r0
/* 800EC23C 000E923C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC240 000E9240  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC244 000E9244  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC248 000E9248  7C 7E 1B 78 */	mr r30, r3
/* 800EC24C 000E924C  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC250 000E9250  4B FE 3A 0D */	bl func_800CFC5C
/* 800EC254 000E9254  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC258 000E9258  7C 65 1B 78 */	mr r5, r3
/* 800EC25C 000E925C  7F C3 F3 78 */	mr r3, r30
/* 800EC260 000E9260  4B F4 44 09 */	bl evtSetValue
/* 800EC264 000E9264  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC268 000E9268  38 60 00 02 */	li r3, 2
/* 800EC26C 000E926C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC270 000E9270  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC274 000E9274  7C 08 03 A6 */	mtlr r0
/* 800EC278 000E9278  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC27C 000E927C  4E 80 00 20 */	blr 

.global evt_pouch_set_supercoin
evt_pouch_set_supercoin:
/* 800EC280 000E9280  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC284 000E9284  7C 08 02 A6 */	mflr r0
/* 800EC288 000E9288  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC28C 000E928C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EC290 000E9290  80 84 00 00 */	lwz r4, 0(r4)
/* 800EC294 000E9294  4B F4 49 39 */	bl evtGetValue
/* 800EC298 000E9298  4B FE 39 D1 */	bl pouchSetSuperCoin
/* 800EC29C 000E929C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC2A0 000E92A0  38 60 00 02 */	li r3, 2
/* 800EC2A4 000E92A4  7C 08 03 A6 */	mtlr r0
/* 800EC2A8 000E92A8  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC2AC 000E92AC  4E 80 00 20 */	blr 

.global evt_pouch_get_supercoin
evt_pouch_get_supercoin:
/* 800EC2B0 000E92B0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC2B4 000E92B4  7C 08 02 A6 */	mflr r0
/* 800EC2B8 000E92B8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC2BC 000E92BC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC2C0 000E92C0  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC2C4 000E92C4  7C 7E 1B 78 */	mr r30, r3
/* 800EC2C8 000E92C8  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC2CC 000E92CC  4B FE 39 B1 */	bl func_800CFC7C
/* 800EC2D0 000E92D0  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC2D4 000E92D4  7C 65 1B 78 */	mr r5, r3
/* 800EC2D8 000E92D8  7F C3 F3 78 */	mr r3, r30
/* 800EC2DC 000E92DC  4B F4 43 8D */	bl evtSetValue
/* 800EC2E0 000E92E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC2E4 000E92E4  38 60 00 02 */	li r3, 2
/* 800EC2E8 000E92E8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC2EC 000E92EC  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC2F0 000E92F0  7C 08 03 A6 */	mtlr r0
/* 800EC2F4 000E92F4  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC2F8 000E92F8  4E 80 00 20 */	blr 

.global evt_pouch_set_coin
evt_pouch_set_coin:
/* 800EC2FC 000E92FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC300 000E9300  7C 08 02 A6 */	mflr r0
/* 800EC304 000E9304  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC308 000E9308  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EC30C 000E930C  80 84 00 00 */	lwz r4, 0(r4)
/* 800EC310 000E9310  4B F4 48 BD */	bl evtGetValue
/* 800EC314 000E9314  4B FE 39 75 */	bl pouchSetCoin
/* 800EC318 000E9318  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC31C 000E931C  38 60 00 02 */	li r3, 2
/* 800EC320 000E9320  7C 08 03 A6 */	mtlr r0
/* 800EC324 000E9324  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC328 000E9328  4E 80 00 20 */	blr 

.global evt_pouch_add_coin
evt_pouch_add_coin:
/* 800EC32C 000E932C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC330 000E9330  7C 08 02 A6 */	mflr r0
/* 800EC334 000E9334  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC338 000E9338  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800EC33C 000E933C  80 84 00 00 */	lwz r4, 0(r4)
/* 800EC340 000E9340  4B F4 48 8D */	bl evtGetValue
/* 800EC344 000E9344  4B FE 39 89 */	bl pouchAddCoin
/* 800EC348 000E9348  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC34C 000E934C  38 60 00 02 */	li r3, 2
/* 800EC350 000E9350  7C 08 03 A6 */	mtlr r0
/* 800EC354 000E9354  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC358 000E9358  4E 80 00 20 */	blr 

.global evt_pouch_get_coin
evt_pouch_get_coin:
/* 800EC35C 000E935C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC360 000E9360  7C 08 02 A6 */	mflr r0
/* 800EC364 000E9364  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC368 000E9368  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC36C 000E936C  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC370 000E9370  7C 7E 1B 78 */	mr r30, r3
/* 800EC374 000E9374  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC378 000E9378  4B FE 39 A1 */	bl func_800CFD18
/* 800EC37C 000E937C  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC380 000E9380  7C 65 1B 78 */	mr r5, r3
/* 800EC384 000E9384  7F C3 F3 78 */	mr r3, r30
/* 800EC388 000E9388  4B F4 42 E1 */	bl evtSetValue
/* 800EC38C 000E938C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC390 000E9390  38 60 00 02 */	li r3, 2
/* 800EC394 000E9394  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC398 000E9398  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC39C 000E939C  7C 08 03 A6 */	mtlr r0
/* 800EC3A0 000E93A0  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC3A4 000E93A4  4E 80 00 20 */	blr 
