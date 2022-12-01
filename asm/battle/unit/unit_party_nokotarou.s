.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global _check_guard_koura
_check_guard_koura:
/* 80183040 00180040  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80183044 00180044  7C 08 02 A6 */	mflr r0
/* 80183048 00180048  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018304C 0018004C  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80183050 00180050  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80183054 00180054  93 A1 00 14 */	stw r29, 0x14(r1)
/* 80183058 00180058  7C 7D 1B 78 */	mr r29, r3
/* 8018305C 0018005C  83 C3 00 18 */	lwz r30, 0x18(r3)
/* 80183060 00180060  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 80183064 00180064  80 9E 00 00 */	lwz r4, 0(r30)
/* 80183068 00180068  4B EA DB 65 */	bl evtGetValue
/* 8018306C 0018006C  83 DE 00 04 */	lwz r30, 4(r30)
/* 80183070 00180070  7C 64 1B 78 */	mr r4, r3
/* 80183074 00180074  7F A3 EB 78 */	mr r3, r29
/* 80183078 00180078  4B F9 CE B5 */	bl BattleTransID
/* 8018307C 0018007C  7C 64 1B 78 */	mr r4, r3
/* 80183080 00180080  7F E3 FB 78 */	mr r3, r31
/* 80183084 00180084  4B F7 08 F5 */	bl BattleGetUnitPtr
/* 80183088 00180088  80 03 01 04 */	lwz r0, 0x104(r3)
/* 8018308C 0018008C  54 00 06 B5 */	rlwinm. r0, r0, 0, 0x1a, 0x1a
/* 80183090 00180090  40 82 00 1C */	bne lbl_801830AC
/* 80183094 00180094  7F A3 EB 78 */	mr r3, r29
/* 80183098 00180098  7F C4 F3 78 */	mr r4, r30
/* 8018309C 0018009C  38 A0 FF FF */	li r5, -1
/* 801830A0 001800A0  4B EA D5 C9 */	bl evtSetValue
/* 801830A4 001800A4  38 60 00 02 */	li r3, 2
/* 801830A8 001800A8  48 00 00 3C */	b lbl_801830E4
lbl_801830AC:
/* 801830AC 001800AC  4B F9 E2 61 */	bl BtlUnit_GetGuardKouraPtr
/* 801830B0 001800B0  28 03 00 00 */	cmplwi r3, 0
/* 801830B4 001800B4  40 82 00 1C */	bne lbl_801830D0
/* 801830B8 001800B8  7F A3 EB 78 */	mr r3, r29
/* 801830BC 001800BC  7F C4 F3 78 */	mr r4, r30
/* 801830C0 001800C0  38 A0 FF FF */	li r5, -1
/* 801830C4 001800C4  4B EA D5 A5 */	bl evtSetValue
/* 801830C8 001800C8  38 60 00 02 */	li r3, 2
/* 801830CC 001800CC  48 00 00 18 */	b lbl_801830E4
lbl_801830D0:
/* 801830D0 001800D0  80 A3 00 00 */	lwz r5, 0(r3)
/* 801830D4 001800D4  7F A3 EB 78 */	mr r3, r29
/* 801830D8 001800D8  7F C4 F3 78 */	mr r4, r30
/* 801830DC 001800DC  4B EA D5 8D */	bl evtSetValue
/* 801830E0 001800E0  38 60 00 02 */	li r3, 2
lbl_801830E4:
/* 801830E4 001800E4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801830E8 001800E8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801830EC 001800EC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801830F0 001800F0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 801830F4 001800F4  7C 08 03 A6 */	mtlr r0
/* 801830F8 001800F8  38 21 00 20 */	addi r1, r1, 0x20
/* 801830FC 001800FC  4E 80 00 20 */	blr 

