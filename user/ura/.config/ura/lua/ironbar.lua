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
	ura.api.spawn("start-ironbar")
end

function M.setup_hooks()
	ura.hook.set("focus-change", function()
		M.reload("app_id")
		M.reload("title")
	end)

	ura.hook.set("output-tags-change", function()
		M.reload("workspace")
	end)

	ura.hook.set("window-tags-change", function()
		M.reload("workspace")
	end)

	ura.hook.set("window-app_id-change", function()
		M.reload("app_id")
	end)

	ura.hook.set("window-title-change", function()
		M.reload("title")
	end)

	ura.hook.set("window-close", function()
		M.reload("app_id")
		M.reload("title")
	end)
end

return M
