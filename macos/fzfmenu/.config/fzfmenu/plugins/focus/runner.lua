---@diagnostic disable-next-line: undefined-global
local args = _cli.args[2]
local id = hs.fnutils.split(args, "\t")[3]

local wf = hs.window.filter.new():setDefaultFilter {}
local target_windows = wf:getWindows()

for _, win in ipairs(target_windows) do
  if win:id() == tonumber(id) then
    win:focus()
    win:application():activate()
    break
  end
end
