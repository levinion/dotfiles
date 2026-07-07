import subprocess


def main():
    index = (
        subprocess.check_output(
            "tmux list-windows | rg active | awk -F ':' '{print $1}'", shell=True
        )
        .strip()
        .decode()
    )
    subprocess.run(
        f"tmux select-window -t {int(index)+1} || tmux new-window", shell=True
    )


if __name__ == "__main__":
    main()
