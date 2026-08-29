vim.pack.add({
	{ src = "https://github.com/petertriho/nvim-scrollbar" },
})

require("scrollbar").setup({
	handle = { color = "#7f849c" },
	handlers = { gitsigns = true },
})
