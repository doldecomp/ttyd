.include "macros.inc"


.section .rodata, "wa"  # 0x802C0F20 - 0x80302C20

	.incbin "baserom.dol", 0x2BDF20, 0x18
.global lbl_802C0F38
lbl_802C0F38:
	.incbin "baserom.dol", 0x2BDF38, 0x80
.global lbl_802C0FB8
lbl_802C0FB8:
	.incbin "baserom.dol", 0x2BDFB8, 0x40
.global lbl_802C0FF8
lbl_802C0FF8:
	.incbin "baserom.dol", 0x2BDFF8, 0x8
.global lbl_802C1000
lbl_802C1000:
	.incbin "baserom.dol", 0x2BE000, 0x28
.global lbl_802C1028
lbl_802C1028:
	.incbin "baserom.dol", 0x2BE028, 0x58
.global lbl_802C1080
lbl_802C1080:
	.incbin "baserom.dol", 0x2BE080, 0x120
.global lbl_802C11A0
lbl_802C11A0:
	.incbin "baserom.dol", 0x2BE1A0, 0xC
.global lbl_802C11AC
lbl_802C11AC:
	.incbin "baserom.dol", 0x2BE1AC, 0xA4
.global lbl_802C1250
lbl_802C1250:
	.incbin "baserom.dol", 0x2BE250, 0x8
.global lbl_802C1258
lbl_802C1258:
	.incbin "baserom.dol", 0x2BE258, 0x68
.global lbl_802C12C0
lbl_802C12C0:
	.incbin "baserom.dol", 0x2BE2C0, 0x8
.global lbl_802C12C8
lbl_802C12C8:
	.incbin "baserom.dol", 0x2BE2C8, 0x8
.global lbl_802C12D0
lbl_802C12D0:
	.incbin "baserom.dol", 0x2BE2D0, 0x24
.global lbl_802C12F4
lbl_802C12F4:
	.incbin "baserom.dol", 0x2BE2F4, 0x24
.global lbl_802C1318
lbl_802C1318:
	.incbin "baserom.dol", 0x2BE318, 0x50
.global lbl_802C1368
lbl_802C1368:
	.incbin "baserom.dol", 0x2BE368, 0x30
.global lbl_802C1398
lbl_802C1398:
	.incbin "baserom.dol", 0x2BE398, 0x30
.global lbl_802C13C8
lbl_802C13C8:
	.incbin "baserom.dol", 0x2BE3C8, 0x8
.global lbl_802C13D0
lbl_802C13D0:
	.incbin "baserom.dol", 0x2BE3D0, 0x28
.global lbl_802C13F8
lbl_802C13F8:
	.incbin "baserom.dol", 0x2BE3F8, 0x10
.global lbl_802C1408
lbl_802C1408:
	.incbin "baserom.dol", 0x2BE408, 0x118
.global lbl_802C1520
lbl_802C1520:
	.incbin "baserom.dol", 0x2BE520, 0xC
.global lbl_802C152C
lbl_802C152C:
	.incbin "baserom.dol", 0x2BE52C, 0xC
.global lbl_802C1538
lbl_802C1538:
	.incbin "baserom.dol", 0x2BE538, 0xC
.global lbl_802C1544
lbl_802C1544:
	.incbin "baserom.dol", 0x2BE544, 0xC
.global lbl_802C1550
lbl_802C1550:
	.incbin "baserom.dol", 0x2BE550, 0xC
.global lbl_802C155C
lbl_802C155C:
	.incbin "baserom.dol", 0x2BE55C, 0xC
.global lbl_802C1568
lbl_802C1568:
	.incbin "baserom.dol", 0x2BE568, 0xC
.global lbl_802C1574
lbl_802C1574:
	.incbin "baserom.dol", 0x2BE574, 0xC
.global lbl_802C1580
lbl_802C1580:
	.incbin "baserom.dol", 0x2BE580, 0x10
.global lbl_802C1590
lbl_802C1590:
	.incbin "baserom.dol", 0x2BE590, 0x8
