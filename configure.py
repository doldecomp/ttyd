#!/usr/bin/env python3

###
# Generates build files for the project.
# This file also includes the project configuration,
# such as compiler flags and the object matching status.
#
# Usage:
#   python3 configure.py
#   ninja
#
# Append --help to see available options.
###

import argparse
import sys
from pathlib import Path
from typing import Any, Dict, List

from tools.project import (
    Object,
    ProgressCategory,
    ProjectConfig,
    calculate_progress,
    generate_build,
    is_windows,
)

# Game versions
DEFAULT_VERSION = 0
VERSIONS = [
    "G8MJ01",  # 0
]

parser = argparse.ArgumentParser()
parser.add_argument(
    "mode",
    choices=["configure", "progress"],
    default="configure",
    help="script mode (default: configure)",
    nargs="?",
)
parser.add_argument(
    "-v",
    "--version",
    choices=VERSIONS,
    type=str.upper,
    default=VERSIONS[DEFAULT_VERSION],
    help="version to build",
)
parser.add_argument(
    "--build-dir",
    metavar="DIR",
    type=Path,
    default=Path("build"),
    help="base build directory (default: build)",
)
parser.add_argument(
    "--binutils",
    metavar="BINARY",
    type=Path,
    help="path to binutils (optional)",
)
parser.add_argument(
    "--compilers",
    metavar="DIR",
    type=Path,
    help="path to compilers (optional)",
)
parser.add_argument(
    "--map",
    action="store_true",
    help="generate map file(s)",
)
parser.add_argument(
    "--debug",
    action="store_true",
    help="build with debug info (non-matching)",
)
if not is_windows():
    parser.add_argument(
        "--wrapper",
        metavar="BINARY",
        type=Path,
        help="path to wibo or wine (optional)",
    )
parser.add_argument(
    "--dtk",
    metavar="BINARY | DIR",
    type=Path,
    help="path to decomp-toolkit binary or source (optional)",
)
parser.add_argument(
    "--objdiff",
    metavar="BINARY | DIR",
    type=Path,
    help="path to objdiff-cli binary or source (optional)",
)
parser.add_argument(
    "--sjiswrap",
    metavar="EXE",
    type=Path,
    help="path to sjiswrap.exe (optional)",
)
parser.add_argument(
    "--verbose",
    action="store_true",
    help="print verbose output",
)
parser.add_argument(
    "--non-matching",
    dest="non_matching",
    action="store_true",
    help="builds equivalent (but non-matching) or modded objects",
)
parser.add_argument(
    "--no-progress",
    dest="progress",
    action="store_false",
    help="disable progress calculation",
)
args = parser.parse_args()

config = ProjectConfig()
config.version = str(args.version)
version_num = VERSIONS.index(config.version)

# Apply arguments
config.build_dir = args.build_dir
config.dtk_path = args.dtk
config.objdiff_path = args.objdiff
config.binutils_path = args.binutils
config.compilers_path = args.compilers
config.generate_map = args.map
config.non_matching = args.non_matching
config.sjiswrap_path = args.sjiswrap
config.progress = args.progress
if not is_windows():
    config.wrapper = args.wrapper
# Don't build asm unless we're --non-matching
if not config.non_matching:
    config.asm_dir = None

# Tool versions
config.binutils_tag = "2.42-1"
config.compilers_tag = "20240706"
config.dtk_tag = "v1.4.0"
config.objdiff_tag = "v2.7.1"
config.sjiswrap_tag = "v1.2.0"
config.wibo_tag = "0.6.11"

# Project
config.config_path = Path("config") / config.version / "config.yml"
config.check_sha_path = Path("config") / config.version / "build.sha1"
config.asflags = [
    "-mgekko",
    "--strip-local-absolute",
    "-I include",
    f"-I build/{config.version}/include",
    f"--defsym BUILD_VERSION={version_num}",
    f"--defsym VERSION_{config.version}",
]
config.ldflags = [
    "-fp hardware",
    "-nodefaults",
]
if args.debug:
    config.ldflags.append("-g")  # Or -gdwarf-2 for Wii linkers
if args.map:
    config.ldflags.append("-mapunused")
    # config.ldflags.append("-listclosure") # For Wii linkers

# Use for any additional files that should cause a re-configure when modified
config.reconfig_deps = []

# Optional numeric ID for decomp.me preset
# Can be overridden in libraries or objects
config.scratch_preset_id = None

# Base flags, common to most GC/Wii games.
# Generally leave untouched, with overrides added below.
cflags_base = [
    # define the platform
    "-nodefaults",
    "-proc gekko",
    "-align powerpc",
    "-enum int",
    # for multibyte
    "-multibyte",
    "-char unsigned",
    # platform specific
    "-fp hardware",
    "-Cpp_exceptions off",
    '-pragma "cats off"',
    # default compiler flags
    # "-W all",
    "-O4,p",
    "-inline auto",
    '-pragma "warn_notinlined off"',
    '-pragma "warn_padding off"',
    # helpful linking stuff
    "-maxerrors 1",
    "-nosyspath",
    # includes and defines
    "-i include",
    "-i libs/dolsdk2004/include",
    "-i libs/dolsdk2004/include/libc",
    "-i libs/musyx/include",
    f"-i build/{config.version}/include",
    f"-DBUILD_VERSION={version_num}",
    f"-DVERSION_{config.version}",
]

