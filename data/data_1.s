.include "macros.inc"


.section .data, "wa"  # 0x80302C20 - 0x803C17E0

.global lbl_80302C20
lbl_80302C20:
	.incbin "baserom.dol", 0x2FFC20, 0x16C
.global lbl_80302D8C
lbl_80302D8C:
	.incbin "baserom.dol", 0x2FFD8C, 0x3C
.global lbl_80302DC8
lbl_80302DC8:
	.incbin "baserom.dol", 0x2FFDC8, 0x20
.global lbl_80302DE8
lbl_80302DE8:
	.incbin "baserom.dol", 0x2FFDE8, 0x58
