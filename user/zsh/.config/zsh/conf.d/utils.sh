shut() {
  exists podman &&
    sudo podman container list | grep redroid13 >/dev/null 2>&1 &&
    sudo podman kill redroid13
  shutdown -h now
}

exists fd && j() {
  local target=$(fd . --type d | fzf)
  [[ -n "$target" ]] && cd "$target"
}

exists colorful && zsh-eval() {
  local cmd="$@"
  [[ -z "$cmd" ]] && return -1
  echo -n $(colorful -f green 💡 About to execute:)
  echo -n "  $(colorful -f cyan "$cmd")  "
  confirm "$(colorful -f yellow '[y/n]: ')" && eval "$cmd"
}

exists atuin && h() {
  local cmd="$(atuin search "$@" --cmd-only | fzf)"
  zsh-eval $cmd
}

zsh-reload() {
  source $ZDOTDIR/.zprofile
  source $ZDOTDIR/.zshrc
  echo "soruce $ZDOTDIR/.zprofile"
  echo "source $ZDOTDIR/.zshrc"
}

exists xset && standby() {
  xset dpms force standby
}

exists fzf && exists col && fkill() {
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

exists fkill && restart() {
  fkill "$@" | xargs run
}

exists btrfs && snapshot() {
  local date="$(date +'%Y%m%d-%H_%M_%S')"
  sudo btrfs subvolume snapshot -r /home/ /snapshots/manual-home-$date
  sudo btrfs subvolume snapshot -r / /snapshots/manual-root-$date

}

exists obs && obs() {
  run obs --minimize-to-tray --disable-shutdown-check
}
