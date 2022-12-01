.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global evt_twoddisp_flag_onoff
evt_twoddisp_flag_onoff:
/* 801403D4 0013D3D4  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801403D8 0013D3D8  7C 08 02 A6 */	mflr r0
/* 801403DC 0013D3DC  90 01 00 34 */	stw r0, 0x34(r1)
/* 801403E0 0013D3E0  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 801403E4 0013D3E4  7C 79 1B 78 */	mr r25, r3
/* 801403E8 0013D3E8  83 63 00 18 */	lwz r27, 0x18(r3)
/* 801403EC 0013D3EC  80 9B 00 00 */	lwz r4, 0(r27)
/* 801403F0 0013D3F0  4B EF 07 DD */	bl evtGetValue
/* 801403F4 0013D3F4  80 9B 00 04 */	lwz r4, 4(r27)
/* 801403F8 0013D3F8  7C 7F 1B 78 */	mr r31, r3
/* 801403FC 0013D3FC  7F 23 CB 78 */	mr r3, r25
/* 80140400 0013D400  4B EF 07 CD */	bl evtGetValue
/* 80140404 0013D404  3B A0 00 00 */	li r29, 0
/* 80140408 0013D408  7C 7A 1B 78 */	mr r26, r3
/* 8014040C 0013D40C  7F BC EB 78 */	mr r28, r29
lbl_80140410:
/* 80140410 0013D410  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140414 0013D414  7F 44 D3 78 */	mr r4, r26
/* 80140418 0013D418  7F C0 E2 14 */	add r30, r0, r28
/* 8014041C 0013D41C  7F C3 F3 78 */	mr r3, r30
/* 80140420 0013D420  48 12 70 2D */	bl strcmp
/* 80140424 0013D424  2C 03 00 00 */	cmpwi r3, 0
/* 80140428 0013D428  40 82 00 08 */	bne lbl_80140430
/* 8014042C 0013D42C  48 00 00 18 */	b lbl_80140444
lbl_80140430:
/* 80140430 0013D430  3B BD 00 01 */	addi r29, r29, 1
/* 80140434 0013D434  3B 9C 00 34 */	addi r28, r28, 0x34
/* 80140438 0013D438  2C 1D 00 64 */	cmpwi r29, 0x64
/* 8014043C 0013D43C  41 80 FF D4 */	blt lbl_80140410
/* 80140440 0013D440  3B C0 00 00 */	li r30, 0
lbl_80140444:
/* 80140444 0013D444  2C 1F 00 00 */	cmpwi r31, 0
/* 80140448 0013D448  41 82 00 20 */	beq lbl_80140468
/* 8014044C 0013D44C  80 9B 00 08 */	lwz r4, 8(r27)
/* 80140450 0013D450  7F 23 CB 78 */	mr r3, r25
/* 80140454 0013D454  4B EF 07 79 */	bl evtGetValue
/* 80140458 0013D458  A0 1E 00 10 */	lhz r0, 0x10(r30)
/* 8014045C 0013D45C  7C 00 1B 78 */	or r0, r0, r3
/* 80140460 0013D460  B0 1E 00 10 */	sth r0, 0x10(r30)
/* 80140464 0013D464  48 00 00 1C */	b lbl_80140480
lbl_80140468:
/* 80140468 0013D468  80 9B 00 08 */	lwz r4, 8(r27)
/* 8014046C 0013D46C  7F 23 CB 78 */	mr r3, r25
/* 80140470 0013D470  4B EF 07 5D */	bl evtGetValue
/* 80140474 0013D474  A0 1E 00 10 */	lhz r0, 0x10(r30)
/* 80140478 0013D478  7C 00 18 78 */	andc r0, r0, r3
/* 8014047C 0013D47C  B0 1E 00 10 */	sth r0, 0x10(r30)
lbl_80140480:
/* 80140480 0013D480  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 80140484 0013D484  38 60 00 02 */	li r3, 2
/* 80140488 0013D488  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8014048C 0013D48C  7C 08 03 A6 */	mtlr r0
/* 80140490 0013D490  38 21 00 30 */	addi r1, r1, 0x30
/* 80140494 0013D494  4E 80 00 20 */	blr 

