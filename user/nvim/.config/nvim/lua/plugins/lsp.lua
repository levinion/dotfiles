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
      local lspconfig = require("lspconfig")
      -- inline hint
      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
        underline = true,
      })
      -- diagnostic icons
      vim.fn.sign_define("DiagnosticSignError", { text = "" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "" })
      vim.fn.sign_define("DiagnosticSignInfo", { text = "" })
      -- clangd
      lspconfig.clangd.setup {
        cmd = {
          "clangd",
          "--clang-tidy",
          "--all-scopes-completion",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
          "--pch-storage=disk",
          "--log=error",
          "--j=12",
          "--background-index",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--query-driver=**",
          "--suggest-missing-includes",
          "--cross-file-rename",
          "--header-insertion-decorators",
        },
        init_options = {
          compilationDatabasePath = "./build",
        },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      }

      -- css
      lspconfig.cssls.setup {
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
      }
    end
  },
}
