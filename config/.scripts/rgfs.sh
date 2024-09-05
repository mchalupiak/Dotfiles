(RELOAD='reload:rg -uu --color=always --line-number --no-heading --smart-case {q} || :'
fzf-tmux --cycle -p 80%,90% < /dev/null \
    --disabled --ansi \
    --bind "start:$RELOAD" --bind "change:$RELOAD" \
    --bind "enter:become(echo '{1}' '{2}')" \
    --delimiter : \
    --preview-window 'right,55%,+{2}+3/3,~3' \
    --preview "bat --theme='base16-256' --color=always {1} --highlight-line {2}")
