vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  { src = "https://github.com/neovim-treesitter/treesitter-parser-registry" },
})

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("TreesitterConfig", { clear = true }),
  callback = function(ev)
    -- Reapply window-local folding when switching buffers or opening a split.
    vim.wo.foldmethod = "manual"
    vim.wo.foldexpr = "0"
    if vim.bo[ev.buf].buftype ~= "" or vim.b[ev.buf].bigfile then
      pcall(vim.treesitter.stop, ev.buf)
      return
    end
    if pcall(vim.treesitter.start, ev.buf) then
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
