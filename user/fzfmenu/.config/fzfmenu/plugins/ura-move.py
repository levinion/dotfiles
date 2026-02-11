import json
import os
import subprocess
import sys


def picker():
    windows = json.loads(
        subprocess.check_output(["ura-cmd", "show-windows"], text=True).strip()
    )

    output_tags = subprocess.check_output(
        [
            "ura-shell",
            "-c",
            "print(ura.api.to_json(ura.class.UraOutput:current():tags()))",
        ],
        text=True,
    ).strip()

    for id, w in windows.items():
        tags = json.dumps(w["tags"])
        if tags == output_tags:
            continue
        print(" ".join([w["app_id"], w["title"], tags, id]))


def runner(output: str):
    args = output.split(" ")
    id = args[-1]
    command = (
        f"ura.class.UraWindow:new({id}):set_tags(ura.class.UraOutput:current():tags())"
    )
    subprocess.check_output(["ura-shell", "-c", command], text=True).strip()


def main():
    match sys.argv[1]:
        case "picker":
            picker()
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
