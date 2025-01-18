#include "battle/battle_menu_disp.h"
#include "system.h"

extern BattleWork* _battleWorkPointer;
extern int sprintf(char* str, const char* format, ...);

//.sbss
s8 seq;

//.sdata
GXColor seleItemCoordCol = {0xFF, 0xC0, 0xC0, 0xCF};

void SelectedItemCoordinateColorUpDate(void) {
    switch (seq) {
        case 0:
            if (++seleItemCoordCol.g == 0xFF) {
                seq = 1;
            }
            break;
        case 1:
            if (--seleItemCoordCol.r == 0xC0) {
                seq = 2;
            }
            break;
        case 2:
            if (++seleItemCoordCol.b == 0xFF) {
                seq = 3;
            }
            break;
        case 3:
            if (--seleItemCoordCol.g == 0xC0) {
                seq = 4;
            }
            break;
        case 4:
            if (++seleItemCoordCol.r == 0xFF) {
                seq = 5;
            }
            break;
        case 5:
            if (--seleItemCoordCol.b == 0xC0) {
                seq = 0;
            }
            break;
    }
}

BOOL BattleMenuKeyOKInACT(BattleWork* wp) {
	return FALSE; //TODO: finish when I get the struct more done
}

void battleMenuDispInit(void) {
	BattleWork* wp = _battleWorkPointer;
	char path[256];

	sprintf(path, "%s/battle/common/battle_common.tpl", getMarioStDvdRoot());
	wp->menuTex = fileAlloc(path, 4);
}

void battleMenuDispEnd(void) {
	fileFree(_battleWorkPointer->menuTex);
}