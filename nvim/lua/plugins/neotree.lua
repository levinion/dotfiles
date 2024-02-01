return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = false,
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
      },
    },
  },
}
