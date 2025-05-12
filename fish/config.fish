alias_if nvim vim nvim
alias_if eza ls eza
alias_if eza la "eza -a"
alias_if eza tree "eza -T"
alias_if rg grep rg
alias_if helix hx helix
alias_if fd fd "fd --absolute-path"
alias_if bat cat bat
alias_if zeditor zed zeditor
alias_if whisper-ctranslate2 faster-whisper "whisper-ctranslate2 --model large-v3 --output_format srt --temperature 0.6"
alias_if whisper whisper "whisper --model large-v3 --output_format srt --temperature 0.6"
alias_if weston run_weston "run weston -c $HOME/.config/weston/weston.ini"
alias_if atuin h "commandline -r (atuin search --cmd-only | fzf --height=30%)"
alias e exit
alias c clear
alias_if wpctl switch-sink "wpctl status | grep vol | head -n -1 | fzf | sed 's/\*/ /' | sed 's/ //g' | sed 's/│//g' | awk -F '.' '{print $1}' | xargs wpctl set-default"
alias_if podman docker "sudo podman"
alias_if git zb "cd (git rev-parse --show-toplevel)"
alias_if gdb gdb "gdb -q"
alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias_if firefox-developer-edition firefox firefox-developer-edition
alias ".." "cd .."
alias "..." "cd ../.."
alias_if trash tr trash

alias_if nvim v "python $HOME/.config/fish/scripts/v.py"

type -q scrcpy && function scrcpy
    if set -l serial (adb devices | tail -n +2 | awk '{print $1}' | fzf)
        run scrcpy --serial=$serial
    end
end

set -g fish_greeting
set -gx EDITOR nvim
type -q sccache && set -gx RUSTC_WRAPPER sccache
set -gx GDK_DPI_SCALE -1
set -gx GDK_SCALE 2
set -gx XCURSOR_SIZE 32
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 2
set -gx QT_ENABLE_HIGHDPI_SCALING 0
set -gx QT_SCALE_FACTOR 2
type -q kvantummanager && set -gx QT_STYLE_OVERRIDE kvantum

# input method
set -gx QT_IM_MODULE fcitx
set -gx GTK_IM_MODULE fcitx
set -gx XMODIFIERS "@im=fcitx"
set -gx XIM fcitx
set -gx XIM_PROGRAM fcitx
set -gx SDL_IM_MODULE fcitx
set -gx INPUT_METHOD fcitx
set -gx GLFW_IM_MODULE ibus

# firefox nvidia vaapi
set -gx MOZ_DISABLE_RDD_SANDBOX 1
set -gx LIBVA_DRIVER_NAME nvidia
set -gx __EGL_VENDOR_LIBRARY_FILENAMES /usr/share/glvnd/egl_vendor.d/10_nvidia.json

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

alias uvlocal "source .venv/bin/activate.fish"
alias uvglobal "source ~/.venv/bin/activate.fish"
alias get_idf "source /opt/esp-idf/export.fish"
alias fish_reload "source ~/.config/fish/config.fish; source ~/.config/fish/**/*.fish"
alias run_reflector "sudo reflector --verbose --threads 16 -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist"

fish_add_path ~/go/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin
fish_add_path ~/.config/fish/scripts
fish_add_path ~/docker/redroid

if status is-interactive
    vim_key_binding
    type -q atuin && atuin init fish --disable-up-arrow | source
    type -q tmux && tmux_auto_start
end
