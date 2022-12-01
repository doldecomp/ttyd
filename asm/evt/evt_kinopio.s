.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

# This doesnt feel like it belongs in evt_kinopio.
# TODO: Does it really go in this file?
.global N_cameraman_on
N_cameraman_on:
/* 800EC3A8 000E93A8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC3AC 000E93AC  7C 08 02 A6 */	mflr r0
/* 800EC3B0 000E93B0  3C 60 80 2F */	lis r3, lbl_802ECE64@ha
/* 800EC3B4 000E93B4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC3B8 000E93B8  38 63 CE 64 */	addi r3, r3, lbl_802ECE64@l
/* 800EC3BC 000E93BC  4B F5 CC B9 */	bl npcNameToPtr
/* 800EC3C0 000E93C0  80 63 01 04 */	lwz r3, 0x104(r3)
/* 800EC3C4 000E93C4  38 80 18 00 */	li r4, 0x1800
/* 800EC3C8 000E93C8  4B F5 3C CD */	bl animPoseSetMaterialFlagOn
/* 800EC3CC 000E93CC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC3D0 000E93D0  38 60 00 02 */	li r3, 2
/* 800EC3D4 000E93D4  7C 08 03 A6 */	mtlr r0
/* 800EC3D8 000E93D8  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC3DC 000E93DC  4E 80 00 20 */	blr 

.global snd_on
snd_on:
/* 800EC3E0 000E93E0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC3E4 000E93E4  7C 08 02 A6 */	mflr r0
/* 800EC3E8 000E93E8  38 60 00 80 */	li r3, 0x80
/* 800EC3EC 000E93EC  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC3F0 000E93F0  4B FE B7 79 */	bl psndClearFlag
/* 800EC3F4 000E93F4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC3F8 000E93F8  38 60 00 02 */	li r3, 2
/* 800EC3FC 000E93FC  7C 08 03 A6 */	mtlr r0
/* 800EC400 000E9400  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC404 000E9404  4E 80 00 20 */	blr 

.global snd_off
snd_off:
/* 800EC408 000E9408  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC40C 000E940C  7C 08 02 A6 */	mflr r0
/* 800EC410 000E9410  38 60 00 80 */	li r3, 0x80
/* 800EC414 000E9414  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC418 000E9418  4B FE B7 69 */	bl psndSetFlag
/* 800EC41C 000E941C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC420 000E9420  38 60 00 02 */	li r3, 2
/* 800EC424 000E9424  7C 08 03 A6 */	mtlr r0
/* 800EC428 000E9428  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC42C 000E942C  4E 80 00 20 */	blr 

.global breakfast
breakfast:
/* 800EC430 000E9430  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC434 000E9434  7C 08 02 A6 */	mflr r0
/* 800EC438 000E9438  3C 60 80 2F */	lis r3, lbl_802ECF00@ha
/* 800EC43C 000E943C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC440 000E9440  38 63 CF 00 */	addi r3, r3, lbl_802ECF00@l
/* 800EC444 000E9444  4B FB F4 85 */	bl itemNameToPtr
/* 800EC448 000E9448  28 03 00 00 */	cmplwi r3, 0
/* 800EC44C 000E944C  41 82 00 10 */	beq lbl_800EC45C
/* 800EC450 000E9450  A0 03 00 00 */	lhz r0, 0(r3)
/* 800EC454 000E9454  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800EC458 000E9458  40 82 00 3C */	bne lbl_800EC494
lbl_800EC45C:
/* 800EC45C 000E945C  80 6D 95 D8 */	lwz r3, lbl_80410838@sda21(r13)
/* 800EC460 000E9460  80 A3 00 00 */	lwz r5, 0(r3)
/* 800EC464 000E9464  80 85 00 00 */	lwz r4, 0(r5)
/* 800EC468 000E9468  2C 04 00 00 */	cmpwi r4, 0
/* 800EC46C 000E946C  41 82 00 28 */	beq lbl_800EC494
/* 800EC470 000E9470  3C 60 80 2F */	lis r3, lbl_802ECF00@ha
/* 800EC474 000E9474  C0 25 00 04 */	lfs f1, 4(r5)
/* 800EC478 000E9478  C0 45 00 08 */	lfs f2, 8(r5)
/* 800EC47C 000E947C  38 63 CF 00 */	addi r3, r3, lbl_802ECF00@l
/* 800EC480 000E9480  C0 65 00 0C */	lfs f3, 0xc(r5)
/* 800EC484 000E9484  38 A0 00 10 */	li r5, 0x10
/* 800EC488 000E9488  38 C0 FF FF */	li r6, -1
/* 800EC48C 000E948C  38 E0 00 00 */	li r7, 0
/* 800EC490 000E9490  4B FB F5 D1 */	bl itemEntry
lbl_800EC494:
/* 800EC494 000E9494  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC498 000E9498  38 60 00 02 */	li r3, 2
/* 800EC49C 000E949C  7C 08 03 A6 */	mtlr r0
/* 800EC4A0 000E94A0  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC4A4 000E94A4  4E 80 00 20 */	blr 
/* 800EC4A8 000E94A8  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800EC4AC 000E94AC  7C 08 02 A6 */	mflr r0
/* 800EC4B0 000E94B0  90 01 00 34 */	stw r0, 0x34(r1)
/* 800EC4B4 000E94B4  DB E1 00 20 */	stfd f31, 0x20(r1)
/* 800EC4B8 000E94B8  F3 E1 00 28 */	psq_st f31, 40(r1), 0, qr0
/* 800EC4BC 000E94BC  DB C1 00 10 */	stfd f30, 0x10(r1)
/* 800EC4C0 000E94C0  F3 C1 00 18 */	psq_st f30, 24(r1), 0, qr0
/* 800EC4C4 000E94C4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC4C8 000E94C8  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC4CC 000E94CC  7C 7E 1B 78 */	mr r30, r3
/* 800EC4D0 000E94D0  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC4D4 000E94D4  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC4D8 000E94D8  4B F4 3C D5 */	bl evtGetFloat
/* 800EC4DC 000E94DC  FF E0 08 90 */	fmr f31, f1
/* 800EC4E0 000E94E0  38 60 00 04 */	li r3, 4
/* 800EC4E4 000E94E4  4B F2 2C 6D */	bl camGetPtr
/* 800EC4E8 000E94E8  C0 43 01 14 */	lfs f2, 0x114(r3)
/* 800EC4EC 000E94EC  C0 02 A8 F4 */	lfs f0, lbl_8041BC74@sda21(r2)
/* 800EC4F0 000E94F0  C0 22 A8 F0 */	lfs f1, lbl_8041BC70@sda21(r2)
/* 800EC4F4 000E94F4  EC 40 10 2A */	fadds f2, f0, f2
/* 800EC4F8 000E94F8  C0 02 A8 F8 */	lfs f0, lbl_8041BC78@sda21(r2)
/* 800EC4FC 000E94FC  EC 21 00 B2 */	fmuls f1, f1, f2
/* 800EC500 000E9500  EF C1 00 24 */	fdivs f30, f1, f0
/* 800EC504 000E9504  FC 20 F0 90 */	fmr f1, f30
/* 800EC508 000E9508  48 17 FE F1 */	bl sin
/* 800EC50C 000E950C  FC 00 08 18 */	frsp f0, f1
/* 800EC510 000E9510  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC514 000E9514  7F C3 F3 78 */	mr r3, r30
/* 800EC518 000E9518  FC 00 00 50 */	fneg f0, f0
/* 800EC51C 000E951C  EC 3F 00 32 */	fmuls f1, f31, f0
/* 800EC520 000E9520  4B F4 39 09 */	bl evtSetFloat
/* 800EC524 000E9524  FC 20 F0 90 */	fmr f1, f30
/* 800EC528 000E9528  48 17 F9 69 */	bl cos
/* 800EC52C 000E952C  FC 00 08 18 */	frsp f0, f1
/* 800EC530 000E9530  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC534 000E9534  7F C3 F3 78 */	mr r3, r30
/* 800EC538 000E9538  EC 3F 00 32 */	fmuls f1, f31, f0
/* 800EC53C 000E953C  4B F4 38 ED */	bl evtSetFloat
/* 800EC540 000E9540  38 60 00 02 */	li r3, 2
/* 800EC544 000E9544  E3 E1 00 28 */	psq_l f31, 40(r1), 0, qr0
/* 800EC548 000E9548  CB E1 00 20 */	lfd f31, 0x20(r1)
/* 800EC54C 000E954C  E3 C1 00 18 */	psq_l f30, 24(r1), 0, qr0
/* 800EC550 000E9550  CB C1 00 10 */	lfd f30, 0x10(r1)
/* 800EC554 000E9554  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC558 000E9558  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800EC55C 000E955C  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC560 000E9560  7C 08 03 A6 */	mtlr r0
/* 800EC564 000E9564  38 21 00 30 */	addi r1, r1, 0x30
/* 800EC568 000E9568  4E 80 00 20 */	blr 

