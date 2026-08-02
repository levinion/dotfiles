return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
	config = function()
		require("treesj").setup({
			use_default_keymaps = false,
		})

		vim.keymap.set("n", "<leader>ct", function()
			require("treesj").toggle()
		end, { desc = "Toggle code block" })

		vim.keymap.set("n", "<leader>cs", function()
			require("treesj").split()
		end, { desc = "Split code block" })

		vim.keymap.set("n", "<leader>cj", function()
			require("treesj").join()
		end, { desc = "Join code block" })
	end,
}
