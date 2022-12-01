.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global partyGetTechLv
partyGetTechLv:
/* 8013B868 00138868  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013B86C 0013886C  7C 08 02 A6 */	mflr r0
/* 8013B870 00138870  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013B874 00138874  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013B878 00138878  7C 7F 1B 78 */	mr r31, r3
/* 8013B87C 0013887C  2C 1F 00 08 */	cmpwi r31, 8
/* 8013B880 00138880  38 60 00 00 */	li r3, 0
/* 8013B884 00138884  40 80 00 14 */	bge .L_8013B898
/* 8013B888 00138888  4B F9 63 ED */	bl func_800D1C74
/* 8013B88C 0013888C  1C 9F 00 0E */	mulli r4, r31, 0xe
/* 8013B890 00138890  38 04 00 0C */	addi r0, r4, 0xc
/* 8013B894 00138894  7C 63 02 AE */	lhax r3, r3, r0
.L_8013B898:
/* 8013B898 00138898  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013B89C 0013889C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013B8A0 001388A0  7C 08 03 A6 */	mtlr r0
/* 8013B8A4 001388A4  38 21 00 10 */	addi r1, r1, 0x10
/* 8013B8A8 001388A8  4E 80 00 20 */	blr 

.global partyGetHp
partyGetHp:
/* 8013B8AC 001388AC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013B8B0 001388B0  7C 08 02 A6 */	mflr r0
/* 8013B8B4 001388B4  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013B8B8 001388B8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013B8BC 001388BC  7C 7F 1B 78 */	mr r31, r3
/* 8013B8C0 001388C0  2C 1F 00 08 */	cmpwi r31, 8
/* 8013B8C4 001388C4  38 60 00 00 */	li r3, 0
/* 8013B8C8 001388C8  40 80 00 14 */	bge .L_8013B8DC
/* 8013B8CC 001388CC  4B F9 63 A9 */	bl func_800D1C74
/* 8013B8D0 001388D0  1C 9F 00 0E */	mulli r4, r31, 0xe
/* 8013B8D4 001388D4  38 04 00 06 */	addi r0, r4, 6
/* 8013B8D8 001388D8  7C 63 02 AE */	lhax r3, r3, r0
.L_8013B8DC:
/* 8013B8DC 001388DC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013B8E0 001388E0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013B8E4 001388E4  7C 08 03 A6 */	mtlr r0
/* 8013B8E8 001388E8  38 21 00 10 */	addi r1, r1, 0x10
/* 8013B8EC 001388EC  4E 80 00 20 */	blr 

.global partyChkJoin
partyChkJoin:
/* 8013B8F0 001388F0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013B8F4 001388F4  7C 08 02 A6 */	mflr r0
/* 8013B8F8 001388F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013B8FC 001388FC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013B900 00138900  7C 7F 1B 78 */	mr r31, r3
/* 8013B904 00138904  2C 1F 00 08 */	cmpwi r31, 8
/* 8013B908 00138908  38 60 00 00 */	li r3, 0
/* 8013B90C 0013890C  40 80 00 18 */	bge .L_8013B924
/* 8013B910 00138910  4B F9 63 65 */	bl func_800D1C74
/* 8013B914 00138914  1C 1F 00 0E */	mulli r0, r31, 0xe
/* 8013B918 00138918  7C 03 02 2E */	lhzx r0, r3, r0
/* 8013B91C 0013891C  54 00 07 FE */	clrlwi r0, r0, 0x1f
/* 8013B920 00138920  7C 03 03 78 */	mr r3, r0
.L_8013B924:
/* 8013B924 00138924  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013B928 00138928  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013B92C 0013892C  7C 08 03 A6 */	mtlr r0
/* 8013B930 00138930  38 21 00 10 */	addi r1, r1, 0x10
/* 8013B934 00138934  4E 80 00 20 */	blr 

.global partyLeft
partyLeft:
/* 8013B938 00138938  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013B93C 0013893C  7C 08 02 A6 */	mflr r0
/* 8013B940 00138940  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013B944 00138944  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013B948 00138948  7C 7F 1B 78 */	mr r31, r3
/* 8013B94C 0013894C  2C 1F 00 08 */	cmpwi r31, 8
/* 8013B950 00138950  40 80 00 18 */	bge .L_8013B968
/* 8013B954 00138954  4B F9 63 21 */	bl func_800D1C74
/* 8013B958 00138958  1C 9F 00 0E */	mulli r4, r31, 0xe
/* 8013B95C 0013895C  7C 03 22 2E */	lhzx r0, r3, r4
/* 8013B960 00138960  54 00 04 3C */	rlwinm r0, r0, 0, 0x10, 0x1e
/* 8013B964 00138964  7C 03 23 2E */	sthx r0, r3, r4
.L_8013B968:
/* 8013B968 00138968  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013B96C 0013896C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013B970 00138970  7C 08 03 A6 */	mtlr r0
/* 8013B974 00138974  38 21 00 10 */	addi r1, r1, 0x10
/* 8013B978 00138978  4E 80 00 20 */	blr 

.global partyJoin
partyJoin:
/* 8013B97C 0013897C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013B980 00138980  7C 08 02 A6 */	mflr r0
/* 8013B984 00138984  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013B988 00138988  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013B98C 0013898C  7C 7F 1B 78 */	mr r31, r3
/* 8013B990 00138990  2C 1F 00 08 */	cmpwi r31, 8
/* 8013B994 00138994  40 80 00 18 */	bge .L_8013B9AC
/* 8013B998 00138998  4B F9 62 DD */	bl func_800D1C74
/* 8013B99C 0013899C  1C 9F 00 0E */	mulli r4, r31, 0xe
/* 8013B9A0 001389A0  7C 03 22 2E */	lhzx r0, r3, r4
/* 8013B9A4 001389A4  60 00 00 01 */	ori r0, r0, 1
/* 8013B9A8 001389A8  7C 03 23 2E */	sthx r0, r3, r4
.L_8013B9AC:
/* 8013B9AC 001389AC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013B9B0 001389B0  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013B9B4 001389B4  7C 08 03 A6 */	mtlr r0
/* 8013B9B8 001389B8  38 21 00 10 */	addi r1, r1, 0x10
/* 8013B9BC 001389BC  4E 80 00 20 */	blr 

