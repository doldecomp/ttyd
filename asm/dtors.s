.include "macros.inc"


.section .dtors, "wa"  # 0x802C0F00 - 0x802C0F20
.global lbl_802C0F00
lbl_802C0F00:
    .4byte func_8025E868

    .balign 0x20, 0
