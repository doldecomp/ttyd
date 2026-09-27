#include "tou2.h"
#include "dolphin/types.h"
#include "driver/swdrv.h"
#include "manager/evtmgr_cmd.h"
#include "evt/evt_cmd.h"
#include "memory.h"

typedef struct RankEntry {
    u16 flags;
    // pad 2 bytes
    s32 id;
    u8 points[2]; // TODO: see if there's a way to re-type this to s16 and keep rankingInit matching
    // pad 2 bytes
} RankEntry;

typedef enum RankFlags {
    RANK_BELOW = 1 << 0, // This fighter is below us in the rankings
    RANK_HIDDEN = 1 << 1, // This fighter is hidden from us
    RANK_PLAYER = 1 << 2, // This is the player
} RankFlags;

typedef struct RankData {
    s32 count;
    RankEntry* entries;
} RankData;

typedef struct FighterData {
    u16 flags;
    // pad 2 bytes
    const char* name;
    const char* title;
    s32 setupId;
    const char* taunt;
    const char* victory;
    s16 field_18; // priority, order, sortId?
    // pad 2 bytes
} FighterData;

// This includes a bunch of "story markers" for the various important fights
typedef enum FighterFlags {
    FIGHT_MAJOR = 1 << 0,
    FIGHT_MINOR = 1 << 1,
    FIGHT_CHAMPION = 1 << 2,
    FIGHT_PLAYER = 1 << 3,
    FIGHT_BANDITS = 1 << 8,
    FIGHT_KOOPAS = 1 << 9,
    FIGHT_GOOMBAS = 1 << 10,
    FIGHT_CLEFTS = 1 << 11,
    FIGHT_KOOPATROL = 1 << 12,
} FighterFlags;

typedef enum FighterId {
    FIGHTER_RAWK_HAWK = 0,
    FIGHTER_KOOPINATOR = 1,
    FIGHTER_CHOMPS = 2,
    FIGHTER_BROS = 3,
    FIGHTER_CRAW = 4,
    FIGHTER_MAGIKOOPA = 5,
    FIGHTER_FUZZY = 6,
    FIGHTER_SHADY_KOOPAS = 7,
    FIGHTER_BRISTLES = 8,
    FIGHTER_SPIKE_TOPS = 9,
    FIGHTER_IRON_CLEFTS = 10,
    FIGHTER_BANDITS = 11,
    FIGHTER_BOB_OMB = 12,
    FIGHTER_BALD_CLEFTS = 13,
    FIGHTER_BOGGLY = 14,
    FIGHTER_LAKITU = 15,
    FIGHTER_DULL_BONES = 16,
    FIGHTER_POKEYS = 17,
    FIGHTER_KP_KOOPAS = 18,
    FIGHTER_GOOMBAS = 19,
    FIGHTER_PLAYER = 20,
    FIGHTER_SWOOPS = 21,
    FIGHTER_SPINIA = 22,
} FighterId;

