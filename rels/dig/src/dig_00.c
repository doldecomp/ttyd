#include "dolphin/exi.h"
#include "driver/animdrv.h"
#include "driver/dispdrv.h"
#include "driver/npcdrv.h"
#include "evt/evt_cmd.h"
#include "evt/evt_npc.h"
#include "forcedata.h"
#include "manager/evtmgr_cmd.h"
#include "mario/mariost.h"
#include "memory.h"
#include "sdk/DEMOInit.h"
#include "seq/seq_demo.h"
#include <stdlib.h>
// #include <stdlib.h>

#pragma pool_data off

USER_FUNC(evt_mario_cont_onoff);
USER_FUNC(evt_party_cont_onoff);
USER_FUNC(evt_mario_set_pos);
USER_FUNC(evt_party_set_pos);
USER_FUNC(z);
USER_FUNC(evt_cam3d_evt_set);
USER_FUNC(evt_cam_letter_box_disable);
USER_FUNC(movie);
USER_FUNC(evt_fade_set_mapchange_type);
USER_FUNC(evt_seq_wait);
USER_FUNC(evt_fade_end_wait);
USER_FUNC(evt_key_get_buttontrg);
USER_FUNC(sound_fade);
USER_FUNC(evt_fade_entry);
USER_FUNC(evt_seq_set_seq);
USER_FUNC(evt_action_sub);
USER_FUNC(evt_npc_entry);
USER_FUNC(evt_npc_status_onoff);
USER_FUNC(evt_npc_set_tribe);
USER_FUNC(evt_sub_random);
USER_FUNC(gravity_scale);
USER_FUNC(evt_npc_set_walk_anim);
USER_FUNC(evt_npc_set_ry);
USER_FUNC(evt_npc_jump_position_nohit);
USER_FUNC(evt_sub_intpl_msec_get_value);
USER_FUNC(evt_sub_intpl_msec_init);
USER_FUNC(evt_npc_reverse_ry);

// clang-format off
extend_data(0,
     u64, negone_one, 0xBF8000003F800000,
     u32, neg_one, 0xBF800000,
     f32, __local_PI, 3.1415926535897932384626433832795f,
     f32, __local_3PIO2, 3.0f * 1.57079632679489661923132169163975f,
     u64, one_negone, 0x3F800000BF800000,
     f32, __local_PIO2, 1.57079632679489661923132169163975f,
     f32, one, 1.0f);
extend_data(1,
     u64, negone_one, 0xBF8000003F800000,
     u32, neg_one, 0xBF800000,
     f32, __local_PI, 3.1415926535897932384626433832795f,
     f32, __local_3PIO2, 3.0f * 1.57079632679489661923132169163975f,
     u64, one_negone, 0x3F800000BF800000,
     f32, __local_PIO2, 1.57079632679489661923132169163975f,
     f32, one, 1.0f)
// clang-format on

typedef struct DigestWork {
    s32 frameNumber; // 0x0
} DigestWork;

DigestWork work;
DigestWork* wp = &work;

typedef struct AnimTblUnknown {
    const char* field_0; // 0x0
    s32 field_4;         // 0x4
    s32 field_8;         // 0x8
} AnimTblUnknown;
AnimTblUnknown anim_tbl[] = {
    { "ダイジェストマリオ", 7, 0 },
    { "ルイージ", 7, 0 },
    { "ダイジェストピーチ", 3, 0 },
    { "ダイジェストピーチ２", 3, 0 },
    { "クッパ", 11, 0 },
    { "カメックババ", 3, 0 },
    { "第三勢力総統", 3, 0 },
    { "第三勢力幹部", 3, 0 },
    { "軍団ザコ敵", 3, 0 },
    { "マジョリン", 3, 0 },
    { "マリリン", 3, 0 },
    { "クリスチーヌ", 7, 0 },
    { "ノコタロウ", 3, 0 },
    { "クラウダ", 3, 0 },
    { "ヨッシー", 3, 0 },
    { "サンダース", 3, 0 },
    { "チュチュリーナ", 3, 0 },
    { "キノじい", 3, 0 },
    { "クリハカセ", 3, 0 },
    { "パラシュートボム", 8, 0 },
    { "ノコノコ", 3, 0 },
    { "クリボー", 3, 0 },
    { "パワーアップ屋", 3, 0 },
    { "キノピオ", 3, 0 },
    { "ノコリン", 3, 0 },
    { "プニ族", 32, 0 },
    { "トゲ族", 32, 0 },
    { "キノシコワ", 3, 0 },
    { "美女", 3, 0 },
    { "ガンス", 3, 0 },
    { "ブレッドハート", 3, 0 },
    { "ランペル", 3, 0 },
    { "パンジーさん", 19, 0 },
    { "ガラの悪い水夫", 3, 0 },
    { "マルコ", 3, 0 },
    { "ポワン探偵", 3, 0 },
    { "グルメキノピオ", 3, 0 },
    { "ホワイト将軍", 3, 0 },
    { "モニー", 3, 0 },
    { "ボッタクール", 3, 0 },
    { "フラワーさん", 3, 0 },
    { "星マニア", 3, 0 },
    { "バニーテレサ", 17, 0 },
    { "キザ野郎", 3, 0 },
    { "ウスグラ店おじさん", 3, 0 },
    { "ハンマーブロス", 35, 0 },
    { "ホネノコ", 3, 0 },
    { "チョロボン", 3, 0 },
};

