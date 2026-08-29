vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.surround", version = vim.version.range("*") },
})

require("mini.surround").setup({
	mappings = {
		add = "sa",
		delete = "sd",
		replace = "sr",
	},
})
