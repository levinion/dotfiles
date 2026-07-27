vim.keymap.set("n", "<leader>ms", "<cmd>Markview splitToggle<CR>", { desc = "Toggle markview split" })
vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<CR>", { desc = "Toggle markview" })
vim.keymap.set("n", "<leader>mb", function()
  local peek = require('peek')
  if peek.is_open() then
    peek.close()
  else
    peek.open()
  end
end, { desc = "Toggle markview view in browser" })
