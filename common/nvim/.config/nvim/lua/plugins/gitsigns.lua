vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({
  on_attach = function(bufnr)
    return not vim.b[bufnr].bigfile
  end,
})