.global evt_twoddisp_set_base_position
evt_twoddisp_set_base_position:
/* 80140498 0013D498  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8014049C 0013D49C  7C 08 02 A6 */	mflr r0
/* 801404A0 0013D4A0  90 01 00 24 */	stw r0, 0x24(r1)
/* 801404A4 0013D4A4  BF 41 00 08 */	stmw r26, 8(r1)
/* 801404A8 0013D4A8  7C 7A 1B 78 */	mr r26, r3
/* 801404AC 0013D4AC  83 83 00 18 */	lwz r28, 0x18(r3)
/* 801404B0 0013D4B0  80 9C 00 00 */	lwz r4, 0(r28)
/* 801404B4 0013D4B4  4B EF 07 19 */	bl evtGetValue
/* 801404B8 0013D4B8  3B C0 00 00 */	li r30, 0
/* 801404BC 0013D4BC  7C 7B 1B 78 */	mr r27, r3
/* 801404C0 0013D4C0  7F DD F3 78 */	mr r29, r30
lbl_801404C4:
/* 801404C4 0013D4C4  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 801404C8 0013D4C8  7F 64 DB 78 */	mr r4, r27
/* 801404CC 0013D4CC  7F E0 EA 14 */	add r31, r0, r29
/* 801404D0 0013D4D0  7F E3 FB 78 */	mr r3, r31
/* 801404D4 0013D4D4  48 12 6F 79 */	bl strcmp
/* 801404D8 0013D4D8  2C 03 00 00 */	cmpwi r3, 0
/* 801404DC 0013D4DC  40 82 00 08 */	bne lbl_801404E4
/* 801404E0 0013D4E0  48 00 00 18 */	b lbl_801404F8
lbl_801404E4:
/* 801404E4 0013D4E4  3B DE 00 01 */	addi r30, r30, 1
/* 801404E8 0013D4E8  3B BD 00 34 */	addi r29, r29, 0x34
/* 801404EC 0013D4EC  2C 1E 00 64 */	cmpwi r30, 0x64
/* 801404F0 0013D4F0  41 80 FF D4 */	blt lbl_801404C4
/* 801404F4 0013D4F4  3B E0 00 00 */	li r31, 0
lbl_801404F8:
/* 801404F8 0013D4F8  80 9C 00 04 */	lwz r4, 4(r28)
/* 801404FC 0013D4FC  7F 43 D3 78 */	mr r3, r26
/* 80140500 0013D500  4B EE FC AD */	bl evtGetFloat
/* 80140504 0013D504  D0 3F 00 1C */	stfs f1, 0x1c(r31)
/* 80140508 0013D508  7F 43 D3 78 */	mr r3, r26
/* 8014050C 0013D50C  80 9C 00 08 */	lwz r4, 8(r28)
/* 80140510 0013D510  4B EE FC 9D */	bl evtGetFloat
/* 80140514 0013D514  D0 3F 00 20 */	stfs f1, 0x20(r31)
/* 80140518 0013D518  38 60 00 02 */	li r3, 2
/* 8014051C 0013D51C  BB 41 00 08 */	lmw r26, 8(r1)
/* 80140520 0013D520  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80140524 0013D524  7C 08 03 A6 */	mtlr r0
/* 80140528 0013D528  38 21 00 20 */	addi r1, r1, 0x20
/* 8014052C 0013D52C  4E 80 00 20 */	blr 

.global evt_twoddisp_set_position
evt_twoddisp_set_position:
/* 80140530 0013D530  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80140534 0013D534  7C 08 02 A6 */	mflr r0
/* 80140538 0013D538  90 01 00 24 */	stw r0, 0x24(r1)
/* 8014053C 0013D53C  BF 41 00 08 */	stmw r26, 8(r1)
/* 80140540 0013D540  7C 7A 1B 78 */	mr r26, r3
/* 80140544 0013D544  83 83 00 18 */	lwz r28, 0x18(r3)
/* 80140548 0013D548  80 9C 00 00 */	lwz r4, 0(r28)
/* 8014054C 0013D54C  4B EF 06 81 */	bl evtGetValue
/* 80140550 0013D550  3B C0 00 00 */	li r30, 0
/* 80140554 0013D554  7C 7B 1B 78 */	mr r27, r3
/* 80140558 0013D558  7F DD F3 78 */	mr r29, r30
lbl_8014055C:
/* 8014055C 0013D55C  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140560 0013D560  7F 64 DB 78 */	mr r4, r27
/* 80140564 0013D564  7F E0 EA 14 */	add r31, r0, r29
/* 80140568 0013D568  7F E3 FB 78 */	mr r3, r31
/* 8014056C 0013D56C  48 12 6E E1 */	bl strcmp
/* 80140570 0013D570  2C 03 00 00 */	cmpwi r3, 0
/* 80140574 0013D574  40 82 00 08 */	bne lbl_8014057C
/* 80140578 0013D578  48 00 00 18 */	b lbl_80140590
lbl_8014057C:
/* 8014057C 0013D57C  3B DE 00 01 */	addi r30, r30, 1
/* 80140580 0013D580  3B BD 00 34 */	addi r29, r29, 0x34
/* 80140584 0013D584  2C 1E 00 64 */	cmpwi r30, 0x64
/* 80140588 0013D588  41 80 FF D4 */	blt lbl_8014055C
/* 8014058C 0013D58C  3B E0 00 00 */	li r31, 0
lbl_80140590:
/* 80140590 0013D590  80 9C 00 04 */	lwz r4, 4(r28)
/* 80140594 0013D594  7F 43 D3 78 */	mr r3, r26
/* 80140598 0013D598  4B EE FC 15 */	bl evtGetFloat
/* 8014059C 0013D59C  D0 3F 00 14 */	stfs f1, 0x14(r31)
/* 801405A0 0013D5A0  7F 43 D3 78 */	mr r3, r26
/* 801405A4 0013D5A4  80 9C 00 08 */	lwz r4, 8(r28)
/* 801405A8 0013D5A8  4B EE FC 05 */	bl evtGetFloat
/* 801405AC 0013D5AC  D0 3F 00 18 */	stfs f1, 0x18(r31)
/* 801405B0 0013D5B0  38 60 00 02 */	li r3, 2
/* 801405B4 0013D5B4  BB 41 00 08 */	lmw r26, 8(r1)
/* 801405B8 0013D5B8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801405BC 0013D5BC  7C 08 03 A6 */	mtlr r0
/* 801405C0 0013D5C0  38 21 00 20 */	addi r1, r1, 0x20
/* 801405C4 0013D5C4  4E 80 00 20 */	blr 

