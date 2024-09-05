#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/N64 -iname "*.zip" | bemenu -i --fn "Cascadia Code 12")
[ -z "$GAMES" ] || mupen64plus "$GAMES"
