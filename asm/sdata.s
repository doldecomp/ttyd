.include "macros.inc"


.section .sdata, "wa"  # 0x8040F260 - 0x80418360

.global lbl_8040F260
lbl_8040F260:
	.incbin "baserom.dol", 0x3BE7E0, 0x4
.global lbl_8040F264
lbl_8040F264:
	.incbin "baserom.dol", 0x3BE7E4, 0x4
.global lbl_8040F268
lbl_8040F268:
	.incbin "baserom.dol", 0x3BE7E8, 0x30
.global lbl_8040F298
lbl_8040F298:
	.incbin "baserom.dol", 0x3BE818, 0x28
.global lbl_8040F2C0
lbl_8040F2C0:
	.incbin "baserom.dol", 0x3BE840, 0x20
.global lbl_8040F2E0
lbl_8040F2E0:
	.incbin "baserom.dol", 0x3BE860, 0x8
.global lbl_8040F2E8
lbl_8040F2E8:
	.incbin "baserom.dol", 0x3BE868, 0x8
.global lbl_8040F2F0
lbl_8040F2F0:
	.incbin "baserom.dol", 0x3BE870, 0x4
.global lbl_8040F2F4
lbl_8040F2F4:
	.incbin "baserom.dol", 0x3BE874, 0x4
.global lbl_8040F2F8
lbl_8040F2F8:
	.incbin "baserom.dol", 0x3BE878, 0x4
.global lbl_8040F2FC
lbl_8040F2FC:
	.incbin "baserom.dol", 0x3BE87C, 0x4
.global lbl_8040F300
lbl_8040F300:
	.incbin "baserom.dol", 0x3BE880, 0x4
.global lbl_8040F304
lbl_8040F304:
	.incbin "baserom.dol", 0x3BE884, 0x4
.global lbl_8040F308
lbl_8040F308:
	.incbin "baserom.dol", 0x3BE888, 0x4
.global lbl_8040F30C
lbl_8040F30C:
	.incbin "baserom.dol", 0x3BE88C, 0x4
.global lbl_8040F310
lbl_8040F310:
	.incbin "baserom.dol", 0x3BE890, 0x8
.global lbl_8040F318
lbl_8040F318:
	.incbin "baserom.dol", 0x3BE898, 0x48
.global lbl_8040F360
lbl_8040F360:
	.incbin "baserom.dol", 0x3BE8E0, 0x20
.global lbl_8040F380
lbl_8040F380:
	.incbin "baserom.dol", 0x3BE900, 0x20
.global lbl_8040F3A0
lbl_8040F3A0:
	.incbin "baserom.dol", 0x3BE920, 0x4
.global lbl_8040F3A4
lbl_8040F3A4:
	.incbin "baserom.dol", 0x3BE924, 0x14
.global lbl_8040F3B8
lbl_8040F3B8:
	.incbin "baserom.dol", 0x3BE938, 0x18
.global lbl_8040F3D0
lbl_8040F3D0:
	.incbin "baserom.dol", 0x3BE950, 0x10
.global lbl_8040F3E0
lbl_8040F3E0:
	.incbin "baserom.dol", 0x3BE960, 0x20
.global lbl_8040F400
lbl_8040F400:
	.incbin "baserom.dol", 0x3BE980, 0x4
.global lbl_8040F404
lbl_8040F404:
	.incbin "baserom.dol", 0x3BE984, 0x4
.global lbl_8040F408
lbl_8040F408:
	.incbin "baserom.dol", 0x3BE988, 0x4
.global lbl_8040F40C
lbl_8040F40C:
	.incbin "baserom.dol", 0x3BE98C, 0x14
.global lbl_8040F420
lbl_8040F420:
	.incbin "baserom.dol", 0x3BE9A0, 0x20
.global lbl_8040F440
lbl_8040F440:
	.incbin "baserom.dol", 0x3BE9C0, 0x20
.global lbl_8040F460
lbl_8040F460:
	.incbin "baserom.dol", 0x3BE9E0, 0x20
.global lbl_8040F480
lbl_8040F480:
	.incbin "baserom.dol", 0x3BEA00, 0x20
.global lbl_8040F4A0
lbl_8040F4A0:
	.incbin "baserom.dol", 0x3BEA20, 0x10
.global lbl_8040F4B0
lbl_8040F4B0:
	.incbin "baserom.dol", 0x3BEA30, 0x4
.global lbl_8040F4B4
lbl_8040F4B4:
	.incbin "baserom.dol", 0x3BEA34, 0x4
.global lbl_8040F4B8
lbl_8040F4B8:
	.incbin "baserom.dol", 0x3BEA38, 0x8
.global lbl_8040F4C0
lbl_8040F4C0:
	.incbin "baserom.dol", 0x3BEA40, 0x8
.global lbl_8040F4C8
lbl_8040F4C8:
	.incbin "baserom.dol", 0x3BEA48, 0x10
.global lbl_8040F4D8
lbl_8040F4D8:
	.incbin "baserom.dol", 0x3BEA58, 0x30
.global lbl_8040F508
lbl_8040F508:
	.incbin "baserom.dol", 0x3BEA88, 0x8
.global lbl_8040F510
lbl_8040F510:
	.incbin "baserom.dol", 0x3BEA90, 0x4
.global lbl_8040F514
lbl_8040F514:
	.incbin "baserom.dol", 0x3BEA94, 0xBCC
.global lbl_804100E0
lbl_804100E0:
	.incbin "baserom.dol", 0x3BF660, 0x10
.global lbl_804100F0
lbl_804100F0:
	.incbin "baserom.dol", 0x3BF670, 0x10
.global lbl_80410100
lbl_80410100:
	.incbin "baserom.dol", 0x3BF680, 0x4
.global lbl_80410104
lbl_80410104:
	.incbin "baserom.dol", 0x3BF684, 0x4
.global lbl_80410108
lbl_80410108:
	.incbin "baserom.dol", 0x3BF688, 0x10
.global lbl_80410118
lbl_80410118:
	.incbin "baserom.dol", 0x3BF698, 0x20
.global lbl_80410138
lbl_80410138:
	.incbin "baserom.dol", 0x3BF6B8, 0x8C
.global lbl_804101C4
lbl_804101C4:
	.incbin "baserom.dol", 0x3BF744, 0x2C
.global lbl_804101F0
lbl_804101F0:
	.incbin "baserom.dol", 0x3BF770, 0x30
.global lbl_80410220
lbl_80410220:
	.incbin "baserom.dol", 0x3BF7A0, 0x4
.global lbl_80410224
lbl_80410224:
	.incbin "baserom.dol", 0x3BF7A4, 0x1C
.global lbl_80410240
lbl_80410240:
	.incbin "baserom.dol", 0x3BF7C0, 0x20
.global lbl_80410260
lbl_80410260:
	.incbin "baserom.dol", 0x3BF7E0, 0x30
.global lbl_80410290
lbl_80410290:
	.incbin "baserom.dol", 0x3BF810, 0x20
.global lbl_804102B0
lbl_804102B0:
	.incbin "baserom.dol", 0x3BF830, 0x18
.global lbl_804102C8
lbl_804102C8:
	.incbin "baserom.dol", 0x3BF848, 0x1C
.global lbl_804102E4
lbl_804102E4:
	.incbin "baserom.dol", 0x3BF864, 0x24
.global lbl_80410308
lbl_80410308:
	.incbin "baserom.dol", 0x3BF888, 0x8
.global lbl_80410310
lbl_80410310:
	.incbin "baserom.dol", 0x3BF890, 0x4
.global lbl_80410314
lbl_80410314:
	.incbin "baserom.dol", 0x3BF894, 0x14
.global lbl_80410328
lbl_80410328:
	.incbin "baserom.dol", 0x3BF8A8, 0x20
.global lbl_80410348
lbl_80410348:
	.incbin "baserom.dol", 0x3BF8C8, 0x8
.global lbl_80410350
lbl_80410350:
	.incbin "baserom.dol", 0x3BF8D0, 0xC
.global lbl_8041035C
lbl_8041035C:
	.incbin "baserom.dol", 0x3BF8DC, 0x8
.global lbl_80410364
lbl_80410364:
	.incbin "baserom.dol", 0x3BF8E4, 0xC
.global lbl_80410370
lbl_80410370:
	.incbin "baserom.dol", 0x3BF8F0, 0x8
.global lbl_80410378
lbl_80410378:
	.incbin "baserom.dol", 0x3BF8F8, 0x14
.global lbl_8041038C
lbl_8041038C:
	.incbin "baserom.dol", 0x3BF90C, 0x3C
.global lbl_804103C8
lbl_804103C8:
	.incbin "baserom.dol", 0x3BF948, 0x4
.global lbl_804103CC
lbl_804103CC:
	.incbin "baserom.dol", 0x3BF94C, 0x8
.global lbl_804103D4
lbl_804103D4:
	.incbin "baserom.dol", 0x3BF954, 0x18
