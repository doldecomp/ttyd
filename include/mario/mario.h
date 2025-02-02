#pragma once

#include <dolphin/mtx.h>
#include "driver/dispdrv.h"

#pragma enumsalwaysint off
typedef enum MarioMotion {
	kStay, //0x0
	kWalk, //0x1
	kDash, //0x2
	kJump, //0x3
	kJumpNPC, //0x4
	kJumpSw, //0x5
	kJumpStand, //0x6
	kJump2, //0x7
	kJump3, //0x8
	kJumpSmall, //0x9
	kFall, //0xA
	kFall2, //0xB
	kUpstairs, //0xC
	kLand, //0xD
	kTalk, //0xE
	kGetItem, //0xF
	kHip, //0x10
	kHip2, //0x11
	kHammer, //0x12
	kHammer2, //0x13
	kJabara, //0x14
	kSlit, //0x15
	kRoll, //0x16
	kKaze, //0x17
	kPlane, //0x18
	kShip, //0x19
	kYoshi, //0x1A
	kCloud, //0x1B
	kVivian, //0x1C
	kDokan, //0x1D
	kGrasp, //0x1E
	kDamage, //0x1F
	kDamageToge, //0x20
	kBottomless, //0x21
	kForceReset, //0x22
	kShadow, //0x23
	kPartyUse, //0x24
	kKpaSwim, //0x25
	kKpaPowUp, //0x26
	kKpaPowDown, //0x27
	kDummy, //0x28
	kMotionMax = 0xFFFF
} MarioMotion;
#pragma enumsalwaysint on

//TODO: US struct is bigger, 0x2F8 vs 0x2E0
typedef struct MarioWork {
	u32 flags; //0x0
	s32 dispFlags; //0x4
	u32 field_0x8; //0x8
	u32 trigFlags; //0xC
	s32 peachFlags; //0x10
	u8 field_0x14[0x18 - 0x14]; //0x14
	const char* animName; //0x18
	const char* paperAnimName; //0x1C
	u8 field_0x20[0x28 - 0x20]; //0x20
	s16 poseTime; //0x28
	u8 field_0x2A[0x2E - 0x2A]; //0x2A
	MarioMotion currMotionId; //0x2E
	MarioMotion prevMotionId; //0x30, TODO check
	u8 field_0x32[0x3C - 0x32]; //0x32
	s8 characterId; //0x3C
	s8 colorId; //0x3D
	u8 field_0x3E[0x44 - 0x3E]; //0x3E
	u32 currSubMotionId; //0x44
	u8 field_0x48[0x5C - 0x48]; //0x48
	s16 unk5C; //0x5C
	s16 unk5E; //0x5E
	s16 unk60; //0x60
	s16 unk62; //0x62
	f32 unk64; //0x64
	f32 unk68; //0x68
	Vec unk6C; //0x6C
	u8 unk78[0x7A - 0x78]; //0x78
	s16 field_0x7A; //0x7A
	u8 field_0x7C[0x8C - 0x7C]; //0x7C
	Vec position; //0x8C
	u8 field_0x98[0xC8 - 0x98]; //0x98
	Vec scale; //0xC8
	u8 field_0xD4[0xF8 - 0xD4]; //0xD4
	Vec camCollision; //0xF8
	u8 unk104[0x134 - 0x104]; //0x104
	CameraId camId; //0x134
	f32 unk138; //0x138
	f32 unk13C; //0x13C
	f32 unk140; //0x140
	f32 unk144; //0x144
	f32 unk148; //0x148
	f32 unk14C; //0x14C
	f32 unk150; //0x150
	f32 unk154; //0x154
	f32 unk158; //0x158
	f32 camFollowRate; //0x15C
	u8 unk160[0x184 - 0x160]; //0x160
	f32 mBaseWalkSpeed; //0x184
	f32 mBaseDashSpeed; //0x188, same on US
	u8 unk18C[0x198 - 0x18C]; //0x18C
	f32 targetYaw; //0x198
	u8 unk19C[0x1B4 - 0x19C]; //0x19C
	Vec wPlayerCollisionBox; //0x1B4 JP, 0x1B8 US
	u8 field_0x1C0[0x1D8 - 0x1C0]; //0x1C0
	s32 field_0x1D8; //0x1D8
	u8 field_0x1DC[0x228 - 0x1DC]; //0x1DC
	s32 paperAnimGroupId[3]; //0x228 JP, 0x22C US
	u8 field_0x234[0x23C - 0x234]; //0x234
	s32 paperPoseId; //0x23C JP, 0x240 US
	u8 field_0x240[0x241 - 0x240]; //0x240
	s8 currPartySlotId[2]; //0x241 JP, 0x245 US
    s8 prevPartyMemberId[2]; //0x243 JP, 0x247 US
	u8 field_0x245[0x288 - 0x245]; //0x245
	void* motStruct; //0x288, motion userdata, TODO rename?
	u8 field_0x28C[0x2A8 - 0x28C]; //0x28C
	f32 wCamVal1; //0x2A8, TODO: double check
	u8 field_0x2AC[0x2CC - 0x2AC]; //0x2AC
	Vec bottomlessResetPosition; //0x2CC JP, 0x2E4 US
	u8 field_0x2D8[0x2E0 - 0x2D8]; //0x2D8
} MarioWork; //size 0x2E0 on Japan

