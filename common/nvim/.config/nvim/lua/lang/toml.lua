--toml
vim.lsp.config("taplo", {
  filetypes = { "toml" },
  settings = {
    root_markers = { ".git", "*.toml" },
  },
})
