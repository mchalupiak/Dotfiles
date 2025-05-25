#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/GBC -iname "*.zip" | bemenu -i --fn "Iosevka Term SS12 12")
[ -z "$GAMES" ] || mgba "$GAMES"
