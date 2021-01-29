.include "macros.inc"


.section .data, "wa"  # 0x80302C20 - 0x803C17E0

.global lbl_80302EA0
lbl_80302EA0:
	.incbin "baserom.dol", 0x2FFEA0, 0x40
.global lbl_80302EE0
lbl_80302EE0:
	.incbin "baserom.dol", 0x2FFEE0, 0x80
.global lbl_80302F60
lbl_80302F60:
	.incbin "baserom.dol", 0x2FFF60, 0x3C
.global lbl_80302F9C
lbl_80302F9C:
	.incbin "baserom.dol", 0x2FFF9C, 0xA4
.global lbl_80303040
lbl_80303040:
	.incbin "baserom.dol", 0x300040, 0x24
.global lbl_80303064
lbl_80303064:
	.incbin "baserom.dol", 0x300064, 0x2C
.global lbl_80303090
lbl_80303090:
	.incbin "baserom.dol", 0x300090, 0x1C
.global lbl_803030AC
lbl_803030AC:
	.incbin "baserom.dol", 0x3000AC, 0x20
.global lbl_803030CC
lbl_803030CC:
	.incbin "baserom.dol", 0x3000CC, 0x104
.global lbl_803031D0
lbl_803031D0:
	.incbin "baserom.dol", 0x3001D0, 0xAC
.global lbl_8030327C
lbl_8030327C:
	.incbin "baserom.dol", 0x30027C, 0x24
.global lbl_803032A0
lbl_803032A0:
	.incbin "baserom.dol", 0x3002A0, 0x40
.global lbl_803032E0
lbl_803032E0:
	.incbin "baserom.dol", 0x3002E0, 0x100
.global lbl_803033E0
lbl_803033E0:
	.incbin "baserom.dol", 0x3003E0, 0x34
.global lbl_80303414
lbl_80303414:
	.incbin "baserom.dol", 0x300414, 0x4C
.global lbl_80303460
lbl_80303460:
	.incbin "baserom.dol", 0x300460, 0x40
.global lbl_803034A0
lbl_803034A0:
	.incbin "baserom.dol", 0x3004A0, 0xA0
.global lbl_80303540
lbl_80303540:
	.incbin "baserom.dol", 0x300540, 0x1A0
.global lbl_803036E0
lbl_803036E0:
	.incbin "baserom.dol", 0x3006E0, 0x310
.global lbl_803039F0
lbl_803039F0:
	.incbin "baserom.dol", 0x3009F0, 0x20
.global lbl_80303A10
lbl_80303A10:
	.incbin "baserom.dol", 0x300A10, 0x1E0
.global lbl_80303BF0
lbl_80303BF0:
	.incbin "baserom.dol", 0x300BF0, 0xCC
.global lbl_80303CBC
lbl_80303CBC:
	.incbin "baserom.dol", 0x300CBC, 0x568
.global lbl_80304224
lbl_80304224:
	.incbin "baserom.dol", 0x301224, 0xD1C
.global lbl_80304F40
lbl_80304F40:
	.incbin "baserom.dol", 0x301F40, 0x178
.global lbl_803050B8
lbl_803050B8:
	.incbin "baserom.dol", 0x3020B8, 0x20
.global lbl_803050D8
lbl_803050D8:
	.incbin "baserom.dol", 0x3020D8, 0x40
.global lbl_80305118
lbl_80305118:
	.incbin "baserom.dol", 0x302118, 0x20
.global lbl_80305138
lbl_80305138:
	.incbin "baserom.dol", 0x302138, 0x288
.global lbl_803053C0
lbl_803053C0:
	.incbin "baserom.dol", 0x3023C0, 0x80
.global lbl_80305440
lbl_80305440:
	.incbin "baserom.dol", 0x302440, 0x24
.global lbl_80305464
lbl_80305464:
	.incbin "baserom.dol", 0x302464, 0x2C6C
.global lbl_803080D0
lbl_803080D0:
	.incbin "baserom.dol", 0x3050D0, 0x60
.global lbl_80308130
lbl_80308130:
	.incbin "baserom.dol", 0x305130, 0x290
.global lbl_803083C0
lbl_803083C0:
	.incbin "baserom.dol", 0x3053C0, 0x1928
.global lbl_80309CE8
lbl_80309CE8:
	.incbin "baserom.dol", 0x306CE8, 0x40
.global lbl_80309D28
lbl_80309D28:
	.incbin "baserom.dol", 0x306D28, 0x14C
.global lbl_80309E74
lbl_80309E74:
	.incbin "baserom.dol", 0x306E74, 0x918
.global lbl_8030A78C
lbl_8030A78C:
	.incbin "baserom.dol", 0x30778C, 0x38
.global lbl_8030A7C4
lbl_8030A7C4:
	.incbin "baserom.dol", 0x3077C4, 0x38
.global lbl_8030A7FC
lbl_8030A7FC:
	.incbin "baserom.dol", 0x3077FC, 0x38
.global lbl_8030A834
lbl_8030A834:
	.incbin "baserom.dol", 0x307834, 0x5C
.global lbl_8030A890
lbl_8030A890:
	.incbin "baserom.dol", 0x307890, 0x19C
.global lbl_8030AA2C
lbl_8030AA2C:
	.incbin "baserom.dol", 0x307A2C, 0x13C
.global lbl_8030AB68
lbl_8030AB68:
	.incbin "baserom.dol", 0x307B68, 0x50
.global lbl_8030ABB8
lbl_8030ABB8:
	.incbin "baserom.dol", 0x307BB8, 0x3C
.global lbl_8030ABF4
lbl_8030ABF4:
	.incbin "baserom.dol", 0x307BF4, 0x3C
.global lbl_8030AC30
lbl_8030AC30:
	.incbin "baserom.dol", 0x307C30, 0x3C
.global lbl_8030AC6C
lbl_8030AC6C:
	.incbin "baserom.dol", 0x307C6C, 0x3C
.global lbl_8030ACA8
lbl_8030ACA8:
	.incbin "baserom.dol", 0x307CA8, 0x38
.global lbl_8030ACE0
lbl_8030ACE0:
	.incbin "baserom.dol", 0x307CE0, 0x80
.global lbl_8030AD60
lbl_8030AD60:
	.incbin "baserom.dol", 0x307D60, 0x294
.global lbl_8030AFF4
lbl_8030AFF4:
	.incbin "baserom.dol", 0x307FF4, 0x338
.global lbl_8030B32C
lbl_8030B32C:
	.incbin "baserom.dol", 0x30832C, 0x1C
.global lbl_8030B348
lbl_8030B348:
	.incbin "baserom.dol", 0x308348, 0x26E0
.global lbl_8030DA28
lbl_8030DA28:
	.incbin "baserom.dol", 0x30AA28, 0x28
.global lbl_8030DA50
lbl_8030DA50:
	.incbin "baserom.dol", 0x30AA50, 0x30
.global lbl_8030DA80
lbl_8030DA80:
	.incbin "baserom.dol", 0x30AA80, 0x90
.global lbl_8030DB10
lbl_8030DB10:
	.incbin "baserom.dol", 0x30AB10, 0x60
.global lbl_8030DB70
lbl_8030DB70:
	.incbin "baserom.dol", 0x30AB70, 0x30
.global lbl_8030DBA0
lbl_8030DBA0:
	.incbin "baserom.dol", 0x30ABA0, 0x30
.global lbl_8030DBD0
lbl_8030DBD0:
	.incbin "baserom.dol", 0x30ABD0, 0x30
.global lbl_8030DC00
lbl_8030DC00:
	.incbin "baserom.dol", 0x30AC00, 0x38
.global lbl_8030DC38
lbl_8030DC38:
	.incbin "baserom.dol", 0x30AC38, 0x958
.global lbl_8030E590
lbl_8030E590:
	.incbin "baserom.dol", 0x30B590, 0x30
.global lbl_8030E5C0
lbl_8030E5C0:
	.incbin "baserom.dol", 0x30B5C0, 0x20
.global lbl_8030E5E0
lbl_8030E5E0:
	.incbin "baserom.dol", 0x30B5E0, 0x1EC
.global lbl_8030E7CC
lbl_8030E7CC:
	.incbin "baserom.dol", 0x30B7CC, 0x34
.global lbl_8030E800
lbl_8030E800:
	.incbin "baserom.dol", 0x30B800, 0x60
.global lbl_8030E860
lbl_8030E860:
	.incbin "baserom.dol", 0x30B860, 0x68
.global lbl_8030E8C8
lbl_8030E8C8:
	.incbin "baserom.dol", 0x30B8C8, 0x34
.global lbl_8030E8FC
lbl_8030E8FC:
	.incbin "baserom.dol", 0x30B8FC, 0x84
.global lbl_8030E980
lbl_8030E980:
	.incbin "baserom.dol", 0x30B980, 0x58
.global lbl_8030E9D8
lbl_8030E9D8:
	.incbin "baserom.dol", 0x30B9D8, 0xA4
.global lbl_8030EA7C
lbl_8030EA7C:
	.incbin "baserom.dol", 0x30BA7C, 0x90
.global lbl_8030EB0C
lbl_8030EB0C:
	.incbin "baserom.dol", 0x30BB0C, 0xCC
.global lbl_8030EBD8
lbl_8030EBD8:
	.incbin "baserom.dol", 0x30BBD8, 0x90
.global lbl_8030EC68
lbl_8030EC68:
	.incbin "baserom.dol", 0x30BC68, 0x90
.global lbl_8030ECF8
lbl_8030ECF8:
	.incbin "baserom.dol", 0x30BCF8, 0xD8
.global lbl_8030EDD0
lbl_8030EDD0:
	.incbin "baserom.dol", 0x30BDD0, 0x5C
.global lbl_8030EE2C
lbl_8030EE2C:
	.incbin "baserom.dol", 0x30BE2C, 0x2C
.global lbl_8030EE58
lbl_8030EE58:
	.incbin "baserom.dol", 0x30BE58, 0x3520
.global lbl_80312378
lbl_80312378:
	.incbin "baserom.dol", 0x30F378, 0xA0
.global lbl_80312418
lbl_80312418:
	.incbin "baserom.dol", 0x30F418, 0x28
.global lbl_80312440
lbl_80312440:
	.incbin "baserom.dol", 0x30F440, 0x48
.global lbl_80312488
lbl_80312488:
	.incbin "baserom.dol", 0x30F488, 0x30
.global lbl_803124B8
lbl_803124B8:
	.incbin "baserom.dol", 0x30F4B8, 0x38
