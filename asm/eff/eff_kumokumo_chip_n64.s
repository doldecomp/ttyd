.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effKumokumoChipDisp
effKumokumoChipDisp:
/* 801CB1F8 001C81F8  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 801CB1FC 001C81FC  7C 08 02 A6 */	mflr r0
/* 801CB200 001C8200  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 801CB204 001C8204  93 E1 00 AC */	stw r31, 0xac(r1)
/* 801CB208 001C8208  93 C1 00 A8 */	stw r30, 0xa8(r1)
/* 801CB20C 001C820C  93 A1 00 A4 */	stw r29, 0xa4(r1)
/* 801CB210 001C8210  7C 9D 23 78 */	mr r29, r4
/* 801CB214 001C8214  4B E4 3F 3D */	bl camGetPtr
/* 801CB218 001C8218  83 DD 00 0C */	lwz r30, 0xc(r29)
/* 801CB21C 001C821C  7C 7F 1B 78 */	mr r31, r3
/* 801CB220 001C8220  38 61 00 68 */	addi r3, r1, 0x68
/* 801CB224 001C8224  83 BE 00 30 */	lwz r29, 0x30(r30)
/* 801CB228 001C8228  C0 3E 00 04 */	lfs f1, 4(r30)
/* 801CB22C 001C822C  C0 5E 00 08 */	lfs f2, 8(r30)
/* 801CB230 001C8230  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 801CB234 001C8234  48 0C D1 F9 */	bl PSMTXTrans
/* 801CB238 001C8238  C0 3E 00 44 */	lfs f1, 0x44(r30)
/* 801CB23C 001C823C  38 61 00 38 */	addi r3, r1, 0x38
/* 801CB240 001C8240  FC 40 08 90 */	fmr f2, f1
/* 801CB244 001C8244  FC 60 08 90 */	fmr f3, f1
/* 801CB248 001C8248  48 0C D2 65 */	bl PSMTXScale
/* 801CB24C 001C824C  38 61 00 68 */	addi r3, r1, 0x68
/* 801CB250 001C8250  38 81 00 38 */	addi r4, r1, 0x38
/* 801CB254 001C8254  7C 65 1B 78 */	mr r5, r3
/* 801CB258 001C8258  48 0C CD 09 */	bl PSMTXConcat
/* 801CB25C 001C825C  38 81 00 68 */	addi r4, r1, 0x68
/* 801CB260 001C8260  38 7F 01 1C */	addi r3, r31, 0x11c
/* 801CB264 001C8264  7C 85 23 78 */	mr r5, r4
/* 801CB268 001C8268  48 0C CC F9 */	bl PSMTXConcat
/* 801CB26C 001C826C  38 61 00 68 */	addi r3, r1, 0x68
/* 801CB270 001C8270  38 80 00 00 */	li r4, 0
/* 801CB274 001C8274  48 0E 92 85 */	bl GXLoadPosMtxImm
/* 801CB278 001C8278  38 60 00 00 */	li r3, 0
/* 801CB27C 001C827C  48 0E 93 1D */	bl GXSetCurrentMtx
/* 801CB280 001C8280  80 02 1E 18 */	lwz r0, lbl_80423198@sda21(r2)
/* 801CB284 001C8284  38 81 00 14 */	addi r4, r1, 0x14
/* 801CB288 001C8288  80 DE 00 24 */	lwz r6, 0x24(r30)
/* 801CB28C 001C828C  38 60 00 01 */	li r3, 1
/* 801CB290 001C8290  90 01 00 10 */	stw r0, 0x10(r1)
/* 801CB294 001C8294  80 BE 00 28 */	lwz r5, 0x28(r30)
/* 801CB298 001C8298  80 1E 00 2C */	lwz r0, 0x2c(r30)
/* 801CB29C 001C829C  98 C1 00 10 */	stb r6, 0x10(r1)
/* 801CB2A0 001C82A0  98 A1 00 11 */	stb r5, 0x11(r1)
/* 801CB2A4 001C82A4  98 01 00 12 */	stb r0, 0x12(r1)
/* 801CB2A8 001C82A8  9B A1 00 13 */	stb r29, 0x13(r1)
/* 801CB2AC 001C82AC  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801CB2B0 001C82B0  90 01 00 14 */	stw r0, 0x14(r1)
/* 801CB2B4 001C82B4  48 0E 7A 01 */	bl GXSetTevColor
/* 801CB2B8 001C82B8  80 02 1E 1C */	lwz r0, lbl_8042319C@sda21(r2)
/* 801CB2BC 001C82BC  38 81 00 0C */	addi r4, r1, 0xc
/* 801CB2C0 001C82C0  80 FE 00 34 */	lwz r7, 0x34(r30)
/* 801CB2C4 001C82C4  38 60 00 02 */	li r3, 2
/* 801CB2C8 001C82C8  90 01 00 08 */	stw r0, 8(r1)
/* 801CB2CC 001C82CC  80 DE 00 38 */	lwz r6, 0x38(r30)
/* 801CB2D0 001C82D0  80 BE 00 3C */	lwz r5, 0x3c(r30)
/* 801CB2D4 001C82D4  80 1E 00 40 */	lwz r0, 0x40(r30)
/* 801CB2D8 001C82D8  98 E1 00 08 */	stb r7, 8(r1)
/* 801CB2DC 001C82DC  98 C1 00 09 */	stb r6, 9(r1)
/* 801CB2E0 001C82E0  98 A1 00 0A */	stb r5, 0xa(r1)
/* 801CB2E4 001C82E4  98 01 00 0B */	stb r0, 0xb(r1)
/* 801CB2E8 001C82E8  80 01 00 08 */	lwz r0, 8(r1)
/* 801CB2EC 001C82EC  90 01 00 0C */	stw r0, 0xc(r1)
/* 801CB2F0 001C82F0  48 0E 79 C5 */	bl GXSetTevColor
/* 801CB2F4 001C82F4  38 81 00 18 */	addi r4, r1, 0x18
/* 801CB2F8 001C82F8  38 60 00 6B */	li r3, 0x6b
/* 801CB2FC 001C82FC  48 00 65 49 */	bl effGetTexObjN64
/* 801CB300 001C8300  38 61 00 18 */	addi r3, r1, 0x18
/* 801CB304 001C8304  38 80 00 00 */	li r4, 0
/* 801CB308 001C8308  48 0E 67 75 */	bl GXLoadTexObj
/* 801CB30C 001C830C  38 60 00 00 */	li r3, 0
/* 801CB310 001C8310  48 0E 5E 29 */	bl GXSetNumChans
/* 801CB314 001C8314  38 60 00 01 */	li r3, 1
/* 801CB318 001C8318  48 0E 3F 69 */	bl GXSetNumTexGens
/* 801CB31C 001C831C  38 60 00 00 */	li r3, 0
/* 801CB320 001C8320  38 80 00 01 */	li r4, 1
/* 801CB324 001C8324  38 A0 00 04 */	li r5, 4
/* 801CB328 001C8328  38 C0 00 1E */	li r6, 0x1e
/* 801CB32C 001C832C  38 E0 00 00 */	li r7, 0
/* 801CB330 001C8330  39 00 00 7D */	li r8, 0x7d
/* 801CB334 001C8334  48 0E 3C CD */	bl GXSetTexCoordGen2
/* 801CB338 001C8338  C0 22 E1 E8 */	lfs f1, lbl_8041F568@sda21(r2)
/* 801CB33C 001C833C  38 61 00 38 */	addi r3, r1, 0x38
/* 801CB340 001C8340  C0 62 E1 EC */	lfs f3, lbl_8041F56C@sda21(r2)
/* 801CB344 001C8344  FC 40 08 90 */	fmr f2, f1
/* 801CB348 001C8348  48 0C D1 65 */	bl PSMTXScale
/* 801CB34C 001C834C  38 61 00 38 */	addi r3, r1, 0x38
/* 801CB350 001C8350  38 80 00 1E */	li r4, 0x1e
/* 801CB354 001C8354  38 A0 00 01 */	li r5, 1
/* 801CB358 001C8358  48 0E 92 75 */	bl GXLoadTexMtxImm
/* 801CB35C 001C835C  38 60 00 01 */	li r3, 1
/* 801CB360 001C8360  48 0E 7E 69 */	bl GXSetNumTevStages
/* 801CB364 001C8364  38 60 00 00 */	li r3, 0
/* 801CB368 001C8368  38 80 00 00 */	li r4, 0
/* 801CB36C 001C836C  38 A0 00 00 */	li r5, 0
/* 801CB370 001C8370  38 C0 00 FF */	li r6, 0xff
/* 801CB374 001C8374  48 0E 7C B9 */	bl GXSetTevOrder
/* 801CB378 001C8378  38 60 00 00 */	li r3, 0
/* 801CB37C 001C837C  38 80 00 00 */	li r4, 0
/* 801CB380 001C8380  38 A0 00 00 */	li r5, 0
/* 801CB384 001C8384  38 C0 00 00 */	li r6, 0
/* 801CB388 001C8388  38 E0 00 01 */	li r7, 1
/* 801CB38C 001C838C  39 00 00 00 */	li r8, 0
/* 801CB390 001C8390  48 0E 78 55 */	bl GXSetTevColorOp
/* 801CB394 001C8394  38 60 00 00 */	li r3, 0
/* 801CB398 001C8398  38 80 00 00 */	li r4, 0
/* 801CB39C 001C839C  38 A0 00 00 */	li r5, 0
/* 801CB3A0 001C83A0  38 C0 00 00 */	li r6, 0
/* 801CB3A4 001C83A4  38 E0 00 01 */	li r7, 1
/* 801CB3A8 001C83A8  39 00 00 00 */	li r8, 0
/* 801CB3AC 001C83AC  48 0E 78 A1 */	bl GXSetTevAlphaOp
/* 801CB3B0 001C83B0  38 60 00 00 */	li r3, 0
/* 801CB3B4 001C83B4  38 80 00 04 */	li r4, 4
/* 801CB3B8 001C83B8  38 A0 00 02 */	li r5, 2
/* 801CB3BC 001C83BC  38 C0 00 08 */	li r6, 8
/* 801CB3C0 001C83C0  38 E0 00 0F */	li r7, 0xf
/* 801CB3C4 001C83C4  48 0E 77 99 */	bl GXSetTevColorIn
/* 801CB3C8 001C83C8  38 60 00 00 */	li r3, 0
/* 801CB3CC 001C83CC  38 80 00 07 */	li r4, 7
/* 801CB3D0 001C83D0  38 A0 00 01 */	li r5, 1
/* 801CB3D4 001C83D4  38 C0 00 04 */	li r6, 4
/* 801CB3D8 001C83D8  38 E0 00 07 */	li r7, 7
/* 801CB3DC 001C83DC  48 0E 77 C5 */	bl GXSetTevAlphaIn
/* 801CB3E0 001C83E0  38 60 00 00 */	li r3, 0
/* 801CB3E4 001C83E4  48 0E 4A A5 */	bl GXSetCullMode
/* 801CB3E8 001C83E8  3C 60 80 3A */	lis r3, lbl_803A2238@ha
/* 801CB3EC 001C83EC  38 63 22 38 */	addi r3, r3, lbl_803A2238@l
/* 801CB3F0 001C83F0  48 00 62 C1 */	bl effSetVtxDescN64
/* 801CB3F4 001C83F4  38 60 00 90 */	li r3, 0x90
/* 801CB3F8 001C83F8  38 80 00 00 */	li r4, 0
/* 801CB3FC 001C83FC  38 A0 00 06 */	li r5, 6
/* 801CB400 001C8400  48 0E 48 69 */	bl GXBegin
/* 801CB404 001C8404  38 60 00 00 */	li r3, 0
/* 801CB408 001C8408  38 80 00 01 */	li r4, 1
/* 801CB40C 001C840C  38 A0 00 02 */	li r5, 2
/* 801CB410 001C8410  38 C0 00 00 */	li r6, 0
/* 801CB414 001C8414  38 E0 00 00 */	li r7, 0
/* 801CB418 001C8418  39 00 00 02 */	li r8, 2
/* 801CB41C 001C841C  39 20 00 03 */	li r9, 3
/* 801CB420 001C8420  39 40 00 00 */	li r10, 0
/* 801CB424 001C8424  48 00 62 11 */	bl tri2
/* 801CB428 001C8428  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 801CB42C 001C842C  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 801CB430 001C8430  83 C1 00 A8 */	lwz r30, 0xa8(r1)
/* 801CB434 001C8434  83 A1 00 A4 */	lwz r29, 0xa4(r1)
/* 801CB438 001C8438  7C 08 03 A6 */	mtlr r0
/* 801CB43C 001C843C  38 21 00 B0 */	addi r1, r1, 0xb0
/* 801CB440 001C8440  4E 80 00 20 */	blr 
effKumokumoChipMain:
/* 801CB444 001C8444  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801CB448 001C8448  7C 08 02 A6 */	mflr r0
/* 801CB44C 001C844C  3C 80 80 30 */	lis r4, lbl_802FAA50@ha
/* 801CB450 001C8450  90 01 00 34 */	stw r0, 0x34(r1)
/* 801CB454 001C8454  38 A4 AA 50 */	addi r5, r4, lbl_802FAA50@l
/* 801CB458 001C8458  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801CB45C 001C845C  7C 7F 1B 78 */	mr r31, r3
/* 801CB460 001C8460  80 C3 00 0C */	lwz r6, 0xc(r3)
/* 801CB464 001C8464  80 85 00 00 */	lwz r4, 0(r5)
/* 801CB468 001C8468  80 65 00 04 */	lwz r3, 4(r5)
/* 801CB46C 001C846C  80 05 00 08 */	lwz r0, 8(r5)
/* 801CB470 001C8470  90 81 00 08 */	stw r4, 8(r1)
/* 801CB474 001C8474  C0 06 00 04 */	lfs f0, 4(r6)
/* 801CB478 001C8478  90 61 00 0C */	stw r3, 0xc(r1)
/* 801CB47C 001C847C  C0 26 00 08 */	lfs f1, 8(r6)
/* 801CB480 001C8480  D0 01 00 08 */	stfs f0, 8(r1)
/* 801CB484 001C8484  C0 06 00 0C */	lfs f0, 0xc(r6)
/* 801CB488 001C8488  90 01 00 10 */	stw r0, 0x10(r1)
/* 801CB48C 001C848C  80 81 00 08 */	lwz r4, 8(r1)
/* 801CB490 001C8490  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801CB494 001C8494  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801CB498 001C8498  80 61 00 0C */	lwz r3, 0xc(r1)
/* 801CB49C 001C849C  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801CB4A0 001C84A0  90 81 00 14 */	stw r4, 0x14(r1)
/* 801CB4A4 001C84A4  90 61 00 18 */	stw r3, 0x18(r1)
/* 801CB4A8 001C84A8  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801CB4AC 001C84AC  80 7F 00 00 */	lwz r3, 0(r31)
/* 801CB4B0 001C84B0  80 A6 00 00 */	lwz r5, 0(r6)
/* 801CB4B4 001C84B4  54 60 07 7B */	rlwinm. r0, r3, 0, 0x1d, 0x1d
/* 801CB4B8 001C84B8  41 82 00 14 */	beq lbl_801CB4CC
/* 801CB4BC 001C84BC  54 63 07 B8 */	rlwinm r3, r3, 0, 0x1e, 0x1c
/* 801CB4C0 001C84C0  38 00 00 10 */	li r0, 0x10
/* 801CB4C4 001C84C4  90 7F 00 00 */	stw r3, 0(r31)
/* 801CB4C8 001C84C8  90 06 00 1C */	stw r0, 0x1c(r6)
lbl_801CB4CC:
/* 801CB4CC 001C84CC  80 66 00 1C */	lwz r3, 0x1c(r6)
/* 801CB4D0 001C84D0  2C 03 03 E8 */	cmpwi r3, 0x3e8
/* 801CB4D4 001C84D4  40 80 00 0C */	bge lbl_801CB4E0
/* 801CB4D8 001C84D8  38 03 FF FF */	addi r0, r3, -1
/* 801CB4DC 001C84DC  90 06 00 1C */	stw r0, 0x1c(r6)
lbl_801CB4E0:
/* 801CB4E0 001C84E0  80 66 00 20 */	lwz r3, 0x20(r6)
/* 801CB4E4 001C84E4  38 03 00 01 */	addi r0, r3, 1
/* 801CB4E8 001C84E8  90 06 00 20 */	stw r0, 0x20(r6)
/* 801CB4EC 001C84EC  80 86 00 1C */	lwz r4, 0x1c(r6)
/* 801CB4F0 001C84F0  2C 04 00 00 */	cmpwi r4, 0
/* 801CB4F4 001C84F4  40 80 00 10 */	bge lbl_801CB504
/* 801CB4F8 001C84F8  7F E3 FB 78 */	mr r3, r31
/* 801CB4FC 001C84FC  4B E9 26 89 */	bl effDelete
/* 801CB500 001C8500  48 00 00 CC */	b lbl_801CB5CC
lbl_801CB504:
/* 801CB504 001C8504  2C 05 00 00 */	cmpwi r5, 0
/* 801CB508 001C8508  80 06 00 20 */	lwz r0, 0x20(r6)
/* 801CB50C 001C850C  41 82 00 0C */	beq lbl_801CB518
/* 801CB510 001C8510  2C 05 00 02 */	cmpwi r5, 2
/* 801CB514 001C8514  40 82 00 38 */	bne lbl_801CB54C
lbl_801CB518:
/* 801CB518 001C8518  2C 00 00 10 */	cmpwi r0, 0x10
/* 801CB51C 001C851C  40 80 00 14 */	bge lbl_801CB530
/* 801CB520 001C8520  54 03 20 36 */	slwi r3, r0, 4
/* 801CB524 001C8524  38 03 00 0F */	addi r0, r3, 0xf
/* 801CB528 001C8528  90 06 00 30 */	stw r0, 0x30(r6)
/* 801CB52C 001C852C  48 00 00 0C */	b lbl_801CB538
lbl_801CB530:
/* 801CB530 001C8530  38 00 00 FF */	li r0, 0xff
/* 801CB534 001C8534  90 06 00 30 */	stw r0, 0x30(r6)
lbl_801CB538:
/* 801CB538 001C8538  2C 04 00 10 */	cmpwi r4, 0x10
/* 801CB53C 001C853C  40 80 00 40 */	bge lbl_801CB57C
/* 801CB540 001C8540  54 80 20 36 */	slwi r0, r4, 4
/* 801CB544 001C8544  90 06 00 30 */	stw r0, 0x30(r6)
/* 801CB548 001C8548  48 00 00 34 */	b lbl_801CB57C
lbl_801CB54C:
/* 801CB54C 001C854C  2C 00 00 04 */	cmpwi r0, 4
/* 801CB550 001C8550  40 80 00 14 */	bge lbl_801CB564
/* 801CB554 001C8554  54 03 30 32 */	slwi r3, r0, 6
/* 801CB558 001C8558  38 03 00 3F */	addi r0, r3, 0x3f
/* 801CB55C 001C855C  90 06 00 30 */	stw r0, 0x30(r6)
/* 801CB560 001C8560  48 00 00 0C */	b lbl_801CB56C
lbl_801CB564:
/* 801CB564 001C8564  38 00 00 FF */	li r0, 0xff
/* 801CB568 001C8568  90 06 00 30 */	stw r0, 0x30(r6)
lbl_801CB56C:
/* 801CB56C 001C856C  2C 04 00 04 */	cmpwi r4, 4
/* 801CB570 001C8570  40 80 00 0C */	bge lbl_801CB57C
/* 801CB574 001C8574  54 80 30 32 */	slwi r0, r4, 6
/* 801CB578 001C8578  90 06 00 30 */	stw r0, 0x30(r6)
lbl_801CB57C:
/* 801CB57C 001C857C  C0 26 00 04 */	lfs f1, 4(r6)
/* 801CB580 001C8580  38 61 00 14 */	addi r3, r1, 0x14
/* 801CB584 001C8584  C0 06 00 10 */	lfs f0, 0x10(r6)
/* 801CB588 001C8588  EC 01 00 2A */	fadds f0, f1, f0
/* 801CB58C 001C858C  D0 06 00 04 */	stfs f0, 4(r6)
/* 801CB590 001C8590  C0 26 00 08 */	lfs f1, 8(r6)
/* 801CB594 001C8594  C0 06 00 14 */	lfs f0, 0x14(r6)
/* 801CB598 001C8598  EC 01 00 2A */	fadds f0, f1, f0
/* 801CB59C 001C859C  D0 06 00 08 */	stfs f0, 8(r6)
/* 801CB5A0 001C85A0  C0 26 00 0C */	lfs f1, 0xc(r6)
/* 801CB5A4 001C85A4  C0 06 00 18 */	lfs f0, 0x18(r6)
/* 801CB5A8 001C85A8  EC 01 00 2A */	fadds f0, f1, f0
/* 801CB5AC 001C85AC  D0 06 00 0C */	stfs f0, 0xc(r6)
/* 801CB5B0 001C85B0  4B E4 51 11 */	bl dispCalcZ
/* 801CB5B4 001C85B4  3C 60 80 1D */	lis r3, effKumokumoChipDisp@ha
/* 801CB5B8 001C85B8  7F E6 FB 78 */	mr r6, r31
/* 801CB5BC 001C85BC  38 A3 B1 F8 */	addi r5, r3, effKumokumoChipDisp@l
/* 801CB5C0 001C85C0  38 80 00 02 */	li r4, 2
/* 801CB5C4 001C85C4  38 60 00 04 */	li r3, 4
/* 801CB5C8 001C85C8  4B E4 54 51 */	bl dispEntry
lbl_801CB5CC:
/* 801CB5CC 001C85CC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801CB5D0 001C85D0  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801CB5D4 001C85D4  7C 08 03 A6 */	mtlr r0
/* 801CB5D8 001C85D8  38 21 00 30 */	addi r1, r1, 0x30
/* 801CB5DC 001C85DC  4E 80 00 20 */	blr 

