vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/echasnovski/mini.icons" },
})

require("lualine").setup({
	options = {
		theme = "auto",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
	},
	extensions = { "nvim-tree" },
	sections = {
		lualine_b = { "branch", "diff" },
		lualine_x = {
			"filesize",
			"encoding",
			"filetype",
		},
	},
})
