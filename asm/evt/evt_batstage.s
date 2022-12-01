.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global evt_batstage_light_set_player_off
evt_batstage_light_set_player_off:
/* 801363C0 001333C0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801363C4 001333C4  7C 08 02 A6 */	mflr r0
/* 801363C8 001333C8  3C 80 80 2F */	lis r4, lbl_802F32F8@ha
/* 801363CC 001333CC  38 60 00 00 */	li r3, 0
/* 801363D0 001333D0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801363D4 001333D4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801363D8 001333D8  3B E4 32 F8 */	addi r31, r4, lbl_802F32F8@l
/* 801363DC 001333DC  38 80 00 00 */	li r4, 0
/* 801363E0 001333E0  4B FF C9 45 */	bl BattleStageReturnAudDarkBase
/* 801363E4 001333E4  38 60 00 1E */	li r3, 0x1e
/* 801363E8 001333E8  38 80 00 00 */	li r4, 0
/* 801363EC 001333EC  4B FF C9 E9 */	bl BattleStageReturnStgDarkBase
/* 801363F0 001333F0  38 7F 00 FC */	addi r3, r31, 0xfc
/* 801363F4 001333F4  4B FF CF E1 */	bl BattleStageGetLightNumberByName
/* 801363F8 001333F8  2C 03 FF FF */	cmpwi r3, -1
/* 801363FC 001333FC  41 82 00 10 */	beq lbl_8013640C
/* 80136400 00133400  38 80 00 1E */	li r4, 0x1e
/* 80136404 00133404  38 A0 00 00 */	li r5, 0
/* 80136408 00133408  4B FF CE 8D */	bl BattleStageLightRelease
lbl_8013640C:
/* 8013640C 0013340C  38 7F 01 10 */	addi r3, r31, 0x110
/* 80136410 00133410  4B FF CF C5 */	bl BattleStageGetLightNumberByName
/* 80136414 00133414  2C 03 FF FF */	cmpwi r3, -1
/* 80136418 00133418  41 82 00 10 */	beq lbl_80136428
/* 8013641C 0013341C  38 80 00 1E */	li r4, 0x1e
/* 80136420 00133420  38 A0 00 00 */	li r5, 0
/* 80136424 00133424  4B FF CE 71 */	bl BattleStageLightRelease
lbl_80136428:
/* 80136428 00133428  38 7F 01 24 */	addi r3, r31, 0x124
/* 8013642C 0013342C  4B FF CF A9 */	bl BattleStageGetLightNumberByName
/* 80136430 00133430  2C 03 FF FF */	cmpwi r3, -1
/* 80136434 00133434  41 82 00 10 */	beq lbl_80136444
/* 80136438 00133438  38 80 00 1E */	li r4, 0x1e
/* 8013643C 0013343C  38 A0 00 00 */	li r5, 0
/* 80136440 00133440  4B FF CE 55 */	bl BattleStageLightRelease
lbl_80136444:
/* 80136444 00133444  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80136448 00133448  38 60 00 02 */	li r3, 2
/* 8013644C 0013344C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80136450 00133450  7C 08 03 A6 */	mtlr r0
/* 80136454 00133454  38 21 00 10 */	addi r1, r1, 0x10
/* 80136458 00133458  4E 80 00 20 */	blr 

