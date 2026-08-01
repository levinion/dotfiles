local status, _ = pcall(function()
	local win = ura.class.UraWindow:current()
	assert(win)
	local prop = nil
	if arg[1] == "app_id" then
		prop = win:app_id()
	elseif arg[1] == "title" then
		prop = win:title()
	end
	assert(prop)
	ura.api.spawn(string.format("ironbar var set '%s' '%s'", arg[1], prop))
end)

if not status then
	ura.api.spawn(string.format("ironbar var set '%s' ''", arg[1]))
end
