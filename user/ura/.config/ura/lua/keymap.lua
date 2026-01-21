ura.keymap.set("super+t", function()
	ura.api.spawn("foot")
end)

ura.keymap.set("super+w", function()
	ura.api.spawn("firefox-nightly")
end)

ura.keymap.set("super+e", function()
	ura.api.spawn("foot -e yazi")
end)

ura.keymap.set("super+q", function()
	ura.cmd.close()
end)

ura.keymap.set("super+space", function()
	ura.api.spawn("foot -a fzfmenu -e fzfmenu")
end)

ura.keymap.set("alt+space", function()
	ura.cmd.toggle_layout("floating")
end)

ura.keymap.set("super+shift+e", function()
	ura.api.terminate()
end)

ura.keymap.set("super+shift+r", function()
	ura.api.reload()
end)

ura.keymap.set("super+f", function()
	ura.cmd.toggle_layout("fullscreen")
end)

ura.keymap.set("ctrl+left", function()
	ura.cmd.switch_prev()
end)

ura.keymap.set("ctrl+right", function()
	ura.cmd.switch_next()
end)

ura.keymap.set("ctrl+shift+left", function()
	ura.cmd.move_to_prev()
end)

ura.keymap.set("ctrl+shift+right", function()
	ura.cmd.move_to_next()
end)

-- for i = 0, 9 do
-- 	ura.keymap.set("super+" .. i, function()
-- 		ura.ws.switch_or_create(i)
-- 	end)
-- 	ura.keymap.set("super+shift" .. i, function()
-- 		local win = ura.win.get_current()
-- 		if not win then
-- 			return
-- 		end
-- 		ura.win.move_to_workspace_or_create(win.index, i)
-- 	end)
-- end

ura.keymap.set("super+shift+p", function()
	ura.api.spawn("uracil ~/.config/ura/scripts/dpms_off.lua")
end)

ura.keymap.set("super+p", function()
	ura.api.spawn("rmpc togglepause")
end)

ura.keymap.set("alt+a", function()
	ura.api.spawn("screenshot")
end)

ura.keymap.set("super+shift+m", function()
	local win = ura.api.get_current_window()
	local scratchpad = ura.api.get_named_workspace("scratchpad")
	if scratchpad == nil then
		ura.api.create_named_workspace("scratchpad")
		scratchpad = ura.api.get_named_workspace("scratchpad")
	end
	if win and scratchpad then
		ura.api.move_window_to_workspace(win, scratchpad)
	end
end)

ura.keymap.set("super+m", function()
	ura.api.spawn("foot -a fzfmenu -e fzfmenu -q 'wd scratchpad '")
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