// clang-format off
EVT_BEGIN(evt_action_1_2)
    CALL(evt_sub_random, 400, LW(0))
    SUBTRACT(LW(0), 200)
    CALL(evt_npc_get_height, LW(10), LW(9))
    MULTIPLY_FLOAT(LW(9), FLOAT(2.0f))
    SET_FLOAT_VALUE(LW(1), FLOAT(-240.0f))
    SUBTRACT_FLOAT(LW(1), LW(9))
    CALL(evt_npc_set_position, LW(10), LW(0), LW(1), 0)
    CALL(evt_npc_get_position, LW(10), LW(6), LW(7), LW(8))
    CALL(evt_sub_random, 1000, LW(0))
    IF_INT_LESS(LW(0), 500)
        CALL(evt_npc_set_ry, LW(10), 90)
        CALL(evt_npc_flag_onoff, 1, LW(10), 32768)
        ELSE
        CALL(evt_npc_set_ry, LW(10), 270)
        CALL(evt_npc_flag_onoff, 1, LW(10), 32768)
    END_IF
    MULTIPLY_FLOAT(LW(9), FLOAT(10.0f))
    SET_VALUE(LW(5), LW(10))
    CALL(evt_sub_intpl_msec_init, 11, 0, LW(9), 700)
    LOOP(0)
        CALL(evt_sub_intpl_msec_get_value)
        DIVIDE_FLOAT(LW(0), FLOAT(10.0f))
        ADD_FLOAT(LW(0), LW(7))
        CALL(evt_npc_set_position, LW(5), LW(6), LW(0), LW(8))
        WAIT_FRAMES(1)
        IF_INT_EQUAL(LW(1), 0)
            BREAK_LOOP
        END_IF
    END_LOOP
    CALL(evt_npc_flag_onoff, 0, LW(5), 32768)
    IF_INT_EQUAL(LF(0), 0)
        WAIT_MS(500)
        CALL(evt_npc_reverse_ry, LW(5))
        WAIT_MS(500)
        CALL(evt_npc_reverse_ry, LW(5))
        WAIT_MS(500)
        ELSE
        WAIT_MS(1000)
    END_IF
    CALL(evt_sub_intpl_msec_init, 11, LW(9), 0, 400)
    LOOP(0)
        CALL(evt_sub_intpl_msec_get_value)
        DIVIDE_FLOAT(LW(0), FLOAT(10.0f))
        ADD_FLOAT(LW(0), LW(7))
        CALL(evt_npc_set_position, LW(5), LW(6), LW(0), LW(8))
        WAIT_FRAMES(1)
        IF_INT_EQUAL(LW(1), 0)
            BREAK_LOOP
        END_IF
    END_LOOP
    CALL(evt_npc_delete, LW(5))
    RETURN
    END
EVT_END()

EVT_BEGIN(evt_action_1)
    SET_VALUE(LF(0), 0)
    CALL_CHILD(evt_action_1_2)
    RETURN
    END
EVT_END()

EVT_BEGIN(evt_action_2)
    SET_VALUE(LF(0), 1)
    CALL_CHILD(evt_action_1_2)
    RETURN
    END
EVT_END()

EVT_BEGIN(evt_action_jump)
    CALL(evt_sub_random, 400, LW(0))
    SUBTRACT(LW(0), 200)
    CALL(evt_sub_random, 360, LW(5))
    CALL(evt_npc_set_ry, LW(10), LW(5))
    CALL(evt_npc_flag_onoff, 1, LW(10), 32768)
    CALL(evt_npc_set_walk_anim, LW(10))
    CALL(evt_npc_set_position, LW(10), LW(0), -400, 0)
    CALL(evt_npc_jump_position_nohit, LW(10), LW(0), -400, 0, 1500, 250)
    CALL(evt_npc_delete, LW(10))
    RETURN
    END
EVT_END()

