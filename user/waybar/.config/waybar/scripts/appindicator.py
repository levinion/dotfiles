#!/usr/bin/env python3

import subprocess


def main():
    output = subprocess.check_output(
        "uracil -c 'local win=ura.win.get_current() if win then print(win.app_id) end'",
        shell=True,
        text=True,
    ).strip()
    print(output)


if __name__ == "__main__":
    main()
