.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global actionCommandDisp_DUPE_80226f78
actionCommandDisp_DUPE_80226f78:
/* 80226F78 00223F78  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 80226F7C 00223F7C  7C 08 02 A6 */	mflr r0
/* 80226F80 00223F80  90 01 00 A4 */	stw r0, 0xa4(r1)
/* 80226F84 00223F84  DB E1 00 90 */	stfd f31, 0x90(r1)
/* 80226F88 00223F88  F3 E1 00 98 */	psq_st f31, 152(r1), 0, qr0
/* 80226F8C 00223F8C  DB C1 00 80 */	stfd f30, 0x80(r1)
/* 80226F90 00223F90  F3 C1 00 88 */	psq_st f30, 136(r1), 0, qr0
/* 80226F94 00223F94  BF 81 00 70 */	stmw r28, 0x70(r1)
/* 80226F98 00223F98  83 CD 17 10 */	lwz r30, lbl_80418970@sda21(r13)
/* 80226F9C 00223F9C  FF C0 08 90 */	fmr f30, f1
/* 80226FA0 00223FA0  3C 60 80 30 */	lis r3, lbl_802FEA38@ha
/* 80226FA4 00223FA4  FF E0 10 90 */	fmr f31, f2
/* 80226FA8 00223FA8  3B E3 EA 38 */	addi r31, r3, lbl_802FEA38@l
/* 80226FAC 00223FAC  3B BE 1F 20 */	addi r29, r30, 0x1f20
/* 80226FB0 00223FB0  38 60 00 08 */	li r3, 8
/* 80226FB4 00223FB4  4B DE 81 9D */	bl camGetPtr
/* 80226FB8 00223FB8  C0 22 02 54 */	lfs f1, lbl_804215D4@sda21(r2)
/* 80226FBC 00223FBC  3B 9E 1F 4C */	addi r28, r30, 0x1f4c
/* 80226FC0 00223FC0  C0 02 02 58 */	lfs f0, lbl_804215D8@sda21(r2)
/* 80226FC4 00223FC4  38 61 00 50 */	addi r3, r1, 0x50
/* 80226FC8 00223FC8  80 1F 00 00 */	lwz r0, 0(r31)
/* 80226FCC 00223FCC  EC 41 F0 2A */	fadds f2, f1, f30
/* 80226FD0 00223FD0  80 BF 00 04 */	lwz r5, 4(r31)
/* 80226FD4 00223FD4  EC 00 F8 2A */	fadds f0, f0, f31
/* 80226FD8 00223FD8  90 01 00 50 */	stw r0, 0x50(r1)
/* 80226FDC 00223FDC  38 80 00 10 */	li r4, 0x10
/* 80226FE0 00223FE0  80 1F 00 08 */	lwz r0, 8(r31)
/* 80226FE4 00223FE4  90 A1 00 54 */	stw r5, 0x54(r1)
/* 80226FE8 00223FE8  38 A0 00 8C */	li r5, 0x8c
/* 80226FEC 00223FEC  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 80226FF0 00223FF0  90 01 00 58 */	stw r0, 0x58(r1)
/* 80226FF4 00223FF4  D0 41 00 50 */	stfs f2, 0x50(r1)
/* 80226FF8 00223FF8  D0 01 00 54 */	stfs f0, 0x54(r1)
/* 80226FFC 00223FFC  4B DF 35 39 */	bl iconDispGx
/* 80227000 00224000  C0 5C 00 04 */	lfs f2, 4(r28)
/* 80227004 00224004  C0 22 02 60 */	lfs f1, lbl_804215E0@sda21(r2)
/* 80227008 00224008  C0 02 02 5C */	lfs f0, lbl_804215DC@sda21(r2)
/* 8022700C 0022400C  EC 22 08 24 */	fdivs f1, f2, f1
/* 80227010 00224010  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80227014 00224014  40 81 00 08 */	ble lbl_8022701C
/* 80227018 00224018  FC 20 00 90 */	fmr f1, f0
lbl_8022701C:
/* 8022701C 0022401C  FC 40 F0 1E */	fctiwz f2, f30
/* 80227020 00224020  D0 3D 00 28 */	stfs f1, 0x28(r29)
/* 80227024 00224024  FC 00 F8 1E */	fctiwz f0, f31
/* 80227028 00224028  38 A0 00 B2 */	li r5, 0xb2
/* 8022702C 0022402C  C0 3D 00 28 */	lfs f1, 0x28(r29)
/* 80227030 00224030  39 40 00 00 */	li r10, 0
/* 80227034 00224034  D8 41 00 60 */	stfd f2, 0x60(r1)
/* 80227038 00224038  80 DE 1C CC */	lwz r6, 0x1ccc(r30)
/* 8022703C 0022403C  D8 01 00 68 */	stfd f0, 0x68(r1)
/* 80227040 00224040  80 61 00 64 */	lwz r3, 0x64(r1)
/* 80227044 00224044  80 81 00 6C */	lwz r4, 0x6c(r1)
/* 80227048 00224048  80 FE 1C D0 */	lwz r7, 0x1cd0(r30)
/* 8022704C 0022404C  81 1E 1C D4 */	lwz r8, 0x1cd4(r30)
/* 80227050 00224050  81 3E 1C D8 */	lwz r9, 0x1cd8(r30)
/* 80227054 00224054  4B EC D1 ED */	bl BattleAcDrawGauge
/* 80227058 00224058  80 1E 1C 9C */	lwz r0, 0x1c9c(r30)
/* 8022705C 0022405C  2C 00 03 E8 */	cmpwi r0, 0x3e8
/* 80227060 00224060  41 82 00 B4 */	beq lbl_80227114
/* 80227064 00224064  40 80 00 18 */	bge lbl_8022707C
/* 80227068 00224068  2C 00 00 65 */	cmpwi r0, 0x65
/* 8022706C 0022406C  40 80 01 EC */	bge lbl_80227258
/* 80227070 00224070  2C 00 00 63 */	cmpwi r0, 0x63
/* 80227074 00224074  40 80 00 1C */	bge lbl_80227090
/* 80227078 00224078  48 00 01 E0 */	b lbl_80227258
lbl_8022707C:
/* 8022707C 0022407C  2C 00 03 ED */	cmpwi r0, 0x3ed
/* 80227080 00224080  40 80 01 D8 */	bge lbl_80227258
/* 80227084 00224084  2C 00 03 EA */	cmpwi r0, 0x3ea
/* 80227088 00224088  40 80 00 08 */	bge lbl_80227090
/* 8022708C 0022408C  48 00 01 CC */	b lbl_80227258
lbl_80227090:
/* 80227090 00224090  C0 22 02 64 */	lfs f1, lbl_804215E4@sda21(r2)
/* 80227094 00224094  38 61 00 44 */	addi r3, r1, 0x44
/* 80227098 00224098  C0 02 02 68 */	lfs f0, lbl_804215E8@sda21(r2)
/* 8022709C 0022409C  38 80 00 10 */	li r4, 0x10
/* 802270A0 002240A0  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 802270A4 002240A4  EF C1 F0 2A */	fadds f30, f1, f30
/* 802270A8 002240A8  80 DF 00 10 */	lwz r6, 0x10(r31)
/* 802270AC 002240AC  EF E0 F8 2A */	fadds f31, f0, f31
/* 802270B0 002240B0  90 01 00 44 */	stw r0, 0x44(r1)
/* 802270B4 002240B4  38 A0 00 7E */	li r5, 0x7e
/* 802270B8 002240B8  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 802270BC 002240BC  90 C1 00 48 */	stw r6, 0x48(r1)
/* 802270C0 002240C0  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 802270C4 002240C4  90 01 00 4C */	stw r0, 0x4c(r1)
/* 802270C8 002240C8  D3 C1 00 44 */	stfs f30, 0x44(r1)
/* 802270CC 002240CC  D3 E1 00 48 */	stfs f31, 0x48(r1)
/* 802270D0 002240D0  4B DF 34 65 */	bl iconDispGx
/* 802270D4 002240D4  C0 02 02 6C */	lfs f0, lbl_804215EC@sda21(r2)
/* 802270D8 002240D8  38 61 00 38 */	addi r3, r1, 0x38
/* 802270DC 002240DC  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 802270E0 002240E0  38 80 00 10 */	li r4, 0x10
/* 802270E4 002240E4  80 DF 00 1C */	lwz r6, 0x1c(r31)
/* 802270E8 002240E8  EC 00 F0 2A */	fadds f0, f0, f30
/* 802270EC 002240EC  90 01 00 38 */	stw r0, 0x38(r1)
/* 802270F0 002240F0  38 A0 00 80 */	li r5, 0x80
/* 802270F4 002240F4  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 802270F8 002240F8  90 C1 00 3C */	stw r6, 0x3c(r1)
/* 802270FC 002240FC  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 80227100 00224100  90 01 00 40 */	stw r0, 0x40(r1)
/* 80227104 00224104  D0 01 00 38 */	stfs f0, 0x38(r1)
/* 80227108 00224108  D3 E1 00 3C */	stfs f31, 0x3c(r1)
/* 8022710C 0022410C  4B DF 34 29 */	bl iconDispGx
/* 80227110 00224110  48 00 01 48 */	b lbl_80227258
lbl_80227114:
/* 80227114 00224114  80 7E 1C D0 */	lwz r3, 0x1cd0(r30)
/* 80227118 00224118  3C 00 43 30 */	lis r0, 0x4330
/* 8022711C 0022411C  90 01 00 68 */	stw r0, 0x68(r1)
/* 80227120 00224120  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80227124 00224124  C8 3F 00 58 */	lfd f1, 0x58(r31)
/* 80227128 00224128  90 01 00 6C */	stw r0, 0x6c(r1)
/* 8022712C 0022412C  C0 5C 00 04 */	lfs f2, 4(r28)
/* 80227130 00224130  C8 01 00 68 */	lfd f0, 0x68(r1)
/* 80227134 00224134  EC 00 08 28 */	fsubs f0, f0, f1
/* 80227138 00224138  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 8022713C 0022413C  4C 41 13 82 */	cror 2, 1, 2
/* 80227140 00224140  40 82 00 98 */	bne lbl_802271D8
/* 80227144 00224144  C0 02 02 60 */	lfs f0, lbl_804215E0@sda21(r2)
/* 80227148 00224148  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 8022714C 0022414C  4C 40 13 82 */	cror 2, 0, 2
/* 80227150 00224150  40 82 00 88 */	bne lbl_802271D8
/* 80227154 00224154  C0 22 02 64 */	lfs f1, lbl_804215E4@sda21(r2)
/* 80227158 00224158  38 61 00 2C */	addi r3, r1, 0x2c
/* 8022715C 0022415C  C0 02 02 68 */	lfs f0, lbl_804215E8@sda21(r2)
/* 80227160 00224160  38 80 00 10 */	li r4, 0x10
/* 80227164 00224164  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 80227168 00224168  EF C1 F0 2A */	fadds f30, f1, f30
/* 8022716C 0022416C  80 DF 00 28 */	lwz r6, 0x28(r31)
/* 80227170 00224170  EF E0 F8 2A */	fadds f31, f0, f31
/* 80227174 00224174  90 01 00 2C */	stw r0, 0x2c(r1)
/* 80227178 00224178  38 A0 00 7F */	li r5, 0x7f
/* 8022717C 0022417C  80 1F 00 2C */	lwz r0, 0x2c(r31)
/* 80227180 00224180  90 C1 00 30 */	stw r6, 0x30(r1)
/* 80227184 00224184  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 80227188 00224188  90 01 00 34 */	stw r0, 0x34(r1)
/* 8022718C 0022418C  D3 C1 00 2C */	stfs f30, 0x2c(r1)
/* 80227190 00224190  D3 E1 00 30 */	stfs f31, 0x30(r1)
/* 80227194 00224194  4B DF 33 A1 */	bl iconDispGx
/* 80227198 00224198  C0 02 02 6C */	lfs f0, lbl_804215EC@sda21(r2)
/* 8022719C 0022419C  38 61 00 20 */	addi r3, r1, 0x20
/* 802271A0 002241A0  80 1F 00 30 */	lwz r0, 0x30(r31)
/* 802271A4 002241A4  38 80 00 10 */	li r4, 0x10
/* 802271A8 002241A8  80 DF 00 34 */	lwz r6, 0x34(r31)
/* 802271AC 002241AC  EC 00 F0 2A */	fadds f0, f0, f30
/* 802271B0 002241B0  90 01 00 20 */	stw r0, 0x20(r1)
/* 802271B4 002241B4  38 A0 00 81 */	li r5, 0x81
/* 802271B8 002241B8  80 1F 00 38 */	lwz r0, 0x38(r31)
/* 802271BC 002241BC  90 C1 00 24 */	stw r6, 0x24(r1)
/* 802271C0 002241C0  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 802271C4 002241C4  90 01 00 28 */	stw r0, 0x28(r1)
/* 802271C8 002241C8  D0 01 00 20 */	stfs f0, 0x20(r1)
/* 802271CC 002241CC  D3 E1 00 24 */	stfs f31, 0x24(r1)
/* 802271D0 002241D0  4B DF 33 65 */	bl iconDispGx
/* 802271D4 002241D4  48 00 00 84 */	b lbl_80227258
lbl_802271D8:
/* 802271D8 002241D8  C0 22 02 64 */	lfs f1, lbl_804215E4@sda21(r2)
/* 802271DC 002241DC  38 61 00 14 */	addi r3, r1, 0x14
/* 802271E0 002241E0  C0 02 02 68 */	lfs f0, lbl_804215E8@sda21(r2)
/* 802271E4 002241E4  38 80 00 10 */	li r4, 0x10
/* 802271E8 002241E8  80 1F 00 3C */	lwz r0, 0x3c(r31)
/* 802271EC 002241EC  EF C1 F0 2A */	fadds f30, f1, f30
/* 802271F0 002241F0  80 DF 00 40 */	lwz r6, 0x40(r31)
/* 802271F4 002241F4  EF E0 F8 2A */	fadds f31, f0, f31
/* 802271F8 002241F8  90 01 00 14 */	stw r0, 0x14(r1)
/* 802271FC 002241FC  38 A0 00 7E */	li r5, 0x7e
/* 80227200 00224200  80 1F 00 44 */	lwz r0, 0x44(r31)
/* 80227204 00224204  90 C1 00 18 */	stw r6, 0x18(r1)
/* 80227208 00224208  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 8022720C 0022420C  90 01 00 1C */	stw r0, 0x1c(r1)
/* 80227210 00224210  D3 C1 00 14 */	stfs f30, 0x14(r1)
/* 80227214 00224214  D3 E1 00 18 */	stfs f31, 0x18(r1)
/* 80227218 00224218  4B DF 33 1D */	bl iconDispGx
/* 8022721C 0022421C  C0 02 02 6C */	lfs f0, lbl_804215EC@sda21(r2)
/* 80227220 00224220  38 61 00 08 */	addi r3, r1, 8
/* 80227224 00224224  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 80227228 00224228  38 80 00 10 */	li r4, 0x10
/* 8022722C 0022422C  80 DF 00 4C */	lwz r6, 0x4c(r31)
/* 80227230 00224230  EC 00 F0 2A */	fadds f0, f0, f30
/* 80227234 00224234  90 01 00 08 */	stw r0, 8(r1)
/* 80227238 00224238  38 A0 00 80 */	li r5, 0x80
/* 8022723C 0022423C  80 1F 00 50 */	lwz r0, 0x50(r31)
/* 80227240 00224240  90 C1 00 0C */	stw r6, 0xc(r1)
/* 80227244 00224244  C0 22 02 5C */	lfs f1, lbl_804215DC@sda21(r2)
/* 80227248 00224248  90 01 00 10 */	stw r0, 0x10(r1)
/* 8022724C 0022424C  D0 01 00 08 */	stfs f0, 8(r1)
/* 80227250 00224250  D3 E1 00 0C */	stfs f31, 0xc(r1)
/* 80227254 00224254  4B DF 32 E1 */	bl iconDispGx
lbl_80227258:
/* 80227258 00224258  E3 E1 00 98 */	psq_l f31, 152(r1), 0, qr0
/* 8022725C 0022425C  CB E1 00 90 */	lfd f31, 0x90(r1)
/* 80227260 00224260  E3 C1 00 88 */	psq_l f30, 136(r1), 0, qr0
/* 80227264 00224264  CB C1 00 80 */	lfd f30, 0x80(r1)
/* 80227268 00224268  BB 81 00 70 */	lmw r28, 0x70(r1)
/* 8022726C 0022426C  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 80227270 00224270  7C 08 03 A6 */	mtlr r0
/* 80227274 00224274  38 21 00 A0 */	addi r1, r1, 0xa0
/* 80227278 00224278  4E 80 00 20 */	blr 

