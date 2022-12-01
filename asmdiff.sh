#!/bin/bash

OBJDUMP="$DEVKITPPC/bin/powerpc-eabi-objdump -EB -D -bbinary -mpowerpc:750 -M gekko"
if [ $(($1)) -ge $((0x80000000)) ]; then
    OPTIONS="--adjust-vma=0x80000000 --start-address=$(($1)) --stop-address=$(($1 + $2))"
else
    OPTIONS="--start-address=$(($1)) --stop-address=$(($1 + $2))"
fi
$OBJDUMP $OPTIONS baserom.dol > baserom.dump
$OBJDUMP $OPTIONS build/ttyd_jp/ttyd_jp.dol > ttyd_jp.dump
colordiff -u baserom.dump ttyd_jp.dump