.global marioGetExtraPartyId
marioGetExtraPartyId:
/* 8013B9C0 001389C0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013B9C4 001389C4  7C 08 02 A6 */	mflr r0
/* 8013B9C8 001389C8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013B9CC 001389CC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013B9D0 001389D0  93 C1 00 08 */	stw r30, 8(r1)
/* 8013B9D4 001389D4  4B F2 18 41 */	bl marioGetPtr
/* 8013B9D8 001389D8  7C 7F 1B 78 */	mr r31, r3
/* 8013B9DC 001389DC  8B C3 02 41 */	lbz r30, 0x241(r3)
/* 8013B9E0 001389E0  7F DE 07 75 */	extsb. r30, r30
/* 8013B9E4 001389E4  41 80 00 28 */	blt .L_8013BA0C
/* 8013B9E8 001389E8  7F C3 F3 78 */	mr r3, r30
/* 8013B9EC 001389EC  4B F8 14 45 */	bl partyGetPtr
/* 8013B9F0 001389F0  28 03 00 00 */	cmplwi r3, 0
/* 8013B9F4 001389F4  41 82 00 18 */	beq .L_8013BA0C
/* 8013B9F8 001389F8  80 03 00 00 */	lwz r0, 0(r3)
/* 8013B9FC 001389FC  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BA00 00138A00  41 82 00 0C */	beq .L_8013BA0C
/* 8013BA04 00138A04  7F C3 F3 78 */	mr r3, r30
/* 8013BA08 00138A08  48 00 00 38 */	b .L_8013BA40
.L_8013BA0C:
/* 8013BA0C 00138A0C  8B FF 02 42 */	lbz r31, 0x242(r31)
/* 8013BA10 00138A10  7F FF 07 75 */	extsb. r31, r31
/* 8013BA14 00138A14  41 80 00 28 */	blt .L_8013BA3C
/* 8013BA18 00138A18  7F E3 FB 78 */	mr r3, r31
/* 8013BA1C 00138A1C  4B F8 14 15 */	bl partyGetPtr
/* 8013BA20 00138A20  28 03 00 00 */	cmplwi r3, 0
/* 8013BA24 00138A24  41 82 00 18 */	beq .L_8013BA3C
/* 8013BA28 00138A28  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BA2C 00138A2C  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BA30 00138A30  41 82 00 0C */	beq .L_8013BA3C
/* 8013BA34 00138A34  7F E3 FB 78 */	mr r3, r31
/* 8013BA38 00138A38  48 00 00 08 */	b .L_8013BA40
.L_8013BA3C:
/* 8013BA3C 00138A3C  38 60 FF FF */	li r3, -1
.L_8013BA40:
/* 8013BA40 00138A40  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013BA44 00138A44  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013BA48 00138A48  83 C1 00 08 */	lwz r30, 8(r1)
/* 8013BA4C 00138A4C  7C 08 03 A6 */	mtlr r0
/* 8013BA50 00138A50  38 21 00 10 */	addi r1, r1, 0x10
/* 8013BA54 00138A54  4E 80 00 20 */	blr 

.global marioGetPartyId
marioGetPartyId:
/* 8013BA58 00138A58  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013BA5C 00138A5C  7C 08 02 A6 */	mflr r0
/* 8013BA60 00138A60  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013BA64 00138A64  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013BA68 00138A68  93 C1 00 08 */	stw r30, 8(r1)
/* 8013BA6C 00138A6C  4B F2 17 A9 */	bl marioGetPtr
/* 8013BA70 00138A70  7C 7F 1B 78 */	mr r31, r3
/* 8013BA74 00138A74  8B C3 02 41 */	lbz r30, 0x241(r3)
/* 8013BA78 00138A78  7F DE 07 75 */	extsb. r30, r30
/* 8013BA7C 00138A7C  41 80 00 28 */	blt .L_8013BAA4
/* 8013BA80 00138A80  7F C3 F3 78 */	mr r3, r30
/* 8013BA84 00138A84  4B F8 13 AD */	bl partyGetPtr
/* 8013BA88 00138A88  28 03 00 00 */	cmplwi r3, 0
/* 8013BA8C 00138A8C  41 82 00 18 */	beq .L_8013BAA4
/* 8013BA90 00138A90  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BA94 00138A94  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BA98 00138A98  40 82 00 0C */	bne .L_8013BAA4
/* 8013BA9C 00138A9C  7F C3 F3 78 */	mr r3, r30
/* 8013BAA0 00138AA0  48 00 00 38 */	b .L_8013BAD8
.L_8013BAA4:
/* 8013BAA4 00138AA4  8B FF 02 42 */	lbz r31, 0x242(r31)
/* 8013BAA8 00138AA8  7F FF 07 75 */	extsb. r31, r31
/* 8013BAAC 00138AAC  41 80 00 28 */	blt .L_8013BAD4
/* 8013BAB0 00138AB0  7F E3 FB 78 */	mr r3, r31
/* 8013BAB4 00138AB4  4B F8 13 7D */	bl partyGetPtr
/* 8013BAB8 00138AB8  28 03 00 00 */	cmplwi r3, 0
/* 8013BABC 00138ABC  41 82 00 18 */	beq .L_8013BAD4
/* 8013BAC0 00138AC0  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BAC4 00138AC4  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BAC8 00138AC8  40 82 00 0C */	bne .L_8013BAD4
/* 8013BACC 00138ACC  7F E3 FB 78 */	mr r3, r31
/* 8013BAD0 00138AD0  48 00 00 08 */	b .L_8013BAD8
.L_8013BAD4:
/* 8013BAD4 00138AD4  38 60 FF FF */	li r3, -1
.L_8013BAD8:
/* 8013BAD8 00138AD8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013BADC 00138ADC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013BAE0 00138AE0  83 C1 00 08 */	lwz r30, 8(r1)
/* 8013BAE4 00138AE4  7C 08 03 A6 */	mtlr r0
/* 8013BAE8 00138AE8  38 21 00 10 */	addi r1, r1, 0x10
/* 8013BAEC 00138AEC  4E 80 00 20 */	blr 

