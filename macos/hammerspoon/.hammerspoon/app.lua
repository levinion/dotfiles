hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "t", function()
  hs.execute("open -na iTerm")
end)

hs.hotkey.bind({ "ctrl", "cmd", "alt" }, "b", function()
  hs.execute("MOZ_DISABLE_SAFE_MODE_KEY=1 open -na 'Firefox Nightly'")
end)

hs.hotkey.bind({ "cmd" }, "space", function()
  hs.osascript.applescript([[
        tell application "iTerm"
            set newWindow to (create window with profile "fzfmenu")
        end tell
    ]])
end)
