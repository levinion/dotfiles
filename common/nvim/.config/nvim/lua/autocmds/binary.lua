vim.api.nvim_create_autocmd("BufReadCmd", {
  pattern = { "*.png", "*.jpg", "*.jpeg", "*.pdf", "*.gif", "*.bmp", "*.exr" },
  callback = function(args)
    local bufnr = args.buf

    vim.bo[bufnr].buftype = "nofile"
    vim.bo[bufnr].bufhidden = "hide"
    vim.bo[bufnr].swapfile = false

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {
      "<Binary File>"
    })

    vim.bo[bufnr].readonly = true
    vim.bo[bufnr].modifiable = false
  end
})
