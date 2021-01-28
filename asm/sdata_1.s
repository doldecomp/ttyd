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
