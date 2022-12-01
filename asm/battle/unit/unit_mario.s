.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global _get_mario_hammer_lv_8013fee0
_get_mario_hammer_lv_8013fee0:
/* 8013FEE0 0013CEE0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 8013FEE4 0013CEE4  7C 08 02 A6 */	mflr r0
/* 8013FEE8 0013CEE8  90 01 00 14 */	stw r0, 0x14(r1)
/* 8013FEEC 0013CEEC  93 E1 00 0C */	stw r31, 0xc(r1)
/* 8013FEF0 0013CEF0  93 C1 00 08 */	stw r30, 8(r1)
/* 8013FEF4 0013CEF4  7C 7E 1B 78 */	mr r30, r3
/* 8013FEF8 0013CEF8  80 63 00 18 */	lwz r3, 0x18(r3)
/* 8013FEFC 0013CEFC  83 E3 00 00 */	lwz r31, 0(r3)
/* 8013FF00 0013CF00  4B F9 1D 75 */	bl func_800D1C74
/* 8013FF04 0013CF04  88 03 00 99 */	lbz r0, 0x99(r3)
/* 8013FF08 0013CF08  7F C3 F3 78 */	mr r3, r30
/* 8013FF0C 0013CF0C  7F E4 FB 78 */	mr r4, r31
/* 8013FF10 0013CF10  7C 05 07 74 */	extsb r5, r0
/* 8013FF14 0013CF14  4B EF 07 55 */	bl evtSetValue
/* 8013FF18 0013CF18  80 01 00 14 */	lwz r0, 0x14(r1)
/* 8013FF1C 0013CF1C  38 60 00 02 */	li r3, 2
/* 8013FF20 0013CF20  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 8013FF24 0013CF24  83 C1 00 08 */	lwz r30, 8(r1)
/* 8013FF28 0013CF28  7C 08 03 A6 */	mtlr r0
/* 8013FF2C 0013CF2C  38 21 00 10 */	addi r1, r1, 0x10
/* 8013FF30 0013CF30  4E 80 00 20 */	blr 

