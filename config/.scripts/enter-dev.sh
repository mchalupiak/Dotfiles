dir="$(cat ~/.scripts/store/projects | fzf | cut -d\  -f1)"
if [ -z "$dir" ]; then
    return
fi
if [ -n "$(command -v tmux)" ] && [ -z "$TMUX" ]; then
	tmux new-session -d -c $dir
#	tmux send-keys -t 0 C-z kak Enter
	tmux attach
else
    cd $dir
    kak
fi
