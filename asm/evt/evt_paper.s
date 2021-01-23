.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global evt_paper_delete
evt_paper_delete:
/* 8006D188 0006A188  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8006D18C 0006A18C  7C 08 02 A6 */	mflr r0
/* 8006D190 0006A190  90 01 00 14 */	stw r0, 0x14(r1)
/* 8006D194 0006A194  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8006D198 0006A198  80 84 00 00 */	lwz r4, 0(r4)
/* 8006D19C 0006A19C  4B FC 3A 31 */	bl evtGetValue
/* 8006D1A0 0006A1A0  80 8D 90 B0 */	lwz r4, gp-_SDA_BASE_(r13)
/* 8006D1A4 0006A1A4  80 84 00 14 */	lwz r4, 0x14(r4)
/* 8006D1A8 0006A1A8  7C 04 00 D0 */	neg r0, r4
/* 8006D1AC 0006A1AC  7C 00 23 78 */	or r0, r0, r4
/* 8006D1B0 0006A1B0  54 04 0F FE */	srwi r4, r0, 0x1f
/* 8006D1B4 0006A1B4  4B FD 38 3D */	bl animPaperPoseGetId
/* 8006D1B8 0006A1B8  4B FC D9 A1 */	bl animPaperPoseRelease
/* 8006D1BC 0006A1BC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8006D1C0 0006A1C0  38 60 00 02 */	li r3, 2
/* 8006D1C4 0006A1C4  7C 08 03 A6 */	mtlr r0
/* 8006D1C8 0006A1C8  38 21 00 10 */	addi r1, r1, 0x10
/* 8006D1CC 0006A1CC  4E 80 00 20 */	blr 

.global evt_paper_entry
evt_paper_entry:
/* 8006D1D0 0006A1D0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8006D1D4 0006A1D4  7C 08 02 A6 */	mflr r0
/* 8006D1D8 0006A1D8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8006D1DC 0006A1DC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8006D1E0 0006A1E0  93 C1 00 08 */	stw r30, 8(r1)
/* 8006D1E4 0006A1E4  80 83 00 18 */	lwz r4, 0x18(r3)
/* 8006D1E8 0006A1E8  80 84 00 00 */	lwz r4, 0(r4)
/* 8006D1EC 0006A1EC  4B FC 39 E1 */	bl evtGetValue
/* 8006D1F0 0006A1F0  80 8D 90 B0 */	lwz r4, gp-_SDA_BASE_(r13)
/* 8006D1F4 0006A1F4  7C 7F 1B 78 */	mr r31, r3
/* 8006D1F8 0006A1F8  38 A0 00 00 */	li r5, 0
/* 8006D1FC 0006A1FC  80 84 00 14 */	lwz r4, 0x14(r4)
/* 8006D200 0006A200  7C 04 00 D0 */	neg r0, r4
/* 8006D204 0006A204  7C 00 23 78 */	or r0, r0, r4
/* 8006D208 0006A208  54 1E 0F FE */	srwi r30, r0, 0x1f
/* 8006D20C 0006A20C  7F C4 F3 78 */	mr r4, r30
/* 8006D210 0006A210  4B FC C4 61 */	bl animGroupBaseAsync
/* 8006D214 0006A214  2C 03 00 00 */	cmpwi r3, 0
/* 8006D218 0006A218  40 82 00 0C */	bne lbl_8006D224
/* 8006D21C 0006A21C  38 60 00 00 */	li r3, 0
/* 8006D220 0006A220  48 00 00 14 */	b lbl_8006D234
lbl_8006D224:
/* 8006D224 0006A224  7F E3 FB 78 */	mr r3, r31
/* 8006D228 0006A228  7F C4 F3 78 */	mr r4, r30
/* 8006D22C 0006A22C  4B FD 3D 59 */	bl animPaperPoseEntry
/* 8006D230 0006A230  38 60 00 02 */	li r3, 2
lbl_8006D234:
/* 8006D234 0006A234  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8006D238 0006A238  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8006D23C 0006A23C  83 C1 00 08 */	lwz r30, 8(r1)
/* 8006D240 0006A240  7C 08 03 A6 */	mtlr r0
/* 8006D244 0006A244  38 21 00 10 */	addi r1, r1, 0x10
/* 8006D248 0006A248  4E 80 00 20 */	blr 
