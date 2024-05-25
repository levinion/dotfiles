alias shut "shutdown -h now"
alias vim nvim
alias la "ls -a"
alias hx helix
alias pc proxychains
alias fd "fd --absolute-path"
alias cat bat

set -g fish_greeting
set -gx EDITOR nvim
set -gx RUSTC_WRAPPER sccache
set -gx GDK_DPI_SCALE 0.5
set -gx GDK_SCALE 2
set -gx XCURSOR_SIZE 32

# input method
set -gx QT_IM_MODULE fcitx
set -gx GTK_IM_MODULE fcitx
set -gx XMODIFIERS "@im=fcitx"
set -gx XIM fcitx
set -gx XIM_PROGRAM fcitx
set -gx SDL_IM_MODULE fcitx
set -gx GLFW_IM_MODULE ibus

fish_add_path ~/go/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin

# some application rules
alias simplenote "simplenote --in-process-gpu"

zoxide init fish | source
thefuck --alias | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end
