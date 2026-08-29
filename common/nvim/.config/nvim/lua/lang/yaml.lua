vim.lsp.config("yamlls", {
  filetypes = { "yaml" },
  settings = {
    yaml = {
      format = { trailingComma = false },
    },
  },
})