.global lbl_803124F0
lbl_803124F0:
	.incbin "baserom.dol", 0x30F4F0, 0x3C
.global lbl_8031252C
lbl_8031252C:
	.incbin "baserom.dol", 0x30F52C, 0x3C
.global lbl_80312568
lbl_80312568:
	.incbin "baserom.dol", 0x30F568, 0x24
.global lbl_8031258C
lbl_8031258C:
	.incbin "baserom.dol", 0x30F58C, 0x40
.global lbl_803125CC
lbl_803125CC:
	.incbin "baserom.dol", 0x30F5CC, 0x24
.global lbl_803125F0
lbl_803125F0:
	.incbin "baserom.dol", 0x30F5F0, 0xD0
.global lbl_803126C0
lbl_803126C0:
	.incbin "baserom.dol", 0x30F6C0, 0x60
.global lbl_80312720
lbl_80312720:
	.incbin "baserom.dol", 0x30F720, 0x54
.global lbl_80312774
lbl_80312774:
	.incbin "baserom.dol", 0x30F774, 0x7C
.global lbl_803127F0
lbl_803127F0:
	.incbin "baserom.dol", 0x30F7F0, 0x40
.global lbl_80312830
lbl_80312830:
	.incbin "baserom.dol", 0x30F830, 0xB4
.global lbl_803128E4
lbl_803128E4:
	.incbin "baserom.dol", 0x30F8E4, 0x80
.global lbl_80312964
lbl_80312964:
	.incbin "baserom.dol", 0x30F964, 0x34
.global lbl_80312998
lbl_80312998:
	.incbin "baserom.dol", 0x30F998, 0x320
.global lbl_80312CB8
lbl_80312CB8:
	.incbin "baserom.dol", 0x30FCB8, 0x4B0
.global lbl_80313168
lbl_80313168:
	.incbin "baserom.dol", 0x310168, 0x1E0
.global lbl_80313348
lbl_80313348:
	.incbin "baserom.dol", 0x310348, 0x1A8
.global lbl_803134F0
lbl_803134F0:
	.incbin "baserom.dol", 0x3104F0, 0x4C
.global lbl_8031353C
lbl_8031353C:
	.incbin "baserom.dol", 0x31053C, 0x5C
.global lbl_80313598
lbl_80313598:
	.incbin "baserom.dol", 0x310598, 0x68
.global lbl_80313600
lbl_80313600:
	.incbin "baserom.dol", 0x310600, 0x20
.global lbl_80313620
lbl_80313620:
	.incbin "baserom.dol", 0x310620, 0x20
.global lbl_80313640
lbl_80313640:
	.incbin "baserom.dol", 0x310640, 0x20
.global lbl_80313660
lbl_80313660:
	.incbin "baserom.dol", 0x310660, 0x40
.global lbl_803136A0
lbl_803136A0:
	.incbin "baserom.dol", 0x3106A0, 0x8C
.global lbl_8031372C
lbl_8031372C:
	.incbin "baserom.dol", 0x31072C, 0x40
.global lbl_8031376C
lbl_8031376C:
	.incbin "baserom.dol", 0x31076C, 0x58
.global lbl_803137C4
lbl_803137C4:
	.incbin "baserom.dol", 0x3107C4, 0x5C
.global lbl_80313820
lbl_80313820:
	.incbin "baserom.dol", 0x310820, 0x40
.global lbl_80313860
lbl_80313860:
	.incbin "baserom.dol", 0x310860, 0x708
.global lbl_80313F68
lbl_80313F68:
	.incbin "baserom.dol", 0x310F68, 0x1060
.global lbl_80314FC8
lbl_80314FC8:
	.incbin "baserom.dol", 0x311FC8, 0x14B68
.global lbl_80329B30
lbl_80329B30:
	.incbin "baserom.dol", 0x326B30, 0x238C
.global lbl_8032BEBC
lbl_8032BEBC:
	.incbin "baserom.dol", 0x328EBC, 0x1D8
.global lbl_8032C094
lbl_8032C094:
	.incbin "baserom.dol", 0x329094, 0x16C
.global lbl_8032C200
lbl_8032C200:
	.incbin "baserom.dol", 0x329200, 0xF0
.global lbl_8032C2F0
lbl_8032C2F0:
	.incbin "baserom.dol", 0x3292F0, 0x20
.global lbl_8032C310
lbl_8032C310:
	.incbin "baserom.dol", 0x329310, 0x1C
.global lbl_8032C32C
lbl_8032C32C:
	.incbin "baserom.dol", 0x32932C, 0x1C
.global lbl_8032C348
lbl_8032C348:
	.incbin "baserom.dol", 0x329348, 0x2C
.global lbl_8032C374
lbl_8032C374:
	.incbin "baserom.dol", 0x329374, 0x37CC
.global lbl_8032FB40
lbl_8032FB40:
	.incbin "baserom.dol", 0x32CB40, 0x30
.global lbl_8032FB70
lbl_8032FB70:
	.incbin "baserom.dol", 0x32CB70, 0x6BA0
.global lbl_80336710
lbl_80336710:
	.incbin "baserom.dol", 0x333710, 0x3E10
.global lbl_8033A520
lbl_8033A520:
	.incbin "baserom.dol", 0x337520, 0x78
.global lbl_8033A598
lbl_8033A598:
	.incbin "baserom.dol", 0x337598, 0x78
.global lbl_8033A610
lbl_8033A610:
	.incbin "baserom.dol", 0x337610, 0x58
.global lbl_8033A668
lbl_8033A668:
	.incbin "baserom.dol", 0x337668, 0x78
.global lbl_8033A6E0
lbl_8033A6E0:
	.incbin "baserom.dol", 0x3376E0, 0x518
.global lbl_8033ABF8
lbl_8033ABF8:
	.incbin "baserom.dol", 0x337BF8, 0xEC0
.global lbl_8033BAB8
lbl_8033BAB8:
	.incbin "baserom.dol", 0x338AB8, 0xE330
.global lbl_80349DE8
lbl_80349DE8:
	.incbin "baserom.dol", 0x346DE8, 0x40
.global lbl_80349E28
lbl_80349E28:
	.incbin "baserom.dol", 0x346E28, 0x230
.global lbl_8034A058
lbl_8034A058:
	.incbin "baserom.dol", 0x347058, 0x68
.global lbl_8034A0C0
lbl_8034A0C0:
	.incbin "baserom.dol", 0x3470C0, 0x20
.global lbl_8034A0E0
lbl_8034A0E0:
	.incbin "baserom.dol", 0x3470E0, 0x20
.global lbl_8034A100
lbl_8034A100:
	.incbin "baserom.dol", 0x347100, 0x20
.global lbl_8034A120
lbl_8034A120:
	.incbin "baserom.dol", 0x347120, 0x30
.global lbl_8034A150
lbl_8034A150:
	.incbin "baserom.dol", 0x347150, 0x30
.global lbl_8034A180
lbl_8034A180:
	.incbin "baserom.dol", 0x347180, 0x44
.global lbl_8034A1C4
lbl_8034A1C4:
	.incbin "baserom.dol", 0x3471C4, 0x64
.global lbl_8034A228
lbl_8034A228:
	.incbin "baserom.dol", 0x347228, 0x70
.global lbl_8034A298
lbl_8034A298:
	.incbin "baserom.dol", 0x347298, 0x4C
.global lbl_8034A2E4
lbl_8034A2E4:
	.incbin "baserom.dol", 0x3472E4, 0x70
.global lbl_8034A354
lbl_8034A354:
	.incbin "baserom.dol", 0x347354, 0x70
.global lbl_8034A3C4
lbl_8034A3C4:
	.incbin "baserom.dol", 0x3473C4, 0x64
.global lbl_8034A428
lbl_8034A428:
	.incbin "baserom.dol", 0x347428, 0x70
.global lbl_8034A498
lbl_8034A498:
	.incbin "baserom.dol", 0x347498, 0x70
.global lbl_8034A508
lbl_8034A508:
	.incbin "baserom.dol", 0x347508, 0x70
.global lbl_8034A578
lbl_8034A578:
	.incbin "baserom.dol", 0x347578, 0x11D4
.global lbl_8034B74C
lbl_8034B74C:
	.incbin "baserom.dol", 0x34874C, 0x2B8
.global lbl_8034BA04
lbl_8034BA04:
	.incbin "baserom.dol", 0x348A04, 0x350
.global lbl_8034BD54
lbl_8034BD54:
	.incbin "baserom.dol", 0x348D54, 0x388
.global lbl_8034C0DC
lbl_8034C0DC:
	.incbin "baserom.dol", 0x3490DC, 0xA90
.global lbl_8034CB6C
lbl_8034CB6C:
	.incbin "baserom.dol", 0x349B6C, 0x2510
.global lbl_8034F07C
lbl_8034F07C:
	.incbin "baserom.dol", 0x34C07C, 0x2E8
.global lbl_8034F364
lbl_8034F364:
	.incbin "baserom.dol", 0x34C364, 0xD4
.global lbl_8034F438
lbl_8034F438:
	.incbin "baserom.dol", 0x34C438, 0x17A0
.global lbl_80350BD8
lbl_80350BD8:
	.incbin "baserom.dol", 0x34DBD8, 0x454
.global lbl_8035102C
lbl_8035102C:
	.incbin "baserom.dol", 0x34E02C, 0x1A4
.global lbl_803511D0
lbl_803511D0:
	.incbin "baserom.dol", 0x34E1D0, 0xC0
.global lbl_80351290
lbl_80351290:
	.incbin "baserom.dol", 0x34E290, 0x180
.global lbl_80351410
lbl_80351410:
	.incbin "baserom.dol", 0x34E410, 0x180
.global lbl_80351590
lbl_80351590:
	.incbin "baserom.dol", 0x34E590, 0xC0
.global lbl_80351650
lbl_80351650:
	.incbin "baserom.dol", 0x34E650, 0xC0
.global lbl_80351710
lbl_80351710:
	.incbin "baserom.dol", 0x34E710, 0xC0
.global lbl_803517D0
lbl_803517D0:
	.incbin "baserom.dol", 0x34E7D0, 0x180
.global lbl_80351950
lbl_80351950:
	.incbin "baserom.dol", 0x34E950, 0x1080
.global lbl_803529D0
lbl_803529D0:
	.incbin "baserom.dol", 0x34F9D0, 0xC0
.global lbl_80352A90
lbl_80352A90:
	.incbin "baserom.dol", 0x34FA90, 0xC0
.global lbl_80352B50
lbl_80352B50:
	.incbin "baserom.dol", 0x34FB50, 0xC0
