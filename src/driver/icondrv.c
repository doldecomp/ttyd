#include "driver/icondrv.h"
#include "driver/dispdrv.h"
#include "driver/mapdrv.h"
#include "evt/evt_cmd.h"
#include "manager/dvdmgr.h"
#include "manager/evtmgr_cmd.h"
#include "mario/mariost.h"
#include "memory.h"
#include "system.h"
#include "sdk/texPalette.h"
#include <string.h>
#pragma warn_padding off
#include <stdio.h>
#pragma warn_padding on

extern GlobalWork* gp;

//.sbss
TEXPalette* icon_tpl;
IconBinary* icon_bin;
BOOL icon_tpl_ok;
BOOL icon_bin_ok;
static IconWork work[2];

//.sdata
u16 suuji[] = { 473, 475, 477, 479, 481, 483, 485, 487, 489, 491 };   // 0-9
u16 suuji_s[] = { 474, 476, 478, 480, 482, 484, 486, 488, 490, 492 }; // 0-9 small

// local prototypes
void _callback_tpl(s32 error, DVDFileInfo* info);
void _callback_bin(s32 error, DVDFileInfo* info);
void iconDisp(CameraId cameraId, void* param);
void iconGX(Mtx mtx, IconEntry* entry);

// TODO: inline function? I see nothing in the symbol map
#define iconGetWork() (gp->inBattle ? &work[1] : &work[0])

// TODO: remove? no function in original symbol map
inline IconEntry* iconGetEntry(const char* name) {
    IconWork* wp = iconGetWork();
    IconEntry* entry = wp->entries;
    int i;

    for (i = 0; i < wp->count; i++, entry++) {
        if (entry->flags & 1 && !strcmp(entry->name, name)) {
            return entry;
        }
    }
    return NULL;
}

void _callback_tpl(s32 error, DVDFileInfo* info) {
    UnpackTexPalette(icon_tpl);
    DVDMgrClose(info->cb.userData);
    icon_tpl_ok = TRUE;
}

void _callback_bin(s32 error, DVDFileInfo* info) {
    DVDMgrClose(info->cb.userData);
    icon_bin_ok = TRUE;
}

void iconInit(void) {
    char path[128];
    DVDEntry* entry;
    u32 size;

    work[0].count = 32;
    work[0].entries = __memAlloc(HEAP_DEFAULT, sizeof(IconEntry) * work[0].count);
    memset(work[0].entries, 0, sizeof(IconEntry) * work[0].count);

    work[1].count = 32;
    work[1].entries = __memAlloc(HEAP_DEFAULT, sizeof(IconEntry) * work[1].count);
    memset(work[1].entries, 0, sizeof(IconEntry) * work[1].count);
    icon_tpl = NULL;
    icon_bin = NULL;
    icon_tpl_ok = FALSE;
    icon_bin_ok = FALSE;

    sprintf(path, "%s/icon.tpl", getMarioStDvdRoot());
    entry = DVDMgrOpen(path, 2, 0);
    if (entry) {
        size = OSRoundUp32B(DVDMgrGetLength(entry));
        icon_tpl = __memAlloc(HEAP_DEFAULT, size);
        entry->info.cb.userData = entry; // this file's userData is a pointer to the entry
        DVDMgrReadAsync(entry, icon_tpl, size, 0, _callback_tpl);
    }

    sprintf(path, "%s/icon.bin", getMarioStDvdRoot());
    entry = DVDMgrOpen(path, 2, 0);
    if (entry) {
        size = OSRoundUp32B(DVDMgrGetLength(entry));
        icon_bin = __memAlloc(HEAP_DEFAULT, size);
        entry->info.cb.userData = entry; // this file's userData is a pointer to the entry
        DVDMgrReadAsync(entry, icon_bin, size, 0, _callback_bin);
    }
}

void iconTexSetup(void) {
    ; // stubbed in retail
}

void iconReInit(void) {
    IconWork* wp = iconGetWork();
    memset(wp->entries, 0, sizeof(IconEntry) * wp->count);
}

