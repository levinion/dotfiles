function fh
    if test $(count $argv) -eq 1
        fd --base-directory $argv | fzf
    else
        fd --base-directory ~ | fzf
    end
end

function fcd
    cd $(fd \.+ $argv -t d | fzf)
end

function fvim
    set file $(fd .\+ $argv | fzf)
    and if test -f $file
        vim $file
    else
        cd $file && vim .
    end
    or return 0
end

function fls
    ls $argv | fzf
end

function fgrep
    grep $argv | fzf
end