.global lbl_80352C10
lbl_80352C10:
	.incbin "baserom.dol", 0x34FC10, 0xC0
.global lbl_80352CD0
lbl_80352CD0:
	.incbin "baserom.dol", 0x34FCD0, 0xC0
.global lbl_80352D90
lbl_80352D90:
	.incbin "baserom.dol", 0x34FD90, 0x840
.global lbl_803535D0
lbl_803535D0:
	.incbin "baserom.dol", 0x3505D0, 0xD628
.global lbl_80360BF8
lbl_80360BF8:
	.incbin "baserom.dol", 0x35DBF8, 0x74
.global lbl_80360C6C
lbl_80360C6C:
	.incbin "baserom.dol", 0x35DC6C, 0x6C
.global lbl_80360CD8
lbl_80360CD8:
	.incbin "baserom.dol", 0x35DCD8, 0x3C
.global lbl_80360D14
lbl_80360D14:
	.incbin "baserom.dol", 0x35DD14, 0x30
.global lbl_80360D44
lbl_80360D44:
	.incbin "baserom.dol", 0x35DD44, 0xA4
.global lbl_80360DE8
lbl_80360DE8:
	.incbin "baserom.dol", 0x35DDE8, 0xA8
.global lbl_80360E90
lbl_80360E90:
	.incbin "baserom.dol", 0x35DE90, 0x150
.global lbl_80360FE0
lbl_80360FE0:
	.incbin "baserom.dol", 0x35DFE0, 0x370
.global lbl_80361350
lbl_80361350:
	.incbin "baserom.dol", 0x35E350, 0x3C
.global lbl_8036138C
lbl_8036138C:
	.incbin "baserom.dol", 0x35E38C, 0x3C
.global lbl_803613C8
lbl_803613C8:
	.incbin "baserom.dol", 0x35E3C8, 0x138
.global lbl_80361500
lbl_80361500:
	.incbin "baserom.dol", 0x35E500, 0x3C
.global lbl_8036153C
lbl_8036153C:
	.incbin "baserom.dol", 0x35E53C, 0x24
.global lbl_80361560
lbl_80361560:
	.incbin "baserom.dol", 0x35E560, 0xC0
.global lbl_80361620
lbl_80361620:
	.incbin "baserom.dol", 0x35E620, 0x80
.global lbl_803616A0
lbl_803616A0:
	.incbin "baserom.dol", 0x35E6A0, 0x24
.global lbl_803616C4
lbl_803616C4:
	.incbin "baserom.dol", 0x35E6C4, 0x1C
.global lbl_803616E0
lbl_803616E0:
	.incbin "baserom.dol", 0x35E6E0, 0x24
.global lbl_80361704
lbl_80361704:
	.incbin "baserom.dol", 0x35E704, 0x38
.global lbl_8036173C
lbl_8036173C:
	.incbin "baserom.dol", 0x35E73C, 0x38
.global lbl_80361774
lbl_80361774:
	.incbin "baserom.dol", 0x35E774, 0x78
.global lbl_803617EC
lbl_803617EC:
	.incbin "baserom.dol", 0x35E7EC, 0x1C
.global lbl_80361808
lbl_80361808:
	.incbin "baserom.dol", 0x35E808, 0x40
.global lbl_80361848
lbl_80361848:
	.incbin "baserom.dol", 0x35E848, 0x38
.global lbl_80361880
lbl_80361880:
	.incbin "baserom.dol", 0x35E880, 0x84
.global lbl_80361904
lbl_80361904:
	.incbin "baserom.dol", 0x35E904, 0x64
.global lbl_80361968
lbl_80361968:
	.incbin "baserom.dol", 0x35E968, 0x70
.global lbl_803619D8
lbl_803619D8:
	.incbin "baserom.dol", 0x35E9D8, 0x70
.global lbl_80361A48
lbl_80361A48:
	.incbin "baserom.dol", 0x35EA48, 0x5F8
.global lbl_80362040
lbl_80362040:
	.incbin "baserom.dol", 0x35F040, 0xB48
.global lbl_80362B88
lbl_80362B88:
	.incbin "baserom.dol", 0x35FB88, 0x5574
.global lbl_803680FC
lbl_803680FC:
	.incbin "baserom.dol", 0x3650FC, 0xC0
.global lbl_803681BC
lbl_803681BC:
	.incbin "baserom.dol", 0x3651BC, 0x23FC
.global lbl_8036A5B8
lbl_8036A5B8:
	.incbin "baserom.dol", 0x3675B8, 0x1818
.global lbl_8036BDD0
lbl_8036BDD0:
	.incbin "baserom.dol", 0x368DD0, 0xD0
.global lbl_8036BEA0
lbl_8036BEA0:
	.incbin "baserom.dol", 0x368EA0, 0x3E8
.global lbl_8036C288
lbl_8036C288:
	.incbin "baserom.dol", 0x369288, 0x3C
.global lbl_8036C2C4
lbl_8036C2C4:
	.incbin "baserom.dol", 0x3692C4, 0x3C
.global lbl_8036C300
lbl_8036C300:
	.incbin "baserom.dol", 0x369300, 0x48
.global lbl_8036C348
lbl_8036C348:
	.incbin "baserom.dol", 0x369348, 0x84
.global lbl_8036C3CC
lbl_8036C3CC:
	.incbin "baserom.dol", 0x3693CC, 0x84
.global lbl_8036C450
lbl_8036C450:
	.incbin "baserom.dol", 0x369450, 0x9C
.global lbl_8036C4EC
lbl_8036C4EC:
	.incbin "baserom.dol", 0x3694EC, 0x3830
.global lbl_8036FD1C
lbl_8036FD1C:
	.incbin "baserom.dol", 0x36CD1C, 0x24
.global lbl_8036FD40
lbl_8036FD40:
	.incbin "baserom.dol", 0x36CD40, 0x24
.global lbl_8036FD64
lbl_8036FD64:
	.incbin "baserom.dol", 0x36CD64, 0x1C
.global lbl_8036FD80
lbl_8036FD80:
	.incbin "baserom.dol", 0x36CD80, 0x28
.global lbl_8036FDA8
lbl_8036FDA8:
	.incbin "baserom.dol", 0x36CDA8, 0xB4
.global lbl_8036FE5C
lbl_8036FE5C:
	.incbin "baserom.dol", 0x36CE5C, 0xB4
.global lbl_8036FF10
lbl_8036FF10:
	.incbin "baserom.dol", 0x36CF10, 0x1448
.global lbl_80371358
lbl_80371358:
	.incbin "baserom.dol", 0x36E358, 0x3C
.global lbl_80371394
lbl_80371394:
	.incbin "baserom.dol", 0x36E394, 0x38
.global lbl_803713CC
lbl_803713CC:
	.incbin "baserom.dol", 0x36E3CC, 0xC4
.global lbl_80371490
lbl_80371490:
	.incbin "baserom.dol", 0x36E490, 0x40
.global lbl_803714D0
lbl_803714D0:
	.incbin "baserom.dol", 0x36E4D0, 0xC0
.global lbl_80371590
lbl_80371590:
	.incbin "baserom.dol", 0x36E590, 0x2E34
.global lbl_803743C4
lbl_803743C4:
	.incbin "baserom.dol", 0x3713C4, 0x450
.global lbl_80374814
lbl_80374814:
	.incbin "baserom.dol", 0x371814, 0x34
.global lbl_80374848
lbl_80374848:
	.incbin "baserom.dol", 0x371848, 0x28
.global lbl_80374870
lbl_80374870:
	.incbin "baserom.dol", 0x371870, 0xE8
.global lbl_80374958
lbl_80374958:
	.incbin "baserom.dol", 0x371958, 0x68
.global lbl_803749C0
lbl_803749C0:
	.incbin "baserom.dol", 0x3719C0, 0x34
.global lbl_803749F4
lbl_803749F4:
	.incbin "baserom.dol", 0x3719F4, 0x3C
.global lbl_80374A30
lbl_80374A30:
	.incbin "baserom.dol", 0x371A30, 0xFC
.global lbl_80374B2C
lbl_80374B2C:
	.incbin "baserom.dol", 0x371B2C, 0x1C
.global lbl_80374B48
lbl_80374B48:
	.incbin "baserom.dol", 0x371B48, 0x1C
.global lbl_80374B64
lbl_80374B64:
	.incbin "baserom.dol", 0x371B64, 0x1C
.global lbl_80374B80
lbl_80374B80:
	.incbin "baserom.dol", 0x371B80, 0x1C
.global lbl_80374B9C
lbl_80374B9C:
	.incbin "baserom.dol", 0x371B9C, 0x120
.global lbl_80374CBC
lbl_80374CBC:
	.incbin "baserom.dol", 0x371CBC, 0x54
.global lbl_80374D10
lbl_80374D10:
	.incbin "baserom.dol", 0x371D10, 0x1F8
.global lbl_80374F08
lbl_80374F08:
	.incbin "baserom.dol", 0x371F08, 0x30
.global lbl_80374F38
lbl_80374F38:
	.incbin "baserom.dol", 0x371F38, 0x45C
.global lbl_80375394
lbl_80375394:
	.incbin "baserom.dol", 0x372394, 0x38
.global lbl_803753CC
lbl_803753CC:
	.incbin "baserom.dol", 0x3723CC, 0xAC
.global lbl_80375478
lbl_80375478:
	.incbin "baserom.dol", 0x372478, 0x78
.global lbl_803754F0
lbl_803754F0:
	.incbin "baserom.dol", 0x3724F0, 0x4C
.global lbl_8037553C
lbl_8037553C:
	.incbin "baserom.dol", 0x37253C, 0x1C
.global lbl_80375558
lbl_80375558:
	.incbin "baserom.dol", 0x372558, 0x1C
.global lbl_80375574
lbl_80375574:
	.incbin "baserom.dol", 0x372574, 0x44
.global lbl_803755B8
lbl_803755B8:
	.incbin "baserom.dol", 0x3725B8, 0x418
.global lbl_803759D0
lbl_803759D0:
	.incbin "baserom.dol", 0x3729D0, 0x3C0
.global lbl_80375D90
lbl_80375D90:
	.incbin "baserom.dol", 0x372D90, 0x40C
.global lbl_8037619C
lbl_8037619C:
	.incbin "baserom.dol", 0x37319C, 0x184
.global lbl_80376320
lbl_80376320:
	.incbin "baserom.dol", 0x373320, 0x36E0
.global lbl_80379A00
lbl_80379A00:
	.incbin "baserom.dol", 0x376A00, 0x51F4
