# ~/.bashrc
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin/:~/.scripts
PATH=$PATH:~/.cargo/bin
PATH=$PATH:~/go/bin/
PATH=$PATH:~/.nimble/bin/
PATH=$PATH:~/Documents/suckless/dylan/opendylan-2024.1/bin
PATH=$PATH:~/.config/emacs/bin/
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

export OPEN_DYLAN_USER_REGISTRIES=/tmp/dime-test/registry

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi
#
## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
#	# We have color support; assume it's compliant with Ecma-48
#	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
#	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[0;32m\]\u\[\033[00m\]\100\[\033[00m\]\h \[\033[0;32m\]\w\[\033[01;00m\]> '; else PS1='\[\033[0;32m\]\u\[\033[00m\]\100\[\033[00m\]\h \[\033[0;32m\]\w\[\033[01;00m\]> '
#else
#    PS1='\u\100\h \w> '
fi
#
## Set 'man' colors
#if [ "$color_prompt" = yes ]; then
#	man() {
#	env \
#	LESS_TERMCAP_mb=$'\e[01;31m' \
#	LESS_TERMCAP_md=$'\e[01;31m' \
#	LESS_TERMCAP_me=$'\e[0m' \
#	LESS_TERMCAP_se=$'\e[0m' \
#	LESS_TERMCAP_so=$'\e[01;44;33m' \
#	LESS_TERMCAP_ue=$'\e[0m' \
#	LESS_TERMCAP_us=$'\e[01;32m' \
#	man "$@"
#	}
#fi
#
#unset color_prompt force_color_prompt
#
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'
alias emacs='emacs -nw'
alias dd='dd status=progress'
alias _='sudo'
alias _i='sudo -i'
alias please='sudo'
alias fucking='sudo'
alias hx='helix'
alias bat='bat --theme="base16-256"'
if [ -n "$(command -v 'eza')" ]; then
  alias ls='eza'
fi
alias zf='z $(flirt)'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -z "$EDITOR" ]; then
    export EDITOR='kak'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ "$XDG_SESSION_DESKTOP" = "sway" ] ; then
    # https://github.com/swaywm/sway/issues/595
    export _JAVA_AWT_WM_NONREPARENTING=1
    export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk/
fi
eval "$(zoxide init bash)"
eval "$(fzf --bash)"

export TMUX_TMPDIR=/tmp
export TINTED_SHELL_ENABLE_BASE16_VARS=1

tinty_source_shell_theme() {
  tinty $@
  subcommand="$1"

  if [ "$subcommand" = "apply" ] || [ "$subcommand" = "init" ]; then
    tinty_data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/tinted-theming/tinty"

    for tinty_script_file in $(find "$tinty_data_dir" -maxdepth 1 -type f -name "*.sh"); do
      . $tinty_script_file
    done

    unset tinty_data_dir
  fi

  unset subcommand
}

# if [ -n "$(command -v 'tinty')" ]; then
#     tinty_source_shell_theme "init"
#     alias theme='tinty_source_shell_theme apply "$(tinty list | fzf --cycle)" && xrdb ~/.Xresources'
# fi


if [ -n "$(command -v tmux)" ] && [ -n "$(command -v kak)" ] && [ -z "$TMUX" ]; then
    SESH="$((tmux list-sessions 2>/dev/null || echo '-1') | cut -d' ' -f1 | tr -d ':-' | sort -r | head -n1 | xargs -I{} echo '{} + 1' | bc)"
    alias kak='tmux new-session -e "EDITOR=\"kak -c $SESH\"" -s $SESH kak -s $SESH > /dev/null'
elif [ -n "$(command -v tmux)" ] && [ -n "$(command -v kak)" ]; then
    SESH="$(tmux display-message -p '#S')"
    alias kak='kak -c $SESH 2>/dev/null || kak -s $SESH'
    alias vidir='EDITOR="kak -c $SESH 2/dev/null || kak -s $SESH" vidir'
    alias vipe='EDITOR="kak -c $SESH 2>/dev/null|| kak -s $SESH" vipe'
fi

alias enter-dev='. enter-dev.sh'
alias ssh='TERM="xterm-256color" ssh'

export DISABLE_TELEMETRY=YES


[ -f "/home/mikec/.ghcup/env" ] && . "/home/mikec/.ghcup/env" # ghcup-env
alias guile='rlwrap guile'
alias sbcl='rlwrap sbcl'
alias csi='rlwrap csi'
alias chicken-csi='rlwrap chicken-csi'
alias icyc='rlwrap icyc'
export DCONF_PROFILE
export FZF_DEFAULT_OPTS="
	--color=fg:#908caa,bg:#191724,hl:#ebbcba
	--color=fg+:#e0def4,bg+:#26233a,hl+:#ebbcba
	--color=border:#403d52,header:#31748f,gutter:#191724
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"