.global paper_off
paper_off:
/* 800EC56C 000E956C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC570 000E9570  7C 08 02 A6 */	mflr r0
/* 800EC574 000E9574  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC578 000E9578  4B F6 B6 59 */	bl marioPaperOff
/* 800EC57C 000E957C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC580 000E9580  38 60 00 02 */	li r3, 2
/* 800EC584 000E9584  7C 08 03 A6 */	mtlr r0
/* 800EC588 000E9588  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC58C 000E958C  4E 80 00 20 */	blr 

.global paper_on
paper_on:
/* 800EC590 000E9590  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800EC594 000E9594  7C 08 02 A6 */	mflr r0
/* 800EC598 000E9598  90 01 00 44 */	stw r0, 0x44(r1)
/* 800EC59C 000E959C  DB E1 00 30 */	stfd f31, 0x30(r1)
/* 800EC5A0 000E95A0  F3 E1 00 38 */	psq_st f31, 56(r1), 0, qr0
/* 800EC5A4 000E95A4  DB C1 00 20 */	stfd f30, 0x20(r1)
/* 800EC5A8 000E95A8  F3 C1 00 28 */	psq_st f30, 40(r1), 0, qr0
/* 800EC5AC 000E95AC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800EC5B0 000E95B0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800EC5B4 000E95B4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800EC5B8 000E95B8  7C 7D 1B 78 */	mr r29, r3
/* 800EC5BC 000E95BC  3C A0 80 2F */	lis r5, lbl_802ECE50@ha
/* 800EC5C0 000E95C0  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 800EC5C4 000E95C4  7C 9F 23 78 */	mr r31, r4
/* 800EC5C8 000E95C8  3B C5 CE 50 */	addi r30, r5, lbl_802ECE50@l
/* 800EC5CC 000E95CC  80 86 00 00 */	lwz r4, 0(r6)
/* 800EC5D0 000E95D0  4B F4 3B DD */	bl evtGetFloat
/* 800EC5D4 000E95D4  FF E0 08 90 */	fmr f31, f1
/* 800EC5D8 000E95D8  4B F7 0C 3D */	bl marioGetPtr
/* 800EC5DC 000E95DC  2C 1F 00 00 */	cmpwi r31, 0
/* 800EC5E0 000E95E0  7C 7F 1B 78 */	mr r31, r3
/* 800EC5E4 000E95E4  41 82 00 24 */	beq lbl_800EC608
/* 800EC5E8 000E95E8  38 7E 00 BC */	addi r3, r30, 0xbc
/* 800EC5EC 000E95EC  4B F6 B6 65 */	bl marioPaperOn
/* 800EC5F0 000E95F0  38 62 A8 FC */	addi r3, r2, lbl_8041BC7C@sda21
/* 800EC5F4 000E95F4  4B F6 B9 51 */	bl marioChgPose
/* 800EC5F8 000E95F8  38 7E 00 C4 */	addi r3, r30, 0xc4
/* 800EC5FC 000E95FC  4B F6 B8 2D */	bl marioChgPaper
/* 800EC600 000E9600  38 00 00 00 */	li r0, 0
/* 800EC604 000E9604  90 1D 00 78 */	stw r0, 0x78(r29)
lbl_800EC608:
/* 800EC608 000E9608  80 1D 00 78 */	lwz r0, 0x78(r29)
/* 800EC60C 000E960C  2C 00 00 1E */	cmpwi r0, 0x1e
/* 800EC610 000E9610  40 80 00 BC */	bge lbl_800EC6CC
/* 800EC614 000E9614  80 6D 90 B0 */	lwz r3, gp@sda21(r13)
/* 800EC618 000E9618  38 9E 00 60 */	addi r4, r30, 0x60
/* 800EC61C 000E961C  38 63 01 2C */	addi r3, r3, 0x12c
/* 800EC620 000E9620  48 17 AE 2D */	bl strcmp
/* 800EC624 000E9624  2C 03 00 00 */	cmpwi r3, 0
/* 800EC628 000E9628  40 82 00 50 */	bne lbl_800EC678
/* 800EC62C 000E962C  C0 22 A8 F0 */	lfs f1, lbl_8041BC70@sda21(r2)
/* 800EC630 000E9630  C0 02 A8 F8 */	lfs f0, lbl_8041BC78@sda21(r2)
/* 800EC634 000E9634  EC 21 07 F2 */	fmuls f1, f1, f31
/* 800EC638 000E9638  EF C1 00 24 */	fdivs f30, f1, f0
/* 800EC63C 000E963C  FC 20 F0 90 */	fmr f1, f30
/* 800EC640 000E9640  48 17 F8 51 */	bl cos
/* 800EC644 000E9644  FC 60 08 18 */	frsp f3, f1
/* 800EC648 000E9648  C0 42 A9 04 */	lfs f2, lbl_8041BC84@sda21(r2)
/* 800EC64C 000E964C  C0 1F 00 8C */	lfs f0, 0x8c(r31)
/* 800EC650 000E9650  FC 20 F0 90 */	fmr f1, f30
/* 800EC654 000E9654  EC 02 00 FC */	fnmsubs f0, f2, f3, f0
/* 800EC658 000E9658  D0 1F 00 8C */	stfs f0, 0x8c(r31)
/* 800EC65C 000E965C  48 17 FD 9D */	bl sin
/* 800EC660 000E9660  FC 40 08 18 */	frsp f2, f1
/* 800EC664 000E9664  C0 22 A9 04 */	lfs f1, lbl_8041BC84@sda21(r2)
/* 800EC668 000E9668  C0 1F 00 94 */	lfs f0, 0x94(r31)
/* 800EC66C 000E966C  EC 01 00 BC */	fnmsubs f0, f1, f2, f0
/* 800EC670 000E9670  D0 1F 00 94 */	stfs f0, 0x94(r31)
/* 800EC674 000E9674  48 00 00 4C */	b lbl_800EC6C0
lbl_800EC678:
/* 800EC678 000E9678  C0 22 A8 F0 */	lfs f1, lbl_8041BC70@sda21(r2)
/* 800EC67C 000E967C  C0 02 A8 F8 */	lfs f0, lbl_8041BC78@sda21(r2)
/* 800EC680 000E9680  EC 21 07 F2 */	fmuls f1, f1, f31
/* 800EC684 000E9684  EF C1 00 24 */	fdivs f30, f1, f0
/* 800EC688 000E9688  FC 20 F0 90 */	fmr f1, f30
/* 800EC68C 000E968C  48 17 F8 05 */	bl cos
/* 800EC690 000E9690  FC 60 08 18 */	frsp f3, f1
/* 800EC694 000E9694  C0 42 A9 04 */	lfs f2, lbl_8041BC84@sda21(r2)
/* 800EC698 000E9698  C0 1F 00 8C */	lfs f0, 0x8c(r31)
/* 800EC69C 000E969C  FC 20 F0 90 */	fmr f1, f30
/* 800EC6A0 000E96A0  EC 02 00 FA */	fmadds f0, f2, f3, f0
/* 800EC6A4 000E96A4  D0 1F 00 8C */	stfs f0, 0x8c(r31)
/* 800EC6A8 000E96A8  48 17 FD 51 */	bl sin
/* 800EC6AC 000E96AC  FC 40 08 18 */	frsp f2, f1
/* 800EC6B0 000E96B0  C0 22 A9 04 */	lfs f1, lbl_8041BC84@sda21(r2)
/* 800EC6B4 000E96B4  C0 1F 00 94 */	lfs f0, 0x94(r31)
/* 800EC6B8 000E96B8  EC 01 00 BA */	fmadds f0, f1, f2, f0
/* 800EC6BC 000E96BC  D0 1F 00 94 */	stfs f0, 0x94(r31)
lbl_800EC6C0:
/* 800EC6C0 000E96C0  80 7D 00 78 */	lwz r3, 0x78(r29)
/* 800EC6C4 000E96C4  38 03 00 01 */	addi r0, r3, 1
/* 800EC6C8 000E96C8  90 1D 00 78 */	stw r0, 0x78(r29)
lbl_800EC6CC:
/* 800EC6CC 000E96CC  D3 FF 01 AC */	stfs f31, 0x1ac(r31)
/* 800EC6D0 000E96D0  38 60 00 00 */	li r3, 0
/* 800EC6D4 000E96D4  D3 FF 01 A8 */	stfs f31, 0x1a8(r31)
/* 800EC6D8 000E96D8  E3 E1 00 38 */	psq_l f31, 56(r1), 0, qr0
/* 800EC6DC 000E96DC  CB E1 00 30 */	lfd f31, 0x30(r1)
/* 800EC6E0 000E96E0  E3 C1 00 28 */	psq_l f30, 40(r1), 0, qr0
/* 800EC6E4 000E96E4  CB C1 00 20 */	lfd f30, 0x20(r1)
/* 800EC6E8 000E96E8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800EC6EC 000E96EC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800EC6F0 000E96F0  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800EC6F4 000E96F4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800EC6F8 000E96F8  7C 08 03 A6 */	mtlr r0
/* 800EC6FC 000E96FC  38 21 00 40 */	addi r1, r1, 0x40
/* 800EC700 000E9700  4E 80 00 20 */	blr 

