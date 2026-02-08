# setterm -linewrap off

zsh-load-plugin() {
  source "$ZDOTDIR/plugins/$1.sh"
}

zsh-load-config-dir() {
  local file
  for file in "$ZDOTDIR"/conf.d/*; do
    source "$file"
  done
}

exists() {
  type "$@" >/dev/null 2>&1
}

exists-package() {
  pacman -Qq "$@" >/dev/null 2>&1
}

exists-package zsh-theme-powerlevel10k-git && zsh-load-plugin p10k
exists-package zsh-autosuggestions && zsh-load-plugin autosuggestions
zsh-load-plugin completion
exists atuin && zsh-load-plugin atuin
exists zoxide && zsh-load-plugin zoxide
exists-package fzf-tab-git && zsh-load-plugin fzf-tab
zsh-load-plugin vim-mode
exists-package zsh-history-substring-search && zsh-load-plugin history-substring-search
exists direnv && zsh-load-plugin direnv
exists-package zsh-syntax-highlighting && zsh-load-plugin zsh-syntax-highlighting

zsh-load-config-dir
