#pragma once

#include <dolphin/types.h>
#include <dolphin/mtx.h>
#include "battle/battle_audience_kind_data.h"
#include "mgr/evtmgr.h"
#include "mgr/filemgr.h"
#include "mario/mario_pouch.h"

#pragma enumsalwaysint off
typedef enum AudienceMemberType {
	AUDIENCE_TOAD, //0x0, 0
	AUDIENCE_XNAUT, //0x1, 1
	AUDIENCE_BOO, //0x2, 2
	AUDIENCE_HAMMER_BRO, //0x3, 3
	AUDIENCE_DULL_BONES, //0x4, 4
	AUDIENCE_SHY_GUY, //0x5, 5
	AUDIENCE_CRAZY_DAYZEE, //0x6, 6
	AUDIENCE_PUNI, //0x7, 7
	AUDIENCE_KOOPA, //0x8, 8
	AUDIENCE_BULKY_BOBOMB, //0x9, 9
	AUDIENCE_GOOMBA, //0xA, 10
	AUDIENCE_PIRANHA_PLANT, //0xB, 11
	AUDIENCE_LUIGI, //0xC, 12
	AUDIENCE_MAX //0xD, 13
} AudienceMemberType;
#pragma enumsalwaysint on

typedef struct StarPowerInfo {
	struct BattleWeapon* mWeapon; //0x0
	f32 mSpAcSuccessMultiplier; //0x4
	s8 mStylishCommandMultiplier; //0x8
	s8 field_0x9; //0x9
	s8 mBingoSlotChance; //0xA
	s8 field_0xB; //0xB
} StarPowerInfo;

typedef struct BattleAudienceMember {
	s32 flags; //0x0
	s32 field_0x4; //0x4
	u8 field_0x8[0x19 - 0x8]; //0x8
	u8 status; //0x19
	u8 field_0x1A; //0x1A
	u8 type; //0x1B, AudienceMemberType
	s16 itemId; //0x1C, -1 is invalid
	u8 field_0x1E[0x20 - 0x1E]; //0x1E
	s32** animTable; //0x20, set in BattleAudience_Entry_Sub
	u8 field_0x24[0x48 - 0x24]; //0x24
	Vec position; //0x48
	u8 field_0x54[0x9C - 0x54]; //0x54
	Vec mRotation; //0x9C
	Vec mRotationOffset; //0xA8
	Vec mHomePosition; //0xB4
	u8 field_0xC0[0xE8 - 0xC0]; //0xC0
	f32 field_0xE8; //0xE8
	u8 field_0xEC[0xF8 - 0xEC]; //0xEC
	s32 interpFramesLeft; //0xF8
	s32 interpFramesTotal; //0xFC
	f32 startPosX; //0x100
	f32 targetPosX; //0x104
	f32 startPosY; //0x108
	f32 targetPosY; //0x10C
	f32 startPosZ; //0x110
	f32 targetPosZ; //0x114
	Vec interpDelta; //0x118
	f32 interpGravity; //0x124
	s32 interpType; //0x128
	s32 field_0x12C; //0x12C, some counter
	u8 field_0x130[0x134 - 0x130]; //0x130
} BattleAudienceMember;

typedef struct BattleAudienceItem {
	u32 flags; //0x0
	s32 state; //0x4
	u8 field_0x8[0x10 - 0x8]; //0x8
	ItemType mItemType; //0x10
	u8 field_0x14[0x48 - 0x14]; //0x14
} BattleAudienceItem;

typedef struct BattleAudienceStar {
	u8 field_0x0[0x60 - 0x0]; //0x0
} BattleAudienceStar;

//TODO: verify variable names
typedef struct BattleAudienceSound {
	u8 field_0x0[0x10 - 0x0]; //0x0
	s32 mFadeoutTime; //0x10
	s32 mForceFadeTimer; //0x14
	s32 mForceFadeLength; //0x18
	u8 mBaseSfxVolume; //0x1C
	u8 mCurrentBaseSfxVolume; //0x1D
	u8 mVolumeMultiplier; //0x1E
	u8 mFadeStartVolumeMultiplier; //0x1F
	u8 mFadeEndVolumeMultiplier; //0x20
	u8 field_0x21[3]; //0x21, TODO verify padding
} BattleAudienceSound;

typedef struct BattleAudienceWindow {
	u8 mActive; //0x0, TODO "bool"?
	u8 field_0x1[0x18 - 0x1]; //0x1
	f32 count; //0x18, number to display for audience count
} BattleAudienceWindow;

