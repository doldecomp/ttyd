#include "battle/battle_audience.h"
#include "battle/battle.h"
#include "driver/dispdrv.h"
#include "mario/mario_pouch.h"
#include "system.h"
#include <string.h>


#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))

extern BattleWork* _battleWorkPointer;
extern int sprintf(char* str, const char* format, ...);

//local prototypes
FileEntry* tplRead(const char* path);
BOOL check_exe_phase_evt_status(s32 index, AudienceMemberType type);
void BattleAudienceSettingAudience(void);
void BattleAudienceGuestTPLRead(s32 index, AudienceMemberType member, const char* tplName);
void BattleAudienceCtrlProcess(void);
BOOL BattleAudienceItemOn(s32 index, u16 itemId, s32 numItems);
void BattleAudienceSetThrowItemMax(void);
BattleWorkUnit* BattleAudienceDetectTargetAll(void);
BattleWorkUnit* BattleAudienceDetectTargetPlayer(void);
void BattleAudienceItemCtrlProcess(void);
void BattleAudienceApSrcCtrlProcess(void);
BOOL BattleAudienceApSrcEntry(void);
void BattleAudienceWinCtrlProcess(void);
void BattleAudienceGXInit(void);
void BattleAudienceAnimProcess(void);
void BattleAudienceDispAudience(CameraId camId, void* param);
void BattleAudienceDispItem(CameraId camId, void* param);
void BattleAudienceDispApSrc(CameraId camId, void* param);
void BattleAudienceDispWin(CameraId camId, void* param);
void BattleAudience_Entry_Sub(s32 index, u8 type, u8 status);
BOOL BattleAudience_GetAnimEnd(s32 index);
BOOL BattleAudience_GetFront(s32 index);
BOOL BattleAudience_GetEscapeChangeOK(s32 index);
s32 BattleAudience_GetAudienceNoFromOffset(s32 index, s32 column, s32 row);
s32 BattleAudience_NoUsedHaitiRand(void);
s32 BattleAudience_NoUsedFCHaitiRand(void);
s32 BattleAudience_GetPPAudienceNum(void);
s32 BattleAudience_GetPPAudienceNumKind(u8 type);
s32 BattleAudience_GetPPAudienceNum_R(void);
s32 BattleAudience_GetPPAudienceNum_L(void);
s32 BattleAudience_GetPPAudienceNum_RL_Sub(s32 offset);
BOOL BattleAudience_GetPPAudienceNum_Sub(s32 id);










void BattleAudienceAddTargetNumSub(f32 value);


void BattleAudienceSoundNoiseAlways(void);
void BattleAudienceSoundSetVol(s32 index, u8 a2, s32 a3);
void BattleAudienceNumToTarget(void);
void BattleAudience_WinSetActive(u8 active);

void BattleAudienceSoundMain(void);


FileEntry* tplRead(const char* path) {
	return fileAllocf(4, "%s/%s", getMarioStDvdRoot(), path);
}

BattleAudience* BattleAudienceBaseGetPtr(void) {
	return &_battleWorkPointer->audience;
}

BattleAudienceMember* BattleAudienceGetPtr(s32 id) {
	return &BattleAudienceBaseGetPtr()->members[id];
}

BattleAudienceItem* BattleAudienceItemGetPtr(s32 id) {
	return &BattleAudienceBaseGetPtr()->items[id];
}

BattleAudienceWindow* BattleAudienceWinGetPtr(void) {
	return &BattleAudienceBaseGetPtr()->window;
}

BattleAudienceSound* BattleAudienceSoundGetPtr(s32 id) {
	return &BattleAudienceBaseGetPtr()->sounds[id];
}

