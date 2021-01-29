.include "macros.inc"


.section .dtors, "wa"  # 0x802C0F00 - 0x802C0F20
.global lbl_802C0F00
lbl_802C0F00:
    .4byte __destroy_global_chain2

    .balign 0x20, 0