.global _mario_super_emblem_anim_set
_mario_super_emblem_anim_set:
/* 8013FF34 0013CF34  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 8013FF38 0013CF38  7C 08 02 A6 */	mflr r0
/* 8013FF3C 0013CF3C  3C A0 80 2F */	lis r5, lbl_802F3780@ha
/* 8013FF40 0013CF40  90 01 00 24 */	stw r0, 0x24(r1)
/* 8013FF44 0013CF44  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 8013FF48 0013CF48  3B E5 37 80 */	addi r31, r5, lbl_802F3780@l
/* 8013FF4C 0013CF4C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 8013FF50 0013CF50  7C 7E 1B 78 */	mr r30, r3
/* 8013FF54 0013CF54  93 A1 00 14 */	stw r29, 0x14(r1)
/* 8013FF58 0013CF58  93 81 00 10 */	stw r28, 0x10(r1)
/* 8013FF5C 0013CF5C  7C 9C 23 78 */	mr r28, r4
/* 8013FF60 0013CF60  80 C3 00 18 */	lwz r6, 0x18(r3)
/* 8013FF64 0013CF64  83 AD 17 10 */	lwz r29, lbl_80418970@sda21(r13)
/* 8013FF68 0013CF68  80 86 00 00 */	lwz r4, 0(r6)
/* 8013FF6C 0013CF6C  4B EF 0C 61 */	bl evtGetValue
/* 8013FF70 0013CF70  7C 60 1B 78 */	mr r0, r3
/* 8013FF74 0013CF74  7F C3 F3 78 */	mr r3, r30
/* 8013FF78 0013CF78  7C 04 03 78 */	mr r4, r0
/* 8013FF7C 0013CF7C  4B FD FF B1 */	bl BattleTransID
/* 8013FF80 0013CF80  7C 7E 1B 78 */	mr r30, r3
/* 8013FF84 0013CF84  7F A3 EB 78 */	mr r3, r29
/* 8013FF88 0013CF88  7F C4 F3 78 */	mr r4, r30
/* 8013FF8C 0013CF8C  4B FB 39 ED */	bl BattleGetUnitPtr
/* 8013FF90 0013CF90  3B A0 00 00 */	li r29, 0
/* 8013FF94 0013CF94  38 60 01 47 */	li r3, 0x147
/* 8013FF98 0013CF98  4B F8 F2 1D */	bl pouchEquipCheckBadge
/* 8013FF9C 0013CF9C  2C 03 00 00 */	cmpwi r3, 0
/* 8013FFA0 0013CFA0  41 82 00 08 */	beq lbl_8013FFA8
/* 8013FFA4 0013CFA4  3B A0 00 01 */	li r29, 1
lbl_8013FFA8:
/* 8013FFA8 0013CFA8  38 60 01 48 */	li r3, 0x148
/* 8013FFAC 0013CFAC  4B F8 F2 09 */	bl pouchEquipCheckBadge
/* 8013FFB0 0013CFB0  2C 03 00 00 */	cmpwi r3, 0
/* 8013FFB4 0013CFB4  41 82 00 08 */	beq lbl_8013FFBC
/* 8013FFB8 0013CFB8  3B BD 00 02 */	addi r29, r29, 2
lbl_8013FFBC:
/* 8013FFBC 0013CFBC  2C 1D 00 02 */	cmpwi r29, 2
/* 8013FFC0 0013CFC0  41 82 00 28 */	beq lbl_8013FFE8
/* 8013FFC4 0013CFC4  40 80 00 10 */	bge lbl_8013FFD4
/* 8013FFC8 0013CFC8  2C 1D 00 01 */	cmpwi r29, 1
/* 8013FFCC 0013CFCC  40 80 00 14 */	bge lbl_8013FFE0
/* 8013FFD0 0013CFD0  48 00 00 28 */	b lbl_8013FFF8
lbl_8013FFD4:
/* 8013FFD4 0013CFD4  2C 1D 00 04 */	cmpwi r29, 4
/* 8013FFD8 0013CFD8  40 80 00 20 */	bge lbl_8013FFF8
/* 8013FFDC 0013CFDC  48 00 00 14 */	b lbl_8013FFF0
lbl_8013FFE0:
/* 8013FFE0 0013CFE0  3B BF 02 BC */	addi r29, r31, 0x2bc
/* 8013FFE4 0013CFE4  48 00 00 18 */	b lbl_8013FFFC
lbl_8013FFE8:
/* 8013FFE8 0013CFE8  3B BF 02 C8 */	addi r29, r31, 0x2c8
/* 8013FFEC 0013CFEC  48 00 00 10 */	b lbl_8013FFFC
lbl_8013FFF0:
/* 8013FFF0 0013CFF0  3B BF 02 D4 */	addi r29, r31, 0x2d4
/* 8013FFF4 0013CFF4  48 00 00 08 */	b lbl_8013FFFC
lbl_8013FFF8:
/* 8013FFF8 0013CFF8  3B A0 00 00 */	li r29, 0
lbl_8013FFFC:
/* 8013FFFC 0013CFFC  2C 1C 00 00 */	cmpwi r28, 0
/* 80140000 0013D000  41 82 00 A4 */	beq lbl_801400A4
/* 80140004 0013D004  28 1D 00 00 */	cmplwi r29, 0
/* 80140008 0013D008  40 82 00 0C */	bne lbl_80140014
/* 8014000C 0013D00C  38 60 00 02 */	li r3, 2
/* 80140010 0013D010  48 00 01 14 */	b lbl_80140124
lbl_80140014:
/* 80140014 0013D014  7F C3 F3 78 */	mr r3, r30
/* 80140018 0013D018  38 80 00 01 */	li r4, 1
/* 8014001C 0013D01C  4B FB 39 05 */	bl BattleGetUnitPartsPtr
/* 80140020 0013D020  7C 7F 1B 78 */	mr r31, r3
/* 80140024 0013D024  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 80140028 0013D028  4B EF 96 35 */	bl animPoseGetAnimPosePtr
/* 8014002C 0013D02C  80 7F 01 C0 */	lwz r3, 0x1c0(r31)
/* 80140030 0013D030  2C 03 FF FF */	cmpwi r3, -1
/* 80140034 0013D034  41 82 00 10 */	beq lbl_80140044
/* 80140038 0013D038  4B EF AB FD */	bl animPoseRelease
/* 8014003C 0013D03C  38 00 FF FF */	li r0, -1
/* 80140040 0013D040  90 1F 01 C0 */	stw r0, 0x1c0(r31)
lbl_80140044:
/* 80140044 0013D044  7F C3 F3 78 */	mr r3, r30
/* 80140048 0013D048  38 80 00 02 */	li r4, 2
/* 8014004C 0013D04C  4B FB 38 D5 */	bl BattleGetUnitPartsPtr
/* 80140050 0013D050  7C 7F 1B 78 */	mr r31, r3
/* 80140054 0013D054  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 80140058 0013D058  4B EF 96 05 */	bl animPoseGetAnimPosePtr
/* 8014005C 0013D05C  80 7F 01 C0 */	lwz r3, 0x1c0(r31)
/* 80140060 0013D060  2C 03 FF FF */	cmpwi r3, -1
/* 80140064 0013D064  41 82 00 10 */	beq lbl_80140074
/* 80140068 0013D068  4B EF AB CD */	bl animPoseRelease
/* 8014006C 0013D06C  38 00 FF FF */	li r0, -1
/* 80140070 0013D070  90 1F 01 C0 */	stw r0, 0x1c0(r31)
lbl_80140074:
/* 80140074 0013D074  7F C3 F3 78 */	mr r3, r30
/* 80140078 0013D078  38 80 00 03 */	li r4, 3
/* 8014007C 0013D07C  4B FB 38 A5 */	bl BattleGetUnitPartsPtr
/* 80140080 0013D080  7C 7F 1B 78 */	mr r31, r3
/* 80140084 0013D084  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 80140088 0013D088  4B EF 95 D5 */	bl animPoseGetAnimPosePtr
/* 8014008C 0013D08C  80 7F 01 C0 */	lwz r3, 0x1c0(r31)
/* 80140090 0013D090  2C 03 FF FF */	cmpwi r3, -1
/* 80140094 0013D094  41 82 00 10 */	beq lbl_801400A4
/* 80140098 0013D098  4B EF AB 9D */	bl animPoseRelease
/* 8014009C 0013D09C  38 00 FF FF */	li r0, -1
/* 801400A0 0013D0A0  90 1F 01 C0 */	stw r0, 0x1c0(r31)
lbl_801400A4:
/* 801400A4 0013D0A4  7F A3 EB 78 */	mr r3, r29
/* 801400A8 0013D0A8  38 80 00 01 */	li r4, 1
/* 801400AC 0013D0AC  4B F0 0D A1 */	bl animEffectAsync
/* 801400B0 0013D0B0  2C 03 00 00 */	cmpwi r3, 0
/* 801400B4 0013D0B4  41 82 00 6C */	beq lbl_80140120
/* 801400B8 0013D0B8  7F C3 F3 78 */	mr r3, r30
/* 801400BC 0013D0BC  38 80 00 01 */	li r4, 1
/* 801400C0 0013D0C0  4B FB 38 61 */	bl BattleGetUnitPartsPtr
/* 801400C4 0013D0C4  7C 7F 1B 78 */	mr r31, r3
/* 801400C8 0013D0C8  7F A3 EB 78 */	mr r3, r29
/* 801400CC 0013D0CC  38 80 00 01 */	li r4, 1
/* 801400D0 0013D0D0  4B F0 10 01 */	bl animPoseEntry
/* 801400D4 0013D0D4  90 7F 01 C0 */	stw r3, 0x1c0(r31)
/* 801400D8 0013D0D8  7F C3 F3 78 */	mr r3, r30
/* 801400DC 0013D0DC  38 80 00 02 */	li r4, 2
/* 801400E0 0013D0E0  4B FB 38 41 */	bl BattleGetUnitPartsPtr
/* 801400E4 0013D0E4  7C 7F 1B 78 */	mr r31, r3
/* 801400E8 0013D0E8  7F A3 EB 78 */	mr r3, r29
/* 801400EC 0013D0EC  38 80 00 01 */	li r4, 1
/* 801400F0 0013D0F0  4B F0 0F E1 */	bl animPoseEntry
/* 801400F4 0013D0F4  90 7F 01 C0 */	stw r3, 0x1c0(r31)
/* 801400F8 0013D0F8  7F C3 F3 78 */	mr r3, r30
/* 801400FC 0013D0FC  38 80 00 03 */	li r4, 3
/* 80140100 0013D100  4B FB 38 21 */	bl BattleGetUnitPartsPtr
/* 80140104 0013D104  7C 7F 1B 78 */	mr r31, r3
/* 80140108 0013D108  7F A3 EB 78 */	mr r3, r29
/* 8014010C 0013D10C  38 80 00 01 */	li r4, 1
/* 80140110 0013D110  4B F0 0F C1 */	bl animPoseEntry
/* 80140114 0013D114  90 7F 01 C0 */	stw r3, 0x1c0(r31)
/* 80140118 0013D118  38 60 00 02 */	li r3, 2
/* 8014011C 0013D11C  48 00 00 08 */	b lbl_80140124
lbl_80140120:
/* 80140120 0013D120  38 60 00 00 */	li r3, 0
lbl_80140124:
/* 80140124 0013D124  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80140128 0013D128  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 8014012C 0013D12C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80140130 0013D130  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 80140134 0013D134  83 81 00 10 */	lwz r28, 0x10(r1)
/* 80140138 0013D138  7C 08 03 A6 */	mtlr r0
/* 8014013C 0013D13C  38 21 00 20 */	addi r1, r1, 0x20
/* 80140140 0013D140  4E 80 00 20 */	blr 

