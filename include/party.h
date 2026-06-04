#pragma once

#include "mario/mario.h"
#include <dolphin/types.h>

#pragma enumsalwaysint off
typedef enum PartyMember {
    PARTY_MEMBER_NONE, //0
    PARTY_MEMBER_GOOMBELLA, //1
    PARTY_MEMBER_KOOPS, //2
    PARTY_MEMBER_BOBBERY, //3
    PARTY_MEMBER_YOSHI, //4
    PARTY_MEMBER_FLURRIE, //5
    PARTY_MEMBER_VIVIAN, //6
    PARTY_MEMBER_MS_MOWZ, //7
    PARTY_MEMBER_EGG, //8
    PARTY_MEMBER_FLAVIO, //9
    PARTY_MEMBER_PUNIO, //10
    PARTY_MEMBER_FRANKLY, //11
    PARTY_MEMBER_CRAW, //12
    PARTY_MEMBER_GOOMBELLA_FOLLOWER, //13
    PARTY_MEMBER_KOOPS_FOLLOWER, //14
    PARTY_MEMBER_BOBBERY_FOLLOWER, //15
    PARTY_MEMBER_YOSHI_FOLLOWER, //16
    PARTY_MEMBER_FLURRIE_FOLLOWER, //17
    PARTY_MEMBER_VIVIAN_FOLLOWER, //18
    PARTY_MEMBER_MS_MOWZ_FOLLOWER //19
} PartyMember;
#pragma enumsalwaysint on

#pragma enumsalwaysint off
typedef enum PartyFlags {
    PARTY_FLAG_IS_ACTIVE = (1 << 0),
    PARTY_FLAG_IS_GROUNDED = (1 << 1),
    PARTY_FLAG_IS_FOLLOWER = (1 << 2),
    PARTY_FLAG_IS_PARTNER = (1 << 3),
    PARTY_FLAG_IS_JUMPING = (1 << 4),
    PARTY_FLAG_IS_FALLING = (1 << 5),
    PARTY_FLAG_IS_STEPPING = (1 << 6),
    PARTY_FLAG_IN_SHALLOW_WATER = (1 << 7),
    PARTY_FLAG_IS_BEING_USED = (1 << 8),
    PARTY_FLAG_PAPER_MODE = (1 << 12),
    PARTY_FLAG_MOT_SLIT_FLOOR = (1 << 13),
    PARTY_FLAG_IS_RIDING_PLANE = (1 << 16),
    PARTY_FLAG_IS_RIDING_SHIP = (1 << 17),
    PARTY_FLAG_IS_BEHIND_MARIO = (1 << 19),
    PARTY_FLAG_SLEEP_ON = (1 << 22),
    PARTY_FLAG_BG_MODE = (1 << 23),
    PARTY_FLAG_DISABLE_FRONT_WALL_CHK = (1 << 24),
    PARTY_FLAG_FORCE_FALL = (1 << 25),
    PARTY_FLAG_DISABLE_FLOORS = (1 << 26),
    PARTY_FLAG_RUN_OFF = (1 << 28),
    PARTY_FLAG_CTRL_OFF = (1 << 29),
    PARTY_FLAG_CTRL_OFF_2 = (1 << 30),
    PARTY_FLAG_IS_EVT_USE = (1 << 31)
} PartyFlags;
#pragma enumsalwaysint on

#pragma enumsalwaysint off
typedef enum PartySlotId {
    PARTY_SLOT_PARTY = 0, //0x0
    PARTY_SLOT_FOLLOWER = 1, //0x1
    PARTY_SLOT_NONE = -1
} PartySlotId;
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
	u8 field_0x32[0x39 - 0x32]; //0x32
    u8 useMotionId; //0x39
    u8 field_0x3A[0x58 - 0x3A]; //0x3A
    Vec position; //0x58
    u8 field_0x3a[0x160 - 0x64]; //0x64
	MarioWork* playerPtr; //0x160
	s32 camId; //0x164
    s32 yoshiPsndSFXId	; //0x168
    s32 unk16C; //0x16C
    void* useStruct; //0x170
	u8 field_0x168[0x188 - 0x174]; //0x174
} PartyEntry;

PartyEntry* partyGetPtr(s32 id);
PartyEntry* anotherPartyGetPtr(s32 id);
BOOL partyPaperOn(PartyEntry* entry, char* anim);











s32 partyEntry2(s32 memberId);
