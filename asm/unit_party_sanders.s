.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global _judge_on_stage
_judge_on_stage:
/* 8017C458 00179458  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8017C45C 0017945C  7C 08 02 A6 */	mflr r0
/* 8017C460 00179460  90 01 00 34 */	stw r0, 0x34(r1)
/* 8017C464 00179464  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 8017C468 00179468  93 C1 00 28 */	stw r30, 0x28(r1)
/* 8017C46C 0017946C  93 A1 00 24 */	stw r29, 0x24(r1)
/* 8017C470 00179470  93 81 00 20 */	stw r28, 0x20(r1)
/* 8017C474 00179474  7C 7C 1B 78 */	mr r28, r3
/* 8017C478 00179478  83 CD 17 10 */	lwz r30, lbl_80418970-_SDA_BASE_(r13)
/* 8017C47C 0017947C  83 A3 00 18 */	lwz r29, 0x18(r3)
/* 8017C480 00179480  4B FB 7E B9 */	bl BattleStageGetPtr
/* 8017C484 00179484  80 9D 00 00 */	lwz r4, 0(r29)
/* 8017C488 00179488  7C 7F 1B 78 */	mr r31, r3
/* 8017C48C 0017948C  7F 83 E3 78 */	mr r3, r28
/* 8017C490 00179490  4B EB 47 3D */	bl evtGetValue
/* 8017C494 00179494  7C 60 1B 78 */	mr r0, r3
/* 8017C498 00179498  7F 83 E3 78 */	mr r3, r28
/* 8017C49C 0017949C  7C 04 03 78 */	mr r4, r0
/* 8017C4A0 001794A0  4B FA 3A 8D */	bl BattleTransID
/* 8017C4A4 001794A4  83 BD 00 04 */	lwz r29, 4(r29)
/* 8017C4A8 001794A8  7C 64 1B 78 */	mr r4, r3
/* 8017C4AC 001794AC  7F C3 F3 78 */	mr r3, r30
/* 8017C4B0 001794B0  4B F7 74 C9 */	bl BattleGetUnitPtr
/* 8017C4B4 001794B4  38 81 00 08 */	addi r4, r1, 8
/* 8017C4B8 001794B8  38 A1 00 0C */	addi r5, r1, 0xc
/* 8017C4BC 001794BC  38 C1 00 10 */	addi r6, r1, 0x10
/* 8017C4C0 001794C0  4B FA 72 D9 */	bl func_80123798
/* 8017C4C4 001794C4  C0 41 00 08 */	lfs f2, 8(r1)
/* 8017C4C8 001794C8  C0 22 CA D8 */	lfs f1, lbl_8041DE58-_SDA2_BASE_(r2)
/* 8017C4CC 001794CC  C0 1F 0B 24 */	lfs f0, 0xb24(r31)
/* 8017C4D0 001794D0  FC 40 12 10 */	fabs f2, f2
/* 8017C4D4 001794D4  EC 01 00 2A */	fadds f0, f1, f0
/* 8017C4D8 001794D8  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 8017C4DC 001794DC  40 80 00 18 */	bge lbl_8017C4F4
/* 8017C4E0 001794E0  7F 83 E3 78 */	mr r3, r28
/* 8017C4E4 001794E4  7F A4 EB 78 */	mr r4, r29
/* 8017C4E8 001794E8  38 A0 00 01 */	li r5, 1
/* 8017C4EC 001794EC  4B EB 41 7D */	bl evtSetValue
/* 8017C4F0 001794F0  48 00 00 14 */	b lbl_8017C504
lbl_8017C4F4:
/* 8017C4F4 001794F4  7F 83 E3 78 */	mr r3, r28
/* 8017C4F8 001794F8  7F A4 EB 78 */	mr r4, r29
/* 8017C4FC 001794FC  38 A0 00 00 */	li r5, 0
/* 8017C500 00179500  4B EB 41 69 */	bl evtSetValue
lbl_8017C504:
/* 8017C504 00179504  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8017C508 00179508  38 60 00 02 */	li r3, 2
/* 8017C50C 0017950C  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8017C510 00179510  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 8017C514 00179514  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 8017C518 00179518  83 81 00 20 */	lwz r28, 0x20(r1)
/* 8017C51C 0017951C  7C 08 03 A6 */	mtlr r0
/* 8017C520 00179520  38 21 00 30 */	addi r1, r1, 0x30
/* 8017C524 00179524  4E 80 00 20 */	blr 