.global lbl_802C1598
lbl_802C1598:
	.incbin "baserom.dol", 0x2BE598, 0xC
.global lbl_802C15A4
lbl_802C15A4:
	.incbin "baserom.dol", 0x2BE5A4, 0xC
.global lbl_802C15B0
lbl_802C15B0:
	.incbin "baserom.dol", 0x2BE5B0, 0xC
.global lbl_802C15BC
lbl_802C15BC:
	.incbin "baserom.dol", 0x2BE5BC, 0xC
.global lbl_802C15C8
lbl_802C15C8:
	.incbin "baserom.dol", 0x2BE5C8, 0x8
.global lbl_802C15D0
lbl_802C15D0:
	.incbin "baserom.dol", 0x2BE5D0, 0x8
.global lbl_802C15D8
lbl_802C15D8:
	.incbin "baserom.dol", 0x2BE5D8, 0xC
.global lbl_802C15E4
lbl_802C15E4:
	.incbin "baserom.dol", 0x2BE5E4, 0xC
.global lbl_802C15F0
lbl_802C15F0:
	.incbin "baserom.dol", 0x2BE5F0, 0x90
.global lbl_802C1680
lbl_802C1680:
	.incbin "baserom.dol", 0x2BE680, 0x30
.global lbl_802C16B0
lbl_802C16B0:
	.incbin "baserom.dol", 0x2BE6B0, 0x28
.global lbl_802C16D8
lbl_802C16D8:
	.incbin "baserom.dol", 0x2BE6D8, 0x18
.global lbl_802C16F0
lbl_802C16F0:
	.incbin "baserom.dol", 0x2BE6F0, 0x70
.global lbl_802C1760
lbl_802C1760:
	.incbin "baserom.dol", 0x2BE760, 0x10
.global lbl_802C1770
lbl_802C1770:
	.incbin "baserom.dol", 0x2BE770, 0x68
.global lbl_802C17D8
lbl_802C17D8:
	.incbin "baserom.dol", 0x2BE7D8, 0x50
.global lbl_802C1828
lbl_802C1828:
	.incbin "baserom.dol", 0x2BE828, 0xC
.global lbl_802C1834
lbl_802C1834:
	.incbin "baserom.dol", 0x2BE834, 0xCC
.global lbl_802C1900
lbl_802C1900:
	.incbin "baserom.dol", 0x2BE900, 0x98
.global lbl_802C1998
lbl_802C1998:
	.incbin "baserom.dol", 0x2BE998, 0xB8
.global lbl_802C1A50
lbl_802C1A50:
	.incbin "baserom.dol", 0x2BEA50, 0xC
.global lbl_802C1A5C
lbl_802C1A5C:
	.incbin "baserom.dol", 0x2BEA5C, 0x34
.global lbl_802C1A90
lbl_802C1A90:
	.incbin "baserom.dol", 0x2BEA90, 0x3C
.global lbl_802C1ACC
lbl_802C1ACC:
	.incbin "baserom.dol", 0x2BEACC, 0x18
.global lbl_802C1AE4
lbl_802C1AE4:
	.incbin "baserom.dol", 0x2BEAE4, 0xFC
.global lbl_802C1BE0
lbl_802C1BE0:
	.incbin "baserom.dol", 0x2BEBE0, 0x8
.global lbl_802C1BE8
lbl_802C1BE8:
	.incbin "baserom.dol", 0x2BEBE8, 0xC
.global lbl_802C1BF4
lbl_802C1BF4:
	.incbin "baserom.dol", 0x2BEBF4, 0x24
.global lbl_802C1C18
lbl_802C1C18:
	.incbin "baserom.dol", 0x2BEC18, 0xE0
.global lbl_802C1CF8
lbl_802C1CF8:
	.incbin "baserom.dol", 0x2BECF8, 0x38
.global lbl_802C1D30
lbl_802C1D30:
	.incbin "baserom.dol", 0x2BED30, 0x190
