.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global lect_juyoitem_rel_get
lect_juyoitem_rel_get:
/* 802515F8 0024E5F8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802515FC 0024E5FC  7C 08 02 A6 */	mflr r0
/* 80251600 0024E600  90 01 00 14 */	stw r0, 0x14(r1)
/* 80251604 0024E604  80 83 00 18 */	lwz r4, 0x18(r3)
/* 80251608 0024E608  80 AD 19 50 */	lwz r5, lbl_80418BB0@sda21(r13)
/* 8025160C 0024E60C  80 84 00 00 */	lwz r4, 0(r4)
/* 80251610 0024E610  4B DD F0 59 */	bl evtSetValue
/* 80251614 0024E614  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80251618 0024E618  38 60 00 02 */	li r3, 2
/* 8025161C 0024E61C  7C 08 03 A6 */	mtlr r0
/* 80251620 0024E620  38 21 00 10 */	addi r1, r1, 0x10
/* 80251624 0024E624  4E 80 00 20 */	blr 

.global lect_juyoitem_rel_set
lect_juyoitem_rel_set:
/* 80251628 0024E628  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8025162C 0024E62C  7C 08 02 A6 */	mflr r0
/* 80251630 0024E630  90 01 00 14 */	stw r0, 0x14(r1)
/* 80251634 0024E634  80 83 00 18 */	lwz r4, 0x18(r3)
/* 80251638 0024E638  80 84 00 00 */	lwz r4, 0(r4)
/* 8025163C 0024E63C  4B DD F5 91 */	bl evtGetValue
/* 80251640 0024E640  90 6D 19 50 */	stw r3, lbl_80418BB0@sda21(r13)
/* 80251644 0024E644  38 60 00 02 */	li r3, 2
/* 80251648 0024E648  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8025164C 0024E64C  7C 08 03 A6 */	mtlr r0
/* 80251650 0024E650  38 21 00 10 */	addi r1, r1, 0x10
/* 80251654 0024E654  4E 80 00 20 */	blr 