void iconMain(void) {
    IconBinaryEntry* data;
    IconWork* wp;
    IconEntry* entry;
    int i;

    wp = iconGetWork();
    if (!icon_tpl_ok)
        return;
    if (!icon_bin_ok)
        return;

    for (entry = wp->entries, i = 0; i < wp->count; i++, entry++) {
        if (entry->flags & 1) {
            if (entry->flags & 0x2000) {
                entry->flags &= ~0x2000;
                // warning: data may be invalid
                entry->width = data->width;
                entry->height = data->height;
                entry->numIcons = data->numIcons;
                entry->currIcon = 0;
                entry->tplId = data->tplId;
                entry->frameDelay = data->frameDelay;
                if (data->type & 1) {
                    entry->flags |= 0x1000;
                }
            }
            if (entry->flags & 0x1000) {
                if (entry->frameDelay) {
                    entry->frameDelay--;
                }
                if (!entry->frameDelay) {
                    entry->currIcon++;
                    if (entry->currIcon >= entry->numIcons) {
                        entry->currIcon = 0;
                    }
                    if (icon_tpl_ok && icon_bin_ok) {
                        data = &icon_bin->data[entry->iconId];
                    } else {
                        data = NULL;
                    }
                    entry->tplId = data[entry->currIcon].tplId;
                    entry->frameDelay = data[entry->currIcon].frameDelay;
                }
            }
            if (!(entry->flags & 2)) {
                if (entry->flags & 0x10) {
                    dispEntry(CAMERA_2D, 1, iconDisp, entry, 200.0f);
                }
                // TODO: uncomment shadowEntry when added
                else if (entry->flags & 0x100) {
                    // shadowEntry(entry->position.x, entry->position.y, entry->position.z, 10.0f);
                    dispEntry(CAMERA_3D_EFFECTA, 1, iconDisp, entry, dispCalcZ(&entry->position));
                } else if (entry->flags & 0x200) {
                    // shadowEntry(entry->position.x, entry->position.y, entry->position.z, 10.0f);
                    dispEntry(CAMERA_3D_EFFECTB, 1, iconDisp, entry, dispCalcZ(&entry->position));
                } else {
                    // shadowEntry(entry->position.x, entry->position.y, entry->position.z, 10.0f);
                    if (entry->color.a == 0xFF) {
                        dispEntry(CAMERA_3D, 1, iconDisp, entry, dispCalcZ(&entry->position));
                    } else {
                        dispEntry(CAMERA_3D, 2, iconDisp, entry, dispCalcZ(&entry->position));
                    }
                }
            }
        }
    }
}

void iconEntry(const char* name, s16 iconId) {
    IconWork* wp = iconGetWork();
    IconEntry* entry = iconNameToPtr(name); // inline
    IconBinaryEntry* data;
    int i;

    for (entry = wp->entries, i = 0; i < wp->count; i++, entry++) {
        if (!(entry->flags & 1)) { // looking for unused entry to allocate
            break;
        }
    }

    memset(entry, 0, sizeof(IconEntry));
    entry->position = (Vec){ 0.0f, 0.0f, 0.0f };
    entry->scale = 1.0f;
    entry->color = (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF };
    strcpy(entry->name, name);
    entry->iconId = iconId;
    if (icon_tpl_ok && icon_bin_ok) {
        data = &icon_bin->data[iconId];
    } else {
        data = NULL;
    }
    if (data) {
        entry->width = data->width;
        entry->height = data->height;
        entry->numIcons = data->numIcons;
        entry->currIcon = 0;
        entry->tplId = data->tplId;
        entry->frameDelay = data->frameDelay;
        if (data->type & 1) {
            entry->flags |= 0x1000;
        }
    } else {
        entry->flags |= 0x2000;
    }
    entry->flags |= 1;
    if (mapGetWork()->entries[0].flags & 2) {
        if (strncmp(gp->currentMapName, "aji", 3) || evtGetValue(0, GSW(0)) != 0x178) {
            entry->flags |= 0x40;
        } else {
            entry->flags &= ~0x40;
        }
    }
}

void iconEntry2D(const char* name, s16 iconId) {
    IconWork* wp = iconGetWork();
    IconEntry* entry = iconNameToPtr(name); // inline
    IconBinaryEntry* data;
    int i;

    for (entry = wp->entries, i = 0; i < wp->count; i++, entry++) {
        if (!(entry->flags & 1)) { // looking for unused entry to allocate
            break;
        }
    }

    memset(entry, 0, sizeof(IconEntry));
    entry->position = (Vec){ 0.0f, 0.0f, 0.0f };
    entry->scale = 1.0f;
    entry->color = (GXColor){ 0xFF, 0xFF, 0xFF, 0xFF };
    strcpy(entry->name, name);
    entry->iconId = iconId;
    if (icon_tpl_ok && icon_bin_ok) {
        data = &icon_bin->data[iconId];
    } else {
        data = NULL;
    }
    if (data) {
        entry->width = data->width;
        entry->height = data->height;
        entry->numIcons = data->numIcons;
        entry->currIcon = 0;
        entry->tplId = data->tplId;
        entry->frameDelay = data->frameDelay;
        if (data->type & 1) {
            entry->flags |= 0x1000;
        }
    } else {
        entry->flags |= 0x2000;
    }
    entry->flags |= 0x11;
}

void iconDelete(const char* name) {
    IconWork* wp = iconGetWork();
    IconEntry* entry = wp->entries;
    int i;

    for (i = 0; i < wp->count; i++, entry++) {
        if (entry->flags & 1 && !strcmp(entry->name, name)) {
            entry->flags &= ~1; // no longer in use
            break;
        }
    }
}

void iconChange(const char* name, s16 iconId) {
    IconEntry* entry = iconNameToPtr(name); // inline
    IconBinaryEntry* data;

    entry->iconId = iconId;
    if (icon_tpl_ok && icon_bin_ok) {
        data = &icon_bin->data[iconId];
    } else {
        data = NULL;
    }
    entry->width = data->width;
    entry->height = data->height;
    entry->numIcons = data->numIcons;
    entry->currIcon = 0;
    entry->tplId = data->tplId;
    entry->frameDelay = data->frameDelay;
    if (data->type & 1) {
        entry->flags |= 0x1000;
    }
    entry->flags |= 1;
}

