#!/usr/bin/env python

import subprocess
import argparse

dot_table = {
    "i3": "~/.config/i3",
    "polybar": "~/.config/polybar",
    "nvim": "~/.config/nvim",
    "picom": "~/.config/picom",
    "alacritty": "~/.config/alacritty",
    "rofi": "~/.config/rofi",
    "fish": "~/.config/fish",
}


def main():
    parser = argparse.ArgumentParser()
    subparser = parser.add_subparsers(dest="command")
    update_parser = subparser.add_parser(
        "update", help="Get dotfiles from actual config file/dirs"
    )
    update_parser.set_defaults(func=update)
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
    args = parser.parse_args()
    args.func(args)


def update(_):
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


def confirm(msg: str):
    content = input(msg + "[y,n]: ")
    if content.strip() not in ["y", ""]:
        exit(0)


if __name__ == "__main__":
    main()
