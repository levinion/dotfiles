shut() {
  sudo podman kill redroid13
  shutdown -h now
}

jump() {
  cd $(fd . --type d | fzf)
}

h() {
  eval "$(atuin search "$@" --cmd-only | fzf)"
}

zsh_reload() {
  source $ZDOTDIR/.zprofile
  source $ZDOTDIR/.zshrc
  echo "soruce $ZDOTDIR/.zprofile"
  echo "source $ZDOTDIR/.zshrc"
}

standby() {
  xset dpms force standby
}
