if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.config//zsh//.p10k.zsh ]] || source ~/.config//zsh//.p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# export POWERLEVEL9K_SHOW_RULER=false
# export POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
# export POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=''
# export POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=''
# export POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=''
# export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