.global lbl_8037EBF4
lbl_8037EBF4:
	.incbin "baserom.dol", 0x37BBF4, 0x1C
.global lbl_8037EC10
lbl_8037EC10:
	.incbin "baserom.dol", 0x37BC10, 0x5CC8
.global lbl_803848D8
lbl_803848D8:
	.incbin "baserom.dol", 0x3818D8, 0x590
.global lbl_80384E68
lbl_80384E68:
	.incbin "baserom.dol", 0x381E68, 0x3A00
.global lbl_80388868
lbl_80388868:
	.incbin "baserom.dol", 0x385868, 0x31A0
.global lbl_8038BA08
lbl_8038BA08:
	.incbin "baserom.dol", 0x388A08, 0x20
.global lbl_8038BA28
lbl_8038BA28:
	.incbin "baserom.dol", 0x388A28, 0x30
.global lbl_8038BA58
lbl_8038BA58:
	.incbin "baserom.dol", 0x388A58, 0x58
.global lbl_8038BAB0
lbl_8038BAB0:
	.incbin "baserom.dol", 0x388AB0, 0x3C
.global lbl_8038BAEC
lbl_8038BAEC:
	.incbin "baserom.dol", 0x388AEC, 0x48
.global lbl_8038BB34
lbl_8038BB34:
	.incbin "baserom.dol", 0x388B34, 0x320
.global lbl_8038BE54
lbl_8038BE54:
	.incbin "baserom.dol", 0x388E54, 0x64
.global lbl_8038BEB8
lbl_8038BEB8:
	.incbin "baserom.dol", 0x388EB8, 0x40
.global lbl_8038BEF8
lbl_8038BEF8:
	.incbin "baserom.dol", 0x388EF8, 0x744
.global lbl_8038C63C
lbl_8038C63C:
	.incbin "baserom.dol", 0x38963C, 0x4534
.global lbl_80390B70
lbl_80390B70:
	.incbin "baserom.dol", 0x38DB70, 0x3B84
.global lbl_803946F4
lbl_803946F4:
	.incbin "baserom.dol", 0x3916F4, 0x1C
.global lbl_80394710
lbl_80394710:
	.incbin "baserom.dol", 0x391710, 0x2C
.global lbl_8039473C
lbl_8039473C:
	.incbin "baserom.dol", 0x39173C, 0x2C
.global lbl_80394768
lbl_80394768:
	.incbin "baserom.dol", 0x391768, 0x68
.global lbl_803947D0
lbl_803947D0:
	.incbin "baserom.dol", 0x3917D0, 0x60
.global lbl_80394830
lbl_80394830:
	.incbin "baserom.dol", 0x391830, 0x78
.global lbl_803948A8
lbl_803948A8:
	.incbin "baserom.dol", 0x3918A8, 0x110
.global lbl_803949B8
lbl_803949B8:
	.incbin "baserom.dol", 0x3919B8, 0xC0
.global lbl_80394A78
lbl_80394A78:
	.incbin "baserom.dol", 0x391A78, 0x20
.global lbl_80394A98
lbl_80394A98:
	.incbin "baserom.dol", 0x391A98, 0x158
.global lbl_80394BF0
lbl_80394BF0:
	.incbin "baserom.dol", 0x391BF0, 0x28
.global lbl_80394C18
lbl_80394C18:
	.incbin "baserom.dol", 0x391C18, 0x58
.global lbl_80394C70
lbl_80394C70:
	.incbin "baserom.dol", 0x391C70, 0x60
.global lbl_80394CD0
lbl_80394CD0:
	.incbin "baserom.dol", 0x391CD0, 0x2BF0
.global lbl_803978C0
lbl_803978C0:
	.incbin "baserom.dol", 0x3948C0, 0x400
.global lbl_80397CC0
lbl_80397CC0:
	.incbin "baserom.dol", 0x394CC0, 0x3F0
.global lbl_803980B0
lbl_803980B0:
	.incbin "baserom.dol", 0x3950B0, 0x6C
.global lbl_8039811C
lbl_8039811C:
	.incbin "baserom.dol", 0x39511C, 0x844
.global lbl_80398960
lbl_80398960:
	.incbin "baserom.dol", 0x395960, 0x390
.global lbl_80398CF0
lbl_80398CF0:
	.incbin "baserom.dol", 0x395CF0, 0xC50
.global lbl_80399940
lbl_80399940:
	.incbin "baserom.dol", 0x396940, 0x340
.global lbl_80399C80
lbl_80399C80:
	.incbin "baserom.dol", 0x396C80, 0xA0
.global lbl_80399D20
lbl_80399D20:
	.incbin "baserom.dol", 0x396D20, 0x20
.global lbl_80399D40
lbl_80399D40:
	.incbin "baserom.dol", 0x396D40, 0x54
.global lbl_80399D94
lbl_80399D94:
	.incbin "baserom.dol", 0x396D94, 0x20
.global lbl_80399DB4
lbl_80399DB4:
	.incbin "baserom.dol", 0x396DB4, 0x34
.global lbl_80399DE8
lbl_80399DE8:
	.incbin "baserom.dol", 0x396DE8, 0x34
.global lbl_80399E1C
lbl_80399E1C:
	.incbin "baserom.dol", 0x396E1C, 0x40
.global lbl_80399E5C
lbl_80399E5C:
	.incbin "baserom.dol", 0x396E5C, 0x40
.global lbl_80399E9C
lbl_80399E9C:
	.incbin "baserom.dol", 0x396E9C, 0x38
.global lbl_80399ED4
lbl_80399ED4:
	.incbin "baserom.dol", 0x396ED4, 0x38
.global lbl_80399F0C
lbl_80399F0C:
	.incbin "baserom.dol", 0x396F0C, 0x200
.global lbl_8039A10C
lbl_8039A10C:
	.incbin "baserom.dol", 0x39710C, 0x258
.global lbl_8039A364
lbl_8039A364:
	.incbin "baserom.dol", 0x397364, 0x8C
.global lbl_8039A3F0
lbl_8039A3F0:
	.incbin "baserom.dol", 0x3973F0, 0x48
.global lbl_8039A438
lbl_8039A438:
	.incbin "baserom.dol", 0x397438, 0x40
.global lbl_8039A478
lbl_8039A478:
	.incbin "baserom.dol", 0x397478, 0x16C
.global lbl_8039A5E4
lbl_8039A5E4:
	.incbin "baserom.dol", 0x3975E4, 0x24
.global lbl_8039A608
lbl_8039A608:
	.incbin "baserom.dol", 0x397608, 0x38
.global lbl_8039A640
lbl_8039A640:
	.incbin "baserom.dol", 0x397640, 0x60
.global lbl_8039A6A0
lbl_8039A6A0:
	.incbin "baserom.dol", 0x3976A0, 0x60
.global lbl_8039A700
lbl_8039A700:
	.incbin "baserom.dol", 0x397700, 0x38
.global lbl_8039A738
lbl_8039A738:
	.incbin "baserom.dol", 0x397738, 0x58
.global lbl_8039A790
lbl_8039A790:
	.incbin "baserom.dol", 0x397790, 0x70
.global lbl_8039A800
lbl_8039A800:
	.incbin "baserom.dol", 0x397800, 0x138
.global lbl_8039A938
lbl_8039A938:
	.incbin "baserom.dol", 0x397938, 0x38
.global lbl_8039A970
lbl_8039A970:
	.incbin "baserom.dol", 0x397970, 0x38
.global lbl_8039A9A8
lbl_8039A9A8:
	.incbin "baserom.dol", 0x3979A8, 0x38
.global lbl_8039A9E0
lbl_8039A9E0:
	.incbin "baserom.dol", 0x3979E0, 0x7E0
.global lbl_8039B1C0
lbl_8039B1C0:
	.incbin "baserom.dol", 0x3981C0, 0x28
.global lbl_8039B1E8
lbl_8039B1E8:
	.incbin "baserom.dol", 0x3981E8, 0x90
.global lbl_8039B278
lbl_8039B278:
	.incbin "baserom.dol", 0x398278, 0x50
.global lbl_8039B2C8
lbl_8039B2C8:
	.incbin "baserom.dol", 0x3982C8, 0x1C0
.global lbl_8039B488
lbl_8039B488:
	.incbin "baserom.dol", 0x398488, 0x20
.global lbl_8039B4A8
lbl_8039B4A8:
	.incbin "baserom.dol", 0x3984A8, 0x70
.global lbl_8039B518
lbl_8039B518:
	.incbin "baserom.dol", 0x398518, 0x9D8
.global lbl_8039BEF0
lbl_8039BEF0:
	.incbin "baserom.dol", 0x398EF0, 0x50
.global lbl_8039BF40
lbl_8039BF40:
	.incbin "baserom.dol", 0x398F40, 0x38
.global lbl_8039BF78
lbl_8039BF78:
	.incbin "baserom.dol", 0x398F78, 0x38
.global lbl_8039BFB0
lbl_8039BFB0:
	.incbin "baserom.dol", 0x398FB0, 0xE0
.global lbl_8039C090
lbl_8039C090:
	.incbin "baserom.dol", 0x399090, 0x20
.global lbl_8039C0B0
lbl_8039C0B0:
	.incbin "baserom.dol", 0x3990B0, 0x70
.global lbl_8039C120
lbl_8039C120:
	.incbin "baserom.dol", 0x399120, 0x70
.global lbl_8039C190
lbl_8039C190:
	.incbin "baserom.dol", 0x399190, 0x38
.global lbl_8039C1C8
lbl_8039C1C8:
	.incbin "baserom.dol", 0x3991C8, 0x38
.global lbl_8039C200
lbl_8039C200:
	.incbin "baserom.dol", 0x399200, 0x28
.global lbl_8039C228
lbl_8039C228:
	.incbin "baserom.dol", 0x399228, 0x20
.global lbl_8039C248
lbl_8039C248:
	.incbin "baserom.dol", 0x399248, 0x48
.global lbl_8039C290
lbl_8039C290:
	.incbin "baserom.dol", 0x399290, 0x38
.global lbl_8039C2C8
lbl_8039C2C8:
	.incbin "baserom.dol", 0x3992C8, 0x58
.global lbl_8039C320
lbl_8039C320:
	.incbin "baserom.dol", 0x399320, 0x20
.global lbl_8039C340
lbl_8039C340:
	.incbin "baserom.dol", 0x399340, 0x38
.global lbl_8039C378
lbl_8039C378:
	.incbin "baserom.dol", 0x399378, 0x70
