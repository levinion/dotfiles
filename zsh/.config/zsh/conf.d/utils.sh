zsh_add_path() {
  PATH=$1:$PATH
}

zsh_load_plugin() {
  source $ZDOTDIR/plugins/$1.sh
}

zsh_reload() {
  source $ZDOTDIR/.zshrc
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