.global get_from_bed_evt
get_from_bed_evt:
/* 800EC704 000E9704  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC708 000E9708  7C 08 02 A6 */	mflr r0
/* 800EC70C 000E970C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC710 000E9710  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC714 000E9714  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 800EC718 000E9718  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC71C 000E971C  80 86 00 00 */	lwz r4, 0(r6)
/* 800EC720 000E9720  80 A5 00 94 */	lwz r5, 0x94(r5)
/* 800EC724 000E9724  4B F4 3F 45 */	bl evtSetValue
/* 800EC728 000E9728  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC72C 000E972C  38 60 00 02 */	li r3, 2
/* 800EC730 000E9730  7C 08 03 A6 */	mtlr r0
/* 800EC734 000E9734  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC738 000E9738  4E 80 00 20 */	blr 

.global get_to_bed_evt
get_to_bed_evt:
/* 800EC73C 000E973C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC740 000E9740  7C 08 02 A6 */	mflr r0
/* 800EC744 000E9744  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC748 000E9748  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC74C 000E974C  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 800EC750 000E9750  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC754 000E9754  80 86 00 00 */	lwz r4, 0(r6)
/* 800EC758 000E9758  80 A5 00 90 */	lwz r5, 0x90(r5)
/* 800EC75C 000E975C  4B F4 3F 0D */	bl evtSetValue
/* 800EC760 000E9760  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC764 000E9764  38 60 00 02 */	li r3, 2
/* 800EC768 000E9768  7C 08 03 A6 */	mtlr r0
/* 800EC76C 000E976C  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC770 000E9770  4E 80 00 20 */	blr 