.global marioGetParty
marioGetParty:
/* 8013BAF0 00138AF0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013BAF4 00138AF4  7C 08 02 A6 */	mflr r0
/* 8013BAF8 00138AF8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013BAFC 00138AFC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013BB00 00138B00  93 C1 00 08 */	stw r30, 8(r1)
/* 8013BB04 00138B04  4B F2 17 11 */	bl marioGetPtr
/* 8013BB08 00138B08  7C 7F 1B 78 */	mr r31, r3
/* 8013BB0C 00138B0C  8B C3 02 41 */	lbz r30, 0x241(r3)
/* 8013BB10 00138B10  7F DE 07 75 */	extsb. r30, r30
/* 8013BB14 00138B14  41 80 00 24 */	blt .L_8013BB38
/* 8013BB18 00138B18  7F C3 F3 78 */	mr r3, r30
/* 8013BB1C 00138B1C  4B F8 13 15 */	bl partyGetPtr
/* 8013BB20 00138B20  28 03 00 00 */	cmplwi r3, 0
/* 8013BB24 00138B24  41 82 00 14 */	beq .L_8013BB38
/* 8013BB28 00138B28  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BB2C 00138B2C  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BB30 00138B30  40 82 00 08 */	bne .L_8013BB38
/* 8013BB34 00138B34  48 00 00 34 */	b .L_8013BB68
.L_8013BB38:
/* 8013BB38 00138B38  8B DF 02 42 */	lbz r30, 0x242(r31)
/* 8013BB3C 00138B3C  7F DE 07 75 */	extsb. r30, r30
/* 8013BB40 00138B40  41 80 00 24 */	blt .L_8013BB64
/* 8013BB44 00138B44  7F C3 F3 78 */	mr r3, r30
/* 8013BB48 00138B48  4B F8 12 E9 */	bl partyGetPtr
/* 8013BB4C 00138B4C  28 03 00 00 */	cmplwi r3, 0
/* 8013BB50 00138B50  41 82 00 14 */	beq .L_8013BB64
/* 8013BB54 00138B54  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BB58 00138B58  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BB5C 00138B5C  40 82 00 08 */	bne .L_8013BB64
/* 8013BB60 00138B60  48 00 00 08 */	b .L_8013BB68
.L_8013BB64:
/* 8013BB64 00138B64  3B C0 FF FF */	li r30, -1
.L_8013BB68:
/* 8013BB68 00138B68  2C 1E 00 00 */	cmpwi r30, 0
/* 8013BB6C 00138B6C  41 80 00 18 */	blt .L_8013BB84
/* 8013BB70 00138B70  7F C3 F3 78 */	mr r3, r30
/* 8013BB74 00138B74  4B F8 12 BD */	bl partyGetPtr
/* 8013BB78 00138B78  88 63 00 31 */	lbz r3, 0x31(r3)
/* 8013BB7C 00138B7C  7C 63 07 74 */	extsb r3, r3
/* 8013BB80 00138B80  48 00 00 08 */	b .L_8013BB88
.L_8013BB84:
/* 8013BB84 00138B84  38 60 00 00 */	li r3, 0
.L_8013BB88:
/* 8013BB88 00138B88  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013BB8C 00138B8C  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013BB90 00138B90  83 C1 00 08 */	lwz r30, 8(r1)
/* 8013BB94 00138B94  7C 08 03 A6 */	mtlr r0
/* 8013BB98 00138B98  38 21 00 10 */	addi r1, r1, 0x10
/* 8013BB9C 00138B9C  4E 80 00 20 */	blr 

.global marioPartyKill
marioPartyKill:
/* 8013BBA0 00138BA0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013BBA4 00138BA4  7C 08 02 A6 */	mflr r0
/* 8013BBA8 00138BA8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013BBAC 00138BAC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013BBB0 00138BB0  4B F2 16 65 */	bl marioGetPtr
/* 8013BBB4 00138BB4  7C 7F 1B 78 */	mr r31, r3
/* 8013BBB8 00138BB8  88 63 02 41 */	lbz r3, 0x241(r3)
/* 8013BBBC 00138BBC  7C 60 07 75 */	extsb. r0, r3
/* 8013BBC0 00138BC0  41 80 00 14 */	blt .L_8013BBD4
/* 8013BBC4 00138BC4  7C 63 07 74 */	extsb r3, r3
/* 8013BBC8 00138BC8  4B F8 07 51 */	bl partyKill
/* 8013BBCC 00138BCC  38 00 FF FF */	li r0, -1
/* 8013BBD0 00138BD0  98 1F 02 41 */	stb r0, 0x241(r31)
.L_8013BBD4:
/* 8013BBD4 00138BD4  4B F2 16 41 */	bl marioGetPtr
/* 8013BBD8 00138BD8  7C 7F 1B 78 */	mr r31, r3
/* 8013BBDC 00138BDC  88 63 02 42 */	lbz r3, 0x242(r3)
/* 8013BBE0 00138BE0  7C 60 07 75 */	extsb. r0, r3
/* 8013BBE4 00138BE4  41 80 00 14 */	blt .L_8013BBF8
/* 8013BBE8 00138BE8  7C 63 07 74 */	extsb r3, r3
/* 8013BBEC 00138BEC  4B F8 07 2D */	bl partyKill
/* 8013BBF0 00138BF0  38 00 FF FF */	li r0, -1
/* 8013BBF4 00138BF4  98 1F 02 42 */	stb r0, 0x242(r31)
.L_8013BBF8:
/* 8013BBF8 00138BF8  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013BBFC 00138BFC  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013BC00 00138C00  7C 08 03 A6 */	mtlr r0
/* 8013BC04 00138C04  38 21 00 10 */	addi r1, r1, 0x10
/* 8013BC08 00138C08  4E 80 00 20 */	blr 

