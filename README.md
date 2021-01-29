# Paper Mario: The Thousand Year Door

This repo contains a WIP decompilation of Paper Mario: The Thousand Year Door (JP).

It builds the following DOL:

ttyd_jp.dol: `sha1: f32946b545e9956f62ee79f162ac2b68733a0878`

## Building

### Required packages

* [devkitPro](https://devkitpro.org/wiki/Getting_Started)
* python3
* gcc

### Instructions

1. Download the Gamecube SDK and make an environment variable called SDK_BASE_PATH that points to this folder such that the folder root has both the HW2 and include folders.
2. Download the Codewarrior for Gamecube (preferrably 2.7 since it can be found in full) and install it and make CW_BASE_PATH point to this folder where it is installed.
3. Obtain a clean DOL of TTYD JP and place it in the base working directory and name it `baserom.dol`.
4. Download GC_WII_COMPILERS.zip from (https://cdn.discordapp.com/attachments/704241951972524063/801641758249320478/GC_WII_COMPILERS.zip) and extract it to tools/mwcc_compiler/.
5. Run the `make` command

## Contributions

Contributions and PRs are welcome.
