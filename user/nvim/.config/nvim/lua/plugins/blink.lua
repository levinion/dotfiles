return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  event = "VeryLazy",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = { "path", "snippets", "buffer", "lsp" },
    },
    keymap = {
      preset = "super-tab",
      ["<C-y>"] = { "select_and_accept" },
    },
    cmdline = {
      keymap = {
        preset = "super-tab",
      },
      completion = {
        menu = {
          auto_show = true,
        },
      },
    }
  },
}