.global evt_twoddisp_entry
evt_twoddisp_entry:
/* 801405C8 0013D5C8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801405CC 0013D5CC  7C 08 02 A6 */	mflr r0
/* 801405D0 0013D5D0  90 01 00 24 */	stw r0, 0x24(r1)
/* 801405D4 0013D5D4  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 801405D8 0013D5D8  7C 7B 1B 78 */	mr r27, r3
/* 801405DC 0013D5DC  83 A3 00 18 */	lwz r29, 0x18(r3)
/* 801405E0 0013D5E0  80 9D 00 00 */	lwz r4, 0(r29)
/* 801405E4 0013D5E4  4B EF 05 E9 */	bl evtGetValue
/* 801405E8 0013D5E8  80 9D 00 04 */	lwz r4, 4(r29)
/* 801405EC 0013D5EC  7C 7C 1B 78 */	mr r28, r3
/* 801405F0 0013D5F0  7F 63 DB 78 */	mr r3, r27
/* 801405F4 0013D5F4  4B EF 05 D9 */	bl evtGetValue
/* 801405F8 0013D5F8  7C 7F 1B 78 */	mr r31, r3
/* 801405FC 0013D5FC  3B A0 00 00 */	li r29, 0
/* 80140600 0013D600  3B C0 00 00 */	li r30, 0
lbl_80140604:
/* 80140604 0013D604  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140608 0013D608  7F 84 E3 78 */	mr r4, r28
/* 8014060C 0013D60C  7F 60 F2 14 */	add r27, r0, r30
/* 80140610 0013D610  7F 63 DB 78 */	mr r3, r27
/* 80140614 0013D614  48 12 6E 39 */	bl strcmp
/* 80140618 0013D618  88 1B 00 00 */	lbz r0, 0(r27)
/* 8014061C 0013D61C  7C 00 07 75 */	extsb. r0, r0
/* 80140620 0013D620  40 82 00 44 */	bne lbl_80140664
/* 80140624 0013D624  7F 63 DB 78 */	mr r3, r27
/* 80140628 0013D628  7F 84 E3 78 */	mr r4, r28
/* 8014062C 0013D62C  48 12 6F B9 */	bl strcpy
/* 80140630 0013D630  38 60 00 01 */	li r3, 1
/* 80140634 0013D634  38 00 00 00 */	li r0, 0
/* 80140638 0013D638  B0 7B 00 10 */	sth r3, 0x10(r27)
/* 8014063C 0013D63C  C0 22 B9 30 */	lfs f1, lbl_8041CCB0@sda21(r2)
/* 80140640 0013D640  B0 1B 00 12 */	sth r0, 0x12(r27)
/* 80140644 0013D644  C0 02 B9 34 */	lfs f0, lbl_8041CCB4@sda21(r2)
/* 80140648 0013D648  D0 3B 00 14 */	stfs f1, 0x14(r27)
/* 8014064C 0013D64C  D0 3B 00 1C */	stfs f1, 0x1c(r27)
/* 80140650 0013D650  D0 3B 00 18 */	stfs f1, 0x18(r27)
/* 80140654 0013D654  D0 3B 00 20 */	stfs f1, 0x20(r27)
/* 80140658 0013D658  93 FB 00 24 */	stw r31, 0x24(r27)
/* 8014065C 0013D65C  D0 1B 00 28 */	stfs f0, 0x28(r27)
/* 80140660 0013D660  48 00 00 14 */	b lbl_80140674
lbl_80140664:
/* 80140664 0013D664  3B BD 00 01 */	addi r29, r29, 1
/* 80140668 0013D668  3B DE 00 34 */	addi r30, r30, 0x34
/* 8014066C 0013D66C  2C 1D 00 64 */	cmpwi r29, 0x64
/* 80140670 0013D670  41 80 FF 94 */	blt lbl_80140604
lbl_80140674:
/* 80140674 0013D674  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 80140678 0013D678  38 60 00 02 */	li r3, 2
/* 8014067C 0013D67C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80140680 0013D680  7C 08 03 A6 */	mtlr r0
/* 80140684 0013D684  38 21 00 20 */	addi r1, r1, 0x20
/* 80140688 0013D688  4E 80 00 20 */	blr 

