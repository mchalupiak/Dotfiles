#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/NES/USA -iname "*.nes" | bemenu -i --fn "Iosevka Term SS12 12")
[ -z "$GAMES" ] || fceux "$GAMES"