.global _shot_move
_shot_move:
/* 8017C528 00179528  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 8017C52C 0017952C  7C 08 02 A6 */	mflr r0
/* 8017C530 00179530  90 01 00 74 */	stw r0, 0x74(r1)
/* 8017C534 00179534  DB E1 00 60 */	stfd f31, 0x60(r1)
/* 8017C538 00179538  F3 E1 00 68 */	psq_st f31, 104(r1), 0, qr0
/* 8017C53C 0017953C  BE E1 00 3C */	stmw r23, 0x3c(r1)
/* 8017C540 00179540  7C 7E 1B 78 */	mr r30, r3
/* 8017C544 00179544  7C 97 23 78 */	mr r23, r4
/* 8017C548 00179548  83 63 00 18 */	lwz r27, 0x18(r3)
/* 8017C54C 0017954C  83 ED 17 10 */	lwz r31, lbl_80418970-_SDA_BASE_(r13)
/* 8017C550 00179550  80 9B 00 00 */	lwz r4, 0(r27)
/* 8017C554 00179554  4B EB 46 79 */	bl evtGetValue
/* 8017C558 00179558  7C 60 1B 78 */	mr r0, r3
/* 8017C55C 0017955C  7F C3 F3 78 */	mr r3, r30
/* 8017C560 00179560  7C 04 03 78 */	mr r4, r0
/* 8017C564 00179564  4B FA 39 C9 */	bl BattleTransID
/* 8017C568 00179568  80 9B 00 04 */	lwz r4, 4(r27)
/* 8017C56C 0017956C  7C 7C 1B 78 */	mr r28, r3
/* 8017C570 00179570  7F C3 F3 78 */	mr r3, r30
/* 8017C574 00179574  4B EB 46 59 */	bl evtGetValue
/* 8017C578 00179578  80 9B 00 08 */	lwz r4, 8(r27)
/* 8017C57C 0017957C  7C 7D 1B 78 */	mr r29, r3
/* 8017C580 00179580  7F C3 F3 78 */	mr r3, r30
/* 8017C584 00179584  4B EB 46 49 */	bl evtGetValue
/* 8017C588 00179588  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8017C58C 0017958C  3C 00 43 30 */	lis r0, 0x4330
/* 8017C590 00179590  3C 80 80 2F */	lis r4, lbl_802F7C28@ha
/* 8017C594 00179594  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8017C598 00179598  38 64 7C 28 */	addi r3, r4, lbl_802F7C28@l
/* 8017C59C 0017959C  C0 02 CA DC */	lfs f0, lbl_8041DE5C-_SDA2_BASE_(r2)
/* 8017C5A0 001795A0  90 01 00 18 */	stw r0, 0x18(r1)
/* 8017C5A4 001795A4  7F 84 E3 78 */	mr r4, r28
/* 8017C5A8 001795A8  C8 43 00 00 */	lfd f2, 0(r3)
/* 8017C5AC 001795AC  C8 21 00 18 */	lfd f1, 0x18(r1)
/* 8017C5B0 001795B0  83 9B 00 0C */	lwz r28, 0xc(r27)
/* 8017C5B4 001795B4  EC 21 10 28 */	fsubs f1, f1, f2
/* 8017C5B8 001795B8  83 5B 00 10 */	lwz r26, 0x10(r27)
/* 8017C5BC 001795BC  83 3B 00 14 */	lwz r25, 0x14(r27)
/* 8017C5C0 001795C0  83 1B 00 18 */	lwz r24, 0x18(r27)
/* 8017C5C4 001795C4  EF E0 00 72 */	fmuls f31, f0, f1
/* 8017C5C8 001795C8  80 6D 17 10 */	lwz r3, lbl_80418970-_SDA_BASE_(r13)
/* 8017C5CC 001795CC  4B F7 73 AD */	bl BattleGetUnitPtr
/* 8017C5D0 001795D0  2C 17 00 00 */	cmpwi r23, 0
/* 8017C5D4 001795D4  7C 7B 1B 78 */	mr r27, r3
/* 8017C5D8 001795D8  41 82 00 C4 */	beq lbl_8017C69C
/* 8017C5DC 001795DC  38 81 00 10 */	addi r4, r1, 0x10
/* 8017C5E0 001795E0  38 A1 00 0C */	addi r5, r1, 0xc
/* 8017C5E4 001795E4  38 C1 00 08 */	addi r6, r1, 8
/* 8017C5E8 001795E8  4B FA 71 B1 */	bl func_80123798
/* 8017C5EC 001795EC  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 8017C5F0 001795F0  C0 22 CA E0 */	lfs f1, lbl_8041DE60-_SDA2_BASE_(r2)
/* 8017C5F4 001795F4  D0 1B 01 50 */	stfs f0, 0x150(r27)
/* 8017C5F8 001795F8  FC 40 08 90 */	fmr f2, f1
/* 8017C5FC 001795FC  C0 62 CA E4 */	lfs f3, lbl_8041DE64-_SDA2_BASE_(r2)
/* 8017C600 00179600  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 8017C604 00179604  FC 80 08 90 */	fmr f4, f1
/* 8017C608 00179608  D0 1B 01 54 */	stfs f0, 0x154(r27)
/* 8017C60C 0017960C  C0 01 00 08 */	lfs f0, 8(r1)
/* 8017C610 00179610  D0 1B 01 58 */	stfs f0, 0x158(r27)
/* 8017C614 00179614  4B E8 A9 A9 */	bl angleABf
/* 8017C618 00179618  6F A3 80 00 */	xoris r3, r29, 0x8000
/* 8017C61C 0017961C  3C 00 43 30 */	lis r0, 0x4330
/* 8017C620 00179620  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8017C624 00179624  3C 80 80 2F */	lis r4, lbl_802F7C28@ha
/* 8017C628 00179628  C8 44 7C 28 */	lfd f2, lbl_802F7C28@l(r4)
/* 8017C62C 0017962C  90 01 00 18 */	stw r0, 0x18(r1)
/* 8017C630 00179630  C0 62 CA E8 */	lfs f3, lbl_8041DE68-_SDA2_BASE_(r2)
/* 8017C634 00179634  D0 3B 01 78 */	stfs f1, 0x178(r27)
/* 8017C638 00179638  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 8017C63C 0017963C  D0 7B 01 70 */	stfs f3, 0x170(r27)
/* 8017C640 00179640  EC 20 10 28 */	fsubs f1, f0, f2
/* 8017C644 00179644  4B FA 41 9D */	bl cosfd
/* 8017C648 00179648  EC 3F 00 72 */	fmuls f1, f31, f1
/* 8017C64C 0017964C  C0 02 CA F0 */	lfs f0, lbl_8041DE70-_SDA2_BASE_(r2)
/* 8017C650 00179650  6F A3 80 00 */	xoris r3, r29, 0x8000
/* 8017C654 00179654  3C 00 43 30 */	lis r0, 0x4330
/* 8017C658 00179658  90 61 00 24 */	stw r3, 0x24(r1)
/* 8017C65C 0017965C  3C 80 80 2F */	lis r4, lbl_802F7C28@ha
/* 8017C660 00179660  EC 40 00 72 */	fmuls f2, f0, f1
/* 8017C664 00179664  C0 02 CA EC */	lfs f0, lbl_8041DE6C-_SDA2_BASE_(r2)
/* 8017C668 00179668  90 01 00 20 */	stw r0, 0x20(r1)
/* 8017C66C 0017966C  C8 24 7C 28 */	lfd f1, lbl_802F7C28@l(r4)
/* 8017C670 00179670  EC 40 00 B2 */	fmuls f2, f0, f2
/* 8017C674 00179674  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 8017C678 00179678  EC 20 08 28 */	fsubs f1, f0, f1
/* 8017C67C 0017967C  D0 5B 01 74 */	stfs f2, 0x174(r27)
/* 8017C680 00179680  4B FA 41 95 */	bl func_80120814
/* 8017C684 00179684  EC 5F 00 72 */	fmuls f2, f31, f1
/* 8017C688 00179688  C0 22 CA F4 */	lfs f1, lbl_8041DE74-_SDA2_BASE_(r2)
/* 8017C68C 0017968C  C0 02 CA EC */	lfs f0, lbl_8041DE6C-_SDA2_BASE_(r2)
/* 8017C690 00179690  EC 21 00 B2 */	fmuls f1, f1, f2
/* 8017C694 00179694  EC 00 00 72 */	fmuls f0, f0, f1
/* 8017C698 00179698  D0 1B 01 6C */	stfs f0, 0x16c(r27)
lbl_8017C69C:
/* 8017C69C 0017969C  C0 3B 01 54 */	lfs f1, 0x154(r27)
/* 8017C6A0 001796A0  38 7B 01 50 */	addi r3, r27, 0x150
/* 8017C6A4 001796A4  C0 1B 01 74 */	lfs f0, 0x174(r27)
/* 8017C6A8 001796A8  38 9B 01 58 */	addi r4, r27, 0x158
/* 8017C6AC 001796AC  EC 01 00 2A */	fadds f0, f1, f0
/* 8017C6B0 001796B0  D0 1B 01 54 */	stfs f0, 0x154(r27)
/* 8017C6B4 001796B4  C0 3B 01 74 */	lfs f1, 0x174(r27)
/* 8017C6B8 001796B8  C0 1B 01 70 */	lfs f0, 0x170(r27)
/* 8017C6BC 001796BC  EC 01 00 28 */	fsubs f0, f1, f0
/* 8017C6C0 001796C0  D0 1B 01 74 */	stfs f0, 0x174(r27)
/* 8017C6C4 001796C4  C0 3B 01 6C */	lfs f1, 0x16c(r27)
/* 8017C6C8 001796C8  C0 5B 01 78 */	lfs f2, 0x178(r27)
/* 8017C6CC 001796CC  4B FA 3F E5 */	bl btlMovePos
/* 8017C6D0 001796D0  C0 3B 01 50 */	lfs f1, 0x150(r27)
/* 8017C6D4 001796D4  7F 63 DB 78 */	mr r3, r27
/* 8017C6D8 001796D8  C0 5B 01 54 */	lfs f2, 0x154(r27)
/* 8017C6DC 001796DC  C0 7B 01 58 */	lfs f3, 0x158(r27)
/* 8017C6E0 001796E0  4B FA 70 A9 */	bl func_80123788
/* 8017C6E4 001796E4  C0 3B 01 50 */	lfs f1, 0x150(r27)
/* 8017C6E8 001796E8  7F E3 FB 78 */	mr r3, r31
/* 8017C6EC 001796EC  C0 5B 01 54 */	lfs f2, 0x154(r27)
/* 8017C6F0 001796F0  C0 7B 01 58 */	lfs f3, 0x158(r27)
/* 8017C6F4 001796F4  4B F7 65 45 */	bl BattleGetFloorHeight
/* 8017C6F8 001796F8  FF E0 08 90 */	fmr f31, f1
/* 8017C6FC 001796FC  C0 1B 01 54 */	lfs f0, 0x154(r27)
/* 8017C700 00179700  FC 00 F8 40 */	fcmpo cr0, f0, f31
/* 8017C704 00179704  40 81 00 0C */	ble lbl_8017C710
/* 8017C708 00179708  38 60 00 00 */	li r3, 0
/* 8017C70C 0017970C  48 00 00 7C */	b lbl_8017C788
lbl_8017C710:
/* 8017C710 00179710  FC 40 F8 90 */	fmr f2, f31
/* 8017C714 00179714  C0 3B 01 50 */	lfs f1, 0x150(r27)
/* 8017C718 00179718  C0 7B 01 58 */	lfs f3, 0x158(r27)
/* 8017C71C 0017971C  7F 63 DB 78 */	mr r3, r27
/* 8017C720 00179720  4B FA 70 69 */	bl func_80123788
/* 8017C724 00179724  C0 1B 01 50 */	lfs f0, 0x150(r27)
/* 8017C728 00179728  7F C3 F3 78 */	mr r3, r30
/* 8017C72C 0017972C  7F 84 E3 78 */	mr r4, r28
/* 8017C730 00179730  FC 00 00 1E */	fctiwz f0, f0
/* 8017C734 00179734  D8 01 00 20 */	stfd f0, 0x20(r1)
/* 8017C738 00179738  80 A1 00 24 */	lwz r5, 0x24(r1)
/* 8017C73C 0017973C  4B EB 3F 2D */	bl evtSetValue
/* 8017C740 00179740  FC 00 F8 1E */	fctiwz f0, f31
/* 8017C744 00179744  7F C3 F3 78 */	mr r3, r30
/* 8017C748 00179748  7F 44 D3 78 */	mr r4, r26
/* 8017C74C 0017974C  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 8017C750 00179750  80 A1 00 1C */	lwz r5, 0x1c(r1)
/* 8017C754 00179754  4B EB 3F 15 */	bl evtSetValue
/* 8017C758 00179758  C0 1B 01 58 */	lfs f0, 0x158(r27)
/* 8017C75C 0017975C  7F C3 F3 78 */	mr r3, r30
/* 8017C760 00179760  7F 24 CB 78 */	mr r4, r25
/* 8017C764 00179764  FC 00 00 1E */	fctiwz f0, f0
/* 8017C768 00179768  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 8017C76C 0017976C  80 A1 00 2C */	lwz r5, 0x2c(r1)
/* 8017C770 00179770  4B EB 3E F9 */	bl evtSetValue
/* 8017C774 00179774  C0 3B 01 6C */	lfs f1, 0x16c(r27)
/* 8017C778 00179778  7F C3 F3 78 */	mr r3, r30
/* 8017C77C 0017977C  7F 04 C3 78 */	mr r4, r24
/* 8017C780 00179780  4B EB 36 A9 */	bl evtSetFloat
/* 8017C784 00179784  38 60 00 01 */	li r3, 1
lbl_8017C788:
/* 8017C788 00179788  E3 E1 00 68 */	psq_l f31, 104(r1), 0, qr0
/* 8017C78C 0017978C  CB E1 00 60 */	lfd f31, 0x60(r1)
/* 8017C790 00179790  BA E1 00 3C */	lmw r23, 0x3c(r1)
/* 8017C794 00179794  80 01 00 74 */	lwz r0, 0x74(r1)
/* 8017C798 00179798  7C 08 03 A6 */	mtlr r0
/* 8017C79C 0017979C  38 21 00 70 */	addi r1, r1, 0x70
/* 8017C7A0 001797A0  4E 80 00 20 */	blr 

