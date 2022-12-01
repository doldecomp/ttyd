.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effTogeFlushDisp
effTogeFlushDisp:
/* 8018EF2C 0018BF2C  94 21 FE 90 */	stwu r1, -0x170(r1)
/* 8018EF30 0018BF30  7C 08 02 A6 */	mflr r0
/* 8018EF34 0018BF34  90 01 01 74 */	stw r0, 0x174(r1)
/* 8018EF38 0018BF38  BF 61 01 5C */	stmw r27, 0x15c(r1)
/* 8018EF3C 0018BF3C  7C 7D 1B 78 */	mr r29, r3
/* 8018EF40 0018BF40  83 E4 00 0C */	lwz r31, 0xc(r4)
/* 8018EF44 0018BF44  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 8018EF48 0018BF48  83 DF 00 00 */	lwz r30, 0(r31)
/* 8018EF4C 0018BF4C  2C 00 00 0A */	cmpwi r0, 0xa
/* 8018EF50 0018BF50  40 81 00 14 */	ble lbl_8018EF64
/* 8018EF54 0018BF54  38 81 00 48 */	addi r4, r1, 0x48
/* 8018EF58 0018BF58  38 60 00 19 */	li r3, 0x19
/* 8018EF5C 0018BF5C  4B EC EF 51 */	bl effGetTexObj
/* 8018EF60 0018BF60  48 00 00 28 */	b lbl_8018EF88
lbl_8018EF64:
/* 8018EF64 0018BF64  2C 00 00 05 */	cmpwi r0, 5
/* 8018EF68 0018BF68  40 81 00 14 */	ble lbl_8018EF7C
/* 8018EF6C 0018BF6C  38 81 00 48 */	addi r4, r1, 0x48
/* 8018EF70 0018BF70  38 60 00 1A */	li r3, 0x1a
/* 8018EF74 0018BF74  4B EC EF 39 */	bl effGetTexObj
/* 8018EF78 0018BF78  48 00 00 10 */	b lbl_8018EF88
lbl_8018EF7C:
/* 8018EF7C 0018BF7C  38 81 00 48 */	addi r4, r1, 0x48
/* 8018EF80 0018BF80  38 60 00 1B */	li r3, 0x1b
/* 8018EF84 0018BF84  4B EC EF 29 */	bl effGetTexObj
lbl_8018EF88:
/* 8018EF88 0018BF88  38 61 00 48 */	addi r3, r1, 0x48
/* 8018EF8C 0018BF8C  38 80 00 00 */	li r4, 0
/* 8018EF90 0018BF90  48 12 2A ED */	bl GXLoadTexObj
/* 8018EF94 0018BF94  38 60 00 00 */	li r3, 0
/* 8018EF98 0018BF98  48 12 21 A1 */	bl GXSetNumChans
/* 8018EF9C 0018BF9C  38 60 00 04 */	li r3, 4
/* 8018EFA0 0018BFA0  38 80 00 00 */	li r4, 0
/* 8018EFA4 0018BFA4  38 A0 00 00 */	li r5, 0
/* 8018EFA8 0018BFA8  38 C0 00 00 */	li r6, 0
/* 8018EFAC 0018BFAC  38 E0 00 00 */	li r7, 0
/* 8018EFB0 0018BFB0  39 00 00 00 */	li r8, 0
/* 8018EFB4 0018BFB4  39 20 00 02 */	li r9, 2
/* 8018EFB8 0018BFB8  48 12 21 BD */	bl GXSetChanCtrl
/* 8018EFBC 0018BFBC  38 60 00 01 */	li r3, 1
/* 8018EFC0 0018BFC0  48 12 02 C1 */	bl GXSetNumTexGens
/* 8018EFC4 0018BFC4  38 60 00 00 */	li r3, 0
/* 8018EFC8 0018BFC8  38 80 00 01 */	li r4, 1
/* 8018EFCC 0018BFCC  38 A0 00 04 */	li r5, 4
/* 8018EFD0 0018BFD0  38 C0 00 3C */	li r6, 0x3c
/* 8018EFD4 0018BFD4  38 E0 00 00 */	li r7, 0
/* 8018EFD8 0018BFD8  39 00 00 7D */	li r8, 0x7d
/* 8018EFDC 0018BFDC  48 12 00 25 */	bl GXSetTexCoordGen2
/* 8018EFE0 0018BFE0  38 60 00 01 */	li r3, 1
/* 8018EFE4 0018BFE4  48 12 41 E5 */	bl GXSetNumTevStages
/* 8018EFE8 0018BFE8  38 60 00 00 */	li r3, 0
/* 8018EFEC 0018BFEC  38 80 00 00 */	li r4, 0
/* 8018EFF0 0018BFF0  38 A0 00 00 */	li r5, 0
/* 8018EFF4 0018BFF4  38 C0 00 FF */	li r6, 0xff
/* 8018EFF8 0018BFF8  48 12 40 35 */	bl GXSetTevOrder
/* 8018EFFC 0018BFFC  38 60 00 00 */	li r3, 0
/* 8018F000 0018C000  38 80 00 00 */	li r4, 0
/* 8018F004 0018C004  38 A0 00 00 */	li r5, 0
/* 8018F008 0018C008  38 C0 00 00 */	li r6, 0
/* 8018F00C 0018C00C  38 E0 00 01 */	li r7, 1
/* 8018F010 0018C010  39 00 00 00 */	li r8, 0
/* 8018F014 0018C014  48 12 3B D1 */	bl GXSetTevColorOp
/* 8018F018 0018C018  38 60 00 00 */	li r3, 0
/* 8018F01C 0018C01C  38 80 00 00 */	li r4, 0
/* 8018F020 0018C020  38 A0 00 00 */	li r5, 0
/* 8018F024 0018C024  38 C0 00 00 */	li r6, 0
/* 8018F028 0018C028  38 E0 00 01 */	li r7, 1
/* 8018F02C 0018C02C  39 00 00 00 */	li r8, 0
/* 8018F030 0018C030  48 12 3C 1D */	bl GXSetTevAlphaOp
/* 8018F034 0018C034  38 60 00 00 */	li r3, 0
/* 8018F038 0018C038  38 80 00 0F */	li r4, 0xf
/* 8018F03C 0018C03C  38 A0 00 0F */	li r5, 0xf
/* 8018F040 0018C040  38 C0 00 0F */	li r6, 0xf
/* 8018F044 0018C044  38 E0 00 02 */	li r7, 2
/* 8018F048 0018C048  48 12 3B 15 */	bl GXSetTevColorIn
/* 8018F04C 0018C04C  38 60 00 00 */	li r3, 0
/* 8018F050 0018C050  38 80 00 07 */	li r4, 7
/* 8018F054 0018C054  38 A0 00 01 */	li r5, 1
/* 8018F058 0018C058  38 C0 00 04 */	li r6, 4
/* 8018F05C 0018C05C  38 E0 00 07 */	li r7, 7
/* 8018F060 0018C060  48 12 3B 41 */	bl GXSetTevAlphaIn
/* 8018F064 0018C064  48 11 F6 B9 */	bl GXClearVtxDesc
/* 8018F068 0018C068  38 60 00 09 */	li r3, 9
/* 8018F06C 0018C06C  38 80 00 01 */	li r4, 1
/* 8018F070 0018C070  48 11 ED 95 */	bl GXSetVtxDesc
/* 8018F074 0018C074  38 60 00 0D */	li r3, 0xd
/* 8018F078 0018C078  38 80 00 01 */	li r4, 1
/* 8018F07C 0018C07C  48 11 ED 89 */	bl GXSetVtxDesc
/* 8018F080 0018C080  38 60 00 00 */	li r3, 0
/* 8018F084 0018C084  38 80 00 09 */	li r4, 9
/* 8018F088 0018C088  38 A0 00 01 */	li r5, 1
/* 8018F08C 0018C08C  38 C0 00 04 */	li r6, 4
/* 8018F090 0018C090  38 E0 00 00 */	li r7, 0
/* 8018F094 0018C094  48 11 F6 C1 */	bl GXSetVtxAttrFmt
/* 8018F098 0018C098  38 60 00 00 */	li r3, 0
/* 8018F09C 0018C09C  38 80 00 0D */	li r4, 0xd
/* 8018F0A0 0018C0A0  38 A0 00 01 */	li r5, 1
/* 8018F0A4 0018C0A4  38 C0 00 04 */	li r6, 4
/* 8018F0A8 0018C0A8  38 E0 00 00 */	li r7, 0
/* 8018F0AC 0018C0AC  48 11 F6 A9 */	bl GXSetVtxAttrFmt
/* 8018F0B0 0018C0B0  C0 3F 00 04 */	lfs f1, 4(r31)
/* 8018F0B4 0018C0B4  38 61 01 28 */	addi r3, r1, 0x128
/* 8018F0B8 0018C0B8  C0 5F 00 08 */	lfs f2, 8(r31)
/* 8018F0BC 0018C0BC  C0 7F 00 0C */	lfs f3, 0xc(r31)
/* 8018F0C0 0018C0C0  48 10 93 6D */	bl PSMTXTrans
/* 8018F0C4 0018C0C4  7F A3 EB 78 */	mr r3, r29
/* 8018F0C8 0018C0C8  4B E8 00 89 */	bl camGetPtr
/* 8018F0CC 0018C0CC  C0 23 01 14 */	lfs f1, 0x114(r3)
/* 8018F0D0 0018C0D0  38 61 00 F8 */	addi r3, r1, 0xf8
/* 8018F0D4 0018C0D4  C0 02 CF C4 */	lfs f0, lbl_8041E344@sda21(r2)
/* 8018F0D8 0018C0D8  38 80 00 79 */	li r4, 0x79
/* 8018F0DC 0018C0DC  FC 20 08 50 */	fneg f1, f1
/* 8018F0E0 0018C0E0  EC 20 00 72 */	fmuls f1, f0, f1
/* 8018F0E4 0018C0E4  48 10 91 09 */	bl PSMTXRotRad
/* 8018F0E8 0018C0E8  38 61 01 28 */	addi r3, r1, 0x128
/* 8018F0EC 0018C0EC  38 81 00 F8 */	addi r4, r1, 0xf8
/* 8018F0F0 0018C0F0  38 A1 00 68 */	addi r5, r1, 0x68
/* 8018F0F4 0018C0F4  48 10 8E 6D */	bl PSMTXConcat
/* 8018F0F8 0018C0F8  C0 3F 00 20 */	lfs f1, 0x20(r31)
/* 8018F0FC 0018C0FC  38 61 00 C8 */	addi r3, r1, 0xc8
/* 8018F100 0018C100  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 8018F104 0018C104  FC 40 08 90 */	fmr f2, f1
/* 8018F108 0018C108  83 7F 00 28 */	lwz r27, 0x28(r31)
/* 8018F10C 0018C10C  1F 80 00 03 */	mulli r28, r0, 3
/* 8018F110 0018C110  FC 60 08 90 */	fmr f3, f1
/* 8018F114 0018C114  48 10 93 99 */	bl PSMTXScale
/* 8018F118 0018C118  38 61 00 68 */	addi r3, r1, 0x68
/* 8018F11C 0018C11C  38 81 00 C8 */	addi r4, r1, 0xc8
/* 8018F120 0018C120  38 A1 00 98 */	addi r5, r1, 0x98
/* 8018F124 0018C124  48 10 8E 3D */	bl PSMTXConcat
/* 8018F128 0018C128  7F A3 EB 78 */	mr r3, r29
/* 8018F12C 0018C12C  4B E8 00 25 */	bl camGetPtr
/* 8018F130 0018C130  38 81 00 98 */	addi r4, r1, 0x98
/* 8018F134 0018C134  38 63 01 1C */	addi r3, r3, 0x11c
/* 8018F138 0018C138  7C 85 23 78 */	mr r5, r4
/* 8018F13C 0018C13C  48 10 8E 25 */	bl PSMTXConcat
/* 8018F140 0018C140  38 61 00 98 */	addi r3, r1, 0x98
/* 8018F144 0018C144  38 80 00 00 */	li r4, 0
/* 8018F148 0018C148  48 12 53 B1 */	bl GXLoadPosMtxImm
/* 8018F14C 0018C14C  38 60 00 00 */	li r3, 0
/* 8018F150 0018C150  48 12 54 49 */	bl GXSetCurrentMtx
/* 8018F154 0018C154  2C 1E 00 02 */	cmpwi r30, 2
/* 8018F158 0018C158  41 82 00 B0 */	beq lbl_8018F208
/* 8018F15C 0018C15C  40 80 00 14 */	bge lbl_8018F170
/* 8018F160 0018C160  2C 1E 00 00 */	cmpwi r30, 0
/* 8018F164 0018C164  41 82 00 1C */	beq lbl_8018F180
/* 8018F168 0018C168  40 80 00 7C */	bge lbl_8018F1E4
/* 8018F16C 0018C16C  48 00 01 04 */	b lbl_8018F270
lbl_8018F170:
/* 8018F170 0018C170  2C 1E 00 04 */	cmpwi r30, 4
/* 8018F174 0018C174  41 82 00 DC */	beq lbl_8018F250
/* 8018F178 0018C178  40 80 00 F8 */	bge lbl_8018F270
/* 8018F17C 0018C17C  48 00 00 B0 */	b lbl_8018F22C
lbl_8018F180:
/* 8018F180 0018C180  3C 60 2A AB */	lis r3, 0x2AAAAAAB@ha
/* 8018F184 0018C184  80 02 1C F0 */	lwz r0, lbl_80423070@sda21(r2)
/* 8018F188 0018C188  38 63 AA AB */	addi r3, r3, 0x2AAAAAAB@l
/* 8018F18C 0018C18C  38 AD B4 78 */	addi r5, r13, lbl_804126D8@sda21
/* 8018F190 0018C190  7C C3 E0 96 */	mulhw r6, r3, r28
/* 8018F194 0018C194  90 01 00 40 */	stw r0, 0x40(r1)
/* 8018F198 0018C198  38 81 00 44 */	addi r4, r1, 0x44
/* 8018F19C 0018C19C  9B 61 00 43 */	stb r27, 0x43(r1)
/* 8018F1A0 0018C1A0  38 60 00 01 */	li r3, 1
/* 8018F1A4 0018C1A4  7C C0 16 70 */	srawi r0, r6, 2
/* 8018F1A8 0018C1A8  54 06 0F FE */	srwi r6, r0, 0x1f
/* 8018F1AC 0018C1AC  7C 00 32 14 */	add r0, r0, r6
/* 8018F1B0 0018C1B0  1C 00 00 18 */	mulli r0, r0, 0x18
/* 8018F1B4 0018C1B4  7F 80 E0 50 */	subf r28, r0, r28
/* 8018F1B8 0018C1B8  7C C5 E2 14 */	add r6, r5, r28
/* 8018F1BC 0018C1BC  7C E5 E0 AE */	lbzx r7, r5, r28
/* 8018F1C0 0018C1C0  88 A6 00 01 */	lbz r5, 1(r6)
/* 8018F1C4 0018C1C4  88 06 00 02 */	lbz r0, 2(r6)
/* 8018F1C8 0018C1C8  98 E1 00 40 */	stb r7, 0x40(r1)
/* 8018F1CC 0018C1CC  98 A1 00 41 */	stb r5, 0x41(r1)
/* 8018F1D0 0018C1D0  98 01 00 42 */	stb r0, 0x42(r1)
/* 8018F1D4 0018C1D4  80 01 00 40 */	lwz r0, 0x40(r1)
/* 8018F1D8 0018C1D8  90 01 00 44 */	stw r0, 0x44(r1)
/* 8018F1DC 0018C1DC  48 12 3A D9 */	bl GXSetTevColor
/* 8018F1E0 0018C1E0  48 00 00 90 */	b lbl_8018F270
lbl_8018F1E4:
/* 8018F1E4 0018C1E4  80 02 CF A8 */	lwz r0, lbl_8041E328@sda21(r2)
/* 8018F1E8 0018C1E8  38 81 00 3C */	addi r4, r1, 0x3c
/* 8018F1EC 0018C1EC  38 60 00 01 */	li r3, 1
/* 8018F1F0 0018C1F0  90 01 00 38 */	stw r0, 0x38(r1)
/* 8018F1F4 0018C1F4  9B 61 00 3B */	stb r27, 0x3b(r1)
/* 8018F1F8 0018C1F8  80 01 00 38 */	lwz r0, 0x38(r1)
/* 8018F1FC 0018C1FC  90 01 00 3C */	stw r0, 0x3c(r1)
/* 8018F200 0018C200  48 12 3A B5 */	bl GXSetTevColor
/* 8018F204 0018C204  48 00 00 6C */	b lbl_8018F270
lbl_8018F208:
/* 8018F208 0018C208  80 02 CF AC */	lwz r0, lbl_8041E32C@sda21(r2)
/* 8018F20C 0018C20C  38 81 00 34 */	addi r4, r1, 0x34
/* 8018F210 0018C210  38 60 00 01 */	li r3, 1
/* 8018F214 0018C214  90 01 00 30 */	stw r0, 0x30(r1)
/* 8018F218 0018C218  9B 61 00 33 */	stb r27, 0x33(r1)
/* 8018F21C 0018C21C  80 01 00 30 */	lwz r0, 0x30(r1)
/* 8018F220 0018C220  90 01 00 34 */	stw r0, 0x34(r1)
/* 8018F224 0018C224  48 12 3A 91 */	bl GXSetTevColor
/* 8018F228 0018C228  48 00 00 48 */	b lbl_8018F270
lbl_8018F22C:
/* 8018F22C 0018C22C  80 02 CF B0 */	lwz r0, lbl_8041E330@sda21(r2)
/* 8018F230 0018C230  38 81 00 2C */	addi r4, r1, 0x2c
/* 8018F234 0018C234  38 60 00 01 */	li r3, 1
/* 8018F238 0018C238  90 01 00 28 */	stw r0, 0x28(r1)
/* 8018F23C 0018C23C  9B 61 00 2B */	stb r27, 0x2b(r1)
/* 8018F240 0018C240  80 01 00 28 */	lwz r0, 0x28(r1)
/* 8018F244 0018C244  90 01 00 2C */	stw r0, 0x2c(r1)
/* 8018F248 0018C248  48 12 3A 6D */	bl GXSetTevColor
/* 8018F24C 0018C24C  48 00 00 24 */	b lbl_8018F270
lbl_8018F250:
/* 8018F250 0018C250  80 02 CF B4 */	lwz r0, lbl_8041E334@sda21(r2)
/* 8018F254 0018C254  38 81 00 24 */	addi r4, r1, 0x24
/* 8018F258 0018C258  38 60 00 01 */	li r3, 1
/* 8018F25C 0018C25C  90 01 00 20 */	stw r0, 0x20(r1)
/* 8018F260 0018C260  9B 61 00 23 */	stb r27, 0x23(r1)
/* 8018F264 0018C264  80 01 00 20 */	lwz r0, 0x20(r1)
/* 8018F268 0018C268  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018F26C 0018C26C  48 12 3A 49 */	bl GXSetTevColor
lbl_8018F270:
/* 8018F270 0018C270  38 60 00 80 */	li r3, 0x80
/* 8018F274 0018C274  38 80 00 00 */	li r4, 0
/* 8018F278 0018C278  38 A0 00 04 */	li r5, 4
/* 8018F27C 0018C27C  48 12 09 ED */	bl GXBegin
/* 8018F280 0018C280  C0 02 CF C8 */	lfs f0, lbl_8041E348@sda21(r2)
/* 8018F284 0018C284  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8018F288 0018C288  D0 03 80 00 */	stfs f0, 0xCC008000@l(r3)
/* 8018F28C 0018C28C  C0 02 CF CC */	lfs f0, lbl_8041E34C@sda21(r2)
/* 8018F290 0018C290  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F294 0018C294  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F298 0018C298  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F29C 0018C29C  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F2A0 0018C2A0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2A4 0018C2A4  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F2A8 0018C2A8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2AC 0018C2AC  C0 02 CF CC */	lfs f0, lbl_8041E34C@sda21(r2)
/* 8018F2B0 0018C2B0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2B4 0018C2B4  C0 02 CF CC */	lfs f0, lbl_8041E34C@sda21(r2)
/* 8018F2B8 0018C2B8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2BC 0018C2BC  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F2C0 0018C2C0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2C4 0018C2C4  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F2C8 0018C2C8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2CC 0018C2CC  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F2D0 0018C2D0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2D4 0018C2D4  C0 02 CF CC */	lfs f0, lbl_8041E34C@sda21(r2)
/* 8018F2D8 0018C2D8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2DC 0018C2DC  C0 02 CF C8 */	lfs f0, lbl_8041E348@sda21(r2)
/* 8018F2E0 0018C2E0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2E4 0018C2E4  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F2E8 0018C2E8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2EC 0018C2EC  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F2F0 0018C2F0  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2F4 0018C2F4  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F2F8 0018C2F8  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F2FC 0018C2FC  C0 02 CF C8 */	lfs f0, lbl_8041E348@sda21(r2)
/* 8018F300 0018C300  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F304 0018C304  C0 02 CF C8 */	lfs f0, lbl_8041E348@sda21(r2)
/* 8018F308 0018C308  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F30C 0018C30C  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F310 0018C310  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F314 0018C314  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F318 0018C318  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F31C 0018C31C  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F320 0018C320  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F324 0018C324  83 9F 00 24 */	lwz r28, 0x24(r31)
/* 8018F328 0018C328  2C 1C 00 FF */	cmpwi r28, 0xff
/* 8018F32C 0018C32C  40 81 00 08 */	ble lbl_8018F334
/* 8018F330 0018C330  3B 80 00 FF */	li r28, 0xff
lbl_8018F334:
/* 8018F334 0018C334  2C 1C 00 00 */	cmpwi r28, 0
/* 8018F338 0018C338  40 81 01 B0 */	ble lbl_8018F4E8
/* 8018F33C 0018C33C  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 8018F340 0018C340  38 61 00 C8 */	addi r3, r1, 0xc8
/* 8018F344 0018C344  FC 40 08 90 */	fmr f2, f1
/* 8018F348 0018C348  FC 60 08 90 */	fmr f3, f1
/* 8018F34C 0018C34C  48 10 91 61 */	bl PSMTXScale
/* 8018F350 0018C350  38 61 00 68 */	addi r3, r1, 0x68
/* 8018F354 0018C354  38 81 00 C8 */	addi r4, r1, 0xc8
/* 8018F358 0018C358  38 A1 00 98 */	addi r5, r1, 0x98
/* 8018F35C 0018C35C  48 10 8C 05 */	bl PSMTXConcat
/* 8018F360 0018C360  C0 22 CF C4 */	lfs f1, lbl_8041E344@sda21(r2)
/* 8018F364 0018C364  38 61 00 F8 */	addi r3, r1, 0xf8
/* 8018F368 0018C368  C0 1F 00 10 */	lfs f0, 0x10(r31)
/* 8018F36C 0018C36C  38 80 00 7A */	li r4, 0x7a
/* 8018F370 0018C370  EC 21 00 32 */	fmuls f1, f1, f0
/* 8018F374 0018C374  48 10 8E 79 */	bl PSMTXRotRad
/* 8018F378 0018C378  38 61 00 98 */	addi r3, r1, 0x98
/* 8018F37C 0018C37C  38 81 00 F8 */	addi r4, r1, 0xf8
/* 8018F380 0018C380  7C 65 1B 78 */	mr r5, r3
/* 8018F384 0018C384  48 10 8B DD */	bl PSMTXConcat
/* 8018F388 0018C388  7F A3 EB 78 */	mr r3, r29
/* 8018F38C 0018C38C  4B E7 FD C5 */	bl camGetPtr
/* 8018F390 0018C390  38 81 00 98 */	addi r4, r1, 0x98
/* 8018F394 0018C394  38 63 01 1C */	addi r3, r3, 0x11c
/* 8018F398 0018C398  7C 85 23 78 */	mr r5, r4
/* 8018F39C 0018C39C  48 10 8B C5 */	bl PSMTXConcat
/* 8018F3A0 0018C3A0  38 61 00 98 */	addi r3, r1, 0x98
/* 8018F3A4 0018C3A4  38 80 00 00 */	li r4, 0
/* 8018F3A8 0018C3A8  48 12 51 51 */	bl GXLoadPosMtxImm
/* 8018F3AC 0018C3AC  38 60 00 00 */	li r3, 0
/* 8018F3B0 0018C3B0  48 12 51 E9 */	bl GXSetCurrentMtx
/* 8018F3B4 0018C3B4  2C 1E 00 04 */	cmpwi r30, 4
/* 8018F3B8 0018C3B8  41 82 00 38 */	beq lbl_8018F3F0
/* 8018F3BC 0018C3BC  40 80 00 58 */	bge lbl_8018F414
/* 8018F3C0 0018C3C0  2C 1E 00 03 */	cmpwi r30, 3
/* 8018F3C4 0018C3C4  40 80 00 08 */	bge lbl_8018F3CC
/* 8018F3C8 0018C3C8  48 00 00 4C */	b lbl_8018F414
lbl_8018F3CC:
/* 8018F3CC 0018C3CC  80 02 CF B8 */	lwz r0, lbl_8041E338@sda21(r2)
/* 8018F3D0 0018C3D0  38 81 00 1C */	addi r4, r1, 0x1c
/* 8018F3D4 0018C3D4  38 60 00 01 */	li r3, 1
/* 8018F3D8 0018C3D8  90 01 00 18 */	stw r0, 0x18(r1)
/* 8018F3DC 0018C3DC  9B 81 00 1B */	stb r28, 0x1b(r1)
/* 8018F3E0 0018C3E0  80 01 00 18 */	lwz r0, 0x18(r1)
/* 8018F3E4 0018C3E4  90 01 00 1C */	stw r0, 0x1c(r1)
/* 8018F3E8 0018C3E8  48 12 38 CD */	bl GXSetTevColor
/* 8018F3EC 0018C3EC  48 00 00 48 */	b lbl_8018F434
lbl_8018F3F0:
/* 8018F3F0 0018C3F0  80 02 CF BC */	lwz r0, lbl_8041E33C@sda21(r2)
/* 8018F3F4 0018C3F4  38 81 00 14 */	addi r4, r1, 0x14
/* 8018F3F8 0018C3F8  38 60 00 01 */	li r3, 1
/* 8018F3FC 0018C3FC  90 01 00 10 */	stw r0, 0x10(r1)
/* 8018F400 0018C400  9B 81 00 13 */	stb r28, 0x13(r1)
/* 8018F404 0018C404  80 01 00 10 */	lwz r0, 0x10(r1)
/* 8018F408 0018C408  90 01 00 14 */	stw r0, 0x14(r1)
/* 8018F40C 0018C40C  48 12 38 A9 */	bl GXSetTevColor
/* 8018F410 0018C410  48 00 00 24 */	b lbl_8018F434
lbl_8018F414:
/* 8018F414 0018C414  80 02 CF C0 */	lwz r0, lbl_8041E340@sda21(r2)
/* 8018F418 0018C418  38 81 00 0C */	addi r4, r1, 0xc
/* 8018F41C 0018C41C  38 60 00 01 */	li r3, 1
/* 8018F420 0018C420  90 01 00 08 */	stw r0, 8(r1)
/* 8018F424 0018C424  9B 81 00 0B */	stb r28, 0xb(r1)
/* 8018F428 0018C428  80 01 00 08 */	lwz r0, 8(r1)
/* 8018F42C 0018C42C  90 01 00 0C */	stw r0, 0xc(r1)
/* 8018F430 0018C430  48 12 38 85 */	bl GXSetTevColor
lbl_8018F434:
/* 8018F434 0018C434  38 60 00 80 */	li r3, 0x80
/* 8018F438 0018C438  38 80 00 00 */	li r4, 0
/* 8018F43C 0018C43C  38 A0 00 04 */	li r5, 4
/* 8018F440 0018C440  48 12 08 29 */	bl GXBegin
/* 8018F444 0018C444  C0 02 CF D8 */	lfs f0, lbl_8041E358@sda21(r2)
/* 8018F448 0018C448  3C 60 CC 01 */	lis r3, 0xCC008000@ha
/* 8018F44C 0018C44C  D0 03 80 00 */	stfs f0, 0xCC008000@l(r3)
/* 8018F450 0018C450  C0 02 CF DC */	lfs f0, lbl_8041E35C@sda21(r2)
/* 8018F454 0018C454  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F458 0018C458  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F45C 0018C45C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F460 0018C460  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F464 0018C464  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F468 0018C468  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F46C 0018C46C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F470 0018C470  C0 02 CF DC */	lfs f0, lbl_8041E35C@sda21(r2)
/* 8018F474 0018C474  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F478 0018C478  C0 02 CF DC */	lfs f0, lbl_8041E35C@sda21(r2)
/* 8018F47C 0018C47C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F480 0018C480  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F484 0018C484  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F488 0018C488  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F48C 0018C48C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F490 0018C490  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F494 0018C494  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F498 0018C498  C0 02 CF DC */	lfs f0, lbl_8041E35C@sda21(r2)
/* 8018F49C 0018C49C  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4A0 0018C4A0  C0 02 CF D8 */	lfs f0, lbl_8041E358@sda21(r2)
/* 8018F4A4 0018C4A4  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4A8 0018C4A8  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F4AC 0018C4AC  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4B0 0018C4B0  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F4B4 0018C4B4  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4B8 0018C4B8  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F4BC 0018C4BC  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4C0 0018C4C0  C0 02 CF D8 */	lfs f0, lbl_8041E358@sda21(r2)
/* 8018F4C4 0018C4C4  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4C8 0018C4C8  C0 02 CF D8 */	lfs f0, lbl_8041E358@sda21(r2)
/* 8018F4CC 0018C4CC  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4D0 0018C4D0  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F4D4 0018C4D4  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4D8 0018C4D8  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F4DC 0018C4DC  D0 03 80 00 */	stfs f0, -0x8000(r3)
/* 8018F4E0 0018C4E0  C0 02 CF D4 */	lfs f0, lbl_8041E354@sda21(r2)
/* 8018F4E4 0018C4E4  D0 03 80 00 */	stfs f0, -0x8000(r3)
lbl_8018F4E8:
/* 8018F4E8 0018C4E8  BB 61 01 5C */	lmw r27, 0x15c(r1)
/* 8018F4EC 0018C4EC  80 01 01 74 */	lwz r0, 0x174(r1)
/* 8018F4F0 0018C4F0  7C 08 03 A6 */	mtlr r0
/* 8018F4F4 0018C4F4  38 21 01 70 */	addi r1, r1, 0x170
/* 8018F4F8 0018C4F8  4E 80 00 20 */	blr 
effTogeFlushMain:
/* 8018F4FC 0018C4FC  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 8018F500 0018C500  7C 08 02 A6 */	mflr r0
/* 8018F504 0018C504  90 01 00 44 */	stw r0, 0x44(r1)
/* 8018F508 0018C508  93 E1 00 3C */	stw r31, 0x3c(r1)
/* 8018F50C 0018C50C  93 C1 00 38 */	stw r30, 0x38(r1)
/* 8018F510 0018C510  93 A1 00 34 */	stw r29, 0x34(r1)
/* 8018F514 0018C514  7C 7D 1B 78 */	mr r29, r3
/* 8018F518 0018C518  83 C3 00 0C */	lwz r30, 0xc(r3)
/* 8018F51C 0018C51C  80 9E 00 2C */	lwz r4, 0x2c(r30)
/* 8018F520 0018C520  38 04 FF FF */	addi r0, r4, -1
/* 8018F524 0018C524  90 1E 00 2C */	stw r0, 0x2c(r30)
/* 8018F528 0018C528  80 9E 00 30 */	lwz r4, 0x30(r30)
/* 8018F52C 0018C52C  38 04 00 01 */	addi r0, r4, 1
/* 8018F530 0018C530  90 1E 00 30 */	stw r0, 0x30(r30)
/* 8018F534 0018C534  83 FE 00 2C */	lwz r31, 0x2c(r30)
/* 8018F538 0018C538  2C 1F 00 00 */	cmpwi r31, 0
/* 8018F53C 0018C53C  40 80 00 0C */	bge lbl_8018F548
/* 8018F540 0018C540  4B EC E6 45 */	bl effDelete
/* 8018F544 0018C544  48 00 01 E4 */	b lbl_8018F728
lbl_8018F548:
/* 8018F548 0018C548  80 DE 00 30 */	lwz r6, 0x30(r30)
/* 8018F54C 0018C54C  2C 06 00 06 */	cmpwi r6, 6
/* 8018F550 0018C550  41 81 00 58 */	bgt lbl_8018F5A8
/* 8018F554 0018C554  80 1E 00 24 */	lwz r0, 0x24(r30)
/* 8018F558 0018C558  3C 60 43 30 */	lis r3, 0x4330
/* 8018F55C 0018C55C  3C A0 80 30 */	lis r5, lbl_802F8E90@ha
/* 8018F560 0018C560  90 61 00 18 */	stw r3, 0x18(r1)
/* 8018F564 0018C564  20 80 00 DA */	subfic r4, r0, 0xda
/* 8018F568 0018C568  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 8018F56C 0018C56C  6C 84 80 00 */	xoris r4, r4, 0x8000
/* 8018F570 0018C570  C8 45 8E 90 */	lfd f2, lbl_802F8E90@l(r5)
/* 8018F574 0018C574  90 81 00 1C */	stw r4, 0x1c(r1)
/* 8018F578 0018C578  C0 62 CF E0 */	lfs f3, lbl_8041E360@sda21(r2)
/* 8018F57C 0018C57C  C8 01 00 18 */	lfd f0, 0x18(r1)
/* 8018F580 0018C580  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018F584 0018C584  EC 20 10 28 */	fsubs f1, f0, f2
/* 8018F588 0018C588  90 61 00 20 */	stw r3, 0x20(r1)
/* 8018F58C 0018C58C  C8 01 00 20 */	lfd f0, 0x20(r1)
/* 8018F590 0018C590  EC 00 10 28 */	fsubs f0, f0, f2
/* 8018F594 0018C594  EC 03 00 7A */	fmadds f0, f3, f1, f0
/* 8018F598 0018C598  FC 00 00 1E */	fctiwz f0, f0
/* 8018F59C 0018C59C  D8 01 00 28 */	stfd f0, 0x28(r1)
/* 8018F5A0 0018C5A0  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 8018F5A4 0018C5A4  90 1E 00 24 */	stw r0, 0x24(r30)
lbl_8018F5A8:
/* 8018F5A8 0018C5A8  2C 06 00 06 */	cmpwi r6, 6
/* 8018F5AC 0018C5AC  40 81 00 40 */	ble lbl_8018F5EC
/* 8018F5B0 0018C5B0  80 9E 00 24 */	lwz r4, 0x24(r30)
/* 8018F5B4 0018C5B4  3C 00 43 30 */	lis r0, 0x4330
/* 8018F5B8 0018C5B8  90 01 00 28 */	stw r0, 0x28(r1)
/* 8018F5BC 0018C5BC  3C 60 80 30 */	lis r3, lbl_802F8E90@ha
/* 8018F5C0 0018C5C0  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 8018F5C4 0018C5C4  C8 43 8E 90 */	lfd f2, lbl_802F8E90@l(r3)
/* 8018F5C8 0018C5C8  90 01 00 2C */	stw r0, 0x2c(r1)
/* 8018F5CC 0018C5CC  C0 02 CF E4 */	lfs f0, lbl_8041E364@sda21(r2)
/* 8018F5D0 0018C5D0  C8 21 00 28 */	lfd f1, 0x28(r1)
/* 8018F5D4 0018C5D4  EC 21 10 28 */	fsubs f1, f1, f2
/* 8018F5D8 0018C5D8  EC 01 00 32 */	fmuls f0, f1, f0
/* 8018F5DC 0018C5DC  FC 00 00 1E */	fctiwz f0, f0
/* 8018F5E0 0018C5E0  D8 01 00 20 */	stfd f0, 0x20(r1)
/* 8018F5E4 0018C5E4  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8018F5E8 0018C5E8  90 1E 00 24 */	stw r0, 0x24(r30)
lbl_8018F5EC:
/* 8018F5EC 0018C5EC  1C 7F 00 32 */	mulli r3, r31, 0x32
/* 8018F5F0 0018C5F0  3C 00 43 30 */	lis r0, 0x4330
/* 8018F5F4 0018C5F4  C0 3E 00 18 */	lfs f1, 0x18(r30)
/* 8018F5F8 0018C5F8  3C 80 80 30 */	lis r4, lbl_802F8E90@ha
/* 8018F5FC 0018C5FC  C0 1E 00 1C */	lfs f0, 0x1c(r30)
/* 8018F600 0018C600  6C 63 80 00 */	xoris r3, r3, 0x8000
/* 8018F604 0018C604  90 61 00 2C */	stw r3, 0x2c(r1)
/* 8018F608 0018C608  EC 61 00 2A */	fadds f3, f1, f0
/* 8018F60C 0018C60C  C8 24 8E 90 */	lfd f1, lbl_802F8E90@l(r4)
/* 8018F610 0018C610  90 01 00 28 */	stw r0, 0x28(r1)
/* 8018F614 0018C614  C0 42 CF F0 */	lfs f2, lbl_8041E370@sda21(r2)
/* 8018F618 0018C618  D0 7E 00 18 */	stfs f3, 0x18(r30)
/* 8018F61C 0018C61C  C8 01 00 28 */	lfd f0, 0x28(r1)
/* 8018F620 0018C620  C0 62 CF E8 */	lfs f3, lbl_8041E368@sda21(r2)
/* 8018F624 0018C624  EC 20 08 28 */	fsubs f1, f0, f1
/* 8018F628 0018C628  C0 9E 00 1C */	lfs f4, 0x1c(r30)
/* 8018F62C 0018C62C  C0 02 CF F4 */	lfs f0, lbl_8041E374@sda21(r2)
/* 8018F630 0018C630  EC 64 18 2A */	fadds f3, f4, f3
/* 8018F634 0018C634  EC 22 00 72 */	fmuls f1, f2, f1
/* 8018F638 0018C638  C0 42 CF EC */	lfs f2, lbl_8041E36C@sda21(r2)
/* 8018F63C 0018C63C  D0 7E 00 1C */	stfs f3, 0x1c(r30)
/* 8018F640 0018C640  EC 21 00 24 */	fdivs f1, f1, f0
/* 8018F644 0018C644  C0 7E 00 10 */	lfs f3, 0x10(r30)
/* 8018F648 0018C648  C0 1E 00 14 */	lfs f0, 0x14(r30)
/* 8018F64C 0018C64C  EC 03 00 2A */	fadds f0, f3, f0
/* 8018F650 0018C650  D0 1E 00 10 */	stfs f0, 0x10(r30)
/* 8018F654 0018C654  C0 1E 00 14 */	lfs f0, 0x14(r30)
/* 8018F658 0018C658  EC 00 00 B2 */	fmuls f0, f0, f2
/* 8018F65C 0018C65C  D0 1E 00 14 */	stfs f0, 0x14(r30)
/* 8018F660 0018C660  48 0D CD 99 */	bl sin
/* 8018F664 0018C664  1C 9F 00 28 */	mulli r4, r31, 0x28
/* 8018F668 0018C668  3C 00 43 30 */	lis r0, 0x4330
/* 8018F66C 0018C66C  90 01 00 20 */	stw r0, 0x20(r1)
/* 8018F670 0018C670  3C 60 80 30 */	lis r3, lbl_802F8E90@ha
/* 8018F674 0018C674  FC A0 08 18 */	frsp f5, f1
/* 8018F678 0018C678  C8 43 8E 90 */	lfd f2, lbl_802F8E90@l(r3)
/* 8018F67C 0018C67C  6C 80 80 00 */	xoris r0, r4, 0x8000
/* 8018F680 0018C680  C0 62 CF F0 */	lfs f3, lbl_8041E370@sda21(r2)
/* 8018F684 0018C684  90 01 00 24 */	stw r0, 0x24(r1)
/* 8018F688 0018C688  C0 02 CF F4 */	lfs f0, lbl_8041E374@sda21(r2)
/* 8018F68C 0018C68C  C8 21 00 20 */	lfd f1, 0x20(r1)
/* 8018F690 0018C690  C0 82 CF E0 */	lfs f4, lbl_8041E360@sda21(r2)
/* 8018F694 0018C694  EC 21 10 28 */	fsubs f1, f1, f2
/* 8018F698 0018C698  C0 42 CF F8 */	lfs f2, lbl_8041E378@sda21(r2)
/* 8018F69C 0018C69C  EC 44 11 7A */	fmadds f2, f4, f5, f2
/* 8018F6A0 0018C6A0  EC 23 00 72 */	fmuls f1, f3, f1
/* 8018F6A4 0018C6A4  D0 5E 00 20 */	stfs f2, 0x20(r30)
/* 8018F6A8 0018C6A8  EC 21 00 24 */	fdivs f1, f1, f0
/* 8018F6AC 0018C6AC  48 0D CD 4D */	bl sin
/* 8018F6B0 0018C6B0  FC 40 08 18 */	frsp f2, f1
/* 8018F6B4 0018C6B4  3C 60 80 30 */	lis r3, lbl_802F8E80@ha
/* 8018F6B8 0018C6B8  C0 22 D0 00 */	lfs f1, lbl_8041E380@sda21(r2)
/* 8018F6BC 0018C6BC  38 C3 8E 80 */	addi r6, r3, lbl_802F8E80@l
/* 8018F6C0 0018C6C0  C0 02 CF FC */	lfs f0, lbl_8041E37C@sda21(r2)
/* 8018F6C4 0018C6C4  38 61 00 08 */	addi r3, r1, 8
/* 8018F6C8 0018C6C8  EC 01 00 BA */	fmadds f0, f1, f2, f0
/* 8018F6CC 0018C6CC  FC 00 00 1E */	fctiwz f0, f0
/* 8018F6D0 0018C6D0  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 8018F6D4 0018C6D4  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 8018F6D8 0018C6D8  90 1E 00 28 */	stw r0, 0x28(r30)
/* 8018F6DC 0018C6DC  80 A6 00 00 */	lwz r5, 0(r6)
/* 8018F6E0 0018C6E0  80 86 00 04 */	lwz r4, 4(r6)
/* 8018F6E4 0018C6E4  80 06 00 08 */	lwz r0, 8(r6)
/* 8018F6E8 0018C6E8  90 A1 00 08 */	stw r5, 8(r1)
/* 8018F6EC 0018C6EC  90 81 00 0C */	stw r4, 0xc(r1)
/* 8018F6F0 0018C6F0  90 01 00 10 */	stw r0, 0x10(r1)
/* 8018F6F4 0018C6F4  C0 1E 00 04 */	lfs f0, 4(r30)
/* 8018F6F8 0018C6F8  D0 01 00 08 */	stfs f0, 8(r1)
/* 8018F6FC 0018C6FC  C0 1E 00 08 */	lfs f0, 8(r30)
/* 8018F700 0018C700  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8018F704 0018C704  C0 1E 00 0C */	lfs f0, 0xc(r30)
/* 8018F708 0018C708  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 8018F70C 0018C70C  4B E8 0F B5 */	bl dispCalcZ
/* 8018F710 0018C710  3C 60 80 19 */	lis r3, effTogeFlushDisp@ha
/* 8018F714 0018C714  7F A6 EB 78 */	mr r6, r29
/* 8018F718 0018C718  38 A3 EF 2C */	addi r5, r3, effTogeFlushDisp@l
/* 8018F71C 0018C71C  38 80 00 02 */	li r4, 2
/* 8018F720 0018C720  38 60 00 04 */	li r3, 4
/* 8018F724 0018C724  4B E8 12 F5 */	bl dispEntry
lbl_8018F728:
/* 8018F728 0018C728  80 01 00 44 */	lwz r0, 0x44(r1)
/* 8018F72C 0018C72C  83 E1 00 3C */	lwz r31, 0x3c(r1)
/* 8018F730 0018C730  83 C1 00 38 */	lwz r30, 0x38(r1)
/* 8018F734 0018C734  83 A1 00 34 */	lwz r29, 0x34(r1)
/* 8018F738 0018C738  7C 08 03 A6 */	mtlr r0
/* 8018F73C 0018C73C  38 21 00 40 */	addi r1, r1, 0x40
/* 8018F740 0018C740  4E 80 00 20 */	blr 

