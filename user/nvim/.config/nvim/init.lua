vim.pack.add({ "https://github.com/folke/lazy.nvim.git" })

require("config.options")

require("lazy").setup({
	spec = {
		require("utils").require_all("plugins"),
	},
	checker = { enabled = false },
})

require("config.keymaps")
require("config.autocmds")
