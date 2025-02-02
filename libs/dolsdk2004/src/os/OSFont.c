#include <dolphin.h>
#include <dolphin/os.h>

#include "__os.h"

typedef char* (*ParseStringCallback)(u16, char*, OSFontHeader**, int*);

static OSFontHeader* FontDataAnsi;
static OSFontHeader* FontDataSjis;
static int FixedPitch;
static ParseStringCallback ParseString;
static u16 FontEncode = 0xFFFF;

// prototypes
static char* ParseStringS(u16 encode, const char* string, OSFontHeader** pfont, int* pfontCode);
static char* ParseStringW(u16 encode, const char* string, OSFontHeader** pfont, int* pfontCode);

static u16 HankakuToCode[]
    = { 0x20C, 0x20D, 0x20E, 0x20F, 0x210, 0x211, 0x212, 0x213,
        0x214, 0x215, 0x216, 0x217, 0x218, 0x219, 0x21A, 0x21B,
        0x21C, 0x21D, 0x21E, 0x21F, 0x220, 0x221, 0x222, 0x223,
        0x224, 0x225, 0x226, 0x227, 0x228, 0x229, 0x22A, 0x22B,
        0x22C, 0x22D, 0x22E, 0x22F, 0x230, 0x231, 0x232, 0x233,
        0x234, 0x235, 0x236, 0x237, 0x238, 0x239, 0x23A, 0x23B,
        0x23C, 0x23D, 0x23E, 0x23F, 0x240, 0x241, 0x242, 0x243,
        0x244, 0x245, 0x246, 0x247, 0x248, 0x249, 0x24A, 0x24B,
        0x24C, 0x24D, 0x24E, 0x24F, 0x250, 0x251, 0x252, 0x253,
        0x254, 0x255, 0x256, 0x257, 0x258, 0x259, 0x25A, 0x25B,
        0x25C, 0x25D, 0x25E, 0x25F, 0x260, 0x261, 0x262, 0x263,
        0x264, 0x265, 0x266, 0x267, 0x268, 0x269, 0x26A, 0x20C,
        0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C,
        0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C,
        0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C,
        0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C, 0x20C,
        0x20C, 0x26B, 0x26C, 0x26D, 0x26E, 0x26F, 0x270, 0x271,
        0x272, 0x273, 0x274, 0x275, 0x276, 0x277, 0x278, 0x279,
        0x27A, 0x27B, 0x27C, 0x27D, 0x27E, 0x27F, 0x280, 0x281,
        0x282, 0x283, 0x284, 0x285, 0x286, 0x287, 0x288, 0x289,
        0x28A, 0x28B, 0x28C, 0x28D, 0x28E, 0x28F, 0x290, 0x291,
        0x292, 0x293, 0x294, 0x295, 0x296, 0x297, 0x298, 0x299,
        0x29A, 0x29B, 0x29C, 0x29D, 0x29E, 0x29F, 0x2A0, 0x2A1,
        0x2A2, 0x2A3, 0x2A4, 0x2A5, 0x2A6, 0x2A7, 0x2A8, 0x2A9,
    };

