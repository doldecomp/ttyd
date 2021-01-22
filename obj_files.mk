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
    $(BUILD_DIR)/asm/evt_eff.o                      \
    $(BUILD_DIR)/asm/evt_paper.o                    \
    $(BUILD_DIR)/asm/casedrv.o                      \
    $(BUILD_DIR)/asm/mariost.o                      \
    $(BUILD_DIR)/asm/evt_case.o                     \
    $(BUILD_DIR)/asm/evt_img.o                      \
    $(BUILD_DIR)/asm/imgdrv.o                       \
    $(BUILD_DIR)/asm/offscreendrv.o                 \
    $(BUILD_DIR)/asm/evt_offscreen.o                \
    $(BUILD_DIR)/asm/seq_battle.o                   \
    $(BUILD_DIR)/asm/evt_hit.o                      \
    $(BUILD_DIR)/asm/fontmgr.o                      \
    $(BUILD_DIR)/asm/arc.o                          \
    $(BUILD_DIR)/asm/arcdiv.o                       \
    $(BUILD_DIR)/asm/seq_gameover.o                 \
    $(BUILD_DIR)/asm/evt_bero.o                     \
    $(BUILD_DIR)/asm/windowdrv.o                    \
    $(BUILD_DIR)/asm/msgdrv.o                       \
    $(BUILD_DIR)/asm/parse.o                        \
    $(BUILD_DIR)/asm/database.o                     \
    $(BUILD_DIR)/asm/swdrv.o                        \
    $(BUILD_DIR)/asm/seq_logo.o                     \
    $(BUILD_DIR)/asm/mot_walk.o                     \
    $(BUILD_DIR)/asm/mario_hit.o                    \
    $(BUILD_DIR)/asm/mario_motion.o                 \
    $(BUILD_DIR)/asm/mario_sbr.o                    \
    $(BUILD_DIR)/asm/mot_hammer.o                   \
    $(BUILD_DIR)/asm/mot_jabara.o                   \
    $(BUILD_DIR)/asm/mot_jump.o                     \
    $(BUILD_DIR)/asm/mot_plane.o                    \
    $(BUILD_DIR)/asm/mot_roll.o                     \
    $(BUILD_DIR)/asm/mot_ship.o                     \
    $(BUILD_DIR)/asm/mot_slit.o                     \
    $(BUILD_DIR)/asm/mot_stay.o                     \
    $(BUILD_DIR)/asm/evt_cam.o                      \
    $(BUILD_DIR)/asm/evt_item.o                     \
    $(BUILD_DIR)/asm/itemdrv.o                      \
    $(BUILD_DIR)/asm/cardmgr.o                      \
    $(BUILD_DIR)/asm/party_yoshi.o                  \
    $(BUILD_DIR)/asm/party.o                        \
    $(BUILD_DIR)/asm/party_bomhei.o                 \
    $(BUILD_DIR)/asm/party_hit.o                    \
    $(BUILD_DIR)/asm/party_kuribo.o                 \
    $(BUILD_DIR)/asm/party_move.o                   \
    $(BUILD_DIR)/asm/party_nokonoko.o               \
    $(BUILD_DIR)/asm/evt_msg.o                      \
    $(BUILD_DIR)/asm/mario_pouch.o                  \
    $(BUILD_DIR)/asm/extdrv.o                       \
    $(BUILD_DIR)/asm/evt_ext.o                      \
    $(BUILD_DIR)/asm/pmario_sound.o                 \
    $(BUILD_DIR)/asm/sound.o                        \
    $(BUILD_DIR)/asm/evt_mario.o                    \
    $(BUILD_DIR)/asm/evt_door.o                     \
    $(BUILD_DIR)/asm/evt_party.o                    \
    $(BUILD_DIR)/asm/event.o                        \
    $(BUILD_DIR)/asm/evt_shop.o                     \
    $(BUILD_DIR)/asm/evt_pouch.o                    \
    $(BUILD_DIR)/asm/evt_kinopio.o                  \
    $(BUILD_DIR)/asm/npc_event.o                    \
    $(BUILD_DIR)/asm/cam_shift.o                    \
    $(BUILD_DIR)/asm/seq_load.o                     \
    $(BUILD_DIR)/asm/evt_bg.o                       \
    $(BUILD_DIR)/asm/battle.o                       \
    $(BUILD_DIR)/asm/battle_ac.o                    \
    $(BUILD_DIR)/asm/battle_damage.o                \
    $(BUILD_DIR)/asm/battle_detect.o                \
    $(BUILD_DIR)/asm/battle_disp.o                  \
    $(BUILD_DIR)/asm/battle_event_cmd.o             \
    $(BUILD_DIR)/asm/battle_event_default.o         \
    $(BUILD_DIR)/asm/battle_event_subset.o          \
    $(BUILD_DIR)/asm/battle_information.o           \
    $(BUILD_DIR)/asm/battle_mario.o                 \
    $(BUILD_DIR)/asm/battle_menu_disp.o             \
    $(BUILD_DIR)/asm/battle_pad.o                   \
    $(BUILD_DIR)/asm/battle_seq.o                   \
    $(BUILD_DIR)/asm/battle_seq_command.o           \
    $(BUILD_DIR)/asm/battle_sub.o                   \
    $(BUILD_DIR)/asm/battle_unit.o                  \
    $(BUILD_DIR)/asm/battle_unit_event.o            \
    $(BUILD_DIR)/asm/ac_stick_keep_left.o           \
    $(BUILD_DIR)/asm/ac_timing_a.o                  \
    $(BUILD_DIR)/asm/evt_damage.o                   \
    $(BUILD_DIR)/asm/battle_camera.o                \
    $(BUILD_DIR)/asm/battle_item_data.o             \
    $(BUILD_DIR)/asm/battle_monosiri.o              \
    $(BUILD_DIR)/asm/mario_balloon.o                \
    $(BUILD_DIR)/asm/evt_nannpc.o                   \
    $(BUILD_DIR)/asm/eff_fukidashi.o                \
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
