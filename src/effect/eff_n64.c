#include "eff/eff_n64.h"
#include "driver/arcdrv.h"
#include "mgr/dvdmgr.h"
#include "memory.h"
#include "system.h"
#include <string.h>

//.data
eff_set eff_set_n64[] = {
	{0, "expbom_n64"},
	{1, "kemuri1_n64"},
	{2, "kemuri2_n64"},
	{3, "kemuri3_n64"},
	{4, "kemuri4_n64"},
	{5, "kemuri5_n64"},
	{6, "kemuri6_n64"},
	{7, "kemuri7_n64"},
	{8, "flower_n64"},
	{9, "snow_n64"},
	{10, "sstar_n64"},
	{11, "stardust_n64"},
	{12, "magic1_n64"},
	{13, "@Pymagic2_n64@Pw"},
	{14, "fall_leaf_n64"},
	{15, "hokori_n64"},
	{16, "gareki_n64"},
	{17, "kemuri8_n64"},
	{18, "small_star_n64"},
	{19, "bomb_n64"},
	{20, "wangflush_n64"},
	{21, "magic3_n64"},
	{22, "kemuri9_n64"},
	{23, "kemuri10_n64"},
	{24, "@Pyfire_n64@Pw"},
	{25, "rappa_n64"},
	{26, "stardust2_n64"},
	{27, "ripple_n64"},
	{28, "@Pyexplosion_n64@Pw"},
	{29, "kemuri11_n64"},
	{30, "onpu_n64"},
	{31, "kemuri12_n64"},
	{32, "sweat_n64"},
	{33, "balloon_n64"},
	{34, "cool_leaf_n64"},
	{35, "bush_n64"},
	{36, "rothammer_success_n64"},
	{37, "rothammer_fail_n64"},
	{38, "guruguru_n64"},
	{39, "ice_n64"},
	{40, "stamp_n64"},
	{41, "@Pythruhammer_n64@Pw"},
	{42, "radiation_n64"},
	{43, "thunder_n64"},
	{44, "breath_fire_n64"},
	{45, "broken_barrier_n64"},
	{46, "fire_ring_n64"},
	{47, "fire_dust_n64"},
	{48, "@Pyflame_n64@Pw"},
	{49, "blow_n64"},
	{50, "bomhei_n64"},
	{51, "fireflower_n64"},
	{52, "recover_heart_n64"},
	{53, "pturn_n64"},
	{54, "hit_n64"},
	{55, "confetti_n64"},
	{56, "snowfall_n64"},
	{57, "whirlwind_n64"},
	{58, "thunderflare_n64"},
	{59, "coin_n64"},
	{60, "shock_n64"},
	{61, "balloon_heiho_n64"},
	{62, "rubble_n64"},
	{63, "magic_horao_n64"},
	{64, "lensflare_n64"},
	{65, "crystal_n64"},
	{66, "butterfly_n64"},
	{67, "akari_charge_n64"},
	{68, "akaro_sflush_n64"},
	{69, "opuku_wgun_n64"},
	{70, "opuku_wprotect_n64"},
	{71, "opuku_wcurtain_n64"},
	{72, "opuku_jetw_n64"},
	{73, "opuku_jetwrain_n64"},
	{74, "pokopi_thunder_n64"},
	{75, "water_damage_n64"},
	{76, "snowman_n64"},
	{77, "holography_n64"},
	{78, "timestamp_n64"},
	{79, "packn_bfire_n64"},
	{80, "pokopi_pipo_n64"},
	{81, "cloud_n64"},
	{82, "dogabon_attack_n64"},
	{83, "kameki_tornade_n64"},
	{84, "stone_smoke_n64"},
	{85, "pokopi_pcharge_n64"},
	{86, "hagetaka_flush_n64"},
	{87, "kumokumo_n64"},
	{88, "vapor_n64"},
	{89, "fire_spark_n64"},
	{90, "horao_spell_n64"},
	{91, "snow_dust_n64"},
	{92, "akari_pose_n64"},
	{93, "kumokumo_chip_n64"},
	{94, "fireworks_n64"},
	{95, "glass_n64"},
	{96, "booboo_n64"},
	{97, "pikkyolo_n64"},
	{98, "freeze_n64"},
	{99, "sunlight_n64"},
	{100, "release_n64"},
	{101, "peach_dust_n64"},
	{102, "star_power_n64"},
	{-1, NULL}
};