.global evt_batstage_light_set_player_on
evt_batstage_light_set_player_on:
/* 8013645C 0013345C  94 21 FE 70 */	stwu r1, -0x190(r1)
/* 80136460 00133460  7C 08 02 A6 */	mflr r0
/* 80136464 00133464  3C 80 80 2F */	lis r4, lbl_802F32F8@ha
/* 80136468 00133468  90 01 01 94 */	stw r0, 0x194(r1)
/* 8013646C 0013346C  BD C1 01 48 */	stmw r14, 0x148(r1)
/* 80136470 00133470  3B E4 32 F8 */	addi r31, r4, lbl_802F32F8@l
/* 80136474 00133474  80 A3 00 18 */	lwz r5, 0x18(r3)
/* 80136478 00133478  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 8013647C 0013347C  80 85 00 00 */	lwz r4, 0(r5)
/* 80136480 00133480  4B EF A7 4D */	bl evtGetValue
/* 80136484 00133484  38 00 00 0C */	li r0, 0xc
/* 80136488 00133488  38 C1 00 A4 */	addi r6, r1, 0xa4
/* 8013648C 0013348C  38 BF FF FC */	addi r5, r31, -4
/* 80136490 00133490  7C 09 03 A6 */	mtctr r0
lbl_80136494:
/* 80136494 00133494  80 85 00 04 */	lwz r4, 4(r5)
/* 80136498 00133498  84 05 00 08 */	lwzu r0, 8(r5)
/* 8013649C 0013349C  90 86 00 04 */	stw r4, 4(r6)
/* 801364A0 001334A0  94 06 00 08 */	stwu r0, 8(r6)
/* 801364A4 001334A4  42 00 FF F0 */	bdnz lbl_80136494
/* 801364A8 001334A8  80 1F 00 60 */	lwz r0, 0x60(r31)
/* 801364AC 001334AC  2C 03 00 01 */	cmpwi r3, 1
/* 801364B0 001334B0  81 FF 00 C4 */	lwz r15, 0xc4(r31)
/* 801364B4 001334B4  90 01 01 08 */	stw r0, 0x108(r1)
/* 801364B8 001334B8  80 1F 00 BC */	lwz r0, 0xbc(r31)
/* 801364BC 001334BC  91 E1 01 3C */	stw r15, 0x13c(r1)
/* 801364C0 001334C0  81 FF 00 C8 */	lwz r15, 0xc8(r31)
/* 801364C4 001334C4  90 01 00 50 */	stw r0, 0x50(r1)
/* 801364C8 001334C8  80 01 01 3C */	lwz r0, 0x13c(r1)
/* 801364CC 001334CC  91 E1 01 0C */	stw r15, 0x10c(r1)
/* 801364D0 001334D0  81 FF 00 CC */	lwz r15, 0xcc(r31)
/* 801364D4 001334D4  90 01 00 58 */	stw r0, 0x58(r1)
/* 801364D8 001334D8  80 01 01 0C */	lwz r0, 0x10c(r1)
/* 801364DC 001334DC  91 E1 01 10 */	stw r15, 0x110(r1)
/* 801364E0 001334E0  81 FF 00 D0 */	lwz r15, 0xd0(r31)
/* 801364E4 001334E4  90 01 00 5C */	stw r0, 0x5c(r1)
/* 801364E8 001334E8  80 01 01 10 */	lwz r0, 0x110(r1)
/* 801364EC 001334EC  91 E1 01 14 */	stw r15, 0x114(r1)
/* 801364F0 001334F0  81 FF 00 D4 */	lwz r15, 0xd4(r31)
/* 801364F4 001334F4  90 01 00 18 */	stw r0, 0x18(r1)
/* 801364F8 001334F8  80 01 01 14 */	lwz r0, 0x114(r1)
/* 801364FC 001334FC  91 E1 01 18 */	stw r15, 0x118(r1)
/* 80136500 00133500  81 FF 00 D8 */	lwz r15, 0xd8(r31)
/* 80136504 00133504  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80136508 00133508  80 01 01 18 */	lwz r0, 0x118(r1)
/* 8013650C 0013350C  91 E1 01 1C */	stw r15, 0x11c(r1)
/* 80136510 00133510  81 FF 00 DC */	lwz r15, 0xdc(r31)
/* 80136514 00133514  90 01 00 20 */	stw r0, 0x20(r1)
/* 80136518 00133518  80 01 01 1C */	lwz r0, 0x11c(r1)
/* 8013651C 0013351C  91 E1 01 20 */	stw r15, 0x120(r1)
/* 80136520 00133520  81 FF 00 E0 */	lwz r15, 0xe0(r31)
/* 80136524 00133524  90 01 00 24 */	stw r0, 0x24(r1)
/* 80136528 00133528  80 01 01 20 */	lwz r0, 0x120(r1)
/* 8013652C 0013352C  91 E1 01 24 */	stw r15, 0x124(r1)
/* 80136530 00133530  81 FF 00 E4 */	lwz r15, 0xe4(r31)
/* 80136534 00133534  90 01 00 28 */	stw r0, 0x28(r1)
/* 80136538 00133538  80 01 01 24 */	lwz r0, 0x124(r1)
/* 8013653C 0013353C  91 E1 01 28 */	stw r15, 0x128(r1)
/* 80136540 00133540  81 FF 00 E8 */	lwz r15, 0xe8(r31)
/* 80136544 00133544  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80136548 00133548  80 01 01 28 */	lwz r0, 0x128(r1)
/* 8013654C 0013354C  91 E1 01 2C */	stw r15, 0x12c(r1)
/* 80136550 00133550  81 FF 00 EC */	lwz r15, 0xec(r31)
/* 80136554 00133554  90 01 00 30 */	stw r0, 0x30(r1)
/* 80136558 00133558  80 01 01 2C */	lwz r0, 0x12c(r1)
/* 8013655C 0013355C  91 E1 01 30 */	stw r15, 0x130(r1)
/* 80136560 00133560  81 FF 00 F0 */	lwz r15, 0xf0(r31)
/* 80136564 00133564  90 01 00 34 */	stw r0, 0x34(r1)
/* 80136568 00133568  80 01 01 30 */	lwz r0, 0x130(r1)
/* 8013656C 0013356C  91 E1 01 34 */	stw r15, 0x134(r1)
/* 80136570 00133570  81 FF 00 F4 */	lwz r15, 0xf4(r31)
/* 80136574 00133574  90 01 00 38 */	stw r0, 0x38(r1)
/* 80136578 00133578  80 01 01 34 */	lwz r0, 0x134(r1)
/* 8013657C 0013357C  91 E1 01 38 */	stw r15, 0x138(r1)
/* 80136580 00133580  82 5F 00 64 */	lwz r18, 0x64(r31)
/* 80136584 00133584  82 7F 00 68 */	lwz r19, 0x68(r31)
/* 80136588 00133588  82 9F 00 6C */	lwz r20, 0x6c(r31)
/* 8013658C 0013358C  82 BF 00 70 */	lwz r21, 0x70(r31)
/* 80136590 00133590  82 DF 00 74 */	lwz r22, 0x74(r31)
/* 80136594 00133594  82 FF 00 78 */	lwz r23, 0x78(r31)
/* 80136598 00133598  83 1F 00 7C */	lwz r24, 0x7c(r31)
/* 8013659C 0013359C  83 3F 00 80 */	lwz r25, 0x80(r31)
/* 801365A0 001335A0  83 5F 00 84 */	lwz r26, 0x84(r31)
/* 801365A4 001335A4  83 7F 00 88 */	lwz r27, 0x88(r31)
/* 801365A8 001335A8  83 9F 00 8C */	lwz r28, 0x8c(r31)
/* 801365AC 001335AC  83 BF 00 90 */	lwz r29, 0x90(r31)
/* 801365B0 001335B0  81 9F 00 94 */	lwz r12, 0x94(r31)
/* 801365B4 001335B4  81 7F 00 98 */	lwz r11, 0x98(r31)
/* 801365B8 001335B8  81 5F 00 9C */	lwz r10, 0x9c(r31)
/* 801365BC 001335BC  81 3F 00 A0 */	lwz r9, 0xa0(r31)
/* 801365C0 001335C0  81 1F 00 A4 */	lwz r8, 0xa4(r31)
/* 801365C4 001335C4  80 FF 00 A8 */	lwz r7, 0xa8(r31)
/* 801365C8 001335C8  80 DF 00 AC */	lwz r6, 0xac(r31)
/* 801365CC 001335CC  80 BF 00 B0 */	lwz r5, 0xb0(r31)
/* 801365D0 001335D0  80 9F 00 B4 */	lwz r4, 0xb4(r31)
/* 801365D4 001335D4  80 7F 00 B8 */	lwz r3, 0xb8(r31)
/* 801365D8 001335D8  81 DF 00 C0 */	lwz r14, 0xc0(r31)
/* 801365DC 001335DC  89 FF 00 F8 */	lbz r15, 0xf8(r31)
/* 801365E0 001335E0  A2 02 1C B0 */	lhz r16, lbl_80423030@sda21(r2)
/* 801365E4 001335E4  8A 22 1C B2 */	lbz r17, lbl_80423032@sda21(r2)
/* 801365E8 001335E8  83 E1 01 08 */	lwz r31, 0x108(r1)
/* 801365EC 001335EC  90 01 00 0C */	stw r0, 0xc(r1)
/* 801365F0 001335F0  80 01 01 38 */	lwz r0, 0x138(r1)
/* 801365F4 001335F4  93 E1 00 84 */	stw r31, 0x84(r1)
/* 801365F8 001335F8  92 41 00 88 */	stw r18, 0x88(r1)
/* 801365FC 001335FC  92 61 00 8C */	stw r19, 0x8c(r1)
/* 80136600 00133600  92 81 00 90 */	stw r20, 0x90(r1)
/* 80136604 00133604  92 A1 00 94 */	stw r21, 0x94(r1)
/* 80136608 00133608  92 C1 00 98 */	stw r22, 0x98(r1)
/* 8013660C 0013360C  92 E1 00 9C */	stw r23, 0x9c(r1)
/* 80136610 00133610  93 01 00 A0 */	stw r24, 0xa0(r1)
/* 80136614 00133614  93 21 00 A4 */	stw r25, 0xa4(r1)
/* 80136618 00133618  93 41 00 60 */	stw r26, 0x60(r1)
/* 8013661C 0013361C  93 61 00 64 */	stw r27, 0x64(r1)
/* 80136620 00133620  93 81 00 68 */	stw r28, 0x68(r1)
/* 80136624 00133624  93 A1 00 6C */	stw r29, 0x6c(r1)
/* 80136628 00133628  91 81 00 70 */	stw r12, 0x70(r1)
/* 8013662C 0013362C  91 61 00 74 */	stw r11, 0x74(r1)
/* 80136630 00133630  91 41 00 78 */	stw r10, 0x78(r1)
/* 80136634 00133634  91 21 00 7C */	stw r9, 0x7c(r1)
/* 80136638 00133638  91 01 00 80 */	stw r8, 0x80(r1)
/* 8013663C 0013363C  90 E1 00 3C */	stw r7, 0x3c(r1)
/* 80136640 00133640  90 C1 00 40 */	stw r6, 0x40(r1)
/* 80136644 00133644  90 A1 00 44 */	stw r5, 0x44(r1)
/* 80136648 00133648  90 81 00 48 */	stw r4, 0x48(r1)
/* 8013664C 0013364C  90 61 00 4C */	stw r3, 0x4c(r1)
/* 80136650 00133650  91 C1 00 54 */	stw r14, 0x54(r1)
/* 80136654 00133654  90 01 00 10 */	stw r0, 0x10(r1)
/* 80136658 00133658  99 E1 00 14 */	stb r15, 0x14(r1)
/* 8013665C 0013365C  B2 01 00 08 */	sth r16, 8(r1)
/* 80136660 00133660  9A 21 00 0A */	stb r17, 0xa(r1)
/* 80136664 00133664  41 82 00 08 */	beq lbl_8013666C
/* 80136668 00133668  48 00 00 20 */	b lbl_80136688
lbl_8013666C:
/* 8013666C 0013366C  38 00 00 FF */	li r0, 0xff
/* 80136670 00133670  38 60 00 01 */	li r3, 1
/* 80136674 00133674  98 61 00 0A */	stb r3, 0xa(r1)
/* 80136678 00133678  98 01 00 12 */	stb r0, 0x12(r1)
/* 8013667C 0013367C  98 01 00 13 */	stb r0, 0x13(r1)
/* 80136680 00133680  98 01 00 14 */	stb r0, 0x14(r1)
/* 80136684 00133684  48 00 00 14 */	b lbl_80136698
lbl_80136688:
/* 80136688 00133688  38 00 00 01 */	li r0, 1
/* 8013668C 0013368C  98 01 00 08 */	stb r0, 8(r1)
/* 80136690 00133690  98 01 00 09 */	stb r0, 9(r1)
/* 80136694 00133694  98 01 00 0A */	stb r0, 0xa(r1)
lbl_80136698:
/* 80136698 00133698  39 C1 00 08 */	addi r14, r1, 8
/* 8013669C 0013369C  39 E1 00 A8 */	addi r15, r1, 0xa8
/* 801366A0 001336A0  3A 01 00 0C */	addi r16, r1, 0xc
/* 801366A4 001336A4  3A 21 00 84 */	addi r17, r1, 0x84
/* 801366A8 001336A8  3A 41 00 18 */	addi r18, r1, 0x18
/* 801366AC 001336AC  3A 61 00 60 */	addi r19, r1, 0x60
/* 801366B0 001336B0  3A 81 00 3C */	addi r20, r1, 0x3c
/* 801366B4 001336B4  3A A0 00 00 */	li r21, 0
lbl_801366B8:
/* 801366B8 001336B8  88 0E 00 00 */	lbz r0, 0(r14)
/* 801366BC 001336BC  28 00 00 00 */	cmplwi r0, 0
/* 801366C0 001336C0  41 82 00 C8 */	beq lbl_80136788
/* 801366C4 001336C4  7D E3 7B 78 */	mr r3, r15
/* 801366C8 001336C8  4B FF CD 0D */	bl BattleStageGetLightNumberByName
/* 801366CC 001336CC  7C 76 1B 78 */	mr r22, r3
/* 801366D0 001336D0  2C 16 FF FF */	cmpwi r22, -1
/* 801366D4 001336D4  40 82 00 10 */	bne lbl_801366E4
/* 801366D8 001336D8  7D E3 7B 78 */	mr r3, r15
/* 801366DC 001336DC  4B FF CC 41 */	bl BattleStageSysLightEntry
/* 801366E0 001336E0  7C 76 1B 78 */	mr r22, r3
lbl_801366E4:
/* 801366E4 001336E4  88 90 00 00 */	lbz r4, 0(r16)
/* 801366E8 001336E8  7E C3 B3 78 */	mr r3, r22
/* 801366EC 001336EC  88 B0 00 01 */	lbz r5, 1(r16)
/* 801366F0 001336F0  38 E0 00 1E */	li r7, 0x1e
/* 801366F4 001336F4  88 D0 00 02 */	lbz r6, 2(r16)
/* 801366F8 001336F8  39 00 00 00 */	li r8, 0
/* 801366FC 001336FC  4B FF CA F5 */	bl BattleStageLightSetLightColor
/* 80136700 00133700  7E C3 B3 78 */	mr r3, r22
/* 80136704 00133704  38 80 00 78 */	li r4, 0x78
/* 80136708 00133708  38 A0 00 01 */	li r5, 1
/* 8013670C 0013370C  38 C0 00 00 */	li r6, 0
/* 80136710 00133710  4B FF CA 69 */	bl BattleStageLightSetWidth
/* 80136714 00133714  C0 31 00 00 */	lfs f1, 0(r17)
/* 80136718 00133718  7E C3 B3 78 */	mr r3, r22
/* 8013671C 0013371C  C0 51 00 04 */	lfs f2, 4(r17)
/* 80136720 00133720  38 80 00 00 */	li r4, 0
/* 80136724 00133724  C0 71 00 08 */	lfs f3, 8(r17)
/* 80136728 00133728  38 A0 00 00 */	li r5, 0
/* 8013672C 0013372C  4B FF C9 AD */	bl BattleStageLightSetPosition
/* 80136730 00133730  C0 32 00 00 */	lfs f1, 0(r18)
/* 80136734 00133734  7E C3 B3 78 */	mr r3, r22
/* 80136738 00133738  C0 52 00 04 */	lfs f2, 4(r18)
/* 8013673C 0013373C  38 80 00 00 */	li r4, 0
/* 80136740 00133740  C0 72 00 08 */	lfs f3, 8(r18)
/* 80136744 00133744  38 A0 00 00 */	li r5, 0
/* 80136748 00133748  4B FF C7 8D */	bl BattleStageLightSetUpVec
/* 8013674C 0013374C  C0 33 00 00 */	lfs f1, 0(r19)
/* 80136750 00133750  7E C3 B3 78 */	mr r3, r22
/* 80136754 00133754  C0 53 00 04 */	lfs f2, 4(r19)
/* 80136758 00133758  38 80 00 00 */	li r4, 0
/* 8013675C 0013375C  C0 73 00 08 */	lfs f3, 8(r19)
/* 80136760 00133760  38 A0 00 00 */	li r5, 0
/* 80136764 00133764  4B FF C8 C9 */	bl BattleStageLightSetTarget
/* 80136768 00133768  80 9E 04 20 */	lwz r4, 0x420(r30)
/* 8013676C 0013376C  7E C3 B3 78 */	mr r3, r22
/* 80136770 00133770  C0 34 00 00 */	lfs f1, 0(r20)
/* 80136774 00133774  38 A0 00 1E */	li r5, 0x1e
/* 80136778 00133778  C0 54 00 04 */	lfs f2, 4(r20)
/* 8013677C 0013377C  38 C0 00 05 */	li r6, 5
/* 80136780 00133780  C0 74 00 08 */	lfs f3, 8(r20)
/* 80136784 00133784  4B FF C7 F1 */	bl BattleStageLightSetTargetByUnit
lbl_80136788:
/* 80136788 00133788  3A B5 00 01 */	addi r21, r21, 1
/* 8013678C 0013378C  39 EF 00 20 */	addi r15, r15, 0x20
/* 80136790 00133790  2C 15 00 03 */	cmpwi r21, 3
/* 80136794 00133794  3A 10 00 03 */	addi r16, r16, 3
/* 80136798 00133798  3A 31 00 0C */	addi r17, r17, 0xc
/* 8013679C 0013379C  3A 52 00 0C */	addi r18, r18, 0xc
/* 801367A0 001337A0  3A 73 00 0C */	addi r19, r19, 0xc
/* 801367A4 001337A4  3A 94 00 0C */	addi r20, r20, 0xc
/* 801367A8 001337A8  39 CE 00 01 */	addi r14, r14, 1
/* 801367AC 001337AC  41 80 FF 0C */	blt lbl_801366B8
/* 801367B0 001337B0  38 60 00 8C */	li r3, 0x8c
/* 801367B4 001337B4  38 80 00 1E */	li r4, 0x1e
/* 801367B8 001337B8  38 A0 00 00 */	li r5, 0
/* 801367BC 001337BC  4B FF C6 8D */	bl func_80132E48
/* 801367C0 001337C0  38 60 00 8C */	li r3, 0x8c
/* 801367C4 001337C4  38 80 00 00 */	li r4, 0
/* 801367C8 001337C8  38 A0 00 00 */	li r5, 0
/* 801367CC 001337CC  4B FF C5 CD */	bl func_80132D98
/* 801367D0 001337D0  B9 C1 01 48 */	lmw r14, 0x148(r1)
/* 801367D4 001337D4  38 60 00 02 */	li r3, 2
/* 801367D8 001337D8  80 01 01 94 */	lwz r0, 0x194(r1)
/* 801367DC 001337DC  7C 08 03 A6 */	mtlr r0
/* 801367E0 001337E0  38 21 01 90 */	addi r1, r1, 0x190
/* 801367E4 001337E4  4E 80 00 20 */	blr 

