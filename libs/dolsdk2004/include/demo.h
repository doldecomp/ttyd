#ifndef _DEMO_H_
#define _DEMO_H_

#include <dolphin/pad.h>
#include <dolphin/gx.h>

typedef struct STRUCT_MENU STRUCT_MENU;
typedef struct STRUCT_MENU_ITEM STRUCT_MENU_ITEM;

struct STRUCT_MENU_ITEM {
    /* 0x00 */ char* name;
    /* 0x04 */ u32 flags;
    /* 0x08 */ void (* function)(STRUCT_MENU*, u32, u32 *);
    /* 0x0C */ STRUCT_MENU* link;
};

struct STRUCT_MENU {
    /* 0x00 */ char* title;
    /* 0x04 */ struct STRUCT_DEMOWIN* handle;
    /* 0x08 */ STRUCT_MENU_ITEM* items;
    /* 0x0C */ s32 max_display_items;
    /* 0x10 */ u32 flags;
    /* 0x14 */ void (*cb_open)(STRUCT_MENU*, u32);
    /* 0x18 */ void (*cb_move)(STRUCT_MENU*, u32);
    /* 0x1C */ void (*cb_select)(STRUCT_MENU*, u32);
    /* 0x20 */ void (*cb_cancel)(STRUCT_MENU*, u32);
    /* 0x24 */ s32 num_display_items;
    /* 0x28 */ s32 num_items;
    /* 0x2C */ u32 max_str_len;
    /* 0x30 */ s32 curr_pos;
    /* 0x34 */ s32 display_pos;
};

typedef struct {
    /* 0x00 */ struct PADStatus pads[4];
    /* 0x30 */ u32 button[4];
    /* 0x40 */ u32 old_button[4];
    /* 0x50 */ u32 changed_button[4];
    /* 0x60 */ u32 repeat_button[4];
    /* 0x70 */ u32 repeat_ctr[4];
} DEMOWinPadInfo;

struct STRUCT_LISTBOX_ITEM {
    /* 0x00 */ char* name; // offset 0x0, size 0x4
    /* 0x04 */ u32 flags; // offset 0x4, size 0x4
};

struct STRUCT_LISTBOX {
    /* 0x00 */ char* title; // offset 0x0, size 0x4
    /* 0x04 */ struct STRUCT_DEMOWIN* handle; // offset 0x4, size 0x4
    /* 0x08 */ struct STRUCT_LISTBOX_ITEM* items; // offset 0x8, size 0x4
    /* 0x0C */ s32 max_display_items; // offset 0xC, size 0x4
    /* 0x10 */ u32 flags; // offset 0x10, size 0x4
    /* 0x14 */ s32 num_display_items; // offset 0x14, size 0x4
    /* 0x18 */ s32 num_items; // offset 0x18, size 0x4
    /* 0x1C */ u32 max_str_len; // offset 0x1C, size 0x4
    /* 0x20 */ s32 curr_pos; // offset 0x20, size 0x4
    /* 0x24 */ s32 display_pos; // offset 0x24, size 0x4
    /* 0x28 */ int cursor_state; // offset 0x28, size 0x4
};

extern u32 DEMOFontBitmap[768];

#include <demo/DEMOInit.h>
#include <demo/DEMOPad.h>
#include <demo/DEMOPuts.h>
#include <demo/DEMOStats.h>
#include <demo/DEMOWin.h>

// unsorted externs
extern void DEMOPrintf(s16 x, s16 y, s16 priority, char *str, ...);

extern struct _GXRenderModeObj *DEMOGetRenderModeObj();

#endif // _DOLPHIN_DEMO_H_
