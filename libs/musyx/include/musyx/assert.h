#ifndef _ASSERT
#define _ASSERT
#include "musyx/platform.h"
#include "musyx/version.h"

#if MUSY_TARGET == MUSY_TARGET_DOLPHIN
extern void OSPanic(const char* file, int line, const char* msg, ...);
extern void OSReport(const char* msg, ...);

#ifndef MUSY_PANIC
#define MUSY_PANIC OSPanic
#endif
#ifndef MUSY_REPORT
#define MUSY_REPORT OSReport
#endif
#elif MUSY_TARGET == MUSY_TARGET_PC
#include <assert.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

static inline void panic(const char* file, int line, const char* msg, ...) {
  va_list list;
  va_start(list);
  vprintf(msg, list);
  va_end(list);
  printf(" in \"%s\" on line %d.\n", file, line);
  abort();
}

#ifndef MUSY_PANIC
#define MUSY_PANIC panic
#endif
#ifndef MUSY_REPORT
#define MUSY_REPORT printf
#endif
#endif

#ifndef MUSY_ASSERT
#ifdef _DEBUG
#define MUSY_ASSERT(cond) ((cond) || (MUSY_PANIC(__FILE__, __LINE__, "Failed assertion " #cond), 0))
#else
#define MUSY_ASSERT(cond)
#endif
#endif

#ifndef MUSY_ASSERT_MSG
#ifdef _DEBUG
#define MUSY_ASSERT_MSG(cond, msg) ((cond) || (MUSY_PANIC(__FILE__, __LINE__, msg), 0))
#else
#define MUSY_ASSERT_MSG(cond, msg)
#endif
#endif

#ifndef MUSY_DEBUG
#ifdef _DEBUG
#define MUSY_DEBUG MUSY_REPORT
#else
#define MUSY_DEBUG
#endif
#endif

#ifndef MUSY_FATAL
#ifdef _DEBUG
#define MUSY_FATAL(msg) MUSY_PANIC(__FILE__, __LINE__, msg)
#else
#define MUSY_FATAL
#endif
#endif

#endif // _ASSERT
