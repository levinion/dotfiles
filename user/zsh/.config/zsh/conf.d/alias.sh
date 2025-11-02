exists nvim && {
  alias vim=nvim
  alias vr='nvim -c "set readonly"'
}
exists eza && {
  alias ls=eza
  alias la="eza -a"
  alias ll="eza -l"
  alias tree="eza -T"
}
exists rg && alias grep=rg
exists fd && alias fd="fd --absolute-path -E /snapshots"
exists gdb && alias gdb="gdb -q"
alias e=exit
alias c=clear
alias pfkill="pkill --signal 9"
exists yazi && alias y=yazi
exists perf && alias time="perf stat"
exists trash && alias dl=trash

exists whisper-ctranslate2 && alias faster-whisper="whisper-ctranslate2 --model large-v3 --output_format srt --temperature 0.6"
exists whisper && alias whisper="whisper --model large-v3 --output_format srt --temperature 0.6"
exists podman && ! exists docker && alias docker="sudo podman"

exists git && {
  alias gr='cd $(git rev-parse --show-toplevel)'
  alias gp="git push"
  alias fastpush="git commit -am update && git push origin main"
}

exists pacdiff && alias pacdiff="sudo -E pacdiff"

exists grub-mkconfig && alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
exists firefox-developer-edition && ! exists firefox && alias firefox=firefox-developer-edition

exists uv && {
  alias uvlocal="source .venv/bin/activate"
  alias uvglobal="source ~/.venv/bin/activate"
}
[[ -f "/opt/esp-idf/export.sh" ]] && alias get-idf="source /opt/esp-idf/export.sh"
[[ -f /opt/miniconda3/etc/profile.d/conda.sh ]] && alias get-conda="source /opt/miniconda3/etc/profile.d/conda.sh"
exists reflector && alias run-reflector="sudo reflector --verbose --threads 16 -l 100 -p https --sort rate --save /etc/pacman.d/mirrorlist"

alias nv-smooth-motion="env NVPRESENT_ENABLE_SMOOTH_MOTION=1"
