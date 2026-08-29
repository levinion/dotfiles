vim.pack.add({
  { src = "https://github.com/catgoose/nvim-colorizer.lua" },
})

require("colorizer").setup({
  parsers = { css = true },
})