.global marioPartyGoodbye
marioPartyGoodbye:
/* 8013BC0C 00138C0C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013BC10 00138C10  7C 08 02 A6 */	mflr r0
/* 8013BC14 00138C14  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013BC18 00138C18  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013BC1C 00138C1C  3B E0 00 00 */	li r31, 0
/* 8013BC20 00138C20  4B F2 15 F5 */	bl marioGetPtr
/* 8013BC24 00138C24  88 63 02 41 */	lbz r3, 0x241(r3)
/* 8013BC28 00138C28  7C 60 07 75 */	extsb. r0, r3
/* 8013BC2C 00138C2C  41 80 00 10 */	blt .L_8013BC3C
/* 8013BC30 00138C30  7C 63 07 74 */	extsb r3, r3
/* 8013BC34 00138C34  4B F8 08 45 */	bl partyGoodbye
/* 8013BC38 00138C38  3B E0 00 01 */	li r31, 1
.L_8013BC3C:
/* 8013BC3C 00138C3C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013BC40 00138C40  7F E3 FB 78 */	mr r3, r31
/* 8013BC44 00138C44  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013BC48 00138C48  7C 08 03 A6 */	mtlr r0
/* 8013BC4C 00138C4C  38 21 00 10 */	addi r1, r1, 0x10
/* 8013BC50 00138C50  4E 80 00 20 */	blr 

.global marioPartyHello
marioPartyHello:
/* 8013BC54 00138C54  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013BC58 00138C58  7C 08 02 A6 */	mflr r0
/* 8013BC5C 00138C5C  90 01 00 24 */	stw r0, 0x24(r1)
/* 8013BC60 00138C60  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013BC64 00138C64  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8013BC68 00138C68  3B C0 FF FF */	li r30, -1
/* 8013BC6C 00138C6C  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8013BC70 00138C70  7C 7D 1B 78 */	mr r29, r3
/* 8013BC74 00138C74  4B F2 15 A1 */	bl marioGetPtr
/* 8013BC78 00138C78  2C 1D 00 08 */	cmpwi r29, 8
/* 8013BC7C 00138C7C  7C 7F 1B 78 */	mr r31, r3
/* 8013BC80 00138C80  40 80 00 50 */	bge .L_8013BCD0
/* 8013BC84 00138C84  38 00 00 00 */	li r0, 0
/* 8013BC88 00138C88  40 80 00 14 */	bge .L_8013BC9C
/* 8013BC8C 00138C8C  4B F9 5F E9 */	bl func_800D1C74
/* 8013BC90 00138C90  1C 1D 00 0E */	mulli r0, r29, 0xe
/* 8013BC94 00138C94  7C 03 02 2E */	lhzx r0, r3, r0
/* 8013BC98 00138C98  54 00 07 FE */	clrlwi r0, r0, 0x1f
.L_8013BC9C:
/* 8013BC9C 00138C9C  2C 00 00 00 */	cmpwi r0, 0
/* 8013BCA0 00138CA0  40 82 00 0C */	bne .L_8013BCAC
/* 8013BCA4 00138CA4  38 60 FF FF */	li r3, -1
/* 8013BCA8 00138CA8  48 00 00 40 */	b .L_8013BCE8
.L_8013BCAC:
/* 8013BCAC 00138CAC  88 1F 02 41 */	lbz r0, 0x241(r31)
/* 8013BCB0 00138CB0  7C 00 07 75 */	extsb. r0, r0
/* 8013BCB4 00138CB4  40 80 00 30 */	bge .L_8013BCE4
/* 8013BCB8 00138CB8  7F A3 EB 78 */	mr r3, r29
/* 8013BCBC 00138CBC  4B F8 0B E1 */	bl partyEntryHello
/* 8013BCC0 00138CC0  7C 7E 1B 79 */	or. r30, r3, r3
/* 8013BCC4 00138CC4  41 80 00 20 */	blt .L_8013BCE4
/* 8013BCC8 00138CC8  9B DF 02 41 */	stb r30, 0x241(r31)
/* 8013BCCC 00138CCC  48 00 00 18 */	b .L_8013BCE4
.L_8013BCD0:
/* 8013BCD0 00138CD0  7F A3 EB 78 */	mr r3, r29
/* 8013BCD4 00138CD4  4B F7 FA 51 */	bl partyEntry2Hello
/* 8013BCD8 00138CD8  7C 7E 1B 79 */	or. r30, r3, r3
/* 8013BCDC 00138CDC  41 80 00 08 */	blt .L_8013BCE4
/* 8013BCE0 00138CE0  9B DF 02 42 */	stb r30, 0x242(r31)
.L_8013BCE4:
/* 8013BCE4 00138CE4  7F C3 F3 78 */	mr r3, r30
.L_8013BCE8:
/* 8013BCE8 00138CE8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013BCEC 00138CEC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8013BCF0 00138CF0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8013BCF4 00138CF4  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8013BCF8 00138CF8  7C 08 03 A6 */	mtlr r0
/* 8013BCFC 00138CFC  38 21 00 20 */	addi r1, r1, 0x20
/* 8013BD00 00138D00  4E 80 00 20 */	blr 

