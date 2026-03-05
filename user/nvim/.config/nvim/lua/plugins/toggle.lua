return {
	"leblocks/toggle.nvim",
	config = function()
		require("toggle").setup({
			-- Include built-in toggle pairs (default: true)
			defaults = true,

			-- Restore cursor position after toggling a word (default: true)
			keep_cursor_position = true,

			-- Additional toggle pairs (merged with defaults)
			mappings = {
				{ "yes", "no" },
				{ "foo", "bar", "baz" }, -- cycles: foo → bar → baz → foo
			},
		})
	end,
}
