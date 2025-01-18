/* "system" - Useful Functions
 * Status: Almost 1:1, need to complete fsort, qqsort, and fix some regalloc issues
 *
 * Function: lots of helper functions for complex math
 *
 * Last Update: 7/8/2022, finish almost all of system
 */

#include "system.h"
#include <dolphin/gx.h>
#include <dolphin/pad.h>
#include <demo/DEMOPad.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "mario/mariost.h"

#pragma pool_data on

#define HALF_PI 1.5707963267948966f
#define PI 3.141592653589793f
#define TWO_PI 6.283185307179586f

extern BOOL __mapdrv_make_dl; //mapdrv.c
extern GlobalWork* gp;

void fsort(u32* array, u32 num_elements);

//.data
static f32 angleABTBL[] = {
	1.0f, 1.273187f, 1.27303f, 1.272768f, 1.272402f, 1.271932f, 1.271358f,
	1.270681f, 1.269902f, 1.269021f, 1.268038f, 1.266956f, 1.265774f, 1.2644939f,
	1.263116f, 1.2616431f, 1.260075f, 1.258413f, 1.256659f, 1.254815f, 1.2528811f,
	1.250859f, 1.248752f, 1.24656f, 1.244285f, 1.2419291f, 1.239494f, 1.236981f,
	1.234393f, 1.2317311f, 1.228997f, 1.226192f, 1.22332f, 1.220382f, 1.217379f,
	1.2143151f, 1.211189f, 1.208006f, 1.204766f, 1.201471f, 1.1981241f, 1.1947269f,
	1.191281f, 1.1877871f, 1.18425f, 1.180669f, 1.177047f, 1.173386f, 1.169687f,
	1.165952f, 1.162184f, 1.158384f, 1.1545531f, 1.1506931f, 1.146806f, 1.142893f,
	1.138957f, 1.134998f, 1.131018f, 1.127019f, 1.1230021f, 1.118969f, 1.11492f,
	1.110858f, 1.106783f, 1.102697f, 1.098601f, 1.094496f, 1.090384f, 1.086266f,
	1.082142f, 1.078014f, 1.0738831f, 1.06975f, 1.065616f, 1.061482f, 1.057348f,
	1.053216f, 1.049087f, 1.04496f, 1.040838f, 1.036721f, 1.0326101f, 1.028504f,
	1.024406f, 1.020316f, 1.016234f, 1.0121599f, 1.0080971f, 1.004043f, 1.0f
};

char* intplStringData[] = {
	"LINEAR",
	"DOUBLE_ACCEL",
	"TRIPLE_ACCEL",
	"DOUBLE_DECEL",
	"TRIPLE_DECEL",
	"GEMINI",
	"BURURUN",
	"BURURUN_DECEL",
	"SIN_ACCEL",
	"SIN_DECEL"
};

//.bss
void* tmp0[0xC00]; //size 0x3000
u8 tmp1[0x100];

//.sbss
s32(*comp)(const void* a, const void* b);
u32* lo;
u32* hi;
u32* gt;
u32* tail;
u32 p;
u16 token;

const char* getMarioStDvdRoot(void) { //1:1
	return ".";
}

f32 reviseAngle(f32 angle) { //1:1
	f32 result, temp;

	temp = (f32)fmod(angle, 360.0);
	result = temp;

	if (result != result) { //check for NaN
		result = 0.0f;
	}

	if (result < 0.0f) {
		result += 360.0f;
		if (result >= 360.0f) {
			result = 0.0f;
		}
	}
	return result;
}

f32 distABf(f32 x1, f32 y1, f32 x2, f32 y2) { //1:1
	f32 xdiff, ydiff;

	ydiff = y2 - y1;
	xdiff = x2 - x1;
	return sqrtf((xdiff * xdiff) + (ydiff * ydiff));
}

f32 compAngle(f32 a1, f32 a2) { //1:1
	if (fabsf(a2 - a1) >= 180.0f) {
		if (a2 < a1) {
			a2 += 360.0f;
		}
		else {
			a2 -= 360.0f;
		}
	}
	return a2 - a1;
}