.global marioPartyEntry
marioPartyEntry:
/* 8013BD04 00138D04  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013BD08 00138D08  7C 08 02 A6 */	mflr r0
/* 8013BD0C 00138D0C  90 01 00 24 */	stw r0, 0x24(r1)
/* 8013BD10 00138D10  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013BD14 00138D14  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8013BD18 00138D18  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8013BD1C 00138D1C  7C 7D 1B 78 */	mr r29, r3
/* 8013BD20 00138D20  4B F2 14 F5 */	bl marioGetPtr
/* 8013BD24 00138D24  2C 1D 00 08 */	cmpwi r29, 8
/* 8013BD28 00138D28  7C 7E 1B 78 */	mr r30, r3
/* 8013BD2C 00138D2C  40 80 00 7C */	bge .L_8013BDA8
/* 8013BD30 00138D30  38 00 00 00 */	li r0, 0
/* 8013BD34 00138D34  40 80 00 14 */	bge .L_8013BD48
/* 8013BD38 00138D38  4B F9 5F 3D */	bl func_800D1C74
/* 8013BD3C 00138D3C  1C 1D 00 0E */	mulli r0, r29, 0xe
/* 8013BD40 00138D40  7C 03 02 2E */	lhzx r0, r3, r0
/* 8013BD44 00138D44  54 00 07 FE */	clrlwi r0, r0, 0x1f
.L_8013BD48:
/* 8013BD48 00138D48  2C 00 00 00 */	cmpwi r0, 0
/* 8013BD4C 00138D4C  40 82 00 0C */	bne .L_8013BD58
/* 8013BD50 00138D50  38 60 FF FF */	li r3, -1
/* 8013BD54 00138D54  48 00 00 A4 */	b .L_8013BDF8
.L_8013BD58:
/* 8013BD58 00138D58  88 1E 02 41 */	lbz r0, 0x241(r30)
/* 8013BD5C 00138D5C  7C 00 07 75 */	extsb. r0, r0
/* 8013BD60 00138D60  41 80 00 28 */	blt .L_8013BD88
/* 8013BD64 00138D64  4B F2 14 B1 */	bl marioGetPtr
/* 8013BD68 00138D68  7C 7F 1B 78 */	mr r31, r3
/* 8013BD6C 00138D6C  88 63 02 41 */	lbz r3, 0x241(r3)
/* 8013BD70 00138D70  7C 60 07 75 */	extsb. r0, r3
/* 8013BD74 00138D74  41 80 00 14 */	blt .L_8013BD88
/* 8013BD78 00138D78  7C 63 07 74 */	extsb r3, r3
/* 8013BD7C 00138D7C  4B F8 05 9D */	bl partyKill
/* 8013BD80 00138D80  38 00 FF FF */	li r0, -1
/* 8013BD84 00138D84  98 1F 02 41 */	stb r0, 0x241(r31)
.L_8013BD88:
/* 8013BD88 00138D88  7F A3 EB 78 */	mr r3, r29
/* 8013BD8C 00138D8C  4B F8 09 59 */	bl partyEntry
/* 8013BD90 00138D90  7C 7F 1B 79 */	or. r31, r3, r3
/* 8013BD94 00138D94  41 80 00 60 */	blt .L_8013BDF4
/* 8013BD98 00138D98  9B FE 02 41 */	stb r31, 0x241(r30)
/* 8013BD9C 00138D9C  4B F8 10 95 */	bl partyGetPtr
/* 8013BDA0 00138DA0  4B F7 DB 25 */	bl partyHello
/* 8013BDA4 00138DA4  48 00 00 50 */	b .L_8013BDF4
.L_8013BDA8:
/* 8013BDA8 00138DA8  88 1E 02 42 */	lbz r0, 0x242(r30)
/* 8013BDAC 00138DAC  7C 00 07 75 */	extsb. r0, r0
/* 8013BDB0 00138DB0  41 80 00 28 */	blt .L_8013BDD8
/* 8013BDB4 00138DB4  4B F2 14 61 */	bl marioGetPtr
/* 8013BDB8 00138DB8  7C 7F 1B 78 */	mr r31, r3
/* 8013BDBC 00138DBC  88 63 02 42 */	lbz r3, 0x242(r3)
/* 8013BDC0 00138DC0  7C 60 07 75 */	extsb. r0, r3
/* 8013BDC4 00138DC4  41 80 00 14 */	blt .L_8013BDD8
/* 8013BDC8 00138DC8  7C 63 07 74 */	extsb r3, r3
/* 8013BDCC 00138DCC  4B F8 05 4D */	bl partyKill
/* 8013BDD0 00138DD0  38 00 FF FF */	li r0, -1
/* 8013BDD4 00138DD4  98 1F 02 42 */	stb r0, 0x242(r31)
.L_8013BDD8:
/* 8013BDD8 00138DD8  7F A3 EB 78 */	mr r3, r29
/* 8013BDDC 00138DDC  4B F7 FC 71 */	bl partyEntry2
/* 8013BDE0 00138DE0  7C 7F 1B 79 */	or. r31, r3, r3
/* 8013BDE4 00138DE4  41 80 00 10 */	blt .L_8013BDF4
/* 8013BDE8 00138DE8  9B FE 02 42 */	stb r31, 0x242(r30)
/* 8013BDEC 00138DEC  4B F8 10 45 */	bl partyGetPtr
/* 8013BDF0 00138DF0  4B F7 DA D5 */	bl partyHello
.L_8013BDF4:
/* 8013BDF4 00138DF4  7F E3 FB 78 */	mr r3, r31
.L_8013BDF8:
/* 8013BDF8 00138DF8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013BDFC 00138DFC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8013BE00 00138E00  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8013BE04 00138E04  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8013BE08 00138E08  7C 08 03 A6 */	mtlr r0
/* 8013BE0C 00138E0C  38 21 00 20 */	addi r1, r1, 0x20
/* 8013BE10 00138E10  4E 80 00 20 */	blr 

.global unk_JP_US_EU_32_8013be14
unk_JP_US_EU_32_8013be14:
/* 8013BE14 00138E14  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013BE18 00138E18  7C 08 02 A6 */	mflr r0
/* 8013BE1C 00138E1C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013BE20 00138E20  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013BE24 00138E24  4B F2 13 F1 */	bl marioGetPtr
/* 8013BE28 00138E28  80 03 00 0C */	lwz r0, 0xc(r3)
/* 8013BE2C 00138E2C  7C 7F 1B 78 */	mr r31, r3
/* 8013BE30 00138E30  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 8013BE34 00138E34  41 82 00 5C */	beq .L_8013BE90
/* 8013BE38 00138E38  4B F1 F6 5D */	bl marioKeyOffChk
/* 8013BE3C 00138E3C  2C 03 00 00 */	cmpwi r3, 0
/* 8013BE40 00138E40  41 82 00 20 */	beq .L_8013BE60
/* 8013BE44 00138E44  38 00 00 00 */	li r0, 0
/* 8013BE48 00138E48  38 60 00 00 */	li r3, 0
/* 8013BE4C 00138E4C  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 8013BE50 00138E50  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BE54 00138E54  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013BE58 00138E58  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013BE5C 00138E5C  48 00 00 38 */	b .L_8013BE94
.L_8013BE60:
/* 8013BE60 00138E60  88 7F 00 3B */	lbz r3, 0x3b(r31)
/* 8013BE64 00138E64  38 63 FF FF */	addi r3, r3, -1
/* 8013BE68 00138E68  7C 60 07 75 */	extsb. r0, r3
/* 8013BE6C 00138E6C  98 7F 00 3B */	stb r3, 0x3b(r31)
/* 8013BE70 00138E70  41 81 00 20 */	bgt .L_8013BE90
/* 8013BE74 00138E74  38 00 00 00 */	li r0, 0
/* 8013BE78 00138E78  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 8013BE7C 00138E7C  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BE80 00138E80  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013BE84 00138E84  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013BE88 00138E88  4B F7 DB D1 */	bl partyDoWork
/* 8013BE8C 00138E8C  48 00 00 08 */	b .L_8013BE94
.L_8013BE90:
/* 8013BE90 00138E90  38 60 00 00 */	li r3, 0
.L_8013BE94:
/* 8013BE94 00138E94  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013BE98 00138E98  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013BE9C 00138E9C  7C 08 03 A6 */	mtlr r0
/* 8013BEA0 00138EA0  38 21 00 10 */	addi r1, r1, 0x10
/* 8013BEA4 00138EA4  4E 80 00 20 */	blr 