.global lbl_8039C3E8
lbl_8039C3E8:
	.incbin "baserom.dol", 0x3993E8, 0x50
.global lbl_8039C438
lbl_8039C438:
	.incbin "baserom.dol", 0x399438, 0x1C0
.global lbl_8039C5F8
lbl_8039C5F8:
	.incbin "baserom.dol", 0x3995F8, 0x20
.global lbl_8039C618
lbl_8039C618:
	.incbin "baserom.dol", 0x399618, 0x348
.global lbl_8039C960
lbl_8039C960:
	.incbin "baserom.dol", 0x399960, 0x78
.global lbl_8039C9D8
lbl_8039C9D8:
	.incbin "baserom.dol", 0x3999D8, 0x38
.global lbl_8039CA10
lbl_8039CA10:
	.incbin "baserom.dol", 0x399A10, 0xE8
.global lbl_8039CAF8
lbl_8039CAF8:
	.incbin "baserom.dol", 0x399AF8, 0x2B0
.global lbl_8039CDA8
lbl_8039CDA8:
	.incbin "baserom.dol", 0x399DA8, 0x190
.global lbl_8039CF38
lbl_8039CF38:
	.incbin "baserom.dol", 0x399F38, 0xE0
.global lbl_8039D018
lbl_8039D018:
	.incbin "baserom.dol", 0x39A018, 0x40
.global lbl_8039D058
lbl_8039D058:
	.incbin "baserom.dol", 0x39A058, 0x348
.global lbl_8039D3A0
lbl_8039D3A0:
	.incbin "baserom.dol", 0x39A3A0, 0x28
.global lbl_8039D3C8
lbl_8039D3C8:
	.incbin "baserom.dol", 0x39A3C8, 0x38
.global lbl_8039D400
lbl_8039D400:
	.incbin "baserom.dol", 0x39A400, 0x48
.global lbl_8039D448
lbl_8039D448:
	.incbin "baserom.dol", 0x39A448, 0x38
.global lbl_8039D480
lbl_8039D480:
	.incbin "baserom.dol", 0x39A480, 0x38
.global lbl_8039D4B8
lbl_8039D4B8:
	.incbin "baserom.dol", 0x39A4B8, 0x118
.global lbl_8039D5D0
lbl_8039D5D0:
	.incbin "baserom.dol", 0x39A5D0, 0xE8
.global lbl_8039D6B8
lbl_8039D6B8:
	.incbin "baserom.dol", 0x39A6B8, 0x422C
.global lbl_803A18E4
lbl_803A18E4:
	.incbin "baserom.dol", 0x39E8E4, 0x2C
.global lbl_803A1910
lbl_803A1910:
	.incbin "baserom.dol", 0x39E910, 0x1C0
.global lbl_803A1AD0
lbl_803A1AD0:
	.incbin "baserom.dol", 0x39EAD0, 0x38
.global lbl_803A1B08
lbl_803A1B08:
	.incbin "baserom.dol", 0x39EB08, 0x38
.global lbl_803A1B40
lbl_803A1B40:
	.incbin "baserom.dol", 0x39EB40, 0x240
.global lbl_803A1D80
lbl_803A1D80:
	.incbin "baserom.dol", 0x39ED80, 0x38
.global lbl_803A1DB8
lbl_803A1DB8:
	.incbin "baserom.dol", 0x39EDB8, 0x38
.global lbl_803A1DF0
lbl_803A1DF0:
	.incbin "baserom.dol", 0x39EDF0, 0x38
.global lbl_803A1E28
lbl_803A1E28:
	.incbin "baserom.dol", 0x39EE28, 0x1F8
.global lbl_803A2020
lbl_803A2020:
	.incbin "baserom.dol", 0x39F020, 0x118
.global lbl_803A2138
lbl_803A2138:
	.incbin "baserom.dol", 0x39F138, 0x20
.global lbl_803A2158
lbl_803A2158:
	.incbin "baserom.dol", 0x39F158, 0x38
.global lbl_803A2190
lbl_803A2190:
	.incbin "baserom.dol", 0x39F190, 0xA8
.global lbl_803A2238
lbl_803A2238:
	.incbin "baserom.dol", 0x39F238, 0x48
.global lbl_803A2280
lbl_803A2280:
	.incbin "baserom.dol", 0x39F280, 0x780
.global lbl_803A2A00
lbl_803A2A00:
	.incbin "baserom.dol", 0x39FA00, 0x38
.global lbl_803A2A38
lbl_803A2A38:
	.incbin "baserom.dol", 0x39FA38, 0xE0
.global lbl_803A2B18
lbl_803A2B18:
	.incbin "baserom.dol", 0x39FB18, 0x16C
.global lbl_803A2C84
lbl_803A2C84:
	.incbin "baserom.dol", 0x39FC84, 0x16C
.global lbl_803A2DF0
lbl_803A2DF0:
	.incbin "baserom.dol", 0x39FDF0, 0x38
.global lbl_803A2E28
lbl_803A2E28:
	.incbin "baserom.dol", 0x39FE28, 0x38
.global lbl_803A2E60
lbl_803A2E60:
	.incbin "baserom.dol", 0x39FE60, 0x340
.global lbl_803A31A0
lbl_803A31A0:
	.incbin "baserom.dol", 0x3A01A0, 0x200
.global lbl_803A33A0
lbl_803A33A0:
	.incbin "baserom.dol", 0x3A03A0, 0x38
.global lbl_803A33D8
lbl_803A33D8:
	.incbin "baserom.dol", 0x3A03D8, 0x458
.global lbl_803A3830
lbl_803A3830:
	.incbin "baserom.dol", 0x3A0830, 0xE0
.global lbl_803A3910
lbl_803A3910:
	.incbin "baserom.dol", 0x3A0910, 0x1E0
.global lbl_803A3AF0
lbl_803A3AF0:
	.incbin "baserom.dol", 0x3A0AF0, 0x38
.global lbl_803A3B28
lbl_803A3B28:
	.incbin "baserom.dol", 0x3A0B28, 0x38
.global lbl_803A3B60
lbl_803A3B60:
	.incbin "baserom.dol", 0x3A0B60, 0x300
.global lbl_803A3E60
lbl_803A3E60:
	.incbin "baserom.dol", 0x3A0E60, 0x1C0
.global lbl_803A4020
lbl_803A4020:
	.incbin "baserom.dol", 0x3A1020, 0x20
.global lbl_803A4040
lbl_803A4040:
	.incbin "baserom.dol", 0x3A1040, 0xE0
.global lbl_803A4120
lbl_803A4120:
	.incbin "baserom.dol", 0x3A1120, 0x3C0
.global lbl_803A44E0
lbl_803A44E0:
	.incbin "baserom.dol", 0x3A14E0, 0x34
.global lbl_803A4514
lbl_803A4514:
	.incbin "baserom.dol", 0x3A1514, 0x34
.global lbl_803A4548
lbl_803A4548:
	.incbin "baserom.dol", 0x3A1548, 0x248
.global lbl_803A4790
lbl_803A4790:
	.incbin "baserom.dol", 0x3A1790, 0x40
.global lbl_803A47D0
lbl_803A47D0:
	.incbin "baserom.dol", 0x3A17D0, 0xE0
.global lbl_803A48B0
lbl_803A48B0:
	.incbin "baserom.dol", 0x3A18B0, 0x38
.global lbl_803A48E8
lbl_803A48E8:
	.incbin "baserom.dol", 0x3A18E8, 0x140
.global lbl_803A4A28
lbl_803A4A28:
	.incbin "baserom.dol", 0x3A1A28, 0x38
.global lbl_803A4A60
lbl_803A4A60:
	.incbin "baserom.dol", 0x3A1A60, 0x200
.global lbl_803A4C60
lbl_803A4C60:
	.incbin "baserom.dol", 0x3A1C60, 0x40
.global lbl_803A4CA0
lbl_803A4CA0:
	.incbin "baserom.dol", 0x3A1CA0, 0x78
.global lbl_803A4D18
lbl_803A4D18:
	.incbin "baserom.dol", 0x3A1D18, 0x350
.global lbl_803A5068
lbl_803A5068:
	.incbin "baserom.dol", 0x3A2068, 0x38
.global lbl_803A50A0
lbl_803A50A0:
	.incbin "baserom.dol", 0x3A20A0, 0x80
.global lbl_803A5120
lbl_803A5120:
	.incbin "baserom.dol", 0x3A2120, 0x38
.global lbl_803A5158
lbl_803A5158:
	.incbin "baserom.dol", 0x3A2158, 0x38
.global lbl_803A5190
lbl_803A5190:
	.incbin "baserom.dol", 0x3A2190, 0x330
.global lbl_803A54C0
lbl_803A54C0:
	.incbin "baserom.dol", 0x3A24C0, 0x540
.global lbl_803A5A00
lbl_803A5A00:
	.incbin "baserom.dol", 0x3A2A00, 0x38
.global lbl_803A5A38
lbl_803A5A38:
	.incbin "baserom.dol", 0x3A2A38, 0x1C0
.global lbl_803A5BF8
lbl_803A5BF8:
	.incbin "baserom.dol", 0x3A2BF8, 0x4C
.global lbl_803A5C44
lbl_803A5C44:
	.incbin "baserom.dol", 0x3A2C44, 0x4C
.global lbl_803A5C90
lbl_803A5C90:
	.incbin "baserom.dol", 0x3A2C90, 0x150
.global lbl_803A5DE0
lbl_803A5DE0:
	.incbin "baserom.dol", 0x3A2DE0, 0x38
.global lbl_803A5E18
lbl_803A5E18:
	.incbin "baserom.dol", 0x3A2E18, 0x230
.global lbl_803A6048
lbl_803A6048:
	.incbin "baserom.dol", 0x3A3048, 0x1C0
.global lbl_803A6208
lbl_803A6208:
	.incbin "baserom.dol", 0x3A3208, 0x20
.global lbl_803A6228
lbl_803A6228:
	.incbin "baserom.dol", 0x3A3228, 0x1C0
.global lbl_803A63E8
lbl_803A63E8:
	.incbin "baserom.dol", 0x3A33E8, 0x20
.global lbl_803A6408
lbl_803A6408:
	.incbin "baserom.dol", 0x3A3408, 0x38
.global lbl_803A6440
lbl_803A6440:
	.incbin "baserom.dol", 0x3A3440, 0x188
.global lbl_803A65C8
lbl_803A65C8:
	.incbin "baserom.dol", 0x3A35C8, 0x118
.global lbl_803A66E0
lbl_803A66E0:
	.incbin "baserom.dol", 0x3A36E0, 0x1E30
