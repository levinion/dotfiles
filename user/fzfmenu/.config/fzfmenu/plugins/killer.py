import os
import subprocess
import sys


def picker(input: str):
    if len(input) == 0:
        return
    output = subprocess.check_output(f"pgrep -fa {input}", shell=True).strip().decode()
    for line in output.splitlines():
        if "fzfmenu" in line:
            continue
        print(line)


def runner(output: str):
    pid = output.split(" ")[0]
    subprocess.call(["kill", "-9", pid])


def main():
    match sys.argv[1]:
        case "picker":
            picker(os.environ["FZFMENU_INPUT"])
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
