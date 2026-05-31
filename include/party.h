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

#pragma enumsalwaysint off
typedef enum PartyFlags {
    kIsActive = 0x1,
    kIsGrounded = 0x2,
    kIsFollower = 0x4,
    kIsPartner = 0x8,
    kIsJumping = 0x10,
    kIsFalling = 0x20,
    kIsStepping = 0x40,
    kInShallowWater = 0x80,
    kIsBeingUsed = 0x100,
    kPaperMode = 0x1000,
    kMotSlitFloor = 0x2000,
    kIsRidingPlane = 0x10000,
    kIsRidingShip = 0x20000,
    kIsBehindMario = 0x80000,
    kSleepOn = 0x400000,
    kBgMode = 0x800000,
    kDisableFrontWallChk = 0x1000000,
    kForceFall = 0x2000000,
    kDisableFloors = 0x4000000,
    kRunOff = 0x10000000,
    kCtrlOff = 0x20000000,
    kCtrlOff2 = 0x40000000,
    kIsEvtUse = 0x80000000
} PartyFlags;
#pragma enumsalwaysint on

#pragma enumsalwaysint off
typedef enum PartySlotId {
    kParty, //0x0
    kFollower, //0x1
    kNone = 0xFFFFFFFF
} PartySlotId;
#pragma enumsalwaysint on

typedef struct UseStruct {
    u32 unk0; //0x0
    f32 unk4; //0x4
    f32 unk8; //0x8
    u8 field_0x8[0x18 - 0xC]; //0xC
} UseStruct;

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
	u8 field_0x32[0x39 - 0x32]; //0x32
    u8 useMotionId; //0x39
    u8 field_0x3a[0x160 - 0x3a];
	MarioWork* playerPtr; //0x160
	s32 camId; //0x164
    s32 yoshiPsndSFXId	; //0x168
    s32 unk16C; //0x16C
    UseStruct* useStruct; //0x170
	u8 field_0x168[0x188 - 0x174]; //0x174
} PartyEntry;

PartyEntry* partyGetPtr(s32 id);
PartyEntry* anotherPartyGetPtr(s32 id);
BOOL partyPaperOn(PartyEntry* entry, char* anim);











s32 partyEntry2(s32 memberId);