.global _mario_makkuro_set
_mario_makkuro_set:
/* 80140144 0013D144  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80140148 0013D148  7C 08 02 A6 */	mflr r0
/* 8014014C 0013D14C  90 01 00 14 */	stw r0, 0x14(r1)
/* 80140150 0013D150  93 E1 00 0C */	stw r31, 0xc(r1)
/* 80140154 0013D154  80 6D 17 10 */	lwz r3, lbl_80418970@sda21(r13)
/* 80140158 0013D158  4B FB 36 FD */	bl BattleGetMarioPtr
/* 8014015C 0013D15C  7C 7F 1B 79 */	or. r31, r3, r3
/* 80140160 0013D160  41 82 00 5C */	beq lbl_801401BC
/* 80140164 0013D164  3C 80 80 14 */	lis r4, callback@ha
/* 80140168 0013D168  38 60 00 0B */	li r3, 0xb
/* 8014016C 0013D16C  38 84 02 00 */	addi r4, r4, callback@l
/* 80140170 0013D170  4B ED C2 F5 */	bl mapSetTevCallback
/* 80140174 0013D174  7F E3 FB 78 */	mr r3, r31
/* 80140178 0013D178  38 80 00 01 */	li r4, 1
/* 8014017C 0013D17C  4B FE 36 79 */	bl BtlUnit_GetPartsPtr
/* 80140180 0013D180  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 80140184 0013D184  3C 80 0B 00 */	lis r4, 0xb00
/* 80140188 0013D188  4B EF FF 0D */	bl animPoseSetMaterialFlagOn
/* 8014018C 0013D18C  7F E3 FB 78 */	mr r3, r31
/* 80140190 0013D190  38 80 00 02 */	li r4, 2
/* 80140194 0013D194  4B FE 36 61 */	bl BtlUnit_GetPartsPtr
/* 80140198 0013D198  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 8014019C 0013D19C  3C 80 0B 00 */	lis r4, 0xb00
/* 801401A0 0013D1A0  4B EF FE F5 */	bl animPoseSetMaterialFlagOn
/* 801401A4 0013D1A4  7F E3 FB 78 */	mr r3, r31
/* 801401A8 0013D1A8  38 80 00 03 */	li r4, 3
/* 801401AC 0013D1AC  4B FE 36 49 */	bl BtlUnit_GetPartsPtr
/* 801401B0 0013D1B0  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 801401B4 0013D1B4  3C 80 0B 00 */	lis r4, 0xb00
/* 801401B8 0013D1B8  4B EF FE DD */	bl animPoseSetMaterialFlagOn
lbl_801401BC:
/* 801401BC 0013D1BC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801401C0 0013D1C0  38 60 00 02 */	li r3, 2
/* 801401C4 0013D1C4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801401C8 0013D1C8  7C 08 03 A6 */	mtlr r0
/* 801401CC 0013D1CC  38 21 00 10 */	addi r1, r1, 0x10
/* 801401D0 0013D1D0  4E 80 00 20 */	blr 