.global get_cam
get_cam:
/* 800EC774 000E9774  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC778 000E9778  7C 08 02 A6 */	mflr r0
/* 800EC77C 000E977C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC780 000E9780  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC784 000E9784  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC788 000E9788  7C 7E 1B 78 */	mr r30, r3
/* 800EC78C 000E978C  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC790 000E9790  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC794 000E9794  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC798 000E9798  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC79C 000E979C  C0 25 00 2C */	lfs f1, 0x2c(r5)
/* 800EC7A0 000E97A0  4B F4 36 89 */	bl evtSetFloat
/* 800EC7A4 000E97A4  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC7A8 000E97A8  7F C3 F3 78 */	mr r3, r30
/* 800EC7AC 000E97AC  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC7B0 000E97B0  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC7B4 000E97B4  C0 25 00 30 */	lfs f1, 0x30(r5)
/* 800EC7B8 000E97B8  4B F4 36 71 */	bl evtSetFloat
/* 800EC7BC 000E97BC  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC7C0 000E97C0  7F C3 F3 78 */	mr r3, r30
/* 800EC7C4 000E97C4  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC7C8 000E97C8  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC7CC 000E97CC  C0 25 00 34 */	lfs f1, 0x34(r5)
/* 800EC7D0 000E97D0  4B F4 36 59 */	bl evtSetFloat
/* 800EC7D4 000E97D4  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC7D8 000E97D8  7F C3 F3 78 */	mr r3, r30
/* 800EC7DC 000E97DC  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 800EC7E0 000E97E0  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC7E4 000E97E4  C0 25 00 38 */	lfs f1, 0x38(r5)
/* 800EC7E8 000E97E8  4B F4 36 41 */	bl evtSetFloat
/* 800EC7EC 000E97EC  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC7F0 000E97F0  7F C3 F3 78 */	mr r3, r30
/* 800EC7F4 000E97F4  80 9F 00 10 */	lwz r4, 0x10(r31)
/* 800EC7F8 000E97F8  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC7FC 000E97FC  C0 25 00 3C */	lfs f1, 0x3c(r5)
/* 800EC800 000E9800  4B F4 36 29 */	bl evtSetFloat
/* 800EC804 000E9804  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC808 000E9808  7F C3 F3 78 */	mr r3, r30
/* 800EC80C 000E980C  80 9F 00 14 */	lwz r4, 0x14(r31)
/* 800EC810 000E9810  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC814 000E9814  C0 25 00 40 */	lfs f1, 0x40(r5)
/* 800EC818 000E9818  4B F4 36 11 */	bl evtSetFloat
/* 800EC81C 000E981C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC820 000E9820  38 60 00 02 */	li r3, 2
/* 800EC824 000E9824  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC828 000E9828  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC82C 000E982C  7C 08 03 A6 */	mtlr r0
/* 800EC830 000E9830  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC834 000E9834  4E 80 00 20 */	blr 

