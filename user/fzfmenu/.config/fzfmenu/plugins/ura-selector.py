import json
import os
import subprocess
import sys


def picker(input: str):
    windows = json.loads(
        subprocess.check_output(["ura-cmd", "show-windows"], text=True).strip()
    )
    tags = []
    for _, w in windows.items():
        for tag in w["tags"]:
            if tag not in tags:
                tags.append(tag)
                print(tag)
    print(input)


def runner(output: str):
    subprocess.call(
        ["ura-shell", "-c", f"ura.class.UraOutput:current():select('{output}')"]
    )


def main():
    match sys.argv[1]:
        case "picker":
            picker(os.environ["FZFMENU_INPUT"])
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