.global lbl_804103EC
lbl_804103EC:
	.incbin "baserom.dol", 0x3BF96C, 0xC
.global lbl_804103F8
lbl_804103F8:
	.incbin "baserom.dol", 0x3BF978, 0x8
.global lbl_80410400
lbl_80410400:
	.incbin "baserom.dol", 0x3BF980, 0x28
.global lbl_80410428
lbl_80410428:
	.incbin "baserom.dol", 0x3BF9A8, 0x28
.global lbl_80410450
lbl_80410450:
	.incbin "baserom.dol", 0x3BF9D0, 0x20
.global lbl_80410470
lbl_80410470:
	.incbin "baserom.dol", 0x3BF9F0, 0x20
.global lbl_80410490
lbl_80410490:
	.incbin "baserom.dol", 0x3BFA10, 0x20
.global lbl_804104B0
lbl_804104B0:
	.incbin "baserom.dol", 0x3BFA30, 0x20
.global lbl_804104D0
lbl_804104D0:
	.incbin "baserom.dol", 0x3BFA50, 0x28
.global lbl_804104F8
lbl_804104F8:
	.incbin "baserom.dol", 0x3BFA78, 0x20
.global lbl_80410518
lbl_80410518:
	.incbin "baserom.dol", 0x3BFA98, 0x10
.global lbl_80410528
lbl_80410528:
	.incbin "baserom.dol", 0x3BFAA8, 0x30
.global lbl_80410558
lbl_80410558:
	.incbin "baserom.dol", 0x3BFAD8, 0x18
.global lbl_80410570
lbl_80410570:
	.incbin "baserom.dol", 0x3BFAF0, 0x10
.global lbl_80410580
lbl_80410580:
	.incbin "baserom.dol", 0x3BFB00, 0x8
.global lbl_80410588
lbl_80410588:
	.incbin "baserom.dol", 0x3BFB08, 0x28
.global lbl_804105B0
lbl_804105B0:
	.incbin "baserom.dol", 0x3BFB30, 0x28
.global lbl_804105D8
lbl_804105D8:
	.incbin "baserom.dol", 0x3BFB58, 0x28
.global lbl_80410600
lbl_80410600:
	.incbin "baserom.dol", 0x3BFB80, 0x20
.global lbl_80410620
lbl_80410620:
	.incbin "baserom.dol", 0x3BFBA0, 0x20
.global lbl_80410640
lbl_80410640:
	.incbin "baserom.dol", 0x3BFBC0, 0x20
.global lbl_80410660
lbl_80410660:
	.incbin "baserom.dol", 0x3BFBE0, 0x2C
.global lbl_8041068C
lbl_8041068C:
	.incbin "baserom.dol", 0x3BFC0C, 0x34
.global lbl_804106C0
lbl_804106C0:
	.incbin "baserom.dol", 0x3BFC40, 0x18
.global lbl_804106D8
lbl_804106D8:
	.incbin "baserom.dol", 0x3BFC58, 0x4
.global lbl_804106DC
lbl_804106DC:
	.incbin "baserom.dol", 0x3BFC5C, 0x24
.global lbl_80410700
lbl_80410700:
	.incbin "baserom.dol", 0x3BFC80, 0x20
.global lbl_80410720
lbl_80410720:
	.incbin "baserom.dol", 0x3BFCA0, 0x40
.global lbl_80410760
lbl_80410760:
	.incbin "baserom.dol", 0x3BFCE0, 0x20
.global lbl_80410780
lbl_80410780:
	.incbin "baserom.dol", 0x3BFD00, 0x28
.global lbl_804107A8
lbl_804107A8:
	.incbin "baserom.dol", 0x3BFD28, 0x38
.global lbl_804107E0
lbl_804107E0:
	.incbin "baserom.dol", 0x3BFD60, 0x20
.global lbl_80410800
lbl_80410800:
	.incbin "baserom.dol", 0x3BFD80, 0x28
.global lbl_80410828
lbl_80410828:
	.incbin "baserom.dol", 0x3BFDA8, 0x10
.global lbl_80410838
lbl_80410838:
	.incbin "baserom.dol", 0x3BFDB8, 0x3E0
.global lbl_80410C18
lbl_80410C18:
	.incbin "baserom.dol", 0x3C0198, 0x8
.global lbl_80410C20
lbl_80410C20:
	.incbin "baserom.dol", 0x3C01A0, 0x4
.global lbl_80410C24
lbl_80410C24:
	.incbin "baserom.dol", 0x3C01A4, 0x1C
.global lbl_80410C40
lbl_80410C40:
	.incbin "baserom.dol", 0x3C01C0, 0x30
.global lbl_80410C70
lbl_80410C70:
	.incbin "baserom.dol", 0x3C01F0, 0x30
.global lbl_80410CA0
lbl_80410CA0:
	.incbin "baserom.dol", 0x3C0220, 0x30
.global lbl_80410CD0
lbl_80410CD0:
	.incbin "baserom.dol", 0x3C0250, 0x30
.global lbl_80410D00
lbl_80410D00:
	.incbin "baserom.dol", 0x3C0280, 0x20
.global lbl_80410D20
lbl_80410D20:
	.incbin "baserom.dol", 0x3C02A0, 0x14
.global lbl_80410D34
lbl_80410D34:
	.incbin "baserom.dol", 0x3C02B4, 0x2C
.global lbl_80410D60
lbl_80410D60:
	.incbin "baserom.dol", 0x3C02E0, 0x30
.global lbl_80410D90
lbl_80410D90:
	.incbin "baserom.dol", 0x3C0310, 0x14
.global lbl_80410DA4
lbl_80410DA4:
	.incbin "baserom.dol", 0x3C0324, 0x18
.global lbl_80410DBC
lbl_80410DBC:
	.incbin "baserom.dol", 0x3C033C, 0x1C
.global lbl_80410DD8
lbl_80410DD8:
	.incbin "baserom.dol", 0x3C0358, 0x38
.global lbl_80410E10
lbl_80410E10:
	.incbin "baserom.dol", 0x3C0390, 0x160
.global lbl_80410F70
lbl_80410F70:
	.incbin "baserom.dol", 0x3C04F0, 0x8
.global lbl_80410F78
lbl_80410F78:
	.incbin "baserom.dol", 0x3C04F8, 0x30
.global lbl_80410FA8
lbl_80410FA8:
	.incbin "baserom.dol", 0x3C0528, 0x10
.global lbl_80410FB8
lbl_80410FB8:
	.incbin "baserom.dol", 0x3C0538, 0x20
.global lbl_80410FD8
lbl_80410FD8:
	.incbin "baserom.dol", 0x3C0558, 0x24
.global lbl_80410FFC
lbl_80410FFC:
	.incbin "baserom.dol", 0x3C057C, 0x34
.global lbl_80411030
lbl_80411030:
	.incbin "baserom.dol", 0x3C05B0, 0x20
.global lbl_80411050
lbl_80411050:
	.incbin "baserom.dol", 0x3C05D0, 0x368
.global lbl_804113B8
lbl_804113B8:
	.incbin "baserom.dol", 0x3C0938, 0xA8
.global lbl_80411460
lbl_80411460:
	.incbin "baserom.dol", 0x3C09E0, 0x58
.global lbl_804114B8
lbl_804114B8:
	.incbin "baserom.dol", 0x3C0A38, 0x28
.global lbl_804114E0
lbl_804114E0:
	.incbin "baserom.dol", 0x3C0A60, 0x2A0
.global lbl_80411780
lbl_80411780:
	.incbin "baserom.dol", 0x3C0D00, 0x18
.global lbl_80411798
lbl_80411798:
	.incbin "baserom.dol", 0x3C0D18, 0x4
.global lbl_8041179C
lbl_8041179C:
	.incbin "baserom.dol", 0x3C0D1C, 0x4
.global lbl_804117A0
lbl_804117A0:
	.incbin "baserom.dol", 0x3C0D20, 0x4
.global lbl_804117A4
lbl_804117A4:
	.incbin "baserom.dol", 0x3C0D24, 0x4
.global lbl_804117A8
lbl_804117A8:
	.incbin "baserom.dol", 0x3C0D28, 0x8
.global lbl_804117B0
lbl_804117B0:
	.incbin "baserom.dol", 0x3C0D30, 0x30
.global lbl_804117E0
lbl_804117E0:
	.incbin "baserom.dol", 0x3C0D60, 0x20
.global lbl_80411800
lbl_80411800:
	.incbin "baserom.dol", 0x3C0D80, 0x20
.global lbl_80411820
lbl_80411820:
	.incbin "baserom.dol", 0x3C0DA0, 0x20
.global lbl_80411840
lbl_80411840:
	.incbin "baserom.dol", 0x3C0DC0, 0x20
.global lbl_80411860
lbl_80411860:
	.incbin "baserom.dol", 0x3C0DE0, 0x20
