#include "mario/mario.h"
#include "driver/animdrv.h"
#include "party/party_vivian.h"
#include <string.h>

//.data
const char* dotMarioPose[4][6] = {
	{"Z_1", "S_1", "W_1", "R_1", "U_1", "J_1"},
	{"Z_15", "S_2", "W_15", "R_15", "U_2", "J_2"},
	{"Z_17", "S_3", "W_17", "R_17", "U_3", "J_3"},
	{"Z_18", "S_4", "W_18", "R_18", "U_4", "J_4"}
};

//.bss
Vec blurPos[8];

//.sbss
MarioWork* mp;

//local prototypes
void marioDispBlurSub(s32* unused, s32 blurId);
const char* toRearPose(const char* name);
const char* toFrontPose(const char* name);

MarioWork* marioGetPtr(void) {
	return mp;
}

s32 marioGetColor(void) {
	return mp->colorId;
}

void marioSetCharMode(s32 mode) {

}

void marioSetFamicomMode(s32 mode) {

}

void marioSetSpec(void) {
	if (mp->characterId == 1) {
		(mp->wPlayerCollisionBox).x = 20.0f;
		(mp->wPlayerCollisionBox).y = 47.0f;
		mp->mBaseWalkSpeed = 1.0f;
		mp->mBaseDashSpeed = 2.0f;
	}
	else if (mp->characterId == 2) {
		mp->mBaseWalkSpeed = 1.0f;
		mp->mBaseDashSpeed = 2.25f;
	}
	else {
		if (mp->flags & 0x2000000) {
			(mp->wPlayerCollisionBox).x = 10.0f;
			(mp->wPlayerCollisionBox).y = 25.9f;
		}
		else {
			(mp->wPlayerCollisionBox).x = 20.0f;
			(mp->wPlayerCollisionBox).y = 37.0f;
		}
		mp->mBaseWalkSpeed = 1.0f;
		mp->mBaseDashSpeed = 2.25f;
	}
}

//TODO: finish
void marioEntry(void) {
	/*
	mp->flags |= 1;
	if (!(mp->dispFlags & 2)) {
		if (!mp->animName || strcmp(mp->animName, "M_S_1")) {

		}
	}
	if (mp->flags & 0x2000000) {
		if (mp->currMotionId == kSlit) {
			mp->flags |= 0x100000;
			marioSlitForceCancel();
		}
	}
	else {
		switch (mp->currMotionId) {
			case kShip:
				marioReInit_ship();
				break;
			case kRoll:
				marioReInit_roll();
				break;
			case kSlit:
				marioReInit_slit();
				break;
			case kYoshi:
				marioRideYoshi();
				break;
			default:
				marioChgMot(kStay);

		}
	}
	*/
}

void marioItemGetDisable(void) {
	mp->flags |= 0x4000;
	mp->field_0x7A = 0x14;
}

void marioItemGetChk(void) {
	MarioWork* work;
	s32 var;

	work = mp;
	var = mp->field_0x7A;
	if (var > 0) {
		var--;
		work->field_0x7A = (s16)var;
		if ((s16)var <= 0) {
			work->field_0x7A = 0;
			mp->flags &= ~0x4000u;
		}
	}
}

BOOL marioItemGetOk(void) {
	return (mp->flags & 0x4000) == 0;
}

BOOL marioCaseEventValidChk(void) {
	if (mp->currMotionId == kPlane) {
		return FALSE;
	}
	else {
		return vivianGetStatus() == 0;
	}
}

BOOL mario8005BB80(void) {
	if (mp->currMotionId == kRoll || mp->flags & 0x100000) {
		return FALSE;
	}
	return TRUE;
}

BOOL marioCheckMenuDisable(void) {
	return TRUE;
}

BOOL marioChkKey(void) {

}

BOOL marioChkCtrl(void) {

}

s32 mario8005B5A8(void) {

}

void marioFBattlePrepare(void) {

}

void marioFBattlePost(void) {

}

s32 marioCtrlOffChk(void) {

}

s32 marioKeyOffChk(void) {

}

s32 marioCtrlOff(void) {

}

s32 marioCtrlOn(void) {

}

s32 marioCtrlOff2(void) {

}

s32 marioCtrlOn2(void) {

}

s32 marioKeyOff(void) {

}

