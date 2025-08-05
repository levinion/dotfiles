#!/usr/bin/python3

import subprocess


def main():
    active = ""
    inactive = ""
    index = int(
        subprocess.check_output(
            "uracil -c 'print(ura.ws.get_current().index)'", shell=True, text=True
        ).strip()
    )
    number = int(
        subprocess.check_output(
            "uracil -c 'print(ura.ws.size())'", shell=True, text=True
        ).strip()
    )
    workspaces = [inactive] * number
    workspaces[index] = active
    print("  ".join(workspaces))


if __name__ == "__main__":
    main()
