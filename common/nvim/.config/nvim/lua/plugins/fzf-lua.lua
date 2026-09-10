vim.pack.add({
  { src = "https://github.com/ibhagwan/fzf-lua" },
})

local fzf = require("fzf-lua")

fzf.setup({
  "default",
  winopts = {
    preview = { default = "bat" },
  },
  fzf_opts = {
    ["--layout"] = "reverse",
  },
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    },
  },
})

local function pick_notifications()
  local notify = require("notify")
  local history = notify.history()
  if history and #history > 0 then
    local items = {}
    for _, n in ipairs(history) do
      local msg = n.message
      if type(msg) == "table" then msg = table.concat(msg, " ") end
      msg = tostring(msg):gsub("\n", " "):sub(1, 200)
      local title = ""
      if n.title and type(n.title) == "table" and n.title[1] then
        title = n.title[1]
      elseif type(n.title) == "string" and n.title ~= "" then
        title = n.title
      end
      local level = n.level or "INFO"
      local line = string.format("[%s] %s%s", level, title ~= "" and (title .. ": ") or "", msg)
      table.insert(items, line)
    end
    fzf.fzf_exec(items, {
      prompt = "Notifications> ",
      previewer = false,
      actions = {
        ["default"] = function(selected)
          if selected and selected[1] then
            vim.fn.setreg("+", selected[1])
            vim.notify("Copied to clipboard", vim.log.levels.INFO)
          end
        end,
      },
    })
    return
  end
  local msgs = vim.split(vim.fn.execute("messages"), "\n")
  local filtered = {}
  for _, m in ipairs(msgs) do
    if m:match("%S") then table.insert(filtered, m) end
  end
  if #filtered == 0 then
    vim.notify("No messages", vim.log.levels.INFO)
    return
  end
  fzf.fzf_exec(filtered, { prompt = "Messages> " })
end


vim.keymap.set("n", "<leader>/", function() fzf.live_grep() end, { desc = "Grep root" })
vim.keymap.set("n", "<leader><space>", function() fzf.files() end, { desc = "Search Files" })
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() fzf.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fr", function() fzf.oldfiles() end, { desc = "Recent" })
vim.keymap.set("n", "<leader>sj", function() fzf.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sm", function() fzf.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() fzf.manpages() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sk", function() fzf.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sd", function() fzf.diagnostics_document() end, { desc = "Local Diagnostics" })
vim.keymap.set("n", "<leader>sD", function() fzf.diagnostics_workspace() end, { desc = "Root Diagnostics" })
vim.keymap.set("n", "<leader>sc", function() fzf.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sC", function() fzf.colorschemes() end, { desc = "Color Schemes" })
vim.keymap.set("n", "<leader>sn", pick_notifications, { desc = "Notifications" })
vim.keymap.set("n", "<leader>sh", function() fzf.helptags() end, { desc = "Help" })
vim.keymap.set("n", "<leader>sb", function() fzf.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>sq", function() fzf.quickfix() end, { desc = "Quickfix" })
vim.keymap.set("n", "<leader>sl", function() fzf.grep_curbuf() end, { desc = "Grep current buffer" })
vim.keymap.set("n", "<leader>h", function() fzf.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "gd", function() fzf.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() fzf.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gI", function() fzf.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>cr", function() fzf.lsp_references() end, { desc = "Goto Reference" })
vim.keymap.set("n", "gt", function() fzf.lsp_typedefs() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>ss", function() fzf.lsp_document_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>sS", function() fzf.lsp_workspace_symbols() end, { desc = "LSP Symbols" })