s32 marioKeyOn(void) {

}

s16 marioSetMutekiTime(s32 msec) {

}

BOOL marioBgmodeChk(void) {

}

void marioBgmodeOn(void) {

}

void marioBgmodeOff(void) {

}

BOOL marioChkSts(s32 flags) {

}

void marioResetHitObj(const char* name) {

}

void marioReset(void) {

}

void marioOfsRotReset(void) {

}

void marioSoundInit(void) {

}

void marioPoseInit(void) {

}

void marioInit(void) {

}

void marioReInit(void) {

}

void marioMain(void) {

}

void marioCtrlOff2Main(void) {

}

void marioMove(void) {

}

void marioMoveMain(void) {

}

BOOL marioChkPushAnime(void) {
	MarioWork* wp = mp;
	BOOL valid = FALSE;
	if (!strcmp(wp->animName, "M_O_1") || !strcmp(wp->animName, "M_O_2") || !strcmp(wp->animName, "M_O_2R")) {
		valid = TRUE;
	}
	return valid;
}

s32 marioAnimeId(void) {
	s32 flags = mp->dispFlags;
	if (flags & 0x10000000) {
		return 2;
	}
	else {
		return flags < 0; //TODO: fix
	}
}

void mario80058374(void) {
	MarioWork* wp = mp;
	MarioMotion mot = wp->currMotionId;
	s32 flags;

	if (mot != kShip && mot != kRoll && mot != kPlane && mot != kJabara && mot != kYoshi) {
		flags = wp->dispFlags;
		if (!(flags & 0x1000000)) {
			marioChgPose("M_D_1"); //inline
		}
	}
}

void marioChgEvtPose(const char* name) {
	MarioWork* wp = mp;
	const char* animName;

	if (!(mp->dispFlags & 2) && !(mp->flags & 0x80000000)) {
		animName = mp->animName;
		if (!animName || strcmp(animName, name)) {
			wp->animName = name;
			wp->dispFlags &= ~0x20000000;
			wp->dispFlags |= 0x10000000;
			wp->trigFlags |= 0x1000;
		}
	}
}

const char* toDotMarioPose(const char* name) {
	const char* dot = NULL;

	if (!strcmp("M_Z_1", name)) {
		dot = dotMarioPose[mp->colorId][0];
	}
	if (!strcmp("M_S_1", name)) {
		dot = dotMarioPose[mp->colorId][1];
	}
	if (!strcmp("M_W_1", name)) {
		dot = dotMarioPose[mp->colorId][2];
	}
	if (!strcmp("M_R_1", name)) {
		dot = dotMarioPose[mp->colorId][3];
	}
	if (!strcmp("M_J_1B", name)) {
		dot = dotMarioPose[mp->colorId][5];
	}
	if (!strcmp("M_J_1C", name)) {
		dot = dotMarioPose[mp->colorId][5];
	}

	return dot;
}

void marioChgPose(const char* name) {
	MarioWork* wp = mp;
	const char *animName, *dot;

	if (!(wp->dispFlags & 2)) {
		animName = mp->animName;
		if (!animName || strcmp(animName, name)) {
			if (!(mp->flags & 0x80000000)) { //TODO: flip {}?
				dot = toDotMarioPose(name); //inline, TODO
				if (dot) {
					wp->animName = dot;
					wp->poseTime = 0;
					wp->dispFlags &= ~0x30000000;
					wp->trigFlags |= 0x1000;
				}
			}
			else {
				wp->animName = name;
				wp->poseTime = 0;
				wp->dispFlags &= ~0x30000000;
				wp->trigFlags |= 0x1000;
			}
		}
	}
}

void marioChgPoseTime(const char* name, s16 frames) {
	MarioWork* wp = mp;
	const char* animName;

	if (!(mp->dispFlags & 2) && !(mp->flags & 0x80000000)) {
		animName = mp->animName;
		if (!animName || strcmp(animName, name)) {
			wp->animName = name;
			wp->poseTime = frames;
			wp->dispFlags &= ~0x30000000;
			wp->trigFlags |= 0x1000;
		}
	}
}

