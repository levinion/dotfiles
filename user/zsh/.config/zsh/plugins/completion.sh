# enable completion
fpath+=$ZDOTDIR/completions
autoload -Uz compinit
compinit -d /tmp/.zcompdump
