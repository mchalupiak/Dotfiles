source ~/.profile

# Added by Toolbox App
export PATH="$PATH:/home/mikec/.local/share/JetBrains/Toolbox/scripts"

export PATH="${PATH}:$HOME/.scripts:$HOME/maple2022/bin:$HOME/intelFPGA_lite/18.1/quartus/bin:$HOME/intelFPGA_lite/18.1/modelsim_ase/bin"
export _JAVA_AWT_WM_NONREPARENTING=1
export XDG_CURRENT_DESKTOP=sway
source ~/.bashrc
export QSYS_ROOTDIR="/home/mikec/intelFPGA_lite/18.1/quartus/sopc_builder/bin"
export VERSION_CONTROL="never"

# opam configuration
test -r /home/mikec/.opam/opam-init/init.sh && . /home/mikec/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# exec hilbish -S -l