static u16 Zenkaku2Code[]
    = { 0x000, 0x001, 0x002, 0x003, 0x004, 0x005, 0x006, 0x007,
        0x008, 0x009, 0x00A, 0x00B, 0x00C, 0x00D, 0x00E, 0x00F,
        0x010, 0x011, 0x012, 0x013, 0x014, 0x015, 0x016, 0x017,
        0x018, 0x019, 0x01A, 0x01B, 0x01C, 0x01D, 0x01E, 0x01F,
        0x020, 0x021, 0x022, 0x023, 0x024, 0x025, 0x026, 0x027,
        0x028, 0x029, 0x02A, 0x02B, 0x02C, 0x02D, 0x02E, 0x02F,
        0x030, 0x031, 0x032, 0x033, 0x034, 0x035, 0x036, 0x037,
        0x038, 0x039, 0x03A, 0x03B, 0x03C, 0x03D, 0x03E,
        0x03F, 0x040, 0x041, 0x042, 0x043, 0x044, 0x045, 0x046,
        0x047, 0x048, 0x049, 0x04A, 0x04B, 0x04C, 0x04D, 0x04E,
        0x04F, 0x050, 0x051, 0x052, 0x053, 0x054, 0x055, 0x056,
        0x057, 0x058, 0x059, 0x05A, 0x05B, 0x05C, 0x05D, 0x05E,
        0x05F, 0x060, 0x061, 0x062, 0x063, 0x064, 0x065, 0x066,
        0x067, 0x068, 0x069, 0x06A, 0x06B, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x06C, 0x06D, 0x06E, 0x06F, 0x070, 0x071, 0x072, 0x073,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x074, 0x075, 0x076, 0x077, 0x078, 0x079, 0x07A, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x07B, 0x07C, 0x07D, 0x07E, 0x07F, 0x080,
        0x081, 0x082, 0x083, 0x084, 0x085, 0x086, 0x087, 0x088,
        0x089, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x08A, 0x08B, 0x08C, 0x08D, 0x08E, 0x08F, 0x090, 0x091,
        0x000, 0x000, 0x000, 0x000, 0x092,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x093,
        0x094, 0x095, 0x096, 0x097, 0x098, 0x099, 0x09A, 0x09B,
        0x09C, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x09D, 0x09E, 0x09F, 0x0A0, 0x0A1, 0x0A2, 0x0A3, 0x0A4,
        0x0A5, 0x0A6, 0x0A7, 0x0A8, 0x0A9, 0x0AA, 0x0AB, 0x0AC,
        0x0AD, 0x0AE, 0x0AF, 0x0B0, 0x0B1, 0x0B2, 0x0B3, 0x0B4,
        0x0B5, 0x0B6, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x0B7, 0x0B8, 0x0B9, 0x0BA, 0x0BB, 0x0BC, 0x0BD,
        0x0BE, 0x0BF, 0x0C0, 0x0C1, 0x0C2, 0x0C3, 0x0C4, 0x0C5,
        0x0C6, 0x0C7, 0x0C8, 0x0C9, 0x0CA, 0x0CB, 0x0CC, 0x0CD,
        0x0CE, 0x0CF, 0x0D0, 0x000, 0x000, 0x000, 0x000, 0x0D1,
        0x0D2, 0x0D3, 0x0D4, 0x0D5, 0x0D6, 0x0D7, 0x0D8, 0x0D9,
        0x0DA, 0x0DB, 0x0DC, 0x0DD, 0x0DE, 0x0DF, 0x0E0, 0x0E1,
        0x0E2, 0x0E3, 0x0E4, 0x0E5, 0x0E6, 0x0E7, 0x0E8, 0x0E9,
        0x0EA, 0x0EB, 0x0EC, 0x0ED, 0x0EE, 0x0EF, 0x0F0, 0x0F1,
        0x0F2, 0x0F3, 0x0F4, 0x0F5, 0x0F6, 0x0F7, 0x0F8, 0x0F9,
        0x0FA, 0x0FB, 0x0FC, 0x0FD, 0x0FE, 0x0FF, 0x100, 0x101,
        0x102, 0x103, 0x104, 0x105, 0x106, 0x107, 0x108, 0x109,
        0x10A, 0x10B, 0x10C, 0x10D, 0x10E, 0x10F, 0x110, 0x111,
        0x112, 0x113, 0x114, 0x115, 0x116, 0x117, 0x118, 0x119,
        0x11A, 0x11B, 0x11C, 0x11D, 0x11E, 0x11F, 0x120, 0x121,
        0x122, 0x123, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000,
        0x124, 0x125, 0x126, 0x127, 0x128, 0x129, 0x12A, 0x12B,
        0x12C, 0x12D, 0x12E, 0x12F, 0x130, 0x131, 0x132, 0x133,
        0x134, 0x135, 0x136, 0x137, 0x138, 0x139, 0x13A, 0x13B,
        0x13C, 0x13D, 0x13E, 0x13F, 0x140, 0x141, 0x142, 0x143,
        0x144, 0x145, 0x146, 0x147, 0x148, 0x149, 0x14A, 0x14B,
        0x14C, 0x14D, 0x14E, 0x14F, 0x150, 0x151, 0x152, 0x153,
        0x154, 0x155, 0x156, 0x157, 0x158, 0x159, 0x15A, 0x15B,
        0x15C, 0x15D, 0x15E, 0x15F, 0x160, 0x161, 0x162,
        0x163, 0x164, 0x165, 0x166, 0x167, 0x168, 0x169, 0x16A,
        0x16B, 0x16C, 0x16D, 0x16E, 0x16F, 0x170, 0x171, 0x172,
        0x173, 0x174, 0x175, 0x176, 0x177, 0x178, 0x179, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x17A,
        0x17B, 0x17C, 0x17D, 0x17E, 0x17F, 0x180, 0x181, 0x182,
        0x183, 0x184, 0x185, 0x186, 0x187, 0x188, 0x189, 0x18A,
        0x18B, 0x18C, 0x18D, 0x18E, 0x18F, 0x190, 0x191, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x192,
        0x193, 0x194, 0x195, 0x196, 0x197, 0x198, 0x199, 0x19A,
        0x19B, 0x19C, 0x19D, 0x19E, 0x19F, 0x1A0, 0x1A1, 0x1A2,
        0x1A3, 0x1A4, 0x1A5, 0x1A6, 0x1A7, 0x1A8, 0x1A9, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000,
        0x1AA, 0x1AB, 0x1AC, 0x1AD, 0x1AE, 0x1AF, 0x1B0, 0x1B1,
        0x1B2, 0x1B3, 0x1B4, 0x1B5, 0x1B6, 0x1B7, 0x1B8, 0x1B9,
        0x1BA, 0x1BB, 0x1BC, 0x1BD, 0x1BE, 0x1BF, 0x1C0, 0x1C1,
        0x1C2, 0x1C3, 0x1C4, 0x1C5, 0x1C6, 0x1C7, 0x1C8, 0x1C9,
        0x1CA, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x1CB, 0x1CC, 0x1CD, 0x1CE, 0x1CF, 0x1D0, 0x1D1, 0x1D2,
        0x1D3, 0x1D4, 0x1D5, 0x1D6, 0x1D7, 0x1D8, 0x1D9,
        0x1DA, 0x1DB, 0x1DC, 0x1DD, 0x1DE, 0x1DF, 0x1E0, 0x1E1,
        0x1E2, 0x1E3, 0x1E4, 0x1E5, 0x1E6, 0x1E7, 0x1E8, 0x1E9,
        0x1EA, 0x1EB, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x1EC,
        0x1ED, 0x1EE, 0x1EF, 0x1F0, 0x1F1, 0x1F2, 0x1F3, 0x1F4,
        0x1F5, 0x1F6, 0x1F7, 0x1F8, 0x1F9, 0x1FA, 0x1FB, 0x1FC,
        0x1FD, 0x1FE, 0x1FF, 0x200, 0x201, 0x202, 0x203, 0x204,
        0x205, 0x206, 0x207, 0x208, 0x209, 0x20A, 0x20B, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x20C,
        0x20D, 0x20E, 0x20F, 0x210, 0x211, 0x212, 0x213, 0x214,
        0x215, 0x216, 0x217, 0x218, 0x219, 0x21A, 0x21B, 0x21C,
        0x21D, 0x21E, 0x21F, 0x220, 0x221, 0x222, 0x223, 0x224,
        0x225, 0x226, 0x227, 0x228, 0x229, 0x22A, 0x22B, 0x22C,
        0x22D, 0x22E, 0x22F, 0x230, 0x231, 0x232, 0x233, 0x234,
        0x235, 0x236, 0x237, 0x238, 0x239, 0x23A, 0x23B, 0x23C,
        0x23D, 0x23E, 0x23F, 0x240, 0x241, 0x242, 0x243, 0x244,
        0x245, 0x246, 0x247, 0x248, 0x249, 0x24A, 0x24B,
        0x24C, 0x24D, 0x24E, 0x24F, 0x250, 0x251, 0x252, 0x253,
        0x254, 0x255, 0x256, 0x257, 0x258, 0x259, 0x25A, 0x25B,
        0x25C, 0x25D, 0x25E, 0x25F, 0x260, 0x261, 0x262, 0x263,
        0x264, 0x265, 0x266, 0x267, 0x268, 0x269, 0x26A, 0x26B,
        0x26C, 0x26D, 0x26E, 0x26F, 0x270, 0x271, 0x272, 0x273,
        0x274, 0x275, 0x276, 0x277, 0x278, 0x279, 0x27A, 0x27B,
        0x27C, 0x27D, 0x27E, 0x27F, 0x280, 0x281, 0x282, 0x283,
        0x284, 0x285, 0x286, 0x287, 0x288, 0x289, 0x28A, 0x28B,
        0x28C, 0x28D, 0x28E, 0x28F, 0x290, 0x291, 0x292, 0x293,
        0x294, 0x295, 0x296, 0x297, 0x298, 0x299, 0x29A, 0x29B,
        0x29C, 0x29D, 0x29E, 0x29F, 0x2A0, 0x2A1, 0x2A2, 0x2A3,
        0x2A4, 0x2A5, 0x2A6, 0x2A7, 0x2A8, 0x2A9, 0x2AA, 0x2AB,
        0x2AC, 0x2AD, 0x2AE, 0x2AF, 0x2B0, 0x2B1, 0x2B2, 0x2B3,
        0x2B4, 0x2B5, 0x2B6, 0x2B7, 0x2B8, 0x2B9, 0x2BA, 0x2BB,
        0x2BC, 0x2BD, 0x2BE, 0x2BF, 0x2C0, 0x2C1, 0x2C2, 0x2C3,
        0x2C4, 0x2C5, 0x2C6, 0x2C7, 0x2C8,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000,
        0x2C9, 0x2CA, 0x2CB, 0x2CC, 0x2CD, 0x2CE, 0x2CF, 0x2D0,
        0x2D1, 0x2D2, 0x2D3, 0x2D4, 0x2D5, 0x2D6, 0x2D7, 0x2D8,
        0x2D9, 0x2DA, 0x2DB, 0x2DC, 0x2DD, 0x2DE, 0x2DF, 0x2E0,
        0x2E1, 0x2E2, 0x2E3, 0x2E4, 0x2E5, 0x2E6, 0x000, 0x2E7,
        0x2E8, 0x2E9, 0x2EA, 0x2EB, 0x2EC, 0x2ED, 0x2EE, 0x2EF,
        0x2F0, 0x2F1, 0x2F2, 0x2F3, 0x2F4, 0x2F5, 0x2F6, 0x2F7,
        0x2F8, 0x2F9, 0x2FA, 0x2FB, 0x2FC, 0x2FD, 0x000, 0x000,
        0x000, 0x000, 0x000, 0x000, 0x000, 0x000, 0x2FE,
        0x2FF, 0x300, 0x301, 0x302, 0x303, 0x304, 0x305, 0x306,
        0x307, 0x308, 0x309, 0x30A, 0x30B, 0x30C, 0x30D, 0x30E,
        0x30F, 0x310, 0x311, 0x312, 0x313, 0x314, 0x315, 0x316,
        0x317, 0x318, 0x319, 0x31A, 0x31B, 0x000 
    };