void BattleAudience_Init(void) {
	BattleAudience* audience;
	BattleAudienceWindow* window;
	int i, j, index;
	u8 status;

	audience = BattleAudienceBaseGetPtr();
	window = BattleAudienceWinGetPtr();
	pouchGetPtr(); //useless call
	memset(audience, 0, sizeof(BattleAudience));
	BattleAudienceSettingAudience();
	audience->normalTex = tplRead("battle/audience/audience_normal.tpl");
	BattleAudienceGuestTPLRead(0, AUDIENCE_LUIGI, "audience_luigi.tpl");
	BattleAudienceSetThrowItemMax();

	audience->mTurnEndPhaseEventChance = 0;

	audience->mCurrentAudienceIntCountLeft = 0;
	audience->mCurrentAudienceIntCountRight = 0;
	audience->mCurrentAudienceIntCount = 0;

	for (i = 0; i < 10; i++) {
		for (j = 0; j < 10; j++) {
			index = (i * 20) + j + 10;
			if ((u8)BattleAudience_GetExist(index)) { //TODO: u8 needed?
				status = BattleAudienceGetPtr(index)->status;
				if (status != 12 && status != 11) { //TODO: add status enum
					audience->mCurrentAudienceIntCountRight++;
				}
			}
		}
	}

	for (i = 0; i < 10; i++) {
		for (j = 0; j < 10; j++) {
			index = (i * 20) + j;
			if ((u8)BattleAudience_GetExist(index)) { //TODO: u8 needed?
				status = BattleAudienceGetPtr(index)->status;
				if (status != 12 && status != 11) { //TODO: add status enum
					audience->mCurrentAudienceIntCountLeft++;
				}
			}
		}
	}

	audience->mCurrentAudienceIntCount = audience->mCurrentAudienceIntCountRight + audience->mCurrentAudienceIntCountLeft;
	window->count = (f32)audience->mCurrentAudienceIntCount;
	BattleAudienceSoundNoiseAlways();
	BattleAudienceSoundSetVol(2, 60, 180);
	audience->excited = FALSE;
	BattleAudienceNumToTarget();
}

void BattleAudience_Main(void) {
	BattleWork* wp = _battleWorkPointer;
	BattleAudience* audience = BattleAudienceBaseGetPtr();

	if (!(audience->flags & 0x10000) && wp->flags & 0x80) {
		BattleAudience_WinSetActive(1);
	}
	BattleAudienceCtrlProcess();
	BattleAudienceItemCtrlProcess();
	BattleAudienceApSrcCtrlProcess();
	BattleAudienceWinCtrlProcess();
	BattleAudienceSoundMain();
	if (wp->flags & 0x80) {
		audience->flags |= 0x10000;
	}
	else {
		audience->flags &= ~0x10000;
	}
}

void BattleAudience_ActInit(void) {
	BattleAudience* audience = BattleAudienceBaseGetPtr();
	audience->mNumStylishCommandsThisAttack = 0;
	audience->flags &= ~0x10;
	audience->flags &= ~0x20;
	audience->flags &= ~0x40;
	audience->flags &= ~0x80;
	audience->flags &= ~0x100;
	audience->flags &= ~0x200;
	audience->flags &= ~0x400;
	audience->flags &= ~0x800;
	audience->flags &= ~0x1000;
}

void BattleAudience_PerAct(void) {
	BattleAudience* audience = BattleAudienceBaseGetPtr();
	pouchGetPtr();
	//TODO: finish
}

BOOL BattleAudience_CheckReaction(void) {
	BattleAudience* audience;
	EventEntry* evt;

	audience = BattleAudienceBaseGetPtr();
	BattleAudienceGetPtr(0); //unused
	evt = audience->evt;
	if (evt && evtCheckID(evt->eventId)) {
		return TRUE;
	}
	audience->evt = NULL;
	return FALSE;
}

BOOL check_exe_phase_evt_status(s32 index, AudienceMemberType type) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	if (!BattleAudience_GetSysCtrl(index)) {
		return FALSE;
	}
	if (member->type != type) {
		return FALSE;
	}
	switch (member->status) { //TODO: check if switch, might be IDA
		case 13:
			return FALSE;
		case 12:
			return FALSE;
		case 11:
			return FALSE;
		case 21:
			return FALSE;
		case 22:
			return FALSE;
		default:
			return (member->flags >> 3) & 1;
	}
}

