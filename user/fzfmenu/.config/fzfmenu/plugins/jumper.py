import os
import subprocess
import sys


def window_jump_picker():
    command = """
local wins = ura.api.get_all_windows()
for _, win in ipairs(wins) do
	local w = ura.class.UraWindow:new(win)
	print(w:app_id(), w:title(), ura.api.to_json(w:tags()), string.format("%.0f", w.id))
end
"""

    output = subprocess.check_output(
        f"ura shell -c '{command}'", shell=True, text=True
    ).strip()
    for line in output.splitlines():
        line = line.strip()
        if line.startswith("fzfmenu"):
            continue
        print(line)


def window_jump_runner(output: str):
    args = output.split(" ")
    id = args[-1]
    command = f"ura.class.UraWindow:new({id}):activate()"
    subprocess.call(f"ura shell -c '{command}'", shell=True)


def main():
    match sys.argv[1]:
        case "picker":
            window_jump_picker()
        case "runner":
            window_jump_runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
