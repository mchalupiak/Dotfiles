if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
    export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk/
fi


# Added by Toolbox App
export PATH="$PATH:/home/mikec/.local/share/JetBrains/Toolbox/scripts"



[ -f "/home/mikec/.ghcup/env" ] && . "/home/mikec/.ghcup/env" # ghcup-env