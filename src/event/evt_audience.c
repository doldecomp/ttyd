#include "evt/evt_audience.h"
#include "battle/battle_audience.h"
#include "system.h"
#include <math.h>

//s32* mask
USERFUNC_DEF(evt_audience_base_flag_on) {
	BattleAudience* audience;
	s32 mask;

	mask = evtGetValue(event, *event->args);
	audience = BattleAudienceBaseGetPtr();
	audience->flags |= mask;
	return EVT_RETURN_DONE;
}

//s32* memberId, s32* flags, s32 retIndex
USERFUNC_DEF(evt_audience_flag_check) {
	s32* args = event->args;
	s32 id, flags;

	id = evtGetValue(event, args[0]);
	flags = evtGetValue(event, args[1]);
	if (BattleAudienceGetPtr(id)->flags & flags) {
		evtSetValue(event, args[2], TRUE);
	}
	else {
		evtSetValue(event, args[2], FALSE);
	}
	return EVT_RETURN_DONE;
}

//s32* memberId, s32* flags
USERFUNC_DEF(evt_audience_flag_on) {
	s32* args = event->args;
	s32 id, flags;

	id = evtGetValue(event, args[0]);
	flags = evtGetValue(event, args[1]);
	BattleAudienceGetPtr(id)->flags |= flags;
	return EVT_RETURN_DONE;
}

//s32* memberId, s32* flags
USERFUNC_DEF(evt_audience_flag_off) {
	s32* args = event->args;
	s32 id, flags;

	id = evtGetValue(event, args[0]);
	flags = evtGetValue(event, args[1]);
	BattleAudienceGetPtr(id)->flags &= ~flags;
	return EVT_RETURN_DONE;
}

//s32* memberId, f32* x, f32* y, f32* z
USERFUNC_DEF(evt_audience_set_position) {
	s32* args = event->args;
	f32 x, y, z;
	s32 id;

	id = evtGetValue(event, args[0]);
	x = evtGetFloat(event, args[1]);
	y = evtGetFloat(event, args[2]);
	z = evtGetFloat(event, args[3]);
	BattleAudience_SetPosition(id, x, y, z);
	return EVT_RETURN_DONE;
}

//s32* memberId, s32 retX, s32 retY, s32 retZ
USERFUNC_DEF(evt_audience_get_position) {
	BattleAudienceMember* member;
	s32* args = event->args;
	s32 id;

	id = evtGetValue(event, args[0]);
	member = BattleAudienceGetPtr(id);
	evtSetFloat(event, args[1], member->position.x);
	evtSetFloat(event, args[2], member->position.y);
	evtSetFloat(event, args[3], member->position.z);
	return EVT_RETURN_DONE;
}

//s32* memberId, f32* x, f32* y, f32* z
USERFUNC_DEF(evt_audience_set_rotate) {
	s32* args = event->args;
	f32 x, y, z;
	s32 id;

	id = evtGetValue(event, args[0]);
	x = evtGetFloat(event, args[1]);
	y = evtGetFloat(event, args[2]);
	z = evtGetFloat(event, args[3]);
	BattleAudience_SetRotate(id, x, y, z);
	return EVT_RETURN_DONE;
}

//s32* memberId, f32* x, f32* y, f32* z
USERFUNC_DEF(evt_audience_set_rotate_offset) {
	s32* args = event->args;
	f32 x, y, z;
	s32 id;

	id = evtGetValue(event, args[0]);
	x = evtGetFloat(event, args[1]);
	y = evtGetFloat(event, args[2]);
	z = evtGetFloat(event, args[3]);
	BattleAudience_SetRotateOffset(id, x, y, z);
	return EVT_RETURN_DONE;
}

//s32* memberId, f32* targetX, f32* targetY, f32* targetZ, s32* interpMode, s32* numFrames
USERFUNC_DEF(evt_audience_move_position_frame) {
	s32* args = event->args;
	f32 targetX, targetY, targetZ;
	BattleAudienceMember* member;
	s32 id, mode, frames;
	f32 compare, x, y, z;

	id = evtGetValue(event, args[0]);
	targetX = evtGetFloat(event, args[1]);
	targetY = evtGetFloat(event, args[2]);
	targetZ = evtGetFloat(event, args[3]);
	mode = evtGetValue(event, args[4]);
	frames = evtGetValue(event, args[5]);
	member = BattleAudienceGetPtr(id);
	if (isFirstCall) {
		member->startPosX = member->position.x;
		member->startPosY = member->position.y;
		member->startPosZ = member->position.z;
		member->targetPosX = targetX;
		member->targetPosY = targetY;
		member->targetPosZ = targetZ;
		member->interpType = mode;
		member->interpFramesLeft = frames;
		member->interpFramesTotal = frames;
	}
	compare = member->targetPosX - member->startPosX;
	if (compare <= 0.0f) {
		if (compare < 0.0f) {
			member->field_0xE8 = 0.0f;
		}
	}
	else {
		member->field_0xE8 = 180.0f;
	}
	x = intplGetValue(
		member->interpType,
		member->interpFramesTotal - member->interpFramesLeft,
		member->interpFramesTotal,
		member->startPosX,
		member->targetPosX);
	y = intplGetValue(
		member->interpType,
		member->interpFramesTotal - member->interpFramesLeft,
		member->interpFramesTotal,
		member->startPosY,
		member->targetPosY);
	z = intplGetValue(
		member->interpType,
		member->interpFramesTotal - member->interpFramesLeft,
		member->interpFramesTotal,
		member->startPosZ,
		member->targetPosZ);
	BattleAudience_SetPosition(id, x, y, z);
	if (--member->interpFramesLeft > 0) {
		return EVT_RETURN_BLOCK;
	}
	else {
		BattleAudience_SetPosition(id, member->targetPosX, member->targetPosY, member->targetPosZ);
		return EVT_RETURN_DONE;
	}
}

