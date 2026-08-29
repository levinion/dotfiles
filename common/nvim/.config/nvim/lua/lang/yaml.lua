vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      format = { trailingComma = false },
    },
  },
})

vim.lsp.enable("yamlls")
