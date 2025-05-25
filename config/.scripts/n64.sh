#!/bin/sh
# MON=$(xrandr | grep ' connected' | cut -d' ' -f1 | dmenu -i)
GAMES=$(find /home/mikec/Documents/Games/ROMS/N64 -iname "*.zip" | bemenu -i -l 10 --fn "Iosevka Term SS12 12")
[ -z "$GAMES" ] && exit
# GAME=$(mktemp)
# RES=$(xrandr | grep "$MON" | sed -E 's/.*connected (primary )?([0-9]*x[0-9]*).*/\2/')
# echo "$RES"
# rm -r "$GAME"
# unzip "$GAMES" -d "$GAME"
# mupen64plus --resolution "$RES" --windowed --gfx mupen64plus-video-glide64mk2 "$GAME"/*
# rm -r "$GAME"
RMG --fullscreen "$GAMES"
