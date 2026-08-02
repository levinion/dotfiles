vim.pack.add({ "https://github.com/folke/lazy.nvim.git" })

require("options")
require("plugin")
require("utils").require_all("keymaps")
require("utils").require_all("autocmds")