static f32 angleABf(f32 x1, f32 y1, f32 x2, f32 y2) { //1:1
	f32 xdiff, ydiff;
	f32 xabs, yabs;
	f32 v8;
	f32 v9;
	int v10;
	f32 v13;
	f32 v15;
	f32 test;

	xdiff = x2 - x1;
	ydiff = y2 - y1;
	xabs = fabsf(xdiff);
	yabs = fabsf(ydiff);
	if (xabs > yabs) {
		v8 = 45.0f * (yabs / xabs);
		v9 = 2.0f * v8;
		if (v9 >= 0.0f) {
			v10 = (int)(0.5 + v9);
		}
		else {
			v10 = -(int)(0.5 - v9);
		}
		test = v8 * angleABTBL[v10];
		if (xdiff >= 0.0f) {
			if (ydiff >= 0.0f) {
				v13 = 90.0f + test;
			}
			else {
				v13 = 90.0f - test;
			}
		}
		else {
			if (ydiff >= 0.0f) {
				v13 = 270.0f - test;
			}
			else {
				v13 = 270.0f + test;
			}
		}
	}
	else {
		if (yabs == 0.0f) {
			return 0.0f;
		}
		else {
			v15 = 45.0f * (xabs / yabs);
			v9 = 2.0f * v15;
			if (v9 >= 0.0f) {
				v10 = (int)(0.5 + v9);
			}
			else {
				v10 = -(int)(0.5 - v9);
			}
			test = v15 * angleABTBL[v10];
			if (ydiff >= 0.0f) {
				if (xdiff >= 0.0f) {
					v13 = 180.0f - test;
				}
				else {
					v13 = 180.0f + test;
				}
			}
			else {
				if (xdiff >= 0.0f) {
					v13 = 0.0f + test;
				}
				else {
					v13 = 360.0f - test;
				}
			}
		}
	}
	return v13;
}

f32 intplGetValue(s32 mode, s32 currStep, s32 steps, f32 start, f32 end) { //1:1
	f32 step;
	f32 total;
	f32 f0, f1, f2, f3, f4;

	if (!steps) {
		return end;
	}
	step = (f32)currStep;
	total = (f32)steps;
	switch (mode) {
		case 0:
			return start + ((step * (end - start)) / total);
		case 1:
			return start + (((step * step) * (end - start)) / (total * total));
		case 2:
			return start + (((step * step * step) * (end - start)) / (total * total * total));
		case 3:
			return start + (((step * step * step * step) * (end - start)) / (total * (total * (total * total))));
		case 7:
			f2 = (f32)cos(4.0f * (PI * (step / total)));
			f1 = (end - start);
			f3 = (total - step);
			return end - ((f3 * (f3 * (f1 * f2))) / (total * total));
		case 8:
			f2 = (f32)cos((4.0f * (PI * ((step * step) / total))) / ((15.0f * total) / 100.0f));
			f1 = (end - start);
			f3 = (total - step);
			return end - ((f3 * (f3 * (f1 * f2))) / (total * total));
		case 9:
			return end - ((step * (step * ((end - start) * (f32)cos((4.0f * (PI * ((step * step) / total))) / ((15.0f * total) / 100.0f))))) / (total * total));
		case 4:
			f1 = (total - step);
			return (start + (end - start)) - (((f1 * f1) * (end - start)) / (total * total));
		case 5:
			f4 = (total - step);
			return (start + (end - start)) - (((f4 * f4 * f4) * (end - start)) / (total * total * total));
		case 6:
			f4 = (total - step);
			return (start + (end - start)) - (((f4 * f4 * f4 * f4) * (end - start)) / (total * total * total * total));
		case 10:
			f2 = (f32)cos((4.0f * (PI * ((step * step) / total))) / ((40.0f * total) / 100.0f));
			f3 = (total - step);
			f1 = (f3 * (f3 * f2)) / (total * total);
			if (f1 < 0.0f) {
				f1 = -f1;
			}
			return -((f1 * (end - start)) - end);
		case 11:
			f3 = (f32)cos((PI * step) / total);
			f2 = (end - start);
			f0 = 0.5f;
			f1 = (f2 * (1.0f - f3));
			return start + (f1 * f0);
		case 12:
			f1 = (f32)sin((HALF_PI * step) / total);
			f0 = (end - start);
			return start + (f0 * f1);
		case 13:
			f2 = (f32)cos((HALF_PI * step) / total);
			f1 = (end - start);
			return start + (f1 * (1.0f - f2));
		default:
			return ((f32(*)(s32, s32, f32, f32))mode)(currStep, steps, start, end);
	}
}

