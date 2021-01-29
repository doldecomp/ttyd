# If defined, wine is not used.
NOWINE ?= 0

ifneq ($(findstring MINGW,$(shell uname)),)
  WINDOWS := 1
endif
ifneq ($(findstring MSYS,$(shell uname)),)
  WINDOWS := 1
endif

# Import the SDK path variable and set the paths.
SDK_BASE_PATH := $(SDK_BASE_PATH)
SDK_LIB_PATH  := $(SDK_BASE_PATH)/HW2/lib
SDK_INC_PATH  := $(SDK_BASE_PATH)/include

# Check if SDK is not defined, error if not defined.
ifeq ($(SDK_BASE_PATH),)
$(error You have not defined SDK_BASE_PATH. Please ensure the Gamecube SDK is installed and point SDK_BASE_PATH as an environment variable to its location.)
endif

# Import the Codewarrior GC 2.7 path variable and set the include path as well.
CW_BASE_PATH := $(CW_BASE_PATH)
CW_INC_PATH  := $(CW_BASE_PATH)/PowerPC_EABI_Support/MSL/MSL_C

# Check if CW is not defined, error if not defined.
ifeq ($(CW_BASE_PATH),)
$(error You have not defined CW_BASE_PATH. Please ensure Codewarrior for Gamecube is installed and point CW_BASE_PATH as an environment variable to its location.)
endif

#-------------------------------------------------------------------------------
# Files
#-------------------------------------------------------------------------------

# Used for elf2dol
USES_SBSS2 := yes

TARGET := ttyd_jp

BUILD_DIR := build/$(TARGET)

# Create the folders via recursive search. We need a disgusting second one for each to catch
# the sub-sub folders. This is not sustainable.
ASM_DIRS := $(sort $(dir $(wildcard asm/*/)))
ASM_DIRS += $(sort $(dir $(wildcard asm/*/*/)))
SRC_DIRS := $(sort $(dir $(wildcard src/*/)))
SRC_DIRS += $(sort $(dir $(wildcard src/*/*/)))
DATA_DIRS := $(sort $(dir $(wildcard data/*/)))
DATA_DIRS += $(sort $(dir $(wildcard data/*/*/)))

# Apply the slash removal after SRC_DIRS is created, otherwise asm/ gets into SRC.
ASM_DIRS := $(patsubst %/,%,$(ASM_DIRS))
SRC_DIRS := $(patsubst %/,%,$(SRC_DIRS))
DATA_DIRS := $(patsubst %/,%,$(DATA_DIRS))

# Inputs
S_FILES := $(foreach dir,$(ASM_DIRS),$(wildcard $(dir)/*.s))
DATA_FILES := $(foreach dir,$(DATA_DIRS),$(wildcard $(dir)/*.s))
C_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.c))
CPP_FILES := $(foreach dir,$(SRC_DIRS),$(wildcard $(dir)/*.cpp))
LDSCRIPT := $(BUILD_DIR)/ldscript.lcf

# Outputs
DOL     := $(BUILD_DIR)/$(TARGET).dol
ELF     := $(DOL:.dol=.elf)
MAP     := $(BUILD_DIR)/$(TARGET).map

O_FILES := $(sort $(foreach file,$(C_FILES),$(BUILD_DIR)/$(file:.c=.o)) \
           $(foreach file,$(CPP_FILES),$(BUILD_DIR)/$(file:.cpp=.o)) \
           $(foreach file,$(S_FILES),$(BUILD_DIR)/$(file:.s=.o))) \
           $(foreach file,$(DATA_FILES),$(BUILD_DIR)/$(file:.s=.o))

GLOBAL_ASM_C_FILES != grep -rl 'GLOBAL_ASM(' $(C_FILES)
GLOBAL_ASM_O_FILES = $(addprefix $(BUILD_DIR)/,$(GLOBAL_ASM_C_FILES:.c=.o))

#-------------------------------------------------------------------------------
# Tools
#-------------------------------------------------------------------------------

MWCC_VERSION := GC/1.3.2

# Programs
ifeq ($(WINDOWS),1)
  WINE :=
else
  WINE := wine
endif

ifeq ($(NOWINE),1)
  WINE :=
endif

AS      := $(DEVKITPPC)/bin/powerpc-eabi-as
OBJCOPY := $(DEVKITPPC)/bin/powerpc-eabi-objcopy
CPP     := cpp -P
CC      := $(WINE) tools/mwcc_compiler/$(MWCC_VERSION)/mwcceppc.exe
# Due to bss erroring on less than 2.7, we have to use the 2.7 linker. Metrowerks, please.
LD      := $(WINE) tools/mwcc_compiler/GC/2.7/mwldeppc.exe
ELF2DOL := tools/elf2dol
SHA1SUM := sha1sum
PYTHON  := python3

ASM_PROCESSOR_DIR := tools/asm_processor
ASM_PROCESSOR := $(ASM_PROCESSOR_DIR)/compile.sh

# Options
INCLUDES := -i . -I- -i include -i $(SDK_INC_PATH) -ir $(CW_INC_PATH)

ASFLAGS := -mgekko -I include
LDFLAGS := -map $(MAP) -fp hard -nodefaults -linkmode lessram
CFLAGS  := -Cpp_exceptions off -proc gekko -fp hard -O4,p -nodefaults -msgstyle gcc -sdata 48 -sdata2 8 -inline deferred -use_lmw_stmw on -enum int $(INCLUDES)

# elf2dol needs to know these in order to calculate sbss correctly.
SDATA_PDHR := 9
SBSS_PDHR := 10

#-------------------------------------------------------------------------------
# Recipes
#-------------------------------------------------------------------------------

### Default target ###

default: all

all: $(DOL)

ALL_DIRS := build $(BUILD_DIR) $(addprefix $(BUILD_DIR)/,$(SRC_DIRS) $(ASM_DIRS) $(DATA_DIRS))

# Make sure build directory exists before compiling anything
DUMMY != mkdir -p $(ALL_DIRS)

.PHONY: tools

$(LDSCRIPT): ldscript.lcf
	$(CPP) -MMD -MP -MT $@ -MF $@.d -I include/ -I . -DBUILD_DIR=$(BUILD_DIR) -o $@ $<

$(DOL): $(ELF) | tools
	$(ELF2DOL) $< $@ $(SDATA_PDHR) $(SBSS_PDHR) $(USES_SBSS2)
	$(SHA1SUM) -c $(TARGET).sha1

clean:
	rm -f -d -r build
	$(MAKE) -C tools clean

tools:
	$(MAKE) -C tools

$(ELF): $(LDSCRIPT) $(O_FILES)
	$(LD) $(LDFLAGS) -o $@ -lcf $(LDSCRIPT) $(O_FILES)
# The Metrowerks linker doesn't generate physical addresses in the ELF program headers. This fixes it somehow.
	$(OBJCOPY) $@ $@

$(GLOBAL_ASM_O_FILES): BUILD_C := $(ASM_PROCESSOR) "$(CC) $(CFLAGS)" "$(AS) $(ASFLAGS)"
BUILD_C ?= $(CC) $(CFLAGS) -c -o

$(BUILD_DIR)/%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

$(BUILD_DIR)/%.o: %.c
	$(BUILD_C) $@ $<

print-% : ; $(info $* is a $(flavor $*) variable set to [$($*)]) @true
