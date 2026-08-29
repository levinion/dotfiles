vim.lsp.config("cssls", {
  filetypes = { "css", "scss", "less" },
  settings = {
    -- ignore warning when using tailwindcss
    css = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
})