.global _make_counterset_weapon
_make_counterset_weapon:
/* 8017C7A4 001797A4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8017C7A8 001797A8  7C 08 02 A6 */	mflr r0
/* 8017C7AC 001797AC  38 80 FF FE */	li r4, -2
/* 8017C7B0 001797B0  90 01 00 24 */	stw r0, 0x24(r1)
/* 8017C7B4 001797B4  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 8017C7B8 001797B8  7C 7B 1B 78 */	mr r27, r3
/* 8017C7BC 001797BC  83 ED 17 10 */	lwz r31, lbl_80418970-_SDA_BASE_(r13)
/* 8017C7C0 001797C0  83 C3 00 18 */	lwz r30, 0x18(r3)
/* 8017C7C4 001797C4  4B FA 37 69 */	bl BattleTransID
/* 8017C7C8 001797C8  7C 60 1B 78 */	mr r0, r3
/* 8017C7CC 001797CC  7F E3 FB 78 */	mr r3, r31
/* 8017C7D0 001797D0  7C 04 03 78 */	mr r4, r0
/* 8017C7D4 001797D4  4B F7 71 A5 */	bl BattleGetUnitPtr
/* 8017C7D8 001797D8  83 BE 00 00 */	lwz r29, 0(r30)
/* 8017C7DC 001797DC  83 83 03 10 */	lwz r28, 0x310(r3)
/* 8017C7E0 001797E0  7F 63 DB 78 */	mr r3, r27
/* 8017C7E4 001797E4  7F A4 EB 78 */	mr r4, r29
/* 8017C7E8 001797E8  4B EB 43 E5 */	bl evtGetValue
/* 8017C7EC 001797EC  80 9E 00 04 */	lwz r4, 4(r30)
/* 8017C7F0 001797F0  7C 7E 1B 78 */	mr r30, r3
/* 8017C7F4 001797F4  7F 63 DB 78 */	mr r3, r27
/* 8017C7F8 001797F8  4B EB 43 D5 */	bl evtGetValue
/* 8017C7FC 001797FC  7C 7F 1B 78 */	mr r31, r3
/* 8017C800 00179800  7F 83 E3 78 */	mr r3, r28
/* 8017C804 00179804  7F C4 F3 78 */	mr r4, r30
/* 8017C808 00179808  38 A0 00 C0 */	li r5, 0xc0
/* 8017C80C 0017980C  4B E8 89 91 */	bl func_8000519C
/* 8017C810 00179810  9B FC 00 A7 */	stb r31, 0xa7(r28)
/* 8017C814 00179814  7F 63 DB 78 */	mr r3, r27
/* 8017C818 00179818  7F A4 EB 78 */	mr r4, r29
/* 8017C81C 0017981C  7F 85 E3 78 */	mr r5, r28
/* 8017C820 00179820  4B EB 3E 49 */	bl evtSetValue
/* 8017C824 00179824  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 8017C828 00179828  38 60 00 02 */	li r3, 2
/* 8017C82C 0017982C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8017C830 00179830  7C 08 03 A6 */	mtlr r0
/* 8017C834 00179834  38 21 00 20 */	addi r1, r1, 0x20
/* 8017C838 00179838  4E 80 00 20 */	blr 

