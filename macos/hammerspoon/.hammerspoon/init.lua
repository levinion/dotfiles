require("app")

hs.hotkey.bind({ "ctrl", "cmd", "alt", "shift" }, "r", function()
  hs.reload()
end)