.global evt_twoddisp_init
evt_twoddisp_init:
/* 8014068C 0013D68C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80140690 0013D690  7C 08 02 A6 */	mflr r0
/* 80140694 0013D694  38 A0 00 00 */	li r5, 0
/* 80140698 0013D698  90 01 00 14 */	stw r0, 0x14(r1)
/* 8014069C 0013D69C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801406A0 0013D6A0  7C 7F 1B 78 */	mr r31, r3
/* 801406A4 0013D6A4  38 6D AB 58 */	addi r3, r13, lbl_80411DB8@sda21
/* 801406A8 0013D6A8  88 9F 00 0B */	lbz r4, 0xb(r31)
/* 801406AC 0013D6AC  88 DF 00 0C */	lbz r6, 0xc(r31)
/* 801406B0 0013D6B0  4B EF 64 D5 */	bl evtEntryType
/* 801406B4 0013D6B4  80 1F 01 60 */	lwz r0, 0x160(r31)
/* 801406B8 0013D6B8  7C 64 1B 78 */	mr r4, r3
/* 801406BC 0013D6BC  38 60 14 50 */	li r3, 0x1450
/* 801406C0 0013D6C0  90 04 01 60 */	stw r0, 0x160(r4)
/* 801406C4 0013D6C4  80 1F 01 70 */	lwz r0, 0x170(r31)
/* 801406C8 0013D6C8  90 04 01 70 */	stw r0, 0x170(r4)
/* 801406CC 0013D6CC  80 1F 00 9C */	lwz r0, 0x9c(r31)
/* 801406D0 0013D6D0  90 04 00 9C */	stw r0, 0x9c(r4)
/* 801406D4 0013D6D4  80 1F 00 A0 */	lwz r0, 0xa0(r31)
/* 801406D8 0013D6D8  90 04 00 A0 */	stw r0, 0xa0(r4)
/* 801406DC 0013D6DC  80 1F 00 A4 */	lwz r0, 0xa4(r31)
/* 801406E0 0013D6E0  90 04 00 A4 */	stw r0, 0xa4(r4)
/* 801406E4 0013D6E4  80 1F 00 A8 */	lwz r0, 0xa8(r31)
/* 801406E8 0013D6E8  90 04 00 A8 */	stw r0, 0xa8(r4)
/* 801406EC 0013D6EC  80 1F 00 AC */	lwz r0, 0xac(r31)
/* 801406F0 0013D6F0  90 04 00 AC */	stw r0, 0xac(r4)
/* 801406F4 0013D6F4  80 1F 00 B0 */	lwz r0, 0xb0(r31)
/* 801406F8 0013D6F8  90 04 00 B0 */	stw r0, 0xb0(r4)
/* 801406FC 0013D6FC  80 1F 00 B4 */	lwz r0, 0xb4(r31)
/* 80140700 0013D700  90 04 00 B4 */	stw r0, 0xb4(r4)
/* 80140704 0013D704  80 1F 00 B8 */	lwz r0, 0xb8(r31)
/* 80140708 0013D708  90 04 00 B8 */	stw r0, 0xb8(r4)
/* 8014070C 0013D70C  80 1F 00 BC */	lwz r0, 0xbc(r31)
/* 80140710 0013D710  90 04 00 BC */	stw r0, 0xbc(r4)
/* 80140714 0013D714  80 1F 00 C0 */	lwz r0, 0xc0(r31)
/* 80140718 0013D718  90 04 00 C0 */	stw r0, 0xc0(r4)
/* 8014071C 0013D71C  80 1F 00 C4 */	lwz r0, 0xc4(r31)
/* 80140720 0013D720  90 04 00 C4 */	stw r0, 0xc4(r4)
/* 80140724 0013D724  80 1F 00 C8 */	lwz r0, 0xc8(r31)
/* 80140728 0013D728  90 04 00 C8 */	stw r0, 0xc8(r4)
/* 8014072C 0013D72C  80 1F 00 CC */	lwz r0, 0xcc(r31)
/* 80140730 0013D730  90 04 00 CC */	stw r0, 0xcc(r4)
/* 80140734 0013D734  80 1F 00 D0 */	lwz r0, 0xd0(r31)
/* 80140738 0013D738  90 04 00 D0 */	stw r0, 0xd0(r4)
/* 8014073C 0013D73C  80 1F 00 D4 */	lwz r0, 0xd4(r31)
/* 80140740 0013D740  90 04 00 D4 */	stw r0, 0xd4(r4)
/* 80140744 0013D744  80 1F 00 D8 */	lwz r0, 0xd8(r31)
/* 80140748 0013D748  90 04 00 D8 */	stw r0, 0xd8(r4)
/* 8014074C 0013D74C  80 1F 00 DC */	lwz r0, 0xdc(r31)
/* 80140750 0013D750  90 04 00 DC */	stw r0, 0xdc(r4)
/* 80140754 0013D754  80 1F 00 E0 */	lwz r0, 0xe0(r31)
/* 80140758 0013D758  90 04 00 E0 */	stw r0, 0xe0(r4)
/* 8014075C 0013D75C  80 1F 00 E4 */	lwz r0, 0xe4(r31)
/* 80140760 0013D760  90 04 00 E4 */	stw r0, 0xe4(r4)
/* 80140764 0013D764  80 1F 01 54 */	lwz r0, 0x154(r31)
/* 80140768 0013D768  90 04 01 54 */	stw r0, 0x154(r4)
/* 8014076C 0013D76C  80 1F 01 58 */	lwz r0, 0x158(r31)
/* 80140770 0013D770  90 04 01 58 */	stw r0, 0x158(r4)
/* 80140774 0013D774  80 04 01 5C */	lwz r0, 0x15c(r4)
/* 80140778 0013D778  90 0D 17 80 */	stw r0, lbl_804189E0@sda21(r13)
/* 8014077C 0013D77C  4B EE F1 D9 */	bl _mapAlloc
/* 80140780 0013D780  38 A0 00 00 */	li r5, 0
/* 80140784 0013D784  38 00 00 0C */	li r0, 0xc
/* 80140788 0013D788  7C A4 2B 78 */	mr r4, r5
/* 8014078C 0013D78C  90 6D 17 84 */	stw r3, lbl_804189E4@sda21(r13)
/* 80140790 0013D790  C0 22 B9 30 */	lfs f1, lbl_8041CCB0@sda21(r2)
/* 80140794 0013D794  C0 02 B9 34 */	lfs f0, lbl_8041CCB4@sda21(r2)
/* 80140798 0013D798  7C 09 03 A6 */	mtctr r0
lbl_8014079C:
/* 8014079C 0013D79C  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 801407A0 0013D7A0  38 60 00 00 */	li r3, 0
/* 801407A4 0013D7A4  39 84 00 34 */	addi r12, r4, 0x34
/* 801407A8 0013D7A8  39 64 00 68 */	addi r11, r4, 0x68
/* 801407AC 0013D7AC  7F E0 22 14 */	add r31, r0, r4
/* 801407B0 0013D7B0  39 44 00 9C */	addi r10, r4, 0x9c
/* 801407B4 0013D7B4  98 7F 00 00 */	stb r3, 0(r31)
/* 801407B8 0013D7B8  39 24 00 D0 */	addi r9, r4, 0xd0
/* 801407BC 0013D7BC  39 04 01 04 */	addi r8, r4, 0x104
/* 801407C0 0013D7C0  38 E4 01 38 */	addi r7, r4, 0x138
/* 801407C4 0013D7C4  B0 7F 00 10 */	sth r3, 0x10(r31)
/* 801407C8 0013D7C8  38 C4 01 6C */	addi r6, r4, 0x16c
/* 801407CC 0013D7CC  38 84 01 A0 */	addi r4, r4, 0x1a0
/* 801407D0 0013D7D0  38 A5 00 08 */	addi r5, r5, 8
/* 801407D4 0013D7D4  B0 7F 00 12 */	sth r3, 0x12(r31)
/* 801407D8 0013D7D8  D0 3F 00 14 */	stfs f1, 0x14(r31)
/* 801407DC 0013D7DC  D0 3F 00 1C */	stfs f1, 0x1c(r31)
/* 801407E0 0013D7E0  D0 3F 00 18 */	stfs f1, 0x18(r31)
/* 801407E4 0013D7E4  D0 3F 00 20 */	stfs f1, 0x20(r31)
/* 801407E8 0013D7E8  90 7F 00 24 */	stw r3, 0x24(r31)
/* 801407EC 0013D7EC  D0 1F 00 28 */	stfs f0, 0x28(r31)
/* 801407F0 0013D7F0  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 801407F4 0013D7F4  7D 80 62 14 */	add r12, r0, r12
/* 801407F8 0013D7F8  98 6C 00 00 */	stb r3, 0(r12)
/* 801407FC 0013D7FC  B0 6C 00 10 */	sth r3, 0x10(r12)
/* 80140800 0013D800  B0 6C 00 12 */	sth r3, 0x12(r12)
/* 80140804 0013D804  D0 2C 00 14 */	stfs f1, 0x14(r12)
/* 80140808 0013D808  D0 2C 00 1C */	stfs f1, 0x1c(r12)
/* 8014080C 0013D80C  D0 2C 00 18 */	stfs f1, 0x18(r12)
/* 80140810 0013D810  D0 2C 00 20 */	stfs f1, 0x20(r12)
/* 80140814 0013D814  90 6C 00 24 */	stw r3, 0x24(r12)
/* 80140818 0013D818  D0 0C 00 28 */	stfs f0, 0x28(r12)
/* 8014081C 0013D81C  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140820 0013D820  7D 60 5A 14 */	add r11, r0, r11
/* 80140824 0013D824  98 6B 00 00 */	stb r3, 0(r11)
/* 80140828 0013D828  B0 6B 00 10 */	sth r3, 0x10(r11)
/* 8014082C 0013D82C  B0 6B 00 12 */	sth r3, 0x12(r11)
/* 80140830 0013D830  D0 2B 00 14 */	stfs f1, 0x14(r11)
/* 80140834 0013D834  D0 2B 00 1C */	stfs f1, 0x1c(r11)
/* 80140838 0013D838  D0 2B 00 18 */	stfs f1, 0x18(r11)
/* 8014083C 0013D83C  D0 2B 00 20 */	stfs f1, 0x20(r11)
/* 80140840 0013D840  90 6B 00 24 */	stw r3, 0x24(r11)
/* 80140844 0013D844  D0 0B 00 28 */	stfs f0, 0x28(r11)
/* 80140848 0013D848  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 8014084C 0013D84C  7D 40 52 14 */	add r10, r0, r10
/* 80140850 0013D850  98 6A 00 00 */	stb r3, 0(r10)
/* 80140854 0013D854  B0 6A 00 10 */	sth r3, 0x10(r10)
/* 80140858 0013D858  B0 6A 00 12 */	sth r3, 0x12(r10)
/* 8014085C 0013D85C  D0 2A 00 14 */	stfs f1, 0x14(r10)
/* 80140860 0013D860  D0 2A 00 1C */	stfs f1, 0x1c(r10)
/* 80140864 0013D864  D0 2A 00 18 */	stfs f1, 0x18(r10)
/* 80140868 0013D868  D0 2A 00 20 */	stfs f1, 0x20(r10)
/* 8014086C 0013D86C  90 6A 00 24 */	stw r3, 0x24(r10)
/* 80140870 0013D870  D0 0A 00 28 */	stfs f0, 0x28(r10)
/* 80140874 0013D874  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140878 0013D878  7D 20 4A 14 */	add r9, r0, r9
/* 8014087C 0013D87C  98 69 00 00 */	stb r3, 0(r9)
/* 80140880 0013D880  B0 69 00 10 */	sth r3, 0x10(r9)
/* 80140884 0013D884  B0 69 00 12 */	sth r3, 0x12(r9)
/* 80140888 0013D888  D0 29 00 14 */	stfs f1, 0x14(r9)
/* 8014088C 0013D88C  D0 29 00 1C */	stfs f1, 0x1c(r9)
/* 80140890 0013D890  D0 29 00 18 */	stfs f1, 0x18(r9)
/* 80140894 0013D894  D0 29 00 20 */	stfs f1, 0x20(r9)
/* 80140898 0013D898  90 69 00 24 */	stw r3, 0x24(r9)
/* 8014089C 0013D89C  D0 09 00 28 */	stfs f0, 0x28(r9)
/* 801408A0 0013D8A0  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 801408A4 0013D8A4  7D 00 42 14 */	add r8, r0, r8
/* 801408A8 0013D8A8  98 68 00 00 */	stb r3, 0(r8)
/* 801408AC 0013D8AC  B0 68 00 10 */	sth r3, 0x10(r8)
/* 801408B0 0013D8B0  B0 68 00 12 */	sth r3, 0x12(r8)
/* 801408B4 0013D8B4  D0 28 00 14 */	stfs f1, 0x14(r8)
/* 801408B8 0013D8B8  D0 28 00 1C */	stfs f1, 0x1c(r8)
/* 801408BC 0013D8BC  D0 28 00 18 */	stfs f1, 0x18(r8)
/* 801408C0 0013D8C0  D0 28 00 20 */	stfs f1, 0x20(r8)
/* 801408C4 0013D8C4  90 68 00 24 */	stw r3, 0x24(r8)
/* 801408C8 0013D8C8  D0 08 00 28 */	stfs f0, 0x28(r8)
/* 801408CC 0013D8CC  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 801408D0 0013D8D0  7C E0 3A 14 */	add r7, r0, r7
/* 801408D4 0013D8D4  98 67 00 00 */	stb r3, 0(r7)
/* 801408D8 0013D8D8  B0 67 00 10 */	sth r3, 0x10(r7)
/* 801408DC 0013D8DC  B0 67 00 12 */	sth r3, 0x12(r7)
/* 801408E0 0013D8E0  D0 27 00 14 */	stfs f1, 0x14(r7)
/* 801408E4 0013D8E4  D0 27 00 1C */	stfs f1, 0x1c(r7)
/* 801408E8 0013D8E8  D0 27 00 18 */	stfs f1, 0x18(r7)
/* 801408EC 0013D8EC  D0 27 00 20 */	stfs f1, 0x20(r7)
/* 801408F0 0013D8F0  90 67 00 24 */	stw r3, 0x24(r7)
/* 801408F4 0013D8F4  D0 07 00 28 */	stfs f0, 0x28(r7)
/* 801408F8 0013D8F8  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 801408FC 0013D8FC  7C C0 32 14 */	add r6, r0, r6
/* 80140900 0013D900  98 66 00 00 */	stb r3, 0(r6)
/* 80140904 0013D904  B0 66 00 10 */	sth r3, 0x10(r6)
/* 80140908 0013D908  B0 66 00 12 */	sth r3, 0x12(r6)
/* 8014090C 0013D90C  D0 26 00 14 */	stfs f1, 0x14(r6)
/* 80140910 0013D910  D0 26 00 1C */	stfs f1, 0x1c(r6)
/* 80140914 0013D914  D0 26 00 18 */	stfs f1, 0x18(r6)
/* 80140918 0013D918  D0 26 00 20 */	stfs f1, 0x20(r6)
/* 8014091C 0013D91C  90 66 00 24 */	stw r3, 0x24(r6)
/* 80140920 0013D920  D0 06 00 28 */	stfs f0, 0x28(r6)
/* 80140924 0013D924  42 00 FE 78 */	bdnz lbl_8014079C
/* 80140928 0013D928  20 05 00 64 */	subfic r0, r5, 0x64
/* 8014092C 0013D92C  C0 22 B9 30 */	lfs f1, lbl_8041CCB0@sda21(r2)
/* 80140930 0013D930  1C 85 00 34 */	mulli r4, r5, 0x34
/* 80140934 0013D934  C0 02 B9 34 */	lfs f0, lbl_8041CCB4@sda21(r2)
/* 80140938 0013D938  7C 09 03 A6 */	mtctr r0
/* 8014093C 0013D93C  2C 05 00 64 */	cmpwi r5, 0x64
/* 80140940 0013D940  40 80 00 38 */	bge lbl_80140978
lbl_80140944:
/* 80140944 0013D944  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140948 0013D948  7C A0 22 14 */	add r5, r0, r4
/* 8014094C 0013D94C  38 84 00 34 */	addi r4, r4, 0x34
/* 80140950 0013D950  98 65 00 00 */	stb r3, 0(r5)
/* 80140954 0013D954  B0 65 00 10 */	sth r3, 0x10(r5)
/* 80140958 0013D958  B0 65 00 12 */	sth r3, 0x12(r5)
/* 8014095C 0013D95C  D0 25 00 14 */	stfs f1, 0x14(r5)
/* 80140960 0013D960  D0 25 00 1C */	stfs f1, 0x1c(r5)
/* 80140964 0013D964  D0 25 00 18 */	stfs f1, 0x18(r5)
/* 80140968 0013D968  D0 25 00 20 */	stfs f1, 0x20(r5)
/* 8014096C 0013D96C  90 65 00 24 */	stw r3, 0x24(r5)
/* 80140970 0013D970  D0 05 00 28 */	stfs f0, 0x28(r5)
/* 80140974 0013D974  42 00 FF D0 */	bdnz lbl_80140944
lbl_80140978:
/* 80140978 0013D978  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8014097C 0013D97C  38 60 00 02 */	li r3, 2
/* 80140980 0013D980  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80140984 0013D984  7C 08 03 A6 */	mtlr r0
/* 80140988 0013D988  38 21 00 10 */	addi r1, r1, 0x10
/* 8014098C 0013D98C  4E 80 00 20 */	blr 

