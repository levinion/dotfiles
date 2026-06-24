import json
import os
import subprocess
import sys


def picker(input: str):
    windows = json.loads(
        subprocess.check_output(["ura-cmd", "show-windows"], text=True).strip()
    )
    tags = []
    for w in windows:
        for tag in w["tags"]:
            if tag not in tags:
                tags.append(tag)
                print(tag)
    print(input)


def runner(output: str):
    v = output.split(":")
    if len(v) < 2 or not v[-1].isdigit():
        output += ":1"
    subprocess.call(
        ["ura-shell", "-c", f"ura.class.UraOutput:current():set_tags({{'{output}'}})"]
    )


def main():
    match sys.argv[1]:
        case "picker":
            picker(os.environ["FZFMENU_INPUT"])
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