//TODO: re-type "value" for btlseq "states"
void BattleAudience_PerPhase(u32 value) {
	BattleAudience* audience;
	BattleAudienceMember* member;
	s32 i, itemId;

	audience = BattleAudienceBaseGetPtr();
	if (value == 0x4000002 && !(audience->flags & 0x40000)) {
		for (i = 0; i < 200; i++) {
			member = BattleAudienceGetPtr(i);
			if (BattleAudience_GetExist(i) && member->status == 7) {
				itemId = member->itemId;
				if (itemId != -1) {
					BattleAudienceItemGetPtr(itemId)->flags = 0;
				}
				member->itemId = -1;
				BattleAudience_ChangeStatus(i, 0);
			}
		}
		for (i = 0; i < 100; i++) {
			if (BattleAudienceItemGetPtr(i)->state <= 1) {
				BattleAudienceItemGetPtr(i)->flags = 0;
			}
		}
	}
	if (value == 0x4000004) {
		BattleAudienceSetThrowItemMax();
		audience->flags |= 8;
		audience->mCheckPhaseReactionState = 0;
	}
}

//TODO: add evt support and then uncomment message scripts
BOOL BattleAudience_CheckReactionPerPhase(void) {
	BattleAudience* audience;
	BattleAudienceMember* member;
	s32 counter, i;

	audience = BattleAudienceBaseGetPtr();
	pouchGetPtr();
	if (!(audience->flags & 8)) {
		return FALSE;
	}
	switch (audience->mCheckPhaseReactionState) {
		case 0:
			audience->mCheckPhaseReactionState = 5;
			if (audience->flags & 0x40000) {
				audience->mCheckPhaseReactionState = 15;
				return TRUE;
			}
			//no break
		case 5:
			for (counter = 0, i = 0; i < 200; i++) {
				member = BattleAudienceGetPtr(i);
				if (BattleAudience_GetSysCtrl(i) && member->type == AUDIENCE_BULKY_BOBOMB &&
						member->status == 18 && --member->field_0x12C <= 0) {
					BattleAudience_ChangeStatus(i, 19);
					counter++;
				}
			}
			if (counter < 1) {
				audience->mCheckPhaseReactionState = 7;
			}
			else {
				audience->mCheckPhaseReactionState = 6;
			}
			//no break
		case 6:
		case 7:
			for (i = 0; i < 200; i++) {
				member = BattleAudienceGetPtr(i);
				if (BattleAudience_GetSysCtrl(i) && member->type == AUDIENCE_BULKY_BOBOMB &&
						member->status == 19) {
					break;
				}
			}
			if (i == 200) { //didn't meet that condition
				if (audience->mCheckPhaseReactionState == 6) {
					audience->mCheckPhaseReactionState = 8;
				}
				else {
					audience->mCheckPhaseReactionState = 13;
				}
			}
			return TRUE;
		case 8:
			//audience->evt = evtEntry(&msg_heavy_bomb_fire, 0, 0x20);
			audience->mCheckPhaseReactionState = 9;
			return TRUE;
		case 9:
			if (!evtCheckID(audience->evt->eventId)) {
				audience->evt = NULL;
				audience->mCheckPhaseReactionState = 10;
			}
			return TRUE;
		case 10:
			if (audience->flags & 0x8000) {
				//audience->evt = evtEntry(&msg_puni_all_escape, 0, 0x20);
				audience->flags &= ~0x8000;
				audience->mCheckPhaseReactionState = 11;
			}
			else {
				audience->mCheckPhaseReactionState = 15;
			}
			return TRUE;
		case 11:
			if (!evtCheckID(audience->evt->eventId)) {
				audience->evt = NULL;
				audience->mCheckPhaseReactionState = 15;
			}
			return TRUE;












	}




	return FALSE; //TODO: finish, a lot
}

