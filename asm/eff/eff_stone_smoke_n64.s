.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effStoneSmokeDisp
effStoneSmokeDisp:
/* 801E800C 001E500C  94 21 FF 40 */	stwu r1, -0xc0(r1)
/* 801E8010 001E5010  7C 08 02 A6 */	mflr r0
/* 801E8014 001E5014  90 01 00 C4 */	stw r0, 0xc4(r1)
/* 801E8018 001E5018  DB E1 00 B0 */	stfd f31, 0xb0(r1)
/* 801E801C 001E501C  F3 E1 00 B8 */	psq_st f31, 184(r1), 0, qr0
/* 801E8020 001E5020  93 E1 00 AC */	stw r31, 0xac(r1)
/* 801E8024 001E5024  93 C1 00 A8 */	stw r30, 0xa8(r1)
/* 801E8028 001E5028  93 A1 00 A4 */	stw r29, 0xa4(r1)
/* 801E802C 001E502C  7C 9D 23 78 */	mr r29, r4
/* 801E8030 001E5030  4B E2 71 21 */	bl camGetPtr
/* 801E8034 001E5034  83 DD 00 0C */	lwz r30, 0xc(r29)
/* 801E8038 001E5038  7C 7F 1B 78 */	mr r31, r3
/* 801E803C 001E503C  38 61 00 68 */	addi r3, r1, 0x68
/* 801E8040 001E5040  C0 3E 00 34 */	lfs f1, 0x34(r30)
/* 801E8044 001E5044  C0 1E 00 38 */	lfs f0, 0x38(r30)
/* 801E8048 001E5048  83 BE 00 24 */	lwz r29, 0x24(r30)
/* 801E804C 001E504C  EF E1 00 32 */	fmuls f31, f1, f0
/* 801E8050 001E5050  C0 3E 00 04 */	lfs f1, 4(r30)
/* 801E8054 001E5054  C0 5E 00 08 */	lfs f2, 8(r30)
/* 801E8058 001E5058  C0 7E 00 0C */	lfs f3, 0xc(r30)
/* 801E805C 001E505C  48 0B 03 D1 */	bl PSMTXTrans
/* 801E8060 001E5060  FC 20 F8 90 */	fmr f1, f31
/* 801E8064 001E5064  38 61 00 38 */	addi r3, r1, 0x38
/* 801E8068 001E5068  FC 40 F8 90 */	fmr f2, f31
/* 801E806C 001E506C  FC 60 F8 90 */	fmr f3, f31
/* 801E8070 001E5070  48 0B 04 3D */	bl PSMTXScale
/* 801E8074 001E5074  38 61 00 68 */	addi r3, r1, 0x68
/* 801E8078 001E5078  38 81 00 38 */	addi r4, r1, 0x38
/* 801E807C 001E507C  7C 65 1B 78 */	mr r5, r3
/* 801E8080 001E5080  48 0A FE E1 */	bl PSMTXConcat
/* 801E8084 001E5084  38 81 00 68 */	addi r4, r1, 0x68
/* 801E8088 001E5088  38 7F 01 1C */	addi r3, r31, 0x11c
/* 801E808C 001E508C  7C 85 23 78 */	mr r5, r4
/* 801E8090 001E5090  48 0A FE D1 */	bl PSMTXConcat
/* 801E8094 001E5094  38 61 00 68 */	addi r3, r1, 0x68
/* 801E8098 001E5098  38 80 00 00 */	li r4, 0
/* 801E809C 001E509C  48 0C C4 5D */	bl GXLoadPosMtxImm
/* 801E80A0 001E50A0  38 60 00 00 */	li r3, 0
/* 801E80A4 001E50A4  48 0C C4 F5 */	bl GXSetCurrentMtx
/* 801E80A8 001E50A8  80 02 1F 08 */	lwz r0, lbl_80423288@sda21(r2)
/* 801E80AC 001E50AC  38 81 00 14 */	addi r4, r1, 0x14
/* 801E80B0 001E50B0  80 DE 00 18 */	lwz r6, 0x18(r30)
/* 801E80B4 001E50B4  38 60 00 01 */	li r3, 1
/* 801E80B8 001E50B8  90 01 00 10 */	stw r0, 0x10(r1)
/* 801E80BC 001E50BC  80 BE 00 1C */	lwz r5, 0x1c(r30)
/* 801E80C0 001E50C0  80 1E 00 20 */	lwz r0, 0x20(r30)
/* 801E80C4 001E50C4  98 C1 00 10 */	stb r6, 0x10(r1)
/* 801E80C8 001E50C8  98 A1 00 11 */	stb r5, 0x11(r1)
/* 801E80CC 001E50CC  98 01 00 12 */	stb r0, 0x12(r1)
/* 801E80D0 001E50D0  9B A1 00 13 */	stb r29, 0x13(r1)
/* 801E80D4 001E50D4  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801E80D8 001E50D8  90 01 00 14 */	stw r0, 0x14(r1)
/* 801E80DC 001E50DC  48 0C AB D9 */	bl GXSetTevColor
/* 801E80E0 001E50E0  80 02 1F 0C */	lwz r0, lbl_8042328C@sda21(r2)
/* 801E80E4 001E50E4  38 81 00 0C */	addi r4, r1, 0xc
/* 801E80E8 001E50E8  80 DE 00 28 */	lwz r6, 0x28(r30)
/* 801E80EC 001E50EC  38 60 00 02 */	li r3, 2
/* 801E80F0 001E50F0  90 01 00 08 */	stw r0, 8(r1)
/* 801E80F4 001E50F4  80 BE 00 2C */	lwz r5, 0x2c(r30)
/* 801E80F8 001E50F8  80 1E 00 30 */	lwz r0, 0x30(r30)
/* 801E80FC 001E50FC  98 C1 00 08 */	stb r6, 8(r1)
/* 801E8100 001E5100  98 A1 00 09 */	stb r5, 9(r1)
/* 801E8104 001E5104  98 01 00 0A */	stb r0, 0xa(r1)
/* 801E8108 001E5108  80 01 00 08 */	lwz r0, 8(r1)
/* 801E810C 001E510C  90 01 00 0C */	stw r0, 0xc(r1)
/* 801E8110 001E5110  48 0C AB A5 */	bl GXSetTevColor
/* 801E8114 001E5114  38 60 00 00 */	li r3, 0
/* 801E8118 001E5118  48 0C 90 21 */	bl GXSetNumChans
/* 801E811C 001E511C  38 60 00 01 */	li r3, 1
/* 801E8120 001E5120  48 0C 71 61 */	bl GXSetNumTexGens
/* 801E8124 001E5124  38 60 00 00 */	li r3, 0
/* 801E8128 001E5128  38 80 00 01 */	li r4, 1
/* 801E812C 001E512C  38 A0 00 04 */	li r5, 4
/* 801E8130 001E5130  38 C0 00 1E */	li r6, 0x1e
/* 801E8134 001E5134  38 E0 00 00 */	li r7, 0
/* 801E8138 001E5138  39 00 00 7D */	li r8, 0x7d
/* 801E813C 001E513C  48 0C 6E C5 */	bl GXSetTexCoordGen2
/* 801E8140 001E5140  C0 22 EB D0 */	lfs f1, lbl_8041FF50@sda21(r2)
/* 801E8144 001E5144  38 61 00 38 */	addi r3, r1, 0x38
/* 801E8148 001E5148  C0 62 EB D4 */	lfs f3, lbl_8041FF54@sda21(r2)
/* 801E814C 001E514C  FC 40 08 90 */	fmr f2, f1
/* 801E8150 001E5150  48 0B 03 5D */	bl PSMTXScale
/* 801E8154 001E5154  38 61 00 38 */	addi r3, r1, 0x38
/* 801E8158 001E5158  38 80 00 1E */	li r4, 0x1e
/* 801E815C 001E515C  38 A0 00 01 */	li r5, 1
/* 801E8160 001E5160  48 0C C4 6D */	bl GXLoadTexMtxImm
/* 801E8164 001E5164  38 60 00 01 */	li r3, 1
/* 801E8168 001E5168  48 0C B0 61 */	bl GXSetNumTevStages
/* 801E816C 001E516C  38 60 00 00 */	li r3, 0
/* 801E8170 001E5170  38 80 00 00 */	li r4, 0
/* 801E8174 001E5174  38 A0 00 00 */	li r5, 0
/* 801E8178 001E5178  38 C0 00 FF */	li r6, 0xff
/* 801E817C 001E517C  48 0C AE B1 */	bl GXSetTevOrder
/* 801E8180 001E5180  38 60 00 00 */	li r3, 0
/* 801E8184 001E5184  38 80 00 00 */	li r4, 0
/* 801E8188 001E5188  38 A0 00 00 */	li r5, 0
/* 801E818C 001E518C  38 C0 00 00 */	li r6, 0
/* 801E8190 001E5190  38 E0 00 01 */	li r7, 1
/* 801E8194 001E5194  39 00 00 00 */	li r8, 0
/* 801E8198 001E5198  48 0C AA 4D */	bl GXSetTevColorOp
/* 801E819C 001E519C  38 60 00 00 */	li r3, 0
/* 801E81A0 001E51A0  38 80 00 00 */	li r4, 0
/* 801E81A4 001E51A4  38 A0 00 00 */	li r5, 0
/* 801E81A8 001E51A8  38 C0 00 00 */	li r6, 0
/* 801E81AC 001E51AC  38 E0 00 01 */	li r7, 1
/* 801E81B0 001E51B0  39 00 00 00 */	li r8, 0
/* 801E81B4 001E51B4  48 0C AA 99 */	bl GXSetTevAlphaOp
/* 801E81B8 001E51B8  38 60 00 00 */	li r3, 0
/* 801E81BC 001E51BC  38 80 00 04 */	li r4, 4
/* 801E81C0 001E51C0  38 A0 00 02 */	li r5, 2
/* 801E81C4 001E51C4  38 C0 00 08 */	li r6, 8
/* 801E81C8 001E51C8  38 E0 00 0F */	li r7, 0xf
/* 801E81CC 001E51CC  48 0C A9 91 */	bl GXSetTevColorIn
/* 801E81D0 001E51D0  38 60 00 00 */	li r3, 0
/* 801E81D4 001E51D4  38 80 00 07 */	li r4, 7
/* 801E81D8 001E51D8  38 A0 00 01 */	li r5, 1
/* 801E81DC 001E51DC  38 C0 00 04 */	li r6, 4
/* 801E81E0 001E51E0  38 E0 00 07 */	li r7, 7
/* 801E81E4 001E51E4  48 0C A9 BD */	bl GXSetTevAlphaIn
/* 801E81E8 001E51E8  38 81 00 18 */	addi r4, r1, 0x18
/* 801E81EC 001E51EC  38 60 00 5C */	li r3, 0x5c
/* 801E81F0 001E51F0  4B FE 96 55 */	bl effGetTexObjN64
/* 801E81F4 001E51F4  38 61 00 18 */	addi r3, r1, 0x18
/* 801E81F8 001E51F8  38 80 00 00 */	li r4, 0
/* 801E81FC 001E51FC  48 0C 98 81 */	bl GXLoadTexObj
/* 801E8200 001E5200  38 60 00 00 */	li r3, 0
/* 801E8204 001E5204  48 0C 7C 85 */	bl GXSetCullMode
/* 801E8208 001E5208  3C 60 80 3A */	lis r3, lbl_803A6408@ha
/* 801E820C 001E520C  38 63 64 08 */	addi r3, r3, lbl_803A6408@l
/* 801E8210 001E5210  4B FE 94 A1 */	bl effSetVtxDescN64
/* 801E8214 001E5214  38 60 00 90 */	li r3, 0x90
/* 801E8218 001E5218  38 80 00 00 */	li r4, 0
/* 801E821C 001E521C  38 A0 00 06 */	li r5, 6
/* 801E8220 001E5220  48 0C 7A 49 */	bl GXBegin
/* 801E8224 001E5224  38 60 00 00 */	li r3, 0
/* 801E8228 001E5228  38 80 00 01 */	li r4, 1
/* 801E822C 001E522C  38 A0 00 02 */	li r5, 2
/* 801E8230 001E5230  38 C0 00 00 */	li r6, 0
/* 801E8234 001E5234  38 E0 00 00 */	li r7, 0
/* 801E8238 001E5238  39 00 00 02 */	li r8, 2
/* 801E823C 001E523C  39 20 00 03 */	li r9, 3
/* 801E8240 001E5240  39 40 00 00 */	li r10, 0
/* 801E8244 001E5244  4B FE 93 F1 */	bl tri2
/* 801E8248 001E5248  E3 E1 00 B8 */	psq_l f31, 184(r1), 0, qr0
/* 801E824C 001E524C  80 01 00 C4 */	lwz r0, 0xc4(r1)
/* 801E8250 001E5250  CB E1 00 B0 */	lfd f31, 0xb0(r1)
/* 801E8254 001E5254  83 E1 00 AC */	lwz r31, 0xac(r1)
/* 801E8258 001E5258  83 C1 00 A8 */	lwz r30, 0xa8(r1)
/* 801E825C 001E525C  83 A1 00 A4 */	lwz r29, 0xa4(r1)
/* 801E8260 001E5260  7C 08 03 A6 */	mtlr r0
/* 801E8264 001E5264  38 21 00 C0 */	addi r1, r1, 0xc0
/* 801E8268 001E5268  4E 80 00 20 */	blr 
effStoneSmokeMain:
/* 801E826C 001E526C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 801E8270 001E5270  7C 08 02 A6 */	mflr r0
/* 801E8274 001E5274  3C 80 80 30 */	lis r4, lbl_802FB7A0@ha
/* 801E8278 001E5278  90 01 00 34 */	stw r0, 0x34(r1)
/* 801E827C 001E527C  38 C4 B7 A0 */	addi r6, r4, lbl_802FB7A0@l
/* 801E8280 001E5280  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 801E8284 001E5284  7C 7F 1B 78 */	mr r31, r3
/* 801E8288 001E5288  80 63 00 0C */	lwz r3, 0xc(r3)
/* 801E828C 001E528C  80 A6 00 00 */	lwz r5, 0(r6)
/* 801E8290 001E5290  80 86 00 04 */	lwz r4, 4(r6)
/* 801E8294 001E5294  80 06 00 08 */	lwz r0, 8(r6)
/* 801E8298 001E5298  90 A1 00 08 */	stw r5, 8(r1)
/* 801E829C 001E529C  C0 03 00 04 */	lfs f0, 4(r3)
/* 801E82A0 001E52A0  90 81 00 0C */	stw r4, 0xc(r1)
/* 801E82A4 001E52A4  C0 23 00 08 */	lfs f1, 8(r3)
/* 801E82A8 001E52A8  D0 01 00 08 */	stfs f0, 8(r1)
/* 801E82AC 001E52AC  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 801E82B0 001E52B0  90 01 00 10 */	stw r0, 0x10(r1)
/* 801E82B4 001E52B4  80 A1 00 08 */	lwz r5, 8(r1)
/* 801E82B8 001E52B8  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801E82BC 001E52BC  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801E82C0 001E52C0  80 81 00 0C */	lwz r4, 0xc(r1)
/* 801E82C4 001E52C4  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801E82C8 001E52C8  90 A1 00 14 */	stw r5, 0x14(r1)
/* 801E82CC 001E52CC  90 81 00 18 */	stw r4, 0x18(r1)
/* 801E82D0 001E52D0  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801E82D4 001E52D4  80 9F 00 00 */	lwz r4, 0(r31)
/* 801E82D8 001E52D8  54 80 07 7B */	rlwinm. r0, r4, 0, 0x1d, 0x1d
/* 801E82DC 001E52DC  41 82 00 14 */	beq .L_801E82F0
/* 801E82E0 001E52E0  54 84 07 B8 */	rlwinm r4, r4, 0, 0x1e, 0x1c
/* 801E82E4 001E52E4  38 00 00 10 */	li r0, 0x10
/* 801E82E8 001E52E8  90 9F 00 00 */	stw r4, 0(r31)
/* 801E82EC 001E52EC  90 03 00 10 */	stw r0, 0x10(r3)
.L_801E82F0:
/* 801E82F0 001E52F0  80 83 00 10 */	lwz r4, 0x10(r3)
/* 801E82F4 001E52F4  2C 04 03 E8 */	cmpwi r4, 0x3e8
/* 801E82F8 001E52F8  40 80 00 0C */	bge .L_801E8304
/* 801E82FC 001E52FC  38 04 FF FF */	addi r0, r4, -1
/* 801E8300 001E5300  90 03 00 10 */	stw r0, 0x10(r3)
.L_801E8304:
/* 801E8304 001E5304  80 83 00 14 */	lwz r4, 0x14(r3)
/* 801E8308 001E5308  38 04 00 01 */	addi r0, r4, 1
/* 801E830C 001E530C  90 03 00 14 */	stw r0, 0x14(r3)
/* 801E8310 001E5310  80 03 00 10 */	lwz r0, 0x10(r3)
/* 801E8314 001E5314  2C 00 00 00 */	cmpwi r0, 0
/* 801E8318 001E5318  40 80 00 10 */	bge .L_801E8328
/* 801E831C 001E531C  7F E3 FB 78 */	mr r3, r31
/* 801E8320 001E5320  4B E7 58 65 */	bl effDelete
/* 801E8324 001E5324  48 00 00 DC */	b .L_801E8400
.L_801E8328:
/* 801E8328 001E5328  2C 00 00 10 */	cmpwi r0, 0x10
/* 801E832C 001E532C  80 C3 00 14 */	lwz r6, 0x14(r3)
/* 801E8330 001E5330  40 80 00 0C */	bge .L_801E833C
/* 801E8334 001E5334  54 00 20 36 */	slwi r0, r0, 4
/* 801E8338 001E5338  90 03 00 24 */	stw r0, 0x24(r3)
.L_801E833C:
/* 801E833C 001E533C  C0 23 00 08 */	lfs f1, 8(r3)
/* 801E8340 001E5340  2C 06 00 07 */	cmpwi r6, 7
/* 801E8344 001E5344  C0 02 EB D8 */	lfs f0, lbl_8041FF58@sda21(r2)
/* 801E8348 001E5348  EC 01 00 2A */	fadds f0, f1, f0
/* 801E834C 001E534C  D0 03 00 08 */	stfs f0, 8(r3)
/* 801E8350 001E5350  40 80 00 38 */	bge .L_801E8388
/* 801E8354 001E5354  38 8D CB A8 */	addi r4, r13, lbl_80413E08@sda21
/* 801E8358 001E5358  3C 00 43 30 */	lis r0, 0x4330
/* 801E835C 001E535C  7C A4 30 AE */	lbzx r5, r4, r6
/* 801E8360 001E5360  3C 80 80 30 */	lis r4, lbl_802FB7B0@ha
/* 801E8364 001E5364  90 01 00 20 */	stw r0, 0x20(r1)
/* 801E8368 001E5368  C8 24 B7 B0 */	lfd f1, lbl_802FB7B0@l(r4)
/* 801E836C 001E536C  90 A1 00 24 */	stw r5, 0x24(r1)
/* 801E8370 001E5370  C0 42 EB DC */	lfs f2, lbl_8041FF5C@sda21(r2)
/* 801E8374 001E5374  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801E8378 001E5378  EC 00 08 28 */	fsubs f0, f0, f1
/* 801E837C 001E537C  EC 02 00 32 */	fmuls f0, f2, f0
/* 801E8380 001E5380  D0 03 00 38 */	stfs f0, 0x38(r3)
/* 801E8384 001E5384  48 00 00 5C */	b .L_801E83E0
.L_801E8388:
/* 801E8388 001E5388  3C A0 92 49 */	lis r5, 0x92492493@ha
/* 801E838C 001E538C  38 E6 FF F9 */	addi r7, r6, -7
/* 801E8390 001E5390  38 C5 24 93 */	addi r6, r5, 0x92492493@l
/* 801E8394 001E5394  3C 00 43 30 */	lis r0, 0x4330
/* 801E8398 001E5398  7C C6 38 96 */	mulhw r6, r6, r7
/* 801E839C 001E539C  90 01 00 20 */	stw r0, 0x20(r1)
/* 801E83A0 001E53A0  3C 80 80 30 */	lis r4, lbl_802FB7B0@ha
/* 801E83A4 001E53A4  C0 42 EB DC */	lfs f2, lbl_8041FF5C@sda21(r2)
/* 801E83A8 001E53A8  C8 24 B7 B0 */	lfd f1, lbl_802FB7B0@l(r4)
/* 801E83AC 001E53AC  38 AD CB B0 */	addi r5, r13, lbl_80413E10@sda21
/* 801E83B0 001E53B0  7C 06 3A 14 */	add r0, r6, r7
/* 801E83B4 001E53B4  7C 00 16 70 */	srawi r0, r0, 2
/* 801E83B8 001E53B8  54 04 0F FE */	srwi r4, r0, 0x1f
/* 801E83BC 001E53BC  7C 00 22 14 */	add r0, r0, r4
/* 801E83C0 001E53C0  1C 00 00 07 */	mulli r0, r0, 7
/* 801E83C4 001E53C4  7C 00 38 50 */	subf r0, r0, r7
/* 801E83C8 001E53C8  7C 05 00 AE */	lbzx r0, r5, r0
/* 801E83CC 001E53CC  90 01 00 24 */	stw r0, 0x24(r1)
/* 801E83D0 001E53D0  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 801E83D4 001E53D4  EC 00 08 28 */	fsubs f0, f0, f1
/* 801E83D8 001E53D8  EC 02 00 32 */	fmuls f0, f2, f0
/* 801E83DC 001E53DC  D0 03 00 38 */	stfs f0, 0x38(r3)
.L_801E83E0:
/* 801E83E0 001E53E0  38 61 00 14 */	addi r3, r1, 0x14
/* 801E83E4 001E53E4  4B E2 82 DD */	bl dispCalcZ
/* 801E83E8 001E53E8  3C 60 80 1F */	lis r3, effStoneSmokeDisp@ha
/* 801E83EC 001E53EC  7F E6 FB 78 */	mr r6, r31
/* 801E83F0 001E53F0  38 A3 80 0C */	addi r5, r3, effStoneSmokeDisp@l
/* 801E83F4 001E53F4  38 80 00 02 */	li r4, 2
/* 801E83F8 001E53F8  38 60 00 04 */	li r3, 4
/* 801E83FC 001E53FC  4B E2 86 1D */	bl dispEntry
.L_801E8400:
/* 801E8400 001E5400  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801E8404 001E5404  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 801E8408 001E5408  7C 08 03 A6 */	mtlr r0
/* 801E840C 001E540C  38 21 00 30 */	addi r1, r1, 0x30
/* 801E8410 001E5410  4E 80 00 20 */	blr 