RankData rank_work;
FighterData fighterDt[23] = {
    { FIGHT_CHAMPION, "stg3_tou_sensyu_00", "stg3_tou_sensyu2_00", 22, "stg3_tou_400_02", "stg3_tou_400_03", 250 },                // Rawk Hawk
    { FIGHT_KOOPATROL | FIGHT_MAJOR, "stg3_tou_sensyu_01", "stg3_tou_sensyu2_01", 19, "stg3_tou_118_00", "stg3_tou_118_01", 200 }, // The Koopinator
    { FIGHT_MAJOR, "stg3_tou_sensyu_02", "stg3_tou_sensyu2_02", 18, "stg3_tou_118_02", "stg3_tou_118_03", 180 },                   // Chomp Country
    { FIGHT_MAJOR, "stg3_tou_sensyu_03", "stg3_tou_sensyu2_03", 17, "stg3_tou_118_04", "stg3_tou_118_05", 170 },                   // Hamma, Bamma, and Flare
    { FIGHT_MAJOR, "stg3_tou_sensyu_04", "stg3_tou_sensyu2_04", 16, "stg3_tou_118_06", "stg3_tou_118_07", 160 },                   // Craw-Daddy
    { FIGHT_MAJOR, "stg3_tou_sensyu_05", "stg3_tou_sensyu2_05", 15, "stg3_tou_118_08", "stg3_tou_118_09", 150 },                   // The Magikoopa Masters
    { FIGHT_MAJOR, "stg3_tou_sensyu_06", "stg3_tou_sensyu2_06", 14, "stg3_tou_118_10", "stg3_tou_118_11", 140 },                   // The Fuzz
    { FIGHT_MAJOR, "stg3_tou_sensyu_07", "stg3_tou_sensyu2_07", 13, "stg3_tou_118_12", "stg3_tou_118_13", 130 },                   // The Shellshockers
    { FIGHT_MAJOR, "stg3_tou_sensyu_08", "stg3_tou_sensyu2_08", 12, "stg3_tou_118_14", "stg3_tou_118_15", 120 },                   // The Poker Faces
    { FIGHT_MAJOR, "stg3_tou_sensyu_09", "stg3_tou_sensyu2_09", 11, "stg3_tou_118_16", "stg3_tou_118_17", 110 },                   // The Tiny Spinies
    { FIGHT_CLEFTS | FIGHT_MAJOR, "stg3_tou_sensyu_10", "stg3_tou_sensyu2_10", 10, "stg3_tou_118_18", "stg3_tou_118_19", 100 },    // The Armored Harriers
    { FIGHT_BANDITS | FIGHT_MINOR, "stg3_tou_sensyu_11", "stg3_tou_sensyu2_11", 9, "stg3_tou_118_20", "stg3_tou_118_21", 90 },     // The Hand-It-Overs
    { FIGHT_MINOR, "stg3_tou_sensyu_12", "stg3_tou_sensyu2_12", 8, "stg3_tou_118_22", "stg3_tou_118_23", 80 },                     // The Bob-omb Squad
    { FIGHT_MINOR, "stg3_tou_sensyu_13", "stg3_tou_sensyu2_13", 7, "stg3_tou_118_24", "stg3_tou_118_25", 70 },                     // The Punk Rocks
    { FIGHT_MINOR, "stg3_tou_sensyu_14", "stg3_tou_sensyu2_14", 6, "stg3_tou_118_26", "stg3_tou_118_27", 60 },                     // The Mind-Bogglers
    { FIGHT_MINOR, "stg3_tou_sensyu_15", "stg3_tou_sensyu2_15", 5, "stg3_tou_118_28", "stg3_tou_118_29", 50 },                     // Spike Storm
    { FIGHT_MINOR, "stg3_tou_sensyu_16", "stg3_tou_sensyu2_16", 4, "stg3_tou_118_30", "stg3_tou_118_31", 40 },                     // The Dead Bones
    { FIGHT_MINOR, "stg3_tou_sensyu_17", "stg3_tou_sensyu2_17", 3, "stg3_tou_118_32", "stg3_tou_118_33", 30 },                     // The Pokey Triplets
    { FIGHT_KOOPAS | FIGHT_MINOR, "stg3_tou_sensyu_18", "stg3_tou_sensyu2_18", 2, "stg3_tou_118_34", "stg3_tou_118_35", 20 },      // The KP Koopas
    { FIGHT_GOOMBAS | FIGHT_MINOR, "stg3_tou_sensyu_19", "stg3_tou_sensyu2_19", 1, "stg3_tou_118_36", "stg3_tou_118_36_01", 10 },  // The Goomba Bros.
    { FIGHT_PLAYER, "stg3_tou_sensyu_20", "stg3_tou_sensyu2_20", 1, NULL, NULL, 0 },                                               // The Great Gonzales
    { FIGHT_MINOR, "stg3_tou_sensyu_21", "stg3_tou_sensyu2_21", 20, "stg3_tou_118_36_02", "stg3_tou_118_36_03", 5 },               // Wings of Night
    { FIGHT_MINOR, "stg3_tou_sensyu_22", "stg3_tou_sensyu2_22", 21, "stg3_tou_118_36_04", "stg3_tou_118_36_05", 0 },               // The Destructors
};

