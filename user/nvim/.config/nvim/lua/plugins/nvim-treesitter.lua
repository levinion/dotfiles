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
      "json", "jsonc", "toml", "xml", "yaml", "ini",
      "c", "cpp",
      "rust", "ron",
      "go", "gomod", "gowork", "gosum",
      "ninja", "rst",
    },
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = vim.fn.executable("tree-sitter") == 1,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
