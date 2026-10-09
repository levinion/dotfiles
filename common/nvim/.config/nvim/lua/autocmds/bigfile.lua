local BIGFILE_SIZE = 512 * 1024
local group = vim.api.nvim_create_augroup("BigFileConfig", { clear = true })

vim.api.nvim_create_autocmd("BufReadPre", {
  group = group,
  callback = function(ev)
    local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(ev.buf))
    if not stat or stat.size < BIGFILE_SIZE then return end
    vim.b[ev.buf].bigfile = true
    vim.b[ev.buf].completion = false
    vim.b[ev.buf].blink_pairs = false
    vim.bo[ev.buf].undolevels = -1
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function(ev)
    if not vim.b[ev.buf].bigfile then return end
    -- Run after builtin filetype/syntax handlers; only change this buffer.
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(ev.buf) then return end
      vim.bo[ev.buf].syntax = ""
      vim.bo[ev.buf].indentexpr = ""
      pcall(vim.treesitter.stop, ev.buf)
      for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
        vim.lsp.buf_detach_client(ev.buf, client.id)
      end
    end)
    vim.notify("Big file: highlighting, completion and LSP disabled", vim.log.levels.INFO)
  end,
})

-- Clients can finish attaching after BufReadPost.
vim.api.nvim_create_autocmd("LspAttach", {
  group = group,
  callback = function(ev)
    if not vim.b[ev.buf].bigfile then return end
    local client_id = ev.data.client_id
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(ev.buf) then
        vim.lsp.buf_detach_client(ev.buf, client_id)
      end
    end)
  end,
})
