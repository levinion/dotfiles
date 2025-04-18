function _tmux_init
    #nohup watchexec --workdir ~/.config/tmux/ -w ~/.config/tmux/tmux.conf tmux source-file ~/.config/tmux/tmux.conf >/dev/null 2>&1 &
    tmux
end

function _tmux_cleanup
    #ps aux | rg watchexec | rg tmux | awk '{print $2}' | xargs kill
    kill $fish_pid
end

function tmux_auto_start
    if not set -q TMUX
        #tmux attach >/dev/null || _tmux_init
        _tmux_init
        _tmux_cleanup
    end
end