.global lbl_80411880
lbl_80411880:
	.incbin "baserom.dol", 0x3C0E00, 0x18
.global lbl_80411898
lbl_80411898:
	.incbin "baserom.dol", 0x3C0E18, 0x24
.global lbl_804118BC
lbl_804118BC:
	.incbin "baserom.dol", 0x3C0E3C, 0x10
.global lbl_804118CC
lbl_804118CC:
	.incbin "baserom.dol", 0x3C0E4C, 0x10
.global lbl_804118DC
lbl_804118DC:
	.incbin "baserom.dol", 0x3C0E5C, 0x26C
.global lbl_80411B48
lbl_80411B48:
	.incbin "baserom.dol", 0x3C10C8, 0x14
.global lbl_80411B5C
lbl_80411B5C:
	.incbin "baserom.dol", 0x3C10DC, 0x7C
.global lbl_80411BD8
lbl_80411BD8:
	.incbin "baserom.dol", 0x3C1158, 0x10
.global lbl_80411BE8
lbl_80411BE8:
	.incbin "baserom.dol", 0x3C1168, 0x6C
.global lbl_80411C54
lbl_80411C54:
	.incbin "baserom.dol", 0x3C11D4, 0x44
.global lbl_80411C98
lbl_80411C98:
	.incbin "baserom.dol", 0x3C1218, 0x3C
.global lbl_80411CD4
lbl_80411CD4:
	.incbin "baserom.dol", 0x3C1254, 0xE4
.global lbl_80411DB8
lbl_80411DB8:
	.incbin "baserom.dol", 0x3C1338, 0x28
.global lbl_80411DE0
lbl_80411DE0:
	.incbin "baserom.dol", 0x3C1360, 0x18
.global lbl_80411DF8
lbl_80411DF8:
	.incbin "baserom.dol", 0x3C1378, 0x30
.global lbl_80411E28
lbl_80411E28:
	.incbin "baserom.dol", 0x3C13A8, 0x30
.global lbl_80411E58
lbl_80411E58:
	.incbin "baserom.dol", 0x3C13D8, 0x30
.global lbl_80411E88
lbl_80411E88:
	.incbin "baserom.dol", 0x3C1408, 0x1C
.global lbl_80411EA4
lbl_80411EA4:
	.incbin "baserom.dol", 0x3C1424, 0x1C
.global lbl_80411EC0
lbl_80411EC0:
	.incbin "baserom.dol", 0x3C1440, 0x1C
.global lbl_80411EDC
lbl_80411EDC:
	.incbin "baserom.dol", 0x3C145C, 0x10
.global lbl_80411EEC
lbl_80411EEC:
	.incbin "baserom.dol", 0x3C146C, 0x18
.global lbl_80411F04
lbl_80411F04:
	.incbin "baserom.dol", 0x3C1484, 0x1C
.global lbl_80411F20
lbl_80411F20:
	.incbin "baserom.dol", 0x3C14A0, 0x20
.global lbl_80411F40
lbl_80411F40:
	.incbin "baserom.dol", 0x3C14C0, 0x8
.global lbl_80411F48
lbl_80411F48:
	.incbin "baserom.dol", 0x3C14C8, 0xF4
.global lbl_8041203C
lbl_8041203C:
	.incbin "baserom.dol", 0x3C15BC, 0x94
.global lbl_804120D0
lbl_804120D0:
	.incbin "baserom.dol", 0x3C1650, 0x14
.global lbl_804120E4
lbl_804120E4:
	.incbin "baserom.dol", 0x3C1664, 0x24
.global lbl_80412108
lbl_80412108:
	.incbin "baserom.dol", 0x3C1688, 0x10
.global lbl_80412118
lbl_80412118:
	.incbin "baserom.dol", 0x3C1698, 0x10
.global lbl_80412128
lbl_80412128:
	.incbin "baserom.dol", 0x3C16A8, 0x10
.global lbl_80412138
lbl_80412138:
	.incbin "baserom.dol", 0x3C16B8, 0x18
.global lbl_80412150
lbl_80412150:
	.incbin "baserom.dol", 0x3C16D0, 0x1C
.global lbl_8041216C
lbl_8041216C:
	.incbin "baserom.dol", 0x3C16EC, 0x14
.global lbl_80412180
lbl_80412180:
	.incbin "baserom.dol", 0x3C1700, 0x20
.global lbl_804121A0
lbl_804121A0:
	.incbin "baserom.dol", 0x3C1720, 0x1C
.global lbl_804121BC
lbl_804121BC:
	.incbin "baserom.dol", 0x3C173C, 0x1C
.global lbl_804121D8
lbl_804121D8:
	.incbin "baserom.dol", 0x3C1758, 0xC
.global lbl_804121E4
lbl_804121E4:
	.incbin "baserom.dol", 0x3C1764, 0xC
.global lbl_804121F0
lbl_804121F0:
	.incbin "baserom.dol", 0x3C1770, 0xC
.global lbl_804121FC
lbl_804121FC:
	.incbin "baserom.dol", 0x3C177C, 0xC
.global lbl_80412208
lbl_80412208:
	.incbin "baserom.dol", 0x3C1788, 0x10
.global lbl_80412218
lbl_80412218:
	.incbin "baserom.dol", 0x3C1798, 0x10
.global lbl_80412228
lbl_80412228:
	.incbin "baserom.dol", 0x3C17A8, 0x130
.global lbl_80412358
lbl_80412358:
	.incbin "baserom.dol", 0x3C18D8, 0x148
.global lbl_804124A0
lbl_804124A0:
	.incbin "baserom.dol", 0x3C1A20, 0x20
.global lbl_804124C0
lbl_804124C0:
	.incbin "baserom.dol", 0x3C1A40, 0x20
.global lbl_804124E0
lbl_804124E0:
	.incbin "baserom.dol", 0x3C1A60, 0xF8
.global lbl_804125D8
lbl_804125D8:
	.incbin "baserom.dol", 0x3C1B58, 0x8
.global lbl_804125E0
lbl_804125E0:
	.incbin "baserom.dol", 0x3C1B60, 0x20
.global lbl_80412600
lbl_80412600:
	.incbin "baserom.dol", 0x3C1B80, 0x20
.global lbl_80412620
lbl_80412620:
	.incbin "baserom.dol", 0x3C1BA0, 0x20
.global lbl_80412640
lbl_80412640:
	.incbin "baserom.dol", 0x3C1BC0, 0x8
.global lbl_80412648
lbl_80412648:
	.incbin "baserom.dol", 0x3C1BC8, 0x18
.global lbl_80412660
lbl_80412660:
	.incbin "baserom.dol", 0x3C1BE0, 0x30
.global lbl_80412690
lbl_80412690:
	.incbin "baserom.dol", 0x3C1C10, 0x10
.global lbl_804126A0
lbl_804126A0:
	.incbin "baserom.dol", 0x3C1C20, 0x14
.global lbl_804126B4
lbl_804126B4:
	.incbin "baserom.dol", 0x3C1C34, 0x24
.global lbl_804126D8
lbl_804126D8:
	.incbin "baserom.dol", 0x3C1C58, 0x18
.global lbl_804126F0
lbl_804126F0:
	.incbin "baserom.dol", 0x3C1C70, 0x298
.global lbl_80412988
lbl_80412988:
	.incbin "baserom.dol", 0x3C1F08, 0x1F8
.global lbl_80412B80
lbl_80412B80:
	.incbin "baserom.dol", 0x3C2100, 0x1C
.global lbl_80412B9C
lbl_80412B9C:
	.incbin "baserom.dol", 0x3C211C, 0x14
.global lbl_80412BB0
lbl_80412BB0:
	.incbin "baserom.dol", 0x3C2130, 0x24
.global lbl_80412BD4
lbl_80412BD4:
	.incbin "baserom.dol", 0x3C2154, 0x24
.global lbl_80412BF8
lbl_80412BF8:
	.incbin "baserom.dol", 0x3C2178, 0x24
.global lbl_80412C1C
lbl_80412C1C:
	.incbin "baserom.dol", 0x3C219C, 0x104
.global lbl_80412D20
lbl_80412D20:
	.incbin "baserom.dol", 0x3C22A0, 0x8
.global lbl_80412D28
lbl_80412D28:
	.incbin "baserom.dol", 0x3C22A8, 0x4
.global lbl_80412D2C
lbl_80412D2C:
	.incbin "baserom.dol", 0x3C22AC, 0x4
.global lbl_80412D30
lbl_80412D30:
	.incbin "baserom.dol", 0x3C22B0, 0x8
.global lbl_80412D38
lbl_80412D38:
	.incbin "baserom.dol", 0x3C22B8, 0x8
.global lbl_80412D40
lbl_80412D40:
	.incbin "baserom.dol", 0x3C22C0, 0x18
.global lbl_80412D58
lbl_80412D58:
	.incbin "baserom.dol", 0x3C22D8, 0x28
.global lbl_80412D80
lbl_80412D80:
	.incbin "baserom.dol", 0x3C2300, 0x20