EVT_BEGIN(evt_action_fall)
    CALL(evt_sub_random, 400, LW(0))
    SUBTRACT(LW(0), 200)
    CALL(evt_npc_set_position, LW(10), LW(0), 300, 0)
    CALL(evt_npc_flag_onoff, 1, LW(10), 131072)
    CALL(gravity_scale, LW(10))
    CALL(evt_npc_set_walk_anim, LW(10))
    LOOP(0)
        CALL(evt_npc_get_position, LW(10), LW(0), LW(1), LW(2))
        IF_INT_LESS(LW(1), -300)
            BREAK_LOOP
        END_IF
        WAIT_FRAMES(1)
    END_LOOP
    CALL(evt_npc_delete, LW(10))
    RETURN
    END
EVT_END()

EVT_BEGIN(evt_action_walk)
    CALL(evt_sub_random, 320, LW(0))
    SUBTRACT(LW(0), 160)
    SUBTRACT(LW(0), 100)
    CALL(evt_sub_random, 1000, LW(1))
    CALL(evt_npc_flag_onoff, 1, LW(10), 32768)
    IF_INT_GREATER(LW(1), 500)
        CALL(evt_npc_set_position, LW(10), -400, LW(0), 0)
        CALL(evt_npc_move_position, LW(10), 400, LW(0), 0, FLOAT(80.0f), 1)
        ELSE
        CALL(evt_npc_set_position, LW(10), 400, LW(0), 0)
        CALL(evt_npc_move_position, LW(10), -400, LW(0), 0, FLOAT(80.0f), 1)
    END_IF
    CALL(evt_npc_delete, LW(10))
    RETURN
    END
EVT_END()

EVT_BEGIN(evt_action)
    LOOP(0)
        CALL(evt_action_sub, LW(0), LW(1), LW(2), LW(3))
        SET_VALUE(LW(10), LW(1))
        CALL(evt_npc_entry, LW(10), LW(0))
        CALL(evt_npc_set_position, LW(10), -1000, 0, 0)
        CALL(evt_npc_set_scale, LW(10), FLOAT(2.0f), FLOAT(2.0f), FLOAT(2.0f))
        CALL(evt_npc_flag_onoff, 1, LW(10), 1073743360)
        CALL(evt_npc_status_onoff, 1, LW(10), 2)
        CALL(evt_npc_set_tribe, LW(10), LW(1))
        IF_BITS_SET(LW(2), 1)
            SPAWN_EVENT(evt_action_1)
            GOTO(0)
        END_IF
        IF_BITS_SET(LW(2), 2)
            SPAWN_EVENT(evt_action_2)
            GOTO(0)
        END_IF
        IF_BITS_SET(LW(2), 4)
            SPAWN_EVENT(evt_action_jump)
            GOTO(0)
        END_IF
        IF_BITS_SET(LW(2), 8)
            SPAWN_EVENT(evt_action_fall)
            GOTO(0)
        END_IF
        IF_BITS_SET(LW(2), 16)
            SPAWN_EVENT(evt_action_walk)
            GOTO(0)
        END_IF
        IF_BITS_SET(LW(2), 32)
            IF_INT_NOT_EQUAL(LW(3), 0)
                SPAWN_EVENT(LW(3))
                ELSE
                CALL(evt_npc_delete, LW(10))
            END_IF
            GOTO(0)
        END_IF
        LABEL(0)
        CALL(evt_sub_random, 3000, LW(0))
        ADD(LW(0), 3000)
        WAIT_MS(LW(0))
    END_LOOP
    RETURN
    END
EVT_END()

EVT_BEGIN(dig_00_init_evt)
    CALL(evt_mario_cont_onoff, 0)
    CALL(evt_party_cont_onoff, 0, 0)
    CALL(evt_mario_set_pos, 0, -1000, 0)
    CALL(evt_party_set_pos, 0, 0, -1000, 0)
    CALL(z, LW(0))
    CALL(evt_cam3d_evt_set, 0, 0, LW(0), 0, 0, 0, 0, 11)
    CALL(evt_cam_letter_box_disable, 1)
    SPAWN_EVENT(evt_action)
    SET_VALUE(GF(0), 0)
    BEGIN_INLINE_EVENT
        SET_TYPE(0)
        CALL(movie)
    END_INLINE_EVENT
    CALL(evt_fade_set_mapchange_type, 1, -1, -1, 20, 1000)
    BEGIN_INLINE_EVENT
        SET_TYPE(0)
        CALL(evt_seq_wait, 2)
        CALL(evt_fade_end_wait)
        LOOP(0)
            CALL(evt_key_get_buttontrg, 0, LW(0))
            IF_BITS_SET(LW(0), 4352)
                SET_VALUE(GF(0), 1)
            END_IF
            IF_INT_EQUAL(GF(0), 1)
                BREAK_LOOP
            END_IF
            WAIT_FRAMES(1)
        END_LOOP
        CALL(sound_fade)
        CALL(evt_fade_entry, 21, 1000, 255, 255, 255)
        CALL(evt_fade_end_wait)
        CALL(evt_fade_set_mapchange_type, 1, 21, 0, -1, -1)
        CALL(evt_seq_set_seq, 3, STRING("title"), 0)
    END_INLINE_EVENT
    RETURN
    END
