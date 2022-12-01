.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global BattleRunWaitEvent
BattleRunWaitEvent:
/* 801241FC 001211FC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80124200 00121200  7C 08 02 A6 */	mflr r0
/* 80124204 00121204  90 01 00 14 */	stw r0, 0x14(r1)
/* 80124208 00121208  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8012420C 0012120C  7C 7F 1B 78 */	mr r31, r3
/* 80124210 00121210  80 63 02 8C */	lwz r3, 0x28c(r3)
/* 80124214 00121214  2C 03 00 00 */	cmpwi r3, 0
/* 80124218 00121218  41 82 00 10 */	beq .L_80124228
/* 8012421C 0012121C  4B F1 1D AD */	bl evtDeleteID
/* 80124220 00121220  38 00 00 00 */	li r0, 0
/* 80124224 00121224  90 1F 02 8C */	stw r0, 0x28c(r31)
.L_80124228:
/* 80124228 00121228  80 7F 02 88 */	lwz r3, 0x288(r31)
/* 8012422C 0012122C  28 03 00 00 */	cmplwi r3, 0
/* 80124230 00121230  41 82 00 20 */	beq .L_80124250
/* 80124234 00121234  38 80 00 0A */	li r4, 0xa
/* 80124238 00121238  38 A0 00 00 */	li r5, 0
/* 8012423C 0012123C  4B F1 2B D5 */	bl evtEntry
/* 80124240 00121240  80 1F 00 00 */	lwz r0, 0(r31)
/* 80124244 00121244  90 03 01 60 */	stw r0, 0x160(r3)
/* 80124248 00121248  80 03 01 5C */	lwz r0, 0x15c(r3)
/* 8012424C 0012124C  90 1F 02 8C */	stw r0, 0x28c(r31)
.L_80124250:
/* 80124250 00121250  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80124254 00121254  38 60 00 00 */	li r3, 0
/* 80124258 00121258  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8012425C 0012125C  7C 08 03 A6 */	mtlr r0
/* 80124260 00121260  38 21 00 10 */	addi r1, r1, 0x10
/* 80124264 00121264  4E 80 00 20 */	blr 

.global BattlePhaseEventStartDeclare
BattlePhaseEventStartDeclare:
/* 80124268 00121268  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8012426C 0012126C  7C 08 02 A6 */	mflr r0
/* 80124270 00121270  90 01 00 14 */	stw r0, 0x14(r1)
/* 80124274 00121274  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80124278 00121278  7C 7F 1B 78 */	mr r31, r3
/* 8012427C 0012127C  80 63 02 B0 */	lwz r3, 0x2b0(r3)
/* 80124280 00121280  2C 03 00 00 */	cmpwi r3, 0
/* 80124284 00121284  41 82 00 10 */	beq .L_80124294
/* 80124288 00121288  4B F1 1D 41 */	bl evtDeleteID
/* 8012428C 0012128C  38 00 00 00 */	li r0, 0
/* 80124290 00121290  90 1F 02 B0 */	stw r0, 0x2b0(r31)
.L_80124294:
/* 80124294 00121294  80 7F 02 8C */	lwz r3, 0x28c(r31)
/* 80124298 00121298  2C 03 00 00 */	cmpwi r3, 0
/* 8012429C 0012129C  41 82 00 10 */	beq .L_801242AC
/* 801242A0 001212A0  4B F1 1D 29 */	bl evtDeleteID
/* 801242A4 001212A4  38 00 00 00 */	li r0, 0
/* 801242A8 001212A8  90 1F 02 8C */	stw r0, 0x28c(r31)
.L_801242AC:
/* 801242AC 001212AC  80 7F 02 A4 */	lwz r3, 0x2a4(r31)
/* 801242B0 001212B0  2C 03 00 00 */	cmpwi r3, 0
/* 801242B4 001212B4  41 82 00 10 */	beq .L_801242C4
/* 801242B8 001212B8  4B F1 1D 11 */	bl evtDeleteID
/* 801242BC 001212BC  38 00 00 00 */	li r0, 0
/* 801242C0 001212C0  90 1F 02 A4 */	stw r0, 0x2a4(r31)
.L_801242C4:
/* 801242C4 001212C4  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801242C8 001212C8  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801242CC 001212CC  7C 08 03 A6 */	mtlr r0
/* 801242D0 001212D0  38 21 00 10 */	addi r1, r1, 0x10
/* 801242D4 001212D4  4E 80 00 20 */	blr 

