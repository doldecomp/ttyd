//Goombella Tattle Details
#include "battle/battle_monosiri.h"
#include "driver/swdrv.h"

extern BattleWork* _battleWorkPointer;

//.sdata
BattleUnitType same_tbl_gesso[] = {
	kUnitBlooper,
	kUnitBlooperLeftTentacle,
	kUnitBlooperRightTentacle,
	kNullUnitKind
};

BattleUnitType same_tbl_gesso_arm_l[] = {
	kUnitBlooperLeftTentacle,
	kUnitBlooper,
	kUnitBlooperRightTentacle,
	kNullUnitKind
};

BattleUnitType same_tbl_gesso_arm_r[] = {
	kUnitBlooperRightTentacle,
	kUnitBlooper,
	kUnitBlooperLeftTentacle,
	kNullUnitKind
};

BattleUnitType same_tbl_majolyne_1[] = {
	kUnitBeldamChapter2,
	kUnitUnusedBeldam2,
	kUnitUnusedBeldam3,
	kUnitBeldamChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_majolyne_2[] = {
	kUnitUnusedBeldam2,
	kUnitBeldamChapter2,
	kUnitUnusedBeldam3,
	kUnitBeldamChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_majolyne_3[] = {
	kUnitUnusedBeldam3,
	kUnitBeldamChapter2,
	kUnitUnusedBeldam2,
	kUnitBeldamChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_majolyne_4[] = {
	kUnitBeldamChapter8,
	kUnitBeldamChapter2,
	kUnitUnusedBeldam2,
	kUnitUnusedBeldam3,
	kNullUnitKind
};

BattleUnitType same_tbl_marilyn_1[] = {
	kUnitMarilynChapter2,
	kUnitUnusedMarilyn2,
	kUnitUnusedMarilyn3,
	kUnitMarilynChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_marilyn_2[] = {
	kUnitUnusedMarilyn2,
	kUnitMarilynChapter2,
	kUnitUnusedMarilyn3,
	kUnitMarilynChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_marilyn_3[] = {
	kUnitUnusedMarilyn3,
	kUnitMarilynChapter2,
	kUnitUnusedMarilyn2,
	kUnitMarilynChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_marilyn_4[] = {
	kUnitMarilynChapter8,
	kUnitMarilynChapter2,
	kUnitUnusedMarilyn2,
	kUnitUnusedMarilyn3,
	kNullUnitKind
};

BattleUnitType same_tbl_vivian_1[] = {
	kUnitVivianChapter2,
	kUnitUnusedVivian2,
	kNullUnitKind
};

BattleUnitType same_tbl_vivian_2[] = {
	kUnitUnusedVivian2,
	kUnitVivianChapter2,
	kNullUnitKind
};

BattleUnitType same_tbl_koopa_1[] = {
	kUnitBowserChapter3,
	kUnitBowserChapter8,
	kNullUnitKind
};

BattleUnitType same_tbl_koopa_2[] = {
	kUnitBowserChapter8,
	kUnitBowserChapter3,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec[] = {
	kUnitMagikoopa,
	kUnitMagikoopaClone,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_bunshin[] = {
	kUnitMagikoopaClone,
	kUnitMagikoopa,
	kNullUnitKind
};

BattleUnitType same_tbl_black_peach[] = {
	kUnitShadowQueenPeach,
	kUnitShadowQueenDemon,
	kUnitShadowQueenLeftRightHand,
	kUnitShadowQueenDeadHands,
	kUnitShadowQueenInvincible,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_red[] = {
	kUnitRedMagikoopa,
	kUnitRedMagikoopaClone,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_red_bunshin[] = {
	kUnitRedMagikoopaClone,
	kUnitRedMagikoopa,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_white[] = {
	kUnitWhiteMagikoopa,
	kUnitWhiteMagikoopaClone,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_white_bunshin[] = {
	kUnitWhiteMagikoopaClone,
	kUnitWhiteMagikoopa,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_green[] = {
	kUnitGreenMagikoopa,
	kUnitGreenMagikoopaClone,
	kNullUnitKind
};

BattleUnitType same_tbl_kamec_green_bunshin[] = {
	kUnitGreenMagikoopaClone,
	kUnitGreenMagikoopa,
	kNullUnitKind
};

BattleUnitType same_tbl_super_mahorn[] = {
	kUnitDarkWizzerd,
	kUnitDarkWizzerdClone,
	kNullUnitKind
};

BattleUnitType same_tbl_super_mahorn_bunshin[] = {
	kUnitDarkWizzerdClone,
	kUnitDarkWizzerd,
	kNullUnitKind
};

BattleUnitType same_tbl_mahorn_custom[] = {
	kUnitEliteWizzerd,
	kUnitEliteWizzerdClone,
	kNullUnitKind
};

BattleUnitType same_tbl_mahorn_custom_bunshin[] = {
	kUnitEliteWizzerdClone,
	kUnitEliteWizzerd,
	kNullUnitKind
};

BattleUnitType same_tbl_kuriboo[] = {
	kUnitGoomba,
	kUnitGoombaGlitzville,
	kNullUnitKind
};

BattleUnitType same_tbl_chorobon[] = {
	kUnitFuzzy,
	kUnitFuzzyHorde,
	kNullUnitKind
};

BattleUnitType same_tbl_gundan_zako[] = {
	kUnitXNaut,
	kUnitXNautsCrumpFormation1,
	kUnitXNautsCrumpFormation2,
	kUnitXNautsCrumpFormation3,
	kNullUnitKind
};

BattleUnitType same_tbl_cortez[] = {
	kUnitCortez,
	kUnitCortezBonePile,
	kUnitCortezSword,
	kUnitCortezHook,
	kUnitCortezRapier,
	kUnitCortezSaber,
	kNullUnitKind
};

BattleUnitType same_tbl_magunum_battender[] = {
	kUnitMagnus,
	kUnitXFist,
	kNullUnitKind
};

BattleUnitType same_tbl_magunum_battender_mkii[] = {
	kUnitMagnus20,
	kUnitXPunch,
	kNullUnitKind
};

BattleUnitType same_tbl_moamoa[] = {
	kUnitSmorg,
	kUnitSmorgMiasmaTentacleC,
	kUnitSmorgMiasmaTentacleB,
	kUnitSmorgMiasmaTentacleA,
	kUnitSmorgMiasmaClaw,
	kNullUnitKind
};

BattleUnitType same_tbl_iron_sinemon[] = {
	kUnitIronCleftRed,
	kUnitIronCleftGreen,
	kNullUnitKind
};

//.data
TattleEntry monosiriMessageTable[] = {
	{NULL, NULL, NULL, NULL, NULL, NULL}, //0x0 (0)
	{"btl_un_kuriboo", "btl_hlp_kuriboo", "menu_enemy_001", "c_kuribo", "KUR_Z_2", "menu_monosiri_nara"}, //0x1 (1)
	{"btl_un_patakuri", "btl_hlp_patakuri", "menu_enemy_003", "c_kuribo", "PTK_Z_2", "menu_monosiri_nara"}, //0x2 (2)
	{"btl_un_togekuri", "btl_hlp_togekuri", "menu_enemy_002", "c_kuribo", "TGK_Z_2", "menu_monosiri_nara"}, //0x3 (3)
	{"btl_un_hinnya", "btl_hlp_hinnya", "menu_enemy_020", "c_hannya_n", "Z_1", "menu_monosiri_tik"}, //0x4 (4)
	{"btl_un_hannya", "btl_hlp_hannya", "menu_enemy_021", "c_hannya", "Z_1", "menu_monosiri_tik"}, //0x5 (5)
	{"btl_un_kanbu1", "btl_hlp_kanbu1", NULL, "c_kanbu", "Z_1", "menu_monosiri_nara"}, //0x6 (6)
	{"btl_un_monban", "btl_hlp_monban", "menu_enemy_103", "c_monban", "Z_1", "menu_monosiri_gor"}, //0x7 (7)
	{"btl_un_gesso", "btl_hlp_gesso", "menu_enemy_114", "c_gesso", "GSO_Z2_1", "menu_monosiri_tik"}, //0x8 (8)
	{"btl_un_gesso_left_arm", NULL, NULL, "c_gesso3", "GSO_Z1_1", "menu_monosiri_tik"}, //0x9 (9)
	{"btl_un_gesso_right_arm", NULL, NULL, "c_gesso2", "GSO_Z1_1", "menu_monosiri_tik"}, //0xA (10)
	{"btl_un_togenoko", "btl_hlp_togenoko", "menu_enemy_033", "c_togenoko", "Z_1", "menu_monosiri_tik"}, //0xB (11)
	{"btl_un_kamec", "btl_hlp_kamec", "menu_enemy_086", "c_kamek", "KMK_Z_1", "menu_monosiri_tik"}, //0xC (12)
	{"btl_un_kamec_bunsin", "btl_hlp_kamec_bunshin", NULL, "c_kamek", "KMK_Z_1", "menu_monosiri_tik"}, //0xD (13)
	{"btl_un_nokonoko", "btl_hlp_nokonoko", "menu_enemy_004", "c_nokoteki", "NKT_Z_1", "menu_monosiri_hei"}, //0xE (14)
	{"btl_un_patapata", "btl_hlp_patapata", "menu_enemy_005", "c_nokoteki", "PTP_Z_1", "menu_monosiri_gon"}, //0xF (15)
	{"btl_un_chorobon", "btl_hlp_chorobon", "menu_enemy_006", "c_chorobon", "CBN_Z_1", "menu_monosiri_stn"}, //0x10 (16)
	{"btl_un_honenoko", "btl_hlp_honenoko", "menu_enemy_007", "c_karon_g_h", "KRN_Z_1", "menu_monosiri_gon"}, //0x11 (17)
	{"btl_un_sinnosuke", "btl_hlp_sinnosuke", "menu_enemy_008", "c_sinnosuke", "SIS_Z_1", "menu_monosiri_hei"}, //0x12 (18)
	{"btl_un_togedaruma", "btl_hlp_togedaruma", "menu_enemy_009", "c_togedaruma", "TGD_Z_1", "menu_monosiri_hei"}, //0x13 (19)
	{"btl_un_gold_chorobon", "btl_hlp_gold_chorobon", "menu_enemy_010", "c_chorobon_k", "CBN_Z_1", "menu_monosiri_stn"}, //0x14 (20)
	{"btl_un_chorobon_gundan", "btl_hlp_chorobon_gundan", NULL, "c_chorobon", "CBN_Z_1", "menu_monosiri_stn"}, //0x15 (21)
	{"btl_un_red_honenoko", "btl_hlp_red_honenoko", "menu_enemy_012", "c_karon_r_h", "KRN_Z_1", "menu_monosiri_gon"}, //0x16 (22)
	{"btl_un_gonbaba", "btl_hlp_gonbaba", "menu_enemy_117", "c_gonbaba", "GNB_Z_1", "menu_monosiri_gon"}, //0x17 (23)
	{"btl_un_monochrome_kurokumorn", "btl_hlp_monochrome_kurokumorn", "menu_enemy_172", "c_kmoon_wb", "Z_1", "menu_monosiri_win"}, //0x18 (24)
	{"btl_un_monochrome_pakkun", "btl_hlp_monochrome_pakkun", "menu_enemy_181", "c_pakflwr_t", "PKF_Z_1", "menu_monosiri_win"}, //0x19 (25)
	{"btl_un_monochrome_sinemon", "btl_hlp_monochrome_sinemon", "menu_enemy_035", "c_sinemon_w", "SIN_Z_1", "menu_monosiri_win"}, //0x1A (26)
	{"btl_un_piders", "btl_hlp_piders", "menu_enemy_015", "c_paid", "PAI_Z_1", "menu_monosiri_mri"}, //0x1B (27)
	{"btl_un_gundan_zako", "btl_hlp_gundan_zako", "menu_enemy_018", "c_zako_n", "Z_1", "menu_monosiri_nara"}, //0x1C (28)
	{"btl_un_barriern", "btl_hlp_barriern", "menu_enemy_016", "c_baria", "Z_1", "menu_monosiri_mri"}, //0x1D (29)
	{"btl_un_barriern_satellite", "btl_hlp_barriern_petit", "menu_enemy_017", "c_baria", "Z_2", "menu_monosiri_mri"}, //0x1E (30)
	{"btl_un_majolyne1", "btl_hlp_majyorin", "menu_enemy_104", "c_majyorin", "MJR_M_1", "menu_monosiri_win"}, //0x1F (31)
	{"btl_un_marilyn1", "btl_hlp_maririn", "menu_enemy_108", "c_maririn", "MRR_M_1", "menu_monosiri_win"}, //0x20 (32)
	{"btl_un_vivian1", "btl_hlp_vivian", "menu_enemy_112", "c_vivian", "PTR_M_1", "menu_monosiri_win"}, //0x21 (33)
	{"btl_un_magnum_battender", "btl_hlp_magnum_battender", "menu_enemy_139", "c_mb_robo_1b", "MGN_Z_1", "menu_monosiri_mri"}, //0x22 (34)
	{"btl_un_rocket_punch", NULL, NULL, NULL, "MGN_A1_4", "menu_monosiri_mri"}, //0x23 (35)
	{"btl_un_kuriboo", "btl_hlp_kuriboo", NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_nara"}, //0x24 (36)
	{"btl_un_nokonoko_fighter", "btl_hlp_nokonoko_fighter", "menu_enemy_188", "c_touginoko", "NKT_Z_1", "menu_monosiri_tou"}, //0x25 (37)
	{"btl_un_patapata_fighter", "btl_hlp_patapata_fighter", "menu_enemy_189", "c_touginoko", "PTP_Z_1", "menu_monosiri_tou"}, //0x26 (38)
	{"btl_un_sambo", "btl_hlp_sambo", "menu_enemy_055", "c_sanbo", "SNB_Z_1", "menu_monosiri_tou"}, //0x27 (39)
	{"btl_un_jyugem", "btl_hlp_jyugem", "menu_enemy_084", "c_jugemu", "JGM_Z_1", "menu_monosiri_tou"}, //0x28 (40)
	{"btl_un_togezo", "btl_hlp_togezo", "menu_enemy_085", "c_togezo", "TGZ_Z_1", "menu_monosiri_tou"}, //0x29 (41)
	{"btl_un_hyper_sinnosuke", "btl_hlp_hyper_sinnosuke", "menu_enemy_036", "c_sinnosuke_h", "SIS_Z_1", "menu_monosiri_tou"}, //0x2A (42)
	{"btl_un_bomhei", "btl_hlp_bomhei", "menu_enemy_061", "c_bomhey", "BOM_Z_1", "menu_monosiri_tou"}, //0x2B (43)
	{"btl_un_borodo", "btl_hlp_borodo", "menu_enemy_077", "c_borodo", "Z_1", "menu_monosiri_tou"}, //0x2C (44)
	{"btl_un_borodo_king", "btl_hlp_borodo_king", "menu_enemy_190", "c_borodo_g", "Z_1", "menu_monosiri_tou"}, //0x2D (45)
	{"btl_un_crimson_togemet", "btl_hlp_crimson_togemet", "menu_enemy_191", "c_met_h", "TMT_Z_1", "menu_monosiri_tou"}, //0x2E (46)
	{"btl_un_ura_noko", "btl_hlp_ura_noko", "menu_enemy_031", "c_uranoko", "NKT_Z_1", "menu_monosiri_tou"}, //0x2F (47)
	{"btl_un_ura_pata", "btl_hlp_ura_pata", "menu_enemy_032", "c_uranoko", "PTP_Z_1", "menu_monosiri_tou"}, //0x30 (48)
	{"btl_un_kamec_red", "btl_hlp_kamec_red", "menu_enemy_169", "c_kamek_r", "KMR_Z_1", "menu_monosiri_tou"}, //0x31 (49)
	{"btl_un_kamec_red_bunsin", "btl_hlp_kamec_red_bunshin", NULL, "c_kamek_r", "KMR_Z_1", "menu_monosiri_tou"}, //0x32 (50)
	{"btl_un_kamec_white", "btl_hlp_kamec_white", "menu_enemy_170", "c_kamek_w", "KMW_Z_1", "menu_monosiri_tou"}, //0x33 (51)
	{"btl_un_kamec_white_bunsin", "btl_hlp_kamec_white_bunshin", NULL, "c_kamek_w", "KMW_Z_1", "menu_monosiri_tou"}, //0x34 (52)
	{"btl_un_kamec_green", "btl_hlp_kamec_green", "menu_enemy_171", "c_kamek_g", "KMG_Z_1", "menu_monosiri_tou"}, //0x35 (53)
	{"btl_un_kamec_green_bunsin", "btl_hlp_kamec_green_bunshin", NULL, "c_kamek_g", "KMG_Z_1", "menu_monosiri_tou"}, //0x36 (54)
	{"btl_un_dark_keeper", "btl_hlp_dark_keeper", "menu_enemy_184", "c_monban_t", "Z_1", "menu_monosiri_tou"}, //0x37 (55)
	{"btl_un_hammer_bros", "btl_hlp_hammer_bros", "menu_enemy_067", "c_burosu_h", "BRO_Z_1", "menu_monosiri_tou"}, //0x38 (56)
	{"btl_un_boomerang_bros", "btl_hlp_boomerang_bros", "menu_enemy_068", "c_burosu_b", "BRO_Z_1", "menu_monosiri_tou"}, //0x39 (57)
	{"btl_un_fire_bros", "btl_hlp_fire_bros", "menu_enemy_069", "c_burosu_f", "BRO_Z_1", "menu_monosiri_tou"}, //0x3A (58)
	{"btl_un_burst_wanwan", "btl_hlp_burst_wanwan", "menu_enemy_185", "c_wanwan_a", "WAN_Z_1", "menu_monosiri_tou"}, //0x3B (59)
	{"btl_un_togenoko_ace", "btl_hlp_togenoko_ace", "menu_enemy_175", "c_togenoko_b", "Z_1", "menu_monosiri_tou"}, //0x3C (60)
	{"btl_un_iron_sinemon", "btl_hlp_iron_sinemon", "menu_enemy_038", "c_sinemon_a", "SIN_Z_1", "menu_monosiri_tou"}, //0x3D (61)
	{"btl_un_iron_sinemon2", "btl_hlp_iron_sinemon2", "menu_enemy_039", "c_sinemon_m", "SIN_Z_1", "menu_monosiri_tou"}, //0x3E (62)
	{"btl_un_koopa", "btl_hlp_koopa_tou", "menu_enemy_187", "c_koopa", "KPA_Z_1", "menu_monosiri_nara"}, //0x3F (63)
	{"btl_un_champion", "btl_hlp_champion", "menu_enemy_142", "c_bred_h", "Z_1", "menu_monosiri_tou"}, //0x40 (64)
	{"btl_un_macho_gance", "btl_hlp_macho_gansu", "menu_enemy_141", "c_m_gansu", "Z_1", "menu_monosiri_tou"}, //0x41 (65)
	{"btl_un_hyper_kuriboo", "btl_hlp_hyper_kuriboo", "menu_enemy_023", "c_kuribo_h", "KUR_Z_2", "menu_monosiri_gra"}, //0x42 (66)
	{"btl_un_hyper_patakuri", "btl_hlp_hyper_patakuri", "menu_enemy_025", "c_kuribo_h", "PTK_Z_2", "menu_monosiri_gra"}, //0x43 (67)
	{"btl_un_hyper_togekuri", "btl_hlp_hyper_togekuri", "menu_enemy_024", "c_kuribo_h", "TGK_Z_2", "menu_monosiri_gra"}, //0x44 (68)
	{"btl_un_pansy", "btl_hlp_pansy", "menu_enemy_082", "c_pansy", "PAN_Z_1", "menu_monosiri_gra"}, //0x45 (69)
	{"btl_un_twinkling_pansy", "btl_hlp_twinkling_pansy", "menu_enemy_083", "c_kpansy", "PAN_Z_1", "menu_monosiri_gra"}, //0x46 (70)
	{"btl_un_hyper_sinemon", "btl_hlp_hyper_sinemon", "menu_enemy_037", "c_sinemon_h", "SIN_Z_1", "menu_monosiri_gra"}, //0x47 (71)
	{"btl_un_met", "btl_hlp_met", "menu_enemy_048", "c_met", "MET_Z_1", "menu_monosiri_jin"}, //0x48 (72)
	{"btl_un_togemet", "btl_hlp_togemet", "menu_enemy_049", "c_met", "TMT_Z_1", "menu_monosiri_jin"}, //0x49 (73)
	{"btl_un_basabasa", "btl_hlp_basabasa", "menu_enemy_040", "c_basabasa", "BSA_Z_1", "menu_monosiri_jin"}, //0x4A (74)
	{"btl_un_teresa", "btl_hlp_teresa", "menu_enemy_052", "c_teresa", "Z_1", "menu_monosiri_jin"}, //0x4B (75)
	{"btl_un_atmic_teresa", "btl_hlp_atomic_teresa", "menu_enemy_054", "c_atmic_trs", "Z_1", "menu_monosiri_jin"}, //0x4C (76)
	{"btl_un_hatena", "btl_hlp_hatena", "menu_enemy_124", "c_ranpel", "Z_1", "menu_monosiri_jin"}, //0x4D (77)
	{"btl_un_hatena", NULL, NULL, "c_ranpel", "Z_1", "menu_monosiri_gra"}, //0x4E (78)
	{"btl_un_rampell", NULL, NULL, "c_ranpel", "Z_1", "menu_monosiri_jin"}, //0x4F (79)
	{"btl_un_gullible_christine", NULL, NULL, "c_pkr", "PRK_Z_1", "menu_monosiri_jin"}, //0x50 (80)
	{"btl_un_gullible_nokotarou", NULL, NULL, "c_pnk", "PNK_Z_1", "menu_monosiri_jin"}, //0x51 (81)
	{"btl_un_gullible_yoshi", NULL, NULL, "c_babyyoshi", "PYS_Z_1", "menu_monosiri_jin"}, //0x52 (82)
	{"btl_un_gullible_clauda", NULL, NULL, "c_windy", "PWD_Z_1", "menu_monosiri_jin"}, //0x53 (83)
	{"btl_un_hermos", "btl_hlp_hermos", "menu_enemy_081", "c_elmos", "Z_1", "menu_monosiri_muj"}, //0x54 (84)
	{"btl_un_bubble", "btl_hlp_bubble", "menu_enemy_080", "c_bubble", "Z_1", "menu_monosiri_dou"}, //0x55 (85)
	{"btl_un_green_chorobon", "btl_hlp_green_chorobon", "menu_enemy_042", "c_chorobon_g", "CBN_Z_1", "menu_monosiri_muj"}, //0x56 (86)
	{"btl_un_flower_chorobon", "btl_hlp_flower_chorobon", "menu_enemy_043", "c_chorobon_f", "CBN_Z_1", "menu_monosiri_muj"}, //0x57 (87)
	{"btl_un_poison_pakkun", "btl_hlp_poison_pakkun", "menu_enemy_046", "c_pakflwr_p", "PKF_Z_1", "menu_monosiri_muj"}, //0x58 (88)
	{"btl_un_patamet", "btl_hlp_patamet", "menu_enemy_050", "c_met", "PMT_Z_1", "menu_monosiri_dou"}, //0x59 (89)
	{"btl_un_killer_cannon", "btl_hlp_killer_cannon", "menu_enemy_059", "c_killtai", "KTA_Z_1", "menu_monosiri_dou"}, //0x5A (90)
	{"btl_un_killer", "btl_hlp_killer", "menu_enemy_057", "c_kilr", "KIL_Z_1", "menu_monosiri_dou"}, //0x5B (91)
	{"btl_un_heavy_bom", "btl_hlp_heavy_bom", "menu_enemy_064", "c_heavy", "Z_1", "menu_monosiri_dou"}, //0x5C (92)
	{"btl_un_cortez", "btl_hlp_cortez", "menu_enemy_132", "c_korutesu1", "KRT_Z_1", "menu_monosiri_dou"}, //0x5D (93)
	{"btl_un_honeduka", NULL, NULL, "c_honezuka", "KRT_Z_1", "menu_monosiri_dou"}, //0x5E (94)
	{"btl_un_cortez_claw", NULL, NULL, "c_buki4", "KRT_Z_1", "menu_monosiri_dou"}, //0x5F (95)
	{"btl_un_cortez_rapier", NULL, NULL, "c_buki3", "KRT_Z_1", "menu_monosiri_dou"}, //0x60 (96)
	{"btl_un_cortez_sword", NULL, NULL, "c_buki2", "KRT_Z_1", "menu_monosiri_dou"}, //0x61 (97)
	{"btl_un_cortez_saber", NULL, NULL, "c_buki1", "KRT_Z_1", "menu_monosiri_dou"}, //0x62 (98)
	{"btl_un_kanbu3", "btl_hlp_kanbu3", "menu_enemy_144", "c_kanbu", "Z_1", "menu_monosiri_nara"}, //0x63 (99)
	{"btl_un_gundan_zako_group1", "btl_hlp_gundan_zako_group1", NULL, "c_zako_n", "Z_1", "menu_monosiri_nara"}, //0x64 (100)
	{"btl_un_gundan_zako_group2", "btl_hlp_gundan_zako_group1", NULL, "c_zako_n", "Z_1", "menu_monosiri_nara"}, //0x65 (101)
	{"btl_un_gundan_zako_group3", "btl_hlp_gundan_zako_group1", NULL, "c_zako_n", "Z_1", "menu_monosiri_nara"}, //0x66 (102)
	{"btl_un_kurokumorn", "btl_hlp_kurokumorn", "menu_enemy_065", "c_kmoon", "Z_1", "menu_monosiri_eki"}, //0x67 (103)
	{"btl_un_sambo_mummy", "btl_hlp_sambo_mummy", "menu_enemy_056", "c_sanbo_m", "SNB_Z_1", "menu_monosiri_eki"}, //0x68 (104)
	{"btl_un_patatogemet", "btl_hlp_patatogemet", "menu_enemy_051", "c_met", "PTM_Z_1", "menu_monosiri_eki"}, //0x69 (105)
	{"btl_un_purple_teresa", "btl_hlp_purple_teresa", "menu_enemy_053", "c_teresa_p", "Z_1", "menu_monosiri_sin"}, //0x6A (106)
	{"btl_un_moamoa", "btl_hlp_moamoa", "menu_enemy_118", "c_g_moamoa", "S_3", "menu_monosiri_rsh"}, //0x6B (107)
	{"btl_un_moamoa_tentacle_a", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_rsh"}, //0x6C (108)
	{"btl_un_moamoa_tentacl_b", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_rsh"}, //0x6D (109)
	{"btl_un_moamoa_tentacle_c", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_rsh"}, //0x6E (110)
	{"btl_un_moamoa_mouth", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_rsh"}, //0x6F (111)
	{"btl_un_bllizard", "btl_hlp_bllizard", "menu_enemy_066", "c_kmoon_b", "Z_1", "menu_monosiri_bom"}, //0x70 (112)
	{"btl_un_ice_pakkun", "btl_hlp_ice_pakkun", "menu_enemy_047", "c_pakflwr_a", "PKF_Z_1", "menu_monosiri_bom"}, //0x71 (113)
	{"btl_un_sinemon", "btl_hlp_sinemon", "menu_enemy_034", "c_sinemon", "SIN_Z_1", "menu_monosiri_moo"}, //0x72 (114)
	{"btl_un_barriern_z", "btl_hlp_barriern_z", "menu_enemy_073", "c_baria_z", "Z_1", "menu_monosiri_moo"}, //0x73 (115)
	{"btl_un_barriern_satellite_z", "btl_hlp_barriern_z_petit", "menu_enemy_074", "c_baria_z", "Z_2", "menu_monosiri_moo"}, //0x74 (116)
	{"btl_un_barriern_custom", "btl_hlp_barriern_custom", "menu_enemy_179", "c_baria_c", "Z_1", "menu_monosiri_aji"}, //0x75 (117)
	{"btl_un_barriern_custom_satellite", "btl_hlp_barriern_custom_satellite", "menu_enemy_180", "c_baria_c", "Z_2", "menu_monosiri_aji"}, //0x76 (118)
	{"btl_un_gundan_zako_magician", "btl_hlp_gundan_zako_magician", "menu_enemy_075", "c_zako_m", "Z_1", "menu_monosiri_aji"}, //0x77 (119)
	{"btl_un_gundan_zako_elite", "btl_hlp_gundan_zako_elite", "menu_enemy_076", "c_zako_e", "Z_1", "menu_monosiri_aji"}, //0x78 (120)
	{"btl_un_magnum_battender_mkii", "btl_hlp_magnum_battender_mkII", "menu_enemy_140", "c_mb_robo_2b", "MGN_Z_1", "menu_monosiri_aji"}, //0x79 (121)
	{"btl_un_rocket_punch_mkii", NULL, NULL, "c_mb_robo_1b", "MGN_A1_4", "menu_monosiri_aji"}, //0x7A (122)
	{"btl_un_basabasa_chururu", "btl_hlp_basabasa_chururu", "menu_enemy_041", "c_cyuru", "BSA_Z_1", "menu_monosiri_las"}, //0x7B (123)
	{"btl_un_phantom", "btl_hlp_phantom", "menu_enemy_178", "c_phantom", "Z_1", "menu_monosiri_las"}, //0x7C (124)
	{"btl_un_super_killer_cannon", "btl_hlp_super_killer_cannon", "menu_enemy_060", "c_killtai_g", "KTA_Z_1", "menu_monosiri_las"}, //0x7D (125)
	{"btl_un_super_killer", "btl_hlp_super_killer", "menu_enemy_058", "c_kilr_g", "KIL_Z_1", "menu_monosiri_las"}, //0x7E (126)
	{"btl_un_wanwan", "btl_hlp_wanwan", "menu_enemy_079", "c_wanwan", "WAN_Z_1", "menu_monosiri_las"}, //0x7F (127)
	{"btl_un_super_mahorn", "btl_hlp_super_mahorn", "menu_enemy_071", "c_maho_b", "MAH_Z_M", "menu_monosiri_las"}, //0x80 (128)
	{"btl_un_super_mahorn_bunsin", "btl_hlp_super_mahorn_bunsin", NULL, "c_maho_b", "MAH_Z_M", "menu_monosiri_las"}, //0x81 (129)
	{"btl_un_karon", "btl_hlp_karon", "menu_enemy_044", "c_karon_h", "KRN_Z_1", "menu_monosiri_las"}, //0x82 (130)
	{"btl_un_black_karon", "btl_hlp_black_karon", "menu_enemy_045", "c_karon_b_h", "KRN_Z_1", "menu_monosiri_las"}, //0x83 (131)
	{"btl_un_bunbaba", "btl_hlp_bunbaba", "menu_enemy_196", "c_gonbaba_b", "GNB_Z_1", "menu_monosiri_las"}, //0x84 (132)
	{"btl_un_majolyne4", "btl_hlp_majyorin2", "menu_enemy_107", "c_majyorin", "MJR_M_1", "menu_monosiri_nara"}, //0x85 (133)
	{"btl_un_marilyn4", "btl_hlp_maririn2", "menu_enemy_111", "c_maririn", "MRR_M_1", "menu_monosiri_nara"}, //0x86 (134)
	{"btl_un_rampell", "btl_hlp_ranperu_las", "menu_enemy_125", "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x87 (135)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x88 (136)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x89 (137)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x8A (138)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x8B (139)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x8C (140)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x8D (141)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x8E (142)
	{"btl_un_rampell", "btl_hlp_ranperu_las", NULL, "c_ranpel", "Z_1", "menu_monosiri_nara"}, //0x8F (143)
	{"btl_un_koopa", "btl_hlp_koopa", "menu_enemy_149", "c_koopa", "KPA_Z_1", "menu_monosiri_nara"}, //0x90 (144)
	{"btl_un_kamec_obaba", "btl_hlp_kamec_obaba", "menu_enemy_150", "c_kamek_bb", "Z_1", "menu_monosiri_nara"}, //0x91 (145)
	{"btl_un_batten_leader", "btl_hlp_batsugalf", "menu_enemy_151", "c_shuryo", "Z_1", "menu_monosiri_las"}, //0x92 (146)
	{"btl_un_batten_satellite", "btl_hlp_batsu_satellite", "menu_enemy_152", "c_shuryo_p", "Z_1", "menu_monosiri_las"}, //0x93 (147)
	{"btl_un_black_peach", "btl_hlp_shadowqueen1", NULL, "c_b_peach_b", "KRT_Z_1", "menu_monosiri_las"}, //0x94 (148)
	{"btl_un_shadow_queen", NULL, NULL, "c_q_kage_m", "KRT_Z_1", "menu_monosiri_las"}, //0x95 (149)
	{"btl_un_shadow_queen", "btl_hlp_shadowqueen2", "menu_enemy_154", "c_q_kage_m", "KRT_Z_1", "menu_monosiri_las"}, //0x96 (150)
	{"btl_un_shadow_queen", NULL, NULL, "c_b_hand", "KRT_Z_1", "menu_monosiri_las"}, //0x97 (151)
	{"btl_un_shadow_queen", NULL, NULL, "c_s_hand", "KRT_Z_1", "menu_monosiri_las"}, //0x98 (152)
	{"btl_un_yami_kuriboo", "btl_hlp_yami_kuriboo", "menu_enemy_026", "c_kuribo_y", "KUR_Z_2", "menu_monosiri_shiga"}, //0x99 (153)
	{"btl_un_yami_patakuri", "btl_hlp_yami_patakuri", "menu_enemy_028", "c_kuribo_y", "PTK_Z_2", "menu_monosiri_shiga"}, //0x9A (154)
	{"btl_un_yami_togekuri", "btl_hlp_yami_togekuri", "menu_enemy_027", "c_kuribo_y", "TGK_Z_2", "menu_monosiri_shiga"}, //0x9B (155)
	{"btl_un_yami_noko", "btl_hlp_yami_noko", "menu_enemy_029", "c_yaminoko", "NKT_Z_1", "menu_monosiri_shiga"}, //0x9C (156)
	{"btl_un_yami_pata", "btl_hlp_yami_pata", "menu_enemy_030", "c_yaminoko", "PTP_Z_1", "menu_monosiri_shiga"}, //0x9D (157)
	{"btl_un_badge_borodo", "btl_hlp_badge_borodo", "menu_enemy_078", "c_borodo_t", "Z_1", "menu_monosiri_shiga"}, //0x9E (158)
	{"btl_un_hyper_jyugem", "btl_hlp_hyper_jyugem", "menu_enemy_186", "c_jugemu_b", "JGM_Z_1", "menu_monosiri_shiga"}, //0x9F (159)
	{"btl_un_hyper_togezo", "btl_hlp_hyper_togezo", "menu_enemy_173", "c_togezo_b", "TGZ_Z_1", "menu_monosiri_shiga"}, //0xA0 (160)
	{"btl_un_mahorn", "btl_hlp_mahorn", "menu_enemy_070", "c_maho", "MAH_Z_M", "menu_monosiri_shiga"}, //0xA1 (161)
	{"btl_un_pakkun_flower", "btl_hlp_pakkun_flower", "menu_enemy_014", "c_pakflwr", "PKF_Z_1", "menu_monosiri_shiga"}, //0xA2 (162)
	{"btl_un_hennya", "btl_hlp_hennya", "menu_enemy_022", "c_hannya_t", "Z_1", "menu_monosiri_shiga"}, //0xA3 (163)
	{"btl_un_churantalar", "btl_hlp_churantalar", "menu_enemy_176", "c_paid_b", "PAI_Z_1", "menu_monosiri_shiga"}, //0xA4 (164)
	{"btl_un_yamitogedaruma", "btl_hlp_yamitogedaruma", "menu_enemy_174", "c_togedaruma_b", "TGD_Z_1", "menu_monosiri_shiga"}, //0xA5 (165)
	{"btl_un_dokugassun", "btl_hlp_dokugassun", "menu_enemy_013", "c_kmoon_g", "Z_1", "menu_monosiri_shiga"}, //0xA6 (166)
	{"btl_un_basabasa_green", "btl_hlp_basabasa_green", "menu_enemy_177", "c_basabasa_g", "BSA_Z_1", "menu_monosiri_shiga"}, //0xA7 (167)
	{"btl_un_giant_bomb", "btl_hlp_giant_bomb", "menu_enemy_182", "c_giant", "Z_1", "menu_monosiri_shiga"}, //0xA8 (168)
	{"btl_un_mahorn_custom", "btl_hlp_mahorn_custom", "menu_enemy_183", "c_maho_w", "MAH_Z_M", "menu_monosiri_shiga"}, //0xA9 (169)
	{"btl_un_mahorn_custom_bunsin", "btl_hlp_mahorn_custom_bunshin", NULL, "c_maho_w", "MAH_Z_M", "menu_monosiri_shiga"}, //0xAA (170)
	{"btl_un_zonbaba", "btl_hlp_zonbaba", "menu_enemy_195", "c_gonbaba_z", "GNB_Z_1", "menu_monosiri_shiga"}, //0xAB (171)
	{"btl_un_crimson_met", "btl_hlp_crimson_met", NULL, "c_met_h", "MET_Z_1", "menu_monosiri_tou"}, //0xAC (172)
	{"btl_un_crimson_patamet", "btl_hlp_crimson_patamet", NULL, "c_met_h", "PMT_Z_1", "menu_monosiri_tou"}, //0xAD (173)
	{"btl_un_crimson_patatogemet", "btl_hlp_crimson_patatogemet", NULL, "c_met_h", "PTM_Z_1", "menu_monosiri_tou"}, //0xAE (174)
	{"btl_un_hyper_bomhei", "btl_hlp_hyper_bomhei", NULL, "c_bomhey_h", "BOM_Z_1", "menu_monosiri_jon"}, //0xAF (175)
	{"btl_un_ultra_bomhei", "btl_hlp_ultra_bomhei", NULL, "c_bomhey_m", "BOM_Z_1", "menu_monosiri_jon"}, //0xB0 (176)
	{"btl_un_christine", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB1 (177)
	{"btl_un_frankli", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB2 (178)
	{"btl_un_frankli", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB3 (179)
	{"btl_un_frankli", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB4 (180)
	{"btl_un_act_mario", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB5 (181)
	{"btl_un_act_clauda", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB6 (182)
	{"btl_un_act_teresa", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB7 (183)
	{"btl_un_act_atmic_teresa", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB8 (184)
	{"btl_un_act_kinopio", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xB9 (185)
	{"btl_un_act_kinopiko", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xBA (186)
	{"btl_un_test", "btl_hlp_kuriboo", NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gor"}, //0xBB (187)
	{"btl_un_kanbu2", "btl_hlp_kanbu2", NULL, "c_kanbu", "Z_1", "menu_monosiri_gon"}, //0xBC (188)
	{"btl_un_majolyne2", "btl_hlp_majyorin", NULL, "c_majyorin", "MJR_Z_1", "menu_monosiri_nara"}, //0xBD (189)
	{"btl_un_marilyn2", "btl_hlp_maririn", NULL, "c_maririn", "MRR_Z_1", "menu_monosiri_shiga"}, //0xBE (190)
	{"btl_un_vivian2", "btl_hlp_vivian", NULL, "c_vivian", "PTR_Z_1", "menu_monosiri_gor"}, //0xBF (191)
	{"btl_un_majolyne3", "btl_hlp_majyorin", NULL, "c_majyorin", "MJR_Z_1", "menu_monosiri_gon"}, //0xC0 (192)
	{"btl_un_marilyn3", "btl_hlp_maririn", NULL, "c_maririn", "MRR_Z_1", "menu_monosiri_nara"}, //0xC1 (193)
	{"btl_un_mecha_kuri", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_shiga"}, //0xC2 (194)
	{"btl_un_mecha_kame", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gor"}, //0xC3 (195)
	{"btl_un_okorl", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gon"}, //0xC4 (196)
	{"btl_un_yowarl", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_nara"}, //0xC5 (197)
	{"btl_un_tuyonarl", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_shiga"}, //0xC6 (198)
	{"btl_un_wanawana", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gor"}, //0xC7 (199)
	{"btl_un_minarai_kamec", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gon"}, //0xC8 (200)
	{"btl_un_heiho", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_nara"}, //0xC9 (201)
	{"btl_un_dancing_heiho", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_shiga"}, //0xCA (202)
	{"btl_un_fire_heiho", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gor"}, //0xCB (203)
	{"btl_un_command_heiho", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gon"}, //0xCC (204)
	{"btl_un_black_heiho", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_nara"}, //0xCD (205)
	{"btl_un_hatty", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_shiga"}, //0xCE (206)
	{"btl_un_kohatty", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gor"}, //0xCF (207)
	{"btl_un_ufo", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_gon"}, //0xD0 (208)
	{"btl_un_powan", NULL, NULL, "c_powan", "Z_1", "menu_monosiri_nara"}, //0xD1 (209)
	{"btl_un_fighter", NULL, NULL, "c_kuribo", "KUR_Z_2", "menu_monosiri_shiga"}, //0xD2 (210)
	{"btl_un_nancy", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD3 (211)
	{"btl_un_master", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD4 (212)
	{"btl_un_reporter", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD5 (213)
	{"btl_un_hotdog_master", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD6 (214)
	{"btl_un_marco", NULL, NULL, "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD7 (215)
	{"btl_un_tree", NULL, "menu_enemy_155", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD8 (216)
	{"btl_un_switch", NULL, "menu_enemy_156", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xD9 (217)
	{"btl_un_testnpc", NULL, "menu_enemy_157", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xDA (218)
	{"btl_un_bomzou", "btl_hlp_bomzou", "menu_enemy_158", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xDB (219)
	{"btl_un_system", NULL, "menu_enemy_159", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xDC (220)
	{"btl_un_christine", NULL, "menu_enemy_162", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xDD (221)
	{"btl_un_mario", "btl_hlp_mario", "menu_enemy_160", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xDE (222)
	{"btl_un_koura", NULL, "menu_enemy_161", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xDF (223)
	{"btl_un_christine", NULL, "menu_enemy_162", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE0 (224)
	{"btl_un_nokotarou", NULL, "menu_enemy_163", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE1 (225)
	{"btl_un_yoshi", NULL, "menu_enemy_164", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE2 (226)
	{"btl_un_clauda", NULL, "menu_enemy_165", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE3 (227)
	{"btl_un_vivian", "btl_hlp_vivian_party", "menu_enemy_166", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE4 (228)
	{"btl_un_sanders", NULL, "menu_enemy_167", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE5 (229)
	{"btl_un_chuchurina", NULL, "menu_enemy_168", "c_kuribo", "KUR_Z_2", "KUR_Z_2"}, //0xE6 (230)
};

BattleUnitType same_tbl_rampell_1[] = {
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_2[] = {
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_1[] = {
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_2[] = {
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_3[] = {
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_4[] = {
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_5[] = {
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_6[] = {
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_7[] = {
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_8[] = {
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_9[] = {
	kUnitDooplissChapter8Bobbery,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8MsMowz,
	kNullUnitKind
};

BattleUnitType same_tbl_rampell_faker_10[] = {
	kUnitDooplissChapter8MsMowz,
	kUnitDooplissChapter4Fight1,
	kUnitDooplissChapter8,
	kUnitDooplissChapter4Fight2,
	kUnitDooplissChapter4Invincible,
	kUnitDooplissChapter8Mario,
	kUnitDooplissChapter8Goombella,
	kUnitDooplissChapter8Koops,
	kUnitDooplissChapter8Yoshi,
	kUnitDooplissChapter8Flurrie,
	kUnitDooplissChapter8Vivian,
	kUnitDooplissChapter8Bobbery,
	kNullUnitKind
};

BattleUnitType* battle_monosiri_same_tbl[] = {
	same_tbl_gesso,
	same_tbl_gesso_arm_l,
	same_tbl_gesso_arm_r,
	same_tbl_rampell_1,
	same_tbl_rampell_2,
	same_tbl_rampell_faker_1,
	same_tbl_rampell_faker_2,
	same_tbl_rampell_faker_3,
	same_tbl_rampell_faker_4,
	same_tbl_rampell_faker_5,
	same_tbl_rampell_faker_6,
	same_tbl_rampell_faker_7,
	same_tbl_rampell_faker_8,
	same_tbl_rampell_faker_9,
	same_tbl_rampell_faker_10,
	same_tbl_majolyne_1,
	same_tbl_majolyne_2,
	same_tbl_majolyne_3,
	same_tbl_majolyne_4,
	same_tbl_marilyn_1,
	same_tbl_marilyn_2,
	same_tbl_marilyn_3,
	same_tbl_marilyn_4,
	same_tbl_vivian_1,
	same_tbl_vivian_2,
	same_tbl_koopa_1,
	same_tbl_koopa_2,
	same_tbl_kamec,
	same_tbl_kamec_bunshin,
	same_tbl_black_peach,
	same_tbl_kamec_red,
	same_tbl_kamec_red_bunshin,
	same_tbl_kamec_white,
	same_tbl_kamec_white_bunshin,
	same_tbl_kamec_green,
	same_tbl_kamec_green_bunshin,
	same_tbl_super_mahorn,
	same_tbl_super_mahorn_bunshin,
	same_tbl_mahorn_custom,
	same_tbl_mahorn_custom_bunshin,
	same_tbl_kuriboo,
	same_tbl_chorobon,
	same_tbl_gundan_zako,
	same_tbl_cortez,
	same_tbl_magunum_battender,
	same_tbl_magunum_battender_mkii,
	same_tbl_moamoa,
	same_tbl_iron_sinemon
};

TattleEntry* battleGetUnitMonosiriPtr(s32 id) {
	return &monosiriMessageTable[id];
}

BOOL battleCheckUnitMonosiriFlag(BattleWorkUnit* unit) { //needs stmw, swGet | fix
	BattleWork* wp = _battleWorkPointer;
	BattleUnitType kind = unit->currentKind;
	u32 flag;
	if (wp->mBadgeEquippedFlags & 2) {
		return TRUE;
	}
	flag = swGet(kind + 0x117A) | (wp->mTattledUnitTypeFlags[kind / 32] & (1 << (kind % 32)));
	if (unit->mFlags & 4) {
		kind = unit->mInitialKind;
		flag |= wp->mTattledUnitTypeFlags[kind / 32] & (1 << (kind % 32));
	}
	if (flag) //TODO: should be able to permute to != 0 like swGet
		return TRUE;
	else
		return FALSE;
}

void battleSetUnitMonosiriFlag(BattleUnitType kind) { //very non-matching, TODO permute
	BattleWork* wp = _battleWorkPointer;
	BattleUnitType** table;
	int i, j, k;

	table = battle_monosiri_same_tbl;
	i = 0;
	while (table[i]) { //check main table hasn't run out of entries
		j = 0;
		while (table[i][j]) { //check this table hasn't run out of IDs
			if (kind == table[i][j]) { //found the type in a group
				k = 0;
				while (table[i][k]) { //write bits for all entries
					swSet(table[i][k] + 0x117A);
					wp->mTattledUnitTypeFlags[table[i][k] / 32] |= 1 << (table[i][k] % 32);
					k++;
				}
				return;
			}
			j++;
		}
		i++;
	}
	//no group found, just write the single bit
	swSet(kind + 0x117A);
	wp->mTattledUnitTypeFlags[kind / 32] |= 1 << (kind % 32);
}
