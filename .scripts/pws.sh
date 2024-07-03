(rg -uu --color=always --line-number --no-heading . > $1) & tail -n +1 -f $1 | \
fzf-tmux --cycle -p 175,45 < /dev/null \
    --disabled --ansi \
    --bind "change:reload:rg -uu --smart-case {q} $1 || :" \
    --bind "enter:become(echo {1} {2})" \
    --delimiter : ; pkill -P $$
