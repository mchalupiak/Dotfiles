#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/Genesis -iname "*.zip" | bemenu -i --fn "Cascadia Code 12")
[ -z "$GAMES" ] || blastem "$GAMES"