.global effKumokumoChipN64Entry
effKumokumoChipN64Entry:
/* 801CB5E0 001C85E0  94 21 FF 50 */	stwu r1, -0xb0(r1)
/* 801CB5E4 001C85E4  7C 08 02 A6 */	mflr r0
/* 801CB5E8 001C85E8  90 01 00 B4 */	stw r0, 0xb4(r1)
/* 801CB5EC 001C85EC  DB E1 00 A0 */	stfd f31, 0xa0(r1)
/* 801CB5F0 001C85F0  F3 E1 00 A8 */	psq_st f31, 168(r1), 0, qr0
/* 801CB5F4 001C85F4  DB C1 00 90 */	stfd f30, 0x90(r1)
/* 801CB5F8 001C85F8  F3 C1 00 98 */	psq_st f30, 152(r1), 0, qr0
/* 801CB5FC 001C85FC  DB A1 00 80 */	stfd f29, 0x80(r1)
/* 801CB600 001C8600  F3 A1 00 88 */	psq_st f29, 136(r1), 0, qr0
/* 801CB604 001C8604  DB 81 00 70 */	stfd f28, 0x70(r1)
/* 801CB608 001C8608  F3 81 00 78 */	psq_st f28, 120(r1), 0, qr0
/* 801CB60C 001C860C  DB 61 00 60 */	stfd f27, 0x60(r1)
/* 801CB610 001C8610  F3 61 00 68 */	psq_st f27, 104(r1), 0, qr0
/* 801CB614 001C8614  DB 41 00 50 */	stfd f26, 0x50(r1)
/* 801CB618 001C8618  F3 41 00 58 */	psq_st f26, 88(r1), 0, qr0
/* 801CB61C 001C861C  DB 21 00 40 */	stfd f25, 0x40(r1)
/* 801CB620 001C8620  F3 21 00 48 */	psq_st f25, 72(r1), 0, qr0
/* 801CB624 001C8624  DB 01 00 30 */	stfd f24, 0x30(r1)
/* 801CB628 001C8628  F3 01 00 38 */	psq_st f24, 56(r1), 0, qr0
/* 801CB62C 001C862C  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801CB630 001C8630  93 C1 00 28 */	stw r30, 0x28(r1)
/* 801CB634 001C8634  93 A1 00 24 */	stw r29, 0x24(r1)
/* 801CB638 001C8638  FF 60 08 90 */	fmr f27, f1
/* 801CB63C 001C863C  3C 80 80 30 */	lis r4, lbl_802FAA50@ha
/* 801CB640 001C8640  FF 80 10 90 */	fmr f28, f2
/* 801CB644 001C8644  7C 7D 1B 78 */	mr r29, r3
/* 801CB648 001C8648  FF A0 18 90 */	fmr f29, f3
/* 801CB64C 001C864C  3B E4 AA 50 */	addi r31, r4, lbl_802FAA50@l
/* 801CB650 001C8650  FF 00 20 90 */	fmr f24, f4
/* 801CB654 001C8654  FF 20 28 90 */	fmr f25, f5
/* 801CB658 001C8658  FF 40 30 90 */	fmr f26, f6
/* 801CB65C 001C865C  FF C0 38 90 */	fmr f30, f7
/* 801CB660 001C8660  FF E0 40 90 */	fmr f31, f8
/* 801CB664 001C8664  4B E9 27 59 */	bl effEntry
/* 801CB668 001C8668  38 9F 00 0C */	addi r4, r31, 0xc
/* 801CB66C 001C866C  7C 7E 1B 78 */	mr r30, r3
/* 801CB670 001C8670  90 83 00 14 */	stw r4, 0x14(r3)
/* 801CB674 001C8674  38 00 00 01 */	li r0, 1
/* 801CB678 001C8678  38 60 00 03 */	li r3, 3
/* 801CB67C 001C867C  38 80 00 48 */	li r4, 0x48
/* 801CB680 001C8680  90 1E 00 08 */	stw r0, 8(r30)
/* 801CB684 001C8684  4B E6 44 09 */	bl __memAlloc
/* 801CB688 001C8688  EC 39 E0 28 */	fsubs f1, f25, f28
/* 801CB68C 001C868C  3C 80 80 1D */	lis r4, effKumokumoChipMain@ha
/* 801CB690 001C8690  90 7E 00 0C */	stw r3, 0xc(r30)
/* 801CB694 001C8694  38 04 B4 44 */	addi r0, r4, effKumokumoChipMain@l
/* 801CB698 001C8698  EC 18 D8 28 */	fsubs f0, f24, f27
/* 801CB69C 001C869C  C0 62 E1 EC */	lfs f3, lbl_8041F56C@sda21(r2)
/* 801CB6A0 001C86A0  EC 81 00 72 */	fmuls f4, f1, f1
/* 801CB6A4 001C86A4  90 1E 00 10 */	stw r0, 0x10(r30)
/* 801CB6A8 001C86A8  EC 5A E8 28 */	fsubs f2, f26, f29
/* 801CB6AC 001C86AC  38 00 00 00 */	li r0, 0
/* 801CB6B0 001C86B0  80 9E 00 00 */	lwz r4, 0(r30)
/* 801CB6B4 001C86B4  EC 80 20 3A */	fmadds f4, f0, f0, f4
/* 801CB6B8 001C86B8  60 84 00 02 */	ori r4, r4, 2
/* 801CB6BC 001C86BC  90 9E 00 00 */	stw r4, 0(r30)
/* 801CB6C0 001C86C0  EC E2 20 BA */	fmadds f7, f2, f2, f4
/* 801CB6C4 001C86C4  93 A3 00 00 */	stw r29, 0(r3)
/* 801CB6C8 001C86C8  FC 07 18 00 */	fcmpu cr0, f7, f3
/* 801CB6CC 001C86CC  90 03 00 20 */	stw r0, 0x20(r3)
/* 801CB6D0 001C86D0  41 82 00 E4 */	beq lbl_801CB7B4
/* 801CB6D4 001C86D4  FC 07 18 40 */	fcmpo cr0, f7, f3
/* 801CB6D8 001C86D8  40 81 00 4C */	ble lbl_801CB724
/* 801CB6DC 001C86DC  FC 80 38 34 */	frsqrte f4, f7
/* 801CB6E0 001C86E0  C8 DF 00 20 */	lfd f6, 0x20(r31)
/* 801CB6E4 001C86E4  C8 BF 00 28 */	lfd f5, 0x28(r31)
/* 801CB6E8 001C86E8  FC 64 01 32 */	fmul f3, f4, f4
/* 801CB6EC 001C86EC  FC 86 01 32 */	fmul f4, f6, f4
/* 801CB6F0 001C86F0  FC 67 28 FC */	fnmsub f3, f7, f3, f5
/* 801CB6F4 001C86F4  FC 84 00 F2 */	fmul f4, f4, f3
/* 801CB6F8 001C86F8  FC 64 01 32 */	fmul f3, f4, f4
/* 801CB6FC 001C86FC  FC 86 01 32 */	fmul f4, f6, f4
/* 801CB700 001C8700  FC 67 28 FC */	fnmsub f3, f7, f3, f5
/* 801CB704 001C8704  FC 84 00 F2 */	fmul f4, f4, f3
/* 801CB708 001C8708  FC 64 01 32 */	fmul f3, f4, f4
/* 801CB70C 001C870C  FC 86 01 32 */	fmul f4, f6, f4
/* 801CB710 001C8710  FC 67 28 FC */	fnmsub f3, f7, f3, f5
/* 801CB714 001C8714  FC 64 00 F2 */	fmul f3, f4, f3
/* 801CB718 001C8718  FC 67 00 F2 */	fmul f3, f7, f3
/* 801CB71C 001C871C  FC 60 18 18 */	frsp f3, f3
/* 801CB720 001C8720  48 00 00 90 */	b lbl_801CB7B0
lbl_801CB724:
/* 801CB724 001C8724  C8 7F 00 30 */	lfd f3, 0x30(r31)
/* 801CB728 001C8728  FC 07 18 40 */	fcmpo cr0, f7, f3
/* 801CB72C 001C872C  40 80 00 10 */	bge lbl_801CB73C
/* 801CB730 001C8730  3C 80 80 42 */	lis r4, lbl_804181A8@ha
/* 801CB734 001C8734  C0 64 81 A8 */	lfs f3, lbl_804181A8@l(r4)
/* 801CB738 001C8738  48 00 00 78 */	b lbl_801CB7B0
lbl_801CB73C:
/* 801CB73C 001C873C  D0 E1 00 08 */	stfs f7, 8(r1)
/* 801CB740 001C8740  3C 00 7F 80 */	lis r0, 0x7f80
/* 801CB744 001C8744  80 A1 00 08 */	lwz r5, 8(r1)
/* 801CB748 001C8748  54 A4 00 50 */	rlwinm r4, r5, 0, 1, 8
/* 801CB74C 001C874C  7C 04 00 00 */	cmpw r4, r0
/* 801CB750 001C8750  41 82 00 14 */	beq lbl_801CB764
/* 801CB754 001C8754  40 80 00 40 */	bge lbl_801CB794
/* 801CB758 001C8758  2C 04 00 00 */	cmpwi r4, 0
/* 801CB75C 001C875C  41 82 00 20 */	beq lbl_801CB77C
/* 801CB760 001C8760  48 00 00 34 */	b lbl_801CB794
lbl_801CB764:
/* 801CB764 001C8764  54 A0 02 7F */	clrlwi. r0, r5, 9
/* 801CB768 001C8768  41 82 00 0C */	beq lbl_801CB774
/* 801CB76C 001C876C  38 00 00 01 */	li r0, 1
/* 801CB770 001C8770  48 00 00 28 */	b lbl_801CB798
lbl_801CB774:
/* 801CB774 001C8774  38 00 00 02 */	li r0, 2
/* 801CB778 001C8778  48 00 00 20 */	b lbl_801CB798
lbl_801CB77C:
/* 801CB77C 001C877C  54 A0 02 7F */	clrlwi. r0, r5, 9
/* 801CB780 001C8780  41 82 00 0C */	beq lbl_801CB78C
/* 801CB784 001C8784  38 00 00 05 */	li r0, 5
/* 801CB788 001C8788  48 00 00 10 */	b lbl_801CB798
lbl_801CB78C:
/* 801CB78C 001C878C  38 00 00 03 */	li r0, 3
/* 801CB790 001C8790  48 00 00 08 */	b lbl_801CB798
lbl_801CB794:
/* 801CB794 001C8794  38 00 00 04 */	li r0, 4
lbl_801CB798:
/* 801CB798 001C8798  2C 00 00 01 */	cmpwi r0, 1
/* 801CB79C 001C879C  40 82 00 10 */	bne lbl_801CB7AC
/* 801CB7A0 001C87A0  3C 80 80 42 */	lis r4, lbl_804181A8@ha
/* 801CB7A4 001C87A4  C0 64 81 A8 */	lfs f3, lbl_804181A8@l(r4)
/* 801CB7A8 001C87A8  48 00 00 08 */	b lbl_801CB7B0
lbl_801CB7AC:
/* 801CB7AC 001C87AC  FC 60 38 90 */	fmr f3, f7
lbl_801CB7B0:
/* 801CB7B0 001C87B0  FC E0 18 90 */	fmr f7, f3
lbl_801CB7B4:
/* 801CB7B4 001C87B4  C0 62 E1 EC */	lfs f3, lbl_8041F56C@sda21(r2)
/* 801CB7B8 001C87B8  FC 1E 18 40 */	fcmpo cr0, f30, f3
/* 801CB7BC 001C87BC  40 81 00 18 */	ble lbl_801CB7D4
/* 801CB7C0 001C87C0  EC 67 F0 24 */	fdivs f3, f7, f30
/* 801CB7C4 001C87C4  FC 60 18 1E */	fctiwz f3, f3
/* 801CB7C8 001C87C8  D8 61 00 10 */	stfd f3, 0x10(r1)
/* 801CB7CC 001C87CC  80 A1 00 14 */	lwz r5, 0x14(r1)
/* 801CB7D0 001C87D0  48 00 00 08 */	b lbl_801CB7D8
lbl_801CB7D4:
/* 801CB7D4 001C87D4  38 A0 00 00 */	li r5, 0
lbl_801CB7D8:
/* 801CB7D8 001C87D8  2C 05 00 00 */	cmpwi r5, 0
/* 801CB7DC 001C87DC  41 82 00 44 */	beq lbl_801CB820
/* 801CB7E0 001C87E0  6C A4 80 00 */	xoris r4, r5, 0x8000
/* 801CB7E4 001C87E4  3C 00 43 30 */	lis r0, 0x4330
/* 801CB7E8 001C87E8  90 81 00 14 */	stw r4, 0x14(r1)
/* 801CB7EC 001C87EC  C8 9F 00 38 */	lfd f4, 0x38(r31)
/* 801CB7F0 001C87F0  90 01 00 10 */	stw r0, 0x10(r1)
/* 801CB7F4 001C87F4  C0 A2 E1 F0 */	lfs f5, lbl_8041F570@sda21(r2)
/* 801CB7F8 001C87F8  C8 61 00 10 */	lfd f3, 0x10(r1)
/* 801CB7FC 001C87FC  EC 63 20 28 */	fsubs f3, f3, f4
/* 801CB800 001C8800  EC 85 18 24 */	fdivs f4, f5, f3
/* 801CB804 001C8804  EC 60 01 32 */	fmuls f3, f0, f4
/* 801CB808 001C8808  EC 21 01 32 */	fmuls f1, f1, f4
/* 801CB80C 001C880C  EC 02 01 32 */	fmuls f0, f2, f4
/* 801CB810 001C8810  D0 63 00 10 */	stfs f3, 0x10(r3)
/* 801CB814 001C8814  D0 23 00 14 */	stfs f1, 0x14(r3)
/* 801CB818 001C8818  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 801CB81C 001C881C  48 00 00 14 */	b lbl_801CB830
lbl_801CB820:
/* 801CB820 001C8820  C0 02 E1 EC */	lfs f0, lbl_8041F56C@sda21(r2)
/* 801CB824 001C8824  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 801CB828 001C8828  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 801CB82C 001C882C  D0 03 00 18 */	stfs f0, 0x18(r3)
lbl_801CB830:
/* 801CB830 001C8830  2C 05 00 00 */	cmpwi r5, 0
/* 801CB834 001C8834  40 80 00 10 */	bge lbl_801CB844
/* 801CB838 001C8838  38 00 03 E8 */	li r0, 0x3e8
/* 801CB83C 001C883C  90 03 00 1C */	stw r0, 0x1c(r3)
/* 801CB840 001C8840  48 00 00 08 */	b lbl_801CB848
lbl_801CB844:
/* 801CB844 001C8844  90 A3 00 1C */	stw r5, 0x1c(r3)
lbl_801CB848:
/* 801CB848 001C8848  38 00 00 00 */	li r0, 0
/* 801CB84C 001C884C  2C 1D 00 01 */	cmpwi r29, 1
/* 801CB850 001C8850  90 03 00 30 */	stw r0, 0x30(r3)
/* 801CB854 001C8854  D3 63 00 04 */	stfs f27, 4(r3)
/* 801CB858 001C8858  D3 83 00 08 */	stfs f28, 8(r3)
/* 801CB85C 001C885C  D3 A3 00 0C */	stfs f29, 0xc(r3)
/* 801CB860 001C8860  D3 E3 00 44 */	stfs f31, 0x44(r3)
/* 801CB864 001C8864  41 82 00 50 */	beq lbl_801CB8B4
/* 801CB868 001C8868  40 80 00 10 */	bge lbl_801CB878
/* 801CB86C 001C886C  2C 1D 00 00 */	cmpwi r29, 0
/* 801CB870 001C8870  40 80 00 10 */	bge lbl_801CB880
/* 801CB874 001C8874  48 00 00 40 */	b lbl_801CB8B4
lbl_801CB878:
/* 801CB878 001C8878  2C 1D 00 03 */	cmpwi r29, 3
/* 801CB87C 001C887C  40 80 00 38 */	bge lbl_801CB8B4
lbl_801CB880:
/* 801CB880 001C8880  38 E0 00 D7 */	li r7, 0xd7
/* 801CB884 001C8884  38 C0 00 B9 */	li r6, 0xb9
/* 801CB888 001C8888  90 E3 00 24 */	stw r7, 0x24(r3)
/* 801CB88C 001C888C  38 A0 00 C8 */	li r5, 0xc8
/* 801CB890 001C8890  38 80 00 64 */	li r4, 0x64
/* 801CB894 001C8894  38 00 00 FF */	li r0, 0xff
/* 801CB898 001C8898  90 E3 00 28 */	stw r7, 0x28(r3)
/* 801CB89C 001C889C  90 C3 00 2C */	stw r6, 0x2c(r3)
/* 801CB8A0 001C88A0  90 E3 00 34 */	stw r7, 0x34(r3)
/* 801CB8A4 001C88A4  90 A3 00 38 */	stw r5, 0x38(r3)
/* 801CB8A8 001C88A8  90 83 00 3C */	stw r4, 0x3c(r3)
/* 801CB8AC 001C88AC  90 03 00 40 */	stw r0, 0x40(r3)
/* 801CB8B0 001C88B0  48 00 00 2C */	b lbl_801CB8DC
lbl_801CB8B4:
/* 801CB8B4 001C88B4  38 A0 00 FF */	li r5, 0xff
/* 801CB8B8 001C88B8  38 80 00 DC */	li r4, 0xdc
/* 801CB8BC 001C88BC  90 A3 00 24 */	stw r5, 0x24(r3)
/* 801CB8C0 001C88C0  38 00 00 F5 */	li r0, 0xf5
/* 801CB8C4 001C88C4  90 A3 00 28 */	stw r5, 0x28(r3)
/* 801CB8C8 001C88C8  90 A3 00 2C */	stw r5, 0x2c(r3)
/* 801CB8CC 001C88CC  90 83 00 34 */	stw r4, 0x34(r3)
/* 801CB8D0 001C88D0  90 03 00 38 */	stw r0, 0x38(r3)
/* 801CB8D4 001C88D4  90 A3 00 3C */	stw r5, 0x3c(r3)
/* 801CB8D8 001C88D8  90 A3 00 40 */	stw r5, 0x40(r3)
lbl_801CB8DC:
/* 801CB8DC 001C88DC  7F C3 F3 78 */	mr r3, r30
/* 801CB8E0 001C88E0  E3 E1 00 A8 */	psq_l f31, 168(r1), 0, qr0
/* 801CB8E4 001C88E4  CB E1 00 A0 */	lfd f31, 0xa0(r1)
/* 801CB8E8 001C88E8  E3 C1 00 98 */	psq_l f30, 152(r1), 0, qr0
/* 801CB8EC 001C88EC  CB C1 00 90 */	lfd f30, 0x90(r1)
/* 801CB8F0 001C88F0  E3 A1 00 88 */	psq_l f29, 136(r1), 0, qr0
/* 801CB8F4 001C88F4  CB A1 00 80 */	lfd f29, 0x80(r1)
/* 801CB8F8 001C88F8  E3 81 00 78 */	psq_l f28, 120(r1), 0, qr0
/* 801CB8FC 001C88FC  CB 81 00 70 */	lfd f28, 0x70(r1)
/* 801CB900 001C8900  E3 61 00 68 */	psq_l f27, 104(r1), 0, qr0
/* 801CB904 001C8904  CB 61 00 60 */	lfd f27, 0x60(r1)
/* 801CB908 001C8908  E3 41 00 58 */	psq_l f26, 88(r1), 0, qr0
/* 801CB90C 001C890C  CB 41 00 50 */	lfd f26, 0x50(r1)
/* 801CB910 001C8910  E3 21 00 48 */	psq_l f25, 72(r1), 0, qr0
/* 801CB914 001C8914  CB 21 00 40 */	lfd f25, 0x40(r1)
/* 801CB918 001C8918  E3 01 00 38 */	psq_l f24, 56(r1), 0, qr0
/* 801CB91C 001C891C  CB 01 00 30 */	lfd f24, 0x30(r1)
/* 801CB920 001C8920  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801CB924 001C8924  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 801CB928 001C8928  80 01 00 B4 */	lwz r0, 0xb4(r1)
/* 801CB92C 001C892C  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 801CB930 001C8930  7C 08 03 A6 */	mtlr r0
/* 801CB934 001C8934  38 21 00 B0 */	addi r1, r1, 0xb0
/* 801CB938 001C8938  4E 80 00 20 */	blr 