.global _get_bomb_hit_position
_get_bomb_hit_position:
/* 8017C83C 0017983C  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8017C840 00179840  7C 08 02 A6 */	mflr r0
/* 8017C844 00179844  90 01 00 44 */	stw r0, 0x44(r1)
/* 8017C848 00179848  BF 21 00 24 */	stmw r25, 0x24(r1)
/* 8017C84C 0017984C  7C 7D 1B 78 */	mr r29, r3
/* 8017C850 00179850  83 63 00 18 */	lwz r27, 0x18(r3)
/* 8017C854 00179854  83 8D 17 10 */	lwz r28, lbl_80418970-_SDA_BASE_(r13)
/* 8017C858 00179858  80 9B 00 00 */	lwz r4, 0(r27)
/* 8017C85C 0017985C  4B EB 43 71 */	bl evtGetValue
/* 8017C860 00179860  80 9B 00 04 */	lwz r4, 4(r27)
/* 8017C864 00179864  7C 7A 1B 78 */	mr r26, r3
/* 8017C868 00179868  7F A3 EB 78 */	mr r3, r29
/* 8017C86C 0017986C  4B EB 43 61 */	bl evtGetValue
/* 8017C870 00179870  80 9B 00 08 */	lwz r4, 8(r27)
/* 8017C874 00179874  7C 79 1B 78 */	mr r25, r3
/* 8017C878 00179878  7F A3 EB 78 */	mr r3, r29
/* 8017C87C 0017987C  4B EB 43 51 */	bl evtGetValue
/* 8017C880 00179880  83 FB 00 0C */	lwz r31, 0xc(r27)
/* 8017C884 00179884  7F A3 EB 78 */	mr r3, r29
/* 8017C888 00179888  83 DB 00 10 */	lwz r30, 0x10(r27)
/* 8017C88C 0017988C  7F 44 D3 78 */	mr r4, r26
/* 8017C890 00179890  83 5B 00 14 */	lwz r26, 0x14(r27)
/* 8017C894 00179894  4B FA 36 99 */	bl BattleTransID
/* 8017C898 00179898  7C 64 1B 78 */	mr r4, r3
/* 8017C89C 0017989C  7F 83 E3 78 */	mr r3, r28
/* 8017C8A0 001798A0  4B F7 70 D9 */	bl BattleGetUnitPtr
/* 8017C8A4 001798A4  7F A3 EB 78 */	mr r3, r29
/* 8017C8A8 001798A8  7F 24 CB 78 */	mr r4, r25
/* 8017C8AC 001798AC  4B FA 36 81 */	bl BattleTransID
/* 8017C8B0 001798B0  7C 64 1B 78 */	mr r4, r3
/* 8017C8B4 001798B4  7F 83 E3 78 */	mr r3, r28
/* 8017C8B8 001798B8  4B F7 70 C1 */	bl BattleGetUnitPtr
/* 8017C8BC 001798BC  8B 23 01 85 */	lbz r25, 0x185(r3)
/* 8017C8C0 001798C0  7C 7C 1B 78 */	mr r28, r3
/* 8017C8C4 001798C4  38 A1 00 0C */	addi r5, r1, 0xc
/* 8017C8C8 001798C8  38 C1 00 10 */	addi r6, r1, 0x10
/* 8017C8CC 001798CC  38 81 00 08 */	addi r4, r1, 8
/* 8017C8D0 001798D0  7F 39 07 74 */	extsb r25, r25
/* 8017C8D4 001798D4  4B FA 6E C5 */	bl func_80123798
/* 8017C8D8 001798D8  6F 23 80 00 */	xoris r3, r25, 0x8000
/* 8017C8DC 001798DC  3C 00 43 30 */	lis r0, 0x4330
/* 8017C8E0 001798E0  3C 80 80 2F */	lis r4, lbl_802F7C28@ha
/* 8017C8E4 001798E4  90 61 00 1C */	stw r3, 0x1c(r1)
/* 8017C8E8 001798E8  38 A4 7C 28 */	addi r5, r4, lbl_802F7C28@l
/* 8017C8EC 001798EC  C0 1C 00 EC */	lfs f0, 0xec(r28)
/* 8017C8F0 001798F0  90 01 00 18 */	stw r0, 0x18(r1)
/* 8017C8F4 001798F4  7F A3 EB 78 */	mr r3, r29
/* 8017C8F8 001798F8  C0 9C 01 14 */	lfs f4, 0x114(r28)
/* 8017C8FC 001798FC  7F E4 FB 78 */	mr r4, r31
/* 8017C900 00179900  C8 A5 00 00 */	lfd f5, 0(r5)
/* 8017C904 00179904  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 8017C908 00179908  EC 60 01 32 */	fmuls f3, f0, f4
/* 8017C90C 0017990C  C0 21 00 08 */	lfs f1, 8(r1)
/* 8017C910 00179910  EC A2 28 28 */	fsubs f5, f2, f5
/* 8017C914 00179914  C0 41 00 0C */	lfs f2, 0xc(r1)
/* 8017C918 00179918  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 8017C91C 0017991C  EC 25 08 FA */	fmadds f1, f5, f3, f1
/* 8017C920 00179920  D0 21 00 08 */	stfs f1, 8(r1)
/* 8017C924 00179924  C0 7C 00 F0 */	lfs f3, 0xf0(r28)
/* 8017C928 00179928  EC 43 11 3A */	fmadds f2, f3, f4, f2
/* 8017C92C 0017992C  D0 41 00 0C */	stfs f2, 0xc(r1)
/* 8017C930 00179930  C0 5C 00 F4 */	lfs f2, 0xf4(r28)
/* 8017C934 00179934  EC 02 01 3A */	fmadds f0, f2, f4, f0
/* 8017C938 00179938  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8017C93C 0017993C  4B EB 34 ED */	bl evtSetFloat
/* 8017C940 00179940  C0 21 00 0C */	lfs f1, 0xc(r1)
/* 8017C944 00179944  7F A3 EB 78 */	mr r3, r29
/* 8017C948 00179948  7F C4 F3 78 */	mr r4, r30
/* 8017C94C 0017994C  4B EB 34 DD */	bl evtSetFloat
/* 8017C950 00179950  C0 21 00 10 */	lfs f1, 0x10(r1)
/* 8017C954 00179954  7F A3 EB 78 */	mr r3, r29
/* 8017C958 00179958  7F 44 D3 78 */	mr r4, r26
/* 8017C95C 0017995C  4B EB 34 CD */	bl evtSetFloat
/* 8017C960 00179960  BB 21 00 24 */	lmw r25, 0x24(r1)
/* 8017C964 00179964  38 60 00 02 */	li r3, 2
/* 8017C968 00179968  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8017C96C 0017996C  7C 08 03 A6 */	mtlr r0
/* 8017C970 00179970  38 21 00 40 */	addi r1, r1, 0x40
/* 8017C974 00179974  4E 80 00 20 */	blr 

