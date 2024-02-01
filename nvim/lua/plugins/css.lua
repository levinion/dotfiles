return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {
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
      },
    },
  },
}