.global marioUseParty
marioUseParty:
/* 8013BEA8 00138EA8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013BEAC 00138EAC  7C 08 02 A6 */	mflr r0
/* 8013BEB0 00138EB0  90 01 00 24 */	stw r0, 0x24(r1)
/* 8013BEB4 00138EB4  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013BEB8 00138EB8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8013BEBC 00138EBC  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8013BEC0 00138EC0  4B F2 13 55 */	bl marioGetPtr
/* 8013BEC4 00138EC4  7C 7F 1B 78 */	mr r31, r3
/* 8013BEC8 00138EC8  4B F1 F6 E1 */	bl N_marioChkUseParty
/* 8013BECC 00138ECC  2C 03 00 00 */	cmpwi r3, 0
/* 8013BED0 00138ED0  41 82 00 20 */	beq .L_8013BEF0
/* 8013BED4 00138ED4  38 00 00 00 */	li r0, 0
/* 8013BED8 00138ED8  38 60 00 00 */	li r3, 0
/* 8013BEDC 00138EDC  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 8013BEE0 00138EE0  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BEE4 00138EE4  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013BEE8 00138EE8  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013BEEC 00138EEC  48 00 03 08 */	b .L_8013C1F4
.L_8013BEF0:
/* 8013BEF0 00138EF0  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BEF4 00138EF4  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 8013BEF8 00138EF8  41 82 00 2C */	beq .L_8013BF24
/* 8013BEFC 00138EFC  4B F1 F5 99 */	bl marioKeyOffChk
/* 8013BF00 00138F00  2C 03 00 00 */	cmpwi r3, 0
/* 8013BF04 00138F04  41 82 00 20 */	beq .L_8013BF24
/* 8013BF08 00138F08  38 00 00 00 */	li r0, 0
/* 8013BF0C 00138F0C  38 60 00 00 */	li r3, 0
/* 8013BF10 00138F10  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 8013BF14 00138F14  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BF18 00138F18  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013BF1C 00138F1C  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013BF20 00138F20  48 00 02 D4 */	b .L_8013C1F4
.L_8013BF24:
/* 8013BF24 00138F24  4B F2 12 F1 */	bl marioGetPtr
/* 8013BF28 00138F28  7C 7E 1B 78 */	mr r30, r3
/* 8013BF2C 00138F2C  8B A3 02 41 */	lbz r29, 0x241(r3)
/* 8013BF30 00138F30  7F BD 07 75 */	extsb. r29, r29
/* 8013BF34 00138F34  41 80 00 24 */	blt .L_8013BF58
/* 8013BF38 00138F38  7F A3 EB 78 */	mr r3, r29
/* 8013BF3C 00138F3C  4B F8 0E F5 */	bl partyGetPtr
/* 8013BF40 00138F40  28 03 00 00 */	cmplwi r3, 0
/* 8013BF44 00138F44  41 82 00 14 */	beq .L_8013BF58
/* 8013BF48 00138F48  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BF4C 00138F4C  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BF50 00138F50  40 82 00 08 */	bne .L_8013BF58
/* 8013BF54 00138F54  48 00 00 34 */	b .L_8013BF88
.L_8013BF58:
/* 8013BF58 00138F58  8B BE 02 42 */	lbz r29, 0x242(r30)
/* 8013BF5C 00138F5C  7F BD 07 75 */	extsb. r29, r29
/* 8013BF60 00138F60  41 80 00 24 */	blt .L_8013BF84
/* 8013BF64 00138F64  7F A3 EB 78 */	mr r3, r29
/* 8013BF68 00138F68  4B F8 0E C9 */	bl partyGetPtr
/* 8013BF6C 00138F6C  28 03 00 00 */	cmplwi r3, 0
/* 8013BF70 00138F70  41 82 00 14 */	beq .L_8013BF84
/* 8013BF74 00138F74  80 03 00 00 */	lwz r0, 0(r3)
/* 8013BF78 00138F78  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013BF7C 00138F7C  40 82 00 08 */	bne .L_8013BF84
/* 8013BF80 00138F80  48 00 00 08 */	b .L_8013BF88
.L_8013BF84:
/* 8013BF84 00138F84  3B A0 FF FF */	li r29, -1
.L_8013BF88:
/* 8013BF88 00138F88  7F A3 EB 78 */	mr r3, r29
/* 8013BF8C 00138F8C  4B F8 0E A5 */	bl partyGetPtr
/* 8013BF90 00138F90  7C 7E 1B 79 */	or. r30, r3, r3
/* 8013BF94 00138F94  41 82 00 18 */	beq .L_8013BFAC
/* 8013BF98 00138F98  88 1E 00 34 */	lbz r0, 0x34(r30)
/* 8013BF9C 00138F9C  28 00 00 03 */	cmplwi r0, 3
/* 8013BFA0 00138FA0  40 82 00 0C */	bne .L_8013BFAC
/* 8013BFA4 00138FA4  38 60 00 00 */	li r3, 0
/* 8013BFA8 00138FA8  48 00 02 4C */	b .L_8013C1F4
.L_8013BFAC:
/* 8013BFAC 00138FAC  88 1F 02 41 */	lbz r0, 0x241(r31)
/* 8013BFB0 00138FB0  7C 00 07 75 */	extsb. r0, r0
/* 8013BFB4 00138FB4  40 80 00 18 */	bge .L_8013BFCC
/* 8013BFB8 00138FB8  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BFBC 00138FBC  38 60 00 00 */	li r3, 0
/* 8013BFC0 00138FC0  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013BFC4 00138FC4  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013BFC8 00138FC8  48 00 02 2C */	b .L_8013C1F4
.L_8013BFCC:
/* 8013BFCC 00138FCC  80 1F 00 00 */	lwz r0, 0(r31)
/* 8013BFD0 00138FD0  54 00 00 01 */	rlwinm. r0, r0, 0, 0, 0
/* 8013BFD4 00138FD4  41 82 00 0C */	beq .L_8013BFE0
/* 8013BFD8 00138FD8  38 60 00 00 */	li r3, 0
/* 8013BFDC 00138FDC  48 00 02 18 */	b .L_8013C1F4
.L_8013BFE0:
/* 8013BFE0 00138FE0  4B F0 68 BD */	bl N_fbatPreventMarioEventChk
/* 8013BFE4 00138FE4  2C 03 00 00 */	cmpwi r3, 0
/* 8013BFE8 00138FE8  41 82 00 20 */	beq .L_8013C008
/* 8013BFEC 00138FEC  38 00 00 00 */	li r0, 0
/* 8013BFF0 00138FF0  38 60 00 00 */	li r3, 0
/* 8013BFF4 00138FF4  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 8013BFF8 00138FF8  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013BFFC 00138FFC  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013C000 00139000  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013C004 00139004  48 00 01 F0 */	b .L_8013C1F4
.L_8013C008:
/* 8013C008 00139008  80 1F 00 00 */	lwz r0, 0(r31)
/* 8013C00C 0013900C  54 00 03 9F */	rlwinm. r0, r0, 0, 0xe, 0xf
/* 8013C010 00139010  40 82 00 10 */	bne .L_8013C020
/* 8013C014 00139014  A8 1F 00 50 */	lha r0, 0x50(r31)
/* 8013C018 00139018  2C 00 00 00 */	cmpwi r0, 0
/* 8013C01C 0013901C  41 82 00 20 */	beq .L_8013C03C
.L_8013C020:
/* 8013C020 00139020  38 00 00 00 */	li r0, 0
/* 8013C024 00139024  38 60 00 00 */	li r3, 0
/* 8013C028 00139028  98 1F 00 3B */	stb r0, 0x3b(r31)
/* 8013C02C 0013902C  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013C030 00139030  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013C034 00139034  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013C038 00139038  48 00 01 BC */	b .L_8013C1F4
.L_8013C03C:
/* 8013C03C 0013903C  A0 1F 00 2E */	lhz r0, 0x2e(r31)
/* 8013C040 00139040  28 00 00 00 */	cmplwi r0, 0
/* 8013C044 00139044  41 82 00 28 */	beq .L_8013C06C
/* 8013C048 00139048  28 00 00 01 */	cmplwi r0, 1
/* 8013C04C 0013904C  41 82 00 20 */	beq .L_8013C06C
/* 8013C050 00139050  28 00 00 02 */	cmplwi r0, 2
/* 8013C054 00139054  41 82 00 18 */	beq .L_8013C06C
/* 8013C058 00139058  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 8013C05C 0013905C  38 60 00 00 */	li r3, 0
/* 8013C060 00139060  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8013C064 00139064  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8013C068 00139068  48 00 01 8C */	b .L_8013C1F4
.L_8013C06C:
/* 8013C06C 0013906C  80 1F 00 04 */	lwz r0, 4(r31)
/* 8013C070 00139070  54 00 01 CF */	rlwinm. r0, r0, 0, 7, 7
/* 8013C074 00139074  40 82 00 10 */	bne .L_8013C084
/* 8013C078 00139078  88 1E 00 37 */	lbz r0, 0x37(r30)
/* 8013C07C 0013907C  28 00 00 01 */	cmplwi r0, 1
/* 8013C080 00139080  40 82 00 0C */	bne .L_8013C08C
.L_8013C084:
/* 8013C084 00139084  38 60 00 00 */	li r3, 0
/* 8013C088 00139088  48 00 01 6C */	b .L_8013C1F4
.L_8013C08C:
/* 8013C08C 0013908C  4B F2 11 89 */	bl marioGetPtr
/* 8013C090 00139090  7C 7E 1B 78 */	mr r30, r3
/* 8013C094 00139094  8B A3 02 41 */	lbz r29, 0x241(r3)
/* 8013C098 00139098  7F BD 07 75 */	extsb. r29, r29
/* 8013C09C 0013909C  41 80 00 24 */	blt .L_8013C0C0
/* 8013C0A0 001390A0  7F A3 EB 78 */	mr r3, r29
/* 8013C0A4 001390A4  4B F8 0D 8D */	bl partyGetPtr
/* 8013C0A8 001390A8  28 03 00 00 */	cmplwi r3, 0
/* 8013C0AC 001390AC  41 82 00 14 */	beq .L_8013C0C0
/* 8013C0B0 001390B0  80 03 00 00 */	lwz r0, 0(r3)
/* 8013C0B4 001390B4  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013C0B8 001390B8  40 82 00 08 */	bne .L_8013C0C0
/* 8013C0BC 001390BC  48 00 00 34 */	b .L_8013C0F0
.L_8013C0C0:
/* 8013C0C0 001390C0  8B BE 02 42 */	lbz r29, 0x242(r30)
/* 8013C0C4 001390C4  7F BD 07 75 */	extsb. r29, r29
/* 8013C0C8 001390C8  41 80 00 24 */	blt .L_8013C0EC
/* 8013C0CC 001390CC  7F A3 EB 78 */	mr r3, r29
/* 8013C0D0 001390D0  4B F8 0D 61 */	bl partyGetPtr
/* 8013C0D4 001390D4  28 03 00 00 */	cmplwi r3, 0
/* 8013C0D8 001390D8  41 82 00 14 */	beq .L_8013C0EC
/* 8013C0DC 001390DC  80 03 00 00 */	lwz r0, 0(r3)
/* 8013C0E0 001390E0  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013C0E4 001390E4  40 82 00 08 */	bne .L_8013C0EC
/* 8013C0E8 001390E8  48 00 00 08 */	b .L_8013C0F0
.L_8013C0EC:
/* 8013C0EC 001390EC  3B A0 FF FF */	li r29, -1
.L_8013C0F0:
/* 8013C0F0 001390F0  7F A3 EB 78 */	mr r3, r29
/* 8013C0F4 001390F4  4B F8 0D 3D */	bl partyGetPtr
/* 8013C0F8 001390F8  80 03 00 00 */	lwz r0, 0(r3)
/* 8013C0FC 001390FC  54 00 05 EF */	rlwinm. r0, r0, 0, 0x17, 0x17
/* 8013C100 00139100  41 82 00 0C */	beq .L_8013C10C
/* 8013C104 00139104  38 60 00 00 */	li r3, 0
/* 8013C108 00139108  48 00 00 EC */	b .L_8013C1F4
.L_8013C10C:
/* 8013C10C 0013910C  4B F2 11 09 */	bl marioGetPtr
/* 8013C110 00139110  7C 7E 1B 78 */	mr r30, r3
/* 8013C114 00139114  8B A3 02 41 */	lbz r29, 0x241(r3)
/* 8013C118 00139118  7F BD 07 75 */	extsb. r29, r29
/* 8013C11C 0013911C  41 80 00 24 */	blt .L_8013C140
/* 8013C120 00139120  7F A3 EB 78 */	mr r3, r29
/* 8013C124 00139124  4B F8 0D 0D */	bl partyGetPtr
/* 8013C128 00139128  28 03 00 00 */	cmplwi r3, 0
/* 8013C12C 0013912C  41 82 00 14 */	beq .L_8013C140
/* 8013C130 00139130  80 03 00 00 */	lwz r0, 0(r3)
/* 8013C134 00139134  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013C138 00139138  40 82 00 08 */	bne .L_8013C140
/* 8013C13C 0013913C  48 00 00 34 */	b .L_8013C170
.L_8013C140:
/* 8013C140 00139140  8B BE 02 42 */	lbz r29, 0x242(r30)
/* 8013C144 00139144  7F BD 07 75 */	extsb. r29, r29
/* 8013C148 00139148  41 80 00 24 */	blt .L_8013C16C
/* 8013C14C 0013914C  7F A3 EB 78 */	mr r3, r29
/* 8013C150 00139150  4B F8 0C E1 */	bl partyGetPtr
/* 8013C154 00139154  28 03 00 00 */	cmplwi r3, 0
/* 8013C158 00139158  41 82 00 14 */	beq .L_8013C16C
/* 8013C15C 0013915C  80 03 00 00 */	lwz r0, 0(r3)
/* 8013C160 00139160  54 00 07 39 */	rlwinm. r0, r0, 0, 0x1c, 0x1c
/* 8013C164 00139164  40 82 00 08 */	bne .L_8013C16C
/* 8013C168 00139168  48 00 00 08 */	b .L_8013C170
.L_8013C16C:
/* 8013C16C 0013916C  3B A0 FF FF */	li r29, -1
.L_8013C170:
/* 8013C170 00139170  7F A3 EB 78 */	mr r3, r29
/* 8013C174 00139174  4B F8 0C BD */	bl partyGetPtr
/* 8013C178 00139178  28 03 00 00 */	cmplwi r3, 0
/* 8013C17C 0013917C  40 82 00 0C */	bne .L_8013C188
/* 8013C180 00139180  38 60 00 00 */	li r3, 0
/* 8013C184 00139184  48 00 00 70 */	b .L_8013C1F4
.L_8013C188:
/* 8013C188 00139188  88 83 00 31 */	lbz r4, 0x31(r3)
/* 8013C18C 0013918C  2C 04 00 01 */	cmpwi r4, 1
/* 8013C190 00139190  40 82 00 18 */	bne .L_8013C1A8
/* 8013C194 00139194  80 03 00 00 */	lwz r0, 0(r3)
/* 8013C198 00139198  54 00 07 BD */	rlwinm. r0, r0, 0, 0x1e, 0x1e
/* 8013C19C 0013919C  40 82 00 0C */	bne .L_8013C1A8
/* 8013C1A0 001391A0  38 60 00 00 */	li r3, 0
/* 8013C1A4 001391A4  48 00 00 50 */	b .L_8013C1F4
.L_8013C1A8:
/* 8013C1A8 001391A8  7C 80 07 74 */	extsb r0, r4
/* 8013C1AC 001391AC  2C 00 00 04 */	cmpwi r0, 4
/* 8013C1B0 001391B0  40 82 00 18 */	bne .L_8013C1C8
/* 8013C1B4 001391B4  4B F7 8E 59 */	bl yoshiGetStatus
/* 8013C1B8 001391B8  2C 03 00 00 */	cmpwi r3, 0
/* 8013C1BC 001391BC  41 82 00 0C */	beq .L_8013C1C8
/* 8013C1C0 001391C0  38 60 00 00 */	li r3, 0
/* 8013C1C4 001391C4  48 00 00 30 */	b .L_8013C1F4
.L_8013C1C8:
/* 8013C1C8 001391C8  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 8013C1CC 001391CC  54 60 07 BD */	rlwinm. r0, r3, 0, 0x1e, 0x1e
/* 8013C1D0 001391D0  40 82 00 20 */	bne .L_8013C1F0
/* 8013C1D4 001391D4  A0 1F 02 48 */	lhz r0, 0x248(r31)
/* 8013C1D8 001391D8  54 00 05 6B */	rlwinm. r0, r0, 0, 0x15, 0x15
/* 8013C1DC 001391DC  41 82 00 14 */	beq .L_8013C1F0
/* 8013C1E0 001391E0  60 63 00 02 */	ori r3, r3, 2
/* 8013C1E4 001391E4  38 00 00 05 */	li r0, 5
/* 8013C1E8 001391E8  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8013C1EC 001391EC  98 1F 00 3B */	stb r0, 0x3b(r31)
.L_8013C1F0:
/* 8013C1F0 001391F0  38 60 00 00 */	li r3, 0
.L_8013C1F4:
/* 8013C1F4 001391F4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8013C1F8 001391F8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8013C1FC 001391FC  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8013C200 00139200  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8013C204 00139204  7C 08 03 A6 */	mtlr r0
/* 8013C208 00139208  38 21 00 20 */	addi r1, r1, 0x20
/* 8013C20C 0013920C  4E 80 00 20 */	blr 
