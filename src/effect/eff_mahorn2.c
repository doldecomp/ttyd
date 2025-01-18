/* Mahon = Wizzerd */

#include "eff/eff_mahorn2.h"
#include "memory.h"
#include <math.h>
#include <string.h>

#define TWO_PI 6.283185307179586f

EffectEntry *effMahorn2Entry(BOOL unused, f32 posX, f32 posY, f32 posZ, f32 dstX, f32 dstY, f32 dstZ, f32 scale, f32 radius) {
    EffectEntry *effect;
    effMahorn2Data *data;
    f32 temp;
    int i;
    
    effect = effEntry();
    effect->type = "Mahorn2";
    effect->count = 14;
    data = __memAlloc(HEAP_EFFECT, sizeof(effMahorn2Data) * 14);
    effect->userdata = data;
    //effect->callback = effMahorn2Main;
    data->unused = unused;
    data->unused2 = 0;
    data->intplStep = 0;
    data->position.x = posX;
    data->position.y = posY;
    data->position.z = posZ;
    data->target.x = dstX;
    data->target.y = dstY;
    data->target.z = dstZ;
    data->scale = scale;
    data->hitDistance = radius;
    data->alpha = 255;
    data->type = 0;
    data->hasHit = FALSE;
    data++;
    
    for (i = 1; i < 4; i++, data++) {
        memset(data, 0, sizeof(effMahorn2Data));
        data->type = 1;
        data->position.x = 0.0f;
        data->position.y = 0.0f;
        data->position.z = 0.0f;
        data->scale = 6.0f;
        data->alpha = 0;
        data->counter = 15 * (i - 1);
    }
    
    for (i = 4; i < 5; i++, data++) {
        memset(data, 0, sizeof(effMahorn2Data));
        data->type = 2;
        data->position.x = 0.0f;
        data->position.y = 0.0f;
        data->position.z = 0.0f;
        data->scale = 0.0f;
        data->alpha = 153;
        data->counter = 15;
    }
    
    for (i = 5; i < 6; i++, data++) {
        memset(data, 0, sizeof(effMahorn2Data));
        data->type = 3;
        data->position.x = 0.0f;
        data->position.y = 0.0f;
        data->position.z = 0.0f;
        data->scale = 0.0f;
        data->alpha = 153;
        data->counter = 60;
    }
    
    for (i = 6; i < effect->count; i++, data++) {
        memset(data, 0, sizeof(effMahorn2Data));
        data->type = 4;
        data->position.x = dstX - posX;
        data->position.y = dstY - posY;
        data->position.z = dstZ - posZ;
        temp = TWO_PI * (f32)(i - 6);
        data->target.x = 6.0f * (f32)sin(temp / (f32)(effect->count - 6));
        data->target.y = 6.0f * (f32)cos(temp / (f32)(effect->count - 6));
        data->target.z = 0.0f;
        data->scale = 0.0f;
        data->alpha = 255;
        data->counter = 0;
    }
    
    return effect;
}