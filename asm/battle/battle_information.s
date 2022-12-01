.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global BattleInformationSetDropMaterial
BattleInformationSetDropMaterial:
/* 8010F0D0 0010C0D0  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 8010F0D4 0010C0D4  7C 08 02 A6 */	mflr r0
/* 8010F0D8 0010C0D8  90 01 00 74 */	stw r0, 0x74(r1)
/* 8010F0DC 0010C0DC  BF 41 00 58 */	stmw r26, 0x58(r1)
/* 8010F0E0 0010C0E0  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 8010F0E4 0010C0E4  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 8010F0E8 0010C0E8  83 DF 00 18 */	lwz r30, 0x18(r31)
/* 8010F0EC 0010C0EC  83 7E 00 14 */	lwz r27, 0x14(r30)
/* 8010F0F0 0010C0F0  83 BE 00 18 */	lwz r29, 0x18(r30)
/* 8010F0F4 0010C0F4  4B FE 47 61 */	bl BattleGetMarioPtr
/* 8010F0F8 0010C0F8  7C 7C 1B 78 */	mr r28, r3
/* 8010F0FC 0010C0FC  A8 63 01 0C */	lha r3, 0x10c(r3)
/* 8010F100 0010C100  A8 1C 01 08 */	lha r0, 0x108(r28)
/* 8010F104 0010C104  1C 63 00 64 */	mulli r3, r3, 0x64
/* 8010F108 0010C108  7C 63 03 D6 */	divw r3, r3, r0
/* 8010F10C 0010C10C  2C 03 00 64 */	cmpwi r3, 0x64
/* 8010F110 0010C110  40 81 00 08 */	ble .L_8010F118
/* 8010F114 0010C114  38 60 00 64 */	li r3, 0x64
.L_8010F118:
/* 8010F118 0010C118  38 00 00 00 */	li r0, 0
/* 8010F11C 0010C11C  90 1F 00 10 */	stw r0, 0x10(r31)
/* 8010F120 0010C120  48 00 00 5C */	b .L_8010F17C
.L_8010F124:
/* 8010F124 0010C124  7C 03 00 00 */	cmpw r3, r0
/* 8010F128 0010C128  41 81 00 50 */	bgt .L_8010F178
/* 8010F12C 0010C12C  38 60 00 64 */	li r3, 0x64
/* 8010F130 0010C130  4B EF 6D 95 */	bl irand
/* 8010F134 0010C134  80 1B 00 04 */	lwz r0, 4(r27)
/* 8010F138 0010C138  83 5B 00 08 */	lwz r26, 8(r27)
/* 8010F13C 0010C13C  7C 03 00 00 */	cmpw r3, r0
/* 8010F140 0010C140  40 80 00 48 */	bge .L_8010F188
/* 8010F144 0010C144  48 00 00 28 */	b .L_8010F16C
.L_8010F148:
/* 8010F148 0010C148  38 60 00 64 */	li r3, 0x64
/* 8010F14C 0010C14C  4B EF 6D 79 */	bl irand
/* 8010F150 0010C150  80 1B 00 0C */	lwz r0, 0xc(r27)
/* 8010F154 0010C154  7C 03 00 00 */	cmpw r3, r0
/* 8010F158 0010C158  40 80 00 10 */	bge .L_8010F168
/* 8010F15C 0010C15C  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 8010F160 0010C160  38 03 00 01 */	addi r0, r3, 1
/* 8010F164 0010C164  90 1F 00 10 */	stw r0, 0x10(r31)
.L_8010F168:
/* 8010F168 0010C168  3B 5A FF FF */	addi r26, r26, -1
.L_8010F16C:
/* 8010F16C 0010C16C  2C 1A 00 00 */	cmpwi r26, 0
/* 8010F170 0010C170  40 82 FF D8 */	bne .L_8010F148
/* 8010F174 0010C174  48 00 00 14 */	b .L_8010F188
.L_8010F178:
/* 8010F178 0010C178  3B 7B 00 10 */	addi r27, r27, 0x10
.L_8010F17C:
/* 8010F17C 0010C17C  80 1B 00 00 */	lwz r0, 0(r27)
/* 8010F180 0010C180  2C 00 00 00 */	cmpwi r0, 0
/* 8010F184 0010C184  40 82 FF A0 */	bne .L_8010F124
.L_8010F188:
/* 8010F188 0010C188  A8 7C 01 12 */	lha r3, 0x112(r28)
/* 8010F18C 0010C18C  A8 1C 01 0E */	lha r0, 0x10e(r28)
/* 8010F190 0010C190  1C 63 00 64 */	mulli r3, r3, 0x64
/* 8010F194 0010C194  7C 63 03 D6 */	divw r3, r3, r0
/* 8010F198 0010C198  2C 03 00 64 */	cmpwi r3, 0x64
/* 8010F19C 0010C19C  40 81 00 08 */	ble .L_8010F1A4
/* 8010F1A0 0010C1A0  38 60 00 64 */	li r3, 0x64
.L_8010F1A4:
/* 8010F1A4 0010C1A4  38 00 00 00 */	li r0, 0
/* 8010F1A8 0010C1A8  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8010F1AC 0010C1AC  48 00 00 5C */	b .L_8010F208
.L_8010F1B0:
/* 8010F1B0 0010C1B0  7C 03 00 00 */	cmpw r3, r0
/* 8010F1B4 0010C1B4  41 81 00 50 */	bgt .L_8010F204
/* 8010F1B8 0010C1B8  38 60 00 64 */	li r3, 0x64
/* 8010F1BC 0010C1BC  4B EF 6D 09 */	bl irand
/* 8010F1C0 0010C1C0  80 1D 00 04 */	lwz r0, 4(r29)
/* 8010F1C4 0010C1C4  83 5D 00 08 */	lwz r26, 8(r29)
/* 8010F1C8 0010C1C8  7C 03 00 00 */	cmpw r3, r0
/* 8010F1CC 0010C1CC  40 80 00 48 */	bge .L_8010F214
/* 8010F1D0 0010C1D0  48 00 00 28 */	b .L_8010F1F8
.L_8010F1D4:
/* 8010F1D4 0010C1D4  38 60 00 64 */	li r3, 0x64
/* 8010F1D8 0010C1D8  4B EF 6C ED */	bl irand
/* 8010F1DC 0010C1DC  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 8010F1E0 0010C1E0  7C 03 00 00 */	cmpw r3, r0
/* 8010F1E4 0010C1E4  40 80 00 10 */	bge .L_8010F1F4
/* 8010F1E8 0010C1E8  80 7F 00 14 */	lwz r3, 0x14(r31)
/* 8010F1EC 0010C1EC  38 03 00 01 */	addi r0, r3, 1
/* 8010F1F0 0010C1F0  90 1F 00 14 */	stw r0, 0x14(r31)
.L_8010F1F4:
/* 8010F1F4 0010C1F4  3B 5A FF FF */	addi r26, r26, -1
.L_8010F1F8:
/* 8010F1F8 0010C1F8  2C 1A 00 00 */	cmpwi r26, 0
/* 8010F1FC 0010C1FC  40 82 FF D8 */	bne .L_8010F1D4
/* 8010F200 0010C200  48 00 00 14 */	b .L_8010F214
.L_8010F204:
/* 8010F204 0010C204  3B BD 00 10 */	addi r29, r29, 0x10
.L_8010F208:
/* 8010F208 0010C208  80 1D 00 00 */	lwz r0, 0(r29)
/* 8010F20C 0010C20C  2C 00 00 00 */	cmpwi r0, 0
/* 8010F210 0010C210  40 82 FF A0 */	bne .L_8010F1B0
.L_8010F214:
/* 8010F214 0010C214  3C 60 F5 DE */	lis r3, 0xF5DE0180@ha
/* 8010F218 0010C218  83 5E 00 08 */	lwz r26, 8(r30)
/* 8010F21C 0010C21C  83 7E 00 0C */	lwz r27, 0xc(r30)
/* 8010F220 0010C220  38 83 01 80 */	addi r4, r3, 0xF5DE0180@l
/* 8010F224 0010C224  83 9E 00 10 */	lwz r28, 0x10(r30)
/* 8010F228 0010C228  3B A0 00 00 */	li r29, 0
/* 8010F22C 0010C22C  38 60 00 00 */	li r3, 0
/* 8010F230 0010C230  4B F2 19 9D */	bl evtGetValue
/* 8010F234 0010C234  2C 03 00 13 */	cmpwi r3, 0x13
/* 8010F238 0010C238  41 81 00 10 */	bgt .L_8010F248
/* 8010F23C 0010C23C  3B 60 00 00 */	li r27, 0
/* 8010F240 0010C240  3B 40 00 00 */	li r26, 0
/* 8010F244 0010C244  3B 80 00 64 */	li r28, 0x64
.L_8010F248:
/* 8010F248 0010C248  38 60 01 3A */	li r3, 0x13a
/* 8010F24C 0010C24C  4B FB FF 69 */	bl pouchEquipCheckBadge
/* 8010F250 0010C250  2C 03 00 01 */	cmpwi r3, 1
/* 8010F254 0010C254  41 80 00 10 */	blt .L_8010F264
/* 8010F258 0010C258  38 03 00 01 */	addi r0, r3, 1
/* 8010F25C 0010C25C  7F 5A 01 D6 */	mullw r26, r26, r0
/* 8010F260 0010C260  7F 7B 01 D6 */	mullw r27, r27, r0
.L_8010F264:
/* 8010F264 0010C264  7C 7A E2 14 */	add r3, r26, r28
/* 8010F268 0010C268  7C 7B 1A 14 */	add r3, r27, r3
/* 8010F26C 0010C26C  4B EF 6C 59 */	bl irand
/* 8010F270 0010C270  7C 1B 18 51 */	subf. r0, r27, r3
/* 8010F274 0010C274  40 80 00 0C */	bge .L_8010F280
/* 8010F278 0010C278  3B A0 00 01 */	li r29, 1
/* 8010F27C 0010C27C  48 00 00 10 */	b .L_8010F28C
.L_8010F280:
/* 8010F280 0010C280  7C 1A 00 51 */	subf. r0, r26, r0
/* 8010F284 0010C284  40 80 00 08 */	bge .L_8010F28C
/* 8010F288 0010C288  3B A0 00 02 */	li r29, 2
.L_8010F28C:
/* 8010F28C 0010C28C  38 80 00 00 */	li r4, 0
/* 8010F290 0010C290  2C 1D 00 01 */	cmpwi r29, 1
/* 8010F294 0010C294  90 9F 00 0C */	stw r4, 0xc(r31)
/* 8010F298 0010C298  41 82 00 18 */	beq .L_8010F2B0
/* 8010F29C 0010C29C  40 80 00 08 */	bge .L_8010F2A4
/* 8010F2A0 0010C2A0  48 00 01 50 */	b .L_8010F3F0
.L_8010F2A4:
/* 8010F2A4 0010C2A4  2C 1D 00 03 */	cmpwi r29, 3
/* 8010F2A8 0010C2A8  40 80 01 48 */	bge .L_8010F3F0
/* 8010F2AC 0010C2AC  48 00 00 6C */	b .L_8010F318
.L_8010F2B0:
/* 8010F2B0 0010C2B0  80 7E 00 04 */	lwz r3, 4(r30)
/* 8010F2B4 0010C2B4  83 43 00 2C */	lwz r26, 0x2c(r3)
/* 8010F2B8 0010C2B8  28 1A 00 00 */	cmplwi r26, 0
/* 8010F2BC 0010C2BC  7F 45 D3 78 */	mr r5, r26
/* 8010F2C0 0010C2C0  41 82 01 30 */	beq .L_8010F3F0
/* 8010F2C4 0010C2C4  38 60 00 00 */	li r3, 0
/* 8010F2C8 0010C2C8  48 00 00 0C */	b .L_8010F2D4
.L_8010F2CC:
/* 8010F2CC 0010C2CC  7C 63 22 14 */	add r3, r3, r4
/* 8010F2D0 0010C2D0  38 A5 00 08 */	addi r5, r5, 8
.L_8010F2D4:
/* 8010F2D4 0010C2D4  A8 85 00 06 */	lha r4, 6(r5)
/* 8010F2D8 0010C2D8  7C 80 07 35 */	extsh. r0, r4
/* 8010F2DC 0010C2DC  41 81 FF F0 */	bgt .L_8010F2CC
/* 8010F2E0 0010C2E0  80 05 00 00 */	lwz r0, 0(r5)
/* 8010F2E4 0010C2E4  2C 00 00 00 */	cmpwi r0, 0
/* 8010F2E8 0010C2E8  40 82 FF E4 */	bne .L_8010F2CC
/* 8010F2EC 0010C2EC  2C 03 00 00 */	cmpwi r3, 0
/* 8010F2F0 0010C2F0  40 81 01 00 */	ble .L_8010F3F0
/* 8010F2F4 0010C2F4  4B EF 6B D1 */	bl irand
.L_8010F2F8:
/* 8010F2F8 0010C2F8  A8 1A 00 06 */	lha r0, 6(r26)
/* 8010F2FC 0010C2FC  7C 60 18 51 */	subf. r3, r0, r3
/* 8010F300 0010C300  40 80 00 10 */	bge .L_8010F310
/* 8010F304 0010C304  80 1A 00 00 */	lwz r0, 0(r26)
/* 8010F308 0010C308  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8010F30C 0010C30C  48 00 00 E4 */	b .L_8010F3F0
.L_8010F310:
/* 8010F310 0010C310  3B 5A 00 08 */	addi r26, r26, 8
/* 8010F314 0010C314  4B FF FF E4 */	b .L_8010F2F8
.L_8010F318:
/* 8010F318 0010C318  38 00 00 08 */	li r0, 8
/* 8010F31C 0010C31C  38 60 00 00 */	li r3, 0
/* 8010F320 0010C320  7C 09 03 A6 */	mtctr r0
.L_8010F324:
/* 8010F324 0010C324  38 04 00 1C */	addi r0, r4, 0x1c
/* 8010F328 0010C328  7C 1F 00 2E */	lwzx r0, r31, r0
/* 8010F32C 0010C32C  2C 00 00 00 */	cmpwi r0, 0
/* 8010F330 0010C330  41 82 00 08 */	beq .L_8010F338
/* 8010F334 0010C334  38 63 00 01 */	addi r3, r3, 1
.L_8010F338:
/* 8010F338 0010C338  38 84 00 04 */	addi r4, r4, 4
/* 8010F33C 0010C33C  42 00 FF E8 */	bdnz .L_8010F324
/* 8010F340 0010C340  2C 03 00 00 */	cmpwi r3, 0
/* 8010F344 0010C344  40 81 00 58 */	ble .L_8010F39C
/* 8010F348 0010C348  4B EF 6B 7D */	bl irand
/* 8010F34C 0010C34C  38 00 00 08 */	li r0, 8
/* 8010F350 0010C350  38 A0 00 00 */	li r5, 0
/* 8010F354 0010C354  38 80 00 00 */	li r4, 0
/* 8010F358 0010C358  7C 09 03 A6 */	mtctr r0
.L_8010F35C:
/* 8010F35C 0010C35C  38 04 00 1C */	addi r0, r4, 0x1c
/* 8010F360 0010C360  7C 1F 00 2E */	lwzx r0, r31, r0
/* 8010F364 0010C364  2C 00 00 00 */	cmpwi r0, 0
/* 8010F368 0010C368  41 82 00 14 */	beq .L_8010F37C
/* 8010F36C 0010C36C  34 63 FF FF */	addic. r3, r3, -1
/* 8010F370 0010C370  40 80 00 0C */	bge .L_8010F37C
/* 8010F374 0010C374  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8010F378 0010C378  48 00 00 10 */	b .L_8010F388
.L_8010F37C:
/* 8010F37C 0010C37C  38 A5 00 01 */	addi r5, r5, 1
/* 8010F380 0010C380  38 84 00 04 */	addi r4, r4, 4
/* 8010F384 0010C384  42 00 FF D8 */	bdnz .L_8010F35C
.L_8010F388:
/* 8010F388 0010C388  2C 05 00 08 */	cmpwi r5, 8
/* 8010F38C 0010C38C  41 80 00 64 */	blt .L_8010F3F0
/* 8010F390 0010C390  38 00 00 00 */	li r0, 0
/* 8010F394 0010C394  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8010F398 0010C398  48 00 00 58 */	b .L_8010F3F0
.L_8010F39C:
/* 8010F39C 0010C39C  38 60 01 3A */	li r3, 0x13a
/* 8010F3A0 0010C3A0  4B FB FE 15 */	bl pouchEquipCheckBadge
/* 8010F3A4 0010C3A4  2C 03 00 01 */	cmpwi r3, 1
/* 8010F3A8 0010C3A8  41 80 00 48 */	blt .L_8010F3F0
/* 8010F3AC 0010C3AC  3C 60 80 2F */	lis r3, lbl_802EE470@ha
/* 8010F3B0 0010C3B0  38 00 00 0A */	li r0, 0xa
/* 8010F3B4 0010C3B4  38 63 E4 70 */	addi r3, r3, lbl_802EE470@l
/* 8010F3B8 0010C3B8  38 A1 00 04 */	addi r5, r1, 4
/* 8010F3BC 0010C3BC  38 83 FF FC */	addi r4, r3, -4
/* 8010F3C0 0010C3C0  7C 09 03 A6 */	mtctr r0
.L_8010F3C4:
/* 8010F3C4 0010C3C4  80 64 00 04 */	lwz r3, 4(r4)
/* 8010F3C8 0010C3C8  84 04 00 08 */	lwzu r0, 8(r4)
/* 8010F3CC 0010C3CC  90 65 00 04 */	stw r3, 4(r5)
/* 8010F3D0 0010C3D0  94 05 00 08 */	stwu r0, 8(r5)
/* 8010F3D4 0010C3D4  42 00 FF F0 */	bdnz .L_8010F3C4
/* 8010F3D8 0010C3D8  38 60 00 14 */	li r3, 0x14
/* 8010F3DC 0010C3DC  4B EF 6A E9 */	bl irand
/* 8010F3E0 0010C3E0  54 60 10 3A */	slwi r0, r3, 2
/* 8010F3E4 0010C3E4  38 61 00 08 */	addi r3, r1, 8
/* 8010F3E8 0010C3E8  7C 03 00 2E */	lwzx r0, r3, r0
/* 8010F3EC 0010C3EC  90 1F 00 0C */	stw r0, 0xc(r31)
.L_8010F3F0:
/* 8010F3F0 0010C3F0  BB 41 00 58 */	lmw r26, 0x58(r1)
/* 8010F3F4 0010C3F4  80 01 00 74 */	lwz r0, 0x74(r1)
/* 8010F3F8 0010C3F8  7C 08 03 A6 */	mtlr r0
/* 8010F3FC 0010C3FC  38 21 00 70 */	addi r1, r1, 0x70
/* 8010F400 0010C400  4E 80 00 20 */	blr 

