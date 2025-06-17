if type -q zoxide
    zoxide init fish | source
end

if type -q fzf
    fzf --fish | source
end

if type -q arduino-cli
    arduino-cli completion fish | source
end
