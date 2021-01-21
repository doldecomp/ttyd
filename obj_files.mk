INIT_O_FILES := 						            \
	$(BUILD_DIR)/asm/init.o

EXTAB_O_FILES :=                                    \
    $(BUILD_DIR)/asm/extab.o

EXTABINDEX_O_FILES :=                               \
    $(BUILD_DIR)/asm/extabindex.o

TEXT_O_FILES :=                                     \
    $(BUILD_DIR)/asm/main.o                         \
    $(BUILD_DIR)/asm/system.o                       \
    $(BUILD_DIR)/asm/seq_game.o                     \
    $(BUILD_DIR)/asm/seq_mapchange.o                \
    $(BUILD_DIR)/asm/seq_title.o                    \
    $(BUILD_DIR)/asm/bgdrv.o                        \
    $(BUILD_DIR)/asm/cam_road.o                     \
    $(BUILD_DIR)/asm/camdrv.o                       \
    $(BUILD_DIR)/asm/dispdrv.o                      \
    $(BUILD_DIR)/asm/fadedrv.o                      \
    $(BUILD_DIR)/asm/hitdrv.o                       \
    $(BUILD_DIR)/asm/icondrv.o                      \
    $(BUILD_DIR)/asm/lightdrv.o                     \
    $(BUILD_DIR)/asm/mapdrv.o                       \
    $(BUILD_DIR)/asm/shadowdrv.o                    \
    $(BUILD_DIR)/asm/seqdrv.o                       \
    $(BUILD_DIR)/asm/DEMOInit.o                     \
    $(BUILD_DIR)/asm/DEMOPad.o                      \
    $(BUILD_DIR)/asm/memory.o                       \
    $(BUILD_DIR)/asm/evtmgr_cmd.o                   \
    $(BUILD_DIR)/asm/evtmgr.o                       \
    $(BUILD_DIR)/asm/texPalette.o                   \
    $(BUILD_DIR)/asm/evt_map.o                      \
    $(BUILD_DIR)/asm/mapdata.o                      \
    $(BUILD_DIR)/asm/animdrv.o                      \
    $(BUILD_DIR)/asm/npcdrv.o                       \
    $(BUILD_DIR)/asm/evt_npc.o                      \
    $(BUILD_DIR)/asm/evt_sub.o                      \
    $(BUILD_DIR)/asm/mario.o                        \
    $(BUILD_DIR)/asm/effdrv.o                       \
    $(BUILD_DIR)/asm/mobjdrv.o                      \
    $(BUILD_DIR)/asm/evt_mobj.o                     \
    $(BUILD_DIR)/asm/text.o

CTORS_O_FILES :=                                    \
    $(BUILD_DIR)/asm/ctors.o

DTORS_O_FILES :=                                    \
    $(BUILD_DIR)/asm/dtors.o

RODATA_O_FILES :=                                   \
    $(BUILD_DIR)/asm/rodata.o

DATA_O_FILES :=                                     \
    $(BUILD_DIR)/asm/data.o

BSS_O_FILES :=                                      \
    $(BUILD_DIR)/asm/bss.o

SDATA_O_FILES :=                                    \
    $(BUILD_DIR)/asm/sdata.o

SBSS_O_FILES :=                                     \
    $(BUILD_DIR)/asm/sbss.o

SDATA2_O_FILES :=                                   \
    $(BUILD_DIR)/asm/sdata2.o

SBSS2_O_FILES :=                                   \
    $(BUILD_DIR)/asm/sbss2.o
