#ifndef _STDDEF_H_
#define _STDDEF_H_

#define offsetof(type, member)	((size_t) &(((type *) 0)->member))

// The compiler version used for the SDK here is too old to support sizeof?
#ifndef DOLPHIN_SDK
typedef __typeof__(sizeof(0)) size_t;
#else
typedef unsigned int size_t;
#endif

#ifndef NULL
#define NULL 0L
#endif

#endif
