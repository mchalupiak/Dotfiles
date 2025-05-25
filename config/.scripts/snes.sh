#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/SNES/USA -iname "*.zip" | bemenu -i --fn "Iosevka Term SS12 12")
[ -z "$GAMES" ] || snes9x-gtk "$GAMES"
