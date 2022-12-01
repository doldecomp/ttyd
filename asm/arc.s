.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global ARCClose
ARCClose:
/* 80077120 00074120  38 60 00 01 */	li r3, 1
/* 80077124 00074124  4E 80 00 20 */	blr 

.global ARCGetLength
ARCGetLength:
/* 80077128 00074128  80 63 00 08 */	lwz r3, 8(r3)
/* 8007712C 0007412C  4E 80 00 20 */	blr 

.global ARCGetStartAddrInMem
ARCGetStartAddrInMem:
/* 80077130 00074130  80 83 00 00 */	lwz r4, 0(r3)
/* 80077134 00074134  80 03 00 04 */	lwz r0, 4(r3)
/* 80077138 00074138  80 64 00 00 */	lwz r3, 0(r4)
/* 8007713C 0007413C  7C 63 02 14 */	add r3, r3, r0
/* 80077140 00074140  4E 80 00 20 */	blr 

.global ARCGetCurrentDir
ARCGetCurrentDir:
/* 80077144 00074144  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80077148 00074148  7C 08 02 A6 */	mflr r0
/* 8007714C 0007414C  7C A6 2B 78 */	mr r6, r5
/* 80077150 00074150  90 01 00 14 */	stw r0, 0x14(r1)
/* 80077154 00074154  7C 80 23 78 */	mr r0, r4
/* 80077158 00074158  7C 05 03 78 */	mr r5, r0
/* 8007715C 0007415C  80 83 00 18 */	lwz r4, 0x18(r3)
/* 80077160 00074160  48 00 00 15 */	bl ARCConvertEntrynumToPath
/* 80077164 00074164  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80077168 00074168  7C 08 03 A6 */	mtlr r0
/* 8007716C 0007416C  38 21 00 10 */	addi r1, r1, 0x10
/* 80077170 00074170  4E 80 00 20 */	blr 

.global ARCConvertEntrynumToPath
ARCConvertEntrynumToPath:
/* 80077174 00074174  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80077178 00074178  7C 08 02 A6 */	mflr r0
/* 8007717C 0007417C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80077180 00074180  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80077184 00074184  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80077188 00074188  7C DE 33 78 */	mr r30, r6
/* 8007718C 0007418C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80077190 00074190  7C BD 2B 78 */	mr r29, r5
/* 80077194 00074194  93 81 00 10 */	stw r28, 0x10(r1)
/* 80077198 00074198  7C 9C 23 78 */	mr r28, r4
/* 8007719C 0007419C  83 E3 00 04 */	lwz r31, 4(r3)
/* 800771A0 000741A0  48 00 00 89 */	bl entryToPath
/* 800771A4 000741A4  7C 64 1B 78 */	mr r4, r3
/* 800771A8 000741A8  7C 04 F0 40 */	cmplw r4, r30
/* 800771AC 000741AC  40 82 00 18 */	bne lbl_800771C4
/* 800771B0 000741B0  7C 7D F2 14 */	add r3, r29, r30
/* 800771B4 000741B4  38 00 00 00 */	li r0, 0
/* 800771B8 000741B8  98 03 FF FF */	stb r0, -1(r3)
/* 800771BC 000741BC  38 60 00 00 */	li r3, 0
/* 800771C0 000741C0  48 00 00 48 */	b lbl_80077208
lbl_800771C4:
/* 800771C4 000741C4  1C 1C 00 0C */	mulli r0, r28, 0xc
/* 800771C8 000741C8  7C 1F 00 2E */	lwzx r0, r31, r0
/* 800771CC 000741CC  54 00 00 0F */	rlwinm. r0, r0, 0, 0, 7
/* 800771D0 000741D0  41 82 00 2C */	beq lbl_800771FC
/* 800771D4 000741D4  38 1E FF FF */	addi r0, r30, -1
/* 800771D8 000741D8  7C 04 00 40 */	cmplw r4, r0
/* 800771DC 000741DC  40 82 00 14 */	bne lbl_800771F0
/* 800771E0 000741E0  38 00 00 00 */	li r0, 0
/* 800771E4 000741E4  38 60 00 00 */	li r3, 0
/* 800771E8 000741E8  7C 1D 21 AE */	stbx r0, r29, r4
/* 800771EC 000741EC  48 00 00 1C */	b lbl_80077208
lbl_800771F0:
/* 800771F0 000741F0  38 00 00 2F */	li r0, 0x2f
/* 800771F4 000741F4  7C 1D 21 AE */	stbx r0, r29, r4
/* 800771F8 000741F8  38 84 00 01 */	addi r4, r4, 1
lbl_800771FC:
/* 800771FC 000741FC  38 00 00 00 */	li r0, 0
/* 80077200 00074200  38 60 00 01 */	li r3, 1
/* 80077204 00074204  7C 1D 21 AE */	stbx r0, r29, r4
lbl_80077208:
/* 80077208 00074208  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8007720C 0007420C  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80077210 00074210  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80077214 00074214  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80077218 00074218  83 81 00 10 */	lwz r28, 0x10(r1)
/* 8007721C 0007421C  7C 08 03 A6 */	mtlr r0
/* 80077220 00074220  38 21 00 20 */	addi r1, r1, 0x20
/* 80077224 00074224  4E 80 00 20 */	blr 