.global BattleRunPhaseEvent
BattleRunPhaseEvent:
/* 801242D8 001212D8  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801242DC 001212DC  7C 08 02 A6 */	mflr r0
/* 801242E0 001212E0  2C 04 00 00 */	cmpwi r4, 0
/* 801242E4 001212E4  38 80 00 00 */	li r4, 0
/* 801242E8 001212E8  90 01 00 14 */	stw r0, 0x14(r1)
/* 801242EC 001212EC  BF C1 00 08 */	stmw r30, 8(r1)
/* 801242F0 001212F0  7C 7E 1B 78 */	mr r30, r3
/* 801242F4 001212F4  3B E0 00 00 */	li r31, 0
/* 801242F8 001212F8  41 82 00 24 */	beq .L_8012431C
/* 801242FC 001212FC  80 7E 02 90 */	lwz r3, 0x290(r30)
/* 80124300 00121300  28 03 00 00 */	cmplwi r3, 0
/* 80124304 00121304  41 82 00 34 */	beq .L_80124338
/* 80124308 00121308  38 80 00 0A */	li r4, 0xa
/* 8012430C 0012130C  38 A0 00 20 */	li r5, 0x20
/* 80124310 00121310  4B F1 2B 01 */	bl evtEntry
/* 80124314 00121314  7C 64 1B 78 */	mr r4, r3
/* 80124318 00121318  48 00 00 20 */	b .L_80124338
.L_8012431C:
/* 8012431C 0012131C  80 7E 02 94 */	lwz r3, 0x294(r30)
/* 80124320 00121320  28 03 00 00 */	cmplwi r3, 0
/* 80124324 00121324  41 82 00 14 */	beq .L_80124338
/* 80124328 00121328  38 80 00 0A */	li r4, 0xa
/* 8012432C 0012132C  38 A0 00 20 */	li r5, 0x20
/* 80124330 00121330  4B F1 2A E1 */	bl evtEntry
/* 80124334 00121334  7C 64 1B 78 */	mr r4, r3
.L_80124338:
/* 80124338 00121338  28 04 00 00 */	cmplwi r4, 0
/* 8012433C 0012133C  41 82 00 14 */	beq .L_80124350
/* 80124340 00121340  80 1E 00 00 */	lwz r0, 0(r30)
/* 80124344 00121344  90 04 01 60 */	stw r0, 0x160(r4)
/* 80124348 00121348  83 E4 01 5C */	lwz r31, 0x15c(r4)
/* 8012434C 0012134C  93 FE 02 98 */	stw r31, 0x298(r30)
.L_80124350:
/* 80124350 00121350  7F E3 FB 78 */	mr r3, r31
/* 80124354 00121354  BB C1 00 08 */	lmw r30, 8(r1)
/* 80124358 00121358  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8012435C 0012135C  7C 08 03 A6 */	mtlr r0
/* 80124360 00121360  38 21 00 10 */	addi r1, r1, 0x10
/* 80124364 00121364  4E 80 00 20 */	blr 

