vim.lsp.config("bashls", {
  filetypes = { "sh", "bash", "zsh" },
  settings = {
    bashIde = {
      globPattern = "*@(.sh|.inc|.bash|.command|.zshrc|.zshprofile)",
    },
  },
})

vim.lsp.enable("bashls")