.global lbl_80412DA0
lbl_80412DA0:
	.incbin "baserom.dol", 0x3C2320, 0x20
.global lbl_80412DC0
lbl_80412DC0:
	.incbin "baserom.dol", 0x3C2340, 0x20
.global lbl_80412DE0
lbl_80412DE0:
	.incbin "baserom.dol", 0x3C2360, 0x20
.global lbl_80412E00
lbl_80412E00:
	.incbin "baserom.dol", 0x3C2380, 0x20
.global lbl_80412E20
lbl_80412E20:
	.incbin "baserom.dol", 0x3C23A0, 0x20
.global lbl_80412E40
lbl_80412E40:
	.incbin "baserom.dol", 0x3C23C0, 0x20
.global lbl_80412E60
lbl_80412E60:
	.incbin "baserom.dol", 0x3C23E0, 0x20
.global lbl_80412E80
lbl_80412E80:
	.incbin "baserom.dol", 0x3C2400, 0x20
.global lbl_80412EA0
lbl_80412EA0:
	.incbin "baserom.dol", 0x3C2420, 0x20
.global lbl_80412EC0
lbl_80412EC0:
	.incbin "baserom.dol", 0x3C2440, 0x20
.global lbl_80412EE0
lbl_80412EE0:
	.incbin "baserom.dol", 0x3C2460, 0x20
.global lbl_80412F00
lbl_80412F00:
	.incbin "baserom.dol", 0x3C2480, 0x20
.global lbl_80412F20
lbl_80412F20:
	.incbin "baserom.dol", 0x3C24A0, 0x20
.global lbl_80412F40
lbl_80412F40:
	.incbin "baserom.dol", 0x3C24C0, 0x20
.global lbl_80412F60
lbl_80412F60:
	.incbin "baserom.dol", 0x3C24E0, 0x20
.global lbl_80412F80
lbl_80412F80:
	.incbin "baserom.dol", 0x3C2500, 0x20
.global lbl_80412FA0
lbl_80412FA0:
	.incbin "baserom.dol", 0x3C2520, 0x20
.global lbl_80412FC0
lbl_80412FC0:
	.incbin "baserom.dol", 0x3C2540, 0x20
.global lbl_80412FE0
lbl_80412FE0:
	.incbin "baserom.dol", 0x3C2560, 0x20
.global lbl_80413000
lbl_80413000:
	.incbin "baserom.dol", 0x3C2580, 0x20
.global lbl_80413020
lbl_80413020:
	.incbin "baserom.dol", 0x3C25A0, 0x20
.global lbl_80413040
lbl_80413040:
	.incbin "baserom.dol", 0x3C25C0, 0x20
.global lbl_80413060
lbl_80413060:
	.incbin "baserom.dol", 0x3C25E0, 0x20
.global lbl_80413080
lbl_80413080:
	.incbin "baserom.dol", 0x3C2600, 0x20
.global lbl_804130A0
lbl_804130A0:
	.incbin "baserom.dol", 0x3C2620, 0x20
.global lbl_804130C0
lbl_804130C0:
	.incbin "baserom.dol", 0x3C2640, 0x20
.global lbl_804130E0
lbl_804130E0:
	.incbin "baserom.dol", 0x3C2660, 0x20
.global lbl_80413100
lbl_80413100:
	.incbin "baserom.dol", 0x3C2680, 0x20
.global lbl_80413120
lbl_80413120:
	.incbin "baserom.dol", 0x3C26A0, 0x20
.global lbl_80413140
lbl_80413140:
	.incbin "baserom.dol", 0x3C26C0, 0x20
.global lbl_80413160
lbl_80413160:
	.incbin "baserom.dol", 0x3C26E0, 0x20
.global lbl_80413180
lbl_80413180:
	.incbin "baserom.dol", 0x3C2700, 0x20
.global lbl_804131A0
lbl_804131A0:
	.incbin "baserom.dol", 0x3C2720, 0x20
.global lbl_804131C0
lbl_804131C0:
	.incbin "baserom.dol", 0x3C2740, 0x20
.global lbl_804131E0
lbl_804131E0:
	.incbin "baserom.dol", 0x3C2760, 0x20
.global lbl_80413200
lbl_80413200:
	.incbin "baserom.dol", 0x3C2780, 0x20
.global lbl_80413220
lbl_80413220:
	.incbin "baserom.dol", 0x3C27A0, 0x20
.global lbl_80413240
lbl_80413240:
	.incbin "baserom.dol", 0x3C27C0, 0x20
.global lbl_80413260
lbl_80413260:
	.incbin "baserom.dol", 0x3C27E0, 0x20
.global lbl_80413280
lbl_80413280:
	.incbin "baserom.dol", 0x3C2800, 0x20
.global lbl_804132A0
lbl_804132A0:
	.incbin "baserom.dol", 0x3C2820, 0x20
.global lbl_804132C0
lbl_804132C0:
	.incbin "baserom.dol", 0x3C2840, 0x20
.global lbl_804132E0
lbl_804132E0:
	.incbin "baserom.dol", 0x3C2860, 0x20
.global lbl_80413300
lbl_80413300:
	.incbin "baserom.dol", 0x3C2880, 0x20
.global lbl_80413320
lbl_80413320:
	.incbin "baserom.dol", 0x3C28A0, 0x20
.global lbl_80413340
lbl_80413340:
	.incbin "baserom.dol", 0x3C28C0, 0x20
.global lbl_80413360
lbl_80413360:
	.incbin "baserom.dol", 0x3C28E0, 0x20
.global lbl_80413380
lbl_80413380:
	.incbin "baserom.dol", 0x3C2900, 0x20
.global lbl_804133A0
lbl_804133A0:
	.incbin "baserom.dol", 0x3C2920, 0x20
.global lbl_804133C0
lbl_804133C0:
	.incbin "baserom.dol", 0x3C2940, 0x20
.global lbl_804133E0
lbl_804133E0:
	.incbin "baserom.dol", 0x3C2960, 0x20
.global lbl_80413400
lbl_80413400:
	.incbin "baserom.dol", 0x3C2980, 0x20
.global lbl_80413420
lbl_80413420:
	.incbin "baserom.dol", 0x3C29A0, 0x20
.global lbl_80413440
lbl_80413440:
	.incbin "baserom.dol", 0x3C29C0, 0x20
.global lbl_80413460
lbl_80413460:
	.incbin "baserom.dol", 0x3C29E0, 0x20
.global lbl_80413480
lbl_80413480:
	.incbin "baserom.dol", 0x3C2A00, 0x20
.global lbl_804134A0
lbl_804134A0:
	.incbin "baserom.dol", 0x3C2A20, 0x20
.global lbl_804134C0
lbl_804134C0:
	.incbin "baserom.dol", 0x3C2A40, 0x20
.global lbl_804134E0
lbl_804134E0:
	.incbin "baserom.dol", 0x3C2A60, 0x20
.global lbl_80413500
lbl_80413500:
	.incbin "baserom.dol", 0x3C2A80, 0x20
.global lbl_80413520
lbl_80413520:
	.incbin "baserom.dol", 0x3C2AA0, 0x20
.global lbl_80413540
lbl_80413540:
	.incbin "baserom.dol", 0x3C2AC0, 0x20
.global lbl_80413560
lbl_80413560:
	.incbin "baserom.dol", 0x3C2AE0, 0x20
.global lbl_80413580
lbl_80413580:
	.incbin "baserom.dol", 0x3C2B00, 0x20
.global lbl_804135A0
lbl_804135A0:
	.incbin "baserom.dol", 0x3C2B20, 0x20
.global lbl_804135C0
lbl_804135C0:
	.incbin "baserom.dol", 0x3C2B40, 0x20
.global lbl_804135E0
lbl_804135E0:
	.incbin "baserom.dol", 0x3C2B60, 0x20
.global lbl_80413600
lbl_80413600:
	.incbin "baserom.dol", 0x3C2B80, 0x20
.global lbl_80413620
lbl_80413620:
	.incbin "baserom.dol", 0x3C2BA0, 0x20
.global lbl_80413640
lbl_80413640:
	.incbin "baserom.dol", 0x3C2BC0, 0x20
.global lbl_80413660
lbl_80413660:
	.incbin "baserom.dol", 0x3C2BE0, 0x20
.global lbl_80413680
lbl_80413680:
	.incbin "baserom.dol", 0x3C2C00, 0x20
.global lbl_804136A0
lbl_804136A0:
	.incbin "baserom.dol", 0x3C2C20, 0x20
.global lbl_804136C0
lbl_804136C0:
	.incbin "baserom.dol", 0x3C2C40, 0x20
.global lbl_804136E0
lbl_804136E0:
	.incbin "baserom.dol", 0x3C2C60, 0x20
.global lbl_80413700
lbl_80413700:
	.incbin "baserom.dol", 0x3C2C80, 0x20
