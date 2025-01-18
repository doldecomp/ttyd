#include "evt/evt_johoya.h"
#include "driver/msgdrv.h"
#include <string.h>

extern int sprintf(char* str, const char* format, ...);

//.data
InformantWork _jdt;
const char* evtNoLabel[] = {
	"STG0_00", "STG0_01", "STG0_02", "STG0_03", "STG0_04", "STG0_05", "STG0_06", "STG0_07", "STG0_08",
	"STG0_09", "STG0_10", "STG0_10_01", "STG0_11", "STG0_12", "STG0_12_01", "STG0_12_02", "STG0_13",
	"STG0_14", "STG0_15", "STG0_16", "STG0_17", "STG0_19", "STG0_END", "STG1_00", "STG1_00_01",
	"STG1_01", "STG1_01a", "STG1_02", "STG1_03", "STG1_04", "STG1_05", "STG1_06", "STG1_06_01",
	"STG1_07", "STG1_08", "STG1_09", "STG1_09_01", "STG1_09_02", "STG1_10", "STG1_11", "STG1_12",
	"STG1_12_01", "STG1_12_02", "STG1_13", "STG1_13_01", "STG1_13_01_01", "STG1_13_02", "STG1_13_03",
	"STG1_14", "STG1_14_01", "STG1_15", "STG1_15_01", "STG1_15_02", "STG1_15_03", "STG1_15_04", "STG1_16",
	"STG1_17", "STG1_18", "STG1_18_01", "STG1_19", "STG1_19_01", "STG1_19_02", "STG1_20", "STG1_21",
	"STG1_30", "STG1_31", "STG1_32", "STG1_33", "STG1_34", "STG1_35", "STG1_END", "STG2_00", "STG2_01",
	"STG2_02", "STG2_03", "STG2_03_01", "STG2_03_02", "STG2_03_03", "STG2_03_04", "STG2_03_05", "STG2_04",
	"STG2_05", "STG2_05_01", "STG2_05_02", "STG2_06", "STG2_07", "STG2_08", "STG2_09", "STG2_10", "STG2_11",
	"STG2_12", "STG2_12_01", "STG2_12_02", "STG2_13", "STG2_14", "STG2_15", "STG2_16", "STG2_17", "STG2_18",
	"STG2_19", "STG2_19_01", "STG2_20", "STG2_21", "STG2_21_01", "STG2_21_02", "STG2_21_03", "STG2_21_04",
	"STG2_21_06", "STG2_22", "STG2_23", "STG2_23_01", "STG2_24", "STG2_25", "STG2_25_01", "STG2_25_02",
	"STG2_25_03", "STG2_25_04", "STG2_25_05", "STG2_26", "STG2_27", "STG2_40", "STG2_41", "STG2_44",
	"STG2_45", "STG2_46", "STG2_47", "STG2_END", "STG3_00", "STG3_01", "STG3_02", "STG3_03", "STG3_04",
	"STG3_05", "STG3_06", "STG3_07", "STG3_10", "STG3_11", "STG3_12", "STG3_20", "STG3_20_00", "STG3_20_01",
	"STG3_20_02", "STG3_20_03", "STG3_20_04", "STG3_20_05", "STG3_20_06", "STG3_20_07", "STG3_20_07_00",
	"STG3_20_08", "STG3_20_09", "STG3_20_10", "STG3_20_11", "STG3_20_12", "STG3_20_13", "STG3_20_14",
	"STG3_20_15", "STG3_20_16", "STG3_21", "STG3_30", "STG3_30_01", "STG3_30_02", "STG3_30_03", "STG3_30_04",
	"STG3_31", "STG3_32", "STG3_33", "STG3_33_01", "STG3_33_02", "STG3_33_03", "STG3_33_04", "STG3_33_05",
	"STG3_33_06", "STG3_34", "STG3_35", "STG3_50", "STG3_51", "STG3_52", "STG3_END", "STG4_00", "STG4_01_00",
	"STG4_01", "STG4_02", "STG4_02_02", "STG4_02_03", "STG4_03", "STG4_04", "STG4_04_01_00", "STG4_04_01",
	"STG4_05", "STG4_06", "STG4_06_01", "STG4_06_02", "STG4_07", "STG4_08", "STG4_09", "STG4_09_01",
	"STG4_09_02", "STG4_09_03", "STG4_09_04", "STG4_09_05", "STG4_10", "STG4_10_02", "STG4_11", "STG4_11_02",
	"STG4_12", "STG4_12_01", "STG4_13", "STG4_13_02", "STG4_13_03", "STG4_13_04", "STG4_14", "STG4_15",
	"STG4_15_02", "STG4_15_03", "STG4_15_04", "STG4_15_05", "STG4_15_06", "STG4_15_07", "STG4_15_08",
	"STG4_16", "STG4_17", "STG4_30", "STG4_31", "STG4_32", "STG4_33", "STG4_34", "STG4_35", "STG4_36",
	"STG4_37", "STG4_END", "STG5_00", "STG5_10", "STG5_11", "STG5_12", "STG5_13", "STG5_15", "STG5_16",
	"STG5_17", "STG5_18", "STG5_18_01", "STG5_18_02", "STG5_18_03", "STG5_19", "STG5_19_01", "STG5_19_02",
	"STG5_20", "STG5_21", "STG5_21_01", "STG5_22", "STG5_29", "STG5_30", "STG5_31", "STG5_32", "STG5_33",
	"STG5_34", "STG5_35", "STG5_36", "STG5_40", "STG5_41", "STG5_41_01", "STG5_42", "STG5_43", "STG5_44",
	"STG5_45", "STG5_46", "STG5_47", "STG5_48", "STG5_49", "STG5_58", "STG5_59", "STG5_59_01", "STG5_60",
	"STG5_61", "STG5_62", "STG5_63", "STG5_64", "STG5_64_01", "STG5_64_02", "STG5_64_03", "STG5_65",
	"STG5_66", "STG5_END", "STG6_00", "STG6_01", "STG6_02", "STG6_03", "STG6_04", "STG6_05", "STG6_06",
	"STG6_07", "STG6_08", "STG6_09", "STG6_10", "STG6_11", "STG6_12", "STG6_13", "STG6_14", "STG6_15",
	"STG6_16", "STG6_17", "STG6_18", "STG6_19", "STG6_20", "STG6_21", "STG6_22", "STG6_23", "STG6_24",
	"STG6_24_02", "STG6_25", "STG6_26", "STG6_27", "STG6_28", "STG6_29", "STG6_30", "STG6_31", "STG6_32",
	"STG6_33", "STG6_34", "STG6_35", "STG6_36", "STG6_37", "STG6_38", "STG6_39", "STG6_40", "STG6_41",
	"STG6_42", "STG6_43", "STG6_44", "STG6_45", "STG6_46", "STG6_47_00", "STG6_47", "STG6_48", "STG6_49_00",
	"STG6_49", "STG6_50", "STG6_51", "STG6_52", "STG6_53", "STG6_54", "STG6_55", "STG6_55_01", "STG6_55_02",
	"STG6_55_03", "STG6_55_04", "STG6_56", "STG6_57", "STG6_70", "STG6_71", "STG6_71_01", "STG6_72",
	"STG6_END", "STG7_00", "STG7_01", "STG7_02", "STG7_03", "STG7_04", "STG7_05", "STG7_06", "STG7_07",
	"STG7_07_01", "STG7_08", "STG7_09", "STG7_10", "STG7_11", "STG7_12", "STG7_13", "STG7_14", "STG7_15",
	"STG7_16", "STG7_17", "STG7_18", "STG7_19", "STG7_20", "STG7_25_00", "STG7_25_00_1", "STG7_25",
	"STG7_26", "STG7_50", "STG7_51", "STG7_52", "STG7_END", "STG8_00", "STG8_01", "STG8_01_01", "STG8_01_02",
	"STG8_02", "STG8_03", "STG8_04", "STG8_05", "STG8_06", "STG8_07", "STG8_08", "STG8_09", "STG8_10",
	"STG8_11", "STG8_12", "STG8_13", "STG8_14", "STG8_14_01", "STG8_15", "STG8_16", "STG8_END", "STG9_00",
	"STG9_01", "STG9_02", "STG9_END"
};