.global entryToPath
entryToPath:
/* 80077228 00074228  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8007722C 0007422C  7C 08 02 A6 */	mflr r0
/* 80077230 00074230  28 04 00 00 */	cmplwi r4, 0
/* 80077234 00074234  90 01 00 34 */	stw r0, 0x34(r1)
/* 80077238 00074238  BF 21 00 14 */	stmw r25, 0x14(r1)
/* 8007723C 0007423C  7C BB 2B 78 */	mr r27, r5
/* 80077240 00074240  7C DC 33 78 */	mr r28, r6
/* 80077244 00074244  80 E3 00 04 */	lwz r7, 4(r3)
/* 80077248 00074248  40 82 00 0C */	bne lbl_80077254
/* 8007724C 0007424C  38 60 00 00 */	li r3, 0
/* 80077250 00074250  48 00 01 E4 */	b lbl_80077434
lbl_80077254:
/* 80077254 00074254  1C 04 00 0C */	mulli r0, r4, 0xc
/* 80077258 00074258  81 03 00 10 */	lwz r8, 0x10(r3)
/* 8007725C 0007425C  7C 87 02 14 */	add r4, r7, r0
/* 80077260 00074260  7C 07 00 2E */	lwzx r0, r7, r0
/* 80077264 00074264  80 84 00 04 */	lwz r4, 4(r4)
/* 80077268 00074268  54 00 02 3E */	clrlwi r0, r0, 8
/* 8007726C 0007426C  28 04 00 00 */	cmplwi r4, 0
/* 80077270 00074270  7F A8 02 14 */	add r29, r8, r0
/* 80077274 00074274  40 82 00 0C */	bne lbl_80077280
/* 80077278 00074278  3B 40 00 00 */	li r26, 0
/* 8007727C 0007427C  48 00 01 58 */	b lbl_800773D4
lbl_80077280:
/* 80077280 00074280  1C 04 00 0C */	mulli r0, r4, 0xc
/* 80077284 00074284  7C 87 02 14 */	add r4, r7, r0
/* 80077288 00074288  7C 07 00 2E */	lwzx r0, r7, r0
/* 8007728C 0007428C  80 84 00 04 */	lwz r4, 4(r4)
/* 80077290 00074290  54 00 02 3E */	clrlwi r0, r0, 8
/* 80077294 00074294  28 04 00 00 */	cmplwi r4, 0
/* 80077298 00074298  7F E8 02 14 */	add r31, r8, r0
/* 8007729C 0007429C  40 82 00 0C */	bne lbl_800772A8
/* 800772A0 000742A0  3B 40 00 00 */	li r26, 0
/* 800772A4 000742A4  48 00 00 D4 */	b lbl_80077378
lbl_800772A8:
/* 800772A8 000742A8  1C 04 00 0C */	mulli r0, r4, 0xc
/* 800772AC 000742AC  7C 87 02 14 */	add r4, r7, r0
/* 800772B0 000742B0  7C 07 00 2E */	lwzx r0, r7, r0
/* 800772B4 000742B4  80 84 00 04 */	lwz r4, 4(r4)
/* 800772B8 000742B8  54 00 02 3E */	clrlwi r0, r0, 8
/* 800772BC 000742BC  28 04 00 00 */	cmplwi r4, 0
/* 800772C0 000742C0  7F C8 02 14 */	add r30, r8, r0
/* 800772C4 000742C4  40 82 00 0C */	bne lbl_800772D0
/* 800772C8 000742C8  3B 40 00 00 */	li r26, 0
/* 800772CC 000742CC  48 00 00 50 */	b lbl_8007731C
lbl_800772D0:
/* 800772D0 000742D0  1C 84 00 0C */	mulli r4, r4, 0xc
/* 800772D4 000742D4  7C 07 20 2E */	lwzx r0, r7, r4
/* 800772D8 000742D8  7C 87 22 14 */	add r4, r7, r4
/* 800772DC 000742DC  80 84 00 04 */	lwz r4, 4(r4)
/* 800772E0 000742E0  54 00 02 3E */	clrlwi r0, r0, 8
/* 800772E4 000742E4  7F 28 02 14 */	add r25, r8, r0
/* 800772E8 000742E8  4B FF FF 41 */	bl entryToPath
/* 800772EC 000742EC  7C 7A 1B 78 */	mr r26, r3
/* 800772F0 000742F0  7C 1A E0 40 */	cmplw r26, r28
/* 800772F4 000742F4  40 82 00 08 */	bne lbl_800772FC
/* 800772F8 000742F8  48 00 00 24 */	b lbl_8007731C
lbl_800772FC:
/* 800772FC 000742FC  38 00 00 2F */	li r0, 0x2f
/* 80077300 00074300  7F 24 CB 78 */	mr r4, r25
/* 80077304 00074304  7C 1B D1 AE */	stbx r0, r27, r26
/* 80077308 00074308  3B 5A 00 01 */	addi r26, r26, 1
/* 8007730C 0007430C  7C 7B D2 14 */	add r3, r27, r26
/* 80077310 00074310  7C BA E0 50 */	subf r5, r26, r28
/* 80077314 00074314  48 00 01 35 */	bl myStrncpy
/* 80077318 00074318  7F 5A 1A 14 */	add r26, r26, r3
lbl_8007731C:
/* 8007731C 0007431C  7C 1A E0 40 */	cmplw r26, r28
/* 80077320 00074320  40 82 00 08 */	bne lbl_80077328
/* 80077324 00074324  48 00 00 54 */	b lbl_80077378
lbl_80077328:
/* 80077328 00074328  38 7A 00 01 */	addi r3, r26, 1
/* 8007732C 0007432C  38 00 00 2F */	li r0, 0x2f
/* 80077330 00074330  7C C3 E0 50 */	subf r6, r3, r28
/* 80077334 00074334  7C 1B D1 AE */	stbx r0, r27, r26
/* 80077338 00074338  7C BB 1A 14 */	add r5, r27, r3
/* 8007733C 0007433C  7C C4 33 78 */	mr r4, r6
/* 80077340 00074340  48 00 00 18 */	b lbl_80077358
lbl_80077344:
/* 80077344 00074344  88 1E 00 00 */	lbz r0, 0(r30)
/* 80077348 00074348  38 84 FF FF */	addi r4, r4, -1
/* 8007734C 0007434C  3B DE 00 01 */	addi r30, r30, 1
/* 80077350 00074350  98 05 00 00 */	stb r0, 0(r5)
/* 80077354 00074354  38 A5 00 01 */	addi r5, r5, 1
lbl_80077358:
/* 80077358 00074358  28 04 00 00 */	cmplwi r4, 0
/* 8007735C 0007435C  41 82 00 10 */	beq lbl_8007736C
/* 80077360 00074360  88 1E 00 00 */	lbz r0, 0(r30)
/* 80077364 00074364  7C 00 07 75 */	extsb. r0, r0
/* 80077368 00074368  40 82 FF DC */	bne lbl_80077344
lbl_8007736C:
/* 8007736C 0007436C  7C 04 30 50 */	subf r0, r4, r6
/* 80077370 00074370  7C 63 02 14 */	add r3, r3, r0
/* 80077374 00074374  7C 7A 1B 78 */	mr r26, r3
lbl_80077378:
/* 80077378 00074378  7C 1A E0 40 */	cmplw r26, r28
/* 8007737C 0007437C  40 82 00 08 */	bne lbl_80077384
/* 80077380 00074380  48 00 00 54 */	b lbl_800773D4
lbl_80077384:
/* 80077384 00074384  38 7A 00 01 */	addi r3, r26, 1
/* 80077388 00074388  38 00 00 2F */	li r0, 0x2f
/* 8007738C 0007438C  7C C3 E0 50 */	subf r6, r3, r28
/* 80077390 00074390  7C 1B D1 AE */	stbx r0, r27, r26
/* 80077394 00074394  7C BB 1A 14 */	add r5, r27, r3
/* 80077398 00074398  7C C4 33 78 */	mr r4, r6
/* 8007739C 0007439C  48 00 00 18 */	b lbl_800773B4
lbl_800773A0:
/* 800773A0 000743A0  88 1F 00 00 */	lbz r0, 0(r31)
/* 800773A4 000743A4  38 84 FF FF */	addi r4, r4, -1
/* 800773A8 000743A8  3B FF 00 01 */	addi r31, r31, 1
/* 800773AC 000743AC  98 05 00 00 */	stb r0, 0(r5)
/* 800773B0 000743B0  38 A5 00 01 */	addi r5, r5, 1
lbl_800773B4:
/* 800773B4 000743B4  28 04 00 00 */	cmplwi r4, 0
/* 800773B8 000743B8  41 82 00 10 */	beq lbl_800773C8
/* 800773BC 000743BC  88 1F 00 00 */	lbz r0, 0(r31)
/* 800773C0 000743C0  7C 00 07 75 */	extsb. r0, r0
/* 800773C4 000743C4  40 82 FF DC */	bne lbl_800773A0
lbl_800773C8:
/* 800773C8 000743C8  7C 04 30 50 */	subf r0, r4, r6
/* 800773CC 000743CC  7C 63 02 14 */	add r3, r3, r0
/* 800773D0 000743D0  7C 7A 1B 78 */	mr r26, r3
lbl_800773D4:
/* 800773D4 000743D4  7C 1A E0 40 */	cmplw r26, r28
/* 800773D8 000743D8  40 82 00 0C */	bne lbl_800773E4
/* 800773DC 000743DC  7F 43 D3 78 */	mr r3, r26
/* 800773E0 000743E0  48 00 00 54 */	b lbl_80077434
lbl_800773E4:
/* 800773E4 000743E4  38 7A 00 01 */	addi r3, r26, 1
/* 800773E8 000743E8  38 00 00 2F */	li r0, 0x2f
/* 800773EC 000743EC  7C E3 E0 50 */	subf r7, r3, r28
/* 800773F0 000743F0  7C 1B D1 AE */	stbx r0, r27, r26
/* 800773F4 000743F4  7F A6 EB 78 */	mr r6, r29
/* 800773F8 000743F8  7C BB 1A 14 */	add r5, r27, r3
/* 800773FC 000743FC  7C E4 3B 78 */	mr r4, r7
/* 80077400 00074400  48 00 00 18 */	b lbl_80077418
lbl_80077404:
/* 80077404 00074404  88 06 00 00 */	lbz r0, 0(r6)
/* 80077408 00074408  38 84 FF FF */	addi r4, r4, -1
/* 8007740C 0007440C  38 C6 00 01 */	addi r6, r6, 1
/* 80077410 00074410  98 05 00 00 */	stb r0, 0(r5)
/* 80077414 00074414  38 A5 00 01 */	addi r5, r5, 1
lbl_80077418:
/* 80077418 00074418  28 04 00 00 */	cmplwi r4, 0
/* 8007741C 0007441C  41 82 00 10 */	beq lbl_8007742C
/* 80077420 00074420  88 06 00 00 */	lbz r0, 0(r6)
/* 80077424 00074424  7C 00 07 75 */	extsb. r0, r0
/* 80077428 00074428  40 82 FF DC */	bne lbl_80077404
lbl_8007742C:
/* 8007742C 0007442C  7C 04 38 50 */	subf r0, r4, r7
/* 80077430 00074430  7C 63 02 14 */	add r3, r3, r0
lbl_80077434:
/* 80077434 00074434  BB 21 00 14 */	lmw r25, 0x14(r1)
/* 80077438 00074438  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8007743C 0007443C  7C 08 03 A6 */	mtlr r0
/* 80077440 00074440  38 21 00 30 */	addi r1, r1, 0x30
/* 80077444 00074444  4E 80 00 20 */	blr 