.global get_npctalk
get_npctalk:
/* 800EC838 000E9838  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC83C 000E983C  7C 08 02 A6 */	mflr r0
/* 800EC840 000E9840  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC844 000E9844  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC848 000E9848  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC84C 000E984C  7C 7E 1B 78 */	mr r30, r3
/* 800EC850 000E9850  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC854 000E9854  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC858 000E9858  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC85C 000E985C  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC860 000E9860  C0 25 00 48 */	lfs f1, 0x48(r5)
/* 800EC864 000E9864  4B F4 35 C5 */	bl evtSetFloat
/* 800EC868 000E9868  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC86C 000E986C  7F C3 F3 78 */	mr r3, r30
/* 800EC870 000E9870  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC874 000E9874  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC878 000E9878  C0 25 00 4C */	lfs f1, 0x4c(r5)
/* 800EC87C 000E987C  4B F4 35 AD */	bl evtSetFloat
/* 800EC880 000E9880  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC884 000E9884  7F C3 F3 78 */	mr r3, r30
/* 800EC888 000E9888  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC88C 000E988C  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC890 000E9890  C0 25 00 50 */	lfs f1, 0x50(r5)
/* 800EC894 000E9894  4B F4 35 95 */	bl evtSetFloat
/* 800EC898 000E9898  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC89C 000E989C  38 60 00 02 */	li r3, 2
/* 800EC8A0 000E98A0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC8A4 000E98A4  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC8A8 000E98A8  7C 08 03 A6 */	mtlr r0
/* 800EC8AC 000E98AC  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC8B0 000E98B0  4E 80 00 20 */	blr 

.global get_beddeg
get_beddeg:
/* 800EC8B4 000E98B4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC8B8 000E98B8  7C 08 02 A6 */	mflr r0
/* 800EC8BC 000E98BC  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC8C0 000E98C0  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC8C4 000E98C4  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 800EC8C8 000E98C8  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC8CC 000E98CC  80 86 00 00 */	lwz r4, 0(r6)
/* 800EC8D0 000E98D0  C0 25 00 44 */	lfs f1, 0x44(r5)
/* 800EC8D4 000E98D4  4B F4 35 55 */	bl evtSetFloat
/* 800EC8D8 000E98D8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC8DC 000E98DC  38 60 00 02 */	li r3, 2
/* 800EC8E0 000E98E0  7C 08 03 A6 */	mtlr r0
/* 800EC8E4 000E98E4  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC8E8 000E98E8  4E 80 00 20 */	blr 

.global get_bedside
get_bedside:
/* 800EC8EC 000E98EC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC8F0 000E98F0  7C 08 02 A6 */	mflr r0
/* 800EC8F4 000E98F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC8F8 000E98F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC8FC 000E98FC  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC900 000E9900  7C 7E 1B 78 */	mr r30, r3
/* 800EC904 000E9904  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC908 000E9908  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC90C 000E990C  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC910 000E9910  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC914 000E9914  C0 25 00 20 */	lfs f1, 0x20(r5)
/* 800EC918 000E9918  4B F4 35 11 */	bl evtSetFloat
/* 800EC91C 000E991C  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC920 000E9920  7F C3 F3 78 */	mr r3, r30
/* 800EC924 000E9924  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC928 000E9928  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC92C 000E992C  C0 25 00 24 */	lfs f1, 0x24(r5)
/* 800EC930 000E9930  4B F4 34 F9 */	bl evtSetFloat
/* 800EC934 000E9934  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC938 000E9938  7F C3 F3 78 */	mr r3, r30
/* 800EC93C 000E993C  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC940 000E9940  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC944 000E9944  C0 25 00 28 */	lfs f1, 0x28(r5)
/* 800EC948 000E9948  4B F4 34 E1 */	bl evtSetFloat
/* 800EC94C 000E994C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC950 000E9950  38 60 00 02 */	li r3, 2
/* 800EC954 000E9954  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC958 000E9958  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC95C 000E995C  7C 08 03 A6 */	mtlr r0
/* 800EC960 000E9960  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC964 000E9964  4E 80 00 20 */	blr 

.global get_bed
get_bed:
/* 800EC968 000E9968  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC96C 000E996C  7C 08 02 A6 */	mflr r0
/* 800EC970 000E9970  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC974 000E9974  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800EC978 000E9978  93 C1 00 08 */	stw r30, 8(r1)
/* 800EC97C 000E997C  7C 7E 1B 78 */	mr r30, r3
/* 800EC980 000E9980  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC984 000E9984  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800EC988 000E9988  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC98C 000E998C  80 9F 00 00 */	lwz r4, 0(r31)
/* 800EC990 000E9990  C0 25 00 14 */	lfs f1, 0x14(r5)
/* 800EC994 000E9994  4B F4 34 95 */	bl evtSetFloat
/* 800EC998 000E9998  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC99C 000E999C  7F C3 F3 78 */	mr r3, r30
/* 800EC9A0 000E99A0  80 9F 00 04 */	lwz r4, 4(r31)
/* 800EC9A4 000E99A4  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC9A8 000E99A8  C0 25 00 18 */	lfs f1, 0x18(r5)
/* 800EC9AC 000E99AC  4B F4 34 7D */	bl evtSetFloat
/* 800EC9B0 000E99B0  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800EC9B4 000E99B4  7F C3 F3 78 */	mr r3, r30
/* 800EC9B8 000E99B8  80 9F 00 08 */	lwz r4, 8(r31)
/* 800EC9BC 000E99BC  80 A5 00 00 */	lwz r5, 0(r5)
/* 800EC9C0 000E99C0  C0 25 00 1C */	lfs f1, 0x1c(r5)
/* 800EC9C4 000E99C4  4B F4 34 65 */	bl evtSetFloat
/* 800EC9C8 000E99C8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800EC9CC 000E99CC  38 60 00 02 */	li r3, 2
/* 800EC9D0 000E99D0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800EC9D4 000E99D4  83 C1 00 08 */	lwz r30, 8(r1)
/* 800EC9D8 000E99D8  7C 08 03 A6 */	mtlr r0
/* 800EC9DC 000E99DC  38 21 00 10 */	addi r1, r1, 0x10
/* 800EC9E0 000E99E0  4E 80 00 20 */	blr 

