.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effBattenDisp2
effBattenDisp2:
/* 802336C4 002306C4  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 802336C8 002306C8  7C 08 02 A6 */	mflr r0
/* 802336CC 002306CC  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 802336D0 002306D0  93 E1 00 AC */	stw r31, 0xac(r1)
/* 802336D4 002306D4  93 C1 00 A8 */	stw r30, 0xa8(r1)
/* 802336D8 002306D8  7C 7E 1B 78 */	mr r30, r3
/* 802336DC 002306DC  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 802336E0 002306E0  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 802336E4 002306E4  2C 00 FF FF */	cmpwi r0, -1
/* 802336E8 002306E8  41 82 01 00 */	beq lbl_802337E8
/* 802336EC 002306EC  C0 3F 00 04 */	lfs f1, 4(r31)
/* 802336F0 002306F0  38 61 00 70 */	addi r3, r1, 0x70
/* 802336F4 002306F4  C0 5F 00 08 */	lfs f2, 8(r31)
/* 802336F8 002306F8  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 802336FC 002306FC  48 06 4D 31 */	bl PSMTXTrans
/* 80233700 00230700  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 80233704 00230704  38 61 00 40 */	addi r3, r1, 0x40
/* 80233708 00230708  FC 40 08 90 */	fmr f2, f1
/* 8023370C 0023070C  FC 60 08 90 */	fmr f3, f1
/* 80233710 00230710  48 06 4D 9D */	bl PSMTXScale
/* 80233714 00230714  7F C3 F3 78 */	mr r3, r30
/* 80233718 00230718  4B DD BA 39 */	bl camGetPtr
/* 8023371C 0023071C  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 80233720 00230720  38 61 00 10 */	addi r3, r1, 0x10
/* 80233724 00230724  C0 02 06 08 */	lfs f0, lbl_80421988-_SDA2_BASE_(r2)
/* 80233728 00230728  38 80 00 79 */	li r4, 0x79
/* 8023372C 0023072C  FC 20 08 50 */	fneg f1, f1
/* 80233730 00230730  EC 20 00 72 */	fmuls f1, f0, f1
/* 80233734 00230734  48 06 4A B9 */	bl PSMTXRotRad
/* 80233738 00230738  38 61 00 70 */	addi r3, r1, 0x70
/* 8023373C 0023073C  38 81 00 10 */	addi r4, r1, 0x10
/* 80233740 00230740  7C 65 1B 78 */	mr r5, r3
/* 80233744 00230744  48 06 48 1D */	bl PSMTXConcat
/* 80233748 00230748  38 61 00 70 */	addi r3, r1, 0x70
/* 8023374C 0023074C  38 81 00 40 */	addi r4, r1, 0x40
/* 80233750 00230750  7C 65 1B 78 */	mr r5, r3
/* 80233754 00230754  48 06 48 0D */	bl PSMTXConcat
/* 80233758 00230758  38 61 00 70 */	addi r3, r1, 0x70
/* 8023375C 0023075C  38 9F 00 28 */	addi r4, r31, 0x28
/* 80233760 00230760  7C 65 1B 78 */	mr r5, r3
/* 80233764 00230764  48 06 47 FD */	bl PSMTXConcat
/* 80233768 00230768  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 8023376C 0023076C  38 80 00 40 */	li r4, 0x40
/* 80233770 00230770  4B E0 C9 25 */	bl animPoseSetMaterialFlagOn
/* 80233774 00230774  80 62 06 04 */	lwz r3, lbl_80421984-_SDA2_BASE_(r2)
/* 80233778 00230778  38 81 00 0C */	addi r4, r1, 0xc
/* 8023377C 0023077C  88 1F 00 14 */	lbz r0, 0x14(r31)
/* 80233780 00230780  90 61 00 08 */	stw r3, 8(r1)
/* 80233784 00230784  98 01 00 0B */	stb r0, 0xb(r1)
/* 80233788 00230788  80 01 00 08 */	lwz r0, 8(r1)
/* 8023378C 0023078C  90 01 00 0C */	stw r0, 0xc(r1)
/* 80233790 00230790  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 80233794 00230794  4B E0 C8 85 */	bl animPoseSetMaterialEvtColor
/* 80233798 00230798  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 8023379C 0023079C  4B E0 AE F5 */	bl animPoseMain
/* 802337A0 002307A0  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802337A4 002307A4  38 81 00 70 */	addi r4, r1, 0x70
/* 802337A8 002307A8  C0 22 06 0C */	lfs f1, lbl_8042198C-_SDA2_BASE_(r2)
/* 802337AC 002307AC  38 A0 00 01 */	li r5, 1
/* 802337B0 002307B0  C0 42 06 10 */	lfs f2, lbl_80421990-_SDA2_BASE_(r2)
/* 802337B4 002307B4  4B E0 76 89 */	bl animPoseDrawMtx
/* 802337B8 002307B8  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802337BC 002307BC  38 81 00 70 */	addi r4, r1, 0x70
/* 802337C0 002307C0  C0 22 06 0C */	lfs f1, lbl_8042198C-_SDA2_BASE_(r2)
/* 802337C4 002307C4  38 A0 00 02 */	li r5, 2
/* 802337C8 002307C8  C0 42 06 10 */	lfs f2, lbl_80421990-_SDA2_BASE_(r2)
/* 802337CC 002307CC  4B E0 76 71 */	bl animPoseDrawMtx
/* 802337D0 002307D0  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 802337D4 002307D4  38 81 00 70 */	addi r4, r1, 0x70
/* 802337D8 002307D8  C0 22 06 0C */	lfs f1, lbl_8042198C-_SDA2_BASE_(r2)
/* 802337DC 002307DC  38 A0 00 03 */	li r5, 3
/* 802337E0 002307E0  C0 42 06 10 */	lfs f2, lbl_80421990-_SDA2_BASE_(r2)
/* 802337E4 002307E4  4B E0 76 59 */	bl animPoseDrawMtx
lbl_802337E8:
/* 802337E8 002307E8  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 802337EC 002307EC  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 802337F0 002307F0  83 C1 00 A8 */	lwz r30, 0xa8(r1)
/* 802337F4 002307F4  7C 08 03 A6 */	mtlr r0
/* 802337F8 002307F8  38 21 00 B0 */	addi r1, r1, 0xb0
/* 802337FC 002307FC  4E 80 00 20 */	blr 
effBattenDisp:
/* 80233800 00230800  94 21 FE D0 */	stwu r1, -0x130(r1)
/* 80233804 00230804  7C 08 02 A6 */	mflr r0
/* 80233808 00230808  90 01 01 34 */	stw r0, 0x134(r1)
/* 8023380C 0023080C  DB E1 01 20 */	stfd f31, 0x120(r1)
/* 80233810 00230810  F3 E1 01 28 */	psq_st f31, 296(r1), 0, qr0
/* 80233814 00230814  DB C1 01 10 */	stfd f30, 0x110(r1)
/* 80233818 00230818  F3 C1 01 18 */	psq_st f30, 280(r1), 0, qr0
/* 8023381C 0023081C  BF 41 00 F8 */	stmw r26, 0xf8(r1)
/* 80233820 00230820  7C 9E 23 78 */	mr r30, r4
/* 80233824 00230824  7C 7A 1B 78 */	mr r26, r3
/* 80233828 00230828  83 64 00 0C */	lwz r27, 0xc(r4)
/* 8023382C 0023082C  4B DD B9 25 */	bl camGetPtr
/* 80233830 00230830  8B FB 00 14 */	lbz r31, 0x14(r27)
/* 80233834 00230834  7C 7C 1B 78 */	mr r28, r3
/* 80233838 00230838  38 81 00 10 */	addi r4, r1, 0x10
/* 8023383C 0023083C  38 60 00 56 */	li r3, 0x56
/* 80233840 00230840  4B E2 A6 6D */	bl effGetTexObj
/* 80233844 00230844  38 61 00 10 */	addi r3, r1, 0x10
/* 80233848 00230848  38 80 00 00 */	li r4, 0
/* 8023384C 0023084C  48 07 E2 31 */	bl GXLoadTexObj
/* 80233850 00230850  38 60 00 01 */	li r3, 1
/* 80233854 00230854  48 07 D8 E5 */	bl GXSetNumChans
/* 80233858 00230858  38 60 00 04 */	li r3, 4
/* 8023385C 0023085C  38 80 00 00 */	li r4, 0
/* 80233860 00230860  38 A0 00 00 */	li r5, 0
/* 80233864 00230864  38 C0 00 00 */	li r6, 0
/* 80233868 00230868  38 E0 00 00 */	li r7, 0
/* 8023386C 0023086C  39 00 00 00 */	li r8, 0
/* 80233870 00230870  39 20 00 02 */	li r9, 2
/* 80233874 00230874  48 07 D9 01 */	bl GXSetChanCtrl
/* 80233878 00230878  38 60 00 01 */	li r3, 1
/* 8023387C 0023087C  48 07 BA 05 */	bl GXSetNumTexGens
/* 80233880 00230880  38 60 00 00 */	li r3, 0
/* 80233884 00230884  38 80 00 01 */	li r4, 1
/* 80233888 00230888  38 A0 00 04 */	li r5, 4
/* 8023388C 0023088C  38 C0 00 3C */	li r6, 0x3c
/* 80233890 00230890  38 E0 00 00 */	li r7, 0
/* 80233894 00230894  39 00 00 7D */	li r8, 0x7d
/* 80233898 00230898  48 07 B7 69 */	bl GXSetTexCoordGen2
/* 8023389C 0023089C  38 60 00 01 */	li r3, 1
/* 802338A0 002308A0  48 07 F9 29 */	bl GXSetNumTevStages
/* 802338A4 002308A4  38 60 00 00 */	li r3, 0
/* 802338A8 002308A8  38 80 00 00 */	li r4, 0
/* 802338AC 002308AC  38 A0 00 00 */	li r5, 0
/* 802338B0 002308B0  38 C0 00 04 */	li r6, 4
/* 802338B4 002308B4  48 07 F7 79 */	bl GXSetTevOrder
/* 802338B8 002308B8  38 60 00 00 */	li r3, 0
/* 802338BC 002308BC  38 80 00 00 */	li r4, 0
/* 802338C0 002308C0  48 07 F2 11 */	bl GXSetTevOp
/* 802338C4 002308C4  38 60 00 00 */	li r3, 0
/* 802338C8 002308C8  48 07 C5 C1 */	bl GXSetCullMode
/* 802338CC 002308CC  48 07 AE 51 */	bl GXClearVtxDesc
/* 802338D0 002308D0  38 60 00 09 */	li r3, 9
/* 802338D4 002308D4  38 80 00 01 */	li r4, 1
/* 802338D8 002308D8  48 07 A5 2D */	bl GXSetVtxDesc
/* 802338DC 002308DC  38 60 00 0D */	li r3, 0xd
/* 802338E0 002308E0  38 80 00 01 */	li r4, 1
/* 802338E4 002308E4  48 07 A5 21 */	bl GXSetVtxDesc
/* 802338E8 002308E8  38 60 00 00 */	li r3, 0
/* 802338EC 002308EC  38 80 00 09 */	li r4, 9
/* 802338F0 002308F0  38 A0 00 01 */	li r5, 1
/* 802338F4 002308F4  38 C0 00 04 */	li r6, 4
/* 802338F8 002308F8  38 E0 00 00 */	li r7, 0
/* 802338FC 002308FC  48 07 AE 59 */	bl GXSetVtxAttrFmt
/* 80233900 00230900  38 60 00 00 */	li r3, 0
/* 80233904 00230904  38 80 00 0D */	li r4, 0xd
/* 80233908 00230908  38 A0 00 01 */	li r5, 1
/* 8023390C 0023090C  38 C0 00 04 */	li r6, 4
/* 80233910 00230910  38 E0 00 00 */	li r7, 0
/* 80233914 00230914  48 07 AE 41 */	bl GXSetVtxAttrFmt
/* 80233918 00230918  C0 3B 00 04 */	lfs f1, 4(r27)
/* 8023391C 0023091C  38 61 00 C0 */	addi r3, r1, 0xc0
/* 80233920 00230920  C0 5B 00 08 */	lfs f2, 8(r27)
/* 80233924 00230924  C0 7B 00 0C */	lfs f3, 0xc(r27)
/* 80233928 00230928  48 06 4B 05 */	bl PSMTXTrans
/* 8023392C 0023092C  C0 3B 00 10 */	lfs f1, 0x10(r27)
/* 80233930 00230930  38 61 00 60 */	addi r3, r1, 0x60
/* 80233934 00230934  FC 40 08 90 */	fmr f2, f1
/* 80233938 00230938  FC 60 08 90 */	fmr f3, f1
/* 8023393C 0023093C  48 06 4B 71 */	bl PSMTXScale
/* 80233940 00230940  7F 43 D3 78 */	mr r3, r26
/* 80233944 00230944  4B DD B8 0D */	bl camGetPtr
/* 80233948 00230948  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8023394C 0023094C  38 61 00 90 */	addi r3, r1, 0x90
/* 80233950 00230950  C0 02 06 08 */	lfs f0, lbl_80421988-_SDA2_BASE_(r2)
/* 80233954 00230954  38 80 00 79 */	li r4, 0x79
/* 80233958 00230958  FC 20 08 50 */	fneg f1, f1
/* 8023395C 0023095C  EC 20 00 72 */	fmuls f1, f0, f1
/* 80233960 00230960  48 06 48 8D */	bl PSMTXRotRad
/* 80233964 00230964  38 81 00 60 */	addi r4, r1, 0x60
/* 80233968 00230968  38 61 00 C0 */	addi r3, r1, 0xc0
/* 8023396C 0023096C  7C 85 23 78 */	mr r5, r4
/* 80233970 00230970  48 06 45 F1 */	bl PSMTXConcat
/* 80233974 00230974  38 61 00 60 */	addi r3, r1, 0x60
/* 80233978 00230978  38 81 00 90 */	addi r4, r1, 0x90
/* 8023397C 0023097C  38 A1 00 30 */	addi r5, r1, 0x30
/* 80233980 00230980  48 06 45 E1 */	bl PSMTXConcat
/* 80233984 00230984  38 81 00 30 */	addi r4, r1, 0x30
/* 80233988 00230988  38 7C 01 1C */	addi r3, r28, 0x11c
/* 8023398C 0023098C  7C 85 23 78 */	mr r5, r4
/* 80233990 00230990  48 06 45 D1 */	bl PSMTXConcat
/* 80233994 00230994  C0 22 06 14 */	lfs f1, lbl_80421994-_SDA2_BASE_(r2)
/* 80233998 00230998  3C 60 80 81 */	lis r3, 0x80808081@ha
/* 8023399C 0023099C  C0 02 06 18 */	lfs f0, lbl_80421998-_SDA2_BASE_(r2)
/* 802339A0 002309A0  3B 83 80 81 */	addi r28, r3, 0x80808081@l
/* 802339A4 002309A4  FC 20 08 50 */	fneg f1, f1
/* 802339A8 002309A8  C3 E2 06 1C */	lfs f31, lbl_8042199C-_SDA2_BASE_(r2)
/* 802339AC 002309AC  3B 40 00 01 */	li r26, 1
/* 802339B0 002309B0  3F A0 CC 01 */	lis r29, 0xcc01
/* 802339B4 002309B4  3B 7B 00 5C */	addi r27, r27, 0x5c
/* 802339B8 002309B8  EF C1 00 32 */	fmuls f30, f1, f0
/* 802339BC 002309BC  48 00 01 34 */	b lbl_80233AF0
lbl_802339C0:
/* 802339C0 002309C0  C0 3B 00 04 */	lfs f1, 4(r27)
/* 802339C4 002309C4  38 61 00 C0 */	addi r3, r1, 0xc0
/* 802339C8 002309C8  C0 5B 00 08 */	lfs f2, 8(r27)
/* 802339CC 002309CC  C0 7B 00 0C */	lfs f3, 0xc(r27)
/* 802339D0 002309D0  48 06 4A 5D */	bl PSMTXTrans
/* 802339D4 002309D4  C0 3B 00 10 */	lfs f1, 0x10(r27)
/* 802339D8 002309D8  38 61 00 60 */	addi r3, r1, 0x60
/* 802339DC 002309DC  FC 40 08 90 */	fmr f2, f1
/* 802339E0 002309E0  FC 60 08 90 */	fmr f3, f1
/* 802339E4 002309E4  48 06 4A C9 */	bl PSMTXScale
/* 802339E8 002309E8  38 81 00 60 */	addi r4, r1, 0x60
/* 802339EC 002309EC  38 61 00 C0 */	addi r3, r1, 0xc0
/* 802339F0 002309F0  7C 85 23 78 */	mr r5, r4
/* 802339F4 002309F4  48 06 45 6D */	bl PSMTXConcat
/* 802339F8 002309F8  38 81 00 60 */	addi r4, r1, 0x60
/* 802339FC 002309FC  38 61 00 30 */	addi r3, r1, 0x30
/* 80233A00 00230A00  7C 85 23 78 */	mr r5, r4
/* 80233A04 00230A04  48 06 45 5D */	bl PSMTXConcat
/* 80233A08 00230A08  38 61 00 60 */	addi r3, r1, 0x60
/* 80233A0C 00230A0C  38 80 00 00 */	li r4, 0
/* 80233A10 00230A10  48 08 0A E9 */	bl GXLoadPosMtxImm
/* 80233A14 00230A14  38 60 00 00 */	li r3, 0
/* 80233A18 00230A18  48 08 0B 81 */	bl GXSetCurrentMtx
/* 80233A1C 00230A1C  88 1B 00 14 */	lbz r0, 0x14(r27)
/* 80233A20 00230A20  38 81 00 0C */	addi r4, r1, 0xc
/* 80233A24 00230A24  80 A2 06 00 */	lwz r5, lbl_80421980-_SDA2_BASE_(r2)
/* 80233A28 00230A28  38 60 00 04 */	li r3, 4
/* 80233A2C 00230A2C  7C 1F 01 D6 */	mullw r0, r31, r0
/* 80233A30 00230A30  90 A1 00 08 */	stw r5, 8(r1)
/* 80233A34 00230A34  7C BC 00 96 */	mulhw r5, r28, r0
/* 80233A38 00230A38  7C 05 02 14 */	add r0, r5, r0
/* 80233A3C 00230A3C  7C 00 3E 70 */	srawi r0, r0, 7
/* 80233A40 00230A40  54 05 0F FE */	srwi r5, r0, 0x1f
/* 80233A44 00230A44  7C 00 2A 14 */	add r0, r0, r5
/* 80233A48 00230A48  98 01 00 0B */	stb r0, 0xb(r1)
/* 80233A4C 00230A4C  80 01 00 08 */	lwz r0, 8(r1)
/* 80233A50 00230A50  90 01 00 0C */	stw r0, 0xc(r1)
/* 80233A54 00230A54  48 07 D5 FD */	bl GXSetChanMatColor
/* 80233A58 00230A58  38 60 00 80 */	li r3, 0x80
/* 80233A5C 00230A5C  38 80 00 00 */	li r4, 0
/* 80233A60 00230A60  38 A0 00 04 */	li r5, 4
/* 80233A64 00230A64  48 07 C2 05 */	bl GXBegin
/* 80233A68 00230A68  D3 DD 80 00 */	stfs f30, -0x8000(r29)
/* 80233A6C 00230A6C  3B 5A 00 01 */	addi r26, r26, 1
/* 80233A70 00230A70  3B 7B 00 5C */	addi r27, r27, 0x5c
/* 80233A74 00230A74  D3 FD 80 00 */	stfs f31, -0x8000(r29)
/* 80233A78 00230A78  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233A7C 00230A7C  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233A80 00230A80  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233A84 00230A84  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233A88 00230A88  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233A8C 00230A8C  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233A90 00230A90  D3 FD 80 00 */	stfs f31, -0x8000(r29)
/* 80233A94 00230A94  D3 FD 80 00 */	stfs f31, -0x8000(r29)
/* 80233A98 00230A98  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233A9C 00230A9C  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AA0 00230AA0  C0 02 06 10 */	lfs f0, lbl_80421990-_SDA2_BASE_(r2)
/* 80233AA4 00230AA4  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AA8 00230AA8  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233AAC 00230AAC  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AB0 00230AB0  D3 FD 80 00 */	stfs f31, -0x8000(r29)
/* 80233AB4 00230AB4  D3 DD 80 00 */	stfs f30, -0x8000(r29)
/* 80233AB8 00230AB8  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233ABC 00230ABC  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AC0 00230AC0  C0 02 06 10 */	lfs f0, lbl_80421990-_SDA2_BASE_(r2)
/* 80233AC4 00230AC4  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AC8 00230AC8  C0 02 06 10 */	lfs f0, lbl_80421990-_SDA2_BASE_(r2)
/* 80233ACC 00230ACC  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AD0 00230AD0  D3 DD 80 00 */	stfs f30, -0x8000(r29)
/* 80233AD4 00230AD4  D3 DD 80 00 */	stfs f30, -0x8000(r29)
/* 80233AD8 00230AD8  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233ADC 00230ADC  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AE0 00230AE0  C0 02 06 0C */	lfs f0, lbl_8042198C-_SDA2_BASE_(r2)
/* 80233AE4 00230AE4  D0 1D 80 00 */	stfs f0, -0x8000(r29)
/* 80233AE8 00230AE8  C0 02 06 10 */	lfs f0, lbl_80421990-_SDA2_BASE_(r2)
/* 80233AEC 00230AEC  D0 1D 80 00 */	stfs f0, -0x8000(r29)
lbl_80233AF0:
/* 80233AF0 00230AF0  80 1E 00 08 */	lwz r0, 8(r30)
/* 80233AF4 00230AF4  7C 1A 00 00 */	cmpw r26, r0
/* 80233AF8 00230AF8  41 80 FE C8 */	blt lbl_802339C0
/* 80233AFC 00230AFC  E3 E1 01 28 */	psq_l f31, 296(r1), 0, qr0
/* 80233B00 00230B00  CB E1 01 20 */	lfd f31, 0x120(r1)
/* 80233B04 00230B04  E3 C1 01 18 */	psq_l f30, 280(r1), 0, qr0
/* 80233B08 00230B08  CB C1 01 10 */	lfd f30, 0x110(r1)
/* 80233B0C 00230B0C  BB 41 00 F8 */	lmw r26, 0xf8(r1)
/* 80233B10 00230B10  80 01 01 34 */	lwz r0, 0x134(r1)
/* 80233B14 00230B14  7C 08 03 A6 */	mtlr r0
/* 80233B18 00230B18  38 21 01 30 */	addi r1, r1, 0x130
/* 80233B1C 00230B1C  4E 80 00 20 */	blr 
effBattenMain:
/* 80233B20 00230B20  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 80233B24 00230B24  7C 08 02 A6 */	mflr r0
/* 80233B28 00230B28  3C 80 80 30 */	lis r4, lbl_802FFA50@ha
/* 80233B2C 00230B2C  90 01 00 54 */	stw r0, 0x54(r1)
/* 80233B30 00230B30  BF 41 00 38 */	stmw r26, 0x38(r1)
/* 80233B34 00230B34  3B E4 FA 50 */	addi r31, r4, lbl_802FFA50@l
/* 80233B38 00230B38  7C 7B 1B 78 */	mr r27, r3
/* 80233B3C 00230B3C  3B A0 00 00 */	li r29, 0
/* 80233B40 00230B40  83 C3 00 0C */	lwz r30, 0xc(r3)
/* 80233B44 00230B44  80 9F 00 00 */	lwz r4, 0(r31)
/* 80233B48 00230B48  80 7F 00 04 */	lwz r3, 4(r31)
/* 80233B4C 00230B4C  80 1F 00 08 */	lwz r0, 8(r31)
/* 80233B50 00230B50  90 61 00 0C */	stw r3, 0xc(r1)
/* 80233B54 00230B54  C0 3E 00 08 */	lfs f1, 8(r30)
/* 80233B58 00230B58  90 81 00 08 */	stw r4, 8(r1)
/* 80233B5C 00230B5C  C0 1E 00 04 */	lfs f0, 4(r30)
/* 80233B60 00230B60  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 80233B64 00230B64  80 6D 90 B0 */	lwz r3, lbl_80410310-_SDA_BASE_(r13)
/* 80233B68 00230B68  D0 01 00 08 */	stfs f0, 8(r1)
/* 80233B6C 00230B6C  C0 1E 00 0C */	lfs f0, 0xc(r30)
/* 80233B70 00230B70  90 01 00 10 */	stw r0, 0x10(r1)
/* 80233B74 00230B74  80 A1 00 08 */	lwz r5, 8(r1)
/* 80233B78 00230B78  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80233B7C 00230B7C  80 81 00 0C */	lwz r4, 0xc(r1)
/* 80233B80 00230B80  80 01 00 10 */	lwz r0, 0x10(r1)
/* 80233B84 00230B84  90 A1 00 14 */	stw r5, 0x14(r1)
/* 80233B88 00230B88  90 81 00 18 */	stw r4, 0x18(r1)
/* 80233B8C 00230B8C  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80233B90 00230B90  83 9E 00 00 */	lwz r28, 0(r30)
/* 80233B94 00230B94  80 63 00 14 */	lwz r3, 0x14(r3)
/* 80233B98 00230B98  2C 1C 00 02 */	cmpwi r28, 2
/* 80233B9C 00230B9C  7C 03 00 D0 */	neg r0, r3
/* 80233BA0 00230BA0  7C 00 1B 78 */	or r0, r0, r3
/* 80233BA4 00230BA4  54 1A 0F FE */	srwi r26, r0, 0x1f
/* 80233BA8 00230BA8  41 82 00 68 */	beq lbl_80233C10
/* 80233BAC 00230BAC  40 80 00 10 */	bge lbl_80233BBC
/* 80233BB0 00230BB0  2C 1C 00 01 */	cmpwi r28, 1
/* 80233BB4 00230BB4  40 80 00 14 */	bge lbl_80233BC8
/* 80233BB8 00230BB8  48 00 00 E4 */	b lbl_80233C9C
lbl_80233BBC:
/* 80233BBC 00230BBC  2C 1C 00 04 */	cmpwi r28, 4
/* 80233BC0 00230BC0  40 80 00 DC */	bge lbl_80233C9C
/* 80233BC4 00230BC4  48 00 00 94 */	b lbl_80233C58
lbl_80233BC8:
/* 80233BC8 00230BC8  7F 44 D3 78 */	mr r4, r26
/* 80233BCC 00230BCC  38 7F 00 0C */	addi r3, r31, 0xc
/* 80233BD0 00230BD0  38 A0 00 00 */	li r5, 0
/* 80233BD4 00230BD4  4B E0 5A 9D */	bl animGroupBaseAsync
/* 80233BD8 00230BD8  2C 03 00 00 */	cmpwi r3, 0
/* 80233BDC 00230BDC  41 82 03 48 */	beq lbl_80233F24
/* 80233BE0 00230BE0  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80233BE4 00230BE4  2C 00 FF FF */	cmpwi r0, -1
/* 80233BE8 00230BE8  40 82 00 B4 */	bne lbl_80233C9C
/* 80233BEC 00230BEC  7F 44 D3 78 */	mr r4, r26
/* 80233BF0 00230BF0  38 7F 00 0C */	addi r3, r31, 0xc
/* 80233BF4 00230BF4  4B E0 D4 DD */	bl animPoseEntry
/* 80233BF8 00230BF8  90 7E 00 24 */	stw r3, 0x24(r30)
/* 80233BFC 00230BFC  38 82 06 20 */	addi r4, r2, lbl_804219A0-_SDA2_BASE_
/* 80233C00 00230C00  38 A0 00 01 */	li r5, 1
/* 80233C04 00230C04  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 80233C08 00230C08  4B E0 CE CD */	bl animPoseSetAnim
/* 80233C0C 00230C0C  48 00 00 90 */	b lbl_80233C9C
lbl_80233C10:
/* 80233C10 00230C10  7F 44 D3 78 */	mr r4, r26
/* 80233C14 00230C14  38 7F 00 0C */	addi r3, r31, 0xc
/* 80233C18 00230C18  38 A0 00 00 */	li r5, 0
/* 80233C1C 00230C1C  4B E0 5A 55 */	bl animGroupBaseAsync
/* 80233C20 00230C20  2C 03 00 00 */	cmpwi r3, 0
/* 80233C24 00230C24  41 82 03 00 */	beq lbl_80233F24
/* 80233C28 00230C28  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80233C2C 00230C2C  2C 00 FF FF */	cmpwi r0, -1
/* 80233C30 00230C30  40 82 00 6C */	bne lbl_80233C9C
/* 80233C34 00230C34  7F 44 D3 78 */	mr r4, r26
/* 80233C38 00230C38  38 7F 00 0C */	addi r3, r31, 0xc
/* 80233C3C 00230C3C  4B E0 D4 95 */	bl animPoseEntry
/* 80233C40 00230C40  90 7E 00 24 */	stw r3, 0x24(r30)
/* 80233C44 00230C44  38 82 06 24 */	addi r4, r2, lbl_804219A4-_SDA2_BASE_
/* 80233C48 00230C48  38 A0 00 01 */	li r5, 1
/* 80233C4C 00230C4C  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 80233C50 00230C50  4B E0 CE 85 */	bl animPoseSetAnim
/* 80233C54 00230C54  48 00 00 48 */	b lbl_80233C9C
lbl_80233C58:
/* 80233C58 00230C58  7F 44 D3 78 */	mr r4, r26
/* 80233C5C 00230C5C  38 7F 00 1C */	addi r3, r31, 0x1c
/* 80233C60 00230C60  38 A0 00 00 */	li r5, 0
/* 80233C64 00230C64  4B E0 5A 0D */	bl animGroupBaseAsync
/* 80233C68 00230C68  2C 03 00 00 */	cmpwi r3, 0
/* 80233C6C 00230C6C  41 82 02 B8 */	beq lbl_80233F24
/* 80233C70 00230C70  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 80233C74 00230C74  2C 00 FF FF */	cmpwi r0, -1
/* 80233C78 00230C78  40 82 00 24 */	bne lbl_80233C9C
/* 80233C7C 00230C7C  7F 44 D3 78 */	mr r4, r26
/* 80233C80 00230C80  38 7F 00 1C */	addi r3, r31, 0x1c
/* 80233C84 00230C84  4B E0 D4 4D */	bl animPoseEntry
/* 80233C88 00230C88  90 7E 00 24 */	stw r3, 0x24(r30)
/* 80233C8C 00230C8C  38 82 06 20 */	addi r4, r2, lbl_804219A0-_SDA2_BASE_
/* 80233C90 00230C90  38 A0 00 01 */	li r5, 1
/* 80233C94 00230C94  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 80233C98 00230C98  4B E0 CE 3D */	bl animPoseSetAnim
lbl_80233C9C:
/* 80233C9C 00230C9C  80 7B 00 00 */	lwz r3, 0(r27)
/* 80233CA0 00230CA0  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 80233CA4 00230CA4  41 82 00 14 */	beq lbl_80233CB8
/* 80233CA8 00230CA8  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 80233CAC 00230CAC  38 00 00 20 */	li r0, 0x20
/* 80233CB0 00230CB0  90 7B 00 00 */	stw r3, 0(r27)
/* 80233CB4 00230CB4  90 1E 00 1C */	stw r0, 0x1c(r30)
lbl_80233CB8:
/* 80233CB8 00230CB8  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 80233CBC 00230CBC  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 80233CC0 00230CC0  40 80 00 0C */	bge lbl_80233CCC
/* 80233CC4 00230CC4  38 03 FF FF */	addi r0, r3, -1
/* 80233CC8 00230CC8  90 1E 00 1C */	stw r0, 0x1c(r30)
lbl_80233CCC:
/* 80233CCC 00230CCC  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 80233CD0 00230CD0  2C 00 00 00 */	cmpwi r0, 0
/* 80233CD4 00230CD4  40 80 00 20 */	bge lbl_80233CF4
/* 80233CD8 00230CD8  80 7E 00 24 */	lwz r3, 0x24(r30)
/* 80233CDC 00230CDC  2C 03 FF FF */	cmpwi r3, -1
/* 80233CE0 00230CE0  41 82 00 08 */	beq lbl_80233CE8
/* 80233CE4 00230CE4  4B E0 6F 51 */	bl animPoseRelease
lbl_80233CE8:
/* 80233CE8 00230CE8  7F 63 DB 78 */	mr r3, r27
/* 80233CEC 00230CEC  4B E2 9E 99 */	bl effDelete
/* 80233CF0 00230CF0  48 00 02 34 */	b lbl_80233F24
lbl_80233CF4:
/* 80233CF4 00230CF4  2C 00 00 20 */	cmpwi r0, 0x20
/* 80233CF8 00230CF8  40 80 00 0C */	bge lbl_80233D04
/* 80233CFC 00230CFC  54 00 1E 38 */	rlwinm r0, r0, 3, 0x18, 0x1c
/* 80233D00 00230D00  98 1E 00 14 */	stb r0, 0x14(r30)
lbl_80233D04:
/* 80233D04 00230D04  2C 1C 00 00 */	cmpwi r28, 0
/* 80233D08 00230D08  40 82 01 FC */	bne lbl_80233F04
/* 80233D0C 00230D0C  38 60 00 01 */	li r3, 1
/* 80233D10 00230D10  3B DE 00 5C */	addi r30, r30, 0x5c
/* 80233D14 00230D14  48 00 01 A8 */	b lbl_80233EBC
lbl_80233D18:
/* 80233D18 00230D18  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 80233D1C 00230D1C  2C 00 00 02 */	cmpwi r0, 2
/* 80233D20 00230D20  41 82 00 E8 */	beq lbl_80233E08
/* 80233D24 00230D24  40 80 00 14 */	bge lbl_80233D38
/* 80233D28 00230D28  2C 00 00 00 */	cmpwi r0, 0
/* 80233D2C 00230D2C  41 82 00 18 */	beq lbl_80233D44
/* 80233D30 00230D30  40 80 00 3C */	bge lbl_80233D6C
/* 80233D34 00230D34  48 00 01 80 */	b lbl_80233EB4
lbl_80233D38:
/* 80233D38 00230D38  2C 00 00 04 */	cmpwi r0, 4
/* 80233D3C 00230D3C  40 80 01 78 */	bge lbl_80233EB4
/* 80233D40 00230D40  48 00 00 F0 */	b lbl_80233E30
lbl_80233D44:
/* 80233D44 00230D44  80 9E 00 1C */	lwz r4, 0x1c(r30)
/* 80233D48 00230D48  34 04 FF FF */	addic. r0, r4, -1
/* 80233D4C 00230D4C  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233D50 00230D50  40 80 01 64 */	bge lbl_80233EB4
/* 80233D54 00230D54  38 00 00 00 */	li r0, 0
/* 80233D58 00230D58  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233D5C 00230D5C  80 9E 00 18 */	lwz r4, 0x18(r30)
/* 80233D60 00230D60  38 04 00 01 */	addi r0, r4, 1
/* 80233D64 00230D64  90 1E 00 18 */	stw r0, 0x18(r30)
/* 80233D68 00230D68  48 00 01 4C */	b lbl_80233EB4
lbl_80233D6C:
/* 80233D6C 00230D6C  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 80233D70 00230D70  2C 00 00 1E */	cmpwi r0, 0x1e
/* 80233D74 00230D74  40 80 00 78 */	bge lbl_80233DEC
/* 80233D78 00230D78  C0 02 06 28 */	lfs f0, lbl_804219A8-_SDA2_BASE_(r2)
/* 80233D7C 00230D7C  3C 00 43 30 */	lis r0, 0x4330
/* 80233D80 00230D80  C0 3E 00 10 */	lfs f1, 0x10(r30)
/* 80233D84 00230D84  C0 82 06 2C */	lfs f4, lbl_804219AC-_SDA2_BASE_(r2)
/* 80233D88 00230D88  EC 00 08 28 */	fsubs f0, f0, f1
/* 80233D8C 00230D8C  90 01 00 20 */	stw r0, 0x20(r1)
/* 80233D90 00230D90  C8 7F 00 30 */	lfd f3, 0x30(r31)
/* 80233D94 00230D94  90 01 00 28 */	stw r0, 0x28(r1)
/* 80233D98 00230D98  EC 00 09 3A */	fmadds f0, f0, f4, f1
/* 80233D9C 00230D9C  C8 3F 00 38 */	lfd f1, 0x38(r31)
/* 80233DA0 00230DA0  D0 1E 00 10 */	stfs f0, 0x10(r30)
/* 80233DA4 00230DA4  88 9E 00 14 */	lbz r4, 0x14(r30)
/* 80233DA8 00230DA8  20 04 00 80 */	subfic r0, r4, 0x80
/* 80233DAC 00230DAC  90 81 00 2C */	stw r4, 0x2c(r1)
/* 80233DB0 00230DB0  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80233DB4 00230DB4  90 01 00 24 */	stw r0, 0x24(r1)
/* 80233DB8 00230DB8  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 80233DBC 00230DBC  C8 41 00 20 */	lfd f2, 0x20(r1)
/* 80233DC0 00230DC0  EC 00 08 28 */	fsubs f0, f0, f1
/* 80233DC4 00230DC4  EC 22 18 28 */	fsubs f1, f2, f3
/* 80233DC8 00230DC8  EC 01 01 3A */	fmadds f0, f1, f4, f0
/* 80233DCC 00230DCC  FC 00 00 1E */	fctiwz f0, f0
/* 80233DD0 00230DD0  D8 01 00 30 */	stfd f0, 0x30(r1)
/* 80233DD4 00230DD4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80233DD8 00230DD8  98 1E 00 14 */	stb r0, 0x14(r30)
/* 80233DDC 00230DDC  80 9E 00 1C */	lwz r4, 0x1c(r30)
/* 80233DE0 00230DE0  38 04 00 01 */	addi r0, r4, 1
/* 80233DE4 00230DE4  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233DE8 00230DE8  48 00 00 CC */	b lbl_80233EB4
lbl_80233DEC:
/* 80233DEC 00230DEC  20 03 00 03 */	subfic r0, r3, 3
/* 80233DF0 00230DF0  1C 00 00 0A */	mulli r0, r0, 0xa
/* 80233DF4 00230DF4  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233DF8 00230DF8  80 9E 00 18 */	lwz r4, 0x18(r30)
/* 80233DFC 00230DFC  38 04 00 01 */	addi r0, r4, 1
/* 80233E00 00230E00  90 1E 00 18 */	stw r0, 0x18(r30)
/* 80233E04 00230E04  48 00 00 B0 */	b lbl_80233EB4
lbl_80233E08:
/* 80233E08 00230E08  80 9E 00 1C */	lwz r4, 0x1c(r30)
/* 80233E0C 00230E0C  34 04 FF FF */	addic. r0, r4, -1
/* 80233E10 00230E10  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233E14 00230E14  40 80 00 A0 */	bge lbl_80233EB4
/* 80233E18 00230E18  38 00 00 00 */	li r0, 0
/* 80233E1C 00230E1C  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233E20 00230E20  80 9E 00 18 */	lwz r4, 0x18(r30)
/* 80233E24 00230E24  38 04 00 01 */	addi r0, r4, 1
/* 80233E28 00230E28  90 1E 00 18 */	stw r0, 0x18(r30)
/* 80233E2C 00230E2C  48 00 00 88 */	b lbl_80233EB4
lbl_80233E30:
/* 80233E30 00230E30  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 80233E34 00230E34  2C 00 00 1E */	cmpwi r0, 0x1e
/* 80233E38 00230E38  40 80 00 78 */	bge lbl_80233EB0
/* 80233E3C 00230E3C  C0 02 06 30 */	lfs f0, lbl_804219B0-_SDA2_BASE_(r2)
/* 80233E40 00230E40  3C 00 43 30 */	lis r0, 0x4330
/* 80233E44 00230E44  C0 3E 00 10 */	lfs f1, 0x10(r30)
/* 80233E48 00230E48  C0 82 06 2C */	lfs f4, lbl_804219AC-_SDA2_BASE_(r2)
/* 80233E4C 00230E4C  EC 00 08 28 */	fsubs f0, f0, f1
/* 80233E50 00230E50  90 01 00 30 */	stw r0, 0x30(r1)
/* 80233E54 00230E54  C8 7F 00 30 */	lfd f3, 0x30(r31)
/* 80233E58 00230E58  90 01 00 28 */	stw r0, 0x28(r1)
/* 80233E5C 00230E5C  EC 00 09 3A */	fmadds f0, f0, f4, f1
/* 80233E60 00230E60  C8 3F 00 38 */	lfd f1, 0x38(r31)
/* 80233E64 00230E64  D0 1E 00 10 */	stfs f0, 0x10(r30)
/* 80233E68 00230E68  88 9E 00 14 */	lbz r4, 0x14(r30)
/* 80233E6C 00230E6C  7C 04 00 D0 */	neg r0, r4
/* 80233E70 00230E70  90 81 00 2C */	stw r4, 0x2c(r1)
/* 80233E74 00230E74  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80233E78 00230E78  90 01 00 34 */	stw r0, 0x34(r1)
/* 80233E7C 00230E7C  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 80233E80 00230E80  C8 41 00 30 */	lfd f2, 0x30(r1)
/* 80233E84 00230E84  EC 00 08 28 */	fsubs f0, f0, f1
/* 80233E88 00230E88  EC 22 18 28 */	fsubs f1, f2, f3
/* 80233E8C 00230E8C  EC 01 01 3A */	fmadds f0, f1, f4, f0
/* 80233E90 00230E90  FC 00 00 1E */	fctiwz f0, f0
/* 80233E94 00230E94  D8 01 00 20 */	stfd f0, 0x20(r1)
/* 80233E98 00230E98  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80233E9C 00230E9C  98 1E 00 14 */	stb r0, 0x14(r30)
/* 80233EA0 00230EA0  80 9E 00 1C */	lwz r4, 0x1c(r30)
/* 80233EA4 00230EA4  38 04 00 01 */	addi r0, r4, 1
/* 80233EA8 00230EA8  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 80233EAC 00230EAC  48 00 00 08 */	b lbl_80233EB4
lbl_80233EB0:
/* 80233EB0 00230EB0  3B BD 00 01 */	addi r29, r29, 1
lbl_80233EB4:
/* 80233EB4 00230EB4  38 63 00 01 */	addi r3, r3, 1
/* 80233EB8 00230EB8  3B DE 00 5C */	addi r30, r30, 0x5c
lbl_80233EBC:
/* 80233EBC 00230EBC  80 9B 00 08 */	lwz r4, 8(r27)
/* 80233EC0 00230EC0  7C 03 20 00 */	cmpw r3, r4
/* 80233EC4 00230EC4  41 80 FE 54 */	blt lbl_80233D18
/* 80233EC8 00230EC8  38 04 FF FF */	addi r0, r4, -1
/* 80233ECC 00230ECC  7C 1D 00 00 */	cmpw r29, r0
/* 80233ED0 00230ED0  41 80 00 10 */	blt lbl_80233EE0
/* 80233ED4 00230ED4  7F 63 DB 78 */	mr r3, r27
/* 80233ED8 00230ED8  4B E2 9C AD */	bl effDelete
/* 80233EDC 00230EDC  48 00 00 48 */	b lbl_80233F24
lbl_80233EE0:
/* 80233EE0 00230EE0  38 61 00 14 */	addi r3, r1, 0x14
/* 80233EE4 00230EE4  4B DD C7 DD */	bl dispCalcZ
/* 80233EE8 00230EE8  3C 60 80 23 */	lis r3, effBattenDisp@ha
/* 80233EEC 00230EEC  7F 66 DB 78 */	mr r6, r27
/* 80233EF0 00230EF0  38 A3 38 00 */	addi r5, r3, effBattenDisp@l
/* 80233EF4 00230EF4  38 80 00 02 */	li r4, 2
/* 80233EF8 00230EF8  38 60 00 04 */	li r3, 4
/* 80233EFC 00230EFC  4B DD CB 1D */	bl dispEntry
/* 80233F00 00230F00  48 00 00 24 */	b lbl_80233F24
lbl_80233F04:
/* 80233F04 00230F04  38 61 00 14 */	addi r3, r1, 0x14
/* 80233F08 00230F08  4B DD C7 B9 */	bl dispCalcZ
/* 80233F0C 00230F0C  3C 60 80 23 */	lis r3, effBattenDisp2@ha
/* 80233F10 00230F10  7F 66 DB 78 */	mr r6, r27
/* 80233F14 00230F14  38 A3 36 C4 */	addi r5, r3, effBattenDisp2@l
/* 80233F18 00230F18  38 80 00 02 */	li r4, 2
/* 80233F1C 00230F1C  38 60 00 04 */	li r3, 4
/* 80233F20 00230F20  4B DD CA F9 */	bl dispEntry
lbl_80233F24:
/* 80233F24 00230F24  BB 41 00 38 */	lmw r26, 0x38(r1)
/* 80233F28 00230F28  80 01 00 54 */	lwz r0, 0x54(r1)
/* 80233F2C 00230F2C  7C 08 03 A6 */	mtlr r0
/* 80233F30 00230F30  38 21 00 50 */	addi r1, r1, 0x50
/* 80233F34 00230F34  4E 80 00 20 */	blr 