.global _tsuranuki_effect_control
_tsuranuki_effect_control:
/* 80183100 00180100  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80183104 00180104  7C 08 02 A6 */	mflr r0
/* 80183108 00180108  90 01 00 34 */	stw r0, 0x34(r1)
/* 8018310C 0018010C  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80183110 00180110  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80183114 00180114  7C 7E 1B 78 */	mr r30, r3
/* 80183118 00180118  93 A1 00 24 */	stw r29, 0x24(r1)
/* 8018311C 0018011C  93 81 00 20 */	stw r28, 0x20(r1)
/* 80183120 00180120  7C 9C 23 78 */	mr r28, r4
/* 80183124 00180124  80 83 00 18 */	lwz r4, 0x18(r3)
/* 80183128 00180128  80 84 00 00 */	lwz r4, 0(r4)
/* 8018312C 0018012C  4B EA DA A1 */	bl evtGetValue
/* 80183130 00180130  83 ED 17 10 */	lwz r31, lbl_80418970@sda21(r13)
/* 80183134 00180134  7C 64 1B 78 */	mr r4, r3
/* 80183138 00180138  7F C3 F3 78 */	mr r3, r30
/* 8018313C 0018013C  4B F9 CD F1 */	bl BattleTransID
/* 80183140 00180140  7C 64 1B 78 */	mr r4, r3
/* 80183144 00180144  7F E3 FB 78 */	mr r3, r31
/* 80183148 00180148  4B F7 08 31 */	bl BattleGetUnitPtr
/* 8018314C 0018014C  38 A1 00 0C */	addi r5, r1, 0xc
/* 80183150 00180150  38 C1 00 10 */	addi r6, r1, 0x10
/* 80183154 00180154  38 81 00 08 */	addi r4, r1, 8
/* 80183158 00180158  7C 7D 1B 78 */	mr r29, r3
/* 8018315C 0018015C  4B FA 06 3D */	bl func_80123798
/* 80183160 00180160  7F A3 EB 78 */	mr r3, r29
/* 80183164 00180164  38 80 00 01 */	li r4, 1
/* 80183168 00180168  4B FA 06 8D */	bl BtlUnit_GetPartsPtr
/* 8018316C 0018016C  2C 1C 00 00 */	cmpwi r28, 0
/* 80183170 00180170  7C 7F 1B 78 */	mr r31, r3
/* 80183174 00180174  41 82 00 34 */	beq lbl_801831A8
/* 80183178 00180178  C0 21 00 08 */	lfs f1, 8(r1)
/* 8018317C 0018017C  38 60 00 00 */	li r3, 0
/* 80183180 00180180  C0 41 00 0C */	lfs f2, 0xc(r1)
/* 80183184 00180184  38 80 03 E8 */	li r4, 0x3e8
/* 80183188 00180188  C0 61 00 10 */	lfs f3, 0x10(r1)
/* 8018318C 0018018C  C0 9D 01 14 */	lfs f4, 0x114(r29)
/* 80183190 00180190  48 0D 10 35 */	bl effNokotarouEntry
/* 80183194 00180194  90 7E 00 78 */	stw r3, 0x78(r30)
/* 80183198 00180198  38 00 00 00 */	li r0, 0
/* 8018319C 0018019C  90 1F 01 38 */	stw r0, 0x138(r31)
/* 801831A0 001801A0  90 1F 01 34 */	stw r0, 0x134(r31)
/* 801831A4 001801A4  90 1E 00 7C */	stw r0, 0x7c(r30)
lbl_801831A8:
/* 801831A8 001801A8  80 1F 01 34 */	lwz r0, 0x134(r31)
/* 801831AC 001801AC  80 7E 00 7C */	lwz r3, 0x7c(r30)
/* 801831B0 001801B0  1C 80 00 64 */	mulli r4, r0, 0x64
/* 801831B4 001801B4  7C 03 20 00 */	cmpw r3, r4
/* 801831B8 001801B8  41 82 00 3C */	beq lbl_801831F4
/* 801831BC 001801BC  40 80 00 20 */	bge lbl_801831DC
/* 801831C0 001801C0  38 03 00 0A */	addi r0, r3, 0xa
/* 801831C4 001801C4  90 1E 00 7C */	stw r0, 0x7c(r30)
/* 801831C8 001801C8  80 1E 00 7C */	lwz r0, 0x7c(r30)
/* 801831CC 001801CC  7C 00 20 00 */	cmpw r0, r4
/* 801831D0 001801D0  40 81 00 24 */	ble lbl_801831F4
/* 801831D4 001801D4  90 9E 00 7C */	stw r4, 0x7c(r30)
/* 801831D8 001801D8  48 00 00 1C */	b lbl_801831F4
lbl_801831DC:
/* 801831DC 001801DC  38 03 FF F6 */	addi r0, r3, -10
/* 801831E0 001801E0  90 1E 00 7C */	stw r0, 0x7c(r30)
/* 801831E4 001801E4  80 1E 00 7C */	lwz r0, 0x7c(r30)
/* 801831E8 001801E8  7C 00 20 00 */	cmpw r0, r4
/* 801831EC 001801EC  40 80 00 08 */	bge lbl_801831F4
/* 801831F0 001801F0  90 9E 00 7C */	stw r4, 0x7c(r30)
lbl_801831F4:
/* 801831F4 001801F4  80 BE 00 7C */	lwz r5, 0x7c(r30)
/* 801831F8 001801F8  3C 00 43 30 */	lis r0, 0x4330
/* 801831FC 001801FC  80 7E 00 78 */	lwz r3, 0x78(r30)
/* 80183200 00180200  3C 80 80 30 */	lis r4, lbl_802F8800@ha
/* 80183204 00180204  6C A5 80 00 */	xoris r5, r5, 0x8000
/* 80183208 00180208  C0 3D 01 14 */	lfs f1, 0x114(r29)
/* 8018320C 0018020C  C0 01 00 08 */	lfs f0, 8(r1)
/* 80183210 00180210  38 C4 88 00 */	addi r6, r4, lbl_802F8800@l
/* 80183214 00180214  80 83 00 0C */	lwz r4, 0xc(r3)
/* 80183218 00180218  90 A1 00 1C */	stw r5, 0x1c(r1)
/* 8018321C 0018021C  C8 66 00 00 */	lfd f3, 0(r6)
/* 80183220 00180220  D0 04 00 10 */	stfs f0, 0x10(r4)
/* 80183224 00180224  C0 82 CC BC */	lfs f4, lbl_8041E03C@sda21(r2)
/* 80183228 00180228  90 01 00 18 */	stw r0, 0x18(r1)
/* 8018322C 0018022C  C0 01 00 0C */	lfs f0, 0xc(r1)
/* 80183230 00180230  C8 41 00 18 */	lfd f2, 0x18(r1)
/* 80183234 00180234  80 83 00 0C */	lwz r4, 0xc(r3)
/* 80183238 00180238  EC 62 18 28 */	fsubs f3, f2, f3
/* 8018323C 0018023C  C0 42 CC B8 */	lfs f2, lbl_8041E038@sda21(r2)
/* 80183240 00180240  D0 04 00 14 */	stfs f0, 0x14(r4)
/* 80183244 00180244  EC 44 10 FA */	fmadds f2, f4, f3, f2
/* 80183248 00180248  C0 01 00 10 */	lfs f0, 0x10(r1)
/* 8018324C 0018024C  80 83 00 0C */	lwz r4, 0xc(r3)
/* 80183250 00180250  D0 04 00 18 */	stfs f0, 0x18(r4)
/* 80183254 00180254  EC 42 00 72 */	fmuls f2, f2, f1
/* 80183258 00180258  80 83 00 0C */	lwz r4, 0xc(r3)
/* 8018325C 0018025C  D0 44 00 1C */	stfs f2, 0x1c(r4)
/* 80183260 00180260  80 1F 01 38 */	lwz r0, 0x138(r31)
/* 80183264 00180264  2C 00 00 00 */	cmpwi r0, 0
/* 80183268 00180268  41 82 00 18 */	beq lbl_80183280
/* 8018326C 0018026C  38 00 00 00 */	li r0, 0
/* 80183270 00180270  90 1F 01 38 */	stw r0, 0x138(r31)
/* 80183274 00180274  4B ED A8 A1 */	bl effSoftDelete
/* 80183278 00180278  38 60 00 02 */	li r3, 2
/* 8018327C 0018027C  48 00 00 08 */	b lbl_80183284
lbl_80183280:
/* 80183280 00180280  38 60 00 00 */	li r3, 0
lbl_80183284:
/* 80183284 00180284  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80183288 00180288  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 8018328C 0018028C  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80183290 00180290  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 80183294 00180294  83 81 00 20 */	lwz r28, 0x20(r1)
/* 80183298 00180298  7C 08 03 A6 */	mtlr r0
/* 8018329C 0018029C  38 21 00 30 */	addi r1, r1, 0x30
/* 801832A0 001802A0  4E 80 00 20 */	blr 