FighterData fighterDt_re[21] = {
    { FIGHT_CHAMPION, "stg3_tou_re_315", "stg3_tou_re_338", 22, "stg3_tou_re_289", "stg3_tou_re_290", 250 },                // Rawk Hawk
    { FIGHT_KOOPATROL | FIGHT_MAJOR, "stg3_tou_re_316", "stg3_tou_re_339", 19, "stg3_tou_re_179", "stg3_tou_re_180", 200 }, // The Koopinator
    { FIGHT_MAJOR, "stg3_tou_re_317", "stg3_tou_re_340", 18, "stg3_tou_re_181", "stg3_tou_re_182", 180 },                   // Chomp Country
    { FIGHT_MAJOR, "stg3_tou_re_318", "stg3_tou_re_341", 17, "stg3_tou_re_183", "stg3_tou_re_184", 170 },                   // Hamma, Bamma, and Flare
    { FIGHT_MAJOR, "stg3_tou_re_319", "stg3_tou_re_342", 16, "stg3_tou_re_185", "stg3_tou_re_186", 160 },                   // Craw-Daddy
    { FIGHT_MAJOR, "stg3_tou_re_320", "stg3_tou_re_343", 15, "stg3_tou_re_187", "stg3_tou_re_188", 150 },                   // The Magikoopa Masters
    { FIGHT_MAJOR, "stg3_tou_re_321", "stg3_tou_re_344", 14, "stg3_tou_re_189", "stg3_tou_re_190", 140 },                   // The Fuzz
    { FIGHT_MAJOR, "stg3_tou_re_322", "stg3_tou_re_345", 13, "stg3_tou_re_191", "stg3_tou_re_192", 130 },                   // The Shellshockers
    { FIGHT_MAJOR, "stg3_tou_re_323", "stg3_tou_re_346", 12, "stg3_tou_re_193", "stg3_tou_re_194", 120 },                   // The Poker Faces
    { FIGHT_MAJOR, "stg3_tou_re_324", "stg3_tou_re_347", 11, "stg3_tou_re_195", "stg3_tou_re_196", 110 },                   // The Tiny Spinies
    { FIGHT_CLEFTS | FIGHT_MAJOR, "stg3_tou_re_325", "stg3_tou_re_348", 10, "stg3_tou_re_197", "stg3_tou_re_198", 100 },    // The Armored Harriers
    { FIGHT_BANDITS | FIGHT_MINOR, "stg3_tou_re_326", "stg3_tou_re_349", 9, "stg3_tou_re_199", "stg3_tou_re_200", 90 },     // The Hand-It-Overs
    { FIGHT_MINOR, "stg3_tou_re_327", "stg3_tou_re_350", 8, "stg3_tou_re_201", "stg3_tou_re_202", 80 },                     // The Bob-omb Squad
    { FIGHT_MINOR, "stg3_tou_re_328", "stg3_tou_re_351", 7, "stg3_tou_re_203", "stg3_tou_re_204", 70 },                     // The Punk Rocks
    { FIGHT_MINOR, "stg3_tou_re_329", "stg3_tou_re_352", 6, "stg3_tou_re_205", "stg3_tou_re_206", 60 },                     // The Mind-Bogglers
    { FIGHT_MINOR, "stg3_tou_re_330", "stg3_tou_re_353", 5, "stg3_tou_re_207", "stg3_tou_re_208", 50 },                     // Spike Storm
    { FIGHT_MINOR, "stg3_tou_re_331", "stg3_tou_re_354", 4, "stg3_tou_re_209", "stg3_tou_re_210", 40 },                     // The Dead Bones
    { FIGHT_MINOR, "stg3_tou_re_332", "stg3_tou_re_355", 3, "stg3_tou_re_211", "stg3_tou_re_212", 30 },                     // The Pokey Triplets
    { FIGHT_KOOPAS | FIGHT_MINOR, "stg3_tou_re_333", "stg3_tou_re_356", 2, "stg3_tou_re_213", "stg3_tou_re_214", 20 },      // The KP Koopas
    { FIGHT_GOOMBAS | FIGHT_MINOR, "stg3_tou_re_334", "stg3_tou_re_357", 1, "stg3_tou_re_215", "stg3_tou_re_216", 10 },     // The Goomba Bros.
    { FIGHT_PLAYER, "stg3_tou_re_335", "stg3_tou_re_358", 1, NULL, NULL, 0 },                                               // The Great Gonzales
    //{ FIGHT_MINOR, "stg3_tou_re_336", "stg3_tou_re_359", 20, "stg3_tou_re_217", "stg3_tou_re_218", 5 },                     // Wings of Night (cut)
    //{ FIGHT_MINOR, "stg3_tou_re_337", "stg3_tou_re_360", 21, "stg3_tou_re_219", "stg3_tou_re_220", 0 },                     // The Destructors (cut)
};
RankData* rank_wp = &rank_work;
const char* suuji[] = { "０", "１", "２", "３", "４", "５", "６", "７", "８", "９" };

// local prototypes
void rankingControll(void);

