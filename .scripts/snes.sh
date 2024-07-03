#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/SNES/USA -iname "*.zip" | bemenu -i --fn "Cascadia Code 12")
[ -z "$GAMES" ] || snes9x-gtk "$GAMES"
