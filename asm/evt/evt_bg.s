.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global evt_bg_set_scrl_offset
evt_bg_set_scrl_offset:
/* 800F23D8 000EF3D8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800F23DC 000EF3DC  7C 08 02 A6 */	mflr r0
/* 800F23E0 000EF3E0  90 01 00 24 */	stw r0, 0x24(r1)
/* 800F23E4 000EF3E4  DB E1 00 18 */	stfd f31, 0x18(r1)
/* 800F23E8 000EF3E8  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800F23EC 000EF3EC  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800F23F0 000EF3F0  7C 7E 1B 78 */	mr r30, r3
/* 800F23F4 000EF3F4  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800F23F8 000EF3F8  80 9F 00 00 */	lwz r4, 0(r31)
/* 800F23FC 000EF3FC  4B F3 DD B1 */	bl evtGetFloat
/* 800F2400 000EF400  FF E0 08 90 */	fmr f31, f1
/* 800F2404 000EF404  80 9F 00 04 */	lwz r4, 4(r31)
/* 800F2408 000EF408  7F C3 F3 78 */	mr r3, r30
/* 800F240C 000EF40C  4B F3 DD A1 */	bl evtGetFloat
/* 800F2410 000EF410  FC 00 08 90 */	fmr f0, f1
/* 800F2414 000EF414  FC 20 F8 90 */	fmr f1, f31
/* 800F2418 000EF418  FC 40 00 90 */	fmr f2, f0
/* 800F241C 000EF41C  4B F1 7F 0D */	bl bgSetScrlOffset
/* 800F2420 000EF420  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800F2424 000EF424  38 60 00 02 */	li r3, 2
/* 800F2428 000EF428  CB E1 00 18 */	lfd f31, 0x18(r1)
/* 800F242C 000EF42C  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800F2430 000EF430  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800F2434 000EF434  7C 08 03 A6 */	mtlr r0
/* 800F2438 000EF438  38 21 00 20 */	addi r1, r1, 0x20
/* 800F243C 000EF43C  4E 80 00 20 */	blr 

.global evt_bg_auto_scroll_onoff
evt_bg_auto_scroll_onoff:
/* 800F2440 000EF440  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800F2444 000EF444  7C 08 02 A6 */	mflr r0
/* 800F2448 000EF448  90 01 00 14 */	stw r0, 0x14(r1)
/* 800F244C 000EF44C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800F2450 000EF450  80 84 00 00 */	lwz r4, 0(r4)
/* 800F2454 000EF454  4B F3 E7 79 */	bl evtGetValue
/* 800F2458 000EF458  2C 03 00 00 */	cmpwi r3, 0
/* 800F245C 000EF45C  41 82 00 0C */	beq .L_800F2468
/* 800F2460 000EF460  4B F1 7E 9D */	bl bgAutoScrollOff
/* 800F2464 000EF464  48 00 00 08 */	b .L_800F246C
.L_800F2468:
/* 800F2468 000EF468  4B F1 7E 69 */	bl bgAutoScrollOn
.L_800F246C:
/* 800F246C 000EF46C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800F2470 000EF470  38 60 00 02 */	li r3, 2
/* 800F2474 000EF474  7C 08 03 A6 */	mtlr r0
/* 800F2478 000EF478  38 21 00 10 */	addi r1, r1, 0x10
/* 800F247C 000EF47C  4E 80 00 20 */	blr 

