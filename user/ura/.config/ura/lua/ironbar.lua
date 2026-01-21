local M = {}

---@param module "workspace" | "title" | "app_id"
function M.reload(module)
	if module == "app_id" then
		ura.api.spawn("python ~/.config/ironbar/scripts/appindicator.py app_id")
		ura.api.spawn("python ~/.config/ironbar/scripts/appindicator.py title")
	elseif module == "title" then
		ura.api.spawn("python ~/.config/ironbar/scripts/appindicator.py title")
	elseif module == "workspace" then
		ura.api.spawn("python ~/.config/ironbar/scripts/workspace.py")
	end
end

function M.spawn()
	ura.api.spawn("ironbar")
	M.reload("workspace")
	M.reload("title")
	M.reload("app_id")
end

return M
