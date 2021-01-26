#!/bin/bash

CC="$1"
shift
AS="$1"
shift

temp="$(mktemp)"

tools/asm_processor/asm_processor.py "$2" --assembler "$AS" > "$temp.c" &&
$CC "$temp.c" -c -o "$temp.o" &&
tools/asm_processor/asm_processor.py "$2" --post-process "$temp.o" --assembler "$AS" --asm-prelude include/macros.inc &&
powerpc-linux-gnu-objcopy --remove-section .mwcats.text "$temp.o" "$temp.2.o"
powerpc-linux-gnu-objcopy --remove-section .comment "$temp.2.o" "$1"
