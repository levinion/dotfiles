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

      -- clangd
      lspconfig.clangd.setup {
        keys = {
        },
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
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
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

      -- lua

      local library = {
        unpack(vim.api.nvim_get_runtime_file("", true)),
        "/usr/share/lua/5.1/",
        "/usr/share/lua/5.4/",
        "/usr/share/luajit-2.1/"
      }

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            workspace = { library = library },
            telemetry = { enable = false },
            diagnostics = {
              globals = { "vim", "_ura" },
            },
          },
        } }

      -- bash

      lspconfig.bashls.setup {
        filetypes = { "sh", "bash", "zsh" },
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command|.zshrc)"
          }
        }
      }
    end
  },
}