#ifdef __MWERKS__
asm void qqsort(void* array, s32 num_elements, s32 element_size, s32(*compare)(const void**, const void**)) {
	nofralloc
	stwu    r1, -0x40(r1)
	mflr    r0
	lis     r7, tmp0@ha
	stw     r0, 0x44(r1)
	stmw    r21, 0x14(r1)
	mr      r30, r4
	lis     r4, tmp1@ha
	mr      r29, r3
	addi    r0, r4, tmp1@l
	cmplwi  r30, 1
	mr      r31, r5
	mr      r23, r0
	stw     r6, comp(r13)
	addi    r6, r7, tmp0@l
	mr      r24, r6
	ble     @8
	cmplwi  r30, 0
	mr      r5, r29
	mr      r4, r6
	mr      r3, r30
	ble     @3
	srwi.   r0, r3, 3
	mtctr   r0
	beq     @1
	@0:
	stw     r5, 0(r4)
	add     r5, r5, r31
	stw     r5, 4(r4)
	add     r5, r5, r31
	stw     r5, 8(r4)
	add     r5, r5, r31
	stw     r5, 0xC(r4)
	add     r5, r5, r31
	stw     r5, 0x10(r4)
	add     r5, r5, r31
	stw     r5, 0x14(r4)
	add     r5, r5, r31
	stw     r5, 0x18(r4)
	add     r5, r5, r31
	stw     r5, 0x1C(r4)
	add     r5, r5, r31
	addi    r4, r4, 0x20
	bdnz    @0
	andi.   r3, r3, 7
	beq     @3
	@1:
	mtctr   r3
	@2:
	stw     r5, 0(r4)
	add     r5, r5, r31
	addi    r4, r4, 4
	bdnz    @2
	@3:
	mr      r3, r24
	mr      r4, r30
	bl      fsort
	mr      r27, r29
	mr      r26, r24
	li      r25, 0
	b       @7
	@4:
	lwz     r0, 0(r26)
	cmplwi  r0, 0
	beq     @6
	cmplw   r0, r27
	mr      r22, r26
	beq     @6
	mr      r3, r23
	mr      r21, r27
	mr      r4, r27
	mr      r5, r31
	bl      memcpy
	li      r28, 0
	@5:
	lwz     r4, 0(r22)
	mr      r3, r21
	mr      r5, r31
	bl      memcpy
	lwz     r21, 0(r22)
	subf    r0, r29, r21
	stw     r28, 0(r22)
	divwu   r0, r0, r31
	slwi    r0, r0, 2
	add     r22, r24, r0
	lwz     r0, 0(r22)
	cmplw   r0, r27
	bne     @5
	mr      r3, r21
	mr      r4, r23
	mr      r5, r31
	bl      memcpy
	li      r0, 0
	stw     r0, 0(r22)
	@6:
	add     r27, r27, r31
	addi    r26, r26, 4
	@7:
	cmplw   r25, r30
	addi    r25, r25, 1
	blt     @4
	@8:
	lmw     r21, 0x14(r1)
	lwz     r0, 0x44(r1)
	mtlr    r0
	addi    r1, r1, 0x40
	blr
}

