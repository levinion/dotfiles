import os
import subprocess
import sys


def picker():
    output = subprocess.check_output(["brotab", "list"], text=True).strip()
    for line in output.splitlines():
        v = line.split("\t")
        id = v[0]
        title = v[1]
        print("\t".join([id, title]))


def runner(output: str):
    info = output.split("\t")
    id = info[0]
    title = info[1]
    subprocess.call(["brotab", "activate","--focused", id])

    # since --focused activate but not change current space, use hs to change space
    subprocess.call(["hs", os.path.expandvars("$HOME/.config/fzfmenu/plugins/brotab/focus.lua"), title])


def main():
    match sys.argv[1]:
        case "picker":
            picker()
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
