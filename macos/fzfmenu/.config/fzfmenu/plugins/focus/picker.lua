local wf = hs.window.filter.new()
local windows = wf:getWindows()

for _, win in ipairs(windows) do
  local app = win:application():title()
  local title = win:title()

  print(string.format("%s\t%s", app, title))
end
