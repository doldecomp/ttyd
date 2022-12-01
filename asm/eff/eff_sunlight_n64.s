.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effSunlightDisp
effSunlightDisp:
/* 801E8514 001E5514  94 21 FE 90 */	stwu r1, -0x170(r1)
/* 801E8518 001E5518  7C 08 02 A6 */	mflr r0
/* 801E851C 001E551C  90 01 01 74 */	stw r0, 0x174(r1)
/* 801E8520 001E5520  DB E1 01 60 */	stfd f31, 0x160(r1)
/* 801E8524 001E5524  F3 E1 01 68 */	psq_st f31, 360(r1), 0, qr0
/* 801E8528 001E5528  93 E1 01 5C */	stw r31, 0x15c(r1)
/* 801E852C 001E552C  93 C1 01 58 */	stw r30, 0x158(r1)
/* 801E8530 001E5530  93 A1 01 54 */	stw r29, 0x154(r1)
/* 801E8534 001E5534  93 81 01 50 */	stw r28, 0x150(r1)
/* 801E8538 001E5538  3C A0 80 30 */	lis r5, lbl_802FB7C8@ha
/* 801E853C 001E553C  7C 9C 23 78 */	mr r28, r4
/* 801E8540 001E5540  3B E5 B7 C8 */	addi r31, r5, lbl_802FB7C8@l
/* 801E8544 001E5544  4B E2 6C 0D */	bl camGetPtr
/* 801E8548 001E5548  83 DC 00 0C */	lwz r30, 0xc(r28)
/* 801E854C 001E554C  81 5F 00 0C */	lwz r10, 0xc(r31)
/* 801E8550 001E5550  83 BE 00 38 */	lwz r29, 0x38(r30)
/* 801E8554 001E5554  83 9E 00 00 */	lwz r28, 0(r30)
/* 801E8558 001E5558  81 3F 00 10 */	lwz r9, 0x10(r31)
/* 801E855C 001E555C  2C 1D 00 00 */	cmpwi r29, 0
/* 801E8560 001E5560  81 1F 00 14 */	lwz r8, 0x14(r31)
/* 801E8564 001E5564  80 FF 00 18 */	lwz r7, 0x18(r31)
/* 801E8568 001E5568  80 DF 00 1C */	lwz r6, 0x1c(r31)
/* 801E856C 001E556C  80 BF 00 20 */	lwz r5, 0x20(r31)
/* 801E8570 001E5570  80 9F 00 24 */	lwz r4, 0x24(r31)
/* 801E8574 001E5574  80 7F 00 28 */	lwz r3, 0x28(r31)
/* 801E8578 001E5578  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 801E857C 001E557C  91 41 00 30 */	stw r10, 0x30(r1)
/* 801E8580 001E5580  91 21 00 34 */	stw r9, 0x34(r1)
/* 801E8584 001E5584  91 01 00 38 */	stw r8, 0x38(r1)
/* 801E8588 001E5588  90 E1 00 24 */	stw r7, 0x24(r1)
/* 801E858C 001E558C  90 C1 00 28 */	stw r6, 0x28(r1)
/* 801E8590 001E5590  90 A1 00 2C */	stw r5, 0x2c(r1)
/* 801E8594 001E5594  90 81 00 18 */	stw r4, 0x18(r1)
/* 801E8598 001E5598  90 61 00 1C */	stw r3, 0x1c(r1)
/* 801E859C 001E559C  90 01 00 20 */	stw r0, 0x20(r1)
/* 801E85A0 001E55A0  41 82 05 68 */	beq lbl_801E8B08
/* 801E85A4 001E55A4  38 61 00 3C */	addi r3, r1, 0x3c
/* 801E85A8 001E55A8  48 0C BF 09 */	bl GXGetProjectionv
/* 801E85AC 001E55AC  2C 1C 00 00 */	cmpwi r28, 0
/* 801E85B0 001E55B0  41 82 00 28 */	beq lbl_801E85D8
/* 801E85B4 001E55B4  C0 22 EB E0 */	lfs f1, lbl_8041FF60@sda21(r2)
/* 801E85B8 001E55B8  38 61 00 A8 */	addi r3, r1, 0xa8
/* 801E85BC 001E55BC  C0 42 EB E4 */	lfs f2, lbl_8041FF64@sda21(r2)
/* 801E85C0 001E55C0  C0 62 EB E8 */	lfs f3, lbl_8041FF68@sda21(r2)
/* 801E85C4 001E55C4  C0 82 EB EC */	lfs f4, lbl_8041FF6C@sda21(r2)
/* 801E85C8 001E55C8  C0 A2 EB F0 */	lfs f5, lbl_8041FF70@sda21(r2)
/* 801E85CC 001E55CC  C0 C2 EB F4 */	lfs f6, lbl_8041FF74@sda21(r2)
/* 801E85D0 001E55D0  48 0B 04 E5 */	bl C_MTXOrtho
/* 801E85D4 001E55D4  48 00 00 24 */	b lbl_801E85F8
lbl_801E85D8:
/* 801E85D8 001E55D8  C0 22 EB E0 */	lfs f1, lbl_8041FF60@sda21(r2)
/* 801E85DC 001E55DC  38 61 00 A8 */	addi r3, r1, 0xa8
/* 801E85E0 001E55E0  C0 42 EB E4 */	lfs f2, lbl_8041FF64@sda21(r2)
/* 801E85E4 001E55E4  C0 62 EB EC */	lfs f3, lbl_8041FF6C@sda21(r2)
/* 801E85E8 001E55E8  C0 82 EB E8 */	lfs f4, lbl_8041FF68@sda21(r2)
/* 801E85EC 001E55EC  C0 A2 EB F0 */	lfs f5, lbl_8041FF70@sda21(r2)
/* 801E85F0 001E55F0  C0 C2 EB F4 */	lfs f6, lbl_8041FF74@sda21(r2)
/* 801E85F4 001E55F4  48 0B 04 C1 */	bl C_MTXOrtho
lbl_801E85F8:
/* 801E85F8 001E55F8  38 61 00 A8 */	addi r3, r1, 0xa8
/* 801E85FC 001E55FC  38 80 00 01 */	li r4, 1
/* 801E8600 001E5600  48 0C BD 81 */	bl GXSetProjection
/* 801E8604 001E5604  38 61 00 78 */	addi r3, r1, 0x78
/* 801E8608 001E5608  38 81 00 24 */	addi r4, r1, 0x24
/* 801E860C 001E560C  38 A1 00 18 */	addi r5, r1, 0x18
/* 801E8610 001E5610  38 C1 00 30 */	addi r6, r1, 0x30
/* 801E8614 001E5614  48 0A FF 19 */	bl C_MTXLookAt
/* 801E8618 001E5618  38 61 00 78 */	addi r3, r1, 0x78
/* 801E861C 001E561C  38 80 00 00 */	li r4, 0
/* 801E8620 001E5620  48 0C BE D9 */	bl GXLoadPosMtxImm
/* 801E8624 001E5624  38 60 00 00 */	li r3, 0
/* 801E8628 001E5628  48 0C BF 71 */	bl GXSetCurrentMtx
/* 801E862C 001E562C  80 62 1F 10 */	lwz r3, lbl_80423290@sda21(r2)
/* 801E8630 001E5630  7F A0 0E 70 */	srawi r0, r29, 1
/* 801E8634 001E5634  88 FE 00 18 */	lbz r7, 0x18(r30)
/* 801E8638 001E5638  38 81 00 14 */	addi r4, r1, 0x14
/* 801E863C 001E563C  90 61 00 10 */	stw r3, 0x10(r1)
/* 801E8640 001E5640  38 60 00 01 */	li r3, 1
/* 801E8644 001E5644  88 DE 00 19 */	lbz r6, 0x19(r30)
/* 801E8648 001E5648  88 BE 00 1A */	lbz r5, 0x1a(r30)
/* 801E864C 001E564C  98 E1 00 10 */	stb r7, 0x10(r1)
/* 801E8650 001E5650  98 C1 00 11 */	stb r6, 0x11(r1)
/* 801E8654 001E5654  98 A1 00 12 */	stb r5, 0x12(r1)
/* 801E8658 001E5658  98 01 00 13 */	stb r0, 0x13(r1)
/* 801E865C 001E565C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801E8660 001E5660  90 01 00 14 */	stw r0, 0x14(r1)
/* 801E8664 001E5664  48 0C A6 51 */	bl GXSetTevColor
/* 801E8668 001E5668  80 02 1F 14 */	lwz r0, lbl_80423294@sda21(r2)
/* 801E866C 001E566C  38 81 00 0C */	addi r4, r1, 0xc
/* 801E8670 001E5670  88 FE 00 1B */	lbz r7, 0x1b(r30)
/* 801E8674 001E5674  38 60 00 02 */	li r3, 2
/* 801E8678 001E5678  90 01 00 08 */	stw r0, 8(r1)
/* 801E867C 001E567C  88 DE 00 1C */	lbz r6, 0x1c(r30)
/* 801E8680 001E5680  88 BE 00 1D */	lbz r5, 0x1d(r30)
/* 801E8684 001E5684  88 1E 00 1E */	lbz r0, 0x1e(r30)
/* 801E8688 001E5688  98 E1 00 08 */	stb r7, 8(r1)
/* 801E868C 001E568C  98 C1 00 09 */	stb r6, 9(r1)
/* 801E8690 001E5690  98 A1 00 0A */	stb r5, 0xa(r1)
/* 801E8694 001E5694  98 01 00 0B */	stb r0, 0xb(r1)
/* 801E8698 001E5698  80 01 00 08 */	lwz r0, 8(r1)
/* 801E869C 001E569C  90 01 00 0C */	stw r0, 0xc(r1)
/* 801E86A0 001E56A0  48 0C A6 15 */	bl GXSetTevColor
/* 801E86A4 001E56A4  38 60 00 01 */	li r3, 1
/* 801E86A8 001E56A8  48 0C 8A 91 */	bl GXSetNumChans
/* 801E86AC 001E56AC  38 60 00 04 */	li r3, 4
/* 801E86B0 001E56B0  38 80 00 00 */	li r4, 0
/* 801E86B4 001E56B4  38 A0 00 00 */	li r5, 0
/* 801E86B8 001E56B8  38 C0 00 01 */	li r6, 1
/* 801E86BC 001E56BC  38 E0 00 00 */	li r7, 0
/* 801E86C0 001E56C0  39 00 00 00 */	li r8, 0
/* 801E86C4 001E56C4  39 20 00 02 */	li r9, 2
/* 801E86C8 001E56C8  48 0C 8A AD */	bl GXSetChanCtrl
/* 801E86CC 001E56CC  38 60 00 03 */	li r3, 3
/* 801E86D0 001E56D0  48 0C AA F9 */	bl GXSetNumTevStages
/* 801E86D4 001E56D4  38 60 00 00 */	li r3, 0
/* 801E86D8 001E56D8  38 80 00 00 */	li r4, 0
/* 801E86DC 001E56DC  38 A0 00 00 */	li r5, 0
/* 801E86E0 001E56E0  38 C0 00 04 */	li r6, 4
/* 801E86E4 001E56E4  48 0C A9 49 */	bl GXSetTevOrder
/* 801E86E8 001E56E8  38 60 00 00 */	li r3, 0
/* 801E86EC 001E56EC  38 80 00 00 */	li r4, 0
/* 801E86F0 001E56F0  38 A0 00 00 */	li r5, 0
/* 801E86F4 001E56F4  38 C0 00 00 */	li r6, 0
/* 801E86F8 001E56F8  38 E0 00 01 */	li r7, 1
/* 801E86FC 001E56FC  39 00 00 00 */	li r8, 0
/* 801E8700 001E5700  48 0C A4 E5 */	bl GXSetTevColorOp
/* 801E8704 001E5704  38 60 00 00 */	li r3, 0
/* 801E8708 001E5708  38 80 00 00 */	li r4, 0
/* 801E870C 001E570C  38 A0 00 00 */	li r5, 0
/* 801E8710 001E5710  38 C0 00 00 */	li r6, 0
/* 801E8714 001E5714  38 E0 00 01 */	li r7, 1
/* 801E8718 001E5718  39 00 00 00 */	li r8, 0
/* 801E871C 001E571C  48 0C A5 31 */	bl GXSetTevAlphaOp
/* 801E8720 001E5720  38 60 00 00 */	li r3, 0
/* 801E8724 001E5724  38 80 00 04 */	li r4, 4
/* 801E8728 001E5728  38 A0 00 02 */	li r5, 2
/* 801E872C 001E572C  38 C0 00 08 */	li r6, 8
/* 801E8730 001E5730  38 E0 00 0F */	li r7, 0xf
/* 801E8734 001E5734  48 0C A4 29 */	bl GXSetTevColorIn
/* 801E8738 001E5738  38 60 00 00 */	li r3, 0
/* 801E873C 001E573C  38 80 00 07 */	li r4, 7
/* 801E8740 001E5740  38 A0 00 05 */	li r5, 5
/* 801E8744 001E5744  38 C0 00 04 */	li r6, 4
/* 801E8748 001E5748  38 E0 00 07 */	li r7, 7
/* 801E874C 001E574C  48 0C A4 55 */	bl GXSetTevAlphaIn
/* 801E8750 001E5750  38 60 00 01 */	li r3, 1
/* 801E8754 001E5754  38 80 00 01 */	li r4, 1
/* 801E8758 001E5758  38 A0 00 01 */	li r5, 1
/* 801E875C 001E575C  38 C0 00 FF */	li r6, 0xff
/* 801E8760 001E5760  48 0C A8 CD */	bl GXSetTevOrder
/* 801E8764 001E5764  38 60 00 01 */	li r3, 1
/* 801E8768 001E5768  38 80 00 00 */	li r4, 0
/* 801E876C 001E576C  38 A0 00 00 */	li r5, 0
/* 801E8770 001E5770  38 C0 00 00 */	li r6, 0
/* 801E8774 001E5774  38 E0 00 01 */	li r7, 1
/* 801E8778 001E5778  39 00 00 00 */	li r8, 0
/* 801E877C 001E577C  48 0C A4 69 */	bl GXSetTevColorOp
/* 801E8780 001E5780  38 60 00 01 */	li r3, 1
/* 801E8784 001E5784  38 80 00 00 */	li r4, 0
/* 801E8788 001E5788  38 A0 00 00 */	li r5, 0
/* 801E878C 001E578C  38 C0 00 00 */	li r6, 0
/* 801E8790 001E5790  38 E0 00 01 */	li r7, 1
/* 801E8794 001E5794  39 00 00 00 */	li r8, 0
/* 801E8798 001E5798  48 0C A4 B5 */	bl GXSetTevAlphaOp
/* 801E879C 001E579C  38 60 00 01 */	li r3, 1
/* 801E87A0 001E57A0  38 80 00 04 */	li r4, 4
/* 801E87A4 001E57A4  38 A0 00 02 */	li r5, 2
/* 801E87A8 001E57A8  38 C0 00 08 */	li r6, 8
/* 801E87AC 001E57AC  38 E0 00 0F */	li r7, 0xf
/* 801E87B0 001E57B0  48 0C A3 AD */	bl GXSetTevColorIn
/* 801E87B4 001E57B4  38 60 00 01 */	li r3, 1
/* 801E87B8 001E57B8  38 80 00 07 */	li r4, 7
/* 801E87BC 001E57BC  38 A0 00 00 */	li r5, 0
/* 801E87C0 001E57C0  38 C0 00 01 */	li r6, 1
/* 801E87C4 001E57C4  38 E0 00 07 */	li r7, 7
/* 801E87C8 001E57C8  48 0C A3 D9 */	bl GXSetTevAlphaIn
/* 801E87CC 001E57CC  38 60 00 02 */	li r3, 2
/* 801E87D0 001E57D0  38 80 00 01 */	li r4, 1
/* 801E87D4 001E57D4  38 A0 00 01 */	li r5, 1
/* 801E87D8 001E57D8  38 C0 00 FF */	li r6, 0xff
/* 801E87DC 001E57DC  48 0C A8 51 */	bl GXSetTevOrder
/* 801E87E0 001E57E0  38 60 00 02 */	li r3, 2
/* 801E87E4 001E57E4  38 80 00 00 */	li r4, 0
/* 801E87E8 001E57E8  38 A0 00 00 */	li r5, 0
/* 801E87EC 001E57EC  38 C0 00 00 */	li r6, 0
/* 801E87F0 001E57F0  38 E0 00 01 */	li r7, 1
/* 801E87F4 001E57F4  39 00 00 00 */	li r8, 0
/* 801E87F8 001E57F8  48 0C A3 ED */	bl GXSetTevColorOp
/* 801E87FC 001E57FC  38 60 00 02 */	li r3, 2
/* 801E8800 001E5800  38 80 00 01 */	li r4, 1
/* 801E8804 001E5804  38 A0 00 00 */	li r5, 0
/* 801E8808 001E5808  38 C0 00 00 */	li r6, 0
/* 801E880C 001E580C  38 E0 00 01 */	li r7, 1
/* 801E8810 001E5810  39 00 00 00 */	li r8, 0
/* 801E8814 001E5814  48 0C A4 39 */	bl GXSetTevAlphaOp
/* 801E8818 001E5818  38 60 00 02 */	li r3, 2
/* 801E881C 001E581C  38 80 00 0F */	li r4, 0xf
/* 801E8820 001E5820  38 A0 00 0F */	li r5, 0xf
/* 801E8824 001E5824  38 C0 00 0F */	li r6, 0xf
/* 801E8828 001E5828  38 E0 00 00 */	li r7, 0
/* 801E882C 001E582C  48 0C A3 31 */	bl GXSetTevColorIn
/* 801E8830 001E5830  38 60 00 02 */	li r3, 2
/* 801E8834 001E5834  38 80 00 07 */	li r4, 7
/* 801E8838 001E5838  38 A0 00 04 */	li r5, 4
/* 801E883C 001E583C  38 C0 00 01 */	li r6, 1
/* 801E8840 001E5840  38 E0 00 00 */	li r7, 0
/* 801E8844 001E5844  48 0C A3 5D */	bl GXSetTevAlphaIn
/* 801E8848 001E5848  38 60 00 02 */	li r3, 2
/* 801E884C 001E584C  48 0C 6A 35 */	bl GXSetNumTexGens
/* 801E8850 001E5850  38 60 00 00 */	li r3, 0
/* 801E8854 001E5854  38 80 00 01 */	li r4, 1
/* 801E8858 001E5858  38 A0 00 04 */	li r5, 4
/* 801E885C 001E585C  38 C0 00 1E */	li r6, 0x1e
/* 801E8860 001E5860  38 E0 00 00 */	li r7, 0
/* 801E8864 001E5864  39 00 00 7D */	li r8, 0x7d
/* 801E8868 001E5868  48 0C 67 99 */	bl GXSetTexCoordGen2
/* 801E886C 001E586C  38 60 00 01 */	li r3, 1
/* 801E8870 001E5870  38 80 00 01 */	li r4, 1
/* 801E8874 001E5874  38 A0 00 04 */	li r5, 4
/* 801E8878 001E5878  38 C0 00 21 */	li r6, 0x21
/* 801E887C 001E587C  38 E0 00 00 */	li r7, 0
/* 801E8880 001E5880  39 00 00 7D */	li r8, 0x7d
/* 801E8884 001E5884  48 0C 67 7D */	bl GXSetTexCoordGen2
/* 801E8888 001E5888  C0 22 EB F8 */	lfs f1, lbl_8041FF78@sda21(r2)
/* 801E888C 001E588C  38 61 00 E8 */	addi r3, r1, 0xe8
/* 801E8890 001E5890  C0 42 EB FC */	lfs f2, lbl_8041FF7C@sda21(r2)
/* 801E8894 001E5894  C0 62 EC 00 */	lfs f3, lbl_8041FF80@sda21(r2)
/* 801E8898 001E5898  48 0A FC 15 */	bl PSMTXScale
/* 801E889C 001E589C  38 61 00 E8 */	addi r3, r1, 0xe8
/* 801E88A0 001E58A0  38 80 00 1E */	li r4, 0x1e
/* 801E88A4 001E58A4  38 A0 00 01 */	li r5, 1
/* 801E88A8 001E58A8  48 0C BD 25 */	bl GXLoadTexMtxImm
/* 801E88AC 001E58AC  38 81 00 58 */	addi r4, r1, 0x58
/* 801E88B0 001E58B0  38 60 00 42 */	li r3, 0x42
/* 801E88B4 001E58B4  4B FE 8F 91 */	bl effGetTexObjN64
/* 801E88B8 001E58B8  38 61 00 58 */	addi r3, r1, 0x58
/* 801E88BC 001E58BC  38 80 00 00 */	li r4, 0
/* 801E88C0 001E58C0  48 0C 91 BD */	bl GXLoadTexObj
/* 801E88C4 001E58C4  38 81 00 58 */	addi r4, r1, 0x58
/* 801E88C8 001E58C8  38 60 00 43 */	li r3, 0x43
/* 801E88CC 001E58CC  4B FE 8F 79 */	bl effGetTexObjN64
/* 801E88D0 001E58D0  38 61 00 58 */	addi r3, r1, 0x58
/* 801E88D4 001E58D4  38 80 00 01 */	li r4, 1
/* 801E88D8 001E58D8  48 0C 91 A5 */	bl GXLoadTexObj
/* 801E88DC 001E58DC  38 60 00 00 */	li r3, 0
/* 801E88E0 001E58E0  48 0C 75 A9 */	bl GXSetCullMode
/* 801E88E4 001E58E4  3C 60 80 3A */	lis r3, lbl_803A6440@ha
/* 801E88E8 001E58E8  38 63 64 40 */	addi r3, r3, lbl_803A6440@l
/* 801E88EC 001E58EC  4B FE 8D C5 */	bl effSetVtxDescN64
/* 801E88F0 001E58F0  CB FF 00 30 */	lfd f31, 0x30(r31)
/* 801E88F4 001E58F4  7F DD F3 78 */	mr r29, r30
/* 801E88F8 001E58F8  3B 80 00 00 */	li r28, 0
/* 801E88FC 001E58FC  3B E0 00 00 */	li r31, 0
/* 801E8900 001E5900  3F C0 43 30 */	lis r30, 0x4330
lbl_801E8904:
/* 801E8904 001E5904  C0 22 EC 04 */	lfs f1, lbl_8041FF84@sda21(r2)
/* 801E8908 001E5908  38 61 00 E8 */	addi r3, r1, 0xe8
/* 801E890C 001E590C  C0 42 EC 08 */	lfs f2, lbl_8041FF88@sda21(r2)
/* 801E8910 001E5910  C0 62 EC 00 */	lfs f3, lbl_8041FF80@sda21(r2)
/* 801E8914 001E5914  48 0A FB 99 */	bl PSMTXScale
/* 801E8918 001E5918  6F E0 80 00 */	xoris r0, r31, 0x8000
/* 801E891C 001E591C  C0 42 EC 00 */	lfs f2, lbl_8041FF80@sda21(r2)
/* 801E8920 001E5920  90 01 01 4C */	stw r0, 0x14c(r1)
/* 801E8924 001E5924  38 61 01 18 */	addi r3, r1, 0x118
/* 801E8928 001E5928  C0 3D 00 20 */	lfs f1, 0x20(r29)
/* 801E892C 001E592C  FC 60 10 90 */	fmr f3, f2
/* 801E8930 001E5930  93 C1 01 48 */	stw r30, 0x148(r1)
/* 801E8934 001E5934  C8 01 01 48 */	lfd f0, 0x148(r1)
/* 801E8938 001E5938  EC 00 F8 28 */	fsubs f0, f0, f31
/* 801E893C 001E593C  EC 21 00 2A */	fadds f1, f1, f0
/* 801E8940 001E5940  48 0A FA ED */	bl PSMTXTrans
/* 801E8944 001E5944  38 61 00 E8 */	addi r3, r1, 0xe8
/* 801E8948 001E5948  38 81 01 18 */	addi r4, r1, 0x118
/* 801E894C 001E594C  7C 65 1B 78 */	mr r5, r3
/* 801E8950 001E5950  48 0A F6 11 */	bl PSMTXConcat
/* 801E8954 001E5954  38 61 00 E8 */	addi r3, r1, 0xe8
/* 801E8958 001E5958  38 80 00 21 */	li r4, 0x21
/* 801E895C 001E595C  38 A0 00 01 */	li r5, 1
/* 801E8960 001E5960  48 0C BC 6D */	bl GXLoadTexMtxImm
/* 801E8964 001E5964  2C 1C 00 02 */	cmpwi r28, 2
/* 801E8968 001E5968  41 82 00 BC */	beq lbl_801E8A24
/* 801E896C 001E596C  40 80 00 14 */	bge lbl_801E8980
/* 801E8970 001E5970  2C 1C 00 00 */	cmpwi r28, 0
/* 801E8974 001E5974  41 82 00 1C */	beq lbl_801E8990
/* 801E8978 001E5978  40 80 00 74 */	bge lbl_801E89EC
/* 801E897C 001E597C  48 00 01 70 */	b lbl_801E8AEC
lbl_801E8980:
/* 801E8980 001E5980  2C 1C 00 04 */	cmpwi r28, 4
/* 801E8984 001E5984  41 82 01 34 */	beq lbl_801E8AB8
/* 801E8988 001E5988  40 80 01 64 */	bge lbl_801E8AEC
/* 801E898C 001E598C  48 00 00 D0 */	b lbl_801E8A5C
lbl_801E8990:
/* 801E8990 001E5990  38 60 00 90 */	li r3, 0x90
/* 801E8994 001E5994  38 80 00 00 */	li r4, 0
/* 801E8998 001E5998  38 A0 00 0C */	li r5, 0xc
/* 801E899C 001E599C  48 0C 72 CD */	bl GXBegin
/* 801E89A0 001E59A0  38 60 00 00 */	li r3, 0
/* 801E89A4 001E59A4  38 80 00 01 */	li r4, 1
/* 801E89A8 001E59A8  38 A0 00 02 */	li r5, 2
/* 801E89AC 001E59AC  38 C0 00 00 */	li r6, 0
/* 801E89B0 001E59B0  38 E0 00 00 */	li r7, 0
/* 801E89B4 001E59B4  39 00 00 02 */	li r8, 2
/* 801E89B8 001E59B8  39 20 00 03 */	li r9, 3
/* 801E89BC 001E59BC  39 40 00 00 */	li r10, 0
/* 801E89C0 001E59C0  4B FE 8C 75 */	bl tri2
/* 801E89C4 001E59C4  38 60 00 04 */	li r3, 4
/* 801E89C8 001E59C8  38 80 00 05 */	li r4, 5
/* 801E89CC 001E59CC  38 A0 00 06 */	li r5, 6
/* 801E89D0 001E59D0  38 C0 00 00 */	li r6, 0
/* 801E89D4 001E59D4  38 E0 00 04 */	li r7, 4
/* 801E89D8 001E59D8  39 00 00 06 */	li r8, 6
/* 801E89DC 001E59DC  39 20 00 07 */	li r9, 7
/* 801E89E0 001E59E0  39 40 00 00 */	li r10, 0
/* 801E89E4 001E59E4  4B FE 8C 51 */	bl tri2
/* 801E89E8 001E59E8  48 00 01 04 */	b lbl_801E8AEC
lbl_801E89EC:
/* 801E89EC 001E59EC  38 60 00 90 */	li r3, 0x90
/* 801E89F0 001E59F0  38 80 00 00 */	li r4, 0
/* 801E89F4 001E59F4  38 A0 00 06 */	li r5, 6
/* 801E89F8 001E59F8  48 0C 72 71 */	bl GXBegin
/* 801E89FC 001E59FC  38 60 00 08 */	li r3, 8
/* 801E8A00 001E5A00  38 80 00 09 */	li r4, 9
/* 801E8A04 001E5A04  38 A0 00 0A */	li r5, 0xa
/* 801E8A08 001E5A08  38 C0 00 08 */	li r6, 8
/* 801E8A0C 001E5A0C  38 E0 00 08 */	li r7, 8
/* 801E8A10 001E5A10  39 00 00 0A */	li r8, 0xa
/* 801E8A14 001E5A14  39 20 00 0B */	li r9, 0xb
/* 801E8A18 001E5A18  39 40 00 08 */	li r10, 8
/* 801E8A1C 001E5A1C  4B FE 8C 19 */	bl tri2
/* 801E8A20 001E5A20  48 00 00 CC */	b lbl_801E8AEC
lbl_801E8A24:
/* 801E8A24 001E5A24  38 60 00 90 */	li r3, 0x90
/* 801E8A28 001E5A28  38 80 00 00 */	li r4, 0
/* 801E8A2C 001E5A2C  38 A0 00 06 */	li r5, 6
/* 801E8A30 001E5A30  48 0C 72 39 */	bl GXBegin
/* 801E8A34 001E5A34  38 60 00 0C */	li r3, 0xc
/* 801E8A38 001E5A38  38 80 00 0D */	li r4, 0xd
/* 801E8A3C 001E5A3C  38 A0 00 0E */	li r5, 0xe
/* 801E8A40 001E5A40  38 C0 00 0C */	li r6, 0xc
/* 801E8A44 001E5A44  38 E0 00 0C */	li r7, 0xc
/* 801E8A48 001E5A48  39 00 00 0E */	li r8, 0xe
/* 801E8A4C 001E5A4C  39 20 00 0F */	li r9, 0xf
/* 801E8A50 001E5A50  39 40 00 0C */	li r10, 0xc
/* 801E8A54 001E5A54  4B FE 8B E1 */	bl tri2
/* 801E8A58 001E5A58  48 00 00 94 */	b lbl_801E8AEC
lbl_801E8A5C:
/* 801E8A5C 001E5A5C  38 60 00 90 */	li r3, 0x90
/* 801E8A60 001E5A60  38 80 00 00 */	li r4, 0
/* 801E8A64 001E5A64  38 A0 00 0C */	li r5, 0xc
/* 801E8A68 001E5A68  48 0C 72 01 */	bl GXBegin
/* 801E8A6C 001E5A6C  38 60 00 10 */	li r3, 0x10
/* 801E8A70 001E5A70  38 80 00 11 */	li r4, 0x11
/* 801E8A74 001E5A74  38 A0 00 12 */	li r5, 0x12
/* 801E8A78 001E5A78  38 C0 00 10 */	li r6, 0x10
/* 801E8A7C 001E5A7C  38 E0 00 10 */	li r7, 0x10
/* 801E8A80 001E5A80  39 00 00 12 */	li r8, 0x12
/* 801E8A84 001E5A84  39 20 00 13 */	li r9, 0x13
/* 801E8A88 001E5A88  39 40 00 10 */	li r10, 0x10
/* 801E8A8C 001E5A8C  4B FE 8B A9 */	bl tri2
/* 801E8A90 001E5A90  38 60 00 14 */	li r3, 0x14
/* 801E8A94 001E5A94  38 80 00 15 */	li r4, 0x15
/* 801E8A98 001E5A98  38 A0 00 16 */	li r5, 0x16
/* 801E8A9C 001E5A9C  38 C0 00 10 */	li r6, 0x10
/* 801E8AA0 001E5AA0  38 E0 00 14 */	li r7, 0x14
/* 801E8AA4 001E5AA4  39 00 00 16 */	li r8, 0x16
/* 801E8AA8 001E5AA8  39 20 00 17 */	li r9, 0x17
/* 801E8AAC 001E5AAC  39 40 00 10 */	li r10, 0x10
/* 801E8AB0 001E5AB0  4B FE 8B 85 */	bl tri2
/* 801E8AB4 001E5AB4  48 00 00 38 */	b lbl_801E8AEC
lbl_801E8AB8:
/* 801E8AB8 001E5AB8  38 60 00 90 */	li r3, 0x90
/* 801E8ABC 001E5ABC  38 80 00 00 */	li r4, 0
/* 801E8AC0 001E5AC0  38 A0 00 06 */	li r5, 6
/* 801E8AC4 001E5AC4  48 0C 71 A5 */	bl GXBegin
/* 801E8AC8 001E5AC8  38 60 00 18 */	li r3, 0x18
/* 801E8ACC 001E5ACC  38 80 00 19 */	li r4, 0x19
/* 801E8AD0 001E5AD0  38 A0 00 1A */	li r5, 0x1a
/* 801E8AD4 001E5AD4  38 C0 00 18 */	li r6, 0x18
/* 801E8AD8 001E5AD8  38 E0 00 18 */	li r7, 0x18
/* 801E8ADC 001E5ADC  39 00 00 1A */	li r8, 0x1a
/* 801E8AE0 001E5AE0  39 20 00 1B */	li r9, 0x1b
/* 801E8AE4 001E5AE4  39 40 00 18 */	li r10, 0x18
/* 801E8AE8 001E5AE8  4B FE 8B 4D */	bl tri2
lbl_801E8AEC:
/* 801E8AEC 001E5AEC  3B 9C 00 01 */	addi r28, r28, 1
/* 801E8AF0 001E5AF0  3B BD 00 04 */	addi r29, r29, 4
/* 801E8AF4 001E5AF4  2C 1C 00 05 */	cmpwi r28, 5
/* 801E8AF8 001E5AF8  3B FF 00 0B */	addi r31, r31, 0xb
/* 801E8AFC 001E5AFC  41 80 FE 08 */	blt lbl_801E8904
/* 801E8B00 001E5B00  38 61 00 3C */	addi r3, r1, 0x3c
/* 801E8B04 001E5B04  48 0C B9 21 */	bl GXSetProjectionv
lbl_801E8B08:
/* 801E8B08 001E5B08  E3 E1 01 68 */	psq_l f31, 360(r1), 0, qr0
/* 801E8B0C 001E5B0C  80 01 01 74 */	lwz r0, 0x174(r1)
/* 801E8B10 001E5B10  CB E1 01 60 */	lfd f31, 0x160(r1)
/* 801E8B14 001E5B14  83 E1 01 5C */	lwz r31, 0x15c(r1)
/* 801E8B18 001E5B18  83 C1 01 58 */	lwz r30, 0x158(r1)
/* 801E8B1C 001E5B1C  83 A1 01 54 */	lwz r29, 0x154(r1)
/* 801E8B20 001E5B20  83 81 01 50 */	lwz r28, 0x150(r1)
/* 801E8B24 001E5B24  7C 08 03 A6 */	mtlr r0
/* 801E8B28 001E5B28  38 21 01 70 */	addi r1, r1, 0x170
/* 801E8B2C 001E5B2C  4E 80 00 20 */	blr 
effSunlightMain:
/* 801E8B30 001E5B30  94 21 FF 10 */	stwu r1, -0xf0(r1)
/* 801E8B34 001E5B34  7C 08 02 A6 */	mflr r0
/* 801E8B38 001E5B38  90 01 00 F4 */	stw r0, 0xf4(r1)
/* 801E8B3C 001E5B3C  DB E1 00 E0 */	stfd f31, 0xe0(r1)
/* 801E8B40 001E5B40  F3 E1 00 E8 */	psq_st f31, 232(r1), 0, qr0
/* 801E8B44 001E5B44  DB C1 00 D0 */	stfd f30, 0xd0(r1)
/* 801E8B48 001E5B48  F3 C1 00 D8 */	psq_st f30, 216(r1), 0, qr0
/* 801E8B4C 001E5B4C  DB A1 00 C0 */	stfd f29, 0xc0(r1)
/* 801E8B50 001E5B50  F3 A1 00 C8 */	psq_st f29, 200(r1), 0, qr0
/* 801E8B54 001E5B54  DB 81 00 B0 */	stfd f28, 0xb0(r1)
/* 801E8B58 001E5B58  F3 81 00 B8 */	psq_st f28, 184(r1), 0, qr0
/* 801E8B5C 001E5B5C  DB 61 00 A0 */	stfd f27, 0xa0(r1)
/* 801E8B60 001E5B60  F3 61 00 A8 */	psq_st f27, 168(r1), 0, qr0
/* 801E8B64 001E5B64  DB 41 00 90 */	stfd f26, 0x90(r1)
/* 801E8B68 001E5B68  F3 41 00 98 */	psq_st f26, 152(r1), 0, qr0
/* 801E8B6C 001E5B6C  DB 21 00 80 */	stfd f25, 0x80(r1)
/* 801E8B70 001E5B70  F3 21 00 88 */	psq_st f25, 136(r1), 0, qr0
/* 801E8B74 001E5B74  DB 01 00 70 */	stfd f24, 0x70(r1)
/* 801E8B78 001E5B78  F3 01 00 78 */	psq_st f24, 120(r1), 0, qr0
/* 801E8B7C 001E5B7C  DA E1 00 60 */	stfd f23, 0x60(r1)
/* 801E8B80 001E5B80  F2 E1 00 68 */	psq_st f23, 104(r1), 0, qr0
/* 801E8B84 001E5B84  DA C1 00 50 */	stfd f22, 0x50(r1)
/* 801E8B88 001E5B88  F2 C1 00 58 */	psq_st f22, 88(r1), 0, qr0
/* 801E8B8C 001E5B8C  BF 61 00 3C */	stmw r27, 0x3c(r1)
/* 801E8B90 001E5B90  3C 80 80 30 */	lis r4, lbl_802FB7C8@ha
/* 801E8B94 001E5B94  7C 7F 1B 78 */	mr r31, r3
/* 801E8B98 001E5B98  38 C4 B7 C8 */	addi r6, r4, lbl_802FB7C8@l
/* 801E8B9C 001E5B9C  80 63 00 0C */	lwz r3, 0xc(r3)
/* 801E8BA0 001E5BA0  80 A6 00 00 */	lwz r5, 0(r6)
/* 801E8BA4 001E5BA4  80 86 00 04 */	lwz r4, 4(r6)
/* 801E8BA8 001E5BA8  80 06 00 08 */	lwz r0, 8(r6)
/* 801E8BAC 001E5BAC  90 A1 00 08 */	stw r5, 8(r1)
/* 801E8BB0 001E5BB0  C0 03 00 04 */	lfs f0, 4(r3)
/* 801E8BB4 001E5BB4  90 81 00 0C */	stw r4, 0xc(r1)
/* 801E8BB8 001E5BB8  C0 23 00 08 */	lfs f1, 8(r3)
/* 801E8BBC 001E5BBC  D0 01 00 08 */	stfs f0, 8(r1)
/* 801E8BC0 001E5BC0  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 801E8BC4 001E5BC4  90 01 00 10 */	stw r0, 0x10(r1)
/* 801E8BC8 001E5BC8  80 A1 00 08 */	lwz r5, 8(r1)
/* 801E8BCC 001E5BCC  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801E8BD0 001E5BD0  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801E8BD4 001E5BD4  80 81 00 0C */	lwz r4, 0xc(r1)
/* 801E8BD8 001E5BD8  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801E8BDC 001E5BDC  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801E8BE0 001E5BE0  90 81 00 18 */	stw r4, 0x18(r1)
/* 801E8BE4 001E5BE4  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801E8BE8 001E5BE8  80 9F 00 00 */	lwz r4, 0(r31)
/* 801E8BEC 001E5BEC  54 80 07 7B */	rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 801E8BF0 001E5BF0  41 82 00 14 */	beq lbl_801E8C04
/* 801E8BF4 001E5BF4  54 84 07 B8 */	rlwinm r4, r4, 0, 0x1e, 0x1c
/* 801E8BF8 001E5BF8  38 00 00 10 */	li r0, 0x10
/* 801E8BFC 001E5BFC  90 9F 00 00 */	stw r4, 0(r31)
/* 801E8C00 001E5C00  90 03 00 10 */	stw r0, 0x10(r3)
lbl_801E8C04:
/* 801E8C04 001E5C04  80 83 00 10 */	lwz r4, 0x10(r3)
/* 801E8C08 001E5C08  2C 04 03 E8 */	cmpwi r4, 0x3e8
/* 801E8C0C 001E5C0C  40 80 00 0C */	bge lbl_801E8C18
/* 801E8C10 001E5C10  38 04 FF FF */	addi r0, r4, -1
/* 801E8C14 001E5C14  90 03 00 10 */	stw r0, 0x10(r3)
lbl_801E8C18:
/* 801E8C18 001E5C18  80 A3 00 14 */	lwz r5, 0x14(r3)
/* 801E8C1C 001E5C1C  3C 80 00 05 */	lis r4, 0x0004F1A0@ha
/* 801E8C20 001E5C20  38 04 F1 A0 */	addi r0, r4, 0x0004F1A0@l
/* 801E8C24 001E5C24  38 85 00 01 */	addi r4, r5, 1
/* 801E8C28 001E5C28  90 83 00 14 */	stw r4, 0x14(r3)
/* 801E8C2C 001E5C2C  80 83 00 14 */	lwz r4, 0x14(r3)
/* 801E8C30 001E5C30  7C 04 00 00 */	cmpw r4, r0
/* 801E8C34 001E5C34  40 81 00 0C */	ble lbl_801E8C40
/* 801E8C38 001E5C38  38 00 01 00 */	li r0, 0x100
/* 801E8C3C 001E5C3C  90 03 00 14 */	stw r0, 0x14(r3)
lbl_801E8C40:
/* 801E8C40 001E5C40  80 03 00 10 */	lwz r0, 0x10(r3)
/* 801E8C44 001E5C44  2C 00 00 00 */	cmpwi r0, 0
/* 801E8C48 001E5C48  40 80 00 10 */	bge lbl_801E8C58
/* 801E8C4C 001E5C4C  7F E3 FB 78 */	mr r3, r31
/* 801E8C50 001E5C50  4B E7 4F 35 */	bl effDelete
/* 801E8C54 001E5C54  48 00 01 C0 */	b lbl_801E8E14
lbl_801E8C58:
/* 801E8C58 001E5C58  2C 00 00 10 */	cmpwi r0, 0x10
/* 801E8C5C 001E5C5C  80 A3 00 14 */	lwz r5, 0x14(r3)
/* 801E8C60 001E5C60  40 80 00 24 */	bge lbl_801E8C84
/* 801E8C64 001E5C64  80 83 00 38 */	lwz r4, 0x38(r3)
/* 801E8C68 001E5C68  38 04 FF F0 */	addi r0, r4, -16
/* 801E8C6C 001E5C6C  90 03 00 38 */	stw r0, 0x38(r3)
/* 801E8C70 001E5C70  80 03 00 38 */	lwz r0, 0x38(r3)
/* 801E8C74 001E5C74  2C 00 00 00 */	cmpwi r0, 0
/* 801E8C78 001E5C78  40 80 00 0C */	bge lbl_801E8C84
/* 801E8C7C 001E5C7C  38 00 00 00 */	li r0, 0
/* 801E8C80 001E5C80  90 03 00 38 */	stw r0, 0x38(r3)
lbl_801E8C84:
/* 801E8C84 001E5C84  80 03 00 3C */	lwz r0, 0x3c(r3)
/* 801E8C88 001E5C88  2C 00 00 00 */	cmpwi r0, 0
/* 801E8C8C 001E5C8C  40 80 00 10 */	bge lbl_801E8C9C
/* 801E8C90 001E5C90  38 00 00 00 */	li r0, 0
/* 801E8C94 001E5C94  90 03 00 3C */	stw r0, 0x3c(r3)
/* 801E8C98 001E5C98  48 00 00 14 */	b lbl_801E8CAC
lbl_801E8C9C:
/* 801E8C9C 001E5C9C  2C 00 00 FF */	cmpwi r0, 0xff
/* 801E8CA0 001E5CA0  40 81 00 0C */	ble lbl_801E8CAC
/* 801E8CA4 001E5CA4  38 00 00 FF */	li r0, 0xff
/* 801E8CA8 001E5CA8  90 03 00 3C */	stw r0, 0x3c(r3)
lbl_801E8CAC:
/* 801E8CAC 001E5CAC  80 83 00 38 */	lwz r4, 0x38(r3)
/* 801E8CB0 001E5CB0  80 03 00 3C */	lwz r0, 0x3c(r3)
/* 801E8CB4 001E5CB4  7C 04 00 00 */	cmpw r4, r0
/* 801E8CB8 001E5CB8  40 81 00 24 */	ble lbl_801E8CDC
/* 801E8CBC 001E5CBC  38 04 FF F8 */	addi r0, r4, -8
/* 801E8CC0 001E5CC0  90 03 00 38 */	stw r0, 0x38(r3)
/* 801E8CC4 001E5CC4  80 03 00 38 */	lwz r0, 0x38(r3)
/* 801E8CC8 001E5CC8  80 83 00 3C */	lwz r4, 0x3c(r3)
/* 801E8CCC 001E5CCC  7C 00 20 00 */	cmpw r0, r4
/* 801E8CD0 001E5CD0  40 80 00 2C */	bge lbl_801E8CFC
/* 801E8CD4 001E5CD4  90 83 00 38 */	stw r4, 0x38(r3)
/* 801E8CD8 001E5CD8  48 00 00 24 */	b lbl_801E8CFC
lbl_801E8CDC:
/* 801E8CDC 001E5CDC  40 80 00 20 */	bge lbl_801E8CFC
/* 801E8CE0 001E5CE0  38 04 00 08 */	addi r0, r4, 8
/* 801E8CE4 001E5CE4  90 03 00 38 */	stw r0, 0x38(r3)
/* 801E8CE8 001E5CE8  80 03 00 38 */	lwz r0, 0x38(r3)
/* 801E8CEC 001E5CEC  80 83 00 3C */	lwz r4, 0x3c(r3)
/* 801E8CF0 001E5CF0  7C 00 20 00 */	cmpw r0, r4
/* 801E8CF4 001E5CF4  40 81 00 08 */	ble lbl_801E8CFC
/* 801E8CF8 001E5CF8  90 83 00 38 */	stw r4, 0x38(r3)
lbl_801E8CFC:
/* 801E8CFC 001E5CFC  6C A0 80 00 */	xoris r0, r5, 0x8000
/* 801E8D00 001E5D00  3F C0 43 30 */	lis r30, 0x4330
/* 801E8D04 001E5D04  90 01 00 24 */	stw r0, 0x24(r1)
/* 801E8D08 001E5D08  3C 80 80 30 */	lis r4, lbl_802FB7F8@ha
/* 801E8D0C 001E5D0C  CB A4 B7 F8 */	lfd f29, lbl_802FB7F8@l(r4)
/* 801E8D10 001E5D10  7C 7C 1B 78 */	mr r28, r3
/* 801E8D14 001E5D14  93 C1 00 20 */	stw r30, 0x20(r1)
/* 801E8D18 001E5D18  54 BD 08 3C */	slwi r29, r5, 1
/* 801E8D1C 001E5D1C  C0 22 EC 0C */	lfs f1, lbl_8041FF8C@sda21(r2)
/* 801E8D20 001E5D20  3B 60 00 00 */	li r27, 0
/* 801E8D24 001E5D24  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801E8D28 001E5D28  C3 C2 EC 10 */	lfs f30, lbl_8041FF90@sda21(r2)
/* 801E8D2C 001E5D2C  EC 00 E8 28 */	fsubs f0, f0, f29
/* 801E8D30 001E5D30  C3 E2 EC 14 */	lfs f31, lbl_8041FF94@sda21(r2)
/* 801E8D34 001E5D34  C2 E2 EC 18 */	lfs f23, lbl_8041FF98@sda21(r2)
/* 801E8D38 001E5D38  C3 02 EC 20 */	lfs f24, lbl_8041FFA0@sda21(r2)
/* 801E8D3C 001E5D3C  EF 81 00 32 */	fmuls f28, f1, f0
/* 801E8D40 001E5D40  C3 22 EC 1C */	lfs f25, lbl_8041FF9C@sda21(r2)
/* 801E8D44 001E5D44  C3 42 EC 00 */	lfs f26, lbl_8041FF80@sda21(r2)
/* 801E8D48 001E5D48  C3 62 EC 24 */	lfs f27, lbl_8041FFA4@sda21(r2)
lbl_801E8D4C:
/* 801E8D4C 001E5D4C  7C 1B D9 D6 */	mullw r0, r27, r27
/* 801E8D50 001E5D50  93 C1 00 20 */	stw r30, 0x20(r1)
/* 801E8D54 001E5D54  1C 00 00 14 */	mulli r0, r0, 0x14
/* 801E8D58 001E5D58  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 801E8D5C 001E5D5C  90 01 00 24 */	stw r0, 0x24(r1)
/* 801E8D60 001E5D60  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801E8D64 001E5D64  EC 00 E8 28 */	fsubs f0, f0, f29
/* 801E8D68 001E5D68  EC 1C 00 2A */	fadds f0, f28, f0
/* 801E8D6C 001E5D6C  EC 1E 00 32 */	fmuls f0, f30, f0
/* 801E8D70 001E5D70  EC 20 F8 24 */	fdivs f1, f0, f31
/* 801E8D74 001E5D74  48 08 36 85 */	bl sin
/* 801E8D78 001E5D78  6F A0 80 00 */	xoris r0, r29, 0x8000
/* 801E8D7C 001E5D7C  93 C1 00 28 */	stw r30, 0x28(r1)
/* 801E8D80 001E5D80  FE C0 08 18 */	frsp f22, f1
/* 801E8D84 001E5D84  90 01 00 2C */	stw r0, 0x2c(r1)
/* 801E8D88 001E5D88  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 801E8D8C 001E5D8C  EC 00 E8 28 */	fsubs f0, f0, f29
/* 801E8D90 001E5D90  EC 1E 00 32 */	fmuls f0, f30, f0
/* 801E8D94 001E5D94  EC 20 F8 24 */	fdivs f1, f0, f31
/* 801E8D98 001E5D98  48 08 36 61 */	bl sin
/* 801E8D9C 001E5D9C  FC 20 08 18 */	frsp f1, f1
/* 801E8DA0 001E5DA0  C0 1C 00 20 */	lfs f0, 0x20(r28)
/* 801E8DA4 001E5DA4  EC 38 C8 7A */	fmadds f1, f24, f1, f25
/* 801E8DA8 001E5DA8  EC 37 00 72 */	fmuls f1, f23, f1
/* 801E8DAC 001E5DAC  EC 01 05 BC */	fnmsubs f0, f1, f22, f0
/* 801E8DB0 001E5DB0  D0 1C 00 20 */	stfs f0, 0x20(r28)
/* 801E8DB4 001E5DB4  C0 3C 00 20 */	lfs f1, 0x20(r28)
/* 801E8DB8 001E5DB8  FC 01 D0 40 */	fcmpo cr0, f1, f26
/* 801E8DBC 001E5DBC  40 80 00 10 */	bge lbl_801E8DCC
/* 801E8DC0 001E5DC0  C0 02 EC 24 */	lfs f0, lbl_8041FFA4@sda21(r2)
/* 801E8DC4 001E5DC4  EC 01 00 2A */	fadds f0, f1, f0
/* 801E8DC8 001E5DC8  D0 1C 00 20 */	stfs f0, 0x20(r28)
lbl_801E8DCC:
/* 801E8DCC 001E5DCC  C0 1C 00 20 */	lfs f0, 0x20(r28)
/* 801E8DD0 001E5DD0  FC 00 D8 40 */	fcmpo cr0, f0, f27
/* 801E8DD4 001E5DD4  40 81 00 0C */	ble lbl_801E8DE0
/* 801E8DD8 001E5DD8  EC 00 D8 28 */	fsubs f0, f0, f27
/* 801E8DDC 001E5DDC  D0 1C 00 20 */	stfs f0, 0x20(r28)
lbl_801E8DE0:
/* 801E8DE0 001E5DE0  3B 7B 00 01 */	addi r27, r27, 1
/* 801E8DE4 001E5DE4  3B 9C 00 04 */	addi r28, r28, 4
/* 801E8DE8 001E5DE8  2C 1B 00 05 */	cmpwi r27, 5
/* 801E8DEC 001E5DEC  3B BD 00 14 */	addi r29, r29, 0x14
/* 801E8DF0 001E5DF0  41 80 FF 5C */	blt lbl_801E8D4C
/* 801E8DF4 001E5DF4  38 61 00 14 */	addi r3, r1, 0x14
/* 801E8DF8 001E5DF8  4B E2 78 C9 */	bl dispCalcZ
/* 801E8DFC 001E5DFC  3C 60 80 1F */	lis r3, effSunlightDisp@ha
/* 801E8E00 001E5E00  7F E6 FB 78 */	mr r6, r31
/* 801E8E04 001E5E04  38 A3 85 14 */	addi r5, r3, effSunlightDisp@l
/* 801E8E08 001E5E08  38 80 00 02 */	li r4, 2
/* 801E8E0C 001E5E0C  38 60 00 04 */	li r3, 4
/* 801E8E10 001E5E10  4B E2 7C 09 */	bl dispEntry
lbl_801E8E14:
/* 801E8E14 001E5E14  E3 E1 00 E8 */	psq_l f31, 232(r1), 0, qr0
/* 801E8E18 001E5E18  CB E1 00 E0 */	lfd f31, 0xe0(r1)
/* 801E8E1C 001E5E1C  E3 C1 00 D8 */	psq_l f30, 216(r1), 0, qr0
/* 801E8E20 001E5E20  CB C1 00 D0 */	lfd f30, 0xd0(r1)
/* 801E8E24 001E5E24  E3 A1 00 C8 */	psq_l f29, 200(r1), 0, qr0
/* 801E8E28 001E5E28  CB A1 00 C0 */	lfd f29, 0xc0(r1)
/* 801E8E2C 001E5E2C  E3 81 00 B8 */	psq_l f28, 184(r1), 0, qr0
/* 801E8E30 001E5E30  CB 81 00 B0 */	lfd f28, 0xb0(r1)
/* 801E8E34 001E5E34  E3 61 00 A8 */	psq_l f27, 168(r1), 0, qr0
/* 801E8E38 001E5E38  CB 61 00 A0 */	lfd f27, 0xa0(r1)
/* 801E8E3C 001E5E3C  E3 41 00 98 */	psq_l f26, 152(r1), 0, qr0
/* 801E8E40 001E5E40  CB 41 00 90 */	lfd f26, 0x90(r1)
/* 801E8E44 001E5E44  E3 21 00 88 */	psq_l f25, 136(r1), 0, qr0
/* 801E8E48 001E5E48  CB 21 00 80 */	lfd f25, 0x80(r1)
/* 801E8E4C 001E5E4C  E3 01 00 78 */	psq_l f24, 120(r1), 0, qr0
/* 801E8E50 001E5E50  CB 01 00 70 */	lfd f24, 0x70(r1)
/* 801E8E54 001E5E54  E2 E1 00 68 */	psq_l f23, 104(r1), 0, qr0
/* 801E8E58 001E5E58  CA E1 00 60 */	lfd f23, 0x60(r1)
/* 801E8E5C 001E5E5C  E2 C1 00 58 */	psq_l f22, 88(r1), 0, qr0
/* 801E8E60 001E5E60  CA C1 00 50 */	lfd f22, 0x50(r1)
/* 801E8E64 001E5E64  BB 61 00 3C */	lmw r27, 0x3c(r1)
/* 801E8E68 001E5E68  80 01 00 F4 */	lwz r0, 0xf4(r1)
/* 801E8E6C 001E5E6C  7C 08 03 A6 */	mtlr r0
/* 801E8E70 001E5E70  38 21 00 F0 */	addi r1, r1, 0xf0
/* 801E8E74 001E5E74  4E 80 00 20 */	blr 

