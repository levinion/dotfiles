import subprocess
import sys
import os


def main():
    argv = sys.argv
    if len(argv) == 1:
        fzf()
    elif argv[1] == "menu":
        menu()
    elif argv[1] == "run":
        run(" ".join(argv[2:]))


def menu():
    kill_plugin_menu()
    print("tmux new-window")
    print("tmux kill-pane")
    print("tmux kill-session")
    print("tmux kill-server")
    print("tmux split-window")


def run(cmd):
    subprocess.run(cmd, shell=True)


def fzf():
    path = os.path.realpath(__file__)
    subprocess.run(
        f"fzf --bind 'start:reload:python {path} menu' \
             --bind 'enter:become(nohup python {path} run {{}} > /dev/null 2>&1 &)'",
        shell=True,
    )


def kill_plugin_menu():
    # Only with single session, so this one is not needed
    # session_index = (
    #     subprocess.check_output(
    #         "tmux list-sessions | awk -F':' '{print $1}'", shell=True
    #     )
    #     .strip()
    #     .decode()
    # )
    # for index in session_index.splitlines():
    #     print(f"tmux kill-session -t {index}")
    #     print(f"tmux select-session -t {index}")

    window_index = (
        subprocess.check_output(
            "tmux list-windows | awk -F':' '{print $1}'", shell=True
        )
        .strip()
        .decode()
    )
    for index in window_index.splitlines():
        print(f"tmux kill-window -t {index}")
        print(f"tmux select-window -t {index}")

    pane_index = (
        subprocess.check_output("tmux list-panes | awk -F':' '{print $1}'", shell=True)
        .strip()
        .decode()
    )
    for index in pane_index.splitlines():
        print(f"tmux kill-pane -t {index}")
        print(f"tmux select-pane -t {index}")


if __name__ == "__main__":
    main()