.global lect_cam_load
lect_cam_load:
/* 80251658 0024E658  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8025165C 0024E65C  7C 08 02 A6 */	mflr r0
/* 80251660 0024E660  90 01 00 24 */	stw r0, 0x24(r1)
/* 80251664 0024E664  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80251668 0024E668  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8025166C 0024E66C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80251670 0024E670  93 81 00 10 */	stw r28, 0x10(r1)
/* 80251674 0024E674  80 83 00 18 */	lwz r4, 0x18(r3)
/* 80251678 0024E678  80 84 00 00 */	lwz r4, 0(r4)
/* 8025167C 0024E67C  4B DD F5 51 */	bl evtGetValue
/* 80251680 0024E680  7C 7C 1B 78 */	mr r28, r3
/* 80251684 0024E684  38 60 00 04 */	li r3, 4
/* 80251688 0024E688  4B DB DA C9 */	bl camGetPtr
/* 8025168C 0024E68C  7C 7D 1B 78 */	mr r29, r3
/* 80251690 0024E690  4B E0 BB 85 */	bl marioGetPtr
/* 80251694 0024E694  7C 7E 1B 78 */	mr r30, r3
/* 80251698 0024E698  4B EE A3 C1 */	bl marioGetPartyId
/* 8025169C 0024E69C  4B E6 B7 95 */	bl partyGetPtr
/* 802516A0 0024E6A0  7C 7F 1B 78 */	mr r31, r3
/* 802516A4 0024E6A4  4B EE A3 1D */	bl marioGetExtraPartyId
/* 802516A8 0024E6A8  4B E6 B7 89 */	bl partyGetPtr
/* 802516AC 0024E6AC  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 802516B0 0024E6B0  3C 80 10 62 */	lis r4, 0x10624DD3@ha
/* 802516B4 0024E6B4  81 1D 00 10 */	lwz r8, 0x10(r29)
/* 802516B8 0024E6B8  3C C0 80 00 */	lis r6, 0x800000F8@ha
/* 802516BC 0024E6BC  38 E4 4D D3 */	addi r7, r4, 0x10624DD3@l
/* 802516C0 0024E6C0  38 A0 00 00 */	li r5, 0
/* 802516C4 0024E6C4  90 1D 00 58 */	stw r0, 0x58(r29)
/* 802516C8 0024E6C8  38 80 00 03 */	li r4, 3
/* 802516CC 0024E6CC  38 00 00 0B */	li r0, 0xb
/* 802516D0 0024E6D0  28 1F 00 00 */	cmplwi r31, 0
/* 802516D4 0024E6D4  91 1D 00 5C */	stw r8, 0x5c(r29)
/* 802516D8 0024E6D8  81 1D 00 14 */	lwz r8, 0x14(r29)
/* 802516DC 0024E6DC  91 1D 00 60 */	stw r8, 0x60(r29)
/* 802516E0 0024E6E0  81 3D 00 18 */	lwz r9, 0x18(r29)
/* 802516E4 0024E6E4  81 1D 00 1C */	lwz r8, 0x1c(r29)
/* 802516E8 0024E6E8  91 3D 00 64 */	stw r9, 0x64(r29)
/* 802516EC 0024E6EC  91 1D 00 68 */	stw r8, 0x68(r29)
/* 802516F0 0024E6F0  81 1D 00 20 */	lwz r8, 0x20(r29)
/* 802516F4 0024E6F4  91 1D 00 6C */	stw r8, 0x6c(r29)
/* 802516F8 0024E6F8  81 2D 19 B4 */	lwz r9, lbl_80418C14@sda21(r13)
/* 802516FC 0024E6FC  81 0D 19 B8 */	lwz r8, lbl_80418C18@sda21(r13)
/* 80251700 0024E700  91 3D 00 40 */	stw r9, 0x40(r29)
/* 80251704 0024E704  91 1D 00 44 */	stw r8, 0x44(r29)
/* 80251708 0024E708  81 0D 19 BC */	lwz r8, lbl_80418C1C@sda21(r13)
/* 8025170C 0024E70C  91 1D 00 48 */	stw r8, 0x48(r29)
/* 80251710 0024E710  81 2D 19 A8 */	lwz r9, lbl_80418C08@sda21(r13)
/* 80251714 0024E714  81 0D 19 AC */	lwz r8, lbl_80418C0C@sda21(r13)
/* 80251718 0024E718  91 3D 00 4C */	stw r9, 0x4c(r29)
/* 8025171C 0024E71C  91 1D 00 50 */	stw r8, 0x50(r29)
/* 80251720 0024E720  81 0D 19 B0 */	lwz r8, lbl_80418C10@sda21(r13)
/* 80251724 0024E724  91 1D 00 54 */	stw r8, 0x54(r29)
/* 80251728 0024E728  81 2D 90 B0 */	lwz r9, gp@sda21(r13)
/* 8025172C 0024E72C  81 09 00 38 */	lwz r8, 0x38(r9)
/* 80251730 0024E730  81 29 00 3C */	lwz r9, 0x3c(r9)
/* 80251734 0024E734  91 3D 00 74 */	stw r9, 0x74(r29)
/* 80251738 0024E738  91 1D 00 70 */	stw r8, 0x70(r29)
/* 8025173C 0024E73C  80 C6 00 F8 */	lwz r6, 0x800000F8@l(r6)
/* 80251740 0024E740  54 C6 F0 BE */	srwi r6, r6, 2
/* 80251744 0024E744  7C C7 30 16 */	mulhwu r6, r7, r6
/* 80251748 0024E748  54 C6 D1 BE */	srwi r6, r6, 6
/* 8025174C 0024E74C  7C DC 31 D6 */	mullw r6, r28, r6
/* 80251750 0024E750  90 DD 00 7C */	stw r6, 0x7c(r29)
/* 80251754 0024E754  90 BD 00 78 */	stw r5, 0x78(r29)
/* 80251758 0024E758  B0 9D 00 04 */	sth r4, 4(r29)
/* 8025175C 0024E75C  98 1D 00 80 */	stb r0, 0x80(r29)
/* 80251760 0024E760  80 8D 19 9C */	lwz r4, lbl_80418BFC@sda21(r13)
/* 80251764 0024E764  80 0D 19 A0 */	lwz r0, lbl_80418C00@sda21(r13)
/* 80251768 0024E768  90 9E 00 8C */	stw r4, 0x8c(r30)
/* 8025176C 0024E76C  90 1E 00 90 */	stw r0, 0x90(r30)
/* 80251770 0024E770  80 0D 19 A4 */	lwz r0, lbl_80418C04@sda21(r13)
/* 80251774 0024E774  90 1E 00 94 */	stw r0, 0x94(r30)
/* 80251778 0024E778  C0 0D 19 80 */	lfs f0, lbl_80418BE0@sda21(r13)
/* 8025177C 0024E77C  D0 1E 01 A8 */	stfs f0, 0x1a8(r30)
/* 80251780 0024E780  C0 0D 19 7C */	lfs f0, lbl_80418BDC@sda21(r13)
/* 80251784 0024E784  D0 1E 01 AC */	stfs f0, 0x1ac(r30)
/* 80251788 0024E788  C0 0D 19 78 */	lfs f0, lbl_80418BD8@sda21(r13)
/* 8025178C 0024E78C  D0 1E 01 A0 */	stfs f0, 0x1a0(r30)
/* 80251790 0024E790  C0 0D 19 74 */	lfs f0, lbl_80418BD4@sda21(r13)
/* 80251794 0024E794  D0 1E 01 9C */	stfs f0, 0x19c(r30)
/* 80251798 0024E798  41 82 00 3C */	beq lbl_802517D4
/* 8025179C 0024E79C  80 8D 19 90 */	lwz r4, lbl_80418BF0@sda21(r13)
/* 802517A0 0024E7A0  80 0D 19 94 */	lwz r0, lbl_80418BF4@sda21(r13)
/* 802517A4 0024E7A4  90 9F 00 58 */	stw r4, 0x58(r31)
/* 802517A8 0024E7A8  90 1F 00 5C */	stw r0, 0x5c(r31)
/* 802517AC 0024E7AC  80 0D 19 98 */	lwz r0, lbl_80418BF8@sda21(r13)
/* 802517B0 0024E7B0  90 1F 00 60 */	stw r0, 0x60(r31)
/* 802517B4 0024E7B4  C0 0D 19 70 */	lfs f0, lbl_80418BD0@sda21(r13)
/* 802517B8 0024E7B8  D0 1F 01 0C */	stfs f0, 0x10c(r31)
/* 802517BC 0024E7BC  C0 0D 19 6C */	lfs f0, lbl_80418BCC@sda21(r13)
/* 802517C0 0024E7C0  D0 1F 01 10 */	stfs f0, 0x110(r31)
/* 802517C4 0024E7C4  C0 0D 19 68 */	lfs f0, lbl_80418BC8@sda21(r13)
/* 802517C8 0024E7C8  D0 1F 01 00 */	stfs f0, 0x100(r31)
/* 802517CC 0024E7CC  C0 0D 19 64 */	lfs f0, lbl_80418BC4@sda21(r13)
/* 802517D0 0024E7D0  D0 1F 00 FC */	stfs f0, 0xfc(r31)
lbl_802517D4:
/* 802517D4 0024E7D4  28 03 00 00 */	cmplwi r3, 0
/* 802517D8 0024E7D8  41 82 00 3C */	beq lbl_80251814
/* 802517DC 0024E7DC  80 8D 19 84 */	lwz r4, lbl_80418BE4@sda21(r13)
/* 802517E0 0024E7E0  80 0D 19 88 */	lwz r0, lbl_80418BE8@sda21(r13)
/* 802517E4 0024E7E4  90 83 00 58 */	stw r4, 0x58(r3)
/* 802517E8 0024E7E8  90 03 00 5C */	stw r0, 0x5c(r3)
/* 802517EC 0024E7EC  80 0D 19 8C */	lwz r0, lbl_80418BEC@sda21(r13)
/* 802517F0 0024E7F0  90 03 00 60 */	stw r0, 0x60(r3)
/* 802517F4 0024E7F4  C0 0D 19 60 */	lfs f0, lbl_80418BC0@sda21(r13)
/* 802517F8 0024E7F8  D0 03 01 0C */	stfs f0, 0x10c(r3)
/* 802517FC 0024E7FC  C0 0D 19 5C */	lfs f0, lbl_80418BBC@sda21(r13)
/* 80251800 0024E800  D0 03 01 10 */	stfs f0, 0x110(r3)
/* 80251804 0024E804  C0 0D 19 58 */	lfs f0, lbl_80418BB8@sda21(r13)
/* 80251808 0024E808  D0 03 01 00 */	stfs f0, 0x100(r3)
/* 8025180C 0024E80C  C0 0D 19 54 */	lfs f0, lbl_80418BB4@sda21(r13)
/* 80251810 0024E810  D0 03 00 FC */	stfs f0, 0xfc(r3)
lbl_80251814:
/* 80251814 0024E814  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80251818 0024E818  38 60 00 02 */	li r3, 2
/* 8025181C 0024E81C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80251820 0024E820  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80251824 0024E824  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80251828 0024E828  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8025182C 0024E82C  7C 08 03 A6 */	mtlr r0
/* 80251830 0024E830  38 21 00 20 */	addi r1, r1, 0x20
/* 80251834 0024E834  4E 80 00 20 */	blr 

