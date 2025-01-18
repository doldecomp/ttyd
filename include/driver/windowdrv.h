#pragma once

#include <dolphin/gx.h>
#include <dolphin/mtx.h>
#include "memory.h"

typedef struct WindowEntry WindowEntry;

typedef enum WindowType {
	WINDOW_TYPE_NORMAL = 0,
	WINDOW_TYPE_SMALL = 1,
	WINDOW_TYPE_PLATE = 2,
	WINDOW_TYPE_SYSTEM = 3,
	WINDOW_TYPE_KANBAN = 4, //kanban = sign/billboard
	WINDOW_TYPE_SELECT = 5,
	WINDOW_TYPE_BOSS = 6,
	WINDOW_TYPE_DIARY = 7,
	WINDOW_TYPE_TEC = 8,
	WINDOW_TYPE_MAJO = 9, //majo = witch, shadow sirens
	WINDOW_TYPE_HOUSOU = 10, //housou = broadcast/announcement
	WINDOW_TYPE_CLEAR = 11
} WindowType;

struct WindowEntry {
	u8 field_0x0[2]; //0x0
	u16 flags; //0x2
	u16 field_0x4; //0x4
	s16 alpha; //0x6, window alpha
	s32 type; //0x8, WindowType
	f32 x; //0xC, window xpos
	f32 y; //0x10, window ypos
	f32 height; //0x14
	f32 width; //0x18
	u8 field_0x1C[0x28 - 0x1C]; //0x1C
	smartEntry* userdata; //0x28, TODO: verify? could be wrong
	s16 field_0x2C; //0x2C
	u8 field_0x2E[0x3C - 0x2E]; //0x2E
	void (*main)(WindowEntry* entry); //0x3C
	void (*delete)(WindowEntry* entry); //0x40
	u8 field_0x44[0x48 - 0x44]; //0x44
};

void windowInit(void);
void windowTexSetup(void);
void windowReInit(void);
s32 windowEntry(u16 a1);
BOOL windowDelete(WindowEntry* entry);
BOOL windowDeleteID(s32 id);
void windowMain(void);
void windowDispGX_Kanban(s32 type, u8 alpha, f32 x, f32 y, f32 height, f32 width);
void windowDispGX_System(s32 type, u8 alpha, f32 x, f32 y, f32 height, f32 width);
void windowDispGX_Message(s32 type, s32 a2, u8 alpha, f32 x, f32 y, f32 height, f32 width, f32 a9, f32 a10);
void windowDispGX_Waku_col(s16 gxTexMapID, GXColor color, f32 x, f32 y, f32 height, f32 width, f32 curve);
void windowDispGX2_Waku_col(Mtx mtx, s16 gxTexMapID, GXColor color, f32 x, f32 y, f32 width, f32 height, f32 curve);
s32 windowCheckID(s32 id);
WindowEntry* windowGetPointer(s32 id);
GXTexObj* getWakuTexObj(s32 id);
