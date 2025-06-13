shut() {
  sudo podman kill redroid13
  shutdown -h now
}

j() {
  local target=$(fd . --type d | fzf)
  [[ -n "$target" ]] && cd "$target"
}

zsh-eval() {
  local cmd="$@"
  [[ -z "$cmd" ]] && return -1
  echo -n $(colorful -f green 💡 About to execute:)
  echo -n "  $(colorful -f cyan "$cmd")  "
  confirm "$(colorful -f yellow '[y/n]: ')" && eval "$cmd"
}

h() {
  local cmd="$(atuin search "$@" --cmd-only | fzf)"
  zsh-eval $cmd
}

zsh-reload() {
  source $ZDOTDIR/.zprofile
  source $ZDOTDIR/.zshrc
  echo "soruce $ZDOTDIR/.zprofile"
  echo "source $ZDOTDIR/.zshrc"
}

standby() {
  xset dpms force standby
}

fkill() {
  [[ $# == 0 ]] && return 1
  local option=$(pgrep -fa "$@" | fzf)
  if [[ -n "$option" ]]; then
    local pid=$(echo $option | col 1)
    local cmd=$(echo $option | col 2-)
    kill "$pid"
    echo "$cmd"
    return 0
  fi
  return -1
}

restart() {
  fkill "$@" | xargs run
}
