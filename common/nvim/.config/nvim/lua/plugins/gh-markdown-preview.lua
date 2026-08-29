vim.pack.add({
	{ src = "https://github.com/levinion/gh-markdown-preview.nvim" },
	{ src = "https://github.com/selimacerbas/live-server.nvim" },
})

require("gh_markdown_preview").setup({})

vim.keymap.set("n", "<leader>mb", "<cmd>GhMarkdownPreview<cr>", { desc = "Render markdown in browser" })
vim.keymap.set("n", "<leader>mt", "<cmd>GhMarkdownPreviewThemeToggle<cr>", { desc = "Toggle markdown theme" })
