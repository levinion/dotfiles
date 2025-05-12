source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

zstyle ':fzf-tab:*' fzf-flags --bind=tab:accept

# _zsh_keybinding_tab() {
#   if [[ -z $(zsh_complete $LBUFFER) ]]; then
#     zle autosuggest-accept
#   else
#     zle fzf-tab-complete
#   fi
# }
#
# zle -N _zsh_keybinding_tab
# bindkey '^I' _zsh_keybinding_tab
