.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effCoinDisp
effCoinDisp:
/* 801B05DC 001AD5DC  94 21 FE E0 */	stwu r1, -0x120(r1)
/* 801B05E0 001AD5E0  7C 08 02 A6 */	mflr r0
/* 801B05E4 001AD5E4  90 01 01 24 */	stw r0, 0x124(r1)
/* 801B05E8 001AD5E8  DB E1 01 10 */	stfd f31, 0x110(r1)
/* 801B05EC 001AD5EC  F3 E1 01 18 */	psq_st f31, 280(r1), 0, qr0
/* 801B05F0 001AD5F0  93 E1 01 0C */	stw r31, 0x10c(r1)
/* 801B05F4 001AD5F4  93 C1 01 08 */	stw r30, 0x108(r1)
/* 801B05F8 001AD5F8  93 A1 01 04 */	stw r29, 0x104(r1)
/* 801B05FC 001AD5FC  93 81 01 00 */	stw r28, 0x100(r1)
/* 801B0600 001AD600  7C 9C 23 78 */	mr r28, r4
/* 801B0604 001AD604  4B E5 EB 4D */	bl camGetPtr
/* 801B0608 001AD608  83 DC 00 0C */	lwz r30, 0xc(r28)
/* 801B060C 001AD60C  7C 7F 1B 78 */	mr r31, r3
/* 801B0610 001AD610  38 61 00 BC */	addi r3, r1, 0xbc
/* 801B0614 001AD614  C0 3E 00 08 */	lfs f1, 8(r30)
/* 801B0618 001AD618  C0 5E 00 0C */	lfs f2, 0xc(r30)
/* 801B061C 001AD61C  C0 7E 00 10 */	lfs f3, 0x10(r30)
/* 801B0620 001AD620  48 0E 7E 0D */	bl PSMTXTrans
/* 801B0624 001AD624  38 60 00 04 */	li r3, 4
/* 801B0628 001AD628  4B E5 EB 29 */	bl camGetPtr
/* 801B062C 001AD62C  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 801B0630 001AD630  38 61 00 5C */	addi r3, r1, 0x5c
/* 801B0634 001AD634  C0 02 D8 54 */	lfs f0, lbl_8041EBD4-_SDA2_BASE_(r2)
/* 801B0638 001AD638  38 80 00 79 */	li r4, 0x79
/* 801B063C 001AD63C  FC 20 08 50 */	fneg f1, f1
/* 801B0640 001AD640  EC 20 00 72 */	fmuls f1, f0, f1
/* 801B0644 001AD644  48 0E 7B A9 */	bl PSMTXRotRad
/* 801B0648 001AD648  38 61 00 BC */	addi r3, r1, 0xbc
/* 801B064C 001AD64C  38 81 00 5C */	addi r4, r1, 0x5c
/* 801B0650 001AD650  38 A1 00 2C */	addi r5, r1, 0x2c
/* 801B0654 001AD654  48 0E 79 0D */	bl PSMTXConcat
/* 801B0658 001AD658  38 60 00 00 */	li r3, 0
/* 801B065C 001AD65C  48 10 0A DD */	bl GXSetNumChans
/* 801B0660 001AD660  38 60 00 01 */	li r3, 1
/* 801B0664 001AD664  48 10 2B 65 */	bl GXSetNumTevStages
/* 801B0668 001AD668  38 60 00 00 */	li r3, 0
/* 801B066C 001AD66C  38 80 00 00 */	li r4, 0
/* 801B0670 001AD670  38 A0 00 00 */	li r5, 0
/* 801B0674 001AD674  38 C0 00 FF */	li r6, 0xff
/* 801B0678 001AD678  48 10 29 B5 */	bl GXSetTevOrder
/* 801B067C 001AD67C  38 60 00 00 */	li r3, 0
/* 801B0680 001AD680  38 80 00 00 */	li r4, 0
/* 801B0684 001AD684  38 A0 00 00 */	li r5, 0
/* 801B0688 001AD688  38 C0 00 00 */	li r6, 0
/* 801B068C 001AD68C  38 E0 00 01 */	li r7, 1
/* 801B0690 001AD690  39 00 00 00 */	li r8, 0
/* 801B0694 001AD694  48 10 25 51 */	bl GXSetTevColorOp
/* 801B0698 001AD698  38 60 00 00 */	li r3, 0
/* 801B069C 001AD69C  38 80 00 00 */	li r4, 0
/* 801B06A0 001AD6A0  38 A0 00 00 */	li r5, 0
/* 801B06A4 001AD6A4  38 C0 00 00 */	li r6, 0
/* 801B06A8 001AD6A8  38 E0 00 01 */	li r7, 1
/* 801B06AC 001AD6AC  39 00 00 00 */	li r8, 0
/* 801B06B0 001AD6B0  48 10 25 9D */	bl GXSetTevAlphaOp
/* 801B06B4 001AD6B4  38 60 00 00 */	li r3, 0
/* 801B06B8 001AD6B8  38 80 00 08 */	li r4, 8
/* 801B06BC 001AD6BC  38 A0 00 0F */	li r5, 0xf
/* 801B06C0 001AD6C0  38 C0 00 02 */	li r6, 2
/* 801B06C4 001AD6C4  38 E0 00 02 */	li r7, 2
/* 801B06C8 001AD6C8  48 10 24 95 */	bl GXSetTevColorIn
/* 801B06CC 001AD6CC  38 60 00 00 */	li r3, 0
/* 801B06D0 001AD6D0  38 80 00 07 */	li r4, 7
/* 801B06D4 001AD6D4  38 A0 00 01 */	li r5, 1
/* 801B06D8 001AD6D8  38 C0 00 04 */	li r6, 4
/* 801B06DC 001AD6DC  38 E0 00 07 */	li r7, 7
/* 801B06E0 001AD6E0  48 10 24 C1 */	bl GXSetTevAlphaIn
/* 801B06E4 001AD6E4  38 60 00 01 */	li r3, 1
/* 801B06E8 001AD6E8  48 0F EB 99 */	bl GXSetNumTexGens
/* 801B06EC 001AD6EC  38 60 00 00 */	li r3, 0
/* 801B06F0 001AD6F0  38 80 00 01 */	li r4, 1
/* 801B06F4 001AD6F4  38 A0 00 04 */	li r5, 4
/* 801B06F8 001AD6F8  38 C0 00 1E */	li r6, 0x1e
/* 801B06FC 001AD6FC  38 E0 00 00 */	li r7, 0
/* 801B0700 001AD700  39 00 00 7D */	li r8, 0x7d
/* 801B0704 001AD704  48 0F E8 FD */	bl GXSetTexCoordGen2
/* 801B0708 001AD708  38 81 00 0C */	addi r4, r1, 0xc
/* 801B070C 001AD70C  38 60 00 84 */	li r3, 0x84
/* 801B0710 001AD710  48 02 11 35 */	bl effGetTexObjN64
/* 801B0714 001AD714  38 61 00 0C */	addi r3, r1, 0xc
/* 801B0718 001AD718  38 80 00 00 */	li r4, 0
/* 801B071C 001AD71C  48 10 13 61 */	bl GXLoadTexObj
/* 801B0720 001AD720  38 60 00 00 */	li r3, 0
/* 801B0724 001AD724  48 0F F7 65 */	bl GXSetCullMode
/* 801B0728 001AD728  3C 60 80 3A */	lis r3, lbl_8039BF40@ha
/* 801B072C 001AD72C  38 63 BF 40 */	addi r3, r3, lbl_8039BF40@l
/* 801B0730 001AD730  48 02 0F 81 */	bl effSetVtxDescN64
/* 801B0734 001AD734  80 02 D8 50 */	lwz r0, lbl_8041EBD0-_SDA2_BASE_(r2)
/* 801B0738 001AD738  38 81 00 08 */	addi r4, r1, 8
/* 801B073C 001AD73C  38 60 00 01 */	li r3, 1
/* 801B0740 001AD740  90 01 00 08 */	stw r0, 8(r1)
/* 801B0744 001AD744  48 10 25 71 */	bl GXSetTevColor
/* 801B0748 001AD748  3B A0 00 01 */	li r29, 1
/* 801B074C 001AD74C  3B DE 00 24 */	addi r30, r30, 0x24
/* 801B0750 001AD750  48 00 01 3C */	b lbl_801B088C
lbl_801B0754:
/* 801B0754 001AD754  80 1E 00 20 */	lwz r0, 0x20(r30)
/* 801B0758 001AD758  2C 00 00 00 */	cmpwi r0, 0
/* 801B075C 001AD75C  40 82 01 28 */	bne lbl_801B0884
/* 801B0760 001AD760  C3 FE 00 1C */	lfs f31, 0x1c(r30)
/* 801B0764 001AD764  38 61 00 BC */	addi r3, r1, 0xbc
/* 801B0768 001AD768  C0 3E 00 08 */	lfs f1, 8(r30)
/* 801B076C 001AD76C  C0 5E 00 0C */	lfs f2, 0xc(r30)
/* 801B0770 001AD770  C0 7E 00 10 */	lfs f3, 0x10(r30)
/* 801B0774 001AD774  48 0E 7C B9 */	bl PSMTXTrans
/* 801B0778 001AD778  C0 62 D8 58 */	lfs f3, lbl_8041EBD8-_SDA2_BASE_(r2)
/* 801B077C 001AD77C  FC 03 F8 00 */	fcmpu cr0, f3, f31
/* 801B0780 001AD780  41 82 00 24 */	beq lbl_801B07A4
/* 801B0784 001AD784  FC 20 F8 90 */	fmr f1, f31
/* 801B0788 001AD788  38 61 00 8C */	addi r3, r1, 0x8c
/* 801B078C 001AD78C  FC 40 F8 90 */	fmr f2, f31
/* 801B0790 001AD790  48 0E 7D 1D */	bl PSMTXScale
/* 801B0794 001AD794  38 61 00 BC */	addi r3, r1, 0xbc
/* 801B0798 001AD798  38 81 00 8C */	addi r4, r1, 0x8c
/* 801B079C 001AD79C  7C 65 1B 78 */	mr r5, r3
/* 801B07A0 001AD7A0  48 0E 77 C1 */	bl PSMTXConcat
lbl_801B07A4:
/* 801B07A4 001AD7A4  38 81 00 BC */	addi r4, r1, 0xbc
/* 801B07A8 001AD7A8  38 61 00 2C */	addi r3, r1, 0x2c
/* 801B07AC 001AD7AC  7C 85 23 78 */	mr r5, r4
/* 801B07B0 001AD7B0  48 0E 77 B1 */	bl PSMTXConcat
/* 801B07B4 001AD7B4  38 81 00 BC */	addi r4, r1, 0xbc
/* 801B07B8 001AD7B8  38 7F 01 1C */	addi r3, r31, 0x11c
/* 801B07BC 001AD7BC  7C 85 23 78 */	mr r5, r4
/* 801B07C0 001AD7C0  48 0E 77 A1 */	bl PSMTXConcat
/* 801B07C4 001AD7C4  38 61 00 BC */	addi r3, r1, 0xbc
/* 801B07C8 001AD7C8  38 80 00 00 */	li r4, 0
/* 801B07CC 001AD7CC  48 10 3D 2D */	bl GXLoadPosMtxImm
/* 801B07D0 001AD7D0  38 60 00 00 */	li r3, 0
/* 801B07D4 001AD7D4  48 10 3D C5 */	bl GXSetCurrentMtx
/* 801B07D8 001AD7D8  C0 22 D8 5C */	lfs f1, lbl_8041EBDC-_SDA2_BASE_(r2)
/* 801B07DC 001AD7DC  38 61 00 8C */	addi r3, r1, 0x8c
/* 801B07E0 001AD7E0  C0 42 D8 60 */	lfs f2, lbl_8041EBE0-_SDA2_BASE_(r2)
/* 801B07E4 001AD7E4  C0 62 D8 64 */	lfs f3, lbl_8041EBE4-_SDA2_BASE_(r2)
/* 801B07E8 001AD7E8  48 0E 7C C5 */	bl PSMTXScale
/* 801B07EC 001AD7EC  80 9E 00 04 */	lwz r4, 4(r30)
/* 801B07F0 001AD7F0  3C 00 43 30 */	lis r0, 0x4330
/* 801B07F4 001AD7F4  3C 60 80 30 */	lis r3, lbl_802FA428@ha
/* 801B07F8 001AD7F8  C0 22 D8 64 */	lfs f1, lbl_8041EBE4-_SDA2_BASE_(r2)
/* 801B07FC 001AD7FC  7C 84 0E 70 */	srawi r4, r4, 1
/* 801B0800 001AD800  90 01 00 F0 */	stw r0, 0xf0(r1)
/* 801B0804 001AD804  20 04 00 04 */	subfic r0, r4, 4
/* 801B0808 001AD808  C8 43 A4 28 */	lfd f2, lbl_802FA428@l(r3)
/* 801B080C 001AD80C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801B0810 001AD810  C0 82 D8 68 */	lfs f4, lbl_8041EBE8-_SDA2_BASE_(r2)
/* 801B0814 001AD814  90 01 00 F4 */	stw r0, 0xf4(r1)
/* 801B0818 001AD818  FC 60 08 90 */	fmr f3, f1
/* 801B081C 001AD81C  38 61 00 BC */	addi r3, r1, 0xbc
/* 801B0820 001AD820  C8 01 00 F0 */	lfd f0, 0xf0(r1)
/* 801B0824 001AD824  EC 00 10 28 */	fsubs f0, f0, f2
/* 801B0828 001AD828  EC 44 00 32 */	fmuls f2, f4, f0
/* 801B082C 001AD82C  48 0E 7C 01 */	bl PSMTXTrans
/* 801B0830 001AD830  38 61 00 8C */	addi r3, r1, 0x8c
/* 801B0834 001AD834  38 81 00 BC */	addi r4, r1, 0xbc
/* 801B0838 001AD838  7C 65 1B 78 */	mr r5, r3
/* 801B083C 001AD83C  48 0E 77 25 */	bl PSMTXConcat
/* 801B0840 001AD840  38 61 00 8C */	addi r3, r1, 0x8c
/* 801B0844 001AD844  38 80 00 1E */	li r4, 0x1e
/* 801B0848 001AD848  38 A0 00 01 */	li r5, 1
/* 801B084C 001AD84C  48 10 3D 81 */	bl GXLoadTexMtxImm
/* 801B0850 001AD850  38 60 00 90 */	li r3, 0x90
/* 801B0854 001AD854  38 80 00 00 */	li r4, 0
/* 801B0858 001AD858  38 A0 00 06 */	li r5, 6
/* 801B085C 001AD85C  48 0F F4 0D */	bl GXBegin
/* 801B0860 001AD860  38 60 00 00 */	li r3, 0
/* 801B0864 001AD864  38 80 00 01 */	li r4, 1
/* 801B0868 001AD868  38 A0 00 02 */	li r5, 2
/* 801B086C 001AD86C  38 C0 00 00 */	li r6, 0
/* 801B0870 001AD870  38 E0 00 00 */	li r7, 0
/* 801B0874 001AD874  39 00 00 02 */	li r8, 2
/* 801B0878 001AD878  39 20 00 03 */	li r9, 3
/* 801B087C 001AD87C  39 40 00 00 */	li r10, 0
/* 801B0880 001AD880  48 02 0D B5 */	bl tri2
lbl_801B0884:
/* 801B0884 001AD884  3B BD 00 01 */	addi r29, r29, 1
/* 801B0888 001AD888  3B DE 00 24 */	addi r30, r30, 0x24
lbl_801B088C:
/* 801B088C 001AD88C  80 1C 00 08 */	lwz r0, 8(r28)
/* 801B0890 001AD890  7C 1D 00 00 */	cmpw r29, r0
/* 801B0894 001AD894  41 80 FE C0 */	blt lbl_801B0754
/* 801B0898 001AD898  E3 E1 01 18 */	psq_l f31, 280(r1), 0, qr0
/* 801B089C 001AD89C  80 01 01 24 */	lwz r0, 0x124(r1)
/* 801B08A0 001AD8A0  CB E1 01 10 */	lfd f31, 0x110(r1)
/* 801B08A4 001AD8A4  83 E1 01 0C */	lwz r31, 0x10c(r1)
/* 801B08A8 001AD8A8  83 C1 01 08 */	lwz r30, 0x108(r1)
/* 801B08AC 001AD8AC  83 A1 01 04 */	lwz r29, 0x104(r1)
/* 801B08B0 001AD8B0  83 81 01 00 */	lwz r28, 0x100(r1)
/* 801B08B4 001AD8B4  7C 08 03 A6 */	mtlr r0
/* 801B08B8 001AD8B8  38 21 01 20 */	addi r1, r1, 0x120
/* 801B08BC 001AD8BC  4E 80 00 20 */	blr 
effCoinMain:
/* 801B08C0 001AD8C0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801B08C4 001AD8C4  7C 08 02 A6 */	mflr r0
/* 801B08C8 001AD8C8  3C 80 80 30 */	lis r4, lbl_802FA418@ha
/* 801B08CC 001AD8CC  90 01 00 34 */	stw r0, 0x34(r1)
/* 801B08D0 001AD8D0  38 C4 A4 18 */	addi r6, r4, lbl_802FA418@l
/* 801B08D4 001AD8D4  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801B08D8 001AD8D8  7C 7F 1B 78 */	mr r31, r3
/* 801B08DC 001AD8DC  80 E3 00 0C */	lwz r7, 0xc(r3)
/* 801B08E0 001AD8E0  80 A6 00 00 */	lwz r5, 0(r6)
/* 801B08E4 001AD8E4  80 86 00 04 */	lwz r4, 4(r6)
/* 801B08E8 001AD8E8  80 06 00 08 */	lwz r0, 8(r6)
/* 801B08EC 001AD8EC  90 A1 00 08 */	stw r5, 8(r1)
/* 801B08F0 001AD8F0  C0 07 00 08 */	lfs f0, 8(r7)
/* 801B08F4 001AD8F4  90 81 00 0C */	stw r4, 0xc(r1)
/* 801B08F8 001AD8F8  C0 27 00 0C */	lfs f1, 0xc(r7)
/* 801B08FC 001AD8FC  D0 01 00 08 */	stfs f0, 8(r1)
/* 801B0900 001AD900  C0 07 00 10 */	lfs f0, 0x10(r7)
/* 801B0904 001AD904  90 01 00 10 */	stw r0, 0x10(r1)
/* 801B0908 001AD908  80 A1 00 08 */	lwz r5, 8(r1)
/* 801B090C 001AD90C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801B0910 001AD910  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801B0914 001AD914  80 81 00 0C */	lwz r4, 0xc(r1)
/* 801B0918 001AD918  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801B091C 001AD91C  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801B0920 001AD920  90 81 00 18 */	stw r4, 0x18(r1)
/* 801B0924 001AD924  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801B0928 001AD928  80 87 00 14 */	lwz r4, 0x14(r7)
/* 801B092C 001AD92C  38 04 FF FF */	addi r0, r4, -1
/* 801B0930 001AD930  90 07 00 14 */	stw r0, 0x14(r7)
/* 801B0934 001AD934  80 87 00 18 */	lwz r4, 0x18(r7)
/* 801B0938 001AD938  38 04 00 01 */	addi r0, r4, 1
/* 801B093C 001AD93C  90 07 00 18 */	stw r0, 0x18(r7)
/* 801B0940 001AD940  80 07 00 14 */	lwz r0, 0x14(r7)
/* 801B0944 001AD944  2C 00 00 00 */	cmpwi r0, 0
/* 801B0948 001AD948  40 80 00 0C */	bge lbl_801B0954
/* 801B094C 001AD94C  4B EA D2 39 */	bl effDelete
/* 801B0950 001AD950  48 00 00 84 */	b lbl_801B09D4
lbl_801B0954:
/* 801B0954 001AD954  38 A0 00 01 */	li r5, 1
/* 801B0958 001AD958  38 60 FF FF */	li r3, -1
/* 801B095C 001AD95C  38 E7 00 24 */	addi r7, r7, 0x24
/* 801B0960 001AD960  48 00 00 48 */	b lbl_801B09A8
lbl_801B0964:
/* 801B0964 001AD964  80 87 00 20 */	lwz r4, 0x20(r7)
/* 801B0968 001AD968  2C 04 00 00 */	cmpwi r4, 0
/* 801B096C 001AD96C  40 81 00 18 */	ble lbl_801B0984
/* 801B0970 001AD970  38 04 FF FF */	addi r0, r4, -1
/* 801B0974 001AD974  90 07 00 20 */	stw r0, 0x20(r7)
/* 801B0978 001AD978  80 07 00 20 */	lwz r0, 0x20(r7)
/* 801B097C 001AD97C  2C 00 00 00 */	cmpwi r0, 0
/* 801B0980 001AD980  41 81 00 20 */	bgt lbl_801B09A0
lbl_801B0984:
/* 801B0984 001AD984  80 87 00 04 */	lwz r4, 4(r7)
/* 801B0988 001AD988  38 04 00 01 */	addi r0, r4, 1
/* 801B098C 001AD98C  90 07 00 04 */	stw r0, 4(r7)
/* 801B0990 001AD990  80 07 00 04 */	lwz r0, 4(r7)
/* 801B0994 001AD994  2C 00 00 0A */	cmpwi r0, 0xa
/* 801B0998 001AD998  41 80 00 08 */	blt lbl_801B09A0
/* 801B099C 001AD99C  90 67 00 20 */	stw r3, 0x20(r7)
lbl_801B09A0:
/* 801B09A0 001AD9A0  38 A5 00 01 */	addi r5, r5, 1
/* 801B09A4 001AD9A4  38 E7 00 24 */	addi r7, r7, 0x24
lbl_801B09A8:
/* 801B09A8 001AD9A8  80 1F 00 08 */	lwz r0, 8(r31)
/* 801B09AC 001AD9AC  7C 05 00 00 */	cmpw r5, r0
/* 801B09B0 001AD9B0  41 80 FF B4 */	blt lbl_801B0964
/* 801B09B4 001AD9B4  38 61 00 14 */	addi r3, r1, 0x14
/* 801B09B8 001AD9B8  4B E5 FD 09 */	bl dispCalcZ
/* 801B09BC 001AD9BC  3C 60 80 1B */	lis r3, effCoinDisp@ha
/* 801B09C0 001AD9C0  7F E6 FB 78 */	mr r6, r31
/* 801B09C4 001AD9C4  38 A3 05 DC */	addi r5, r3, effCoinDisp@l
/* 801B09C8 001AD9C8  38 80 00 02 */	li r4, 2
/* 801B09CC 001AD9CC  38 60 00 04 */	li r3, 4
/* 801B09D0 001AD9D0  4B E6 00 49 */	bl dispEntry
lbl_801B09D4:
/* 801B09D4 001AD9D4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801B09D8 001AD9D8  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801B09DC 001AD9DC  7C 08 03 A6 */	mtlr r0
/* 801B09E0 001AD9E0  38 21 00 30 */	addi r1, r1, 0x30
/* 801B09E4 001AD9E4  4E 80 00 20 */	blr 

