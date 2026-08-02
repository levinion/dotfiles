return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/snacks.nvim",
	},
	opts = {
		open_for_directories = false,
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function(_, opts)
		require("yazi").setup(opts)
		vim.keymap.set({ "n", "v", "o" }, "<leader>fy", "<cmd>Yazi<cr>", { desc = "Toggle Yazi" })
	end,
}
