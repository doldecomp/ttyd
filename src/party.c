#include "party.h"

PartyEntry* partyPtrTbl[2];

PartyEntry* partyGetPtr(s32 id) {
	if (id >= 0) {
		return partyPtrTbl[id];
	}
	return NULL;
}

PartyEntry* anotherPartyGetPtr(s32 id) {
	if (id < 0) {
		return NULL;
	}
	return *(partyPtrTbl + ((id + 1) & 1));
}

/*
//.data
typedef struct PartyData {
	char* name; //0, TODO: modelname? animname?
	void* init_func; //1
	void* move_func; //2
	void* use_func; //3
	void* post_func; //4
	void* bye_func; //5
	void* unk_6_func; //6
	void* unk_7_func; //7
	void* unk_8_func; //8
	void* exit_func; //9
} PartyData;

PartyData partyDataTbl[] = { //change to [20]
	{"c_pkr", kuribo_init, partyMoveWalk, kuribo_use, kuribo_use_post, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_pnk", nokonoko_init, nokonoko_move, nokonoko_use, nokonoko_use_post, nokonoko_bye, NULL, NULL, NULL, NULL},
	{"c_bomt_n", bomhei_init, partyMoveWalk, bomhei_use, bomhei_use_post, bomhei_bye, NULL, NULL, NULL, bomhei_exit},
	{"c_babyyoshi", yoshi_init, partyMoveWalk, yoshi_use, NULL, yoshi_bye, NULL, NULL, NULL, yoshi_exit},
	{"c_windy", cloud_init, cloud_move, cloud_use, NULL, kuribo_bye, NULL, NULL, NULL, cloud_exit},
	{"c_vivian", vivian_init, vivian_move, vivian_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_tyutyu", chuchu_init, chuchu_move, chuchu_use, NULL, kuribo_bye, NULL, NULL, NULL, chuchu_exit},
	{"c_babyyoshi", kuribo_init, partyMoveWalk, kuribo_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_marco", kuribo_init, partyMoveWalk, kuribo_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_pguide", kuribo_init, partyMoveWalk, kuribo_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_kuri_h", kuribo_init, partyMoveWalk, kuribo_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_monban", kuribo_init, partyMoveWalk, kuribo_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_pkr", kuribo_init, partyMoveWalk, kuribo_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_pnk", nokonoko_init, nokonoko_move, nokonoko_use, NULL, nokonoko_bye, NULL, NULL, NULL, NULL},
	{"c_bomt_n", bomhei_init, partyMoveWalk, bomhei_use, bomhei_use_post, bomhei_bye, NULL, NULL, NULL, NULL},
	{"c_babyyoshi", yoshi_init, partyMoveWalk, yoshi_use, NULL, yoshi_bye, NULL, NULL, NULL, NULL},
	{"c_windy", cloud_init, cloud_move, cloud_use, NULL, kuribo_bye, NULL, NULL, NULL, cloud_exit},
	{"c_vivian", vivian_init, vivian_move, vivian_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL},
	{"c_tyutyu", chuchu_init, partyMoveWalk, chuchu_use, NULL, kuribo_bye, NULL, NULL, NULL, NULL}
	{NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL},
};

char* partyPoseTbl[20][15] = {
	{NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL},
	{"PKR_Z_1", "PKR_S_1", "PKR_W_1", "PKR_R_1", "PKR_J_1A", "PKR_J_1B", "PKR_N_1", "PKR_T_1", "PKR_D_1", "PKR_D_4", "PKR_S_1", "PKR_S_1", "PKR_D_2", "PKR_W_2", "PKR_R_2"},
	{"PNK_Z_1", "PNK_S_1", "PNK_W_1", "PNK_R_1", "PNK_J_1A", "PNK_J_1B", "PNK_N_1", "PNK_T_1", "PNK_D_1", "PNK_D_4", "PNK_S_1", "PNK_S_1", "PNK_D_2", "PNK_W_2", "PNK_R_2"},
	{"Z_1", "S_1", "W_1", "R_1", "J_1A", "J_1B", "N_1", "T_1", "D_1", "F_1", "S_1", "S_1", "D_2", "W_3", "R_3"},
	{"PYS_Z_1", "PYS_S_1", "PYS_W_1", "PYS_R_1", "PYS_J_1A", "PYS_J_1B", "PYS_N_1", "PYS_T_1", "PYS_D_1", "PYS_D_4", "PYS_S_1", "PYS_S_1", "PYS_D_2", "PYS_W_3", "PYS_R_3"},
	{"PWD_Z_1", "PWD_S_1", "PWD_W_1", "PWD_R_1", "PWD_S_1", "PWD_S_1", "PWD_N_1", "PWD_T_1", "PWD_D_1", "PWD_F_1", "PWD_S_1", "PWD_S_1", "PWD_D_2", "PWD_W_2", "PWD_R_2"},
	{"PTR_Z_1", "PTR_S_1", "PTR_W_1", "PTR_R_1", "PTR_S_1", "PTR_S_1", "PTR_N_1", "PTR_T_1", "PTR_D_1", "PTR_F_1", "PTR_Z_1", "PTR_Z_1", "PTR_D_2", "PTR_W_2", "PTR_R_2"},
	{"PCH_Z_1", "PCH_S_1", "PCH_W_1", "PCH_R_1", "PCH_J_1A", "PCH_J_1B", "PCH_N_1", "PCH_T_1", "PCH_D_1", "PCH_F_1", "PCH_S_1", "PCH_S_1", "PCH_D_2", "PCH_R_2", "PCH_W_2"},
	{"PYS_E_1", "PYS_E_2", "PYS_E_3", "PYS_E_3", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_2", "PYS_E_3", "PYS_E_3"},
	{"Z_1", "S_1", "W_1", "R_1", "J_1A", "J_1B", "S_1", "T_1", "D_1", "D_1", "Z_1", "Z_1", "S_1", "W_1", "R_1"},
	{"Z_1", "S_1", "W_1", "R_1", "J_1A", "J_1B", "S_1", "T_1", "Z_1", "Z_1", "S_1", "Z_1", "Z_1", "W_1", "R_1"},
	{"Z_1", "S_1", "W_1", "R_1", "W_1", "W_1", "S_1", "T_1", "Z_1", "Z_1", "S_1", "Z_1", "Z_1", "W_1", "R_1"},
	{"Z_1", "S_1", "W_1", "R_1", "S_1", "S_1", "S_1", "T_1", "S_1", "S_1", "S_1", "S_1", "S_1", "W_1", "R_1"},
	{"PKR_Z_1", "PKR_S_1", "PKR_W_1", "PKR_R_1", "PKR_J_1A", "PKR_J_1B", "PKR_N_1", "PKR_T_1", "PKR_D_1", "PKR_D_4", "PKR_S_1", "PKR_S_1", "PKR_D_2", "PKR_W_2", "PKR_R_2"},
	{"PNK_Z_1", "PNK_S_1", "PNK_W_1", "PNK_R_1", "PNK_J_1A", "PNK_J_1B", "PNK_N_1", "PNK_T_1", "PNK_D_1", "PNK_D_4", "PNK_S_1", "PNK_S_1", "PNK_D_2", "PNK_W_2", "PNK_R_2"},
	{"Z_1", "S_1", "W_1", "R_1", "J_1A", "J_1B", "N_1", "T_1", "D_1", "F_1", "S_1", "S_1", "D_2", "W_3", "R_3"},
	{"PYS_Z_1", "PYS_S_1", "PYS_W_1", "PYS_R_1", "PYS_J_1A", "PYS_J_1B", "PYS_N_1", "PYS_T_1", "PYS_D_1", "PYS_D_4", "PYS_S_1", "PYS_S_1", "PYS_D_2", "PYS_W_2", "PYS_R_2"},
	{"PWD_Z_1", "PWD_S_1", "PWD_W_1", "PWD_R_1", "PWD_S_1", "PWD_S_1", "PWD_N_1", "PWD_T_1", "PWD_D_1", "PWD_F_1", "PWD_S_1", "PWD_S_1", "PWD_D_2", "PWD_W_2", "PWD_R_2"},
	{"PTR_Z_1", "PTR_S_1", "PTR_W_1", "PTR_R_1", "PTR_S_1", "PTR_S_1", "PTR_N_1", "PTR_T_1", "PTR_D_1", "PTR_F_1", "PTR_Z_1", "PTR_Z_1", "PTR_D_2", "PTR_W_2", "PTR_R_2"},
	{"PCH_Z_1", "PCH_S_1", "PCH_W_1", "PCH_R_1", "PCH_J_1A", "PCH_J_1B", "PCH_N_1", "PCH_T_1", "PCH_D_1", "PCH_F_1", "PCH_S_1", "PCH_S_1", "PCH_D_2", "PCH_R_2", "PCH_W_2"}
};

char* partyDotPoseTbl[8][15] = {
	{NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL},
	{"Z_2", "Z_2", "W_2", "R_2", "Z_2", "Z_2", "Z_2", "Z_2", "Z_2", "Z_2", "Z_2", "Z_2", "Z_2", "W_2", "R_2"},
	{"Z_3", "Z_3", "W_3", "R_3", "Z_3", "Z_3", "Z_3", "Z_3", "Z_3", "Z_3", "Z_3", "Z_3", "Z_3", "W_3", "R_3"},
	{"Z_13", "Z_13", "W_13", "R_13", "Z_13", "Z_13", "Z_13", "Z_13", "Z_13", "Z_13", "Z_13", "Z_13", "Z_13", "W_13", "R_13"},
	{"Z_5", "Z_5", "W_5", "R_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "W_5", "R_5"},
	{"Z_4", "Z_4", "W_4", "R_4", "Z_4", "Z_4", "Z_4", "Z_4", "Z_4", "Z_4", "Z_4", "Z_4", "Z_4", "W_4", "R_4"},
	{"Z_12", "Z_12", "W_12", "R_12", "Z_12", "Z_12", "Z_12", "Z_12", "Z_12", "Z_12", "Z_12", "Z_12", "Z_12", "W_12", "R_12"},
	{"Z_14", "Z_14", "W_14", "R_14", "Z_14", "Z_14", "Z_14", "Z_14", "Z_14", "Z_14", "Z_14", "Z_14", "Z_14", "W_14", "R_14"}
};

char* yoshiDotPoseTbl[7][15] = {
	{"Z_5", "Z_5", "W_5", "R_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "Z_5", "W_5", "R_5"},
	{"Z_6", "Z_6", "W_6", "R_6", "Z_6", "Z_6", "Z_6", "Z_6", "Z_6", "Z_6", "Z_6", "Z_6", "Z_6", "W_6", "R_6"},
	{"Z_7", "Z_7", "W_7", "R_7", "Z_7", "Z_7", "Z_7", "Z_7", "Z_7", "Z_7", "Z_7", "Z_7", "Z_7", "W_7", "R_7"},
	{"Z_8", "Z_8", "W_8", "R_8", "Z_8", "Z_8", "Z_8", "Z_8", "Z_8", "Z_8", "Z_8", "Z_8", "Z_8", "W_8", "R_8"},
	{"Z_9", "Z_9", "W_9", "R_9", "Z_9", "Z_9", "Z_9", "Z_9", "Z_9", "Z_9", "Z_9", "Z_9", "Z_9", "W_9", "R_9"},
	{"Z_10", "Z_10", "W_10", "R_10", "Z_10", "Z_10", "Z_10", "Z_10", "Z_10", "Z_10", "Z_10", "Z_10", "Z_10", "W_10", "R_10"},
	{"Z_11", "Z_11", "W_11", "R_11", "Z_11", "Z_11", "Z_11", "Z_11", "Z_11", "Z_11", "Z_11", "Z_11", "Z_11", "W_11", "R_11"}
};

//.sbss
PartyData* party_dp;
PartyEntry* partyPtrTbl[2];

//.sdata
char* yoshigroup[7] = {
	"c_babyyoshi",
	"c_babyyoshi2",
	"c_babyyoshi3",
	"c_babyyoshi4",
	"c_babyyoshi5",
	"c_babyyoshi6",
	"c_babyyoshi7"
};

PartyEntry* partyGetPtr(s32 id) {
	if (id >= 0) {
		return partyPtrTbl[id];
	}
	return NULL;
}

PartyEntry* anotherPartyGetPtr(s32 id) {
	if (id < 0) {
		return NULL;
	}
	else {
		return partyPtrTbl[(id + 1) & 1];
	}
}

BOOL partyPaperOn(PartyEntry* entry, char* anim) {
	BOOL v5, v6;

	if (entry->field_0x14 >= 0) {
		animPaperPoseRelease(entry->field_0x14);
		entry->field_0x14 = -1;
	}
	entry->flags2 |= 0x4000000;
	entry->field_0x14 = animPaperPoseEntry(anim, 2);
	v5 = FALSE;
	if (!strcmp(anim, "p_roll") ||
		!strcmp(anim, "p_plane") ||
		!strcmp(anim, "p_dokan_x") ||
		!strcmp(anim, "p_dokan_y")) {
		v5 = TRUE;
	}
	v6 = !v5;
	if (!strcmp(anim, "p_slit")) {
		v6 = entry->currentMemberId == PARTY_FLURRIE;
	}
	animPoseSetPaperAnimGroup(entry->field_0xC, anim, v6);
	return TRUE;
}







s32 partyEntry2(s32 memberId) {
	PartyEntry* entry;
	MarioWork* player;
	char* animName;
	s32 slotId;

	player = marioGetPtr();
	if (partyPtrTbl[1]) {
		slotId = -1;
	}
	else {
		partyPtrTbl[1] = (PartyEntry*)__memAlloc(HEAP_DEFAULT, sizeof(PartyEntry));
		memset(partyPtrTbl[1], 0, sizeof(PartyEntry));
		slotId = 1;
	}
	if (slotId < 0) {
		return -1;
	}
	entry = partyPtrTbl[slotId];
	memset(entry, 0, sizeof(PartyEntry));
	entry->camId = marioGetCamId();
	entry->field_0xC = -1;
	entry->field_0x10 = -1;
	entry->field_0x14 = -1;
	entry->flags = 9;
	entry->currentSlotId = (s8)slotId; //TODO: re-type?
	entry->currentMemberId = (PartyMember)memberId;
	entry->flags |= 4;
	party_dp = &partyDataTbl[memberId];
	if (entry->currentMemberId == PARTY_YOSHI) {
		animName = yoshigroup[pouchGetPartyColor(PARTNER_YOSHI)];
		if ((entry->flags2 & 0x8000)) {
			animName = "d_mario";
		}
	} else if ((entry->flags2 & 0x8000)) {
		animName = "d_mario";
	}
	else {
		animName = partyDataTbl[memberId].name;
	}
	if (entry->field_0xC >= 0) {
		animPoseRelease(entry->field_0xC);
	}
	entry->field_0xC = animPoseEntry(animName, 2);






	return -1;
}
*/
