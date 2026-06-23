vim.keymap.set({ "n", "v", "o" }, "J", function()
	require("flash").jump()
end, { desc = "Flash" })
