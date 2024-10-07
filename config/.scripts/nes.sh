#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/NES/USA -iname "*.nes" | dmenu -i)
[ -z "$GAMES" ] || fceux "$GAMES"
