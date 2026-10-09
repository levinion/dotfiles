vim.pack.add({
  { src = "https://github.com/gregorias/coerce.nvim" },
  { src = "https://github.com/gregorias/coop.nvim" },
})

require("coerce").setup({
  default_mode_mask = {
    normal_mode = true,
    motion_mode = false,
    visual_mode = false,
  },
})