.global battleAcDelete_PowerGaugeLv
battleAcDelete_PowerGaugeLv:
/* 8022727C 0022427C  80 03 1C C0 */	lwz r0, 0x1cc0(r3)
/* 80227280 00224280  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 80227284 00224284  4C 82 00 20 */	bnelr 
/* 80227288 00224288  38 00 03 EB */	li r0, 0x3eb
/* 8022728C 0022428C  90 03 1C 9C */	stw r0, 0x1c9c(r3)
/* 80227290 00224290  4E 80 00 20 */	blr 

.global battleAcDisp_PowerGaugeLv
battleAcDisp_PowerGaugeLv:
/* 80227294 00224294  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 80227298 00224298  7C 08 02 A6 */	mflr r0
/* 8022729C 0022429C  90 01 00 14 */	stw r0, 0x14(r1)
/* 802272A0 002242A0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 802272A4 002242A4  3B E4 1F 20 */	addi r31, r4, 0x1f20
/* 802272A8 002242A8  80 04 1C 9C */	lwz r0, 0x1c9c(r4)
/* 802272AC 002242AC  2C 00 03 E8 */	cmpwi r0, 0x3e8
/* 802272B0 002242B0  41 82 00 58 */	beq lbl_80227308
/* 802272B4 002242B4  40 80 00 1C */	bge lbl_802272D0
/* 802272B8 002242B8  2C 00 00 64 */	cmpwi r0, 0x64
/* 802272BC 002242BC  41 82 00 4C */	beq lbl_80227308
/* 802272C0 002242C0  40 80 00 C0 */	bge lbl_80227380
/* 802272C4 002242C4  2C 00 00 63 */	cmpwi r0, 0x63
/* 802272C8 002242C8  40 80 00 20 */	bge lbl_802272E8
/* 802272CC 002242CC  48 00 00 B4 */	b lbl_80227380
lbl_802272D0:
/* 802272D0 002242D0  2C 00 03 EA */	cmpwi r0, 0x3ea
/* 802272D4 002242D4  41 82 00 34 */	beq lbl_80227308
/* 802272D8 002242D8  41 80 00 A8 */	blt lbl_80227380
/* 802272DC 002242DC  2C 00 03 ED */	cmpwi r0, 0x3ed
/* 802272E0 002242E0  40 80 00 A0 */	bge lbl_80227380
/* 802272E4 002242E4  48 00 00 48 */	b lbl_8022732C
lbl_802272E8:
/* 802272E8 002242E8  80 1F 00 20 */	lwz r0, 0x20(r31)
/* 802272EC 002242EC  38 60 00 04 */	li r3, 4
/* 802272F0 002242F0  C0 22 02 70 */	lfs f1, lbl_804215F0@sda21(r2)
/* 802272F4 002242F4  38 A0 00 14 */	li r5, 0x14
/* 802272F8 002242F8  C0 42 02 74 */	lfs f2, lbl_804215F4@sda21(r2)
/* 802272FC 002242FC  20 80 00 14 */	subfic r4, r0, 0x14
/* 80227300 00224300  4B DD F9 0D */	bl intplGetValue
/* 80227304 00224304  D0 3F 00 14 */	stfs f1, 0x14(r31)
lbl_80227308:
/* 80227308 00224308  C0 3F 00 14 */	lfs f1, 0x14(r31)
/* 8022730C 0022430C  C0 5F 00 18 */	lfs f2, 0x18(r31)
/* 80227310 00224310  4B FF FC 69 */	bl actionCommandDisp_DUPE_80226f78
/* 80227314 00224314  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80227318 00224318  2C 03 00 00 */	cmpwi r3, 0
/* 8022731C 0022431C  40 81 00 64 */	ble lbl_80227380
/* 80227320 00224320  38 03 FF FF */	addi r0, r3, -1
/* 80227324 00224324  90 1F 00 20 */	stw r0, 0x20(r31)
/* 80227328 00224328  48 00 00 58 */	b lbl_80227380
lbl_8022732C:
/* 8022732C 0022432C  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80227330 00224330  2C 03 00 28 */	cmpwi r3, 0x28
/* 80227334 00224334  41 80 00 24 */	blt lbl_80227358
/* 80227338 00224338  C0 22 02 74 */	lfs f1, lbl_804215F4@sda21(r2)
/* 8022733C 0022433C  38 83 FF D8 */	addi r4, r3, -40
/* 80227340 00224340  C0 42 02 70 */	lfs f2, lbl_804215F0@sda21(r2)
/* 80227344 00224344  38 60 00 04 */	li r3, 4
/* 80227348 00224348  38 A0 00 14 */	li r5, 0x14
/* 8022734C 0022434C  4B DD F8 C1 */	bl intplGetValue
/* 80227350 00224350  D0 3F 00 14 */	stfs f1, 0x14(r31)
/* 80227354 00224354  48 00 00 0C */	b lbl_80227360
lbl_80227358:
/* 80227358 00224358  C0 02 02 74 */	lfs f0, lbl_804215F4@sda21(r2)
/* 8022735C 0022435C  D0 1F 00 14 */	stfs f0, 0x14(r31)
lbl_80227360:
/* 80227360 00224360  C0 3F 00 14 */	lfs f1, 0x14(r31)
/* 80227364 00224364  C0 5F 00 18 */	lfs f2, 0x18(r31)
/* 80227368 00224368  4B FF FC 11 */	bl actionCommandDisp_DUPE_80226f78
/* 8022736C 0022436C  80 7F 00 20 */	lwz r3, 0x20(r31)
/* 80227370 00224370  2C 03 00 3C */	cmpwi r3, 0x3c
/* 80227374 00224374  40 80 00 0C */	bge lbl_80227380
/* 80227378 00224378  38 03 00 01 */	addi r0, r3, 1
/* 8022737C 0022437C  90 1F 00 20 */	stw r0, 0x20(r31)
lbl_80227380:
/* 80227380 00224380  80 01 00 14 */	lwz r0, 0x14(r1)
/* 80227384 00224384  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 80227388 00224388  7C 08 03 A6 */	mtlr r0
/* 8022738C 0022438C  38 21 00 10 */	addi r1, r1, 0x10
/* 80227390 00224390  4E 80 00 20 */	blr 

