#################################################################
#              Dolphin SDK 2004 Libraries Makefile              #
#################################################################

ifneq (,$(findstring Windows,$(OS)))
  EXE := .exe
else
  WINE ?=
endif

# If 0, tells the console to chill out. (Quiets the make process.)
VERBOSE ?= 0

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
  HOST_OS := linux
else ifeq ($(UNAME_S),Darwin)
  HOST_OS := macos
else
  $(error Unsupported host/building OS <$(UNAME_S)>)
endif

BUILD_DIR := build
TOOLS_DIR := $(BUILD_DIR)/tools
BASEROM_DIR := baserom
TARGET_LIBS := G2D              \
               ai               \
               am               \
               amcnotstub       \
               amcstubs         \
               ar               \
               ax               \
               axart            \
               axfx             \
               base             \
               card             \
               db               \
               demo             \
               dsp              \
               dtk              \
               dvd              \
               exi              \
               fileCache        \
               gd               \
               gx               \
               hio              \
               mcc              \
               mix              \
               mtx              \
               odemustubs       \
               odenotstub       \
               os               \
               pad              \
               perf             \
               seq              \
               si               \
               sp               \
               support          \
               syn              \
               texPalette       \
               vi

ifeq ($(VERBOSE),0)
  QUIET := @
endif

PYTHON := python3

# Every file has a debug version. Append D to the list.
TARGET_LIBS_DEBUG := $(addsuffix D,$(TARGET_LIBS))

# TODO, decompile
SRC_DIRS := $(shell find src -type d)

###################### Other Tools ######################