static BOOL IsSjisLeadByte(u8 c) {
    return (0x81 <= c && c <= 0x9F) || (0xE0 <= c && c <= 0xFC);
}

static BOOL IsSjisTrailByte(u8 c) {
    return (0x40 <= c && c <= 0xFC) && (c != 0x7F);
}

static int GetFontCode(u16 encode, u16 code) {
    if (encode == OS_FONT_ENCODE_SJIS) {
        if (code >= 0x20 && code <= 0xDF) {
            return HankakuToCode[code - 0x20];
        }

        if (code > 0x889E && code <= 0x9872) {
            int i = ((code >> 8) - 0x88) * 188;
            int j = (code & 0xFF);

            if (!IsSjisTrailByte(j)) {
                return 0;
            }

            j -= 0x40;
            if (j >= 0x40) {
                j--;
            }

            return (i + j + 0x2BE);
        }

        if (code >= 0x8140 && code < 0x879E) {
            int i  = ((code >> 8) - 0x81) * 188;
            int j = (code & 0xFF);

            if (!IsSjisTrailByte(j)) {
                return 0;
            }

            j -= 0x40;
            if (j >= 0x40) {
                j--;
            }

            return Zenkaku2Code[i + j];
        }
    } else if (code > 0x20 && code <= 0xFF) {
        return code - 0x20;
    }

    return 0;
}

