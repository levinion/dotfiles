#!/usr/bin/python3

import subprocess


def main():
    active = ""
    inactive = ""
    index = int(
        subprocess.check_output(
            "ura shell -c 'local ws=ura.api.get_current_workspace() if ws then print(ura.api.get_workspace_index(ws)) end'",
            shell=True,
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
            f"ura shell -c '{command}'",
            shell=True,
            text=True,
        ).strip()
    )
    workspaces = [inactive] * number
    workspaces[index] = active + "  " + str(index)
    print("  ".join(workspaces))


if __name__ == "__main__":
    main()
