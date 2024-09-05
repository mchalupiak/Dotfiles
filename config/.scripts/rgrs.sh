(RELOAD="reload:rg -uu --color=always --pcre2 --line-number --no-heading --smart-case {q} $1|| :"
fzf-tmux --cycle -p 80%,90% < /dev/null \
    --disabled --ansi \
    --bind "start:$RELOAD" --bind "change:$RELOAD" \
    --bind "enter:become(echo \"$2\" '{1}')" \
    --delimiter : \
    --preview-window 'right,55%,+{1}+3/3,~3' \
    --preview "bat --theme='base16-256' --color=always $1 --highlight-line {1}")
