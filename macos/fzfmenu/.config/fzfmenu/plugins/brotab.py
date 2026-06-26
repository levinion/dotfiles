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
    id = output.split("\t")[0]
    subprocess.call(["brotab", "activate", id, "--focused"])


def main():
    match sys.argv[1]:
        case "picker":
            picker()
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