.global faker_mario_makkuro_set
faker_mario_makkuro_set:
/* 801401D4 0013D1D4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801401D8 0013D1D8  7C 08 02 A6 */	mflr r0
/* 801401DC 0013D1DC  3C 80 80 14 */	lis r4, callback@ha
/* 801401E0 0013D1E0  38 60 00 0B */	li r3, 0xb
/* 801401E4 0013D1E4  90 01 00 14 */	stw r0, 0x14(r1)
/* 801401E8 0013D1E8  38 84 02 00 */	addi r4, r4, callback@l
/* 801401EC 0013D1EC  4B ED C2 79 */	bl mapSetTevCallback
/* 801401F0 0013D1F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 801401F4 0013D1F4  7C 08 03 A6 */	mtlr r0
/* 801401F8 0013D1F8  38 21 00 10 */	addi r1, r1, 0x10
/* 801401FC 0013D1FC  4E 80 00 20 */	blr 
callback:
/* 80140200 0013D200  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 80140204 0013D204  7C 08 02 A6 */	mflr r0
/* 80140208 0013D208  90 01 00 34 */	stw r0, 0x34(r1)
/* 8014020C 0013D20C  38 81 00 08 */	addi r4, r1, 8
/* 80140210 0013D210  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 80140214 0013D214  7C 7B 1B 78 */	mr r27, r3
/* 80140218 0013D218  80 02 B9 18 */	lwz r0, lbl_8041CC98@sda21(r2)
/* 8014021C 0013D21C  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 80140220 0013D220  83 C3 00 10 */	lwz r30, 0x10(r3)
/* 80140224 0013D224  38 60 00 01 */	li r3, 1
/* 80140228 0013D228  83 BB 00 14 */	lwz r29, 0x14(r27)
/* 8014022C 0013D22C  83 9B 00 18 */	lwz r28, 0x18(r27)
/* 80140230 0013D230  90 01 00 08 */	stw r0, 8(r1)
/* 80140234 0013D234  48 17 2A 81 */	bl GXSetTevColor
/* 80140238 0013D238  7F E3 FB 78 */	mr r3, r31
/* 8014023C 0013D23C  38 80 00 FF */	li r4, 0xff
/* 80140240 0013D240  38 A0 00 FF */	li r5, 0xff
/* 80140244 0013D244  38 C0 00 FF */	li r6, 0xff
/* 80140248 0013D248  48 17 2D E5 */	bl GXSetTevOrder
/* 8014024C 0013D24C  7F E3 FB 78 */	mr r3, r31
/* 80140250 0013D250  38 80 00 00 */	li r4, 0
/* 80140254 0013D254  38 A0 00 00 */	li r5, 0
/* 80140258 0013D258  38 C0 00 00 */	li r6, 0
/* 8014025C 0013D25C  38 E0 00 01 */	li r7, 1
/* 80140260 0013D260  39 00 00 00 */	li r8, 0
/* 80140264 0013D264  48 17 29 81 */	bl GXSetTevColorOp
/* 80140268 0013D268  7F E3 FB 78 */	mr r3, r31
/* 8014026C 0013D26C  38 80 00 00 */	li r4, 0
/* 80140270 0013D270  38 A0 00 00 */	li r5, 0
/* 80140274 0013D274  38 C0 00 00 */	li r6, 0
/* 80140278 0013D278  38 E0 00 01 */	li r7, 1
/* 8014027C 0013D27C  39 00 00 00 */	li r8, 0
/* 80140280 0013D280  48 17 29 CD */	bl GXSetTevAlphaOp
/* 80140284 0013D284  7F E3 FB 78 */	mr r3, r31
/* 80140288 0013D288  38 80 00 0F */	li r4, 0xf
/* 8014028C 0013D28C  38 A0 00 0F */	li r5, 0xf
/* 80140290 0013D290  38 C0 00 0F */	li r6, 0xf
/* 80140294 0013D294  38 E0 00 02 */	li r7, 2
/* 80140298 0013D298  48 17 28 C5 */	bl GXSetTevColorIn
/* 8014029C 0013D29C  7F E3 FB 78 */	mr r3, r31
/* 801402A0 0013D2A0  38 80 00 07 */	li r4, 7
/* 801402A4 0013D2A4  38 A0 00 07 */	li r5, 7
/* 801402A8 0013D2A8  38 C0 00 07 */	li r6, 7
/* 801402AC 0013D2AC  38 E0 00 00 */	li r7, 0
/* 801402B0 0013D2B0  48 17 28 F1 */	bl GXSetTevAlphaIn
/* 801402B4 0013D2B4  7F E3 FB 78 */	mr r3, r31
/* 801402B8 0013D2B8  38 80 00 00 */	li r4, 0
/* 801402BC 0013D2BC  38 A0 00 00 */	li r5, 0
/* 801402C0 0013D2C0  48 17 2B D5 */	bl GXSetTevSwapMode
/* 801402C4 0013D2C4  38 1F 00 01 */	addi r0, r31, 1
/* 801402C8 0013D2C8  90 1B 00 0C */	stw r0, 0xc(r27)
/* 801402CC 0013D2CC  93 BB 00 14 */	stw r29, 0x14(r27)
/* 801402D0 0013D2D0  93 9B 00 18 */	stw r28, 0x18(r27)
/* 801402D4 0013D2D4  93 DB 00 10 */	stw r30, 0x10(r27)
/* 801402D8 0013D2D8  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 801402DC 0013D2DC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 801402E0 0013D2E0  7C 08 03 A6 */	mtlr r0
/* 801402E4 0013D2E4  38 21 00 30 */	addi r1, r1, 0x30
/* 801402E8 0013D2E8  4E 80 00 20 */	blr 

