-- treesj
vim.keymap.set("n", "<leader>ct", function()
	require("treesj").toggle()
end, { desc = "Toggle code block" })

vim.keymap.set("n", "<leader>cs", function()
	require("treesj").split()
end, { desc = "Split code block" })

vim.keymap.set("n", "<leader>cj", function()
	require("treesj").join()
end, { desc = "Join code block" })
