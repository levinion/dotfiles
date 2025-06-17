return {
  'nvim-lualine/lualine.nvim',
  dependencies = { { "echasnovski/mini.icons" } },
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
    },
    extensions = { "nvim-tree" },
    sections = {
      lualine_b = { "branch", "diff" },
      lualine_x = {
        "filesize",
        "encoding",
        "filetype",
      },
    },
  },
}