//s32* memberId, f32* targetX, f32* targetY, f32* targetZ, f32* interpSpeed
USERFUNC_DEF(evt_audience_move_position_speed) {
	s32* args = event->args;
	BattleAudienceMember* member;
	f32 targetX, targetY, targetZ;
	f32 amountX, amountY, amountZ;
	f32 speed, delta, compare;
	s32 id, frames;

	id = evtGetValue(event, args[0]);
	targetX = evtGetFloat(event, args[1]);
	targetY = evtGetFloat(event, args[2]);
	targetZ = evtGetFloat(event, args[3]);
	speed = evtGetFloat(event, args[4]);
	member = BattleAudienceGetPtr(id);
	if (isFirstCall) {
		member->targetPosX = targetX;
		member->targetPosY = targetY;
		member->targetPosZ = targetZ;
		amountX = targetX - member->position.x;
		amountY = targetY - member->position.y;
		amountZ = targetZ - member->position.z;
		delta = (f32)sqrt((amountX * amountX) + (amountY * amountY) + (amountZ * amountZ));

		frames = (s32)(delta / speed);
		if (amountX == 0.0f) {
			member->interpDelta.x = 0.0f;
		}
		else {
			member->interpDelta.x = speed * (amountX / delta);
		}
		
		if (amountY == 0.0f) {
			member->interpDelta.y = 0.0f;
		}
		else {
			member->interpDelta.y = speed * (amountY / delta);
		}
		
		if (amountZ == 0.0f) {
			member->interpDelta.z = 0.0f;
		}
		else {
			member->interpDelta.z = speed * (amountZ / delta);
		}
		member->interpFramesLeft = frames;
		member->interpFramesTotal = frames;
	}

	compare = member->interpDelta.x;
	if (compare <= 0.0f) {
		if (compare < 0.0f) {
			member->field_0xE8 = 0.0f;
		}
	}
	else {
		member->field_0xE8 = 180.0f;
	}

	BattleAudience_SetPosition(
		id,
		member->position.x + member->interpDelta.x,
		member->position.y + member->interpDelta.y,
		member->position.z + member->interpDelta.z);

	if (member->interpFramesLeft > 0) {
		member->interpFramesLeft--;
	}
	if (member->interpFramesLeft < 0) {
		member->interpFramesLeft++;
	}

	if (member->interpFramesLeft) {
		return EVT_RETURN_BLOCK;
	}
	else {
		BattleAudience_SetPosition(id, member->targetPosX, member->targetPosY, member->targetPosZ);
		return EVT_RETURN_DONE;
	}
}

//s32* memberId, f32* targetX, f32* targetY, f32* targetZ, s32* numFrames, f32* deltaY
USERFUNC_DEF(evt_audience_jump_position_firstsp) {
	s32* args = event->args;
	BattleAudienceMember* member;
	f32 targetX, targetY, targetZ;
	f32 amountX, amountY, amountZ;
	f32 deltaY;
	s32 id, frames;

	id = evtGetValue(event, args[0]);
	targetX = evtGetFloat(event, args[1]);
	targetY = evtGetFloat(event, args[2]);
	targetZ = evtGetFloat(event, args[3]);
	frames = evtGetValue(event, args[4]);
	deltaY = evtGetFloat(event, args[5]);
	member = BattleAudienceGetPtr(id);
	if (isFirstCall) {
		amountX = (targetX - member->position.x) / (f32)frames;
		amountY = targetY - member->position.y;
		amountZ = targetZ - member->position.z;
		member->targetPosX = targetX;
		member->targetPosY = targetY;
		member->targetPosZ = targetZ;
		member->interpDelta.x = amountX;
		member->interpDelta.y = deltaY;
		member->interpDelta.z = amountZ / (f32)frames;
		member->interpGravity = (2.0f * -((deltaY * (f32)frames) - amountY)) / (f32)(frames * frames);
		member->interpFramesLeft = frames;
		member->interpFramesTotal = frames;
	}

	BattleAudience_SetPosition(
		id,
		member->position.x + member->interpDelta.x,
		member->position.y + member->interpDelta.y,
		member->position.z + member->interpDelta.z);

	member->interpDelta.y += member->interpGravity;
	if (--member->interpFramesLeft > 0) {
		return EVT_RETURN_BLOCK;
	}
	else {
		BattleAudience_SetPosition(id, member->targetPosX, member->targetPosY, member->targetPosZ);
		return EVT_RETURN_DONE;
	}
}

