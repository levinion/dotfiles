pcall(function()
	local param = arg[1]
	assert(param)

	local win = ura.api.get_current_window()
	assert(win)
	local prop = ura.api["get_window_" .. param](win)
	assert(prop)
	if #prop >= 25 then
		prop = string.sub(prop, 1, 25) .. "..."
	end
	print(prop)
end)