void rankingInit(void) {
    s32 temp;
    s32 count;
    int i;
    RankEntry* entry;

    memset(rank_wp, 0, sizeof(RankData));
    // We need to handle the excluded entries if we're doing rematches
    temp = evtGetValue(NULL, GSW(0));
    count = 21;
    if (temp < 172) {
        count = 23;
    }
    rank_wp->count = count;
    rank_wp->entries = _mapAlloc(rank_wp->count * sizeof(RankEntry));
    memset(rank_wp->entries, 0, rank_wp->count * sizeof(RankEntry));

    for (i = 0, entry = rank_wp->entries; i < rank_wp->count; i++, entry++) {
        entry->flags = 0;
        entry->id = i;
        if (swGet(entry->id + 2465)) {
            entry->flags |= RANK_BELOW;
        }
        if (swGet(2529)) {
            int j;
            for (j = 0; j < 2; j++) {
                entry->points[j] = swByteGet(2 * entry->id + 519 + j);
            }
        } else {
            *(s16*)entry->points = fighterDt[entry->id].field_18;
        }
        if (entry->id == FIGHTER_PLAYER) {
            entry->flags |= RANK_PLAYER;
        }
    }

    swSet(2529);

    // Set up the initial run-through
    if (evtGetValue(NULL, GSW(0)) < 172) {
        rank_wp->entries[FIGHTER_SWOOPS].flags |= RANK_HIDDEN;
        rank_wp->entries[FIGHTER_SPINIA].flags |= RANK_HIDDEN;

        // If we're past this point in the story, hide King K
        if (evtGetValue(NULL, GSWF(2412))) {
            rank_wp->entries[FIGHTER_KP_KOOPAS].flags |= RANK_HIDDEN;
        }

        // If we're past this story, Sir Swoop has been introduced
        if (evtGetValue(NULL, GSWF(2413))) {
            rank_wp->entries[FIGHTER_SWOOPS].flags &= ~RANK_HIDDEN;

            if (!evtGetValue(NULL, GSWF(2530))) {
                rank_wp->entries[FIGHTER_SWOOPS].flags |= RANK_BELOW;
            }
            evtSetValue(NULL, GSWF(2530), TRUE);
        }

        // If we're past this point in the story, Bandy Andy got "retired" and The Destructors were added.
        if (evtGetValue(NULL, GSWF(2421))) {
            rank_wp->entries[FIGHTER_BANDITS].flags |= RANK_HIDDEN;
            rank_wp->entries[FIGHTER_SPINIA].flags &= ~RANK_HIDDEN;

            if (!evtGetValue(NULL, GSWF(2531))) {
                rank_wp->entries[FIGHTER_SPINIA].flags |= RANK_BELOW;
            }
            evtSetValue(NULL, GSWF(2531), TRUE);
        }
    }
    rankingControll();
}

#pragma dont_inline on
static void insert(s32* arr, s32 n, s32 from, s32 to) {
    s32 i;

    if (from < to) {
        s32 tmp = arr[from];
        for (i = from; i < to; i++) {
            arr[i] = arr[i + 1];
        }
        arr[to] = tmp;
    } else {
        s32 tmp = arr[from];
        for (i = from; i > to; i--) {
            arr[i] = arr[i - 1];
        }
        arr[to] = tmp;
    }
}
#pragma dont_inline reset

