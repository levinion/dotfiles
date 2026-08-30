vim.lsp.config("cssls", {
  settings = {
    css = { lint = { unknownAtRules = "ignore" } },
    scss = { lint = { unknownAtRules = "ignore" } },
    less = { lint = { unknownAtRules = "ignore" } },
  },
})

vim.lsp.enable("cssls")
