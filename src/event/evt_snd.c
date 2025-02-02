#include "evt/evt_snd.h"
#include "pmario_sound.h"

USER_FUNC(evt_snd_bgmon) {
    //psndBGMOn((u32)evt->args[0], (const char*)evt->args[1]);
    return EVT_RETURN_DONE;
}



USER_FUNC(evt_snd_sfxon_3d) {
    s32* args = event->args;
    Vec position;
    const char* name;
    s32 index;
    
    name = (const char*)args[0];
    position.x = evtGetFloat(event, args[1]);
    position.y = evtGetFloat(event, args[2]);
    position.z = evtGetFloat(event, args[3]);
    index = args[4];
    if ((index == 0) || ((u32)(index + 0x0EE70000) == 0x4D80U)) {
        //psndSFXOn_3D(name, &position);
    } else {
        //evtSetValue(event, index, psndSFXOn_3D(name, &position));
    }
    return EVT_RETURN_DONE;
}