.global lbl_80413720
lbl_80413720:
	.incbin "baserom.dol", 0x3C2CA0, 0x20
.global lbl_80413740
lbl_80413740:
	.incbin "baserom.dol", 0x3C2CC0, 0x20
.global lbl_80413760
lbl_80413760:
	.incbin "baserom.dol", 0x3C2CE0, 0x20
.global lbl_80413780
lbl_80413780:
	.incbin "baserom.dol", 0x3C2D00, 0x20
.global lbl_804137A0
lbl_804137A0:
	.incbin "baserom.dol", 0x3C2D20, 0x20
.global lbl_804137C0
lbl_804137C0:
	.incbin "baserom.dol", 0x3C2D40, 0x20
.global lbl_804137E0
lbl_804137E0:
	.incbin "baserom.dol", 0x3C2D60, 0x20
.global lbl_80413800
lbl_80413800:
	.incbin "baserom.dol", 0x3C2D80, 0x20
.global lbl_80413820
lbl_80413820:
	.incbin "baserom.dol", 0x3C2DA0, 0x8
.global lbl_80413828
lbl_80413828:
	.incbin "baserom.dol", 0x3C2DA8, 0x20
.global lbl_80413848
lbl_80413848:
	.incbin "baserom.dol", 0x3C2DC8, 0x24
.global lbl_8041386C
lbl_8041386C:
	.incbin "baserom.dol", 0x3C2DEC, 0xC
.global lbl_80413878
lbl_80413878:
	.incbin "baserom.dol", 0x3C2DF8, 0x8
.global lbl_80413880
lbl_80413880:
	.incbin "baserom.dol", 0x3C2E00, 0x8
.global lbl_80413888
lbl_80413888:
	.incbin "baserom.dol", 0x3C2E08, 0x10
.global lbl_80413898
lbl_80413898:
	.incbin "baserom.dol", 0x3C2E18, 0x14
.global lbl_804138AC
lbl_804138AC:
	.incbin "baserom.dol", 0x3C2E2C, 0x1C
.global lbl_804138C8
lbl_804138C8:
	.incbin "baserom.dol", 0x3C2E48, 0x28
.global lbl_804138F0
lbl_804138F0:
	.incbin "baserom.dol", 0x3C2E70, 0x28
.global lbl_80413918
lbl_80413918:
	.incbin "baserom.dol", 0x3C2E98, 0x28
.global lbl_80413940
lbl_80413940:
	.incbin "baserom.dol", 0x3C2EC0, 0x28
.global lbl_80413968
lbl_80413968:
	.incbin "baserom.dol", 0x3C2EE8, 0x10
.global lbl_80413978
lbl_80413978:
	.incbin "baserom.dol", 0x3C2EF8, 0x18
.global lbl_80413990
lbl_80413990:
	.incbin "baserom.dol", 0x3C2F10, 0x20
.global lbl_804139B0
lbl_804139B0:
	.incbin "baserom.dol", 0x3C2F30, 0x18
.global lbl_804139C8
lbl_804139C8:
	.incbin "baserom.dol", 0x3C2F48, 0x4
.global lbl_804139CC
lbl_804139CC:
	.incbin "baserom.dol", 0x3C2F4C, 0x10
.global lbl_804139DC
lbl_804139DC:
	.incbin "baserom.dol", 0x3C2F5C, 0x10
.global lbl_804139EC
lbl_804139EC:
	.incbin "baserom.dol", 0x3C2F6C, 0x14
.global lbl_80413A00
lbl_80413A00:
	.incbin "baserom.dol", 0x3C2F80, 0x10
.global lbl_80413A10
lbl_80413A10:
	.incbin "baserom.dol", 0x3C2F90, 0x14
.global lbl_80413A24
lbl_80413A24:
	.incbin "baserom.dol", 0x3C2FA4, 0x14
.global lbl_80413A38
lbl_80413A38:
	.incbin "baserom.dol", 0x3C2FB8, 0x3C
.global lbl_80413A74
lbl_80413A74:
	.incbin "baserom.dol", 0x3C2FF4, 0xC
.global lbl_80413A80
lbl_80413A80:
	.incbin "baserom.dol", 0x3C3000, 0x20
.global lbl_80413AA0
lbl_80413AA0:
	.incbin "baserom.dol", 0x3C3020, 0x14
.global lbl_80413AB4
lbl_80413AB4:
	.incbin "baserom.dol", 0x3C3034, 0x10
.global lbl_80413AC4
lbl_80413AC4:
	.incbin "baserom.dol", 0x3C3044, 0x1C
.global lbl_80413AE0
lbl_80413AE0:
	.incbin "baserom.dol", 0x3C3060, 0x20
.global lbl_80413B00
lbl_80413B00:
	.incbin "baserom.dol", 0x3C3080, 0x18
.global lbl_80413B18
lbl_80413B18:
	.incbin "baserom.dol", 0x3C3098, 0x10
.global lbl_80413B28
lbl_80413B28:
	.incbin "baserom.dol", 0x3C30A8, 0x4
.global lbl_80413B2C
lbl_80413B2C:
	.incbin "baserom.dol", 0x3C30AC, 0x24
.global lbl_80413B50
lbl_80413B50:
	.incbin "baserom.dol", 0x3C30D0, 0x10
.global lbl_80413B60
lbl_80413B60:
	.incbin "baserom.dol", 0x3C30E0, 0x20
.global lbl_80413B80
lbl_80413B80:
	.incbin "baserom.dol", 0x3C3100, 0x20
.global lbl_80413BA0
lbl_80413BA0:
	.incbin "baserom.dol", 0x3C3120, 0x8
.global lbl_80413BA8
lbl_80413BA8:
	.incbin "baserom.dol", 0x3C3128, 0x28
.global lbl_80413BD0
lbl_80413BD0:
	.incbin "baserom.dol", 0x3C3150, 0x20
.global lbl_80413BF0
lbl_80413BF0:
	.incbin "baserom.dol", 0x3C3170, 0x10
.global lbl_80413C00
lbl_80413C00:
	.incbin "baserom.dol", 0x3C3180, 0x1C
.global lbl_80413C1C
lbl_80413C1C:
	.incbin "baserom.dol", 0x3C319C, 0x24
.global lbl_80413C40
lbl_80413C40:
	.incbin "baserom.dol", 0x3C31C0, 0x10
.global lbl_80413C50
lbl_80413C50:
	.incbin "baserom.dol", 0x3C31D0, 0x10
.global lbl_80413C60
lbl_80413C60:
	.incbin "baserom.dol", 0x3C31E0, 0x8
.global lbl_80413C68
lbl_80413C68:
	.incbin "baserom.dol", 0x3C31E8, 0x8
.global lbl_80413C70
lbl_80413C70:
	.incbin "baserom.dol", 0x3C31F0, 0x8
.global lbl_80413C78
lbl_80413C78:
	.incbin "baserom.dol", 0x3C31F8, 0x28
.global lbl_80413CA0
lbl_80413CA0:
	.incbin "baserom.dol", 0x3C3220, 0x30
.global lbl_80413CD0
lbl_80413CD0:
	.incbin "baserom.dol", 0x3C3250, 0x28
.global lbl_80413CF8
lbl_80413CF8:
	.incbin "baserom.dol", 0x3C3278, 0x1C
.global lbl_80413D14
lbl_80413D14:
	.incbin "baserom.dol", 0x3C3294, 0x1C
.global lbl_80413D30
lbl_80413D30:
	.incbin "baserom.dol", 0x3C32B0, 0x28
.global lbl_80413D58
lbl_80413D58:
	.incbin "baserom.dol", 0x3C32D8, 0x14
.global lbl_80413D6C
lbl_80413D6C:
	.incbin "baserom.dol", 0x3C32EC, 0x1C
.global lbl_80413D88
lbl_80413D88:
	.incbin "baserom.dol", 0x3C3308, 0x24
.global lbl_80413DAC
lbl_80413DAC:
	.incbin "baserom.dol", 0x3C332C, 0x10
.global lbl_80413DBC
lbl_80413DBC:
	.incbin "baserom.dol", 0x3C333C, 0x14
.global lbl_80413DD0
lbl_80413DD0:
	.incbin "baserom.dol", 0x3C3350, 0x24
.global lbl_80413DF4
lbl_80413DF4:
	.incbin "baserom.dol", 0x3C3374, 0x8
.global lbl_80413DFC
lbl_80413DFC:
	.incbin "baserom.dol", 0x3C337C, 0xC
.global lbl_80413E08
lbl_80413E08:
	.incbin "baserom.dol", 0x3C3388, 0x8
.global lbl_80413E10
lbl_80413E10:
	.incbin "baserom.dol", 0x3C3390, 0x8
.global lbl_80413E18
lbl_80413E18:
	.incbin "baserom.dol", 0x3C3398, 0x4
.global lbl_80413E1C
lbl_80413E1C:
	.incbin "baserom.dol", 0x3C339C, 0x14