.global get_npcname
get_npcname:
/* 800EC9E4 000E99E4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800EC9E8 000E99E8  7C 08 02 A6 */	mflr r0
/* 800EC9EC 000E99EC  90 01 00 14 */	stw r0, 0x14(r1)
/* 800EC9F0 000E99F0  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800EC9F4 000E99F4  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 800EC9F8 000E99F8  80 A4 00 00 */	lwz r5, 0(r4)
/* 800EC9FC 000E99FC  80 86 00 00 */	lwz r4, 0(r6)
/* 800ECA00 000E9A00  80 A5 00 54 */	lwz r5, 0x54(r5)
/* 800ECA04 000E9A04  4B F4 3C 65 */	bl evtSetValue
/* 800ECA08 000E9A08  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800ECA0C 000E9A0C  38 60 00 02 */	li r3, 2
/* 800ECA10 000E9A10  7C 08 03 A6 */	mtlr r0
/* 800ECA14 000E9A14  38 21 00 10 */	addi r1, r1, 0x10
/* 800ECA18 000E9A18  4E 80 00 20 */	blr 

.global get_ryoukin
get_ryoukin:
/* 800ECA1C 000E9A1C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800ECA20 000E9A20  7C 08 02 A6 */	mflr r0
/* 800ECA24 000E9A24  90 01 00 14 */	stw r0, 0x14(r1)
/* 800ECA28 000E9A28  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800ECA2C 000E9A2C  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 800ECA30 000E9A30  80 A4 00 00 */	lwz r5, 0(r4)
/* 800ECA34 000E9A34  80 86 00 00 */	lwz r4, 0(r6)
/* 800ECA38 000E9A38  80 A5 00 10 */	lwz r5, 0x10(r5)
/* 800ECA3C 000E9A3C  4B F4 3C 2D */	bl evtSetValue
/* 800ECA40 000E9A40  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800ECA44 000E9A44  38 60 00 02 */	li r3, 2
/* 800ECA48 000E9A48  7C 08 03 A6 */	mtlr r0
/* 800ECA4C 000E9A4C  38 21 00 10 */	addi r1, r1, 0x10
/* 800ECA50 000E9A50  4E 80 00 20 */	blr 

.global coin_chk
coin_chk:
/* 800ECA54 000E9A54  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800ECA58 000E9A58  7C 08 02 A6 */	mflr r0
/* 800ECA5C 000E9A5C  90 01 00 14 */	stw r0, 0x14(r1)
/* 800ECA60 000E9A60  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800ECA64 000E9A64  93 C1 00 08 */	stw r30, 8(r1)
/* 800ECA68 000E9A68  7C 7E 1B 78 */	mr r30, r3
/* 800ECA6C 000E9A6C  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800ECA70 000E9A70  4B FE 32 A9 */	bl func_800CFD18
/* 800ECA74 000E9A74  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800ECA78 000E9A78  80 84 00 00 */	lwz r4, 0(r4)
/* 800ECA7C 000E9A7C  80 04 00 10 */	lwz r0, 0x10(r4)
/* 800ECA80 000E9A80  7C 03 00 00 */	cmpw r3, r0
/* 800ECA84 000E9A84  40 80 00 18 */	bge lbl_800ECA9C
/* 800ECA88 000E9A88  80 9F 00 00 */	lwz r4, 0(r31)
/* 800ECA8C 000E9A8C  7F C3 F3 78 */	mr r3, r30
/* 800ECA90 000E9A90  38 A0 00 01 */	li r5, 1
/* 800ECA94 000E9A94  4B F4 3B D5 */	bl evtSetValue
/* 800ECA98 000E9A98  48 00 00 14 */	b lbl_800ECAAC
lbl_800ECA9C:
/* 800ECA9C 000E9A9C  80 9F 00 00 */	lwz r4, 0(r31)
/* 800ECAA0 000E9AA0  7F C3 F3 78 */	mr r3, r30
/* 800ECAA4 000E9AA4  38 A0 00 00 */	li r5, 0
/* 800ECAA8 000E9AA8  4B F4 3B C1 */	bl evtSetValue
lbl_800ECAAC:
/* 800ECAAC 000E9AAC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800ECAB0 000E9AB0  38 60 00 02 */	li r3, 2
/* 800ECAB4 000E9AB4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800ECAB8 000E9AB8  83 C1 00 08 */	lwz r30, 8(r1)
/* 800ECABC 000E9ABC  7C 08 03 A6 */	mtlr r0
/* 800ECAC0 000E9AC0  38 21 00 10 */	addi r1, r1, 0x10
/* 800ECAC4 000E9AC4  4E 80 00 20 */	blr 

