.include "macros.inc"


.section .text, "ax"  # 0x800055E0 - 0x802C0EE0

.global effKemuri7Disp
effKemuri7Disp:
/* 801C6FE0 001C3FE0  94 21 FF 60 */	stwu r1, -0xa0(r1)
/* 801C6FE4 001C3FE4  7C 08 02 A6 */	mflr r0
/* 801C6FE8 001C3FE8  90 01 00 A4 */	stw r0, 0xa4(r1)
/* 801C6FEC 001C3FEC  93 E1 00 9C */	stw r31, 0x9c(r1)
/* 801C6FF0 001C3FF0  93 C1 00 98 */	stw r30, 0x98(r1)
/* 801C6FF4 001C3FF4  93 A1 00 94 */	stw r29, 0x94(r1)
/* 801C6FF8 001C3FF8  93 81 00 90 */	stw r28, 0x90(r1)
/* 801C6FFC 001C3FFC  7C 9C 23 78 */	mr r28, r4
/* 801C7000 001C4000  4B E4 81 51 */	bl camGetPtr
/* 801C7004 001C4004  83 DC 00 0C */	lwz r30, 0xc(r28)
/* 801C7008 001C4008  7C 7F 1B 78 */	mr r31, r3
/* 801C700C 001C400C  38 60 00 00 */	li r3, 0
/* 801C7010 001C4010  48 0E A1 29 */	bl GXSetNumChans
/* 801C7014 001C4014  38 60 00 01 */	li r3, 1
/* 801C7018 001C4018  48 0E 82 69 */	bl GXSetNumTexGens
/* 801C701C 001C401C  38 60 00 00 */	li r3, 0
/* 801C7020 001C4020  38 80 00 01 */	li r4, 1
/* 801C7024 001C4024  38 A0 00 04 */	li r5, 4
/* 801C7028 001C4028  38 C0 00 1E */	li r6, 0x1e
/* 801C702C 001C402C  38 E0 00 00 */	li r7, 0
/* 801C7030 001C4030  39 00 00 7D */	li r8, 0x7d
/* 801C7034 001C4034  48 0E 7F CD */	bl GXSetTexCoordGen2
/* 801C7038 001C4038  C0 22 E0 6C */	lfs f1, lbl_8041F3EC@sda21(r2)
/* 801C703C 001C403C  38 61 00 30 */	addi r3, r1, 0x30
/* 801C7040 001C4040  C0 62 E0 70 */	lfs f3, lbl_8041F3F0@sda21(r2)
/* 801C7044 001C4044  FC 40 08 90 */	fmr f2, f1
/* 801C7048 001C4048  48 0D 14 65 */	bl PSMTXScale
/* 801C704C 001C404C  38 61 00 30 */	addi r3, r1, 0x30
/* 801C7050 001C4050  38 80 00 1E */	li r4, 0x1e
/* 801C7054 001C4054  38 A0 00 01 */	li r5, 1
/* 801C7058 001C4058  48 0E D5 75 */	bl GXLoadTexMtxImm
/* 801C705C 001C405C  38 60 00 01 */	li r3, 1
/* 801C7060 001C4060  48 0E C1 69 */	bl GXSetNumTevStages
/* 801C7064 001C4064  38 60 00 00 */	li r3, 0
/* 801C7068 001C4068  38 80 00 00 */	li r4, 0
/* 801C706C 001C406C  38 A0 00 00 */	li r5, 0
/* 801C7070 001C4070  38 C0 00 FF */	li r6, 0xff
/* 801C7074 001C4074  48 0E BF B9 */	bl GXSetTevOrder
/* 801C7078 001C4078  38 60 00 00 */	li r3, 0
/* 801C707C 001C407C  38 80 00 00 */	li r4, 0
/* 801C7080 001C4080  38 A0 00 00 */	li r5, 0
/* 801C7084 001C4084  38 C0 00 00 */	li r6, 0
/* 801C7088 001C4088  38 E0 00 01 */	li r7, 1
/* 801C708C 001C408C  39 00 00 00 */	li r8, 0
/* 801C7090 001C4090  48 0E BB 55 */	bl GXSetTevColorOp
/* 801C7094 001C4094  38 60 00 00 */	li r3, 0
/* 801C7098 001C4098  38 80 00 00 */	li r4, 0
/* 801C709C 001C409C  38 A0 00 00 */	li r5, 0
/* 801C70A0 001C40A0  38 C0 00 00 */	li r6, 0
/* 801C70A4 001C40A4  38 E0 00 01 */	li r7, 1
/* 801C70A8 001C40A8  39 00 00 00 */	li r8, 0
/* 801C70AC 001C40AC  48 0E BB A1 */	bl GXSetTevAlphaOp
/* 801C70B0 001C40B0  38 60 00 00 */	li r3, 0
/* 801C70B4 001C40B4  38 80 00 0F */	li r4, 0xf
/* 801C70B8 001C40B8  38 A0 00 0F */	li r5, 0xf
/* 801C70BC 001C40BC  38 C0 00 0F */	li r6, 0xf
/* 801C70C0 001C40C0  38 E0 00 0F */	li r7, 0xf
/* 801C70C4 001C40C4  48 0E BA 99 */	bl GXSetTevColorIn
/* 801C70C8 001C40C8  38 60 00 00 */	li r3, 0
/* 801C70CC 001C40CC  38 80 00 07 */	li r4, 7
/* 801C70D0 001C40D0  38 A0 00 04 */	li r5, 4
/* 801C70D4 001C40D4  38 C0 00 01 */	li r6, 1
/* 801C70D8 001C40D8  38 E0 00 07 */	li r7, 7
/* 801C70DC 001C40DC  48 0E BA C5 */	bl GXSetTevAlphaIn
/* 801C70E0 001C40E0  38 81 00 10 */	addi r4, r1, 0x10
/* 801C70E4 001C40E4  38 60 00 4F */	li r3, 0x4f
/* 801C70E8 001C40E8  48 00 A7 5D */	bl effGetTexObjN64
/* 801C70EC 001C40EC  38 61 00 10 */	addi r3, r1, 0x10
/* 801C70F0 001C40F0  38 80 00 00 */	li r4, 0
/* 801C70F4 001C40F4  48 0E A9 89 */	bl GXLoadTexObj
/* 801C70F8 001C40F8  38 60 00 00 */	li r3, 0
/* 801C70FC 001C40FC  48 0E 8D 8D */	bl GXSetCullMode
/* 801C7100 001C4100  3C 60 80 3A */	lis r3, lbl_803A1DF0@ha
/* 801C7104 001C4104  38 63 1D F0 */	addi r3, r3, lbl_803A1DF0@l
/* 801C7108 001C4108  48 00 A5 A9 */	bl effSetVtxDescN64
/* 801C710C 001C410C  3B A0 00 00 */	li r29, 0
/* 801C7110 001C4110  48 00 00 C0 */	b lbl_801C71D0
lbl_801C7114:
/* 801C7114 001C4114  80 1E 00 00 */	lwz r0, 0(r30)
/* 801C7118 001C4118  2C 00 00 00 */	cmpwi r0, 0
/* 801C711C 001C411C  41 82 00 AC */	beq lbl_801C71C8
/* 801C7120 001C4120  80 A2 E0 68 */	lwz r5, lbl_8041F3E8@sda21(r2)
/* 801C7124 001C4124  38 81 00 0C */	addi r4, r1, 0xc
/* 801C7128 001C4128  88 1E 00 08 */	lbz r0, 8(r30)
/* 801C712C 001C412C  38 60 00 01 */	li r3, 1
/* 801C7130 001C4130  90 A1 00 08 */	stw r5, 8(r1)
/* 801C7134 001C4134  98 01 00 0B */	stb r0, 0xb(r1)
/* 801C7138 001C4138  80 01 00 08 */	lwz r0, 8(r1)
/* 801C713C 001C413C  90 01 00 0C */	stw r0, 0xc(r1)
/* 801C7140 001C4140  48 0E BB 75 */	bl GXSetTevColor
/* 801C7144 001C4144  38 7F 01 1C */	addi r3, r31, 0x11c
/* 801C7148 001C4148  38 9E 00 30 */	addi r4, r30, 0x30
/* 801C714C 001C414C  38 A1 00 60 */	addi r5, r1, 0x60
/* 801C7150 001C4150  48 0D 0E 11 */	bl PSMTXConcat
/* 801C7154 001C4154  C0 3E 00 60 */	lfs f1, 0x60(r30)
/* 801C7158 001C4158  C0 02 E0 70 */	lfs f0, lbl_8041F3F0@sda21(r2)
/* 801C715C 001C415C  FC 01 00 00 */	fcmpu cr0, f1, f0
/* 801C7160 001C4160  40 82 00 28 */	bne lbl_801C7188
/* 801C7164 001C4164  C0 42 E0 78 */	lfs f2, lbl_8041F3F8@sda21(r2)
/* 801C7168 001C4168  38 61 00 30 */	addi r3, r1, 0x30
/* 801C716C 001C416C  C0 22 E0 74 */	lfs f1, lbl_8041F3F4@sda21(r2)
/* 801C7170 001C4170  FC 60 10 90 */	fmr f3, f2
/* 801C7174 001C4174  48 0D 13 39 */	bl PSMTXScale
/* 801C7178 001C4178  38 61 00 60 */	addi r3, r1, 0x60
/* 801C717C 001C417C  38 81 00 30 */	addi r4, r1, 0x30
/* 801C7180 001C4180  7C 65 1B 78 */	mr r5, r3
/* 801C7184 001C4184  48 0D 0D DD */	bl PSMTXConcat
lbl_801C7188:
/* 801C7188 001C4188  38 61 00 60 */	addi r3, r1, 0x60
/* 801C718C 001C418C  38 80 00 00 */	li r4, 0
/* 801C7190 001C4190  48 0E D3 69 */	bl GXLoadPosMtxImm
/* 801C7194 001C4194  38 60 00 90 */	li r3, 0x90
/* 801C7198 001C4198  38 80 00 00 */	li r4, 0
/* 801C719C 001C419C  38 A0 00 06 */	li r5, 6
/* 801C71A0 001C41A0  48 0E 8A C9 */	bl GXBegin
/* 801C71A4 001C41A4  38 60 00 00 */	li r3, 0
/* 801C71A8 001C41A8  38 80 00 01 */	li r4, 1
/* 801C71AC 001C41AC  38 A0 00 02 */	li r5, 2
/* 801C71B0 001C41B0  38 C0 00 00 */	li r6, 0
/* 801C71B4 001C41B4  38 E0 00 00 */	li r7, 0
/* 801C71B8 001C41B8  39 00 00 02 */	li r8, 2
/* 801C71BC 001C41BC  39 20 00 03 */	li r9, 3
/* 801C71C0 001C41C0  39 40 00 00 */	li r10, 0
/* 801C71C4 001C41C4  48 00 A4 71 */	bl tri2
lbl_801C71C8:
/* 801C71C8 001C41C8  3B BD 00 01 */	addi r29, r29, 1
/* 801C71CC 001C41CC  3B DE 00 88 */	addi r30, r30, 0x88
lbl_801C71D0:
/* 801C71D0 001C41D0  80 1C 00 08 */	lwz r0, 8(r28)
/* 801C71D4 001C41D4  7C 1D 00 00 */	cmpw r29, r0
/* 801C71D8 001C41D8  41 80 FF 3C */	blt lbl_801C7114
/* 801C71DC 001C41DC  80 01 00 A4 */	lwz r0, 0xa4(r1)
/* 801C71E0 001C41E0  83 E1 00 9C */	lwz r31, 0x9c(r1)
/* 801C71E4 001C41E4  83 C1 00 98 */	lwz r30, 0x98(r1)
/* 801C71E8 001C41E8  83 A1 00 94 */	lwz r29, 0x94(r1)
/* 801C71EC 001C41EC  83 81 00 90 */	lwz r28, 0x90(r1)
/* 801C71F0 001C41F0  7C 08 03 A6 */	mtlr r0
/* 801C71F4 001C41F4  38 21 00 A0 */	addi r1, r1, 0xa0
/* 801C71F8 001C41F8  4E 80 00 20 */	blr 
effKemuri7Main:
/* 801C71FC 001C41FC  94 21 FF 70 */	stwu r1, -0x90(r1)
/* 801C7200 001C4200  7C 08 02 A6 */	mflr r0
/* 801C7204 001C4204  3C 80 80 30 */	lis r4, lbl_802FA958@ha
/* 801C7208 001C4208  90 01 00 94 */	stw r0, 0x94(r1)
/* 801C720C 001C420C  38 A4 A9 58 */	addi r5, r4, lbl_802FA958@l
/* 801C7210 001C4210  93 E1 00 8C */	stw r31, 0x8c(r1)
/* 801C7214 001C4214  93 C1 00 88 */	stw r30, 0x88(r1)
/* 801C7218 001C4218  3B C0 00 00 */	li r30, 0
/* 801C721C 001C421C  93 A1 00 84 */	stw r29, 0x84(r1)
/* 801C7220 001C4220  3B A0 00 00 */	li r29, 0
/* 801C7224 001C4224  93 81 00 80 */	stw r28, 0x80(r1)
/* 801C7228 001C4228  7C 7C 1B 78 */	mr r28, r3
/* 801C722C 001C422C  83 E3 00 0C */	lwz r31, 0xc(r3)
/* 801C7230 001C4230  80 85 00 00 */	lwz r4, 0(r5)
/* 801C7234 001C4234  80 65 00 04 */	lwz r3, 4(r5)
/* 801C7238 001C4238  80 05 00 08 */	lwz r0, 8(r5)
/* 801C723C 001C423C  90 81 00 08 */	stw r4, 8(r1)
/* 801C7240 001C4240  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 801C7244 001C4244  90 61 00 0C */	stw r3, 0xc(r1)
/* 801C7248 001C4248  C0 3F 00 10 */	lfs f1, 0x10(r31)
/* 801C724C 001C424C  D0 01 00 08 */	stfs f0, 8(r1)
/* 801C7250 001C4250  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 801C7254 001C4254  90 01 00 10 */	stw r0, 0x10(r1)
/* 801C7258 001C4258  80 81 00 08 */	lwz r4, 8(r1)
/* 801C725C 001C425C  D0 21 00 0C */	stfs f1, 0xc(r1)
/* 801C7260 001C4260  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 801C7264 001C4264  80 61 00 0C */	lwz r3, 0xc(r1)
/* 801C7268 001C4268  80 01 00 10 */	lwz r0, 0x10(r1)
/* 801C726C 001C426C  90 81 00 14 */	stw r4, 0x14(r1)
/* 801C7270 001C4270  90 61 00 18 */	stw r3, 0x18(r1)
/* 801C7274 001C4274  90 01 00 1C */	stw r0, 0x1c(r1)
/* 801C7278 001C4278  48 00 00 84 */	b lbl_801C72FC
lbl_801C727C:
/* 801C727C 001C427C  80 1F 00 00 */	lwz r0, 0(r31)
/* 801C7280 001C4280  2C 00 00 00 */	cmpwi r0, 0
/* 801C7284 001C4284  41 82 00 70 */	beq lbl_801C72F4
/* 801C7288 001C4288  A8 7F 00 06 */	lha r3, 6(r31)
/* 801C728C 001C428C  38 63 FF FF */	addi r3, r3, -1
/* 801C7290 001C4290  7C 60 07 35 */	extsh. r0, r3
/* 801C7294 001C4294  B0 7F 00 06 */	sth r3, 6(r31)
/* 801C7298 001C4298  41 81 00 10 */	bgt lbl_801C72A8
/* 801C729C 001C429C  38 00 00 00 */	li r0, 0
/* 801C72A0 001C42A0  90 1F 00 00 */	stw r0, 0(r31)
/* 801C72A4 001C42A4  48 00 00 50 */	b lbl_801C72F4
lbl_801C72A8:
/* 801C72A8 001C42A8  C0 3F 00 0C */	lfs f1, 0xc(r31)
/* 801C72AC 001C42AC  38 61 00 20 */	addi r3, r1, 0x20
/* 801C72B0 001C42B0  C0 5F 00 10 */	lfs f2, 0x10(r31)
/* 801C72B4 001C42B4  3B A0 00 01 */	li r29, 1
/* 801C72B8 001C42B8  C0 7F 00 14 */	lfs f3, 0x14(r31)
/* 801C72BC 001C42BC  48 0D 11 71 */	bl PSMTXTrans
/* 801C72C0 001C42C0  C0 22 E0 7C */	lfs f1, lbl_8041F3FC@sda21(r2)
/* 801C72C4 001C42C4  38 61 00 50 */	addi r3, r1, 0x50
/* 801C72C8 001C42C8  C0 1F 00 28 */	lfs f0, 0x28(r31)
/* 801C72CC 001C42CC  38 80 00 79 */	li r4, 0x79
/* 801C72D0 001C42D0  EC 21 00 32 */	fmuls f1, f1, f0
/* 801C72D4 001C42D4  48 0D 0F 19 */	bl PSMTXRotRad
/* 801C72D8 001C42D8  38 61 00 20 */	addi r3, r1, 0x20
/* 801C72DC 001C42DC  38 81 00 50 */	addi r4, r1, 0x50
/* 801C72E0 001C42E0  38 BF 00 30 */	addi r5, r31, 0x30
/* 801C72E4 001C42E4  48 0D 0C 7D */	bl PSMTXConcat
/* 801C72E8 001C42E8  88 7F 00 08 */	lbz r3, 8(r31)
/* 801C72EC 001C42EC  38 03 FF FF */	addi r0, r3, -1
/* 801C72F0 001C42F0  98 1F 00 08 */	stb r0, 8(r31)
lbl_801C72F4:
/* 801C72F4 001C42F4  3B DE 00 01 */	addi r30, r30, 1
/* 801C72F8 001C42F8  3B FF 00 88 */	addi r31, r31, 0x88
lbl_801C72FC:
/* 801C72FC 001C42FC  80 1C 00 08 */	lwz r0, 8(r28)
/* 801C7300 001C4300  7C 1E 00 00 */	cmpw r30, r0
/* 801C7304 001C4304  41 80 FF 78 */	blt lbl_801C727C
/* 801C7308 001C4308  2C 1D 00 00 */	cmpwi r29, 0
/* 801C730C 001C430C  40 82 00 10 */	bne lbl_801C731C
/* 801C7310 001C4310  7F 83 E3 78 */	mr r3, r28
/* 801C7314 001C4314  4B E9 68 71 */	bl effDelete
/* 801C7318 001C4318  48 00 00 24 */	b lbl_801C733C
lbl_801C731C:
/* 801C731C 001C431C  38 61 00 14 */	addi r3, r1, 0x14
/* 801C7320 001C4320  4B E4 93 A1 */	bl dispCalcZ
/* 801C7324 001C4324  3C 60 80 1C */	lis r3, effKemuri7Disp@ha
/* 801C7328 001C4328  7F 86 E3 78 */	mr r6, r28
/* 801C732C 001C432C  38 A3 6F E0 */	addi r5, r3, effKemuri7Disp@l
/* 801C7330 001C4330  38 80 00 02 */	li r4, 2
/* 801C7334 001C4334  38 60 00 04 */	li r3, 4
/* 801C7338 001C4338  4B E4 96 E1 */	bl dispEntry
lbl_801C733C:
/* 801C733C 001C433C  80 01 00 94 */	lwz r0, 0x94(r1)
/* 801C7340 001C4340  83 E1 00 8C */	lwz r31, 0x8c(r1)
/* 801C7344 001C4344  83 C1 00 88 */	lwz r30, 0x88(r1)
/* 801C7348 001C4348  83 A1 00 84 */	lwz r29, 0x84(r1)
/* 801C734C 001C434C  83 81 00 80 */	lwz r28, 0x80(r1)
/* 801C7350 001C4350  7C 08 03 A6 */	mtlr r0
/* 801C7354 001C4354  38 21 00 90 */	addi r1, r1, 0x90
/* 801C7358 001C4358  4E 80 00 20 */	blr 

