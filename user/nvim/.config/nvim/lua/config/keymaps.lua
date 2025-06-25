-- lazy.nvim
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy.nvim" })

-- curosr move
vim.keymap.set({ "n", "v", "o" }, "gh", "_", { desc = "Go left" })   -- gh to go to left
vim.keymap.set({ "n", "v", "o" }, "gl", "g_", { desc = "Go right" }) -- gl to go to right

-- editor action
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })
vim.keymap.set({ "n", "v", "o" }, "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit" })

-- window
vim.keymap.set({ "n", "v", "o" }, "<c-h>", "<c-w>h", { desc = "Switch to left" })
vim.keymap.set({ "n", "v", "o" }, "<c-l>", "<c-w>l", { desc = "Switch to right" })
vim.keymap.set({ "n", "v", "o" }, "<c-j>", "<c-w>j", { desc = "Switch to below" })
vim.keymap.set({ "n", "v", "o" }, "<c-k>", "<c-w>k", { desc = "Switch to upper" })

-- file manager
vim.keymap.set({ "n", "v", "o" }, "<leader>e", function() require("yazi").toggle() end, { desc = "Toggle Yazi" })

-- flash
vim.keymap.set({ "n", "v", "o" }, "s",
  function()
    require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
  end, { desc = "Leap before" })

vim.keymap.set({ "n", "v", "o" }, "S",
  function()
    require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
  end, { desc = "Leap after" })

-- lsp
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason" })
vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
vim.keymap.set("n", "<leader>cr", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "<leader>cd", function() vim.diagnostic.open_float() end, { desc = "Code diagnostic" })

-- others
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason" })

-- ## snacks picker ##

-- general
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep root" })
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, { desc = "Search Files" })

-- buffer
vim.keymap.set("n", "<leader>bx", "<cmd>q<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bv", "<c-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>bV", "<c-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>bj", "<c-w>J", { desc = "Move to far bottom" })
vim.keymap.set("n", "<leader>bk", "<c-w>K", { desc = "Move to far top" })
vim.keymap.set("n", "<leader>bh", "<c-w>H", { desc = "Move to far left" })
vim.keymap.set("n", "<leader>bl", "<c-w>L", { desc = "Move to far right" })

-- search
vim.keymap.set("n", "<leader>fj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Local Diagnostics" })
vim.keymap.set("n", "<leader>fD", function() Snacks.picker.diagnostics() end, { desc = "Root Diagnostics" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>fC", function() Snacks.picker.colorschemes() end, { desc = "Color Schemes" })
vim.keymap.set("n", "<leader>fn", function() Snacks.picker.notifications() end, { desc = "Notifications" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>fH", function() Snacks.picker.help() end, { desc = "Help" })

-- lsp
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "Goto Reference" })
vim.keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