.global _color_lv_set
_color_lv_set:
/* 801832A4 001802A4  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801832A8 001802A8  7C 08 02 A6 */	mflr r0
/* 801832AC 001802AC  90 01 00 24 */	stw r0, 0x24(r1)
/* 801832B0 001802B0  BF 41 00 08 */	stmw r26, 8(r1)
/* 801832B4 001802B4  7C 7A 1B 78 */	mr r26, r3
/* 801832B8 001802B8  83 C3 00 18 */	lwz r30, 0x18(r3)
/* 801832BC 001802BC  83 AD 17 10 */	lwz r29, lbl_80418970@sda21(r13)
/* 801832C0 001802C0  80 9E 00 00 */	lwz r4, 0(r30)
/* 801832C4 001802C4  4B EA D9 09 */	bl evtGetValue
/* 801832C8 001802C8  80 9E 00 04 */	lwz r4, 4(r30)
/* 801832CC 001802CC  7C 7C 1B 78 */	mr r28, r3
/* 801832D0 001802D0  7F 43 D3 78 */	mr r3, r26
/* 801832D4 001802D4  4B EA D8 F9 */	bl evtGetValue
/* 801832D8 001802D8  83 7E 00 08 */	lwz r27, 8(r30)
/* 801832DC 001802DC  7C 7E 1B 78 */	mr r30, r3
/* 801832E0 001802E0  7F 43 D3 78 */	mr r3, r26
/* 801832E4 001802E4  7F 64 DB 78 */	mr r4, r27
/* 801832E8 001802E8  4B EA D8 E5 */	bl evtGetValue
/* 801832EC 001802EC  7C 7F 1B 78 */	mr r31, r3
/* 801832F0 001802F0  7F 43 D3 78 */	mr r3, r26
/* 801832F4 001802F4  7F 84 E3 78 */	mr r4, r28
/* 801832F8 001802F8  4B F9 CC 35 */	bl BattleTransID
/* 801832FC 001802FC  7C 64 1B 78 */	mr r4, r3
/* 80183300 00180300  7F A3 EB 78 */	mr r3, r29
/* 80183304 00180304  4B F7 06 75 */	bl BattleGetUnitPtr
/* 80183308 00180308  2C 1E 00 00 */	cmpwi r30, 0
/* 8018330C 0018030C  41 82 00 0C */	beq lbl_80183318
/* 80183310 00180310  9B E3 03 0D */	stb r31, 0x30d(r3)
/* 80183314 00180314  48 00 00 14 */	b lbl_80183328
lbl_80183318:
/* 80183318 00180318  88 A3 03 0D */	lbz r5, 0x30d(r3)
/* 8018331C 0018031C  7F 43 D3 78 */	mr r3, r26
/* 80183320 00180320  7F 64 DB 78 */	mr r4, r27
/* 80183324 00180324  4B EA D3 45 */	bl evtSetValue
lbl_80183328:
/* 80183328 00180328  BB 41 00 08 */	lmw r26, 8(r1)
/* 8018332C 0018032C  38 60 00 02 */	li r3, 2
/* 80183330 00180330  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80183334 00180334  7C 08 03 A6 */	mtlr r0
/* 80183338 00180338  38 21 00 20 */	addi r1, r1, 0x20
/* 8018333C 0018033C  4E 80 00 20 */	blr 

