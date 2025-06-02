# enable vim mode
bindkey -v

bindkey '^?' backward-delete-char

# edit command-line with $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line
bindkey -a ge edit-command-line
