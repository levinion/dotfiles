vim.pack.add({
  { src = "https://github.com/rcarriga/nvim-notify" },
})

local notify = require("notify")

notify.setup({
  render = "wrapped-compact",
  stages = "fade_in_slide_out",
  timeout = 3000,
  max_width = 60,
  max_height = 20,
  fps = 30,
  top_down = false,
  background_colour = "#1e1e2e",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
  on_open = function(win)
    pcall(vim.api.nvim_win_set_config, win, { zindex = 100 })
    pcall(vim.api.nvim_set_option_value, "wrap", true, { win = win })
  end,
})

vim.notify = notify

vim.keymap.set("n", "<leader>un", function()
  notify.dismiss({ silent = true, pending = true })
end, { desc = "Dismiss notifications" })
