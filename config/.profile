if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
    export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk/
fi

export BEMENU_OPTS='--fn "Cascadia Code 12"'

# Added by Toolbox App
export PATH="$PATH:/home/mikec/.local/share/JetBrains/Toolbox/scripts"
GTK_THEME=Chicago95


[ -f "/home/mikec/.ghcup/env" ] && . "/home/mikec/.ghcup/env" # ghcup-env
# pipewire-launch &
