-- add-on manager
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "lazy.nvim" })
vim.keymap.set("n", "<leader>cm", "<cmd>Mason<CR>", { desc = "Mason" })

-- curosr move
vim.keymap.set({ "n", "v", "o" }, "gh", "_", { desc = "Go left" }) -- gh to go to left
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

-- buffer
vim.keymap.set("n", "<leader>bx", "<cmd>q<cr>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bv", "<c-w>v", { desc = "Split vertically" })
vim.keymap.set("n", "<leader>bV", "<c-w>s", { desc = "Split horizontally" })
vim.keymap.set("n", "<leader>bj", "<c-w>J", { desc = "Move to far bottom" })
vim.keymap.set("n", "<leader>bk", "<c-w>K", { desc = "Move to far top" })
vim.keymap.set("n", "<leader>bh", "<c-w>H", { desc = "Move to far left" })
vim.keymap.set("n", "<leader>bl", "<c-w>L", { desc = "Move to far right" })

-- file manager
vim.keymap.set({ "n", "v", "o" }, "<leader>e", function()
	require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle FileManager" })

-- flash
vim.keymap.set({ "n", "v", "o" }, "s", function()
	require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
end, { desc = "Leap before" })

vim.keymap.set({ "n", "v", "o" }, "S", function()
	require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
end, { desc = "Leap after" })

-- treesj
vim.keymap.set("n", "<leader>ct", function()
	require("treesj").toggle()
end, { desc = "Toggle code block" })

vim.keymap.set("n", "<leader>cs", function()
	require("treesj").split()
end, { desc = "Split code block" })

vim.keymap.set("n", "<leader>cj", function()
	require("treesj").join()
end, { desc = "Join code block" })

-- textobjects

vim.keymap.set({ "n", "x", "o" }, "]f", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, { desc = "Next function start" })

vim.keymap.set({ "n", "x", "o" }, "]F", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, { desc = "Next function end" })

vim.keymap.set({ "n", "x", "o" }, "]c", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, { desc = "Next class start" })

vim.keymap.set({ "n", "x", "o" }, "]C", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, { desc = "Next class end" })

vim.keymap.set({ "n", "x", "o" }, "]p", function()
	require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
end, { desc = "Next parameter start" })

vim.keymap.set({ "n", "x", "o" }, "]P", function()
	require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.inner", "textobjects")
end, { desc = "Next parameter end" })

vim.keymap.set({ "n", "x", "o" }, "[f", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, { desc = "Previous function start" })

vim.keymap.set({ "n", "x", "o" }, "[F", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, { desc = "Previous function end" })

vim.keymap.set({ "n", "x", "o" }, "[c", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, { desc = "Previous class start" })

vim.keymap.set({ "n", "x", "o" }, "[C", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, { desc = "Previous class end" })

vim.keymap.set({ "n", "x", "o" }, "[p", function()
	require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
end, { desc = "Previous parameter start" })

vim.keymap.set({ "n", "x", "o" }, "[P", function()
	require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.inner", "textobjects")
end, { desc = "Previous parameter end" })

vim.keymap.set({ "n", "x", "o" }, "]]", function()
	require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
end)
vim.keymap.set({ "n", "x", "o" }, "[[", function()
	require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
end)

-- lsp
vim.keymap.set("n", "<leader>cl", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
vim.keymap.set("n", "<leader>cd", function()
	vim.diagnostic.open_float()
end, { desc = "Code diagnostic" })
vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- ## snacks picker ##

-- general
vim.keymap.set("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep root" })
vim.keymap.set("n", "<leader><space>", function()
	Snacks.picker.files()
end, { desc = "Search Files" })

-- file
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })

-- search
vim.keymap.set("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Local Diagnostics" })
vim.keymap.set("n", "<leader>sD", function()
	Snacks.picker.diagnostics()
end, { desc = "Root Diagnostics" })
vim.keymap.set("n", "<leader>sc", function()
	Snacks.picker.commands()
end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sC", function()
	Snacks.picker.colorschemes()
end, { desc = "Color Schemes" })
vim.keymap.set("n", "<leader>sn", function()
	Snacks.picker.notifications()
end, { desc = "Notifications" })
vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sH", function()
	Snacks.picker.help()
end, { desc = "Help" })

-- lsp
vim.keymap.set("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "Goto Reference" })
vim.keymap.set("n", "gt", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
