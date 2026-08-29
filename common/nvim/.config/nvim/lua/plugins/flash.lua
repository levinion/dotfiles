vim.pack.add({
	{ src = "https://github.com/folke/flash.nvim" },
})

require("flash").setup({})

vim.keymap.set({ "n", "v", "o" }, "J", function()
	require("flash").jump()
end, { desc = "Flash" })
