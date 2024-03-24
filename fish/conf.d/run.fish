function run
    nohup $argv >/dev/null 2>&1 &
end

function fork
    if test (count $argv) -eq 1
        if test -f $argv[1]
            run alacritty --working-directory (dirname $argv[1])
        else
            run alacritty --working-directory $argv[1]
        end
    else
        run alacritty --working-directory $(pwd)
    end
end

function search
    run xdg-open "https://www.google.com.hk/search?q=$argv"
end