.global effStoneSmokeN64Entry
effStoneSmokeN64Entry:
/* 801E8414 001E5414  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 801E8418 001E5418  7C 08 02 A6 */	mflr r0
/* 801E841C 001E541C  90 01 00 44 */	stw r0, 0x44(r1)
/* 801E8420 001E5420  39 61 00 40 */	addi r11, r1, 0x40
/* 801E8424 001E5424  48 07 65 21 */	bl _savefpr_28
/* 801E8428 001E5428  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801E842C 001E542C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801E8430 001E5430  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801E8434 001E5434  FF 80 08 90 */	fmr f28, f1
/* 801E8438 001E5438  7C 7D 1B 78 */	mr r29, r3
/* 801E843C 001E543C  FF A0 10 90 */	fmr f29, f2
/* 801E8440 001E5440  7C 9E 23 78 */	mr r30, r4
/* 801E8444 001E5444  FF C0 18 90 */	fmr f30, f3
/* 801E8448 001E5448  FF E0 20 90 */	fmr f31, f4
/* 801E844C 001E544C  4B E7 59 71 */	bl effEntry
/* 801E8450 001E5450  3C 80 80 30 */	lis r4, lbl_802FB7B8@ha
/* 801E8454 001E5454  7C 7F 1B 78 */	mr r31, r3
/* 801E8458 001E5458  38 84 B7 B8 */	addi r4, r4, lbl_802FB7B8@l
/* 801E845C 001E545C  38 00 00 01 */	li r0, 1
/* 801E8460 001E5460  90 9F 00 14 */	stw r4, 0x14(r31)
/* 801E8464 001E5464  38 60 00 03 */	li r3, 3
/* 801E8468 001E5468  38 80 00 3C */	li r4, 0x3c
/* 801E846C 001E546C  90 1F 00 08 */	stw r0, 8(r31)
/* 801E8470 001E5470  4B E4 76 1D */	bl __memAlloc
/* 801E8474 001E5474  3C 80 80 1F */	lis r4, effStoneSmokeMain@ha
/* 801E8478 001E5478  90 7F 00 0C */	stw r3, 0xc(r31)
/* 801E847C 001E547C  38 04 82 6C */	addi r0, r4, effStoneSmokeMain@l
/* 801E8480 001E5480  2C 1E 00 00 */	cmpwi r30, 0
/* 801E8484 001E5484  90 1F 00 10 */	stw r0, 0x10(r31)
/* 801E8488 001E5488  38 00 00 00 */	li r0, 0
/* 801E848C 001E548C  80 9F 00 00 */	lwz r4, 0(r31)
/* 801E8490 001E5490  60 84 00 02 */	ori r4, r4, 2
/* 801E8494 001E5494  90 9F 00 00 */	stw r4, 0(r31)
/* 801E8498 001E5498  93 A3 00 00 */	stw r29, 0(r3)
/* 801E849C 001E549C  90 03 00 14 */	stw r0, 0x14(r3)
/* 801E84A0 001E54A0  41 81 00 10 */	bgt .L_801E84B0
/* 801E84A4 001E54A4  38 00 03 E8 */	li r0, 0x3e8
/* 801E84A8 001E54A8  90 03 00 10 */	stw r0, 0x10(r3)
/* 801E84AC 001E54AC  48 00 00 08 */	b .L_801E84B4
.L_801E84B0:
/* 801E84B0 001E54B0  93 C3 00 10 */	stw r30, 0x10(r3)
.L_801E84B4:
/* 801E84B4 001E54B4  38 A0 00 FF */	li r5, 0xff
/* 801E84B8 001E54B8  38 80 00 0A */	li r4, 0xa
/* 801E84BC 001E54BC  90 A3 00 24 */	stw r5, 0x24(r3)
/* 801E84C0 001E54C0  38 00 00 78 */	li r0, 0x78
/* 801E84C4 001E54C4  D3 83 00 04 */	stfs f28, 4(r3)
/* 801E84C8 001E54C8  D3 A3 00 08 */	stfs f29, 8(r3)
/* 801E84CC 001E54CC  D3 C3 00 0C */	stfs f30, 0xc(r3)
/* 801E84D0 001E54D0  D3 E3 00 34 */	stfs f31, 0x34(r3)
/* 801E84D4 001E54D4  90 A3 00 18 */	stw r5, 0x18(r3)
/* 801E84D8 001E54D8  90 A3 00 1C */	stw r5, 0x1c(r3)
/* 801E84DC 001E54DC  90 A3 00 20 */	stw r5, 0x20(r3)
/* 801E84E0 001E54E0  90 83 00 28 */	stw r4, 0x28(r3)
/* 801E84E4 001E54E4  90 83 00 2C */	stw r4, 0x2c(r3)
/* 801E84E8 001E54E8  90 03 00 30 */	stw r0, 0x30(r3)
/* 801E84EC 001E54EC  7F E3 FB 78 */	mr r3, r31
/* 801E84F0 001E54F0  39 61 00 40 */	addi r11, r1, 0x40
/* 801E84F4 001E54F4  48 07 64 9D */	bl _restfpr_28
/* 801E84F8 001E54F8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 801E84FC 001E54FC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801E8500 001E5500  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801E8504 001E5504  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801E8508 001E5508  7C 08 03 A6 */	mtlr r0
/* 801E850C 001E550C  38 21 00 40 */	addi r1, r1, 0x40
/* 801E8510 001E5510  4E 80 00 20 */	blr 
