.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global func_8013A960
func_8013A960:

.global effSmallStarCamChg
effSmallStarCamChg:
/* 8013A960 00137960  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013A964 00137964  7C 08 02 A6 */	mflr r0
/* 8013A968 00137968  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013A96C 0013796C  48 0A 66 8D */	bl effSmallStarN64CamChg
/* 8013A970 00137970  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013A974 00137974  7C 08 03 A6 */	mtlr r0
/* 8013A978 00137978  38 21 00 10 */	addi r1, r1, 0x10
/* 8013A97C 0013797C  4E 80 00 20 */	blr 

.global func_8013A980
func_8013A980:

.global effSmallStarEntry
effSmallStarEntry:
/* 8013A980 00137980  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013A984 00137984  7C 08 02 A6 */	mflr r0
/* 8013A988 00137988  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013A98C 0013798C  48 0A 6C D5 */	bl effSmallStarN64Entry
/* 8013A990 00137990  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013A994 00137994  7C 08 03 A6 */	mtlr r0
/* 8013A998 00137998  38 21 00 10 */	addi r1, r1, 0x10
/* 8013A99C 0013799C  4E 80 00 20 */	blr 