.global evt_bg_set_color
evt_bg_set_color:
/* 800F2480 000EF480  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800F2484 000EF484  7C 08 02 A6 */	mflr r0
/* 800F2488 000EF488  90 01 00 24 */	stw r0, 0x24(r1)
/* 800F248C 000EF48C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800F2490 000EF490  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800F2494 000EF494  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800F2498 000EF498  93 81 00 10 */	stw r28, 0x10(r1)
/* 800F249C 000EF49C  7C 7C 1B 78 */	mr r28, r3
/* 800F24A0 000EF4A0  83 E3 00 18 */	lwz r31, 0x18(r3)
/* 800F24A4 000EF4A4  80 9F 00 00 */	lwz r4, 0(r31)
/* 800F24A8 000EF4A8  4B F3 E7 25 */	bl evtGetValue
/* 800F24AC 000EF4AC  80 9F 00 04 */	lwz r4, 4(r31)
/* 800F24B0 000EF4B0  7C 7D 1B 78 */	mr r29, r3
/* 800F24B4 000EF4B4  7F 83 E3 78 */	mr r3, r28
/* 800F24B8 000EF4B8  4B F3 E7 15 */	bl evtGetValue
/* 800F24BC 000EF4BC  80 9F 00 08 */	lwz r4, 8(r31)
/* 800F24C0 000EF4C0  7C 7E 1B 78 */	mr r30, r3
/* 800F24C4 000EF4C4  7F 83 E3 78 */	mr r3, r28
/* 800F24C8 000EF4C8  4B F3 E7 05 */	bl evtGetValue
/* 800F24CC 000EF4CC  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 800F24D0 000EF4D0  7C 7F 1B 78 */	mr r31, r3
/* 800F24D4 000EF4D4  7F 83 E3 78 */	mr r3, r28
/* 800F24D8 000EF4D8  4B F3 E6 F5 */	bl evtGetValue
/* 800F24DC 000EF4DC  80 02 1C 68 */	lwz r0, lbl_80422FE8@sda21(r2)
/* 800F24E0 000EF4E0  90 01 00 08 */	stw r0, 8(r1)
/* 800F24E4 000EF4E4  98 61 00 0B */	stb r3, 0xb(r1)
/* 800F24E8 000EF4E8  38 61 00 0C */	addi r3, r1, 0xc
/* 800F24EC 000EF4EC  9B A1 00 08 */	stb r29, 8(r1)
/* 800F24F0 000EF4F0  9B C1 00 09 */	stb r30, 9(r1)
/* 800F24F4 000EF4F4  9B E1 00 0A */	stb r31, 0xa(r1)
/* 800F24F8 000EF4F8  80 01 00 08 */	lwz r0, 8(r1)
/* 800F24FC 000EF4FC  90 01 00 0C */	stw r0, 0xc(r1)
/* 800F2500 000EF500  4B F1 7E A9 */	bl bgSetColor
/* 800F2504 000EF504  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800F2508 000EF508  38 60 00 02 */	li r3, 2
/* 800F250C 000EF50C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800F2510 000EF510  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800F2514 000EF514  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800F2518 000EF518  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800F251C 000EF51C  7C 08 03 A6 */	mtlr r0
/* 800F2520 000EF520  38 21 00 20 */	addi r1, r1, 0x20
/* 800F2524 000EF524  4E 80 00 20 */	blr 

.global evt_bg_disp_onoff
evt_bg_disp_onoff:
/* 800F2528 000EF528  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800F252C 000EF52C  7C 08 02 A6 */	mflr r0
/* 800F2530 000EF530  90 01 00 14 */	stw r0, 0x14(r1)
/* 800F2534 000EF534  80 83 00 18 */	lwz r4, 0x18(r3)
/* 800F2538 000EF538  80 84 00 00 */	lwz r4, 0(r4)
/* 800F253C 000EF53C  4B F3 E6 91 */	bl evtGetValue
/* 800F2540 000EF540  2C 03 00 00 */	cmpwi r3, 0
/* 800F2544 000EF544  41 82 00 0C */	beq .L_800F2550
/* 800F2548 000EF548  4B F1 7E 35 */	bl bgDispOn
/* 800F254C 000EF54C  48 00 00 08 */	b .L_800F2554
.L_800F2550:
/* 800F2550 000EF550  4B F1 7E 01 */	bl bgDispOff
.L_800F2554:
/* 800F2554 000EF554  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800F2558 000EF558  38 60 00 02 */	li r3, 2
/* 800F255C 000EF55C  7C 08 03 A6 */	mtlr r0
/* 800F2560 000EF560  38 21 00 10 */	addi r1, r1, 0x10
/* 800F2564 000EF564  4E 80 00 20 */	blr 
