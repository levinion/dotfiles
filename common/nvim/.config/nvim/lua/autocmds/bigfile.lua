local BIGFILE_SIZE = 512 * 1024

vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function(ev)
    local path = vim.api.nvim_buf_get_name(ev.buf)
    if path == "" then return end
    local ok, stat = pcall(vim.uv.fs_stat, path)
    if not ok or not stat or stat.size < BIGFILE_SIZE then return end

    vim.b[ev.buf].bigfile = true
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(ev.buf) then return end
      vim.bo[ev.buf].swapfile = false
      vim.bo[ev.buf].undolevels = -1
      vim.wo.foldmethod = "manual"
      vim.wo.statuscolumn = ""
      vim.wo.conceallevel = 0
      vim.wo.list = false
      vim.cmd("syntax off")
      pcall(vim.treesitter.stop, ev.buf)
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
        pcall(vim.lsp.buf_detach_client, ev.buf, client.id)
      end
      vim.notify(
        string.format("Big file (%d KB), optimizations applied", math.floor(stat.size / 1024)),
        vim.log.levels.WARN
      )
    end)
  end,
  desc = "Big file optimization",
})