static void Decode(u8* s, u8* d) {
    int i;
    int j;
    int k;
    int p;
    int q;
    int r7;  // huh? DWARF info says these 2 variables might be register names and not actual names.
    int r25;
    int cnt;
    int os;
    unsigned int flag;
    unsigned int code;

    os  = *(int*)(s + 0x4);
    r7  = *(int*)(s + 0x8);
    r25 = *(int*)(s + 0xC);

    q    = 0;
    flag = 0;
    p    = 16;

    do {
        // Get next mask
        if (flag == 0) {
            code = *(u32*)(s + p);
            p += sizeof(u32);
            flag = sizeof(u32) * 8;
        }

        // Non-linked chunk
        if (code & 0x80000000) {
            d[q++] = s[r25++];
        }
        // Linked chunk
        else {
            // Read offset from link table
            j = s[r7] << 8 | s[r7 + 1];
            r7 += sizeof(u16);

            // Apply offset
            k = q - (j & 0x0FFF);
            cnt    = j >> 12;
            if (cnt == 0) {
                cnt = s[r25++] + 0x12;
            } else {
                cnt += 2;
            }

            // Copy chunk
            for (i = 0; i < cnt; i++, q++, k++) {
                d[q] = d[k - 1];
            }
        }

        // Prepare next mask bit
        code <<= 1;
        flag--;
    } while (q < os);
}

