return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		close_if_last_window = true,
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					".git",
					".DS_Store",
				},
				hide_by_pattern = {
					"*.pdf",
				},
			},
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)

		vim.keymap.set({ "n", "v", "o" }, "<leader>e", function()
			require("neo-tree.command").execute({ toggle = true })
			-- require("fyler").toggle({ kind = "split_left_most" })
		end, { desc = "Toggle FileManager" })
	end,
}