.global power_chk
power_chk:
/* 800ECAC8 000E9AC8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800ECACC 000E9ACC  7C 08 02 A6 */	mflr r0
/* 800ECAD0 000E9AD0  90 01 00 24 */	stw r0, 0x24(r1)
/* 800ECAD4 000E9AD4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800ECAD8 000E9AD8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800ECADC 000E9ADC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800ECAE0 000E9AE0  93 81 00 10 */	stw r28, 0x10(r1)
/* 800ECAE4 000E9AE4  7C 7C 1B 78 */	mr r28, r3
/* 800ECAE8 000E9AE8  83 C3 00 18 */	lwz r30, 0x18(r3)
/* 800ECAEC 000E9AEC  4B FE 51 89 */	bl func_800D1C74
/* 800ECAF0 000E9AF0  38 00 00 02 */	li r0, 2
/* 800ECAF4 000E9AF4  3B A0 00 01 */	li r29, 1
/* 800ECAF8 000E9AF8  38 A0 00 00 */	li r5, 0
/* 800ECAFC 000E9AFC  7C 09 03 A6 */	mtctr r0
lbl_800ECB00:
/* 800ECB00 000E9B00  A0 03 00 00 */	lhz r0, 0(r3)
/* 800ECB04 000E9B04  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800ECB08 000E9B08  41 82 00 1C */	beq lbl_800ECB24
/* 800ECB0C 000E9B0C  A8 83 00 06 */	lha r4, 6(r3)
/* 800ECB10 000E9B10  A8 03 00 02 */	lha r0, 2(r3)
/* 800ECB14 000E9B14  7C 04 00 00 */	cmpw r4, r0
/* 800ECB18 000E9B18  41 82 00 0C */	beq lbl_800ECB24
/* 800ECB1C 000E9B1C  3B A0 00 00 */	li r29, 0
/* 800ECB20 000E9B20  48 00 00 7C */	b lbl_800ECB9C
lbl_800ECB24:
/* 800ECB24 000E9B24  A0 03 00 0E */	lhz r0, 0xe(r3)
/* 800ECB28 000E9B28  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800ECB2C 000E9B2C  41 82 00 1C */	beq lbl_800ECB48
/* 800ECB30 000E9B30  A8 83 00 14 */	lha r4, 0x14(r3)
/* 800ECB34 000E9B34  A8 03 00 10 */	lha r0, 0x10(r3)
/* 800ECB38 000E9B38  7C 04 00 00 */	cmpw r4, r0
/* 800ECB3C 000E9B3C  41 82 00 0C */	beq lbl_800ECB48
/* 800ECB40 000E9B40  3B A0 00 00 */	li r29, 0
/* 800ECB44 000E9B44  48 00 00 58 */	b lbl_800ECB9C
lbl_800ECB48:
/* 800ECB48 000E9B48  A0 03 00 1C */	lhz r0, 0x1c(r3)
/* 800ECB4C 000E9B4C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800ECB50 000E9B50  41 82 00 1C */	beq lbl_800ECB6C
/* 800ECB54 000E9B54  A8 83 00 22 */	lha r4, 0x22(r3)
/* 800ECB58 000E9B58  A8 03 00 1E */	lha r0, 0x1e(r3)
/* 800ECB5C 000E9B5C  7C 04 00 00 */	cmpw r4, r0
/* 800ECB60 000E9B60  41 82 00 0C */	beq lbl_800ECB6C
/* 800ECB64 000E9B64  3B A0 00 00 */	li r29, 0
/* 800ECB68 000E9B68  48 00 00 34 */	b lbl_800ECB9C
lbl_800ECB6C:
/* 800ECB6C 000E9B6C  A0 03 00 2A */	lhz r0, 0x2a(r3)
/* 800ECB70 000E9B70  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800ECB74 000E9B74  41 82 00 1C */	beq lbl_800ECB90
/* 800ECB78 000E9B78  A8 83 00 30 */	lha r4, 0x30(r3)
/* 800ECB7C 000E9B7C  A8 03 00 2C */	lha r0, 0x2c(r3)
/* 800ECB80 000E9B80  7C 04 00 00 */	cmpw r4, r0
/* 800ECB84 000E9B84  41 82 00 0C */	beq lbl_800ECB90
/* 800ECB88 000E9B88  3B A0 00 00 */	li r29, 0
/* 800ECB8C 000E9B8C  48 00 00 10 */	b lbl_800ECB9C
lbl_800ECB90:
/* 800ECB90 000E9B90  38 63 00 38 */	addi r3, r3, 0x38
/* 800ECB94 000E9B94  38 A5 00 03 */	addi r5, r5, 3
/* 800ECB98 000E9B98  42 00 FF 68 */	bdnz lbl_800ECB00
lbl_800ECB9C:
/* 800ECB9C 000E9B9C  4B FE 30 3D */	bl pouchGetMaxHP
/* 800ECBA0 000E9BA0  7C 7F 1B 78 */	mr r31, r3
/* 800ECBA4 000E9BA4  4B FE 30 41 */	bl pouchGetHP
/* 800ECBA8 000E9BA8  7C 03 F8 00 */	cmpw r3, r31
/* 800ECBAC 000E9BAC  40 82 00 48 */	bne lbl_800ECBF4
/* 800ECBB0 000E9BB0  4B FE 2F 91 */	bl pouchGetMaxFP
/* 800ECBB4 000E9BB4  7C 7F 1B 78 */	mr r31, r3
/* 800ECBB8 000E9BB8  4B FE 2F 95 */	bl pouchGetFP
/* 800ECBBC 000E9BBC  7C 03 F8 00 */	cmpw r3, r31
/* 800ECBC0 000E9BC0  40 82 00 34 */	bne lbl_800ECBF4
/* 800ECBC4 000E9BC4  4B FE 2E A9 */	bl pouchGetMaxAP
/* 800ECBC8 000E9BC8  7C 7F 1B 78 */	mr r31, r3
/* 800ECBCC 000E9BCC  4B FE 2F 2D */	bl pouchGetAP
/* 800ECBD0 000E9BD0  7C 03 F8 00 */	cmpw r3, r31
/* 800ECBD4 000E9BD4  40 82 00 20 */	bne lbl_800ECBF4
/* 800ECBD8 000E9BD8  2C 1D 00 00 */	cmpwi r29, 0
/* 800ECBDC 000E9BDC  41 82 00 18 */	beq lbl_800ECBF4
/* 800ECBE0 000E9BE0  80 9E 00 00 */	lwz r4, 0(r30)
/* 800ECBE4 000E9BE4  7F 83 E3 78 */	mr r3, r28
/* 800ECBE8 000E9BE8  38 A0 00 01 */	li r5, 1
/* 800ECBEC 000E9BEC  4B F4 3A 7D */	bl evtSetValue
/* 800ECBF0 000E9BF0  48 00 00 14 */	b lbl_800ECC04
lbl_800ECBF4:
/* 800ECBF4 000E9BF4  80 9E 00 00 */	lwz r4, 0(r30)
/* 800ECBF8 000E9BF8  7F 83 E3 78 */	mr r3, r28
/* 800ECBFC 000E9BFC  38 A0 00 00 */	li r5, 0
/* 800ECC00 000E9C00  4B F4 3A 69 */	bl evtSetValue
lbl_800ECC04:
/* 800ECC04 000E9C04  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800ECC08 000E9C08  38 60 00 02 */	li r3, 2
/* 800ECC0C 000E9C0C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800ECC10 000E9C10  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800ECC14 000E9C14  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800ECC18 000E9C18  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800ECC1C 000E9C1C  7C 08 03 A6 */	mtlr r0
/* 800ECC20 000E9C20  38 21 00 20 */	addi r1, r1, 0x20
/* 800ECC24 000E9C24  4E 80 00 20 */	blr 