void BattleAudience_Disp(void) {
	BattleAudienceBaseGetPtr();
	BattleAudienceAnimProcess();
	if (!(BattleAudienceBaseGetPtr()->flags & 0x20000)) {
		dispEntry(CAMERA_3D, 1, BattleAudienceDispAudience, NULL, 0.0f);
		dispEntry(CAMERA_3D, 2, BattleAudienceDispAudience, NULL, 0.0f);
		dispEntry(CAMERA_3D, 1, BattleAudienceDispItem, NULL, 0.0f);
		dispEntry(CAMERA_2D, 0, BattleAudienceDispApSrc, NULL, 499.0f);
	}
	if (pouchGetPtr()->mStarPowersObtained) {
		dispEntry(CAMERA_2D, 1, BattleAudienceDispWin, NULL, 499.0f);
	}
}

void BattleAudience_End(void) {
	BattleAudience* audience;
	FileEntry* obj;
	int i;

	audience = BattleAudienceBaseGetPtr();
	for (i = 0; i < 2; i++) {
		obj = audience->guestTex[i];
		if (obj) {
			fileFree(obj);
		}
	}

	obj = audience->normalTex;
	if (obj) {
		fileFree(obj);
	}

	if (pouchGetPtr()->mStarPowersObtained) {
		if (audience->mTargetAudienceCount < 0.0f) {
			audience->mTargetAudienceCount = 0.0f;
		}
		if (audience->mTargetAudienceCount > (f32)audience->mMaxAudience) {
			audience->mTargetAudienceCount = (f32)audience->mMaxAudience;
		}
		pouchSetAudienceNum(audience->mTargetAudienceCount);
	}
}

void BattleAudienceSettingAudience(void) {
	//TODO: very long and terrible
}

void BattleAudienceGuestTPLRead(s32 id, AudienceMemberType member, const char* path) {
	char full_path[256];

	BattleAudience* audience = BattleAudienceBaseGetPtr();
	if (id < 2) {
		sprintf(full_path, "battle/audience/%s", path);
		audience->guestTex[id] = tplRead(full_path);
		audience->guestType[id] = member;
	}
}

void BattleAudienceCtrlProcess(void) {
	//TODO: very long and terrible
}

BOOL BattleAudienceItemOn(s32 index, u16 itemId, s32 numItems) {
	return FALSE;
}

void BattleAudienceSetThrowItemMax(void) {

}

BattleWorkUnit* BattleAudienceDetectTargetAll(void) {
	return NULL;
}

BattleWorkUnit* BattleAudienceDetectTargetPlayer(void) {
	return NULL;
}

void BattleAudienceItemCtrlProcess(void) {

}

void BattleAudienceApSrcCtrlProcess(void) {

}

BOOL BattleAudienceApSrcEntry(void) {
	return FALSE;
}

void BattleAudienceWinCtrlProcess(void) {

}

void BattleAudienceGXInit(void) {

}

void BattleAudienceAnimProcess(void) {

}

void BattleAudienceDispAudience(CameraId camId, void* param) {

}

void BattleAudienceDispItem(CameraId camId, void* param) {

}

void BattleAudienceDispApSrc(CameraId camId, void* param) {

}

void BattleAudienceDispWin(CameraId camId, void* param) {

}

BOOL BattleAudience_Entry(s32 index, AudienceMemberType type, u8 status) {
	return FALSE;
}

void BattleAudience_Entry_Sub(s32 index, u8 type, u8 status) {

}

void BattleAudience_Delete(s32 index) {

}

void BattleAudience_SetAnim(s32 id, s32 animId, BOOL force) {

}

BOOL BattleAudience_GetAnimEnd(s32 index) {
	return FALSE;
}

void BattleAudience_GetPosition(s32 index, f32* x, f32* y, f32* z) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	*x = member->position.x;
	*y = member->position.y;
	*z = member->position.z;
}

void BattleAudience_GetHomePosition(s32 index, f32* x, f32* y, f32* z) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	*x = member->mHomePosition.x;
	*y = member->mHomePosition.y;
	*z = member->mHomePosition.z;
}

void BattleAudience_GetRotate(s32 index, f32* x, f32* y, f32* z) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	*x = member->mRotation.x;
	*y = member->mRotation.y;
	*z = member->mRotation.z;
}