.global effSunlightN64Entry
effSunlightN64Entry:
/* 801E8E78 001E5E78  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 801E8E7C 001E5E7C  7C 08 02 A6 */	mflr r0
/* 801E8E80 001E5E80  90 01 00 64 */	stw r0, 0x64(r1)
/* 801E8E84 001E5E84  DB E1 00 50 */	stfd f31, 0x50(r1)
/* 801E8E88 001E5E88  F3 E1 00 58 */	psq_st f31, 88(r1), 0, qr0
/* 801E8E8C 001E5E8C  DB C1 00 40 */	stfd f30, 0x40(r1)
/* 801E8E90 001E5E90  F3 C1 00 48 */	psq_st f30, 72(r1), 0, qr0
/* 801E8E94 001E5E94  DB A1 00 30 */	stfd f29, 0x30(r1)
/* 801E8E98 001E5E98  F3 A1 00 38 */	psq_st f29, 56(r1), 0, qr0
/* 801E8E9C 001E5E9C  DB 81 00 20 */	stfd f28, 0x20(r1)
/* 801E8EA0 001E5EA0  F3 81 00 28 */	psq_st f28, 40(r1), 0, qr0
/* 801E8EA4 001E5EA4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801E8EA8 001E5EA8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801E8EAC 001E5EAC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801E8EB0 001E5EB0  FF 80 08 90 */	fmr f28, f1
/* 801E8EB4 001E5EB4  7C 7D 1B 78 */	mr r29, r3
/* 801E8EB8 001E5EB8  FF A0 10 90 */	fmr f29, f2
/* 801E8EBC 001E5EBC  7C 9E 23 78 */	mr r30, r4
/* 801E8EC0 001E5EC0  FF C0 18 90 */	fmr f30, f3
/* 801E8EC4 001E5EC4  FF E0 20 90 */	fmr f31, f4
/* 801E8EC8 001E5EC8  4B E7 4E F5 */	bl effEntry
/* 801E8ECC 001E5ECC  3C 80 80 30 */	lis r4, lbl_802FB800@ha
/* 801E8ED0 001E5ED0  7C 7F 1B 78 */	mr r31, r3
/* 801E8ED4 001E5ED4  38 84 B8 00 */	addi r4, r4, lbl_802FB800@l
/* 801E8ED8 001E5ED8  38 00 00 01 */	li r0, 1
/* 801E8EDC 001E5EDC  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801E8EE0 001E5EE0  38 60 00 03 */	li r3, 3
/* 801E8EE4 001E5EE4  38 80 00 40 */	li r4, 0x40
/* 801E8EE8 001E5EE8  90 1F 00 08 */	stw r0, 8(r31)
/* 801E8EEC 001E5EEC  4B E4 6B A1 */	bl __memAlloc
/* 801E8EF0 001E5EF0  3C 80 80 1F */	lis r4, effSunlightMain@ha
/* 801E8EF4 001E5EF4  90 7F 00 0C */	stw r3, 0xc(r31)
/* 801E8EF8 001E5EF8  38 04 8B 30 */	addi r0, r4, effSunlightMain@l
/* 801E8EFC 001E5EFC  2C 1E 00 00 */	cmpwi r30, 0
/* 801E8F00 001E5F00  90 1F 00 10 */	stw r0, 0x10(r31)
/* 801E8F04 001E5F04  38 00 00 00 */	li r0, 0
/* 801E8F08 001E5F08  80 9F 00 00 */	lwz r4, 0(r31)
/* 801E8F0C 001E5F0C  60 84 00 02 */	ori r4, r4, 2
/* 801E8F10 001E5F10  90 9F 00 00 */	stw r4, 0(r31)
/* 801E8F14 001E5F14  93 A3 00 00 */	stw r29, 0(r3)
/* 801E8F18 001E5F18  90 03 00 14 */	stw r0, 0x14(r3)
/* 801E8F1C 001E5F1C  41 81 00 10 */	bgt lbl_801E8F2C
/* 801E8F20 001E5F20  38 00 03 E8 */	li r0, 0x3e8
/* 801E8F24 001E5F24  90 03 00 10 */	stw r0, 0x10(r3)
/* 801E8F28 001E5F28  48 00 00 08 */	b lbl_801E8F30
lbl_801E8F2C:
/* 801E8F2C 001E5F2C  93 C3 00 10 */	stw r30, 0x10(r3)
lbl_801E8F30:
/* 801E8F30 001E5F30  D3 83 00 04 */	stfs f28, 4(r3)
/* 801E8F34 001E5F34  38 80 00 FF */	li r4, 0xff
/* 801E8F38 001E5F38  C0 02 EC 00 */	lfs f0, lbl_8041FF80@sda21(r2)
/* 801E8F3C 001E5F3C  38 00 00 00 */	li r0, 0
/* 801E8F40 001E5F40  D3 A3 00 08 */	stfs f29, 8(r3)
/* 801E8F44 001E5F44  D3 C3 00 0C */	stfs f30, 0xc(r3)
/* 801E8F48 001E5F48  D3 E3 00 34 */	stfs f31, 0x34(r3)
/* 801E8F4C 001E5F4C  98 83 00 18 */	stb r4, 0x18(r3)
/* 801E8F50 001E5F50  98 83 00 19 */	stb r4, 0x19(r3)
/* 801E8F54 001E5F54  98 83 00 1A */	stb r4, 0x1a(r3)
/* 801E8F58 001E5F58  98 83 00 1B */	stb r4, 0x1b(r3)
/* 801E8F5C 001E5F5C  98 83 00 1C */	stb r4, 0x1c(r3)
/* 801E8F60 001E5F60  98 83 00 1D */	stb r4, 0x1d(r3)
/* 801E8F64 001E5F64  98 83 00 1E */	stb r4, 0x1e(r3)
/* 801E8F68 001E5F68  D0 03 00 20 */	stfs f0, 0x20(r3)
/* 801E8F6C 001E5F6C  D0 03 00 24 */	stfs f0, 0x24(r3)
/* 801E8F70 001E5F70  D0 03 00 28 */	stfs f0, 0x28(r3)
/* 801E8F74 001E5F74  D0 03 00 2C */	stfs f0, 0x2c(r3)
/* 801E8F78 001E5F78  D0 03 00 30 */	stfs f0, 0x30(r3)
/* 801E8F7C 001E5F7C  90 83 00 3C */	stw r4, 0x3c(r3)
/* 801E8F80 001E5F80  90 03 00 38 */	stw r0, 0x38(r3)
/* 801E8F84 001E5F84  7F E3 FB 78 */	mr r3, r31
/* 801E8F88 001E5F88  E3 E1 00 58 */	psq_l f31, 88(r1), 0, qr0
/* 801E8F8C 001E5F8C  CB E1 00 50 */	lfd f31, 0x50(r1)
/* 801E8F90 001E5F90  E3 C1 00 48 */	psq_l f30, 72(r1), 0, qr0
/* 801E8F94 001E5F94  CB C1 00 40 */	lfd f30, 0x40(r1)
/* 801E8F98 001E5F98  E3 A1 00 38 */	psq_l f29, 56(r1), 0, qr0
/* 801E8F9C 001E5F9C  CB A1 00 30 */	lfd f29, 0x30(r1)
/* 801E8FA0 001E5FA0  E3 81 00 28 */	psq_l f28, 40(r1), 0, qr0
/* 801E8FA4 001E5FA4  CB 81 00 20 */	lfd f28, 0x20(r1)
/* 801E8FA8 001E5FA8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801E8FAC 001E5FAC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801E8FB0 001E5FB0  80 01 00 64 */	lwz r0, 0x64(r1)
/* 801E8FB4 001E5FB4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801E8FB8 001E5FB8  7C 08 03 A6 */	mtlr r0
/* 801E8FBC 001E5FBC  38 21 00 60 */	addi r1, r1, 0x60
/* 801E8FC0 001E5FC0  4E 80 00 20 */	blr 