.global msg_no
msg_no:
/* 800ECC28 000E9C28  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800ECC2C 000E9C2C  7C 08 02 A6 */	mflr r0
/* 800ECC30 000E9C30  90 01 00 14 */	stw r0, 0x14(r1)
/* 800ECC34 000E9C34  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800ECC38 000E9C38  93 C1 00 08 */	stw r30, 8(r1)
/* 800ECC3C 000E9C3C  7C 7E 1B 78 */	mr r30, r3
/* 800ECC40 000E9C40  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800ECC44 000E9C44  80 9F 00 00 */	lwz r4, 0(r31)
/* 800ECC48 000E9C48  4B F4 3F 85 */	bl evtGetValue
/* 800ECC4C 000E9C4C  80 AD 95 D8 */	lwz r5, lbl_80410838@sda21(r13)
/* 800ECC50 000E9C50  54 60 10 3A */	slwi r0, r3, 2
/* 800ECC54 000E9C54  80 9F 00 04 */	lwz r4, 4(r31)
/* 800ECC58 000E9C58  7F C3 F3 78 */	mr r3, r30
/* 800ECC5C 000E9C5C  80 A5 00 00 */	lwz r5, 0(r5)
/* 800ECC60 000E9C60  7C A5 02 14 */	add r5, r5, r0
/* 800ECC64 000E9C64  80 A5 00 58 */	lwz r5, 0x58(r5)
/* 800ECC68 000E9C68  4B F4 3A 01 */	bl evtSetValue
/* 800ECC6C 000E9C6C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800ECC70 000E9C70  38 60 00 02 */	li r3, 2
/* 800ECC74 000E9C74  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800ECC78 000E9C78  83 C1 00 08 */	lwz r30, 8(r1)
/* 800ECC7C 000E9C7C  7C 08 03 A6 */	mtlr r0
/* 800ECC80 000E9C80  38 21 00 10 */	addi r1, r1, 0x10
/* 800ECC84 000E9C84  4E 80 00 20 */	blr 

.global evt_kinopio_setup
evt_kinopio_setup:
/* 800ECC88 000E9C88  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800ECC8C 000E9C8C  7C 08 02 A6 */	mflr r0
/* 800ECC90 000E9C90  90 01 00 14 */	stw r0, 0x14(r1)
/* 800ECC94 000E9C94  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800ECC98 000E9C98  93 C1 00 08 */	stw r30, 8(r1)
/* 800ECC9C 000E9C9C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800ECCA0 000E9CA0  80 84 00 00 */	lwz r4, 0(r4)
/* 800ECCA4 000E9CA4  4B F4 3F 29 */	bl evtGetValue
/* 800ECCA8 000E9CA8  7C 7E 1B 78 */	mr r30, r3
/* 800ECCAC 000E9CAC  80 63 00 54 */	lwz r3, 0x54(r3)
/* 800ECCB0 000E9CB0  4B F5 C3 C5 */	bl npcNameToPtr
/* 800ECCB4 000E9CB4  3C 80 80 2F */	lis r4, lbl_802ECF0C@ha
/* 800ECCB8 000E9CB8  7C 7F 1B 78 */	mr r31, r3
/* 800ECCBC 000E9CBC  38 64 CF 0C */	addi r3, r4, lbl_802ECF0C@l
/* 800ECCC0 000E9CC0  38 A0 00 00 */	li r5, 0
/* 800ECCC4 000E9CC4  38 80 00 00 */	li r4, 0
/* 800ECCC8 000E9CC8  4B F4 C9 A9 */	bl animGroupBaseAsync
/* 800ECCCC 000E9CCC  2C 03 00 00 */	cmpwi r3, 0
/* 800ECCD0 000E9CD0  40 82 00 0C */	bne lbl_800ECCDC
/* 800ECCD4 000E9CD4  38 60 00 00 */	li r3, 0
/* 800ECCD8 000E9CD8  48 00 00 1C */	b lbl_800ECCF4
lbl_800ECCDC:
/* 800ECCDC 000E9CDC  3C 80 80 34 */	lis r4, lbl_8033BAB8@ha
/* 800ECCE0 000E9CE0  38 60 00 02 */	li r3, 2
/* 800ECCE4 000E9CE4  38 04 BA B8 */	addi r0, r4, lbl_8033BAB8@l
/* 800ECCE8 000E9CE8  90 1F 01 28 */	stw r0, 0x128(r31)
/* 800ECCEC 000E9CEC  80 8D 95 D8 */	lwz r4, lbl_80410838@sda21(r13)
/* 800ECCF0 000E9CF0  93 C4 00 00 */	stw r30, 0(r4)
lbl_800ECCF4:
/* 800ECCF4 000E9CF4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800ECCF8 000E9CF8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800ECCFC 000E9CFC  83 C1 00 08 */	lwz r30, 8(r1)
/* 800ECD00 000E9D00  7C 08 03 A6 */	mtlr r0
/* 800ECD04 000E9D04  38 21 00 10 */	addi r1, r1, 0x10
/* 800ECD08 000E9D08  4E 80 00 20 */	blr 
