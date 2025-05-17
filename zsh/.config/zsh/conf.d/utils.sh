zsh_load_plugin() {
  source $ZDOTDIR/plugins/$1.sh
}

zsh_reload() {
  source $ZDOTDIR/.zprofile
  source $ZDOTDIR/.zshrc
  echo "soruce $ZDOTDIR/.zprofile"
  echo "source $ZDOTDIR/.zshrc"
}

shut() {
  sudo pacman kill redroid13
  shutdown -h now
}

run() {
  $@ >/dev/null 2>&1 &
  disown
}

jump() {
  cd $(fd . --type d | fzf)
}

h() {
  eval "$(atuin search "$@" --cmd-only | fzf)"
}
