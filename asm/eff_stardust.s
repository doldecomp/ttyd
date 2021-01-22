.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global func_8013C210
func_8013C210:

.global effStardustEntry
effStardustEntry:
/* 8013C210 00139210  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013C214 00139214  7C 08 02 A6 */	mflr r0
/* 8013C218 00139218  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013C21C 0013921C  48 0A A9 45 */	bl effStardust2N64Entry
/* 8013C220 00139220  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013C224 00139224  7C 08 03 A6 */	mtlr r0
/* 8013C228 00139228  38 21 00 10 */	addi r1, r1, 0x10
/* 8013C22C 0013922C  4E 80 00 20 */	blr 
