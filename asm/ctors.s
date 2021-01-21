.include "macros.inc"


.section .ctors, "wa"  # 0x802C0EE0 - 0x802C0F00
.global lbl_802C0EE0
lbl_802C0EE0:
	.incbin "baserom.dol", 0x2BDEE0, 0x20
