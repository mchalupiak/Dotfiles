#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/NES/USA -iname "*.nes" | bemenu -i --fn "Cascadia Code 12")
[ -z "$GAMES" ] || fceux "$GAMES"
