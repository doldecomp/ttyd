#pragma once

#include "mario/mario.h"
#include <dolphin/types.h>

#pragma enumsalwaysint off
typedef enum PartyMember {
    PARTY_NONE, //0
    PARTY_GOOMBELLA, //1
    PARTY_KOOPS, //2
    PARTY_BOBBERY, //3
    PARTY_YOSHI, //4
    PARTY_FLURRIE, //5
    PARTY_VIVIAN, //6
    PARTY_MS_MOWZ, //7
    PARTY_EGG, //8
    PARTY_FLAVIO, //9
    PARTY_PUNIO, //10
    PARTY_FRANKLY, //11
    PARTY_GUS, //12
    PARTY_GOOMBELLA_FOLLOWER, //13
    PARTY_KOOPS_FOLLOWER, //14
    PARTY_BOBBERY_FOLLOWER, //15
    PARTY_YOSHI_FOLLOWER, //16
    PARTY_FLURRIE_FOLLOWER, //17
    PARTY_VIVIAN_FOLLOWER, //18
    PARTY_MS_MOWZ_FOLLOWER //19
} PartyMember;
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
