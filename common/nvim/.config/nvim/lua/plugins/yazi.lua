vim.pack.add({
  { src = "https://github.com/mikavilpas/yazi.nvim" },
})

vim.g.loaded_netrwPlugin = 1

require("yazi").setup({
  open_for_directories = true,
})

vim.keymap.set({ "n", "v", "o" }, "<leader>e", "<cmd>Yazi<cr>", { desc = "Toggle FileManager" })