.global lbl_80413E30
lbl_80413E30:
	.incbin "baserom.dol", 0x3C33B0, 0x14
.global lbl_80413E44
lbl_80413E44:
	.incbin "baserom.dol", 0x3C33C4, 0x14
.global lbl_80413E58
lbl_80413E58:
	.incbin "baserom.dol", 0x3C33D8, 0x18
.global lbl_80413E70
lbl_80413E70:
	.incbin "baserom.dol", 0x3C33F0, 0x20
.global lbl_80413E90
lbl_80413E90:
	.incbin "baserom.dol", 0x3C3410, 0x20
.global lbl_80413EB0
lbl_80413EB0:
	.incbin "baserom.dol", 0x3C3430, 0x20
.global lbl_80413ED0
lbl_80413ED0:
	.incbin "baserom.dol", 0x3C3450, 0x28
.global lbl_80413EF8
lbl_80413EF8:
	.incbin "baserom.dol", 0x3C3478, 0x10
.global lbl_80413F08
lbl_80413F08:
	.incbin "baserom.dol", 0x3C3488, 0x10
.global lbl_80413F18
lbl_80413F18:
	.incbin "baserom.dol", 0x3C3498, 0x10
.global lbl_80413F28
lbl_80413F28:
	.incbin "baserom.dol", 0x3C34A8, 0x10
.global lbl_80413F38
lbl_80413F38:
	.incbin "baserom.dol", 0x3C34B8, 0x10
.global lbl_80413F48
lbl_80413F48:
	.incbin "baserom.dol", 0x3C34C8, 0x10
.global lbl_80413F58
lbl_80413F58:
	.incbin "baserom.dol", 0x3C34D8, 0x1C
.global lbl_80413F74
lbl_80413F74:
	.incbin "baserom.dol", 0x3C34F4, 0x14
.global lbl_80413F88
lbl_80413F88:
	.incbin "baserom.dol", 0x3C3508, 0x14
.global lbl_80413F9C
lbl_80413F9C:
	.incbin "baserom.dol", 0x3C351C, 0x10
.global lbl_80413FAC
lbl_80413FAC:
	.incbin "baserom.dol", 0x3C352C, 0x18
.global lbl_80413FC4
lbl_80413FC4:
	.incbin "baserom.dol", 0x3C3544, 0x14
.global lbl_80413FD8
lbl_80413FD8:
	.incbin "baserom.dol", 0x3C3558, 0x10
.global lbl_80413FE8
lbl_80413FE8:
	.incbin "baserom.dol", 0x3C3568, 0x10
.global lbl_80413FF8
lbl_80413FF8:
	.incbin "baserom.dol", 0x3C3578, 0x58
.global lbl_80414050
lbl_80414050:
	.incbin "baserom.dol", 0x3C35D0, 0x20
.global lbl_80414070
lbl_80414070:
	.incbin "baserom.dol", 0x3C35F0, 0xC
.global lbl_8041407C
lbl_8041407C:
	.incbin "baserom.dol", 0x3C35FC, 0xC
.global lbl_80414088
lbl_80414088:
	.incbin "baserom.dol", 0x3C3608, 0x8
.global lbl_80414090
lbl_80414090:
	.incbin "baserom.dol", 0x3C3610, 0x24
.global lbl_804140B4
lbl_804140B4:
	.incbin "baserom.dol", 0x3C3634, 0x24
.global lbl_804140D8
lbl_804140D8:
	.incbin "baserom.dol", 0x3C3658, 0x24
.global lbl_804140FC
lbl_804140FC:
	.incbin "baserom.dol", 0x3C367C, 0x24
.global lbl_80414120
lbl_80414120:
	.incbin "baserom.dol", 0x3C36A0, 0x28
.global lbl_80414148
lbl_80414148:
	.incbin "baserom.dol", 0x3C36C8, 0x4
.global lbl_8041414C
lbl_8041414C:
	.incbin "baserom.dol", 0x3C36CC, 0x14
.global lbl_80414160
lbl_80414160:
	.incbin "baserom.dol", 0x3C36E0, 0x28
.global lbl_80414188
lbl_80414188:
	.incbin "baserom.dol", 0x3C3708, 0x28
.global lbl_804141B0
lbl_804141B0:
	.incbin "baserom.dol", 0x3C3730, 0x20
.global lbl_804141D0
lbl_804141D0:
	.incbin "baserom.dol", 0x3C3750, 0x28
.global lbl_804141F8
lbl_804141F8:
	.incbin "baserom.dol", 0x3C3778, 0x468
.global lbl_80414660
lbl_80414660:
	.incbin "baserom.dol", 0x3C3BE0, 0x480
.global lbl_80414AE0
lbl_80414AE0:
	.incbin "baserom.dol", 0x3C4060, 0x2A0
.global lbl_80414D80
lbl_80414D80:
	.incbin "baserom.dol", 0x3C4300, 0x280
.global lbl_80415000
lbl_80415000:
	.incbin "baserom.dol", 0x3C4580, 0x460
.global lbl_80415460
lbl_80415460:
	.incbin "baserom.dol", 0x3C49E0, 0x460
.global lbl_804158C0
lbl_804158C0:
	.incbin "baserom.dol", 0x3C4E40, 0xD8
.global lbl_80415998
lbl_80415998:
	.incbin "baserom.dol", 0x3C4F18, 0x20
.global lbl_804159B8
lbl_804159B8:
	.incbin "baserom.dol", 0x3C4F38, 0xC
.global lbl_804159C4
lbl_804159C4:
	.incbin "baserom.dol", 0x3C4F44, 0x4
.global lbl_804159C8
lbl_804159C8:
	.incbin "baserom.dol", 0x3C4F48, 0x28
.global lbl_804159F0
lbl_804159F0:
	.incbin "baserom.dol", 0x3C4F70, 0x10
.global lbl_80415A00
lbl_80415A00:
	.incbin "baserom.dol", 0x3C4F80, 0x2C
.global lbl_80415A2C
lbl_80415A2C:
	.incbin "baserom.dol", 0x3C4FAC, 0x2C
.global lbl_80415A58
lbl_80415A58:
	.incbin "baserom.dol", 0x3C4FD8, 0x28
.global lbl_80415A80
lbl_80415A80:
	.incbin "baserom.dol", 0x3C5000, 0x10
.global lbl_80415A90
lbl_80415A90:
	.incbin "baserom.dol", 0x3C5010, 0x10
.global lbl_80415AA0
lbl_80415AA0:
	.incbin "baserom.dol", 0x3C5020, 0x10
.global lbl_80415AB0
lbl_80415AB0:
	.incbin "baserom.dol", 0x3C5030, 0x10
.global lbl_80415AC0
lbl_80415AC0:
	.incbin "baserom.dol", 0x3C5040, 0x24
.global lbl_80415AE4
lbl_80415AE4:
	.incbin "baserom.dol", 0x3C5064, 0x20
.global lbl_80415B04
lbl_80415B04:
	.incbin "baserom.dol", 0x3C5084, 0x4C
.global lbl_80415B50
lbl_80415B50:
	.incbin "baserom.dol", 0x3C50D0, 0x24
.global lbl_80415B74
lbl_80415B74:
	.incbin "baserom.dol", 0x3C50F4, 0x14
.global lbl_80415B88
lbl_80415B88:
	.incbin "baserom.dol", 0x3C5108, 0x60
.global lbl_80415BE8
lbl_80415BE8:
	.incbin "baserom.dol", 0x3C5168, 0x10
.global lbl_80415BF8
lbl_80415BF8:
	.incbin "baserom.dol", 0x3C5178, 0x8
.global lbl_80415C00
lbl_80415C00:
	.incbin "baserom.dol", 0x3C5180, 0x14
.global lbl_80415C14
lbl_80415C14:
	.incbin "baserom.dol", 0x3C5194, 0x14
.global lbl_80415C28
lbl_80415C28:
	.incbin "baserom.dol", 0x3C51A8, 0x18
.global lbl_80415C40
lbl_80415C40:
	.incbin "baserom.dol", 0x3C51C0, 0x20
.global lbl_80415C60
lbl_80415C60:
	.incbin "baserom.dol", 0x3C51E0, 0x20
.global lbl_80415C80
lbl_80415C80:
	.incbin "baserom.dol", 0x3C5200, 0x20
.global lbl_80415CA0
lbl_80415CA0:
	.incbin "baserom.dol", 0x3C5220, 0x20
.global lbl_80415CC0
lbl_80415CC0:
	.incbin "baserom.dol", 0x3C5240, 0x20
.global lbl_80415CE0
lbl_80415CE0:
	.incbin "baserom.dol", 0x3C5260, 0x20
.global lbl_80415D00
lbl_80415D00:
	.incbin "baserom.dol", 0x3C5280, 0x20
.global lbl_80415D20
lbl_80415D20:
	.incbin "baserom.dol", 0x3C52A0, 0x30
