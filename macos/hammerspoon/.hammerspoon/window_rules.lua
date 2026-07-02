local wf = hs.window.filter.new()

wf:subscribe(hs.window.filter.windowCreated, function(win)
  if not win:isStandard() then return end
  if win:application():title() == "Alacritty" and win:title() == "fzfmenu" then
    win:moveToUnit({ 0.2, 0.2, 0.6, 0.6 })
  else
    win:maximize()
  end
end)
