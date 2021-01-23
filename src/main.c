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
        gp->tickStore1 = OSGetTick() - beforeTick;
        DEMODoneRender();
        gp->tickStore2 = OSGetTick() - beforeTick;
    }
}
