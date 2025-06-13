alias vim=nvim
alias ls=eza
alias la="eza -a"
alias ll="eza -l"
alias tree="eza -T"
alias grep=rg
alias fd="fd --absolute-path"
alias cat="bat -p"
alias gdb="gdb -q"
alias e=exit
alias c=clear
alias copy="xclip -se c"
alias y=yazi
alias time="perf stat"
alias dl=trash

alias faster-whisper="whisper-ctranslate2 --model large-v3 --output_format srt --temperature 0.6"
alias whisper="whisper --model large-v3 --output_format srt --temperature 0.6"
alias docker="sudo podman"
alias gr='cd $(git rev-parse --show-toplevel)'
alias pacdiff="sudo -E pacdiff"

alias switch-sink="wpctl status | grep vol | head -n -1 | fzf | sed 's/\*/ /' | sed 's/ //g' | sed 's/│//g' | awk -F '.' '{print $1}' | xargs wpctl set-default"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias firefox=firefox-developer-edition

alias uvlocal="source .venv/bin/activate"
alias uvglobal="source ~/.venv/bin/activate"
alias get-idf="source /opt/esp-idf/export.sh"
alias run-reflector="sudo reflector --verbose --threads 16 -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist"
