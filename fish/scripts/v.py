#! /usr/bin/python3

import os
import subprocess
import sys


def main():
    argv = sys.argv
    _target = os.getcwd() if len(argv) == 1 else argv[1]
    target = os.path.abspath(_target)
    if os.access(target, os.W_OK):
        subprocess.run(f"nvim {target}", shell=True)
    else:
        subprocess.run(f"sudoedit {target}", shell=True)


if __name__ == "__main__":
    main()
