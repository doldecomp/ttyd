.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global chuchu_use
chuchu_use:
/* 8018255C 0017F55C  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80182560 0017F560  7C 08 02 A6 */	mflr r0
/* 80182564 0017F564  90 01 00 44 */	stw r0, 0x44(r1)
/* 80182568 0017F568  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 8018256C 0017F56C  7C 7F 1B 78 */	mr r31, r3
/* 80182570 0017F570  93 C1 00 38 */	stw r30, 0x38(r1)
/* 80182574 0017F574  80 63 00 08 */	lwz r3, 8(r3)
/* 80182578 0017F578  83 DF 01 60 */	lwz r30, 0x160(r31)
/* 8018257C 0017F57C  54 60 07 39 */	rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 80182580 0017F580  41 82 00 1C */	beq .L_8018259C
/* 80182584 0017F584  54 63 07 76 */	rlwinm r3, r3, 0, 0x1d, 0x1b
/* 80182588 0017F588  38 00 00 00 */	li r0, 0
/* 8018258C 0017F58C  90 7F 00 08 */	stw r3, 8(r31)
/* 80182590 0017F590  38 60 00 01 */	li r3, 1
/* 80182594 0017F594  98 1F 00 39 */	stb r0, 0x39(r31)
/* 80182598 0017F598  4B EE BF C1 */	bl marioStSystemLevel
.L_8018259C:
/* 8018259C 0017F59C  88 1F 00 39 */	lbz r0, 0x39(r31)
/* 801825A0 0017F5A0  28 00 00 17 */	cmplwi r0, 0x17
/* 801825A4 0017F5A4  41 81 02 7C */	bgt .L_80182820
/* 801825A8 0017F5A8  3C 60 80 39 */	lis r3, lbl_8038BE54@ha
/* 801825AC 0017F5AC  54 00 10 3A */	slwi r0, r0, 2
/* 801825B0 0017F5B0  38 63 BE 54 */	addi r3, r3, lbl_8038BE54@l
/* 801825B4 0017F5B4  7C 03 00 2E */	lwzx r0, r3, r0
/* 801825B8 0017F5B8  7C 09 03 A6 */	mtctr r0
/* 801825BC 0017F5BC  4E 80 04 20 */	bctr 
/* 801825C0 0017F5C0  7F E3 FB 78 */	mr r3, r31
/* 801825C4 0017F5C4  38 81 00 14 */	addi r4, r1, 0x14
/* 801825C8 0017F5C8  4B F4 10 99 */	bl partyGetAppearPos3
/* 801825CC 0017F5CC  80 81 00 14 */	lwz r4, 0x14(r1)
/* 801825D0 0017F5D0  38 00 00 04 */	li r0, 4
/* 801825D4 0017F5D4  80 61 00 18 */	lwz r3, 0x18(r1)
/* 801825D8 0017F5D8  90 9F 00 94 */	stw r4, 0x94(r31)
/* 801825DC 0017F5DC  90 7F 00 98 */	stw r3, 0x98(r31)
/* 801825E0 0017F5E0  80 61 00 1C */	lwz r3, 0x1c(r1)
/* 801825E4 0017F5E4  90 7F 00 9C */	stw r3, 0x9c(r31)
/* 801825E8 0017F5E8  90 1F 00 24 */	stw r0, 0x24(r31)
/* 801825EC 0017F5EC  C0 3F 00 58 */	lfs f1, 0x58(r31)
/* 801825F0 0017F5F0  C0 5F 00 60 */	lfs f2, 0x60(r31)
/* 801825F4 0017F5F4  C0 7F 00 94 */	lfs f3, 0x94(r31)
/* 801825F8 0017F5F8  C0 9F 00 9C */	lfs f4, 0x9c(r31)
/* 801825FC 0017F5FC  4B E8 49 C1 */	bl angleABf
/* 80182600 0017F600  D0 3F 00 FC */	stfs f1, 0xfc(r31)
/* 80182604 0017F604  C0 1F 00 FC */	lfs f0, 0xfc(r31)
/* 80182608 0017F608  D0 1F 01 00 */	stfs f0, 0x100(r31)
/* 8018260C 0017F60C  C0 1E 01 A8 */	lfs f0, 0x1a8(r30)
/* 80182610 0017F610  D0 1F 01 0C */	stfs f0, 0x10c(r31)
/* 80182614 0017F614  C0 1E 01 A8 */	lfs f0, 0x1a8(r30)
/* 80182618 0017F618  D0 1F 01 10 */	stfs f0, 0x110(r31)
/* 8018261C 0017F61C  C0 3F 00 58 */	lfs f1, 0x58(r31)
/* 80182620 0017F620  C0 5F 00 60 */	lfs f2, 0x60(r31)
/* 80182624 0017F624  C0 7F 00 94 */	lfs f3, 0x94(r31)
/* 80182628 0017F628  C0 9F 00 9C */	lfs f4, 0x9c(r31)
/* 8018262C 0017F62C  4B E8 4B 81 */	bl distABf
/* 80182630 0017F630  80 9F 00 24 */	lwz r4, 0x24(r31)
/* 80182634 0017F634  3C 00 43 30 */	lis r0, 0x4330
/* 80182638 0017F638  90 01 00 20 */	stw r0, 0x20(r1)
/* 8018263C 0017F63C  3C 60 80 30 */	lis r3, lbl_802F83B8@ha
/* 80182640 0017F640  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 80182644 0017F644  C8 63 83 B8 */	lfd f3, lbl_802F83B8@l(r3)
/* 80182648 0017F648  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018264C 0017F64C  38 00 00 01 */	li r0, 1
/* 80182650 0017F650  C0 02 CC 80 */	lfs f0, lbl_8041E000@sda21(r2)
/* 80182654 0017F654  C8 41 00 20 */	lfd f2, 0x20(r1)
/* 80182658 0017F658  EC 42 18 28 */	fsubs f2, f2, f3
/* 8018265C 0017F65C  EC 21 10 24 */	fdivs f1, f1, f2
/* 80182660 0017F660  D0 3F 01 04 */	stfs f1, 0x104(r31)
/* 80182664 0017F664  D0 1F 01 14 */	stfs f0, 0x114(r31)
/* 80182668 0017F668  98 1F 00 39 */	stb r0, 0x39(r31)
/* 8018266C 0017F66C  48 00 01 B4 */	b .L_80182820
/* 80182670 0017F670  7F E3 FB 78 */	mr r3, r31
/* 80182674 0017F674  38 81 00 08 */	addi r4, r1, 8
/* 80182678 0017F678  4B F4 0F E9 */	bl partyGetAppearPos3
/* 8018267C 0017F67C  80 A1 00 08 */	lwz r5, 8(r1)
/* 80182680 0017F680  3C 00 43 30 */	lis r0, 0x4330
/* 80182684 0017F684  80 81 00 0C */	lwz r4, 0xc(r1)
/* 80182688 0017F688  3C 60 80 30 */	lis r3, lbl_802F83B8@ha
/* 8018268C 0017F68C  C8 63 83 B8 */	lfd f3, lbl_802F83B8@l(r3)
/* 80182690 0017F690  90 BF 00 94 */	stw r5, 0x94(r31)
/* 80182694 0017F694  90 9F 00 98 */	stw r4, 0x98(r31)
/* 80182698 0017F698  80 61 00 10 */	lwz r3, 0x10(r1)
/* 8018269C 0017F69C  90 01 00 20 */	stw r0, 0x20(r1)
/* 801826A0 0017F6A0  90 7F 00 9C */	stw r3, 0x9c(r31)
/* 801826A4 0017F6A4  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 801826A8 0017F6A8  C0 5F 00 58 */	lfs f2, 0x58(r31)
/* 801826AC 0017F6AC  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801826B0 0017F6B0  C0 1F 00 94 */	lfs f0, 0x94(r31)
/* 801826B4 0017F6B4  90 61 00 24 */	stw r3, 0x24(r1)
/* 801826B8 0017F6B8  EC 20 10 28 */	fsubs f1, f0, f2
/* 801826BC 0017F6BC  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801826C0 0017F6C0  90 01 00 28 */	stw r0, 0x28(r1)
/* 801826C4 0017F6C4  EC 00 18 28 */	fsubs f0, f0, f3
/* 801826C8 0017F6C8  90 01 00 30 */	stw r0, 0x30(r1)
/* 801826CC 0017F6CC  EC 01 00 24 */	fdivs f0, f1, f0
/* 801826D0 0017F6D0  EC 02 00 2A */	fadds f0, f2, f0
/* 801826D4 0017F6D4  D0 1F 00 58 */	stfs f0, 0x58(r31)
/* 801826D8 0017F6D8  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 801826DC 0017F6DC  C0 5F 00 5C */	lfs f2, 0x5c(r31)
/* 801826E0 0017F6E0  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801826E4 0017F6E4  C0 1F 00 98 */	lfs f0, 0x98(r31)
/* 801826E8 0017F6E8  90 01 00 2C */	stw r0, 0x2c(r1)
/* 801826EC 0017F6EC  EC 20 10 28 */	fsubs f1, f0, f2
/* 801826F0 0017F6F0  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 801826F4 0017F6F4  EC 00 18 28 */	fsubs f0, f0, f3
/* 801826F8 0017F6F8  EC 01 00 24 */	fdivs f0, f1, f0
/* 801826FC 0017F6FC  EC 02 00 2A */	fadds f0, f2, f0
/* 80182700 0017F700  D0 1F 00 5C */	stfs f0, 0x5c(r31)
/* 80182704 0017F704  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 80182708 0017F708  C0 5F 00 60 */	lfs f2, 0x60(r31)
/* 8018270C 0017F70C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80182710 0017F710  C0 1F 00 9C */	lfs f0, 0x9c(r31)
/* 80182714 0017F714  90 01 00 34 */	stw r0, 0x34(r1)
/* 80182718 0017F718  EC 20 10 28 */	fsubs f1, f0, f2
/* 8018271C 0017F71C  C8 01 00 30 */	lfd f0, 0x30(r1)
/* 80182720 0017F720  EC 00 18 28 */	fsubs f0, f0, f3
/* 80182724 0017F724  EC 01 00 24 */	fdivs f0, f1, f0
/* 80182728 0017F728  EC 02 00 2A */	fadds f0, f2, f0
/* 8018272C 0017F72C  D0 1F 00 60 */	stfs f0, 0x60(r31)
/* 80182730 0017F730  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 80182734 0017F734  34 03 FF FF */	addic. r0, r3, -1
/* 80182738 0017F738  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8018273C 0017F73C  41 81 01 2C */	bgt .L_80182868
/* 80182740 0017F740  7F E3 FB 78 */	mr r3, r31
/* 80182744 0017F744  38 80 00 01 */	li r4, 1
/* 80182748 0017F748  4B F3 A3 9D */	bl partyChgPoseId
/* 8018274C 0017F74C  C0 02 CC 80 */	lfs f0, lbl_8041E000@sda21(r2)
/* 80182750 0017F750  38 00 00 0A */	li r0, 0xa
/* 80182754 0017F754  D0 1F 01 04 */	stfs f0, 0x104(r31)
/* 80182758 0017F758  98 1F 00 39 */	stb r0, 0x39(r31)
/* 8018275C 0017F75C  48 00 00 C4 */	b .L_80182820
/* 80182760 0017F760  C0 1E 01 AC */	lfs f0, 0x1ac(r30)
/* 80182764 0017F764  D0 1F 01 10 */	stfs f0, 0x110(r31)
/* 80182768 0017F768  C0 3F 01 10 */	lfs f1, 0x110(r31)
/* 8018276C 0017F76C  4B F1 24 F9 */	bl toMovedir
/* 80182770 0017F770  D0 3F 00 FC */	stfs f1, 0xfc(r31)
/* 80182774 0017F774  38 60 00 14 */	li r3, 0x14
/* 80182778 0017F778  38 00 00 19 */	li r0, 0x19
/* 8018277C 0017F77C  C0 1F 00 FC */	lfs f0, 0xfc(r31)
/* 80182780 0017F780  D0 1F 01 00 */	stfs f0, 0x100(r31)
/* 80182784 0017F784  98 7F 00 39 */	stb r3, 0x39(r31)
/* 80182788 0017F788  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8018278C 0017F78C  48 00 00 94 */	b .L_80182820
/* 80182790 0017F790  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 80182794 0017F794  34 03 FF FF */	addic. r0, r3, -1
/* 80182798 0017F798  90 1F 00 24 */	stw r0, 0x24(r31)
/* 8018279C 0017F79C  41 81 00 84 */	bgt .L_80182820
/* 801827A0 0017F7A0  38 9F 00 58 */	addi r4, r31, 0x58
/* 801827A4 0017F7A4  38 60 09 44 */	li r3, 0x944
/* 801827A8 0017F7A8  4B F5 2C A5 */	bl psndSFXOn_3D
/* 801827AC 0017F7AC  3C 80 80 30 */	lis r4, lbl_802F83A8@ha
/* 801827B0 0017F7B0  7F E3 FB 78 */	mr r3, r31
/* 801827B4 0017F7B4  38 84 83 A8 */	addi r4, r4, lbl_802F83A8@l
/* 801827B8 0017F7B8  4B F3 A2 B1 */	bl partyChgPose
/* 801827BC 0017F7BC  38 60 00 15 */	li r3, 0x15
/* 801827C0 0017F7C0  38 00 00 1E */	li r0, 0x1e
/* 801827C4 0017F7C4  98 7F 00 39 */	stb r3, 0x39(r31)
/* 801827C8 0017F7C8  90 1F 00 24 */	stw r0, 0x24(r31)
/* 801827CC 0017F7CC  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 801827D0 0017F7D0  34 03 FF FF */	addic. r0, r3, -1
/* 801827D4 0017F7D4  90 1F 00 24 */	stw r0, 0x24(r31)
/* 801827D8 0017F7D8  41 81 00 48 */	bgt .L_80182820
/* 801827DC 0017F7DC  7F E3 FB 78 */	mr r3, r31
/* 801827E0 0017F7E0  38 80 00 01 */	li r4, 1
/* 801827E4 0017F7E4  4B F3 A3 01 */	bl partyChgPoseId
/* 801827E8 0017F7E8  3C 60 80 39 */	lis r3, lbl_8038BAEC@ha
/* 801827EC 0017F7EC  38 80 00 00 */	li r4, 0
/* 801827F0 0017F7F0  38 63 BA EC */	addi r3, r3, lbl_8038BAEC@l
/* 801827F4 0017F7F4  38 A0 00 00 */	li r5, 0
/* 801827F8 0017F7F8  38 C0 00 1A */	li r6, 0x1a
/* 801827FC 0017F7FC  4B EB 43 89 */	bl evtEntryType
/* 80182800 0017F800  38 00 00 16 */	li r0, 0x16
/* 80182804 0017F804  98 1F 00 39 */	stb r0, 0x39(r31)
/* 80182808 0017F808  48 00 00 18 */	b .L_80182820
/* 8018280C 0017F80C  7F E3 FB 78 */	mr r3, r31
/* 80182810 0017F810  38 80 00 01 */	li r4, 1
/* 80182814 0017F814  4B F3 A2 D1 */	bl partyChgPoseId
/* 80182818 0017F818  38 00 00 50 */	li r0, 0x50
/* 8018281C 0017F81C  98 1F 00 39 */	stb r0, 0x39(r31)
.L_80182820:
/* 80182820 0017F820  88 1F 00 39 */	lbz r0, 0x39(r31)
/* 80182824 0017F824  2C 00 00 50 */	cmpwi r0, 0x50
/* 80182828 0017F828  41 82 00 08 */	beq .L_80182830
/* 8018282C 0017F82C  48 00 00 34 */	b .L_80182860
.L_80182830:
/* 80182830 0017F830  80 1F 00 00 */	lwz r0, 0(r31)
/* 80182834 0017F834  7F E3 FB 78 */	mr r3, r31
/* 80182838 0017F838  38 80 00 02 */	li r4, 2
/* 8018283C 0017F83C  54 00 06 2C */	rlwinm r0, r0, 0, 0x18, 0x16
/* 80182840 0017F840  90 1F 00 00 */	stw r0, 0(r31)
/* 80182844 0017F844  4B F3 7F 65 */	bl partyChgRunMode
/* 80182848 0017F848  38 00 00 00 */	li r0, 0
/* 8018284C 0017F84C  38 60 00 00 */	li r3, 0
/* 80182850 0017F850  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 80182854 0017F854  4B F1 05 C1 */	bl marioChgMot
/* 80182858 0017F858  38 60 00 00 */	li r3, 0
/* 8018285C 0017F85C  4B EE BC FD */	bl marioStSystemLevel
.L_80182860:
/* 80182860 0017F860  7F E3 FB 78 */	mr r3, r31
/* 80182864 0017F864  4B F3 EF 81 */	bl partyChkGnd
.L_80182868:
/* 80182868 0017F868  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8018286C 0017F86C  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 80182870 0017F870  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 80182874 0017F874  7C 08 03 A6 */	mtlr r0
/* 80182878 0017F878  38 21 00 40 */	addi r1, r1, 0x40
/* 8018287C 0017F87C  4E 80 00 20 */	blr 

