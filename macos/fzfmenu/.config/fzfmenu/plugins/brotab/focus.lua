---@diagnostic disable-next-line: undefined-global
local title = _cli.args[2]

local wf = hs.window.filter.new()

local target_windows = wf:getWindows()

for _, win in ipairs(target_windows) do
  if win:title() == title then
    win:focus()
    win:application():activate()
    break
  end
end