static u32 GetFontSize(u8* buf) {
    if (buf[0] == 'Y' && buf[1] == 'a' && buf[2] == 'y') {
        return *(u32*)(buf + 0x4);
    }

    return 0;
}

u16 OSGetFontEncode(void) {
    if (FontEncode != 0xFFFF) {
        return FontEncode;
    }

    switch (*(int*)OSPhysicalToCached(0xCC)) {
    case VI_NTSC:
        FontEncode = (__VIRegs[VI_DTV_STAT] & 2) ? OS_FONT_ENCODE_SJIS : OS_FONT_ENCODE_ANSI;
        break;
    case VI_PAL:
    case VI_MPAL:
    case VI_DEBUG:
    case VI_DEBUG_PAL:
    case VI_EURGB60:
    default:
        FontEncode = OS_FONT_ENCODE_ANSI;
    }

    ParseString = (ParseStringCallback)ParseStringS;
    return FontEncode;
}

u16 OSSetFontEncode(u16 encode) {
    u16 prev;

    ASSERTLINE(463, encode <= OS_FONT_ENCODE_MAX);

    prev = OSGetFontEncode();
    if (encode <= OS_FONT_ENCODE_MAX) {
        FontEncode = encode;
        if (encode >= 3 && encode <= OS_FONT_ENCODE_MAX) {
            ParseString = (ParseStringCallback)ParseStringW;
        }
    }

    return prev;
}

static void ReadROM(void* buf, int length, int offset) {
    int len;
    while (length > 0) {
        len = (length <= 0x100) ? length : 0x100;
        length -= len;

        while (!__OSReadROM(buf, len, offset)) {
            ;
        }

        offset += len;
        (u8*)buf += len;
    }
}