void marioChgPaper(const char* name) {
	MarioWork* wp = mp;
	s32 flags = wp->dispFlags;
	const char* animName;

	if (flags & 0x40000000 && !(flags & 2) && !(mp->flags & 0x80000000)) {
		animName = mp->paperAnimName;
		if (!animName || strcmp(animName, name)) { //if different, do stuff
			wp->paperAnimName = name;
			wp->poseTime = 0;
			wp->trigFlags |= 0x4000;
		}
	}
}

void marioSetPaperAnimeLocalTime(s16 frames) { //f32 cast reuse, flags check
	MarioWork* wp = mp;
	s32 group;

	animPoseSetLocalTime(wp->paperPoseId, (f32)frames);
	group = marioAnimeId(); //inlined
	animPoseSetLocalTime(wp->paperAnimGroupId[group], (f32)frames);
}

//TODO: move below marioPaperOff when -inline deferred is on
inline void marioPaperRelease(void) {
	MarioWork* wp = mp;
	s32 poseId;

	poseId = wp->paperPoseId;
	if (poseId >= 0) {
		animPaperPoseRelease(poseId);
		wp->paperPoseId = -1;
	}
}

BOOL marioPaperOn(const char* name) { //almost 1:1, some regalloc
	MarioWork* wp = mp;
	BOOL flag;

	marioPaperRelease();
	wp->dispFlags |= 0x40000000; //paper on
	wp->paperPoseId = animPaperPoseEntry(name, 2);
	flag = FALSE;
	if (   !strcmp(name, "p_roll")
		|| !strcmp(name, "p_plane")
		|| !strcmp(name, "p_hune")
		|| !strcmp(name, "p_jyabara")
		|| !strcmp(name, "p_dokan_x")
		|| !strcmp(name, "p_dokan_y"))
	{
		flag = TRUE;
	}
	animPoseSetPaperAnimGroup(wp->paperAnimGroupId[0], name, !flag);
	return TRUE;
}

void marioPaperOff(void) { //1:1
	MarioWork* wp = mp;

	if (wp->dispFlags & 0x40000000) {
		if (wp->paperAnimName) {
			animPoseSetPaperAnimGroup(mp->paperAnimGroupId[0], NULL, FALSE);
			wp->paperAnimName = 0;
			wp->dispFlags &= ~0x40000000;
			marioPaperRelease();
		}
	}
}

void marioPaperLightOn(void) { //1:1
	animPoseSetMaterialLightFlagOn(mp->paperAnimGroupId[0], 1);
}

void marioPaperLightOff(void) { //1:1
	animPoseSetMaterialLightFlagOff(mp->paperAnimGroupId[0], 1);
}

void marioGetScreenPos(Vec position, f32* x, f32* y, f32* z) { //1:1
	CameraEntry* camera;
	f32 proj[7];
	f32 view[6];

	camera = camGetPtr(CAMERA_3D);
	GXSetProjection(camera->projection, camera->type);
	GXGetProjectionv(proj);
	GXGetViewportv(view);
	GXProject(position.x, position.y, position.z, camera->view, proj, view, x, y, z);
}

BOOL marioChkInScreen(s32 x, s32 y) { //1:1
	BOOL valid = FALSE;
	if (x >= 0 && x <= 600 && y >= 0 && y <= 535) {
		valid = TRUE;
	}
	return valid != FALSE; //why
}

f32 marioGetScale(void) { //1:1
	return mp->flags & 0x2000000 ? 1.2f : 2.0f;
}

void marioMakeDispDir(void) {

}

void marioRearAnime(void) {

}

void marioPreDisp(void) {

}

void marioDispBlurSub(s32* unused, s32 blurId) {

}

void marioDispBlur(CameraId cameraId, void* param) {
	MarioWork* wp = param; //cast to correct type

}

void marioDisp(CameraId cameraId, void* param) {
	MarioWork* wp = param; //cast to correct type
	Mtx mtx1; //TODO: rename
	f32 scale;

	scale = marioGetScale(); //inlined
	MTXScale(mtx1, mp->scale.x * scale, mp->scale.y * scale, mp->scale.z * scale);

}