.global chuchu_move
chuchu_move:
/* 80182880 0017F880  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80182884 0017F884  7C 08 02 A6 */	mflr r0
/* 80182888 0017F888  90 01 00 14 */	stw r0, 0x14(r1)
/* 8018288C 0017F88C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80182890 0017F890  7C 7F 1B 78 */	mr r31, r3
/* 80182894 0017F894  80 83 00 08 */	lwz r4, 8(r3)
/* 80182898 0017F898  54 80 07 39 */	rlwinm. r0, r4, 0, 0x1c, 0x1c
/* 8018289C 0017F89C  41 82 00 20 */	beq .L_801828BC
/* 801828A0 0017F8A0  54 80 07 76 */	rlwinm r0, r4, 0, 0x1d, 0x1b
/* 801828A4 0017F8A4  38 80 00 01 */	li r4, 1
/* 801828A8 0017F8A8  90 1F 00 08 */	stw r0, 8(r31)
/* 801828AC 0017F8AC  80 1F 00 00 */	lwz r0, 0(r31)
/* 801828B0 0017F8B0  54 00 06 2C */	rlwinm r0, r0, 0, 0x18, 0x16
/* 801828B4 0017F8B4  90 1F 00 00 */	stw r0, 0(r31)
/* 801828B8 0017F8B8  4B F4 50 B1 */	bl partyWalkInit
.L_801828BC:
/* 801828BC 0017F8BC  7F E3 FB 78 */	mr r3, r31
/* 801828C0 0017F8C0  4B F4 6A 05 */	bl unk_JP_US_EU_19_800c92c4
/* 801828C4 0017F8C4  7F E3 FB 78 */	mr r3, r31
/* 801828C8 0017F8C8  4B F4 46 E9 */	bl partyWalkMain
/* 801828CC 0017F8CC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801828D0 0017F8D0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801828D4 0017F8D4  7C 08 03 A6 */	mtlr r0
/* 801828D8 0017F8D8  38 21 00 10 */	addi r1, r1, 0x10
/* 801828DC 0017F8DC  4E 80 00 20 */	blr 