.global mario_pinch_pose_sound_callback
mario_pinch_pose_sound_callback:
/* 801402EC 0013D2EC  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 801402F0 0013D2F0  7C 08 02 A6 */	mflr r0
/* 801402F4 0013D2F4  90 01 00 14 */	stw r0, 0x14(r1)
/* 801402F8 0013D2F8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801402FC 0013D2FC  7C 7F 1B 78 */	mr r31, r3
/* 80140300 0013D300  80 03 02 34 */	lwz r0, 0x234(r3)
/* 80140304 0013D304  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 80140308 0013D308  41 82 00 20 */	beq lbl_80140328
/* 8014030C 0013D30C  3C 80 80 2F */	lis r4, lbl_802F3A60@ha
/* 80140310 0013D310  3C A0 F1 19 */	lis r5, 0xF1194D80@ha
/* 80140314 0013D314  38 84 3A 60 */	addi r4, r4, lbl_802F3A60@l
/* 80140318 0013D318  38 C0 00 00 */	li r6, 0
/* 8014031C 0013D31C  38 A5 4D 80 */	addi r5, r5, 0xF1194D80@l
/* 80140320 0013D320  4B FE 09 BD */	bl BtlUnit_snd_se
/* 80140324 0013D324  48 00 00 1C */	b lbl_80140340
lbl_80140328:
/* 80140328 0013D328  3C 80 80 2F */	lis r4, lbl_802F3A78@ha
/* 8014032C 0013D32C  3C A0 F1 19 */	lis r5, 0xF1194D80@ha
/* 80140330 0013D330  38 84 3A 78 */	addi r4, r4, lbl_802F3A78@l
/* 80140334 0013D334  38 C0 00 00 */	li r6, 0
/* 80140338 0013D338  38 A5 4D 80 */	addi r5, r5, 0xF1194D80@l
/* 8014033C 0013D33C  4B FE 09 A1 */	bl BtlUnit_snd_se
lbl_80140340:
/* 80140340 0013D340  80 9F 02 34 */	lwz r4, 0x234(r31)
/* 80140344 0013D344  38 04 00 01 */	addi r0, r4, 1
/* 80140348 0013D348  90 1F 02 34 */	stw r0, 0x234(r31)
/* 8014034C 0013D34C  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80140350 0013D350  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80140354 0013D354  7C 08 03 A6 */	mtlr r0
/* 80140358 0013D358  38 21 00 10 */	addi r1, r1, 0x10
/* 8014035C 0013D35C  4E 80 00 20 */	blr 

