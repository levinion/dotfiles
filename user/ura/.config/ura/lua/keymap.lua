ura.keymap.set("super+t", function()
	ura.api.spawn("foot")
end)

ura.keymap.set("super+w", function()
	ura.api.spawn("firefox-nightly")
end)

ura.keymap.set("super+e", function()
	ura.api.spawn("foot -a yazi -e yazi")
end)

ura.keymap.set("super+q", function()
	ura.class.UraWindow:current():close()
end)

ura.keymap.set("super+space", function()
	ura.api.spawn("foot -a fzfmenu -e fzfmenu")
end)

ura.keymap.set("alt+space", function()
	ura.class.UraWindow:current():toggle_layout("floating")
end)

ura.keymap.set("super+shift+e", function()
	ura.api.terminate()
end)

ura.keymap.set("super+shift+r", function()
	ura.api.reload()
end)

ura.keymap.set("super+f", function()
	ura.class.UraWindow:current():toggle_layout("fullscreen")
end)

ura.keymap.set("ctrl+left", function()
	local tags = ura.fn.natural_sort(
		ura.fn.unique({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", unpack(ura.fn.collect_tags()) })
	)
	print(ura.api.to_json(tags))
	local active_tag = ura.class.UraOutput:current():tags()[1]
	local index = ura.fn.find(tags, active_tag)
	if index - 1 >= 1 then
		ura.class.UraOutput:current():set_tags({ tags[index - 1] })
	end
end)

ura.keymap.set("ctrl+right", function()
	local tags = ura.fn.natural_sort(
		ura.fn.unique({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", unpack(ura.fn.collect_tags()) })
	)
	local active_tag = ura.class.UraOutput:current():tags()[1]
	local index = ura.fn.find(tags, active_tag)
	if index + 1 <= #tags then
		ura.class.UraOutput:current():set_tags({ tags[index + 1] })
	end
end)

ura.keymap.set("ctrl+alt+left", function()
	local tags = ura.fn.collect_tags()
	print(ura.api.to_json(tags))
	local active_tag = ura.class.UraOutput:current():tags()[1]
	local index = ura.fn.find(tags, active_tag)
	if index - 1 >= 1 then
		ura.class.UraOutput:current():set_tags({ tags[index - 1] })
	end
end)

ura.keymap.set("ctrl+alt+right", function()
	local tags = ura.fn.collect_tags()
	local active_tag = ura.class.UraOutput:current():tags()[1]
	local index = ura.fn.find(tags, active_tag)
	if index + 1 <= #tags then
		ura.class.UraOutput:current():set_tags({ tags[index + 1] })
	end
end)

ura.keymap.set("super+h", function()
	ura.cmd.focus_left()
end)

ura.keymap.set("super+l", function()
	ura.cmd.focus_right()
end)

ura.keymap.set("super+j", function()
	ura.cmd.focus_down()
end)

ura.keymap.set("super+k", function()
	ura.cmd.focus_up()
end)

ura.keymap.set("super+shift+p", function()
	ura.api.spawn("ura-shell -c 'ura.class.UraOutput:current():set_dpms(false)'")
end)

ura.keymap.set("super+p", function()
	ura.api.spawn("rmpc togglepause")
end)

ura.keymap.set("alt+a", function()
	ura.api.spawn("screenshot")
end)

ura.keymap.set("super+shift+o", function()
	ura.api.spawn("screencapture")
end)

ura.keymap.set("super+m", function()
	ura.api.spawn("foot -a fzfmenu -e fzfmenu -q 'wdi '")
end)

ura.keymap.set("super+shift+m", function()
	ura.class.UraWindow:current():set_tags({})
end)

ura.keymap.set("XF86AudioRaiseVolume", function()
	ura.api.spawn("volume -i 5")
end)

ura.keymap.set("XF86AudioLowerVolume", function()
	ura.api.spawn("volume -d 5")
end)

ura.keymap.set("XF86MonBrightnessUp", function()
	ura.api.spawn("brightness -i 5")
end)

ura.keymap.set("XF86MonBrightnessDown", function()
	ura.api.spawn("brightness -d 5")
end)

ura.keymap.set("super+shift+s", function()
	ura.api.spawn("swaylock -f -i ~/.config/ura/assets/bg.jpg")
end)

for i = 1, 9 do
	ura.keymap.set("super+" .. tostring(i), function()
		ura.class.UraOutput:current():set_tags({ tostring(i) })
	end)
end

ura.keymap.set("super+0", function()
	ura.class.UraOutput:current():set_tags({ "10" })
end)

ura.keymap.set("super+n", function()
	local i = 1
	while 1 do
		local tags = ura.fn.collect_tags()
		if not ura.fn.find(tags, tostring(i)) then
			ura.class.UraOutput:current():set_tags({ tostring(i) })
			break
		end
		i = i + 1
	end
end)

ura.keymap.set("super+r", function()
	ura.api.spawn("bash ~/.config/ura/scripts/rename-workspace.sh")
end)

ura.keymap.set("super+g", function()
	for _, tag in ipairs(ura.fn.collect_tags()) do
		if not tonumber(tag) then
			ura.class.UraOutput:current():set_tags({ tag })
			break
		end
	end
end)
