require("utils").require_all("plugins")

-- vim.pack utils

vim.keymap.set("n", "<leader>pu", function()
  vim.pack.update()
end, { desc = "Pack update" })

vim.keymap.set("n", "<leader>ps", function()
  vim.pack.update(nil, { offline = true })
end, { desc = "Pack status" })

vim.keymap.set("n", "<leader>pd", function()
  local inactive = vim.iter(vim.pack.get())
      :filter(function(x) return not x.active end)
      :map(function(x) return x.spec.name end)
      :totable()
  if #inactive == 0 then
    vim.notify("No inactive plugins", vim.log.levels.INFO)
    return
  end
  vim.pack.del(inactive)
end, { desc = "Pack delete inactive" })

vim.keymap.set("n", "<leader>pi", function()
  local packs = vim.pack.get()
  local items = {}
  for _, p in ipairs(packs) do
    table.insert(items, string.format("%s %s %s", p.spec.name, p.active and "[active]" or "[inactive]", p.spec.src))
  end
  local fzf = require("fzf-lua")
  fzf.fzf_exec(items, { prompt = "Packs> " })
end, { desc = "Pack info" })

vim.keymap.set("n", "<leader>pl", function()
  vim.cmd.edit(vim.fn.stdpath("config") .. "/nvim-pack-lock.json")
end, { desc = "Pack lock" })