.global lbl_803A8510
lbl_803A8510:
	.incbin "baserom.dol", 0x3A5510, 0x70
.global lbl_803A8580
lbl_803A8580:
	.incbin "baserom.dol", 0x3A5580, 0x78
.global lbl_803A85F8
lbl_803A85F8:
	.incbin "baserom.dol", 0x3A55F8, 0x2C8
.global lbl_803A88C0
lbl_803A88C0:
	.incbin "baserom.dol", 0x3A58C0, 0x40
.global lbl_803A8900
lbl_803A8900:
	.incbin "baserom.dol", 0x3A5900, 0x180
.global lbl_803A8A80
lbl_803A8A80:
	.incbin "baserom.dol", 0x3A5A80, 0x20
.global lbl_803A8AA0
lbl_803A8AA0:
	.incbin "baserom.dol", 0x3A5AA0, 0x168
.global lbl_803A8C08
lbl_803A8C08:
	.incbin "baserom.dol", 0x3A5C08, 0x100
.global lbl_803A8D08
lbl_803A8D08:
	.incbin "baserom.dol", 0x3A5D08, 0x13C4
.global lbl_803AA0CC
lbl_803AA0CC:
	.incbin "baserom.dol", 0x3A70CC, 0x24
.global lbl_803AA0F0
lbl_803AA0F0:
	.incbin "baserom.dol", 0x3A70F0, 0x2C
.global lbl_803AA11C
lbl_803AA11C:
	.incbin "baserom.dol", 0x3A711C, 0x7C
.global lbl_803AA198
lbl_803AA198:
	.incbin "baserom.dol", 0x3A7198, 0x40
.global lbl_803AA1D8
lbl_803AA1D8:
	.incbin "baserom.dol", 0x3A71D8, 0x48
.global lbl_803AA220
lbl_803AA220:
	.incbin "baserom.dol", 0x3A7220, 0x40
.global lbl_803AA260
lbl_803AA260:
	.incbin "baserom.dol", 0x3A7260, 0x65C
.global lbl_803AA8BC
lbl_803AA8BC:
	.incbin "baserom.dol", 0x3A78BC, 0x20
.global lbl_803AA8DC
lbl_803AA8DC:
	.incbin "baserom.dol", 0x3A78DC, 0x20
.global lbl_803AA8FC
lbl_803AA8FC:
	.incbin "baserom.dol", 0x3A78FC, 0x20
.global lbl_803AA91C
lbl_803AA91C:
	.incbin "baserom.dol", 0x3A791C, 0x20
.global lbl_803AA93C
lbl_803AA93C:
	.incbin "baserom.dol", 0x3A793C, 0x20
.global lbl_803AA95C
lbl_803AA95C:
	.incbin "baserom.dol", 0x3A795C, 0x24
.global lbl_803AA980
lbl_803AA980:
	.incbin "baserom.dol", 0x3A7980, 0x70
.global lbl_803AA9F0
lbl_803AA9F0:
	.incbin "baserom.dol", 0x3A79F0, 0x3C
.global lbl_803AAA2C
lbl_803AAA2C:
	.incbin "baserom.dol", 0x3A7A2C, 0x64
.global lbl_803AAA90
lbl_803AAA90:
	.incbin "baserom.dol", 0x3A7A90, 0x38
.global lbl_803AAAC8
lbl_803AAAC8:
	.incbin "baserom.dol", 0x3A7AC8, 0x328
.global lbl_803AADF0
lbl_803AADF0:
	.incbin "baserom.dol", 0x3A7DF0, 0x158
.global lbl_803AAF48
lbl_803AAF48:
	.incbin "baserom.dol", 0x3A7F48, 0x1A8
.global lbl_803AB0F0
lbl_803AB0F0:
	.incbin "baserom.dol", 0x3A80F0, 0x28
.global lbl_803AB118
lbl_803AB118:
	.incbin "baserom.dol", 0x3A8118, 0x77C
.global lbl_803AB894
lbl_803AB894:
	.incbin "baserom.dol", 0x3A8894, 0x38
.global lbl_803AB8CC
lbl_803AB8CC:
	.incbin "baserom.dol", 0x3A88CC, 0x24
.global lbl_803AB8F0
lbl_803AB8F0:
	.incbin "baserom.dol", 0x3A88F0, 0x1F8
.global lbl_803ABAE8
lbl_803ABAE8:
	.incbin "baserom.dol", 0x3A8AE8, 0x1F8
.global lbl_803ABCE0
lbl_803ABCE0:
	.incbin "baserom.dol", 0x3A8CE0, 0x1E4
.global lbl_803ABEC4
lbl_803ABEC4:
	.incbin "baserom.dol", 0x3A8EC4, 0x1C
.global lbl_803ABEE0
lbl_803ABEE0:
	.incbin "baserom.dol", 0x3A8EE0, 0x34
.global lbl_803ABF14
lbl_803ABF14:
	.incbin "baserom.dol", 0x3A8F14, 0x40
.global lbl_803ABF54
lbl_803ABF54:
	.incbin "baserom.dol", 0x3A8F54, 0x58
.global lbl_803ABFAC
lbl_803ABFAC:
	.incbin "baserom.dol", 0x3A8FAC, 0x5C
.global lbl_803AC008
lbl_803AC008:
	.incbin "baserom.dol", 0x3A9008, 0x78
.global lbl_803AC080
lbl_803AC080:
	.incbin "baserom.dol", 0x3A9080, 0xA38
.global lbl_803ACAB8
lbl_803ACAB8:
	.incbin "baserom.dol", 0x3A9AB8, 0x58
.global lbl_803ACB10
lbl_803ACB10:
	.incbin "baserom.dol", 0x3A9B10, 0x40
.global lbl_803ACB50
lbl_803ACB50:
	.incbin "baserom.dol", 0x3A9B50, 0xE0C
.global lbl_803AD95C
lbl_803AD95C:
	.incbin "baserom.dol", 0x3AA95C, 0x38
.global lbl_803AD994
lbl_803AD994:
	.incbin "baserom.dol", 0x3AA994, 0x84
.global lbl_803ADA18
lbl_803ADA18:
	.incbin "baserom.dol", 0x3AAA18, 0x22C
.global lbl_803ADC44
lbl_803ADC44:
	.incbin "baserom.dol", 0x3AAC44, 0x84
.global lbl_803ADCC8
lbl_803ADCC8:
	.incbin "baserom.dol", 0x3AACC8, 0x58
.global lbl_803ADD20
lbl_803ADD20:
	.incbin "baserom.dol", 0x3AAD20, 0x2E0
.global lbl_803AE000
lbl_803AE000:
	.incbin "baserom.dol", 0x3AB000, 0x24
.global lbl_803AE024
lbl_803AE024:
	.incbin "baserom.dol", 0x3AB024, 0x28
.global lbl_803AE04C
lbl_803AE04C:
	.incbin "baserom.dol", 0x3AB04C, 0x24
.global lbl_803AE070
lbl_803AE070:
	.incbin "baserom.dol", 0x3AB070, 0x28
.global lbl_803AE098
lbl_803AE098:
	.incbin "baserom.dol", 0x3AB098, 0x60
.global lbl_803AE0F8
lbl_803AE0F8:
	.incbin "baserom.dol", 0x3AB0F8, 0x54
.global lbl_803AE14C
lbl_803AE14C:
	.incbin "baserom.dol", 0x3AB14C, 0x54
.global lbl_803AE1A0
lbl_803AE1A0:
	.incbin "baserom.dol", 0x3AB1A0, 0x54
.global lbl_803AE1F4
lbl_803AE1F4:
	.incbin "baserom.dol", 0x3AB1F4, 0x6C
.global lbl_803AE260
lbl_803AE260:
	.incbin "baserom.dol", 0x3AB260, 0x1C40
.global lbl_803AFEA0
lbl_803AFEA0:
	.incbin "baserom.dol", 0x3ACEA0, 0x20
.global lbl_803AFEC0
lbl_803AFEC0:
	.incbin "baserom.dol", 0x3ACEC0, 0xE0
.global lbl_803AFFA0
lbl_803AFFA0:
	.incbin "baserom.dol", 0x3ACFA0, 0x80
.global lbl_803B0020
lbl_803B0020:
	.incbin "baserom.dol", 0x3AD020, 0x48
.global lbl_803B0068
lbl_803B0068:
	.incbin "baserom.dol", 0x3AD068, 0x40
.global lbl_803B00A8
lbl_803B00A8:
	.incbin "baserom.dol", 0x3AD0A8, 0x90
.global lbl_803B0138
lbl_803B0138:
	.incbin "baserom.dol", 0x3AD138, 0x48
.global lbl_803B0180
lbl_803B0180:
	.incbin "baserom.dol", 0x3AD180, 0x80
.global lbl_803B0200
lbl_803B0200:
	.incbin "baserom.dol", 0x3AD200, 0x440
.global lbl_803B0640
lbl_803B0640:
	.incbin "baserom.dol", 0x3AD640, 0x108
.global lbl_803B0748
lbl_803B0748:
	.incbin "baserom.dol", 0x3AD748, 0x6C
.global lbl_803B07B4
lbl_803B07B4:
	.incbin "baserom.dol", 0x3AD7B4, 0xCC
.global lbl_803B0880
lbl_803B0880:
	.incbin "baserom.dol", 0x3AD880, 0x20
.global lbl_803B08A0
lbl_803B08A0:
	.incbin "baserom.dol", 0x3AD8A0, 0x5F4
.global lbl_803B0E94
lbl_803B0E94:
	.incbin "baserom.dol", 0x3ADE94, 0x1C
.global lbl_803B0EB0
lbl_803B0EB0:
	.incbin "baserom.dol", 0x3ADEB0, 0xCC
.global lbl_803B0F7C
lbl_803B0F7C:
	.incbin "baserom.dol", 0x3ADF7C, 0x40
.global lbl_803B0FBC
lbl_803B0FBC:
	.incbin "baserom.dol", 0x3ADFBC, 0x54
.global lbl_803B1010
lbl_803B1010:
	.incbin "baserom.dol", 0x3AE010, 0x914
.global lbl_803B1924
lbl_803B1924:
	.incbin "baserom.dol", 0x3AE924, 0x1A4
.global lbl_803B1AC8
lbl_803B1AC8:
	.incbin "baserom.dol", 0x3AEAC8, 0x370
.global lbl_803B1E38
lbl_803B1E38:
	.incbin "baserom.dol", 0x3AEE38, 0x630
