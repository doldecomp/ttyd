#include "romfont.h"
#include "memory.h"
#include <dolphin/os.h>

//.sbss
static romFontWork work;

//.sdata
static romFontWork* wp = &work;

//.rodata string, .sdata table
const char* msg_jp[10] = {
	"プログレッシブモードで表示しますか？",
	"は　い　　　　　　いいえ",
	"【　　　　】",
	"画面表示モードはプログレッシブモードにセットされました。",
	"画面表示モードはインターレースモードにセットされました。",
	"ディスクカバーが開いています。\n\nゲームを続ける場合は、\nディスクカバーを閉めてください。",
	"ペーパーマリオＲＰＧの\nディスクをセットしてください。",
	"ディスクを読めませんでした。\n\nくわしくは、本体の取扱説明書を\nお読みください。",
	"エラーが発生しました。\n\n本体のパワーボタンを押して電源をOFFにし、\n本体の取扱説明書の指示に従ってください。",
	NULL
};

const char* msg_us[9] = {
	"Would you like to display in progressive scan mode?",
	"Yes              N o",
	"[    ]",
	"Progressive scan mode has been turned on.",
	"Progressive scan mode has been turned off.",
	"The Disc Cover is open.\nIf you want to continue the game,\nplease close the Disc Cover.",
	"Please insert\nthe \"Paper Mario 2\" Game Disc.",
	"The Game Disc could not be read.\nPlease read the\nNintendo GameCube Instruction Booklet\nfor more information.",
	NULL
};

static const char** msg_tbl[2] = { msg_jp, msg_us };

//local prototypes
void romFontMake(void);

const char* romFontGetMessage(s32 msg) {
	return msg_tbl[0][msg]; //has eng but always returns JP
}

void romFontInit(void) {
	wp->unk0 = 0;
	wp->unk4 = 0;
	if (OSGetFontEncode() == OS_FONT_ENCODE_SJIS) {
		wp->language = 0;
	}
	else {
		wp->language = 1;
	}
	romFontMake();
}

void romFontMake(void) {
    /* Temporary buffers for character processing */
    u16* charBuffer;
    u32 charCount;
    u32 bufferPos;
    s32 tableIndex;
    s32 strIndex;
    s32 charPos;
    const char** msgTable;
    const char* str;
    u8 curr;
    
    /* Sort and unique variables */
    u16* uniqueChars;
    u32 uniqueCount;
    u16 lastChar;
    s32 i;
    s32 j;
    u16 temp;
    
    /* Font loading variables */
    OSFontHeader* fontHeader;
    void* fontTemp;
    
    /* Character processing variables */
    u8* charData;
    u16 currChar;
    s32 width;
    char charBuffer3[3];
    
    /* Initialize main character buffer */
    charBuffer = __memAlloc(HEAP_DEFAULT, 0x800);
    charCount = 0;
    bufferPos = 0;

    /* Process all message tables */
    for (tableIndex = 0; tableIndex < 2; tableIndex++) {
        msgTable = msg_tbl[tableIndex];
        
        /* Process each string in the table */
        for (strIndex = 0; ; strIndex += 4) {
            str = msgTable[strIndex];
            if (!str) break;

            /* Skip if not Japanese table and language isn't set */
            if (wp->language != 0 && tableIndex == 0) continue;

            /* Process each character in the string */
            for (charPos = 0; str[charPos] != '\0';) {
                curr = str[charPos];
                
                /* Handle ASCII characters (0x20-0x7F) */
                if (curr >= 0x20 && curr < 0x80) {
                    charBuffer[bufferPos/2] = curr;
                    charPos++;
                    charCount++;
                    bufferPos += 2;
                }
                /* Handle SJIS characters (0x80-0x9F, 0xE0-0xFF) */
                else if ((curr >= 0x80 && curr < 0xA0) || curr >= 0xE0) {
                    charBuffer[bufferPos/2] = *(u16*)&str[charPos];
                    charPos += 2;
                    charCount++;
                    bufferPos += 2;
                }
                /* Skip other characters */
                else {
                    charPos++;
                }
            }
        }
    }

    /* Sort characters and remove duplicates */
    uniqueChars = __memAlloc(HEAP_DEFAULT, 0x800);
    uniqueCount = 0;
    lastChar = 0xFFFF;

    /* Simple bubble sort */
    for (i = 0; i < charCount - 1; i++) {
        for (j = i + 1; j < charCount; j++) {
            if (charBuffer[i] > charBuffer[j]) {
                temp = charBuffer[i];
                charBuffer[i] = charBuffer[j];
                charBuffer[j] = temp;
            }
        }
    }

    /* Remove duplicates while copying */
    for (i = 0; i < charCount; i++) {
        if (charBuffer[i] != lastChar) {
            lastChar = charBuffer[i];
            uniqueChars[uniqueCount] = lastChar;
            uniqueCount++;
        }
    }
    wp->unk4 = uniqueCount;

    /* Allocate font buffers based on encoding */
    if (OSGetFontEncode() == 1) {
        fontHeader = __memAlloc(HEAP_DEFAULT, 0x90EE4);
        fontTemp = __memAlloc(HEAP_DEFAULT, 0x4D000);
    } else {
        fontHeader = __memAlloc(HEAP_DEFAULT, 0x10120);
        fontTemp = __memAlloc(HEAP_DEFAULT, 0x3000);
    }

    /* Load font data */
    OSLoadFont(fontHeader, fontTemp);

    /* Allocate and clear character data buffer */
    wp->unk0 = __memAlloc(HEAP_DEFAULT, wp->unk4 * 0x140);
    memset(wp->unk0, 0, wp->unk4 * 0x140);

    /* Load font texel for each character */
    charData = (u8*)wp->unk0;
    for (i = 0; i < wp->unk4; i++) {
        currChar = uniqueChars[i];
        
        /* Handle ASCII vs SJIS characters */
        charBuffer3[0] = 0;
        charBuffer3[1] = 0;
        charBuffer3[2] = 0;
        
        if (currChar < 0x100) {
            charBuffer3[0] = (s8)currChar;
        } else {
            *(u16*)charBuffer3 = currChar;
        }

        OSGetFontTexel(charBuffer3, charData, 0, 6, &width);
        
        /* Store character info */
        *(u16*)(charData + 0x120) = currChar;
        *(u16*)(charData + 0x122) = width;
        
        charData += 0x140;
    }

    /* Flush cache and free temporary buffers */
    DCFlushRange(wp->unk0, wp->unk4 * 0x140);
    __memFree(HEAP_DEFAULT, fontTemp);
    __memFree(HEAP_DEFAULT, fontHeader);
    __memFree(HEAP_DEFAULT, uniqueChars);
    __memFree(HEAP_DEFAULT, charBuffer);
}

void romFontPrintGX(f32 x, f32 y, f32 scale, GXColor color, const char* msg, ...) {

}


s32 romFontGetWidth(const char* message) {
	return 0;
}
