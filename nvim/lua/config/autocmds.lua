-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Autosave while leave buf
-- vim.api.nvim_create_autocmd({ "BufLeave" }, {
--   pattern = { "*" },
--   command = "silent! wa",
--   nested = true,
-- })

-- Switch to English while esc pressed. (only for fcitx5)
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, {
--   pattern = { "*" },
--   callback = function()
--     local input_status = tonumber(vim.fn.system("fcitx5-remote"))
--     if input_status == 2 then
--       vim.fn.system("fcitx5-remote -c")
--     end
--   end,
-- })

-- Do not auto comment after a comment
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- Disable auto spell for some file types like markdown
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typst" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "rust" },
  callback = function()
    require("mini.pairs").unmap("i", "'", "''")
  end,
})

-- wgsl
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.wgsl",
  callback = function()
    vim.bo.filetype = "wgsl"
  end,
})
