return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  version = false,
  branch = 'master',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      "bash",
      "diff",
      "lua", "luadoc", "luap",
      "markdown", "markdown_inline",
      "printf",
      "python",
      "query", "regex",
      "javascript", "jsdoc", "html", "tsx", "typescript",
      "vim", "vimdoc",
      "json", "jsonc", "toml", "xml", "yaml",
      "c", "cpp",
      "rust", "ron",
      "go", "gomod", "gowork", "gosum",
      "python", "ninja", "rst",
    },
    highlight = { enable = true },
    indent = { enable = true },
  }
}
