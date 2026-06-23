import os
import subprocess
import sys
import json


def picker():
    output = subprocess.check_output("pw-dump").strip().decode()
    data = json.loads(output)
    for obj in data:
        try:
            if obj["info"]["props"]["media.class"] != "Audio/Sink":
                continue
            id = obj["id"]
            name = obj["info"]["props"]["node.description"]
            print(id, name)
        except Exception:
            continue


def runner(output: str):
    output_ = output.split(" ")
    id = output_[0]
    name = " ".join(output_[1:])
    subprocess.call(["notify-send", f"Active: `{name}`"])
    subprocess.call(["wpctl", "set-default", id])


def main():
    match sys.argv[1]:
        case "picker":
            picker()
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
