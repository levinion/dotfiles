function alias_if
    if type -q $argv[1]
        alias $argv[2] $argv[3]
    end
end
