# see: https://wiki.archlinux.org/title/MPRIS

import os
import subprocess
import sys


def picker(_):
    actions = ["play-pause", "next", "previous", "pause", "play"]
    players = subprocess.check_output(["playerctl", "-l"], text=True).splitlines()
    players.append("all")
    for player in players:
        for action in actions:
            print(f"{action} {player}")


def runner(output: str):
    args = output.split(" ")
    action = args[0]
    player = args[1]
    if player == "all":
        subprocess.call(["playerctl", "-a", action])
    else:
        subprocess.call(["playerctl", "-p", player, action])


def main():
    match sys.argv[1]:
        case "picker":
            picker(os.environ["FZFMENU_INPUT"])
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
