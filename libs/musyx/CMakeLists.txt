cmake_minimum_required(VERSION 3.27)
project(MusyX)

set(MUSY_TARGET MUSY_TARGET_PC)

set(CMAKE_C_STANDARD 23)
add_library(musyx STATIC
        src/musyx/runtime/seq.c
        src/musyx/runtime/synth.c
        src/musyx/runtime/seq_api.c
        src/musyx/runtime/snd_synthapi.c
        src/musyx/runtime/stream.c
        src/musyx/runtime/synthdata.c
        src/musyx/runtime/synthmacros.c
        src/musyx/runtime/synthvoice.c
        src/musyx/runtime/synth_ac.c
        src/musyx/runtime/synth_adsr.c
        src/musyx/runtime/synth_vsamples.c
        src/musyx/runtime/synth_dbtab.c
        src/musyx/runtime/s_data.c
        src/musyx/runtime/hw_dspctrl.c
        src/musyx/runtime/hw_volconv.c
        src/musyx/runtime/snd3d.c
        src/musyx/runtime/snd_init.c
        src/musyx/runtime/snd_math.c
        src/musyx/runtime/snd_midictrl.c
        src/musyx/runtime/snd_service.c
        src/musyx/runtime/hardware.c
        src/musyx/runtime/hw_aramdma.c
        src/musyx/runtime/dsp_import.c
        src/musyx/runtime/hw_dolphin.c
        src/musyx/runtime/hw_pc.c
        src/musyx/runtime/hw_memory.c
        src/musyx/runtime/hw_lib_dummy.c
        src/musyx/runtime/CheapReverb/creverb_fx.c
        src/musyx/runtime/CheapReverb/creverb.c
        src/musyx/runtime/StdReverb/reverb_fx.c
        src/musyx/runtime/StdReverb/reverb.c
        src/musyx/runtime/Delay/delay_fx.c
        src/musyx/runtime/Chorus/chorus_fx.c
)

target_include_directories(musyx PUBLIC include)
target_compile_options(musyx PRIVATE -Werror -Wno-stringop-overflow -Wno-pointer-to-int-cast -gdwarf-4)
target_compile_definitions(musyx PUBLIC -DMUSY_TARGET=${MUSY_TARGET}
        $<$<CONFIG:Debug>:_DEBUG>
        $<$<CONFIG:RelWithDebInfo>:_DEBUG>
        $<$<CONFIG:Release>:NDEBUG>
        $<$<CONFIG:MinSizeRel>:NDEBUG>)
set_target_properties(musyx PROPERTIES DEBUG_POSTFIX D)
set_target_properties(musyx PROPERTIES RELWITHDEBINFO_POSTFIX RD)
set_target_properties(musyx PROPERTIES MINSIZEREL_POSTFIX MIN)

add_executable(test
        test/main.c
)

target_link_libraries(test musyx m)
target_compile_options(test PRIVATE -fno-dce
        -fno-dse
        -fno-tree-dce
        -fno-tree-dse
        -gdwarf-4
)
set_target_properties(test PROPERTIES RELWITHDEBINFO_POSTFIX RD)
