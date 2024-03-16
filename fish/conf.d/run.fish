function run
    nohup $argv >/dev/null 2>&1 &
end

function fork
    run alacritty --working-directory $(pwd)
end

function search
    run xdg-open "https://www.google.com.hk/search?q=$argv"
end
