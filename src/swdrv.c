#include "global.h"

void swInit(void) {
    memset(gp->mGSFW, 0, sizeof(gp->mGSFW));
    memset(gp->mGSW, 0, sizeof(gp->mGSW));
    memset(gp->mLSWF, 0, sizeof(gp->mLSWF));
    memset(gp->mLSW, 0, sizeof(gp->mLSW));
    gp->mGSW0 = 0;
}

void swReInit(void) {
    memset(gp->mLSWF, 0, sizeof(gp->mLSWF));
    memset(gp->mLSW, 0, sizeof(gp->mLSW));
}

void swSet(s32 index) { //set specific bit
    gp->mGSFW[index / 32] |= (1 << (index % 32));
}

BOOL swGet(s32 index) { //get specific bit
    return (gp->mGSFW[index / 32] & (1 << (index % 32))) != 0;
}

//Global Saved Work Flags --------------------------------------
void swClear(s32 index) { //clear specific bit
    gp->mGSFW[index / 32] &= ~(1 << (index % 32));
}

void swByteSet(s32 index, u32 value) {
    if (index == 0) {
        gp->mGSW0 = value;
    }
    else {
        gp->mGSW[index] = (u8)value;
    }
}

//Global Saved Work --------------------------------------------
u32 swByteGet(s32 index) {
    if (index == 0) {
        return gp->mGSW0;
    }
    else {
        return gp->mGSW[index];
    }
}

void _swSet(s32 index) { //set specific bit
    gp->mLSWF[index / 32] |= (1 << (index % 32));
}

BOOL _swGet(s32 index) { //get specific bit
    return (gp->mLSWF[index / 32] & (1 << (index % 32))) != 0;
}

//Local Saved Work Flags ---------------------------------------
void _swClear(s32 index) { //clear specific bit
    gp->mLSWF[index / 32] &= ~(1 << (index % 32));
}

void _swByteSet(u32 idx, u8 value) {
    gp->mLSW[idx] = value;
}

u8 _swByteGet(u32 idx) {
    return gp->mLSW[idx];
}

