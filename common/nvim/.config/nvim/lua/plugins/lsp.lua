---@diagnostic disable: need-check-nil, undefined-field, assign-type-mismatch, param-type-mismatch, cast-local-type, missing-fields, duplicate-set-field
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

---@param s string
---@return string|nil
local function bin(s)
  local cfg = vim.lsp.config[s]
  local cmd = cfg and cfg.cmd
  if type(cmd) == "table" then return cmd[1] end
  if type(cmd) == "function" then
    local cap
    local o = vim.lsp.rpc.start
    ---@diagnostic disable-next-line: assign-type-mismatch, duplicate-set-field
    vim.lsp.rpc.start = function(c)
      cap = c
      return function() end
    end
    ---@diagnostic disable-next-line: missing-fields
    pcall(cmd, {}, cfg or {})
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.lsp.rpc.start = o
    return cap and cap[1]
  end
end

do
  local missing = {}
  local orig_enable = vim.lsp.enable
  vim.lsp.enable = function(name)
    local names = type(name) == "string" and { name } or name
    local to_enable = {}
    for _, srv in ipairs(names) do
      local b = bin(srv)
      if b and vim.fn.executable(b) == 0 then
        missing[srv] = true
      else
        table.insert(to_enable, srv)
      end
    end
    if #to_enable > 0 then
      return orig_enable(#to_enable == 1 and to_enable[1] or to_enable)
    end
  end

  require("utils").require_all("lang")

  vim.lsp.enable = orig_enable

  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local ft = vim.bo[args.buf].filetype
      for server in pairs(missing) do
        local cfg = vim.lsp.config[server]
        local fts = cfg and cfg.filetypes
        if fts and vim.list_contains(fts, ft) then
          local b = bin(server)
          if b then vim.notify(string.format("LSP '%s' not installed (%s)", server, b), vim.log.levels.WARN) end
        end
      end
    end,
  })
end