.global chuchu_exit
chuchu_exit:
/* 801828E0 0017F8E0  4E 80 00 20 */	blr 

.global func_801828E4
func_801828E4:

.global chuchu_reinit
chuchu_reinit:
/* 801828E4 0017F8E4  4E 80 00 20 */	blr 

.global chuchu_init
chuchu_init:
/* 801828E8 0017F8E8  38 80 00 07 */	li r4, 7
/* 801828EC 0017F8EC  38 00 00 00 */	li r0, 0
/* 801828F0 0017F8F0  98 83 00 33 */	stb r4, 0x33(r3)
/* 801828F4 0017F8F4  C0 22 CC 84 */	lfs f1, lbl_8041E004@sda21(r2)
/* 801828F8 0017F8F8  98 03 00 32 */	stb r0, 0x32(r3)
/* 801828FC 0017F8FC  C0 02 CC 88 */	lfs f0, lbl_8041E008@sda21(r2)
/* 80182900 0017F900  D0 23 00 F0 */	stfs f1, 0xf0(r3)
/* 80182904 0017F904  D0 03 00 F4 */	stfs f0, 0xf4(r3)
/* 80182908 0017F908  4E 80 00 20 */	blr 

.global chuchu_searchObject
chuchu_searchObject:
/* 8018290C 0017F90C  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 80182910 0017F910  7C 08 02 A6 */	mflr r0
/* 80182914 0017F914  90 01 00 64 */	stw r0, 0x64(r1)
/* 80182918 0017F918  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 8018291C 0017F91C  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 80182920 0017F920  93 E1 00 4C */	stw r31, 0x4c(r1)
/* 80182924 0017F924  93 C1 00 48 */	stw r30, 0x48(r1)
/* 80182928 0017F928  93 A1 00 44 */	stw r29, 0x44(r1)
/* 8018292C 0017F92C  93 81 00 40 */	stw r28, 0x40(r1)
/* 80182930 0017F930  4B FB 91 29 */	bl marioGetPartyId
/* 80182934 0017F934  4B F3 A4 FD */	bl partyGetPtr
/* 80182938 0017F938  7C 7C 1B 78 */	mr r28, r3
/* 8018293C 0017F93C  C0 82 CC 8C */	lfs f4, lbl_8041E00C@sda21(r2)
/* 80182940 0017F940  83 A3 01 60 */	lwz r29, 0x160(r3)
/* 80182944 0017F944  C0 3D 00 8C */	lfs f1, 0x8c(r29)
/* 80182948 0017F948  C0 5D 00 90 */	lfs f2, 0x90(r29)
/* 8018294C 0017F94C  C0 7D 00 94 */	lfs f3, 0x94(r29)
/* 80182950 0017F950  4B F2 8A 09 */	bl itemNearDistCheck
/* 80182954 0017F954  28 03 00 00 */	cmplwi r3, 0
/* 80182958 0017F958  41 82 00 0C */	beq .L_80182964
/* 8018295C 0017F95C  38 60 00 01 */	li r3, 1
/* 80182960 0017F960  48 00 01 50 */	b .L_80182AB0
.L_80182964:
/* 80182964 0017F964  3C 60 80 39 */	lis r3, lbl_8038BAB0@ha
/* 80182968 0017F968  C0 3D 00 8C */	lfs f1, 0x8c(r29)
/* 8018296C 0017F96C  C0 5D 00 90 */	lfs f2, 0x90(r29)
/* 80182970 0017F970  38 63 BA B0 */	addi r3, r3, lbl_8038BAB0@l
/* 80182974 0017F974  C0 7D 00 94 */	lfs f3, 0x94(r29)
/* 80182978 0017F978  C0 82 CC 8C */	lfs f4, lbl_8041E00C@sda21(r2)
/* 8018297C 0017F97C  4B ED B7 AD */	bl mobjNearDistCheck2
/* 80182980 0017F980  28 03 00 00 */	cmplwi r3, 0
/* 80182984 0017F984  41 82 00 0C */	beq .L_80182990
/* 80182988 0017F988  38 60 00 01 */	li r3, 1
/* 8018298C 0017F98C  48 00 01 24 */	b .L_80182AB0
.L_80182990:
/* 80182990 0017F990  3C 60 80 39 */	lis r3, lbl_8038BB34@ha
/* 80182994 0017F994  3B A0 00 00 */	li r29, 0
/* 80182998 0017F998  83 DC 01 60 */	lwz r30, 0x160(r28)
/* 8018299C 0017F99C  3B E3 BB 34 */	addi r31, r3, lbl_8038BB34@l
/* 801829A0 0017F9A0  C3 E2 CC 90 */	lfs f31, lbl_8041E010@sda21(r2)
/* 801829A4 0017F9A4  7F BC EB 78 */	mr r28, r29
.L_801829A8:
/* 801829A8 0017F9A8  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 801829AC 0017F9AC  80 9F 00 00 */	lwz r4, 0(r31)
/* 801829B0 0017F9B0  38 63 01 2C */	addi r3, r3, 0x12c
/* 801829B4 0017F9B4  48 0E 4A 99 */	bl strcmp
/* 801829B8 0017F9B8  2C 03 00 00 */	cmpwi r3, 0
/* 801829BC 0017F9BC  40 82 00 D8 */	bne .L_80182A94
/* 801829C0 0017F9C0  80 9F 00 04 */	lwz r4, 4(r31)
/* 801829C4 0017F9C4  38 60 00 00 */	li r3, 0
/* 801829C8 0017F9C8  4B EA E2 05 */	bl evtGetValue
/* 801829CC 0017F9CC  2C 03 00 00 */	cmpwi r3, 0
/* 801829D0 0017F9D0  40 82 00 C4 */	bne .L_80182A94
/* 801829D4 0017F9D4  80 9F 00 08 */	lwz r4, 8(r31)
/* 801829D8 0017F9D8  3C E0 43 30 */	lis r7, 0x4330
/* 801829DC 0017F9DC  3C C0 80 30 */	lis r6, lbl_802F83B8@ha
/* 801829E0 0017F9E0  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 801829E4 0017F9E4  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 801829E8 0017F9E8  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 801829EC 0017F9EC  90 81 00 24 */	stw r4, 0x24(r1)
/* 801829F0 0017F9F0  6C 65 80 00 */	xoris r5, r3, 0x8000
/* 801829F4 0017F9F4  3C 80 80 30 */	lis r4, lbl_802F839C@ha
/* 801829F8 0017F9F8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801829FC 0017F9FC  39 04 83 9C */	addi r8, r4, lbl_802F839C@l
/* 80182A00 0017FA00  90 E1 00 20 */	stw r7, 0x20(r1)
/* 80182A04 0017FA04  C8 46 83 B8 */	lfd f2, lbl_802F83B8@l(r6)
/* 80182A08 0017FA08  38 7E 00 8C */	addi r3, r30, 0x8c
/* 80182A0C 0017FA0C  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 80182A10 0017FA10  38 81 00 08 */	addi r4, r1, 8
/* 80182A14 0017FA14  80 C8 00 00 */	lwz r6, 0(r8)
/* 80182A18 0017FA18  EC 00 10 28 */	fsubs f0, f0, f2
/* 80182A1C 0017FA1C  90 A1 00 2C */	stw r5, 0x2c(r1)
/* 80182A20 0017FA20  81 28 00 04 */	lwz r9, 4(r8)
/* 80182A24 0017FA24  90 C1 00 14 */	stw r6, 0x14(r1)
/* 80182A28 0017FA28  81 08 00 08 */	lwz r8, 8(r8)
/* 80182A2C 0017FA2C  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 80182A30 0017FA30  90 E1 00 28 */	stw r7, 0x28(r1)
/* 80182A34 0017FA34  80 C1 00 14 */	lwz r6, 0x14(r1)
/* 80182A38 0017FA38  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 80182A3C 0017FA3C  90 01 00 34 */	stw r0, 0x34(r1)
/* 80182A40 0017FA40  EC 20 10 28 */	fsubs f1, f0, f2
/* 80182A44 0017FA44  90 E1 00 30 */	stw r7, 0x30(r1)
/* 80182A48 0017FA48  C8 01 00 30 */	lfd f0, 0x30(r1)
/* 80182A4C 0017FA4C  91 21 00 18 */	stw r9, 0x18(r1)
/* 80182A50 0017FA50  EC 00 10 28 */	fsubs f0, f0, f2
/* 80182A54 0017FA54  91 01 00 1C */	stw r8, 0x1c(r1)
/* 80182A58 0017FA58  D0 21 00 18 */	stfs f1, 0x18(r1)
/* 80182A5C 0017FA5C  D0 01 00 1C */	stfs f0, 0x1c(r1)
/* 80182A60 0017FA60  80 A1 00 18 */	lwz r5, 0x18(r1)
/* 80182A64 0017FA64  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80182A68 0017FA68  90 C1 00 08 */	stw r6, 8(r1)
/* 80182A6C 0017FA6C  90 A1 00 0C */	stw r5, 0xc(r1)
/* 80182A70 0017FA70  90 01 00 10 */	stw r0, 0x10(r1)
/* 80182A74 0017FA74  48 11 66 3D */	bl PSVECDistance
/* 80182A78 0017FA78  C0 02 CC 8C */	lfs f0, lbl_8041E00C@sda21(r2)
/* 80182A7C 0017FA7C  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 80182A80 0017FA80  41 80 00 14 */	blt .L_80182A94
/* 80182A84 0017FA84  FC 1F 08 40 */	fcmpo cr0, f31, f1
/* 80182A88 0017FA88  40 81 00 0C */	ble .L_80182A94
/* 80182A8C 0017FA8C  FF E0 08 90 */	fmr f31, f1
/* 80182A90 0017FA90  3B A0 00 01 */	li r29, 1
.L_80182A94:
/* 80182A94 0017FA94  3B 9C 00 01 */	addi r28, r28, 1
/* 80182A98 0017FA98  3B FF 00 14 */	addi r31, r31, 0x14
/* 80182A9C 0017FA9C  28 1C 00 28 */	cmplwi r28, 0x28
/* 80182AA0 0017FAA0  41 80 FF 08 */	blt .L_801829A8
/* 80182AA4 0017FAA4  7C 1D 00 D0 */	neg r0, r29
/* 80182AA8 0017FAA8  7C 00 EB 78 */	or r0, r0, r29
/* 80182AAC 0017FAAC  54 03 0F FE */	srwi r3, r0, 0x1f
.L_80182AB0:
/* 80182AB0 0017FAB0  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 80182AB4 0017FAB4  80 01 00 64 */	lwz r0, 0x64(r1)
/* 80182AB8 0017FAB8  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 80182ABC 0017FABC  83 E1 00 4C */	lwz r31, 0x4c(r1)
/* 80182AC0 0017FAC0  83 C1 00 48 */	lwz r30, 0x48(r1)
/* 80182AC4 0017FAC4  83 A1 00 44 */	lwz r29, 0x44(r1)
/* 80182AC8 0017FAC8  83 81 00 40 */	lwz r28, 0x40(r1)
/* 80182ACC 0017FACC  7C 08 03 A6 */	mtlr r0
/* 80182AD0 0017FAD0  38 21 00 60 */	addi r1, r1, 0x60
/* 80182AD4 0017FAD4  4E 80 00 20 */	blr 

