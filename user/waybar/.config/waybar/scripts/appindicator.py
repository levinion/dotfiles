#!/usr/bin/env python3

import subprocess
import sys


def main():
    param = sys.argv[1]
    output = subprocess.check_output(
        f"uracil -c 'local win=ura.win.get_current() if win then print(win.{param}) end'",
        shell=True,
        text=True,
    ).strip()
    max_length = 25
    print(output[0:max_length] + ("..." if len(output) > max_length else ""))


if __name__ == "__main__":
    main()
