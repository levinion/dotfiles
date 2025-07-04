install:
  just install-dependencies
  just apply-user
  # just apply-system

# dependencies needed using
install-dependencies:
  #!/bin/bash
  # find by paru > yay
  if $(type paru > /dev/null 2>&1); then
    AUR_HELPER="paru"
  elif $(type yay > /dev/null 2>&1); then
    AUR_HELPER="yay"
  else
    echo "neither paru or yay is found, exiting..."
    exit 1
  fi

  dependencies=(
    # -- desktop environment --
    "stor" # an alternative of GNU/Stow
    "i3-wm"
    "firefox-developer-edition"
    "alacritty"
    "picom"
    "polybar"
    "dex"
    "feh"
    "autotiling"
    "fcitx5-im"
    "fcitx5-rime"
    # "rofi"
    # "openrgb" # rgb control
    "mpv"
    "flameshot"

    # -- code --
    "rustup"
    "sccache"
    "go"
    "uv"
    "rust-analyzer"
    "clang"
    "gdb"
    "npm"

    # -- cli-tools --
    "neovim"
    "yazi"
    "ueberzugpp" # review pictures in yazi
    "fzf"
    "eza"
    "ripgrep"
    "fd"
    "tealdeer"
    "tmux"
    # "zellij"
    "atuin"
    "zoxide"
    "sing-box"
    "fastfetch"

    # -- game --
    # "steam"

    # -- fonts --
    "ttf-jetbrains-mono-nerd"
    "noto-fonts-emoji"
    "ttf-pingfang-git"

    # -- shell and plugins --
    "zsh"
    "zsh-autosuggestions"
    "zsh-fast-syntax-highlighting"
    "zsh-history-substring-search"
    "zsh-theme-powerlevel10k-git"
    "zsh-completions"
    "fzf-tab-git"
    # "fish"

    # -- music
    # "mpd"
    # "rmpc"

    # -- document
    # "libreoffice-fresh"
    # "libreoffice-fresh-zh-cn"
  )
  $AUR_HELPER -S --needed "${dependencies[@]}"

apply-user:
  stor -f home/*/
  stor -f bwrap/*/

apply-system:
  sudo stor -cf -t / system/*/

[private]
push:
  git add .
  git commit -m "update: $(date '+%Y%m%d')"
  git push origin main
