rg --uu --color=always --line-number --no-heading --smart-case -H "${*:-}" | tr -d '\r' |
  fzf-tmux --cycle -p 80%,90% --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --theme="base16-256" --color=always {1} --highlight-line {2}' \
      --bind 'enter:become(echo "{1}" "{2}")' \
      --preview-window 'right,55%,+{2}+3/3,~3' \
      #--preview-window 'right,55%' \
