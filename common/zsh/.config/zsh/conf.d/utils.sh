shut() {
  docker rm -f "$(docker ps -q)"
  shutdown -h now
}

exists fd && j() {
  local target=$(fd . --type d | fzf)
  [[ -n "$target" ]] && cd "$target"
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

exists fzf && fkill() {
  [[ $# == 0 ]] && return 1
  local option=$(pgrep -fa "$@" | fzf)
  if [[ -n "$option" ]]; then
    local pid=$(echo $option | cut -d ' ' -f 1)
    local cmd=$(echo $option | cut -d ' ' -f 2-)
    kill "$pid"
    echo "$cmd"
    return 0
  fi
}

exists fkill && restart() {
  fkill "$@" | xargs run
}

exists btrfs && snapshot() {
  local date="$(date +'%Y%m%d-%H_%M_%S')"
  sudo btrfs subvolume snapshot -r /home/ /snapshots/manual-home-$date
  sudo btrfs subvolume snapshot -r / /snapshots/manual-root-$date

}

exists yt-dlp && yt-dlp-m4a() {
  yt-dlp \
    -f "bestaudio[ext=m4a]" \
    --extract-audio \
    --audio-format m4a \
    --embed-metadata \
    --embed-thumbnail \
    "$@"
}

exists obs && obs() {
  run obs --minimize-to-tray --disable-shutdown-check
}

exists pikaur && pikaur() {
  if [ $# -eq 0 ]; then
    command pikaur -Syu
  else
    command pikaur "$@"
  fi
}

exists yazi && function yazi() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd <"$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}
