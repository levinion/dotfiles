function fcd
    cd $(fd -H \.+ $argv -t d | fzf)
end

function fvim
    cd $(fd -H .\+ $argv | fzf)
    vim .
end

function fmkdir
    fcd $argv[1]
    mkdir $argv[2]
    cd $argv[2]
end

function fls
    ls $argv | fzf
end

function fgrep
    grep $argv | fzf
end