.global twoddisp_main
twoddisp_main:
/* 80140990 0013D990  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80140994 0013D994  7C 08 02 A6 */	mflr r0
/* 80140998 0013D998  38 60 00 00 */	li r3, 0
/* 8014099C 0013D99C  90 01 00 14 */	stw r0, 0x14(r1)
/* 801409A0 0013D9A0  38 00 00 0C */	li r0, 0xc
/* 801409A4 0013D9A4  7C 09 03 A6 */	mtctr r0
lbl_801409A8:
/* 801409A8 0013D9A8  38 63 00 08 */	addi r3, r3, 8
/* 801409AC 0013D9AC  42 00 FF FC */	bdnz lbl_801409A8
/* 801409B0 0013D9B0  20 03 00 64 */	subfic r0, r3, 0x64
/* 801409B4 0013D9B4  7C 09 03 A6 */	mtctr r0
/* 801409B8 0013D9B8  2C 03 00 64 */	cmpwi r3, 0x64
/* 801409BC 0013D9BC  40 80 00 08 */	bge lbl_801409C4
lbl_801409C0:
/* 801409C0 0013D9C0  42 00 00 00 */	bdnz lbl_801409C0
lbl_801409C4:
/* 801409C4 0013D9C4  3C 60 80 14 */	lis r3, twoddisp_disp@ha
/* 801409C8 0013D9C8  C0 22 B9 38 */	lfs f1, lbl_8041CCB8@sda21(r2)
/* 801409CC 0013D9CC  38 A3 09 F4 */	addi r5, r3, twoddisp_disp@l
/* 801409D0 0013D9D0  38 80 00 00 */	li r4, 0
/* 801409D4 0013D9D4  38 60 00 08 */	li r3, 8
/* 801409D8 0013D9D8  38 C0 00 00 */	li r6, 0
/* 801409DC 0013D9DC  4B ED 00 3D */	bl dispEntry
/* 801409E0 0013D9E0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801409E4 0013D9E4  38 60 00 02 */	li r3, 2
/* 801409E8 0013D9E8  7C 08 03 A6 */	mtlr r0
/* 801409EC 0013D9EC  38 21 00 10 */	addi r1, r1, 0x10
/* 801409F0 0013D9F0  4E 80 00 20 */	blr 

