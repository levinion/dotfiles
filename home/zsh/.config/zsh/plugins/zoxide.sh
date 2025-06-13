eval "$(zoxide init zsh)"

z() {
  if [[ -z "$@" ]]; then
    cd
  elif [[ -d "$@" ]]; then
    __zoxide_cd $@
  elif [[ $(zoxide query -l "$@" | wc -l) == 1 ]]; then
    __zoxide_z $@
  else
    __zoxide_zi $@ || true
  fi
}