.global effTogeFlushEntry
effTogeFlushEntry:
/* 8018F744 0018C744  94 21 FF B0 */	stwu r1, -0x50(r1)
/* 8018F748 0018C748  7C 08 02 A6 */	mflr r0
/* 8018F74C 0018C74C  90 01 00 54 */	stw r0, 0x54(r1)
/* 8018F750 0018C750  DB E1 00 40 */	stfd f31, 0x40(r1)
/* 8018F754 0018C754  F3 E1 00 48 */	psq_st f31, 72(r1), 0, qr0
/* 8018F758 0018C758  DB C1 00 30 */	stfd f30, 0x30(r1)
/* 8018F75C 0018C75C  F3 C1 00 38 */	psq_st f30, 56(r1), 0, qr0
/* 8018F760 0018C760  DB A1 00 20 */	stfd f29, 0x20(r1)
/* 8018F764 0018C764  F3 A1 00 28 */	psq_st f29, 40(r1), 0, qr0
/* 8018F768 0018C768  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8018F76C 0018C76C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8018F770 0018C770  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8018F774 0018C774  FF A0 08 90 */	fmr f29, f1
/* 8018F778 0018C778  7C 7D 1B 78 */	mr r29, r3
/* 8018F77C 0018C77C  FF C0 10 90 */	fmr f30, f2
/* 8018F780 0018C780  7C 9E 23 78 */	mr r30, r4
/* 8018F784 0018C784  FF E0 18 90 */	fmr f31, f3
/* 8018F788 0018C788  4B EC E6 35 */	bl effEntry
/* 8018F78C 0018C78C  3C 80 80 30 */	lis r4, lbl_802F8E98@ha
/* 8018F790 0018C790  7C 7F 1B 78 */	mr r31, r3
/* 8018F794 0018C794  38 84 8E 98 */	addi r4, r4, lbl_802F8E98@l
/* 8018F798 0018C798  38 00 00 01 */	li r0, 1
/* 8018F79C 0018C79C  90 9F 00 14 */	stw r4, 0x14(r31)
/* 8018F7A0 0018C7A0  38 60 00 03 */	li r3, 3
/* 8018F7A4 0018C7A4  38 80 00 34 */	li r4, 0x34
/* 8018F7A8 0018C7A8  90 1F 00 08 */	stw r0, 8(r31)
/* 8018F7AC 0018C7AC  4B EA 02 E1 */	bl __memAlloc
/* 8018F7B0 0018C7B0  3C 80 80 19 */	lis r4, effTogeFlushMain@ha
/* 8018F7B4 0018C7B4  90 7F 00 0C */	stw r3, 0xc(r31)
/* 8018F7B8 0018C7B8  38 84 F4 FC */	addi r4, r4, effTogeFlushMain@l
/* 8018F7BC 0018C7BC  38 00 00 00 */	li r0, 0
/* 8018F7C0 0018C7C0  90 9F 00 10 */	stw r4, 0x10(r31)
/* 8018F7C4 0018C7C4  2C 1D 00 00 */	cmpwi r29, 0
/* 8018F7C8 0018C7C8  C0 02 CF D0 */	lfs f0, lbl_8041E350@sda21(r2)
/* 8018F7CC 0018C7CC  93 A3 00 00 */	stw r29, 0(r3)
/* 8018F7D0 0018C7D0  D3 A3 00 04 */	stfs f29, 4(r3)
/* 8018F7D4 0018C7D4  D3 C3 00 08 */	stfs f30, 8(r3)
/* 8018F7D8 0018C7D8  D3 E3 00 0C */	stfs f31, 0xc(r3)
/* 8018F7DC 0018C7DC  93 C3 00 2C */	stw r30, 0x2c(r3)
/* 8018F7E0 0018C7E0  90 03 00 30 */	stw r0, 0x30(r3)
/* 8018F7E4 0018C7E4  90 03 00 24 */	stw r0, 0x24(r3)
/* 8018F7E8 0018C7E8  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 8018F7EC 0018C7EC  41 82 00 0C */	beq lbl_8018F7F8
/* 8018F7F0 0018C7F0  2C 1D 00 03 */	cmpwi r29, 3
/* 8018F7F4 0018C7F4  40 82 00 10 */	bne lbl_8018F804
lbl_8018F7F8:
/* 8018F7F8 0018C7F8  C0 02 D0 04 */	lfs f0, lbl_8041E384@sda21(r2)
/* 8018F7FC 0018C7FC  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 8018F800 0018C800  48 00 00 08 */	b lbl_8018F808
lbl_8018F804:
/* 8018F804 0018C804  D0 03 00 14 */	stfs f0, 0x14(r3)
lbl_8018F808:
/* 8018F808 0018C808  C0 22 CF D0 */	lfs f1, lbl_8041E350@sda21(r2)
/* 8018F80C 0018C80C  38 00 00 00 */	li r0, 0
/* 8018F810 0018C810  C0 02 D0 08 */	lfs f0, lbl_8041E388@sda21(r2)
/* 8018F814 0018C814  D0 23 00 18 */	stfs f1, 0x18(r3)
/* 8018F818 0018C818  D0 03 00 1C */	stfs f0, 0x1c(r3)
/* 8018F81C 0018C81C  90 03 00 28 */	stw r0, 0x28(r3)
/* 8018F820 0018C820  D0 23 00 20 */	stfs f1, 0x20(r3)
/* 8018F824 0018C824  7F E3 FB 78 */	mr r3, r31
/* 8018F828 0018C828  E3 E1 00 48 */	psq_l f31, 72(r1), 0, qr0
/* 8018F82C 0018C82C  CB E1 00 40 */	lfd f31, 0x40(r1)
/* 8018F830 0018C830  E3 C1 00 38 */	psq_l f30, 56(r1), 0, qr0
/* 8018F834 0018C834  CB C1 00 30 */	lfd f30, 0x30(r1)
/* 8018F838 0018C838  E3 A1 00 28 */	psq_l f29, 40(r1), 0, qr0
/* 8018F83C 0018C83C  CB A1 00 20 */	lfd f29, 0x20(r1)
/* 8018F840 0018C840  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8018F844 0018C844  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 8018F848 0018C848  80 01 00 54 */	lwz r0, 0x54(r1)
/* 8018F84C 0018C84C  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 8018F850 0018C850  7C 08 03 A6 */	mtlr r0
/* 8018F854 0018C854  38 21 00 50 */	addi r1, r1, 0x50
/* 8018F858 0018C858  4E 80 00 20 */	blr 
