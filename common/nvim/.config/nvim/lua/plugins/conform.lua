vim.pack.add({
  { src = "https://github.com/stevearc/conform.nvim" },
})

vim.g.autoformat = true

require("conform").setup({
  format_on_save = function(bufnr)
    if vim.g.autoformat then
      local disable_filetypes = {}
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = "never"
      else
        lsp_format_opt = "fallback"
      end
      return {
        timeout_ms = 500,
        lsp_format = lsp_format_opt,
      }
    else
      return
    end
  end,
})

vim.keymap.set("n", "<leader>cf", function()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify("Format on Save: " .. (vim.g.autoformat and "ON" or "OFF"))
end, { desc = "Toggle Format on Save" })