.global _check_mario_move_count
_check_mario_move_count:
/* 80183340 00180340  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80183344 00180344  7C 08 02 A6 */	mflr r0
/* 80183348 00180348  90 01 00 14 */	stw r0, 0x14(r1)
/* 8018334C 0018034C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80183350 00180350  93 C1 00 08 */	stw r30, 8(r1)
/* 80183354 00180354  7C 7E 1B 78 */	mr r30, r3
/* 80183358 00180358  80 9E 00 18 */	lwz r4, 0x18(r30)
/* 8018335C 0018035C  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 80183360 00180360  83 E4 00 00 */	lwz r31, 0(r4)
/* 80183364 00180364  4B F7 04 F1 */	bl BattleGetMarioPtr
/* 80183368 00180368  7C 64 1B 78 */	mr r4, r3
/* 8018336C 0018036C  7F C3 F3 78 */	mr r3, r30
/* 80183370 00180370  88 A4 00 22 */	lbz r5, 0x22(r4)
/* 80183374 00180374  7F E4 FB 78 */	mr r4, r31
/* 80183378 00180378  7C A5 07 74 */	extsb r5, r5
/* 8018337C 0018037C  4B EA D2 ED */	bl evtSetValue
/* 80183380 00180380  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80183384 00180384  38 60 00 02 */	li r3, 2
/* 80183388 00180388  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8018338C 0018038C  83 C1 00 08 */	lwz r30, 8(r1)
/* 80183390 00180390  7C 08 03 A6 */	mtlr r0
/* 80183394 00180394  38 21 00 10 */	addi r1, r1, 0x10
/* 80183398 00180398  4E 80 00 20 */	blr 

