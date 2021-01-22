.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global func_8012FA00
func_8012FA00:

.global effButterflyEntry
effButterflyEntry:
/* 8012FA00 0012CA00  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8012FA04 0012CA04  7C 08 02 A6 */	mflr r0
/* 8012FA08 0012CA08  90 01 00 14 */	stw r0, 0x14(r1)
/* 8012FA0C 0012CA0C  48 07 FA 99 */	bl effButterflyN64Entry
/* 8012FA10 0012CA10  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8012FA14 0012CA14  7C 08 03 A6 */	mtlr r0
/* 8012FA18 0012CA18  38 21 00 10 */	addi r1, r1, 0x10
/* 8012FA1C 0012CA1C  4E 80 00 20 */	blr 
