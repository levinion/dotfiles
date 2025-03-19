return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        glsl_analyzer = {},
        arduino_language_server = {
          cmd = {
            vim.fn.expand("~/go/bin/arduino-language-server"),
            "-clangd",
            "clangd",
            "-cli",
            "/usr/bin/arduino-cli",
            "-cli-config",
            vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
            "-fqbn",
            "arduino:esp32:nano_nora",
          },
        },
      },
    },
  },
}