void BattleAudience_SetPosition(s32 index, f32 x, f32 y, f32 z) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	member->position.x = x;
	member->position.y = y;
	member->position.z = z;
}

void BattleAudience_SetRotate(s32 index, f32 x, f32 y, f32 z) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	member->mRotation.x = x;
	member->mRotation.y = y;
	member->mRotation.z = z;
}

void BattleAudience_SetRotateOffset(s32 index, f32 x, f32 y, f32 z) {
	BattleAudienceMember* member;

	member = BattleAudienceGetPtr(index);
	member->mRotationOffset.x = x;
	member->mRotationOffset.y = y;
	member->mRotationOffset.z = z;
}

void BattleAudience_GetItemOn(s32* memberId, f32* x, f32* y, f32* z, ItemType* itemType) {
	BattleAudience* audience;
	BattleAudienceMember* member;
	BattleAudienceItem* item;
	int i;

	audience = BattleAudienceBaseGetPtr();
	for (i = 0; i < 200; i++) {
		member = BattleAudienceGetPtr(i); //TODO: get (0) out of loop and ++?
		//TODO: invert this to multiple break; checks?
		if ((member->flags & 1) && !(member->flags & 0x100) && !(member->flags & 2)) {
			if (member->itemId != -1) {
				item = BattleAudienceItemGetPtr(member->itemId);
				if (item->state <= 4 || item->state == 7) {
					break; //TODO: better way to handle this compare?
				}
				if (memberId) {
					audience->mItemOnMemberId = i;
					*memberId = i;
				}
				audience->mItemOnMemberPos.x = member->position.x;
				audience->mItemOnMemberPos.y = member->position.y;
				audience->mItemOnMemberPos.z = member->position.z + 3.0f;

				if (x) {
					*x = audience->mItemOnMemberPos.x;
				}
				if (y) {
					*y = audience->mItemOnMemberPos.y;
				}
				if (z) {
					*z = audience->mItemOnMemberPos.z;
				}

				if (itemType) {
					if (member->itemId >= 0) {
						*itemType = audience->items[member->itemId].mItemType;
					}
					else {
						*itemType = ITEM_NULL;
					}
				}
				//has to pass the 4 checks up top, otherwise we keep looking at all 200 members
				return;
			}
		}
	}
}

//might be inlined, 1 above has additional assignments
void BattleAudience_GetItemOn2(s32* memberId, f32* x, f32* y, f32* z, ItemType* itemType) {
	BattleAudience* audience;
	BattleAudienceMember* member;

	audience = BattleAudienceBaseGetPtr();
	member = BattleAudienceGetPtr(audience->mItemOnMemberId);
	if (memberId) {
		*memberId = audience->mItemOnMemberId;
	}

	if (x) {
		*x = audience->mItemOnMemberPos.x;
	}
	if (y) {
		*y = audience->mItemOnMemberPos.y;
	}
	if (z) {
		*z = audience->mItemOnMemberPos.z;
	}

	if (itemType) {
		if (member->itemId >= 0) {
			*itemType = audience->items[member->itemId].mItemType;
		}
		else {
			*itemType = ITEM_NULL;
		}
	}
}

void BattleAudience_SetTarget(s32 index) {

}

void BattleAudience_Attack(s32 index) {

}

BOOL BattleAudience_GetFront(s32 index) {
	return FALSE;
}

void BattleAudience_ChangeStatus(s32 index, s32 status) {

}
//breaks -inline auto,deferred
/*
BOOL BattleAudience_GetExist(s32 id) {
	return FALSE;
}
*/

BOOL BattleAudience_GetSysCtrl(s32 index) {
	return FALSE;
}

BOOL BattleAudience_GetWaiting(s32 index) {
	return FALSE;
}

BOOL BattleAudience_GetEscapeChangeOK(s32 index) {
	return FALSE;
}

s32 BattleAudience_GetAudienceNoFromOffset(s32 index, s32 column, s32 row) {
	s32 audienceNo;

	BattleAudience* audience = BattleAudienceBaseGetPtr();
	BattleAudienceMember* member = BattleAudienceGetPtr(index);
	if (index % 20 + column < 0 || index % 20 + column >= 20) {
		return -1;
	}

	audienceNo = column + (index - (row * 20));
	if (audienceNo < 0 || audienceNo >= 200) {
		return -1;
	}
	return audienceNo;
}

