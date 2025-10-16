return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "stylua",
        "lua-language-server",
        -- bash
        "shfmt",
        "bash-language-server",
        -- python
        "pyright",
        "black",
        "ruff",
        -- go
        "gofumpt",
        "goimports",
        "gopls",
        -- config
        "json-lsp",
        "yaml-language-server",
        "taplo",
        -- frontend
        "css-lsp",
        "prettier",
        "vtsls",
        "tailwindcss-language-server",
        -- c/cpp
        "clangd",
        "cmakelang",
        "cmakelint",
        "codelldb",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- inline hint
      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
        underline = true,
        severity_sort = true,
        -- diagnostic icons
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          }
        },
      })

      -- enable inlay_hint for all buffers
      vim.lsp.inlay_hint.enable(true)

      -- load lang config
      require("utils").glob_require("lang")
    end
  },
}