.global lbl_803B2468
lbl_803B2468:
	.incbin "baserom.dol", 0x3AF468, 0x3DC
.global lbl_803B2844
lbl_803B2844:
	.incbin "baserom.dol", 0x3AF844, 0x58
.global lbl_803B289C
lbl_803B289C:
	.incbin "baserom.dol", 0x3AF89C, 0x7C
.global lbl_803B2918
lbl_803B2918:
	.incbin "baserom.dol", 0x3AF918, 0xA8
.global lbl_803B29C0
lbl_803B29C0:
	.incbin "baserom.dol", 0x3AF9C0, 0x2A0
.global lbl_803B2C60
lbl_803B2C60:
	.incbin "baserom.dol", 0x3AFC60, 0x98
.global lbl_803B2CF8
lbl_803B2CF8:
	.incbin "baserom.dol", 0x3AFCF8, 0x40
.global lbl_803B2D38
lbl_803B2D38:
	.incbin "baserom.dol", 0x3AFD38, 0x1C
.global lbl_803B2D54
lbl_803B2D54:
	.incbin "baserom.dol", 0x3AFD54, 0x1C
.global lbl_803B2D70
lbl_803B2D70:
	.incbin "baserom.dol", 0x3AFD70, 0x1C
.global lbl_803B2D8C
lbl_803B2D8C:
	.incbin "baserom.dol", 0x3AFD8C, 0x1C
.global lbl_803B2DA8
lbl_803B2DA8:
	.incbin "baserom.dol", 0x3AFDA8, 0x48
.global lbl_803B2DF0
lbl_803B2DF0:
	.incbin "baserom.dol", 0x3AFDF0, 0x38
.global lbl_803B2E28
lbl_803B2E28:
	.incbin "baserom.dol", 0x3AFE28, 0x1C
.global lbl_803B2E44
lbl_803B2E44:
	.incbin "baserom.dol", 0x3AFE44, 0x1C
.global lbl_803B2E60
lbl_803B2E60:
	.incbin "baserom.dol", 0x3AFE60, 0x34
.global lbl_803B2E94
lbl_803B2E94:
	.incbin "baserom.dol", 0x3AFE94, 0x4C
.global lbl_803B2EE0
lbl_803B2EE0:
	.incbin "baserom.dol", 0x3AFEE0, 0x6C
.global lbl_803B2F4C
lbl_803B2F4C:
	.incbin "baserom.dol", 0x3AFF4C, 0x54
.global lbl_803B2FA0
lbl_803B2FA0:
	.incbin "baserom.dol", 0x3AFFA0, 0x398
.global lbl_803B3338
lbl_803B3338:
	.incbin "baserom.dol", 0x3B0338, 0x8B4
.global lbl_803B3BEC
lbl_803B3BEC:
	.incbin "baserom.dol", 0x3B0BEC, 0x1C
.global lbl_803B3C08
lbl_803B3C08:
	.incbin "baserom.dol", 0x3B0C08, 0x1C
.global lbl_803B3C24
lbl_803B3C24:
	.incbin "baserom.dol", 0x3B0C24, 0x1C
.global lbl_803B3C40
lbl_803B3C40:
	.incbin "baserom.dol", 0x3B0C40, 0x33C
.global lbl_803B3F7C
lbl_803B3F7C:
	.incbin "baserom.dol", 0x3B0F7C, 0x60
.global lbl_803B3FDC
lbl_803B3FDC:
	.incbin "baserom.dol", 0x3B0FDC, 0x814
.global lbl_803B47F0
lbl_803B47F0:
	.incbin "baserom.dol", 0x3B17F0, 0x38
.global lbl_803B4828
lbl_803B4828:
	.incbin "baserom.dol", 0x3B1828, 0x38
.global lbl_803B4860
lbl_803B4860:
	.incbin "baserom.dol", 0x3B1860, 0x220
.global lbl_803B4A80
lbl_803B4A80:
	.incbin "baserom.dol", 0x3B1A80, 0x4B8
.global lbl_803B4F38
lbl_803B4F38:
	.incbin "baserom.dol", 0x3B1F38, 0x28
.global lbl_803B4F60
lbl_803B4F60:
	.incbin "baserom.dol", 0x3B1F60, 0x24
.global lbl_803B4F84
lbl_803B4F84:
	.incbin "baserom.dol", 0x3B1F84, 0x20
.global lbl_803B4FA4
lbl_803B4FA4:
	.incbin "baserom.dol", 0x3B1FA4, 0x24
.global lbl_803B4FC8
lbl_803B4FC8:
	.incbin "baserom.dol", 0x3B1FC8, 0xE4C
.global lbl_803B5E14
lbl_803B5E14:
	.incbin "baserom.dol", 0x3B2E14, 0x2C
.global lbl_803B5E40
lbl_803B5E40:
	.incbin "baserom.dol", 0x3B2E40, 0x1BC
.global lbl_803B5FFC
lbl_803B5FFC:
	.incbin "baserom.dol", 0x3B2FFC, 0x508
.global lbl_803B6504
lbl_803B6504:
	.incbin "baserom.dol", 0x3B3504, 0x80
.global lbl_803B6584
lbl_803B6584:
	.incbin "baserom.dol", 0x3B3584, 0x140
.global lbl_803B66C4
lbl_803B66C4:
	.incbin "baserom.dol", 0x3B36C4, 0x1F8
.global lbl_803B68BC
lbl_803B68BC:
	.incbin "baserom.dol", 0x3B38BC, 0x804
.global lbl_803B70C0
lbl_803B70C0:
	.incbin "baserom.dol", 0x3B40C0, 0x238
.global lbl_803B72F8
lbl_803B72F8:
	.incbin "baserom.dol", 0x3B42F8, 0x68
.global lbl_803B7360
lbl_803B7360:
	.incbin "baserom.dol", 0x3B4360, 0x70
.global lbl_803B73D0
lbl_803B73D0:
	.incbin "baserom.dol", 0x3B43D0, 0x1C
.global lbl_803B73EC
lbl_803B73EC:
	.incbin "baserom.dol", 0x3B43EC, 0x1C
.global lbl_803B7408
lbl_803B7408:
	.incbin "baserom.dol", 0x3B4408, 0xC
.global lbl_803B7414
lbl_803B7414:
	.incbin "baserom.dol", 0x3B4414, 0x10
.global lbl_803B7424
lbl_803B7424:
	.incbin "baserom.dol", 0x3B4424, 0x14
.global lbl_803B7438
lbl_803B7438:
	.incbin "baserom.dol", 0x3B4438, 0x40
.global lbl_803B7478
lbl_803B7478:
	.incbin "baserom.dol", 0x3B4478, 0x28
.global lbl_803B74A0
lbl_803B74A0:
	.incbin "baserom.dol", 0x3B44A0, 0x140
.global lbl_803B75E0
lbl_803B75E0:
	.incbin "baserom.dol", 0x3B45E0, 0x40
.global lbl_803B7620
lbl_803B7620:
	.incbin "baserom.dol", 0x3B4620, 0x128
.global lbl_803B7748
lbl_803B7748:
	.incbin "baserom.dol", 0x3B4748, 0x100
.global lbl_803B7848
lbl_803B7848:
	.incbin "baserom.dol", 0x3B4848, 0x100
.global lbl_803B7948
lbl_803B7948:
	.incbin "baserom.dol", 0x3B4948, 0x100
.global lbl_803B7A48
lbl_803B7A48:
	.incbin "baserom.dol", 0x3B4A48, 0x38
.global lbl_803B7A80
lbl_803B7A80:
	.incbin "baserom.dol", 0x3B4A80, 0x84
.global lbl_803B7B04
lbl_803B7B04:
	.incbin "baserom.dol", 0x3B4B04, 0x84
.global lbl_803B7B88
lbl_803B7B88:
	.incbin "baserom.dol", 0x3B4B88, 0xE0
.global lbl_803B7C68
lbl_803B7C68:
	.incbin "baserom.dol", 0x3B4C68, 0x48
.global lbl_803B7CB0
lbl_803B7CB0:
	.incbin "baserom.dol", 0x3B4CB0, 0xD0
.global lbl_803B7D80
lbl_803B7D80:
	.incbin "baserom.dol", 0x3B4D80, 0x44
.global lbl_803B7DC4
lbl_803B7DC4:
	.incbin "baserom.dol", 0x3B4DC4, 0x44
.global lbl_803B7E08
lbl_803B7E08:
	.incbin "baserom.dol", 0x3B4E08, 0x50
.global lbl_803B7E58
lbl_803B7E58:
	.incbin "baserom.dol", 0x3B4E58, 0x1C
.global lbl_803B7E74
lbl_803B7E74:
	.incbin "baserom.dol", 0x3B4E74, 0x204
.global lbl_803B8078
lbl_803B8078:
	.incbin "baserom.dol", 0x3B5078, 0x20
.global lbl_803B8098
lbl_803B8098:
	.incbin "baserom.dol", 0x3B5098, 0x10
.global lbl_803B80A8
lbl_803B80A8:
	.incbin "baserom.dol", 0x3B50A8, 0x20
.global lbl_803B80C8
lbl_803B80C8:
	.incbin "baserom.dol", 0x3B50C8, 0x10
.global lbl_803B80D8
lbl_803B80D8:
	.incbin "baserom.dol", 0x3B50D8, 0x1C8
.global lbl_803B82A0
lbl_803B82A0:
	.incbin "baserom.dol", 0x3B52A0, 0x200
.global lbl_803B84A0
lbl_803B84A0:
	.incbin "baserom.dol", 0x3B54A0, 0x200
.global lbl_803B86A0
lbl_803B86A0:
	.incbin "baserom.dol", 0x3B56A0, 0x184
.global lbl_803B8824
lbl_803B8824:
	.incbin "baserom.dol", 0x3B5824, 0x400
.global lbl_803B8C24
lbl_803B8C24:
	.incbin "baserom.dol", 0x3B5C24, 0x21C
.global lbl_803B8E40
lbl_803B8E40:
	.incbin "baserom.dol", 0x3B5E40, 0x1A40
.global lbl_803BA880
lbl_803BA880:
	.incbin "baserom.dol", 0x3B7880, 0x18
.global lbl_803BA898
lbl_803BA898:
	.incbin "baserom.dol", 0x3B7898, 0x228
.global lbl_803BAAC0
lbl_803BAAC0:
	.incbin "baserom.dol", 0x3B7AC0, 0x10
.global lbl_803BAAD0
lbl_803BAAD0:
	.incbin "baserom.dol", 0x3B7AD0, 0x10
