-- lazy.nvim
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy.nvim" })

-- curosr move
vim.keymap.set({ "n", "v", "o" }, "gh", "_", { desc = "Go left" })   -- gh to go to left
vim.keymap.set({ "n", "v", "o" }, "gl", "g_", { desc = "Go right" }) -- gl to go to right

-- editor action
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

-- window
vim.keymap.set({ "n", "v", "o" }, "<c-h>", "<c-w>h", { desc = "Switch to left" })
vim.keymap.set({ "n", "v", "o" }, "<c-l>", "<c-w>l", { desc = "Switch to right" })
vim.keymap.set({ "n", "v", "o" }, "<leader>wq", "<cmd>wq<cr>", { desc = "Save and quit" })

-- yazi
vim.keymap.set({ "n", "v", "o" }, "<leader>e", function() require("oil").toggle_float() end, { desc = "Toggle Oil" })

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

-- ## snacks picker ##

-- general
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep root" })
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.files() end, { desc = "Searc Files" })

-- buffer
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })

-- search
vim.keymap.set("n", "<leader>fj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Local Diagnostics" })
vim.keymap.set("n", "<leader>fD", function() Snacks.picker.diagnostics() end, { desc = "Root Diagnostics" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>ft", function() Snacks.picker.todo_comments() end, { desc = "TODO" })
vim.keymap.set("n", "<leader>fC", function() Snacks.picker.colorschemes() end, { desc = "Color Schemes" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.highlights() end, { desc = "highlights" })
vim.keymap.set("n", "<leader>fn", function() Snacks.picker.notifications() end, { desc = "Notifications" })
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.command_history() end, { desc = "Command History" })

-- lsp
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { desc = "Goto Reference" })
vim.keymap.set("n", "gt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
