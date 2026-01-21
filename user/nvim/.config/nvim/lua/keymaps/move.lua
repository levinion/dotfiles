-- curosr move
vim.keymap.set({ "n", "v", "o" }, "gh", "_", { desc = "Go left" }) -- gh to go to left
vim.keymap.set({ "n", "v", "o" }, "gl", "g_", { desc = "Go right" }) -- gl to go to right

-- block
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
