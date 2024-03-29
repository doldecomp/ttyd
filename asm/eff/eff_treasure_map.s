.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effTreasureMapDisp
effTreasureMapDisp:
/* 8022173C 0021E73C  94 21 FF 00 */	stwu r1, -0x100(r1)
/* 80221740 0021E740  7C 08 02 A6 */	mflr r0
/* 80221744 0021E744  90 01 01 04 */	stw r0, 0x104(r1)
/* 80221748 0021E748  DB E1 00 F0 */	stfd f31, 0xf0(r1)
/* 8022174C 0021E74C  F3 E1 00 F8 */	psq_st f31, 248(r1), 0, qr0
/* 80221750 0021E750  DB C1 00 E0 */	stfd f30, 0xe0(r1)
/* 80221754 0021E754  F3 C1 00 E8 */	psq_st f30, 232(r1), 0, qr0
/* 80221758 0021E758  93 E1 00 DC */	stw r31, 0xdc(r1)
/* 8022175C 0021E75C  93 C1 00 D8 */	stw r30, 0xd8(r1)
/* 80221760 0021E760  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 80221764 0021E764  4B DE D9 ED */	bl camGetPtr
/* 80221768 0021E768  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 8022176C 0021E76C  2C 00 FF FF */	cmpwi r0, -1
/* 80221770 0021E770  41 82 01 A0 */	beq .L_80221910
/* 80221774 0021E774  3B C0 00 00 */	li r30, 0
/* 80221778 0021E778  C3 E2 00 50 */	lfs f31, lbl_804213D0@sda21(r2)
.L_8022177C:
/* 8022177C 0021E77C  C0 1F 00 10 */	lfs f0, 0x10(r31)
/* 80221780 0021E780  2C 1E 00 00 */	cmpwi r30, 0
/* 80221784 0021E784  EF DF 00 32 */	fmuls f30, f31, f0
/* 80221788 0021E788  40 82 00 9C */	bne .L_80221824
/* 8022178C 0021E78C  C0 3F 00 04 */	lfs f1, 4(r31)
/* 80221790 0021E790  38 61 00 A8 */	addi r3, r1, 0xa8
/* 80221794 0021E794  C0 5F 00 08 */	lfs f2, 8(r31)
/* 80221798 0021E798  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 8022179C 0021E79C  48 07 6C 91 */	bl PSMTXTrans
/* 802217A0 0021E7A0  C0 02 00 54 */	lfs f0, lbl_804213D4@sda21(r2)
/* 802217A4 0021E7A4  38 61 00 78 */	addi r3, r1, 0x78
/* 802217A8 0021E7A8  EC 20 07 B2 */	fmuls f1, f0, f30
/* 802217AC 0021E7AC  FC 40 08 90 */	fmr f2, f1
/* 802217B0 0021E7B0  FC 60 08 90 */	fmr f3, f1
/* 802217B4 0021E7B4  48 07 6C F9 */	bl PSMTXScale
/* 802217B8 0021E7B8  C0 22 00 58 */	lfs f1, lbl_804213D8@sda21(r2)
/* 802217BC 0021E7BC  38 61 00 48 */	addi r3, r1, 0x48
/* 802217C0 0021E7C0  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 802217C4 0021E7C4  38 80 00 79 */	li r4, 0x79
/* 802217C8 0021E7C8  EC 21 00 32 */	fmuls f1, f1, f0
/* 802217CC 0021E7CC  48 07 6A 21 */	bl PSMTXRotRad
/* 802217D0 0021E7D0  38 61 00 A8 */	addi r3, r1, 0xa8
/* 802217D4 0021E7D4  38 81 00 78 */	addi r4, r1, 0x78
/* 802217D8 0021E7D8  38 A1 00 18 */	addi r5, r1, 0x18
/* 802217DC 0021E7DC  48 07 67 85 */	bl PSMTXConcat
/* 802217E0 0021E7E0  38 61 00 18 */	addi r3, r1, 0x18
/* 802217E4 0021E7E4  38 81 00 48 */	addi r4, r1, 0x48
/* 802217E8 0021E7E8  7C 65 1B 78 */	mr r5, r3
/* 802217EC 0021E7EC  48 07 67 75 */	bl PSMTXConcat
/* 802217F0 0021E7F0  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802217F4 0021E7F4  38 80 00 40 */	li r4, 0x40
/* 802217F8 0021E7F8  4B E1 E8 9D */	bl animPoseSetMaterialFlagOn
/* 802217FC 0021E7FC  80 62 00 48 */	lwz r3, lbl_804213C8@sda21(r2)
/* 80221800 0021E800  38 81 00 14 */	addi r4, r1, 0x14
/* 80221804 0021E804  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 80221808 0021E808  90 61 00 10 */	stw r3, 0x10(r1)
/* 8022180C 0021E80C  98 01 00 13 */	stb r0, 0x13(r1)
/* 80221810 0021E810  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80221814 0021E814  90 01 00 14 */	stw r0, 0x14(r1)
/* 80221818 0021E818  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 8022181C 0021E81C  4B E1 E7 FD */	bl animPoseSetMaterialEvtColor
/* 80221820 0021E820  48 00 00 94 */	b .L_802218B4
.L_80221824:
/* 80221824 0021E824  C0 3F 00 04 */	lfs f1, 4(r31)
/* 80221828 0021E828  38 61 00 A8 */	addi r3, r1, 0xa8
/* 8022182C 0021E82C  C0 5F 00 08 */	lfs f2, 8(r31)
/* 80221830 0021E830  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 80221834 0021E834  48 07 6B F9 */	bl PSMTXTrans
/* 80221838 0021E838  FC 20 F0 90 */	fmr f1, f30
/* 8022183C 0021E83C  38 61 00 78 */	addi r3, r1, 0x78
/* 80221840 0021E840  FC 40 F0 90 */	fmr f2, f30
/* 80221844 0021E844  FC 60 F0 90 */	fmr f3, f30
/* 80221848 0021E848  48 07 6C 65 */	bl PSMTXScale
/* 8022184C 0021E84C  C0 22 00 58 */	lfs f1, lbl_804213D8@sda21(r2)
/* 80221850 0021E850  38 61 00 48 */	addi r3, r1, 0x48
/* 80221854 0021E854  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 80221858 0021E858  38 80 00 79 */	li r4, 0x79
/* 8022185C 0021E85C  EC 21 00 32 */	fmuls f1, f1, f0
/* 80221860 0021E860  48 07 69 8D */	bl PSMTXRotRad
/* 80221864 0021E864  38 61 00 A8 */	addi r3, r1, 0xa8
/* 80221868 0021E868  38 81 00 78 */	addi r4, r1, 0x78
/* 8022186C 0021E86C  38 A1 00 18 */	addi r5, r1, 0x18
/* 80221870 0021E870  48 07 66 F1 */	bl PSMTXConcat
/* 80221874 0021E874  38 61 00 18 */	addi r3, r1, 0x18
/* 80221878 0021E878  38 81 00 48 */	addi r4, r1, 0x48
/* 8022187C 0021E87C  7C 65 1B 78 */	mr r5, r3
/* 80221880 0021E880  48 07 66 E1 */	bl PSMTXConcat
/* 80221884 0021E884  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 80221888 0021E888  38 80 00 40 */	li r4, 0x40
/* 8022188C 0021E88C  4B E1 E8 09 */	bl animPoseSetMaterialFlagOn
/* 80221890 0021E890  80 62 00 4C */	lwz r3, lbl_804213CC@sda21(r2)
/* 80221894 0021E894  38 81 00 0C */	addi r4, r1, 0xc
/* 80221898 0021E898  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 8022189C 0021E89C  90 61 00 08 */	stw r3, 8(r1)
/* 802218A0 0021E8A0  98 01 00 0B */	stb r0, 0xb(r1)
/* 802218A4 0021E8A4  80 01 00 08 */	lwz r0, 8(r1)
/* 802218A8 0021E8A8  90 01 00 0C */	stw r0, 0xc(r1)
/* 802218AC 0021E8AC  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802218B0 0021E8B0  4B E1 E7 69 */	bl animPoseSetMaterialEvtColor
.L_802218B4:
/* 802218B4 0021E8B4  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802218B8 0021E8B8  4B E1 CD D9 */	bl animPoseMain
/* 802218BC 0021E8BC  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802218C0 0021E8C0  38 81 00 18 */	addi r4, r1, 0x18
/* 802218C4 0021E8C4  C0 22 00 5C */	lfs f1, lbl_804213DC@sda21(r2)
/* 802218C8 0021E8C8  38 A0 00 01 */	li r5, 1
/* 802218CC 0021E8CC  C0 42 00 60 */	lfs f2, lbl_804213E0@sda21(r2)
/* 802218D0 0021E8D0  4B E1 95 6D */	bl animPoseDrawMtx
/* 802218D4 0021E8D4  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802218D8 0021E8D8  38 81 00 18 */	addi r4, r1, 0x18
/* 802218DC 0021E8DC  C0 22 00 5C */	lfs f1, lbl_804213DC@sda21(r2)
/* 802218E0 0021E8E0  38 A0 00 02 */	li r5, 2
/* 802218E4 0021E8E4  C0 42 00 60 */	lfs f2, lbl_804213E0@sda21(r2)
/* 802218E8 0021E8E8  4B E1 95 55 */	bl animPoseDrawMtx
/* 802218EC 0021E8EC  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802218F0 0021E8F0  38 81 00 18 */	addi r4, r1, 0x18
/* 802218F4 0021E8F4  C0 22 00 5C */	lfs f1, lbl_804213DC@sda21(r2)
/* 802218F8 0021E8F8  38 A0 00 03 */	li r5, 3
/* 802218FC 0021E8FC  C0 42 00 60 */	lfs f2, lbl_804213E0@sda21(r2)
/* 80221900 0021E900  4B E1 95 3D */	bl animPoseDrawMtx
/* 80221904 0021E904  3B DE 00 01 */	addi r30, r30, 1
/* 80221908 0021E908  2C 1E 00 02 */	cmpwi r30, 2
/* 8022190C 0021E90C  41 80 FE 70 */	blt .L_8022177C
.L_80221910:
/* 80221910 0021E910  E3 E1 00 F8 */	psq_l f31, 248(r1), 0, qr0
/* 80221914 0021E914  CB E1 00 F0 */	lfd f31, 0xf0(r1)
/* 80221918 0021E918  E3 C1 00 E8 */	psq_l f30, 232(r1), 0, qr0
/* 8022191C 0021E91C  CB C1 00 E0 */	lfd f30, 0xe0(r1)
/* 80221920 0021E920  83 E1 00 DC */	lwz r31, 0xdc(r1)
/* 80221924 0021E924  80 01 01 04 */	lwz r0, 0x104(r1)
/* 80221928 0021E928  83 C1 00 D8 */	lwz r30, 0xd8(r1)
/* 8022192C 0021E92C  7C 08 03 A6 */	mtlr r0
/* 80221930 0021E930  38 21 01 00 */	addi r1, r1, 0x100
/* 80221934 0021E934  4E 80 00 20 */	blr 
effTreasureMapMain:
/* 80221938 0021E938  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8022193C 0021E93C  7C 08 02 A6 */	mflr r0
/* 80221940 0021E940  3C 80 80 30 */	lis r4, lbl_802FE750@ha
/* 80221944 0021E944  90 01 00 34 */	stw r0, 0x34(r1)
/* 80221948 0021E948  38 A4 E7 50 */	addi r5, r4, lbl_802FE750@l
/* 8022194C 0021E94C  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80221950 0021E950  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80221954 0021E954  7C 7E 1B 78 */	mr r30, r3
/* 80221958 0021E958  93 A1 00 24 */	stw r29, 0x24(r1)
/* 8022195C 0021E95C  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 80221960 0021E960  80 85 00 00 */	lwz r4, 0(r5)
/* 80221964 0021E964  80 65 00 04 */	lwz r3, 4(r5)
/* 80221968 0021E968  80 05 00 08 */	lwz r0, 8(r5)
/* 8022196C 0021E96C  90 61 00 0C */	stw r3, 0xc(r1)
/* 80221970 0021E970  C0 3F 00 08 */	lfs f1, 8(r31)
/* 80221974 0021E974  90 81 00 08 */	stw r4, 8(r1)
/* 80221978 0021E978  C0 1F 00 04 */	lfs f0, 4(r31)
/* 8022197C 0021E97C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 80221980 0021E980  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 80221984 0021E984  D0 01 00 08 */	stfs f0, 8(r1)
/* 80221988 0021E988  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 8022198C 0021E98C  90 01 00 10 */	stw r0, 0x10(r1)
/* 80221990 0021E990  80 A1 00 08 */	lwz r5, 8(r1)
/* 80221994 0021E994  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80221998 0021E998  80 81 00 0C */	lwz r4, 0xc(r1)
/* 8022199C 0021E99C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 802219A0 0021E9A0  90 A1 00 14 */	stw r5, 0x14(r1)
/* 802219A4 0021E9A4  90 81 00 18 */	stw r4, 0x18(r1)
/* 802219A8 0021E9A8  90 01 00 1C */	stw r0, 0x1c(r1)
/* 802219AC 0021E9AC  80 83 00 14 */	lwz r4, 0x14(r3)
/* 802219B0 0021E9B0  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 802219B4 0021E9B4  7C 64 00 D0 */	neg r3, r4
/* 802219B8 0021E9B8  7C 63 23 78 */	or r3, r3, r4
/* 802219BC 0021E9BC  2C 00 FF FF */	cmpwi r0, -1
/* 802219C0 0021E9C0  54 7D 0F FE */	srwi r29, r3, 0x1f
/* 802219C4 0021E9C4  40 82 00 44 */	bne .L_80221A08
/* 802219C8 0021E9C8  3C 60 80 30 */	lis r3, lbl_802FE75C@ha
/* 802219CC 0021E9CC  7F A4 EB 78 */	mr r4, r29
/* 802219D0 0021E9D0  38 63 E7 5C */	addi r3, r3, lbl_802FE75C@l
/* 802219D4 0021E9D4  38 A0 00 00 */	li r5, 0
/* 802219D8 0021E9D8  4B E1 7C 99 */	bl animGroupBaseAsync
/* 802219DC 0021E9DC  2C 03 00 00 */	cmpwi r3, 0
/* 802219E0 0021E9E0  41 82 00 C0 */	beq .L_80221AA0
/* 802219E4 0021E9E4  3C 60 80 30 */	lis r3, lbl_802FE75C@ha
/* 802219E8 0021E9E8  7F A4 EB 78 */	mr r4, r29
/* 802219EC 0021E9EC  38 63 E7 5C */	addi r3, r3, lbl_802FE75C@l
/* 802219F0 0021E9F0  4B E1 F6 E1 */	bl animPoseEntry
/* 802219F4 0021E9F4  90 7F 00 24 */	stw r3, 0x24(r31)
/* 802219F8 0021E9F8  38 82 00 64 */	addi r4, r2, lbl_804213E4@sda21
/* 802219FC 0021E9FC  38 A0 00 01 */	li r5, 1
/* 80221A00 0021EA00  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 80221A04 0021EA04  4B E1 F0 D1 */	bl animPoseSetAnim
.L_80221A08:
/* 80221A08 0021EA08  80 7E 00 00 */	lwz r3, 0(r30)
/* 80221A0C 0021EA0C  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 80221A10 0021EA10  41 82 00 14 */	beq .L_80221A24
/* 80221A14 0021EA14  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 80221A18 0021EA18  38 00 00 10 */	li r0, 0x10
/* 80221A1C 0021EA1C  90 7E 00 00 */	stw r3, 0(r30)
/* 80221A20 0021EA20  90 1F 00 18 */	stw r0, 0x18(r31)
.L_80221A24:
/* 80221A24 0021EA24  80 7F 00 18 */	lwz r3, 0x18(r31)
/* 80221A28 0021EA28  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 80221A2C 0021EA2C  40 80 00 0C */	bge .L_80221A38
/* 80221A30 0021EA30  38 03 FF FF */	addi r0, r3, -1
/* 80221A34 0021EA34  90 1F 00 18 */	stw r0, 0x18(r31)
.L_80221A38:
/* 80221A38 0021EA38  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 80221A3C 0021EA3C  2C 00 00 10 */	cmpwi r0, 0x10
/* 80221A40 0021EA40  40 80 00 0C */	bge .L_80221A4C
/* 80221A44 0021EA44  54 00 20 36 */	slwi r0, r0, 4
/* 80221A48 0021EA48  90 1F 00 14 */	stw r0, 0x14(r31)
.L_80221A4C:
/* 80221A4C 0021EA4C  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 80221A50 0021EA50  2C 00 00 00 */	cmpwi r0, 0
/* 80221A54 0021EA54  40 80 00 20 */	bge .L_80221A74
/* 80221A58 0021EA58  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 80221A5C 0021EA5C  2C 03 FF FF */	cmpwi r3, -1
/* 80221A60 0021EA60  41 82 00 08 */	beq .L_80221A68
/* 80221A64 0021EA64  4B E1 91 D1 */	bl animPoseRelease
.L_80221A68:
/* 80221A68 0021EA68  7F C3 F3 78 */	mr r3, r30
/* 80221A6C 0021EA6C  4B E3 C1 19 */	bl effDelete
/* 80221A70 0021EA70  48 00 00 30 */	b .L_80221AA0
.L_80221A74:
/* 80221A74 0021EA74  80 9F 00 1C */	lwz r4, 0x1c(r31)
/* 80221A78 0021EA78  38 61 00 14 */	addi r3, r1, 0x14
/* 80221A7C 0021EA7C  38 04 00 01 */	addi r0, r4, 1
/* 80221A80 0021EA80  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 80221A84 0021EA84  4B DE EC 3D */	bl dispCalcZ
/* 80221A88 0021EA88  3C 80 80 22 */	lis r4, effTreasureMapDisp@ha
/* 80221A8C 0021EA8C  80 7F 00 28 */	lwz r3, 0x28(r31)
/* 80221A90 0021EA90  38 A4 17 3C */	addi r5, r4, effTreasureMapDisp@l
/* 80221A94 0021EA94  7F C6 F3 78 */	mr r6, r30
/* 80221A98 0021EA98  38 80 00 02 */	li r4, 2
/* 80221A9C 0021EA9C  4B DE EF 7D */	bl dispEntry
.L_80221AA0:
/* 80221AA0 0021EAA0  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80221AA4 0021EAA4  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80221AA8 0021EAA8  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80221AAC 0021EAAC  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80221AB0 0021EAB0  7C 08 03 A6 */	mtlr r0
/* 80221AB4 0021EAB4  38 21 00 30 */	addi r1, r1, 0x30
/* 80221AB8 0021EAB8  4E 80 00 20 */	blr 