.global BattleRunHitEvent
BattleRunHitEvent:
/* 80124368 00121368  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8012436C 0012136C  7C 08 02 A6 */	mflr r0
/* 80124370 00121370  90 01 00 24 */	stw r0, 0x24(r1)
/* 80124374 00121374  54 80 06 3E */	clrlwi r0, r4, 0x18
/* 80124378 00121378  28 00 00 28 */	cmplwi r0, 0x28
/* 8012437C 0012137C  BF 81 00 10 */	stmw r28, 0x10(r1)
/* 80124380 00121380  7C 9D 23 78 */	mr r29, r4
/* 80124384 00121384  7C 7C 1B 78 */	mr r28, r3
/* 80124388 00121388  3B E0 00 00 */	li r31, 0
/* 8012438C 0012138C  3B C0 00 01 */	li r30, 1
/* 80124390 00121390  40 82 00 18 */	bne .L_801243A8
/* 80124394 00121394  38 80 00 2E */	li r4, 0x2e
/* 80124398 00121398  4B FF DA 81 */	bl BtlUnit_CheckData
/* 8012439C 0012139C  2C 03 00 00 */	cmpwi r3, 0
/* 801243A0 001213A0  40 82 00 08 */	bne .L_801243A8
/* 801243A4 001213A4  3B C0 00 00 */	li r30, 0
.L_801243A8:
/* 801243A8 001213A8  2C 1E 00 00 */	cmpwi r30, 0
/* 801243AC 001213AC  40 82 00 0C */	bne .L_801243B8
/* 801243B0 001213B0  38 60 00 00 */	li r3, 0
/* 801243B4 001213B4  48 00 00 24 */	b .L_801243D8
.L_801243B8:
/* 801243B8 001213B8  80 BC 02 AC */	lwz r5, 0x2ac(r28)
/* 801243BC 001213BC  28 05 00 00 */	cmplwi r5, 0
/* 801243C0 001213C0  41 82 00 14 */	beq .L_801243D4
/* 801243C4 001213C4  7F 83 E3 78 */	mr r3, r28
/* 801243C8 001213C8  7F A4 EB 78 */	mr r4, r29
/* 801243CC 001213CC  48 00 00 21 */	bl BattleRunHitEventDirect
/* 801243D0 001213D0  7C 7F 1B 78 */	mr r31, r3
.L_801243D4:
/* 801243D4 001213D4  7F E3 FB 78 */	mr r3, r31
.L_801243D8:
/* 801243D8 001213D8  BB 81 00 10 */	lmw r28, 0x10(r1)
/* 801243DC 001213DC  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801243E0 001213E0  7C 08 03 A6 */	mtlr r0
/* 801243E4 001213E4  38 21 00 20 */	addi r1, r1, 0x20
/* 801243E8 001213E8  4E 80 00 20 */	blr 

.global BattleRunHitEventDirect
BattleRunHitEventDirect:
/* 801243EC 001213EC  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801243F0 001213F0  7C 08 02 A6 */	mflr r0
/* 801243F4 001213F4  90 01 00 24 */	stw r0, 0x24(r1)
/* 801243F8 001213F8  BF 81 00 10 */	stmw r28, 0x10(r1)
/* 801243FC 001213FC  7C 7C 1B 78 */	mr r28, r3
/* 80124400 00121400  7C 9D 23 78 */	mr r29, r4
/* 80124404 00121404  7C BE 2B 78 */	mr r30, r5
/* 80124408 00121408  3B E0 00 00 */	li r31, 0
/* 8012440C 0012140C  80 63 02 B0 */	lwz r3, 0x2b0(r3)
/* 80124410 00121410  2C 03 00 00 */	cmpwi r3, 0
/* 80124414 00121414  41 82 00 10 */	beq .L_80124424
/* 80124418 00121418  4B F1 1B B1 */	bl evtDeleteID
/* 8012441C 0012141C  38 00 00 00 */	li r0, 0
/* 80124420 00121420  90 1C 02 B0 */	stw r0, 0x2b0(r28)
.L_80124424:
/* 80124424 00121424  80 7C 02 8C */	lwz r3, 0x28c(r28)
/* 80124428 00121428  2C 03 00 00 */	cmpwi r3, 0
/* 8012442C 0012142C  41 82 00 10 */	beq .L_8012443C
/* 80124430 00121430  4B F1 1B 99 */	bl evtDeleteID
/* 80124434 00121434  38 00 00 00 */	li r0, 0
/* 80124438 00121438  90 1C 02 8C */	stw r0, 0x28c(r28)
.L_8012443C:
/* 8012443C 0012143C  80 7C 02 98 */	lwz r3, 0x298(r28)
/* 80124440 00121440  2C 03 00 00 */	cmpwi r3, 0
/* 80124444 00121444  41 82 00 10 */	beq .L_80124454
/* 80124448 00121448  4B F1 1B 81 */	bl evtDeleteID
/* 8012444C 0012144C  38 00 00 00 */	li r0, 0
/* 80124450 00121450  90 1C 02 98 */	stw r0, 0x298(r28)
.L_80124454:
/* 80124454 00121454  80 7C 02 A4 */	lwz r3, 0x2a4(r28)
/* 80124458 00121458  2C 03 00 00 */	cmpwi r3, 0
/* 8012445C 0012145C  41 82 00 10 */	beq .L_8012446C
/* 80124460 00121460  4B F1 1B 69 */	bl evtDeleteID
/* 80124464 00121464  38 00 00 00 */	li r0, 0
/* 80124468 00121468  90 1C 02 A4 */	stw r0, 0x2a4(r28)
.L_8012446C:
/* 8012446C 0012146C  28 1E 00 00 */	cmplwi r30, 0
/* 80124470 00121470  41 82 00 28 */	beq .L_80124498
/* 80124474 00121474  7F C3 F3 78 */	mr r3, r30
/* 80124478 00121478  38 80 00 0A */	li r4, 0xa
/* 8012447C 0012147C  38 A0 00 20 */	li r5, 0x20
/* 80124480 00121480  4B F1 29 91 */	bl evtEntry
/* 80124484 00121484  80 1C 00 00 */	lwz r0, 0(r28)
/* 80124488 00121488  90 03 01 60 */	stw r0, 0x160(r3)
/* 8012448C 0012148C  93 BC 02 74 */	stw r29, 0x274(r28)
/* 80124490 00121490  83 E3 01 5C */	lwz r31, 0x15c(r3)
/* 80124494 00121494  93 FC 02 B0 */	stw r31, 0x2b0(r28)
.L_80124498:
/* 80124498 00121498  7F E3 FB 78 */	mr r3, r31
/* 8012449C 0012149C  BB 81 00 10 */	lmw r28, 0x10(r1)
/* 801244A0 001214A0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801244A4 001214A4  7C 08 03 A6 */	mtlr r0
/* 801244A8 001214A8  38 21 00 20 */	addi r1, r1, 0x20
/* 801244AC 001214AC  4E 80 00 20 */	blr 

