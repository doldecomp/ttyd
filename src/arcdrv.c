#include "global.h"

void arcInit(void);
int arcDataCheck(void *param_1);
void arcEntry(int id, void *param_2, void *param_3);
void arcDelete(int id);
void * arcOpen(void* path, u32 *startaddr, u32 *length);

void arcInit(void) {
    int i;
    for(i = 0; i < 4; i++) {
        memset(&lbl_803D8470[i], 0, sizeof(struct ARCHeaderNew));
    }
}

int arcDataCheck(void *param_1) {
    int i;
    for(i = 0; i < 4; i++) {
        if(lbl_803D8470[i].param_2 <= param_1 && (u32)lbl_803D8470[i].param_2 + (u32)lbl_803D8470[i].param_3 >= (u32)param_1)
            return 1;
    }
    return 0;
}

void arcEntry(int id, void *param_2, void *param_3) {
    lbl_803D8470[id].param_2 = param_2;
    lbl_803D8470[id].param_3 = param_3;
    ARCInitHandle(lbl_803D8470[id].param_2, &lbl_803D8470[id].arcfile);
    lbl_803D8470[id].unk0 |= 1;
}

void arcDelete(int id) {
    memset(&lbl_803D8470[id], 0, sizeof(struct ARCHeaderNew));
}

void * arcOpen(void* path, u32 *startaddr, u32 *length) {
    rxArchiveFile file; // sp+8
    rxArchiveFile *f = &file;
    int i;

    for(i = 0; i < 4; i++) {
        if ((lbl_803D8470[i].unk0 & 1) && ARCOpen(&lbl_803D8470[i].arcfile, path, f)) {
            void * startaddrVal = ARCGetStartAddrInMem(f);
            if(startaddr != NULL) {
                *startaddr = (u32)startaddrVal;
            }
            if(length != NULL) {
                *length = ARCGetLength(f);
            }
            ARCClose(f);
            return startaddrVal;
        }
    }
    if(startaddr != NULL) {
        *startaddr = 0;
    }
    if(length != NULL) {
        *length = 0;
    }
    return NULL;
}
