return {
	"petertriho/nvim-scrollbar",
	dependencies = { "lewis6991/gitsigns.nvim" },
	opts = {
		handle = {
			color = "#7f849c",
		},
		handlers = {
			gitsigns = true, -- Requires gitsigns
		},
	},
}
