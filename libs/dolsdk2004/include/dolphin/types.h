#ifndef _DOLPHIN_TYPES_H_
#define _DOLPHIN_TYPES_H_

typedef signed   char          s8;
typedef unsigned char          u8;
typedef signed   short int     s16;
typedef unsigned short int     u16;
typedef signed   long          s32;
typedef unsigned long          u32;
typedef signed   long long int s64;
typedef unsigned long long int u64;

typedef volatile signed   char          vs8;
typedef volatile unsigned char          vu8;
typedef volatile signed   short int     vs16;
typedef volatile unsigned short int     vu16;
typedef volatile signed   long          vs32;
typedef volatile unsigned long          vu32;
typedef volatile signed   long long int vs64;
typedef volatile unsigned long long int vu64;

typedef float  f32;
typedef double f64;

typedef char *Ptr;

typedef int BOOL;

#define FALSE 0
#define TRUE 1

#if defined(__MWERKS__)
#define AT_ADDRESS(addr) : (addr)
#elif defined(__GNUC__)
//#define AT_ADDRESS(addr) __attribute__((address((addr))))
#define AT_ADDRESS(addr)  // was removed in GCC. define in linker script instead.
#else
#error unknown compiler
#endif

#define ATTRIBUTE_ALIGN(num) __attribute__((aligned(num)))

#define INT_MAX 2147483647

#ifndef NULL
#define NULL ((void*)0)
#endif

#include "libc/stdio.h"
#include "libc/stdarg.h"
#include "libc/string.h"
#include "libc/ctype.h"

#include "cmath.h"

#endif
