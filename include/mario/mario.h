#pragma once

#include <dolphin/mtx.h>
#include "driver/dispdrv.h"

#pragma enumsalwaysint off
typedef enum MarioMotion {
	MARIO_MOTION_STAY, //0x0
	MARIO_MOTION_WALK, //0x1
	MARIO_MOTION_DASH, //0x2
	MARIO_MOTION_JUMP, //0x3
	MARIO_MOTION_JUMP_NPC, //0x4
	MARIO_MOTION_JUMP_SW, //0x5
	MARIO_MOTION_JUMP_STAND, //0x6
	MARIO_MOTION_JUMP_2, //0x7
	MARIO_MOTION_JUMP_3, //0x8
	MARIO_MOTION_JUMP_SMALL, //0x9
	MARIO_MOTION_FALL, //0xA
	MARIO_MOTION_FALL_2, //0xB
	MARIO_MOTION_UPSTAIRS, //0xC
	MARIO_MOTION_LAND, //0xD
	MARIO_MOTION_TALK, //0xE
	MARIO_MOTION_GET_ITEM, //0xF
	MARIO_MOTION_HIP, //0x10
	MARIO_MOTION_HIP_2, //0x11
	MARIO_MOTION_HAMMER, //0x12
	MARIO_MOTION_HAMMER_2, //0x13
	MARIO_MOTION_JABARA, //0x14
	MARIO_MOTION_SLIT, //0x15
	MARIO_MOTION_ROLL, //0x16
	MARIO_MOTION_KAZE, //0x17
	MARIO_MOTION_PLANE, //0x18
	MARIO_MOTION_SHIP, //0x19
	MARIO_MOTION_YOSHI, //0x1A
	MARIO_MOTION_CLOUD, //0x1B
	MARIO_MOTION_VIVIAN, //0x1C
	MARIO_MOTION_DOKAN, //0x1D
	MARIO_MOTION_GRASP, //0x1E
	MARIO_MOTION_DAMAGE, //0x1F
	MARIO_MOTION_DAMAGE_TOGE, //0x20
	MARIO_MOTION_BOTTOMLESS, //0x21
	MARIO_MOTION_FORCE_RESET, //0x22
	MARIO_MOTION_SHADOW, //0x23
	MARIO_MOTION_PARTY_USE, //0x24
	MARIO_MOTION_KPA_SWIM, //0x25
	MARIO_MOTION_KPA_POW_UP, //0x26
	MARIO_MOTION_KPA_POW_DOWN, //0x27
	MARIO_MOTION_DUMMY, //0x28
	MARIO_MOTION_MOTION_MAX = 0xFFFF
} MarioMotion;
#pragma enumsalwaysint on

#pragma enumsalwaysint off
typedef enum MarioFlags {
	MARIO_FLAG_ACTIVE = (1 << 0),
	MARIO_FLAG_CTRL_OFF = (1 << 1),
	MARIO_FLAG_CTRL_OFF_2 = (1 << 2),
	MARIO_FLAG_KEY_OFF = (1 << 3),
	MARIO_FLAG_FORCED_MOVEMENT = (1 << 5),
	MARIO_FLAG_USE_FORCE_DIRECTION = (1 << 6),
	MARIO_FLAG_STOP_AIR_MOVEMENT = (1 << 7),
	MARIO_FLAG_FLOORS_DISABLED = (1 << 8),
	MARIO_FLAG_FORCE_WALL = (1 << 9),
	MARIO_FLAG_WALLS_DISABLED = (1 << 10),
	MARIO_FLAG_HAMMER_HIT_WALL = (1 << 11),
	MARIO_FLAG_PRE_BATTLE_PHYSICS = (1 << 12),
	MARIO_FLAG_IS_CARRYING_BOBBERY = (1 << 13),
	MARIO_FLAG_ITEM_GET_DISABLED = (1 << 14),
	MARIO_FLAG_IS_PUSHING = (1 << 15),
	MARIO_FLAG_IS_JUMPING = (1 << 16),
	MARIO_FLAG_IS_FALLING = (1 << 17),
	MARIO_FLAG_IS_STEPPING = (1 << 18),
	MARIO_FLAG_HAS_INPUT_JUMP = (1 << 19),
	MARIO_FLAG_PAPER_MODE = (1 << 20),
	MARIO_FLAG_GONE_THROUGH_BARS = (1 << 21),
	MARIO_FLAG_PARTY_WALK_DISABLED = (1 << 22),
	MARIO_FLAG_SLIT_ABILITY_DISABLED = (1 << 23),
	MARIO_FLAG_TUBE_MODE = (1 << 24),
	MARIO_FLAG_BG_MODE = (1 << 25),
	MARIO_FLAG_IN_SHALLOW_WATER = (1 << 26),
	MARIO_FLAG_IS_TOUCHING_CEILING = (1 << 27),
	MARIO_FLAG_CHG_MOT_DISABLED = (1 << 28),
	MARIO_FLAG_IS_SHADOW_MARIO = (1 << 30),
	MARIO_FLAG_IS_8_BIT = (1 << 31)
} MarioFlags;
#pragma enumsalwaysint on

