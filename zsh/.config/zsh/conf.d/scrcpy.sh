scrcpy-tui() {
  serial=$(adb devices | tail -n +2 | awk '{print $1}' | fzf)
  if [[ ! -z "$serial" ]]; then
    run scrcpy --serial=$serial
  fi
}