void iconDisp(CameraId cameraId, void* param) {
    IconEntry* entry = param; // cast to correct type
    CameraEntry* camera;
    Mtx trans, scale, rot, mtx;

    camera = camGetPtr(cameraId);
    MTXTrans(trans, entry->position.x, entry->position.y, entry->position.z);
    MTXScale(scale, entry->scale, entry->scale, entry->scale);
    MTXRotRad(rot, 'y', MTXDegToRad(-camera->field_0x114));
    MTXConcat(trans, rot, mtx);
    MTXConcat(mtx, scale, mtx);
    MTXConcat(camera->view, mtx, mtx);
    iconGX(mtx, entry);
}

void iconDispGxAlpha(Vec position, s16 flags, s16 iconId, u8 alpha, f32 scale) {
    CameraEntry* camera;
    IconBinaryEntry* data;
    IconEntry entry;
    Mtx transmtx, scalemtx, rotmtx, mtx;

    camera = camGetCurPtr();
    if (icon_tpl_ok && icon_bin_ok) {
        MTXTrans(transmtx, position.x, position.y, position.z);
        MTXScale(scalemtx, scale, scale, scale);
        MTXRotRad(rotmtx, 'y', MTXDegToRad(-camera->field_0x114));
        MTXConcat(transmtx, rotmtx, mtx);
        MTXConcat(mtx, scalemtx, mtx);
        MTXConcat(camera->view, mtx, mtx);
        entry.flags = flags;
        entry.color = (GXColor){ 0xFF, 0xFF, 0xFF, alpha };
        entry.iconId = iconId;
        if (icon_tpl_ok && icon_bin_ok) {
            data = &icon_bin->data[iconId];
        } else {
            data = NULL;
        }
        entry.width = data->width;
        entry.height = data->height;
        entry.tplId = data->tplId;
        entry.frameDelay = data->frameDelay;
        if (data->numIcons > 1) {
            // this bit is wack
        }
        iconGX(mtx, &entry);
    }
}

void iconDispGx(Vec position, s16 flags, s16 iconId, f32 scale) {
    iconDispGxAlpha(position, flags, iconId, 0xFF, scale);
}

void iconDispGx2(Mtx mtx, s16 flags, s16 iconId) {
    // wack section like iconDispGxAlpha, TODO
}

void iconDispGxCol(Mtx pos, s16 flags, s32 iconId, GXColor color) {
}

void iconGetTexObj(GXTexObj* texObj, s16 iconId) {
    // wack section like iconDispGxAlpha, TODO
}

void iconGetWidthHeight(u16* width, u16* height, s16 iconId) {
    IconBinaryEntry* entry;
    TEXDescriptor* descriptor;

    if (icon_tpl_ok && icon_bin_ok) {
        entry = &icon_bin->data[iconId];
    } else {
        entry = NULL;
    }
    *width = entry->width;
    *height = entry->height;
    if (!*width && !*height) { // no tpl override
        descriptor = TEXGet(icon_tpl, iconId);
        *width = descriptor->textureHeader->width;
        *height = descriptor->textureHeader->height;
    }
}

void iconGX(Mtx mtx, IconEntry* entry) {
}

IconEntry* iconNameToPtr(const char* name) {
    IconWork* wp = iconGetWork();
    IconEntry* entry = wp->entries;
    int i;

    for (i = 0; i < wp->count; i++, entry++) {
        if (entry->flags & 1 && !strcmp(entry->name, name)) {
            return entry;
        }
    }
    return NULL;
}

void iconSetPos(const char* name, f32 x, f32 y, f32 z) {
    IconWork* workptr = iconGetWork();
    IconEntry* entry = iconNameToPtr(name); // inline

    if (entry) {
        Vec temp = { 0 };
        temp.x = x;
        temp.y = y;
        temp.z = z;
        entry->position = temp;
    }
}

void iconFlagOn(const char* name, s16 flags) {
    IconEntry* entry = iconNameToPtr(name); // inline
    if (entry) {
        entry->flags |= flags;
    }
}

void iconFlagOff(const char* name, s16 mask) {
    IconEntry* entry = iconNameToPtr(name); // inline
    if (entry) {
        entry->flags &= ~mask;
    }
}

void iconSetScale(const char* name, f32 scale) {
    IconEntry* entry = iconNameToPtr(name); // inline
    if (entry) {
        entry->scale = scale;
    }
}

void iconSetAlpha(const char* name, u8 alpha) {
    IconEntry* entry = iconNameToPtr(name); // inline
    if (entry) {
        GXColor color = entry->color;
        color.a = alpha;
        entry->color = color;
    }
}

f32 iconNumberDispGx(Mtx mtx, s32 number, BOOL small, GXColor color) {
}

f32 iconNumberDispGx3D(Mtx mtx, s32 number, BOOL small, GXColor color) {
}
