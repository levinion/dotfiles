local wf = hs.window.filter.new():setDefaultFilter {}
local windows = wf:getWindows()

for _, win in ipairs(windows) do
  local app = win:application():title()
  local title = win:title()
  local id = win:id()

  print(string.format("%s\t%s\t%s", app, title, id))
end
