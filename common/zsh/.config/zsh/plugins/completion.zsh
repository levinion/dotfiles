# enable completion
[[ $(uname) == "Darwin" ]] && fpath+=$(brew --prefix)/share/zsh-completions
fpath+=$ZDOTDIR/completions
autoload -Uz compinit

# -i flag to suppress "zsh compinit: insecure directories" warnning
compinit -i -d /tmp/.zcompdump
