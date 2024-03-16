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
  {
    "kaarmu/typst.vim",
    ft = "typst",
    lazy = false,
  },
}
