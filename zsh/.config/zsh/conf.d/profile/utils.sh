zsh_add_path() {
  PATH=$1:$PATH
}

zsh_load_plugin() {
  source $ZDOTDIR/plugins/$1.sh
}

run() {
  $@ >/dev/null 2>&1 &
  disown
}