u32 _rand_table[] = {
	0x100B2AF5, 0x45B59924, 0x35094B45, 0x4ABFA67A,
	0x164F5371, 0x7B195845, 0x58562A56, 0x25733D41,
	0x48008107, 0x0E004F28, 0x6963B8AD, 0x5B82AB71,
	0x6BC1F51B, 0x3D947816, 0x39705175, 0x44409A59,
	0x0ED99067, 0x5F70B6F8, 0x3225AEEE, 0x08B5E97C,
	0x2CDE7594, 0x5E9E5B7D, 0x5B2A2888, 0x107F0F50,
	0x58FBC53B, 0x65F69F19, 0x3AF6CEF3, 0x15C3894F,
	0x4C931A2C, 0x39A897E9, 0x5945BB8C, 0x5C9E4521,
	0x7F5E310D, 0x0E4F06D2, 0x275DEB9C, 0x15AD847F,
	0x09685F17, 0x7FB415F2, 0x3B20C1C0, 0x5168E01E,
	0x0DB4651A, 0x24847A6D, 0x2CEB8B8F, 0x79765A35,
	0x6218F283, 0x665BDD04, 0x3DB6F48F, 0x70F282EB,
	0x45CC93FC, 0x6FDCA37D, 0x79A86C67, 0x72AB0990,
	0x4E7AFEFA, 0x54D294F0, 0x032A18E0, 0x2776C435,
	0x3AC93409, 0x3E20E7D4, 0x3D3A4D85, 0x075C4E35,
	0x77C97FBD, 0x16800911, 0x63FA9357, 0x7727B0CB,
	0x24CF0FE3, 0x0B587EF3, 0x0CD5354A, 0x2E376EFA,
	0x0B0C94E5, 0x47F5F70A, 0x7FA04F19, 0x18C0FA00,
	0x6C7A7178, 0x2C8BDAA8, 0x12375435, 0x4E9363FB,
	0x12E7B7AD, 0x4FEE48C4, 0x3F85E6E6, 0x58B44BA9,
	0x3FCAEC41, 0x392E534E, 0x4B5F553A, 0x0E45EB3C,
	0x0E00E83E, 0x4E896E1A, 0x35BCAF71, 0x48CA1C47,
	0x0CAA55EE, 0x72F6FCF6, 0x50266A7D, 0x0473D5AC,
	0x09770608, 0x3420FDD4, 0x7B9B8677, 0x2E4615EB,
	0x3F797CC7, 0x0870BBC1, 0x5C7D84E6, 0x4A8611AC,
	0x5066B2CB, 0x5C1DD3FF, 0x63470BAC, 0x3CE12443,
	0x08A9AEA7, 0x757E5FE2, 0x0B74883F, 0x1B916654,
	0x456CA8A6, 0x4AFA6F25, 0x7445B1FE, 0x053794E8,
	0x0428C273, 0x3FA50738, 0x137D8024, 0x1229AAB1,
	0x0E2E7552, 0x493A2F95, 0x5AF3C6F9, 0x1AD8CB41,
	0x3C312C8C, 0x2B1A3176, 0x1F4CA0ED, 0x45A83294,
	0x5F3B2F4A, 0x1AE82764, 0x73EE487F, 0x1EB4AC11
};

//.sbss
static eff_n64_work work;

//.sdata
static eff_n64_work* wp = &work;
static u8 dummy; //TODO: make sure it aligns to 8 bytes

extern int sprintf(char* str, const char* format, ...);

//local prototypes
static void _callback_tpl(s32 error, DVDFileInfo* info);

