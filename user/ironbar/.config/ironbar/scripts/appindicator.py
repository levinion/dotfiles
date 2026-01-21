#!/usr/bin/python3

import subprocess
import sys


def get_prop(prop):
    command = f"""
        pcall(function()
        local win = ura.api.get_current_window()
        assert(win)
        local prop = ura.api["get_window_{prop}"](win)
        assert(prop)
        local max = 30
        if param ~= "app_id" and #prop >= max then
            prop = string.sub(prop, 1, max) .. "..."
        end
        print(prop)
        end)
"""
    return subprocess.check_output(
        ["ura-shell", "-c", command],
        text=True,
    ).strip()


def main():
    subprocess.call(["ironbar", "var", "set", sys.argv[1], get_prop(sys.argv[1])])


if __name__ == "__main__":
    main()