static u32 ReadFont(void* img, u16 encode, void* fontData) {
    u32 size;
#ifndef DEBUG
    u32 padding[1];
#endif

    if (encode == OS_FONT_ENCODE_SJIS) {
        ReadROM(img, OS_FONT_ROM_SIZE_SJIS, 0x1AFF00);
    } else {
        ReadROM(img, OS_FONT_ROM_SIZE_ANSI, 0x1FCF00);
    }

    size = GetFontSize(img);
    if (size == 0) {
        return 0;
    }

    Decode(img, fontData);
    if (encode == OS_FONT_ENCODE_SJIS) {
        OSFontHeader* font = (OSFontHeader*)fontData;
        int fontCode;
        u8* imageSrc;
        int sheet;
        int numChars;
        int row;
        int column;
        int x;
        int y;
        u8* src;
        u16 imageT[4] = {0x2ABE, 0x003D, 0x003D, 0x003D};

        fontCode = GetFontCode(encode, 0x54);
        sheet = fontCode / (font->sheetColumn * font->sheetRow);
        numChars = fontCode - (sheet * (font->sheetColumn * font->sheetRow)); 
        row = numChars / font->sheetColumn;
        column = numChars - (row * font->sheetColumn);
        row *= font->cellHeight;
        column *= font->cellWidth;

        imageSrc = (u8*)font + font->sheetImage;
        imageSrc += ((sheet * font->sheetSize) >> 1);

        for (y = 4; y < 8; y++) {
            x = 0;
            src = imageSrc + ((((font->sheetWidth / 8) << 5) / 2) * ((row + y) / 8));
            src += ((column + x) / 8) * 0x10;
            src += ((row + y) % 8) * 2;
            src += ((column + x) % 8) / 4;

            *(u16*)src = imageT[y - 4];
        }
    }

    return size;
}

u32 OSLoadFont(OSFontHeader* fontData, void* tmp) {
    u16 encode;
    u32 size;

    encode = OSGetFontEncode();
    switch (encode) {
    case 0:
        FontDataAnsi = fontData;
        size = ReadFont(tmp, 0, FontDataAnsi);
        break;
    case 1:
        FontDataSjis = fontData;
        size = ReadFont(tmp, 1, FontDataSjis);
        break;
    case 3:
    case 4:
    case 5:
        FontDataAnsi = fontData;
        size = ReadFont(tmp, 0, FontDataAnsi);
        if (size != 0) {
            FontDataSjis = (OSFontHeader*)((u8*)FontDataAnsi + size);
            size += ReadFont(tmp, 1, FontDataSjis);
        }
        break;
    case 2:
    default:
        size = 0;
        break;
    }

    return size;
}

static char* ParseStringS(u16 encode, const char* string, OSFontHeader** pfont, int* pfontCode) {
    OSFontHeader* font;
    u16 code = 0;

    switch (encode) {
    case OS_FONT_ENCODE_ANSI:
        font = FontDataAnsi;
        code = *string;
        if (code != 0) {
            string++;
        }
        break;
    case OS_FONT_ENCODE_SJIS:
        font = FontDataSjis;
        code = *string;
        if (code == 0) {
            break;
        }
        string++;

        if (IsSjisLeadByte(code) && IsSjisTrailByte(*string)) {
            code = (code << 8 | *string++);
        }
        break;
    }

    *pfont = font;
    *pfontCode = GetFontCode(encode, code);

    return (char*)string;
}