.global post_msg
post_msg:
/* 80182AD8 0017FAD8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80182ADC 0017FADC  7C 08 02 A6 */	mflr r0
/* 80182AE0 0017FAE0  90 01 00 14 */	stw r0, 0x14(r1)
/* 80182AE4 0017FAE4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80182AE8 0017FAE8  7C 7F 1B 78 */	mr r31, r3
/* 80182AEC 0017FAEC  4B FB 8F 6D */	bl marioGetPartyId
/* 80182AF0 0017FAF0  4B F3 A3 41 */	bl partyGetPtr
/* 80182AF4 0017FAF4  38 00 00 00 */	li r0, 0
/* 80182AF8 0017FAF8  28 03 00 00 */	cmplwi r3, 0
/* 80182AFC 0017FAFC  90 1F 00 9C */	stw r0, 0x9c(r31)
/* 80182B00 0017FB00  41 82 00 10 */	beq .L_80182B10
/* 80182B04 0017FB04  88 83 00 39 */	lbz r4, 0x39(r3)
/* 80182B08 0017FB08  38 04 00 01 */	addi r0, r4, 1
/* 80182B0C 0017FB0C  98 03 00 39 */	stb r0, 0x39(r3)
.L_80182B10:
/* 80182B10 0017FB10  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80182B14 0017FB14  38 60 00 02 */	li r3, 2
/* 80182B18 0017FB18  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80182B1C 0017FB1C  7C 08 03 A6 */	mtlr r0
/* 80182B20 0017FB20  38 21 00 10 */	addi r1, r1, 0x10
/* 80182B24 0017FB24  4E 80 00 20 */	blr 

