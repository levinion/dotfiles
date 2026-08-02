return {
	{
		"levinion/gh-markdown-preview.nvim",
		dependencies = { "selimacerbas/live-server.nvim" },
		config = function()
			require("gh_markdown_preview").setup({})

			vim.keymap.set(
				"n",
				"<leader>mb",
				"<cmd>GhMarkdownPreview<cr>",
				{ desc = "Toggle markview view in browser" }
			)
		end,
	},
}
