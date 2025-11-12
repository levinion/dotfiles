-- file manager
vim.keymap.set({ "n", "v", "o" }, "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle FileManager" })