#pragma enumsalwaysint off
typedef enum MarioTrigFlags {
	MARIO_TRIG_FLAG_IS_STARTING_NEW_MOTION = (1 << 0),
	MARIO_TRIG_FLAG_USE_PARTNER = (1 << 1),
	MARIO_TRIG_FLAG_SHIP_PLANE_EVT_ON = (1 << 2),
	MARIO_TRIG_FLAG_DISP_DIR_CORRECTION = (1 << 8),
	MARIO_TRIG_FLAG_DISP_DIR_LEFT = (1 << 9),
	MARIO_TRIG_FLAG_DISP_DIR_RIGHT = (1 << 10),
	MARIO_TRIG_FLAG_CHG_ANIM = (1 << 12),
	MARIO_TRIG_FLAG_CHG_PAPER_ANIM = (1 << 14),
	MARIO_TRIG_FLAG_SET_JUMP_PARAMS = (1 << 16),
	MARIO_TRIG_FLAG_DISABLE_JUMP_KEMURI = (1 << 17),
	MARIO_TRIG_FLAG_JABARA_CHK = (1 << 20),
	MARIO_TRIG_FLAG_JABARA_MOVE_CHK = (1 << 21),
	MARIO_TRIG_FLAG_START_JABARA_SPIN = (1 << 22),
	MARIO_TRIG_FLAG_DISABLE_UNUSED_INPUT = (1 << 24),
	MARIO_TRIG_FLAG_DISABLE_TRIGGERS = (1 << 25),
	MARIO_TRIG_FLAG_DISABLE_SUB_STICK = (1 << 26),
	MARIO_TRIG_FLAG_DISABLE_STICK = (1 << 27),
	MARIO_TRIG_FLAG_DISABLE_PARTY_SLIT = (1 << 30)
} MarioTrigFlags;
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
	u8 field_0x3E[0x40 - 0x3E]; //0x3E
	s8 wMotionTimer; //0x40
	u8 field_0x41[0x44 - 0x41]; //0x41
	u32 currSubMotionId; //0x44
	u32 multiTimer; //0x48, ???
	u16 unk4C; // 0x4C
	s16 forceMoveTimer; //0x4E
	s16 airTimer; // 0x50
	u8 field_0x52[0x5C - 0x52]; //0x52
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
	Vec unk150; //0x150
	f32 camFollowRate; //0x15C
	u8 unk160[0x168 - 0x160]; //0x160
	s32 unk168; //0x168
	s32 unk16C; //0x16C
	u8 unk170[0x180 - 0x170]; //0x170
	f32 baseSpeed; // 0x180, same on US
	f32 mBaseWalkSpeed; //0x184
	f32 mBaseDashSpeed; //0x188, same on US
	u8 unk18C[0x190 - 0x18C]; //0x18C
	f32 controlStickSensitivity; //0x190
	f32 controlStickAngle; //0x194
	f32 targetYaw; //0x198
	u8 unk19C[0x1A0 - 0x19C]; //0x19C
	f32 directionView; //0x1A0
	f32 forceDirection; //0x1A4
	f32 unk1A8; //0x1A8
	u8 unk1AC[0x1B4 - 0x1AC]; //0x1AC
	Vec wPlayerCollisionBox; //0x1B4 JP, 0x1B8 US
	u8 field_0x1C0[0x1D8 - 0x1C0]; //0x1C0
	s32 field_0x1D8; //0x1D8
	u8 field_0x1DC[0x1E4 - 0x1DC]; //0x1DC
	void* hitobjStandOn; //0x1E4, 0x1E8 US HitEntry
	void* hitobjJumpFrom; //0x1E8, 0x1EC US HitEntry
	void* hitobjPush; //0x1EC JP, 0x1F0 US HitEntry
	u8 field_0x1F0[0x224 - 0x1F0]; //0x1F0
	f32 playerGravity; //0x224 JP, 228 US
	s32 paperAnimGroupId[3]; //0x228 JP, 0x22C US
	u8 field_0x234[0x23C - 0x234]; //0x234
	s32 paperPoseId; //0x23C JP, 0x240 US
	u8 field_0x240[0x241 - 0x240]; //0x240
	s8 currPartySlotId[2]; //0x241 JP, 0x245 US
    s8 prevPartyMemberId[2]; //0x243 JP, 0x247 US
	u8 field_0x245[0x24E - 0x245]; //0x245
	u8 wStickDir1; //0x24E JP, 0x252 US
	u8 wStickDir2; //0x24F JP, 0x253 US
	u8 field_0x250[0x288 - 0x250]; //0x250
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