typedef struct BattleAudience {
	s32 flags; //0x0
	EventEntry* evt; //0x4
	u8 field_0x8[0xC - 0x8]; //0x8
	FileEntry* normalTex; //0xC
	FileEntry* guestTex[2]; //0x10
	AudienceMemberType guestType[2]; //0x18
	u8 field_0x1A[0x1BC - 0x1A]; //0x1A
	BattleAudienceMember members[200]; //0x1BC
	BattleAudienceItem items[100]; //0xF25C
	BattleAudienceStar starpower[100]; //0x10E7C
	BattleAudienceSound sounds[24]; //0x133FC
	BattleAudienceWindow window; //0x1375C
	f32 mAudienceDeltaMultiplier; //0x13778
	f32 mTargetAudienceCount; //0x1377C
	f32 mAddedAudienceCount; //013780
	s32 mCurrentAudienceIntCount; //0x13784, TODO verify name
	s32 mCurrentAudienceIntCountRight; //0x13788, TODO verify name
	s32 mCurrentAudienceIntCountLeft; //0x1378C, TODO verify name
	s32 mMaxAudience; //0x13790
	u8 field_0x13794[0x137C8 - 0x13794]; //0x13794
	StarPowerInfo* impendingBonuses; //0x137C8
	s32 crowdPleasedStreak; //0x137CC
	s32 crowdDispleasedStreak; //0x137D0
	s32 mNumStylishCommandsThisAttack; //0x137D4
	u8 field_0x137D8[0x137DC - 0x137D8]; //0x137D8
	s32 mCheckPhaseReactionState; //0x137DC, TODO: rename
	u8 field_0x137E0[0x138BC - 0x137E0]; //0x137E0
	s32 mItemOnMemberId; //0x138BC, TODO better name
	Vec mItemOnMemberPos; //0x138C0, TODO better name?
	u8 field_0x138CC[0x13908 - 0x138CC]; //0x138CC
	s32 mTurnEndPhaseEventChance; //0x13908, TODO verify name
	u8 field_0x1390C[0x13910 - 0x1390C]; //0x1390C
	BOOL excited; //0x13910, if toads are cheering
} BattleAudience;

BattleAudience* BattleAudienceBaseGetPtr(void);
BattleAudienceMember* BattleAudienceGetPtr(s32 id);
BattleAudienceItem* BattleAudienceItemGetPtr(s32 id);
BattleAudienceWindow* BattleAudienceWinGetPtr(void);
BattleAudienceSound* BattleAudienceSoundGetPtr(s32 id);
void BattleAudience_Init(void);
void BattleAudience_Main(void);
void BattleAudience_ActInit(void);
void BattleAudience_PerAct(void);
BOOL BattleAudience_CheckReaction(void);
void BattleAudience_PerPhase(u32 value);
BOOL BattleAudience_CheckReactionPerPhase(void);
void BattleAudience_Disp(void);
void BattleAudience_End(void);
BOOL BattleAudience_Entry(s32 index, AudienceMemberType type, u8 status);
void BattleAudience_Delete(s32 index);
void BattleAudience_SetAnim(s32 id, s32 animId, BOOL force);
void BattleAudience_GetPosition(s32 index, f32* x, f32* y, f32* z);
void BattleAudience_GetHomePosition(s32 index, f32* x, f32* y, f32* z);
void BattleAudience_GetRotate(s32 index, f32* x, f32* y, f32* z);
void BattleAudience_SetPosition(s32 index, f32 x, f32 y, f32 z);
void BattleAudience_SetRotate(s32 index, f32 x, f32 y, f32 z);
void BattleAudience_SetRotateOffset(s32 index, f32 x, f32 y, f32 z);
void BattleAudience_GetItemOn(s32* memberId, f32* x, f32* y, f32* z, ItemType* itemType);
void BattleAudience_GetItemOn2(s32* memberId, f32* x, f32* y, f32* z, ItemType* itemType);
void BattleAudience_SetTarget(s32 index);
void BattleAudience_Attack(s32 index);
void BattleAudience_ChangeStatus(s32 index, s32 status);
BOOL BattleAudience_GetExist(s32 id);
BOOL BattleAudience_GetSysCtrl(s32 index);
BOOL BattleAudience_GetWaiting(s32 index);
s32 BattleAudience_HaitiRandForFallObject(void);
s32 BattleAudience_GetAudienceNum(void);