.global BattleCheckEndUnitInitEvent
BattleCheckEndUnitInitEvent:
/* 801244B0 001214B0  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801244B4 001214B4  7C 08 02 A6 */	mflr r0
/* 801244B8 001214B8  90 01 00 24 */	stw r0, 0x24(r1)
/* 801244BC 001214BC  BF 61 00 0C */	stmw r27, 0xc(r1)
/* 801244C0 001214C0  7C 7B 1B 78 */	mr r27, r3
/* 801244C4 001214C4  3B A0 00 01 */	li r29, 1
/* 801244C8 001214C8  3B 80 00 00 */	li r28, 0
/* 801244CC 001214CC  3B E0 00 00 */	li r31, 0
.L_801244D0:
/* 801244D0 001214D0  7F 63 DB 78 */	mr r3, r27
/* 801244D4 001214D4  7F 84 E3 78 */	mr r4, r28
/* 801244D8 001214D8  4B FC F4 A1 */	bl BattleGetUnitPtr
/* 801244DC 001214DC  7C 7E 1B 79 */	or. r30, r3, r3
/* 801244E0 001214E0  41 82 00 28 */	beq .L_80124508
/* 801244E4 001214E4  80 7E 02 84 */	lwz r3, 0x284(r30)
/* 801244E8 001214E8  2C 03 00 00 */	cmpwi r3, 0
/* 801244EC 001214EC  41 82 00 1C */	beq .L_80124508
/* 801244F0 001214F0  4B F1 1A 79 */	bl evtCheckID
/* 801244F4 001214F4  2C 03 00 00 */	cmpwi r3, 0
/* 801244F8 001214F8  41 82 00 0C */	beq .L_80124504
/* 801244FC 001214FC  3B A0 00 00 */	li r29, 0
/* 80124500 00121500  48 00 00 08 */	b .L_80124508
.L_80124504:
/* 80124504 00121504  93 FE 02 84 */	stw r31, 0x284(r30)
.L_80124508:
/* 80124508 00121508  3B 9C 00 01 */	addi r28, r28, 1
/* 8012450C 0012150C  2C 1C 00 40 */	cmpwi r28, 0x40
/* 80124510 00121510  41 80 FF C0 */	blt .L_801244D0
/* 80124514 00121514  7F A3 EB 78 */	mr r3, r29
/* 80124518 00121518  BB 61 00 0C */	lmw r27, 0xc(r1)
/* 8012451C 0012151C  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80124520 00121520  7C 08 03 A6 */	mtlr r0
/* 80124524 00121524  38 21 00 20 */	addi r1, r1, 0x20
/* 80124528 00121528  4E 80 00 20 */	blr 