const char* toRearPose(const char* name) { //1:1
	const char* rear = NULL;
	if (mp->characterId == 1 && !(mp->peachFlags & 0x2000)) {
		if (!strcmp(name, "P_Z_1")) {
			rear = "P_Z_1R";
		}
		else if (!strcmp(name, "P_S_1")) {
			rear = "P_S_1R";
		}
		else if (!strcmp(name, "P_W_1")) {
			rear = "P_W_1R";
		}
		else if (!strcmp(name, "P_R_1")) {
			rear = "P_R_1R";
		}
		else if (!strcmp(name, "P_T_1")) {
			rear = "P_T_1R";
		}
		else if (!strcmp(name, "P_Z_2")) {
			rear = "P_Z_2R";
		}
		else if (!strcmp(name, "P_S_2")) {
			rear = "P_S_2R";
		}
		else if (!strcmp(name, "P_W_2")) {
			rear = "P_W_2R";
		}
		else if (!strcmp(name, "P_R_2")) {
			rear = "P_R_2R";
		}
		else if (!strcmp(name, "P_T_2")) {
			rear = "P_T_2R";
		}
		else if (!strcmp(name, "P_Z_3")) {
			rear = "P_Z_3R";
		}
		else if (!strcmp(name, "P_S_3")) {
			rear = "P_S_3R";
		}
		else if (!strcmp(name, "P_W_3")) {
			rear = "P_W_3R";
		}
		else if (!strcmp(name, "P_R_3")) {
			rear = "P_R_3R";
		}
		else if (!strcmp(name, "P_T_3")) {
			rear = "P_T_3R";
		}
		else if (!strcmp(name, "P_O_Z_1")) {
			rear = "P_O_Z_1R";
		}
		else if (!strcmp(name, "P_O_S_1")) {
			rear = "P_O_S_1R";
		}
		else if (!strcmp(name, "P_O_F_1")) {
			rear = "P_O_F_1R";
		}
		else if (!strcmp(name, "P_O_R_1")) {
			rear = "P_O_R_1R";
		}
		else if (!strcmp(name, "P_O_N_1")) {
			rear = "P_O_N_1R";
		}
		else if (!strcmp(name, "P_O_S_2")) {
			rear = "P_O_S_2R";
		}
		else if (!strcmp(name, "P_O_F_2")) {
			rear = "P_O_F_2R";
		}
		else if (!strcmp(name, "P_O_R_2")) {
			rear = "P_O_R_2R";
		}
		else if (!strcmp(name, "P_O_N_2")) {
			rear = "P_O_N_2R";
		}
		else if (!strcmp(name, "P_O_D_1")) {
			rear = "P_O_D_1R";
		}
		else if (!strcmp(name, "P_O_D_2")) {
			rear = "P_O_D_2R";
		}
		else if (!strcmp(name, "P_A_1")) {
			rear = "P_A_1R";
		}
		return rear;
	}
	else {
		if (!strcmp(name, "M_Z_1")) {
			rear = "M_Z_1R";
		}
		else if (!strcmp(name, "M_S_1")) {
			rear = "M_S_1R";
		}
		else if (!strcmp(name, "M_W_1")) {
			rear = "M_W_1R";
		}
		else if (!strcmp(name, "M_R_1")) {
			rear = "M_R_1R";
		}
		else if (!strcmp(name, "M_J_1B")) {
			rear = "M_J_1BR";
		}
		else if (!strcmp(name, "M_J_1C")) {
			rear = "M_J_1CR";
		}
		else if (!strcmp(name, "M_H_1")) {
			rear = "M_H_1R";
		}
		else if (!strcmp(name, "M_H_2")) {
			rear = "M_H_2R";
		}
		else if (!strcmp(name, "M_H_4")) {
			rear = "M_H_4R";
		}
		else if (!strcmp(name, "M_H_5")) {
			rear = "M_H_5R";
		}
		else if (!strcmp(name, "M_H_7")) {
			rear = "M_H_7R";
		}
		else if (!strcmp(name, "M_H_8")) {
			rear = "M_H_8R";
		}
		else if (!strcmp(name, "M_O_2")) {
			rear = "M_O_1R";
		}
		else if (!strcmp(name, "M_I_2")) {
			rear = "M_I_2R";
		}
		else if (!strcmp(name, "M_U_2")) {
			rear = "M_U_2R";
		}
		else if (!strcmp(name, "M_C_1")) {
			rear = "M_C_1R";
		}
		return rear;
	}
}