.global myStrncpy
myStrncpy:
/* 80077448 00074448  7C A6 2B 78 */	mr r6, r5
/* 8007744C 0007444C  48 00 00 18 */	b lbl_80077464
lbl_80077450:
/* 80077450 00074450  88 04 00 00 */	lbz r0, 0(r4)
/* 80077454 00074454  38 C6 FF FF */	addi r6, r6, -1
/* 80077458 00074458  38 84 00 01 */	addi r4, r4, 1
/* 8007745C 0007445C  98 03 00 00 */	stb r0, 0(r3)
/* 80077460 00074460  38 63 00 01 */	addi r3, r3, 1
lbl_80077464:
/* 80077464 00074464  28 06 00 00 */	cmplwi r6, 0
/* 80077468 00074468  41 82 00 10 */	beq lbl_80077478
/* 8007746C 0007446C  88 04 00 00 */	lbz r0, 0(r4)
/* 80077470 00074470  7C 00 07 75 */	extsb. r0, r0
/* 80077474 00074474  40 82 FF DC */	bne lbl_80077450
lbl_80077478:
/* 80077478 00074478  7C 66 28 50 */	subf r3, r6, r5
/* 8007747C 0007447C  4E 80 00 20 */	blr 

.global ARCConvertPathToEntrynum
ARCConvertPathToEntrynum:
/* 80077480 00074480  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80077484 00074484  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80077488 00074488  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8007748C 0007448C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80077490 00074490  81 23 00 18 */	lwz r9, 0x18(r3)
/* 80077494 00074494  81 43 00 04 */	lwz r10, 4(r3)
lbl_80077498:
/* 80077498 00074498  88 A4 00 00 */	lbz r5, 0(r4)
/* 8007749C 0007449C  7C A0 07 75 */	extsb. r0, r5
/* 800774A0 000744A0  40 82 00 0C */	bne lbl_800774AC
/* 800774A4 000744A4  7D 23 4B 78 */	mr r3, r9
/* 800774A8 000744A8  48 00 01 F0 */	b lbl_80077698
lbl_800774AC:
/* 800774AC 000744AC  7C A0 07 74 */	extsb r0, r5
/* 800774B0 000744B0  2C 00 00 2F */	cmpwi r0, 0x2f
/* 800774B4 000744B4  40 82 00 10 */	bne lbl_800774C4
/* 800774B8 000744B8  39 20 00 00 */	li r9, 0
/* 800774BC 000744BC  38 84 00 01 */	addi r4, r4, 1
/* 800774C0 000744C0  4B FF FF D8 */	b lbl_80077498
lbl_800774C4:
/* 800774C4 000744C4  2C 00 00 2E */	cmpwi r0, 0x2e
/* 800774C8 000744C8  40 82 00 6C */	bne lbl_80077534
/* 800774CC 000744CC  88 A4 00 01 */	lbz r5, 1(r4)
/* 800774D0 000744D0  7C A0 07 74 */	extsb r0, r5
/* 800774D4 000744D4  2C 00 00 2E */	cmpwi r0, 0x2e
/* 800774D8 000744D8  40 82 00 3C */	bne lbl_80077514
/* 800774DC 000744DC  88 A4 00 02 */	lbz r5, 2(r4)
/* 800774E0 000744E0  2C 05 00 2F */	cmpwi r5, 0x2f
/* 800774E4 000744E4  40 82 00 18 */	bne lbl_800774FC
/* 800774E8 000744E8  1C A9 00 0C */	mulli r5, r9, 0xc
/* 800774EC 000744EC  38 84 00 03 */	addi r4, r4, 3
/* 800774F0 000744F0  38 05 00 04 */	addi r0, r5, 4
/* 800774F4 000744F4  7D 2A 00 2E */	lwzx r9, r10, r0
/* 800774F8 000744F8  4B FF FF A0 */	b lbl_80077498
lbl_800774FC:
/* 800774FC 000744FC  7C A0 07 75 */	extsb. r0, r5
/* 80077500 00074500  40 82 00 34 */	bne lbl_80077534
/* 80077504 00074504  1C 09 00 0C */	mulli r0, r9, 0xc
/* 80077508 00074508  7C 6A 02 14 */	add r3, r10, r0
/* 8007750C 0007450C  80 63 00 04 */	lwz r3, 4(r3)
/* 80077510 00074510  48 00 01 88 */	b lbl_80077698
lbl_80077514:
/* 80077514 00074514  2C 00 00 2F */	cmpwi r0, 0x2f
/* 80077518 00074518  40 82 00 0C */	bne lbl_80077524
/* 8007751C 0007451C  38 84 00 02 */	addi r4, r4, 2
/* 80077520 00074520  4B FF FF 78 */	b lbl_80077498
lbl_80077524:
/* 80077524 00074524  7C A0 07 75 */	extsb. r0, r5
/* 80077528 00074528  40 82 00 0C */	bne lbl_80077534
/* 8007752C 0007452C  7D 23 4B 78 */	mr r3, r9
/* 80077530 00074530  48 00 01 68 */	b lbl_80077698
lbl_80077534:
/* 80077534 00074534  7C 88 23 78 */	mr r8, r4
/* 80077538 00074538  48 00 00 08 */	b lbl_80077540
lbl_8007753C:
/* 8007753C 0007453C  39 08 00 01 */	addi r8, r8, 1
lbl_80077540:
/* 80077540 00074540  88 C8 00 00 */	lbz r6, 0(r8)
/* 80077544 00074544  7C C0 07 75 */	extsb. r0, r6
/* 80077548 00074548  41 82 00 10 */	beq lbl_80077558
/* 8007754C 0007454C  7C C0 07 74 */	extsb r0, r6
/* 80077550 00074550  2C 00 00 2F */	cmpwi r0, 0x2f
/* 80077554 00074554  40 82 FF E8 */	bne lbl_8007753C
lbl_80077558:
/* 80077558 00074558  1C A9 00 0C */	mulli r5, r9, 0xc
/* 8007755C 0007455C  7C C7 07 74 */	extsb r7, r6
/* 80077560 00074560  7D 04 40 50 */	subf r8, r4, r8
/* 80077564 00074564  7C C7 00 D0 */	neg r6, r7
/* 80077568 00074568  38 05 00 08 */	addi r0, r5, 8
/* 8007756C 0007456C  39 29 00 01 */	addi r9, r9, 1
/* 80077570 00074570  7C C6 3B 78 */	or r6, r6, r7
/* 80077574 00074574  7C AA 00 2E */	lwzx r5, r10, r0
/* 80077578 00074578  54 C0 0F FE */	srwi r0, r6, 0x1f
/* 8007757C 0007457C  48 00 00 F0 */	b lbl_8007766C
lbl_80077580:
/* 80077580 00074580  1C C9 00 0C */	mulli r6, r9, 0xc
/* 80077584 00074584  7C EA 32 14 */	add r7, r10, r6
/* 80077588 00074588  83 A7 00 00 */	lwz r29, 0(r7)
/* 8007758C 0007458C  57 A6 00 0E */	rlwinm r6, r29, 0, 0, 7
/* 80077590 00074590  7D 66 00 D0 */	neg r11, r6
/* 80077594 00074594  7D 6B 33 78 */	or r11, r11, r6
/* 80077598 00074598  55 6B 0F FF */	rlwinm. r11, r11, 1, 0x1f, 0x1f
/* 8007759C 0007459C  40 82 00 0C */	bne lbl_800775A8
/* 800775A0 000745A0  2C 00 00 01 */	cmpwi r0, 1
/* 800775A4 000745A4  41 82 00 B4 */	beq lbl_80077658
lbl_800775A8:
/* 800775A8 000745A8  81 83 00 10 */	lwz r12, 0x10(r3)
/* 800775AC 000745AC  57 AB 02 3E */	clrlwi r11, r29, 8
/* 800775B0 000745B0  7C 9F 23 78 */	mr r31, r4
/* 800775B4 000745B4  7F CC 5A 14 */	add r30, r12, r11
/* 800775B8 000745B8  48 00 00 6C */	b lbl_80077624
lbl_800775BC:
/* 800775BC 000745BC  89 7E 00 00 */	lbz r11, 0(r30)
/* 800775C0 000745C0  3B DE 00 01 */	addi r30, r30, 1
/* 800775C4 000745C4  7D 6C 07 74 */	extsb r12, r11
/* 800775C8 000745C8  2C 0C FF FF */	cmpwi r12, -1
/* 800775CC 000745CC  40 82 00 0C */	bne lbl_800775D8
/* 800775D0 000745D0  3B A0 FF FF */	li r29, -1
/* 800775D4 000745D4  48 00 00 14 */	b lbl_800775E8
lbl_800775D8:
/* 800775D8 000745D8  3D 60 80 3B */	lis r11, lbl_803B7848@ha
/* 800775DC 000745DC  55 8C 06 3E */	clrlwi r12, r12, 0x18
/* 800775E0 000745E0  39 6B 78 48 */	addi r11, r11, lbl_803B7848@l
/* 800775E4 000745E4  7F AB 60 AE */	lbzx r29, r11, r12
lbl_800775E8:
/* 800775E8 000745E8  89 7F 00 00 */	lbz r11, 0(r31)
/* 800775EC 000745EC  3B FF 00 01 */	addi r31, r31, 1
/* 800775F0 000745F0  7D 6C 07 74 */	extsb r12, r11
/* 800775F4 000745F4  2C 0C FF FF */	cmpwi r12, -1
/* 800775F8 000745F8  40 82 00 0C */	bne lbl_80077604
/* 800775FC 000745FC  39 60 FF FF */	li r11, -1
/* 80077600 00074600  48 00 00 14 */	b lbl_80077614
lbl_80077604:
/* 80077604 00074604  3D 60 80 3B */	lis r11, lbl_803B7848@ha
/* 80077608 00074608  55 8C 06 3E */	clrlwi r12, r12, 0x18
/* 8007760C 0007460C  39 6B 78 48 */	addi r11, r11, lbl_803B7848@l
/* 80077610 00074610  7D 6B 60 AE */	lbzx r11, r11, r12
lbl_80077614:
/* 80077614 00074614  7C 0B E8 00 */	cmpw r11, r29
/* 80077618 00074618  41 82 00 0C */	beq lbl_80077624
/* 8007761C 0007461C  39 60 00 00 */	li r11, 0
/* 80077620 00074620  48 00 00 30 */	b lbl_80077650
lbl_80077624:
/* 80077624 00074624  89 7E 00 00 */	lbz r11, 0(r30)
/* 80077628 00074628  7D 6B 07 75 */	extsb. r11, r11
/* 8007762C 0007462C  40 82 FF 90 */	bne lbl_800775BC
/* 80077630 00074630  89 9F 00 00 */	lbz r12, 0(r31)
/* 80077634 00074634  2C 0C 00 2F */	cmpwi r12, 0x2f
/* 80077638 00074638  41 82 00 0C */	beq lbl_80077644
/* 8007763C 0007463C  7D 8B 07 75 */	extsb. r11, r12
/* 80077640 00074640  40 82 00 0C */	bne lbl_8007764C
lbl_80077644:
/* 80077644 00074644  39 60 00 01 */	li r11, 1
/* 80077648 00074648  48 00 00 08 */	b lbl_80077650
lbl_8007764C:
/* 8007764C 0007464C  39 60 00 00 */	li r11, 0
lbl_80077650:
/* 80077650 00074650  2C 0B 00 01 */	cmpwi r11, 1
/* 80077654 00074654  41 82 00 28 */	beq lbl_8007767C
lbl_80077658:
/* 80077658 00074658  28 06 00 00 */	cmplwi r6, 0
/* 8007765C 0007465C  41 82 00 0C */	beq lbl_80077668
/* 80077660 00074660  81 27 00 08 */	lwz r9, 8(r7)
/* 80077664 00074664  48 00 00 08 */	b lbl_8007766C
lbl_80077668:
/* 80077668 00074668  39 29 00 01 */	addi r9, r9, 1
lbl_8007766C:
/* 8007766C 0007466C  7C 09 28 40 */	cmplw r9, r5
/* 80077670 00074670  41 80 FF 10 */	blt lbl_80077580
/* 80077674 00074674  38 60 FF FF */	li r3, -1
/* 80077678 00074678  48 00 00 20 */	b lbl_80077698
lbl_8007767C:
/* 8007767C 0007467C  2C 00 00 00 */	cmpwi r0, 0
/* 80077680 00074680  40 82 00 0C */	bne lbl_8007768C
/* 80077684 00074684  7D 23 4B 78 */	mr r3, r9
/* 80077688 00074688  48 00 00 10 */	b lbl_80077698
lbl_8007768C:
/* 8007768C 0007468C  7C 88 22 14 */	add r4, r8, r4
/* 80077690 00074690  38 84 00 01 */	addi r4, r4, 1
/* 80077694 00074694  4B FF FE 04 */	b lbl_80077498
lbl_80077698:
/* 80077698 00074698  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8007769C 0007469C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800776A0 000746A0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800776A4 000746A4  38 21 00 20 */	addi r1, r1, 0x20
/* 800776A8 000746A8  4E 80 00 20 */	blr 

