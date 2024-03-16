-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "gh", "_", { desc = "Go left" })
vim.keymap.set({ "n", "v" }, "gl", "g_", { desc = "Go right" })
vim.keymap.set("n", "gj", "o<Esc>", { desc = "Go down" })
vim.keymap.set("n", "gk", "O<Esc>", { desc = "Go up" })
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "save current buffer" })
vim.keymap.set("n", "<leader>tf", "<cmd>! typstfmt %<CR>", { desc = "format typst file" })
vim.keymap.set("n", "<leader>tr", "<cmd>! nohup okular % > /dev/null 2>&1 &<CR>", { desc = "review pdf using okular" })