asm void fsort(u32* array, u32 num_elements) {
	nofralloc
	stwu    r1, -0x30(r1)
	mflr    r0
	stw     r0, 0x34(r1)
	stmw    r25, 0x14(r1)
	mr      r25, r3
	mr      r26, r4
	@0:
	addi    r0, r26, -1
	cmplwi  r26, 2
	slwi    r0, r0, 2
	add     r30, r25, r0
	stw     r30, tail(r13)
	bne     @1
	lwz     r12, comp(r13)
	lwz     r3, 0(r25)
	lwz     r4, 0(r30)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	ble     @43
	lwz     r0, 0(r25)
	lwz     r3, tail(r13)
	stw     r0, p(r13)
	lwz     r0, 0(r3)
	stw     r0, 0(r25)
	lwz     r0, p(r13)
	lwz     r3, tail(r13)
	stw     r0, 0(r3)
	b       @43
	@1:
	cmplwi  r26, 4
	bne     @2
	addi    r0, r30, -4
	stw     r25, lo(r13)
	mr      r29, r30
	stw     r30, gt(r13)
	stw     r0, hi(r13)
	b       shared_80006A94
	@2:
	cmplwi  r26, 40
	bge     @8
	lwz     r12, comp(r13)
	extlwi  r0, r26, 30,1
	lwz     r3, 0(r25)
	add     r29, r25, r0
	lwz     r4, 0(r30)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	ble     @5
	lwz     r12, comp(r13)
	lwz     r3, 0(r25)
	lwz     r4, 0(r29)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	bge     @3
	lwz     r3, tail(r13)
	lwz     r0, 0(r3)
	stw     r0, p(r13)
	lwz     r0, 0(r29)
	stw     r0, 0(r3)
	lwz     r0, 0(r25)
	stw     r0, 0(r29)
	lwz     r0, p(r13)
	stw     r0, 0(r25)
	b       @7
	@3:
	lwz     r4, tail(r13)
	lwz     r12, comp(r13)
	lwz     r3, 0(r29)
	lwz     r4, 0(r4)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	bge     @4
	lwz     r0, 0(r25)
	stw     r0, p(r13)
	lwz     r0, 0(r29)
	stw     r0, 0(r25)
	lwz     r3, tail(r13)
	lwz     r0, 0(r3)
	stw     r0, 0(r29)
	lwz     r0, p(r13)
	lwz     r3, tail(r13)
	stw     r0, 0(r3)
	b       @7
	@4:
	lwz     r0, 0(r25)
	lwz     r3, tail(r13)
	stw     r0, p(r13)
	lwz     r0, 0(r3)
	stw     r0, 0(r25)
	lwz     r0, p(r13)
	lwz     r3, tail(r13)
	stw     r0, 0(r3)
	b       @7
	@5:
	lwz     r12, comp(r13)
	lwz     r3, 0(r25)
	lwz     r4, 0(r29)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	ble     @6
	lwz     r0, 0(r25)
	stw     r0, p(r13)
	lwz     r0, 0(r29)
	stw     r0, 0(r25)
	lwz     r0, p(r13)
	stw     r0, 0(r29)
	b       @7
	@6:
	lwz     r4, tail(r13)
	lwz     r12, comp(r13)
	lwz     r3, 0(r29)
	lwz     r4, 0(r4)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	ble     @7
	lwz     r0, 0(r29)
	lwz     r3, tail(r13)
	stw     r0, p(r13)
	lwz     r0, 0(r3)
	stw     r0, 0(r29)
	lwz     r0, p(r13)
	lwz     r3, tail(r13)
	stw     r0, 0(r3)
	@7:
	cmplwi  r26, 3
	beq     @43
	lwz     r3, tail(r13)
	addi    r0, r25, 4
	stw     r0, lo(r13)
	addi    r0, r3, -4
	stw     r3, gt(r13)
	stw     r0, hi(r13)
	b       shared_80006A94
	@8:
	li      r7, -1
	li      r6, 0x20
	li      r5, 0x3F
	b       @13
	@9:
	srawi.r3, r6, 1
	and r4, r7, r26
	li      r0, 1
	beq     @10
	mr      r0, r3
	@10:
	cmplwi  r4, 0
	slw     r0, r7, r0
	and r7, r7, r0
	beq     @11
	subf    r5, r6, r5
	@11:
	cmplwi  r4, 0
	bne     @12
	srw     r7, r7, r6
	@12:
	mr      r6, r3
	@13:
	cmplwi  r7, 0
	bne     @9
	li      r0, 0x20
	subfc   r0, r5, r0
	subfe   r3, r0, r0
	subfic  r0, r5, 0x20
	andc    r3, r0, r3
	clrlwi.r0, r3, 31
	srawi   r0, r3, 1
	srw     r4, r26, r0
	beq     @14
	srawi   r0, r3, 1
	li      r3, 1
	slw     r4, r3, r0
	@14:
	divwu   r26, r26, r4
	srwi    r3, r4, 31
	addi    r0, r4, -1
	add     r3, r3, r4
	mr      r28, r25
	srawi   r3, r3, 1
	mullw   r0, r0, r26
	slwi    r31, r26, 2
	mullw   r3, r3, r26
	slwi    r0, r0, 2
	add     r0, r25, r0
	stw     r0, tail(r13)
	slwi    r0, r3, 2
	add     r29, r25, r0
	@15:
	lwz     r4, tail(r13)
	stw     r28, lo(r13)
	subf    r0, r28, r4
	srawi   r0, r0, 2
	stw     r4, gt(r13)
	addze   r3, r0
	srwi    r0, r3, 31
	stw     r4, hi(r13)
	add     r0, r0, r3
	srawi   r0, r0, 1
	divwu   r0, r0, r26
	mullw   r0, r26, r0
	slwi    r0, r0, 2
	add     r27, r28, r0
	b       @19
	@16:
	lwz     r12, comp(r13)
	lwz     r3, 0(r3)
	lwz     r4, 0(r27)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	ble     @17
	lwz     r0, hi(r13)
	stw     r0, gt(r13)
	b       @18
	@17:
	blt     @24
	@18:
	lwz     r0, hi(r13)
	subf    r0, r31, r0
	stw     r0, hi(r13)
	@19:
	lwz     r3, hi(r13)
	lwz     r0, lo(r13)
	cmplw   r3, r0
	bge     @16
	b       @25
	b       @24
	@20:
	lwz     r12, comp(r13)
	lwz     r3, 0(r3)
	lwz     r4, 0(r27)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	blt     @23
	lwz     r5, lo(r13)
	lwz     r4, hi(r13)
	lwz     r0, 0(r5)
	stw     r0, p(r13)
	lwz     r0, 0(r4)
	stw     r0, 0(r5)
	lwz     r0, p(r13)
	lwz     r4, hi(r13)
	stw     r0, 0(r4)
	ble     @21
	lwz     r0, hi(r13)
	stw     r0, gt(r13)
	@21:
	neg     r0, r3
	andc    r0, r0, r3
	srwi.r0, r0, 31
	bne     @22
	lwz     r27, hi(r13)
	@22:
	lwz     r3, lo(r13)
	lwz     r0, hi(r13)
	add     r3, r3, r31
	subf    r0, r31, r0
	stw     r3, lo(r13)
	stw     r0, hi(r13)
	b       @19
	@23:
	lwz     r0, lo(r13)
	add     r0, r0, r31
	stw     r0, lo(r13)
	@24:
	lwz     r3, lo(r13)
	lwz     r0, hi(r13)
	cmplw   r3, r0
	blt     @20
	@25:
	lwz     r3, gt(r13)
	cmplw   r3, r27
	bge     @26
	lwz     r0, 0(r3)
	stw     r0, p(r13)
	lwz     r0, 0(r27)
	stw     r0, 0(r3)
	lwz     r0, p(r13)
	stw     r0, 0(r27)
	lwz     r0, gt(r13)
	add     r0, r0, r31
	stw     r0, gt(r13)
	@26:
	lwz     r0, gt(r13)
	cmplw   r0, r29
	bgt     @27
	mr      r28, r0
	b       @28
	@27:
	lwz     r0, hi(r13)
	cmplw   r0, r29
	blt     @29
	stw     r0, tail(r13)
	@28:
	lwz     r0, tail(r13)
	cmplw   r28, r0
	blt     @15
	@29:
	stw     r25, lo(r13)
	stw     r30, tail(r13)
	stw     r30, gt(r13)
	stw     r30, hi(r13)
	b       shared_80006A94
	@30:
	lwz     r12, comp(r13)
	lwz     r3, 0(r3)
	lwz     r4, 0(r29)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	ble     @31
	lwz     r0, hi(r13)
	stw     r0, gt(r13)
	b       @32
	@31:
	blt     @37
	@32:
	lwz     r3, hi(r13)
	addi    r0, r3, -4
	stw     r0, hi(r13)
	shared_80006A94 :
	lwz     r3, hi(r13)
	lwz     r0, lo(r13)
	cmplw   r3, r0
	bge     @30
	b       @38
	b       @37
	@33:
	lwz     r12, comp(r13)
	lwz     r3, 0(r3)
	lwz     r4, 0(r29)
	mtctr   r12
	bctrl
	cmpwi   r3, 0
	blt     @36
	lwz     r5, lo(r13)
	lwz     r4, hi(r13)
	lwz     r0, 0(r5)
	stw     r0, p(r13)
	lwz     r0, 0(r4)
	stw     r0, 0(r5)
	lwz     r0, p(r13)
	lwz     r4, hi(r13)
	stw     r0, 0(r4)
	ble     @34
	lwz     r0, hi(r13)
	stw     r0, gt(r13)
	@34:
	neg     r0, r3
	andc    r0, r0, r3
	srwi.r0, r0, 31
	bne     @35
	lwz     r29, hi(r13)
	@35:
	lwz     r4, lo(r13)
	lwz     r3, hi(r13)
	addi    r4, r4, 4
	addi    r0, r3, -4
	stw     r4, lo(r13)
	stw     r0, hi(r13)
	b       shared_80006A94
	@36:
	lwz     r3, lo(r13)
	addi    r0, r3, 4
	stw     r0, lo(r13)
	@37:
	lwz     r3, lo(r13)
	lwz     r0, hi(r13)
	cmplw   r3, r0
	blt     @33
	@38:
	lwz     r4, gt(r13)
	cmplw   r4, r29
	bge     @39
	lwz     r3, 0(r4)
	addi    r0, r4, 4
	stw     r3, p(r13)
	lwz     r3, 0(r29)
	stw     r0, gt(r13)
	stw     r3, 0(r4)
	lwz     r0, p(r13)
	stw     r0, 0(r29)
	@39:
	lwz     r4, hi(r13)
	lwz     r5, gt(r13)
	subf    r0, r25, r4
	lwz     r6, tail(r13)
	srawi   r0, r0, 2
	addze   r3, r0
	subf    r0, r5, r6
	srawi   r0, r0, 2
	addze   r0, r0
	cmpw    r3, r0
	bge     @40
	stw     r25, hi(r13)
	mr      r25, r5
	stw     r4, lo(r13)
	b       @41
	@40:
	stw     r6, lo(r13)
	stw     r4, tail(r13)
	stw     r5, hi(r13)
	@41:
	lwz     r0, tail(r13)
	lwz     r5, lo(r13)
	lwz     r3, hi(r13)
	subf    r0, r25, r0
	srawi   r0, r0, 2
	addze   r4, r0
	cmplw   r5, r3
	addi    r26, r4, 1
	ble     @42
	subf    r0, r3, r5
	srawi   r0, r0, 2
	addze   r4, r0
	addi    r4, r4, 1
	bl      fsort
	@42:
	cmplwi  r26, 1
	bgt     @0
	@43:
	lmw     r25, 0x14(r1)
	lwz     r0, 0x34(r1)
	mtlr    r0
	addi    r1, r1, 0x30
	blr
}
#endif

