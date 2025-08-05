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
    "ly"
    "ura-git"
    "firefox-developer-edition"
    "alacritty"
    "dex"
    "feh"
    "fcitx5-im"
    "fcitx5-rime"
    # "rofi"
    # "openrgb" # rgb control
    "mpv"
    "grim"
    "slurp"
    "wf-recorder"
    "wl-clipboard"
    "swaybg"
    "waybar"
    "wlr-randr"

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
    "trash-cli"

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
    "zsh-theme-powerlevel10k-git"
    "zsh-completions"
    "fzf-tab-git"

    # -- music
    # "mpd"
    # "rmpc"

    # -- document
    # "libreoffice-fresh"
    # "libreoffice-fresh-zh-cn"
  )
  $AUR_HELPER -S --needed "${dependencies[@]}"

apply-user:
  stor -f user/*/
  stor -f bwrap/*/

apply-system:
  sudo stor -cf -t / system/*/

[private]
push:
  git add .
  git commit -m "update: $(date '+%Y%m%d')"
  git push origin main