.global lbl_80415D50
lbl_80415D50:
	.incbin "baserom.dol", 0x3C52D0, 0x14
.global lbl_80415D64
lbl_80415D64:
	.incbin "baserom.dol", 0x3C52E4, 0x54
.global lbl_80415DB8
lbl_80415DB8:
	.incbin "baserom.dol", 0x3C5338, 0x8
.global lbl_80415DC0
lbl_80415DC0:
	.incbin "baserom.dol", 0x3C5340, 0x20
.global lbl_80415DE0
lbl_80415DE0:
	.incbin "baserom.dol", 0x3C5360, 0xC0
.global lbl_80415EA0
lbl_80415EA0:
	.incbin "baserom.dol", 0x3C5420, 0x28
.global lbl_80415EC8
lbl_80415EC8:
	.incbin "baserom.dol", 0x3C5448, 0xB8
.global lbl_80415F80
lbl_80415F80:
	.incbin "baserom.dol", 0x3C5500, 0x28
.global lbl_80415FA8
lbl_80415FA8:
	.incbin "baserom.dol", 0x3C5528, 0x18
.global lbl_80415FC0
lbl_80415FC0:
	.incbin "baserom.dol", 0x3C5540, 0x4
.global lbl_80415FC4
lbl_80415FC4:
	.incbin "baserom.dol", 0x3C5544, 0x14
.global lbl_80415FD8
lbl_80415FD8:
	.incbin "baserom.dol", 0x3C5558, 0x28
.global lbl_80416000
lbl_80416000:
	.incbin "baserom.dol", 0x3C5580, 0x20
.global lbl_80416020
lbl_80416020:
	.incbin "baserom.dol", 0x3C55A0, 0xC
.global lbl_8041602C
lbl_8041602C:
	.incbin "baserom.dol", 0x3C55AC, 0x20
.global lbl_8041604C
lbl_8041604C:
	.incbin "baserom.dol", 0x3C55CC, 0x8
.global lbl_80416054
lbl_80416054:
	.incbin "baserom.dol", 0x3C55D4, 0x2C
.global lbl_80416080
lbl_80416080:
	.incbin "baserom.dol", 0x3C5600, 0x10
.global lbl_80416090
lbl_80416090:
	.incbin "baserom.dol", 0x3C5610, 0xC
.global lbl_8041609C
lbl_8041609C:
	.incbin "baserom.dol", 0x3C561C, 0x24
.global lbl_804160C0
lbl_804160C0:
	.incbin "baserom.dol", 0x3C5640, 0xC
.global lbl_804160CC
lbl_804160CC:
	.incbin "baserom.dol", 0x3C564C, 0x34
.global lbl_80416100
lbl_80416100:
	.incbin "baserom.dol", 0x3C5680, 0x20
.global lbl_80416120
lbl_80416120:
	.incbin "baserom.dol", 0x3C56A0, 0xC0
.global lbl_804161E0
lbl_804161E0:
	.incbin "baserom.dol", 0x3C5760, 0x14
.global lbl_804161F4
lbl_804161F4:
	.incbin "baserom.dol", 0x3C5774, 0xC
.global lbl_80416200
lbl_80416200:
	.incbin "baserom.dol", 0x3C5780, 0x30
.global lbl_80416230
lbl_80416230:
	.incbin "baserom.dol", 0x3C57B0, 0xC
.global lbl_8041623C
lbl_8041623C:
	.incbin "baserom.dol", 0x3C57BC, 0x24
.global lbl_80416260
lbl_80416260:
	.incbin "baserom.dol", 0x3C57E0, 0x20
.global lbl_80416280
lbl_80416280:
	.incbin "baserom.dol", 0x3C5800, 0x60
.global lbl_804162E0
lbl_804162E0:
	.incbin "baserom.dol", 0x3C5860, 0xC
.global lbl_804162EC
lbl_804162EC:
	.incbin "baserom.dol", 0x3C586C, 0x74
.global lbl_80416360
lbl_80416360:
	.incbin "baserom.dol", 0x3C58E0, 0x10
.global lbl_80416370
lbl_80416370:
	.incbin "baserom.dol", 0x3C58F0, 0x10
.global lbl_80416380
lbl_80416380:
	.incbin "baserom.dol", 0x3C5900, 0x20
.global lbl_804163A0
lbl_804163A0:
	.incbin "baserom.dol", 0x3C5920, 0x8
.global lbl_804163A8
lbl_804163A8:
	.incbin "baserom.dol", 0x3C5928, 0x8
.global lbl_804163B0
lbl_804163B0:
	.incbin "baserom.dol", 0x3C5930, 0x4
.global lbl_804163B4
lbl_804163B4:
	.incbin "baserom.dol", 0x3C5934, 0x8
.global lbl_804163BC
lbl_804163BC:
	.incbin "baserom.dol", 0x3C593C, 0x4
.global lbl_804163C0
lbl_804163C0:
	.incbin "baserom.dol", 0x3C5940, 0x10
.global lbl_804163D0
lbl_804163D0:
	.incbin "baserom.dol", 0x3C5950, 0x10
.global lbl_804163E0
lbl_804163E0:
	.incbin "baserom.dol", 0x3C5960, 0x1C
.global lbl_804163FC
lbl_804163FC:
	.incbin "baserom.dol", 0x3C597C, 0xE64
.global lbl_80417260
lbl_80417260:
	.incbin "baserom.dol", 0x3C67E0, 0x6A0
.global lbl_80417900
lbl_80417900:
	.incbin "baserom.dol", 0x3C6E80, 0x20
.global lbl_80417920
lbl_80417920:
	.incbin "baserom.dol", 0x3C6EA0, 0x4
.global lbl_80417924
lbl_80417924:
	.incbin "baserom.dol", 0x3C6EA4, 0x10
.global lbl_80417934
lbl_80417934:
	.incbin "baserom.dol", 0x3C6EB4, 0x10
.global lbl_80417944
lbl_80417944:
	.incbin "baserom.dol", 0x3C6EC4, 0x1C
.global lbl_80417960
lbl_80417960:
	.incbin "baserom.dol", 0x3C6EE0, 0xC
.global lbl_8041796C
lbl_8041796C:
	.incbin "baserom.dol", 0x3C6EEC, 0xC
.global lbl_80417978
lbl_80417978:
	.incbin "baserom.dol", 0x3C6EF8, 0xC
.global lbl_80417984
lbl_80417984:
	.incbin "baserom.dol", 0x3C6F04, 0xC
.global lbl_80417990
lbl_80417990:
	.incbin "baserom.dol", 0x3C6F10, 0x10
.global lbl_804179A0
lbl_804179A0:
	.incbin "baserom.dol", 0x3C6F20, 0x10
.global lbl_804179B0
lbl_804179B0:
	.incbin "baserom.dol", 0x3C6F30, 0x1C
.global lbl_804179CC
lbl_804179CC:
	.incbin "baserom.dol", 0x3C6F4C, 0x34
.global lbl_80417A00
lbl_80417A00:
	.incbin "baserom.dol", 0x3C6F80, 0x20
.global lbl_80417A20
lbl_80417A20:
	.incbin "baserom.dol", 0x3C6FA0, 0x180
.global lbl_80417BA0
lbl_80417BA0:
	.incbin "baserom.dol", 0x3C7120, 0x10
.global lbl_80417BB0
lbl_80417BB0:
	.incbin "baserom.dol", 0x3C7130, 0x10
.global lbl_80417BC0
lbl_80417BC0:
	.incbin "baserom.dol", 0x3C7140, 0x60
.global lbl_80417C20
lbl_80417C20:
	.incbin "baserom.dol", 0x3C71A0, 0x20
.global lbl_80417C40
lbl_80417C40:
	.incbin "baserom.dol", 0x3C71C0, 0x20
.global lbl_80417C60
lbl_80417C60:
	.incbin "baserom.dol", 0x3C71E0, 0x10
.global lbl_80417C70
lbl_80417C70:
	.incbin "baserom.dol", 0x3C71F0, 0x10
.global lbl_80417C80
lbl_80417C80:
	.incbin "baserom.dol", 0x3C7200, 0x8
.global lbl_80417C88
lbl_80417C88:
	.incbin "baserom.dol", 0x3C7208, 0x20
.global lbl_80417CA8
lbl_80417CA8:
	.incbin "baserom.dol", 0x3C7228, 0x20
.global lbl_80417CC8
lbl_80417CC8:
	.incbin "baserom.dol", 0x3C7248, 0x20
.global lbl_80417CE8
lbl_80417CE8:
	.incbin "baserom.dol", 0x3C7268, 0x50
.global lbl_80417D38
lbl_80417D38:
	.incbin "baserom.dol", 0x3C72B8, 0x8
.global lbl_80417D40
lbl_80417D40:
	.incbin "baserom.dol", 0x3C72C0, 0x4
.global lbl_80417D44
lbl_80417D44:
	.incbin "baserom.dol", 0x3C72C4, 0x24
