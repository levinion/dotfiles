vim.pack.add({
  { src = "https://github.com/mrcjkb/rustaceanvim", version = vim.version.range("^9") },
  { src = "https://github.com/saecki/crates.nvim",  version = "stable" },
})

vim.g.rustaceanvim = {
  server = {
    default_settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          buildScripts = { enable = true },
        },
        checkOnSave = true,
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
        diagnostics = {
          disabled = { "unresolved-proc-macro", "needless_return", "proc-macro-disabled" },
        },
      },
    },
  },
}

require("crates").setup({
  lsp = {
    enabled = true,
    completion = true,
    actions = true,
  },
})