.global ARCOpen
ARCOpen:
/* 800776AC 000746AC  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 800776B0 000746B0  7C 08 02 A6 */	mflr r0
/* 800776B4 000746B4  90 01 00 A4 */	stw r0, 0xa4(r1)
/* 800776B8 000746B8  93 E1 00 9C */	stw r31, 0x9c(r1)
/* 800776BC 000746BC  93 C1 00 98 */	stw r30, 0x98(r1)
/* 800776C0 000746C0  7C BE 2B 78 */	mr r30, r5
/* 800776C4 000746C4  93 A1 00 94 */	stw r29, 0x94(r1)
/* 800776C8 000746C8  7C 7D 1B 78 */	mr r29, r3
/* 800776CC 000746CC  83 E3 00 04 */	lwz r31, 4(r3)
/* 800776D0 000746D0  4B FF FD B1 */	bl ARCConvertPathToEntrynum
/* 800776D4 000746D4  2C 03 00 00 */	cmpwi r3, 0
/* 800776D8 000746D8  40 80 00 1C */	bge lbl_800776F4
/* 800776DC 000746DC  7F A3 EB 78 */	mr r3, r29
/* 800776E0 000746E0  38 81 00 08 */	addi r4, r1, 8
/* 800776E4 000746E4  38 A0 00 80 */	li r5, 0x80
/* 800776E8 000746E8  4B FF FA 5D */	bl ARCGetCurrentDir
/* 800776EC 000746EC  38 60 00 00 */	li r3, 0
/* 800776F0 000746F0  48 00 00 48 */	b lbl_80077738
lbl_800776F4:
/* 800776F4 000746F4  41 80 00 20 */	blt lbl_80077714
/* 800776F8 000746F8  1C 83 00 0C */	mulli r4, r3, 0xc
/* 800776FC 000746FC  7C 1F 20 2E */	lwzx r0, r31, r4
/* 80077700 00074700  54 03 00 0E */	rlwinm r3, r0, 0, 0, 7
/* 80077704 00074704  7C 03 00 D0 */	neg r0, r3
/* 80077708 00074708  7C 00 1B 78 */	or r0, r0, r3
/* 8007770C 0007470C  54 00 0F FF */	rlwinm. r0, r0, 1, 0x1f, 0x1f
/* 80077710 00074710  41 82 00 0C */	beq lbl_8007771C
lbl_80077714:
/* 80077714 00074714  38 60 00 00 */	li r3, 0
/* 80077718 00074718  48 00 00 20 */	b lbl_80077738
lbl_8007771C:
/* 8007771C 0007471C  93 BE 00 00 */	stw r29, 0(r30)
/* 80077720 00074720  7C 9F 22 14 */	add r4, r31, r4
/* 80077724 00074724  38 60 00 01 */	li r3, 1
/* 80077728 00074728  80 04 00 04 */	lwz r0, 4(r4)
/* 8007772C 0007472C  90 1E 00 04 */	stw r0, 4(r30)
/* 80077730 00074730  80 04 00 08 */	lwz r0, 8(r4)
/* 80077734 00074734  90 1E 00 08 */	stw r0, 8(r30)
lbl_80077738:
/* 80077738 00074738  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 8007773C 0007473C  83 E1 00 9C */	lwz r31, 0x9c(r1)
/* 80077740 00074740  83 C1 00 98 */	lwz r30, 0x98(r1)
/* 80077744 00074744  83 A1 00 94 */	lwz r29, 0x94(r1)
/* 80077748 00074748  7C 08 03 A6 */	mtlr r0
/* 8007774C 0007474C  38 21 00 A0 */	addi r1, r1, 0xa0
/* 80077750 00074750  4E 80 00 20 */	blr 

