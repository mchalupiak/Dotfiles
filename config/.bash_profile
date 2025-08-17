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
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec river
fi
HOMEBREW_PREFIX=/opt/homebrew
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export CPATH="$HOMEBREW_PREFIX/include:$CPATH"
export LIBRARY_PATH="$HOMEBREW_PREFIX/lib:$LIBRARY_PATH"
. "/Users/mikec/.local/share/bob/env/env.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

