# Dolphin SDK 2004 Libraries

Decompilation of the archive library files of the 4/20/2004 version of the Dolphin SDK. **This repository does not provide a complete copy of that version of the SDK.** This repo is focusing on the built code libraries within this version and is *not a complete replacement.*

## Compatibility

Currently this repository supports building the following libraries:

:heavy_check_mark: = 100% Complete
:warning: = In Progress, at least 1 or more files done.
:x: = No code yet

| Library Name | Progress |
| ------------ | ---------- |
| ai           | :x: |
| am           | :x: |
| amcnotstub   | :heavy_check_mark: |
| amcstubs     | :heavy_check_mark: |
| ar           | :x: |
| ax           | :x: |
| axart        | :x: |
| axfx         | :x: |
| base         | :x: |
| card         | :heavy_check_mark: |
| db           | :x: |
| demo         | :x: |
| dsp          | :x: |
| dtk          | :x: |
| dvd          | :x: |
| exi          | :x: |
| fileCache    | :x: |
| G2D          | :x: |
| gd           | :x: |
| gx           | :x: |
| hio          | :heavy_check_mark: |
| mcc          | :x: |
| mix          | :x: |
| mtx          | :x: |
| odemustubs   | :heavy_check_mark: |
| odenotstub   | :heavy_check_mark: |
| os           | :warning: |
| pad          | :x: |
| perf         | :x: |
| seq          | :x: |
| si           | :x: |
| sp           | :x: |
| support      | :x: |
| syn          | :x: |
| texPalette   | :x: |
| vi           | :x: |

## Preparation

After cloning the repo, you can copy your copies of the .a files to baserom/ and run `make extract` to disassemble these files to source files with DTK.

The build process requires the following packages:

- build-essential
- binutils-powerpc-linux-gnu

Under Debian / Ubunutu you can install them with the following commands:

```bash
sudo apt update
sudo apt install build-essential
```

If building any Dolphin SDK Libraries you can install binutils-powerpc-linux-gnu with:

```bash
sudo apt install binutils-powerpc-linux-gnu
```

Running `make` will then setup DTK if necessary and build all supported libraries.
