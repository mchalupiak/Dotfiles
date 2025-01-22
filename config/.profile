if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
    export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk/
fi

export PATH="${PATH}:$HOME/.scripts:$HOME/.emacs.d/bin:$HOME/.local/share/gem/ruby/3.0.0/bin"
source ~/.bashrc
export QSYS_ROOTDIR="/home/mikec/intelFPGA_lite/18.1/quartus/sopc_builder/bin"
export CLASSPATH="/usr/share/java/junit.jar:/usr/share/java/hamcrest/core.jar"

export BEMENU_OPTS='--fn "Cascadia Code 12"'

# Added by Toolbox App
export PATH="$PATH:/home/mikec/.local/share/JetBrains/Toolbox/scripts"


[ -f "/home/mikec/.ghcup/env" ] && . "/home/mikec/.ghcup/env" # ghcup-env