C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
S_FILES := $(foreach dir,$(SRC_DIRS) $(ASM_DIRS),$(wildcard $(dir)/*.s))
DATA_FILES := $(foreach dir,$(DATA_DIRS),$(wildcard $(dir)/*.bin))
BASEROM_FILES := $(foreach dir,$(BASEROM_DIRS)\,$(wildcard $(dir)/*.s))

# Object files
O_FILES := $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.c.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.s.o)) \
           $(foreach file,$(DATA_FILES),$(BUILD_DIR)/$(file:.bin=.bin.o)) \

DEP_FILES := $(O_FILES:.o=.d) $(DECOMP_C_OBJS:.o=.asmproc.d)

##################### Compiler Options #######################
findcmd = $(shell type $(1) >/dev/null 2>/dev/null; echo $$?)

# todo, please, better CROSS than this.
CROSS := powerpc-linux-gnu-

COMPILER_VERSION ?= 1.2.5n

COMPILER_DIR := mwcc_compiler/GC/$(COMPILER_VERSION)
AS = $(CROSS)as
MWCC    := $(WINE) $(COMPILER_DIR)/mwcceppc.exe
AR = $(CROSS)ar
LD = $(CROSS)ld
OBJDUMP = $(CROSS)objdump
OBJCOPY = $(CROSS)objcopy
ifeq ($(HOST_OS),macos)
  CPP := clang -E -P -x c
else
  CPP := cpp
endif
DTK     := $(TOOLS_DIR)/dtk
DTK_VERSION := 0.7.4

CC        = $(MWCC)

######################## Flags #############################

CHARFLAGS := -char unsigned

CFLAGS = $(CHARFLAGS) -nodefaults -proc gekko -fp hard -Cpp_exceptions off -enum int -warn pragmas -requireprotos -pragma 'cats off' -nostdinc -msgstyle gcc -cwd source -warn pragmas -pragma "cats off" -nowraplines -maxerrors 0 -nofail
INCLUDES := -Iinclude -Iinclude/libc -ir src

ASFLAGS = -mgekko -I src -I include

######################## Targets #############################

$(foreach dir,$(SRC_DIRS) $(ASM_DIRS) $(DATA_DIRS),$(shell mkdir -p build/release/$(dir) build/debug/$(dir)))

# why. Did some SDK libs (like CARD) prefer char signed over unsigned? TODO: Figure out consistency behind this.
build/debug/src/card/CARDRename.o: CHARFLAGS := -char signed
build/release/src/card/CARDRename.o: CHARFLAGS := -char signed
build/debug/src/card/CARDOpen.o: CHARFLAGS := -char signed
build/release/src/card/CARDOpen.o: CHARFLAGS := -char signed

######################## Build #############################

A_FILES := $(foreach dir,$(BASEROM_DIR),$(wildcard $(dir)/*.a))

TARGET_LIBS := $(addprefix baserom/,$(addsuffix .a,$(TARGET_LIBS)))
TARGET_LIBS_DEBUG := $(addprefix baserom/,$(addsuffix .a,$(TARGET_LIBS_DEBUG)))

default: all

# TODO: Start decomp
all: $(DTK) amcnotstub.a amcnotstubD.a gx.a gxD.a hio.a hioD.a amcstubs.a amcstubsD.a odemustubs.a odemustubsD.a odenotstub.a odenotstubD.a vi.a viD.a os.a osD.a card.a cardD.a

verify: build/release/test.bin build/debug/test.bin build/verify.sha1
	@sha1sum -c build/verify.sha1

extract: $(DTK)
	$(info Extracting files...)
	@$(DTK) ar extract $(TARGET_LIBS) --out baserom/release/src
	@$(DTK) ar extract $(TARGET_LIBS_DEBUG) --out baserom/debug/src
    # Thank you GPT, very cool. Temporary hack to remove D off of inner src folders to let objdiff work.
	@for dir in $$(find baserom/debug/src -type d -name 'src'); do \
		find "$$dir" -mindepth 1 -maxdepth 1 -type d | while read subdir; do \
			mv "$$subdir" "$${subdir%?}"; \
		done \
	done
	# Disassemble the objects and extract their dwarf info.
	find baserom -name '*.o' | while read i; do \
		$(DTK) elf disasm $$i $${i%.o}.s ; \
		$(DTK) dwarf dump $$i -o $${i%.o}_DWARF.c ; \
	done

# clean extraction so extraction can be done again.
distclean:
	rm -rf $(BASEROM_DIR)/release
	rm -rf $(BASEROM_DIR)/debug
	make clean

clean:
	rm -rf $(BUILD_DIR)
	rm -rf *.a

$(TOOLS_DIR):
	$(QUIET) mkdir -p $(TOOLS_DIR)

.PHONY: check-dtk

check-dtk: $(TOOLS_DIR)
	@version=$$($(DTK) --version | awk '{print $$2}'); \
	if [ "$(DTK_VERSION)" != "$$version" ]; then \
		$(PYTHON) tools/download_dtk.py dtk $(DTK) --tag "v$(DTK_VERSION)"; \
	fi

$(DTK): check-dtk

build/debug/src/%.o: src/%.c
	@echo 'Compiling $< (debug)'
	$(QUIET)$(CC) -c -opt level=0 -inline off -schedule off -sym on $(CFLAGS) -I- $(INCLUDES) -DDEBUG $< -o $@

build/release/src/%.o: src/%.c
	@echo 'Compiling $< (release)'
	$(QUIET)$(CC) -c -O4,p -inline auto -sym on $(CFLAGS) -I- $(INCLUDES) -DRELEASE $< -o $@

################################ Build AR Files ###############################

amcnotstub_c_files := $(wildcard src/amcnotstub/*.c)
amcnotstub.a  : $(addprefix $(BUILD_DIR)/release/,$(amcnotstub_c_files:.c=.o))
amcnotstubD.a : $(addprefix $(BUILD_DIR)/debug/,$(amcnotstub_c_files:.c=.o))

card_c_files := \
	src/card/CARDBios.c \
	src/card/CARDUnlock.c \
	src/card/CARDRdwr.c \
	src/card/CARDBlock.c \
	src/card/CARDDir.c \
	src/card/CARDCheck.c \
	src/card/CARDMount.c \
	src/card/CARDFormat.c \
	src/card/CARDOpen.c \
	src/card/CARDCreate.c \
	src/card/CARDRead.c \
	src/card/CARDWrite.c \
	src/card/CARDDelete.c \
	src/card/CARDStat.c \
	src/card/CARDRename.c \
	src/card/CARDStatEx.c \
	src/card/CARDRaw.c \
	src/card/CARDNet.c \
	src/card/CARDErase.c \
	src/card/CARDProgram.c
card.a  : $(addprefix $(BUILD_DIR)/release/,$(card_c_files:.c=.o))
cardD.a : $(addprefix $(BUILD_DIR)/debug/,$(card_c_files:.c=.o))

gx_c_files := \
	src/gx/GXInit.c \
	src/gx/GXFifo.c \
	src/gx/GXAttr.c \
	src/gx/GXMisc.c \
	src/gx/GXGeometry.c \
	src/gx/GXFrameBuf.c \
	src/gx/GXLight.c \
	src/gx/GXTexture.c \
	src/gx/GXBump.c \
	src/gx/GXTev.c \
	src/gx/GXPixel.c \
	src/gx/GXDraw.c \
	src/gx/GXStubs.c \
	src/gx/GXDisplayList.c \
	src/gx/GXVert.c \
	src/gx/GXTransform.c \
	src/gx/GXVerify.c \
	src/gx/GXVerifXF.c \
	src/gx/GXVerifRAS.c \
	src/gx/GXSave.c \
	src/gx/GXPerf.c
gx.a  : $(addprefix $(BUILD_DIR)/release/,$(gx_c_files:.c=.o))
gxD.a : $(addprefix $(BUILD_DIR)/debug/,$(gx_c_files:.c=.o))

amcstubs_c_files := $(wildcard src/amcstubs/*.c)
amcstubs.a  : $(addprefix $(BUILD_DIR)/release/,$(amcstubs_c_files:.c=.o))
amcstubsD.a : $(addprefix $(BUILD_DIR)/debug/,$(amcstubs_c_files:.c=.o))

hio_c_files := $(wildcard src/hio/*.c)
hio.a  : $(addprefix $(BUILD_DIR)/release/,$(hio_c_files:.c=.o))
hioD.a : $(addprefix $(BUILD_DIR)/debug/,$(hio_c_files:.c=.o))

vi_c_files := \
	src/vi/vi.c \
	src/vi/i2c.c \
	src/vi/initphilips.c \
	src/vi/gpioexi.c
vi.a  : $(addprefix $(BUILD_DIR)/release/,$(vi_c_files:.c=.o))
viD.a : $(addprefix $(BUILD_DIR)/debug/,$(vi_c_files:.c=.o))

odemustubs_c_files := $(wildcard src/odemustubs/*.c)
odemustubs.a  : $(addprefix $(BUILD_DIR)/release/,$(odemustubs_c_files:.c=.o))
odemustubsD.a : $(addprefix $(BUILD_DIR)/debug/,$(odemustubs_c_files:.c=.o))

odenotstub_c_files := $(wildcard src/odenotstub/*.c)
odenotstub.a  : $(addprefix $(BUILD_DIR)/release/,$(odenotstub_c_files:.c=.o))
odenotstubD.a : $(addprefix $(BUILD_DIR)/debug/,$(odenotstub_c_files:.c=.o))

os_c_files := $(wildcard src/os/*.c)
os.a  : $(addprefix $(BUILD_DIR)/release/,$(os_c_files:.c=.o))
osD.a : $(addprefix $(BUILD_DIR)/debug/,$(os_c_files:.c=.o))

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.elf:
	@echo Linking ELF $@
	$(QUIET)$(LD) -T gcn.ld --whole-archive $(filter %.o,$^) $(filter %.a,$^) -o $@ -Map $(@:.elf=.map)

%.a:
	@ test ! -z '$?' || { echo 'no object files for $@'; return 1; }
	@echo 'Creating static library $@'
	$(QUIET)$(AR) -v -r $@ $(filter %.o,$?)

# ------------------------------------------------------------------------------

.PHONY: all clean distclean default split setup extract

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true

-include $(DEP_FILES)
