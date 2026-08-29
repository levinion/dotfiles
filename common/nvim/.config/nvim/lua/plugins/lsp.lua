vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.diagnostic.config({
  update_in_insert = true,
  virtual_text = true,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

vim.lsp.inlay_hint.enable(true)

vim.keymap.set("n", "<leader>cl", function()
  vim.cmd("checkhealth vim.lsp")
end, { desc = "Lsp Info" })
vim.keymap.set("n", "<leader>cd", function()
  vim.diagnostic.open_float()
end, { desc = "Code diagnostic" })
vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch Source/Header (C/C++)" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

local diagnostic_goto = function(next, severity)
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    vim.diagnostic.jump({ count = next and 1 or -1, severity = severity })
  end
end

vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- overwrite vim.lsp.enable to info undownloaded lsp
do
  local enabled = {}
  local orig_enable = vim.lsp.enable
  vim.lsp.enable = function(name)
    if type(name) == "string" then
      enabled[name] = true
    elseif type(name) == "table" then
      for _, n in ipairs(name) do enabled[n] = true end
    end
    return orig_enable(name)
  end
  require("utils").require_all("lang")
  vim.lsp.enable = orig_enable
  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      for server in pairs(enabled) do
        local cfg = vim.lsp.config[server]
        if not cfg or not cfg.filetypes then
          local ok, lspconfig = pcall(require, "lspconfig")
          if ok and lspconfig[server] and lspconfig[server].document_config then
            cfg = lspconfig[server].document_config.default_config
          end
        end
        local fts = cfg and cfg.filetypes
        if fts and vim.list_contains(fts, ft) then
          local cmd = cfg and cfg.cmd
          if type(cmd) == "function" then
            local ok, res = pcall(cmd)
            if ok and type(res) == "table" then cmd = res else cmd = nil end
          end
          local bin = cmd and cmd[1] or server
          if type(bin) ~= "string" then bin = server end
          if vim.fn.executable(bin) == 0 then
            vim.notify(string.format("LSP '%s' not installed (%s)", server, bin), vim.log.levels.WARN)
          end
        end
      end
    end,
  })
end
