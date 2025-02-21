return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Ensure mason installs the server
        typst_lsp = {
          settings = {
            -- onType,onSave,never
            exportPdf = "never",
          },
        },
      },
    },
  },
  -- {
  --   "kaarmu/typst.vim",
  --   ft = "typst",
  --   lazy = false,
  -- },
  {
    "chomosuke/typst-preview.nvim",
    lazy = false, -- or ft = 'typst'
    version = "1.*",
    opts = {}, -- lazy.nvim will implicitly calls `setup {}`
  },
}
