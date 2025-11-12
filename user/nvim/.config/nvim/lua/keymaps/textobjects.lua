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