.global ARCInitHandle
ARCInitHandle:
/* 80077754 00074754  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80077758 00074758  7C 08 02 A6 */	mflr r0
/* 8007775C 0007475C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80077760 00074760  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80077764 00074764  7C 9F 23 78 */	mr r31, r4
/* 80077768 00074768  93 C1 00 08 */	stw r30, 8(r1)
/* 8007776C 0007476C  7C 7E 1B 78 */	mr r30, r3
/* 80077770 00074770  80 63 00 00 */	lwz r3, 0(r3)
/* 80077774 00074774  3C 03 AA 56 */	addis r0, r3, 0xaa56
/* 80077778 00074778  28 00 38 2D */	cmplwi r0, 0x382d
/* 8007777C 0007477C  41 82 00 1C */	beq lbl_80077798
/* 80077780 00074780  3C 80 80 2C */	lis r4, lbl_802C4920@ha
/* 80077784 00074784  38 62 8F C8 */	addi r3, r2, lbl_8041A348@sda21
/* 80077788 00074788  38 A4 49 20 */	addi r5, r4, lbl_802C4920@l
/* 8007778C 0007478C  38 80 00 46 */	li r4, 0x46
/* 80077790 00074790  4C C6 31 82 */	crclr 6
/* 80077794 00074794  48 21 A2 FD */	bl OSPanic
lbl_80077798:
/* 80077798 00074798  93 DF 00 00 */	stw r30, 0(r31)
/* 8007779C 0007479C  38 00 00 00 */	li r0, 0
/* 800777A0 000747A0  38 60 00 01 */	li r3, 1
/* 800777A4 000747A4  80 9E 00 04 */	lwz r4, 4(r30)
/* 800777A8 000747A8  7C BE 22 14 */	add r5, r30, r4
/* 800777AC 000747AC  90 BF 00 04 */	stw r5, 4(r31)
/* 800777B0 000747B0  80 9E 00 0C */	lwz r4, 0xc(r30)
/* 800777B4 000747B4  7C 9E 22 14 */	add r4, r30, r4
/* 800777B8 000747B8  90 9F 00 08 */	stw r4, 8(r31)
/* 800777BC 000747BC  80 85 00 08 */	lwz r4, 8(r5)
/* 800777C0 000747C0  90 9F 00 0C */	stw r4, 0xc(r31)
/* 800777C4 000747C4  80 9F 00 0C */	lwz r4, 0xc(r31)
/* 800777C8 000747C8  1C 84 00 0C */	mulli r4, r4, 0xc
/* 800777CC 000747CC  7C 85 22 14 */	add r4, r5, r4
/* 800777D0 000747D0  90 9F 00 10 */	stw r4, 0x10(r31)
/* 800777D4 000747D4  80 9E 00 08 */	lwz r4, 8(r30)
/* 800777D8 000747D8  90 9F 00 14 */	stw r4, 0x14(r31)
/* 800777DC 000747DC  90 1F 00 18 */	stw r0, 0x18(r31)
/* 800777E0 000747E0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800777E4 000747E4  83 C1 00 08 */	lwz r30, 8(r1)
/* 800777E8 000747E8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800777EC 000747EC  7C 08 03 A6 */	mtlr r0
/* 800777F0 000747F0  38 21 00 10 */	addi r1, r1, 0x10
/* 800777F4 000747F4  4E 80 00 20 */	blr 
