require("lazy").setup({
	spec = {
		require("utils").require_all("plugins"),
	},
	checker = { enabled = false },
})

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy.nvim" })
