--toml
vim.lsp.config("taplo", {
  settings = {
    root_markers = { ".git", "*.toml" },
  },
})

vim.lsp.enable("taplo")
