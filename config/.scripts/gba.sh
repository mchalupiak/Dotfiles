#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/GBA -iname "*.zip" | bemenu -i --fn "Iosevka Term SS12 12")
[ -z "$GAMES" ] || mgba "$GAMES"
