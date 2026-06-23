-- file manager
vim.keymap.set({ "n", "v", "o" }, "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
	-- require("fyler").toggle({ kind = "split_left_most" })
end, { desc = "Toggle FileManager" })

vim.keymap.set({ "n", "v", "o" }, "<leader>fy", "<cmd>Yazi<cr>", { desc = "Toggle Yazi" })