.global lbl_80417D68
lbl_80417D68:
	.incbin "baserom.dol", 0x3C72E8, 0x18
.global lbl_80417D80
lbl_80417D80:
	.incbin "baserom.dol", 0x3C7300, 0x18
.global lbl_80417D98
lbl_80417D98:
	.incbin "baserom.dol", 0x3C7318, 0x20
.global lbl_80417DB8
lbl_80417DB8:
	.incbin "baserom.dol", 0x3C7338, 0xB4
.global lbl_80417E6C
lbl_80417E6C:
	.incbin "baserom.dol", 0x3C73EC, 0x34
.global lbl_80417EA0
lbl_80417EA0:
	.incbin "baserom.dol", 0x3C7420, 0x20
.global lbl_80417EC0
lbl_80417EC0:
	.incbin "baserom.dol", 0x3C7440, 0x20
.global lbl_80417EE0
lbl_80417EE0:
	.incbin "baserom.dol", 0x3C7460, 0x2A0
.global lbl_80418180
lbl_80418180:
	.incbin "baserom.dol", 0x3C7700, 0x18
.global lbl_80418198
lbl_80418198:
	.incbin "baserom.dol", 0x3C7718, 0x8
.global lbl_804181A0
lbl_804181A0:
	.incbin "baserom.dol", 0x3C7720, 0x8
.global lbl_804181A8
lbl_804181A8:
	.incbin "baserom.dol", 0x3C7728, 0x4
.global lbl_804181AC
lbl_804181AC:
	.incbin "baserom.dol", 0x3C772C, 0x4
.global lbl_804181B0
lbl_804181B0:
	.incbin "baserom.dol", 0x3C7730, 0x8
.global lbl_804181B8
lbl_804181B8:
	.incbin "baserom.dol", 0x3C7738, 0x8
.global lbl_804181C0
lbl_804181C0:
	.incbin "baserom.dol", 0x3C7740, 0x8
.global lbl_804181C8
lbl_804181C8:
	.incbin "baserom.dol", 0x3C7748, 0x8
.global lbl_804181D0
lbl_804181D0:
	.incbin "baserom.dol", 0x3C7750, 0x8
.global lbl_804181D8
lbl_804181D8:
	.incbin "baserom.dol", 0x3C7758, 0x8
.global lbl_804181E0
lbl_804181E0:
	.incbin "baserom.dol", 0x3C7760, 0x8
.global lbl_804181E8
lbl_804181E8:
	.incbin "baserom.dol", 0x3C7768, 0x8
.global lbl_804181F0
lbl_804181F0:
	.incbin "baserom.dol", 0x3C7770, 0x8
.global lbl_804181F8
lbl_804181F8:
	.incbin "baserom.dol", 0x3C7778, 0x4
.global lbl_804181FC
lbl_804181FC:
	.incbin "baserom.dol", 0x3C777C, 0x8
.global lbl_80418204
lbl_80418204:
	.incbin "baserom.dol", 0x3C7784, 0x4
.global lbl_80418208
lbl_80418208:
	.incbin "baserom.dol", 0x3C7788, 0x8
.global lbl_80418210
lbl_80418210:
	.incbin "baserom.dol", 0x3C7790, 0x8
.global lbl_80418218
lbl_80418218:
	.incbin "baserom.dol", 0x3C7798, 0x4
.global lbl_8041821C
lbl_8041821C:
	.incbin "baserom.dol", 0x3C779C, 0x4
.global lbl_80418220
lbl_80418220:
	.incbin "baserom.dol", 0x3C77A0, 0x8
.global lbl_80418228
lbl_80418228:
	.incbin "baserom.dol", 0x3C77A8, 0x8
.global lbl_80418230
lbl_80418230:
	.incbin "baserom.dol", 0x3C77B0, 0x8
.global lbl_80418238
lbl_80418238:
	.incbin "baserom.dol", 0x3C77B8, 0x8
.global lbl_80418240
lbl_80418240:
	.incbin "baserom.dol", 0x3C77C0, 0x8
.global lbl_80418248
lbl_80418248:
	.incbin "baserom.dol", 0x3C77C8, 0x8
.global lbl_80418250
lbl_80418250:
	.incbin "baserom.dol", 0x3C77D0, 0x4
.global lbl_80418254
lbl_80418254:
	.incbin "baserom.dol", 0x3C77D4, 0x4
.global lbl_80418258
lbl_80418258:
	.incbin "baserom.dol", 0x3C77D8, 0x4
.global lbl_8041825C
lbl_8041825C:
	.incbin "baserom.dol", 0x3C77DC, 0x8
.global lbl_80418264
lbl_80418264:
	.incbin "baserom.dol", 0x3C77E4, 0x4
.global lbl_80418268
lbl_80418268:
	.incbin "baserom.dol", 0x3C77E8, 0x4
.global lbl_8041826C
lbl_8041826C:
	.incbin "baserom.dol", 0x3C77EC, 0x4
.global lbl_80418270
lbl_80418270:
	.incbin "baserom.dol", 0x3C77F0, 0x8
.global lbl_80418278
lbl_80418278:
	.incbin "baserom.dol", 0x3C77F8, 0x4
.global lbl_8041827C
lbl_8041827C:
	.incbin "baserom.dol", 0x3C77FC, 0xC
.global lbl_80418288
lbl_80418288:
	.incbin "baserom.dol", 0x3C7808, 0x8
.global lbl_80418290
lbl_80418290:
	.incbin "baserom.dol", 0x3C7810, 0x4
.global lbl_80418294
lbl_80418294:
	.incbin "baserom.dol", 0x3C7814, 0x4
.global lbl_80418298
lbl_80418298:
	.incbin "baserom.dol", 0x3C7818, 0x4
.global lbl_8041829C
lbl_8041829C:
	.incbin "baserom.dol", 0x3C781C, 0x4
.global lbl_804182A0
lbl_804182A0:
	.incbin "baserom.dol", 0x3C7820, 0x4
.global lbl_804182A4
lbl_804182A4:
	.incbin "baserom.dol", 0x3C7824, 0x4
.global lbl_804182A8
lbl_804182A8:
	.incbin "baserom.dol", 0x3C7828, 0x4
.global lbl_804182AC
lbl_804182AC:
	.incbin "baserom.dol", 0x3C782C, 0x4
.global lbl_804182B0
lbl_804182B0:
	.incbin "baserom.dol", 0x3C7830, 0x8
.global lbl_804182B8
lbl_804182B8:
	.incbin "baserom.dol", 0x3C7838, 0x8
.global lbl_804182C0
lbl_804182C0:
	.incbin "baserom.dol", 0x3C7840, 0x8
.global lbl_804182C8
lbl_804182C8:
	.incbin "baserom.dol", 0x3C7848, 0x8
.global lbl_804182D0
lbl_804182D0:
	.incbin "baserom.dol", 0x3C7850, 0x8
.global lbl_804182D8
lbl_804182D8:
	.incbin "baserom.dol", 0x3C7858, 0x8
.global lbl_804182E0
lbl_804182E0:
	.incbin "baserom.dol", 0x3C7860, 0x2
.global lbl_804182E2
lbl_804182E2:
	.incbin "baserom.dol", 0x3C7862, 0x6
.global lbl_804182E8
lbl_804182E8:
	.incbin "baserom.dol", 0x3C7868, 0x8
.global lbl_804182F0
lbl_804182F0:
	.incbin "baserom.dol", 0x3C7870, 0x4
.global lbl_804182F4
lbl_804182F4:
	.incbin "baserom.dol", 0x3C7874, 0x4
.global lbl_804182F8
lbl_804182F8:
	.incbin "baserom.dol", 0x3C7878, 0x8
.global lbl_80418300
lbl_80418300:
	.incbin "baserom.dol", 0x3C7880, 0x8
.global lbl_80418308
lbl_80418308:
	.incbin "baserom.dol", 0x3C7888, 0x8
.global lbl_80418310
lbl_80418310:
	.incbin "baserom.dol", 0x3C7890, 0x8
.global lbl_80418318
lbl_80418318:
	.incbin "baserom.dol", 0x3C7898, 0x8
.global lbl_80418320
lbl_80418320:
	.incbin "baserom.dol", 0x3C78A0, 0x8
.global lbl_80418328
lbl_80418328:
	.incbin "baserom.dol", 0x3C78A8, 0x8
.global lbl_80418330
lbl_80418330:
	.incbin "baserom.dol", 0x3C78B0, 0x8
.global lbl_80418338
lbl_80418338:
	.incbin "baserom.dol", 0x3C78B8, 0x8
.global lbl_80418340
lbl_80418340:
	.incbin "baserom.dol", 0x3C78C0, 0x8
.global lbl_80418348
lbl_80418348:
	.incbin "baserom.dol", 0x3C78C8, 0x8
.global lbl_80418350
lbl_80418350:
	.incbin "baserom.dol", 0x3C78D0, 0x10
