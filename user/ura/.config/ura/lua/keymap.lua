ura.keymap.set({ "super+t" }, function()
	ura.api.spawn("foot")
end)

ura.keymap.set({ "super+w" }, function()
	ura.api.spawn("firefox-nightly")
end)

ura.keymap.set({ "super+e" }, function()
	ura.api.spawn("foot -a yazi -e yazi")
end)

ura.keymap.set({ "super+shift+r" }, function()
	ura.cmd.reload()
end)

ura.keymap.set({ "super+q" }, function()
	ura.class.UraWindow:current():close()
end)

ura.keymap.set({ "super+space" }, function()
	ura.api.spawn("foot -a fzfmenu -e fzfmenu")
end)

ura.keymap.set({ "alt+space" }, function()
	ura.class.UraWindow:current():toggle_layout("floating")
end)

ura.keymap.set({ "super+shift+e" }, function()
	ura.api.terminate()
end)

ura.keymap.set({ "super+f" }, function()
	ura.class.UraWindow:current():toggle_layout("fullscreen")
end)

ura.keymap.set({ "super+shift+f" }, function()
	ura.class.UraWindow:current():toggle_layout("maximize")
end)

ura.keymap.set({ "ctrl+left", "super+wheelup" }, function()
	local blk = ura.class.UraBlock:current()[1]
	assert(blk)
	if blk.index > 1 then
		blk.index = blk.index - 1
		ura.class.UraOutput:current():set_tags({ blk:tag() })
	end
end)

ura.keymap.set({ "ctrl+right", "super+wheeldown" }, function()
	local blk = ura.class.UraBlock:current()[1]
	assert(blk)
	blk.index = blk.index + 1
	ura.class.UraOutput:current():set_tags({ blk:tag() })
end)

ura.keymap.set({ "ctrl+shift+left" }, function()
	local blk = ura.class.UraBlock:current()[1]
	assert(blk)
	if blk.index > 1 then
		blk.index = blk.index - 1
		ura.class.UraWindow:current():set_tags({ blk:tag() })
		ura.class.UraOutput:current():set_tags({ blk:tag() })
	end
end)

ura.keymap.set({ "ctrl+shift+right" }, function()
	local blk = ura.class.UraBlock:current()[1]
	assert(blk)
	blk.index = blk.index + 1
	ura.class.UraWindow:current():set_tags({ blk:tag() })
	ura.class.UraOutput:current():set_tags({ blk:tag() })
end)

ura.keymap.set({ "ctrl+alt+left", "super+mouseside" }, function()
	local seg = ura.class.UraSegment:current()[1]
	assert(seg)
	local segs = ura.class.UraSegment:all()
	local index = ura.fn.find(segs, function(v)
		return v == seg
	end)
	assert(index)
	if index > 1 then
		ura.class.UraOutput:current():set_tags({ segs[index - 1]:active_block():tag() })
	end
end)

ura.keymap.set({ "ctrl+alt+right", "super+mouseextra" }, function()
	local seg = ura.class.UraSegment:current()[1]
	assert(seg)
	local segs = ura.class.UraSegment:all()
	local index = ura.fn.find(segs, function(v)
		return v == seg
	end)
	assert(index)
	if index < #segs then
		ura.class.UraOutput:current():set_tags({ segs[index + 1]:active_block():tag() })
	end
end)

ura.keymap.set({ "super+h" }, function()
	ura.cmd.focus_left()
end)

ura.keymap.set({ "super+l" }, function()
	ura.cmd.focus_right()
end)

ura.keymap.set({ "super+j" }, function()
	ura.cmd.focus_down()
end)

ura.keymap.set({ "super+k" }, function()
	ura.cmd.focus_up()
end)

ura.keymap.set({ "super+shift+p" }, function()
	ura.api.spawn("ura-shell -c 'ura.class.UraOutput:current():set_dpms(false)'")
end)

ura.keymap.set({ "super+p" }, function()
	ura.api.spawn("rmpc togglepause")
end)

ura.keymap.set({ "alt+a" }, function()
	ura.api.spawn("screenshot")
end)

ura.keymap.set({ "super+shift+o" }, function()
	ura.api.spawn("screencapture")
end)

ura.keymap.set({ "super+m" }, function()
	ura.api.spawn("foot -a fzfmenu -e fzfmenu -q 'wdi '")
end)

ura.keymap.set({ "super+shift+m" }, function()
	ura.class.UraWindow:current():set_tags({})
end)

ura.keymap.set({ "XF86AudioRaiseVolume" }, function()
	ura.api.spawn("volume -i 5")
end)

ura.keymap.set({ "XF86AudioLowerVolume" }, function()
	ura.api.spawn("volume -d 5")
end)

ura.keymap.set({ "XF86MonBrightnessUp" }, function()
	ura.api.spawn("brightness -i 5")
end)

ura.keymap.set({ "XF86MonBrightnessDown" }, function()
	ura.api.spawn("brightness -d 5")
end)

ura.keymap.set({ "super+shift+s" }, function()
	ura.api.spawn("swaylock -f -i ~/.config/ura/assets/bg.jpg")
end)

for i = 1, 10 do
	local key = i == 10 and "0" or tostring(i)
	ura.keymap.set({ "super+" .. key }, function()
		local output = ura.class.UraOutput:current()
		assert(output)
		local blk = ura.class.UraBlock:from_tag(output:tags()[1])
		assert(blk)
		blk.index = i
		output:set_tags({ blk:tag() })
	end)
end
