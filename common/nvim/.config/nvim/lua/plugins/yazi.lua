vim.pack.add({
	{ src = "https://github.com/mikavilpas/yazi.nvim" },
})

vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
	open_for_directories = false,
})

vim.keymap.set({ "n", "v", "o" }, "<leader>fy", "<cmd>Yazi<cr>", { desc = "Toggle Yazi" })
