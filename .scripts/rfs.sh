rg -uu --color=always --line-number --no-heading --smart-case "${*:3}" "$1" | tr -d '\r' |
  fzf-tmux --cycle -p 175,45 --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview "bat --theme='base16-256' --color=always $1 --highlight-line {1}" \
      --bind "enter:become(echo \"$2\" '{1}')" \
      --preview-window 'right,55%,+{1}+3/3,~3' \

