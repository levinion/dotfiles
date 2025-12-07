-- lsp
vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
vim.keymap.set("n", "<leader>cd", function()
	vim.diagnostic.open_float()
end, { desc = "Code diagnostic" })
vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
