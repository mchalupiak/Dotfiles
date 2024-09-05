#!/usr/bin/env bash
DATE=$(date +'%Y-%m-%d %I:%M:%S %p')
# BAT=$(cat /sys/class/power_supply/BAT1/capacity)
VOL=$(pactl get-sink-volume @DEFAULT_SINK@ | tr "," "\n" | grep \% | sed s/Volume\:// | sed 's/\%.*$//' | sed 's/^.*\///' | head -n1 | sed s/\ *//)
VOL="${VOL}%"
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | cut -d\  -f2)
# BRIGHT=$(brightnessctl | tr "\n" " " | cut -d\  -f9 | tr -d "()%")
MEM=$(free -h | sed 's/[  ]\+/:/g' | cut -d\: -f4 | tr "\n" ":" | cut -d\: -f2)
USER=$(id -u -n)
HOST=$(cat /proc/sys/kernel/hostname)
# LAYOUT=$(swaymsg -t get_inputs | jq -r '.[] | select( .type == "keyboard") .xkb_active_layout_name' | tr "\n" ":" | cut -d\: -f1 | cut -d\  -f2| tr -d "()")
LAYOUT=$(setxkbmap -print -verbose 10 | grep layout | cut -d ":" -f 2 | tr -d " ")
NETWORK_NAME=$(iwctl station wlan0 show | grep network | sed s/"Connected network"// | tr -d " ")
IP=$(iwctl station wlan0 show | grep IPv4 | sed s/"IPv4 address"// | tr -d " ")

if [ $MUTED == 'yes' ]
then
    VOL='muted'
fi

echo ${MEM} \| ${USER}\@${HOST} \| KB\: ${LAYOUT} \| ${NETWORK_NAME}\@${IP} \| V: ${VOL}  \| ${BRIGHT}% Bl \| ${BAT}\% B \| ${DATE}
