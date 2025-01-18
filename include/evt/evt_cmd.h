#pragma once

/* This header file is meant for creating evt scripts, until there's a better compiler.
 * Includes macros for the scripts themselves, along with user function helpers.
 */

#include "mgr/evtmgr.h"
#include "mgr/evtmgr_cmd.h"

//Function Helpers

//Used to define native C functions that scripts can call
#define USERFUNC_DEF(function) \
	s32 (function)(EventEntry* event, BOOL isFirstCall)



//Script Helpers
#define NUMARGS(...)  (sizeof((s32[]){__VA_ARGS__})/sizeof(s32))

#define PTR(value) (s32)(value)
#define STRING(value) PTR(value)

#define EVT_HELPER_CMD(param_count, opcode) \
	(((param_count) << 16) | (opcode))

#define EVT_DEF(name) \
	s32 (name)[]

#define EVT_BEGIN(name) \
	s32 (name)[] = {

#define EVT_END() \
	OPCODE_END_SCRIPT};

//Script Parameters
#define RETURN() \
	EVT_HELPER_CMD(0, OPCODE_END_EVENT),


#define WAIT_FRAMES(frames) \
	EVT_HELPER_CMD(1, OPCODE_WAIT_FRAME), frames,

#define WAIT_MSEC(msec) \
	EVT_HELPER_CMD(1, OPCODE_WAIT_MSEC), msec,



#define IF_LESS(lhs, rhs) \
	EVT_HELPER_CMD(2, OPCODE_IF_LESS), lhs, rhs,


#define SET(index, value) \
	EVT_HELPER_CMD(2, OPCODE_SET), index, value,




#define USER_FUNC(...) \
	EVT_HELPER_CMD(NUMARGS((s32)__VA_ARGS__), OPCODE_USER_FUNC), \
	(s32)__VA_ARGS__,

//TODO: RUN_SCRIPT_TID, RUN_SCRIPT_ASYNC
#define RUN_SCRIPT(evt) \
	EVT_HELPER_CMD(1, OPCODE_RUN_CHILD_EVENT), (s32)(evt),
