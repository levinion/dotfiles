vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "luasnip" and (ev.data.kind == "install" or ev.data.kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") },
})

require("luasnip.loaders.from_snipmate").lazy_load()
