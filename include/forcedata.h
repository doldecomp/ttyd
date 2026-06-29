// This file is meant to add a convenient macro for forcing extraneous values into .data. Each call
// generates a forcedata[n] that uses a volatile trick to make sure it's emitted. Note that only up
// to 16 variables are currently supported per-instance.
#pragma once

#define FD_GLUE(a, b) FD_GLUE_(a, b)
#define FD_GLUE_(a, b) a##b

#define FD_NARG(...) FD_NARG_(__VA_ARGS__, FD_RSEQ())
#define FD_NARG_(...) FD_ARGN(__VA_ARGS__)
#define FD_ARGN(_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, _11, _12, _13, _14, _15, _16, _17, _18, _19, _20, _21, _22, \
                _23, _24, _25, _26, _27, _28, _29, _30, _31, _32, _33, _34, _35, _36, _37, _38, _39, _40, _41, _42,  \
                _43, _44, _45, _46, _47, _48, N, ...)                                                                \
    N
#define FD_RSEQ()                                                                                                   \
    48, 47, 46, 45, 44, 43, 42, 41, 40, 39, 38, 37, 36, 35, 34, 33, 32, 31, 30, 29, 28, 27, 26, 25, 24, 23, 22, 21, \
        20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0

#define FD_E_3(W, t, n, v) W(t, n, v)
#define FD_E_6(W, t, n, v, ...) W(t, n, v) FD_E_3(W, __VA_ARGS__)
#define FD_E_9(W, t, n, v, ...) W(t, n, v) FD_E_6(W, __VA_ARGS__)
#define FD_E_12(W, t, n, v, ...) W(t, n, v) FD_E_9(W, __VA_ARGS__)
#define FD_E_15(W, t, n, v, ...) W(t, n, v) FD_E_12(W, __VA_ARGS__)
#define FD_E_18(W, t, n, v, ...) W(t, n, v) FD_E_15(W, __VA_ARGS__)
#define FD_E_21(W, t, n, v, ...) W(t, n, v) FD_E_18(W, __VA_ARGS__)
#define FD_E_24(W, t, n, v, ...) W(t, n, v) FD_E_21(W, __VA_ARGS__)
#define FD_E_27(W, t, n, v, ...) W(t, n, v) FD_E_24(W, __VA_ARGS__)
#define FD_E_30(W, t, n, v, ...) W(t, n, v) FD_E_27(W, __VA_ARGS__)
#define FD_E_33(W, t, n, v, ...) W(t, n, v) FD_E_30(W, __VA_ARGS__)
#define FD_E_36(W, t, n, v, ...) W(t, n, v) FD_E_33(W, __VA_ARGS__)
#define FD_E_39(W, t, n, v, ...) W(t, n, v) FD_E_36(W, __VA_ARGS__)
#define FD_E_42(W, t, n, v, ...) W(t, n, v) FD_E_39(W, __VA_ARGS__)
#define FD_E_45(W, t, n, v, ...) W(t, n, v) FD_E_42(W, __VA_ARGS__)
#define FD_E_48(W, t, n, v, ...) W(t, n, v) FD_E_45(W, __VA_ARGS__)
#define FD_FOREACH3(W, ...) FD_GLUE(FD_E_, FD_NARG(__VA_ARGS__))(W, __VA_ARGS__)

#define FD_DECL(t, n, v) static t n = (t)(v);
#define FD_KEEP(t, n, v) FD_sink = (void*)&n;

#define extend_data(idx, ...)             \
    inline void FD_GLUE(forcedata, idx)(void) {  \
        FD_FOREACH3(FD_DECL, __VA_ARGS__) \
        void* volatile FD_sink;           \
        (void)FD_sink;                    \
        FD_FOREACH3(FD_KEEP, __VA_ARGS__) \
    }
