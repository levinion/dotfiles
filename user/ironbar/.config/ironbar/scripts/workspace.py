#!/usr/bin/python3

import json
import subprocess


def workspaces():
    active = ""
    inactive = ""
    command = """
local current = ura.class.UraOutput:current():tags()

local index = nil
for _, tag in ipairs(current) do
	if tonumber(tag) then
		index = tonumber(tag)
		break
	end
end

local max = index or 0

local named = {}
local checkd = {}

local wins = ura.class.UraWindow:all()
for _, win in ipairs(wins) do
	local tags = win:tags()
	for _, tag in ipairs(tags) do
		local i = tonumber(tag)
		if i then
			if i > max then
				max = i
			end
		else
			if not checkd[tag] then
				table.insert(named, tag)
				checkd[tag] = true
			end
		end
	end
end

print(ura.api.to_json({
	current = current,
	sum = max,
	named = named,
}))
"""

    j = json.loads(
        subprocess.check_output(
            ["ura-shell", "-c", command],
            text=True,
        ).strip()
    )
    current: list[str] = j["current"]
    sum: int = j["sum"]
    named: list[str] = sorted(j["named"])
    output = [inactive] * sum

    for tag in current:
        if tag.isnumeric():
            output[int(tag) - 1] = active + "  " + tag

    if named:
        output.append(" | ")

    for tag in named:
        if tag in current:
            output.append(active + "  " + tag)
        else:
            output.append(tag)

    return "  ".join(output)


def main():
    subprocess.call(["ironbar", "var", "set", "workspace", workspaces()])


if __name__ == "__main__":
    main()
