#!/bin/sh
GAMES=$(find /home/mikec/Documents/Games/ROMS/Genesis -iname "*.zip" | bemenu -i --fn "Iosevka Term SS12 12")
[ -z "$GAMES" ] || blastem "$GAMES"
