exists nvim && alias vim=nvim
exists eza && {
  alias ls=eza
  alias la="eza -a"
  alias ll="eza -l"
  alias tree="eza -T"
}
exists rg && alias grep=rg
exists fd && alias fd="fd --absolute-path"
exists bat && alias cat="bat -p"
exists gdb && alias gdb="gdb -q"
alias e=exit
alias c=clear
exists xclip && alias ccopy="xclip -se c"
exists xclip && alias cpaste="xclip -se c -o"
exists yazi && alias y=yazi
exists perf && alias time="perf stat"
exists trash && alias dl=trash

exists whisper-ctranslate2 && alias faster-whisper="whisper-ctranslate2 --model large-v3 --output_format srt --temperature 0.6"
exists whisper && alias whisper="whisper --model large-v3 --output_format srt --temperature 0.6"
exists podman && ! exists docker && alias docker="sudo podman"
exists git && alias gr='cd $(git rev-parse --show-toplevel)'
exists pacdiff && alias pacdiff="sudo -E pacdiff"

exists wpctl && alias switch-sink="wpctl status | grep vol | head -n -1 | fzf | sed 's/\*/ /' | sed 's/ //g' | sed 's/│//g' | awk -F '.' '{print $1}' | xargs wpctl set-default"
exists grub-mkconfig && alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
exists firefox-developer-edition && alias firefox=firefox-developer-edition

exists uv && {
  alias uvlocal="source .venv/bin/activate"
  alias uvglobal="source ~/.venv/bin/activate"
}
alias get-idf="source /opt/esp-idf/export.sh"
exists reflector && alias run-reflector="sudo reflector --verbose --threads 16 -l 200 -p https --sort rate --save /etc/pacman.d/mirrorlist"
