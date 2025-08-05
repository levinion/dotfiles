export EDITOR=nvim
export DIFFPROG='nvim -d'

export BROWSER="firefox-developer-edition"
export RUSTC_WRAPPER=sccache

# input method
if [[ "$XDG_SESSION_TYPE" = "x11" ]]; then
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export GDK_DPI_SCALE=1
export GDK_SCALE=2
export XCURSOR_SIZE=32
export QT_AUTO_SCREEN_SCALE_FACTOR=2
export QT_ENABLE_HIGHDPI_SCALING=0
export QT_SCALE_FACTOR=2
export QT_STYLE_OVERRIDE=kvantum
fi

if [[ "$XDG_SESSION_TYPE" = "wayland" ]]; then
export QT_IM_MODULE=fcitx
export QT_IM_MODULES="wayland;fcitx;ibus"
export GDK_DPI_SCALE=1
export GDK_SCALE=1
export XCURSOR_SIZE=32
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=0
export QT_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export ELECTRON_OZONE_PLATFORM_HINT=auto
fi

export XMODIFIERS="@im=fcitx"
export XIM=fcitx
export XIM_PROGRAM=fcitx
export SDL_IM_MODULE=fcitx
export INPUT_METHOD=fcitx
export GLFW_IM_MODULE=ibus

# firefox nvidia vaapi
export MOZ_DISABLE_RDD_SANDBOX=1
export LIBVA_DRIVER_NAME=nvidia
export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json

export FZF_DEFAULT_OPTS="\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"
export FZF_DEFAULT_COMMAND="eza"

zsh-add-path() {
  PATH=$1:$PATH
}

zsh-add-path ~/go/bin
zsh-add-path ~/.local/bin
zsh-add-path ~/.cargo/bin
zsh-add-path ~/.yarn/bin
zsh-add-path $ZDOTDIR/scripts
