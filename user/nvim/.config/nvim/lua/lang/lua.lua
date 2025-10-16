-- lua
local library = {
	vim.env.VIMRUNTIME,
	"/usr/share/ura/runtime/",
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			workspace = { library = library },
			telemetry = { enable = false },
			diagnostics = {
				globals = { "vim", "ura", "Snacks" },
			},
		},
	},
})
