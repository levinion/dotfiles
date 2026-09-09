vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp",   version = vim.version.range("1.*") },
  { src = "https://github.com/saghen/blink.lib" },
  { src = "https://github.com/saghen/blink.pairs", version = vim.version.range("*") },
})

require('blink.pairs').download():pwait(60000)

require("vim._core.ui2").enable({})

require("blink.cmp").setup({
  completion = {
    documentation = { auto_show = true },
    ghost_text = { enabled = true },
  },
  signature = { enabled = true },
  sources = { default = { "path", "snippets", "buffer", "lsp" } },
  snippets = { preset = "default" },
  keymap = {
    preset = "super-tab",
    ["<C-y>"] = { "select_and_accept" },
  },
  cmdline = {
    keymap = { preset = "super-tab" },
    completion = { menu = { auto_show = true } },
  },
})

require("blink.pairs").setup(
  {
    mappings = {
      enabled = true,
      cmdline = true,
      disabled_filetypes = {},
      wrap = {
        ["<C-b>"] = "motion",
        ["<C-S-b>"] = "motion_reverse",
      },
      pairs = {},
    },
    highlights = {
      enabled = true,
      cmdline = true,
      groups = { "BlinkPairsOrange", "BlinkPairsPurple", "BlinkPairsBlue" },
      unmatched_group = "BlinkPairsUnmatched",
      matchparen = {
        enabled = true,
        cmdline = false,
        include_surrounding = false,
        group = "BlinkPairsMatchParen",
        priority = 250,
      },
    },
    debug = false,
  }
)
