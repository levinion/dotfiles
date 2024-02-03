alias shut "shutdown -h now"
alias vim nvim
alias la "ls -a"
alias hx helix
alias pc proxychains

set -g fish_greeting
set -gx EDITOR nvim
set -gx RUSTC_WRAPPER sccache
set -gx GDK_DPI_SCALE 0.5
set -gx GDK_SCALE 2

fish_add_path ~/go/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.yarn/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end