DEMOPadStatus* GET_DEMO_PAD_STATUS(u32 i) { //should auto-inline
    return DemoPad + i;
}

void makeKey(void) { //1:1
    s32 delay;
    u16 button;
    u16 dirs;
    int i;

    DEMOPadRead();
    for (i = 0; i < 4; i++) {
        dirs = GET_DEMO_PAD_STATUS(i)->dirs;
        gp->dirsNew[i] = dirs & (dirs ^ gp->dirs[i]);
        gp->dirsRepeat[i] = gp->dirsNew[i];
        if (dirs && dirs == gp->dirs[i]) {
            if (!--gp->dirsRepeatDelay[i]) {
                gp->dirsRepeat[i] = dirs;
                gp->dirsRepeatDelay[i] = 6;
            }
        }
        else {
            gp->dirsRepeatDelay[i] = 24;
        }
        gp->dirs[i] = dirs;
    }

    for (i = 0; i < 4; i++) {
        button = GET_DEMO_PAD_STATUS(i)->pst.button;
        gp->buttonNew[i] = button & (button ^ gp->button[i]);
        gp->buttonRepeat[i] = gp->buttonNew[i];
        if (button && button == gp->button[i]) {
            if (!--gp->buttonRepeatDelay[i]) {
                gp->buttonRepeat[i] = button;
                gp->buttonRepeatDelay[i] = 6;
            }
        }
        else {
            gp->buttonRepeatDelay[i] = 24;
        }
        gp->button[i] = button;
        gp->buttonUp[i] = GET_DEMO_PAD_STATUS(i)->buttonUp;
    }

    for (i = 0; i < 4; i++) {
        gp->stickX[i] = GET_DEMO_PAD_STATUS(i)->pst.stickX;
        gp->stickY[i] = GET_DEMO_PAD_STATUS(i)->pst.stickY;
        gp->substickX[i] = GET_DEMO_PAD_STATUS(i)->pst.substickX;
        gp->substickY[i] = GET_DEMO_PAD_STATUS(i)->pst.substickY;
        gp->triggerLeft[i] = GET_DEMO_PAD_STATUS(i)->pst.triggerLeft;
        gp->triggerRight[i] = GET_DEMO_PAD_STATUS(i)->pst.triggerRight;
    }

    if (gp->unk1294) {
        for (i = 0; i < 4; i++) {
            if (gp->unk1310[i]) {
                PADControlMotor(i, 2);
            } else {
                if (gp->prevRumbleStatus[i] != gp->rumbleStatus[i]) {
                    switch (gp->rumbleStatus[i]) {
                        case 0:
                            PADControlMotor(i, 0);
                            break;
                        case 1:
                            PADControlMotor(i, 1);
                            break;
                        case 2:
                            PADControlMotor(i, 2);
                            break;
                    }
                    gp->prevRumbleStatus[i] = gp->rumbleStatus[i];
                }
            }
        }
    }
    gp->unk1324 = 1;
}

