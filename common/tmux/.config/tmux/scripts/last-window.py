import subprocess


def main():
    index = (
        subprocess.check_output(
            "tmux list-windows | tail -1 | awk -F ':' '{print $1}'", shell=True
        )
        .strip()
        .decode()
    )
    subprocess.run(f"tmux select-window -t {index}", shell=True)


if __name__ == "__main__":
    main()