.global battleAcResult_PowerGaugeLv
battleAcResult_PowerGaugeLv:
/* 80227394 00224394  80 63 1C B8 */	lwz r3, 0x1cb8(r3)
/* 80227398 00224398  4E 80 00 20 */	blr 

.global battleAcMain_PowerGaugeLv
battleAcMain_PowerGaugeLv:
/* 8022739C 0022439C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 802273A0 002243A0  7C 08 02 A6 */	mflr r0
/* 802273A4 002243A4  90 01 00 24 */	stw r0, 0x24(r1)
/* 802273A8 002243A8  BF A1 00 14 */	stmw r29, 0x14(r1)
/* 802273AC 002243AC  7C 7E 1B 78 */	mr r30, r3
/* 802273B0 002243B0  3B FE 1F 4C */	addi r31, r30, 0x1f4c
/* 802273B4 002243B4  3B BE 1F 20 */	addi r29, r30, 0x1f20
/* 802273B8 002243B8  80 03 1C 9C */	lwz r0, 0x1c9c(r3)
/* 802273BC 002243BC  2C 00 03 E8 */	cmpwi r0, 0x3e8
/* 802273C0 002243C0  41 82 01 24 */	beq lbl_802274E4
/* 802273C4 002243C4  40 80 00 28 */	bge lbl_802273EC
/* 802273C8 002243C8  2C 00 00 63 */	cmpwi r0, 0x63
/* 802273CC 002243CC  41 82 03 64 */	beq lbl_80227730
/* 802273D0 002243D0  40 80 00 10 */	bge lbl_802273E0
/* 802273D4 002243D4  2C 00 00 00 */	cmpwi r0, 0
/* 802273D8 002243D8  41 82 00 3C */	beq lbl_80227414
/* 802273DC 002243DC  48 00 03 54 */	b lbl_80227730
lbl_802273E0:
/* 802273E0 002243E0  2C 00 00 65 */	cmpwi r0, 0x65
/* 802273E4 002243E4  40 80 03 4C */	bge lbl_80227730
/* 802273E8 002243E8  48 00 00 8C */	b lbl_80227474
lbl_802273EC:
/* 802273EC 002243EC  2C 00 03 EC */	cmpwi r0, 0x3ec
/* 802273F0 002243F0  41 82 03 00 */	beq lbl_802276F0
/* 802273F4 002243F4  40 80 00 14 */	bge lbl_80227408
/* 802273F8 002243F8  2C 00 03 EA */	cmpwi r0, 0x3ea
/* 802273FC 002243FC  41 82 02 D0 */	beq lbl_802276CC
/* 80227400 00224400  40 80 02 D4 */	bge lbl_802276D4
/* 80227404 00224404  48 00 02 7C */	b lbl_80227680
lbl_80227408:
/* 80227408 00224408  2C 00 03 EE */	cmpwi r0, 0x3ee
/* 8022740C 0022440C  40 80 03 24 */	bge lbl_80227730
/* 80227410 00224410  48 00 03 04 */	b lbl_80227714
lbl_80227414:
/* 80227414 00224414  7F A3 EB 78 */	mr r3, r29
/* 80227418 00224418  38 80 00 00 */	li r4, 0
/* 8022741C 0022441C  38 A0 00 2C */	li r5, 0x2c
/* 80227420 00224420  4B DD DC 95 */	bl memset
/* 80227424 00224424  C0 22 02 70 */	lfs f1, lbl_804215F0@sda21(r2)
/* 80227428 00224428  38 C0 00 14 */	li r6, 0x14
/* 8022742C 0022442C  C0 02 02 78 */	lfs f0, lbl_804215F8@sda21(r2)
/* 80227430 00224430  38 A0 00 00 */	li r5, 0
/* 80227434 00224434  D0 3D 00 14 */	stfs f1, 0x14(r29)
/* 80227438 00224438  38 80 00 63 */	li r4, 0x63
/* 8022743C 0022443C  38 60 00 01 */	li r3, 1
/* 80227440 00224440  38 00 00 64 */	li r0, 0x64
/* 80227444 00224444  D0 1D 00 18 */	stfs f0, 0x18(r29)
/* 80227448 00224448  90 DD 00 20 */	stw r6, 0x20(r29)
/* 8022744C 0022444C  D0 1D 00 28 */	stfs f0, 0x28(r29)
/* 80227450 00224450  80 C2 02 50 */	lwz r6, lbl_804215D0@sda21(r2)
/* 80227454 00224454  90 DD 00 0C */	stw r6, 0xc(r29)
/* 80227458 00224458  90 BF 00 00 */	stw r5, 0(r31)
/* 8022745C 0022445C  90 BE 1C E8 */	stw r5, 0x1ce8(r30)
/* 80227460 00224460  90 9E 1C 9C */	stw r4, 0x1c9c(r30)
/* 80227464 00224464  90 7E 1C B8 */	stw r3, 0x1cb8(r30)
/* 80227468 00224468  90 1F 00 0C */	stw r0, 0xc(r31)
/* 8022746C 0022446C  D0 1F 00 04 */	stfs f0, 4(r31)
/* 80227470 00224470  48 00 02 C0 */	b lbl_80227730
lbl_80227474:
/* 80227474 00224474  80 1E 1C 94 */	lwz r0, 0x1c94(r30)
/* 80227478 00224478  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 8022747C 0022447C  41 82 00 60 */	beq lbl_802274DC
/* 80227480 00224480  80 7E 1C 90 */	lwz r3, 0x1c90(r30)
/* 80227484 00224484  80 03 02 78 */	lwz r0, 0x278(r3)
/* 80227488 00224488  54 00 06 F7 */	rlwinm. r0, r0, 0, 0x1b, 0x1b
/* 8022748C 0022448C  41 82 00 50 */	beq lbl_802274DC
/* 80227490 00224490  38 60 00 64 */	li r3, 0x64
/* 80227494 00224494  4B DD EA 31 */	bl irand
/* 80227498 00224498  2C 03 00 00 */	cmpwi r3, 0
/* 8022749C 0022449C  41 80 00 18 */	blt lbl_802274B4
/* 802274A0 002244A0  38 60 00 1E */	li r3, 0x1e
/* 802274A4 002244A4  38 00 00 00 */	li r0, 0
/* 802274A8 002244A8  90 7E 1C 98 */	stw r3, 0x1c98(r30)
/* 802274AC 002244AC  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 802274B0 002244B0  48 00 00 20 */	b lbl_802274D0
lbl_802274B4:
/* 802274B4 002244B4  80 7E 1C CC */	lwz r3, 0x1ccc(r30)
/* 802274B8 002244B8  38 63 FF FF */	addi r3, r3, -1
/* 802274BC 002244BC  4B DD EA 09 */	bl irand
/* 802274C0 002244C0  38 63 00 01 */	addi r3, r3, 1
/* 802274C4 002244C4  38 00 00 1E */	li r0, 0x1e
/* 802274C8 002244C8  90 7E 1C E8 */	stw r3, 0x1ce8(r30)
/* 802274CC 002244CC  90 1E 1C 98 */	stw r0, 0x1c98(r30)
lbl_802274D0:
/* 802274D0 002244D0  38 00 03 E9 */	li r0, 0x3e9
/* 802274D4 002244D4  90 1E 1C 9C */	stw r0, 0x1c9c(r30)
/* 802274D8 002244D8  48 00 02 58 */	b lbl_80227730
lbl_802274DC:
/* 802274DC 002244DC  38 00 03 E8 */	li r0, 0x3e8
/* 802274E0 002244E0  90 1E 1C 9C */	stw r0, 0x1c9c(r30)
lbl_802274E4:
/* 802274E4 002244E4  80 7F 00 00 */	lwz r3, 0(r31)
/* 802274E8 002244E8  38 03 00 01 */	addi r0, r3, 1
/* 802274EC 002244EC  90 1F 00 00 */	stw r0, 0(r31)
/* 802274F0 002244F0  80 9F 00 00 */	lwz r4, 0(r31)
/* 802274F4 002244F4  80 BF 00 0C */	lwz r5, 0xc(r31)
/* 802274F8 002244F8  7C 04 28 00 */	cmpw r4, r5
/* 802274FC 002244FC  40 81 00 20 */	ble lbl_8022751C
/* 80227500 00224500  38 00 00 00 */	li r0, 0
/* 80227504 00224504  C0 02 02 7C */	lfs f0, lbl_804215FC@sda21(r2)
/* 80227508 00224508  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 8022750C 0022450C  38 60 00 00 */	li r3, 0
/* 80227510 00224510  90 1E 1C B8 */	stw r0, 0x1cb8(r30)
/* 80227514 00224514  D0 1F 00 04 */	stfs f0, 4(r31)
/* 80227518 00224518  48 00 02 1C */	b lbl_80227734
lbl_8022751C:
/* 8022751C 0022451C  C0 22 02 78 */	lfs f1, lbl_804215F8@sda21(r2)
/* 80227520 00224520  38 60 00 02 */	li r3, 2
/* 80227524 00224524  C0 42 02 60 */	lfs f2, lbl_804215E0@sda21(r2)
/* 80227528 00224528  4B DD F6 E5 */	bl intplGetValue
/* 8022752C 0022452C  D0 3F 00 04 */	stfs f1, 4(r31)
/* 80227530 00224530  4B EE D7 35 */	bl BattlePadGetNow
/* 80227534 00224534  28 03 00 60 */	cmplwi r3, 0x60
/* 80227538 00224538  40 82 01 F8 */	bne lbl_80227730
/* 8022753C 0022453C  80 1E 1C D0 */	lwz r0, 0x1cd0(r30)
/* 80227540 00224540  3C A0 43 30 */	lis r5, 0x4330
/* 80227544 00224544  3C 60 80 30 */	lis r3, lbl_802FEA90@ha
/* 80227548 00224548  90 A1 00 08 */	stw r5, 8(r1)
/* 8022754C 0022454C  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80227550 00224550  C8 23 EA 90 */	lfd f1, lbl_802FEA90@l(r3)
/* 80227554 00224554  90 01 00 0C */	stw r0, 0xc(r1)
/* 80227558 00224558  C0 5F 00 04 */	lfs f2, 4(r31)
/* 8022755C 0022455C  C8 01 00 08 */	lfd f0, 8(r1)
/* 80227560 00224560  EC 00 08 28 */	fsubs f0, f0, f1
/* 80227564 00224564  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 80227568 00224568  40 80 00 1C */	bge lbl_80227584
/* 8022756C 0022456C  38 00 00 00 */	li r0, 0
/* 80227570 00224570  90 1E 1C B8 */	stw r0, 0x1cb8(r30)
/* 80227574 00224574  80 1E 1C B8 */	lwz r0, 0x1cb8(r30)
/* 80227578 00224578  54 00 07 FA */	rlwinm r0, r0, 0, 0x1f, 0x1d
/* 8022757C 0022457C  90 1E 1C B8 */	stw r0, 0x1cb8(r30)
/* 80227580 00224580  48 00 00 F4 */	b lbl_80227674
lbl_80227584:
/* 80227584 00224584  38 80 00 02 */	li r4, 2
/* 80227588 00224588  90 9E 1C B8 */	stw r4, 0x1cb8(r30)
/* 8022758C 0022458C  80 7E 1C B4 */	lwz r3, 0x1cb4(r30)
/* 80227590 00224590  38 03 00 01 */	addi r0, r3, 1
/* 80227594 00224594  90 1E 1C B4 */	stw r0, 0x1cb4(r30)
/* 80227598 00224598  80 7E 1C CC */	lwz r3, 0x1ccc(r30)
/* 8022759C 0022459C  2C 03 00 01 */	cmpwi r3, 1
/* 802275A0 002245A0  41 81 00 10 */	bgt lbl_802275B0
/* 802275A4 002245A4  38 00 00 01 */	li r0, 1
/* 802275A8 002245A8  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 802275AC 002245AC  48 00 00 C8 */	b lbl_80227674
lbl_802275B0:
/* 802275B0 002245B0  80 1E 1C D4 */	lwz r0, 0x1cd4(r30)
/* 802275B4 002245B4  90 A1 00 08 */	stw r5, 8(r1)
/* 802275B8 002245B8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 802275BC 002245BC  C0 5F 00 04 */	lfs f2, 4(r31)
/* 802275C0 002245C0  90 01 00 0C */	stw r0, 0xc(r1)
/* 802275C4 002245C4  C8 01 00 08 */	lfd f0, 8(r1)
/* 802275C8 002245C8  EC 00 08 28 */	fsubs f0, f0, f1
/* 802275CC 002245CC  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 802275D0 002245D0  40 80 00 10 */	bge lbl_802275E0
/* 802275D4 002245D4  38 00 00 01 */	li r0, 1
/* 802275D8 002245D8  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 802275DC 002245DC  48 00 00 98 */	b lbl_80227674
lbl_802275E0:
/* 802275E0 002245E0  2C 03 00 02 */	cmpwi r3, 2
/* 802275E4 002245E4  41 81 00 0C */	bgt lbl_802275F0
/* 802275E8 002245E8  90 9E 1C E8 */	stw r4, 0x1ce8(r30)
/* 802275EC 002245EC  48 00 00 88 */	b lbl_80227674
lbl_802275F0:
/* 802275F0 002245F0  80 1E 1C D8 */	lwz r0, 0x1cd8(r30)
/* 802275F4 002245F4  90 A1 00 08 */	stw r5, 8(r1)
/* 802275F8 002245F8  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 802275FC 002245FC  90 01 00 0C */	stw r0, 0xc(r1)
/* 80227600 00224600  C8 01 00 08 */	lfd f0, 8(r1)
/* 80227604 00224604  EC 00 08 28 */	fsubs f0, f0, f1
/* 80227608 00224608  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 8022760C 0022460C  40 80 00 0C */	bge lbl_80227618
/* 80227610 00224610  90 9E 1C E8 */	stw r4, 0x1ce8(r30)
/* 80227614 00224614  48 00 00 60 */	b lbl_80227674
lbl_80227618:
/* 80227618 00224618  2C 03 00 03 */	cmpwi r3, 3
/* 8022761C 0022461C  41 81 00 10 */	bgt lbl_8022762C
/* 80227620 00224620  38 00 00 03 */	li r0, 3
/* 80227624 00224624  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 80227628 00224628  48 00 00 4C */	b lbl_80227674
lbl_8022762C:
/* 8022762C 0022462C  80 1E 1C DC */	lwz r0, 0x1cdc(r30)
/* 80227630 00224630  90 A1 00 08 */	stw r5, 8(r1)
/* 80227634 00224634  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80227638 00224638  90 01 00 0C */	stw r0, 0xc(r1)
/* 8022763C 0022463C  C8 01 00 08 */	lfd f0, 8(r1)
/* 80227640 00224640  EC 00 08 28 */	fsubs f0, f0, f1
/* 80227644 00224644  FC 02 00 40 */	fcmpo cr0, f2, f0
/* 80227648 00224648  40 80 00 10 */	bge lbl_80227658
/* 8022764C 0022464C  38 00 00 03 */	li r0, 3
/* 80227650 00224650  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 80227654 00224654  48 00 00 20 */	b lbl_80227674
lbl_80227658:
/* 80227658 00224658  2C 03 00 04 */	cmpwi r3, 4
/* 8022765C 0022465C  41 81 00 10 */	bgt lbl_8022766C
/* 80227660 00224660  38 00 00 04 */	li r0, 4
/* 80227664 00224664  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
/* 80227668 00224668  48 00 00 0C */	b lbl_80227674
lbl_8022766C:
/* 8022766C 0022466C  38 00 00 05 */	li r0, 5
/* 80227670 00224670  90 1E 1C E8 */	stw r0, 0x1ce8(r30)
lbl_80227674:
/* 80227674 00224674  38 00 03 EA */	li r0, 0x3ea
/* 80227678 00224678  90 1E 1C 9C */	stw r0, 0x1c9c(r30)
/* 8022767C 0022467C  48 00 00 B4 */	b lbl_80227730
lbl_80227680:
/* 80227680 00224680  80 7E 1C 98 */	lwz r3, 0x1c98(r30)
/* 80227684 00224684  38 03 FF FF */	addi r0, r3, -1
/* 80227688 00224688  90 1E 1C 98 */	stw r0, 0x1c98(r30)
/* 8022768C 0022468C  80 1E 1C 98 */	lwz r0, 0x1c98(r30)
/* 80227690 00224690  2C 00 00 00 */	cmpwi r0, 0
/* 80227694 00224694  40 80 00 9C */	bge lbl_80227730
/* 80227698 00224698  80 1E 1C E8 */	lwz r0, 0x1ce8(r30)
/* 8022769C 0022469C  2C 00 00 00 */	cmpwi r0, 0
/* 802276A0 002246A0  40 81 00 1C */	ble lbl_802276BC
/* 802276A4 002246A4  38 00 00 02 */	li r0, 2
/* 802276A8 002246A8  90 1E 1C B8 */	stw r0, 0x1cb8(r30)
/* 802276AC 002246AC  80 7E 1C B4 */	lwz r3, 0x1cb4(r30)
/* 802276B0 002246B0  38 03 00 01 */	addi r0, r3, 1
/* 802276B4 002246B4  90 1E 1C B4 */	stw r0, 0x1cb4(r30)
/* 802276B8 002246B8  48 00 00 0C */	b lbl_802276C4
lbl_802276BC:
/* 802276BC 002246BC  38 00 00 00 */	li r0, 0
/* 802276C0 002246C0  90 1E 1C B8 */	stw r0, 0x1cb8(r30)
lbl_802276C4:
/* 802276C4 002246C4  38 60 00 00 */	li r3, 0
/* 802276C8 002246C8  48 00 00 6C */	b lbl_80227734
lbl_802276CC:
/* 802276CC 002246CC  38 00 03 EB */	li r0, 0x3eb
/* 802276D0 002246D0  90 1E 1C 9C */	stw r0, 0x1c9c(r30)
lbl_802276D4:
/* 802276D4 002246D4  80 9E 1C C0 */	lwz r4, 0x1cc0(r30)
/* 802276D8 002246D8  38 60 00 3C */	li r3, 0x3c
/* 802276DC 002246DC  38 00 03 EC */	li r0, 0x3ec
/* 802276E0 002246E0  60 84 00 01 */	ori r4, r4, 1
/* 802276E4 002246E4  90 9E 1C C0 */	stw r4, 0x1cc0(r30)
/* 802276E8 002246E8  90 7F 00 10 */	stw r3, 0x10(r31)
/* 802276EC 002246EC  90 1E 1C 9C */	stw r0, 0x1c9c(r30)
lbl_802276F0:
/* 802276F0 002246F0  80 7F 00 10 */	lwz r3, 0x10(r31)
/* 802276F4 002246F4  38 03 FF FF */	addi r0, r3, -1
/* 802276F8 002246F8  90 1F 00 10 */	stw r0, 0x10(r31)
/* 802276FC 002246FC  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 80227700 00224700  2C 00 00 00 */	cmpwi r0, 0
/* 80227704 00224704  41 81 00 2C */	bgt lbl_80227730
/* 80227708 00224708  38 00 03 ED */	li r0, 0x3ed
/* 8022770C 0022470C  90 1E 1C 9C */	stw r0, 0x1c9c(r30)
/* 80227710 00224710  48 00 00 20 */	b lbl_80227730
lbl_80227714:
/* 80227714 00224714  38 00 00 00 */	li r0, 0
/* 80227718 00224718  38 60 00 00 */	li r3, 0
/* 8022771C 0022471C  90 1E 1C A0 */	stw r0, 0x1ca0(r30)
/* 80227720 00224720  90 1E 1C A8 */	stw r0, 0x1ca8(r30)
/* 80227724 00224724  90 1E 1C A4 */	stw r0, 0x1ca4(r30)
/* 80227728 00224728  90 1E 1C AC */	stw r0, 0x1cac(r30)
/* 8022772C 0022472C  48 00 00 08 */	b lbl_80227734
lbl_80227730:
/* 80227730 00224730  38 60 00 01 */	li r3, 1
lbl_80227734:
/* 80227734 00224734  BB A1 00 14 */	lmw r29, 0x14(r1)
/* 80227738 00224738  80 01 00 24 */	lwz r0, 0x24(r1)
/* 8022773C 0022473C  7C 08 03 A6 */	mtlr r0
/* 80227740 00224740  38 21 00 20 */	addi r1, r1, 0x20
/* 80227744 00224744  4E 80 00 20 */	blr 