.global _get_local_frame
_get_local_frame:
/* 80140360 0013D360  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80140364 0013D364  7C 08 02 A6 */	mflr r0
/* 80140368 0013D368  38 80 FF FE */	li r4, -2
/* 8014036C 0013D36C  90 01 00 24 */	stw r0, 0x24(r1)
/* 80140370 0013D370  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80140374 0013D374  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80140378 0013D378  7C 7E 1B 78 */	mr r30, r3
/* 8014037C 0013D37C  80 A3 00 18 */	lwz r5, 0x18(r3)
/* 80140380 0013D380  83 E5 00 00 */	lwz r31, 0(r5)
/* 80140384 0013D384  4B FD FB A9 */	bl BattleTransID
/* 80140388 0013D388  38 80 00 01 */	li r4, 1
/* 8014038C 0013D38C  4B FB 35 95 */	bl BattleGetUnitPartsPtr
/* 80140390 0013D390  80 63 01 C0 */	lwz r3, 0x1c0(r3)
/* 80140394 0013D394  4B EF 92 C9 */	bl animPoseGetAnimPosePtr
/* 80140398 0013D398  7C 64 1B 78 */	mr r4, r3
/* 8014039C 0013D39C  7F C3 F3 78 */	mr r3, r30
/* 801403A0 0013D3A0  C0 04 00 24 */	lfs f0, 0x24(r4)
/* 801403A4 0013D3A4  7F E4 FB 78 */	mr r4, r31
/* 801403A8 0013D3A8  FC 00 00 1E */	fctiwz f0, f0
/* 801403AC 0013D3AC  D8 01 00 08 */	stfd f0, 8(r1)
/* 801403B0 0013D3B0  80 A1 00 0C */	lwz r5, 0xc(r1)
/* 801403B4 0013D3B4  4B EF 02 B5 */	bl evtSetValue
/* 801403B8 0013D3B8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 801403BC 0013D3BC  38 60 00 02 */	li r3, 2
/* 801403C0 0013D3C0  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 801403C4 0013D3C4  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 801403C8 0013D3C8  7C 08 03 A6 */	mtlr r0
/* 801403CC 0013D3CC  38 21 00 20 */	addi r1, r1, 0x20
/* 801403D0 0013D3D0  4E 80 00 20 */	blr 