.global BattleInformationGetResult
BattleInformationGetResult:
/* 8010F404 0010C404  80 63 00 10 */	lwz r3, 0x10(r3)
/* 8010F408 0010C408  4E 80 00 20 */	blr 

.global BattleInformationSetResult
BattleInformationSetResult:
/* 8010F40C 0010C40C  90 83 00 10 */	stw r4, 0x10(r3)
/* 8010F410 0010C410  4E 80 00 20 */	blr 

.global BattleInfomationSetBattleSetupInfo
BattleInfomationSetBattleSetupInfo:
/* 8010F414 0010C414  90 83 00 0C */	stw r4, 0xc(r3)
/* 8010F418 0010C418  4E 80 00 20 */	blr 

.global BattleInformationInit
BattleInformationInit:
/* 8010F41C 0010C41C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8010F420 0010C420  7C 08 02 A6 */	mflr r0
/* 8010F424 0010C424  38 80 00 00 */	li r4, 0
/* 8010F428 0010C428  90 01 00 14 */	stw r0, 0x14(r1)
/* 8010F42C 0010C42C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8010F430 0010C430  7C 7F 1B 78 */	mr r31, r3
/* 8010F434 0010C434  48 00 00 69 */	bl BattleInformationSetMode
/* 8010F438 0010C438  7F E3 FB 78 */	mr r3, r31
/* 8010F43C 0010C43C  38 80 00 00 */	li r4, 0
/* 8010F440 0010C440  48 00 00 55 */	bl func_8010F494
/* 8010F444 0010C444  7F E3 FB 78 */	mr r3, r31
/* 8010F448 0010C448  38 80 00 00 */	li r4, 0
/* 8010F44C 0010C44C  48 00 00 41 */	bl BattleInformationSetFirstAttack
/* 8010F450 0010C450  7F E3 FB 78 */	mr r3, r31
/* 8010F454 0010C454  38 80 00 00 */	li r4, 0
/* 8010F458 0010C458  4B FF FF B5 */	bl BattleInformationSetResult
/* 8010F45C 0010C45C  38 00 00 00 */	li r0, 0
/* 8010F460 0010C460  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8010F464 0010C464  90 1F 00 14 */	stw r0, 0x14(r31)
/* 8010F468 0010C468  98 1F 00 18 */	stb r0, 0x18(r31)
/* 8010F46C 0010C46C  98 1F 00 19 */	stb r0, 0x19(r31)
/* 8010F470 0010C470  98 1F 00 1A */	stb r0, 0x1a(r31)
/* 8010F474 0010C474  98 1F 00 1B */	stb r0, 0x1b(r31)
/* 8010F478 0010C478  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8010F47C 0010C47C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8010F480 0010C480  7C 08 03 A6 */	mtlr r0
/* 8010F484 0010C484  38 21 00 10 */	addi r1, r1, 0x10
/* 8010F488 0010C488  4E 80 00 20 */	blr 

.global BattleInformationSetFirstAttack
BattleInformationSetFirstAttack:
/* 8010F48C 0010C48C  90 83 00 08 */	stw r4, 8(r3)
/* 8010F490 0010C490  4E 80 00 20 */	blr 

.global func_8010F494
func_8010F494:

.global BattleInformationSetParty
BattleInformationSetParty:
/* 8010F494 0010C494  90 83 00 04 */	stw r4, 4(r3)
/* 8010F498 0010C498  4E 80 00 20 */	blr 

.global BattleInformationSetMode
BattleInformationSetMode:
/* 8010F49C 0010C49C  90 83 00 00 */	stw r4, 0(r3)
/* 8010F4A0 0010C4A0  4E 80 00 20 */	blr 