.global effTreasureMapEntry
effTreasureMapEntry:
/* 80221ABC 0021EABC  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 80221AC0 0021EAC0  7C 08 02 A6 */	mflr r0
/* 80221AC4 0021EAC4  90 01 00 44 */	stw r0, 0x44(r1)
/* 80221AC8 0021EAC8  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 80221ACC 0021EACC  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 80221AD0 0021EAD0  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 80221AD4 0021EAD4  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 80221AD8 0021EAD8  DB A1 00 10 */	stfd f29, 0x10(r1)
/* 80221ADC 0021EADC  F3 A1 00 18 */	psq_st f29, 24(r1), 0, qr0
/* 80221AE0 0021EAE0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80221AE4 0021EAE4  93 C1 00 08 */	stw r30, 8(r1)
/* 80221AE8 0021EAE8  FF A0 08 90 */	fmr f29, f1
/* 80221AEC 0021EAEC  7C 7E 1B 78 */	mr r30, r3
/* 80221AF0 0021EAF0  FF C0 10 90 */	fmr f30, f2
/* 80221AF4 0021EAF4  FF E0 18 90 */	fmr f31, f3
/* 80221AF8 0021EAF8  4B E3 C2 C5 */	bl effEntry
/* 80221AFC 0021EAFC  3C 80 80 30 */	lis r4, lbl_802FE770@ha
/* 80221B00 0021EB00  7C 7F 1B 78 */	mr r31, r3
/* 80221B04 0021EB04  38 84 E7 70 */	addi r4, r4, lbl_802FE770@l
/* 80221B08 0021EB08  38 00 00 01 */	li r0, 1
/* 80221B0C 0021EB0C  90 9F 00 14 */	stw r4, 0x14(r31)
/* 80221B10 0021EB10  38 60 00 03 */	li r3, 3
/* 80221B14 0021EB14  38 80 00 2C */	li r4, 0x2c
/* 80221B18 0021EB18  90 1F 00 08 */	stw r0, 8(r31)
/* 80221B1C 0021EB1C  4B E0 DF 71 */	bl __memAlloc
/* 80221B20 0021EB20  3C 80 80 22 */	lis r4, effTreasureMapMain@ha
/* 80221B24 0021EB24  90 7F 00 0C */	stw r3, 0xc(r31)
/* 80221B28 0021EB28  38 04 19 38 */	addi r0, r4, effTreasureMapMain@l
/* 80221B2C 0021EB2C  38 C0 03 E8 */	li r6, 0x3e8
/* 80221B30 0021EB30  90 1F 00 10 */	stw r0, 0x10(r31)
/* 80221B34 0021EB34  38 A0 00 FF */	li r5, 0xff
/* 80221B38 0021EB38  C0 22 00 68 */	lfs f1, lbl_804213E8@sda21(r2)
/* 80221B3C 0021EB3C  38 80 FF FF */	li r4, -1
/* 80221B40 0021EB40  80 FF 00 00 */	lwz r7, 0(r31)
/* 80221B44 0021EB44  38 00 00 04 */	li r0, 4
/* 80221B48 0021EB48  C0 02 00 5C */	lfs f0, lbl_804213DC@sda21(r2)
/* 80221B4C 0021EB4C  60 E7 00 02 */	ori r7, r7, 2
/* 80221B50 0021EB50  90 FF 00 00 */	stw r7, 0(r31)
/* 80221B54 0021EB54  93 C3 00 00 */	stw r30, 0(r3)
/* 80221B58 0021EB58  D3 A3 00 04 */	stfs f29, 4(r3)
/* 80221B5C 0021EB5C  D3 C3 00 08 */	stfs f30, 8(r3)
/* 80221B60 0021EB60  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 80221B64 0021EB64  90 C3 00 18 */	stw r6, 0x18(r3)
/* 80221B68 0021EB68  90 A3 00 14 */	stw r5, 0x14(r3)
/* 80221B6C 0021EB6C  D0 23 00 10 */	stfs f1, 0x10(r3)
/* 80221B70 0021EB70  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 80221B74 0021EB74  90 83 00 24 */	stw r4, 0x24(r3)
/* 80221B78 0021EB78  90 03 00 28 */	stw r0, 0x28(r3)
/* 80221B7C 0021EB7C  7F E3 FB 78 */	mr r3, r31
/* 80221B80 0021EB80  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 80221B84 0021EB84  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 80221B88 0021EB88  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 80221B8C 0021EB8C  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 80221B90 0021EB90  E3 A1 00 18 */	psq_l f29, 24(r1), 0, qr0
/* 80221B94 0021EB94  CB A1 00 10 */	lfd f29, 0x10(r1)
/* 80221B98 0021EB98  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80221B9C 0021EB9C  80 01 00 44 */	lwz r0, 0x44(r1)
/* 80221BA0 0021EBA0  83 C1 00 08 */	lwz r30, 8(r1)
/* 80221BA4 0021EBA4  7C 08 03 A6 */	mtlr r0
/* 80221BA8 0021EBA8  38 21 00 40 */	addi r1, r1, 0x40
/* 80221BAC 0021EBAC  4E 80 00 20 */	blr 