static char* ParseStringW(u16 encode, const char* string, OSFontHeader** pfont, int* pfontCode) {
    OSFontHeader* font;
    u16 code = 0;
    u32 utf32 = 0;

    switch (encode) {
    case OS_FONT_ENCODE_ANSI:
        font = FontDataAnsi;
        code = *string;
        if (code != 0) {
            string++;
        }
        break;
    case OS_FONT_ENCODE_SJIS:
        font = FontDataSjis;
        code = *string;
        if (code == 0) {
            break;
        }
        string++;

        if (IsSjisLeadByte(code) && IsSjisTrailByte(*string)) {
            code = (code << 8 | *string++);
        }
        break;
    case 3:
        string = OSUTF8to32(string, &utf32);
        break;
    case 4:
        string = (const char*)OSUTF16to32((u16*)string, &utf32);
        break;
    case 5:
        utf32 = *(u32*)string;
        if (utf32 != 0) {
            string += 4;
        }
        break;
    }

    if (utf32 != 0) {
        encode = 0;
        font = FontDataAnsi;
        code = OSUTF32toANSI(utf32);

        if (code == 0 || (FixedPitch != 0 && utf32 <= 0x7F)) {
            code = OSUTF32toSJIS(utf32);
            if (code != 0) {
                encode = 1;
                font = FontDataSjis;
            }
        }
    }

    *pfont = font;
    *pfontCode = GetFontCode(encode, code);

    return (char*)string;
}

char* OSGetFontTexel(const char* string, void* image, s32 pos, s32 stride, s32* width) {
    u16 encode;
    OSFontHeader* font;
    u8* src;
    u8* dst;
    int fontCode;
    int sheet;
    int numChars;
    int row;
    int column;
    int x;
    int y;
    int offsetSrc;
    int offsetDst;
    u8* colorIndex;
    u8* imageSrc;

    encode = OSGetFontEncode();
    string = ParseString(encode, (char*)string, &font, &fontCode);
    colorIndex = &font->c0;
    ASSERTLINE(828, font->sheetFormat == GX_TF_I4);
    
    sheet = fontCode / (font->sheetColumn * font->sheetRow);
    numChars = fontCode - (sheet * (font->sheetColumn * font->sheetRow)); 
    row = numChars / font->sheetColumn;
    column = numChars - (row * font->sheetColumn);
    row *= font->cellHeight;
    column *= font->cellWidth;

    imageSrc = (u8*)font + font->sheetImage;
    imageSrc += ((sheet * font->sheetSize) >> 1);

    for (y = 0; y < font->cellHeight; y++) {
        for (x = 0; x < font->cellWidth; x++) {
            src = imageSrc + (((font->sheetWidth / 8) * 32) / 2) * ((row + y) / 8);
            src += ((column + x) / 8) * 16;
            src += ((row + y) % 8) * 2; 
            src += ((column + x) % 8) / 4;

            offsetSrc = (column + x) % 4;

            dst = (u8*)image + ((y / 8) * (((stride * 4) / 8) * 32));
            dst += (((pos + x) / 8) * 32);
            dst += ((y % 8) * 4);
            dst += ((pos + x) % 8) / 2;

            offsetDst = (pos + x) % 2;

            *dst |= colorIndex[*src >> (6 - (offsetSrc * 2)) & 3] & ((offsetDst != 0) ? 0x0F : 0xF0);
        }
    }
    
    if (width != 0) {
        *width = ((u8*)font + font->widthTable)[fontCode];
    }

    return (char*)string;
}

static void ExpandFontSheet(OSFontHeader* font, u8* src, u8* dst) { 
    int i;
    u8* colorIndex = &font->c0;

    if (font->sheetFormat == GX_TF_I4) {
        for (i = (s32)(font->sheetFullSize) / 2 - 1; i >= 0; i--) {
            dst[i * 2 + 0] =
                colorIndex[src[i] >> 6 & 3] & 0xF0 | colorIndex[src[i] >> 4 & 3] & 0x0F;
            dst[i * 2 + 1] =
                colorIndex[src[i] >> 2 & 3] & 0xF0 | colorIndex[src[i] >> 0 & 3] & 0x0F;
        }
    } else if (font->sheetFormat == GX_TF_IA4) {
        for (i = (s32)(font->sheetFullSize) / 4 - 1; i >= 0; i--) {
            dst[i * 4 + 0] = colorIndex[src[i] >> 6 & 3];
            dst[i * 4 + 1] = colorIndex[src[i] >> 4 & 3];
            dst[i * 4 + 2] = colorIndex[src[i] >> 2 & 3];
            dst[i * 4 + 3] = colorIndex[src[i] >> 0 & 3];
        }
    }

    DCStoreRange(dst, font->sheetFullSize);
}