MarioWork* marioGetPtr(void);
s32 marioGetColor(void);
void marioSetCharMode(s32 mode);
void marioSetFamicomMode(s32 mode);
void marioSetSpec(void);
void marioEntry(void);
void marioItemGetDisable(void);
void marioItemGetChk(void);
BOOL marioItemGetOk(void);
BOOL marioCaseEventValidChk(void);
BOOL mario8005BB80(void);
BOOL marioCheckMenuDisable(void);
BOOL marioChkKey(void);
BOOL marioChkCtrl(void);
s32 mario8005B5A8(void);
void marioFBattlePrepare(void);
void marioFBattlePost(void);
s32 marioCtrlOffChk(void);
s32 marioKeyOffChk(void);
s32 marioCtrlOff(void);
s32 marioCtrlOn(void);
s32 marioCtrlOff2(void);
s32 marioCtrlOn2(void);
s32 marioKeyOff(void);
s32 marioKeyOn(void);
s16 marioSetMutekiTime(s32 msec);
BOOL marioBgmodeChk(void);
void marioBgmodeOn(void);
void marioBgmodeOff(void);
BOOL marioChkSts(s32 flags);
void marioResetHitObj(const char* name);
void marioReset(void);
void marioOfsRotReset(void);
void marioSoundInit(void);
void marioPoseInit(void);
void marioInit(void);
void marioReInit(void);
void marioMain(void);
void marioCtrlOff2Main(void);
void marioMove(void);
void marioMoveMain(void);
BOOL marioChkPushAnime(void);
s32 marioAnimeId(void);
void mario80058374(void);
void marioChgEvtPose(const char* name);
const char* toDotMarioPose(const char* name);
void marioChgPose(const char* name);
void marioChgPoseTime(const char* name, s16 frames);
void marioChgPaper(const char* name);
void marioSetPaperAnimeLocalTime(s16 frames);
BOOL marioPaperOn(const char* name);
void marioPaperOff(void);
void marioPaperLightOn(void);
void marioPaperLightOff(void);
void marioGetScreenPos(Vec position, f32* x, f32* y, f32* z);
BOOL marioChkInScreen(s32 x, s32 y);
f32 marioGetScale(void);
void marioMakeDispDir(void);
void marioRearAnime(void);
void marioPreDisp(void);
void marioDispBlur(CameraId camId, void* param);
void marioDisp(CameraId camId, void* param);
