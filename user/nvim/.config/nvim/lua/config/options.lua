-- Options are automatically loaded before lazy.nvim startup

vim.g.mapleader = " "        -- set leader with <Space>
vim.g.maplocalleader = "\\"
vim.g.snacks_animate = false -- disable animation provided by snacks

local opt = vim.opt
opt.spell = false             -- disable spell
opt.swapfile = false          -- disable swapfile
opt.clipboard = "unnamedplus" -- sync clipboard with system
opt.expandtab = true          -- use space instead of tab
opt.tabstop = 2
opt.shiftwidth = 0            -- use 2 spaces instead of 4
opt.confirm = true            -- confirm before exit an editing buffer
opt.cursorline = true         -- highlight currentline
opt.number = true             -- show line number
opt.relativenumber = true     -- use relative line number
opt.wrap = false              -- disable wrap
opt.autoread = true           -- auto reload if file changed
opt.ignorecase = true         -- ignore case when searching
opt.smartcase = true          -- don't ignore case with capitals
opt.undofile = true           -- use undo file to save undo history
opt.undolevels = 10000        -- set undo level to a big value
opt.signcolumn = "yes"        -- always open signcolumn
