alias vim=nvim
alias ls=eza
alias la="eza -a"
alias tree="eza -T"
alias grep=rg
alias fd="fd --absolute-path"
alias cat=bat
alias gdb="gdb -q"
alias e=exit
alias c=clear

alias faster-whisper="whisper-ctranslate2 --model large-v3 --output_format srt --temperature 0.6"
alias whisper="whisper --model large-v3 --output_format srt --temperature 0.6"
alias docker="sudo podman"
alias zb='cd $(git rev-parse --show-toplevel)'
alias trash=tr

alias switch-sink="wpctl status | grep vol | head -n -1 | fzf | sed 's/\*/ /' | sed 's/ //g' | sed 's/│//g' | awk -F '.' '{print $1}' | xargs wpctl set-default"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias firefox=firefox-developer-edition
alias v="python $ZDOTDIR/scripts/v.py"

alias uvlocal="source .venv/bin/activate.fish"
alias uvglobal="source ~/.venv/bin/activate.fish"
alias get_idf="source /opt/esp-idf/export.fish"
alias run_reflector="sudo reflector --verbose --threads 16 -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist"

# source conf.d/*
for file in $ZDOTDIR/conf.d/*; do
  source $file
done
unset file

zsh_add_path ~/go/bin
zsh_add_path ~/.local/bin
zsh_add_path ~/.cargo/bin
zsh_add_path ~/.yarn/bin
zsh_add_path ~/docker/redroid

zsh_load_plugin p10k
zsh_load_plugin autosuggestions
zsh_load_plugin completion
zsh_load_plugin atuin
zsh_load_plugin zoxide
zsh_load_plugin fzf-tab
zsh_load_plugin history-substring-search
zsh_load_plugin vim-mode
zsh_load_plugin fast-syntax-highlighting