static void _callback_tpl(s32 error, DVDFileInfo* info) {
	DVDEntry* entry;

	entry = (DVDEntry*)info->cb.userData;
	UnpackTexPalette(wp->effTexture);
	DVDMgrClose(entry);
	wp->effTextureLoaded = TRUE;
}

void effInit64(void) {
	memset(wp, 0, sizeof(eff_n64_work));
	wp->effTextureLoaded = FALSE;
}

void effTexSetupN64(void) {
	DVDEntry* entry;
	char path[128];
	u32 length;

	wp->effTexture = NULL;
	wp->effTextureLoaded = FALSE;
	wp->effTexture = (TPLHeader*)arcOpen("effect_n64.tpl", 0, 0);
	if (wp->effTexture) {
		UnpackTexPalette(wp->effTexture);
		wp->effTextureLoaded = TRUE;
	}
	else {
		sprintf(path, "%s/e/jp/effect_n64.tpl", getMarioStDvdRoot());
		entry = DVDMgrOpen(path, 2, 0);
		length = OSRoundUp32B(DVDMgrGetLength(entry));
		wp->effTexture = (TPLHeader*)__memAlloc(HEAP_DEFAULT, length);
		entry->info.cb.userData = entry;
		DVDMgrReadAsync(entry, wp->effTexture, length, 0, _callback_tpl);
	}
}

void effGetTexObjN64(u32 id, GXTexObj* obj) {
	if (wp->effTextureLoaded) {
		TEXGetGXTexObjFromPalette(wp->effTexture, obj, id);
	} else {
		GXInitTexObj(obj, &dummy, 1, 1, GX_TF_I4, GX_CLAMP, GX_CLAMP, GX_FALSE);
	}
}

eff_set* effGetSetN64(const char* name) {
	int i = 0;

	while (eff_set_n64[i].id != -1) {
		if (!strcmp(eff_set_n64[i].name, name)) {
			return &eff_set_n64[i];
		}
	}
	return NULL;
}

//TODO: finish
u32 effTblRandN64(u32 rand, s32 index) {
	/*u32 rand2 = _rand_table[index % 128];
	return rand2 - (rand2 / (rand + 1)) * (rand + 1);*/
	return 0;
}

//TODO: re-type array
void effSetVtxDescN64(effVtxArray* array) {
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_INDEX16);
	GXSetVtxDesc(GX_VA_CLR0, GX_INDEX16);
	GXSetVtxDesc(GX_VA_TEX0, GX_INDEX16);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_S16, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_CLR0, GX_CLR_RGBA, GX_RGBA8, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_S16, 5);
	GXSetArray(GX_VA_POS, array->pos, 0xEu);
	GXSetArray(GX_VA_CLR0, array->clr0, 0xEu);
	GXSetArray(GX_VA_TEX0, array->tex0, 0xEu);
}

void tri1(u16 x, u16 y, u16 z) {
	GXWGFifo.u16 = x;
	GXWGFifo.u16 = x;
	GXWGFifo.u16 = x;
	GXWGFifo.u16 = y;
	GXWGFifo.u16 = y;
	GXWGFifo.u16 = y;
	GXWGFifo.u16 = z;
	GXWGFifo.u16 = z;
	GXWGFifo.u16 = z;
}

/*
void tri2(u16 x1, u16 y1, u16 z1, u16 x2, u16 y2, u16 z2) {
	GXWGFifo.u16 = x1;
	GXWGFifo.u16 = x1;
	GXWGFifo.u16 = x1;
	GXWGFifo.u16 = y1;
	GXWGFifo.u16 = y1;
	GXWGFifo.u16 = y1;
	GXWGFifo.u16 = z1;
	GXWGFifo.u16 = z1;
	GXWGFifo.u16 = z1;
	GXWGFifo.u16 = x2;
	GXWGFifo.u16 = x2;
	GXWGFifo.u16 = x2;
	GXWGFifo.u16 = y2;
	GXWGFifo.u16 = y2;
	GXWGFifo.u16 = y2;
	GXWGFifo.u16 = z2;
	GXWGFifo.u16 = z2;
	GXWGFifo.u16 = z2;
}
*/