.global __makeTechMenuFunc_8018339c
__makeTechMenuFunc_8018339c:
/* 8018339C 0018039C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 801833A0 001803A0  7C 08 02 A6 */	mflr r0
/* 801833A4 001803A4  3C A0 80 39 */	lis r5, lbl_8038BEB8@ha
/* 801833A8 001803A8  90 01 00 24 */	stw r0, 0x24(r1)
/* 801833AC 001803AC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 801833B0 001803B0  93 C1 00 18 */	stw r30, 0x18(r1)
/* 801833B4 001803B4  3B C5 BE B8 */	addi r30, r5, lbl_8038BEB8@l
/* 801833B8 001803B8  93 A1 00 14 */	stw r29, 0x14(r1)
/* 801833BC 001803BC  7C 9D 23 78 */	mr r29, r4
/* 801833C0 001803C0  93 81 00 10 */	stw r28, 0x10(r1)
/* 801833C4 001803C4  7C 7C 1B 78 */	mr r28, r3
/* 801833C8 001803C8  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 801833CC 001803CC  4B F7 04 09 */	bl BattleGetPartyPtr
/* 801833D0 001803D0  80 63 00 08 */	lwz r3, 8(r3)
/* 801833D4 001803D4  4B F7 01 1D */	bl BattleTransPartyId
/* 801833D8 001803D8  4B FB 84 91 */	bl partyGetTechLv
/* 801833DC 001803DC  80 1D 00 00 */	lwz r0, 0(r29)
/* 801833E0 001803E0  38 E0 FF FF */	li r7, -1
/* 801833E4 001803E4  38 C0 00 00 */	li r6, 0
/* 801833E8 001803E8  38 BE 08 44 */	addi r5, r30, 0x844
/* 801833EC 001803EC  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801833F0 001803F0  38 80 01 50 */	li r4, 0x150
/* 801833F4 001803F4  7C 7F 1B 78 */	mr r31, r3
/* 801833F8 001803F8  7C 7C 02 14 */	add r3, r28, r0
/* 801833FC 001803FC  90 E3 00 90 */	stw r7, 0x90(r3)
/* 80183400 00180400  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183404 00180404  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183408 00180408  7C 7C 02 14 */	add r3, r28, r0
/* 8018340C 0018040C  90 C3 00 94 */	stw r6, 0x94(r3)
/* 80183410 00180410  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183414 00180414  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183418 00180418  7C 7C 02 14 */	add r3, r28, r0
/* 8018341C 0018041C  90 A3 00 80 */	stw r5, 0x80(r3)
/* 80183420 00180420  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183424 00180424  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183428 00180428  7C 7C 02 14 */	add r3, r28, r0
/* 8018342C 0018042C  90 C3 00 84 */	stw r6, 0x84(r3)
/* 80183430 00180430  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183434 00180434  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183438 00180438  7C 7C 02 14 */	add r3, r28, r0
/* 8018343C 0018043C  B0 83 00 8C */	sth r4, 0x8c(r3)
/* 80183440 00180440  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183444 00180444  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183448 00180448  7C 7C 02 14 */	add r3, r28, r0
/* 8018344C 0018044C  80 63 00 80 */	lwz r3, 0x80(r3)
/* 80183450 00180450  80 63 00 00 */	lwz r3, 0(r3)
/* 80183454 00180454  4B EF DB 75 */	bl msgSearch
/* 80183458 00180458  80 1D 00 00 */	lwz r0, 0(r29)
/* 8018345C 0018045C  2C 1F 00 00 */	cmpwi r31, 0
/* 80183460 00180460  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183464 00180464  7C 9C 02 14 */	add r4, r28, r0
/* 80183468 00180468  90 64 00 88 */	stw r3, 0x88(r4)
/* 8018346C 0018046C  80 7D 00 00 */	lwz r3, 0(r29)
/* 80183470 00180470  38 03 00 01 */	addi r0, r3, 1
/* 80183474 00180474  90 1D 00 00 */	stw r0, 0(r29)
/* 80183478 00180478  41 80 00 98 */	blt lbl_80183510
/* 8018347C 0018047C  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183480 00180480  38 E0 FF FF */	li r7, -1
/* 80183484 00180484  38 C0 00 00 */	li r6, 0
/* 80183488 00180488  38 BE 09 04 */	addi r5, r30, 0x904
/* 8018348C 0018048C  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183490 00180490  38 80 01 51 */	li r4, 0x151
/* 80183494 00180494  7C 7C 02 14 */	add r3, r28, r0
/* 80183498 00180498  90 E3 00 90 */	stw r7, 0x90(r3)
/* 8018349C 0018049C  80 1D 00 00 */	lwz r0, 0(r29)
/* 801834A0 001804A0  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801834A4 001804A4  7C 7C 02 14 */	add r3, r28, r0
/* 801834A8 001804A8  90 C3 00 94 */	stw r6, 0x94(r3)
/* 801834AC 001804AC  80 1D 00 00 */	lwz r0, 0(r29)
/* 801834B0 001804B0  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801834B4 001804B4  7C 7C 02 14 */	add r3, r28, r0
/* 801834B8 001804B8  90 A3 00 80 */	stw r5, 0x80(r3)
/* 801834BC 001804BC  80 1D 00 00 */	lwz r0, 0(r29)
/* 801834C0 001804C0  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801834C4 001804C4  7C 7C 02 14 */	add r3, r28, r0
/* 801834C8 001804C8  90 C3 00 84 */	stw r6, 0x84(r3)
/* 801834CC 001804CC  80 1D 00 00 */	lwz r0, 0(r29)
/* 801834D0 001804D0  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801834D4 001804D4  7C 7C 02 14 */	add r3, r28, r0
/* 801834D8 001804D8  B0 83 00 8C */	sth r4, 0x8c(r3)
/* 801834DC 001804DC  80 1D 00 00 */	lwz r0, 0(r29)
/* 801834E0 001804E0  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801834E4 001804E4  7C 7C 02 14 */	add r3, r28, r0
/* 801834E8 001804E8  80 63 00 80 */	lwz r3, 0x80(r3)
/* 801834EC 001804EC  80 63 00 00 */	lwz r3, 0(r3)
/* 801834F0 001804F0  4B EF DA D9 */	bl msgSearch
/* 801834F4 001804F4  80 1D 00 00 */	lwz r0, 0(r29)
/* 801834F8 001804F8  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801834FC 001804FC  7C 9C 02 14 */	add r4, r28, r0
/* 80183500 00180500  90 64 00 88 */	stw r3, 0x88(r4)
/* 80183504 00180504  80 7D 00 00 */	lwz r3, 0(r29)
/* 80183508 00180508  38 03 00 01 */	addi r0, r3, 1
/* 8018350C 0018050C  90 1D 00 00 */	stw r0, 0(r29)
lbl_80183510:
/* 80183510 00180510  2C 1F 00 01 */	cmpwi r31, 1
/* 80183514 00180514  41 80 00 9C */	blt lbl_801835B0
/* 80183518 00180518  80 1D 00 00 */	lwz r0, 0(r29)
/* 8018351C 0018051C  38 C0 FF FF */	li r6, -1
/* 80183520 00180520  38 A0 00 00 */	li r5, 0
/* 80183524 00180524  38 9E 09 C4 */	addi r4, r30, 0x9c4
/* 80183528 00180528  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018352C 0018052C  7C 7C 02 14 */	add r3, r28, r0
/* 80183530 00180530  90 C3 00 90 */	stw r6, 0x90(r3)
/* 80183534 00180534  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183538 00180538  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018353C 0018053C  7C 7C 02 14 */	add r3, r28, r0
/* 80183540 00180540  90 A3 00 94 */	stw r5, 0x94(r3)
/* 80183544 00180544  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183548 00180548  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018354C 0018054C  7C 7C 02 14 */	add r3, r28, r0
/* 80183550 00180550  90 83 00 80 */	stw r4, 0x80(r3)
/* 80183554 00180554  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183558 00180558  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018355C 0018055C  7C 7C 02 14 */	add r3, r28, r0
/* 80183560 00180560  90 A3 00 84 */	stw r5, 0x84(r3)
/* 80183564 00180564  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183568 00180568  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018356C 0018056C  7C 9C 02 14 */	add r4, r28, r0
/* 80183570 00180570  80 64 00 80 */	lwz r3, 0x80(r4)
/* 80183574 00180574  A0 03 00 04 */	lhz r0, 4(r3)
/* 80183578 00180578  B0 04 00 8C */	sth r0, 0x8c(r4)
/* 8018357C 0018057C  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183580 00180580  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183584 00180584  7C 7C 02 14 */	add r3, r28, r0
/* 80183588 00180588  80 63 00 80 */	lwz r3, 0x80(r3)
/* 8018358C 0018058C  80 63 00 00 */	lwz r3, 0(r3)
/* 80183590 00180590  4B EF DA 39 */	bl msgSearch
/* 80183594 00180594  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183598 00180598  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018359C 0018059C  7C 9C 02 14 */	add r4, r28, r0
/* 801835A0 001805A0  90 64 00 88 */	stw r3, 0x88(r4)
/* 801835A4 001805A4  80 7D 00 00 */	lwz r3, 0(r29)
/* 801835A8 001805A8  38 03 00 01 */	addi r0, r3, 1
/* 801835AC 001805AC  90 1D 00 00 */	stw r0, 0(r29)
lbl_801835B0:
/* 801835B0 001805B0  2C 1F 00 02 */	cmpwi r31, 2
/* 801835B4 001805B4  41 80 00 9C */	blt lbl_80183650
/* 801835B8 001805B8  80 1D 00 00 */	lwz r0, 0(r29)
/* 801835BC 001805BC  38 C0 FF FF */	li r6, -1
/* 801835C0 001805C0  38 A0 00 00 */	li r5, 0
/* 801835C4 001805C4  38 9E 0A 84 */	addi r4, r30, 0xa84
/* 801835C8 001805C8  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801835CC 001805CC  7C 7C 02 14 */	add r3, r28, r0
/* 801835D0 001805D0  90 C3 00 90 */	stw r6, 0x90(r3)
/* 801835D4 001805D4  80 1D 00 00 */	lwz r0, 0(r29)
/* 801835D8 001805D8  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801835DC 001805DC  7C 7C 02 14 */	add r3, r28, r0
/* 801835E0 001805E0  90 A3 00 94 */	stw r5, 0x94(r3)
/* 801835E4 001805E4  80 1D 00 00 */	lwz r0, 0(r29)
/* 801835E8 001805E8  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801835EC 001805EC  7C 7C 02 14 */	add r3, r28, r0
/* 801835F0 001805F0  90 83 00 80 */	stw r4, 0x80(r3)
/* 801835F4 001805F4  80 1D 00 00 */	lwz r0, 0(r29)
/* 801835F8 001805F8  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 801835FC 001805FC  7C 7C 02 14 */	add r3, r28, r0
/* 80183600 00180600  90 A3 00 84 */	stw r5, 0x84(r3)
/* 80183604 00180604  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183608 00180608  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018360C 0018060C  7C 9C 02 14 */	add r4, r28, r0
/* 80183610 00180610  80 64 00 80 */	lwz r3, 0x80(r4)
/* 80183614 00180614  A0 03 00 04 */	lhz r0, 4(r3)
/* 80183618 00180618  B0 04 00 8C */	sth r0, 0x8c(r4)
/* 8018361C 0018061C  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183620 00180620  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 80183624 00180624  7C 7C 02 14 */	add r3, r28, r0
/* 80183628 00180628  80 63 00 80 */	lwz r3, 0x80(r3)
/* 8018362C 0018062C  80 63 00 00 */	lwz r3, 0(r3)
/* 80183630 00180630  4B EF D9 99 */	bl msgSearch
/* 80183634 00180634  80 1D 00 00 */	lwz r0, 0(r29)
/* 80183638 00180638  1C 00 00 1C */	mulli r0, r0, 0x1c
/* 8018363C 0018063C  7C 9C 02 14 */	add r4, r28, r0
/* 80183640 00180640  90 64 00 88 */	stw r3, 0x88(r4)
/* 80183644 00180644  80 7D 00 00 */	lwz r3, 0(r29)
/* 80183648 00180648  38 03 00 01 */	addi r0, r3, 1
/* 8018364C 0018064C  90 1D 00 00 */	stw r0, 0(r29)
lbl_80183650:
/* 80183650 00180650  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80183654 00180654  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80183658 00180658  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8018365C 0018065C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80183660 00180660  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80183664 00180664  7C 08 03 A6 */	mtlr r0
/* 80183668 00180668  38 21 00 20 */	addi r1, r1, 0x20
/* 8018366C 0018066C  4E 80 00 20 */	blr 
