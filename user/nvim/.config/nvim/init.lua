vim.pack.add({ "https://github.com/folke/lazy.nvim.git" })

require("options")

require("lazy").setup({
	spec = {
		require("utils").require_all("plugins"),
	},
	checker = { enabled = false },
})

require("utils").require_all("keymaps")
require("utils").require_all("autocmds")
