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
	local tag = tonumber(ura.class.UraOutput:current():tags()[1]) - 1
	if tag < 1 then
		return
	end
	ura.class.UraOutput:current():set_tags({ tostring(tag) })
end)

ura.keymap.set("ctrl+right", function()
	local tag = tonumber(ura.class.UraOutput:current():tags()[1]) + 1
	ura.class.UraOutput:current():set_tags({ tostring(tag) })
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

ura.keymap.set("ctrl+shift+left", function()
	ura.cmd.move_to_prev()
end)

ura.keymap.set("ctrl+shift+right", function()
	ura.cmd.move_to_next()
end)

ura.keymap.set("super+shift+p", function()
	ura.api.spawn("uracil ~/.config/ura/scripts/dpms_off.lua")
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
	ura.api.spawn("foot -a fzfmenu -e fzfmenu -q 'wd '")
end)

ura.keymap.set("super+shift+m", function()
	ura.api.spawn([[
  id=$(ura-shell -c "print(ura.class.UraWindow:current().id)")
  tag=$(zenity --entry)
  [ -n "$tag" ] && ura-shell -c "ura.class.UraWindow:new($id):set_tags({ '$tag' })"
  ]])
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
