# remove mode switch delay
KEYTIMEOUT=5

# gh and gl to move cursor like helix

cursor-goto-left() {
  CURSOR=0
}
zle -N cursor-goto-left
bindkey -a gh cursor-goto-left

cursor-goto-right() {
  CURSOR=$(echo "$BUFFER" | wc -m)
}

zle -N cursor-goto-right
bindkey -a gl cursor-goto-right

# set cursor shape based on current mode

cursor-set-bar() {
  echo -en '\e[6 q'
}

zle -N cursor-set-bar

cursor-set-block() {
  echo -en '\e[2 q'
}

zle -N cursor-set-block

zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    cursor-set-block
  else
    cursor-set-bar
  fi
}

zle -N zle-keymap-select

# before exec
preexec_functions+=(cursor-set-block)
# after exec and before print
precmd_functions+=(cursor-set-bar)