.global effCoinN64Entry
effCoinN64Entry:
/* 801B09E8 001AD9E8  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 801B09EC 001AD9EC  7C 08 02 A6 */	mflr r0
/* 801B09F0 001AD9F0  90 01 00 74 */	stw r0, 0x74(r1)
/* 801B09F4 001AD9F4  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 801B09F8 001AD9F8  F3 E1 00 68 */	psq_st f31, 104(r1), 0, qr0
/* 801B09FC 001AD9FC  DB C1 00 50 */	stfd f30, 0x50(r1)
/* 801B0A00 001ADA00  F3 C1 00 58 */	psq_st f30, 88(r1), 0, qr0
/* 801B0A04 001ADA04  DB A1 00 40 */	stfd f29, 0x40(r1)
/* 801B0A08 001ADA08  F3 A1 00 48 */	psq_st f29, 72(r1), 0, qr0
/* 801B0A0C 001ADA0C  DB 81 00 30 */	stfd f28, 0x30(r1)
/* 801B0A10 001ADA10  F3 81 00 38 */	psq_st f28, 56(r1), 0, qr0
/* 801B0A14 001ADA14  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801B0A18 001ADA18  93 C1 00 28 */	stw r30, 0x28(r1)
/* 801B0A1C 001ADA1C  FF 80 08 90 */	fmr f28, f1
/* 801B0A20 001ADA20  7C 7E 1B 78 */	mr r30, r3
/* 801B0A24 001ADA24  FF A0 10 90 */	fmr f29, f2
/* 801B0A28 001ADA28  FF C0 18 90 */	fmr f30, f3
/* 801B0A2C 001ADA2C  FF E0 20 90 */	fmr f31, f4
/* 801B0A30 001ADA30  4B EA D3 8D */	bl effEntry
/* 801B0A34 001ADA34  3C 80 80 30 */	lis r4, lbl_802FA430@ha
/* 801B0A38 001ADA38  7C 7F 1B 78 */	mr r31, r3
/* 801B0A3C 001ADA3C  38 84 A4 30 */	addi r4, r4, lbl_802FA430@l
/* 801B0A40 001ADA40  38 00 00 05 */	li r0, 5
/* 801B0A44 001ADA44  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801B0A48 001ADA48  38 60 00 03 */	li r3, 3
/* 801B0A4C 001ADA4C  38 80 00 B4 */	li r4, 0xb4
/* 801B0A50 001ADA50  90 1F 00 08 */	stw r0, 8(r31)
/* 801B0A54 001ADA54  4B E7 F0 39 */	bl __memAlloc
/* 801B0A58 001ADA58  3C 80 80 1B */	lis r4, effCoinMain@ha
/* 801B0A5C 001ADA5C  90 7F 00 0C */	stw r3, 0xc(r31)
/* 801B0A60 001ADA60  38 04 08 C0 */	addi r0, r4, effCoinMain@l
/* 801B0A64 001ADA64  3C A0 80 3A */	lis r5, lbl_8039BEF0@ha
/* 801B0A68 001ADA68  90 1F 00 10 */	stw r0, 0x10(r31)
/* 801B0A6C 001ADA6C  3C 80 80 30 */	lis r4, lbl_802FA428@ha
/* 801B0A70 001ADA70  C8 44 A4 28 */	lfd f2, lbl_802FA428@l(r4)
/* 801B0A74 001ADA74  38 E0 00 00 */	li r7, 0
/* 801B0A78 001ADA78  93 C3 00 00 */	stw r30, 0(r3)
/* 801B0A7C 001ADA7C  38 C0 00 0E */	li r6, 0xe
/* 801B0A80 001ADA80  38 00 00 04 */	li r0, 4
/* 801B0A84 001ADA84  39 03 00 24 */	addi r8, r3, 0x24
/* 801B0A88 001ADA88  90 E3 00 18 */	stw r7, 0x18(r3)
/* 801B0A8C 001ADA8C  38 A5 BE F0 */	addi r5, r5, lbl_8039BEF0@l
/* 801B0A90 001ADA90  38 E0 00 01 */	li r7, 1
/* 801B0A94 001ADA94  3C 80 43 30 */	lis r4, 0x4330
/* 801B0A98 001ADA98  90 C3 00 14 */	stw r6, 0x14(r3)
/* 801B0A9C 001ADA9C  C0 22 D8 6C */	lfs f1, lbl_8041EBEC-_SDA2_BASE_(r2)
/* 801B0AA0 001ADAA0  D3 83 00 08 */	stfs f28, 8(r3)
/* 801B0AA4 001ADAA4  D3 A3 00 0C */	stfs f29, 0xc(r3)
/* 801B0AA8 001ADAA8  D3 C3 00 10 */	stfs f30, 0x10(r3)
/* 801B0AAC 001ADAAC  7C 09 03 A6 */	mtctr r0
lbl_801B0AB0:
/* 801B0AB0 001ADAB0  38 07 FF FF */	addi r0, r7, -1
/* 801B0AB4 001ADAB4  90 81 00 08 */	stw r4, 8(r1)
/* 801B0AB8 001ADAB8  1C 60 00 14 */	mulli r3, r0, 0x14
/* 801B0ABC 001ADABC  38 E7 00 01 */	addi r7, r7, 1
/* 801B0AC0 001ADAC0  90 81 00 10 */	stw r4, 0x10(r1)
/* 801B0AC4 001ADAC4  38 00 FF FF */	li r0, -1
/* 801B0AC8 001ADAC8  7C C5 1A 14 */	add r6, r5, r3
/* 801B0ACC 001ADACC  90 81 00 18 */	stw r4, 0x18(r1)
/* 801B0AD0 001ADAD0  80 66 00 04 */	lwz r3, 4(r6)
/* 801B0AD4 001ADAD4  90 81 00 20 */	stw r4, 0x20(r1)
/* 801B0AD8 001ADAD8  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801B0ADC 001ADADC  90 61 00 0C */	stw r3, 0xc(r1)
/* 801B0AE0 001ADAE0  C8 01 00 08 */	lfd f0, 8(r1)
/* 801B0AE4 001ADAE4  EC 00 10 28 */	fsubs f0, f0, f2
/* 801B0AE8 001ADAE8  D0 08 00 08 */	stfs f0, 8(r8)
/* 801B0AEC 001ADAEC  80 66 00 08 */	lwz r3, 8(r6)
/* 801B0AF0 001ADAF0  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801B0AF4 001ADAF4  90 61 00 14 */	stw r3, 0x14(r1)
/* 801B0AF8 001ADAF8  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 801B0AFC 001ADAFC  EC 00 10 28 */	fsubs f0, f0, f2
/* 801B0B00 001ADB00  D0 08 00 0C */	stfs f0, 0xc(r8)
/* 801B0B04 001ADB04  80 66 00 0C */	lwz r3, 0xc(r6)
/* 801B0B08 001ADB08  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 801B0B0C 001ADB0C  90 61 00 1C */	stw r3, 0x1c(r1)
/* 801B0B10 001ADB10  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 801B0B14 001ADB14  EC 00 10 28 */	fsubs f0, f0, f2
/* 801B0B18 001ADB18  D0 08 00 10 */	stfs f0, 0x10(r8)
/* 801B0B1C 001ADB1C  90 08 00 04 */	stw r0, 4(r8)
/* 801B0B20 001ADB20  80 06 00 00 */	lwz r0, 0(r6)
/* 801B0B24 001ADB24  90 08 00 20 */	stw r0, 0x20(r8)
/* 801B0B28 001ADB28  80 06 00 10 */	lwz r0, 0x10(r6)
/* 801B0B2C 001ADB2C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801B0B30 001ADB30  90 01 00 24 */	stw r0, 0x24(r1)
/* 801B0B34 001ADB34  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801B0B38 001ADB38  EC 00 10 28 */	fsubs f0, f0, f2
/* 801B0B3C 001ADB3C  EC 1F 00 32 */	fmuls f0, f31, f0
/* 801B0B40 001ADB40  EC 01 00 32 */	fmuls f0, f1, f0
/* 801B0B44 001ADB44  D0 08 00 1C */	stfs f0, 0x1c(r8)
/* 801B0B48 001ADB48  39 08 00 24 */	addi r8, r8, 0x24
/* 801B0B4C 001ADB4C  42 00 FF 64 */	bdnz lbl_801B0AB0
/* 801B0B50 001ADB50  7F E3 FB 78 */	mr r3, r31
/* 801B0B54 001ADB54  E3 E1 00 68 */	psq_l f31, 104(r1), 0, qr0
/* 801B0B58 001ADB58  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 801B0B5C 001ADB5C  E3 C1 00 58 */	psq_l f30, 88(r1), 0, qr0
/* 801B0B60 001ADB60  CB C1 00 50 */	lfd f30, 0x50(r1)
/* 801B0B64 001ADB64  E3 A1 00 48 */	psq_l f29, 72(r1), 0, qr0
/* 801B0B68 001ADB68  CB A1 00 40 */	lfd f29, 0x40(r1)
/* 801B0B6C 001ADB6C  E3 81 00 38 */	psq_l f28, 56(r1), 0, qr0
/* 801B0B70 001ADB70  CB 81 00 30 */	lfd f28, 0x30(r1)
/* 801B0B74 001ADB74  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801B0B78 001ADB78  80 01 00 74 */	lwz r0, 0x74(r1)
/* 801B0B7C 001ADB7C  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 801B0B80 001ADB80  7C 08 03 A6 */	mtlr r0
/* 801B0B84 001ADB84  38 21 00 70 */	addi r1, r1, 0x70
/* 801B0B88 001ADB88  4E 80 00 20 */	blr 
