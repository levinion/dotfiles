---@diagnostic disable-next-line: lowercase-global
wf = hs.window.filter.new()


wf:subscribe(hs.window.filter.windowCreated, function(win)
  local app = win:application()

  if win:subrole() ~= "AXStandardWindow" then return end
  if win:role() ~= "AXWindow" then return end
  if win.isStandard and not win:isStandard() then return end

  if app and app:name() == "Alacritty" and win:title() == "fzfmenu" then
    win:moveToUnit({ 0.2, 0.2, 0.6, 0.6 })
    return
  end

  local f = win:frame()
  if f.w > 0 and f.h > 0 then
    local sf = win:screen():frame()
    if (f.w * f.h) / (sf.w * sf.h) < 0.15 then return end
  end

  win:maximize()
end)
