#include "countdown.h"

#include "mario/mariost.h"
#include <string.h>

extern GlobalWork* gp;

//.sbss
static CountdownWork* wp;

void countDownInit(void) {
    wp = &gp->countdown;
    memset(&gp->countdown, 0, sizeof(gp->countdown));
}

void countDownSaveReStart(void) {
}

void countDownMain(void) {
}

s32 countDownGetStatus(void) {
    CountdownWork* work = wp;
    return !(work->flags & 1) ? -1 : (work->flags >> 1) & 1;
}

void countDownEnd(void) {
    if ((wp->flags & 1) != 0) {
        wp->unk30 = 2;
    }
}
