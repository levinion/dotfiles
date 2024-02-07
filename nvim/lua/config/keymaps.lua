-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "gh", "_", { desc = "Go left" })
vim.keymap.set("n", "gl", "g_", { desc = "Go right" })
vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Create a new line without quit normal mode" })