const char* toFrontPose(const char* name) { //1:1
	const char* front = NULL;
	if (mp->characterId == 1 && !(mp->peachFlags & 0x2000)) {
		if (!strcmp(name, "P_Z_1R")) {
			front = "P_Z_1";
		}
		else if (!strcmp(name, "P_S_1R")) {
			front = "P_S_1";
		}
		else if (!strcmp(name, "P_W_1R")) {
			front = "P_W_1";
		}
		else if (!strcmp(name, "P_R_1R")) {
			front = "P_R_1";
		}
		else if (!strcmp(name, "P_T_1R")) {
			front = "P_T_1";
		}
		else if (!strcmp(name, "P_Z_2R")) {
			front = "P_Z_2";
		}
		else if (!strcmp(name, "P_S_2R")) {
			front = "P_S_2";
		}
		else if (!strcmp(name, "P_W_2R")) {
			front = "P_W_2";
		}
		else if (!strcmp(name, "P_R_2R")) {
			front = "P_R_2";
		}
		else if (!strcmp(name, "P_T_2R")) {
			front = "P_T_2";
		}
		else if (!strcmp(name, "P_Z_3R")) {
			front = "P_Z_3";
		}
		else if (!strcmp(name, "P_S_3R")) {
			front = "P_S_3";
		}
		else if (!strcmp(name, "P_W_3R")) {
			front = "P_W_3";
		}
		else if (!strcmp(name, "P_R_3R")) {
			front = "P_R_3";
		}
		else if (!strcmp(name, "P_T_3R")) {
			front = "P_T_3";
		}
		else if (!strcmp(name, "P_O_Z_1R")) {
			front = "P_O_Z_1";
		}
		else if (!strcmp(name, "P_O_S_1R")) {
			front = "P_O_S_1";
		}
		else if (!strcmp(name, "P_O_F_1R")) {
			front = "P_O_F_1";
		}
		else if (!strcmp(name, "P_O_R_1R")) {
			front = "P_O_R_1";
		}
		else if (!strcmp(name, "P_O_N_1R")) {
			front = "P_O_N_1";
		}
		else if (!strcmp(name, "P_O_S_2R")) {
			front = "P_O_S_2";
		}
		else if (!strcmp(name, "P_O_F_2R")) {
			front = "P_O_F_2";
		}
		else if (!strcmp(name, "P_O_R_2R")) {
			front = "P_O_R_2";
		}
		else if (!strcmp(name, "P_O_N_2R")) {
			front = "P_O_N_2";
		}
		else if (!strcmp(name, "P_O_D_1R")) {
			front = "P_O_D_1";
		}
		else if (!strcmp(name, "P_O_D_2R")) {
			front = "P_O_D_2";
		}
		else if (!strcmp(name, "P_A_1R")) {
			front = "P_A_1";
		}
		return front;
	}
	else {
		if (!strcmp(name, "M_Z_1R")) {
			front = "M_Z_1";
		}
		else if (!strcmp(name, "M_S_1R")) {
			front = "M_S_1";
		}
		else if (!strcmp(name, "M_W_1R")) {
			front = "M_W_1";
		}
		else if (!strcmp(name, "M_R_1R")) {
			front = "M_R_1";
		}
		else if (!strcmp(name, "M_J_1BR")) {
			front = "M_J_1B";
		}
		else if (!strcmp(name, "M_J_1CR")) {
			front = "M_J_1C";
		}
		else if (!strcmp(name, "M_H_1R")) {
			front = "M_H_1";
		}
		else if (!strcmp(name, "M_H_2R")) {
			front = "M_H_2";
		}
		else if (!strcmp(name, "M_H_4R")) {
			front = "M_H_4";
		}
		else if (!strcmp(name, "M_H_5R")) {
			front = "M_H_5";
		}
		else if (!strcmp(name, "M_H_7R")) {
			front = "M_H_7";
		}
		else if (!strcmp(name, "M_H_8R")) {
			front = "M_H_8";
		}
		else if (!strcmp(name, "M_O_2R")) {
			front = "M_O_1";
		}
		else if (!strcmp(name, "M_I_2R")) {
			front = "M_I_2";
		}
		else if (!strcmp(name, "M_U_2R")) {
			front = "M_U_2";
		}
		else if (!strcmp(name, "M_C_1R")) {
			front = "M_C_1";
		}
		return front;
	}
}