.global __makeTechMenuFunc_8017c978
__makeTechMenuFunc_8017c978:
/* 8017C978 00179978  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8017C97C 0017997C  7C 08 02 A6 */	mflr r0
/* 8017C980 00179980  3C A0 80 38 */	lis r5, lbl_803848D8@ha
/* 8017C984 00179984  90 01 00 24 */	stw r0, 0x24(r1)
/* 8017C988 00179988  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8017C98C 0017998C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8017C990 00179990  3B C5 48 D8 */	addi r30, r5, lbl_803848D8@l
/* 8017C994 00179994  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8017C998 00179998  7C 9D 23 78 */	mr r29, r4
/* 8017C99C 0017999C  93 81 00 10 */	stw r28, 0x10(r1)
/* 8017C9A0 001799A0  7C 7C 1B 78 */	mr r28, r3
/* 8017C9A4 001799A4  80 6D 17 10 */	lwz r3, lbl_80418970-_SDA_BASE_(r13)
/* 8017C9A8 001799A8  4B F7 6E 2D */	bl BattleGetPartyPtr
/* 8017C9AC 001799AC  80 63 00 08 */	lwz r3, 8(r3)
/* 8017C9B0 001799B0  4B F7 6B 41 */	bl BattleTransPartyId
/* 8017C9B4 001799B4  4B FB EE B5 */	bl partyGetTechLv
/* 8017C9B8 001799B8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017C9BC 001799BC  38 C0 FF FF */	li r6, -1
/* 8017C9C0 001799C0  38 A0 00 00 */	li r5, 0
/* 8017C9C4 001799C4  38 9E 06 50 */	addi r4, r30, 0x650
/* 8017C9C8 001799C8  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017C9CC 001799CC  7C 7F 1B 78 */	mr r31, r3
/* 8017C9D0 001799D0  7C 7C 02 14 */	add r3, r28, r0
/* 8017C9D4 001799D4  90 C3 00 90 */	stw r6, 0x90(r3)
/* 8017C9D8 001799D8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017C9DC 001799DC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017C9E0 001799E0  7C 7C 02 14 */	add r3, r28, r0
/* 8017C9E4 001799E4  90 A3 00 94 */	stw r5, 0x94(r3)
/* 8017C9E8 001799E8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017C9EC 001799EC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017C9F0 001799F0  7C 7C 02 14 */	add r3, r28, r0
/* 8017C9F4 001799F4  90 83 00 80 */	stw r4, 0x80(r3)
/* 8017C9F8 001799F8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017C9FC 001799FC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA00 00179A00  7C 7C 02 14 */	add r3, r28, r0
/* 8017CA04 00179A04  90 A3 00 84 */	stw r5, 0x84(r3)
/* 8017CA08 00179A08  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA0C 00179A0C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA10 00179A10  7C 9C 02 14 */	add r4, r28, r0
/* 8017CA14 00179A14  80 64 00 80 */	lwz r3, 0x80(r4)
/* 8017CA18 00179A18  A0 03 00 04 */	lhz r0, 4(r3)
/* 8017CA1C 00179A1C  B0 04 00 8C */	sth r0, 0x8c(r4)
/* 8017CA20 00179A20  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA24 00179A24  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA28 00179A28  7C 7C 02 14 */	add r3, r28, r0
/* 8017CA2C 00179A2C  80 63 00 80 */	lwz r3, 0x80(r3)
/* 8017CA30 00179A30  80 63 00 00 */	lwz r3, 0(r3)
/* 8017CA34 00179A34  4B F0 45 95 */	bl msgSearch
/* 8017CA38 00179A38  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA3C 00179A3C  2C 1F 00 00 */	cmpwi r31, 0
/* 8017CA40 00179A40  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA44 00179A44  7C 9C 02 14 */	add r4, r28, r0
/* 8017CA48 00179A48  90 64 00 88 */	stw r3, 0x88(r4)
/* 8017CA4C 00179A4C  80 7D 00 00 */	lwz r3, 0(r29)
/* 8017CA50 00179A50  38 03 00 01 */	addi r0, r3, 1
/* 8017CA54 00179A54  90 1D 00 00 */	stw r0, 0(r29)
/* 8017CA58 00179A58  41 80 00 9C */	blt lbl_8017CAF4
/* 8017CA5C 00179A5C  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA60 00179A60  38 C0 FF FF */	li r6, -1
/* 8017CA64 00179A64  38 A0 00 00 */	li r5, 0
/* 8017CA68 00179A68  38 9E 07 10 */	addi r4, r30, 0x710
/* 8017CA6C 00179A6C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA70 00179A70  7C 7C 02 14 */	add r3, r28, r0
/* 8017CA74 00179A74  90 C3 00 90 */	stw r6, 0x90(r3)
/* 8017CA78 00179A78  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA7C 00179A7C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA80 00179A80  7C 7C 02 14 */	add r3, r28, r0
/* 8017CA84 00179A84  90 A3 00 94 */	stw r5, 0x94(r3)
/* 8017CA88 00179A88  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA8C 00179A8C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CA90 00179A90  7C 7C 02 14 */	add r3, r28, r0
/* 8017CA94 00179A94  90 83 00 80 */	stw r4, 0x80(r3)
/* 8017CA98 00179A98  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CA9C 00179A9C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CAA0 00179AA0  7C 7C 02 14 */	add r3, r28, r0
/* 8017CAA4 00179AA4  90 A3 00 84 */	stw r5, 0x84(r3)
/* 8017CAA8 00179AA8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CAAC 00179AAC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CAB0 00179AB0  7C 9C 02 14 */	add r4, r28, r0
/* 8017CAB4 00179AB4  80 64 00 80 */	lwz r3, 0x80(r4)
/* 8017CAB8 00179AB8  A0 03 00 04 */	lhz r0, 4(r3)
/* 8017CABC 00179ABC  B0 04 00 8C */	sth r0, 0x8c(r4)
/* 8017CAC0 00179AC0  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CAC4 00179AC4  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CAC8 00179AC8  7C 7C 02 14 */	add r3, r28, r0
/* 8017CACC 00179ACC  80 63 00 80 */	lwz r3, 0x80(r3)
/* 8017CAD0 00179AD0  80 63 00 00 */	lwz r3, 0(r3)
/* 8017CAD4 00179AD4  4B F0 44 F5 */	bl msgSearch
/* 8017CAD8 00179AD8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CADC 00179ADC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CAE0 00179AE0  7C 9C 02 14 */	add r4, r28, r0
/* 8017CAE4 00179AE4  90 64 00 88 */	stw r3, 0x88(r4)
/* 8017CAE8 00179AE8  80 7D 00 00 */	lwz r3, 0(r29)
/* 8017CAEC 00179AEC  38 03 00 01 */	addi r0, r3, 1
/* 8017CAF0 00179AF0  90 1D 00 00 */	stw r0, 0(r29)
lbl_8017CAF4:
/* 8017CAF4 00179AF4  2C 1F 00 01 */	cmpwi r31, 1
/* 8017CAF8 00179AF8  41 80 00 9C */	blt lbl_8017CB94
/* 8017CAFC 00179AFC  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB00 00179B00  38 C0 FF FF */	li r6, -1
/* 8017CB04 00179B04  38 A0 00 00 */	li r5, 0
/* 8017CB08 00179B08  38 9E 07 D0 */	addi r4, r30, 0x7d0
/* 8017CB0C 00179B0C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB10 00179B10  7C 7C 02 14 */	add r3, r28, r0
/* 8017CB14 00179B14  90 C3 00 90 */	stw r6, 0x90(r3)
/* 8017CB18 00179B18  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB1C 00179B1C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB20 00179B20  7C 7C 02 14 */	add r3, r28, r0
/* 8017CB24 00179B24  90 A3 00 94 */	stw r5, 0x94(r3)
/* 8017CB28 00179B28  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB2C 00179B2C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB30 00179B30  7C 7C 02 14 */	add r3, r28, r0
/* 8017CB34 00179B34  90 83 00 80 */	stw r4, 0x80(r3)
/* 8017CB38 00179B38  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB3C 00179B3C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB40 00179B40  7C 7C 02 14 */	add r3, r28, r0
/* 8017CB44 00179B44  90 A3 00 84 */	stw r5, 0x84(r3)
/* 8017CB48 00179B48  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB4C 00179B4C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB50 00179B50  7C 9C 02 14 */	add r4, r28, r0
/* 8017CB54 00179B54  80 64 00 80 */	lwz r3, 0x80(r4)
/* 8017CB58 00179B58  A0 03 00 04 */	lhz r0, 4(r3)
/* 8017CB5C 00179B5C  B0 04 00 8C */	sth r0, 0x8c(r4)
/* 8017CB60 00179B60  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB64 00179B64  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB68 00179B68  7C 7C 02 14 */	add r3, r28, r0
/* 8017CB6C 00179B6C  80 63 00 80 */	lwz r3, 0x80(r3)
/* 8017CB70 00179B70  80 63 00 00 */	lwz r3, 0(r3)
/* 8017CB74 00179B74  4B F0 44 55 */	bl msgSearch
/* 8017CB78 00179B78  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CB7C 00179B7C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CB80 00179B80  7C 9C 02 14 */	add r4, r28, r0
/* 8017CB84 00179B84  90 64 00 88 */	stw r3, 0x88(r4)
/* 8017CB88 00179B88  80 7D 00 00 */	lwz r3, 0(r29)
/* 8017CB8C 00179B8C  38 03 00 01 */	addi r0, r3, 1
/* 8017CB90 00179B90  90 1D 00 00 */	stw r0, 0(r29)
lbl_8017CB94:
/* 8017CB94 00179B94  2C 1F 00 02 */	cmpwi r31, 2
/* 8017CB98 00179B98  41 80 00 9C */	blt lbl_8017CC34
/* 8017CB9C 00179B9C  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CBA0 00179BA0  38 C0 FF FF */	li r6, -1
/* 8017CBA4 00179BA4  38 A0 00 00 */	li r5, 0
/* 8017CBA8 00179BA8  38 9E 08 90 */	addi r4, r30, 0x890
/* 8017CBAC 00179BAC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CBB0 00179BB0  7C 7C 02 14 */	add r3, r28, r0
/* 8017CBB4 00179BB4  90 C3 00 90 */	stw r6, 0x90(r3)
/* 8017CBB8 00179BB8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CBBC 00179BBC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CBC0 00179BC0  7C 7C 02 14 */	add r3, r28, r0
/* 8017CBC4 00179BC4  90 A3 00 94 */	stw r5, 0x94(r3)
/* 8017CBC8 00179BC8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CBCC 00179BCC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CBD0 00179BD0  7C 7C 02 14 */	add r3, r28, r0
/* 8017CBD4 00179BD4  90 83 00 80 */	stw r4, 0x80(r3)
/* 8017CBD8 00179BD8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CBDC 00179BDC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CBE0 00179BE0  7C 7C 02 14 */	add r3, r28, r0
/* 8017CBE4 00179BE4  90 A3 00 84 */	stw r5, 0x84(r3)
/* 8017CBE8 00179BE8  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CBEC 00179BEC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CBF0 00179BF0  7C 9C 02 14 */	add r4, r28, r0
/* 8017CBF4 00179BF4  80 64 00 80 */	lwz r3, 0x80(r4)
/* 8017CBF8 00179BF8  A0 03 00 04 */	lhz r0, 4(r3)
/* 8017CBFC 00179BFC  B0 04 00 8C */	sth r0, 0x8c(r4)
/* 8017CC00 00179C00  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CC04 00179C04  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CC08 00179C08  7C 7C 02 14 */	add r3, r28, r0
/* 8017CC0C 00179C0C  80 63 00 80 */	lwz r3, 0x80(r3)
/* 8017CC10 00179C10  80 63 00 00 */	lwz r3, 0(r3)
/* 8017CC14 00179C14  4B F0 43 B5 */	bl msgSearch
/* 8017CC18 00179C18  80 1D 00 00 */	lwz r0, 0(r29)
/* 8017CC1C 00179C1C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8017CC20 00179C20  7C 9C 02 14 */	add r4, r28, r0
/* 8017CC24 00179C24  90 64 00 88 */	stw r3, 0x88(r4)
/* 8017CC28 00179C28  80 7D 00 00 */	lwz r3, 0(r29)
/* 8017CC2C 00179C2C  38 03 00 01 */	addi r0, r3, 1
/* 8017CC30 00179C30  90 1D 00 00 */	stw r0, 0(r29)
lbl_8017CC34:
/* 8017CC34 00179C34  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8017CC38 00179C38  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8017CC3C 00179C3C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8017CC40 00179C40  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8017CC44 00179C44  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8017CC48 00179C48  7C 08 03 A6 */	mtlr r0
/* 8017CC4C 00179C4C  38 21 00 20 */	addi r1, r1, 0x20
/* 8017CC50 00179C50  4E 80 00 20 */	blr 