int OSInitFont(OSFontHeader* fontData) {
    u16 encode;
    u32 size;
    void* tmp;
    u8* img;

    ASSERTLINE(919, (u32) fontData % 32 == 0);

    encode = OSGetFontEncode();
    switch (encode) {
    case 0:
        tmp = (void*)((u8*)fontData + 0x1D120);
        FontDataAnsi = fontData;
        size = ReadFont(tmp, 0, FontDataAnsi);
        if (size == 0) {
            return 0;
        }

        img = (u8*)FontDataAnsi + FontDataAnsi->sheetImage;
        FontDataAnsi->sheetImage = OSRoundUp32B(FontDataAnsi->sheetImage);
        ExpandFontSheet(FontDataAnsi, img, (u8*)FontDataAnsi + FontDataAnsi->sheetImage);
        break;
    case 1:
        tmp = (void*)((u8*)fontData + 0xD3F00);
        FontDataSjis = fontData;
        size = ReadFont(tmp, 1, FontDataSjis);
        if (size == 0) {
            return 0;
        }

        img = (u8*)FontDataSjis + FontDataSjis->sheetImage;
        FontDataSjis->sheetImage = OSRoundUp32B(FontDataSjis->sheetImage);
        ExpandFontSheet(FontDataSjis, img, (u8*)FontDataSjis + FontDataSjis->sheetImage);
        break;
    case 3:
    case 4:
    case 5:
        tmp = (void*)((u8*)fontData + 0xF4020);
        FontDataAnsi = fontData;
        size = ReadFont(tmp, 0, FontDataAnsi);
        if (size == 0) {
            return 0;
        }

        img = (u8*)FontDataAnsi + FontDataAnsi->sheetImage;
        FontDataAnsi->sheetImage = OSRoundUp32B(FontDataAnsi->sheetImage);
        ExpandFontSheet(FontDataAnsi, img, (u8*)FontDataAnsi + FontDataAnsi->sheetImage);

        FontDataSjis = (OSFontHeader*)((u8*)FontDataAnsi + 0x20120);
        size = ReadFont(tmp, 1, FontDataSjis);
        if (size == 0) {
            return 0;
        }

        img = (u8*)FontDataSjis + FontDataSjis->sheetImage;
        FontDataSjis->sheetImage = OSRoundUp32B(FontDataSjis->sheetImage);
        ExpandFontSheet(FontDataSjis, img, (u8*)FontDataSjis + FontDataSjis->sheetImage);
        break;
    case 2:
    default:
        break;
    }

    return 1;
}

char* OSGetFontTexture(const char* string, void** image, s32* x, s32* y, s32* width) {
    OSFontHeader* font;
    u16 encode;
    int fontCode;
    int sheet;
    int numChars;
    int row;
    int column;

    encode = OSGetFontEncode();
    string = ParseString(encode, (char*)string, &font, &fontCode);
    sheet = fontCode / (font->sheetColumn * font->sheetRow);
    ((u32*)image)[0] = (u32)font + font->sheetImage + (font->sheetSize * sheet);
    numChars = fontCode - (sheet * (font->sheetColumn * font->sheetRow)); 
    row = numChars / font->sheetColumn;
    column = numChars - (row * font->sheetColumn);
    *x = column * font->cellWidth;
    *y = row * font->cellHeight;

    ASSERTLINE(1016, (u32) *image % 32 == 0);

    if (width != 0) {
        *width = ((u8*)font + font->widthTable)[fontCode];
    }
    return (char*)string;
}

char* OSGetFontWidth(const char* string, s32* width) {
    OSFontHeader* font;
    u16 encode;
    int fontCode;

    encode = OSGetFontEncode();
    string = ParseString(encode, (char*)string, &font, &fontCode);
    
    if (width != 0) {
        *width = ((u8*)font + font->widthTable)[fontCode];
    }

    return (char*)string;
}

int OSSetFontWidth(int fixed) {
    int prev = FixedPitch;
    FixedPitch = fixed;
    return prev;
}
