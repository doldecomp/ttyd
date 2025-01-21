/* "evtmgr_cmd" - Command Event Manager
* Status: 1:1
*
* Function: handles all the opcodes/commands an event can use to actually "run" the script
*
* Last Update: 9/20/2022, should be completely finished
*/
#include "mgr/evtmgr_cmd.h"
#include "memory.h"
#include "mgr/evtmgr.h"
#include "driver/swdrv.h"
#include <dolphin/os.h>
#include <string.h>

extern int sprintf(char* str, const char* fmt, ...);

//local prototypes
static inline f32 check_float(s32 val);
static inline s32 change_float(f32 val);

inline s32 evt_end_evt(EventEntry* entry); // 2
inline s32 evt_lbl(EventEntry* entry); // 3
inline s32 evt_goto(EventEntry* entry); // 4
inline s32 evt_do(EventEntry* entry); // 5
s32 evt_while(EventEntry* entry); // 6
inline s32 evt_do_break(EventEntry* entry); // 7
inline s32 evt_do_continue(EventEntry* entry); // 8
inline s32 evt_wait_frm(EventEntry* entry); // 9
s32 evt_wait_msec(EventEntry* entry); // 10
inline s32 evt_halt(EventEntry* entry); // 11
s32 evt_if_str_equal(EventEntry* entry); // 12
s32 evt_if_str_not_equal(EventEntry* entry); // 13
s32 evt_if_str_small(EventEntry* entry); // 14
s32 evt_if_str_large(EventEntry* entry); // 15
s32 evt_if_str_small_equal(EventEntry* entry); // 16
s32 evt_if_str_large_equal(EventEntry* entry); // 17
s32 evt_iff_equal(EventEntry* entry); // 18
s32 evt_iff_not_equal(EventEntry* entry); // 19
s32 evt_iff_small(EventEntry* entry); // 20
s32 evt_iff_large(EventEntry* entry); // 21
s32 evt_iff_small_equal(EventEntry* entry); // 22
s32 evt_iff_large_equal(EventEntry* entry); // 23
s32 evt_if_equal(EventEntry* entry); // 24
s32 evt_if_not_equal(EventEntry* entry); // 25
s32 evt_if_small(EventEntry* entry); // 26
s32 evt_if_large(EventEntry* entry); // 27
s32 evt_if_small_equal(EventEntry* entry); // 28
s32 evt_if_large_equal(EventEntry* entry); // 29
s32 evt_if_flag(EventEntry* entry); // 30
s32 evt_if_not_flag(EventEntry* entry); // 31
inline s32 evt_else(EventEntry* entry); // 32
inline s32 evt_end_if(EventEntry* entry); // 33
inline s32 evt_switch(EventEntry* entry); // 34
inline s32 evt_switchi(EventEntry* entry); // 35
s32 evt_case_equal(EventEntry* entry); // 36
s32 evt_case_not_equal(EventEntry* entry); // 37
s32 evt_case_small(EventEntry* entry); // 38
s32 evt_case_small_equal(EventEntry* entry); // 39
s32 evt_case_large(EventEntry* entry); // 40
s32 evt_case_large_equal(EventEntry* entry); // 41
s32 evt_case_between(EventEntry* entry); // 42
inline s32 evt_case_etc(EventEntry* entry); // 43
s32 evt_case_flag(EventEntry* entry); // 44
s32 evt_case_or(EventEntry* entry); // 45
s32 evt_case_and(EventEntry* entry); // 46
s32 evt_case_end(EventEntry* entry); // 47
inline s32 evt_switch_break(EventEntry* entry); // 48
inline s32 evt_end_switch(EventEntry* entry); // 49
inline s32 evt_set(EventEntry* entry); // 50
inline s32 evt_seti(EventEntry* entry); // 51
inline s32 evt_setf(EventEntry* entry); // 52
inline s32 evt_add(EventEntry* entry); // 53
inline s32 evt_sub(EventEntry* entry); // 54
inline s32 evt_mul(EventEntry* entry); // 55
inline s32 evt_div(EventEntry* entry); // 56
inline s32 evt_mod(EventEntry* entry); // 57
inline s32 evt_addf(EventEntry* entry); // 58
inline s32 evt_subf(EventEntry* entry); // 59
inline s32 evt_mulf(EventEntry* entry); // 60
inline s32 evt_divf(EventEntry* entry); // 61
inline s32 evt_set_read(EventEntry* entry); // 62
inline s32 evt_set_readf(EventEntry* entry); // 63
inline s32 evt_read(EventEntry* entry); // 64
inline s32 evt_read2(EventEntry* entry); // 65
inline s32 evt_read3(EventEntry* entry); // 66
inline s32 evt_read4(EventEntry* entry); // 67
inline s32 evt_read_n(EventEntry* entry); // 68
inline s32 evt_readf(EventEntry* entry); // 69
inline s32 evt_readf2(EventEntry* entry); // 70
inline s32 evt_readf3(EventEntry* entry); // 71
inline s32 evt_readf4(EventEntry* entry); // 72
inline s32 evt_readf_n(EventEntry* entry); // 73
inline s32 evt_set_user_wrk(EventEntry* entry); // 74
inline s32 evt_set_user_flg(EventEntry* entry); // 75
inline s32 evt_alloc_user_wrk(EventEntry* entry); // 76
inline s32 evt_and(EventEntry* entry); // 77
inline s32 evt_andi(EventEntry* entry); // 78
inline s32 evt_or(EventEntry* entry); // 79
inline s32 evt_ori(EventEntry* entry); // 80
inline s32 evt_set_frame_from_msec(EventEntry* entry); // 81
inline s32 evt_set_msec_from_frame(EventEntry* entry); // 82
inline s32 evt_set_ram(EventEntry* entry); // 83
inline s32 evt_set_ramf(EventEntry* entry); // 84
inline s32 evt_get_ram(EventEntry* entry); // 85
inline s32 evt_get_ramf(EventEntry* entry); // 86
inline s32 evt_setr(EventEntry* entry); // 87
inline s32 evt_setrf(EventEntry* entry); // 88
inline s32 evt_getr(EventEntry* entry); // 89
inline s32 evt_getrf(EventEntry* entry); // 90
inline s32 evt_user_func(EventEntry* entry); // 91
s32 evt_run_evt(EventEntry* entry); // 92
s32 evt_run_evt_id(EventEntry* entry); // 93
inline s32 evt_run_child_evt(EventEntry* entry); // 94
inline s32 evt_restart_evt(EventEntry* entry); // 95
inline s32 evt_delete_evt(EventEntry* entry); // 96
inline s32 evt_set_pri(EventEntry* entry); // 97
inline s32 evt_set_spd(EventEntry* entry); // 98
inline s32 evt_set_type(EventEntry* entry); // 99
inline s32 evt_stop_all(EventEntry* entry); // 100
inline s32 evt_start_all(EventEntry* entry); // 101
inline s32 evt_stop_other(EventEntry* entry); // 102
inline s32 evt_start_other(EventEntry* entry); // 103
inline s32 evt_stop_id(EventEntry* entry); // 104
inline s32 evt_start_id(EventEntry* entry); // 105
inline s32 evt_chk_evt(EventEntry* entry); // 106
s32 evt_inline_evt(EventEntry* entry); // 107
s32 evt_inline_evt_id(EventEntry* entry); // 108
inline s32 evt_end_inline(EventEntry* entry); // 109
s32 evt_brother_evt(EventEntry* entry); // 110
s32 evt_brother_evt_id(EventEntry* entry); // 111
inline s32 evt_end_brother(EventEntry* entry); // 112
inline s32 evt_debug_put_msg(EventEntry* entry); // 113
inline s32 evt_debug_msg_clear(EventEntry* entry); // 114
s32 evt_debug_put_reg(EventEntry* entry); // 115
inline s32 evt_debug_name(EventEntry* entry); // 116
inline s32 evt_debug_rem(EventEntry* entry); // 117
inline s32 evt_debug_bp(EventEntry* entry); // 118

inline s32* evtSearchLabel(EventEntry* entry, s32 id);
inline s32* evtSearchElse(EventEntry* entry);
inline s32* evtSearchEndIf(EventEntry* entry);
inline s32* evtSearchEndSwitch(EventEntry* entry);
inline s32* evtSearchCase(EventEntry* entry);
inline s32* evtSearchWhile(EventEntry* entry);
inline s32* evtSearchJustBeforeWhile(EventEntry* entry);
inline s32* evtSearchBreakLoop(EventEntry* entry);
inline s32* evtSearchContinueLoop(EventEntry* entry);

f32 check_float(s32 val) {
    f32 ret;
    if (val <= EVTDAT_FLOAT_MAX) {
        val += EVTDAT_FLOAT_BASE;
        ret = val;
        ret /= 1024.0f;
    }
    else {
        ret = val;
    }

    return ret;
}

s32 change_float(f32 val) {
    s32 ret;
    val *= 1024.0f;
    ret = (s32)val;
    ret -= EVTDAT_FLOAT_BASE;
    
    return ret;
}

s32 evt_end_evt(EventEntry* entry) { // 2
    evtDelete(entry);
    
    return EVT_RETURN_FINISH;
}

s32 evt_lbl(EventEntry* entry) { // 3
    return EVT_RETURN_DONE;
}

s32 evt_goto(EventEntry* entry) { // 4
    s32 lbl;

    lbl = evtGetValue(entry, *entry->args);
    entry->nextCommand = evtSearchLabel(entry, lbl);

    return EVT_RETURN_DONE;
}

s32 evt_do(EventEntry* entry) { // 5
    s32* args = entry->args;
    s32 count;
    s32 depth;

    count = *args++;

    entry->loopDepth++;
    depth = entry->loopDepth;

    entry->loopStartPtrs[depth] = args;
    entry->loopCounters[depth] = count;

    return EVT_RETURN_DONE;
}

