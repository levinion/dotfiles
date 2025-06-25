return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "folke/snacks.nvim"
  },
  opts = {
    open_for_directories = true,
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
