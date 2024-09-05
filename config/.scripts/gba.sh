#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/GBA -iname "*.zip" | bemenu -i --fn "Cascadia Code 12")
[ -z "$GAMES" ] || mgba "$GAMES"