.global set_msg
set_msg:
/* 80182B28 0017FB28  94 21 FF 30 */	stwu r1, -0xd0(r1)
/* 80182B2C 0017FB2C  7C 08 02 A6 */	mflr r0
/* 80182B30 0017FB30  90 01 00 D4 */	stw r0, 0xd4(r1)
/* 80182B34 0017FB34  DB E1 00 C0 */	stfd f31, 0xc0(r1)
/* 80182B38 0017FB38  F3 E1 00 C8 */	psq_st f31, 200(r1), 0, qr0
/* 80182B3C 0017FB3C  DB C1 00 B0 */	stfd f30, 0xb0(r1)
/* 80182B40 0017FB40  F3 C1 00 B8 */	psq_st f30, 184(r1), 0, qr0
/* 80182B44 0017FB44  DB A1 00 A0 */	stfd f29, 0xa0(r1)
/* 80182B48 0017FB48  F3 A1 00 A8 */	psq_st f29, 168(r1), 0, qr0
/* 80182B4C 0017FB4C  BE 41 00 68 */	stmw r18, 0x68(r1)
/* 80182B50 0017FB50  3C 80 80 30 */	lis r4, lbl_802F8158@ha
/* 80182B54 0017FB54  7C 72 1B 78 */	mr r18, r3
/* 80182B58 0017FB58  3B 64 81 58 */	addi r27, r4, lbl_802F8158@l
/* 80182B5C 0017FB5C  4B FB 8E FD */	bl marioGetPartyId
/* 80182B60 0017FB60  4B F3 A2 D1 */	bl partyGetPtr
/* 80182B64 0017FB64  82 C3 01 60 */	lwz r22, 0x160(r3)
/* 80182B68 0017FB68  38 00 00 00 */	li r0, 0
/* 80182B6C 0017FB6C  7C 73 1B 79 */	or. r19, r3, r3
/* 80182B70 0017FB70  90 12 00 9C */	stw r0, 0x9c(r18)
/* 80182B74 0017FB74  90 12 00 A0 */	stw r0, 0xa0(r18)
/* 80182B78 0017FB78  40 82 00 0C */	bne .L_80182B84
/* 80182B7C 0017FB7C  38 60 00 02 */	li r3, 2
/* 80182B80 0017FB80  48 00 03 64 */	b .L_80182EE4
.L_80182B84:
/* 80182B84 0017FB84  3C 80 80 39 */	lis r4, lbl_8038BAB0@ha
/* 80182B88 0017FB88  3C 60 80 39 */	lis r3, lbl_8038BB34@ha
/* 80182B8C 0017FB8C  3B A4 BA B0 */	addi r29, r4, lbl_8038BAB0@l
/* 80182B90 0017FB90  3A A0 00 00 */	li r21, 0
/* 80182B94 0017FB94  3B E3 BB 34 */	addi r31, r3, lbl_8038BB34@l
.L_80182B98:
/* 80182B98 0017FB98  2C 15 00 00 */	cmpwi r21, 0
/* 80182B9C 0017FB9C  40 82 00 0C */	bne .L_80182BA8
/* 80182BA0 0017FBA0  C3 E2 CC 8C */	lfs f31, lbl_8041E00C@sda21(r2)
/* 80182BA4 0017FBA4  48 00 00 08 */	b .L_80182BAC
.L_80182BA8:
/* 80182BA8 0017FBA8  C3 E2 CC 90 */	lfs f31, lbl_8041E010@sda21(r2)
.L_80182BAC:
/* 80182BAC 0017FBAC  FC 80 F8 90 */	fmr f4, f31
/* 80182BB0 0017FBB0  C0 36 00 8C */	lfs f1, 0x8c(r22)
/* 80182BB4 0017FBB4  C0 56 00 90 */	lfs f2, 0x90(r22)
/* 80182BB8 0017FBB8  3A 80 FF FF */	li r20, -1
/* 80182BBC 0017FBBC  C0 76 00 94 */	lfs f3, 0x94(r22)
/* 80182BC0 0017FBC0  4B F2 87 99 */	bl itemNearDistCheck
/* 80182BC4 0017FBC4  FC 80 F8 90 */	fmr f4, f31
/* 80182BC8 0017FBC8  7C 7C 1B 78 */	mr r28, r3
/* 80182BCC 0017FBCC  C0 36 00 8C */	lfs f1, 0x8c(r22)
/* 80182BD0 0017FBD0  7F A3 EB 78 */	mr r3, r29
/* 80182BD4 0017FBD4  C0 56 00 90 */	lfs f2, 0x90(r22)
/* 80182BD8 0017FBD8  C0 76 00 94 */	lfs f3, 0x94(r22)
/* 80182BDC 0017FBDC  4B ED B5 4D */	bl mobjNearDistCheck2
/* 80182BE0 0017FBE0  3B 00 00 00 */	li r24, 0
/* 80182BE4 0017FBE4  83 33 01 60 */	lwz r25, 0x160(r19)
/* 80182BE8 0017FBE8  C3 A2 CC 90 */	lfs f29, lbl_8041E010@sda21(r2)
/* 80182BEC 0017FBEC  7C 7E 1B 78 */	mr r30, r3
/* 80182BF0 0017FBF0  7F FA FB 78 */	mr r26, r31
/* 80182BF4 0017FBF4  7F 17 C3 78 */	mr r23, r24
.L_80182BF8:
/* 80182BF8 0017FBF8  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80182BFC 0017FBFC  80 9A 00 00 */	lwz r4, 0(r26)
/* 80182C00 0017FC00  38 63 01 2C */	addi r3, r3, 0x12c
/* 80182C04 0017FC04  48 0E 48 49 */	bl strcmp
/* 80182C08 0017FC08  2C 03 00 00 */	cmpwi r3, 0
/* 80182C0C 0017FC0C  40 82 00 E0 */	bne .L_80182CEC
/* 80182C10 0017FC10  80 9A 00 04 */	lwz r4, 4(r26)
/* 80182C14 0017FC14  38 60 00 00 */	li r3, 0
/* 80182C18 0017FC18  4B EA DF B5 */	bl evtGetValue
/* 80182C1C 0017FC1C  2C 03 00 00 */	cmpwi r3, 0
/* 80182C20 0017FC20  40 82 00 CC */	bne .L_80182CEC
/* 80182C24 0017FC24  80 BA 00 08 */	lwz r5, 8(r26)
/* 80182C28 0017FC28  3C C0 43 30 */	lis r6, 0x4330
/* 80182C2C 0017FC2C  80 9A 00 0C */	lwz r4, 0xc(r26)
/* 80182C30 0017FC30  38 79 00 8C */	addi r3, r25, 0x8c
/* 80182C34 0017FC34  80 1A 00 10 */	lwz r0, 0x10(r26)
/* 80182C38 0017FC38  6C A7 80 00 */	xoris r7, r5, 0x8000
/* 80182C3C 0017FC3C  6C 85 80 00 */	xoris r5, r4, 0x8000
/* 80182C40 0017FC40  90 E1 00 4C */	stw r7, 0x4c(r1)
/* 80182C44 0017FC44  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80182C48 0017FC48  81 3B 02 44 */	lwz r9, 0x244(r27)
/* 80182C4C 0017FC4C  90 C1 00 48 */	stw r6, 0x48(r1)
/* 80182C50 0017FC50  38 81 00 08 */	addi r4, r1, 8
/* 80182C54 0017FC54  81 1B 02 48 */	lwz r8, 0x248(r27)
/* 80182C58 0017FC58  80 FB 02 4C */	lwz r7, 0x24c(r27)
/* 80182C5C 0017FC5C  90 A1 00 54 */	stw r5, 0x54(r1)
/* 80182C60 0017FC60  C8 7B 02 60 */	lfd f3, 0x260(r27)
/* 80182C64 0017FC64  90 C1 00 50 */	stw r6, 0x50(r1)
/* 80182C68 0017FC68  C8 21 00 48 */	lfd f1, 0x48(r1)
/* 80182C6C 0017FC6C  C8 01 00 50 */	lfd f0, 0x50(r1)
/* 80182C70 0017FC70  90 01 00 5C */	stw r0, 0x5c(r1)
/* 80182C74 0017FC74  EC 41 18 28 */	fsubs f2, f1, f3
/* 80182C78 0017FC78  EC 20 18 28 */	fsubs f1, f0, f3
/* 80182C7C 0017FC7C  90 C1 00 58 */	stw r6, 0x58(r1)
/* 80182C80 0017FC80  C8 01 00 58 */	lfd f0, 0x58(r1)
/* 80182C84 0017FC84  91 21 00 14 */	stw r9, 0x14(r1)
/* 80182C88 0017FC88  EC 00 18 28 */	fsubs f0, f0, f3
/* 80182C8C 0017FC8C  91 01 00 18 */	stw r8, 0x18(r1)
/* 80182C90 0017FC90  90 E1 00 1C */	stw r7, 0x1c(r1)
/* 80182C94 0017FC94  D0 41 00 14 */	stfs f2, 0x14(r1)
/* 80182C98 0017FC98  D0 21 00 18 */	stfs f1, 0x18(r1)
/* 80182C9C 0017FC9C  80 C1 00 14 */	lwz r6, 0x14(r1)
/* 80182CA0 0017FCA0  D0 01 00 1C */	stfs f0, 0x1c(r1)
/* 80182CA4 0017FCA4  80 A1 00 18 */	lwz r5, 0x18(r1)
/* 80182CA8 0017FCA8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80182CAC 0017FCAC  90 C1 00 08 */	stw r6, 8(r1)
/* 80182CB0 0017FCB0  90 A1 00 0C */	stw r5, 0xc(r1)
/* 80182CB4 0017FCB4  90 01 00 10 */	stw r0, 0x10(r1)
/* 80182CB8 0017FCB8  48 11 63 F9 */	bl PSVECDistance
/* 80182CBC 0017FCBC  FC 1F 08 40 */	fcmpo cr0, f31, f1
/* 80182CC0 0017FCC0  41 80 00 2C */	blt .L_80182CEC
/* 80182CC4 0017FCC4  FC 1D 08 40 */	fcmpo cr0, f29, f1
/* 80182CC8 0017FCC8  40 81 00 24 */	ble .L_80182CEC
/* 80182CCC 0017FCCC  C0 41 00 08 */	lfs f2, 8(r1)
/* 80182CD0 0017FCD0  FF A0 08 90 */	fmr f29, f1
/* 80182CD4 0017FCD4  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 80182CD8 0017FCD8  3B 00 00 01 */	li r24, 1
/* 80182CDC 0017FCDC  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 80182CE0 0017FCE0  D0 41 00 38 */	stfs f2, 0x38(r1)
/* 80182CE4 0017FCE4  D0 21 00 3C */	stfs f1, 0x3c(r1)
/* 80182CE8 0017FCE8  D0 01 00 40 */	stfs f0, 0x40(r1)
.L_80182CEC:
/* 80182CEC 0017FCEC  3A F7 00 01 */	addi r23, r23, 1
/* 80182CF0 0017FCF0  3B 5A 00 14 */	addi r26, r26, 0x14
/* 80182CF4 0017FCF4  28 17 00 28 */	cmplwi r23, 0x28
/* 80182CF8 0017FCF8  41 80 FF 00 */	blt .L_80182BF8
/* 80182CFC 0017FCFC  28 1C 00 00 */	cmplwi r28, 0
/* 80182D00 0017FD00  C3 A2 CC 90 */	lfs f29, lbl_8041E010@sda21(r2)
/* 80182D04 0017FD04  41 82 00 A0 */	beq .L_80182DA4
/* 80182D08 0017FD08  80 DB 01 30 */	lwz r6, 0x130(r27)
/* 80182D0C 0017FD0C  38 61 00 2C */	addi r3, r1, 0x2c
/* 80182D10 0017FD10  80 BB 01 34 */	lwz r5, 0x134(r27)
/* 80182D14 0017FD14  38 96 00 8C */	addi r4, r22, 0x8c
/* 80182D18 0017FD18  80 1B 01 38 */	lwz r0, 0x138(r27)
/* 80182D1C 0017FD1C  90 C1 00 20 */	stw r6, 0x20(r1)
/* 80182D20 0017FD20  C0 1C 00 3C */	lfs f0, 0x3c(r28)
/* 80182D24 0017FD24  90 A1 00 24 */	stw r5, 0x24(r1)
/* 80182D28 0017FD28  C0 3C 00 40 */	lfs f1, 0x40(r28)
/* 80182D2C 0017FD2C  D0 01 00 20 */	stfs f0, 0x20(r1)
/* 80182D30 0017FD30  C0 1C 00 44 */	lfs f0, 0x44(r28)
/* 80182D34 0017FD34  90 01 00 28 */	stw r0, 0x28(r1)
/* 80182D38 0017FD38  80 C1 00 20 */	lwz r6, 0x20(r1)
/* 80182D3C 0017FD3C  D0 21 00 24 */	stfs f1, 0x24(r1)
/* 80182D40 0017FD40  D0 01 00 28 */	stfs f0, 0x28(r1)
/* 80182D44 0017FD44  80 A1 00 24 */	lwz r5, 0x24(r1)
/* 80182D48 0017FD48  80 01 00 28 */	lwz r0, 0x28(r1)
/* 80182D4C 0017FD4C  90 C1 00 2C */	stw r6, 0x2c(r1)
/* 80182D50 0017FD50  90 A1 00 30 */	stw r5, 0x30(r1)
/* 80182D54 0017FD54  90 01 00 34 */	stw r0, 0x34(r1)
/* 80182D58 0017FD58  48 11 63 59 */	bl PSVECDistance
/* 80182D5C 0017FD5C  C0 02 CC 90 */	lfs f0, lbl_8041E010@sda21(r2)
/* 80182D60 0017FD60  FC 00 08 40 */	fcmpo cr0, f0, f1
/* 80182D64 0017FD64  40 81 00 40 */	ble .L_80182DA4
/* 80182D68 0017FD68  38 61 00 2C */	addi r3, r1, 0x2c
/* 80182D6C 0017FD6C  38 96 00 8C */	addi r4, r22, 0x8c
/* 80182D70 0017FD70  48 11 63 41 */	bl PSVECDistance
/* 80182D74 0017FD74  FC 00 08 90 */	fmr f0, f1
/* 80182D78 0017FD78  C0 33 00 58 */	lfs f1, 0x58(r19)
/* 80182D7C 0017FD7C  C0 53 00 60 */	lfs f2, 0x60(r19)
/* 80182D80 0017FD80  C0 7C 00 3C */	lfs f3, 0x3c(r28)
/* 80182D84 0017FD84  FF A0 00 90 */	fmr f29, f0
/* 80182D88 0017FD88  C0 9C 00 44 */	lfs f4, 0x44(r28)
/* 80182D8C 0017FD8C  4B E8 42 31 */	bl angleABf
/* 80182D90 0017FD90  C0 13 00 F8 */	lfs f0, 0xf8(r19)
/* 80182D94 0017FD94  EC 21 00 28 */	fsubs f1, f1, f0
/* 80182D98 0017FD98  4B F1 20 21 */	bl revise360
/* 80182D9C 0017FD9C  3A 80 00 00 */	li r20, 0
/* 80182DA0 0017FDA0  FF C0 08 90 */	fmr f30, f1
.L_80182DA4:
/* 80182DA4 0017FDA4  28 1E 00 00 */	cmplwi r30, 0
/* 80182DA8 0017FDA8  41 82 00 54 */	beq .L_80182DFC
/* 80182DAC 0017FDAC  38 7E 00 38 */	addi r3, r30, 0x38
/* 80182DB0 0017FDB0  38 96 00 8C */	addi r4, r22, 0x8c
/* 80182DB4 0017FDB4  48 11 62 FD */	bl PSVECDistance
/* 80182DB8 0017FDB8  FC 1D 08 40 */	fcmpo cr0, f29, f1
/* 80182DBC 0017FDBC  40 81 00 40 */	ble .L_80182DFC
/* 80182DC0 0017FDC0  38 7E 00 38 */	addi r3, r30, 0x38
/* 80182DC4 0017FDC4  38 96 00 8C */	addi r4, r22, 0x8c
/* 80182DC8 0017FDC8  48 11 62 E9 */	bl PSVECDistance
/* 80182DCC 0017FDCC  FC 00 08 90 */	fmr f0, f1
/* 80182DD0 0017FDD0  C0 33 00 58 */	lfs f1, 0x58(r19)
/* 80182DD4 0017FDD4  C0 53 00 60 */	lfs f2, 0x60(r19)
/* 80182DD8 0017FDD8  C0 7E 00 38 */	lfs f3, 0x38(r30)
/* 80182DDC 0017FDDC  FF A0 00 90 */	fmr f29, f0
/* 80182DE0 0017FDE0  C0 9E 00 40 */	lfs f4, 0x40(r30)
/* 80182DE4 0017FDE4  4B E8 41 D9 */	bl angleABf
/* 80182DE8 0017FDE8  C0 13 00 F8 */	lfs f0, 0xf8(r19)
/* 80182DEC 0017FDEC  EC 21 00 28 */	fsubs f1, f1, f0
/* 80182DF0 0017FDF0  4B F1 1F C9 */	bl revise360
/* 80182DF4 0017FDF4  3A 80 00 01 */	li r20, 1
/* 80182DF8 0017FDF8  FF C0 08 90 */	fmr f30, f1
.L_80182DFC:
/* 80182DFC 0017FDFC  2C 18 00 00 */	cmpwi r24, 0
/* 80182E00 0017FE00  41 82 00 4C */	beq .L_80182E4C
/* 80182E04 0017FE04  38 61 00 38 */	addi r3, r1, 0x38
/* 80182E08 0017FE08  38 96 00 8C */	addi r4, r22, 0x8c
/* 80182E0C 0017FE0C  48 11 62 A5 */	bl PSVECDistance
/* 80182E10 0017FE10  FC 1D 08 40 */	fcmpo cr0, f29, f1
/* 80182E14 0017FE14  40 81 00 38 */	ble .L_80182E4C
/* 80182E18 0017FE18  38 61 00 38 */	addi r3, r1, 0x38
/* 80182E1C 0017FE1C  38 96 00 8C */	addi r4, r22, 0x8c
/* 80182E20 0017FE20  48 11 62 91 */	bl PSVECDistance
/* 80182E24 0017FE24  C0 33 00 58 */	lfs f1, 0x58(r19)
/* 80182E28 0017FE28  C0 53 00 60 */	lfs f2, 0x60(r19)
/* 80182E2C 0017FE2C  C0 61 00 38 */	lfs f3, 0x38(r1)
/* 80182E30 0017FE30  C0 81 00 40 */	lfs f4, 0x40(r1)
/* 80182E34 0017FE34  4B E8 41 89 */	bl angleABf
/* 80182E38 0017FE38  C0 13 00 F8 */	lfs f0, 0xf8(r19)
/* 80182E3C 0017FE3C  EC 21 00 28 */	fsubs f1, f1, f0
/* 80182E40 0017FE40  4B F1 1F 79 */	bl revise360
/* 80182E44 0017FE44  3A 80 00 02 */	li r20, 2
/* 80182E48 0017FE48  FF C0 08 90 */	fmr f30, f1
.L_80182E4C:
/* 80182E4C 0017FE4C  2C 14 00 00 */	cmpwi r20, 0
/* 80182E50 0017FE50  40 80 00 10 */	bge .L_80182E60
/* 80182E54 0017FE54  3A B5 00 01 */	addi r21, r21, 1
/* 80182E58 0017FE58  2C 15 00 02 */	cmpwi r21, 2
/* 80182E5C 0017FE5C  41 80 FD 3C */	blt .L_80182B98
.L_80182E60:
/* 80182E60 0017FE60  2C 14 00 00 */	cmpwi r20, 0
/* 80182E64 0017FE64  41 80 00 6C */	blt .L_80182ED0
/* 80182E68 0017FE68  C0 02 CC 8C */	lfs f0, lbl_8041E00C@sda21(r2)
/* 80182E6C 0017FE6C  FC 00 F8 00 */	fcmpu cr0, f0, f31
/* 80182E70 0017FE70  40 82 00 18 */	bne .L_80182E88
/* 80182E74 0017FE74  38 7B 02 68 */	addi r3, r27, 0x268
/* 80182E78 0017FE78  38 00 00 02 */	li r0, 2
/* 80182E7C 0017FE7C  90 72 00 9C */	stw r3, 0x9c(r18)
/* 80182E80 0017FE80  90 12 00 A0 */	stw r0, 0xa0(r18)
/* 80182E84 0017FE84  48 00 00 14 */	b .L_80182E98
.L_80182E88:
/* 80182E88 0017FE88  38 7B 02 78 */	addi r3, r27, 0x278
/* 80182E8C 0017FE8C  38 00 00 01 */	li r0, 1
/* 80182E90 0017FE90  90 72 00 9C */	stw r3, 0x9c(r18)
/* 80182E94 0017FE94  90 12 00 A0 */	stw r0, 0xa0(r18)
.L_80182E98:
/* 80182E98 0017FE98  C0 02 CC 94 */	lfs f0, lbl_8041E014@sda21(r2)
/* 80182E9C 0017FE9C  FC 1E 00 40 */	fcmpo cr0, f30, f0
/* 80182EA0 0017FEA0  4C 40 13 82 */	cror 2, 0, 2
/* 80182EA4 0017FEA4  40 82 00 08 */	bne .L_80182EAC
/* 80182EA8 0017FEA8  48 00 00 08 */	b .L_80182EB0
.L_80182EAC:
/* 80182EAC 0017FEAC  C0 02 CC 80 */	lfs f0, lbl_8041E000@sda21(r2)
.L_80182EB0:
/* 80182EB0 0017FEB0  D0 13 01 10 */	stfs f0, 0x110(r19)
/* 80182EB4 0017FEB4  7E 63 9B 78 */	mr r3, r19
/* 80182EB8 0017FEB8  C0 33 01 10 */	lfs f1, 0x110(r19)
/* 80182EBC 0017FEBC  4B F1 1C 85 */	bl partyToMovedir
/* 80182EC0 0017FEC0  D0 33 00 FC */	stfs f1, 0xfc(r19)
/* 80182EC4 0017FEC4  C0 13 00 FC */	lfs f0, 0xfc(r19)
/* 80182EC8 0017FEC8  D0 13 01 00 */	stfs f0, 0x100(r19)
/* 80182ECC 0017FECC  48 00 00 14 */	b .L_80182EE0
.L_80182ED0:
/* 80182ED0 0017FED0  38 7B 02 88 */	addi r3, r27, 0x288
/* 80182ED4 0017FED4  38 00 00 00 */	li r0, 0
/* 80182ED8 0017FED8  90 72 00 9C */	stw r3, 0x9c(r18)
/* 80182EDC 0017FEDC  90 12 00 A0 */	stw r0, 0xa0(r18)
.L_80182EE0:
/* 80182EE0 0017FEE0  38 60 00 02 */	li r3, 2
.L_80182EE4:
/* 80182EE4 0017FEE4  E3 E1 00 C8 */	psq_l f31, 200(r1), 0, qr0
/* 80182EE8 0017FEE8  CB E1 00 C0 */	lfd f31, 0xc0(r1)
/* 80182EEC 0017FEEC  E3 C1 00 B8 */	psq_l f30, 184(r1), 0, qr0
/* 80182EF0 0017FEF0  CB C1 00 B0 */	lfd f30, 0xb0(r1)
/* 80182EF4 0017FEF4  E3 A1 00 A8 */	psq_l f29, 168(r1), 0, qr0
/* 80182EF8 0017FEF8  CB A1 00 A0 */	lfd f29, 0xa0(r1)
/* 80182EFC 0017FEFC  BA 41 00 68 */	lmw r18, 0x68(r1)
/* 80182F00 0017FF00  80 01 00 D4 */	lwz r0, 0xd4(r1)
/* 80182F04 0017FF04  7C 08 03 A6 */	mtlr r0
/* 80182F08 0017FF08  38 21 00 D0 */	addi r1, r1, 0xd0
/* 80182F0C 0017FF0C  4E 80 00 20 */	blr 

