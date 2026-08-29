require("utils").require_all("plugins")

vim.keymap.set("n", "<leader>l", function()
	vim.pack.update()
end, { desc = "vim.pack update" })
