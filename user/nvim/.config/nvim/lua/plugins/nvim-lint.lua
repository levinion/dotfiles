return {
  "mfussenegger/nvim-lint",
  opts = {
    events = { "BufWritePost" },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd(opts.events, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
  end
}
