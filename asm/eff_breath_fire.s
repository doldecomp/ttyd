.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global func_80140B7C
func_80140B7C:

.global effBreathFireEntry
effBreathFireEntry:
/* 80140B7C 0013DB7C  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80140B80 0013DB80  7C 08 02 A6 */	mflr r0
/* 80140B84 0013DB84  90 01 00 14 */	stw r0, 0x14(r1)
/* 80140B88 0013DB88  48 06 C5 E9 */	bl effBreathFireN64Entry
/* 80140B8C 0013DB8C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80140B90 0013DB90  7C 08 03 A6 */	mtlr r0
/* 80140B94 0013DB94  38 21 00 10 */	addi r1, r1, 0x10
/* 80140B98 0013DB98  4E 80 00 20 */	blr 