# Debug flags
if args.debug:
    # Or -sym dwarf-2 for Wii compilers
    cflags_base.extend(["-sym on", "-DDEBUG=1"])
else:
    cflags_base.append("-DNDEBUG=1")

# Metrowerks library flags
cflags_runtime = [
    *cflags_base,
    "-use_lmw_stmw on",
    "-str reuse,pool,readonly",
    "-gccinc",
    "-common off",
    "-inline auto",
]

# DOL flags
cflags_static = [
    *cflags_base,
    "-once",
    "-fp_contract on",
    "-inline auto,deferred",
    "-use_lmw_stmw on",
    "-rostr",
    "-sdata 48",
    "-sdata2 6",
    "-DMUSY_VERSION_MAJOR=2",
    "-DMUSY_VERSION_MINOR=0",
    "-DMUSY_VERSION_PATCH=3",
]

# REL flags
cflags_rel = [
    *cflags_base,
    "-sdata 0",
    "-sdata2 0",
]

config.linker_version = "GC/2.6"


# Helper function for Dolphin libraries
def DolphinLib(lib_name: str, objects: List[Object]) -> Dict[str, Any]:
    return {
        "lib": lib_name,
        "mw_version": "GC/2.6",
        "cflags": cflags_base,
        "progress_category": "sdk",
        "objects": objects,
    }


# Helper function for REL script objects
def Rel(lib_name: str, objects: List[Object]) -> Dict[str, Any]:
    return {
        "lib": lib_name,
        "mw_version": "GC/2.6",
        "cflags": cflags_rel,
        "progress_category": "game",
        "objects": objects,
    }


Matching = True  # Object matches and should be linked
NonMatching = False  # Object does not match and should not be linked
Equivalent = (
    config.non_matching
)  # Object should be linked when configured with --non-matching


# Object is only matching for specific versions
def MatchingFor(*versions):
    return config.version in versions