.global effBattenEntry
effBattenEntry:
/* 80233F38 00230F38  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 80233F3C 00230F3C  7C 08 02 A6 */	mflr r0
/* 80233F40 00230F40  90 01 00 64 */	stw r0, 0x64(r1)
/* 80233F44 00230F44  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 80233F48 00230F48  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 80233F4C 00230F4C  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 80233F50 00230F50  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 80233F54 00230F54  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 80233F58 00230F58  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 80233F5C 00230F5C  DB 81 00 20 */	stfd f28, 0x20(r1)
/* 80233F60 00230F60  F3 81 00 28 */	psq_st f28, 40(r1), 0, qr0
/* 80233F64 00230F64  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80233F68 00230F68  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80233F6C 00230F6C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80233F70 00230F70  93 81 00 10 */	stw r28, 0x10(r1)
/* 80233F74 00230F74  FF 80 08 90 */	fmr f28, f1
/* 80233F78 00230F78  7C 7C 1B 78 */	mr r28, r3
/* 80233F7C 00230F7C  FF A0 10 90 */	fmr f29, f2
/* 80233F80 00230F80  7C 9D 23 78 */	mr r29, r4
/* 80233F84 00230F84  FF C0 18 90 */	fmr f30, f3
/* 80233F88 00230F88  FF E0 20 90 */	fmr f31, f4
/* 80233F8C 00230F8C  4B E2 9E 31 */	bl effEntry
/* 80233F90 00230F90  2C 1C 00 00 */	cmpwi r28, 0
/* 80233F94 00230F94  7C 7E 1B 78 */	mr r30, r3
/* 80233F98 00230F98  38 A0 00 01 */	li r5, 1
/* 80233F9C 00230F9C  40 82 00 08 */	bne lbl_80233FA4
/* 80233FA0 00230FA0  38 A0 00 04 */	li r5, 4
lbl_80233FA4:
/* 80233FA4 00230FA4  3C 80 80 30 */	lis r4, lbl_802FFA90@ha
/* 80233FA8 00230FA8  38 60 00 03 */	li r3, 3
/* 80233FAC 00230FAC  38 04 FA 90 */	addi r0, r4, lbl_802FFA90@l
/* 80233FB0 00230FB0  90 1E 00 14 */	stw r0, 0x14(r30)
/* 80233FB4 00230FB4  1C 85 00 5C */	mulli r4, r5, 0x5c
/* 80233FB8 00230FB8  90 BE 00 08 */	stw r5, 8(r30)
/* 80233FBC 00230FBC  4B DF BA D1 */	bl __memAlloc
/* 80233FC0 00230FC0  7C 7F 1B 78 */	mr r31, r3
/* 80233FC4 00230FC4  3C 60 80 23 */	lis r3, effBattenMain@ha
/* 80233FC8 00230FC8  93 FE 00 0C */	stw r31, 0xc(r30)
/* 80233FCC 00230FCC  38 63 3B 20 */	addi r3, r3, effBattenMain@l
/* 80233FD0 00230FD0  2C 1D 00 00 */	cmpwi r29, 0
/* 80233FD4 00230FD4  38 00 00 FF */	li r0, 0xff
/* 80233FD8 00230FD8  90 7E 00 10 */	stw r3, 0x10(r30)
/* 80233FDC 00230FDC  80 7E 00 00 */	lwz r3, 0(r30)
/* 80233FE0 00230FE0  60 63 00 02 */	ori r3, r3, 2
/* 80233FE4 00230FE4  90 7E 00 00 */	stw r3, 0(r30)
/* 80233FE8 00230FE8  93 9F 00 00 */	stw r28, 0(r31)
/* 80233FEC 00230FEC  D3 9F 00 04 */	stfs f28, 4(r31)
/* 80233FF0 00230FF0  D3 BF 00 08 */	stfs f29, 8(r31)
/* 80233FF4 00230FF4  D3 DF 00 0C */	stfs f30, 0xc(r31)
/* 80233FF8 00230FF8  D3 FF 00 10 */	stfs f31, 0x10(r31)
/* 80233FFC 00230FFC  98 1F 00 14 */	stb r0, 0x14(r31)
/* 80234000 00231000  41 81 00 10 */	bgt lbl_80234010
/* 80234004 00231004  38 00 03 E8 */	li r0, 0x3e8
/* 80234008 00231008  90 1F 00 1C */	stw r0, 0x1c(r31)
/* 8023400C 0023100C  48 00 00 08 */	b lbl_80234014
lbl_80234010:
/* 80234010 00231010  93 BF 00 1C */	stw r29, 0x1c(r31)
lbl_80234014:
/* 80234014 00231014  38 00 FF FF */	li r0, -1
/* 80234018 00231018  38 7F 00 28 */	addi r3, r31, 0x28
/* 8023401C 0023101C  90 1F 00 24 */	stw r0, 0x24(r31)
/* 80234020 00231020  48 06 3E E1 */	bl PSMTXIdentity
/* 80234024 00231024  C0 22 06 0C */	lfs f1, lbl_8042198C-_SDA2_BASE_(r2)
/* 80234028 00231028  38 9F 00 5C */	addi r4, r31, 0x5c
/* 8023402C 0023102C  C0 02 06 34 */	lfs f0, lbl_804219B4-_SDA2_BASE_(r2)
/* 80234030 00231030  38 A0 00 01 */	li r5, 1
/* 80234034 00231034  38 60 00 00 */	li r3, 0
/* 80234038 00231038  48 00 00 30 */	b lbl_80234068
lbl_8023403C:
/* 8023403C 0023103C  D0 24 00 04 */	stfs f1, 4(r4)
/* 80234040 00231040  38 05 FF FF */	addi r0, r5, -1
/* 80234044 00231044  1C 00 00 0A */	mulli r0, r0, 0xa
/* 80234048 00231048  38 A5 00 01 */	addi r5, r5, 1
/* 8023404C 0023104C  D0 24 00 08 */	stfs f1, 8(r4)
/* 80234050 00231050  D0 24 00 0C */	stfs f1, 0xc(r4)
/* 80234054 00231054  98 64 00 14 */	stb r3, 0x14(r4)
/* 80234058 00231058  D0 04 00 10 */	stfs f0, 0x10(r4)
/* 8023405C 0023105C  90 64 00 18 */	stw r3, 0x18(r4)
/* 80234060 00231060  90 04 00 1C */	stw r0, 0x1c(r4)
/* 80234064 00231064  38 84 00 5C */	addi r4, r4, 0x5c
lbl_80234068:
/* 80234068 00231068  80 1E 00 08 */	lwz r0, 8(r30)
/* 8023406C 0023106C  7C 05 00 00 */	cmpw r5, r0
/* 80234070 00231070  41 80 FF CC */	blt lbl_8023403C
/* 80234074 00231074  7F C3 F3 78 */	mr r3, r30
/* 80234078 00231078  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 8023407C 0023107C  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 80234080 00231080  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 80234084 00231084  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 80234088 00231088  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 8023408C 0023108C  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 80234090 00231090  E3 81 00 28 */	psq_l f28, 40(r1), 0, qr0
/* 80234094 00231094  CB 81 00 20 */	lfd f28, 0x20(r1)
/* 80234098 00231098  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8023409C 0023109C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 802340A0 002310A0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 802340A4 002310A4  80 01 00 64 */	lwz r0, 0x64(r1)
/* 802340A8 002310A8  83 81 00 10 */	lwz r28, 0x10(r1)
/* 802340AC 002310AC  7C 08 03 A6 */	mtlr r0
/* 802340B0 002310B0  38 21 00 60 */	addi r1, r1, 0x60
/* 802340B4 002310B4  4E 80 00 20 */	blr 