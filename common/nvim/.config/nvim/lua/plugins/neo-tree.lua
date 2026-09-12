vim.pack.add({
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
})

require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    position = "left",
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_by_name = {
        ".git",
        ".DS_Store",
      },
      hide_by_pattern = {
        "*.pdf",
      },
    },
  },
})

vim.keymap.set({ "n", "v", "o" }, "<leader>e", function()
  require("neo-tree.command").execute({ toggle = true })
end, { desc = "Toggle FileManager" })
