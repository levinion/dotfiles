local command
local mac = vim.fn.has("mac") == 1
local linux = vim.fn.has("linux") == 1

if mac then
  -- rely on hammerspoon to switch input method
  command = { "hs", "-q", "-t", "1", "-c", [[
    local english = "com.apple.keylayout.ABC"
    if hs.keycodes.currentSourceID() ~= english then
      assert(hs.keycodes.currentSourceID(english))
    end
  ]] }
elseif linux then
  command = { "fcitx5-remote", "-c" }
else
  return
end

command[1] = vim.fn.exepath(command[1])
if command[1] == "" then return end

local function report_error(result)
  if result.code == 0 then return end
  vim.schedule(function()
    vim.notify("Input source switch failed: " .. vim.trim(result.stderr or ""), vim.log.levels.WARN)
  end)
end

-- Check and switch without blocking Neovim input.
local function switch_to_english()
  if mac then
    vim.system(command, { text = true }, report_error)
  elseif linux then
    vim.system({ command[1] }, { text = true }, function(result)
      if result.code ~= 0 then
        report_error(result)
      elseif vim.trim(result.stdout) == "2" then
        vim.system(command, { text = true }, report_error)
      end
    end)
  else
    return
  end
end

vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("InputMethodAutoSwitch", { clear = true }),
  callback = switch_to_english,
})

vim.keymap.set("n", "<Esc>", function()
  switch_to_english()
  return "<Esc>"
end, { expr = true, silent = true, desc = "Switch to English" })
