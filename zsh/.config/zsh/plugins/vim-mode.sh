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

enter-insert-mode() {
  echo -en '\e[6 q'
}

zle -N enter-insert-mode

enter-normal-mode() {
  echo -en '\e[2 q'
  fcitx5-remote -c
}

zle -N enter-normal-mode

zle-keymap-select() {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    enter-normal-mode
  else
    enter-insert-mode
  fi
}

zle -N zle-keymap-select

# before exec
preexec_functions+=(enter-normal-mode)
# after exec and before print
precmd_functions+=(enter-insert-mode)

# vi-yank
vi-yank-whole-line-to-clipboard() {
  echo $BUFFER | xclip -sel clip
}

zle -N vi-yank-whole-line-to-clipboard
bindkey -M vicmd yy vi-yank-whole-line-to-clipboard
bindkey -M visual yy vi-yank-whole-line-to-clipboard