.global evt_batstage_return_aud_dark_base
evt_batstage_return_aud_dark_base:
/* 801367E8 001337E8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801367EC 001337EC  7C 08 02 A6 */	mflr r0
/* 801367F0 001337F0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801367F4 001337F4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801367F8 001337F8  93 C1 00 08 */	stw r30, 8(r1)
/* 801367FC 001337FC  7C 7E 1B 78 */	mr r30, r3
/* 80136800 00133800  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 80136804 00133804  80 9F 00 00 */	lwz r4, 0(r31)
/* 80136808 00133808  4B EF A3 C5 */	bl evtGetValue
/* 8013680C 0013380C  80 9F 00 04 */	lwz r4, 4(r31)
/* 80136810 00133810  7C 7F 1B 78 */	mr r31, r3
/* 80136814 00133814  7F C3 F3 78 */	mr r3, r30
/* 80136818 00133818  4B EF A3 B5 */	bl evtGetValue
/* 8013681C 0013381C  7C 60 1B 78 */	mr r0, r3
/* 80136820 00133820  7F E3 FB 78 */	mr r3, r31
/* 80136824 00133824  7C 04 03 78 */	mr r4, r0
/* 80136828 00133828  4B FF C4 FD */	bl BattleStageReturnAudDarkBase
/* 8013682C 0013382C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80136830 00133830  38 60 00 02 */	li r3, 2
/* 80136834 00133834  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80136838 00133838  83 C1 00 08 */	lwz r30, 8(r1)
/* 8013683C 0013383C  7C 08 03 A6 */	mtlr r0
/* 80136840 00133840  38 21 00 10 */	addi r1, r1, 0x10
/* 80136844 00133844  4E 80 00 20 */	blr 

