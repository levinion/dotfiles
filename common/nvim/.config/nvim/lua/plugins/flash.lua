return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("flash").setup(opts)

		vim.keymap.set({ "n", "v", "o" }, "J", function()
			require("flash").jump()
		end, { desc = "Flash" })
	end,
}
