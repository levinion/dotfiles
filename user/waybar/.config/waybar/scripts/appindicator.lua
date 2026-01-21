pcall(function()
	local param = arg[1]
	assert(param)
	local win = ura.api.get_current_window()
	assert(win)
	local prop = ura.api["get_window_" .. param](win)
	assert(prop)
	local max = 30
	if param ~= "app_id" and #prop >= max then
		prop = string.sub(prop, 1, max) .. "..."
	end
	print(prop)
end)
