local M = {}

---@param module "workspace" | "title" | "app_id"
function M.reload(module)
	if module == "app_id" then
		ura.api.spawn("ura-shell ~/.config/ironbar/scripts/appindicator.lua app_id")
	elseif module == "title" then
		ura.api.spawn("ura-shell ~/.config/ironbar/scripts/appindicator.lua title")
	elseif module == "workspace" then
		ura.api.spawn("ura-shell ~/.config/ironbar/scripts/workspace.lua")
	end
end

function M.spawn()
	ura.api.spawn("start-ironbar")
end

function M.setup_hooks()
	local opt = {
		priority = ura.g.priority.slow,
		ns = "ironbar",
	}

	ura.hook.add("focus-change", function()
		M.reload("app_id")
		M.reload("title")
	end, opt)

	ura.hook.add("output-tags-change", function()
		M.reload("workspace")
	end, opt)

	ura.hook.add("window-tags-change", function()
		M.reload("workspace")
	end, opt)

	ura.hook.add("window-app_id-change", function()
		M.reload("app_id")
	end, opt)

	ura.hook.add("window-title-change", function()
		M.reload("title")
	end, opt)

	ura.hook.add("window-close", function()
		M.reload("app_id")
		M.reload("title")
	end, opt)
end

return M
