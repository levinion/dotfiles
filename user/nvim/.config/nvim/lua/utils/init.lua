local M = {}

function M.glob_require(package)
	local _base_lua_path = vim.fn.stdpath("config") .. "/lua/"
	local glob_path = _base_lua_path .. package .. "/*.lua"

	for _, path in pairs(vim.split(vim.fn.glob(glob_path), "\n")) do
		-- ~/.config/nvim/lua/<package>/<module>.lua => <package>/<module>
		local module = path:gsub(_base_lua_path, ""):gsub("%.lua$", ""):gsub("/", ".")
		local module_name = module:match("([^.]+)$")
		if module_name and module_name:sub(1, 1) ~= "_" then
			require(module)
		end
	end
end

return M