s32 evt_while(EventEntry* entry) { // 6
	s32 depth = entry->loopDepth;
	s32 counter = entry->loopCounters[depth];

	if (counter == 0) {
		entry->nextCommand = entry->loopStartPtrs[depth];
		return EVT_RETURN_DONE;
	}
	if (counter >= -10000000) {
		entry->loopCounters[depth] = --counter;
	} else {
		s32 var = evtGetValue(entry, counter);
		evtSetValue(entry, counter, var - 1);
		counter = var - 1;
	}
	if (counter != 0) {
		entry->nextCommand = entry->loopStartPtrs[depth];
		return EVT_RETURN_DONE;
	}
	entry->loopDepth--;
	return EVT_RETURN_DONE;
}

s32 evt_do_break(EventEntry* entry) { // 7
    entry->nextCommand = evtSearchWhile(entry);
    entry->loopDepth--;
    
    return EVT_RETURN_DONE;
}

s32 evt_do_continue(EventEntry* entry) { // 8
    entry->nextCommand = evtSearchJustBeforeWhile(entry);
    
    return EVT_RETURN_DONE;
}

s32 evt_wait_frm(EventEntry* entry) { // 9
    s32* args = entry->args;

    switch (entry->blocked) {
        case FALSE:
            entry->userdata[0] = evtGetValue(entry, args[0]);
            entry->blocked = TRUE;
    }

	if (!entry->userdata[0]) {
		return EVT_RETURN_DONE;
	}
    
    entry->userdata[0]--;
    if (entry->userdata[0]) {
        return EVT_RETURN_BLOCK;
    } else {
        return EVT_RETURN_YIELD;
    }
}

s32 evt_wait_msec(EventEntry* entry) { // 10
    s32* args = entry->args;
    u64 time = (u64)entry->lifetime;
    s32 temp;
    u64 tickDiff;
    s32 msecDiff;

    switch (entry->blocked) {
        case FALSE:
            entry->userdata[0] = evtGetValue(entry, args[0]);
            entry->userdata[1] = (s32)((time >> 32) & 0xFFFFFFFF);
            entry->userdata[2] = (s32)(time & 0xFFFFFFFF);
            entry->blocked = TRUE;
            break;
    }

    temp = entry->userdata[0];
    if (temp == 0) {
        return EVT_RETURN_DONE;
    }

    tickDiff = (s32)time - entry->userdata[2];
    msecDiff = (s32)OSTicksToMilliseconds(tickDiff);
    return msecDiff >= temp ? EVT_RETURN_YIELD : EVT_RETURN_BLOCK;
}

s32 evt_halt(EventEntry* entry) { // 11
   return evtGetValue(entry, *entry->args) ? EVT_RETURN_BLOCK : EVT_RETURN_DONE;
}

