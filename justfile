install:
  just install-dependencies
  just apply-home
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
    # "stow"
    "stor"
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
    "openrgb" # rgb control
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
    "steam"

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
  )
  $AUR_HELPER -S --needed "${dependencies[@]}"

apply-home:
  just install-dotfiles

install-dotfiles:
  stor -v -d home -t $HOME $(ls home/ | xargs -n 1 basename)

uninstall-dotfiles:
  stor -D -v -d home -t $HOME $(ls home/ | xargs -n 1 basename)

apply-system:
  just pacman-hooks

pacman-hooks:
  sudo install -Dm755 ./system/pacman/scripts/* /usr/share/libalpm/scripts/
  sudo cp ./system/pacman/hooks/* /usr/share/libalpm/hooks/

install-sysctl:
  sudo mkdir -p /etc/sysctl.d/
  sudo cp ./system/sysctl/* /etc/sysctl.d/
  sudo sysctl -p

install-sddm:
  sudo cp -r ./system/sddm/* /etc/
