return {
	"A7Lavinraj/fyler.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	enabled = false,
	opts = {
		views = {
			finder = {
				close_on_select = false,
				delete_to_trash = true,
				confirm_simple = false,
				watcher = {
					enabled = true,
				},
				win = {
					kind = "split_left_most",
					kinds = {
						split_left_most = {
							width = "30",
							win_opts = {
								winfixwidth = true,
							},
						},
					},
				},
			},
		},
	},
}