s32 evt_if_str_equal(EventEntry *entry) { // 12
    s32* args = entry->args;
    const char* str1;
    const char* str2;
    
    str1 = (const char*)evtGetValue(entry, args[0]);
    str2 = (const char*)evtGetValue(entry, args[1]);
    if (!str1) {
        str1 = "";
    }
    if (!str2) {
        str2 = "";
    }
    if (strcmp(str1, str2)) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_str_not_equal(EventEntry *entry) { // 13
    s32* args = entry->args;
    const char* str1;
    const char* str2;
    
    str1 = (const char*)evtGetValue(entry, args[0]);
    str2 = (const char*)evtGetValue(entry, args[1]);
    if (!str1) {
        str1 = "";
    }
    if (!str2) {
        str2 = "";
    }
    if (!strcmp(str1, str2)) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_str_small(EventEntry *entry) { // 14
    s32* args = entry->args;
    const char* str1;
    const char* str2;
    
    str1 = (const char*)evtGetValue(entry, args[0]);
    str2 = (const char*)evtGetValue(entry, args[1]);
    if (!str1) {
        str1 = "";
    }
    if (!str2) {
        str2 = "";
    }
    if (strcmp(str1, str2) >= 0) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_str_large(EventEntry *entry) { // 15
    s32* args = entry->args;
    const char* str1;
    const char* str2;
    
    str1 = (const char*)evtGetValue(entry, args[0]);
    str2 = (const char*)evtGetValue(entry, args[1]);
    if (!str1) {
        str1 = "";
    }
    if (!str2) {
        str2 = "";
    }
    if (strcmp(str1, str2) <= 0) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_str_small_equal(EventEntry *entry) { // 16
    s32* args = entry->args;
    const char* str1;
    const char* str2;
    
    str1 = (const char*)evtGetValue(entry, args[0]);
    str2 = (const char*)evtGetValue(entry, args[1]);
    if (!str1) {
        str1 = "";
    }
    if (!str2) {
        str2 = "";
    }
    if (strcmp(str1, str2) > 0) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_str_large_equal(EventEntry *entry) { // 17
    s32* args = entry->args;
    const char* str1;
    const char* str2;
    
    str1 = (const char*)evtGetValue(entry, args[0]);
    str2 = (const char*)evtGetValue(entry, args[1]);
    if (!str1) {
        str1 = "";
    }
    if (!str2) {
        str2 = "";
    }
    if (strcmp(str1, str2) < 0) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_iff_equal(EventEntry *entry) { // 18
    s32* args = entry->args;
    f32 float1;
    f32 float2;
    
    float1 = evtGetFloat(entry, args[0]);
    float2 = evtGetFloat(entry, args[1]);
    if (float1 != float2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_iff_not_equal(EventEntry *entry) { // 19
    s32* args = entry->args;
    f32 float1;
    f32 float2;
    
    float1 = evtGetFloat(entry, args[0]);
    float2 = evtGetFloat(entry, args[1]);
    if (float1 == float2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_iff_small(EventEntry *entry) { // 20
    s32* args = entry->args;
    f32 float1;
    f32 float2;
    
    float1 = evtGetFloat(entry, args[0]);
    float2 = evtGetFloat(entry, args[1]);
    if (float1 >= float2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_iff_large(EventEntry *entry) { // 21
    s32* args = entry->args;
    f32 float1;
    f32 float2;
    
    float1 = evtGetFloat(entry, args[0]);
    float2 = evtGetFloat(entry, args[1]);
    if (float1 <= float2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_iff_small_equal(EventEntry *entry) { // 22
    s32* args = entry->args;
    f32 float1;
    f32 float2;
    
    float1 = evtGetFloat(entry, args[0]);
    float2 = evtGetFloat(entry, args[1]);
    if (float1 > float2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_iff_large_equal(EventEntry *entry) { // 22
    s32* args = entry->args;
    f32 float1;
    f32 float2;
    
    float1 = evtGetFloat(entry, args[0]);
    float2 = evtGetFloat(entry, args[1]);
    if (float1 < float2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_equal(EventEntry *entry) { // 24
    s32* args = entry->args;
    s32 value1;
    s32 value2;
    
    value1 = evtGetValue(entry, args[0]);
    value2 = evtGetValue(entry, args[1]);
    if (value1 != value2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_not_equal(EventEntry *entry) { // 25
    s32* args = entry->args;
    s32 value1;
    s32 value2;
    
    value1 = evtGetValue(entry, args[0]);
    value2 = evtGetValue(entry, args[1]);
    if (value1 == value2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_small(EventEntry *entry) { // 26
    s32* args = entry->args;
    s32 value1;
    s32 value2;
    
    value1 = evtGetValue(entry, args[0]);
    value2 = evtGetValue(entry, args[1]);
    if (value1 >= value2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_large(EventEntry *entry) { // 27
    s32* args = entry->args;
    s32 value1;
    s32 value2;
    
    value1 = evtGetValue(entry, args[0]);
    value2 = evtGetValue(entry, args[1]);
    if (value1 <= value2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_small_equal(EventEntry *entry) { // 28
    s32* args = entry->args;
    s32 value1;
    s32 value2;
    
    value1 = evtGetValue(entry, args[0]);
    value2 = evtGetValue(entry, args[1]);
    if (value1 > value2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_large_equal(EventEntry *entry) { //29
    s32* args = entry->args;
    s32 value1;
    s32 value2;
    
    value1 = evtGetValue(entry, args[0]);
    value2 = evtGetValue(entry, args[1]);
    if (value1 < value2) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_flag(EventEntry *entry) { // 30
    s32* args = entry->args;
    s32 value;
    s32 flags;
    
    value = evtGetValue(entry, args[0]);
    flags = args[1];
    if ((value & flags) == 0) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_if_not_flag(EventEntry *entry) { // 31
    s32* args = entry->args;
    s32 value;
    s32 flags;
    
    value = evtGetValue(entry, args[0]);
    flags = args[1];
    if ((value & flags) != 0) {
        entry->nextCommand = evtSearchElse(entry);
        return EVT_RETURN_DONE;
    }
    return EVT_RETURN_DONE;
}

s32 evt_else(EventEntry* entry) { // 32
    entry->nextCommand = evtSearchEndIf(entry);
    
    return EVT_RETURN_DONE;
}

s32 evt_end_if(EventEntry* entry) { // 33
    return EVT_RETURN_DONE;
}

s32 evt_switch(EventEntry* entry) { // 34
    s32 value;
    s32 depth;

    value = evtGetValue(entry, *entry->args);

    entry->switchDepth++;
    depth = entry->switchDepth;

    entry->switchValues[depth] = value;
    entry->switchStates[depth] = 1;

    return EVT_RETURN_DONE;
}

s32 evt_switchi(EventEntry* entry) { // 35
    s32 depth;
    s32 value;

    value = *entry->args;
    entry->switchDepth++;
    depth = entry->switchDepth;

    entry->switchValues[depth] = value;
    entry->switchStates[depth] = 1;

    return EVT_RETURN_DONE;
}

s32 evt_case_equal(EventEntry* entry) { // 36
    s32* args = entry->args;
    s32 depth;
    s32 state;
    s32 inputValue;
    s32 targetValue;


    depth = entry->switchDepth;
    targetValue = evtGetValue(entry, args[0]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue != inputValue) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_not_equal(EventEntry* entry) { // 37
    s32* args = entry->args;
    s32 depth;
    s32 state;
    s32 inputValue;
    s32 targetValue;


    depth = entry->switchDepth;
    targetValue = evtGetValue(entry, args[0]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue == inputValue) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_small(EventEntry* entry) { // 38
    s32* args = entry->args;
    s32 depth;
    s32 state;
    s32 inputValue;
    s32 targetValue;


    depth = entry->switchDepth;
    targetValue = evtGetValue(entry, args[0]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue <= inputValue) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_small_equal(EventEntry* entry) { // 39
    s32* args = entry->args;
    s32 depth;
    s32 state;
    s32 inputValue;
    s32 targetValue;


    depth = entry->switchDepth;
    targetValue = evtGetValue(entry, args[0]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue < inputValue) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_large(EventEntry* entry) { // 40
    s32* args = entry->args;
    s32 depth;
    s32 state;
    s32 inputValue;
    s32 targetValue;


    depth = entry->switchDepth;
    targetValue = evtGetValue(entry, args[0]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue >= inputValue) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_large_equal(EventEntry* entry) { // 41
    s32* args = entry->args;
    s32 depth;
    s32 state;
    s32 inputValue;
    s32 targetValue;


    depth = entry->switchDepth;
    targetValue = evtGetValue(entry, args[0]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue > inputValue) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_between(EventEntry* entry) { // 42
    s32* args = entry->args;
    s32 depth = entry->switchDepth;
    s32 min;
    s32 max;
    s32 state;
    s32 inputValue;

    min = evtGetValue(entry, args[0]);
    max = evtGetValue(entry, args[1]);
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if ((min <= inputValue) && (inputValue <= max)) {
            entry->switchStates[depth] = 0;
        }
        else {
            entry->nextCommand = evtSearchCase(entry);
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_etc(EventEntry* entry) { // 43
    s32 depth = entry->switchDepth;
    s32 state;

    state = entry->switchStates[depth];

    if (state <= 0) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        
        return EVT_RETURN_DONE;
    }
    else {
        entry->switchStates[depth] = 0;
        
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_flag(EventEntry* entry) { // 44
    s32* args = entry->args;
    s32 depth = entry->switchDepth;
    u32 targetMask;
    s32 state;
    s32 inputValue;

    targetMask = (u32)args[0];
    state = entry->switchStates[depth];
    inputValue = entry->switchValues[depth];

    if (0 >= state) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if ((inputValue & targetMask) == 0) {
            entry->nextCommand = evtSearchCase(entry);
        }
        else {
            entry->switchStates[depth] = 0;
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_or(EventEntry* entry) { // 45
    s32* args = entry->args;
    s32 depth = entry->switchDepth;
    s32 targetValue;
    s32 inputValue;
    s8 state;

    targetValue = evtGetValue(entry, args[0]);
    inputValue = entry->switchValues[depth];
    state = entry->switchStates[depth];
    
    if (state == 0) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue == inputValue) {
            entry->switchStates[depth] = -1;
        }
        else if (state != -1) {
            entry->nextCommand = evtSearchCase(entry);
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_and(EventEntry* entry) { // 46
    s32* args = entry->args;
    s32 depth = entry->switchDepth;
    s32 targetValue;
    s32 inputValue;


    targetValue = evtGetValue(entry, args[0]);
    inputValue = entry->switchValues[depth];
    
    if (entry->switchStates[depth] == 0) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else if (entry->switchStates[depth] == -2) {
        entry->nextCommand = evtSearchCase(entry);
        return EVT_RETURN_DONE;
    }
    else {
        if (targetValue == inputValue) {
            entry->switchStates[depth] = -1;
        }
        else {
            entry->switchStates[depth] = -2;
            entry->nextCommand = evtSearchCase(entry);
        }
        return EVT_RETURN_DONE;
    }
}

s32 evt_case_end(EventEntry* entry) { // 47
    s32* args = entry->args;
    s32 depth = entry->switchDepth;
    s32 inputValue;
    s8 state;

    inputValue = entry->switchValues[depth];
    state = entry->switchStates[depth];
    
    if (state == 0) {
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else if (state == -1) {
        entry->switchStates[depth] = 0;
        entry->nextCommand = evtSearchEndSwitch(entry);
        return EVT_RETURN_DONE;
    }
    else {
        entry->switchStates[depth] = 1;
        entry->nextCommand = evtSearchCase(entry);
        return EVT_RETURN_DONE;
    }
}

s32 evt_switch_break(EventEntry* entry) { // 48
    entry->nextCommand = evtSearchEndSwitch(entry);
    
    return EVT_RETURN_DONE;
}

s32 evt_end_switch(EventEntry* entry) { // 49
    s32 depth = entry->switchDepth;

    entry->switchStates[depth] = 0;
    entry->switchDepth--;

    return EVT_RETURN_DONE;
}

s32 evt_set(EventEntry* entry) { // 50
    s32* args = entry->args;
    s32 index;
    s32 value;

    index = args[0];
    value = evtGetValue(entry, args[1]);
    evtSetValue(entry, index, value);
    
    return EVT_RETURN_DONE;
}

s32 evt_seti(EventEntry* entry) { // 51
    s32* args = entry->args;
    s32 index;
    s32 value;

    index = args[0];
    value = args[1];
    evtSetValue(entry, index, value);
    
    return EVT_RETURN_DONE;
}

s32 evt_setf(EventEntry* entry) { // 52
    s32* args = entry->args;
    s32 index;
    f32 value;

    index = args[0];
    value = evtGetFloat(entry, args[1]);
    evtSetFloat(entry, index, value);
    
    return EVT_RETURN_DONE;
}

s32 evt_add(EventEntry* entry) { // 53
    s32* args = entry->args;
    s32 index;
    s32 param;
    s32 result;

    index = args[0];
    param = evtGetValue(entry, args[1]);
    result = evtGetValue(entry, index) + param;
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_sub(EventEntry* entry) { // 54
    s32* args = entry->args;
    s32 index;
    s32 param;
    s32 result;

    index = args[0];
    param = evtGetValue(entry, args[1]);
    result = evtGetValue(entry, index) - param;
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_mul(EventEntry* entry) { // 55
    s32* args = entry->args;
    s32 index;
    s32 param;
    s32 result;

    index = args[0];
    param = evtGetValue(entry, args[1]);
    result = evtGetValue(entry, index) * param;
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_div(EventEntry* entry) { // 56
    s32* args = entry->args;
    s32 index;
    s32 param;
    s32 result;

    index = args[0];
    param = evtGetValue(entry, args[1]);
    result = evtGetValue(entry, index) / param;
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_mod(EventEntry* entry) { // 57
    s32* args = entry->args;
    s32 index;
    s32 param;
    s32 value;
    s32 result;

    index = args[0];
    param = (s32)(evtGetValue(entry, args[1]) + 0.5f);
    value = (s32)(evtGetValue(entry, index) + 0.5f);
    result = value % param;
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_addf(EventEntry* entry) { // 58
    s32* args = entry->args;
    s32 index;
    f32 param;
    f32 result;

    index = args[0];
    param = evtGetFloat(entry, args[1]);
    result = evtGetFloat(entry, index) + param;
    evtSetFloat(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_subf(EventEntry* entry) { // 59
    s32* args = entry->args;
    s32 index;
    f32 param;
    f32 result;

    index = args[0];
    param = evtGetFloat(entry, args[1]);
    result = evtGetFloat(entry, index) - param;
    evtSetFloat(entry, index, result);
    
    return EVT_RETURN_DONE;
}
s32 evt_mulf(EventEntry* entry) { // 60
    s32* args = entry->args;
    s32 index;
    f32 param;
    f32 result;

    index = args[0];
    param = evtGetFloat(entry, args[1]);
    result = evtGetFloat(entry, index) * param;
    evtSetFloat(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_divf(EventEntry* entry) { // 61
    s32* args = entry->args;
    s32 index;
    f32 param;
    f32 result;

    index = args[0];
    param = evtGetFloat(entry, args[1]);
    result = evtGetFloat(entry, index) / param;
    evtSetFloat(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_set_read(EventEntry* entry) { // 62
    entry->readAddr = (s32*)evtGetValue(entry, *entry->args);

    return EVT_RETURN_DONE;
}

s32 evt_set_readf(EventEntry* entry) { // 63
    entry->readfAddr = (f32*)evtGetValue(entry, *entry->args);

    return EVT_RETURN_DONE;
}

s32 evt_read(EventEntry* entry) { // 64
    s32* args = entry->args;
    evtSetValue(entry, args[0], *entry->readAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_read2(EventEntry* entry) { // 65
    s32* args = entry->args;
    evtSetValue(entry, args[0], *entry->readAddr++);
    evtSetValue(entry, args[1], *entry->readAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_read3(EventEntry* entry) { // 66
    s32* args = entry->args;
    evtSetValue(entry, args[0], *entry->readAddr++);
    evtSetValue(entry, args[1], *entry->readAddr++);
    evtSetValue(entry, args[2], *entry->readAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_read4(EventEntry* entry) { // 67
    s32* args = entry->args;
    evtSetValue(entry, args[0], *entry->readAddr++);
    evtSetValue(entry, args[1], *entry->readAddr++);
    evtSetValue(entry, args[2], *entry->readAddr++);
    evtSetValue(entry, args[3], *entry->readAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_read_n(EventEntry* entry) { // 68
    s32* args = entry->args;
    s32 index;
    s32 offset;

    index = args[0];
    offset = evtGetValue(entry, args[1]);
    evtSetValue(entry, index, entry->readAddr[offset]);

    return EVT_RETURN_DONE;
}

s32 evt_readf(EventEntry* entry) { // 69
    s32* args = entry->args;
    evtSetFloat(entry, args[0], *entry->readfAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_readf2(EventEntry* entry) { // 70
    s32* args = entry->args;
    evtSetFloat(entry, args[0], *entry->readfAddr++);
    evtSetFloat(entry, args[1], *entry->readfAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_readf3(EventEntry* entry) { // 71
    s32* args = entry->args;
    evtSetFloat(entry, args[0], *entry->readfAddr++);
    evtSetFloat(entry, args[1], *entry->readfAddr++);
    evtSetFloat(entry, args[2], *entry->readfAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_readf4(EventEntry* entry) { // 72
    s32* args = entry->args;
    evtSetFloat(entry, args[0], *entry->readfAddr++);
    evtSetFloat(entry, args[1], *entry->readfAddr++);
    evtSetFloat(entry, args[2], *entry->readfAddr++);
    evtSetFloat(entry, args[3], *entry->readfAddr++);

    return EVT_RETURN_DONE;
}

s32 evt_readf_n(EventEntry* entry) { // 73
    s32* args = entry->args;
    s32 index;
    s32 offset;

    index = args[0];
    offset = evtGetValue(entry, args[1]);
    evtSetFloat(entry, index, entry->readAddr[offset]); //bug using readf?

    return EVT_RETURN_DONE;
}

s32 evt_set_user_wrk(EventEntry* entry) { // 74
    entry->uwBase = (s32*) evtGetValue(entry, *entry->args);
    
    return EVT_RETURN_DONE;
}

s32 evt_set_user_flg(EventEntry* entry) { // 75
    entry->ufBase = (s32*)evtGetValue(entry, *entry->args);
    
    return EVT_RETURN_DONE;
}

s32 evt_alloc_user_wrk(EventEntry* entry) { // 76
    s32* args = entry->args;
    s32 index;
    s32 count;

    count = evtGetValue(entry, args[0]);
    index = args[1];
    entry->uwBase = _mapAlloc(count * sizeof(s32));
    evtSetValue(entry, index, (s32)entry->uwBase);
    
    return EVT_RETURN_DONE;
}

s32 evt_and(EventEntry* entry) { // 77
    s32* args = entry->args;
    s32 index;
    s32 param;

    index = args[0];
    param = evtGetValue(entry, args[1]);
    param &= evtGetValue(entry, index);
    evtSetValue(entry, index, param);
    
    return EVT_RETURN_DONE;
}

s32 evt_andi(EventEntry* entry) { // 78
    s32* args = entry->args;
    s32 index;
    s32 param;
    
    index = args[0];
    param = args[1];
    param &= evtGetValue(entry, index);
    evtSetValue(entry, index, param);
    
    return EVT_RETURN_DONE;
}

s32 evt_or(EventEntry* entry) { // 79
    s32* args = entry->args;
    s32 index;
    s32 param;

    index = args[0];
    param = evtGetValue(entry, args[1]);
    param |= evtGetValue(entry, index);
    evtSetValue(entry, index, param);
    
    return EVT_RETURN_DONE;
}

s32 evt_ori(EventEntry* entry) { // 80
    s32* args = entry->args;
    s32 index;
    s32 param;
    
    index = args[0];
    param = args[1];
    param |= evtGetValue(entry, index);
    evtSetValue(entry, index, param);
    
    return EVT_RETURN_DONE;
}

s32 evt_set_frame_from_msec(EventEntry* entry) { // 81
    s32* args = entry->args;
    s32 index;
    s32 msec;
    s32 result;

    index = args[0];
    msec = evtGetValue(entry, args[1]);
    result = (msec * 60) / 1000; 
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_set_msec_from_frame(EventEntry* entry) { // 82
    s32* args = entry->args;
    s32 index;
    s32 frame;
    s32 result;

    index = args[0];
    frame = evtGetValue(entry, args[1]);
    result = (frame * 1000) / 60; 
    evtSetValue(entry, index, result);
    
    return EVT_RETURN_DONE;
}

s32 evt_set_ram(EventEntry* entry) { // 83
    s32* args = entry->args;
    s32 value;
    s32* addr;

    value = evtGetValue(entry, args[0]);
    addr = (s32*)args[1];
    *addr = value;
    
    return EVT_RETURN_DONE;
}

s32 evt_set_ramf(EventEntry* entry) { // 84
    s32* args = entry->args;
    f32 value;
    f32* addr;

    value = evtGetFloat(entry, args[0]);
    addr = (f32*)args[1];
    *addr = value;
    
    return EVT_RETURN_DONE;
}

s32 evt_get_ram(EventEntry* entry) { // 85
    s32* args = entry->args;
    s32* addr;
    s32 value;

    addr = (s32*)args[1];
    value = *addr;
    evtSetValue(entry, args[0], value);
    
    return EVT_RETURN_DONE;
}

s32 evt_get_ramf(EventEntry* entry) { // 86
    s32* args = entry->args;
    f32* addr;
    f32 value;

    addr = (f32*)args[1];
    value = *addr;
    evtSetFloat(entry, args[0], value);
    
    return EVT_RETURN_DONE;
}

s32 evt_setr(EventEntry* entry) { // 87
    s32* args = entry->args;
    s32 index;
    s32 value;

    index = evtGetValue(entry, args[0]);
    value = evtGetValue(entry, args[1]);
    evtSetValue(entry, index, value);

    return EVT_RETURN_DONE;
}

s32 evt_setrf(EventEntry* entry) { // 88
    s32* args = entry->args;
    s32 index;
    f32 value;

    index = evtGetValue(entry, args[0]);
    value = evtGetFloat(entry, args[1]);
    evtSetFloat(entry, index, value);

    return EVT_RETURN_DONE;
}

s32 evt_getr(EventEntry* entry) { // 89
    s32* args = entry->args;
    s32 index;
    s32 value;

    index = evtGetValue(entry, args[0]);
    value = evtGetValue(entry, index);
    evtSetValue(entry, args[1], value);

    return EVT_RETURN_DONE;
}

s32 evt_getrf(EventEntry* entry) { // 90
    s32* args = entry->args;
    s32 index;
    f32 value;

    index = evtGetValue(entry, args[0]);
    value = evtGetFloat(entry, index);
    evtSetFloat(entry, args[1], value);

    return EVT_RETURN_DONE;
}

s32 evt_user_func(EventEntry* entry) { // 91
    s32* args = entry->args;
    s32 result;

    switch (entry->blocked) {
        case 0:
    		entry->userfunc = (UserFunction)evtGetValue(entry, *args++);
    		entry->params--;
    		entry->args = args;
    		entry->blocked = 1;
    		result = entry->userfunc(entry, 1);
            break;

        default:
		    result = entry->userfunc(entry, 0);
            break;
    }

    return result;
}

s32 evt_run_evt(EventEntry *entry) { // 92
    EventEntry *copy;
    void *script;
    u32 i;
    
    script = (void*)evtGetValue(entry, *entry->args);
    copy = evtEntryType(script, entry->priority, 0, entry->type);
    copy->unitId = entry->unitId;
    copy->ownerNPC = entry->ownerNPC;
    for (i = 0; i < 16; i++) {
        copy->lwData[i] = entry->lwData[i];
    }
    for (i = 0; i < 3; i++) {
        copy->lfData[i] = entry->lfData[i];
    }
    copy->uwBase = entry->uwBase;
    copy->ufBase = entry->ufBase;
    return EVT_RETURN_DONE;
}

s32 evt_run_evt_id(EventEntry *entry) { // 93
    s32* args = entry->args;
    EventEntry *copy;
    void *script;
    s32 index;
    u32 i;
    
    script = (void*)evtGetValue(entry, args[0]);
    index = args[1];
    copy = evtEntryType(script, entry->priority, 0, entry->type);
    copy->unitId = entry->unitId;
    copy->ownerNPC = entry->ownerNPC;
    for (i = 0; i < 16; i++) {
        copy->lwData[i] = entry->lwData[i];
    }
    for (i = 0; i < 3; i++) {
        copy->lfData[i] = entry->lfData[i];
    }
    copy->uwBase = entry->uwBase;
    copy->ufBase = entry->ufBase;
    evtSetValue(entry, index, copy->eventId);
    return EVT_RETURN_DONE;
}

s32 evt_run_child_evt(EventEntry* entry) { // 94
    s32* script;
    EventEntry* evt;
    
    script = (s32*)evtGetValue(entry, *entry->args);
    evt = evtChildEntry(entry, script, 0);

    entry->opcode = OPCODE_NEXT;

    return EVT_RETURN_FINISH;
}

s32 evt_restart_evt(EventEntry* entry) { // 95
    entry->restartFrom = (void*)evtGetValue(entry, *entry->args);
    evtRestart(entry);
    
    return EVT_RETURN_DONE;
}

s32 evt_delete_evt(EventEntry* entry) { // 96
    s32 id;
    
    id = evtGetValue(entry, *entry->args);
    evtDeleteID(id);

    return EVT_RETURN_DONE;
}

s32 evt_set_pri(EventEntry* entry) { // 97
    u32 priority;
    
    priority = (u32)evtGetValue(entry, *entry->args);
    evtSetPri(entry, priority);

    return EVT_RETURN_DONE;
}

s32 evt_set_spd(EventEntry* entry) { // 98
    f32 speed;
    
    speed = evtGetFloat(entry, *entry->args);
    evtSetSpeed(entry, speed);

    return EVT_RETURN_DONE;
}

s32 evt_set_type(EventEntry* entry) { // 99
    u32 type;
    
    type = (u32)evtGetValue(entry, *entry->args);
    evtSetType(entry, type);

    return EVT_RETURN_DONE;
}

s32 evt_stop_all(EventEntry* entry) { // 100
    u32 mask;
    
    mask = (u32) evtGetValue(entry, *entry->args);
    evtStopAll(mask);

    return EVT_RETURN_DONE;
}

s32 evt_start_all(EventEntry* entry) { // 101
    u32 mask;
    
    mask = (u32) evtGetValue(entry, *entry->args);
    evtStartAll(mask);

    return EVT_RETURN_DONE;
}

s32 evt_stop_other(EventEntry* entry) { // 102
    u32 mask;
    
    mask = (u32) evtGetValue(entry, *entry->args);
    evtStopOther(entry, mask);

    return EVT_RETURN_DONE;
}

s32 evt_start_other(EventEntry* entry) { // 103
    u32 mask;
    
    mask = (u32) evtGetValue(entry, *entry->args);
    evtStartOther(entry, mask);

    return EVT_RETURN_DONE;
}

s32 evt_stop_id(EventEntry* entry) { // 104
    s32 id;
    
    id = evtGetValue(entry, *entry->args);
    evtStopID(id);

    return EVT_RETURN_DONE;
}

s32 evt_start_id(EventEntry* entry) { // 105
    s32 id;
    
    id = evtGetValue(entry, *entry->args);
    evtStartID(id);

    return EVT_RETURN_DONE;
}

s32 evt_chk_evt(EventEntry* entry) { // 106
    s32* args = entry->args;
    s32 index;
    s32 id;

    id = evtGetValue(entry, args[0]);
    index = args[1];
    evtSetValue(entry, index, evtCheckID(id));
    
    return EVT_RETURN_DONE;
}

s32 evt_inline_evt(EventEntry* entry) { // 107
    s32* script = entry->nextCommand;
    s32* inlineEnd = script;
    EventEntry* copy;
    s32 opcode;
    u32 i;

    do {
        opcode = *inlineEnd & 0xFFFF;
        inlineEnd += *inlineEnd++ >> 16;
    } while (opcode != OPCODE_END_INLINE);
    entry->nextCommand = inlineEnd;

    copy = evtEntryType(script, entry->priority, 0x60, entry->type);
    copy->unitId = entry->unitId;
    copy->uwBase = entry->uwBase;
    copy->ufBase = entry->ufBase;
    copy->ownerNPC = entry->ownerNPC;
    copy->selectWindowId = entry->selectWindowId;
    copy->printWindowId = entry->printWindowId;
    copy->printWindowFlags = entry->printWindowFlags;
    copy->unk184 = entry->unk184;
    copy->unk18C = entry->unk18C;
    copy->msgPriority = entry->msgPriority;
    for (i = 0; i < 16; i++) {
        copy->lwData[i] = entry->lwData[i];
    }
    for (i = 0; i < 3; i++) {
        copy->lfData[i] = entry->lfData[i];
    }
    return EVT_RETURN_DONE;
}

s32 evt_inline_evt_id(EventEntry* entry) { // 108
    s32* args = entry->args;
    s32* script = entry->nextCommand;
    s32* inlineEnd;
    EventEntry* copy;
    s32 opcode;
    s32 index;
    u32 i;

    index = args[0];

    inlineEnd = script;
    do {
        opcode = *inlineEnd & 0xFFFF;
        inlineEnd += *inlineEnd++ >> 16;
    } while (opcode != OPCODE_END_INLINE);
    entry->nextCommand = inlineEnd;

    copy = evtEntryType(script, entry->priority, 0x60, entry->type);
    copy->unitId = entry->unitId;
    copy->uwBase = entry->uwBase;
    copy->ufBase = entry->ufBase;
    copy->ownerNPC = entry->ownerNPC;
    copy->selectWindowId = entry->selectWindowId;
    copy->printWindowId = entry->printWindowId;
    copy->printWindowFlags = entry->printWindowFlags;
    copy->unk184 = entry->unk184;
    copy->unk18C = entry->unk18C;
    copy->msgPriority = entry->msgPriority;
    for (i = 0; i < 16; i++) {
        copy->lwData[i] = entry->lwData[i];
    }
    for (i = 0; i < 3; i++) {
        copy->lfData[i] = entry->lfData[i];
    }
    evtSetValue(entry, index, copy->eventId);
    return EVT_RETURN_DONE;
}

s32 evt_end_inline(EventEntry* entry) { // 109
    evtDelete(entry);
    
    return EVT_RETURN_FINISH;
}

s32 evt_brother_evt(EventEntry* entry) { // 110
    s32* script = entry->nextCommand;
    s32* brotherEnd;
    EventEntry* copy;
    s32 opcode;

    brotherEnd = script;
    do {
        opcode = *brotherEnd & 0xFFFF;
        brotherEnd += *brotherEnd++ >> 16;
    } while (opcode != OPCODE_END_BROTHER);
    entry->nextCommand = brotherEnd;

    copy = evtBrotherEntry(entry, script, 0x60);
    copy->unitId = entry->unitId;
    copy->type = entry->type;
    copy->uwBase = entry->uwBase;
    copy->ufBase = entry->ufBase;
    copy->ownerNPC = entry->ownerNPC;
    copy->readAddr = entry->readAddr;
    return EVT_RETURN_DONE;
}

s32 evt_brother_evt_id(EventEntry* entry) { // 111
    s32* args = entry->args;
    s32* script = entry->nextCommand;
    s32* brotherEnd;
    EventEntry* copy;
    s32 opcode;
    s32 index = args[0];

    brotherEnd = script;
    do {
        opcode = *brotherEnd & 0xFFFF;
        brotherEnd += *brotherEnd++ >> 16;
    } while (opcode != OPCODE_END_BROTHER);
    entry->nextCommand = brotherEnd;

    copy = evtBrotherEntry(entry, script, 0x60);
    copy->unitId = entry->unitId;
    copy->type = entry->type;
    copy->uwBase = entry->uwBase;
    copy->ufBase = entry->ufBase;
    copy->ownerNPC = entry->ownerNPC;
    evtSetValue(entry, index, copy->eventId);

    return EVT_RETURN_DONE;
}

s32 evt_end_brother(EventEntry* entry) { // 112
    evtDelete(entry);
    
    return EVT_RETURN_BLOCK;
}

s32 evt_debug_put_msg(EventEntry* entry) { // 113
    return EVT_RETURN_DONE;
}

s32 evt_debug_msg_clear(EventEntry* entry) { // 114
    return EVT_RETURN_DONE;
}

s32 evt_debug_put_reg(EventEntry* entry) { // 115
    static char str[0x100];
    s32* args;
    EventWork* wp;
    s32 reg;
    s32 mask;
    s32 data;
    s32 val;

    args = entry->args;
    wp = evtGetWork();
    reg = args[0];

    if (reg <= EVTDAT_ADDR_MAX) {
        sprintf(str, "ADDR     [%08X]", reg);
    }
    else if (reg <= -220000000) {
        sprintf(str, "FLOAT    [%4.2f]", check_float(reg));
    }
    else if (reg <= -200000000) {
        reg +=  210000000;
        mask = (1 << (reg % 32));
        data = entry->ufBase[reg / 32];
        sprintf(str, "UF(%3d)  [%d]", reg, mask & data);
    }
    else if (reg <= -180000000) {
        reg += 190000000;
        val = entry->uwBase[reg];
        if (val <= EVTDAT_ADDR_MAX) {
            sprintf(str, "UW(%3d)  [%08X]", val, val);
        }
        else if (val <= -220000000) {
            sprintf(str, "UW(%3d)  [%4.2f]", reg, check_float(val));
        }
        else {
            sprintf(str, "UW(%3d)  [%d]", reg, val);
        }
    }
    else if (reg <= -160000000) {
        reg += 170000000;
        val = swByteGet(reg);
        if (val <= EVTDAT_ADDR_MAX) {
            sprintf(str, "GSW(%3d) [%08X]", val); //wtf
        }
        else if (val <= -220000000) {
            sprintf(str, "GSW(%3d) [%4.2f]", reg, check_float(val));
        }
        else {
            sprintf(str, "GSW(%3d) [%d]", reg, val);
        }
    }
    else if (reg <= -140000000) {
        reg += 150000000;
        val = _swByteGet(reg);
        if (val <= EVTDAT_ADDR_MAX) {
            sprintf(str, "LSW(%3d) [%08X]", val); //wtf
        }
        else if (val <= -220000000) {
            sprintf(str, "LSW(%3d)  [%4.2f]", reg, check_float(val));
        }
        else {
            sprintf(str, "LSW(%3d) [%d]", reg, val);
        }
    }
    else if (reg <= -120000000) {
        reg += 130000000;
        sprintf(str, "GSWF(%3d)[%d]", reg, swGet(reg));
    }
    else if (reg <= -100000000) {
        reg += 110000000;
        sprintf(str, "LSWF(%3d)[%d]", reg, _swGet(reg));
    }
    else if (reg <= -80000000) {
        reg += 90000000;
        mask = 1 << (reg % 32);
        data = wp->gfData[reg / 32];
        sprintf(str, "GF(%3d)  [%d]", reg, data & mask);
    }
    else if (reg <= -60000000) {
        reg += 70000000;
        mask = 1 << (reg % 32);
        data = entry->lfData[reg / 32];
        sprintf(str, "LF(%3d)  [%d]", reg, data & mask);
    }
    else if (reg <= -40000000) {
        reg += 50000000;
        val = wp->gwData[reg];
        if (val <= EVTDAT_ADDR_MAX) {
            sprintf(str, "GW(%3d)  [%08X]", reg, val);
        }
        else if (val <= -220000000) {
            sprintf(str, "GW(%3d)  [%4.2f]", reg, check_float(val));
        }
        else {
            sprintf(str, "GW(%3d)  [%d]", reg, val);
        }
    }
    else if (reg <= -20000000) {
        reg += 30000000;
        val = entry->lwData[reg];
        if (val <= EVTDAT_ADDR_MAX) {
            sprintf(str, "LW(%3d)  [%08X]", reg, val);
        }
        else if (val <= -220000000) {
            sprintf(str, "LW(%3d)  [%4.2f]", reg, check_float(val));
        }
        else {
            sprintf(str, "LW(%3d)  [%d]", reg, val);
        }
    }
    else {
        sprintf(str, "         [%d]", reg);
    }

    return EVT_RETURN_DONE;
}

s32 evt_debug_name(EventEntry* entry) { // 116
    entry->name = (const char*)*entry->args;
    
    return EVT_RETURN_DONE;
}

s32 evt_debug_rem(EventEntry* entry) { // 117
    return EVT_RETURN_DONE;
}

s32 evt_debug_bp(EventEntry* entry) { // 118
    s32 i;

    for (i = 0; i < 256; i++) {
        if (entry == evtGetPtr(i)) {
            break;
        }
    }
    
    return EVT_RETURN_YIELD;
}

s32 evtmgrCmd(EventEntry* entry) {
    s32* args;
    s32 argCount;
    s32 status;

    while (1) {
        status = EVT_RETURN_DONE;
        switch (entry->opcode) {
            case OPCODE_NEXT:
                entry->currCommand = entry->nextCommand;
                args = entry->nextCommand;
                entry->opcode = (EventOpcode)*args;
                argCount = *args++ >> 16;
                entry->params = (u8)argCount;
                entry->args = args;
                args += argCount;
                entry->nextCommand = args;
                entry->blocked = 0;
                status = EVT_RETURN_REPEAT;
                break;
            case OPCODE_END_SCRIPT:
                break;
            case OPCODE_END_EVENT:
                status = evt_end_evt(entry);
                break;
            case OPCODE_LABEL:
                status = evt_lbl(entry);
                break;
            case OPCODE_GOTO:
                status = evt_goto(entry);
                break;
            case OPCODE_DO:
                status = evt_do(entry);
                break;
            case OPCODE_WHILE:
                status = evt_while(entry);
                break;
            case OPCODE_DO_BREAK:
                status = evt_do_break(entry);
                break;
            case OPCODE_DO_CONTINUE:
                status = evt_do_continue(entry);
                break;
            case OPCODE_WAIT_FRAME:
                status = evt_wait_frm(entry);
                break;
            case OPCODE_WAIT_MSEC:
                status = evt_wait_msec(entry);
                break;
            case OPCODE_HALT:
                status = evt_halt(entry);
                break;
            case OPCODE_IF_STR_EQUAL:
                status = evt_if_str_equal(entry);
                break;
            case OPCODE_IF_STR_NOT_EQUAL:
                status = evt_if_str_not_equal(entry);
                break;
            case OPCODE_IF_STR_LESS:
                status = evt_if_str_small(entry);
                break;
            case OPCODE_IF_STR_GREATER:
                status = evt_if_str_large(entry);
                break;
            case OPCODE_IF_STR_LESS_EQUAL:
                status = evt_if_str_small_equal(entry);
                break;
            case OPCODE_IF_STR_GREATER_EQUAL:
                status = evt_if_str_large_equal(entry);
                break;
            case OPCODE_IFF_EQUAL:
                status = evt_iff_equal(entry);
                break;
            case OPCODE_IFF_NOT_EQUAL:
                status = evt_iff_not_equal(entry);
                break;
            case OPCODE_IFF_LESS:
                status = evt_iff_small(entry);
                break;
            case OPCODE_IFF_GREATER:
                status = evt_iff_large(entry);
                break;
            case OPCODE_IFF_LESS_EQUAL:
                status = evt_iff_small_equal(entry);
                break;
            case OPCODE_IFF_GREATER_EQUAL:
                status = evt_iff_large_equal(entry);
                break;
            case OPCODE_IF_EQUAL:
                status = evt_if_equal(entry);
                break;
            case OPCODE_IF_NOT_EQUAL:
                status = evt_if_not_equal(entry);
                break;
            case OPCODE_IF_LESS:
                status = evt_if_small(entry);
                break;
            case OPCODE_IF_GREATER:
                status = evt_if_large(entry);
                break;
            case OPCODE_IF_LESS_EQUAL:
                status = evt_if_small_equal(entry);
                break;
            case OPCODE_IF_GREATER_EQUAL:
                status = evt_if_large_equal(entry);
                break;
            case OPCODE_IF_FLAG:
                status = evt_if_flag(entry);
                break;
            case OPCODE_IF_NOT_FLAG:
                status = evt_if_not_flag(entry);
                break;
            case OPCODE_ELSE:
                status = evt_else(entry);
                break;
            case OPCODE_END_IF:
                status = evt_end_if(entry);
                break;
            case OPCODE_SWITCH:
                status = evt_switch(entry);
                break;
            case OPCODE_SWITCHI:
                status = evt_switchi(entry);
                break;
            case OPCODE_CASE_EQUAL:
                status = evt_case_equal(entry);
                break;
            case OPCODE_CASE_NOT_EQUAL:
                status = evt_case_not_equal(entry);
                break;
            case OPCODE_CASE_LESS:
                status = evt_case_small(entry);
                break;
            case OPCODE_CASE_LESS_EQUAL:
                status = evt_case_small_equal(entry);
                break;
            case OPCODE_CASE_GREATER:
                status = evt_case_large(entry);
                break;
            case OPCODE_CASE_GREATER_EQUAL:
                status = evt_case_large_equal(entry);
                break;
            case OPCODE_CASE_ETC:
                status = evt_case_etc(entry);
                break;
            case OPCODE_SWITCH_BREAK:
                status = evt_switch_break(entry);
                break;
            case OPCODE_CASE_OR:
                status = evt_case_or(entry);
                break;
            case OPCODE_CASE_END:
                status = evt_case_end(entry);
                break;
            case OPCODE_CASE_AND:
                status = evt_case_and(entry);
                break;
            case OPCODE_CASE_FLAG:
                status = evt_case_flag(entry);
                break;
            case OPCODE_CASE_BETWEEN:
                status = evt_case_between(entry);
                break;
            case OPCODE_END_SWITCH:
                status = evt_end_switch(entry);
                break;
            case OPCODE_SET:
                status = evt_set(entry);
                break;
            case OPCODE_SETI:
                status = evt_seti(entry);
                break;
            case OPCODE_SETF:
                status = evt_setf(entry);
                break;
            case OPCODE_ADD:
                status = evt_add(entry);
                break;
            case OPCODE_SUB:
                status = evt_sub(entry);
                break;
            case OPCODE_MUL:
                status = evt_mul(entry);
                break;
            case OPCODE_DIV:
                status = evt_div(entry);
                break;
            case OPCODE_MOD:
                status = evt_mod(entry);
                break;
            case OPCODE_ADDF:
                status = evt_addf(entry);
                break;
            case OPCODE_SUBF:
                status = evt_subf(entry);
                break;
            case OPCODE_MULF:
                status = evt_mulf(entry);
                break;
            case OPCODE_DIVF:
                status = evt_divf(entry);
                break;
            case OPCODE_SET_READ:
                status = evt_set_read(entry);
                break;
            case OPCODE_READ:
                status = evt_read(entry);
                break;
            case OPCODE_READ2:
                status = evt_read2(entry);
                break;
            case OPCODE_READ3:
                status = evt_read3(entry);
                break;
            case OPCODE_READ4:
                status = evt_read4(entry);
                break;
            case OPCODE_READ_N:
                status = evt_read_n(entry);
                break;
            case OPCODE_SET_READF:
                status = evt_set_readf(entry);
                break;
            case OPCODE_READF:
                status = evt_readf(entry);
                break;
            case OPCODE_READF2:
                status = evt_readf2(entry);
                break;
            case OPCODE_READF3:
                status = evt_readf3(entry);
                break;
            case OPCODE_READF4:
                status = evt_readf4(entry);
                break;
            case OPCODE_READF_N:
                status = evt_readf_n(entry);
                break;
            case OPCODE_SET_USER_WORK:
                status = evt_set_user_wrk(entry);
                break;
            case OPCODE_SET_USER_FLAG:
                status = evt_set_user_flg(entry);
                break;
            case OPCODE_ALLOC_USER_WORK:
                status = evt_alloc_user_wrk(entry);
                break;
            case OPCODE_DELETE_EVENT:
                status = evt_delete_evt(entry);
                break;
            case OPCODE_AND:
                status = evt_and(entry);
                break;
            case OPCODE_ANDI:
                status = evt_andi(entry);
                break;
            case OPCODE_OR:
                status = evt_or(entry);
                break;
            case OPCODE_ORI:
                status = evt_ori(entry);
                break;
            case OPCODE_SET_FRAME_FROM_MSEC:
                evt_set_frame_from_msec(entry);
                break;
            case OPCODE_SET_MSEC_FROM_FRAME:
                evt_set_msec_from_frame(entry);
                break;
            case OPCODE_SET_RAM:
                evt_set_ram(entry);
                break;
            case OPCODE_SET_RAMF:
                evt_set_ramf(entry);
                break;
            case OPCODE_GET_RAM:
                evt_get_ram(entry);
                break;
            case OPCODE_GET_RAMF:
                evt_get_ramf(entry);
                break;
            case OPCODE_SETR:
                evt_setr(entry);
                break;
            case OPCODE_SETRF:
                evt_setrf(entry);
                break;
            case OPCODE_GETR:
                evt_getr(entry);
                break;
            case OPCODE_GETRF:
                evt_getrf(entry);
                break;
            case OPCODE_USER_FUNC:
                status = evt_user_func(entry);
                break;
            case OPCODE_RUN_EVENT:
                status = evt_run_evt(entry);
                break;
            case OPCODE_RUN_EVENT_ID:
                status = evt_run_evt_id(entry);
                break;
            case OPCODE_RUN_CHILD_EVENT:
                status = evt_run_child_evt(entry);
                break;
            case OPCODE_SET_PRI:
                status = evt_set_pri(entry);
                break;
            case OPCODE_SET_SPD:
                status = evt_set_spd(entry);
                break;
            case OPCODE_SET_TYPE:
                status = evt_set_type(entry);
                break;
            case OPCODE_RESTART_EVENT:
                status = evt_restart_evt(entry);
                break;
            case OPCODE_STOP_ALL:
                status = evt_stop_all(entry);
                break;
            case OPCODE_START_ALL:
                status = evt_start_all(entry);
                break;
            case OPCODE_STOP_OTHER:
                status = evt_stop_other(entry);
                break;
            case OPCODE_START_OTHER:
                status = evt_start_other(entry);
                break;
            case OPCODE_STOP_ID:
                status = evt_stop_id(entry);
                break;
            case OPCODE_START_ID:
                status = evt_start_id(entry);
                break;
            case OPCODE_CHECK_EVENT:
                status = evt_chk_evt(entry);
                break;
            case OPCODE_INLINE_EVENT:
                status = evt_inline_evt(entry);
                break;
            case OPCODE_END_INLINE:
                status = evt_end_inline(entry);
                break;
            case OPCODE_INLINE_EVENT_ID:
                status = evt_inline_evt_id(entry);
                break;
            case OPCODE_BROTHER_EVENT:
                status = evt_brother_evt(entry);
                break;
            case OPCODE_BROTHER_EVENT_ID:
                status = evt_brother_evt_id(entry);
                break;
            case OPCODE_END_BROTHER:
                status = evt_end_brother(entry);
                break;
            case OPCODE_DEBUG_PUT_MSG:
                status = evt_debug_put_msg(entry);
                break;
            case OPCODE_DEBUG_MSG_CLEAR:
                status = evt_debug_msg_clear(entry);
                break;
            case OPCODE_DEBUG_PUT_REG:
                status = evt_debug_put_reg(entry);
                break;
            case OPCODE_DEBUG_NAME:
                status = evt_debug_name(entry);
                break;
            case OPCODE_DEBUG_REM:
                status = evt_debug_rem(entry);
                break;
            case OPCODE_DEBUG_BP:
                status = evt_debug_bp(entry);
                break;
            default:
                break;
        }

        if (status == EVT_RETURN_REPEAT) {
            continue;
        }
        else if (status == EVT_RETURN_FINISH) {
            return -1;
        }
        else if (status < 0) {
            return 1;
        }
        else if (status == EVT_RETURN_BLOCK) {
            break;
        }
        else if (status == EVT_RETURN_YIELD) {
            entry->opcode = OPCODE_NEXT;
            break;
        }
        else if (status == EVT_RETURN_DONE) {
            entry->opcode = OPCODE_NEXT;
            continue;            
        }
    }
    return 0;
}

s32 evtGetValue(EventEntry* entry, s32 index) {
    EventWork* wp = evtGetWork();
    s32 mask;
    s32 data;

    if (index <= EVTDAT_ADDR_MAX) {
        return index;
    }
    if (index <= EVTDAT_POINTER_MAX) {
        return index;
    }
    if (index <= EVTDAT_FLOAT_MAX) {
        return (s32)check_float(index);
    }
    if (index <= EVTDAT_UF_MAX) {
        index +=  EVTDAT_UF_BASE;
        mask = (1 << (index % 32));
        data = entry->ufBase[index / 32];
        index = (mask & data);
        return !(index == 0);
    }
    if (index <= EVTDAT_UW_MAX) {
        index += EVTDAT_UW_BASE;
        data = entry->uwBase[index];
        if (data <= EVTDAT_ADDR_MAX) {
            return data;
        }
        if (data <= EVTDAT_FLOAT_MAX) {
            data = (s32)check_float(data);
        }
        return data;
    }
    if (index <= EVTDAT_GSW_MAX) {
        return swByteGet(index + EVTDAT_GSW_BASE);
    }
    if (index <= EVTDAT_LSW_MAX) {
        return _swByteGet(index + EVTDAT_LSW_BASE);
    }
    if (index <= EVTDAT_GSWF_MAX) {
        return swGet(index + EVTDAT_GSWF_BASE);
    }
    if (index <= EVTDAT_LSWF_MAX) {
        return _swGet(index + EVTDAT_LSWF_BASE);
    }
    if (index <= EVTDAT_GF_MAX) {
        index += EVTDAT_GF_BASE;
        mask = 1 << (index % 32);
        data = wp->gfData[index / 32];
        return (data & mask) != 0;
    }
    if (index <= EVTDAT_LF_MAX) {
        index += EVTDAT_LF_BASE;
        mask = 1 << (index % 32);
        data = entry->lfData[index / 32];
        return (data & mask) != 0;
    }
    if (index <= EVTDAT_GW_MAX) {
        index += EVTDAT_GW_BASE;
        data = wp->gwData[index];
        if (data <= EVTDAT_ADDR_MAX) {
            return data;
        }
        if (data <= EVTDAT_FLOAT_MAX) {
            data = (s32)check_float(data);
        }
        return data;
    }
    if (index <= EVTDAT_LW_MAX) {
        index += EVTDAT_LW_BASE;
        data = entry->lwData[index];
        if (data <= EVTDAT_ADDR_MAX) {
            return data;
        }
        if (data <= EVTDAT_FLOAT_MAX) {
            data = (s32)check_float(data);
        }
        return data;
    }
    return index;
}

s32 evtGetNumber(EventEntry* entry, s32 index) {
	if (index <= EVTDAT_ADDR_MAX) {
		return index;
	}
	if (index <= (-250 * 1000000)) {
		return index;
	}
	if (index <= EVTDAT_FLOAT_MAX) {
		return index;
	}
	if (index <= EVTDAT_UF_MAX) {
		return index + EVTDAT_UF_BASE;
	}
	if (index <= EVTDAT_UW_MAX) {
		return index + EVTDAT_UW_BASE;
	}
	if (index <= EVTDAT_GSW_MAX) {
		return index + EVTDAT_GSW_BASE;
	}
	if (index <= EVTDAT_LSW_MAX) {
		return index + EVTDAT_LSW_BASE;
	}
	if (index <= EVTDAT_GSWF_MAX) {
		return index + EVTDAT_GSWF_BASE;
	}
	if (index <= EVTDAT_LSWF_MAX) {
		return index + EVTDAT_LSWF_BASE;
	}
	if (index <= EVTDAT_GF_MAX) {
		return index + EVTDAT_GF_BASE;
	}
	if (index <= EVTDAT_LF_MAX) {
		return index + EVTDAT_LF_BASE;
	}
	if (index <= EVTDAT_GW_MAX) {
		return index + EVTDAT_GW_BASE;
	}
	if (index <= EVTDAT_LW_MAX) {
		return index + EVTDAT_LW_BASE;
	}
	return index;
}

s32 evtSetValue(EventEntry* entry, s32 index, s32 value) {
    EventWork* wp = evtGetWork();
    s32 result;
	s32 shift;

    if (index <= EVTDAT_ADDR_MAX) {
        return value;
    }
    if (index <= EVTDAT_FLOAT_MAX) {
        return (s32)check_float(value);
    }
    if (index <= EVTDAT_UF_MAX) {
		index += EVTDAT_UF_BASE;
		shift = index % 32;
		if (value != 0) { //set bit
			entry->ufBase[index / 32] |= (1 << shift);
		}
		else { //clear bit
			entry->ufBase[index / 32] &= ~(1 << shift);
		}
		return value;
    }
    if (index <= EVTDAT_UW_MAX) {
        index += EVTDAT_UW_BASE;
        result = entry->uwBase[index];
        entry->uwBase[index] = value;
        return result;
    }
    if (index <= EVTDAT_GSW_MAX) {
        index += EVTDAT_GSW_BASE;
        result = swByteGet(index);
        swByteSet(index, value);
        return result;
    }
    if (index <= EVTDAT_LSW_MAX) {
        index += EVTDAT_LSW_BASE;
        result = _swByteGet(index);
        _swByteSet(index, (u8)value);
        return result;
    }
    if (index <= EVTDAT_GSWF_MAX) {
        index += EVTDAT_GSWF_BASE;
        result = swGet(index);
        if (value != 0) {
            swSet(index);
        } else {
            swClear(index);
        }
        return result;
    }
    if (index <= EVTDAT_LSWF_MAX) {
        index += EVTDAT_LSWF_BASE;
        result = _swGet(index);
        if (value != 0) {
            _swSet(index);
        } else {
            _swClear(index);
        }
        return result;
    }
    if (index <= EVTDAT_GF_MAX) {
        index += EVTDAT_GF_BASE;
        shift = index % 32;
        if (value != 0) { //set bit
            wp->gfData[index / 32] |= (1 << shift);
        } else { //clear bit
            wp->gfData[index / 32] &= ~(1 << shift);
        }
        return value;
    }
    if (index <= EVTDAT_LF_MAX) {
        index += EVTDAT_LF_BASE;
        shift = index % 32;
        if (value != 0) { //set bit
            entry->lfData[index / 32] |= (1 << shift);
        } else { //clear bit
            entry->lfData[index / 32] &= ~(1 << shift);
        }
        return value;
    }
    if (index <= EVTDAT_GW_MAX) {
        index += EVTDAT_GW_BASE;
        result = wp->gwData[index];
        wp->gwData[index] = value;
        return result;
    }
    if (index <= EVTDAT_LW_MAX) {
        index += EVTDAT_LW_BASE;
        result = entry->lwData[index];
        entry->lwData[index] = value;
        return result;
    }
    return value;
}

f32 evtGetFloat(EventEntry* entry, s32 index) {
    EventWork* wp = evtGetWork();

    if (index <= EVTDAT_ADDR_MAX) {
        return (f32)index;
    }
    if (index <= EVTDAT_POINTER_MAX) {
        return (f32)index;
    }
    if (index <= EVTDAT_FLOAT_MAX) {
        return check_float(index);
    }
    if (index <= EVTDAT_UW_MAX) {
        index += EVTDAT_UW_BASE;
        index = entry->uwBase[index];
        return check_float(index);
    }
    if (index <= EVTDAT_GSW_MAX) {
        index += EVTDAT_GSW_BASE;
        index = swByteGet(index);
        return check_float(index);
    }
    if (index <= EVTDAT_LSW_MAX) {
        index += EVTDAT_LSW_BASE;
        index = _swByteGet(index);
        return check_float(index);
    }
    if (index <= EVTDAT_GF_MAX) {
        index += EVTDAT_GF_BASE;
        if (wp->gfData[index / 32] & (1 << (index % 32))) {
            return 1.0f;
        }
        return 0.0f;
    }
    if (index <= EVTDAT_LF_MAX) {
        index += EVTDAT_LF_BASE;
        if (entry->lfData[index / 32] & (1 << (index % 32))) {
            return 1.0f;
        }
        return 0.0f;
    }
    if (index <= EVTDAT_GW_MAX) {
        index += EVTDAT_GW_BASE;
        index = wp->gwData[index];
        return check_float(index);
    }
    if (index <= EVTDAT_LW_MAX) {
        index += EVTDAT_LW_BASE;
        index = entry->lwData[index];
        return check_float(index);
    }
    return check_float(index);
}

f32 evtSetFloat(EventEntry* entry, s32 index, f32 value) {
    EventWork* wp = evtGetWork();
    s32 result;
    s32 shift;

    if (index <= EVTDAT_ADDR_MAX) {
        return value;
    }
    if (index <= EVTDAT_FLOAT_MAX) {
        return value;
    }
    if (index <= EVTDAT_UW_MAX) {
        index += EVTDAT_UW_BASE;
        result = entry->uwBase[index];
        entry->uwBase[index] = change_float(value);
        return check_float(result);
    }
    if (index <= EVTDAT_GF_MAX) {
        index += EVTDAT_GF_BASE;
        shift = index % 32;
        if (value) {
            wp->gfData[index / 32] |= (1 << shift);
        } else {
            wp->gfData[index / 32] &= ~(1 << shift);
        }
        return value;
    }
    if (index <= EVTDAT_LF_MAX) {
        index += EVTDAT_LF_BASE;
        shift = index % 32;
        if (value) {
            entry->lfData[index / 32] |= (1 << shift);
        } else {
            entry->lfData[index / 32] &= ~(1 << shift);
        }
        return value;
    }
    if (index <= EVTDAT_GW_MAX) {
        index += EVTDAT_GW_BASE;
        result = wp->gwData[index];
        wp->gwData[index] = change_float(value);
        return check_float(result);
    }
    if (index <= EVTDAT_LW_MAX) {
        index += EVTDAT_LW_BASE;
        result = entry->lwData[index];
        entry->lwData[index] = change_float(value);
        return check_float(result);
    }
    return value;
}

s32* evtSearchLabel(EventEntry* entry, s32 lbl) {
    s32* args = entry->args;
    s32 n;
    
    if (lbl < EVTDAT_ADDR_MAX) {
        return (s32*)lbl;
    }

    for (n = 0; n < 16; n++) {
        if (entry->labelIdTable[n] == lbl) {
            args = entry->labelAddressTable[n];
            break;
        }
    }

    return args;
}

s32* evtSearchElse(EventEntry* entry) {
    s32 depth;
    s32* cmd;
    s32 opcode;

    depth = 0;
    cmd = entry->nextCommand;
    while (1) {
        opcode = *cmd & 0xFFFF;
        cmd += *cmd++ >> 16;
        switch (opcode) {
            case OPCODE_END_SCRIPT:
            case OPCODE_END_IF:
                if (--depth >= 0) {
                    break;
                }
                else {
                    return cmd;
                }

            case OPCODE_IF_STR_EQUAL:
            case OPCODE_IF_STR_NOT_EQUAL:
            case OPCODE_IF_STR_LESS:
            case OPCODE_IF_STR_GREATER:
            case OPCODE_IF_STR_LESS_EQUAL:
            case OPCODE_IF_STR_GREATER_EQUAL:
            case OPCODE_IFF_EQUAL:
            case OPCODE_IFF_NOT_EQUAL:
            case OPCODE_IFF_LESS:
            case OPCODE_IFF_GREATER:
            case OPCODE_IFF_LESS_EQUAL:
            case OPCODE_IFF_GREATER_EQUAL:
            case OPCODE_IF_EQUAL:
            case OPCODE_IF_NOT_EQUAL:
            case OPCODE_IF_LESS:
            case OPCODE_IF_GREATER:
            case OPCODE_IF_LESS_EQUAL:
            case OPCODE_IF_GREATER_EQUAL:
            case OPCODE_IF_FLAG:
            case OPCODE_IF_NOT_FLAG:
                depth++;
                break;

             case OPCODE_ELSE:
                if (depth == 0) {
                    return cmd;
                }
                else {
                    break;
                }
       }
    }
}

s32* evtSearchEndIf(EventEntry* entry) {
    s32 depth;
    s32* cmd;
    s32 opcode;

    depth = 0;
    cmd = entry->nextCommand;

    while (1) {
        opcode = *cmd & 0xFFFF;
        cmd += *cmd++ >> 16;

        switch (opcode) {
            case OPCODE_END_SCRIPT:
            case OPCODE_END_IF:
                if (--depth >= 0) {
                    break;
                }
                else {
                    return cmd;
                }

            case OPCODE_IF_STR_EQUAL:
            case OPCODE_IF_STR_NOT_EQUAL:
            case OPCODE_IF_STR_LESS:
            case OPCODE_IF_STR_GREATER:
            case OPCODE_IF_STR_LESS_EQUAL:
            case OPCODE_IF_STR_GREATER_EQUAL:
            case OPCODE_IFF_EQUAL:
            case OPCODE_IFF_NOT_EQUAL:
            case OPCODE_IFF_LESS:
            case OPCODE_IFF_GREATER:
            case OPCODE_IFF_LESS_EQUAL:
            case OPCODE_IFF_GREATER_EQUAL:
            case OPCODE_IF_EQUAL:
            case OPCODE_IF_NOT_EQUAL:
            case OPCODE_IF_LESS:
            case OPCODE_IF_GREATER:
            case OPCODE_IF_LESS_EQUAL:
            case OPCODE_IF_GREATER_EQUAL:
            case OPCODE_IF_FLAG:
            case OPCODE_IF_NOT_FLAG:
                depth++;
                break;
        }
    }
}

s32* evtSearchEndSwitch(EventEntry* entry) {
    s32* cmd;
    s32 opcode;
    s32* ret;
    s32 depth;

    depth = 1;
    cmd = entry->nextCommand;

    while (1) {
        opcode = *cmd & 0xFFFF;
        ret = cmd;
        cmd += *cmd++ >> 16;

        switch (opcode) {
            case OPCODE_END_SCRIPT:
            case OPCODE_SWITCH:
                depth++;
                break;

            case OPCODE_END_SWITCH:
                if (--depth == 0)
                    return ret;
                else
                    break;
        }
    }
}

s32* evtSearchCase(EventEntry* entry) {
    s32* cmd;
    s32 opcode;
    s32* ret;
    s32 depth;

    depth = 1;
    cmd = entry->nextCommand;

    while (1) {
        opcode = *cmd & 0xFFFF;
        ret = cmd;
        cmd += *cmd++ >> 16;

        switch (opcode) {
            case OPCODE_END_SCRIPT:
            case OPCODE_SWITCH:
                depth++;
                break;

            case OPCODE_END_SWITCH:
                if (--depth == 0)
                    return ret;
                else
                    break;

            case OPCODE_CASE_EQUAL:
            case OPCODE_CASE_NOT_EQUAL:
            case OPCODE_CASE_LESS:
            case OPCODE_CASE_GREATER:
            case OPCODE_CASE_LESS_EQUAL:
            case OPCODE_CASE_GREATER_EQUAL:
            case OPCODE_CASE_ETC:
            case OPCODE_CASE_OR:
            case OPCODE_CASE_AND:
            case OPCODE_CASE_FLAG:
            case OPCODE_CASE_END:
            case OPCODE_CASE_BETWEEN:
                if (depth == 1)
                    return ret;
                else
                    break;
        }
    }
}

s32* evtSearchWhile(EventEntry* entry) {
    s32 depth;
    s32* cmd;
    s32 opcode;

    depth = 0;
    cmd = entry->nextCommand;

    while (1) {
        opcode = *cmd & 0xFFFF;
        cmd += *cmd++ >> 16;

        switch (opcode) {
            case OPCODE_END_SCRIPT:
            case OPCODE_WHILE:
                if (--depth >= 0)
                    break;
                else
                    return cmd;

            case OPCODE_DO:
                depth++;
                break;
        }
    }
}

s32* evtSearchJustBeforeWhile(EventEntry* entry) {
    s32 depth;
    s32* cmd;
    s32 opcode;

    depth = 0;
    cmd = entry->nextCommand;

    while (1) {
        opcode = *cmd & 0xFFFF;

        switch (opcode) {
            case OPCODE_END_SCRIPT:
            case OPCODE_WHILE:
                if (--depth >= 0)
                    break;
                else
                    return cmd;

            case OPCODE_DO:
                depth++;
                break;
        }

        cmd += *cmd++ >> 16;
    }
}