//local prototypes
s32 johoya_data_make(const char* prefix, s32 type);

USERFUNC_DEF(johoya_data_alloc) {
    InformantWork* wp = &_jdt;
    
    wp->prefix = (const char*)evtGetValue(event, *event->args);
    wp->count = johoya_data_make(wp->prefix, 0);
    wp->info = _mapAlloc(wp->count * sizeof(InformantInfo) + (sizeof(InformantInfo) * 4));
    memset(wp->info, 0, wp->count * sizeof(InformantInfo) + (sizeof(InformantInfo) * 4));
    wp->infoEnd = &wp->info[wp->count];
    johoya_data_make(wp->prefix, 1);
    return 2;
}

USERFUNC_DEF(johoya_data_free) {
    InformantWork* wp = &_jdt;
    
    if (wp->info == NULL) {
        return 2;
    }
    _mapFree(wp->info);
    wp->info = NULL;
    wp->count = 0;
    wp->prefix = NULL;
    return 2;
}

s32 johoya_data_make(const char* prefix, s32 type) {
    InformantWork* wp = &_jdt;
    char label[64];
    char tag[64];
    s32 mbbpos;
    s32 maxLabel;
    s32 storyId;
    s32 tagNum;
    BOOL tagdone;
    s32 infoId;
    s32 initEndPos;
    s16 tagEndPos;
    const char* msg;
    const char* tagdata;
    s32 count;    
    s32 labelId;
    
    maxLabel = evtGetValue(0, -170000000);

    count = 0;
    storyId = 0;
    infoId = 0;
    while (1) {
        sprintf(label, "%s_%04d", prefix, storyId);
        msg = msgSearch(label);
        if (msg[0] != '<') {
            break;
        }
        tagdata = msg + 2;
        if (msg[1] != '!') { //we need to first parse a tag for the story name
            break;
        }
        

        tagNum = 0;
        mbbpos = 0;
        tagdone = FALSE;
        while (!tagdone) {
            if (_ismbblead(*tagdata)) { //we need to read a multibyte sequence
                if (tagNum == 0) { //write to the array
                    tag[mbbpos++] = tagdata[0];
                    tag[mbbpos++] = tagdata[1];
                    tagdata += 2;
                }
                else { //just increment to new character
                    mbbpos += 2;
                    tagdata += 2;
                }
            }
            else {
                switch(tagdata[0]) {
                    case '>': //done reading the tag
                        tagdone = TRUE;
                        //fallthrough

                    case ',': //found new tag data
                        tagdata++;
                        if (tagNum == 0) {
                            tag[mbbpos] = '\0'; //terminate string
                            initEndPos = (s32)tagdata;
                        }
                        else {
                            tagEndPos = (s16)mbbpos;
                        }
                        mbbpos = 0;
                        tagNum++;
                        break;

                    default: //continue reading the tag
                        if (tagNum == 0) {
                            tag[mbbpos++] = *tagdata++;
                        }
                        else {
                            mbbpos++;
                            tagdata++;
                        }
                }
            }
        }
        
        if (!strcmp(tag, "enddata")) {
            break;
        }

        if (strcmp(tag, "")) {
            labelId = search_evt_no(tag);
            if (labelId != -1 && labelId <= maxLabel) {
                if (type & 1) {
                    wp->info[infoId].labelId = (s16)labelId;
                    wp->info[infoId].initEndPos = initEndPos;
                    wp->info[infoId].tagEndPos = tagEndPos;
                    wp->info[infoId].unkA = 5;
                    wp->info[infoId].storyId = (s16)storyId;
                }
                infoId++;
                count++;
            }
        }
        storyId++;
    }
    return count;
}

void johoya_init(void) {
    InformantUnknown* unk = &_jdt.unk14;
    
    memset(&unk->unk0, 0, 0xD);
    memset(&unk->unkD, 0, 0xD);
    memset(&unk->unk1A, 0, 0xD);
}





s32 search_evt_no(const char* label) {
    s32 labelId;

    for (labelId = 0; labelId < (s32)(sizeof(evtNoLabel) / sizeof(char*)); labelId++) {
        if (!strcmp(label, evtNoLabel[labelId])) {
            return labelId;
        }
    }
    return -1;
}
