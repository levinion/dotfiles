#!/usr/bin/env python

import subprocess
import argparse

setup_list = [
    "i3-gaps-rounded-git",
    "polybar",
    "neovim",
    "picom",
    "alacritty",
    "rofi",
    "fish",
    "fisher",
    "dunst",
]

dot_table = {
    "i3": "~/.config/i3",
    "polybar": "~/.config/polybar",
    "nvim": "~/.config/nvim",
    "picom": "~/.config/picom",
    "alacritty": "~/.config/alacritty",
    "rofi": "~/.config/rofi",
    "fish": "~/.config/fish",
    "dunst": "~/.config/dunst",
    "fontconfig": "~/.config/fontconfig",
}


def main():
    parser = argparse.ArgumentParser()
    subparser = parser.add_subparsers(dest="command")

    sync_parser = subparser.add_parser(
        "sync", help="Get dotfiles from actual config file/dirs"
    )
    sync_parser.set_defaults(func=sync)

    commit_parser = subparser.add_parser(
        "commit", help="Commit changes to config files"
    )
    commit_parser.add_argument(
        "item",
        help="Optional: choose an item to commit, or commit all",
        nargs="?",
        type=str,
    )
    commit_parser.set_defaults(func=commit)

    setup_parser = subparser.add_parser(
        "setup", help="Setup packages and commit changes to config files"
    )
    setup_parser.set_defaults(func=setup)

    args = parser.parse_args()
    args.func(args)


def sync(_):
    for k, v in dot_table.items():
        print(f"sync {k}...")
        subprocess.call(f"rsync -a --delete {v} .", shell=True)


def commit(args):
    match args.item:
        case None:
            confirm("write to all config dirs? ")
            for k, v in dot_table.items():
                subprocess.call(f"rsync -a --delete ./{k}/ {v}", shell=True)
                print("success!")
        case _:
            item = args.item
            if item in dot_table:
                confirm(f"write to {dot_table[item]}? ")
                subprocess.call(
                    f"rsync -a --delete ./{item}/ {dot_table[item]}", shell=True
                )
                print("success!")
            else:
                print(f"{item} not found!")


def setup(args):
    cmds = ["paru", "-S", "--needed"] + setup_list
    subprocess.call(" ".join(cmds), shell=True)
    commit(args)


def confirm(msg: str):
    content = input(msg + "[y,n]: ")
    if content.strip() not in ["y", ""]:
        exit(0)


if __name__ == "__main__":
    main()
