export PATH="${PATH}:$HOME/.scripts"
source ~/.profile
source ~/.bashrc


# Added by Toolbox App
export PATH="$PATH:/home/mikec/.local/share/JetBrains/Toolbox/scripts"



# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/home/mikec/.opam/opam-init/init.sh' && . '/home/mikec/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
# END opam configuration
