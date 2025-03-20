source ~/.profile

# Added by Toolbox App
export PATH="$PATH:/home/mikec/.local/share/JetBrains/Toolbox/scripts"

export PATH="${PATH}:$HOME/.scripts:$HOME/maple2022/bin:$HOME/intelFPGA_lite/18.1/quartus/bin:$HOME/intelFPGA_lite/18.1/modelsim_ase/bin"
export _JAVA_AWT_WM_NONREPARENTING=1
# export XDG_CURRENT_DESKTOP=sway
source ~/.bashrc
export QSYS_ROOTDIR="/home/mikec/intelFPGA_lite/18.1/quartus/sopc_builder/bin"
export VERSION_CONTROL="never"

# exec hilbish -S -l


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/mikec/.opam/opam-init/init.sh' && . '/home/mikec/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec river
fi