/*
.global _swByteGet
_swByteGet:
  800847B8 000817B8  80 0D 90 B0   lwz r0, lbl_80410310-_SDA_BASE_(r13)
  800847BC 000817BC  7C 60 1A 14   add r3, r0, r3
  800847C0 000817C0  88 63 0D B8   lbz r3, 0xdb8(r3)
  800847C4 000817C4  4E 80 00 20   blr 

.global _swByteSet
_swByteSet:
  800847C8 000817C8  80 0D 90 B0   lwz r0, lbl_80410310-_SDA_BASE_(r13)
  800847CC 000817CC  7C 60 1A 14   add r3, r0, r3
  800847D0 000817D0  98 83 0D B8   stb r4, 0xdb8(r3)
  800847D4 000817D4  4E 80 00 20   blr 

.global _swClear
_swClear:
  800847D8 000817D8  7C 64 2E 70   srawi r4, r3, 5
  800847DC 000817DC  54 60 D8 08   slwi r0, r3, 0x1b
  800847E0 000817E0  7C A4 01 94   addze r5, r4
  800847E4 000817E4  54 63 0F FE   srwi r3, r3, 0x1f
  800847E8 000817E8  7C 03 00 50   subf r0, r3, r0
  800847EC 000817EC  80 CD 90 B0   lwz r6, lbl_80410310-_SDA_BASE_(r13)
  800847F0 000817F0  54 A5 10 3A   slwi r5, r5, 2
  800847F4 000817F4  38 80 00 01   li r4, 1
  800847F8 000817F8  54 00 28 3E   rotlwi r0, r0, 5
  800847FC 000817FC  7C 00 1A 14   add r0, r0, r3
  80084800 00081800  7C A6 2A 14   add r5, r6, r5
  80084804 00081804  80 65 0D 78   lwz r3, 0xd78(r5)
  80084808 00081808  7C 80 00 30   slw r0, r4, r0
  8008480C 0008180C  7C 60 00 78   andc r0, r3, r0
  80084810 00081810  90 05 0D 78   stw r0, 0xd78(r5)
  80084814 00081814  4E 80 00 20   blr 

.global _swGet
_swGet:
  80084818 00081818  7C 64 2E 70   srawi r4, r3, 5
  8008481C 0008181C  54 60 D8 08   slwi r0, r3, 0x1b
  80084820 00081820  7C 84 01 94   addze r4, r4
  80084824 00081824  54 63 0F FE   srwi r3, r3, 0x1f
  80084828 00081828  7C 03 00 50   subf r0, r3, r0
  8008482C 0008182C  80 CD 90 B0   lwz r6, lbl_80410310-_SDA_BASE_(r13)
  80084830 00081830  54 85 10 3A   slwi r5, r4, 2
  80084834 00081834  38 80 00 01   li r4, 1
  80084838 00081838  7C A6 2A 14   add r5, r6, r5
  8008483C 0008183C  54 00 28 3E   rotlwi r0, r0, 5
  80084840 00081840  7C 00 1A 14   add r0, r0, r3
  80084844 00081844  80 65 0D 78   lwz r3, 0xd78(r5)
  80084848 00081848  7C 80 00 30   slw r0, r4, r0
  8008484C 0008184C  7C 63 00 38   and r3, r3, r0
  80084850 00081850  7C 03 00 D0   neg r0, r3
  80084854 00081854  7C 00 1B 78   or r0, r0, r3
  80084858 00081858  54 03 0F FE   srwi r3, r0, 0x1f
  8008485C 0008185C  4E 80 00 20   blr 

.global _swSet
_swSet:
  80084860 00081860  7C 64 2E 70   srawi r4, r3, 5
  80084864 00081864  54 60 D8 08   slwi r0, r3, 0x1b
  80084868 00081868  7C 84 01 94   addze r4, r4
  8008486C 0008186C  54 63 0F FE   srwi r3, r3, 0x1f
  80084870 00081870  7C 03 00 50   subf r0, r3, r0
  80084874 00081874  80 CD 90 B0   lwz r6, lbl_80410310-_SDA_BASE_(r13)
  80084878 00081878  54 85 10 3A   slwi r5, r4, 2
  8008487C 0008187C  38 80 00 01   li r4, 1
  80084880 00081880  7C A6 2A 14   add r5, r6, r5
  80084884 00081884  54 00 28 3E   rotlwi r0, r0, 5
  80084888 00081888  7C 00 1A 14   add r0, r0, r3
  8008488C 0008188C  80 65 0D 78   lwz r3, 0xd78(r5)
  80084890 00081890  7C 80 00 30   slw r0, r4, r0
  80084894 00081894  7C 60 03 78   or r0, r3, r0
  80084898 00081898  90 05 0D 78   stw r0, 0xd78(r5)
  8008489C 0008189C  4E 80 00 20   blr 

.global swByteGet
swByteGet:
  800848A0 000818A0  2C 03 00 00   cmpwi r3, 0
  800848A4 000818A4  40 82 00 10   bne lbl_800848B4
  800848A8 000818A8  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  800848AC 000818AC  80 63 01 74   lwz r3, 0x174(r3)
  800848B0 000818B0  4E 80 00 20   blr 
lbl_800848B4:
  800848B4 000818B4  80 0D 90 B0   lwz r0, lbl_80410310-_SDA_BASE_(r13)
  800848B8 000818B8  7C 60 1A 14   add r3, r0, r3
  800848BC 000818BC  88 63 05 78   lbz r3, 0x578(r3)
  800848C0 000818C0  4E 80 00 20   blr 

.global swByteSet
swByteSet:
  800848C4 000818C4  2C 03 00 00   cmpwi r3, 0
  800848C8 000818C8  40 82 00 10   bne lbl_800848D8
  800848CC 000818CC  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  800848D0 000818D0  90 83 01 74   stw r4, 0x174(r3)
  800848D4 000818D4  4E 80 00 20   blr 
lbl_800848D8:
  800848D8 000818D8  80 0D 90 B0   lwz r0, lbl_80410310-_SDA_BASE_(r13)
  800848DC 000818DC  7C 60 1A 14   add r3, r0, r3
  800848E0 000818E0  98 83 05 78   stb r4, 0x578(r3)
  800848E4 000818E4  4E 80 00 20   blr 

.global swClear
swClear:
  800848E8 000818E8  7C 64 2E 70   srawi r4, r3, 5
  800848EC 000818EC  54 60 D8 08   slwi r0, r3, 0x1b
  800848F0 000818F0  7C A4 01 94   addze r5, r4
  800848F4 000818F4  54 63 0F FE   srwi r3, r3, 0x1f
  800848F8 000818F8  7C 03 00 50   subf r0, r3, r0
  800848FC 000818FC  80 CD 90 B0   lwz r6, lbl_80410310-_SDA_BASE_(r13)
  80084900 00081900  54 A5 10 3A   slwi r5, r5, 2
  80084904 00081904  38 80 00 01   li r4, 1
  80084908 00081908  54 00 28 3E   rotlwi r0, r0, 5
  8008490C 0008190C  7C 00 1A 14   add r0, r0, r3
  80084910 00081910  7C A6 2A 14   add r5, r6, r5
  80084914 00081914  80 65 01 78   lwz r3, 0x178(r5)
  80084918 00081918  7C 80 00 30   slw r0, r4, r0
  8008491C 0008191C  7C 60 00 78   andc r0, r3, r0
  80084920 00081920  90 05 01 78   stw r0, 0x178(r5)
  80084924 00081924  4E 80 00 20   blr 

.global swGet
swGet:
  80084928 00081928  7C 64 2E 70   srawi r4, r3, 5
  8008492C 0008192C  54 60 D8 08   slwi r0, r3, 0x1b
  80084930 00081930  7C 84 01 94   addze r4, r4
  80084934 00081934  54 63 0F FE   srwi r3, r3, 0x1f
  80084938 00081938  7C 03 00 50   subf r0, r3, r0
  8008493C 0008193C  80 CD 90 B0   lwz r6, lbl_80410310-_SDA_BASE_(r13)
  80084940 00081940  54 85 10 3A   slwi r5, r4, 2
  80084944 00081944  38 80 00 01   li r4, 1
  80084948 00081948  7C A6 2A 14   add r5, r6, r5
  8008494C 0008194C  54 00 28 3E   rotlwi r0, r0, 5
  80084950 00081950  7C 00 1A 14   add r0, r0, r3
  80084954 00081954  80 65 01 78   lwz r3, 0x178(r5)
  80084958 00081958  7C 80 00 30   slw r0, r4, r0
  8008495C 0008195C  7C 63 00 38   and r3, r3, r0
  80084960 00081960  7C 03 00 D0   neg r0, r3
  80084964 00081964  7C 00 1B 78   or r0, r0, r3
  80084968 00081968  54 03 0F FE   srwi r3, r0, 0x1f
  8008496C 0008196C  4E 80 00 20   blr 

.global swSet
swSet:
  80084970 00081970  7C 64 2E 70   srawi r4, r3, 5
  80084974 00081974  54 60 D8 08   slwi r0, r3, 0x1b
  80084978 00081978  7C 84 01 94   addze r4, r4
  8008497C 0008197C  54 63 0F FE   srwi r3, r3, 0x1f
  80084980 00081980  7C 03 00 50   subf r0, r3, r0
  80084984 00081984  80 CD 90 B0   lwz r6, lbl_80410310-_SDA_BASE_(r13)
  80084988 00081988  54 85 10 3A   slwi r5, r4, 2
  8008498C 0008198C  38 80 00 01   li r4, 1
  80084990 00081990  7C A6 2A 14   add r5, r6, r5
  80084994 00081994  54 00 28 3E   rotlwi r0, r0, 5
  80084998 00081998  7C 00 1A 14   add r0, r0, r3
  8008499C 0008199C  80 65 01 78   lwz r3, 0x178(r5)
  800849A0 000819A0  7C 80 00 30   slw r0, r4, r0
  800849A4 000819A4  7C 60 03 78   or r0, r3, r0
  800849A8 000819A8  90 05 01 78   stw r0, 0x178(r5)
  800849AC 000819AC  4E 80 00 20   blr 

.global swReInit
swReInit:
  800849B0 000819B0  94 21 FF F0   stwu r1, -0x10(r1)
  800849B4 000819B4  7C 08 02 A6   mflr r0
  800849B8 000819B8  38 80 00 00   li r4, 0
  800849BC 000819BC  38 A0 00 40   li r5, 0x40
  800849C0 000819C0  90 01 00 14   stw r0, 0x14(r1)
  800849C4 000819C4  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  800849C8 000819C8  38 63 0D 78   addi r3, r3, 0xd78
  800849CC 000819CC  4B F8 06 E9   bl memset
  800849D0 000819D0  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  800849D4 000819D4  38 80 00 00   li r4, 0
  800849D8 000819D8  38 A0 04 00   li r5, 0x400
  800849DC 000819DC  38 63 0D B8   addi r3, r3, 0xdb8
  800849E0 000819E0  4B F8 06 D5   bl memset
  800849E4 000819E4  80 01 00 14   lwz r0, 0x14(r1)
  800849E8 000819E8  7C 08 03 A6   mtlr r0
  800849EC 000819EC  38 21 00 10   addi r1, r1, 0x10
  800849F0 000819F0  4E 80 00 20   blr 

.global swInit
swInit:
  800849F4 000819F4  94 21 FF F0   stwu r1, -0x10(r1)
  800849F8 000819F8  7C 08 02 A6   mflr r0
  800849FC 000819FC  38 80 00 00   li r4, 0
  80084A00 00081A00  38 A0 04 00   li r5, 0x400
  80084A04 00081A04  90 01 00 14   stw r0, 0x14(r1)
  80084A08 00081A08  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  80084A0C 00081A0C  38 63 01 78   addi r3, r3, 0x178
  80084A10 00081A10  4B F8 06 A5   bl memset
  80084A14 00081A14  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  80084A18 00081A18  38 80 00 00   li r4, 0
  80084A1C 00081A1C  38 A0 08 00   li r5, 0x800
  80084A20 00081A20  38 63 05 78   addi r3, r3, 0x578
  80084A24 00081A24  4B F8 06 91   bl memset
  80084A28 00081A28  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  80084A2C 00081A2C  38 80 00 00   li r4, 0
  80084A30 00081A30  38 A0 00 40   li r5, 0x40
  80084A34 00081A34  38 63 0D 78   addi r3, r3, 0xd78
  80084A38 00081A38  4B F8 06 7D   bl memset
  80084A3C 00081A3C  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  80084A40 00081A40  38 80 00 00   li r4, 0
  80084A44 00081A44  38 A0 04 00   li r5, 0x400
  80084A48 00081A48  38 63 0D B8   addi r3, r3, 0xdb8
  80084A4C 00081A4C  4B F8 06 69   bl memset
  80084A50 00081A50  80 6D 90 B0   lwz r3, lbl_80410310-_SDA_BASE_(r13)
  80084A54 00081A54  38 00 00 00   li r0, 0
  80084A58 00081A58  90 03 01 74   stw r0, 0x174(r3)
  80084A5C 00081A5C  80 01 00 14   lwz r0, 0x14(r1)
  80084A60 00081A60  7C 08 03 A6   mtlr r0
  80084A64 00081A64  38 21 00 10   addi r1, r1, 0x10
  80084A68 00081A68  4E 80 00 20   blr 
*/
