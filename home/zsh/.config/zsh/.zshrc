zsh-load-plugin() {
  source $ZDOTDIR/plugins/$1.sh
}

zsh-load-config-dir(){
local file
for file in $ZDOTDIR/conf.d/*; do
  source $file
done
}

zsh-load-plugin p10k
zsh-load-plugin autosuggestions
zsh-load-plugin completion
zsh-load-plugin atuin
zsh-load-plugin zoxide
zsh-load-plugin fzf-tab
zsh-load-plugin history-substring-search
zsh-load-plugin vim-mode
zsh-load-plugin fast-syntax-highlighting

zsh-load-config-dir