config.warn_missing_config = False
config.warn_missing_source = False
config.libs = [
    {
        "lib": "battle",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "battle/battle.c"),
            Object(NonMatching, "battle/battle_evt_cmd.c"),
            Object(NonMatching, "battle/battle_ac.c"),
            Object(NonMatching, "battle/battle_damage.c"),
            Object(NonMatching, "battle/battle_detect.c"),
            Object(NonMatching, "battle/battle_disp.c"),
            Object(NonMatching, "battle/battle_event_cmd.c"),
            Object(NonMatching, "battle/battle_event_default.c"),
            Object(NonMatching, "battle/battle_event_subset.c"),
            Object(NonMatching, "battle/battle_information.c"),
            Object(NonMatching, "battle/battle_mario.c"),
            Object(NonMatching, "battle/battle_menu_disp.c"),
            Object(NonMatching, "battle/battle_party.c"),
            Object(NonMatching, "battle/battle_pad.c"),
            Object(NonMatching, "battle/battle_seq.c"),
            Object(NonMatching, "battle/battle_seq_command.c"),
            Object(NonMatching, "battle/battle_sub.c"),
            Object(NonMatching, "battle/battle_unit.c"),
            Object(NonMatching, "battle/battle_unit_event.c"),
            Object(NonMatching, "battle/battle_camera.c"),
            Object(NonMatching, "battle/battle_item_data.c"),
            Object(NonMatching, "battle/battle_monosiri.c"),
            Object(NonMatching, "battle/battle_stage.c"),
            Object(NonMatching, "battle/battle_database_common.c"),
            Object(NonMatching, "battle/battle_attack_audience.c"),
            Object(NonMatching, "battle/battle_stage_object.c"),
            Object(NonMatching, "battle/battle_weapon_power.c"),
            Object(NonMatching, "battle/battle_actrecord.c"),
            Object(NonMatching, "battle/battle_audience_kinopio.c"),
            Object(NonMatching, "battle/battle_acrobat.c"),
            Object(NonMatching, "battle/battle_status_effect.c"),
            Object(NonMatching, "battle/battle_audience.c"),
            Object(NonMatching, "battle/battle_icon.c"),
            Object(NonMatching, "battle/battle_message.c"),
            Object(NonMatching, "battle/battle_enemy_item.c"),
            Object(NonMatching, "battle/battle_break_slot.c"),
            Object(NonMatching, "battle/battle_seq_end.c"),
            Object(NonMatching, "battle/battle_ac_help.c"),
            Object(NonMatching, "battle/battle_audience_kind_data.c"),
            Object(NonMatching, "battle/battle_status_icon.c"),
        ],
    },
    {
        "lib": "battle_ac",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "battle/ac/ac_table.c"),
            Object(NonMatching, "battle/ac/ac_stick_keep_left.c"),
            Object(NonMatching, "battle/ac/ac_timing_a.c"),
            Object(NonMatching, "battle/ac/ac_repeatedly.c"),
            Object(NonMatching, "battle/ac/ac_shot.c"),
            Object(NonMatching, "battle/ac/ac_lst_rc_keep.c"),
            Object(NonMatching, "battle/ac/ac_repeatedly_lv.c"),
            Object(NonMatching, "battle/ac/ac_stick_rotate.c"),
            Object(NonMatching, "battle/ac/ac_button_down.c"),
            Object(NonMatching, "battle/ac/ac_timing_wide.c"),
            Object(NonMatching, "battle/ac/ac_pendulum_crane_timing.c"),
            Object(NonMatching, "battle/ac/ac_air_gauge.c"),
            Object(NonMatching, "battle/ac/ac_crane_timing.c"),
            Object(NonMatching, "battle/ac/ac_power_gauge.c"),
            Object(NonMatching, "battle/ac/ac_power_gauge_lv.c"),
            Object(NonMatching, "battle/ac/ac_signal_timing.c"),
            Object(NonMatching, "battle/ac/ac_gauge_timing.c"),
            Object(NonMatching, "battle/ac/ac_shot_target.c"),
            Object(NonMatching, "battle/ac/ac_gauge_timing2.c"),
            Object(NonMatching, "battle/ac/ac_power_gauge_lv2.c"),
            Object(NonMatching, "battle/ac/ac_monosiri_target.c"),
        ],
    },
    {
        "lib": "battle_sac",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "battle/sac/sac_bakugame.c"),
            Object(NonMatching, "battle/sac/sac_scissor.c"),
            Object(NonMatching, "battle/sac/sac_zubastar.c"),
            Object(NonMatching, "battle/sac/sac_genki.c"),
            Object(NonMatching, "battle/sac/sac_common.c"),
            Object(NonMatching, "battle/sac/sac_deka.c"),
            Object(NonMatching, "battle/sac/sac_muki.c"),
            Object(NonMatching, "battle/sac/sac_suki.c"),
        ],
    },
    {
        "lib": "data",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "data/item_data.c"),
            Object(NonMatching, "data/mail_data.c"),
            Object(NonMatching, "data/mapdata.c"),
            Object(NonMatching, "data/npc_data.c"),
        ],
    },
    {
        "lib": "driver",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "driver/bgdrv.c"),
            Object(NonMatching, "driver/camdrv.c"),
            Object(NonMatching, "driver/dispdrv.c"),
            Object(NonMatching, "driver/fadedrv.c"),
            Object(NonMatching, "driver/hitdrv.c"),
            Object(NonMatching, "driver/icondrv.c"),
            Object(NonMatching, "driver/lightdrv.c"),
            Object(NonMatching, "driver/mapdrv.c"),
            Object(NonMatching, "driver/shadowdrv.c"),
            Object(NonMatching, "driver/seqdrv.c"),
            Object(NonMatching, "driver/animdrv.c"),
            Object(NonMatching, "driver/npcdrv.c"),
            Object(NonMatching, "driver/effdrv.c"),
            Object(NonMatching, "driver/mobjdrv.c"),
            Object(NonMatching, "driver/casedrv.c"),
            Object(NonMatching, "driver/imgdrv.c"),
            Object(NonMatching, "driver/offscreendrv.c"),
            Object(NonMatching, "driver/arcdrv.c"),
            Object(NonMatching, "driver/windowdrv.c"),
            Object(NonMatching, "driver/msgdrv.c"),
            Object(NonMatching, "driver/swdrv.c"),
            Object(NonMatching, "driver/itemdrv.c"),
            Object(NonMatching, "driver/extdrv.c"),
            Object(NonMatching, "driver/envdrv.c"),
        ],
    },
    {
        "lib": "effect",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "effect/eff_fukidashi.c"),
            Object(NonMatching, "effect/eff_kemuri.c"),
            Object(NonMatching, "effect/eff_butterfly.c"),
            Object(NonMatching, "effect/eff_confetti.c"),
            Object(NonMatching, "effect/eff_damage_star.c"),
            Object(NonMatching, "effect/eff_hit.c"),
            Object(NonMatching, "effect/eff_mario_balloon.c"),
            Object(NonMatching, "effect/eff_small_star.c"),
            Object(NonMatching, "effect/eff_mugi.c"),
            Object(NonMatching, "effect/eff_stardust.c"),
            Object(NonMatching, "effect/eff_recovery.c"),
            Object(NonMatching, "effect/eff_miss_star.c"),
            Object(NonMatching, "effect/eff_nice.c"),
            Object(NonMatching, "effect/eff_breath_fire.c"),
            Object(NonMatching, "effect/eff_fire.c"),
            Object(NonMatching, "effect/eff_spark.c"),
            Object(NonMatching, "effect/eff_updown.c"),
            Object(NonMatching, "effect/eff_charge.c"),
            Object(NonMatching, "effect/eff_toge_flush.c"),
            Object(NonMatching, "effect/eff_ice.c"),
            Object(NonMatching, "effect/eff_torch.c"),
            Object(NonMatching, "effect/eff_bomb.c"),
            Object(NonMatching, "effect/eff_ripple.c"),
            Object(NonMatching, "effect/eff_batfukidashi.c"),
            Object(NonMatching, "effect/eff_starpoint.c"),
            Object(NonMatching, "effect/eff_puniballoon.c"),
            Object(NonMatching, "effect/eff_peach_fukidashi.c"),
            Object(NonMatching, "effect/eff_kemutest.c"),
            Object(NonMatching, "effect/eff_starstone.c"),
            Object(NonMatching, "effect/eff_itemget.c"),
            Object(NonMatching, "effect/eff_pointget.c"),
            Object(NonMatching, "effect/eff_stageclear.c"),
            Object(NonMatching, "effect/eff_fall.c"),
            Object(NonMatching, "effect/eff_levelup.c"),
            Object(NonMatching, "effect/eff_break.c"),
            Object(NonMatching, "effect/eff_mobj_broken.c"),
            Object(NonMatching, "effect/eff_mahojin.c"),
            Object(NonMatching, "effect/eff_nozle.c"),
            Object(NonMatching, "effect/eff_mizutama.c"),
            Object(NonMatching, "effect/eff_minigame.c"),
            Object(NonMatching, "effect/eff_splash.c"),
            Object(NonMatching, "effect/eff_treasure_map.c"),
            Object(NonMatching, "effect/eff_kiss.c"),
            Object(NonMatching, "effect/eff_funemizu.c"),
            Object(NonMatching, "effect/eff_mist.c"),
            Object(NonMatching, "effect/eff_teresa.c"),
            Object(NonMatching, "effect/eff_sheep.c"),
            Object(NonMatching, "effect/eff_batten.c"),
            Object(NonMatching, "effect/eff_naniga.c"),
            Object(NonMatching, "effect/eff_sandars.c"),
            Object(NonMatching, "effect/eff_rankup.c"),
            Object(NonMatching, "effect/eff_irekaeru.c"),
            Object(NonMatching, "effect/eff_scanning.c"),
            Object(NonMatching, "effect/eff_toiki.c"),
            Object(NonMatching, "effect/eff_mist2.c"),
            Object(NonMatching, "effect/eff_particle.c"),
            Object(NonMatching, "effect/eff_ibuki.c"),
            Object(NonMatching, "effect/eff_mahorn.c"),
            Object(NonMatching, "effect/eff_spirit.c"),
            Object(NonMatching, "effect/eff_indirect.c"),
            Object(NonMatching, "effect/eff_syuryou.c"),
            Object(NonMatching, "effect/eff_uranoko.c"),
            Object(NonMatching, "effect/eff_hibashira.c"),
            Object(NonMatching, "effect/eff_number.c"),
            Object(NonMatching, "effect/eff_laser.c"),
            Object(NonMatching, "effect/eff_machinegun.c"),
            Object(NonMatching, "effect/eff_las_mon.c"),
            Object(NonMatching, "effect/eff_sleep.c"),
            Object(NonMatching, "effect/eff_energy.c"),
            Object(NonMatching, "effect/eff_nokotarou.c"),
            Object(NonMatching, "effect/eff_queen.c"),
            Object(NonMatching, "effect/eff_queen2.c"),
            Object(NonMatching, "effect/eff_gonbaba_breath.c"),
            Object(NonMatching, "effect/eff_majinai.c"),
            Object(NonMatching, "effect/eff_mahorn2.c"),
            Object(NonMatching, "effect/eff_ultra_hammer.c"),
        ],
    },
    {
        "lib": "effect_n64",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "effect/n64/eff_whirlwind_n64.c"),
            Object(NonMatching, "effect/n64/eff_akari_charge_n64.c"),
            Object(NonMatching, "effect/n64/eff_akari_pose_n64.c"),
            Object(NonMatching, "effect/n64/eff_akari_sflush_n64.c"),
            Object(NonMatching, "effect/n64/eff_balloon_heiho_n64.c"),
            Object(NonMatching, "effect/n64/eff_balloon_n64.c"),
            Object(NonMatching, "effect/n64/eff_blow_n64.c"),
            Object(NonMatching, "effect/n64/eff_bomb_n64.c"),
            Object(NonMatching, "effect/n64/eff_bomhei_n64.c"),
            Object(NonMatching, "effect/n64/eff_booboo_n64.c"),
            Object(NonMatching, "effect/n64/eff_breath_fire_n64.c"),
            Object(NonMatching, "effect/n64/eff_broken_barrier_n64.c"),
            Object(NonMatching, "effect/n64/eff_bush_n64.c"),
            Object(NonMatching, "effect/n64/eff_butterfly_n64.c"),
            Object(NonMatching, "effect/n64/eff_cloud_n64.c"),
            Object(NonMatching, "effect/n64/eff_coin_n64.c"),
            Object(NonMatching, "effect/n64/eff_confetti_n64.c"),
            Object(NonMatching, "effect/n64/eff_cool_leaf_n64.c"),
            Object(NonMatching, "effect/n64/eff_crystal_n64.c"),
            Object(NonMatching, "effect/n64/eff_dogabon_attack_n64.c"),
            Object(NonMatching, "effect/n64/eff_expbom_n64.c"),
            Object(NonMatching, "effect/n64/eff_explosion_n64.c"),
            Object(NonMatching, "effect/n64/eff_fall_leaf_n64.c"),
            Object(NonMatching, "effect/n64/eff_fire_dust_n64.c"),
            Object(NonMatching, "effect/n64/eff_fire_ring_n64.c"),
            Object(NonMatching, "effect/n64/eff_fire_spark_n64.c"),
            Object(NonMatching, "effect/n64/eff_fireflower_n64.c"),
            Object(NonMatching, "effect/n64/eff_fireworks_n64.c"),
            Object(NonMatching, "effect/n64/eff_flame_n64.c"),
            Object(NonMatching, "effect/n64/eff_flower_n64.c"),
            Object(NonMatching, "effect/n64/eff_freeze_n64.c"),
            Object(NonMatching, "effect/n64/eff_gareki_n64.c"),
            Object(NonMatching, "effect/n64/eff_glass_n64.c"),
            Object(NonMatching, "effect/n64/eff_guruguru_n64.c"),
            Object(NonMatching, "effect/n64/eff_hagetaka_flush_n64.c"),
            Object(NonMatching, "effect/n64/eff_hit_n64.c"),
            Object(NonMatching, "effect/n64/eff_hokori_n64.c"),
            Object(NonMatching, "effect/n64/eff_holography_n64.c"),
            Object(NonMatching, "effect/n64/eff_horao_spell_n64.c"),
            Object(NonMatching, "effect/n64/eff_ice_n64.c"),
            Object(NonMatching, "effect/n64/eff_kameki_tornade_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri1_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri2_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri3_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri4_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri5_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri6_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri7_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri8_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri9_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri10_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri11_n64.c"),
            Object(NonMatching, "effect/n64/eff_kemuri12_n64.c"),
            Object(NonMatching, "effect/n64/eff_kumokumo_chip_n64.c"),
            Object(NonMatching, "effect/n64/eff_kumokumo_n64.c"),
            Object(NonMatching, "effect/n64/eff_lensflare_n64.c"),
            Object(NonMatching, "effect/n64/eff_magic1_n64.c"),
            Object(NonMatching, "effect/n64/eff_magic2_n64.c"),
            Object(NonMatching, "effect/n64/eff_magic3_n64.c"),
            Object(NonMatching, "effect/n64/eff_magic_horao_n64.c"),
            Object(NonMatching, "effect/n64/eff_n64.c"),
            Object(NonMatching, "effect/n64/eff_onpu_n64.c"),
            Object(NonMatching, "effect/n64/eff_opuku_jetw_n64.c"),
            Object(NonMatching, "effect/n64/eff_opuku_jetwrain_n64.c"),
            Object(NonMatching, "effect/n64/eff_opuku_wcurtain_n64.c"),
            Object(NonMatching, "effect/n64/eff_opuku_wgun_n64.c"),
            Object(NonMatching, "effect/n64/eff_opuku_wprotect_n64.c"),
            Object(NonMatching, "effect/n64/eff_packn_bfire_n64.c"),
            Object(NonMatching, "effect/n64/eff_peach_dust_n64.c"),
            Object(NonMatching, "effect/n64/eff_pikkyolo_n64.c"),
            Object(NonMatching, "effect/n64/eff_pokopi_pcharge_n64.c"),
            Object(NonMatching, "effect/n64/eff_pokopi_pipo_n64.c"),
            Object(NonMatching, "effect/n64/eff_pokopi_thunder_n64.c"),
            Object(NonMatching, "effect/n64/eff_pturn_n64.c"),
            Object(NonMatching, "effect/n64/eff_radiation_n64.c"),
            Object(NonMatching, "effect/n64/eff_rappa_n64.c"),
            Object(NonMatching, "effect/n64/eff_recover_heart_n64.c"),
            Object(NonMatching, "effect/n64/eff_release_n64.c"),
            Object(NonMatching, "effect/n64/eff_ripple_n64.c"),
            Object(NonMatching, "effect/n64/eff_rothammer_fail_n64.c"),
            Object(NonMatching, "effect/n64/eff_rothammer_success_n64.c"),
            Object(NonMatching, "effect/n64/eff_rubble_n64.c"),
            Object(NonMatching, "effect/n64/eff_shock_n64.c"),
            Object(NonMatching, "effect/n64/eff_small_star_n64.c"),
            Object(NonMatching, "effect/n64/eff_snow_n64.c"),
            Object(NonMatching, "effect/n64/eff_snowfall_n64.c"),
            Object(NonMatching, "effect/n64/eff_snowman_n64.c"),
            Object(NonMatching, "effect/n64/eff_sstar_n64.c"),
            Object(NonMatching, "effect/n64/eff_stamp_n64.c"),
            Object(NonMatching, "effect/n64/eff_star_power_n64.c"),
            Object(NonMatching, "effect/n64/eff_stardust2_n64.c"),
            Object(NonMatching, "effect/n64/eff_stardust_n64.c"),
            Object(NonMatching, "effect/n64/eff_stone_smoke_n64.c"),
            Object(NonMatching, "effect/n64/eff_sunlight_n64.c"),
            Object(NonMatching, "effect/n64/eff_sweat_n64.c"),
            Object(NonMatching, "effect/n64/eff_thruhammer_n64.c"),
            Object(NonMatching, "effect/n64/eff_thunder_n64.c"),
            Object(NonMatching, "effect/n64/eff_thunderflare_n64.c"),
            Object(NonMatching, "effect/n64/eff_timestamp_n64.c"),
            Object(NonMatching, "effect/n64/eff_vapor_n64.c"),
            Object(NonMatching, "effect/n64/eff_wangflush_n64.c"),
            Object(NonMatching, "effect/n64/eff_water_damage_n64.c"),
            Object(NonMatching, "effect/n64/eff_snow_dust_n64.c"),
        ],
    },
    {
        "lib": "event",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "event/evt_map.c"),
            Object(NonMatching, "event/evt_npc.c"),
            Object(NonMatching, "event/evt_sub.c"),
            Object(NonMatching, "event/evt_mobj.c"),
            Object(NonMatching, "event/evt_eff.c"),
            Object(NonMatching, "event/evt_paper.c"),
            Object(NonMatching, "event/evt_case.c"),
            Object(NonMatching, "event/evt_img.c"),
            Object(NonMatching, "event/evt_offscreen.c"),
            Object(NonMatching, "event/evt_hit.c"),
            Object(NonMatching, "event/evt_bero.c"),
            Object(NonMatching, "event/evt_cam.c"),
            Object(NonMatching, "event/evt_item.c"),
            Object(NonMatching, "event/evt_msg.c"),
            Object(NonMatching, "event/evt_ext.c"),
            Object(NonMatching, "event/evt_mario.c"),
            Object(NonMatching, "event/evt_door.c"),
            Object(NonMatching, "event/evt_party.c"),
            Object(NonMatching, "event/evt_shop.c"),
            Object(NonMatching, "event/evt_pouch.c"),
            Object(NonMatching, "event/evt_kinopio.c"),
            Object(NonMatching, "event/evt_bg.c"),
            Object(NonMatching, "event/evt_damage.c"),
            Object(NonMatching, "event/evt_nannpc.c"),
            Object(NonMatching, "event/evt_fade.c"),
            Object(NonMatching, "event/evt_light.c"),
            Object(NonMatching, "event/evt_audience.c"),
            Object(NonMatching, "event/evt_batstage.c"),
            Object(NonMatching, "event/evt_seq.c"),
            Object(NonMatching, "event/evt_twoddisp.c"),
            Object(NonMatching, "event/evt_snd.c"),
            Object(NonMatching, "event/evt_win.c"),
            Object(NonMatching, "event/evt_cloud.c"),
            Object(NonMatching, "event/evt_env.c"),
            Object(NonMatching, "event/evt_telop.c"),
            Object(NonMatching, "event/evt_movefloor.c"),
            Object(NonMatching, "event/evt_badgeshop.c"),
            Object(NonMatching, "event/evt_johoya.c"),
            Object(NonMatching, "event/evt_uranaisi.c"),
            Object(NonMatching, "event/evt_window.c"),
            Object(NonMatching, "event/evt_yuugijou.c"),
            Object(NonMatching, "event/evt_urouro.c"),
            Object(NonMatching, "event/evt_lottery.c"),
            Object(NonMatching, "event/evt_lecture.c"),
            Object(NonMatching, "event/evt_memcard.c"),
        ],
    },
    {
        "lib": "manager",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "manager/evtmgr_cmd.c"),
            Object(NonMatching, "manager/evtmgr.c"),
            Object(NonMatching, "manager/fontmgr.c"),
            Object(NonMatching, "manager/cardmgr.c"),
            Object(NonMatching, "manager/dvdmgr.c"),
            Object(NonMatching, "manager/arammgr.c"),
            Object(NonMatching, "manager/filemgr.c"),
            Object(NonMatching, "manager/winmgr.c"),
        ],
    },
    {
        "lib": "mario",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "mario/mario.c"),
            Object(NonMatching, "mario/mariost.c"),
            Object(NonMatching, "mario/mario_hit.c"),
            Object(NonMatching, "mario/mario_motion.c"),
            Object(NonMatching, "mario/mario_sbr.c"),
            Object(NonMatching, "mario/mario_pouch.c"),
            Object(NonMatching, "mario/mario_balloon.c"),
            Object(NonMatching, "mario/mario_kemuri.c"),
            Object(NonMatching, "mario/mario_party.c"),
            Object(NonMatching, "mario/mario_cam.c"),
        ],
    },
    {
        "lib": "motion",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "motion/mot_walk.c"),
            Object(NonMatching, "motion/mot_hammer.c"),
            Object(NonMatching, "motion/mot_jabara.c"),
            Object(NonMatching, "motion/mot_jump.c"),
            Object(NonMatching, "motion/mot_plane.c"),
            Object(NonMatching, "motion/mot_roll.c"),
            Object(NonMatching, "motion/mot_ship.c"),
            Object(NonMatching, "motion/mot_slit.c"),
            Object(NonMatching, "motion/mot_stay.c"),
            Object(NonMatching, "motion/mot_damage.c"),
            Object(NonMatching, "motion/mot_yoshi.c"),
            Object(NonMatching, "motion/mot_dokan.c"),
            Object(NonMatching, "motion/mot_hip.c"),
        ],
    },
    {
        "lib": "party",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "party/party_yoshi.c"),
            Object(NonMatching, "party/party_bomhei.c"),
            Object(NonMatching, "party/party_data.c"),
            Object(NonMatching, "party/party_hit.c"),
            Object(NonMatching, "party/party_kuribo.c"),
            Object(NonMatching, "party/party_move.c"),
            Object(NonMatching, "party/party_nokonoko.c"),
            Object(NonMatching, "party/party_motion.c"),
            Object(NonMatching, "party/party_vivian.c"),
            Object(NonMatching, "party/party_cloud.c"),
            Object(NonMatching, "party/party_chuchu.c"),
        ],
    },
    {
        "lib": "sequence",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "sequence/seq_game.c"),
            Object(NonMatching, "sequence/seq_mapchange.c"),
            Object(NonMatching, "sequence/seq_title.c"),
            Object(NonMatching, "sequence/seq_battle.c"),
            Object(NonMatching, "sequence/seq_gameover.c"),
            Object(NonMatching, "sequence/seq_logo.c"),
            Object(NonMatching, "sequence/seq_load.c"),
            Object(NonMatching, "sequence/seq_demo.c"),
            Object(NonMatching, "sequence/seq_e3.c"),
            Object(NonMatching, "sequence/seqdef.c"),
        ],
    },
    {
        "lib": "unit",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "unit/unit_mario.c"),
            Object(NonMatching, "unit/unit_bomzou.c"),
            Object(NonMatching, "unit/unit_koura.c"),
            Object(NonMatching, "unit/unit_object_tree.c"),
            Object(NonMatching, "unit/unit_object_switch.c"),
            Object(NonMatching, "unit/unit_system.c"),
        ],
    },
    {
        "lib": "unit_party",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "unit/party/unit_party_clauda.c"),
            Object(NonMatching, "unit/party/unit_party_yoshi.c"),
            Object(NonMatching, "unit/party/unit_party_chuchurina.c"),
            Object(NonMatching, "unit/party/unit_party_sanders.c"),
            Object(NonMatching, "unit/party/unit_party_vivian.c"),
            Object(NonMatching, "unit/party/unit_party_nokotarou.c"),
            Object(NonMatching, "unit/party/unit_party_christine.c"),
        ],
    },
    {
        "lib": "window",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "window/win_root.c"),
            Object(NonMatching, "window/win_party.c"),
            Object(NonMatching, "window/win_badge.c"),
            Object(NonMatching, "window/win_item.c"),
            Object(NonMatching, "window/win_mario.c"),
            Object(NonMatching, "window/win_log.c"),
            Object(NonMatching, "window/win_main.c"),
        ],
    },
    {
        "lib": "sdk",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "sdk/arc.c"),
            Object(NonMatching, "sdk/DEMOInit.c"),
            Object(NonMatching, "sdk/DEMOPad.c"),
            Object(NonMatching, "sdk/texPalette.c"),
        ],
    },
    {
        "lib": "MarioSt",
        "mw_version": config.linker_version,
        "cflags": cflags_static,
        "progress_category": "game",
        "objects": [
            Object(NonMatching, "cam_road.c"),
            Object(NonMatching, "cam_shift.c"),
            Object(NonMatching, "countdown.c"),
            Object(NonMatching, "database.c"),
            Object(NonMatching, "error_handler.c"),
            Object(NonMatching, "event.c"),
            Object(NonMatching, "gxsub.c"),
            Object(NonMatching, "himo.c"),
            Object(NonMatching, "koopa.c"),
            Object(NonMatching, "koopa_hit.c"),
            Object(NonMatching, "koopa_motion.c"),
            Object(NonMatching, "kpa_act.c"),
            Object(NonMatching, "main.c"),
            Object(NonMatching, "memory.c"),
            Object(NonMatching, "nameent.c"),
            Object(NonMatching, "npc_event.c"),
            Object(NonMatching, "parse.c"),
            Object(NonMatching, "party.c"),
            Object(NonMatching, "peach.c"),
            Object(NonMatching, "pmario_sound.c"),
            Object(NonMatching, "romfont.c"),
            Object(NonMatching, "sound.c"),
            Object(NonMatching, "statuswindow.c"),
            Object(NonMatching, "system.c"),
            Object(NonMatching, "texPalette.c"),
            Object(NonMatching, "unk_0x8025de70.c"),
        ],
    },
    {
        "lib": "MusyX",
        "mw_version": "GC/1.3.2",
        "cflags": [
            "-proc gekko",
            "-nodefaults",
            "-nosyspath",
            "-i include",
            "-i libs/dolsdk2004/include",
            "-i libs/dolsdk2004/include/libc",
            "-i libs/musyx/include",
            "-inline auto,depth=4",
            "-O4,p",
            "-fp hard",
            "-enum int",
            "-sym on",
            "-Cpp_exceptions off",
            "-str reuse,pool,readonly",
            "-fp_contract off",
            "-DMUSY_TARGET=MUSY_TARGET_DOLPHIN",
            "-DMUSY_VERSION_MAJOR=2",
            "-DMUSY_VERSION_MINOR=0",
            "-DMUSY_VERSION_PATCH=3",
        ],
        "progress_category": "sdk",
        "src_dir": "libs/musyx/src/",
        "objects": [
            Object(NonMatching, "musyx/runtime/seq.c"),
            Object(NonMatching, "musyx/runtime/synth.c"),
            Object(NonMatching, "musyx/runtime/seq_api.c"),
            Object(NonMatching, "musyx/runtime/snd_synthapi.c"),
            Object(NonMatching, "musyx/runtime/stream.c"),
            Object(NonMatching, "musyx/runtime/synthdata.c"),
            Object(NonMatching, "musyx/runtime/synthmacros.c"),
            Object(NonMatching, "musyx/runtime/synthvoice.c"),
            Object(NonMatching, "musyx/runtime/synth_ac.c"),
            Object(NonMatching, "musyx/runtime/synth_dbtab.c"),
            Object(NonMatching, "musyx/runtime/synth_adsr.c"),
            Object(NonMatching, "musyx/runtime/synth_vsamples.c"),
            Object(NonMatching, "musyx/runtime/s_data.c"),
            Object(NonMatching, "musyx/runtime/hw_dspctrl.c"),
            Object(NonMatching, "musyx/runtime/hw_volconv.c"),
            Object(NonMatching, "musyx/runtime/snd3d.c"),
            Object(NonMatching, "musyx/runtime/snd_init.c"),
            Object(NonMatching, "musyx/runtime/snd_math.c"),
            Object(NonMatching, "musyx/runtime/snd_midictrl.c"),
            Object(NonMatching, "musyx/runtime/snd_service.c"),
            Object(NonMatching, "musyx/runtime/HARDWARE.C"),
            Object(NonMatching, "musyx/runtime/dsp_import.c"),
            Object(NonMatching, "musyx/runtime/hw_aramdma.c"),
            Object(NonMatching, "musyx/runtime/hw_dolphin.c"),
            Object(NonMatching, "musyx/runtime/hw_memory.c"),
            Object(NonMatching, "musyx/runtime/CheapReverb/creverb_fx.c"),
            Object(NonMatching, "musyx/runtime/CheapReverb/creverb.c"),
            Object(NonMatching, "musyx/runtime/StdReverb/reverb_fx.c"),
            Object(NonMatching, "musyx/runtime/StdReverb/reverb.c"),
            Object(NonMatching, "musyx/runtime/Delay/delay_fx.c"),
            Object(NonMatching, "musyx/runtime/Chorus/chorus_fx.c"),
        ],
    },
]

# Optional extra categories for progress tracking
# Adjust as desired for your project
config.progress_categories = [
    ProgressCategory("game", "Game Code"),
    ProgressCategory("sdk", "SDK Code"),
]
config.progress_each_module = args.verbose

if args.mode == "configure":
    # Write build.ninja and objdiff.json
    generate_build(config)
elif args.mode == "progress":
    # Print progress and write progress.json
    calculate_progress(config)
else:
    sys.exit("Unknown mode: " + args.mode)