u32 keyGetDir(u32 chan) {
	return gp->dirs[chan];
}

u32 keyGetButton(u32 chan) {
	return gp->button[chan];
}

u32 keyGetDirRep(u32 chan) {
	return gp->dirsRepeat[chan];
}

u32 keyGetButtonRep(u32 chan) {
	return gp->buttonRepeat[chan];
}

u32 keyGetDirTrg(u32 chan) {
	return gp->dirsNew[chan];
}

u32 keyGetButtonTrg(u32 chan) {
	return gp->buttonNew[chan];
}

s8 keyGetStickX(u32 chan) {
	return gp->stickX[chan];
}

s8 keyGetStickY(u32 chan) {
	return gp->stickY[chan];
}

//unused on retail
s8 keyGetSubStickX(u32 chan) {
	return gp->substickX[chan];
}

s8 keyGetSubStickY(u32 chan) {
	return gp->substickY[chan];
}

void padRumbleOn(u32 chan) {
	gp->rumbleStatus[chan] = PAD_MOTOR_RUMBLE;
}

void padRumbleOff(u32 chan) {
	gp->rumbleStatus[chan] = PAD_MOTOR_STOP;
}

void padRumbleHardOff(u32 chan) {
	gp->rumbleStatus[chan] = PAD_MOTOR_STOP_HARD;
}

u8 padGetRumbleStatus(u32 chan) {
	return gp->rumbleStatus[chan];
}

void sincosf(f32* ret_sin, f32* ret_cos, f32 degree) {
	float result; // fp31

	result = PI * degree / 180.0f; //convert to radian
	*ret_sin = (f32)sin(result);
	*ret_cos = -(f32)cos(result);
}

void movePos(float* ret_sin, float* ret_cos, f32 a3, f32 degree) {
	f32 result1, result2, radian;

	radian = (TWO_PI * degree) / 360.0f;
	result1 = (f32)sin(radian);
	result2 = (f32)cos(radian);
	*ret_sin = (a3 * result1) + *ret_sin;
	*ret_cos = -((a3 * result2) - *ret_cos);
}

s32 irand(s32 scalar) {
	if (scalar == 0) {
		return 0;
	}
	return rand() % scalar;
}

u16 sysGetToken(void) {
	return token++;
}