.global evt_batstage_set_aud_dark_base
evt_batstage_set_aud_dark_base:
/* 80136848 00133848  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013684C 0013384C  7C 08 02 A6 */	mflr r0
/* 80136850 00133850  90 01 00 24 */	stw r0, 0x24(r1)
/* 80136854 00133854  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80136858 00133858  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8013685C 0013385C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80136860 00133860  7C 7D 1B 78 */	mr r29, r3
/* 80136864 00133864  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 80136868 00133868  80 9F 00 00 */	lwz r4, 0(r31)
/* 8013686C 0013386C  4B EF A3 61 */	bl evtGetValue
/* 80136870 00133870  80 9F 00 04 */	lwz r4, 4(r31)
/* 80136874 00133874  54 7E 06 3E */	clrlwi r30, r3, 0x18
/* 80136878 00133878  7F A3 EB 78 */	mr r3, r29
/* 8013687C 0013387C  4B EF A3 51 */	bl evtGetValue
/* 80136880 00133880  80 9F 00 08 */	lwz r4, 8(r31)
/* 80136884 00133884  7C 7F 1B 78 */	mr r31, r3
/* 80136888 00133888  7F A3 EB 78 */	mr r3, r29
/* 8013688C 0013388C  4B EF A3 41 */	bl evtGetValue
/* 80136890 00133890  7C 60 1B 78 */	mr r0, r3
/* 80136894 00133894  7F C3 F3 78 */	mr r3, r30
/* 80136898 00133898  7C 05 03 78 */	mr r5, r0
/* 8013689C 0013389C  7F E4 FB 78 */	mr r4, r31
/* 801368A0 001338A0  4B FF C4 BD */	bl BattleStageSetAudDarkBase
/* 801368A4 001338A4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801368A8 001338A8  38 60 00 02 */	li r3, 2
/* 801368AC 001338AC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801368B0 001338B0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801368B4 001338B4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801368B8 001338B8  7C 08 03 A6 */	mtlr r0
/* 801368BC 001338BC  38 21 00 20 */	addi r1, r1, 0x20
/* 801368C0 001338C0  4E 80 00 20 */	blr 