//s32* memberId, f32* targetX, f32* targetY, f32* targetZ, s32* numFrames, f32* gravity
USERFUNC_DEF(evt_audience_jump_position_gravity) {
	s32* args = event->args;
	BattleAudienceMember* member;
	f32 targetX, targetY, targetZ;
	f32 amountX, amountY, amountZ;
	s32 id, frames;
	f32 gravity, deltaY;

	id = evtGetValue(event, args[0]);
	targetX = evtGetFloat(event, args[1]);
	targetY = evtGetFloat(event, args[2]);
	targetZ = evtGetFloat(event, args[3]);
	frames = evtGetValue(event, args[4]);
	gravity = evtGetFloat(event, args[5]);
	member = BattleAudienceGetPtr(id);
	if (isFirstCall) {
		amountX = targetX - member->position.x;
		amountY = (targetY - member->position.y) / (f32)frames;
		amountZ = targetZ - member->position.z;
		deltaY = 0.5f * gravity;
		member->targetPosX = targetX;
		member->targetPosY = targetY;
		member->targetPosZ = targetZ;
		member->interpDelta.x = amountX / (f32)frames;
		member->interpDelta.y = -(deltaY * (f32)frames) - amountY;
		member->interpDelta.z = amountZ / (f32)frames;
		member->interpGravity = gravity;
		member->interpFramesLeft = frames;
		member->interpFramesTotal = frames;
	}

	BattleAudience_SetPosition(
		id,
		member->position.x + member->interpDelta.x,
		member->position.y + member->interpDelta.y,
		member->position.z + member->interpDelta.z);

	member->interpDelta.y += member->interpGravity;
	if (--member->interpFramesLeft > 0) {
		return EVT_RETURN_BLOCK;
	}
	else {
		BattleAudience_SetPosition(id, member->targetPosX, member->targetPosY, member->targetPosZ);
		return EVT_RETURN_DONE;
	}
}

//s32* memberId, s32* animId, BOOL* force
USERFUNC_DEF(evt_audience_set_animpose) {
	s32* args = event->args;
	s32 id, animId;
	BOOL force;

	id = evtGetValue(event, args[0]);
	animId = evtGetValue(event, args[1]);
	force = evtGetValue(event, args[2]);
	BattleAudience_SetAnim(id, animId, force);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_audience_entry) {
	s32* args = event->args;
	AudienceMemberType type;
	s32 id; 

	args = event->args;
	id = evtGetValue(event, args[0]);
	type = (AudienceMemberType)evtGetValue(event, args[1]);
	if (BattleAudience_Entry(id, type, 0)) {
		BattleAudience_SetAnim(id, 1, TRUE);
	}
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_audience_delete) {
	s32 id = evtGetValue(event, *event->args);
	BattleAudience_Delete(id);
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_audience_ap_recovery) {
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_audience_reflesh_natural_all) {
	s32* args = event->args;
	BattleAudienceMember* member;
	s32 chance, i;

	chance = evtGetValue(event, args[0]);
	evtGetValue(event, args[1]); //unused
	evtGetValue(event, args[2]); //unused
	member = BattleAudienceGetPtr(0);
	for (i = 0; i < 200; i++, member++) {
		if (member->flags & 1 && member->status == 13 && member->field_0x4 == 1 && chance > irand(100)) {
			member->field_0x4 = 2;
		}
	}
	return EVT_RETURN_DONE;
}

USERFUNC_DEF(evt_audience_abnormal_natural_all) {
	s32* args = event->args;
	BattleAudienceMember* member;
	s32 chance, i;
	u8 status;

	chance = evtGetValue(event, args[0]);
	evtGetValue(event, args[1]); //unused
	evtGetValue(event, args[2]); //unused
	member = BattleAudienceGetPtr(0);
	for (i = 0; i < 200; i++, member++) {
		if (BattleAudience_GetSysCtrl(i)) {
			status = member->status;
			if ((status <= 3 || status - 4 <= 2 || status == 7) && chance > irand(100)) {
				BattleAudience_ChangeStatus(i, 13);
			}
		}
	}
	return EVT_RETURN_DONE;
}















