void sysWaitDrawSync(void) { //1:1
    OSTick tick;
    u16 this_token;

    this_token = token;
    token++;
    tick = OSGetTick();
    if (!__mapdrv_make_dl) {
        GXSetDrawSync(this_token);
        while (GXReadDrawSync() != (u16)this_token) {
            if (OSTicksToMilliseconds(OSGetTick() - tick) > 100) {
                break;
            }
        }
    }
}

void sysDummyDraw(Mtx mtx) { //1:1
	f32 temp_f1, temp_f2;

	GXLoadPosMtxImm(mtx, 0);
	GXSetCurrentMtx(0);
	GXSetNumChans(0);
	GXSetNumTexGens(1);
	GXSetNumTevStages(1);
	GXSetTexCoordGen(GX_TEXCOORD0, GX_TG_MTX2x4, GX_TG_TEX0, 0x3C);
	GXSetTevOrder(GX_TEVSTAGE0, GX_TEXCOORD_NULL, GX_TEXMAP_NULL, GX_COLOR_NULL);
	GXSetTevColorOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevAlphaOp(GX_TEVSTAGE0, GX_TEV_ADD, GX_TB_ZERO, GX_CS_SCALE_1, GX_TRUE, GX_TEVPREV);
	GXSetTevColorIn(GX_TEVSTAGE0, GX_CC_ZERO, GX_CC_ZERO, GX_CC_ZERO, GX_CC_C0);
	GXSetTevAlphaIn(GX_TEVSTAGE0, GX_CA_ZERO, GX_CA_ZERO, GX_CA_ZERO, GX_CA_A0);
	GXSetZMode(GX_FALSE, GX_ALWAYS, GX_FALSE);
	GXSetColorUpdate(GX_FALSE);
	GXSetAlphaUpdate(GX_FALSE);
	GXSetBlendMode(GX_BM_BLEND, GX_BL_ZERO, GX_BL_ONE, GX_LO_OR);
	GXSetZCompLoc(GX_FALSE);
	GXSetAlphaCompare(GX_GEQUAL, 0x80u, GX_AOP_OR, GX_NEVER, 0);
	GXSetTevColor(GX_TEVREG0, (GXColor) { 0, 0, 0, 0x81 });
	GXClearVtxDesc();
	GXSetVtxDesc(GX_VA_POS, GX_DIRECT);
	GXSetVtxDesc(GX_VA_TEX0, GX_DIRECT);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_POS, GX_POS_XYZ, GX_F32, 0);
	GXSetVtxAttrFmt(GX_VTXFMT0, GX_VA_TEX0, GX_TEX_ST, GX_F32, 0);
	GXBegin(GX_TRIANGLES, GX_VTXFMT0, 3);
	temp_f1 = 0.0f;
	temp_f2 = 20.0f;
	GXPosition3f32(temp_f1, temp_f1, 0.0f);
	GXTexCoord2f32(0.0f, 0.0f);
	GXPosition3f32(temp_f2, temp_f1, 0.0f);
	GXTexCoord2f32(0.0f, 0.0f);
	GXPosition3f32(temp_f2, temp_f2, 0.0f);
	GXTexCoord2f32(0.0f, 0.0f);
}

f32 getV60FPS(f32 a1, s64 a2, s64 a3) { //1:1
	u64 v4, v5;

	v4 = (u64)OSTicksToMilliseconds(a2);
	v5 = (u64)OSTicksToMilliseconds(a3);
	if (v5 >= v4) {
		v5 = v5 - v4;
	}
	else {
		v5 = (-1 - v4) + v5;
	}
	return ((60.0f * a1) * (f32)v5) / 1000.0f;
}

f32 sysFrame2SecFloat(f32 frame) {
	return frame / 60.0f;
}

s32 sysMsec2Frame(s32 msec) {
	return (msec * 60) / 1000;
}

f32 sysMsec2FrameFloat(f32 msec) {
	return (msec * 60.0f) / 1000.0f;
}