EVT_END();
// clang-format on

void dig_thpInit(void) {
    u32 size;
    u8* buffer;
    u32 type;

    EXIGetType(0, 2, &type);
    if (type != EXI_IS_VIEWER) {
        THPSimpleInit(2);
        THPSimpleOpen("demo.thp");
        size = THPSimpleCalcNeedMemory();
        buffer = _mapAlloc(size);
        THPSimpleSetBuffer(buffer);
        THPSimpleAudioStop();
        THPSimplePreLoad(0);
        THPSimpleAudioStart();
        THPSimpleSetVolume(80, 0);
    }
}

void dig_thpStop(void) {
    u32 type;

    EXIGetType(0, 2, &type);
    if (type != EXI_IS_VIEWER) {
        THPSimpleAudioStop();
        THPSimpleLoadStop();
        THPSimpleClose();
        THPSimpleQuit();
    }
}

void FontDrawString(const char*, f32, f32);
u16 FontGetMessageWidth(const char*);

void movie_draw(CameraId cameraId, void* param) {
    u32 width, height;
    u32 type;
    const char* string;

    EXIGetType(0, 2, &type);
    if (type == EXI_IS_VIEWER) {
        string = "ここにムービーがながれます";
        FontDrawStart();
        FontDrawColor((GXColor){ 0xFF, 0xFF, 0xFF, 0xFF });
        FontDrawString(string, (f32)(-FontGetMessageWidth(string) / 2), 0.0f);
        wp->frameNumber++;
    } else {
        width = gp->fbWidth;
        height = gp->efbHeight;
        if (THPSimpleDecode(0) != 1) {
            GXRenderModeObj* rmode = DEMOGetRenderModeObj();
            wp->frameNumber = THPSimpleDrawCurrentFrame(rmode, 0, 0, width, height);
        }
    }
}

USER_FUNC(movie) {
    u32 type;

    if (isFirstCall != 0) {
        memset(wp, 0, sizeof(DigestWork));
        evtSetValue(event, GF(0), 0);
    }

    EXIGetType(0, 2, &type);
    if (type != EXI_IS_VIEWER) {
        if (wp->frameNumber >= THPSimpleGetTotalFrame() - 2) {
            evtSetValue(event, GF(0), 1);
        }
    } else if (wp->frameNumber >= 300) {
        evtSetValue(event, GF(0), 1);
    }
    dispEntry(CAMERA_3D, 0.0f, 3, movie_draw, NULL);
    return EVT_RETURN_BLOCK;
}
USER_FUNC(sound_fade) {
    THPSimpleSetVolume(0, 2000);
    return EVT_RETURN_DONE;
}

USER_FUNC(gravity_scale) {
    const char* name = (const char*)evtGetValue(event, *event->args);
    NpcEntry* npc = npcNameToPtr(name);
    npc->jumpGravity = 0.1f;
    return EVT_RETURN_DONE;
}

USER_FUNC(evt_action_sub) {
    s32* args = event->args;
    AnimTblUnknown* anim;

    rand();

    do {
        anim = &anim_tbl[rand() % 48u];
    } while (evtNpcNameToPtr_NoAssert(event, anim->field_0) != NULL);
    
}
/*
USER_FUNC(evt_action_sub) {
    s32* args = event->args;
    s32 index;
    AnimTblUnknown* entry;
    s32 flags;
    s32 numAnims;
    s32 sel;
    s32 mask;
    s32 i;
    u32 type;
    const char* name;

    rand();

    do {
        entry = &anim_tbl[rand() % 48u];
    } while (evtNpcNameToPtr_NoAssert(event, entry->field_0) != NULL);

    flags = entry->field_4;
    numAnims = 0;
    for (i = 0; i < 6; i++) {
        if (flags & (1 << i)) {
            numAnims++;
        }
    }
    entry->field_4 = flags;

    sel = rand() % numAnims;
    for (i = 0; i < 6; i++) {
        if (entry->field_4 & (1 << i)) {
            if (--sel < 0) {
                break;
            }
        }
    }
    mask = 1 << i;

    name = entry->field_0;
    EXIGetType(0, 2, &type);
    if (type != 0x05070000) {
        NpcTribeInfo* tribe = npcGetTribe(name);
        evtSetValue(event, *args++, (s32)tribe->modelName);
        evtSetValue(event, *args++, (s32)name);
    } else {
        evtSetValue(event, *args++, (s32)"a_mario");
        evtSetValue(event, *args++, (s32)"にせマリオ２");
    }
    evtSetValue(event, *args++, mask);
    evtSetValue(event, *args++, entry->field_8);

    return EVT_RETURN_DONE;
}
*/

USER_FUNC(z) {
    return EVT_RETURN_DONE;
}
