#!/usr/bin/python3

import subprocess


def workspaces():
    active = ""
    inactive = ""
    index = int(
        subprocess.check_output(
            [
                "ura-shell",
                "-c",
                "local ws=ura.api.get_current_workspace() if ws then print(ura.api.get_workspace_index(ws)) end",
            ],
            text=True,
        ).strip()
    )
    command = """
             local output=ura.api.get_current_output()
             assert(output)
             local workspaces=ura.api.get_indexed_workspaces(output)
             print(#workspaces)
"""
    number = int(
        subprocess.check_output(
            ["ura-shell", "-c", command],
            text=True,
        ).strip()
    )
    workspaces = [inactive] * number
    workspaces[index] = active + "  " + str(index)
    return "  ".join(workspaces)


def main():
    subprocess.call(["ironbar", "var", "set", "workspace", workspaces()])


if __name__ == "__main__":
    main()
