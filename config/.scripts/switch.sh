#!/bin/sh

current=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ "${current}" != "'prefer-dark'" ]; then #default

    echo "Switching to dark."
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
    gsettings set org.gnome.desktop.interface icon-theme breeze-dark

else # already dark

    echo "Switching to light."
    gsettings set org.gnome.desktop.interface color-scheme default
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita
    gsettings set org.gnome.desktop.interface icon-theme breeze

fi