.global lbl_803BAAE0
lbl_803BAAE0:
	.incbin "baserom.dol", 0x3B7AE0, 0x24
.global lbl_803BAB04
lbl_803BAB04:
	.incbin "baserom.dol", 0x3B7B04, 0x24
.global lbl_803BAB28
lbl_803BAB28:
	.incbin "baserom.dol", 0x3B7B28, 0x28
.global lbl_803BAB50
lbl_803BAB50:
	.incbin "baserom.dol", 0x3B7B50, 0x810
.global lbl_803BB360
lbl_803BB360:
	.incbin "baserom.dol", 0x3B8360, 0x1EC0
.global lbl_803BD220
lbl_803BD220:
	.incbin "baserom.dol", 0x3BA220, 0x10
.global lbl_803BD230
lbl_803BD230:
	.incbin "baserom.dol", 0x3BA230, 0x20
.global lbl_803BD250
lbl_803BD250:
	.incbin "baserom.dol", 0x3BA250, 0x800
.global lbl_803BDA50
lbl_803BDA50:
	.incbin "baserom.dol", 0x3BAA50, 0x18
.global lbl_803BDA68
lbl_803BDA68:
	.incbin "baserom.dol", 0x3BAA68, 0x1F8
.global lbl_803BDC60
lbl_803BDC60:
	.incbin "baserom.dol", 0x3BAC60, 0x10
.global lbl_803BDC70
lbl_803BDC70:
	.incbin "baserom.dol", 0x3BAC70, 0x80
.global lbl_803BDCF0
lbl_803BDCF0:
	.incbin "baserom.dol", 0x3BACF0, 0x230
.global lbl_803BDF20
lbl_803BDF20:
	.incbin "baserom.dol", 0x3BAF20, 0x1B4
.global lbl_803BE0D4
lbl_803BE0D4:
	.incbin "baserom.dol", 0x3BB0D4, 0x24
.global lbl_803BE0F8
lbl_803BE0F8:
	.incbin "baserom.dol", 0x3BB0F8, 0x2DC
.global lbl_803BE3D4
lbl_803BE3D4:
	.incbin "baserom.dol", 0x3BB3D4, 0x44
.global lbl_803BE418
lbl_803BE418:
	.incbin "baserom.dol", 0x3BB418, 0x10
.global lbl_803BE428
lbl_803BE428:
	.incbin "baserom.dol", 0x3BB428, 0x180
.global lbl_803BE5A8
lbl_803BE5A8:
	.incbin "baserom.dol", 0x3BB5A8, 0x990
.global lbl_803BEF38
lbl_803BEF38:
	.incbin "baserom.dol", 0x3BBF38, 0x30
.global lbl_803BEF68
lbl_803BEF68:
	.incbin "baserom.dol", 0x3BBF68, 0x28
.global lbl_803BEF90
lbl_803BEF90:
	.incbin "baserom.dol", 0x3BBF90, 0x28
.global lbl_803BEFB8
lbl_803BEFB8:
	.incbin "baserom.dol", 0x3BBFB8, 0x10
.global lbl_803BEFC8
lbl_803BEFC8:
	.incbin "baserom.dol", 0x3BBFC8, 0x50
.global lbl_803BF018
lbl_803BF018:
	.incbin "baserom.dol", 0x3BC018, 0x30
.global lbl_803BF048
lbl_803BF048:
	.incbin "baserom.dol", 0x3BC048, 0x30
.global lbl_803BF078
lbl_803BF078:
	.incbin "baserom.dol", 0x3BC078, 0xC8
.global lbl_803BF140
lbl_803BF140:
	.incbin "baserom.dol", 0x3BC140, 0x38
.global lbl_803BF178
lbl_803BF178:
	.incbin "baserom.dol", 0x3BC178, 0x78
.global lbl_803BF1F0
lbl_803BF1F0:
	.incbin "baserom.dol", 0x3BC1F0, 0xC
.global lbl_803BF1FC
lbl_803BF1FC:
	.incbin "baserom.dol", 0x3BC1FC, 0x34
.global lbl_803BF230
lbl_803BF230:
	.incbin "baserom.dol", 0x3BC230, 0x94
.global lbl_803BF2C4
lbl_803BF2C4:
	.incbin "baserom.dol", 0x3BC2C4, 0x34
.global lbl_803BF2F8
lbl_803BF2F8:
	.incbin "baserom.dol", 0x3BC2F8, 0x38
.global lbl_803BF330
lbl_803BF330:
	.incbin "baserom.dol", 0x3BC330, 0x48
.global lbl_803BF378
lbl_803BF378:
	.incbin "baserom.dol", 0x3BC378, 0x70
.global lbl_803BF3E8
lbl_803BF3E8:
	.incbin "baserom.dol", 0x3BC3E8, 0x1F4
.global lbl_803BF5DC
lbl_803BF5DC:
	.incbin "baserom.dol", 0x3BC5DC, 0x1D0
.global lbl_803BF7AC
lbl_803BF7AC:
	.incbin "baserom.dol", 0x3BC7AC, 0x34
.global lbl_803BF7E0
lbl_803BF7E0:
	.incbin "baserom.dol", 0x3BC7E0, 0xC00
.global lbl_803C03E0
lbl_803C03E0:
	.incbin "baserom.dol", 0x3BD3E0, 0xC
.global lbl_803C03EC
lbl_803C03EC:
	.incbin "baserom.dol", 0x3BD3EC, 0x28
.global lbl_803C0414
lbl_803C0414:
	.incbin "baserom.dol", 0x3BD414, 0x84
.global lbl_803C0498
lbl_803C0498:
	.incbin "baserom.dol", 0x3BD498, 0x28
.global lbl_803C04C0
lbl_803C04C0:
	.incbin "baserom.dol", 0x3BD4C0, 0x28
.global lbl_803C04E8
lbl_803C04E8:
	.incbin "baserom.dol", 0x3BD4E8, 0x28
.global lbl_803C0510
lbl_803C0510:
	.incbin "baserom.dol", 0x3BD510, 0x70
.global lbl_803C0580
lbl_803C0580:
	.incbin "baserom.dol", 0x3BD580, 0xE8
.global lbl_803C0668
lbl_803C0668:
	.incbin "baserom.dol", 0x3BD668, 0x80
.global lbl_803C06E8
lbl_803C06E8:
	.incbin "baserom.dol", 0x3BD6E8, 0x188
.global lbl_803C0870
lbl_803C0870:
	.incbin "baserom.dol", 0x3BD870, 0x10
.global lbl_803C0880
lbl_803C0880:
	.incbin "baserom.dol", 0x3BD880, 0x160
.global lbl_803C09E0
lbl_803C09E0:
	.incbin "baserom.dol", 0x3BD9E0, 0x20
.global lbl_803C0A00
lbl_803C0A00:
	.incbin "baserom.dol", 0x3BDA00, 0x20
.global lbl_803C0A20
lbl_803C0A20:
	.incbin "baserom.dol", 0x3BDA20, 0x16C
.global lbl_803C0B8C
lbl_803C0B8C:
	.incbin "baserom.dol", 0x3BDB8C, 0xC0
.global lbl_803C0C4C
lbl_803C0C4C:
	.incbin "baserom.dol", 0x3BDC4C, 0x14
.global lbl_803C0C60
lbl_803C0C60:
	.incbin "baserom.dol", 0x3BDC60, 0x68
.global lbl_803C0CC8
lbl_803C0CC8:
	.incbin "baserom.dol", 0x3BDCC8, 0x68
.global lbl_803C0D30
lbl_803C0D30:
	.incbin "baserom.dol", 0x3BDD30, 0x68
.global lbl_803C0D98
lbl_803C0D98:
	.incbin "baserom.dol", 0x3BDD98, 0x44
.global lbl_803C0DDC
lbl_803C0DDC:
	.incbin "baserom.dol", 0x3BDDDC, 0x44
.global lbl_803C0E20
lbl_803C0E20:
	.incbin "baserom.dol", 0x3BDE20, 0x44
.global lbl_803C0E64
lbl_803C0E64:
	.incbin "baserom.dol", 0x3BDE64, 0x1C
.global lbl_803C0E80
lbl_803C0E80:
	.incbin "baserom.dol", 0x3BDE80, 0x58
.global lbl_803C0ED8
lbl_803C0ED8:
	.incbin "baserom.dol", 0x3BDED8, 0x3C
.global lbl_803C0F14
lbl_803C0F14:
	.incbin "baserom.dol", 0x3BDF14, 0x3C
.global lbl_803C0F50
lbl_803C0F50:
	.incbin "baserom.dol", 0x3BDF50, 0x3C
.global lbl_803C0F8C
lbl_803C0F8C:
	.incbin "baserom.dol", 0x3BDF8C, 0x3C
.global lbl_803C0FC8
lbl_803C0FC8:
	.incbin "baserom.dol", 0x3BDFC8, 0x20
.global lbl_803C0FE8
lbl_803C0FE8:
	.incbin "baserom.dol", 0x3BDFE8, 0xF4
.global lbl_803C10DC
lbl_803C10DC:
	.incbin "baserom.dol", 0x3BE0DC, 0xF4
.global lbl_803C11D0
lbl_803C11D0:
	.incbin "baserom.dol", 0x3BE1D0, 0xF4
.global lbl_803C12C4
lbl_803C12C4:
	.incbin "baserom.dol", 0x3BE2C4, 0x3C
.global lbl_803C1300
lbl_803C1300:
	.incbin "baserom.dol", 0x3BE300, 0x50
.global lbl_803C1350
lbl_803C1350:
	.incbin "baserom.dol", 0x3BE350, 0x28
.global lbl_803C1378
lbl_803C1378:
	.incbin "baserom.dol", 0x3BE378, 0x20
.global lbl_803C1398
lbl_803C1398:
	.incbin "baserom.dol", 0x3BE398, 0x5C
.global lbl_803C13F4
lbl_803C13F4:
	.incbin "baserom.dol", 0x3BE3F4, 0x90
.global lbl_803C1484
lbl_803C1484:
	.incbin "baserom.dol", 0x3BE484, 0x16C
.global lbl_803C15F0
lbl_803C15F0:
	.incbin "baserom.dol", 0x3BE5F0, 0x44
.global lbl_803C1634
lbl_803C1634:
	.incbin "baserom.dol", 0x3BE634, 0x14
.global lbl_803C1648
lbl_803C1648:
	.incbin "baserom.dol", 0x3BE648, 0xC0
.global lbl_803C1708
lbl_803C1708:
	.incbin "baserom.dol", 0x3BE708, 0xD8