void mtxGetRotationElement(Mtx arg0, Mtx arg1, char arg2, char arg3) { //1:1
    Vec vecX, vecY, vecZ;
    switch (arg2) {
    case 'x':
    case 'X':
        vecX.x = arg0[0][0];
        vecX.y = arg0[1][0];
        vecX.z = arg0[2][0];
        PSVECNormalize(&vecX, &vecX);
        
        switch (arg3) {
            case 'z':
            case 'Z':
                vecZ.x = arg0[0][2];
                vecZ.y = arg0[1][2];
                vecZ.z = arg0[2][2];
                PSVECNormalize(&vecZ, &vecZ);
                PSVECCrossProduct(&vecZ, &vecX, &vecY);
                PSVECCrossProduct(&vecX, &vecY, &vecZ);
            break;
            
            default:
                vecY.x = arg0[0][1];
                vecY.y = arg0[1][1];
                vecY.z = arg0[2][1];
                PSVECNormalize(&vecY, &vecY);
                PSVECCrossProduct(&vecX, &vecY, &vecZ);
                PSVECCrossProduct(&vecZ, &vecX, &vecY);
            break;
        }
        break;

    case 'y':
    case 'Y':
        vecY.x = arg0[0][1];
        vecY.y = arg0[1][1];
        vecY.z = arg0[2][1];
        PSVECNormalize(&vecY, &vecY);
        
        switch (arg3) {
            case 'x':
            case 'X':
                vecX.x = arg0[0][0];
                vecX.y = arg0[1][0];
                vecX.z = arg0[2][0];
                PSVECNormalize(&vecX, &vecX);
                PSVECCrossProduct(&vecX, &vecY, &vecZ);
                PSVECCrossProduct(&vecY, &vecZ, &vecX);
                break;

            default:
                vecZ.x = arg0[0][2];
                vecZ.y = arg0[1][2];
                vecZ.z = arg0[2][2];
                PSVECNormalize(&vecZ, &vecZ);
                PSVECCrossProduct(&vecY, &vecZ, &vecX);
                PSVECCrossProduct(&vecX, &vecY, &vecZ);
                break;
        }
        break;

    default:
        vecZ.x = arg0[0][2];
        vecZ.y = arg0[1][2];
        vecZ.z = arg0[2][2];
        PSVECNormalize(&vecZ, &vecZ);

        switch (arg3) {
            case 'y':
            case 'Y':
                vecY.x = arg0[0][1];
                vecY.y = arg0[1][1];
                vecY.z = arg0[2][1];
                PSVECNormalize(&vecY, &vecY);
                PSVECCrossProduct(&vecY, &vecZ, &vecX);
                PSVECCrossProduct(&vecZ, &vecX, &vecY);
            break;

            default:
                vecX.x = arg0[0][0];
                vecX.y = arg0[1][0];
                vecX.z = arg0[2][0];
                PSVECNormalize(&vecX, &vecX);
                PSVECCrossProduct(&vecZ, &vecX, &vecY);
                PSVECCrossProduct(&vecY, &vecZ, &vecX);
            break;
        }
        break;
    }

    arg1[0][0] = vecX.x;
    arg1[1][0] = vecX.y;
    arg1[2][0] = vecX.z;
    arg1[0][1] = vecY.x;
    arg1[1][1] = vecY.y;
    arg1[2][1] = vecY.z;
    arg1[0][2] = vecZ.x;
    arg1[1][2] = vecZ.y;
    arg1[2][2] = vecZ.z;
    arg1[0][3] = 0.0f;
    arg1[1][3] = 0.0f;
    arg1[2][3] = 0.0f;
}

s32 LZ77Decode(u8* inputBuffer, u8 *outputBuffer) {
    u8 *output;
    s8 flag;
    s8 bitsLeft;
    s32 bytesWritten;
    s32 expectedSize;
    u8 *input;
    int byte1;
    int byte2;
    int size;
    u8 *lookback;
    int i;
    
    output = outputBuffer;
    bitsLeft = 0;
    if (*inputBuffer != 0x10) {
        return 0;
    }
    expectedSize = inputBuffer[1] & 0xFF;
    expectedSize += (inputBuffer[2] << 8) & 0xFF00;
    expectedSize += (inputBuffer[3] << 16) & 0xFF0000;
    input = inputBuffer + 4;
    while (1) {
        bytesWritten = outputBuffer - output;
        if (expectedSize == bytesWritten) {
            break;
        }
        if (!bitsLeft) {
            flag = *input++;
            bitsLeft = 8;
        }
        if (flag >= 0) {
            *outputBuffer++ = *input++;
        }
        else {
            byte1 = input[0];
            byte2 = input[1];
            size = ((byte1 >> 4) & 0xF) + 3;
            byte1 = ((byte1 & 0xF) << 8);
            byte1 = byte1 + byte2;
            lookback = (outputBuffer - byte1) - 1;
            input += 2;
            for (i = 0; i < size; i++) {
                *outputBuffer++ = *lookback++;
            }
        }
        bitsLeft--;
        flag <<= 1;
    }
    return bytesWritten;
}

#ifdef __MWERKS__
asm void* memcpy_as4(void* dest, const void* src, u32 count) {
	nofralloc
	addi    r3, r3, -4
	srwi    r5, r5, 2
	addi    r4, r4, -4
	mtctr   r5
	@0:
	lwzu    r11, 4(r4)
	stwu    r11, 4(r3)
	bdnz    @0
	blr
}
#endif

//unknown function, is used for many functions to "initialize"/copy some value into the local stack, with an extra vec
Vec initializeVec(Vec* input) {
    Vec temp = (Vec){0.0f, 0.0f, 0.0f};
    temp.x = input->x;
    temp.y = input->y;
    temp.z = input->z;
    return temp;
}

#pragma pool_data off
