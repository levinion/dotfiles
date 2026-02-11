import os
import subprocess
import sys


def picker():
    for i in ["start", "restart", "stop"]:
        print(i)


def runner(output: str):
    cmd = ["systemctl", "--user", output, "sing-box.service"]
    subprocess.call(["notify-send", "fzfmenu", " ".join(cmd)])
    subprocess.call(cmd)


def main():
    match sys.argv[1]:
        case "picker":
            picker()
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
