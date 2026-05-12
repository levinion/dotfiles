vim.keymap.set({ "n", "v", "o" }, "<c-h>", "<c-w>h", { desc = "Switch to left" })
vim.keymap.set({ "n", "v", "o" }, "<c-l>", "<c-w>l", { desc = "Switch to right" })
vim.keymap.set({ "n", "v", "o" }, "<c-j>", "<c-w>j", { desc = "Switch to below" })
vim.keymap.set({ "n", "v", "o" }, "<c-k>", "<c-w>k", { desc = "Switch to upper" })

vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

vim.keymap.set("n", "<leader>bx", "<cmd>q<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bv", "<c-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>bV", "<c-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>bj", "<c-w>J", { desc = "Move to far bottom" })
vim.keymap.set("n", "<leader>bk", "<c-w>K", { desc = "Move to far top" })
vim.keymap.set("n", "<leader>bh", "<c-w>H", { desc = "Move to far left" })
vim.keymap.set("n", "<leader>bl", "<c-w>L", { desc = "Move to far right" })

-- alias
vim.keymap.set("n", "<leader>wx", "<cmd>q<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>wv", "<c-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>wV", "<c-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>wj", "<c-w>J", { desc = "Move to far bottom" })
vim.keymap.set("n", "<leader>wk", "<c-w>K", { desc = "Move to far top" })
vim.keymap.set("n", "<leader>wh", "<c-w>H", { desc = "Move to far left" })
vim.keymap.set("n", "<leader>wl", "<c-w>L", { desc = "Move to far right" })

vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save buffer" })

-- smart-splits
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)
-- swapping buffers between windows
-- vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
-- vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
-- vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
-- vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)
