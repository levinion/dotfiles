vim.pack.add({
	{ src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
	flavour = "mocha",
	term_colors = true,
})
vim.cmd.colorscheme("catppuccin")
