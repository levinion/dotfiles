import json
import os
import subprocess
import sys


def picker():
    windows = json.loads(
        subprocess.check_output(["ura-cmd", "show-windows"], text=True).strip()
    )
    for w in windows:
        try:
            tags = json.dumps(w["tags"])
            print(" ".join([w["app_id"], w["title"], tags, str(w["id"])]))
        except Exception as e:
            print(e)


def runner(output: str):
    args = output.split(" ")
    id = args[-1]
    command = f"ura.class.UraWindow:new({id}):activate()"
    subprocess.check_output(["ura-shell", "-c", command], text=True).strip()


def main():
    match sys.argv[1]:
        case "picker":
            picker()
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
