return {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  opts = {
    delete_to_trash = true,
    watch_for_changes = true,
    view_options = {
      show_hidden = true,
    }
  },
}