s32 BattleAudience_HaitiRandForFallObject(void) {
	return 0;
}

s32 BattleAudience_NoUsedHaitiRand(void) {
	return 0;
}

s32 BattleAudience_NoUsedFCHaitiRand(void) {
	return 0;
}

s32 BattleAudience_GetAudienceNum(void) {
	return BattleAudienceBaseGetPtr()->mCurrentAudienceIntCount;
}

s32 BattleAudience_GetPPAudienceNum(void) {
	return 0;
}

s32 BattleAudience_GetPPAudienceNumKind(u8 type) {
	return 0;
}

s32 BattleAudience_GetPPAudienceNum_R(void) {
	return BattleAudience_GetPPAudienceNum_RL_Sub(10);
}

s32 BattleAudience_GetPPAudienceNum_L(void) {
	return BattleAudience_GetPPAudienceNum_RL_Sub(0);
}

s32 BattleAudience_GetPPAudienceNum_RL_Sub(s32 offset) {
	BattleAudience* audience = BattleAudienceBaseGetPtr(); //unused
	s32 i, j, index, count = 0;

	for (i = 0; i < 10; i++) {
		for (j = 0; j < 10; j++) {
			index = ((i * 20) + offset) + j;
			if (BattleAudience_GetPPAudienceNum_Sub(index)) {
				count++;
			}
		}
	}
	return count;
}

BOOL BattleAudience_GetPPAudienceNum_Sub(s32 id) {
	BattleAudienceMember* member = BattleAudienceGetPtr(id);

	if (!BattleAudience_GetExist(id)) {
		return FALSE;
	}

	if (13 <= member->status <= 13) {
		return FALSE;
	}

	if (member->status == 17) {
		return FALSE;
	}

	return member->status != 12;
}































































//1:1
void BattleAudienceAddTargetNumSub(f32 value) {
	f32 subtract;
	s32 skew;

	BattleAudience* audience = BattleAudienceBaseGetPtr();
	while (1) {
		if (value == 0.0f) return;
		if (value > 0.0f) { //positive
			subtract = min(value, 1.0f);
			value -= subtract;
			if (value < 0.0f) {
				value = 0.0f;
			}
		}
		if (value < 0.0f) { //negative
			subtract = max(value, -1.0f);
			value -= subtract;
			if (value > 0.0f) {
				value = 0.0f;
			}
		}
		if (subtract > 0.0f) {
			skew = (s32)(((audience->mTargetAudienceCount / audience->mAudienceDeltaMultiplier) - 1.0f) / 0.25f);
			if (skew <= 1) {
				audience->mTargetAudienceCount += subtract / (skew + 1);
				continue;
			}
		}
		if (subtract < 0.0f) {
			skew = (s32)(((audience->mTargetAudienceCount / audience->mAudienceDeltaMultiplier) - 1.0f) / 0.25f);
			if (skew <= -1) {
				audience->mTargetAudienceCount -= subtract / (skew - 1);
				continue;
			}
		}
		audience->mTargetAudienceCount += subtract;
	}
}














void BattleAudienceSoundMain(void) {

}


void BattleAudienceSoundNoiseAlways(void) {

}

void BattleAudienceSoundSetVol(s32 index, u8 a2, s32 a3) {
	BattleAudienceSound* sound;

	sound = BattleAudienceSoundGetPtr(index);
	sound->mFadeStartVolumeMultiplier = sound->mVolumeMultiplier;
	sound->mFadeEndVolumeMultiplier = a2;
	sound->mForceFadeTimer = 0;
	sound->mForceFadeLength = a3;
	sound->mFadeoutTime = 0;
}

void BattleAudienceNumToTarget(void) {

}

void BattleAudience_WinSetActive(u8 active) {
	BattleAudienceWinGetPtr()->mActive = active;
}