.global evt_batstage_set_aud_dark
evt_batstage_set_aud_dark:
/* 801368C4 001338C4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801368C8 001338C8  7C 08 02 A6 */	mflr r0
/* 801368CC 001338CC  90 01 00 24 */	stw r0, 0x24(r1)
/* 801368D0 001338D0  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801368D4 001338D4  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801368D8 001338D8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801368DC 001338DC  7C 7D 1B 78 */	mr r29, r3
/* 801368E0 001338E0  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 801368E4 001338E4  80 9F 00 00 */	lwz r4, 0(r31)
/* 801368E8 001338E8  4B EF A2 E5 */	bl evtGetValue
/* 801368EC 001338EC  80 9F 00 04 */	lwz r4, 4(r31)
/* 801368F0 001338F0  54 7E 06 3E */	clrlwi r30, r3, 0x18
/* 801368F4 001338F4  7F A3 EB 78 */	mr r3, r29
/* 801368F8 001338F8  4B EF A2 D5 */	bl evtGetValue
/* 801368FC 001338FC  80 9F 00 08 */	lwz r4, 8(r31)
/* 80136900 00133900  7C 7F 1B 78 */	mr r31, r3
/* 80136904 00133904  7F A3 EB 78 */	mr r3, r29
/* 80136908 00133908  4B EF A2 C5 */	bl evtGetValue
/* 8013690C 0013390C  7C 60 1B 78 */	mr r0, r3
/* 80136910 00133910  7F C3 F3 78 */	mr r3, r30
/* 80136914 00133914  7C 05 03 78 */	mr r5, r0
/* 80136918 00133918  7F E4 FB 78 */	mr r4, r31
/* 8013691C 0013391C  4B FF C4 7D */	bl func_80132D98
/* 80136920 00133920  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80136924 00133924  38 60 00 02 */	li r3, 2
/* 80136928 00133928  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8013692C 0013392C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80136930 00133930  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80136934 00133934  7C 08 03 A6 */	mtlr r0
/* 80136938 00133938  38 21 00 20 */	addi r1, r1, 0x20
/* 8013693C 0013393C  4E 80 00 20 */	blr 

