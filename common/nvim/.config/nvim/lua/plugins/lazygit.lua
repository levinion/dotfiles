vim.pack.add({
  { src = "https://github.com/kdheepak/lazygit.nvim" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
