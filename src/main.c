#include "global.h"

void main(void) {
    marioStInit();
    marioStMain();

    // perform game loop.
    while(1) {
        u32 beforeTick = OSGetTick();

        DEMOBeforeRender();
        func_8006E66C();
        marioStMain();
        lbl_80410310->tickStore1 = OSGetTick() - beforeTick;
        DEMODoneRender();
        lbl_80410310->tickStore2 = OSGetTick() - beforeTick;
    }
}