.global evt_batstage_return_stg_dark_base
evt_batstage_return_stg_dark_base:
/* 80136940 00133940  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80136944 00133944  7C 08 02 A6 */	mflr r0
/* 80136948 00133948  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013694C 0013394C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80136950 00133950  93 C1 00 08 */	stw r30, 8(r1)
/* 80136954 00133954  7C 7E 1B 78 */	mr r30, r3
/* 80136958 00133958  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 8013695C 0013395C  80 9F 00 00 */	lwz r4, 0(r31)
/* 80136960 00133960  4B EF A2 6D */	bl evtGetValue
/* 80136964 00133964  80 9F 00 04 */	lwz r4, 4(r31)
/* 80136968 00133968  7C 7F 1B 78 */	mr r31, r3
/* 8013696C 0013396C  7F C3 F3 78 */	mr r3, r30
/* 80136970 00133970  4B EF A2 5D */	bl evtGetValue
/* 80136974 00133974  7C 60 1B 78 */	mr r0, r3
/* 80136978 00133978  7F E3 FB 78 */	mr r3, r31
/* 8013697C 0013397C  7C 04 03 78 */	mr r4, r0
/* 80136980 00133980  4B FF C4 55 */	bl BattleStageReturnStgDarkBase
/* 80136984 00133984  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80136988 00133988  38 60 00 02 */	li r3, 2
/* 8013698C 0013398C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80136990 00133990  83 C1 00 08 */	lwz r30, 8(r1)
/* 80136994 00133994  7C 08 03 A6 */	mtlr r0
/* 80136998 00133998  38 21 00 10 */	addi r1, r1, 0x10
/* 8013699C 0013399C  4E 80 00 20 */	blr 