.global search_result
search_result:
/* 80182F10 0017FF10  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80182F14 0017FF14  7C 08 02 A6 */	mflr r0
/* 80182F18 0017FF18  90 01 00 14 */	stw r0, 0x14(r1)
/* 80182F1C 0017FF1C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80182F20 0017FF20  7C 9F 23 78 */	mr r31, r4
/* 80182F24 0017FF24  93 C1 00 08 */	stw r30, 8(r1)
/* 80182F28 0017FF28  7C 7E 1B 78 */	mr r30, r3
/* 80182F2C 0017FF2C  4B FB 8B 2D */	bl marioGetPartyId
/* 80182F30 0017FF30  4B F3 9F 01 */	bl partyGetPtr
/* 80182F34 0017FF34  2C 1F 00 00 */	cmpwi r31, 0
/* 80182F38 0017FF38  7C 7F 1B 78 */	mr r31, r3
/* 80182F3C 0017FF3C  41 82 00 90 */	beq .L_80182FCC
/* 80182F40 0017FF40  80 1E 00 9C */	lwz r0, 0x9c(r30)
/* 80182F44 0017FF44  28 00 00 00 */	cmplwi r0, 0
/* 80182F48 0017FF48  41 82 00 10 */	beq .L_80182F58
/* 80182F4C 0017FF4C  80 1E 00 A0 */	lwz r0, 0xa0(r30)
/* 80182F50 0017FF50  2C 00 00 00 */	cmpwi r0, 0
/* 80182F54 0017FF54  40 82 00 0C */	bne .L_80182F60
.L_80182F58:
/* 80182F58 0017FF58  38 60 00 02 */	li r3, 2
/* 80182F5C 0017FF5C  48 00 00 CC */	b .L_80183028
.L_80182F60:
/* 80182F60 0017FF60  2C 00 00 01 */	cmpwi r0, 1
/* 80182F64 0017FF64  40 82 00 44 */	bne .L_80182FA8
/* 80182F68 0017FF68  28 1F 00 00 */	cmplwi r31, 0
/* 80182F6C 0017FF6C  41 82 00 34 */	beq .L_80182FA0
/* 80182F70 0017FF70  38 60 05 DC */	li r3, 0x5dc
/* 80182F74 0017FF74  4B E8 2B 85 */	bl sysMsec2Frame
/* 80182F78 0017FF78  C0 22 CC 80 */	lfs f1, lbl_8041E000@sda21(r2)
/* 80182F7C 0017FF7C  7C 66 1B 78 */	mr r6, r3
/* 80182F80 0017FF80  C0 42 CC 98 */	lfs f2, lbl_8041E018@sda21(r2)
/* 80182F84 0017FF84  38 60 00 06 */	li r3, 6
/* 80182F88 0017FF88  FC 60 08 90 */	fmr f3, f1
/* 80182F8C 0017FF8C  38 80 00 00 */	li r4, 0
/* 80182F90 0017FF90  FC 80 08 90 */	fmr f4, f1
/* 80182F94 0017FF94  38 A0 FF FE */	li r5, -2
/* 80182F98 0017FF98  FC A0 08 90 */	fmr f5, f1
/* 80182F9C 0017FF9C  4B FA AC D5 */	bl effFukidashiEntry
.L_80182FA0:
/* 80182FA0 0017FFA0  38 60 00 02 */	li r3, 2
/* 80182FA4 0017FFA4  48 00 00 84 */	b .L_80183028
.L_80182FA8:
/* 80182FA8 0017FFA8  38 9F 00 58 */	addi r4, r31, 0x58
/* 80182FAC 0017FFAC  38 60 09 45 */	li r3, 0x945
/* 80182FB0 0017FFB0  4B F5 24 9D */	bl psndSFXOn_3D
/* 80182FB4 0017FFB4  38 00 00 2A */	li r0, 0x2a
/* 80182FB8 0017FFB8  3C 60 80 30 */	lis r3, lbl_802F83F0@ha
/* 80182FBC 0017FFBC  90 1E 00 84 */	stw r0, 0x84(r30)
/* 80182FC0 0017FFC0  38 83 83 F0 */	addi r4, r3, lbl_802F83F0@l
/* 80182FC4 0017FFC4  7F E3 FB 78 */	mr r3, r31
/* 80182FC8 0017FFC8  4B F3 9A A1 */	bl partyChgPose
.L_80182FCC:
/* 80182FCC 0017FFCC  7F E3 FB 78 */	mr r3, r31
/* 80182FD0 0017FFD0  4B F3 E8 15 */	bl partyChkGnd
/* 80182FD4 0017FFD4  80 7E 00 84 */	lwz r3, 0x84(r30)
/* 80182FD8 0017FFD8  34 03 FF FF */	addic. r0, r3, -1
/* 80182FDC 0017FFDC  90 1E 00 84 */	stw r0, 0x84(r30)
/* 80182FE0 0017FFE0  40 81 00 0C */	ble .L_80182FEC
/* 80182FE4 0017FFE4  38 60 00 00 */	li r3, 0
/* 80182FE8 0017FFE8  48 00 00 40 */	b .L_80183028
.L_80182FEC:
/* 80182FEC 0017FFEC  28 1F 00 00 */	cmplwi r31, 0
/* 80182FF0 0017FFF0  41 82 00 34 */	beq .L_80183024
/* 80182FF4 0017FFF4  38 60 05 DC */	li r3, 0x5dc
/* 80182FF8 0017FFF8  4B E8 2B 01 */	bl sysMsec2Frame
/* 80182FFC 0017FFFC  C0 22 CC 80 */	lfs f1, lbl_8041E000@sda21(r2)
/* 80183000 00180000  7C 66 1B 78 */	mr r6, r3
/* 80183004 00180004  C0 42 CC 98 */	lfs f2, lbl_8041E018@sda21(r2)
/* 80183008 00180008  38 60 00 06 */	li r3, 6
/* 8018300C 0018000C  FC 60 08 90 */	fmr f3, f1
/* 80183010 00180010  38 80 00 00 */	li r4, 0
/* 80183014 00180014  FC 80 08 90 */	fmr f4, f1
/* 80183018 00180018  38 A0 FF FE */	li r5, -2
/* 8018301C 0018001C  FC A0 08 90 */	fmr f5, f1
/* 80183020 00180020  4B FA AC 51 */	bl effFukidashiEntry
.L_80183024:
/* 80183024 00180024  38 60 00 02 */	li r3, 2
.L_80183028:
/* 80183028 00180028  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8018302C 0018002C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80183030 00180030  83 C1 00 08 */	lwz r30, 8(r1)
/* 80183034 00180034  7C 08 03 A6 */	mtlr r0
/* 80183038 00180038  38 21 00 10 */	addi r1, r1, 0x10
/* 8018303C 0018003C  4E 80 00 20 */	blr 
