bindkey -v

bindkey '^?' backward-delete-char

autoload edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

bindkey -a ge edit-command-line