.global evt_batstage_set_stg_dark_base
evt_batstage_set_stg_dark_base:
/* 801369A0 001339A0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801369A4 001339A4  7C 08 02 A6 */	mflr r0
/* 801369A8 001339A8  90 01 00 24 */	stw r0, 0x24(r1)
/* 801369AC 001339AC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801369B0 001339B0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801369B4 001339B4  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801369B8 001339B8  7C 7D 1B 78 */	mr r29, r3
/* 801369BC 001339BC  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 801369C0 001339C0  80 9F 00 00 */	lwz r4, 0(r31)
/* 801369C4 001339C4  4B EF A2 09 */	bl evtGetValue
/* 801369C8 001339C8  80 9F 00 04 */	lwz r4, 4(r31)
/* 801369CC 001339CC  54 7E 06 3E */	clrlwi r30, r3, 0x18
/* 801369D0 001339D0  7F A3 EB 78 */	mr r3, r29
/* 801369D4 001339D4  4B EF A1 F9 */	bl evtGetValue
/* 801369D8 001339D8  80 9F 00 08 */	lwz r4, 8(r31)
/* 801369DC 001339DC  7C 7F 1B 78 */	mr r31, r3
/* 801369E0 001339E0  7F A3 EB 78 */	mr r3, r29
/* 801369E4 001339E4  4B EF A1 E9 */	bl evtGetValue
/* 801369E8 001339E8  7C 60 1B 78 */	mr r0, r3
/* 801369EC 001339EC  7F C3 F3 78 */	mr r3, r30
/* 801369F0 001339F0  7C 05 03 78 */	mr r5, r0
/* 801369F4 001339F4  7F E4 FB 78 */	mr r4, r31
/* 801369F8 001339F8  4B FF C4 15 */	bl BattleStageSetStgDarkBase
/* 801369FC 001339FC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80136A00 00133A00  38 60 00 02 */	li r3, 2
/* 80136A04 00133A04  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80136A08 00133A08  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80136A0C 00133A0C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80136A10 00133A10  7C 08 03 A6 */	mtlr r0
/* 80136A14 00133A14  38 21 00 20 */	addi r1, r1, 0x20
/* 80136A18 00133A18  4E 80 00 20 */	blr 

