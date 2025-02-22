alias shut "shutdown -h now"
alias vim nvim
alias ls eza
alias la "eza -a"
alias hx helix
alias fd "fd --absolute-path"
alias cat bat
alias zed zeditor
alias faster-whisper "whisper-ctranslate2 --model large-v3 --output_format srt --temperature 0.6"
alias whisper "whisper --model large-v3 --output_format srt --temperature 0.6"
alias run_weston "run weston -c $HOME/.config/weston/weston.ini"
alias h 'eval $(history | fzf)'
alias e exit
alias zk "zellij kill-all-sessions -y"
alias c clear
alias man "man --locale zh_CN"

set -g fish_greeting
set -gx EDITOR nvim
set -gx RUSTC_WRAPPER sccache
set -gx GDK_DPI_SCALE -1
set -gx GDK_SCALE 2
set -gx XCURSOR_SIZE 32
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 2
set -gx QT_ENABLE_HIGHDPI_SCALING 0
set -gx QT_SCALE_FACTOR 2
set -gx QT_STYLE_OVERRIDE kvantum

# input method
set -gx QT_IM_MODULE fcitx5
set -gx GTK_IM_MODULE fcitx5
set -gx XMODIFIERS "@im=fcitx5"
set -gx XIM fcitx5
set -gx XIM_PROGRAM fcitx5
set -gx SDL_IM_MODULE fcitx5
set -gx INPUT_METHOD fcitx5
set -gx GLFW_IM_MODULE ibus

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

alias uv_shell "source .venv/bin/activate.fish"
alias get_idf ". /opt/esp-idf/export.fish"
alias fish_reload "source ~/.config/fish/config.fish && source ~/.config/fish/**/*.fish"
alias run_reflector "sudo reflector --verbose --threads 16 -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist"

fish_add_path ~/go/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.config/fish/scripts
fish_add_path ~/docker/redroid

# some application rules
alias simplenote "simplenote --in-process-gpu"

zoxide init fish | source

xset r rate 300 25

if status is-interactive
    vim_key_binding
    tmux_auto_start
end
