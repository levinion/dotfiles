local util = require("lspconfig.util")
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        glsl_analyzer = {},
        arduino_language_server = {
          cmd = {
            "arduino-language-server",
            "-jobs",
            "0",
            "-clangd",
            "clangd",
            "-cli",
            "/usr/bin/arduino-cli",
            "-cli-config",
            vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn",
            "arduino:esp32:nano_nora",
          },
          filetypes = { "arduino" },
          root_dir = util.root_pattern("*.ino"),
          capabilities = {
            textDocument = {
              semanticTokens = vim.NIL,
            },
            workspace = {
              semanticTokens = vim.NIL,
            },
          },
        },
      },
    },
  },
}
