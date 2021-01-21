.include "macros.inc"


.section .dtors, "wa"  # 0x802C0F00 - 0x802C0F20
.global lbl_802C0F00
lbl_802C0F00:
	.incbin "baserom.dol", 0x2BDF00, 0x20