.global lect_cam_save
lect_cam_save:
/* 80251838 0024E838  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8025183C 0024E83C  7C 08 02 A6 */	mflr r0
/* 80251840 0024E840  38 60 00 04 */	li r3, 4
/* 80251844 0024E844  90 01 00 24 */	stw r0, 0x24(r1)
/* 80251848 0024E848  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8025184C 0024E84C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80251850 0024E850  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80251854 0024E854  4B DB D8 FD */	bl camGetPtr
/* 80251858 0024E858  7C 7D 1B 78 */	mr r29, r3
/* 8025185C 0024E85C  4B E0 B9 B9 */	bl marioGetPtr
/* 80251860 0024E860  7C 7E 1B 78 */	mr r30, r3
/* 80251864 0024E864  4B EE A1 F5 */	bl marioGetPartyId
/* 80251868 0024E868  4B E6 B5 C9 */	bl partyGetPtr
/* 8025186C 0024E86C  7C 7F 1B 78 */	mr r31, r3
/* 80251870 0024E870  4B EE A1 51 */	bl marioGetExtraPartyId
/* 80251874 0024E874  4B E6 B5 BD */	bl partyGetPtr
/* 80251878 0024E878  80 9D 00 0C */	lwz r4, 0xc(r29)
/* 8025187C 0024E87C  28 1F 00 00 */	cmplwi r31, 0
/* 80251880 0024E880  80 1D 00 10 */	lwz r0, 0x10(r29)
/* 80251884 0024E884  90 8D 19 B4 */	stw r4, lbl_80418C14@sda21(r13)
/* 80251888 0024E888  90 0D 19 B8 */	stw r0, lbl_80418C18@sda21(r13)
/* 8025188C 0024E88C  80 1D 00 14 */	lwz r0, 0x14(r29)
/* 80251890 0024E890  90 0D 19 BC */	stw r0, lbl_80418C1C@sda21(r13)
/* 80251894 0024E894  80 9D 00 18 */	lwz r4, 0x18(r29)
/* 80251898 0024E898  80 1D 00 1C */	lwz r0, 0x1c(r29)
/* 8025189C 0024E89C  90 8D 19 A8 */	stw r4, lbl_80418C08@sda21(r13)
/* 802518A0 0024E8A0  90 0D 19 AC */	stw r0, lbl_80418C0C@sda21(r13)
/* 802518A4 0024E8A4  80 1D 00 20 */	lwz r0, 0x20(r29)
/* 802518A8 0024E8A8  90 0D 19 B0 */	stw r0, lbl_80418C10@sda21(r13)
/* 802518AC 0024E8AC  80 9E 00 8C */	lwz r4, 0x8c(r30)
/* 802518B0 0024E8B0  80 1E 00 90 */	lwz r0, 0x90(r30)
/* 802518B4 0024E8B4  90 8D 19 9C */	stw r4, lbl_80418BFC@sda21(r13)
/* 802518B8 0024E8B8  90 0D 19 A0 */	stw r0, lbl_80418C00@sda21(r13)
/* 802518BC 0024E8BC  80 1E 00 94 */	lwz r0, 0x94(r30)
/* 802518C0 0024E8C0  90 0D 19 A4 */	stw r0, lbl_80418C04@sda21(r13)
/* 802518C4 0024E8C4  C0 1E 01 A8 */	lfs f0, 0x1a8(r30)
/* 802518C8 0024E8C8  D0 0D 19 80 */	stfs f0, lbl_80418BE0@sda21(r13)
/* 802518CC 0024E8CC  C0 1E 01 AC */	lfs f0, 0x1ac(r30)
/* 802518D0 0024E8D0  D0 0D 19 7C */	stfs f0, lbl_80418BDC@sda21(r13)
/* 802518D4 0024E8D4  C0 1E 01 A0 */	lfs f0, 0x1a0(r30)
/* 802518D8 0024E8D8  D0 0D 19 78 */	stfs f0, lbl_80418BD8@sda21(r13)
/* 802518DC 0024E8DC  C0 1E 01 9C */	lfs f0, 0x19c(r30)
/* 802518E0 0024E8E0  D0 0D 19 74 */	stfs f0, lbl_80418BD4@sda21(r13)
/* 802518E4 0024E8E4  41 82 00 3C */	beq lbl_80251920
/* 802518E8 0024E8E8  80 9F 00 58 */	lwz r4, 0x58(r31)
/* 802518EC 0024E8EC  80 1F 00 5C */	lwz r0, 0x5c(r31)
/* 802518F0 0024E8F0  90 8D 19 90 */	stw r4, lbl_80418BF0@sda21(r13)
/* 802518F4 0024E8F4  90 0D 19 94 */	stw r0, lbl_80418BF4@sda21(r13)
/* 802518F8 0024E8F8  80 1F 00 60 */	lwz r0, 0x60(r31)
/* 802518FC 0024E8FC  90 0D 19 98 */	stw r0, lbl_80418BF8@sda21(r13)
/* 80251900 0024E900  C0 1F 01 0C */	lfs f0, 0x10c(r31)
/* 80251904 0024E904  D0 0D 19 70 */	stfs f0, lbl_80418BD0@sda21(r13)
/* 80251908 0024E908  C0 1F 01 10 */	lfs f0, 0x110(r31)
/* 8025190C 0024E90C  D0 0D 19 6C */	stfs f0, lbl_80418BCC@sda21(r13)
/* 80251910 0024E910  C0 1F 01 00 */	lfs f0, 0x100(r31)
/* 80251914 0024E914  D0 0D 19 68 */	stfs f0, lbl_80418BC8@sda21(r13)
/* 80251918 0024E918  C0 1F 00 FC */	lfs f0, 0xfc(r31)
/* 8025191C 0024E91C  D0 0D 19 64 */	stfs f0, lbl_80418BC4@sda21(r13)
lbl_80251920:
/* 80251920 0024E920  28 03 00 00 */	cmplwi r3, 0
/* 80251924 0024E924  41 82 00 3C */	beq lbl_80251960
/* 80251928 0024E928  80 83 00 58 */	lwz r4, 0x58(r3)
/* 8025192C 0024E92C  80 03 00 5C */	lwz r0, 0x5c(r3)
/* 80251930 0024E930  90 8D 19 84 */	stw r4, lbl_80418BE4@sda21(r13)
/* 80251934 0024E934  90 0D 19 88 */	stw r0, lbl_80418BE8@sda21(r13)
/* 80251938 0024E938  80 03 00 60 */	lwz r0, 0x60(r3)
/* 8025193C 0024E93C  90 0D 19 8C */	stw r0, lbl_80418BEC@sda21(r13)
/* 80251940 0024E940  C0 03 01 0C */	lfs f0, 0x10c(r3)
/* 80251944 0024E944  D0 0D 19 60 */	stfs f0, lbl_80418BC0@sda21(r13)
/* 80251948 0024E948  C0 03 01 10 */	lfs f0, 0x110(r3)
/* 8025194C 0024E94C  D0 0D 19 5C */	stfs f0, lbl_80418BBC@sda21(r13)
/* 80251950 0024E950  C0 03 01 00 */	lfs f0, 0x100(r3)
/* 80251954 0024E954  D0 0D 19 58 */	stfs f0, lbl_80418BB8@sda21(r13)
/* 80251958 0024E958  C0 03 00 FC */	lfs f0, 0xfc(r3)
/* 8025195C 0024E95C  D0 0D 19 54 */	stfs f0, lbl_80418BB4@sda21(r13)
lbl_80251960:
/* 80251960 0024E960  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80251964 0024E964  38 60 00 02 */	li r3, 2
/* 80251968 0024E968  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8025196C 0024E96C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80251970 0024E970  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80251974 0024E974  7C 08 03 A6 */	mtlr r0
/* 80251978 0024E978  38 21 00 20 */	addi r1, r1, 0x20
/* 8025197C 0024E97C  4E 80 00 20 */	blr 