.global evt_batstage_set_stg_dark
evt_batstage_set_stg_dark:
/* 80136A1C 00133A1C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80136A20 00133A20  7C 08 02 A6 */	mflr r0
/* 80136A24 00133A24  90 01 00 24 */	stw r0, 0x24(r1)
/* 80136A28 00133A28  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80136A2C 00133A2C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80136A30 00133A30  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80136A34 00133A34  7C 7D 1B 78 */	mr r29, r3
/* 80136A38 00133A38  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 80136A3C 00133A3C  80 9F 00 00 */	lwz r4, 0(r31)
/* 80136A40 00133A40  4B EF A1 8D */	bl evtGetValue
/* 80136A44 00133A44  80 9F 00 04 */	lwz r4, 4(r31)
/* 80136A48 00133A48  54 7E 06 3E */	clrlwi r30, r3, 0x18
/* 80136A4C 00133A4C  7F A3 EB 78 */	mr r3, r29
/* 80136A50 00133A50  4B EF A1 7D */	bl evtGetValue
/* 80136A54 00133A54  80 9F 00 08 */	lwz r4, 8(r31)
/* 80136A58 00133A58  7C 7F 1B 78 */	mr r31, r3
/* 80136A5C 00133A5C  7F A3 EB 78 */	mr r3, r29
/* 80136A60 00133A60  4B EF A1 6D */	bl evtGetValue
/* 80136A64 00133A64  7C 60 1B 78 */	mr r0, r3
/* 80136A68 00133A68  7F C3 F3 78 */	mr r3, r30
/* 80136A6C 00133A6C  7C 05 03 78 */	mr r5, r0
/* 80136A70 00133A70  7F E4 FB 78 */	mr r4, r31
/* 80136A74 00133A74  4B FF C3 D5 */	bl func_80132E48
/* 80136A78 00133A78  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80136A7C 00133A7C  38 60 00 02 */	li r3, 2
/* 80136A80 00133A80  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80136A84 00133A84  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80136A88 00133A88  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80136A8C 00133A8C  7C 08 03 A6 */	mtlr r0
/* 80136A90 00133A90  38 21 00 20 */	addi r1, r1, 0x20
/* 80136A94 00133A94  4E 80 00 20 */	blr 
