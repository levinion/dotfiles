eval "$(atuin init zsh --disable-up-arrow)"

# local ATUIN_SEARCH_INDEX=-1
# local ATUIN_SEARCH_KEYWORD=""
#
# _atuin_reset(){
#   ATUIN_SEARCH_INDEX=-1
#   ATUIN_SEARCH_KEYWORD=""
# }
#
# _atuin_up_arrow() {
#   zle autosuggest-clear
#   if ((ATUIN_SEARCH_INDEX == -1)); then
#     ATUIN_SEARCH_KEYWORD=$BUFFER
#   fi
#
#   ATUIN_SEARCH_INDEX=$((ATUIN_SEARCH_INDEX + 1))
#   OUTPUT=$(atuin search $ATUIN_SEARCH_KEYWORD --limit 1 --offset $ATUIN_SEARCH_INDEX --cmd-only --search-mode prefix)
#
#   if [[ -z "$OUTPUT" ]]; then
#     ATUIN_SEARCH_INDEX=-1
#     ATUIN_SEARCH_INDEX=$((ATUIN_SEARCH_INDEX + 1))
#     OUTPUT=$(atuin search $ATUIN_SEARCH_KEYWORD --limit 1 --offset $ATUIN_SEARCH_INDEX --cmd-only --search-mode prefix)
#   fi
#
#   LBUFFER="$OUTPUT"
# }
#
# zle -N _atuin_up_arrow
# bindkey '^[[A' _atuin_up_arrow
#
# _atuin_down_arrow() {
#   if ((ATUIN_SEARCH_INDEX <= 0)); then
#     _atuin_reset
#     zle autosuggest-clear
#     LBUFFER=""
#     return
#   fi
#   ATUIN_SEARCH_INDEX=$((ATUIN_SEARCH_INDEX - 1))
#   LBUFFER=$(atuin search $ATUIN_SEARCH_KEYWORD --limit 1 --offset $ATUIN_SEARCH_INDEX --cmd-only --search-mode prefix)
# }
#
# zle -N _atuin_down_arrow
# bindkey '^[[B' _atuin_down_arrow
#
# _atuin_accept() {
#   _atuin_reset
#   zle accept-line
# }
#
# zle -N _atuin_accept
# bindkey '^M' _atuin_accept
#
# _atuin_clear() {
#   _atuin_reset
#   zle backward-kill-line
# }
#
# zle -N _atuin_clear
# bindkey '^U' _atuin_clear
#
# ZSH_AUTOSUGGEST_STRATEGY=(atuin completion)
