#pragma once

#include "mario/mario.h"
#include <dolphin/types.h>

#pragma enumsalwaysint off
typedef enum PartyMembers {
	kPartyNone, //0x0
	kPartyGoombella, //0x1
	kPartyKoops, //0x2
	kPartyBobbery, //0x3
	kPartyYoshi, //0x4
	kPartyFlurrie, //0x5
	kPartyVivian, //0x6
	kPartyMsMowz, //0x7
	kPartyEgg, //0x8
	kPartyFlavio, //0x9
	kPartyPunio, //0xA
	kPartyFrankly, //0xB
	kPartyGus, //0xC
	kPartyGoombellaFollower, //0xD
	kPartyKoopsFollower, //0xE
	kPartyBobberyFollower, //0xF
	kPartyYoshiFollower, //0x10
	kPartyFlurrieFollower, //0x11
	kPartyVivianFollower, //0x12
	kPartyMsMowzFollower //0x13
} PartyMembers;
#pragma enumsalwaysint on

typedef struct PartyEntry {
	u32 flags; //0x0
	u32 flags2; //0x4
	u32 field_0x8; //0x8
	s32 field_0xC; //0xC, poseGroup? poseId2?
	s32 field_0x10; //0x10
	s32 field_0x14; //0x14, TODO paperPoseId?
	u8 field_0x18[0x2F - 0x18]; //0x18
	s8 currentSlotId; //0x2F
	u8 field_0x30; //0x30
	s8 currentMemberId; //0x31, PartyMembers
	u8 field_0x32[0x160 - 0x32]; //0x32
	MarioWork* playerPtr; //0x160
	s32 camId; //0x164
	u8 field_0x168[0x188 - 0x168]; //0x168
} PartyEntry;

PartyEntry* partyGetPtr(s32 id);
PartyEntry* anotherPartyGetPtr(s32 id);
BOOL partyPaperOn(PartyEntry* entry, char* anim);











s32 partyEntry2(s32 memberId);