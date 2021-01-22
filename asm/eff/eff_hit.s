.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effHitEntry
effHitEntry:
/* 80139BBC 00136BBC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80139BC0 00136BC0  7C 08 02 A6 */	mflr r0
/* 80139BC4 00136BC4  90 01 00 14 */	stw r0, 0x14(r1)
/* 80139BC8 00136BC8  48 08 67 11 */	bl effHitN64Entry
/* 80139BCC 00136BCC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80139BD0 00136BD0  7C 08 03 A6 */	mtlr r0
/* 80139BD4 00136BD4  38 21 00 10 */	addi r1, r1, 0x10
/* 80139BD8 00136BD8  4E 80 00 20 */	blr 
