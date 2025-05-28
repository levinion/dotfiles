#! /bin/bash

install-dependencies() {
  AUR_HELPER="paru"
  dependencies=(
    "stow"
    "i3-wm"
    "alacritty"
    # "fish"
    "mpv"
    "neovim"
    "picom"
    "polybar"
    # "rofi"
    "fcitx5-im"
    "fcitx5-rime"
    "dex"
    "feh"
    "sing-box"
    "autotiling"
    "steam"
    "openrgb"
    "npm"
    "rustup"
    "sccache"
    "go"
    "uv"
    "firefox-developer-edition"
    "yazi"
    "flameshot"
    "fzf"
    "zoxide"
    "fastfetch"
    "ttf-jetbrains-mono-nerd"
    "noto-fonts-emoji"
    "ttf-pingfang-git"
    # "zellij"
    "tealdeer"
    "tmux"
    "eza"
    "ripgrep"
    "fd"
    "ueberzugpp"
    "rust-analyzer"
    "clang"
    "gdb"
    # "xautocfg"
    "atuin"
    "zsh"
    "zsh-autosuggestions"
    "zsh-fast-syntax-highlighting"
    "zsh-history-substring-search"
    "zsh-theme-powerlevel10k-git"
    "zsh-completions"
    "exa"
  )
  $AUR_HELPER -S --needed "${dependencies[@]}"
}

dotfiles() {
  stow -v */
}

install-all() {
  install-dependencies
  dotfiles
}

main() {
  case $1 in
  "install")
    install-all
    ;;
  "dependencies")
    install-dependencies
    ;;
  "dotfiles")
    dotfiles
    ;;
  *)
    echo "-install      (install dependencies and all dotfiles"
    echo "-dependencies (install dependencies only with aur helper"
    echo "-dotfiles     (install dotfiles only with stow"
    ;;
  esac
}

main $@
