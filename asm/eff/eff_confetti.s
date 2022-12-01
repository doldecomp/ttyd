.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effConfettiEntry
effConfettiEntry:
/* 8012FA20 0012CA20  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8012FA24 0012CA24  7C 08 02 A6 */	mflr r0
/* 8012FA28 0012CA28  C0 82 B3 B0 */	lfs f4, lbl_8041C730@sda21(r2)
/* 8012FA2C 0012CA2C  90 01 00 14 */	stw r0, 0x14(r1)
/* 8012FA30 0012CA30  48 08 19 B1 */	bl effConfettiN64Entry
/* 8012FA34 0012CA34  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8012FA38 0012CA38  7C 08 03 A6 */	mtlr r0
/* 8012FA3C 0012CA3C  38 21 00 10 */	addi r1, r1, 0x10
/* 8012FA40 0012CA40  4E 80 00 20 */	blr 