// TODO: this is mostly there
void rankingControll(void) {
    s32 above[32];
    s32 below[32];
    s32 nAbove;
    s32 nBelow;
    s32 i;
    s32 j;
    s32 tmp;
    s32 idx;
    s32 idx2;
    s32 rank;
    RankEntry* entry;

    nAbove = 0;
    nBelow = 0;
    for (i = 0, entry = rank_wp->entries; i < rank_wp->count; i++, entry++) {
        if (!(entry->flags & RANK_PLAYER)) {
            if (entry->flags & RANK_BELOW) {
                below[nBelow] = i;
                nBelow++;
            } else {
                above[nAbove] = i;
                nAbove++;
            }
        }
    }

    if (nAbove > 0) {
        for (i = 0; i < nAbove - 1; i++) {
            for (j = i + 1; j < nAbove; j++) {
                if (*(s16*)rank_wp->entries[above[i]].points < *(s16*)rank_wp->entries[above[j]].points) {
                    tmp = above[i];
                    above[i] = above[j];
                    above[j] = tmp;
                }
            }
        }

        for (i = 0; i < nAbove - 1; i++) {
            for (j = i + 1; j < nAbove; j++) {
                FighterData* fj = &fighterDt[rank_wp->entries[above[j]].id];
                FighterData* fi = &fighterDt[rank_wp->entries[above[i]].id];
                if ((fj->flags & 5) && (fi->flags & 2)) {
                    tmp = above[i];
                    above[i] = above[j];
                    above[j] = tmp;
                }
            }
        }

        if (nAbove > 0) {
            for (idx = 0; idx < nAbove; idx++) {
                if (fighterDt[rank_wp->entries[above[idx]].id].flags & 4) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, 0);
            }
        }

        if (nAbove > 1) {
            for (idx = 0; idx < nAbove; idx++) {
                if (fighterDt[rank_wp->entries[above[idx]].id].flags & 0x1000) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, 1);
            }
        }

        if (nAbove > 10) {
            for (idx = 0; idx < nAbove; idx++) {
                if (fighterDt[rank_wp->entries[above[idx]].id].flags & 0x800) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, 10);
            }
        }

        if (nAbove > 18) {
            for (idx = 0; idx < nAbove; idx++) {
                if (fighterDt[rank_wp->entries[above[idx]].id].flags & 0x200) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, 18);
            }
        }

        if (nAbove > 19) {
            for (idx = 0; idx < nAbove; idx++) {
                if (fighterDt[rank_wp->entries[above[idx]].id].flags & 0x400) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, 19);
            }
        }

        if (nAbove > 16) {
            for (idx = 0; idx < nAbove; idx++) {
                if (fighterDt[rank_wp->entries[above[idx]].id].flags & 0x100) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, 14);
            }
        }

        // Check if a match is booked (2532), and move our opponent (507) to above us for the fight. 
        if (swGet(2532)) {
            for (idx = 0; idx < nAbove; idx++) {
                if (above[idx] == swByteGet(507)) {
                    break;
                }
            }
            if (idx < nAbove) {
                insert(above, nAbove, idx, nAbove - 1);
            }
        }
    }

    if (nBelow > 0) {
        for (i = 0; i < nBelow - 1; i++) {
            for (j = i + 1; j < nBelow; j++) {
                if (*(s16*)rank_wp->entries[below[i]].points < *(s16*)rank_wp->entries[below[j]].points) {
                    tmp = below[i];
                    below[i] = below[j];
                    below[j] = tmp;
                }
            }
        }

        for (i = 0; i < nBelow - 1; i++) {
            for (j = i + 1; j < nBelow; j++) {
                FighterData* fj = &fighterDt[rank_wp->entries[below[j]].id];
                FighterData* fi = &fighterDt[rank_wp->entries[below[i]].id];
                if ((fj->flags & 5) && (fi->flags & 2)) {
                    tmp = below[i];
                    below[i] = below[j];
                    below[j] = tmp;
                }
            }
        }

        if (nBelow > 0) {
            for (idx = 0; idx < nBelow; idx++) {
                if (fighterDt[rank_wp->entries[below[idx]].id].flags & 4) {
                    break;
                }
            }
            if (idx < nBelow) {
                insert(below, nBelow, idx, 0);
            }
        }
        
        if (nBelow > 0) {
            for (idx = 0; idx < nBelow; idx++) {
                if (fighterDt[rank_wp->entries[below[idx]].id].flags & 0x800) {
                    break;
                }
            }
            if (idx < nBelow) {
                for (idx2 = 0; idx2 < nBelow; idx2++) {
                    if (fighterDt[rank_wp->entries[below[idx2]].id].flags & 2) {
                        break;
                    }
                }
                if (idx2 < nBelow && idx2 > 0) {
                    insert(below, nBelow, idx, idx2 - 1);
                }
            }
        }

        // Check if a match is booked (2532), and move our opponent (507) to above us for the fight.
        if (swGet(2532)) {
            for (idx = 0; idx < nBelow; idx++) {
                if (below[idx] == swByteGet(507)) {
                    break;
                }
            }
            if (idx < nBelow) {
                insert(below, nBelow, idx, 0);
            }
        }
    }

    entry = (RankEntry*)__memAlloc(0, sizeof(RankEntry) * rank_wp->count);
    for (i = 0; i < nAbove; i++) {
        entry[i] = rank_wp->entries[above[i]];
    }
    // TODO: fixup
    entry[nAbove].flags = RANK_PLAYER;
    entry[nAbove].id = FIGHTER_PLAYER;
    *(s16*)entry[nAbove].points = 0;
    for (i = 0; i < nBelow; i++) {
        j = nAbove + i + 1;
        entry[j] = rank_wp->entries[below[i]];
    }
    memcpy(rank_wp->entries, entry, sizeof(RankEntry) * rank_wp->count);
    __memFree(0, entry);

    // Calculate our current rank and store it in 580.
    rank = 0;
    for (i = 0; i < rank_wp->count; i++) {
        if (!(rank_wp->entries[i].flags & RANK_HIDDEN)) {
            if (rank_wp->entries[i].flags & RANK_PLAYER) {
                break;
            }
            rank++;
        }
    }
    swByteSet(580, rank);
}