.global twoddisp_disp
twoddisp_disp:
/* 801409F4 0013D9F4  94 21 FE C0 */	stwu r1, -0x140(r1)
/* 801409F8 0013D9F8  7C 08 02 A6 */	mflr r0
/* 801409FC 0013D9FC  90 01 01 44 */	stw r0, 0x144(r1)
/* 80140A00 0013DA00  93 E1 01 3C */	stw r31, 0x13c(r1)
/* 80140A04 0013DA04  3B E0 00 00 */	li r31, 0
/* 80140A08 0013DA08  93 C1 01 38 */	stw r30, 0x138(r1)
/* 80140A0C 0013DA0C  3B C0 00 00 */	li r30, 0
/* 80140A10 0013DA10  93 A1 01 34 */	stw r29, 0x134(r1)
lbl_80140A14:
/* 80140A14 0013DA14  80 0D 17 84 */	lwz r0, lbl_804189E4@sda21(r13)
/* 80140A18 0013DA18  7F A0 FA 14 */	add r29, r0, r31
/* 80140A1C 0013DA1C  88 1D 00 00 */	lbz r0, 0(r29)
/* 80140A20 0013DA20  7C 00 07 75 */	extsb. r0, r0
/* 80140A24 0013DA24  41 82 01 2C */	beq lbl_80140B50
/* 80140A28 0013DA28  A0 1D 00 10 */	lhz r0, 0x10(r29)
/* 80140A2C 0013DA2C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 80140A30 0013DA30  41 82 01 20 */	beq lbl_80140B50
/* 80140A34 0013DA34  80 1D 00 24 */	lwz r0, 0x24(r29)
/* 80140A38 0013DA38  54 00 00 01 */	rlwinm. r0, r0, 0, 0, 0
/* 80140A3C 0013DA3C  40 82 00 68 */	bne lbl_80140AA4
/* 80140A40 0013DA40  C0 5D 00 1C */	lfs f2, 0x1c(r29)
/* 80140A44 0013DA44  38 81 00 14 */	addi r4, r1, 0x14
/* 80140A48 0013DA48  C0 1D 00 14 */	lfs f0, 0x14(r29)
/* 80140A4C 0013DA4C  38 60 00 00 */	li r3, 0
/* 80140A50 0013DA50  C0 22 B9 30 */	lfs f1, lbl_8041CCB0@sda21(r2)
/* 80140A54 0013DA54  EC 02 00 2A */	fadds f0, f2, f0
/* 80140A58 0013DA58  80 02 1C C8 */	lwz r0, lbl_80423048@sda21(r2)
/* 80140A5C 0013DA5C  FC 40 08 90 */	fmr f2, f1
/* 80140A60 0013DA60  FC 60 08 90 */	fmr f3, f1
/* 80140A64 0013DA64  D0 01 00 18 */	stfs f0, 0x18(r1)
/* 80140A68 0013DA68  FC 80 08 90 */	fmr f4, f1
/* 80140A6C 0013DA6C  C0 BD 00 20 */	lfs f5, 0x20(r29)
/* 80140A70 0013DA70  C0 1D 00 18 */	lfs f0, 0x18(r29)
/* 80140A74 0013DA74  EC 05 00 2A */	fadds f0, f5, f0
/* 80140A78 0013DA78  D0 21 00 20 */	stfs f1, 0x20(r1)
/* 80140A7C 0013DA7C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80140A80 0013DA80  D0 01 00 1C */	stfs f0, 0x1c(r1)
/* 80140A84 0013DA84  48 17 27 6D */	bl GXSetFog
/* 80140A88 0013DA88  80 1D 00 24 */	lwz r0, 0x24(r29)
/* 80140A8C 0013DA8C  38 61 00 18 */	addi r3, r1, 0x18
/* 80140A90 0013DA90  C0 3D 00 28 */	lfs f1, 0x28(r29)
/* 80140A94 0013DA94  38 80 00 10 */	li r4, 0x10
/* 80140A98 0013DA98  54 05 04 3E */	clrlwi r5, r0, 0x10
/* 80140A9C 0013DA9C  4B ED 9A 99 */	bl iconDispGx
/* 80140AA0 0013DAA0  48 00 00 B0 */	b lbl_80140B50
lbl_80140AA4:
/* 80140AA4 0013DAA4  4B F3 63 65 */	bl FontDrawStart
/* 80140AA8 0013DAA8  C0 3D 00 28 */	lfs f1, 0x28(r29)
/* 80140AAC 0013DAAC  4B F3 5F 69 */	bl FontDrawScale
/* 80140AB0 0013DAB0  C0 22 B9 30 */	lfs f1, lbl_8041CCB0@sda21(r2)
/* 80140AB4 0013DAB4  38 81 00 10 */	addi r4, r1, 0x10
/* 80140AB8 0013DAB8  80 02 1C CC */	lwz r0, lbl_8042304C@sda21(r2)
/* 80140ABC 0013DABC  38 60 00 00 */	li r3, 0
/* 80140AC0 0013DAC0  FC 40 08 90 */	fmr f2, f1
/* 80140AC4 0013DAC4  FC 60 08 90 */	fmr f3, f1
/* 80140AC8 0013DAC8  90 01 00 10 */	stw r0, 0x10(r1)
/* 80140ACC 0013DACC  FC 80 08 90 */	fmr f4, f1
/* 80140AD0 0013DAD0  48 17 27 21 */	bl GXSetFog
/* 80140AD4 0013DAD4  80 9D 00 24 */	lwz r4, 0x24(r29)
/* 80140AD8 0013DAD8  38 61 00 24 */	addi r3, r1, 0x24
/* 80140ADC 0013DADC  4C C6 31 82 */	crclr 6
/* 80140AE0 0013DAE0  48 12 36 29 */	bl sprintf
/* 80140AE4 0013DAE4  80 02 B9 28 */	lwz r0, lbl_8041CCA8@sda21(r2)
/* 80140AE8 0013DAE8  38 61 00 0C */	addi r3, r1, 0xc
/* 80140AEC 0013DAEC  90 01 00 0C */	stw r0, 0xc(r1)
/* 80140AF0 0013DAF0  4B F3 5F AD */	bl FontDrawColor
/* 80140AF4 0013DAF4  C0 7D 00 1C */	lfs f3, 0x1c(r29)
/* 80140AF8 0013DAF8  38 61 00 24 */	addi r3, r1, 0x24
/* 80140AFC 0013DAFC  C0 3D 00 14 */	lfs f1, 0x14(r29)
/* 80140B00 0013DB00  C0 5D 00 20 */	lfs f2, 0x20(r29)
/* 80140B04 0013DB04  C0 1D 00 18 */	lfs f0, 0x18(r29)
/* 80140B08 0013DB08  EC 23 08 2A */	fadds f1, f3, f1
/* 80140B0C 0013DB0C  EC 42 00 2A */	fadds f2, f2, f0
/* 80140B10 0013DB10  4B F3 58 E5 */	bl FontDrawString
/* 80140B14 0013DB14  80 02 B9 2C */	lwz r0, lbl_8041CCAC@sda21(r2)
/* 80140B18 0013DB18  38 61 00 08 */	addi r3, r1, 8
/* 80140B1C 0013DB1C  90 01 00 08 */	stw r0, 8(r1)
/* 80140B20 0013DB20  4B F3 5F 7D */	bl FontDrawColor
/* 80140B24 0013DB24  C0 7D 00 1C */	lfs f3, 0x1c(r29)
/* 80140B28 0013DB28  38 61 00 24 */	addi r3, r1, 0x24
/* 80140B2C 0013DB2C  C0 5D 00 14 */	lfs f2, 0x14(r29)
/* 80140B30 0013DB30  C0 3D 00 20 */	lfs f1, 0x20(r29)
/* 80140B34 0013DB34  C0 1D 00 18 */	lfs f0, 0x18(r29)
/* 80140B38 0013DB38  EC 43 10 2A */	fadds f2, f3, f2
/* 80140B3C 0013DB3C  C0 62 B9 34 */	lfs f3, lbl_8041CCB4@sda21(r2)
/* 80140B40 0013DB40  EC 01 00 2A */	fadds f0, f1, f0
/* 80140B44 0013DB44  EC 23 10 2A */	fadds f1, f3, f2
/* 80140B48 0013DB48  EC 40 18 28 */	fsubs f2, f0, f3
/* 80140B4C 0013DB4C  4B F3 58 A9 */	bl FontDrawString
lbl_80140B50:
/* 80140B50 0013DB50  3B DE 00 01 */	addi r30, r30, 1
/* 80140B54 0013DB54  3B FF 00 34 */	addi r31, r31, 0x34
/* 80140B58 0013DB58  2C 1E 00 64 */	cmpwi r30, 0x64
/* 80140B5C 0013DB5C  41 80 FE B8 */	blt lbl_80140A14
/* 80140B60 0013DB60  80 01 01 44 */	lwz r0, 0x144(r1)
/* 80140B64 0013DB64  83 E1 01 3C */	lwz r31, 0x13c(r1)
/* 80140B68 0013DB68  83 C1 01 38 */	lwz r30, 0x138(r1)
/* 80140B6C 0013DB6C  83 A1 01 34 */	lwz r29, 0x134(r1)
/* 80140B70 0013DB70  7C 08 03 A6 */	mtlr r0
/* 80140B74 0013DB74  38 21 01 40 */	addi r1, r1, 0x140
/* 80140B78 0013DB78  4E 80 00 20 */	blr 