.global _sanders_make_extra_work_area
_sanders_make_extra_work_area:
/* 8017CC54 00179C54  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8017CC58 00179C58  7C 08 02 A6 */	mflr r0
/* 8017CC5C 00179C5C  38 80 FF FE */	li r4, -2
/* 8017CC60 00179C60  90 01 00 14 */	stw r0, 0x14(r1)
/* 8017CC64 00179C64  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8017CC68 00179C68  83 ED 17 10 */	lwz r31, lbl_80418970-_SDA_BASE_(r13)
/* 8017CC6C 00179C6C  4B FA 32 C1 */	bl BattleTransID
/* 8017CC70 00179C70  7C 60 1B 78 */	mr r0, r3
/* 8017CC74 00179C74  7F E3 FB 78 */	mr r3, r31
/* 8017CC78 00179C78  7C 04 03 78 */	mr r4, r0
/* 8017CC7C 00179C7C  4B F7 6C FD */	bl BattleGetUnitPtr
/* 8017CC80 00179C80  7C 7F 1B 78 */	mr r31, r3
/* 8017CC84 00179C84  38 60 00 C0 */	li r3, 0xc0
/* 8017CC88 00179C88  4B F7 6D 5D */	bl BattleAlloc
/* 8017CC8C 00179C8C  90 7F 03 10 */	stw r3, 0x310(r31)
/* 8017CC90 00179C90  38 60 00 02 */	li r3, 2
/* 8017CC94 00179C94  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8017CC98 00179C98  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8017CC9C 00179C9C  7C 08 03 A6 */	mtlr r0
/* 8017CCA0 00179CA0  38 21 00 10 */	addi r1, r1, 0x10
/* 8017CCA4 00179CA4  4E 80 00 20 */	blr 