.global effKemuri7N64Entry
effKemuri7N64Entry:
/* 801C735C 001C435C  94 21 FF 80 */	stwu r1, -0x80(r1)
/* 801C7360 001C4360  7C 08 02 A6 */	mflr r0
/* 801C7364 001C4364  90 01 00 84 */	stw r0, 0x84(r1)
/* 801C7368 001C4368  DB E1 00 70 */	stfd f31, 0x70(r1)
/* 801C736C 001C436C  F3 E1 00 78 */	psq_st f31, 120(r1), 0, qr0
/* 801C7370 001C4370  DB C1 00 60 */	stfd f30, 0x60(r1)
/* 801C7374 001C4374  F3 C1 00 68 */	psq_st f30, 104(r1), 0, qr0
/* 801C7378 001C4378  DB A1 00 50 */	stfd f29, 0x50(r1)
/* 801C737C 001C437C  F3 A1 00 58 */	psq_st f29, 88(r1), 0, qr0
/* 801C7380 001C4380  DB 81 00 40 */	stfd f28, 0x40(r1)
/* 801C7384 001C4384  F3 81 00 48 */	psq_st f28, 72(r1), 0, qr0
/* 801C7388 001C4388  DB 61 00 30 */	stfd f27, 0x30(r1)
/* 801C738C 001C438C  F3 61 00 38 */	psq_st f27, 56(r1), 0, qr0
/* 801C7390 001C4390  DB 41 00 20 */	stfd f26, 0x20(r1)
/* 801C7394 001C4394  F3 41 00 28 */	psq_st f26, 40(r1), 0, qr0
/* 801C7398 001C4398  DB 21 00 10 */	stfd f25, 0x10(r1)
/* 801C739C 001C439C  F3 21 00 18 */	psq_st f25, 24(r1), 0, qr0
/* 801C73A0 001C43A0  93 E1 00 0C */	stw r31, 0xc(r1)
/* 801C73A4 001C43A4  93 C1 00 08 */	stw r30, 8(r1)
/* 801C73A8 001C43A8  FF 80 08 90 */	fmr f28, f1
/* 801C73AC 001C43AC  FF A0 10 90 */	fmr f29, f2
/* 801C73B0 001C43B0  FF 60 18 90 */	fmr f27, f3
/* 801C73B4 001C43B4  FF 40 20 90 */	fmr f26, f4
/* 801C73B8 001C43B8  FF 20 28 90 */	fmr f25, f5
/* 801C73BC 001C43BC  4B E9 6A 01 */	bl effEntry
/* 801C73C0 001C43C0  3C 80 80 30 */	lis r4, lbl_802FA964@ha
/* 801C73C4 001C43C4  7C 7E 1B 78 */	mr r30, r3
/* 801C73C8 001C43C8  38 84 A9 64 */	addi r4, r4, lbl_802FA964@l
/* 801C73CC 001C43CC  38 00 00 01 */	li r0, 1
/* 801C73D0 001C43D0  90 9E 00 14 */	stw r4, 0x14(r30)
/* 801C73D4 001C43D4  38 60 00 03 */	li r3, 3
/* 801C73D8 001C43D8  38 80 00 88 */	li r4, 0x88
/* 801C73DC 001C43DC  90 1E 00 08 */	stw r0, 8(r30)
/* 801C73E0 001C43E0  4B E6 86 AD */	bl __memAlloc
/* 801C73E4 001C43E4  7C 7F 1B 78 */	mr r31, r3
/* 801C73E8 001C43E8  3C 60 80 1C */	lis r3, effKemuri7Main@ha
/* 801C73EC 001C43EC  93 FE 00 0C */	stw r31, 0xc(r30)
/* 801C73F0 001C43F0  38 03 71 FC */	addi r0, r3, effKemuri7Main@l
/* 801C73F4 001C43F4  C0 22 E0 80 */	lfs f1, lbl_8041F400@sda21(r2)
/* 801C73F8 001C43F8  38 60 00 01 */	li r3, 1
/* 801C73FC 001C43FC  90 1E 00 10 */	stw r0, 0x10(r30)
/* 801C7400 001C4400  38 00 00 FF */	li r0, 0xff
/* 801C7404 001C4404  EC 81 D6 7A */	fmadds f4, f1, f25, f26
/* 801C7408 001C4408  C0 62 E0 84 */	lfs f3, lbl_8041F404@sda21(r2)
/* 801C740C 001C440C  90 7F 00 00 */	stw r3, 0(r31)
/* 801C7410 001C4410  FC 20 D0 90 */	fmr f1, f26
/* 801C7414 001C4414  C0 42 E0 70 */	lfs f2, lbl_8041F3F0@sda21(r2)
/* 801C7418 001C4418  C0 02 E0 88 */	lfs f0, lbl_8041F408@sda21(r2)
/* 801C741C 001C441C  D0 5F 00 6C */	stfs f2, 0x6c(r31)
/* 801C7420 001C4420  EC 64 18 28 */	fsubs f3, f4, f3
/* 801C7424 001C4424  EF 40 06 72 */	fmuls f26, f0, f25
/* 801C7428 001C4428  C0 02 E0 78 */	lfs f0, lbl_8041F3F8@sda21(r2)
/* 801C742C 001C442C  D3 9F 00 0C */	stfs f28, 0xc(r31)
/* 801C7430 001C4430  C3 82 E0 8C */	lfs f28, lbl_8041F40C@sda21(r2)
/* 801C7434 001C4434  D3 BF 00 10 */	stfs f29, 0x10(r31)
/* 801C7438 001C4438  C3 A2 E0 90 */	lfs f29, lbl_8041F410@sda21(r2)
/* 801C743C 001C443C  D3 7F 00 14 */	stfs f27, 0x14(r31)
/* 801C7440 001C4440  C3 C2 E0 94 */	lfs f30, lbl_8041F414@sda21(r2)
/* 801C7444 001C4444  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 801C7448 001C4448  C3 E2 E0 98 */	lfs f31, lbl_8041F418@sda21(r2)
/* 801C744C 001C444C  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 801C7450 001C4450  D0 1F 00 20 */	stfs f0, 0x20(r31)
/* 801C7454 001C4454  98 1F 00 08 */	stb r0, 8(r31)
/* 801C7458 001C4458  D3 3F 00 60 */	stfs f25, 0x60(r31)
/* 801C745C 001C445C  D0 5F 00 70 */	stfs f2, 0x70(r31)
/* 801C7460 001C4460  D0 5F 00 74 */	stfs f2, 0x74(r31)
/* 801C7464 001C4464  B0 1F 00 06 */	sth r0, 6(r31)
/* 801C7468 001C4468  D0 5F 00 24 */	stfs f2, 0x24(r31)
/* 801C746C 001C446C  D0 7F 00 28 */	stfs f3, 0x28(r31)
/* 801C7470 001C4470  D0 5F 00 2C */	stfs f2, 0x2c(r31)
/* 801C7474 001C4474  4B E3 FE 35 */	bl reviseAngle
/* 801C7478 001C4478  FF 60 08 90 */	fmr f27, f1
/* 801C747C 001C447C  EC 1C 06 F2 */	fmuls f0, f28, f27
/* 801C7480 001C4480  EF 20 E8 24 */	fdivs f25, f0, f29
/* 801C7484 001C4484  FC 20 C8 90 */	fmr f1, f25
/* 801C7488 001C4488  48 0A 4F 71 */	bl sin
/* 801C748C 001C448C  FC 00 08 18 */	frsp f0, f1
/* 801C7490 001C4490  FC 20 C8 90 */	fmr f1, f25
/* 801C7494 001C4494  D0 1F 00 80 */	stfs f0, 0x80(r31)
/* 801C7498 001C4498  48 0A 49 F9 */	bl cos
/* 801C749C 001C449C  EC 1E D8 2A */	fadds f0, f30, f27
/* 801C74A0 001C44A0  FC 20 08 18 */	frsp f1, f1
/* 801C74A4 001C44A4  EC 00 D0 28 */	fsubs f0, f0, f26
/* 801C74A8 001C44A8  D0 3F 00 84 */	stfs f1, 0x84(r31)
/* 801C74AC 001C44AC  EC 1C 00 32 */	fmuls f0, f28, f0
/* 801C74B0 001C44B0  EF 20 E8 24 */	fdivs f25, f0, f29
/* 801C74B4 001C44B4  FC 20 C8 90 */	fmr f1, f25
/* 801C74B8 001C44B8  48 0A 4F 41 */	bl sin
/* 801C74BC 001C44BC  FC 40 08 18 */	frsp f2, f1
/* 801C74C0 001C44C0  C0 1F 00 0C */	lfs f0, 0xc(r31)
/* 801C74C4 001C44C4  FC 20 C8 90 */	fmr f1, f25
/* 801C74C8 001C44C8  EC 1F 00 BA */	fmadds f0, f31, f2, f0
/* 801C74CC 001C44CC  D0 1F 00 0C */	stfs f0, 0xc(r31)
/* 801C74D0 001C44D0  48 0A 49 C1 */	bl cos
/* 801C74D4 001C44D4  FC 20 08 18 */	frsp f1, f1
/* 801C74D8 001C44D8  C0 1F 00 14 */	lfs f0, 0x14(r31)
/* 801C74DC 001C44DC  38 00 00 FF */	li r0, 0xff
/* 801C74E0 001C44E0  7F C3 F3 78 */	mr r3, r30
/* 801C74E4 001C44E4  EC 1F 00 7A */	fmadds f0, f31, f1, f0
/* 801C74E8 001C44E8  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 801C74EC 001C44EC  98 1F 00 08 */	stb r0, 8(r31)
/* 801C74F0 001C44F0  E3 E1 00 78 */	psq_l f31, 120(r1), 0, qr0
/* 801C74F4 001C44F4  CB E1 00 70 */	lfd f31, 0x70(r1)
/* 801C74F8 001C44F8  E3 C1 00 68 */	psq_l f30, 104(r1), 0, qr0
/* 801C74FC 001C44FC  CB C1 00 60 */	lfd f30, 0x60(r1)
/* 801C7500 001C4500  E3 A1 00 58 */	psq_l f29, 88(r1), 0, qr0
/* 801C7504 001C4504  CB A1 00 50 */	lfd f29, 0x50(r1)
/* 801C7508 001C4508  E3 81 00 48 */	psq_l f28, 72(r1), 0, qr0
/* 801C750C 001C450C  CB 81 00 40 */	lfd f28, 0x40(r1)
/* 801C7510 001C4510  E3 61 00 38 */	psq_l f27, 56(r1), 0, qr0
/* 801C7514 001C4514  CB 61 00 30 */	lfd f27, 0x30(r1)
/* 801C7518 001C4518  E3 41 00 28 */	psq_l f26, 40(r1), 0, qr0
/* 801C751C 001C451C  CB 41 00 20 */	lfd f26, 0x20(r1)
/* 801C7520 001C4520  E3 21 00 18 */	psq_l f25, 24(r1), 0, qr0
/* 801C7524 001C4524  CB 21 00 10 */	lfd f25, 0x10(r1)
/* 801C7528 001C4528  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 801C752C 001C452C  80 01 00 84 */	lwz r0, 0x84(r1)
/* 801C7530 001C4530  83 C1 00 08 */	lwz r30, 8(r1)
/* 801C7534 001C4534  7C 08 03 A6 */	mtlr r0
/* 801C7538 001C4538  38 21 00 80 */	addi r1, r1, 0x80
/* 801C753C 001C453C  4E 80 00 20 */	blr 