.global lect_test_systemlevel
lect_test_systemlevel:
/* 80251980 0024E980  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80251984 0024E984  7C 08 02 A6 */	mflr r0
/* 80251988 0024E988  90 01 00 14 */	stw r0, 0x14(r1)
/* 8025198C 0024E98C  4B E1 CB C1 */	bl marioStGetSystemLevel
/* 80251990 0024E990  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80251994 0024E994  38 60 00 02 */	li r3, 2
/* 80251998 0024E998  7C 08 03 A6 */	mtlr r0
/* 8025199C 0024E99C  38 21 00 10 */	addi r1, r1, 0x10
/* 802519A0 0024E9A0  4E 80 00 20 */	blr 

.global lect_set_systemlevel
lect_set_systemlevel:
/* 802519A4 0024E9A4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 802519A8 0024E9A8  7C 08 02 A6 */	mflr r0
/* 802519AC 0024E9AC  90 01 00 14 */	stw r0, 0x14(r1)
/* 802519B0 0024E9B0  80 83 00 18 */	lwz r4, 0x18(r3)
/* 802519B4 0024E9B4  80 84 00 00 */	lwz r4, 0(r4)
/* 802519B8 0024E9B8  4B DD F2 15 */	bl evtGetValue
/* 802519BC 0024E9BC  4B E1 CB 9D */	bl marioStSystemLevel
/* 802519C0 0024E9C0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 802519C4 0024E9C4  38 60 00 02 */	li r3, 2
/* 802519C8 0024E9C8  7C 08 03 A6 */	mtlr r0
/* 802519CC 0024E9CC  38 21 00 10 */	addi r1, r1, 0x10
/* 802519D0 0024E9D0  4E 80 00 20 */	blr 
