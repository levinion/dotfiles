-- reload hammerspoon config
hs.hotkey.bind({ "ctrl", "cmd", "alt", "shift" }, "r", function()
  hs.reload()
end)

-- launch iterm2
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "t", function()
  hs.execute("open -na Alacritty --args -e tmux", true)
end)

-- launch firefox
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "b", function()
  hs.execute("open -na 'Firefox Nightly'", true)
end)

-- launch yazi
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "e", function()
  hs.execute("open -na Alacritty --args -T yazi -e yazi $HOME", true)
end)

-- launch fzfmenu
hs.hotkey.bind({ "cmd" }, "space", function()
  hs.execute("open -na Alacritty --args -T fzfmenu -e fzfmenu", true)
end)

-- maximize window
hs.hotkey.bind({ "alt" }, "space", function()
  hs.window.focusedWindow():moveToUnit(hs.layout.maximized)
end)

-- move window to left
hs.hotkey.bind({ "alt" }, "left", function()
  hs.window.focusedWindow():moveToUnit(hs.layout.left50)
end)

-- move window to right
hs.hotkey.bind({ "alt" }, "right", function()
  hs.window.focusedWindow():moveToUnit(hs.layout.right50)
end)

-- move window to bottom
hs.hotkey.bind({ "alt" }, "down", function()
  hs.window.focusedWindow():moveToUnit({ 0, 0.5, 1, 0.5 })
end)

-- move window to up
hs.hotkey.bind({ "alt" }, "up", function()
  hs.window.focusedWindow():moveToUnit({ 0, 0, 1, 0.5 })
end)

-- focus left
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "h", function()
  hs.window.focusedWindow():focusWindowWest()
end)

-- focus right
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "l", function()
  hs.window.focusedWindow():focusWindowEast()
end)

-- focus down
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "j", function()
  hs.window.focusedWindow():focusWindowSouth()
end)

-- focus up
hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "k", function()
  hs.window.focusedWindow():focusWindowNorth()
end)
