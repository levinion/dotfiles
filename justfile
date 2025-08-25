install:
  just install-dependencies
  just apply-user
  just apply-system

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
    # -- DM --
    "ly"

    # -- desktop --
    "ura-git"
    "swaybg"
    "swaylock"
    "swayidle"
    "waybar"
    "firefox-developer-edition"
    "foot"
    # "openrgb" # rgb control
    "mako"

    # -- input method --
    "fcitx5-im"
    "fcitx5-rime"

    # -- audio --
    "pipewire"
    "pipewire-alsa"
    "pipewire-audio"
    "pipewire-jack"
    "pipewire-pulse"
    "pipewire-session-manager"
    "wireplumber"

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
    "fzf"
    "eza"
    "ripgrep"
    "fd"
    "tealdeer"
    "tmux"
    "atuin"
    "zoxide"
    "sing-box"
    "fastfetch"
    "trash-cli"
    "grim"
    "slurp"
    "wlr-randr"
    "stor" # an alternative of GNU/Stow
    "fzfmenu"
    "dex"
    "feh"

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
    "wl-clipboard"
    "wl-clip-persist"

    # -- music --
    "mpd"
    "rmpc"

    # -- video --
    "mpv"

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
